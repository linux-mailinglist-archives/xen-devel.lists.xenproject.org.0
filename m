Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD5ECFB5
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2019 17:18:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQw2y-00041D-M4; Sat, 02 Nov 2019 16:14:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HYGq=Y2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iQw2x-000418-03
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2019 16:14:39 +0000
X-Inumbo-ID: da5e7636-fd8b-11e9-957e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da5e7636-fd8b-11e9-957e-12813bfff9fa;
 Sat, 02 Nov 2019 16:14:31 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iQw2p-0004hS-Ez; Sat, 02 Nov 2019 16:14:31 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iQw2p-0006XK-3k; Sat, 02 Nov 2019 16:14:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iQw2p-0000HR-38; Sat, 02 Nov 2019 16:14:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-143484-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:test-amd64-amd64-libvirt:guest-start:fail:regression
 libvirt:test-amd64-i386-libvirt:guest-start:fail:regression
 libvirt:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
 libvirt:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
 libvirt:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
 libvirt:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 libvirt:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
 libvirt:test-arm64-arm64-libvirt:guest-start:fail:regression
 libvirt:test-arm64-arm64-libvirt-qcow2:debian-di-install:fail:regression
 libvirt:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
 libvirt:test-armhf-armhf-libvirt:guest-start:fail:regression
 libvirt:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
X-Osstest-Versions-This: libvirt=bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a
X-Osstest-Versions-That: libvirt=2cff65e4c60ed7b3c0c6a97d526d1f8d52c0e919
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 02 Nov 2019 16:14:31 +0000
Subject: [Xen-devel] [libvirt test] 143484: regressions - FAIL
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

ZmxpZ2h0IDE0MzQ4NCBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDM0ODQvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgMTIg
Z3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MzAyMwogdGVzdC1hbWQ2
NC1pMzg2LWxpYnZpcnQgICAgICAxMiBndWVzdC1zdGFydCAgICAgICAgICAgICAgZmFpbCBSRUdS
LiB2cy4gMTQzMDIzCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQteHNtIDEyIGd1ZXN0LXN0YXJ0
ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDMwMjMKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2
aXJ0LXhzbSAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MzAy
MwogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXBhaXIgMjEgZ3Vlc3Qtc3RhcnQvZGViaWFuICAg
ICAgZmFpbCBSRUdSLiB2cy4gMTQzMDIzCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC1wYWlyIDIx
IGd1ZXN0LXN0YXJ0L2RlYmlhbiAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDMwMjMKIHRlc3QtYW1k
NjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtIDEwIGRlYmlhbi1odm0t
aW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDMwMjMKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXFl
bXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4g
dnMuIDE0MzAyMwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAxMiBndWVzdC1zdGFydCAg
ICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQzMDIzCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZp
cnQgICAgIDEyIGd1ZXN0LXN0YXJ0ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDMwMjMK
IHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAxMCBkZWJpYW4tZGktaW5zdGFsbCAgICAg
IGZhaWwgUkVHUi4gdnMuIDE0MzAyMwogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAxMCBk
ZWJpYW4tZGktaW5zdGFsbCAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQzMDIzCiB0ZXN0LWFybWhm
LWFybWhmLWxpYnZpcnQgICAgIDEyIGd1ZXN0LXN0YXJ0ICAgICAgICAgICAgICBmYWlsIFJFR1Iu
IHZzLiAxNDMwMjMKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgMTAgZGViaWFuLWRpLWlu
c3RhbGwgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MzAyMwoKdmVyc2lvbiB0YXJnZXRlZCBmb3Ig
dGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAgIGJmMGU3YmRlZWI3OTBiYzZiYTU3MzI2MjNi
ZTBkOWZmMjZhNTk2MWEKYmFzZWxpbmUgdmVyc2lvbjoKIGxpYnZpcnQgICAgICAgICAgICAgIDJj
ZmY2NWU0YzYwZWQ3YjNjMGM2YTk3ZDUyNmQxZjhkNTJjMGU5MTkKCkxhc3QgdGVzdCBvZiBiYXNp
cyAgIDE0MzAyMyAgMjAxOS0xMC0yMiAwNDoxOToyNiBaICAgMTEgZGF5cwpGYWlsaW5nIHNpbmNl
ICAgICAgICAxNDMwNTEgIDIwMTktMTAtMjMgMDQ6MTg6NTcgWiAgIDEwIGRheXMgICAgOSBhdHRl
bXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDMxNDAgIDIwMTktMTAtMjUgMDQ6MTg6NDYgWiAg
ICA4IGRheXMgICAgNyBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMg
dW5kZXIgdGVzdDoKICBBbmRyZWEgQm9sb2duYW5pIDxhYm9sb2duYUByZWRoYXQuY29tPgogIEVy
aWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgogIErDoW4gVG9ta28gPGp0b21rb0ByZWRoYXQu
Y29tPgogIE1heWEgUmFzaGlzaCA8Y295cHVAc2RmLm9yZz4KICBNaWNoYWwgUHJpdm96bmlrIDxt
cHJpdm96bkByZWRoYXQuY29tPgogIFBhdmVsIEhyZGluYSA8cGhyZGluYUByZWRoYXQuY29tPgog
IFBldGVyIEtyZW1wYSA8cGtyZW1wYUByZWRoYXQuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhz
bSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
YnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm02NC1saWJ2
aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWFybWhmLWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0LXB2b3Bz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1k
ZWJpYW5odm0tYW1kNjQteHNtICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxp
YnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0
LWFtZDY0LWFtZDY0LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZmFpbCAgICAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxp
YnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3Qt
YXJtNjQtYXJtNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWlsICAgIAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGli
dmlydC1wYWlyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1h
bWQ2NC1pMzg2LWxpYnZpcnQtcGFpciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZh
aWwgICAgCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2
aXJ0LXZoZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0t
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
cHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDExOTEgbGluZXMgbG9uZy4p
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
