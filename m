Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF0F2F3D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 14:27:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iShm8-0004rg-Ot; Thu, 07 Nov 2019 13:24:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2VDg=Y7=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iShm7-0004rY-3b
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 13:24:35 +0000
X-Inumbo-ID: ed2aba70-0161-11ea-b678-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed2aba70-0161-11ea-b678-bc764e2007e4;
 Thu, 07 Nov 2019 13:24:29 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iShm0-0003yN-S4; Thu, 07 Nov 2019 13:24:28 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iShm0-0007Og-8t; Thu, 07 Nov 2019 13:24:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iShm0-0003qZ-86; Thu, 07 Nov 2019 13:24:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-143789-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 libvirt:test-amd64-i386-libvirt:guest-start:fail:regression
 libvirt:test-amd64-amd64-libvirt-pair:xen-boot/src_host:fail:regression
 libvirt:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
 libvirt:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
 libvirt:test-arm64-arm64-libvirt-qcow2:debian-di-install:fail:regression
 libvirt:test-amd64-amd64-libvirt:guest-start:fail:regression
 libvirt:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
 libvirt:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
 libvirt:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
 libvirt:test-arm64-arm64-libvirt:guest-start:fail:regression
 libvirt:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
 libvirt:test-armhf-armhf-libvirt:guest-start:fail:regression
X-Osstest-Versions-This: libvirt=78a342441efca14680a934dc72d1b3d1ed9e8d3e
X-Osstest-Versions-That: libvirt=2cff65e4c60ed7b3c0c6a97d526d1f8d52c0e919
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Nov 2019 13:24:28 +0000
Subject: [Xen-devel] [libvirt test] 143789: regressions - FAIL
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

ZmxpZ2h0IDE0Mzc4OSBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDM3ODkvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRl
Ymlhbmh2bS1hbWQ2NC14c20gMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDE0
MzAyMwogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20g
MTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDE0MzAyMwogdGVzdC1hbWQ2NC1p
Mzg2LWxpYnZpcnQgICAgICAxMiBndWVzdC1zdGFydCAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTQzMDIzCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcGFpciAxMCB4ZW4tYm9vdC9zcmNf
aG9zdCAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDMwMjMKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmly
dC12aGQgMTAgZGViaWFuLWRpLWluc3RhbGwgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MzAyMwog
dGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXhzbSAxMiBndWVzdC1zdGFydCAgICAgICAgICAgICAg
ZmFpbCBSRUdSLiB2cy4gMTQzMDIzCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgMTAg
ZGViaWFuLWRpLWluc3RhbGwgICAgICBmYWlsIFJFR1IuIHZzLiAxNDMwMjMKIHRlc3QtYW1kNjQt
YW1kNjQtbGlidmlydCAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZhaWwgUkVHUi4g
dnMuIDE0MzAyMwogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAxMiBndWVzdC1zdGFydCAg
ICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQzMDIzCiB0ZXN0LWFtZDY0LWkzODYtbGlidmly
dC1wYWlyIDIxIGd1ZXN0LXN0YXJ0L2RlYmlhbiAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDMwMjMK
IHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAg
IGZhaWwgUkVHUi4gdnMuIDE0MzAyMwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0ICAgICAxMiBn
dWVzdC1zdGFydCAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQzMDIzCiB0ZXN0LWFybWhm
LWFybWhmLWxpYnZpcnQtcmF3IDEwIGRlYmlhbi1kaS1pbnN0YWxsICAgICAgICBmYWlsIFJFR1Iu
IHZzLiAxNDMwMjMKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCAgICAgMTIgZ3Vlc3Qtc3RhcnQg
ICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MzAyMwoKdmVyc2lvbiB0YXJnZXRlZCBmb3Ig
dGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAgIDc4YTM0MjQ0MWVmY2ExNDY4MGE5MzRkYzcy
ZDFiM2QxZWQ5ZThkM2UKYmFzZWxpbmUgdmVyc2lvbjoKIGxpYnZpcnQgICAgICAgICAgICAgIDJj
ZmY2NWU0YzYwZWQ3YjNjMGM2YTk3ZDUyNmQxZjhkNTJjMGU5MTkKCkxhc3QgdGVzdCBvZiBiYXNp
cyAgIDE0MzAyMyAgMjAxOS0xMC0yMiAwNDoxOToyNiBaICAgMTUgZGF5cwpGYWlsaW5nIHNpbmNl
ICAgICAgICAxNDMwNTEgIDIwMTktMTAtMjMgMDQ6MTg6NTcgWiAgIDE0IGRheXMgICAxMSBhdHRl
bXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDM3ODkgIDIwMTktMTEtMDUgMDE6NDY6NTkgWiAg
ICAxIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMg
dW5kZXIgdGVzdDoKICBBbmRyZWEgQm9sb2duYW5pIDxhYm9sb2duYUByZWRoYXQuY29tPgogIEVy
aWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgogIEppbSBGZWhsaWcgPGpmZWhsaWdAc3VzZS5j
b20+CiAgSsOhbiBUb21rbyA8anRvbWtvQHJlZGhhdC5jb20+CiAgTWF5YSBSYXNoaXNoIDxjb3lw
dUBzZGYub3JnPgogIE1pY2hhbCBQcml2b3puaWsgPG1wcml2b3puQHJlZGhhdC5jb20+CiAgUGF2
ZWwgSHJkaW5hIDxwaHJkaW5hQHJlZGhhdC5jb20+CiAgUGV0ZXIgS3JlbXBhIDxwa3JlbXBhQHJl
ZGhhdC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm02NC14c20gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYt
eHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm02NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYtbGlidmlydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxp
YnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1oZi1wdm9wcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZv
cHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
dGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gICAgICAg
ICAgIGZhaWwgICAgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1k
NjQteHNtICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC14c20g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hcm02NC1hcm02
NC1saWJ2aXJ0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0
ZXN0LWFtZDY0LWkzODYtbGlidmlydC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFybWhmLWFybWhm
LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRl
c3QtYW1kNjQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmYWlsICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXBhaXIgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC1wYWlyICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYXJtNjQtYXJtNjQt
bGlidmlydC1xY293MiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVz
dC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZhaWwgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtdmhkICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZmFpbCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9o
b21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBh
dAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpF
eHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBp
cyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1i
bG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJu
ZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxv
ZzsgaXQgd291bGQgYmUgMTI0NCBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
