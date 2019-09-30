Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0EFC25ED
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 20:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF03r-0007EL-2t; Mon, 30 Sep 2019 18:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gl8n=XZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iF03p-0007EG-Gb
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 18:06:13 +0000
X-Inumbo-ID: f8fba792-e3ac-11e9-96dc-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by localhost (Halon) with ESMTPS
 id f8fba792-e3ac-11e9-96dc-12813bfff9fa;
 Mon, 30 Sep 2019 18:06:06 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iF03g-0005lo-Pb; Mon, 30 Sep 2019 18:06:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iF03g-0001nv-4M; Mon, 30 Sep 2019 18:06:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iF03g-000814-3g; Mon, 30 Sep 2019 18:06:04 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-142023-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=b66d6defe2e2e9aa1b4d05ce982188479f84beff
X-Osstest-Versions-That: freebsd=14aef6dfca96006e52b8fb920bde7c612ba58b79
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Sep 2019 18:06:04 +0000
Subject: [Xen-devel] [freebsd-master test] 142023: regressions - trouble:
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

ZmxpZ2h0IDE0MjAyMyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQyMDIzLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDE1MDEKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgYjY2ZDZkZWZlMmUyZTlhYTFiNGQwNWNlOTgyMTg4NDc5
Zjg0YmVmZgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgMTRhZWY2ZGZj
YTk2MDA2ZTUyYjhmYjkyMGJkZTdjNjEyYmE1OGI3OQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQx
NTAxICAyMDE5LTA5LTIwIDA5OjE5OjUxIFogICAxMCBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDE0MTcwMSAgMjAxOS0wOS0yMyAwOToxOTo0MSBaICAgIDcgZGF5cyAgICA0IGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDE0MjAyMyAgMjAxOS0wOS0zMCAwOToxOTo1OCBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFs
bGFuanVkZSA8YWxsYW5qdWRlQEZyZWVCU0Qub3JnPgogIGFuZHJldyA8YW5kcmV3QEZyZWVCU0Qu
b3JnPgogIGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGJhcHQgPGJhcHRARnJlZUJTRC5vcmc+CiAg
Y2VtIDxjZW1ARnJlZUJTRC5vcmc+CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGRhYiA8ZGFiQEZy
ZWVCU0Qub3JnPgogIGRhaWNoaSA8ZGFpY2hpQEZyZWVCU0Qub3JnPgogIGRpbSA8ZGltQEZyZWVC
U0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGVyaiA8ZXJqQEZyZWVCU0Qu
b3JnPgogIGdhbGxhdGluIDxnYWxsYXRpbkBGcmVlQlNELm9yZz4KICBnamIgPGdqYkBGcmVlQlNE
Lm9yZz4KICBnbGViaXVzIDxnbGViaXVzQEZyZWVCU0Qub3JnPgogIGdvbnpvIDxnb256b0BGcmVl
QlNELm9yZz4KICBncmVtYm8gPGdyZW1ib0BGcmVlQlNELm9yZz4KICBocnMgPGhyc0BGcmVlQlNE
Lm9yZz4KICBoc2VsYXNreSA8aHNlbGFza3lARnJlZUJTRC5vcmc+CiAgaW1wIDxpbXBARnJlZUJT
RC5vcmc+CiAgamhiIDxqaGJARnJlZUJTRC5vcmc+CiAgamhpYmJpdHMgPGpoaWJiaXRzQEZyZWVC
U0Qub3JnPgogIGppbGxlcyA8amlsbGVzQEZyZWVCU0Qub3JnPgogIGpraW0gPGpraW1ARnJlZUJT
RC5vcmc+CiAganRsIDxqdGxARnJlZUJTRC5vcmc+CiAga2FrdHVzIDxrYWt0dXNARnJlZUJTRC5v
cmc+CiAga2FyZWxzIDxrYXJlbHNARnJlZUJTRC5vcmc+CiAga2V2YW5zIDxrZXZhbnNARnJlZUJT
RC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5vcmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3Jn
PgogIG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgog
IG1hdiA8bWF2QEZyZWVCU0Qub3JnPgogIG1ob3JuZSA8bWhvcm5lQEZyZWVCU0Qub3JnPgogIG1q
ZyA8bWpnQEZyZWVCU0Qub3JnPgogIG1tIDxtbUBGcmVlQlNELm9yZz4KICBvbGl2aWVyIDxvbGl2
aWVyQEZyZWVCU0Qub3JnPgogIFBpb3RyIFBpZXRydXN6ZXdza2kgPHBpb3RyLnBpZXRydXN6ZXdz
a2lAaW50ZWwuY29tPgogIHJheSA8cmF5QEZyZWVCU0Qub3JnPgogIHJtYWNrbGVtIDxybWFja2xl
bUBGcmVlQlNELm9yZz4KICBycnMgPHJyc0BGcmVlQlNELm9yZz4KICBzZWYgPHNlZkBGcmVlQlNE
Lm9yZz4KICB0aWpsIDx0aWpsQEZyZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9y
Zz4KICB0c29vbWUgPHRzb29tZUBGcmVlQlNELm9yZz4KICB0dWV4ZW4gPHR1ZXhlbkBGcmVlQlNE
Lm9yZz4KICB2bWFmZmlvbmUgPHZtYWZmaW9uZUBGcmVlQlNELm9yZz4KICB5dXJpcHYgPHl1cmlw
dkBGcmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIGJ1aWxkLWFtZDY0LWZyZWVic2Qg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQt
YW1kNjQteGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJs
b2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoK
TG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhl
c2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFp
bDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3Qu
Z2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBm
b3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDth
PXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDMx
MjkgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
