Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291668D68F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 16:50:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxuYg-0005yM-43; Wed, 14 Aug 2019 14:47:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g/pg=WK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hxuYe-0005yA-P7
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 14:47:24 +0000
X-Inumbo-ID: 6d0db4d4-bea2-11e9-940c-53c2740962ef
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d0db4d4-bea2-11e9-940c-53c2740962ef;
 Wed, 14 Aug 2019 14:47:23 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hxuYd-0004AH-6q; Wed, 14 Aug 2019 14:47:23 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hxuYc-0006L5-It; Wed, 14 Aug 2019 14:47:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hxuYc-0007ih-IE; Wed, 14 Aug 2019 14:47:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140094-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:build-amd64-libvirt:libvirt-build:fail:regression
 libvirt:build-i386-libvirt:libvirt-build:fail:regression
 libvirt:build-arm64-libvirt:libvirt-build:fail:regression
 libvirt:build-armhf-libvirt:libvirt-build:fail:regression
 libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: libvirt=92832577d1ef29d26d42bcbf978be0e845a31365
X-Osstest-Versions-That: libvirt=086764748e1a6b9aaf968db68145e05837eae3bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Aug 2019 14:47:22 +0000
Subject: [Xen-devel] [libvirt test] 140094: regressions - FAIL
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

ZmxpZ2h0IDE0MDA5NCBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDAwOTQvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgIDYg
bGlidmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzOTgyOQogYnVpbGQtaTM4
Ni1saWJ2aXJ0ICAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAgICAgICAgICAgZmFpbCBSRUdS
LiB2cy4gMTM5ODI5CiBidWlsZC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICA2IGxpYnZpcnQtYnVp
bGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzk4MjkKIGJ1aWxkLWFybWhmLWxpYnZpcnQg
ICAgICAgICAgIDYgbGlidmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzOTgy
OQoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRl
c3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXhzbSAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAg
ICBibG9ja2VkICBuL2EKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAgMSBidWlsZC1j
aGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm1oZi1hcm1oZi1saWJ2
aXJ0ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVz
dC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAg
IGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgMSBidWlsZC1jaGVj
aygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0
ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1h
bWQ2NC1pMzg2LWxpYnZpcnQgICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJs
b2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0
LXhzbSAxIGJ1aWxkLWNoZWNrKDEpIGJsb2NrZWQgbi9hCiB0ZXN0LWFtZDY0LWkzODYtbGlidmly
dC1wYWlyICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0
LWFtZDY0LWFtZDY0LWxpYnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAxIGJ1aWxkLWNo
ZWNrKDEpIGJsb2NrZWQgbi9hCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQtcmF3ICAxIGJ1aWxk
LWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWxp
YnZpcnQtcGFpciAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQog
dGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXhzbSAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAg
ICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAgMSBidWlsZC1j
aGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3Ig
dGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAgIDkyODMyNTc3ZDFlZjI5ZDI2ZDQyYmNiZjk3
OGJlMGU4NDVhMzEzNjUKYmFzZWxpbmUgdmVyc2lvbjoKIGxpYnZpcnQgICAgICAgICAgICAgIDA4
Njc2NDc0OGUxYTZiOWFhZjk2OGRiNjgxNDVlMDU4MzdlYWUzYmQKCkxhc3QgdGVzdCBvZiBiYXNp
cyAgIDEzOTgyOSAgMjAxOS0wOC0wOCAwNDoxOTowMiBaICAgIDYgZGF5cwpGYWlsaW5nIHNpbmNl
ICAgICAgICAxMzk4NTMgIDIwMTktMDgtMDkgMDQ6MjQ6MTEgWiAgICA1IGRheXMgICAgNiBhdHRl
bXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDAwOTQgIDIwMTktMDgtMTQgMDQ6MTg6NTEgWiAg
ICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMg
dW5kZXIgdGVzdDoKICBBbmRyZWEgQm9sb2duYW5pIDxhYm9sb2duYUByZWRoYXQuY29tPgogIERh
bmllbCBIZW5yaXF1ZSBCYXJib3phIDxkYW5pZWxoYjQxM0BnbWFpbC5jb20+CiAgRGFuaWVsIFAu
IEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KICBFcmljIEJsYWtlIDxlYmxha2VAcmVk
aGF0LmNvbT4KICBIYW4gSGFuIDxoaGFuQHJlZGhhdC5jb20+CiAgSWxpYXMgU3RhbWF0aXMgPHN0
YW1hdGlzLmlsaWFzc0BnbWFpbC5jb20+CiAgSmlyaSBEZW5lbWFyayA8amRlbmVtYXJAcmVkaGF0
LmNvbT4KICBKw6FuIFRvbWtvIDxqdG9ta29AcmVkaGF0LmNvbT4KICBMYWluZSBTdHVtcCA8bGFp
bmVAcmVkaGF0LmNvbT4KICBNYXJjLUFuZHLDqSBMdXJlYXUgPG1hcmNhbmRyZS5sdXJlYXVAcmVk
aGF0LmNvbT4KICBNYXhpd2VsbCBTLiBHYXJjaWEgPG1heGl3ZWxsQGxpbnV4LmlibS5jb20+CiAg
TWVubm8gTGFnZW1hbiA8bWVubm8ubGFnZW1hbkBvcmFjbGUuY29tPgogIE1pY2hhbCBQcml2b3pu
aWsgPG1wcml2b3puQHJlZGhhdC5jb20+CiAgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT4KICBSb21hbiBCb2xzaGFrb3YgPHIuYm9sc2hha292QHlhZHJvLmNvbT4KICBXaW0gdGVu
IEhhdmUgPHdpbS50ZW4uaGF2ZUBvcmFjbGUuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hcm02NC1saWJ2aXJ0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxk
LWFybWhmLWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWlsICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0LXB2b3BzICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
YXJtaGYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJp
YW5odm0tYW1kNjQteHNtICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZp
cnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFt
ZDY0LWFtZDY0LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxv
Y2tlZCAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZp
cnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJt
NjQtYXJtNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9j
a2VkIAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmly
dC1wYWlyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2
NC1pMzg2LWxpYnZpcnQtcGFpciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2Nr
ZWQgCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0
LXZoZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJl
cG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9t
ZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVz
LCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9m
IG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0
dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURN
RTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVz
aGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDE1NjMgbGluZXMgbG9uZy4pCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
