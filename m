Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B555CA8757
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 20:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5aNs-000197-1D; Wed, 04 Sep 2019 18:52:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AOEo=W7=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i5aNq-00018s-2i
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 18:51:58 +0000
X-Inumbo-ID: 0ed01d0e-cf45-11e9-abbe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ed01d0e-cf45-11e9-abbe-12813bfff9fa;
 Wed, 04 Sep 2019 18:51:52 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i5aNj-0006kr-FQ; Wed, 04 Sep 2019 18:51:51 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i5aNj-0005cN-52; Wed, 04 Sep 2019 18:51:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i5aNj-0005h2-4O; Wed, 04 Sep 2019 18:51:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141012-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=039e70668a12f1fccdd89058ac3e9755733d9082
X-Osstest-Versions-That: xen=a342900d4835c127c1466c5abc1323a666e8cebd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 Sep 2019 18:51:51 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 141012: regressions - FAIL
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

ZmxpZ2h0IDE0MTAxMiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTAxMi8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYW1kNjQgICAgICAgICAg
ICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQwOTgw
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVz
dC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgIDEgYnVpbGQtY2hlY2soMSkg
ICAgICAgIGJsb2NrZWQgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAxIGJ1aWxk
LWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiBidWlsZC1hbWQ2NC1saWJ2aXJ0
ICAgICAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0
ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAg
ICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgMTQgc2F2
ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1h
cm02NC14bC14c20gICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBu
ZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgIDE0IHNhdmVyZXN0b3JlLXN1
cHBvcnQtY2hlY2sgICAgZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRl
c3Rpbmc6CiB4ZW4gICAgICAgICAgICAgICAgICAwMzllNzA2NjhhMTJmMWZjY2RkODkwNThhYzNl
OTc1NTczM2Q5MDgyCmJhc2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICBhMzQy
OTAwZDQ4MzVjMTI3YzE0NjZjNWFiYzEzMjNhNjY2ZThjZWJkCgpMYXN0IHRlc3Qgb2YgYmFzaXMg
ICAxNDA5ODAgIDIwMTktMDktMDMgMTc6MDA6NDUgWiAgICAxIGRheXMKVGVzdGluZyBzYW1lIHNp
bmNlICAgMTQxMDEyICAyMDE5LTA5LTA0IDE2OjAxOjA2IFogICAgMCBkYXlzICAgIDEgYXR0ZW1w
dHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQWxleGFu
ZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CiAgQWxleGFuZHJ1IFN0ZWZhbiBJ
U0FJTEEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgoKam9iczoKIGJ1aWxkLWFybTY0LXhzbSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZhaWwgICAgCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hcm1oZi1hcm1oZi14
bCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0
LWFybTY0LWFybTY0LXhsLXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWFtZDY0ICAgICAg
ICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGln
aHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xv
Z3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFy
ZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3Qg
aW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9z
c3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0
ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpjb21taXQgMDM5ZTcwNjY4YTEyZjFmY2NkZDg5MDU4YWMzZTk3NTU3MzNkOTA4MgpBdXRob3I6
IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KRGF0ZTog
ICBXZWQgU2VwIDQgMTY6MTc6MzkgMjAxOSArMDEwMAoKICAgIHg4Ni9hbHRwMm06IEFkZCBhIG5l
dyBoeXBlcmNhbGwgdG8gZ2V0IHRoZSBhY3RpdmUgYWx0cDJtIGluZGV4CiAgICAKICAgIFRoZSBw
YXRjaCBhZGRzIGEgbmV3IGxpYiB4YyBmdW5jdGlvbiAoeGNfYWx0cDJtX2dldF92Y3B1X3AybV9p
ZHgpIHRoYXQKICAgIHVzZXMgYSBuZXcgaHZtb3AgKEhWTU9QX2FsdHAybV9nZXRfcDJtX2lkeCkg
dG8gZ2V0IHRoZSBhY3RpdmUgYWx0cDJtCiAgICBpbmRleCBmcm9tIGEgZ2l2ZW4gdmNwdS4KICAg
IAogICAgU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+CiAgICBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgoocWVtdSBjaGFuZ2VzIG5vdCBpbmNsdWRlZCkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
