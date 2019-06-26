Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36FD55E5D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 04:26:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfxa5-0001GZ-6O; Wed, 26 Jun 2019 02:22:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qGph=UZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hfxa3-0001GN-EK
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 02:22:39 +0000
X-Inumbo-ID: 40031188-97b9-11e9-831f-db90c38edfae
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40031188-97b9-11e9-831f-db90c38edfae;
 Wed, 26 Jun 2019 02:22:31 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hfxZs-0003ay-Iy; Wed, 26 Jun 2019 02:22:28 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hfxZs-0004lX-3n; Wed, 26 Jun 2019 02:22:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hfxZs-0006wZ-31; Wed, 26 Jun 2019 02:22:28 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-138419-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=fc870a6df90c3876ec348720e21e74beb8b70d92
X-Osstest-Versions-That: freebsd=5b2895d685cc9e708a1fabc6acd2f25460e43526
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2019 02:22:28 +0000
Subject: [Xen-devel] [freebsd-master test] 138419: all pass - PUSHED
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

ZmxpZ2h0IDEzODQxOSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4NDE5LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgZmM4NzBhNmRmOTBjMzg3NmVjMzQ4
NzIwZTIxZTc0YmViOGI3MGQ5MgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNWIyODk1ZDY4NWNjOWU3MDhhMWZhYmM2YWNkMmYyNTQ2MGU0MzUyNgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM4MTc0ICAyMDE5LTA2LTIxIDA5OjE5OjM1IFogICAgNCBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzODQxOSAgMjAxOS0wNi0yNCAwOToxOTozOCBaICAgIDEgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFlIDxhZUBGcmVlQlNELm9yZz4KICBhbGMgPGFsY0BGcmVlQlNELm9yZz4KICBhcmljaGFyZHNv
biA8YXJpY2hhcmRzb25ARnJlZUJTRC5vcmc+CiAgYXNvbWVycyA8YXNvbWVyc0BGcmVlQlNELm9y
Zz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZG91Z20gPGRvdWdtQEZyZWVCU0Qub3JnPgogIGR0
ZXNrZSA8ZHRlc2tlQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgog
IGlhbiA8aWFuQEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3JnPgogIGpvaGFsdW4g
PGpvaGFsdW5ARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5vcmc+CiAgbHdoc3UgPGx3
aHN1QEZyZWVCU0Qub3JnPgogIG1hdiA8bWF2QEZyZWVCU0Qub3JnPgogIHJsaWJieSA8cmxpYmJ5
QEZyZWVCU0Qub3JnPgogIHNjb3R0bCA8c2NvdHRsQEZyZWVCU0Qub3JnPgogIHNldmFuIDxzZXZh
bkBGcmVlQlNELm9yZz4KICB2YW5neXplbiA8dmFuZ3l6ZW5ARnJlZUJTRC5vcmc+Cgpqb2JzOgog
YnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQt
ZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9n
cy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRj
LiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0
ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9
bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZp
c2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdpdAogICA1
YjI4OTVkNjg1Yy4uZmM4NzBhNmRmOTAgIGZjODcwYTZkZjkwYzM4NzZlYzM0ODcyMGUyMWU3NGJl
YjhiNzBkOTIgLT4gdGVzdGVkL21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
