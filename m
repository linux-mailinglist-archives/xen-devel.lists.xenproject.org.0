Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C24DEE80
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 15:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMY6j-0005Hp-IT; Mon, 21 Oct 2019 13:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ixHt=YO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iMY6h-0005Hk-SN
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 13:52:23 +0000
X-Inumbo-ID: fe88008a-f409-11e9-beca-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe88008a-f409-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 13:52:17 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iMY6Y-0008QZ-Qm; Mon, 21 Oct 2019 13:52:14 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iMY6Y-00073P-6X; Mon, 21 Oct 2019 13:52:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iMY6Y-0007QM-5v; Mon, 21 Oct 2019 13:52:14 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-143001-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=691baa0294c3f76b957f9e6a3ffe0c9c954263a7
X-Osstest-Versions-That: freebsd=14aef6dfca96006e52b8fb920bde7c612ba58b79
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 21 Oct 2019 13:52:14 +0000
Subject: [Xen-devel] [freebsd-master test] 143001: regressions - trouble:
 blocked/fail
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZmxpZ2h0IDE0MzAwMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQzMDAxLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDE1MDEKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgNjkxYmFhMDI5NGMzZjc2Yjk1N2Y5ZTZhM2ZmZTBjOWM5
NTQyNjNhNwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgMTRhZWY2ZGZj
YTk2MDA2ZTUyYjhmYjkyMGJkZTdjNjEyYmE1OGI3OQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQx
NTAxICAyMDE5LTA5LTIwIDA5OjE5OjUxIFogICAzMSBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDE0MTcwMSAgMjAxOS0wOS0yMyAwOToxOTo0MSBaICAgMjggZGF5cyAgIDEyIGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDE0MzAwMSAgMjAxOS0xMC0yMSAwOToyMDoxNSBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFlIDxhZUBGcmVlQlNELm9yZz4KICBhbGMg
PGFsY0BGcmVlQlNELm9yZz4KICBBbGVrIFBpbmNodWsgPGFwaW5jaHVrQGRhdHRvLmNvbT4KICBh
bGxhbmp1ZGUgPGFsbGFuanVkZUBGcmVlQlNELm9yZz4KICBhbWJyaXNrbyA8YW1icmlza29ARnJl
ZUJTRC5vcmc+CiAgYW5kcmV3IDxhbmRyZXdARnJlZUJTRC5vcmc+CiAgYXNvbWVycyA8YXNvbWVy
c0BGcmVlQlNELm9yZz4KICBhdmcgPGF2Z0BGcmVlQlNELm9yZz4KICBiYXB0IDxiYXB0QEZyZWVC
U0Qub3JnPgogIGJkcmFnb24gPGJkcmFnb25ARnJlZUJTRC5vcmc+CiAgYmRyZXdlcnkgPGJkcmV3
ZXJ5QEZyZWVCU0Qub3JnPgogIGJyIDxickBGcmVlQlNELm9yZz4KICBicm9va3MgPGJyb29rc0BG
cmVlQlNELm9yZz4KICBicnVlZmZlciA8YnJ1ZWZmZXJARnJlZUJTRC5vcmc+CiAgYnogPGJ6QEZy
ZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGNocyA8Y2hzQEZyZWVCU0Qub3Jn
PgogIGNvZ25ldCA8Y29nbmV0QEZyZWVCU0Qub3JnPgogIGNwZXJjaXZhIDxjcGVyY2l2YUBGcmVl
QlNELm9yZz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZGFiIDxkYWJARnJlZUJTRC5vcmc+CiAg
ZGFpY2hpIDxkYWljaGlARnJlZUJTRC5vcmc+CiAgZGNoYWdpbiA8ZGNoYWdpbkBGcmVlQlNELm9y
Zz4KICBkaW0gPGRpbUBGcmVlQlNELm9yZz4KICBkb3VnbSA8ZG91Z21ARnJlZUJTRC5vcmc+CiAg
ZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgZXJqIDxlcmpARnJlZUJTRC5vcmc+CiAgZXVn
ZW4gPGV1Z2VuQEZyZWVCU0Qub3JnPgogIGdhbGxhdGluIDxnYWxsYXRpbkBGcmVlQlNELm9yZz4K
ICBnamIgPGdqYkBGcmVlQlNELm9yZz4KICBnbGViaXVzIDxnbGViaXVzQEZyZWVCU0Qub3JnPgog
IGdvbnpvIDxnb256b0BGcmVlQlNELm9yZz4KICBncmVtYm8gPGdyZW1ib0BGcmVlQlNELm9yZz4K
ICBocnMgPGhyc0BGcmVlQlNELm9yZz4KICBoc2VsYXNreSA8aHNlbGFza3lARnJlZUJTRC5vcmc+
CiAgaWFuIDxpYW5ARnJlZUJTRC5vcmc+CiAgaW1wIDxpbXBARnJlZUJTRC5vcmc+CiAgSmFjb2Ig
S2VsbGVyIDxqYWNvYi5lLmtlbGxlckBpbnRlbC5jb20+CiAgamVmZiA8amVmZkBGcmVlQlNELm9y
Zz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBqaGliYml0cyA8amhpYmJpdHNARnJlZUJTRC5v
cmc+CiAgamlsbGVzIDxqaWxsZXNARnJlZUJTRC5vcmc+CiAgamtpbSA8amtpbUBGcmVlQlNELm9y
Zz4KICBqbGggPGpsaEBGcmVlQlNELm9yZz4KICBqbWcgPGptZ0BGcmVlQlNELm9yZz4KICBqdGwg
PGp0bEBGcmVlQlNELm9yZz4KICBrYWt0dXMgPGtha3R1c0BGcmVlQlNELm9yZz4KICBrYW4gPGth
bkBGcmVlQlNELm9yZz4KICBrYXJlbHMgPGthcmVsc0BGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtl
dmFuc0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBrcCA8a3BARnJlZUJT
RC5vcmc+CiAgbHN0ZXdhcnQgPGxzdGV3YXJ0QEZyZWVCU0Qub3JnPgogIGx1cG9ybCA8bHVwb3Js
QEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBGcmVlQlNELm9yZz4KICBtYW51IDxtYW51QEZy
ZWVCU0Qub3JnPgogIG1hcml1cyA8bWFyaXVzQEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBG
cmVlQlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtY2t1c2ljayA8bWNrdXNpY2tA
RnJlZUJTRC5vcmc+CiAgbWhvcm5lIDxtaG9ybmVARnJlZUJTRC5vcmc+CiAgbWpnIDxtamdARnJl
ZUJTRC5vcmc+CiAgbW0gPG1tQEZyZWVCU0Qub3JnPgogIG1tYWN5IDxtbWFjeUBGcmVlQlNELm9y
Zz4KICBtbWVsIDxtbWVsQEZyZWVCU0Qub3JnPgogIG5wIDxucEBGcmVlQlNELm9yZz4KICBvbGl2
aWVyIDxvbGl2aWVyQEZyZWVCU0Qub3JnPgogIG9zaG9nYm8gPG9zaG9nYm9ARnJlZUJTRC5vcmc+
CiAgcGhpbGlwIDxwaGlsaXBARnJlZUJTRC5vcmc+CiAgcGhrIDxwaGtARnJlZUJTRC5vcmc+CiAg
UGlvdHIgUGlldHJ1c3pld3NraSA8cGlvdHIucGlldHJ1c3pld3NraUBpbnRlbC5jb20+CiAgcmF5
IDxyYXlARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0gPHJtYWNrbGVtQEZyZWVCU0Qub3JnPgogIHJv
eWdlciA8cm95Z2VyQEZyZWVCU0Qub3JnPgogIHJycyA8cnJzQEZyZWVCU0Qub3JnPgogIHJzdG9u
ZSA8cnN0b25lQEZyZWVCU0Qub3JnPgogIHNhbW0gPHNhbW1ARnJlZUJTRC5vcmc+CiAgc2Nod2Vp
a2ggPHNjaHdlaWtoQEZyZWVCU0Qub3JnPgogIHNjb3R0bCA8c2NvdHRsQEZyZWVCU0Qub3JnPgog
IHNlZiA8c2VmQEZyZWVCU0Qub3JnPgogIHNqZyA8c2pnQEZyZWVCU0Qub3JnPgogIHRpamwgPHRp
amxARnJlZUJTRC5vcmc+CiAgVG9tIENhcHV0aSA8dGNhcHV0aUBkYXR0by5jb20+CiAgdHJhc3og
PHRyYXN6QEZyZWVCU0Qub3JnPgogIHRzb29tZSA8dHNvb21lQEZyZWVCU0Qub3JnPgogIHR1ZXhl
biA8dHVleGVuQEZyZWVCU0Qub3JnPgogIHZhbmd5emVuIDx2YW5neXplbkBGcmVlQlNELm9yZz4K
ICB2bWFmZmlvbmUgPHZtYWZmaW9uZUBGcmVlQlNELm9yZz4KICB5dXJpcHYgPHl1cmlwdkBGcmVl
QlNELm9yZz4KICBaYWNoIFZhcmdhcyA8enZhcmdhc0B4ZXMtaW5jLmNvbT4KCmpvYnM6CiBidWls
ZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YmxvY2tlZCAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGln
aHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xv
Z3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFy
ZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3Qg
aW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9z
c3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0
ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihO
byByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDExNTU2IGxpbmVzIGxvbmcuKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
