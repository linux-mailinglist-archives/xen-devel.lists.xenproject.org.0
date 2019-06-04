Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD833CB7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 03:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXy7z-0005A9-Hq; Tue, 04 Jun 2019 01:20:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y+b9=UD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hXy7x-00059x-N1
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 01:20:37 +0000
X-Inumbo-ID: f0874952-8666-11e9-8ff3-87c3dddb0418
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0874952-8666-11e9-8ff3-87c3dddb0418;
 Tue, 04 Jun 2019 01:20:29 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hXy7n-0004YC-CQ; Tue, 04 Jun 2019 01:20:27 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hXy7n-0007al-4j; Tue, 04 Jun 2019 01:20:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hXy7n-00042h-3x; Tue, 04 Jun 2019 01:20:27 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-137209-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=c7cdb4a80779a0451dc2c04c3d6b30769049d402
X-Osstest-Versions-That: freebsd=aab5f5a3bd55421fa6a8dbc05332a9b9fb49992c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Jun 2019 01:20:27 +0000
Subject: [Xen-devel] [freebsd-master test] 137209: regressions - trouble:
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

ZmxpZ2h0IDEzNzIwOSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3MjA5LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzY5MDEKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgYzdjZGI0YTgwNzc5YTA0NTFkYzJjMDRjM2Q2YjMwNzY5
MDQ5ZDQwMgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgYWFiNWY1YTNi
ZDU1NDIxZmE2YThkYmMwNTMzMmE5YjlmYjQ5OTkyYwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTM2
OTAxICAyMDE5LTA1LTI0IDEzOjMyOjA1IFogICAxMCBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDEzNzAwNSAgMjAxOS0wNS0yNyAwOToxOToxMiBaICAgIDcgZGF5cyAgICA0IGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDEzNzIwOSAgMjAxOS0wNi0wMyAwOToxOToxOSBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFkcmlhbiA8YWRyaWFuQEZyZWVCU0Qub3Jn
PgogIGFlIDxhZUBGcmVlQlNELm9yZz4KICBhbGMgPGFsY0BGcmVlQlNELm9yZz4KICBhbGxhbmp1
ZGUgPGFsbGFuanVkZUBGcmVlQlNELm9yZz4KICBhbmRyZXcgPGFuZHJld0BGcmVlQlNELm9yZz4K
ICBhc29tZXJzIDxhc29tZXJzQEZyZWVCU0Qub3JnPgogIGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgog
IGJjcmFuIDxiY3JhbkBGcmVlQlNELm9yZz4KICBiZHJhZ29uIDxiZHJhZ29uQEZyZWVCU0Qub3Jn
PgogIGJyIDxickBGcmVlQlNELm9yZz4KICBicm9va3MgPGJyb29rc0BGcmVlQlNELm9yZz4KICBi
eiA8YnpARnJlZUJTRC5vcmc+CiAgY2FybGF2aWxsYSA8Y2FybGF2aWxsYUBGcmVlQlNELm9yZz4K
ICBjZW0gPGNlbUBGcmVlQlNELm9yZz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZGFuZmUgPGRh
bmZlQEZyZWVCU0Qub3JnPgogIGRjaGFnaW4gPGRjaGFnaW5ARnJlZUJTRC5vcmc+CiAgZGVscGhp
aiA8ZGVscGhpakBGcmVlQlNELm9yZz4KICBkaW0gPGRpbUBGcmVlQlNELm9yZz4KICBkb3VnbSA8
ZG91Z21ARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgZXJqIDxl
cmpARnJlZUJTRC5vcmc+CiAgZ2piIDxnamJARnJlZUJTRC5vcmc+CiAgZ2xlYml1cyA8Z2xlYml1
c0BGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4KICBqY2hhbmRyYSA8amNoYW5k
cmFARnJlZUJTRC5vcmc+CiAgamhiIDxqaGJARnJlZUJTRC5vcmc+CiAgamhpYmJpdHMgPGpoaWJi
aXRzQEZyZWVCU0Qub3JnPgogIGpraW0gPGpraW1ARnJlZUJTRC5vcmc+CiAgam9oYWx1biA8am9o
YWx1bkBGcmVlQlNELm9yZz4KICBrZW4gPGtlbkBGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFu
c0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBsdXBvcmwgPGx1cG9ybEBG
cmVlQlNELm9yZz4KICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZy
ZWVCU0Qub3JnPgogIG1hdiA8bWF2QEZyZWVCU0Qub3JnPgogIG1ja3VzaWNrIDxtY2t1c2lja0BG
cmVlQlNELm9yZz4KICBtdyA8bXdARnJlZUJTRC5vcmc+CiAgbnAgPG5wQEZyZWVCU0Qub3JnPgog
IHBmZyA8cGZnQEZyZWVCU0Qub3JnPgogIHBrdWJhaiA8cGt1YmFqQEZyZWVCU0Qub3JnPgogIHJn
cmltZXMgPHJncmltZXNARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0gPHJtYWNrbGVtQEZyZWVCU0Qu
b3JnPgogIHJwb2thbGEgPHJwb2thbGFARnJlZUJTRC5vcmc+CiAgcnUgPHJ1QEZyZWVCU0Qub3Jn
PgogIHNlZiA8c2VmQEZyZWVCU0Qub3JnPgogIHNqZyA8c2pnQEZyZWVCU0Qub3JnPgogIHNvYm9t
YXggPHNvYm9tYXhARnJlZUJTRC5vcmc+CiAgdHJhc3ogPHRyYXN6QEZyZWVCU0Qub3JnPgogIHRz
b29tZSA8dHNvb21lQEZyZWVCU0Qub3JnPgogIHR1ZXhlbiA8dHVleGVuQEZyZWVCU0Qub3JnPgog
IHd1bGYgPHd1bGZARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2Fp
biAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiBidWlsZC1hbWQ2
NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAg
ICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1s
YWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9n
cy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBo
dHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0
aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1S
RUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29k
ZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3Nz
dGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3
b3VsZCBiZSAyNzMzIGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
