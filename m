Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F09AC1BF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 23:00:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6LGo-0000Sa-Au; Fri, 06 Sep 2019 20:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EEw4=XB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i6LGn-0000SV-7A
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 20:55:49 +0000
X-Inumbo-ID: b3f9f6de-d0e8-11e9-abfd-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3f9f6de-d0e8-11e9-abfd-12813bfff9fa;
 Fri, 06 Sep 2019 20:55:48 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i6LGi-0003DF-Rf; Fri, 06 Sep 2019 20:55:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i6LGi-0006mP-H0; Fri, 06 Sep 2019 20:55:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i6LGi-00087B-GI; Fri, 06 Sep 2019 20:55:44 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-141086-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=3a2c285092d73635e4e1c74448bb900c984fa487
X-Osstest-Versions-That: freebsd=a3dbacfc31a3c2ef7d9d4d12d4e5108f044c0701
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Sep 2019 20:55:44 +0000
Subject: [Xen-devel] [freebsd-master test] 141086: regressions - trouble:
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

ZmxpZ2h0IDE0MTA4NiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxMDg2LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDEwMDQKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgM2EyYzI4NTA5MmQ3MzYzNWU0ZTFjNzQ0NDhiYjkwMGM5
ODRmYTQ4NwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgYTNkYmFjZmMz
MWEzYzJlZjdkOWQ0ZDEyZDRlNTEwOGYwNDRjMDcwMQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQx
MDA0ICAyMDE5LTA5LTA0IDA5OjIwOjEzIFogICAgMiBkYXlzClRlc3Rpbmcgc2FtZSBzaW5jZSAg
IDE0MTA4NiAgMjAxOS0wOS0wNiAwOToyMTozMyBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIDBtcCA8MG1wQEZy
ZWVCU0Qub3JnPgogIGFkcmlhbiA8YWRyaWFuQEZyZWVCU0Qub3JnPgogIGF2ZyA8YXZnQEZyZWVC
U0Qub3JnPgogIGJjcmFuIDxiY3JhbkBGcmVlQlNELm9yZz4KICBiZHJld2VyeSA8YmRyZXdlcnlA
RnJlZUJTRC5vcmc+CiAgYnIgPGJyQEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3Jn
PgogIGN5IDxjeUBGcmVlQlNELm9yZz4KICBlbWFzdGUgPGVtYXN0ZUBGcmVlQlNELm9yZz4KICBo
c2VsYXNreSA8aHNlbGFza3lARnJlZUJTRC5vcmc+CiAgaWFuIDxpYW5ARnJlZUJTRC5vcmc+CiAg
aW1wIDxpbXBARnJlZUJTRC5vcmc+CiAgamdoIDxqZ2hARnJlZUJTRC5vcmc+CiAgamhpYmJpdHMg
PGpoaWJiaXRzQEZyZWVCU0Qub3JnPgogIGppbGxlcyA8amlsbGVzQEZyZWVCU0Qub3JnPgogIGtl
dmFucyA8a2V2YW5zQEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGtwIDxr
cEBGcmVlQlNELm9yZz4KICBtYW51IDxtYW51QEZyZWVCU0Qub3JnPgogIG1qZyA8bWpnQEZyZWVC
U0Qub3JnPgogIHBoaWxpcCA8cGhpbGlwQEZyZWVCU0Qub3JnPgogIHJtYWNrbGVtIDxybWFja2xl
bUBGcmVlQlNELm9yZz4KICBzY290dHBoIDxzY290dHBoQEZyZWVCU0Qub3JnPgogIHNldmFuIDxz
ZXZhbkBGcmVlQlNELm9yZz4KICBzdGV2ZWsgPHN0ZXZla0BGcmVlQlNELm9yZz4KICB0cmFzeiA8
dHJhc3pARnJlZUJTRC5vcmc+CiAgdHNvb21lIDx0c29vbWVARnJlZUJTRC5vcmc+Cgpqb2JzOgog
YnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJsb2NrZWQgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQt
ZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9n
cy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRj
LiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0
ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9
bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcu
CgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSA4ODQgbGluZXMgbG9uZy4pCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
