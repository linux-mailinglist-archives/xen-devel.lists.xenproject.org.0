Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CADB880B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 01:24:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB5j5-0004n6-Pa; Thu, 19 Sep 2019 23:20:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iRCF=XO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iB5j4-0004my-Gy
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 23:20:38 +0000
X-Inumbo-ID: 162fa7d6-db34-11e9-a337-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 162fa7d6-db34-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 23:20:37 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iB5j2-0003cG-Ha; Thu, 19 Sep 2019 23:20:36 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iB5j2-0007Sy-3U; Thu, 19 Sep 2019 23:20:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iB5j2-0000r7-1w; Thu, 19 Sep 2019 23:20:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141456-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:test-arm64-arm64-libvirt-qcow2:guest-start/debian.repeat:fail:regression
 libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=bc1e4389f5dfcde8944ec32dd9c4485ec3db2c96
X-Osstest-Versions-That: libvirt=522b3d2b24d0f7ac78dad442c990d4e34db0eaf2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Sep 2019 23:20:36 +0000
Subject: [Xen-devel] [libvirt test] 141456: regressions - FAIL
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

ZmxpZ2h0IDE0MTQ1NiBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDE0NTYvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAx
NSBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDE0MTQxNQoKVGVzdHMg
d2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYXJtaGYt
YXJtaGYtbGlidmlydCAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICBs
aWtlIDE0MTQxNQogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAxMyBzYXZlcmVzdG9yZS1z
dXBwb3J0LWNoZWNrICAgIGZhaWwgIGxpa2UgMTQxNDE1CiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZp
cnQteHNtIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MK
IHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXhzbSAgMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAg
ICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBt
aWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0
LWkzODYtbGlidmlydCAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAg
IG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1k
NjQteHNtIDExIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayBmYWlsIG5ldmVyIHBhc3MKIHRlc3QtYW1k
NjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMTEgbWlncmF0ZS1zdXBw
b3J0LWNoZWNrIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAx
MyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFy
bTY0LWFybTY0LWxpYnZpcnQteHNtIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAgZmFp
bCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydCAgICAgMTMgbWlncmF0ZS1z
dXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1s
aWJ2aXJ0ICAgICAxNCBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgICBuZXZlciBw
YXNzCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgMTIgbWlncmF0ZS1zdXBwb3J0LWNo
ZWNrICAgICAgICBmYWlsIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293
MiAxMyBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1h
bWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAxMiBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZh
aWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQgICAgIDEzIG1pZ3JhdGUt
c3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtaGYtYXJtaGYt
bGlidmlydC1yYXcgMTIgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIg
cGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAg
IGJjMWU0Mzg5ZjVkZmNkZTg5NDRlYzMyZGQ5YzQ0ODVlYzNkYjJjOTYKYmFzZWxpbmUgdmVyc2lv
bjoKIGxpYnZpcnQgICAgICAgICAgICAgIDUyMmIzZDJiMjRkMGY3YWM3OGRhZDQ0MmM5OTBkNGUz
NGRiMGVhZjIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0MTQxNSAgMjAxOS0wOS0xOCAwNTozNjo1
NyBaICAgIDEgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDE0NTYgIDIwMTktMDktMTkgMDQ6
MTk6MjEgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBKw6FuIFRvbWtvIDxqdG9ta29AcmVkaGF0LmNvbT4KICBO
aWtvbGF5IFNoaXJva292c2tpeSA8bnNoaXJva292c2tpeUB2aXJ0dW96em8uY29tPgogIFNoaSBM
ZWkgPHNoaV9sZWlAbWFzc2Nsb3Vkcy5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
cm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm02NCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFy
bWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0LWxpYnZpcnQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJt
aGYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQtcHZvcHMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1o
Zi1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2
bS1hbWQ2NC14c20gICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC1x
ZW11dS1kZWJpYW5odm0tYW1kNjQteHNtICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQt
YW1kNjQtbGlidmlydC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC14c20gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hcm02NC1h
cm02NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXBh
aXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkz
ODYtbGlidmlydC1wYWlyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmYWlsICAgIAogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtdmhk
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0
LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xv
Z3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0
Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5v
cmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3Nz
dGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIv
P3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hi
PW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVu
Yml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5n
LgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCmNvbW1pdCBiYzFlNDM4OWY1ZGZjZGU4OTQ0ZWMzMmRkOWM0NDg1ZWMzZGIyYzk2CkF1
dGhvcjogU2hpIExlaSA8c2hpX2xlaUBtYXNzY2xvdWRzLmNvbT4KRGF0ZTogICBXZWQgU2VwIDE4
IDEyOjE5OjQzIDIwMTkgKzA4MDAKCiAgICBtYWludDogVXNlIGZsYWtlOCB0byBjaGVjayBweXRo
b24gY29kZQogICAgCiAgICBSZXBsYWNlICdzY19wcm9oaWJpdF9zZW1pY29sb25fYXRfZW9sX2lu
X3B5dGhvbicgd2l0aCBnZW5lcmljICdzY19mbGFrZTgnIHJ1bGUKICAgIHRvIGNoZWNrIHB5dGhv
biBjb2RlIHN0eWxlLgogICAgCiAgICBOb3cgJ3NjX2ZsYWtlOCcganVzdCBjaGVjayB0aGUgZXJy
b3IgRTcwMzogJ3N0YXRlbWVudCBlbmRzIHdpdGggYSBzZW1pY29sb24nLgogICAgSW4gZnV0dXJl
LCB3ZSBjb3VsZCB1c2UgJy0tc2VsZWN0JyB0byBpbnRyb2R1Y2UgbW9yZSBydWxlcy4KICAgIAog
ICAgU2lnbmVkLW9mZi1ieTogU2hpIExlaSA8c2hpX2xlaUBtYXNzY2xvdWRzLmNvbT4KICAgIFJl
dmlld2VkLWJ5OiBKw6FuIFRvbWtvIDxqdG9ta29AcmVkaGF0LmNvbT4KICAgIFNpZ25lZC1vZmYt
Ynk6IErDoW4gVG9ta28gPGp0b21rb0ByZWRoYXQuY29tPgoKY29tbWl0IGNhYTFiNzExZThlODk0
NmRiZDIzNzIxNGZmOTE5YWRjZDljZTM1OTQKQXV0aG9yOiBKw6FuIFRvbWtvIDxqdG9ta29AcmVk
aGF0LmNvbT4KRGF0ZTogICBNb24gQXVnIDI2IDIyOjM4OjUxIDIwMTkgKzAyMDAKCiAgICBxZW11
QnVpbGRNZW1vcnlDZWxsQmFja2VuZFN0cjogcmVtb3ZlIHVzZWxlc3MgcmV0IHZhcmlhYmxlCiAg
ICAKICAgIFNpZ25lZC1vZmYtYnk6IErDoW4gVG9ta28gPGp0b21rb0ByZWRoYXQuY29tPgogICAg
UmV2aWV3ZWQtYnk6IENvbGUgUm9iaW5zb24gPGNyb2JpbnNvQHJlZGhhdC5jb20+Cgpjb21taXQg
ZGZlMGNlOTNmMjlmYzQ0NzBkZmY3MmNhNTQzODAzNGNjZjc0MWU1ZgpBdXRob3I6IErDoW4gVG9t
a28gPGp0b21rb0ByZWRoYXQuY29tPgpEYXRlOiAgIE1vbiBBdWcgMjYgMjI6Mzc6NDEgMjAxOSAr
MDIwMAoKICAgIHFlbXVCdWlsZE1lbW9yeUJhY2tlbmRQcm9wczogdXNlICdyYycgaW5zdGVhZCBv
ZiByZXQuCiAgICAKICAgIERvIG5vdCBvdmVyd3JpdGUgdGhlICdyZXQnIHZhbHVlIG1vcmUgdGhh
biBvbmNlLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBKw6FuIFRvbWtvIDxqdG9ta29AcmVkaGF0
LmNvbT4KICAgIFJldmlld2VkLWJ5OiBDb2xlIFJvYmluc29uIDxjcm9iaW5zb0ByZWRoYXQuY29t
PgoKY29tbWl0IDc3ZGUwZDM2ZGY0MzM0NGFjYmNhYmFmNWI5YjMwZTIwODljYzA4MTkKQXV0aG9y
OiBKw6FuIFRvbWtvIDxqdG9ta29AcmVkaGF0LmNvbT4KRGF0ZTogICBNb24gQXVnIDI2IDIyOjM2
OjMyIDIwMTkgKzAyMDAKCiAgICBxZW11QnVpbGRNZW1vcnlCYWNrZW5kUHJvcHM6IHJlbW92ZSB1
c2VsZXNzIGNsZWFudXAgbGFiZWwKICAgIAogICAgU2lnbmVkLW9mZi1ieTogSsOhbiBUb21rbyA8
anRvbWtvQHJlZGhhdC5jb20+CiAgICBSZXZpZXdlZC1ieTogQ29sZSBSb2JpbnNvbiA8Y3JvYmlu
c29AcmVkaGF0LmNvbT4KCmNvbW1pdCA2YmI4ZWRhZmQ5NjY2OGZiOGJhYjkwNTA2ZTM1Zjc0ODUx
NTk5ZDdmCkF1dGhvcjogSsOhbiBUb21rbyA8anRvbWtvQHJlZGhhdC5jb20+CkRhdGU6ICAgTW9u
IEF1ZyAyNiAyMjoyMzo1MCAyMDE5ICswMjAwCgogICAgcWVtdUJ1aWxkU291bmRDb21tYW5kTGlu
ZTogcmVkdWNlIHNjb3BlIG9mIGNvZGVjc3RyCiAgICAKICAgIENvcHkgdGhlIGRlY2xhcmF0aW9u
IGludG8gdGhlIHNtYWxsZXN0IGJsb2NrcyBpdCdzIHVzZWQgaW4KICAgIGFuZCBtYXJrIGl0IGFz
IFZJUl9BVVRPRlJFRS4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogSsOhbiBUb21rbyA8anRvbWtv
QHJlZGhhdC5jb20+CiAgICBSZXZpZXdlZC1ieTogQ29sZSBSb2JpbnNvbiA8Y3JvYmluc29AcmVk
aGF0LmNvbT4KCmNvbW1pdCBmOWI2NTBhODQ4NjMxZTIxNjE4MjJkMmVhYjlhMDgwMTc0ODU2YjE2
CkF1dGhvcjogSsOhbiBUb21rbyA8anRvbWtvQHJlZGhhdC5jb20+CkRhdGU6ICAgTW9uIEF1ZyAy
NiAyMjoyODoyNyAyMDE5ICswMjAwCgogICAgcWVtdUJ1aWxkSG9zdE5ldFN0cjogcmVtb3ZlIHVu
bmVjZXNzYXJ5IGNsZWFudXAgbGFiZWwKICAgIAogICAgU2lnbmVkLW9mZi1ieTogSsOhbiBUb21r
byA8anRvbWtvQHJlZGhhdC5jb20+CiAgICBSZXZpZXdlZC1ieTogQ29sZSBSb2JpbnNvbiA8Y3Jv
Ymluc29AcmVkaGF0LmNvbT4KCmNvbW1pdCAxYThlMDNmODg2NzM2N2E3MDg0ZDcyNjk0NzcwYmYy
MDRhNWFmM2RjCkF1dGhvcjogSsOhbiBUb21rbyA8anRvbWtvQHJlZGhhdC5jb20+CkRhdGU6ICAg
TW9uIEF1ZyAyNiAyMjoyMTo1NiAyMDE5ICswMjAwCgogICAgcWVtdUJ1aWxkSG9zdE5ldFN0cjog
cmVtb3ZlIHVudXNlZCAnZHJpdmVyJyBhcmd1bWVudAogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBK
w6FuIFRvbWtvIDxqdG9ta29AcmVkaGF0LmNvbT4KICAgIFJldmlld2VkLWJ5OiBDb2xlIFJvYmlu
c29uIDxjcm9iaW5zb0ByZWRoYXQuY29tPgoKY29tbWl0IDllYzNlYzMwYTZlODBiMmRiMmMxNmMz
NzdlYjBkYzRhMTlhZGJjMjYKQXV0aG9yOiBKw6FuIFRvbWtvIDxqdG9ta29AcmVkaGF0LmNvbT4K
RGF0ZTogICBNb24gQXVnIDI2IDIxOjU2OjQyIDIwMTkgKzAyMDAKCiAgICBxZW11QnVpbGRIb3N0
TmV0U3RyOiByZW1vdmUgdW51c2VkIGNmZwogICAgCiAgICBBcyBvZiBjb21taXQgMmQ4MGZiYjE0
ZGZmYTQ1ZmUzZmNkMmMzZjI5Y2U1NDg1N2JiNzY2YyB0aGlzIHZhcmlhYmxlCiAgICBpcyB1bnVz
ZWQuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IErDoW4gVG9ta28gPGp0b21rb0ByZWRoYXQuY29t
PgogICAgUmV2aWV3ZWQtYnk6IENvbGUgUm9iaW5zb24gPGNyb2JpbnNvQHJlZGhhdC5jb20+Cgpj
b21taXQgZTZmZDU4NjE5NzE1OTc0OTEyOTc3NzFmMzRkMmNiMTQ5YWY2ZmU2OQpBdXRob3I6IE5p
a29sYXkgU2hpcm9rb3Zza2l5IDxuc2hpcm9rb3Zza2l5QHZpcnR1b3p6by5jb20+CkRhdGU6ICAg
V2VkIFNlcCAxOCAwOTo1OTozMiAyMDE5ICswMzAwCgogICAgdno6IGJ1aWxkIGZpeCBmb3IgcGFz
c2luZyBxZW11Q2FwcyB0byB2aXJEb21haW5EZWZQYXJzZU5vZGUKICAgIAogICAgTWlzc2luZyBw
aWVjZSBmb3IgWzFdCiAgICAKICAgIFsxXTogNTc3YTFmOTg6IHFlbXU6IFBhc3MgY29ycmVjdCBx
ZW11Q2FwcyB0byB2aXJEb21haW5EZWZQYXJzZU5vZGUKICAgIAogICAgU2lnbmVkLW9mZi1ieTog
Tmlrb2xheSBTaGlyb2tvdnNraXkgPG5zaGlyb2tvdnNraXlAdmlydHVvenpvLmNvbT4KCmNvbW1p
dCAwOTkxYmFhMWMzMGMzYWI0YmQ4ZjAyNDU4NWIxODRhNmNiOGYxNzI4CkF1dGhvcjogTmlrb2xh
eSBTaGlyb2tvdnNraXkgPG5zaGlyb2tvdnNraXlAdmlydHVvenpvLmNvbT4KRGF0ZTogICBXZWQg
U2VwIDE4IDA5OjU3OjA4IDIwMTkgKzAzMDAKCiAgICB2ejogYnVpbGQgZml4IGZvciBwYXNzaW5n
IHFlbXVDYXBzIHRvIHZpckRvbWFpbkRldmljZURlZlBvc3RQYXJzZQogICAgCiAgICBNaXNzaW5n
IHBpZWNlIGZvciBbMV0uCiAgICAKICAgIFsxXSBiNDQ5YzI3MDQ6IHFlbXU6IFBhc3MgY29ycmVj
dCBxZW11Q2FwcyB0byB2aXJEb21haW5EZXZpY2VEZWZQb3N0UGFyc2UKICAgIAogICAgU2lnbmVk
LW9mZi1ieTogTmlrb2xheSBTaGlyb2tvdnNraXkgPG5zaGlyb2tvdnNraXlAdmlydHVvenpvLmNv
bT4KCmNvbW1pdCBjZDljYmVmZmU5NzRmNGZjZDRkODdiOGE4MWFmZGViMTQ4NWEyZWVhCkF1dGhv
cjogTmlrb2xheSBTaGlyb2tvdnNraXkgPG5zaGlyb2tvdnNraXlAdmlydHVvenpvLmNvbT4KRGF0
ZTogICBNb24gU2VwIDE2IDE2OjU1OjM2IDIwMTkgKzAzMDAKCiAgICB2aXJTdHJuY3B5OiBmaXgg
dG8gc3VjY2Vzc2Z1bGx5IGNvcHkgZW1wdHkgc3RyaW5nCiAgICAKICAgIEFmdGVyIFsxXSB3ZSBn
b3QgZmFpbHVyZSBvbiBhdHRlbXB0IHRvIGNvcHkgZW1wdHkgc3RyaW5nLgogICAgQmVmb3JlIHRo
ZSBwYXRjaCBlbXB0eSBzdHJpbmcgd2FzIGNvcGllZCBzdWNjZXNzZnVseS4KICAgIFJlc3RvcmUg
dGhlIG9yaWdpbmFsIGJlaGF2aW91ci4KICAgIAogICAgWzFdIDdkNzBhNjNiIHV0aWw6IEltcHJv
dmUgdmlyU3RybmNweSgpIGltcGxlbWVudGF0aW9uCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IE5p
a29sYXkgU2hpcm9rb3Zza2l5IDxuc2hpcm9rb3Zza2l5QHZpcnR1b3p6by5jb20+CiAgICBSZXZp
ZXdlZC1ieTogTWFydGluIEtsZXR6YW5kZXIgPG1rbGV0emFuQHJlZGhhdC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
