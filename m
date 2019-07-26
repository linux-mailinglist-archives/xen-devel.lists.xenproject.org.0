Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E69D76438
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 13:14:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqy8k-0002Ex-6j; Fri, 26 Jul 2019 11:11:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f6kF=VX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hqy8j-0002En-5m
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 11:11:57 +0000
X-Inumbo-ID: 2d7e7c66-af96-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d7e7c66-af96-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 11:11:55 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hqy8h-0001Na-7c; Fri, 26 Jul 2019 11:11:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hqy8g-0006Ig-U7; Fri, 26 Jul 2019 11:11:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hqy8g-0005rv-TW; Fri, 26 Jul 2019 11:11:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-139365-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=a7c6859ec982f94e899629e2e7985caa60e3833e
X-Osstest-Versions-That: xen=4d6298d6829fdb621d1c722b012f18ee34b66548
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Jul 2019 11:11:54 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 139365: tolerable all pass -
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

ZmxpZ2h0IDEzOTM2NSB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzOTM2NS8KCkZhaWx1cmVzIDot
LyBidXQgbm8gcmVncmVzc2lvbnMuCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBh
cmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRl
LXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhm
LXhsICAgICAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVy
IHBhc3MKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9y
dC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAg
ICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0
LWFybTY0LWFybTY0LXhsLXhzbSAgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAg
ZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAg
ICAgICAgICAgICAgICBhN2M2ODU5ZWM5ODJmOTRlODk5NjI5ZTJlNzk4NWNhYTYwZTM4MzNlCmJh
c2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICA0ZDYyOThkNjgyOWZkYjYyMWQx
YzcyMmIwMTJmMThlZTM0YjY2NTQ4CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzkzNDMgIDIwMTkt
MDctMjUgMTc6MDE6MzYgWiAgICAwIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM5MzY1ICAy
MDE5LTA3LTI2IDA5OjAwOjU1IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUg
d2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQW5kcmlpIEFuaXNvdiA8YW5kcmlp
X2FuaXNvdkBlcGFtLmNvbT4KICBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgog
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KICBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cgpqb2JzOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQt
eGwteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVz
dC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9o
b21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBh
dAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpF
eHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBp
cyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1i
bG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJu
ZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0
cy54ZW4ub3JnOi9ob21lL3hlbi9naXQveGVuLmdpdAogICA0ZDYyOThkNjgyLi5hN2M2ODU5ZWM5
ICBhN2M2ODU5ZWM5ODJmOTRlODk5NjI5ZTJlNzk4NWNhYTYwZTM4MzNlIC0+IHNtb2tlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
