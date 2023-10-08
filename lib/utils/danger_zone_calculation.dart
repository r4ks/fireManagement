import 'package:latlong2/latlong.dart';
import 'dart:math';

class DangerZoneCalculator {

double gammaMaxFunc(double sigma) {
  return pow(sigma, 1.5) * pow(495 + 0.0594 * pow(sigma, 1.5), -1).toDouble();
}

double betaOpFunc(double sigma) {
  return 3.348 * pow(sigma, -0.8189);
}

double gammaPriFunc(double sigma, double beta, double betaOp, double A) {
  return gammaMaxFunc(sigma) * pow(beta / betaOp, A) * exp(A * (1 - beta / betaOp));
}

double rhoBFunc(double w0, double delta) {
  return w0 / delta;
}

double wnFunc(double w0, double St) {
  return w0 * (1 - St);
}

double etaSFunc(double Se) {
  return 0.174 * pow(Se, -0.19);
}

double etaMFunc(double rm) {
  return 1 - 2.59 * rm + 5.11 * pow(rm, 2) - 3.52 * pow(rm, 3);
}

double phiWFunc(double C, double U, double B, double beta, double betaOp, double E) {
  return C * pow(U, B) * pow(beta / betaOp, -E);
}

double irFunc(double gammaPri, double wn, double h, double etaM, double etaS) {
  return gammaPri * wn * h * etaM * etaS;
}

double rFunc(double irValue, double xi, double phiW, double phiS, double rhoB, double Qig, double epsilon) {
  return (0.3048 * irValue * xi * (1 + phiW + phiS)) / (rhoB * Qig * epsilon);
}

Map<String,double> getEllipsis() {
  const sigma = 50.0;
  const rhoP = 32.0;
  const delta = 1.0;
  const w0 = 0.9445;
  const St = 0.0555;
  const h = 8000.0;
  const Se = 0.010;
  const Mx1 = 0.8;
  const Mfi = 0.5;
  const slopeAngle = 45.0;
  const t = 720.0;
  const CBD = 0.112;
  const windDir = 15.0;

  const EFFM = 6.0;
  const Uten = 20.0;
  const CFB = 1.0;

  final tanPhi = tan(slopeAngle * pi / 180);
  final A = 133 * pow(sigma, -0.7913);
  final beta = rhoBFunc(w0, delta) / rhoP;
  final betaOp = betaOpFunc(sigma);
  final gammaPri = gammaPriFunc(sigma, beta, betaOp, A.toDouble());
  final rhoB = rhoBFunc(w0, delta);
  final wn = wnFunc(w0, St);
  final etaS = etaSFunc(Se);
  final rm = Mfi / Mx1;
  final etaM = etaMFunc(rm);
  final xi = pow(192 + 0.2595 * sigma, -1) * exp((0.792 + 0.681 * sqrt(sigma) * (beta + 0.1)));
  final phiS = 5.275 * pow(beta, -0.3) * pow(tanPhi, 2);
  final C = 7.47 * exp(-0.133 * pow(sigma, 0.55));
  final B = 0.02526 * pow(sigma, 0.54);
  final E = 0.715 * exp(-3.59e-4 * sigma);
  final irValue = irFunc(gammaPri, wn, h, etaM, etaS);
  final U = 96.8 * pow(irValue, 1/3);
  final phiW = phiWFunc(C, U, B, beta, betaOp, E);
  final epsilon = exp(-138 / sigma);
  final Qig = 250 + 1.116 * Mfi;
  final Ra = 11.02 * pow(Uten, 0.9) * pow(CBD, 0.19) * exp(-0.17 * EFFM);

  final Z = 1 + 0.25 * t * 80;

  final R = rFunc(irValue, xi, phiW, phiS, rhoB, Qig, epsilon);
  final RH = R;
  final RB = RH * (1 - exp(1)) / (1 + exp(1));
  final DB = RB * t;
  final DH = RH * t;
  final L = DH - DB;
  final DF = Z / (2 * L);

  return <String,double>{ 'DF': DF, 'L': L/2 };
}

}