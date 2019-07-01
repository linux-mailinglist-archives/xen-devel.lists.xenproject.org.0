Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D15C365
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 21:04:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hi1Z1-0001OI-Fp; Mon, 01 Jul 2019 19:02:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BgAe=U6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hi1Yz-0001Nw-VB
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 19:02:05 +0000
X-Inumbo-ID: b6a1e3bf-9c32-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b6a1e3bf-9c32-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 19:02:04 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hi1Yv-0003RS-Qn; Mon, 01 Jul 2019 19:02:01 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hi1Yv-0000OV-JE; Mon, 01 Jul 2019 19:02:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hi1Yv-0003fC-Ic; Mon, 01 Jul 2019 19:02:01 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-138671-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:xen-build-freebsd:fail:regression
X-Osstest-Versions-This: freebsd=99c8ab4764918fbb17a1296a1564d7ddc0d24141
X-Osstest-Versions-That: freebsd=14e63f898b16382f4577cfea211a7fb5ad7983e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 01 Jul 2019 19:02:01 +0000
Subject: [Xen-devel] [freebsd-master test] 138671: regressions - FAIL
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

ZmxpZ2h0IDEzODY3MSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4NjcxLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA3IHhlbi1idWlsZC1mcmVlYnNkICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzg1NDAKCnZl
cnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICA5OWM4YWI0
NzY0OTE4ZmJiMTdhMTI5NmExNTY0ZDdkZGMwZDI0MTQxCmJhc2VsaW5lIHZlcnNpb246CiBmcmVl
YnNkICAgICAgICAgICAgICAxNGU2M2Y4OThiMTYzODJmNDU3N2NmZWEyMTFhN2ZiNWFkNzk4M2U5
CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzg1NDAgIDIwMTktMDYtMjYgMDk6MjM6MDYgWiAgICA1
IGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAgMTM4NjA2ICAyMDE5LTA2LTI4IDA5OjE5OjI4IFog
ICAgMyBkYXlzICAgIDIgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM4NjcxICAyMDE5
LTA3LTAxIDA5OjE5OjEwIFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hv
IHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgYWxjIDxhbGNARnJlZUJTRC5vcmc+CiAg
YXJpY2hhcmRzb24gPGFyaWNoYXJkc29uQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNA
RnJlZUJTRC5vcmc+CiAgYXZnIDxhdmdARnJlZUJTRC5vcmc+CiAgYmNyYW4gPGJjcmFuQEZyZWVC
U0Qub3JnPgogIGJyIDxickBGcmVlQlNELm9yZz4KICBjb2duZXQgPGNvZ25ldEBGcmVlQlNELm9y
Zz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZGVscGhpaiA8ZGVscGhpakBGcmVlQlNELm9yZz4K
ICBkZXMgPGRlc0BGcmVlQlNELm9yZz4KICBkb3VnbSA8ZG91Z21ARnJlZUJTRC5vcmc+CiAgZW1h
c3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kgPGhzZWxhc2t5QEZyZWVCU0Qub3Jn
PgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2YW5zQEZyZWVCU0Qub3JnPgog
IGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGxvb3MgPGxvb3NARnJlZUJTRC5vcmc+CiAgbHVwb3Js
IDxsdXBvcmxARnJlZUJTRC5vcmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgogIG1hcmNl
bCA8bWFyY2VsQEZyZWVCU0Qub3JnPgogIG1hcml1cyA8bWFyaXVzQEZyZWVCU0Qub3JnPgogIG1h
cmtqIDxtYXJrakBGcmVlQlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtaG9ybmUg
PG1ob3JuZUBGcmVlQlNELm9yZz4KICBtbSA8bW1ARnJlZUJTRC5vcmc+CiAgbnAgPG5wQEZyZWVC
U0Qub3JnPgogIHJncmltZXMgPHJncmltZXNARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0gPHJtYWNr
bGVtQEZyZWVCU0Qub3JnPgogIHNqZyA8c2pnQEZyZWVCU0Qub3JnPgogIHRpamwgPHRpamxARnJl
ZUJTRC5vcmc+CiAgdHNvb21lIDx0c29vbWVARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQtYW1k
NjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9u
IG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmlt
YWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZh
aWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdl
bmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0
LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpU
ZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2
aXNpb24gbG9nOyBpdCB3b3VsZCBiZSAxMzgxIGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
