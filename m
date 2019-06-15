Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9B471F2
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2019 21:43:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcEWS-0002mV-Gl; Sat, 15 Jun 2019 19:39:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0yEQ=UO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hcEWR-0002mL-0B
 for xen-devel@lists.xenproject.org; Sat, 15 Jun 2019 19:39:31 +0000
X-Inumbo-ID: 4a745929-8fa5-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4a745929-8fa5-11e9-8980-bc764e045a96;
 Sat, 15 Jun 2019 19:39:29 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hcEWN-0004Vj-Nu; Sat, 15 Jun 2019 19:39:27 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hcEWN-0008Kx-Dk; Sat, 15 Jun 2019 19:39:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hcEWN-0003JV-Cg; Sat, 15 Jun 2019 19:39:27 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-137723-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=4fd6fe044c7407d68435d36c51e2413ba39d6a3a
X-Osstest-Versions-That: freebsd=1f3b25e11df9b37a3d833be52de6c9c83d29a644
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Jun 2019 19:39:27 +0000
Subject: [Xen-devel] [freebsd-master test] 137723: all pass - PUSHED
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

ZmxpZ2h0IDEzNzcyMyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3NzIzLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNGZkNmZlMDQ0Yzc0MDdkNjg0MzVk
MzZjNTFlMjQxM2JhMzlkNmEzYQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgMWYzYjI1ZTExZGY5YjM3YTNkODMzYmU1MmRlNmM5YzgzZDI5YTY0NAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM3NjczICAyMDE5LTA2LTEyIDA5OjE5OjAzIFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNzcyMyAgMjAxOS0wNi0xNCAwOToxOTowNSBaICAgIDEgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAg
YmRyYWdvbiA8YmRyYWdvbkBGcmVlQlNELm9yZz4KICBiZHJld2VyeSA8YmRyZXdlcnlARnJlZUJT
RC5vcmc+CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGRpbSA8ZGltQEZyZWVCU0Qub3JnPgogIGRv
dWdtIDxkb3VnbUBGcmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGlt
cEBGcmVlQlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBqdGwgPGp0bEBGcmVlQlNE
Lm9yZz4KICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAgbWFudSA8bWFudUBGcmVlQlNELm9y
Zz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtbSA8bW1ARnJlZUJTRC5vcmc+CiAgb3Nob2di
byA8b3Nob2dib0BGcmVlQlNELm9yZz4KICBzaHVyZCA8c2h1cmRARnJlZUJTRC5vcmc+CiAgdm1h
ZmZpb25lIDx2bWFmZmlvbmVARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJz
ZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3Qu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hv
bWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0
CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4
cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlz
IGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJs
b2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5l
c3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
P3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRz
Lnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdpdAogICAxZjNiMjVlMTFkZi4uNGZkNmZl
MDQ0YzcgIDRmZDZmZTA0NGM3NDA3ZDY4NDM1ZDM2YzUxZTI0MTNiYTM5ZDZhM2EgLT4gdGVzdGVk
L21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
