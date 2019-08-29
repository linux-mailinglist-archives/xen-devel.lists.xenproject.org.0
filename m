Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46500A11B7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 08:25:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Dq3-00084s-Vn; Thu, 29 Aug 2019 06:23:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5SJG=WZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i3Dq2-00084n-Tv
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 06:23:18 +0000
X-Inumbo-ID: 7b9ab90a-ca25-11e9-ae55-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b9ab90a-ca25-11e9-ae55-12813bfff9fa;
 Thu, 29 Aug 2019 06:23:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i3Dpx-0002Ng-EU; Thu, 29 Aug 2019 06:23:13 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i3Dpx-00052p-5t; Thu, 29 Aug 2019 06:23:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i3Dpx-0002In-5I; Thu, 29 Aug 2019 06:23:13 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-140746-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=76040af020521b535a066e8df91e224b14ce284f
X-Osstest-Versions-That: freebsd=4438d71949e8a59f2ac2349a450f6965fee6c6e4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Aug 2019 06:23:13 +0000
Subject: [Xen-devel] [freebsd-master test] 140746: all pass - PUSHED
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

ZmxpZ2h0IDE0MDc0NiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQwNzQ2LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNzYwNDBhZjAyMDUyMWI1MzVhMDY2
ZThkZjkxZTIyNGIxNGNlMjg0ZgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNDQzOGQ3MTk0OWU4YTU5ZjJhYzIzNDlhNDUwZjY5NjVmZWU2YzZlNAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTQwNjYwICAyMDE5LTA4LTI2IDA5OjIwOjMwIFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDE0MDc0NiAgMjAxOS0wOC0yOCAwOToxOTo1MyBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGhy
cyA8aHJzQEZyZWVCU0Qub3JnPgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxq
aGliYml0c0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBtYW51IDxtYW51
QEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVlQlNELm9yZz4KICBtYXYgPG1hdkBGcmVl
QlNELm9yZz4KICBtamcgPG1qZ0BGcmVlQlNELm9yZz4KICBtbWVsIDxtbWVsQEZyZWVCU0Qub3Jn
PgogIG5wIDxucEBGcmVlQlNELm9yZz4KICB0cmFzeiA8dHJhc3pARnJlZUJTRC5vcmc+CiAgdHVl
eGVuIDx0dWV4ZW5ARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2Fp
biAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2
NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1s
YWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9n
cy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBo
dHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0
aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1S
RUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29k
ZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3Nz
dGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5v
cmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdpdAogICA0NDM4ZDcxOTQ5ZS4uNzYwNDBhZjAyMDUg
IDc2MDQwYWYwMjA1MjFiNTM1YTA2NmU4ZGY5MWUyMjRiMTRjZTI4NGYgLT4gdGVzdGVkL21hc3Rl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
