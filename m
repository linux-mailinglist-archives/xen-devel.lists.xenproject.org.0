Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC1112F71A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:24:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inL1B-0003Mj-50; Fri, 03 Jan 2020 11:21:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Uc4=2Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1inL19-0003Ma-G3
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:21:23 +0000
X-Inumbo-ID: 2b3a542a-2e1b-11ea-a44f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b3a542a-2e1b-11ea-a44f-12813bfff9fa;
 Fri, 03 Jan 2020 11:21:21 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1inL16-0008Lz-JZ; Fri, 03 Jan 2020 11:21:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1inL16-0001a1-A9; Fri, 03 Jan 2020 11:21:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1inL16-0003gK-9R; Fri, 03 Jan 2020 11:21:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-145511-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=db5d04991133b2bdff1fe26ebe2bd1069ac8b7a4
X-Osstest-Versions-That: libvirt=1ed32989ea27589c34f8f3f4f79dde4bfb0b40bb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Jan 2020 11:21:20 +0000
Subject: [Xen-devel] [libvirt test] 145511: tolerable all pass - PUSHED
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

ZmxpZ2h0IDE0NTUxMSBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDU1MTEvCgpGYWlsdXJlcyA6LS8gYnV0IG5vIHJl
Z3Jlc3Npb25zLgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9j
a2luZzoKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9y
dC1jaGVjayAgICBmYWlsICBsaWtlIDE0NTIxMgogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJh
dyAxMyBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgIGxpa2UgMTQ1MjEyCiB0ZXN0
LWFtZDY0LWFtZDY0LWxpYnZpcnQteHNtIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAg
ZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgMTMgbWlncmF0
ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hbWQ2NC1pMzg2
LWxpYnZpcnQgICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZl
ciBwYXNzCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC14c20gIDEzIG1pZ3JhdGUtc3VwcG9ydC1j
aGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXFl
bXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMTEgbWlncmF0ZS1zdXBwb3J0LWNoZWNrIGZhaWwgbmV2
ZXIgcGFzcwogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14
c20gMTEgbWlncmF0ZS1zdXBwb3J0LWNoZWNrIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1h
cm02NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBu
ZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQgICAgIDE0IHNhdmVyZXN0b3JlLXN1
cHBvcnQtY2hlY2sgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmly
dC14c20gMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwog
dGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAxNCBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNr
ICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtdmhkIDEyIG1p
Z3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQt
YXJtNjQtbGlidmlydC1xY293MiAxMiBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwg
bmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXFjb3cyIDEzIHNhdmVyZXN0b3Jl
LXN1cHBvcnQtY2hlY2sgICAgZmFpbCBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZp
cnQgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MK
IHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgMTIgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAg
ICAgICBmYWlsICAgbmV2ZXIgcGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGxp
YnZpcnQgICAgICAgICAgICAgIGRiNWQwNDk5MTEzM2IyYmRmZjFmZTI2ZWJlMmJkMTA2OWFjOGI3
YTQKYmFzZWxpbmUgdmVyc2lvbjoKIGxpYnZpcnQgICAgICAgICAgICAgIDFlZDMyOTg5ZWEyNzU4
OWMzNGY4ZjNmNGY3OWRkZTRiZmIwYjQwYmIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0NTIxMiAg
MjAxOS0xMi0yNSAwNDoyNDowMSBaICAgIDkgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDU1
MTEgIDIwMjAtMDEtMDMgMDQ6MTg6NDQgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBl
b3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBEYW5pZWwgUC4gQmVycmFu
Z8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgogIErDoW4gVG9ta28gPGp0b21rb0ByZWRoYXQuY29t
PgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYXJtNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
YW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmLWxpYnZpcnQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
bWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1k
NjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtICAgICAgICAgICBwYXNz
ICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAg
ICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQteHNtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmly
dC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2
NC1pMzg2LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0
LWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1wYWlyICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcGFpciAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQt
cWNvdzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtaGYt
YXJtaGYtbGlidmlydC1yYXcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dz
L2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0
dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRp
b24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJF
QURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2Rl
IGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0
ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9y
ZzovaG9tZS94ZW4vZ2l0L2xpYnZpcnQuZ2l0CiAgIDFlZDMyOTg5ZWEuLmRiNWQwNDk5MTEgIGRi
NWQwNDk5MTEzM2IyYmRmZjFmZTI2ZWJlMmJkMTA2OWFjOGI3YTQgLT4geGVuLXRlc3RlZC1tYXN0
ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
