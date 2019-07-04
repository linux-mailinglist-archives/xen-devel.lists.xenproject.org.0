Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5975F53B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 11:12:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hixkY-0006WP-EF; Thu, 04 Jul 2019 09:09:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jf9k=VB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hixkX-0006WD-DT
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 09:09:53 +0000
X-Inumbo-ID: 79dc5828-9e3b-11e9-9d17-97fdb30cc3a9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79dc5828-9e3b-11e9-9d17-97fdb30cc3a9;
 Thu, 04 Jul 2019 09:09:49 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hixkR-0003Ua-Kq; Thu, 04 Jul 2019 09:09:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hixkR-0003s6-Bq; Thu, 04 Jul 2019 09:09:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hixkR-0004yi-Ap; Thu, 04 Jul 2019 09:09:47 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-138729-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:xen-build-freebsd:fail:regression
X-Osstest-Versions-This: freebsd=ee002f95a338d1ff367a1e3dccc6368038486ad5
X-Osstest-Versions-That: freebsd=14e63f898b16382f4577cfea211a7fb5ad7983e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jul 2019 09:09:47 +0000
Subject: [Xen-devel] [freebsd-master test] 138729: regressions - FAIL
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

ZmxpZ2h0IDEzODcyOSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4NzI5LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA3IHhlbi1idWlsZC1mcmVlYnNkICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzg1NDAKCnZl
cnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICBlZTAwMmY5
NWEzMzhkMWZmMzY3YTFlM2RjY2M2MzY4MDM4NDg2YWQ1CmJhc2VsaW5lIHZlcnNpb246CiBmcmVl
YnNkICAgICAgICAgICAgICAxNGU2M2Y4OThiMTYzODJmNDU3N2NmZWEyMTFhN2ZiNWFkNzk4M2U5
CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzg1NDAgIDIwMTktMDYtMjYgMDk6MjM6MDYgWiAgICA3
IGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAgMTM4NjA2ICAyMDE5LTA2LTI4IDA5OjE5OjI4IFog
ICAgNSBkYXlzICAgIDMgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM4NzI5ICAyMDE5
LTA3LTAzIDA5OjE5OjQ4IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hv
IHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgYWxjIDxhbGNARnJlZUJTRC5vcmc+CiAg
YXJpY2hhcmRzb24gPGFyaWNoYXJkc29uQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNA
RnJlZUJTRC5vcmc+CiAgYXZnIDxhdmdARnJlZUJTRC5vcmc+CiAgYmNyYW4gPGJjcmFuQEZyZWVC
U0Qub3JnPgogIGJyIDxickBGcmVlQlNELm9yZz4KICBjb2duZXQgPGNvZ25ldEBGcmVlQlNELm9y
Zz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZGVscGhpaiA8ZGVscGhpakBGcmVlQlNELm9yZz4K
ICBkZXMgPGRlc0BGcmVlQlNELm9yZz4KICBkaW0gPGRpbUBGcmVlQlNELm9yZz4KICBkb3VnbSA8
ZG91Z21ARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgZ2FuYm9s
ZCA8Z2FuYm9sZEBGcmVlQlNELm9yZz4KICBoc2VsYXNreSA8aHNlbGFza3lARnJlZUJTRC5vcmc+
CiAgamhiIDxqaGJARnJlZUJTRC5vcmc+CiAga2V2YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAg
a2liIDxraWJARnJlZUJTRC5vcmc+CiAgbGFuZG9uZiA8bGFuZG9uZkBGcmVlQlNELm9yZz4KICBs
b29zIDxsb29zQEZyZWVCU0Qub3JnPgogIGx1cG9ybCA8bHVwb3JsQEZyZWVCU0Qub3JnPgogIGx3
aHN1IDxsd2hzdUBGcmVlQlNELm9yZz4KICBtYW51IDxtYW51QEZyZWVCU0Qub3JnPgogIG1hcmNl
bCA8bWFyY2VsQEZyZWVCU0Qub3JnPgogIG1hcml1cyA8bWFyaXVzQEZyZWVCU0Qub3JnPgogIG1h
cmtqIDxtYXJrakBGcmVlQlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtY2t1c2lj
ayA8bWNrdXNpY2tARnJlZUJTRC5vcmc+CiAgbWhvcm5lIDxtaG9ybmVARnJlZUJTRC5vcmc+CiAg
bW0gPG1tQEZyZWVCU0Qub3JnPgogIG5wIDxucEBGcmVlQlNELm9yZz4KICBwaGlsaXAgPHBoaWxp
cEBGcmVlQlNELm9yZz4KICByZ3JpbWVzIDxyZ3JpbWVzQEZyZWVCU0Qub3JnPgogIHJsaWJieSA8
cmxpYmJ5QEZyZWVCU0Qub3JnPgogIHJtYWNrbGVtIDxybWFja2xlbUBGcmVlQlNELm9yZz4KICBz
amcgPHNqZ0BGcmVlQlNELm9yZz4KICB0aWpsIDx0aWpsQEZyZWVCU0Qub3JnPgogIHRzb29tZSA8
dHNvb21lQEZyZWVCU0Qub3JnPgogIHZtYWZmaW9uZSA8dm1hZmZpb25lQEZyZWVCU0Qub3JnPgog
IHdibG9jayA8d2Jsb2NrQEZyZWVCU0Qub3JnPgogIHplaXNpbmcgPHplaXNpbmdARnJlZUJTRC5v
cmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1m
cmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAoKCi0t
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
Tm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSAyMDYyIGxpbmVzIGxv
bmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
