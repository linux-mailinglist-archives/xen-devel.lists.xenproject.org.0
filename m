Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79868BBF6D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 02:44:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCYsU-0000dH-0X; Tue, 24 Sep 2019 00:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BDJd=XT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iCYsS-0000dB-Bh
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 00:40:24 +0000
X-Inumbo-ID: e47716c4-de63-11e9-9609-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by localhost (Halon) with ESMTPS
 id e47716c4-de63-11e9-9609-12813bfff9fa;
 Tue, 24 Sep 2019 00:40:22 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iCYsO-0000yZ-Mr; Tue, 24 Sep 2019 00:40:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iCYsO-0003EF-CC; Tue, 24 Sep 2019 00:40:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iCYsO-0003ST-BQ; Tue, 24 Sep 2019 00:40:20 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-141701-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=58ff07f147710815993ceec963c4cf81340b6383
X-Osstest-Versions-That: freebsd=14aef6dfca96006e52b8fb920bde7c612ba58b79
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Sep 2019 00:40:20 +0000
Subject: [Xen-devel] [freebsd-master test] 141701: regressions - trouble:
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

ZmxpZ2h0IDE0MTcwMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxNzAxLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDE1MDEKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgNThmZjA3ZjE0NzcxMDgxNTk5M2NlZWM5NjNjNGNmODEz
NDBiNjM4MwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgMTRhZWY2ZGZj
YTk2MDA2ZTUyYjhmYjkyMGJkZTdjNjEyYmE1OGI3OQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQx
NTAxICAyMDE5LTA5LTIwIDA5OjE5OjUxIFogICAgMyBkYXlzClRlc3Rpbmcgc2FtZSBzaW5jZSAg
IDE0MTcwMSAgMjAxOS0wOS0yMyAwOToxOTo0MSBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIDBtcCA8MG1wQEZy
ZWVCU0Qub3JnPgogIGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFsbGFuanVkZSA8YWxsYW5qdWRl
QEZyZWVCU0Qub3JnPgogIGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGJhcHQgPGJhcHRARnJlZUJT
RC5vcmc+CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGRhaWNoaSA8ZGFpY2hpQEZyZWVCU0Qub3Jn
PgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGdhbGxhdGluIDxnYWxsYXRpbkBGcmVl
QlNELm9yZz4KICBnamIgPGdqYkBGcmVlQlNELm9yZz4KICBncmVtYm8gPGdyZW1ib0BGcmVlQlNE
Lm9yZz4KICBocnMgPGhyc0BGcmVlQlNELm9yZz4KICBoc2VsYXNreSA8aHNlbGFza3lARnJlZUJT
RC5vcmc+CiAgamhpYmJpdHMgPGpoaWJiaXRzQEZyZWVCU0Qub3JnPgogIGppbGxlcyA8amlsbGVz
QEZyZWVCU0Qub3JnPgogIGthcmVscyA8a2FyZWxzQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2
YW5zQEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBG
cmVlQlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtamcgPG1qZ0BGcmVlQlNELm9y
Zz4KICBzZWYgPHNlZkBGcmVlQlNELm9yZz4KICB0c29vbWUgPHRzb29tZUBGcmVlQlNELm9yZz4K
ICB0dWV4ZW4gPHR1ZXhlbkBGcmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNk
LWFnYWluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIGJ1aWxk
LWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWlsICAgIAogYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9t
ZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQK
ICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhw
bGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMg
YXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9Ymxv
YjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVz
cyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/
cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7
IGl0IHdvdWxkIGJlIDg0OCBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
