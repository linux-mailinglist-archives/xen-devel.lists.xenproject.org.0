Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA610EC4
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 23:52:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLx6G-0008QZ-O4; Wed, 01 May 2019 21:49:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xAd2=TB=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hLx6F-0008QN-H6
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 21:49:11 +0000
X-Inumbo-ID: f3b63e40-6c5a-11e9-843c-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f3b63e40-6c5a-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 21:49:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hLx6D-0005PV-KA; Wed, 01 May 2019 21:49:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hLx6D-0004G3-8W; Wed, 01 May 2019 21:49:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hLx6D-0007fN-7s; Wed, 01 May 2019 21:49:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135437-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=b97801f39a3277272503fefa4ca03fea3f70fa4d
X-Osstest-Versions-That: libvirt=572c50849c649c3d7586df01a3a0069b6d1a32af
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 May 2019 21:49:09 +0000
Subject: [Xen-devel] [libvirt test] 135437: tolerable all pass - PUSHED
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

ZmxpZ2h0IDEzNTQzNyBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzU0MzcvCgpGYWlsdXJlcyA6LS8gYnV0IG5vIHJl
Z3Jlc3Npb25zLgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9j
a2luZzoKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9y
dC1jaGVjayAgICBmYWlsICBsaWtlIDEzNTQxMwogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJh
dyAxMyBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgIGxpa2UgMTM1NDEzCiB0ZXN0
LWFtZDY0LWkzODYtbGlidmlydC14c20gIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAg
ZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0ICAgICAgMTMgbWlncmF0
ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hbWQ2NC1hbWQ2
NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZl
ciBwYXNzCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQteHNtIDEzIG1pZ3JhdGUtc3VwcG9ydC1j
aGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1x
ZW11dS1kZWJpYW5odm0tYW1kNjQteHNtIDExIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayBmYWlsIG5l
dmVyIHBhc3MKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC12aGQgMTIgbWlncmF0ZS1zdXBwb3J0
LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0
LXhzbSAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0
ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQteHNtIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sg
ICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydCAgICAgMTMgbWln
cmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1h
cm02NC1saWJ2aXJ0ICAgICAxNCBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgICBu
ZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgMTIgbWlncmF0ZS1zdXBw
b3J0LWNoZWNrICAgICAgICBmYWlsIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmly
dC1xY293MiAxMyBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgbmV2ZXIgcGFzcwog
dGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAg
ICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQtcmF3IDEyIG1p
Z3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQt
aTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMTEgbWlncmF0ZS1zdXBwb3J0
LWNoZWNrIGZhaWwgbmV2ZXIgcGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGxp
YnZpcnQgICAgICAgICAgICAgIGI5NzgwMWYzOWEzMjc3MjcyNTAzZmVmYTRjYTAzZmVhM2Y3MGZh
NGQKYmFzZWxpbmUgdmVyc2lvbjoKIGxpYnZpcnQgICAgICAgICAgICAgIDU3MmM1MDg0OWM2NDlj
M2Q3NTg2ZGYwMWEzYTAwNjliNmQxYTMyYWYKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzNTQxMyAg
MjAxOS0wNC0yOSAxMTozMzoyOSBaICAgIDIgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzU0
MzcgIDIwMTktMDQtMzAgMDQ6MTk6MDcgWiAgICAxIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBl
b3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBGYWJpYW5vIEZpZMOqbmNp
byA8ZmlkZW5jaW9AcmVkaGF0LmNvbT4KICBKb2huIEZlcmxhbiA8amZlcmxhbkByZWRoYXQuY29t
PgogIE1pY2hhbCBQcml2b3puaWsgPG1wcml2b3puQHJlZGhhdC5jb20+Cgpqb2JzOgogYnVpbGQt
YW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
cm02NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFy
bTY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogYnVpbGQtYXJtaGYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJt
NjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBidWlsZC1hcm1oZi1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0
LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0
LWkzODYtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtICAgICAgICAgICAgcGFzcyAg
ICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC14c20gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC14
c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQt
YW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1h
bWQ2NC1saWJ2aXJ0LXBhaXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC1wYWlyICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJh
dyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFt
ZDY0LWxpYnZpcnQtdmhkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3Jn
CmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBj
b25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1s
YWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBv
cnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1h
c3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1i
bG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0
CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFy
eQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQv
bGlidmlydC5naXQKICAgNTcyYzUwODQ5Yy4uYjk3ODAxZjM5YSAgYjk3ODAxZjM5YTMyNzcyNzI1
MDNmZWZhNGNhMDNmZWEzZjcwZmE0ZCAtPiB4ZW4tdGVzdGVkLW1hc3RlcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
