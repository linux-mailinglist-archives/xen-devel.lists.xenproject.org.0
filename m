Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E612CAC82A
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 19:31:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6eVa-0004uI-3p; Sat, 07 Sep 2019 17:28:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YTBM=XC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i6eVY-0004uD-7I
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2019 17:28:20 +0000
X-Inumbo-ID: e10a0c7a-d194-11e9-ac01-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e10a0c7a-d194-11e9-ac01-12813bfff9fa;
 Sat, 07 Sep 2019 17:28:17 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i6eVU-0004gm-OQ; Sat, 07 Sep 2019 17:28:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i6eVU-0002VF-5H; Sat, 07 Sep 2019 17:28:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i6eVU-00024R-4d; Sat, 07 Sep 2019 17:28:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141114-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:<job
 status>:broken:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job
 status>:broken:regression
 xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:host-install(4):broken:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(4):broken:regression
 xen-unstable-smoke:test-armhf-armhf-xl:host-install(4):broken:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=6fa1798b2d7066f53f310f05e86b82c713e3bc42
X-Osstest-Versions-That: xen=74791511067aaff67efbd2555a5f635246264453
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Sep 2019 17:28:16 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 141114: trouble: broken/pass
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

ZmxpZ2h0IDE0MTExNCB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTExNC8KCkZhaWx1cmVzIGFu
ZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFu
ZCBhcmUgYmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgog
dGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAg
ICAgIGJyb2tlbgogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgICAg
PGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgYnJva2VuCiB0ZXN0LWFybWhmLWFybWhmLXhsICAg
ICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCiB0ZXN0LWFtZDY0
LWFtZDY0LWxpYnZpcnQgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgYnJva2VuIFJFR1Iu
IHZzLiAxNDEwOTcKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWFtZDY0IDQg
aG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBSRUdSLiB2cy4gMTQxMDk3CiB0ZXN0LWFybWhmLWFybWhm
LXhsICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgYnJva2VuIFJFR1IuIHZzLiAx
NDEwOTcKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6
CiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAg
ICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgMTQg
c2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwoKdmVyc2lvbiB0
YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAgICAgICAgICAgICAgIDZmYTE3OThiMmQ3MDY2
ZjUzZjMxMGYwNWU4NmI4MmM3MTNlM2JjNDIKYmFzZWxpbmUgdmVyc2lvbjoKIHhlbiAgICAgICAg
ICAgICAgICAgIDc0NzkxNTExMDY3YWFmZjY3ZWZiZDI1NTVhNWY2MzUyNDYyNjQ0NTMKCkxhc3Qg
dGVzdCBvZiBiYXNpcyAgIDE0MTA5NyAgMjAxOS0wOS0wNiAxNzowMDo1NyBaICAgIDEgZGF5cwpU
ZXN0aW5nIHNhbWUgc2luY2UgICAxNDExMTQgIDIwMTktMDktMDcgMTI6MDE6MjAgWiAgICAwIGRh
eXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIg
dGVzdDoKICBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgogIFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCmpvYnM6CiBidWlsZC1hcm02NC14c20g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtaGYtYXJtaGYt
eGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogdGVz
dC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NCAgICAg
ICAgICAgICAgICAgICAgYnJva2VuICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAoKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxp
Z2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9s
b2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBh
cmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9v
c3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0
IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1v
c3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVu
Yml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFz
dGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5Cgpicm9rZW4tam9iIHRlc3Qt
YW1kNjQtYW1kNjQtbGlidmlydCBicm9rZW4KYnJva2VuLWpvYiB0ZXN0LWFtZDY0LWFtZDY0LXhs
LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NCBicm9rZW4KYnJva2VuLWpvYiB0ZXN0LWFybWhmLWFybWhm
LXhsIGJyb2tlbgpicm9rZW4tc3RlcCB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgaG9zdC1pbnN0
YWxsKDQpCmJyb2tlbi1zdGVwIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWFt
ZDY0IGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCB0ZXN0LWFybWhmLWFybWhmLXhsIGhvc3Qt
aW5zdGFsbCg0KQoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSAz
MzEgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
