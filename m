Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EDAD7F5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Hs1-0001OU-M8; Mon, 09 Sep 2019 11:30:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1apQ=XE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i7Hs0-0001OO-BB
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:30:08 +0000
X-Inumbo-ID: 28ac5a7c-d2f5-11e9-ac0a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28ac5a7c-d2f5-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 11:30:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Hrq-0004Hu-H3; Mon, 09 Sep 2019 11:29:58 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Hrq-0006W9-7X; Mon, 09 Sep 2019 11:29:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Hrq-0001Wr-6m; Mon, 09 Sep 2019 11:29:58 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-141161-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=752098d2d559bb5765546e526b70daacbb3bfec0
X-Osstest-Versions-That: freebsd=a3dbacfc31a3c2ef7d9d4d12d4e5108f044c0701
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2019 11:29:58 +0000
Subject: [Xen-devel] [freebsd-master test] 141161: regressions - trouble:
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

ZmxpZ2h0IDE0MTE2MSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxMTYxLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDEwMDQKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgNzUyMDk4ZDJkNTU5YmI1NzY1NTQ2ZTUyNmI3MGRhYWNi
YjNiZmVjMApiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgYTNkYmFjZmMz
MWEzYzJlZjdkOWQ0ZDEyZDRlNTEwOGYwNDRjMDcwMQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQx
MDA0ICAyMDE5LTA5LTA0IDA5OjIwOjEzIFogICAgNSBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDE0MTA4NiAgMjAxOS0wOS0wNiAwOToyMTozMyBaICAgIDMgZGF5cyAgICAyIGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDE0MTE2MSAgMjAxOS0wOS0wOSAwOToxOTowNSBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFkcmlhbiA8YWRyaWFuQEZyZWVCU0Qub3Jn
PgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYXZnIDxhdmdARnJlZUJTRC5vcmc+
CiAgYmNyYW4gPGJjcmFuQEZyZWVCU0Qub3JnPgogIGJkcmV3ZXJ5IDxiZHJld2VyeUBGcmVlQlNE
Lm9yZz4KICBiciA8YnJARnJlZUJTRC5vcmc+CiAgY2VtIDxjZW1ARnJlZUJTRC5vcmc+CiAgY3kg
PGN5QEZyZWVCU0Qub3JnPgogIGRpbSA8ZGltQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3Rl
QEZyZWVCU0Qub3JnPgogIGZhYmllbnQgPGZhYmllbnRARnJlZUJTRC5vcmc+CiAgZ29uem8gPGdv
bnpvQEZyZWVCU0Qub3JnPgogIGhzZWxhc2t5IDxoc2VsYXNreUBGcmVlQlNELm9yZz4KICBpYW4g
PGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4KICBqZ2ggPGpnaEBGcmVl
QlNELm9yZz4KICBqaGliYml0cyA8amhpYmJpdHNARnJlZUJTRC5vcmc+CiAgamlsbGVzIDxqaWxs
ZXNARnJlZUJTRC5vcmc+CiAgam9oYWx1biA8am9oYWx1bkBGcmVlQlNELm9yZz4KICBrZXZhbnMg
PGtldmFuc0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBrcCA8a3BARnJl
ZUJTRC5vcmc+CiAgbWFudSA8bWFudUBGcmVlQlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9y
Zz4KICBtaG9ybmUgPG1ob3JuZUBGcmVlQlNELm9yZz4KICBtamcgPG1qZ0BGcmVlQlNELm9yZz4K
ICBwZmcgPHBmZ0BGcmVlQlNELm9yZz4KICBwaGlsaXAgPHBoaWxpcEBGcmVlQlNELm9yZz4KICBy
bWFja2xlbSA8cm1hY2tsZW1ARnJlZUJTRC5vcmc+CiAgcnJzIDxycnNARnJlZUJTRC5vcmc+CiAg
c2NvdHRsIDxzY290dGxARnJlZUJTRC5vcmc+CiAgc2NvdHRwaCA8c2NvdHRwaEBGcmVlQlNELm9y
Zz4KICBzZXZhbiA8c2V2YW5ARnJlZUJTRC5vcmc+CiAgc2pnIDxzamdARnJlZUJTRC5vcmc+CiAg
c3RldmVrIDxzdGV2ZWtARnJlZUJTRC5vcmc+CiAgdGFrYXdhdGEgPHRha2F3YXRhQEZyZWVCU0Qu
b3JnPgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9yZz4KICB0c29vbWUgPHRzb29tZUBGcmVlQlNE
Lm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQtYW1kNjQteGVu
LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCgoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwps
b2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29u
ZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFi
LnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0
cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0
ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9Ymxv
YjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAog
ICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkK
CgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDE0MDAgbGluZXMg
bG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
