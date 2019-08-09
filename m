Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E6886CA
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 01:05:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwDtK-0007mI-Af; Fri, 09 Aug 2019 23:01:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eKLs=WF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hwDtI-0007m6-Q8
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 23:01:44 +0000
X-Inumbo-ID: a7c42792-baf9-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7c42792-baf9-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 23:01:43 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hwDtF-0007yE-0j; Fri, 09 Aug 2019 23:01:41 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hwDtE-0004HX-Ny; Fri, 09 Aug 2019 23:01:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hwDtE-00029h-NJ; Fri, 09 Aug 2019 23:01:40 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139861-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=d3d0bd153cf3e76effd2e9e8c66a847d1c5defe3
X-Osstest-Versions-That: freebsd=37b420014fdd0f6e1ea5aecd05f04ed0a33fa5b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Aug 2019 23:01:40 +0000
Subject: [Xen-devel] [freebsd-master test] 139861: all pass - PUSHED
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

ZmxpZ2h0IDEzOTg2MSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5ODYxLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgZDNkMGJkMTUzY2YzZTc2ZWZmZDJl
OWU4YzY2YTg0N2QxYzVkZWZlMwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgMzdiNDIwMDE0ZmRkMGY2ZTFlYTVhZWNkMDVmMDRlZDBhMzNmYTViNwoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM5ODAxICAyMDE5LTA4LTA3IDA5OjIwOjQ2IFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzOTg2MSAgMjAxOS0wOC0wOSAwOToyMDowMiBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFlIDxhZUBGcmVlQlNELm9yZz4KICBhbGMgPGFsY0BGcmVlQlNELm9yZz4KICBhc29tZXJzIDxh
c29tZXJzQEZyZWVCU0Qub3JnPgogIGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGJ6IDxiekBGcmVl
QlNELm9yZz4KICBjZW0gPGNlbUBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVC
U0Qub3JnPgogIGRpbSA8ZGltQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qu
b3JnPgogIGdsZWJpdXMgPGdsZWJpdXNARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kgPGhzZWxhc2t5
QEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0
c0BGcmVlQlNELm9yZz4KICBqdGwgPGp0bEBGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNE
Lm9yZz4KICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAgbWFudSA8bWFudUBGcmVlQlNELm9y
Zz4KICBtYXJraiA8bWFya2pARnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAg
bWNrdXNpY2sgPG1ja3VzaWNrQEZyZWVCU0Qub3JnPgogIG13IDxtd0BGcmVlQlNELm9yZz4KICBv
c2hvZ2JvIDxvc2hvZ2JvQEZyZWVCU0Qub3JnPgogIHJtYWNrbGVtIDxybWFja2xlbUBGcmVlQlNE
Lm9yZz4KICB0aGogPHRoakBGcmVlQlNELm9yZz4KICB0cmFzeiA8dHJhc3pARnJlZUJTRC5vcmc+
CiAgdHNvb21lIDx0c29vbWVARnJlZUJTRC5vcmc+CiAgdHVleGVuIDx0dWV4ZW5ARnJlZUJTRC5v
cmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1m
cmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9n
czogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZp
ZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54
ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMs
IGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVy
CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7
Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoK
UHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVl
YnNkLmdpdAogICAzN2I0MjAwMTRmZC4uZDNkMGJkMTUzY2YgIGQzZDBiZDE1M2NmM2U3NmVmZmQy
ZTllOGM2NmE4NDdkMWM1ZGVmZTMgLT4gdGVzdGVkL21hc3RlcgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
