Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FE495045
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 23:57:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzpan-0005kB-Ty; Mon, 19 Aug 2019 21:53:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hiS5=WP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hzpam-0005k1-6d
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 21:53:32 +0000
X-Inumbo-ID: c7bdd724-c2cb-11e9-8bf0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7bdd724-c2cb-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 21:53:29 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hzpaj-0004Hi-C1; Mon, 19 Aug 2019 21:53:29 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hzpai-000139-UN; Mon, 19 Aug 2019 21:53:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hzpai-0005WJ-Tc; Mon, 19 Aug 2019 21:53:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140340-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:test-arm64-arm64-libvirt-qcow2:guest-start/debian.repeat:fail:regression
 libvirt:test-amd64-i386-libvirt-pair:leak-check/check/src_host:fail:heisenbug
 libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
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
X-Osstest-Versions-This: libvirt=b437b50bbcb063076906932dd782b1360709bdc9
X-Osstest-Versions-That: libvirt=086764748e1a6b9aaf968db68145e05837eae3bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Aug 2019 21:53:28 +0000
Subject: [Xen-devel] [libvirt test] 140340: regressions - FAIL
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

ZmxpZ2h0IDE0MDM0MCBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDAzNDAvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAx
NSBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDEzOTgyOQoKVGVzdHMg
d2hpY2ggYXJlIGZhaWxpbmcgaW50ZXJtaXR0ZW50bHkgKG5vdCBibG9ja2luZyk6CiB0ZXN0LWFt
ZDY0LWkzODYtbGlidmlydC1wYWlyIDI2IGxlYWstY2hlY2svY2hlY2svc3JjX2hvc3QgIGZhaWwg
cGFzcyBpbiAxNDAyNzcKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3Qg
YmxvY2tpbmc6CiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQgICAgIDE0IHNhdmVyZXN0b3JlLXN1
cHBvcnQtY2hlY2sgICAgZmFpbCAgbGlrZSAxMzk4MjkKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmly
dC1yYXcgMTMgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICBsaWtlIDEzOTgyOQog
dGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAg
ICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydCAgICAgIDEzIG1p
Z3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQt
YW1kNjQtbGlidmlydC14c20gMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAg
bmV2ZXIgcGFzcwogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAxMyBtaWdyYXRlLXN1cHBv
cnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZp
cnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAxMSBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgZmFp
bCBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1k
NjQteHNtIDExIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayBmYWlsIG5ldmVyIHBhc3MKIHRlc3QtYXJt
NjQtYXJtNjQtbGlidmlydC14c20gMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWls
ICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAxNCBzYXZlcmVzdG9y
ZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0LWxp
YnZpcnQgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBh
c3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydCAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1j
aGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXFjb3cy
IDEyIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCBuZXZlciBwYXNzCiB0ZXN0LWFy
bTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgMTMgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBm
YWlsIG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC12aGQgMTIgbWlncmF0ZS1z
dXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1hcm1oZi1s
aWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBw
YXNzCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQtcmF3IDEyIG1pZ3JhdGUtc3VwcG9ydC1jaGVj
ayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6
CiBsaWJ2aXJ0ICAgICAgICAgICAgICBiNDM3YjUwYmJjYjA2MzA3NjkwNjkzMmRkNzgyYjEzNjA3
MDliZGM5CmJhc2VsaW5lIHZlcnNpb246CiBsaWJ2aXJ0ICAgICAgICAgICAgICAwODY3NjQ3NDhl
MWE2YjlhYWY5NjhkYjY4MTQ1ZTA1ODM3ZWFlM2JkCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzk4
MjkgIDIwMTktMDgtMDggMDQ6MTk6MDIgWiAgIDExIGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAg
MTM5ODUzICAyMDE5LTA4LTA5IDA0OjI0OjExIFogICAxMCBkYXlzICAgMTEgYXR0ZW1wdHMKVGVz
dGluZyBzYW1lIHNpbmNlICAgMTQwMjc3ICAyMDE5LTA4LTE4IDA0OjE5OjQwIFogICAgMSBkYXlz
ICAgIDIgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRl
c3Q6CiAgQW5kcmVhIEJvbG9nbmFuaSA8YWJvbG9nbmFAcmVkaGF0LmNvbT4KICBEYW5pZWwgSGVu
cmlxdWUgQmFyYm96YSA8ZGFuaWVsaGI0MTNAZ21haWwuY29tPgogIERhbmllbCBQLiBCZXJyYW5n
w6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+CiAgRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+
CiAgSGFuIEhhbiA8aGhhbkByZWRoYXQuY29tPgogIEhlIFhpbiA8aGV4aW4xNUBiYWlkdS5jb20+
CiAgaGV4aW4gPGhleGluMTVAYmFpZHUuY29tPgogIElsaWFzIFN0YW1hdGlzIDxzdGFtYXRpcy5p
bGlhc3NAZ21haWwuY29tPgogIEppcmkgRGVuZW1hcmsgPGpkZW5lbWFyQHJlZGhhdC5jb20+CiAg
SsOhbiBUb21rbyA8anRvbWtvQHJlZGhhdC5jb20+CiAgTGFpbmUgU3R1bXAgPGxhaW5lQHJlZGhh
dC5jb20+CiAgTGl1IFFpIDxsaXVxaTE2QGJhaWR1LmNvbT4KICBNYXJjLUFuZHLDqSBMdXJlYXUg
PG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4KICBNYXhpd2VsbCBTLiBHYXJjaWEgPG1heGl3
ZWxsQGxpbnV4LmlibS5jb20+CiAgTWVubm8gTGFnZW1hbiA8bWVubm8ubGFnZW1hbkBvcmFjbGUu
Y29tPgogIE1pY2hhbCBQcml2b3puaWsgPG1wcml2b3puQHJlZGhhdC5jb20+CiAgUGFvbG8gQm9u
emluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KICBQZXRlciBLcmVtcGEgPHBrcmVtcGFAcmVkaGF0
LmNvbT4KICBSb21hbiBCb2xzaGFrb3YgPHIuYm9sc2hha292QHlhZHJvLmNvbT4KICBXaW0gdGVu
IEhhdmUgPHdpbS50ZW4uaGF2ZUBvcmFjbGUuY29tPgogIFpoYW5nIFl1IDx6aGFuZ3l1MzFAYmFp
ZHUuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhz
bSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
YnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1hcm02NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmLWxpYnZpcnQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2
aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3Bz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRl
c3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1kNjQteHNtICAgICAgICAg
ICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0
LXhzbSAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQteHNtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQt
bGlidmlydC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVz
dC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hcm1oZi1hcm1oZi1s
aWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0
LWFtZDY0LWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1wYWlyICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcGFpciAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFybTY0LWFybTY0LWxp
YnZpcnQtcWNvdzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3Qt
YXJtaGYtYXJtaGYtbGlidmlydC1yYXcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9t
ZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQK
ICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhw
bGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMg
YXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9Ymxv
YjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVz
cyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/
cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7
IGl0IHdvdWxkIGJlIDI1NjMgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
