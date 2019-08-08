Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3AC85DE3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:10:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hveOk-0002gY-Gv; Thu, 08 Aug 2019 09:07:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3ZKD=WE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hveOi-0002gJ-RA
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:07:48 +0000
X-Inumbo-ID: fc31781c-b9bb-11e9-b631-d30590ce46df
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc31781c-b9bb-11e9-b631-d30590ce46df;
 Thu, 08 Aug 2019 09:07:45 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hveOd-0002VG-Ck; Thu, 08 Aug 2019 09:07:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hveOd-00013i-2o; Thu, 08 Aug 2019 09:07:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hveOd-0006Uc-27; Thu, 08 Aug 2019 09:07:43 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139801-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=37b420014fdd0f6e1ea5aecd05f04ed0a33fa5b7
X-Osstest-Versions-That: freebsd=17a1fc80d578803ae6318e7e297fc0b5605fba29
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Aug 2019 09:07:43 +0000
Subject: [Xen-devel] [freebsd-master test] 139801: all pass - PUSHED
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

ZmxpZ2h0IDEzOTgwMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5ODAxLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMzdiNDIwMDE0ZmRkMGY2ZTFlYTVh
ZWNkMDVmMDRlZDBhMzNmYTViNwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgMTdhMWZjODBkNTc4ODAzYWU2MzE4ZTdlMjk3ZmMwYjU2MDVmYmEyOQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM5NzI5ICAyMDE5LTA4LTA1IDA5OjE5OjM0IFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzOTgwMSAgMjAxOS0wOC0wNyAwOToyMDo0NiBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYnogPGJ6QEZyZWVCU0Qub3JnPgogIGNl
bSA8Y2VtQEZyZWVCU0Qub3JnPgogIGRlbHBoaWogPGRlbHBoaWpARnJlZUJTRC5vcmc+CiAgZW1h
c3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgZ2xlYml1cyA8Z2xlYml1c0BGcmVlQlNELm9yZz4K
ICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4KICBqZWZmIDxq
ZWZmQEZyZWVCU0Qub3JnPgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGli
Yml0c0BGcmVlQlNELm9yZz4KICBqaWxsZXMgPGppbGxlc0BGcmVlQlNELm9yZz4KICBrZXZhbnMg
PGtldmFuc0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBsdXBvcmwgPGx1
cG9ybEBGcmVlQlNELm9yZz4KICBtYXJraiA8bWFya2pARnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZA
RnJlZUJTRC5vcmc+CiAgbWNrdXNpY2sgPG1ja3VzaWNrQEZyZWVCU0Qub3JnPgogIG5naWUgPG5n
aWVARnJlZUJTRC5vcmc+CiAgb3Nob2dibyA8b3Nob2dib0BGcmVlQlNELm9yZz4KICB0aGogPHRo
akBGcmVlQlNELm9yZz4KICB0c29vbWUgPHRzb29tZUBGcmVlQlNELm9yZz4KICB0dWV4ZW4gPHR1
ZXhlbkBGcmVlQlNELm9yZz4KICB2YW5neXplbiA8dmFuZ3l6ZW5ARnJlZUJTRC5vcmc+Cgpqb2Jz
OgogYnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBv
cnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUv
bG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywg
ZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBv
c3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7
aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyBy
ZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdpdAog
ICAxN2ExZmM4MGQ1Ny4uMzdiNDIwMDE0ZmQgIDM3YjQyMDAxNGZkZDBmNmUxZWE1YWVjZDA1ZjA0
ZWQwYTMzZmE1YjcgLT4gdGVzdGVkL21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
