Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14D16B959
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 06:56:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6T9Z-0001x2-IM; Tue, 25 Feb 2020 05:53:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhJT=4N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j6T9X-0001wx-Iq
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 05:53:07 +0000
X-Inumbo-ID: 11ded1c6-5793-11ea-92a0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11ded1c6-5793-11ea-92a0-12813bfff9fa;
 Tue, 25 Feb 2020 05:52:56 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j6T9L-00069g-Gy; Tue, 25 Feb 2020 05:52:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j6T9L-0005B9-6Z; Tue, 25 Feb 2020 05:52:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j6T9L-0007GG-5t; Tue, 25 Feb 2020 05:52:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-147520-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:build-amd64-libvirt:libvirt-build:fail:regression
 libvirt:build-i386-libvirt:libvirt-build:fail:regression
 libvirt:build-arm64-libvirt:libvirt-build:fail:regression
 libvirt:build-armhf-libvirt:libvirt-build:fail:regression
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: libvirt=58f549d4fa90d0bec0eafbad968328388526dd86
X-Osstest-Versions-That: libvirt=a1cd25b919509be2645dbe6f952d5263e0d4e4e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Feb 2020 05:52:55 +0000
Subject: [Xen-devel] [libvirt test] 147520: regressions - FAIL
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

ZmxpZ2h0IDE0NzUyMCBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDc1MjAvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgIDYg
bGlidmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NjE4MgogYnVpbGQtaTM4
Ni1saWJ2aXJ0ICAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAgICAgICAgICAgZmFpbCBSRUdS
LiB2cy4gMTQ2MTgyCiBidWlsZC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICA2IGxpYnZpcnQtYnVp
bGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDYxODIKIGJ1aWxkLWFybWhmLWxpYnZpcnQg
ICAgICAgICAgIDYgbGlidmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NjE4
MgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRl
c3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtIDEgYnVpbGQt
Y2hlY2soMSkgYmxvY2tlZCBuL2EKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1wYWlyICAxIGJ1
aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0
LWxpYnZpcnQteHNtICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9h
CiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAg
ICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAxIGJ1aWxk
LWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFybTY0LWFybTY0LWxp
YnZpcnQgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0
ZXN0LWFtZDY0LWkzODYtbGlidmlydC1wYWlyICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAg
ICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQtcmF3ICAxIGJ1aWxkLWNo
ZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWkzODYtbGlidmly
dC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtIDEgYnVpbGQtY2hlY2soMSkgYmxvY2tlZCBuL2EK
IHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC12aGQgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAg
ICAgICBibG9ja2VkICBuL2EKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCAgICAgIDEgYnVpbGQt
Y2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2
aXJ0LXhzbSAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRl
c3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAg
ICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAgMSBidWlsZC1j
aGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3Ig
dGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAgIDU4ZjU0OWQ0ZmE5MGQwYmVjMGVhZmJhZDk2
ODMyODM4ODUyNmRkODYKYmFzZWxpbmUgdmVyc2lvbjoKIGxpYnZpcnQgICAgICAgICAgICAgIGEx
Y2QyNWI5MTk1MDliZTI2NDVkYmU2Zjk1MmQ1MjYzZTBkNGU0ZTUKCkxhc3QgdGVzdCBvZiBiYXNp
cyAgIDE0NjE4MiAgMjAyMC0wMS0xNyAwNjowMDoyMyBaICAgMzggZGF5cwpGYWlsaW5nIHNpbmNl
ICAgICAgICAxNDYyMTEgIDIwMjAtMDEtMTggMDQ6MTg6NTIgWiAgIDM4IGRheXMgICAzNiBhdHRl
bXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDc1MjAgIDIwMjAtMDItMjQgMDI6NDM6MzQgWiAg
ICAxIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMg
dW5kZXIgdGVzdDoKICBBbmRyZWEgQm9sb2duYW5pIDxhYm9sb2duYUByZWRoYXQuY29tPgogIEFy
bmF1ZCBQYXRhcmQgPGFwYXRhcmRAaHVwc3RyZWFtLmNvbT4KICBCb3JpcyBGaXVjenluc2tpIDxm
aXVjenlAbGludXguaWJtLmNvbT4KICBDaHJpc3RpYW4gRWhyaGFyZHQgPGNocmlzdGlhbi5laHJo
YXJkdEBjYW5vbmljYWwuY29tPgogIENvbGxpbiBXYWxsaW5nIDx3YWxsaW5nQGxpbnV4LmlibS5j
b20+CiAgRGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgPGRhbmllbGhiNDEzQGdtYWlsLmNvbT4KICBE
YW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgogIERhcmlvIEZhZ2dpb2xp
IDxkZmFnZ2lvbGlAc3VzZS5jb20+CiAgRXJpayBTa3VsdGV0eSA8ZXNrdWx0ZXRAcmVkaGF0LmNv
bT4KICBIYW4gSGFuIDxoaGFuQHJlZGhhdC5jb20+CiAgSmltIEZlaGxpZyA8amZlaGxpZ0BzdXNl
LmNvbT4KICBKaXJpIERlbmVtYXJrIDxqZGVuZW1hckByZWRoYXQuY29tPgogIEpvbmF0aG9uIEpv
bmdzbWEgPGpqb25nc21hQHJlZGhhdC5jb20+CiAgSnVsaW8gRmFyYWNjbyA8amNmYXJhY2NvQGdt
YWlsLmNvbT4KICBKw6FuIFRvbWtvIDxqdG9ta29AcmVkaGF0LmNvbT4KICBMYWluZSBTdHVtcCA8
bGFpbmVAcmVkaGF0LmNvbT4KICBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVr
QGludmlzaWJsZXRoaW5nc2xhYi5jb20+CiAgTWljaGFsIFByaXZvem5payA8bXByaXZvem5AcmVk
aGF0LmNvbT4KICBOaWtvbGF5IFNoaXJva292c2tpeSA8bnNoaXJva292c2tpeUB2aXJ0dW96em8u
Y29tPgogIFBhdmVsIEhyZGluYSA8cGhyZGluYUByZWRoYXQuY29tPgogIFBhdmVsIE1vcmVzIDxw
bW9yZXNAcmVkaGF0LmNvbT4KICBQZXRlciBLcmVtcGEgPHBrcmVtcGFAcmVkaGF0LmNvbT4KICBS
aWNoYXJkIFcuTS4gSm9uZXMgPHJqb25lc0ByZWRoYXQuY29tPgogIFJ5YW4gTW9lbGxlciA8cnlh
bkBpWHN5c3RlbXMuY29tPgogIFNhaGlkIE9yZW50aW5vIEZlcmRqYW91aSA8c2FoaWQuZmVyZGph
b3VpQGNhbm9uaWNhbC5jb20+CiAgU3RlZmFuIEJlcmdlciA8c3RlZmFuYkBsaW51eC5pYm0uY29t
PgogIFN0ZWZhbiBCZXJnZXIgPHN0ZWZhbmJAbGludXgudm5ldC5pYm0uY29tPgogIFRob21hcyBI
dXRoIDx0aHV0aEByZWRoYXQuY29tPgogIFlvdXIgTmFtZSA8eW91QGV4YW1wbGUuY29tPgogIHpo
ZW53ZWkgcGkgPHBpemhlbndlaUBieXRlZGFuY2UuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhz
bSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
YnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hcm02NC1saWJ2
aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1
aWxkLWFybWhmLWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmYWlsICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0LXB2b3Bz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1k
ZWJpYW5odm0tYW1kNjQteHNtICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1pMzg2LWxp
YnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0
LWFtZDY0LWFtZDY0LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YmxvY2tlZCAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LWxp
YnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3Qt
YXJtNjQtYXJtNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
bG9ja2VkIAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtbGli
dmlydC1wYWlyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1h
bWQ2NC1pMzg2LWxpYnZpcnQtcGFpciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJs
b2NrZWQgCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2
aXJ0LXZoZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNn
LXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAv
aG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZp
bGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5k
IG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJF
QURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0
cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3Qg
cHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDY0NzEgbGluZXMgbG9uZy4p
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
