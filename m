Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD953153048
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 13:01:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izJKL-0006LG-Jh; Wed, 05 Feb 2020 11:58:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKoX=3Z=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1izJKK-0006LB-OA
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:58:40 +0000
X-Inumbo-ID: d8bc1450-480e-11ea-90df-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8bc1450-480e-11ea-90df-12813bfff9fa;
 Wed, 05 Feb 2020 11:58:39 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1izJKI-000493-R3; Wed, 05 Feb 2020 11:58:38 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1izJKI-00029W-Hy; Wed, 05 Feb 2020 11:58:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1izJKI-0006vC-HG; Wed, 05 Feb 2020 11:58:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146737-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:build-amd64-libvirt:libvirt-build:fail:regression
 libvirt:build-i386-libvirt:libvirt-build:fail:regression
 libvirt:build-arm64-libvirt:libvirt-build:fail:regression
 libvirt:build-armhf-libvirt:libvirt-build:fail:regression
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: libvirt=4ab2120f3bc1ab9de535a6ea9990900def4f9030
X-Osstest-Versions-That: libvirt=a1cd25b919509be2645dbe6f952d5263e0d4e4e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Feb 2020 11:58:38 +0000
Subject: [Xen-devel] [libvirt test] 146737: regressions - FAIL
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

ZmxpZ2h0IDE0NjczNyBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY3MzcvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgIDYg
bGlidmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NjE4MgogYnVpbGQtaTM4
Ni1saWJ2aXJ0ICAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAgICAgICAgICAgZmFpbCBSRUdS
LiB2cy4gMTQ2MTgyCiBidWlsZC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICA2IGxpYnZpcnQtYnVp
bGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDYxODIKIGJ1aWxkLWFybWhmLWxpYnZpcnQg
ICAgICAgICAgIDYgbGlidmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NjE4
MgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRl
c3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMSBidWlsZC1j
aGVjaygxKSBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcGFpciAgMSBidWls
ZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm1oZi1hcm1oZi1s
aWJ2aXJ0ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQog
dGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMSBidWls
ZC1jaGVjaygxKSBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAgMSBi
dWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm02NC1hcm02
NC1saWJ2aXJ0LXFjb3cyICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAg
bi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcGFpciAgMSBidWlsZC1jaGVjaygxKSAgICAg
ICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAgMSBi
dWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1hbWQ2
NC1saWJ2aXJ0LXhzbSAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4v
YQogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAg
ICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAgMSBidWls
ZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm1oZi1hcm1oZi1s
aWJ2aXJ0LXJhdyAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQog
dGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAg
ICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQgICAgICAgMSBidWlsZC1j
aGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3Ig
dGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAgIDRhYjIxMjBmM2JjMWFiOWRlNTM1YTZlYTk5
OTA5MDBkZWY0ZjkwMzAKYmFzZWxpbmUgdmVyc2lvbjoKIGxpYnZpcnQgICAgICAgICAgICAgIGEx
Y2QyNWI5MTk1MDliZTI2NDVkYmU2Zjk1MmQ1MjYzZTBkNGU0ZTUKCkxhc3QgdGVzdCBvZiBiYXNp
cyAgIDE0NjE4MiAgMjAyMC0wMS0xNyAwNjowMDoyMyBaICAgMTkgZGF5cwpGYWlsaW5nIHNpbmNl
ICAgICAgICAxNDYyMTEgIDIwMjAtMDEtMTggMDQ6MTg6NTIgWiAgIDE4IGRheXMgICAxOSBhdHRl
bXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDY3MzcgIDIwMjAtMDItMDUgMDQ6MTg6NTQgWiAg
ICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMg
dW5kZXIgdGVzdDoKICBBbmRyZWEgQm9sb2duYW5pIDxhYm9sb2duYUByZWRoYXQuY29tPgogIEJv
cmlzIEZpdWN6eW5za2kgPGZpdWN6eUBsaW51eC5pYm0uY29tPgogIENocmlzdGlhbiBFaHJoYXJk
dCA8Y2hyaXN0aWFuLmVocmhhcmR0QGNhbm9uaWNhbC5jb20+CiAgRGFuaWVsIEhlbnJpcXVlIEJh
cmJvemEgPGRhbmllbGhiNDEzQGdtYWlsLmNvbT4KICBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJy
YW5nZUByZWRoYXQuY29tPgogIERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CiAg
RXJpayBTa3VsdGV0eSA8ZXNrdWx0ZXRAcmVkaGF0LmNvbT4KICBIYW4gSGFuIDxoaGFuQHJlZGhh
dC5jb20+CiAgSmltIEZlaGxpZyA8amZlaGxpZ0BzdXNlLmNvbT4KICBKb25hdGhvbiBKb25nc21h
IDxqam9uZ3NtYUByZWRoYXQuY29tPgogIEp1bGlvIEZhcmFjY28gPGpjZmFyYWNjb0BnbWFpbC5j
b20+CiAgSsOhbiBUb21rbyA8anRvbWtvQHJlZGhhdC5jb20+CiAgTGFpbmUgU3R1bXAgPGxhaW5l
QHJlZGhhdC5jb20+CiAgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPgogIE1pY2hhbCBQcml2b3puaWsgPG1wcml2b3puQHJlZGhhdC5j
b20+CiAgTmlrb2xheSBTaGlyb2tvdnNraXkgPG5zaGlyb2tvdnNraXlAdmlydHVvenpvLmNvbT4K
ICBQYXZlbCBIcmRpbmEgPHBocmRpbmFAcmVkaGF0LmNvbT4KICBQZXRlciBLcmVtcGEgPHBrcmVt
cGFAcmVkaGF0LmNvbT4KICBSaWNoYXJkIFcuTS4gSm9uZXMgPHJqb25lc0ByZWRoYXQuY29tPgog
IFNhaGlkIE9yZW50aW5vIEZlcmRqYW91aSA8c2FoaWQuZmVyZGphb3VpQGNhbm9uaWNhbC5jb20+
CiAgVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm02NCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFybTY0LWxpYnZp
cnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVp
bGQtYXJtaGYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZhaWwgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQtcHZvcHMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1hcm1oZi1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXFlbXV1LWRl
Ymlhbmh2bS1hbWQ2NC14c20gICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWkzODYtbGli
dmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3Qt
YW1kNjQtYW1kNjQtbGlidmlydC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
bG9ja2VkIAogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC14c20gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtbGli
dmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1h
cm02NC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJs
b2NrZWQgCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2
aXJ0LXBhaXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFt
ZDY0LWkzODYtbGlidmlydC1wYWlyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxv
Y2tlZCAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZp
cnQtdmhkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ct
cmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9o
b21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmls
ZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQg
b2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVB
RE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBw
dXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgNDEzMSBsaW5lcyBsb25nLikK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
