Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52951584C7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 22:28:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1GYN-0003Tf-8D; Mon, 10 Feb 2020 21:25:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y8HZ=36=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j1GYK-0003T8-Rh
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 21:25:12 +0000
X-Inumbo-ID: ceac50a6-4c4b-11ea-8cad-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ceac50a6-4c4b-11ea-8cad-bc764e2007e4;
 Mon, 10 Feb 2020 21:25:06 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j1GYD-0006or-Su; Mon, 10 Feb 2020 21:25:05 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j1GYD-0000FT-Ho; Mon, 10 Feb 2020 21:25:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j1GYD-0008Eu-HA; Mon, 10 Feb 2020 21:25:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146827-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:build-arm64-pvops:<job status>:broken:regression
 libvirt:build-armhf-pvops:<job status>:broken:regression
 libvirt:build-arm64:<job status>:broken:regression
 libvirt:build-i386-xsm:<job status>:broken:regression
 libvirt:build-i386-pvops:<job status>:broken:regression
 libvirt:build-armhf:<job status>:broken:regression
 libvirt:build-amd64:<job status>:broken:regression
 libvirt:build-arm64-xsm:<job status>:broken:regression
 libvirt:build-amd64-xsm:<job status>:broken:regression
 libvirt:build-amd64-pvops:<job status>:broken:regression
 libvirt:build-i386:<job status>:broken:regression
 libvirt:build-i386-xsm:host-install(4):broken:regression
 libvirt:build-i386:host-install(4):broken:regression
 libvirt:build-arm64-pvops:host-install(4):broken:regression
 libvirt:build-armhf-pvops:host-install(4):broken:regression
 libvirt:build-amd64:host-install(4):broken:regression
 libvirt:build-amd64-xsm:host-install(4):broken:regression
 libvirt:build-i386-pvops:host-install(4):broken:regression
 libvirt:build-arm64-xsm:host-install(4):broken:regression
 libvirt:build-amd64-pvops:host-install(4):broken:regression
 libvirt:build-arm64:host-install(4):broken:regression
 libvirt:build-armhf:host-install(4):broken:regression
 libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 libvirt:build-amd64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:build-i386-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:build-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: libvirt=cebb468ef5e82b8d4253e27ef70c67812cf93c5a
X-Osstest-Versions-That: libvirt=a1cd25b919509be2645dbe6f952d5263e0d4e4e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 Feb 2020 21:25:05 +0000
Subject: [Xen-devel] [libvirt test] 146827: trouble: blocked/broken
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

ZmxpZ2h0IDE0NjgyNyBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY4MjcvCgpGYWlsdXJlcyBhbmQgcHJvYmxlbXMg
d2l0aCB0ZXN0cyA6LSgKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2Nr
aW5nLAppbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFybTY0
LXB2b3BzICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4K
IGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAg
ICAgICBicm9rZW4KIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+
ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAg
PGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWkzODYtcHZvcHMgICAg
ICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFy
bWhmICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9r
ZW4KIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAg
ICAgICAgICBicm9rZW4KIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAgICAgICAgPGpvYiBzdGF0
dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAg
ICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFtZDY0LXB2b3Bz
ICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxk
LWkzODYgICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBi
cm9rZW4KIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAg
ICAgICBicm9rZW4gUkVHUi4gdnMuIDE0NjE4MgogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAg
ICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQ2MTgyCiBidWls
ZC1hcm02NC1wdm9wcyAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgYnJva2Vu
IFJFR1IuIHZzLiAxNDYxODIKIGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAgIDQgaG9zdC1p
bnN0YWxsKDQpICAgICAgICBicm9rZW4gUkVHUi4gdnMuIDE0NjE4MgogYnVpbGQtYW1kNjQgICAg
ICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4g
MTQ2MTgyCiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAg
ICAgICAgYnJva2VuIFJFR1IuIHZzLiAxNDYxODIKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAg
ICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICBicm9rZW4gUkVHUi4gdnMuIDE0NjE4MgogYnVp
bGQtYXJtNjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tl
biBSRUdSLiB2cy4gMTQ2MTgyCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICA0IGhvc3Qt
aW5zdGFsbCg0KSAgICAgICAgYnJva2VuIFJFR1IuIHZzLiAxNDYxODIKIGJ1aWxkLWFybTY0ICAg
ICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICBicm9rZW4gUkVHUi4gdnMu
IDE0NjE4MgogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkg
ICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQ2MTgyCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2Nl
ZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAg
MSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1h
bWQ2NC1saWJ2aXJ0LXZoZCAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQg
IG4vYQogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAg
ICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXFjb3cyICAx
IGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFybTY0LWFy
bTY0LWxpYnZpcnQteHNtICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAg
bi9hCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAg
ICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC14c20gICAxIGJ1
aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFybWhmLWFybWhm
LWxpYnZpcnQgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9h
CiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAg
ICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQgICAgICAxIGJ1aWxk
LWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWxp
YnZpcnQteHNtICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0
ZXN0LWFtZDY0LWkzODYtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtIDEgYnVpbGQt
Y2hlY2soMSkgYmxvY2tlZCBuL2EKIGJ1aWxkLWFybWhmLWxpYnZpcnQgICAgICAgICAgIDEgYnVp
bGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGJ1aWxkLWFybTY0LWxpYnZp
cnQgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EK
IHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXBhaXIgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAg
ICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5o
dm0tYW1kNjQteHNtIDEgYnVpbGQtY2hlY2soMSkgYmxvY2tlZCBuL2EKIHRlc3QtYW1kNjQtYW1k
NjQtbGlidmlydC1wYWlyICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAg
bi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAg
ICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogbGli
dmlydCAgICAgICAgICAgICAgY2ViYjQ2OGVmNWU4MmI4ZDQyNTNlMjdlZjcwYzY3ODEyY2Y5M2M1
YQpiYXNlbGluZSB2ZXJzaW9uOgogbGlidmlydCAgICAgICAgICAgICAgYTFjZDI1YjkxOTUwOWJl
MjY0NWRiZTZmOTUyZDUyNjNlMGQ0ZTRlNQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ2MTgyICAy
MDIwLTAxLTE3IDA2OjAwOjIzIFogICAyNCBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NjIx
MSAgMjAyMC0wMS0xOCAwNDoxODo1MiBaICAgMjMgZGF5cyAgIDI0IGF0dGVtcHRzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDE0NjgxNyAgMjAyMC0wMi0wOSAwNDoxODo0MCBaICAgIDEgZGF5cyAgICAy
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IEFuZHJlYSBCb2xvZ25hbmkgPGFib2xvZ25hQHJlZGhhdC5jb20+CiAgQm9yaXMgRml1Y3p5bnNr
aSA8Zml1Y3p5QGxpbnV4LmlibS5jb20+CiAgQ2hyaXN0aWFuIEVocmhhcmR0IDxjaHJpc3RpYW4u
ZWhyaGFyZHRAY2Fub25pY2FsLmNvbT4KICBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGFuaWVs
aGI0MTNAZ21haWwuY29tPgogIERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5j
b20+CiAgRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KICBFcmlrIFNrdWx0ZXR5
IDxlc2t1bHRldEByZWRoYXQuY29tPgogIEhhbiBIYW4gPGhoYW5AcmVkaGF0LmNvbT4KICBKaW0g
RmVobGlnIDxqZmVobGlnQHN1c2UuY29tPgogIEppcmkgRGVuZW1hcmsgPGpkZW5lbWFyQHJlZGhh
dC5jb20+CiAgSm9uYXRob24gSm9uZ3NtYSA8ampvbmdzbWFAcmVkaGF0LmNvbT4KICBKdWxpbyBG
YXJhY2NvIDxqY2ZhcmFjY29AZ21haWwuY29tPgogIErDoW4gVG9ta28gPGp0b21rb0ByZWRoYXQu
Y29tPgogIExhaW5lIFN0dW1wIDxsYWluZUByZWRoYXQuY29tPgogIE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KICBNaWNoYWwgUHJp
dm96bmlrIDxtcHJpdm96bkByZWRoYXQuY29tPgogIE5pa29sYXkgU2hpcm9rb3Zza2l5IDxuc2hp
cm9rb3Zza2l5QHZpcnR1b3p6by5jb20+CiAgUGF2ZWwgSHJkaW5hIDxwaHJkaW5hQHJlZGhhdC5j
b20+CiAgUGV0ZXIgS3JlbXBhIDxwa3JlbXBhQHJlZGhhdC5jb20+CiAgUmljaGFyZCBXLk0uIEpv
bmVzIDxyam9uZXNAcmVkaGF0LmNvbT4KICBTYWhpZCBPcmVudGlubyBGZXJkamFvdWkgPHNhaGlk
LmZlcmRqYW91aUBjYW5vbmljYWwuY29tPgogIFN0ZWZhbiBCZXJnZXIgPHN0ZWZhbmJAbGludXgu
aWJtLmNvbT4KICBTdGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxpbnV4LnZuZXQuaWJtLmNvbT4KICBU
aG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KICB6aGVud2VpIHBpIDxwaXpoZW53ZWlAYnl0
ZWRhbmNlLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFybTY0LXhzbSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtaTM4
Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tl
biAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1pMzg2
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2Vu
ICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBibG9ja2VkIAogYnVpbGQtYXJtNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiBidWlsZC1hcm1oZi1saWJ2aXJ0ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIGJ1aWxkLWkzODYt
bGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2Vk
IAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJyb2tlbiAgCiBidWlsZC1hcm02NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtaTM4Ni1w
dm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAg
CiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAgICAg
ICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1h
bWQ2NC14c20gICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXhz
bSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFybTY0LWFy
bTY0LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAK
IHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtaGYtYXJt
aGYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAog
dGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcGFpciAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXBhaXIg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hcm02NC1hcm02
NC1saWJ2aXJ0LXFjb3cyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0
ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQtcmF3ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC12aGQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rl
c3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczog
L2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxl
IGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MK
CkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWws
IGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDth
PWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhh
cm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5Cgpicm9rZW4tam9iIGJ1aWxkLWFybTY0LXB2b3Bz
IGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWFybWhmLXB2b3BzIGJyb2tlbgpicm9rZW4tam9iIGJ1
aWxkLWFybTY0IGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWkzODYteHNtIGJyb2tlbgpicm9rZW4t
am9iIGJ1aWxkLWkzODYtcHZvcHMgYnJva2VuCmJyb2tlbi1qb2IgYnVpbGQtYXJtaGYgYnJva2Vu
CmJyb2tlbi1qb2IgYnVpbGQtYW1kNjQgYnJva2VuCmJyb2tlbi1qb2IgYnVpbGQtYXJtNjQteHNt
IGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWFtZDY0LXhzbSBicm9rZW4KYnJva2VuLWpvYiBidWls
ZC1hbWQ2NC1wdm9wcyBicm9rZW4KYnJva2VuLWpvYiBidWlsZC1pMzg2IGJyb2tlbgpicm9rZW4t
c3RlcCBidWlsZC1pMzg2LXhzbSBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtaTM4
NiBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtYXJtNjQtcHZvcHMgaG9zdC1pbnN0
YWxsKDQpCmJyb2tlbi1zdGVwIGJ1aWxkLWFybWhmLXB2b3BzIGhvc3QtaW5zdGFsbCg0KQpicm9r
ZW4tc3RlcCBidWlsZC1hbWQ2NCBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtYW1k
NjQteHNtIGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCBidWlsZC1pMzg2LXB2b3BzIGhvc3Qt
aW5zdGFsbCg0KQpicm9rZW4tc3RlcCBidWlsZC1hcm02NC14c20gaG9zdC1pbnN0YWxsKDQpCmJy
b2tlbi1zdGVwIGJ1aWxkLWFtZDY0LXB2b3BzIGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCBi
dWlsZC1hcm02NCBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtYXJtaGYgaG9zdC1p
bnN0YWxsKDQpCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDQ1
ODkgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
