Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA542DCB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 19:54:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb7PT-0000f3-9t; Wed, 12 Jun 2019 17:51:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y/WA=UL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hb7PR-0000er-Rr
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 17:51:41 +0000
X-Inumbo-ID: b9a1dc6a-8d3a-11e9-a219-0783a8486465
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9a1dc6a-8d3a-11e9-a219-0783a8486465;
 Wed, 12 Jun 2019 17:51:37 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hb7PN-000221-3t; Wed, 12 Jun 2019 17:51:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hb7PM-00050x-Qm; Wed, 12 Jun 2019 17:51:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hb7PM-0003HT-QB; Wed, 12 Jun 2019 17:51:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-137676-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=63dc4209d2420f68ef5783f8405ee7884072fcc0
X-Osstest-Versions-That: xen=07513e15e6e7e5163bf4f59c747825cce748531c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Jun 2019 17:51:36 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 137676: tolerable all pass -
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

ZmxpZ2h0IDEzNzY3NiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNzY3Ni8KCkZhaWx1cmVzIDot
LyBidXQgbm8gcmVncmVzc2lvbnMuCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBh
cmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRl
LXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0
LXhsLXhzbSAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVy
IHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9y
dC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAg
ICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0
LWFybWhmLWFybWhmLXhsICAgICAgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAg
ZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAg
ICAgICAgICAgICAgICA2M2RjNDIwOWQyNDIwZjY4ZWY1NzgzZjg0MDVlZTc4ODQwNzJmY2MwCmJh
c2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICAwNzUxM2UxNWU2ZTdlNTE2M2Jm
NGY1OWM3NDc4MjVjY2U3NDg1MzFjCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzc2NzUgIDIwMTkt
MDYtMTIgMTI6MDA6NDAgWiAgICAwIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM3Njc2ICAy
MDE5LTA2LTEyIDE1OjAxOjAxIFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUg
d2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAg
UHUgV2VuIDxwdXdlbkBoeWdvbi5jbj4KCmpvYnM6CiBidWlsZC1hcm02NC14c20gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hcm02NC1h
cm02NC14bC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NCAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9z
c3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdl
czogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxh
YmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xv
Z3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVy
YWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0Lmdp
dDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0
IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4
ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC94ZW4uZ2l0CiAgIDA3NTEzZTE1ZTYuLjYzZGM0
MjA5ZDIgIDYzZGM0MjA5ZDI0MjBmNjhlZjU3ODNmODQwNWVlNzg4NDA3MmZjYzAgLT4gc21va2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
