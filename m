Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C750EF9C71
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 22:44:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUduE-0002jN-4E; Tue, 12 Nov 2019 21:40:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EfQ6=ZE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iUduC-0002jI-B4
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 21:40:56 +0000
X-Inumbo-ID: 1a2e4a28-0595-11ea-a220-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a2e4a28-0595-11ea-a220-12813bfff9fa;
 Tue, 12 Nov 2019 21:40:53 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iUdu9-0005ZC-3m; Tue, 12 Nov 2019 21:40:53 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iUdu8-0005jT-Mv; Tue, 12 Nov 2019 21:40:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iUdu8-00081g-ML; Tue, 12 Nov 2019 21:40:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-144057-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=8c4330818f6ee70cbf7428a40a28a73df1272d10
X-Osstest-Versions-That: xen=aaef3d904bbbde1fcf9c07943878bd2aa64cc2bc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Nov 2019 21:40:52 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 144057: tolerable all pass -
 PUSHED
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

ZmxpZ2h0IDE0NDA1NyB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDA1Ny8KCkZhaWx1cmVzIDot
LyBidXQgbm8gcmVncmVzc2lvbnMuCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBh
cmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRl
LXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0
LXhsLXhzbSAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVy
IHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9y
dC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAg
ICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0
LWFybWhmLWFybWhmLXhsICAgICAgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAg
ZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAg
ICAgICAgICAgICAgICA4YzQzMzA4MThmNmVlNzBjYmY3NDI4YTQwYTI4YTczZGYxMjcyZDEwCmJh
c2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICBhYWVmM2Q5MDRiYmJkZTFmY2Y5
YzA3OTQzODc4YmQyYWE2NGNjMmJjCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxNDQwNTMgIDIwMTkt
MTEtMTIgMTU6MDE6MTcgWiAgICAwIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTQ0MDU3ICAy
MDE5LTExLTEyIDE4OjAwOjQ0IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUg
d2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KICBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KICBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAZ21haWwuY29tPgogIERh
cmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CiAgR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPgogIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFy
ZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KICBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CiAgV2VpIExpdSA8d2xAeGVuLm9yZz4KCmpvYnM6CiBidWlsZC1hcm02
NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtaGYt
YXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2
NCAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAg
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
ZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC94ZW4uZ2l0CiAgIGFh
ZWYzZDkwNGIuLjhjNDMzMDgxOGYgIDhjNDMzMDgxOGY2ZWU3MGNiZjc0MjhhNDBhMjhhNzNkZjEy
NzJkMTAgLT4gc21va2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
