Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C42664C9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 05:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlloS-0007yN-Fz; Fri, 12 Jul 2019 03:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sIXk=VJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hlloQ-0007yE-Bj
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 03:01:30 +0000
X-Inumbo-ID: 55b718ea-a451-11e9-b567-f375cd90b863
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55b718ea-a451-11e9-b567-f375cd90b863;
 Fri, 12 Jul 2019 03:01:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hlloK-0008SY-Ho; Fri, 12 Jul 2019 03:01:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hlloK-00037m-7l; Fri, 12 Jul 2019 03:01:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hlloK-00020B-6Y; Fri, 12 Jul 2019 03:01:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-138895-mainreport@xen.org>
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
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=4cc5679e9121be04bab4fc9b91f4ff353198d76b
X-Osstest-Versions-That: libvirt=2a5bc136393863689bb8f54cb14342d3fe17e227
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jul 2019 03:01:24 +0000
Subject: [Xen-devel] [libvirt test] 138895: regressions - FAIL
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

ZmxpZ2h0IDEzODg5NSBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzg4OTUvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAx
NSBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDEzODg3NgoKVGVzdHMg
d2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYXJtaGYt
YXJtaGYtbGlidmlydCAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICBs
aWtlIDEzODg3NgogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAxMyBzYXZlcmVzdG9yZS1z
dXBwb3J0LWNoZWNrICAgIGZhaWwgIGxpa2UgMTM4ODc2CiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZp
cnQteHNtIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MK
IHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAg
ICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQgICAgICAxMyBt
aWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0
LWkzODYtbGlidmlydC14c20gIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAg
IG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1k
NjQteHNtIDExIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayBmYWlsIG5ldmVyIHBhc3MKIHRlc3QtYW1k
NjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMTEgbWlncmF0ZS1zdXBw
b3J0LWNoZWNrIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0ICAgICAx
MyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFy
bTY0LWFybTY0LWxpYnZpcnQgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAgZmFp
bCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gMTMgbWlncmF0ZS1z
dXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1s
aWJ2aXJ0LXhzbSAxNCBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgICBuZXZlciBw
YXNzCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtdmhkIDEyIG1pZ3JhdGUtc3VwcG9ydC1jaGVj
ayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293
MiAxMiBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1h
cm02NC1hcm02NC1saWJ2aXJ0LXFjb3cyIDEzIHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAg
ZmFpbCBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQgICAgIDEzIG1pZ3JhdGUt
c3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtaGYtYXJtaGYt
bGlidmlydC1yYXcgMTIgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIg
cGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAg
IDRjYzU2NzllOTEyMWJlMDRiYWI0ZmM5YjkxZjRmZjM1MzE5OGQ3NmIKYmFzZWxpbmUgdmVyc2lv
bjoKIGxpYnZpcnQgICAgICAgICAgICAgIDJhNWJjMTM2MzkzODYzNjg5YmI4ZjU0Y2IxNDM0MmQz
ZmUxN2UyMjcKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzODg3NiAgMjAxOS0wNy0xMCAwMDoyNDow
NyBaICAgIDIgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzg4OTUgIDIwMTktMDctMTAgMjA6
MjU6MzUgWiAgICAxIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRo
YXQuY29tPgogIEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgogIFBldGVyIEtyZW1wYSA8
cGtyZW1wYUByZWRoYXQuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQteHNt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1oZiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmLWxpYnZp
cnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYtcHZvcHMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQt
eHNtICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcWVtdXUtZGVi
aWFuaHZtLWFtZDY0LXhzbSAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxp
YnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3Qt
YXJtNjQtYXJtNjQtbGlidmlydC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQtbGli
dmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1h
cm1oZi1hcm1oZi1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1wYWlyICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZp
cnQtcGFpciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFy
bTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFp
bCAgICAKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQg
b24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MK
aW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBh
dmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4g
Z2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rl
c3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIK
ClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpj
b21taXQgNGNjNTY3OWU5MTIxYmUwNGJhYjRmYzliOTFmNGZmMzUzMTk4ZDc2YgpBdXRob3I6IEVy
aWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgpEYXRlOiAgIFR1ZSBKdWwgOSAwOTowMjozNSAy
MDE5IC0wNTAwCgogICAgbWFpbnQ6IERyb3AgZGVhZCBjb2RlIGluIGNoZWNrLWRyaXZlcmltcGxz
LnBsCiAgICAKICAgIFdlIG5vIGxvbmdlciBuZWVkIHRvIHNwZWNpYWwtY2FzZSB4ZW5VbmlmaWVk
LCBzaW5jZSAxZGFjNWZiYmJiMAogICAgZHJvcHBlZCBzdXBwb3J0IGZvciB0aGF0IG5hbWluZyBz
Y2hlbWUuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQu
Y29tPgogICAgQWNrZWQtYnk6IFBldGVyIEtyZW1wYSA8cGtyZW1wYUByZWRoYXQuY29tPgoKY29t
bWl0IDNlZThlYTk1NjAzNjc0MjdkZTcxMWE1MjNhYjc5OTQ4ZjMwNjZkMTkKQXV0aG9yOiBEYW5p
ZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgpEYXRlOiAgIFdlZCBKdWwgMTAg
MTU6MzU6MjkgMjAxOSArMDEwMAoKICAgIHZ6OiBmaXggdHlwbyB0aGF0IGxvc3QgdGhlICcjJyBp
biAnI2RlZmluZScKICAgIAogICAgUHJldmlvdXMgY29tbWl0OgogICAgCiAgICAgIGNvbW1pdCBm
YWNlZWRhZjcxNzA5MDMwNjU4MDdlMmMzN2RkMGQxYmQwNmE2ZWY1CiAgICAgIEF1dGhvcjogSm9u
YXRob24gSm9uZ3NtYSA8ampvbmdzbWFAcmVkaGF0LmNvbT4KICAgICAgRGF0ZTogICBUdWUgSnVu
IDE4IDExOjEzOjEyIDIwMTkgLTA1MDAKICAgIAogICAgICAgIHNyYy92ejogdXNlICNwcmFnbWEg
b25jZSBpbiBoZWFkZXJzCiAgICAKICAgIGFjY2lkZW50YWxseSBjaG9tcGVkIHRoZSAiIyIgaW4g
YSAiI2RlZmluZSIgd2hlbiByZS1pbmRlbnRpbmcKICAgIAogICAgU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
