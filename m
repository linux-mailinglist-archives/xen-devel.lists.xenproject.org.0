Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918F169C61
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 03:46:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j63gO-0002hz-7A; Mon, 24 Feb 2020 02:41:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N9Wh=4M=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j63gM-0002hs-Hv
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 02:41:18 +0000
X-Inumbo-ID: 21b6581a-56af-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21b6581a-56af-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 02:41:17 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j63gK-0000Af-RX; Mon, 24 Feb 2020 02:41:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j63gK-0007qH-FQ; Mon, 24 Feb 2020 02:41:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j63gK-0000P6-Ec; Mon, 24 Feb 2020 02:41:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-147477-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:build-amd64-libvirt:libvirt-build:fail:regression
 libvirt:build-i386-libvirt:libvirt-build:fail:regression
 libvirt:build-arm64-libvirt:libvirt-build:fail:regression
 libvirt:build-armhf-libvirt:libvirt-build:fail:regression
 libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: libvirt=f4b1c020a2c8493473bf868231cee6a952d57e6f
X-Osstest-Versions-That: libvirt=a1cd25b919509be2645dbe6f952d5263e0d4e4e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Feb 2020 02:41:16 +0000
Subject: [Xen-devel] [libvirt test] 147477: regressions - FAIL
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

ZmxpZ2h0IDE0NzQ3NyBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDc0NzcvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgIDYg
bGlidmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NjE4MgogYnVpbGQtaTM4
Ni1saWJ2aXJ0ICAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAgICAgICAgICAgZmFpbCBSRUdS
LiB2cy4gMTQ2MTgyCiBidWlsZC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICA2IGxpYnZpcnQtYnVp
bGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDYxODIKIGJ1aWxkLWFybWhmLWxpYnZpcnQg
ICAgICAgICAgIDYgbGlidmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NjE4
MgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRl
c3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXhzbSAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAg
ICBibG9ja2VkICBuL2EKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCAgICAgIDEgYnVpbGQtY2hl
Y2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0
LXBhaXIgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3Qt
YW1kNjQtYW1kNjQtbGlidmlydCAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBi
bG9ja2VkICBuL2EKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAgMSBidWlsZC1jaGVj
aygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0
LXBhaXIgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3Qt
YW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtIDEgYnVpbGQtY2hl
Y2soMSkgYmxvY2tlZCBuL2EKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gIDEgYnVpbGQt
Y2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtYW1kNjQtbGli
dmlydC12aGQgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRl
c3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMSBidWlsZC1j
aGVjaygxKSBibG9ja2VkIG4vYQogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAgMSBidWls
ZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm02NC1hcm02NC1s
aWJ2aXJ0ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQog
dGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXhzbSAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAg
ICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQgICAgICAgMSBidWlsZC1j
aGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3Ig
dGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAgIGY0YjFjMDIwYTJjODQ5MzQ3M2JmODY4MjMx
Y2VlNmE5NTJkNTdlNmYKYmFzZWxpbmUgdmVyc2lvbjoKIGxpYnZpcnQgICAgICAgICAgICAgIGEx
Y2QyNWI5MTk1MDliZTI2NDVkYmU2Zjk1MmQ1MjYzZTBkNGU0ZTUKCkxhc3QgdGVzdCBvZiBiYXNp
cyAgIDE0NjE4MiAgMjAyMC0wMS0xNyAwNjowMDoyMyBaICAgMzcgZGF5cwpGYWlsaW5nIHNpbmNl
ICAgICAgICAxNDYyMTEgIDIwMjAtMDEtMTggMDQ6MTg6NTIgWiAgIDM2IGRheXMgICAzNSBhdHRl
bXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDc0NzcgIDIwMjAtMDItMjMgMDE6NDg6MDcgWiAg
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
cHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDYxMTcgbGluZXMgbG9uZy4p
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
