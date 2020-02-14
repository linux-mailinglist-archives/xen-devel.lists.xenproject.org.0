Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB515EB03
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 18:18:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2eYc-0000ZE-6S; Fri, 14 Feb 2020 17:15:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=syXm=4C=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j2eYa-0000Z8-FD
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 17:15:12 +0000
X-Inumbo-ID: 8bdfb2c2-4f4d-11ea-bc8e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bdfb2c2-4f4d-11ea-bc8e-bc764e2007e4;
 Fri, 14 Feb 2020 17:15:06 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j2eYU-0005fh-3v; Fri, 14 Feb 2020 17:15:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j2eYT-000056-Sq; Fri, 14 Feb 2020 17:15:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j2eYT-0005cF-R4; Fri, 14 Feb 2020 17:15:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-147052-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=ad1d3db985249c64d65d8f73a4c49e2204ddf4e1
X-Osstest-Versions-That: xen=6c47c37b9b40d6fe40bce8c8fd39135f6d549c8c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Feb 2020 17:15:05 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 147052: tolerable all pass -
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

ZmxpZ2h0IDE0NzA1MiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NzA1Mi8KCkZhaWx1cmVzIDot
LyBidXQgbm8gcmVncmVzc2lvbnMuCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBh
cmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRl
LXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0
LXhsLXhzbSAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVy
IHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9y
dC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAg
ICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0
LWFybWhmLWFybWhmLXhsICAgICAgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAg
ZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAg
ICAgICAgICAgICAgICBhZDFkM2RiOTg1MjQ5YzY0ZDY1ZDhmNzNhNGM0OWUyMjA0ZGRmNGUxCmJh
c2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICA2YzQ3YzM3YjliNDBkNmZlNDBi
Y2U4YzhmZDM5MTM1ZjZkNTQ5YzhjCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxNDY4ODIgIDIwMjAt
MDItMTEgMTY6MDA6NTQgWiAgICAzIGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAgMTQ2ODkzICAy
MDIwLTAyLTExIDIwOjAxOjAyIFogICAgMiBkYXlzICAgMjggYXR0ZW1wdHMKVGVzdGluZyBzYW1l
IHNpbmNlICAgMTQ3MDUyICAyMDIwLTAyLTE0IDE0OjAwOjQzIFogICAgMCBkYXlzICAgIDEgYXR0
ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KICBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KICBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgogIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CiAg
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CiAgV2VpIExpdSA8d2xAeGVu
Lm9yZz4KCmpvYnM6CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0
LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NCAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRl
c3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVu
cHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFn
ZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8v
bG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9m
IHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUu
ZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0
ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4g
YmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5n
aXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hv
bWUveGVuL2dpdC94ZW4uZ2l0CiAgIDZjNDdjMzdiOWIuLmFkMWQzZGI5ODUgIGFkMWQzZGI5ODUy
NDljNjRkNjVkOGY3M2E0YzQ5ZTIyMDRkZGY0ZTEgLT4gc21va2UKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
