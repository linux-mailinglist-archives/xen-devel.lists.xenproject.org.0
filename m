Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA73129FDC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 10:55:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijgrl-00061G-SV; Tue, 24 Dec 2019 09:52:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fgOw=2O=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ijgrk-000618-Jc
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 09:52:36 +0000
X-Inumbo-ID: 191740ae-2633-11ea-978c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 191740ae-2633-11ea-978c-12813bfff9fa;
 Tue, 24 Dec 2019 09:52:29 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ijgrc-0003D6-Vr; Tue, 24 Dec 2019 09:52:29 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ijgrc-0006Sp-LH; Tue, 24 Dec 2019 09:52:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ijgrc-0001NW-KX; Tue, 24 Dec 2019 09:52:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-145173-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:test-arm64-arm64-libvirt-qcow2:guest-start/debian.repeat:fail:regression
 libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=546e1c112d6a0f97404c9b43ccb070ae7b6af538
X-Osstest-Versions-That: libvirt=7a7d36055ce7c161e9309c7bad7f8e61be31c5b8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Dec 2019 09:52:28 +0000
Subject: [Xen-devel] [libvirt test] 145173: regressions - FAIL
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

ZmxpZ2h0IDE0NTE3MyBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDUxNzMvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAx
NSBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDE0NTA1NAoKVGVzdHMg
d2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYXJtaGYt
YXJtaGYtbGlidmlydCAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICBs
aWtlIDE0NTA1NAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAxMyBzYXZlcmVzdG9yZS1z
dXBwb3J0LWNoZWNrICAgIGZhaWwgIGxpa2UgMTQ1MDU0CiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZp
cnQteHNtIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MK
IHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAg
ICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQgICAgICAxMyBt
aWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0
LWkzODYtbGlidmlydC14c20gIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAg
IG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1k
NjQteHNtIDExIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayBmYWlsIG5ldmVyIHBhc3MKIHRlc3QtYW1k
NjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMTEgbWlncmF0ZS1zdXBw
b3J0LWNoZWNrIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAx
MyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFy
bTY0LWFybTY0LWxpYnZpcnQteHNtIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAgZmFp
bCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydCAgICAgMTMgbWlncmF0ZS1z
dXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1s
aWJ2aXJ0ICAgICAxNCBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgICBuZXZlciBw
YXNzCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtdmhkIDEyIG1pZ3JhdGUtc3VwcG9ydC1jaGVj
ayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293
MiAxMiBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1h
cm02NC1hcm02NC1saWJ2aXJ0LXFjb3cyIDEzIHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAg
ZmFpbCBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQgICAgIDEzIG1pZ3JhdGUt
c3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtaGYtYXJtaGYt
bGlidmlydC1yYXcgMTIgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIg
cGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAg
IDU0NmUxYzExMmQ2YTBmOTc0MDRjOWI0M2NjYjA3MGFlN2I2YWY1MzgKYmFzZWxpbmUgdmVyc2lv
bjoKIGxpYnZpcnQgICAgICAgICAgICAgIDdhN2QzNjA1NWNlN2MxNjFlOTMwOWM3YmFkN2Y4ZTYx
YmUzMWM1YjgKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0NTA1NCAgMjAxOS0xMi0yMSAwNDoxODo0
NiBaICAgIDMgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxNDUxMzMgIDIwMTktMTItMjMgMDQ6
MTg6NDggWiAgICAxIGRheXMgICAgMiBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDUx
NzMgIDIwMTktMTItMjQgMDQ6MTg6NDcgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBl
b3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbmRyZXcgTWlsb3JhZG92
c2t5IDxhbmRyZXdAaW50ZXJwcmV0bWF0aC5wdz4KICBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJy
YW5nZUByZWRoYXQuY29tPgogIFlpIExpIDx5aWxpQHdpbmhvbmcuY29tPgoKam9iczoKIGJ1aWxk
LWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
YXJtNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
cm02NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWFybWhmLWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFy
bTY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmly
dC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2
NC1pMzg2LWxpYnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAgICAgICAgICAgIHBhc3Mg
ICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQt
eHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0
LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQt
YW1kNjQtbGlidmlydC1wYWlyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcGFpciAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1y
YXcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1h
bWQ2NC1saWJ2aXJ0LXZoZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywg
Y29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVw
b3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1t
YXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9
YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBh
dAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1h
cnkKCgpOb3QgcHVzaGluZy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpjb21taXQgNTQ2ZTFjMTEyZDZhMGY5NzQwNGM5YjQzY2Ni
MDcwYWU3YjZhZjUzOApBdXRob3I6IFlpIExpIDx5aWxpQHdpbmhvbmcuY29tPgpEYXRlOiAgIE1v
biBEZWMgMjMgMDk6MTU6NDAgMjAxOSArMDgwMAoKICAgIFN0b3JhZ2U6IFVzZSBlcnJubyBwYXJh
bWV0ZXIgaW4gdmlyUmVwb3J0U3lzdGVtRXJyb3IKICAgIAogICAgVXNlIGVycm5vIHBhcmFtZXRl
ciBpbiB2aXJSZXBvcnRTeXN0ZW1FcnJvci4KICAgIFJlbW92ZSBob2xkIGZ1bmN0aW9uIHJldHVy
biB2YWx1ZXMgaWYgZG9uJ3QgbmVlZC4KICAgIAogICAgUmV2aWV3ZWQtYnk6IENvbGUgUm9iaW5z
b24gPGNyb2JpbnNvQHJlZGhhdC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBZaSBMaSA8eWlsaUB3
aW5ob25nLmNvbT4KCmNvbW1pdCBhOWVhYWNjZDIyNWE4NGJmMGQyOGE0ZTNjMWRiZDMxMDBhMDIx
ZGQ3CkF1dGhvcjogWWkgTGkgPHlpbGlAd2luaG9uZy5jb20+CkRhdGU6ICAgTW9uIERlYyAyMyAw
OToxNTozOSAyMDE5ICswODAwCgogICAgc3RvcmFnZTogRml4IHZvbFN0b3JhZ2VCYWNrZW5kUkJE
UmVmcmVzaFZvbEluZm8gZnVuY3Rpb24gcmV0dXJuIGVycm9ycwogICAgCiAgICBGaXggdGhlIHJl
dHVybiB2YWx1ZSBzdGF0dXMgY29tcGFyaXNvbiBjaGVja2luZyBmb3IgY2FsbCB0bwogICAgdm9s
U3RvcmFnZUJhY2tlbmRSQkRSZWZyZXNoVm9sSW5mbyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBpZCBm
NDZkMTM3ZS4KICAgIAogICAgd2Ugb25seSBzaG91bGQgZmFpbCB3aGVuIHRoZSByZXR1cm4gaXMg
PCAwLiAtRU5PRU5ULCAtRVRJTUVET1VUIHdpbGwKICAgIGlnbm9yZSBhY2NvcmRpbmcgY29tbWl0
IGlkIGY0NmQxMzdlLgogICAgCiAgICBSZXZpZXdlZC1ieTogQ29sZSBSb2JpbnNvbiA8Y3JvYmlu
c29AcmVkaGF0LmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IFlpIExpIDx5aWxpQHdpbmhvbmcuY29t
PgoKY29tbWl0IGM4OThiZGE5Njk1M2JlYjdmZmVjMTBmODFkZmU5NWEwOWY0MzYyYTYKQXV0aG9y
OiBZaSBMaSA8eWlsaUB3aW5ob25nLmNvbT4KRGF0ZTogICBNb24gRGVjIDIzIDA5OjE1OjM4IDIw
MTkgKzA4MDAKCiAgICBTdG9yYWdlOiBVc2UgcmMgaG9sZCBpbnRlcm1lZGlhdGUgZnVuY3Rpb24g
cmV0dXJuIHZhbHVlcy4KICAgIAogICAgbW9zdCBsaWJ2aXJ0IGNvZGUgdXNlcyAnaW50IHJjJyB0
byBob2xkIGludGVybWVkaWF0ZQogICAgZnVuY3Rpb24gcmV0dXJuIHZhbHVlcy4gY29uc2lzdGVu
dCB3aXRoIHRoZSByZXN0IG9mIGxpYnZpcnQuCiAgICAKICAgIFJldmlld2VkLWJ5OiBDb2xlIFJv
Ymluc29uIDxjcm9iaW5zb0ByZWRoYXQuY29tPgogICAgU2lnbmVkLW9mZi1ieTogWWkgTGkgPHlp
bGlAd2luaG9uZy5jb20+Cgpjb21taXQgNDJiM2U1YjllNGI5MTk2NDRhZmU1NWE4MTU5OTJjMDdm
Yjc5YjlkYwpBdXRob3I6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+
CkRhdGU6ICAgVHVlIERlYyAxMCAxMDoyMzoxNCAyMDE5ICswMDAwCgogICAgcWVtdTogc3RvcmUg
dGhlIGVtdWxhdG9yIG5hbWUgaW4gdGhlIGNhcGFiaWxpdGllcyBYTUwKICAgIAogICAgV2UgZG9u
J3QgbmVlZCB0aGlzIGZvciBhbnkgZnVuY3Rpb25hbCBwdXJwb3NlLCBidXQgd2hlbiBkZWJ1Z2dp
bmcgaG9zdHMKICAgIGl0IGlzIHVzZWZ1bCB0byBrbm93IHdoYXQgYmluYXJ5IGEgZ2l2ZW4gY2Fw
YWJpbGl0aWVzIFhNTCBkb2N1bWVudCBpcwogICAgYXNzb2NpYXRlZCB3aXRoLgogICAgCiAgICBS
ZXZpZXdlZC1ieTogTWljaGFsIFByaXZvem5payA8bXByaXZvem5AcmVkaGF0LmNvbT4KICAgIFNp
Z25lZC1vZmYtYnk6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+Cgpj
b21taXQgMGZjYzc4ZDUxYmZjM2U1YzE0MThlZmNhYTg5YjdhMDkxYmE5OTQ2NQpBdXRob3I6IERh
bmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+CkRhdGU6ICAgRnJpIERlYyAy
MCAxMjoyODo1NyAyMDE5ICswMDAwCgogICAgcWVtdTogYWRkIHFlbXUgY2FwcyBjb25zdHJ1Y3Rv
ciB3aGljaCB0YWtlcyBiaW5hcnkgbmFtZQogICAgCiAgICBTaW1wbGlmeSByZXBlYXRlZCBjb2Rl
IHBhdHRlcm5zIGJ5IHByb3ZpZGluZyBhIG5ldyBjb25zdHJ1Y3RvciB0YWtpbmcKICAgIHRoZSBR
RU1VIGJpbmFyeSBuYW1lLgogICAgCiAgICBSZXZpZXdlZC1ieTogTWljaGFsIFByaXZvem5payA8
bXByaXZvem5AcmVkaGF0LmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IERhbmllbCBQLiBCZXJyYW5n
w6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+Cgpjb21taXQgMjVkYjczNzQ3MTA0OWExODNlY2E2ODE1
NTE1OWRjOWYxYjI2NzkzNQpBdXRob3I6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJl
ZGhhdC5jb20+CkRhdGU6ICAgRnJpIERlYyAyMCAxMTo1NjozOCAyMDE5ICswMDAwCgogICAgcWVt
dTogYWRkIGV4cGxpY2l0IGZsYWcgdG8gc2tpcCBxZW11IGNhcHMgaW52YWxpZGF0aW9uCiAgICAK
ICAgIEN1cnJlbnRseSBpZiB0aGUgYmluYXJ5IHBhdGggaXMgTlVMTCBpbiB0aGUgcWVtdSBjYXBh
YmlsaXRpZXMgb2JqZWN0LAogICAgY2FjaGUgaW52YWxpZGF0aW9uIGlzIHNraXBwZWQuIEEgZnV0
dXJlIHBhdGNoIHdpbGwgZW5zdXJlIHRoYXQgdGhlCiAgICBiaW5hcnkgcGF0aCBpcyBhbHdheXMg
bm9uLU5VTEwsIHNvIGEgd2F5IHRvIGV4cGxpY2l0bHkgc2tpcCBpbnZhbGlkYXRpb24KICAgIGlz
IHJlcXVpcmVkLgogICAgCiAgICBSZXZpZXdlZC1ieTogTWljaGFsIFByaXZvem5payA8bXByaXZv
em5AcmVkaGF0LmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJl
cnJhbmdlQHJlZGhhdC5jb20+Cgpjb21taXQgNjMzNzMxMTM1OGViYTMzMGQ3NTQ1MmIyNmJiY2Fh
OTlmMTYwNDgxMwpBdXRob3I6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5j
b20+CkRhdGU6ICAgV2VkIERlYyAxMSAxODowMzo1MyAyMDE5ICswMDAwCgogICAgZG9jczogZW5z
dXJlIG91dHB1dGZpbGUgaXMgZGVsZXRlZCBpZiByc3QyaHRtbC9yc3QybWFuIGZhaWwKICAgIAog
ICAgVGhpcyBhdm9pZHMgbGVhdmluZyBhIHplcm8gbGVuZ3RoIG9yIHBhcnRpYWxseSBnZW5lcmF0
ZWQgb3V0cHV0CiAgICBmaWxlIG9uIGVycm9ycy4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KCmNvbW1pdCBlZmViOWQ3MTBk
ODNkNzMwZDdlMTQ1ZTBiMThhM2I3OTE0OGY2NTI5CkF1dGhvcjogQW5kcmV3IE1pbG9yYWRvdnNr
eSA8YW5kcmV3QGludGVycHJldG1hdGgucHc+CkRhdGU6ICAgVGh1IERlYyAxOSAxODowMToyOCAy
MDE5ICswMzAwCgogICAgZG9jcy9hdXRoLmh0bWwuaW46IGZpeGVkIHR5cG9zCiAgICAKICAgIFJl
dmlld2VkLWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgogICAg
U2lnbmVkLW9mZi1ieTogQW5kcmV3IE1pbG9yYWRvdnNreSA8YW5kcmV3QGludGVycHJldG1hdGgu
cHc+Cgpjb21taXQgZGZmZjE2YTdjMjYxZjhkMjhlM2FiZTYwYTQ3MTY1Zjg0NWZhOTUyZgpBdXRo
b3I6IFlpIExpIDx5aWxpQHdpbmhvbmcuY29tPgpEYXRlOiAgIFNhdCBEZWMgMjEgMDg6MzM6MzMg
MjAxOSArMDgwMAoKICAgIHN0b3JhZ2U6IEZpeCBkYWVtb24gY3Jhc2ggb24gbG9va3VwIHN0b3Jh
Z2Vwb29sIGJ5IHRhcmdldHBhdGgKICAgIAogICAgQ2F1c2luZyBhIGNyYXNoIHdoZW4gc3RvcmFn
ZVBvb2xMb29rdXBCeVRhcmdldFBhdGggYmVhY3VzZSBvZgogICAgU29tZSB0eXBlcyBvZiBzdG9y
YWdlIHBvb2wgaGF2ZSBubyB0YXJnZXQgZWxlbWVudHMuCiAgICBVc2UgU1RSRVFfTlVMTEFCTEUg
aW5zdGVhZCBvZiBTVFJFUQogICAgQXZvaWRzIHNlZ2ZhdWx0cyB3aGVuIHVzaW5nIE5VTEwgYXJn
dW1lbnRzLgogICAgCiAgICBDb3JlIHdhcyBnZW5lcmF0ZWQgYnkgYC91c3Ivc2Jpbi9saWJ2aXJ0
ZCcuCiAgICBQcm9ncmFtIHRlcm1pbmF0ZWQgd2l0aCBzaWduYWwgMTEsIFNlZ21lbnRhdGlvbiBm
YXVsdC4KICAgIChnZGIpIGJ0CiAgICAwICAweDAwMDBmZmZmOWU5NTEzODggaW4gc3RyY21wICgp
IGZyb20gL2xpYjY0L2xpYmMuc28uNgogICAgMSAgMHgwMDAwZmZmZjkyMTAzZTljIGluIHN0b3Jh
Z2VQb29sTG9va3VwQnlUYXJnZXRQYXRoQ2FsbGJhY2sgKAogICAgICAgIG9iaj0weGZmZmY3MDA5
YWFiMCwgb3BhcXVlPTB4ZmZmZjgwMTA1OGIwKSBhdCBzdG9yYWdlL3N0b3JhZ2VfZHJpdmVyLmM6
MTY0OQogICAgMiAgMHgwMDAwZmZmZjlmMmM1MmE0IGluIHZpclN0b3JhZ2VQb29sT2JqTGlzdFNl
YXJjaENiICgKICAgICAgICBwYXlsb2FkPTB4ZmZmZjgwMTA1OGIwLCBuYW1lPTxvcHRpbWl6ZWQg
b3V0Piwgb3BhcXVlPTxvcHRpbWl6ZWQgb3V0PikKICAgICAgICBhdCBjb25mL3ZpcnN0b3JhZ2Vv
YmouYzo0NzYKICAgIDMgIDB4MDAwMGZmZmY5ZjFmMmY3YyBpbiB2aXJIYXNoU2VhcmNoIChjdGFi
bGU9MHhmZmZmODAwZjRmNjAsCiAgICAgICAgaXRlcj1pdGVyQGVudHJ5PTB4ZmZmZjlmMmM1Mjc4
IDx2aXJTdG9yYWdlUG9vbE9iakxpc3RTZWFyY2hDYj4sCiAgICAgICAgZGF0YT1kYXRhQGVudHJ5
PTB4ZmZmZjk1YWY3NDg4LCBuYW1lPW5hbWVAZW50cnk9MHgwKSBhdCB1dGlsL3Zpcmhhc2guYzo2
OTYKICAgIDQgIDB4MDAwMGZmZmY5ZjJjNjRmMCBpbiB2aXJTdG9yYWdlUG9vbE9iakxpc3RTZWFy
Y2ggKHBvb2xzPTB4ZmZmZjgwMGYyY2UwLAogICAgICAgIHNlYXJjaGVyPXNlYXJjaGVyQGVudHJ5
PTB4ZmZmZjkyMTAzZTY4IDxzdG9yYWdlUG9vbExvb2t1cEJ5VGFyZ2V0UGF0aENhbGxiYWNrPiwK
ICAgICAgICAgb3BhcXVlPTxvcHRpbWl6ZWQgb3V0PikgYXQgY29uZi92aXJzdG9yYWdlb2JqLmM6
NTA1CiAgICA1ICAweDAwMDBmZmZmOTIxMDFmNTQgaW4gc3RvcmFnZVBvb2xMb29rdXBCeVRhcmdl
dFBhdGggKGNvbm49MHhmZmZmNWMwMDA5ZjAsCiAgICBwYXRoPTB4ZmZmZjcwMDlhODUwICIvdm1z
L2ltYWdlcyIpIGF0IHN0b3JhZ2Uvc3RvcmFnZV9kcml2ZXIuYzoxNjcyCiAgICAKICAgIFJldmll
d2VkLWJ5OiBDb2xlIFJvYmluc29uIDxjcm9iaW5zb0ByZWRoYXQuY29tPgogICAgU2lnbmVkLW9m
Zi1ieTogWWkgTGkgPHlpbGlAd2luaG9uZy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
