Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A1C0E44
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 01:16:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDzQA-0001tb-Ky; Fri, 27 Sep 2019 23:13:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UfwP=XW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iDzQ9-0001tW-CT
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 23:13:05 +0000
X-Inumbo-ID: 5bbfe646-e17c-11e9-97fb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by localhost (Halon) with ESMTPS
 id 5bbfe646-e17c-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 23:13:04 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iDzQ6-0008ID-Hl; Fri, 27 Sep 2019 23:13:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iDzQ6-0007cd-6x; Fri, 27 Sep 2019 23:13:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iDzQ6-000346-6H; Fri, 27 Sep 2019 23:13:02 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-141895-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=0eeddc2571a9fe19bd0efdb9ec602c9487ceb7b5
X-Osstest-Versions-That: freebsd=14aef6dfca96006e52b8fb920bde7c612ba58b79
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Sep 2019 23:13:02 +0000
Subject: [Xen-devel] [freebsd-master test] 141895: regressions - trouble:
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

ZmxpZ2h0IDE0MTg5NSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxODk1LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDE1MDEKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgMGVlZGRjMjU3MWE5ZmUxOWJkMGVmZGI5ZWM2MDJjOTQ4
N2NlYjdiNQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgMTRhZWY2ZGZj
YTk2MDA2ZTUyYjhmYjkyMGJkZTdjNjEyYmE1OGI3OQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQx
NTAxICAyMDE5LTA5LTIwIDA5OjE5OjUxIFogICAgNyBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDE0MTcwMSAgMjAxOS0wOS0yMyAwOToxOTo0MSBaICAgIDQgZGF5cyAgICAzIGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDE0MTg5NSAgMjAxOS0wOS0yNyAwOToyMDozOCBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFs
bGFuanVkZSA8YWxsYW5qdWRlQEZyZWVCU0Qub3JnPgogIGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgog
IGJhcHQgPGJhcHRARnJlZUJTRC5vcmc+CiAgY2VtIDxjZW1ARnJlZUJTRC5vcmc+CiAgY3kgPGN5
QEZyZWVCU0Qub3JnPgogIGRhYiA8ZGFiQEZyZWVCU0Qub3JnPgogIGRhaWNoaSA8ZGFpY2hpQEZy
ZWVCU0Qub3JnPgogIGRpbSA8ZGltQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVC
U0Qub3JnPgogIGVyaiA8ZXJqQEZyZWVCU0Qub3JnPgogIGdhbGxhdGluIDxnYWxsYXRpbkBGcmVl
QlNELm9yZz4KICBnamIgPGdqYkBGcmVlQlNELm9yZz4KICBnbGViaXVzIDxnbGViaXVzQEZyZWVC
U0Qub3JnPgogIGdvbnpvIDxnb256b0BGcmVlQlNELm9yZz4KICBncmVtYm8gPGdyZW1ib0BGcmVl
QlNELm9yZz4KICBocnMgPGhyc0BGcmVlQlNELm9yZz4KICBoc2VsYXNreSA8aHNlbGFza3lARnJl
ZUJTRC5vcmc+CiAgaW1wIDxpbXBARnJlZUJTRC5vcmc+CiAgamhpYmJpdHMgPGpoaWJiaXRzQEZy
ZWVCU0Qub3JnPgogIGppbGxlcyA8amlsbGVzQEZyZWVCU0Qub3JnPgogIGpraW0gPGpraW1ARnJl
ZUJTRC5vcmc+CiAganRsIDxqdGxARnJlZUJTRC5vcmc+CiAga2FyZWxzIDxrYXJlbHNARnJlZUJT
RC5vcmc+CiAga2V2YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5v
cmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVlQlNELm9y
Zz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtaG9ybmUgPG1ob3JuZUBGcmVlQlNELm9yZz4K
ICBtamcgPG1qZ0BGcmVlQlNELm9yZz4KICBtbSA8bW1ARnJlZUJTRC5vcmc+CiAgb2xpdmllciA8
b2xpdmllckBGcmVlQlNELm9yZz4KICBQaW90ciBQaWV0cnVzemV3c2tpIDxwaW90ci5waWV0cnVz
emV3c2tpQGludGVsLmNvbT4KICBybWFja2xlbSA8cm1hY2tsZW1ARnJlZUJTRC5vcmc+CiAgcnJz
IDxycnNARnJlZUJTRC5vcmc+CiAgc2VmIDxzZWZARnJlZUJTRC5vcmc+CiAgdGlqbCA8dGlqbEBG
cmVlQlNELm9yZz4KICB0c29vbWUgPHRzb29tZUBGcmVlQlNELm9yZz4KICB0dWV4ZW4gPHR1ZXhl
bkBGcmVlQlNELm9yZz4KICB5dXJpcHYgPHl1cmlwdkBGcmVlQlNELm9yZz4KCmpvYnM6CiBidWls
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
byByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDIxODYgbGluZXMgbG9uZy4pCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
