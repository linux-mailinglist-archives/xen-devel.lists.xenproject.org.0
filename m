Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB9B107526
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 16:47:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYB5H-0000qJ-Hz; Fri, 22 Nov 2019 15:42:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A48v=ZO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iYB5G-0000qE-05
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 15:42:58 +0000
X-Inumbo-ID: c07ff100-0d3e-11ea-9631-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c07ff100-0d3e-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 15:42:55 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iYB5D-0002WA-6O; Fri, 22 Nov 2019 15:42:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iYB5C-0003Oj-Pk; Fri, 22 Nov 2019 15:42:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iYB5C-0001fH-P6; Fri, 22 Nov 2019 15:42:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-144244-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: libvirt:test-arm64-arm64-libvirt-qcow2:guest-start/debian.repeat:fail:regression
 libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=d6064e2759a24e0802f363e3a810dc5a7d7ebb15
X-Osstest-Versions-That: libvirt=5e939cea896fb3373a6f68f86e325c657429ed3d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Nov 2019 15:42:54 +0000
Subject: [Xen-devel] [libvirt test] 144244: regressions - FAIL
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

ZmxpZ2h0IDE0NDI0NCBsaWJ2aXJ0IHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQyNDQvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293MiAx
NSBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDE0NDIzMwoKVGVzdHMg
d2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYXJtaGYt
YXJtaGYtbGlidmlydCAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICBs
aWtlIDE0NDIzMwogdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAxMyBzYXZlcmVzdG9yZS1z
dXBwb3J0LWNoZWNrICAgIGZhaWwgIGxpa2UgMTQ0MjMzCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZp
cnQgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MK
IHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC14c20gMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAg
ICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAxMyBt
aWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0
LWkzODYtbGlidmlydCAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAg
IG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2
NC14c20gMTEgbWlncmF0ZS1zdXBwb3J0LWNoZWNrIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1hbWQ2
NC1hbWQ2NC1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMTEgbWlncmF0ZS1zdXBw
b3J0LWNoZWNrIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAx
MyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFy
bTY0LWFybTY0LWxpYnZpcnQgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFp
bCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gMTQgc2F2ZXJlc3Rv
cmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC1s
aWJ2aXJ0ICAgICAxNCBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgICBuZXZlciBw
YXNzCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQtcWNvdzIgMTIgbWlncmF0ZS1zdXBwb3J0LWNo
ZWNrICAgICAgICBmYWlsIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC1xY293
MiAxMyBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1h
bWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAxMiBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZh
aWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQgICAgIDEzIG1pZ3JhdGUt
c3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtaGYtYXJtaGYt
bGlidmlydC1yYXcgMTIgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIg
cGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGxpYnZpcnQgICAgICAgICAgICAg
IGQ2MDY0ZTI3NTlhMjRlMDgwMmYzNjNlM2E4MTBkYzVhN2Q3ZWJiMTUKYmFzZWxpbmUgdmVyc2lv
bjoKIGxpYnZpcnQgICAgICAgICAgICAgIDVlOTM5Y2VhODk2ZmIzMzczYTZmNjhmODZlMzI1YzY1
NzQyOWVkM2QKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0NDIzMyAgMjAxOS0xMS0yMSAwNDoxODo1
MyBaICAgIDEgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDQyNDQgIDIwMTktMTEtMjIgMDQ6
MTg6NDggWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBDaHJpc3RpYW4gRWhyaGFyZHQgPGNocmlzdGlhbi5laHJo
YXJkdEBjYW5vbmljYWwuY29tPgogIEVyaWsgU2t1bHRldHkgPGVza3VsdGV0QHJlZGhhdC5jb20+
CiAgSmFtaWUgU3RyYW5kYm9nZSA8amFtaWVAY2Fub25pY2FsLmNvbT4KICBKw6FuIFRvbWtvIDxq
dG9ta29AcmVkaGF0LmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0LXhzbSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtNjQtbGlidmlydCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1oZi1saWJ2aXJ0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm02NC1wdm9wcyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmLXB2b3BzICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
aTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhz
bSAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXFlbXV1LWRlYmlh
bmh2bS1hbWQ2NC14c20gICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2
aXJ0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFy
bTY0LWFybTY0LWxpYnZpcnQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXhzbSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybTY0LWFybTY0LWxpYnZp
cnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJt
aGYtYXJtaGYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcGFpciAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0
LXBhaXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hcm02
NC1hcm02NC1saWJ2aXJ0LXFjb3cyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwg
ICAgCiB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQtcmF3ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC12aGQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9u
IG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmlt
YWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZh
aWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdl
bmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0
LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpU
ZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KY29t
bWl0IGQ2MDY0ZTI3NTlhMjRlMDgwMmYzNjNlM2E4MTBkYzVhN2Q3ZWJiMTUKQXV0aG9yOiBFcmlr
IFNrdWx0ZXR5IDxlc2t1bHRldEByZWRoYXQuY29tPgpEYXRlOiAgIE1vbiBOb3YgMTggMTI6MDQ6
MTYgMjAxOSArMDEwMAoKICAgIGxpYnZpcnQtPG1vZHVsZT46IENoZWNrIGNhbGxlci1wcm92aWRl
ZCBidWZmZXJzIHRvIGJlIE5VTEwgd2l0aCBzaXplID4gMAogICAgCiAgICBQcmUtR2xpYiBlcmEg
d2hpY2ggdXNlZCBtYWxsb2MgYWxsb3dlZCB0aGUgc2l6ZSBvZiB0aGUgY2xpZW50LXNpZGUKICAg
IGJ1ZmZlcnMgdG8gYmUgZGVjbGFyZWQgYXMgMCwgYmVjYXVzZSBtYWxsb2MgZG9jdW1lbnRzIHRo
YXQgaXQgY2FuIGVpdGhlcgogICAgcmV0dXJuIDAgb3IgYSB1bmlxdWUgcG9pbnRlciBvbiAwIHNp
emUgYWxsb2NhdGlvbnMuCiAgICBXaXRoIGdsaWIgdGhpcyBkb2Vzbid0IHdvcmsgYW55bW9yZSwg
YmVjYXVzZSBnbGliIGRvY3VtZW50cyB0aGF0IGZvcgogICAgc3VjaCBhbGxvY2F0aW9uIHJlcXVl
c3RzIE5VTEwgaXMgYWx3YXlzIHJldHVybmVkIHdoaWNoIHJlc3VsdHMgaW4gYW4KICAgIGVycm9y
IGluIG91ciBwdWJsaWMgQVBJIGNoZWNrcyBzZXJ2ZXItc2lkZS4KICAgIFRoaXMgcGF0Y2ggY29t
cGxlbWVudHMgdGhlIGZpeCBpbiB0aGUgUlBDIGxheWVyIGJ5IGV4cGxpY2l0bHkgZXJyb3JpbmcK
ICAgIG91dCBvbiB0aGUgZm9sbG93aW5nIGNvbWJpbmF0aW9uIG9mIGFyZ3MgdXNlZCBieSBvdXIg
bGVnYWN5IEFQSXMgKHRoZWlyCiAgICBtb2RlciBlcXVpdmFsZW50cyBkb24ndCBzdWZmZXIgZnJv
bSB0aGlzKToKICAgIAogICAgZnVuY3Rpb24oY2FsbGVyLWFsbG9jYXRlZC1hcnJheSwgc2l6ZSwg
Li4uKSB7CiAgICAgICAgaWYgKCFjYWxsZXItYWxsb2NhdGVkLWFycmF5ICYmIHNpemUgPiAwKQog
ICAgICAgICAgICByZXR1cm4gZXJyb3I7CiAgICB9CiAgICAKICAgIHRyZWF0aW5nIGV2ZXJ5dGhp
bmcgZWxzZSBhcyBhIHZhbGlkIGlucHV0IGFuZCBwb3RlbnRpYWxseSBsZXQgdGhhdCBmYWlsCiAg
ICBvbiB0aGUgc2VydmVyLXNpZGUgcmF0aGVyIHRoYW4gY2xpZW50LXNpZGUuCiAgICAKICAgIGh0
dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTc3Mjg0MgogICAgCiAg
ICBTaWduZWQtb2ZmLWJ5OiBFcmlrIFNrdWx0ZXR5IDxlc2t1bHRldEByZWRoYXQuY29tPgogICAg
UmV2aWV3ZWQtYnk6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+Cgpj
b21taXQgYmYyOTg4MjM1Y2YwOWM0MDdmMzk3OTFkNDQ2YjFlY2I5OWJlNmM1MQpBdXRob3I6IEVy
aWsgU2t1bHRldHkgPGVza3VsdGV0QHJlZGhhdC5jb20+CkRhdGU6ICAgTW9uIE5vdiAxOCAxMDoz
MDoyMCAyMDE5ICswMTAwCgogICAgcnBjOiBnZW5kaXNwYXRjaDogRml4IGEgY291cGxlIG9mIHBs
YWNlcyBhZGRpbmcgdHJhaWxpbmcgc3BhY2VzCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IEVyaWsg
U2t1bHRldHkgPGVza3VsdGV0QHJlZGhhdC5jb20+CiAgICBSZXZpZXdlZC1ieTogRGFuaWVsIFAu
IEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KCmNvbW1pdCA1ZTA2N2JhNGUxNjM1MDI3
MmU2YTljMzM5NDBiNTZjYzZlYjlkZDlhCkF1dGhvcjogSsOhbiBUb21rbyA8anRvbWtvQHJlZGhh
dC5jb20+CkRhdGU6ICAgTW9uIE5vdiAxMSAxMDoyMTowMyAyMDE5ICswMTAwCgogICAgY29uZjog
cmVtb3ZlIE5VTEwgY2hlY2sgZnJvbSB2aXJEb21haW5RZW11TW9uaXRvckV2ZW50TmV3CiAgICAK
ICAgIFRoZSBxZW11X2RvbWFpbl9tb25pdG9yX2V2ZW50X21zZyBzdHJ1Y3QgaW4gcWVtdV9wcm90
b2NvbC54CiAgICBkZWZpbmVzIGV2ZW50IGFzIGEgbm9ubnVsbF9zdHJpbmcgYW5kIHFlbXVNb25p
dG9ySlNPTklPUHJvY2Vzc0V2ZW50CiAgICBhbHNvIGVycm9ycyBvdXQgb24gYSBub24tTlVMTCBl
dmVudC4KICAgIAogICAgRHJvcCB0aGUgY2hlY2sgdG8gZml4IHRoZSBidWlsZCB3aXRoIHN0YXRp
YyBhbmFseXNpcy4KICAgIAogICAgVGhpcyBlc3NlbnRpYWxseSByZXZlcnRzIGNvbW1pdCBkMzQz
ZTgyMDNkMjQ4NjM1ZjVlN2EwZDg2ZGQwNzdmNzRkNDllM2FmCiAgICAKICAgIFNpZ25lZC1vZmYt
Ynk6IErDoW4gVG9ta28gPGp0b21rb0ByZWRoYXQuY29tPgogICAgUmV2aWV3ZWQtYnk6IE1pY2hh
bCBQcml2b3puaWsgPG1wcml2b3puQHJlZGhhdC5jb20+Cgpjb21taXQgNzYxMWExZWYwMDI0MjJj
NDM4YzJlMTZmYjJjZTBkMzAzNDI4MDI1MwpBdXRob3I6IENocmlzdGlhbiBFaHJoYXJkdCA8Y2hy
aXN0aWFuLmVocmhhcmR0QGNhbm9uaWNhbC5jb20+CkRhdGU6ICAgVHVlIE9jdCAyMiAxMjoxMzo0
MSAyMDE5ICswMjAwCgogICAgdmlydC1hYS1oZWxwZXI6IHRlc3RjYXNlIGZvciBzaG1lbSBkZXZp
Y2VzCiAgICAKICAgIEFkZGluZyBidWlsZCB0aW1lIHNlbGYgdGVzdHMgZm9yIGJhc2ljIChkZXBy
ZWNhdGVkKSwgZG9vcmJlbGwgYW5kIHBsYWluIG1vZGUuCiAgICAKICAgIFJldmlld2VkLWJ5OiBD
b2xlIFJvYmluc29uIDxjcm9iaW5zb0ByZWRoYXQuY29tPgogICAgU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEVocmhhcmR0IDxjaHJpc3RpYW4uZWhyaGFyZHRAY2Fub25pY2FsLmNvbT4KCmNvbW1p
dCAzNmFmZDFhNzhlZDhlMTNlMzNjZGY5NTRjNjYxOGMxNzhlZjc3N2ExCkF1dGhvcjogQ2hyaXN0
aWFuIEVocmhhcmR0IDxjaHJpc3RpYW4uZWhyaGFyZHRAY2Fub25pY2FsLmNvbT4KRGF0ZTogICBU
aHUgT2N0IDE3IDEyOjQ4OjEwIDIwMTkgKzAyMDAKCiAgICB2aXJ0LWFhLWhlbHBlcjogYWRkIHJ1
bGVzIGZvciBzaG1lbSBkZXZpY2VzCiAgICAKICAgIFNoYXJlZCBtZW1vcnkgZGV2aWNlcyBuZWVk
IHFlbXUgdG8gYmUgYWJsZSB0byBhY2Nlc3MgY2VydGFpbiBwYXRocwogICAgZWl0aGVyIGZvciB0
aGUgc2hhcmVkIG1lbW9yeSBkaXJlY3RseSAobW9zdGx5IGl2c2htZW0tcGxhaW4pIG9yIGZvciBh
CiAgICBzb2NrZXQgKG1vc3RseSBpdnNobWVtLWRvb3JiZWxsKS4KICAgIAogICAgQWRkIGxvZ2lj
IHRvIHZpcnQtYWEtaGVscGVyIHRvIHJlbmRlciB0aG9zZSBhcHBhcm1vciBydWxlcyBiYXNlZAog
ICAgb24gdGhlIGRvbWFpbiBjb25maWd1cmF0aW9uLgogICAgCiAgICBodHRwczovL2J1Z3ppbGxh
LnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE3NjE2NDUKICAgIAogICAgUmV2aWV3ZWQtYnk6
IENvbGUgUm9iaW5zb24gPGNyb2JpbnNvQHJlZGhhdC5jb20+CiAgICBBY2tlZC1ieTogSmFtaWUg
U3RyYW5kYm9nZSA8amFtaWVAY2Fub25pY2FsLmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBFaHJoYXJkdCA8Y2hyaXN0aWFuLmVocmhhcmR0QGNhbm9uaWNhbC5jb20+Cgpjb21taXQg
ZDUzZjRkMDJkMDMyZWMxNDM5MWI1MDUyZWMxNjUxMDVkZmMzMzhiNQpBdXRob3I6IENocmlzdGlh
biBFaHJoYXJkdCA8Y2hyaXN0aWFuLmVocmhhcmR0QGNhbm9uaWNhbC5jb20+CkRhdGU6ICAgV2Vk
IE9jdCAxNiAwOTozNToyNyAyMDE5ICswMjAwCgogICAgYXBwYXJtb3I6IGxldCBBcHBBcm1vclNl
dFNlY3VyaXR5SW1hZ2VMYWJlbCBhcHBlbmQgcnVsZXMKICAgIAogICAgVGhlcmUgYXJlIGN1cnJl
bnRseSBicm9rZW4gdXNlIGNhc2VzLCBlLmcuIHNuYXBzaG90dGluZyBtb3JlIHRoYW4gb25lIGRp
c2sgYXQKICAgIG9uY2UgbGlrZToKICAgICAkIHZpcnNoIHNuYXBzaG90LWNyZWF0ZS1hcyAtLWRv
bWFpbiBlb2FuIC0tZGlzay1vbmx5IC0tYXRvbWljCiAgICAgICAtLWRpc2tzcGVjIHZkYSxzbmFw
c2hvdD1ubyAgLS1kaXNrc3BlYyB2ZGIsc25hcHNob3Q9bm8KICAgICAgIC0tZGlza3NwZWMgdmRj
LGZpbGU9L3Rlc3QvZGlzazEuc25hcHNob3QxLnFjb3csc25hcHNob3Q9ZXh0ZXJuYWwKICAgICAg
IC0tZGlza3NwZWMgdmRkLGZpbGU9L3Rlc3QvZGlzazIuc25hcHNob3QxLnFjb3csc25hcHNob3Q9
ZXh0ZXJuYWwKICAgIFRoZSBjb21tYW5kIGFib3ZlIHdpbGwgaXRlcmF0ZSBmcm9tIHFlbXVEb21h
aW5TbmFwc2hvdENyZWF0ZURpc2tBY3RpdmUgYW5kCiAgICBldmVudHVhbGx5IGFkZCAvdGVzdC9k
aXNrMS5zbmFwc2hvdDEucWNvdyBmaXJzdCAoYXBwZWFycyBpbiB0aGUgcnVsZXMpCiAgICB0byB0
aGVuIGxhdGVyIGFkZCAvdGVzdC9kaXNrMi5zbmFwc2hvdDEucWNvdyBhbmQgd2hpbGUgZG9pbmcg
c28gdGhyb3dpbmcKICAgIGF3YXkgdGhlIGZvcm1lciBydWxlIGNhdXNpbmcgaXQgdG8gZmFpbC4K
ICAgIAogICAgQWxsIG90aGVyIGNhbGxzIHRvIChyZSlsb2FkX3Byb2ZpbGUgYWxyZWFkeSB1c2Ug
YXBwZW5kPXRydWUgd2hlbiBhZGRpbmcKICAgIHJ1bGVzIGFwcGVuZD1mYWxzZSBpcyBvbmx5IHVz
ZWQgd2hlbiByZXN0b3JpbmcgcnVsZXMgWzFdLgogICAgCiAgICBGaXggdGhpcyBieSBsZXR0aW5n
IEFwcEFybW9yU2V0U2VjdXJpdHlJbWFnZUxhYmVsIHVzZSBhcHBlbmQ9dHJ1ZSBhcyB3ZWxsLgog
ICAgCiAgICBTaW5jZSB0aGlzIGlzIHJlbW92aW5nIGEgKHVuaW50ZW50aW9uYWwpIHRyaWdnZXIg
dG8gcmV2b2tlIGFsbCBydWxlcwogICAgYXBwZW5kZWQgc28gZmFyIHdlIGFncmVlZCBvbiByZXZp
ZXcgdG8gZG8gc29tZSB0ZXN0cywgYnV0IGluIHRoZSB0ZXN0cwogICAgbm8gcnVsZXMgY2FtZSBi
YWNrIG9uOgogICAgLSBob3QtcGx1ZwogICAgLSBob3QtdW5wbHVnCiAgICAtIHNuYXBzaG90dGlu
ZwogICAgCiAgICBCdWdzOgogICAgaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvbGlidmlydC8r
YnVnLzE4NDU1MDYKICAgIGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/
aWQ9MTc0NjY4NAogICAgCiAgICBbMV06IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2xpYnZp
cnQvK2J1Zy8xODQ1NTA2L2NvbW1lbnRzLzEzCiAgICAKICAgIFJldmlld2VkLWJ5OiBDb2xlIFJv
Ymluc29uIDxjcm9iaW5zb0ByZWRoYXQuY29tPgogICAgQWNrZWQtYnk6IEphbWllIFN0cmFuZGJv
Z2UgPGphbWllQGNhbm9uaWNhbC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gRWhy
aGFyZHQgPGNocmlzdGlhbi5laHJoYXJkdEBjYW5vbmljYWwuY29tPgoKY29tbWl0IDk3MTRmMjcw
ZjFlOTRhNGI0NmEwNjZhNjIzYjJjZDIzOWZhNzBmYWYKQXV0aG9yOiBDaHJpc3RpYW4gRWhyaGFy
ZHQgPGNocmlzdGlhbi5laHJoYXJkdEBjYW5vbmljYWwuY29tPgpEYXRlOiAgIFdlZCBPY3QgMTYg
MDk6MzI6NTIgMjAxOSArMDIwMAoKICAgIGFwcGFybW9yOiByZWZhY3RvciBBcHBBcm1vclNldFNl
Y3VyaXR5SW1hZ2VMYWJlbAogICAgCiAgICBBIGxvdCBvZiB0aGUgY29kZSBpbiBBcHBBcm1vclNl
dFNlY3VyaXR5SW1hZ2VMYWJlbCBpcyBhIGR1cGxpY2F0ZSBvZgogICAgd2hhdCBpcyBpbiByZWxv
YWRfcHJvZmlsZSwgdGhpcyByZWZhY3RvcnMgQXBwQXJtb3JTZXRTZWN1cml0eUltYWdlTGFiZWwK
ICAgIHRvIHVzZSByZWxvYWRfcHJvZmlsZSBpbnN0ZWFkLgogICAgCiAgICBSZXZpZXdlZC1ieTog
Q29sZSBSb2JpbnNvbiA8Y3JvYmluc29AcmVkaGF0LmNvbT4KICAgIEFja2VkLWJ5OiBKYW1pZSBT
dHJhbmRib2dlIDxqYW1pZUBjYW5vbmljYWwuY29tPgogICAgU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEVocmhhcmR0IDxjaHJpc3RpYW4uZWhyaGFyZHRAY2Fub25pY2FsLmNvbT4KCmNvbW1pdCA3
MGNmMGFmN2JmMzRiNmMwZjNjMDA5ZWZjODM2Njc2N2RjZDNjMjdkCkF1dGhvcjogQ2hyaXN0aWFu
IEVocmhhcmR0IDxjaHJpc3RpYW4uZWhyaGFyZHRAY2Fub25pY2FsLmNvbT4KRGF0ZTogICBXZWQg
T2N0IDE2IDA5OjE1OjE0IDIwMTkgKzAyMDAKCiAgICBhcHBhcm1vcjogZHJvcCB1c2VsZXNzIGNh
bGwgdG8gZ2V0X3Byb2ZpbGVfbmFtZQogICAgCiAgICByZWxvYWRfcHJvZmlsZSBjYWxscyBnZXRf
cHJvZmlsZV9uYW1lIGZvciBubyBwYXJ0aWN1bGFyIGdhaW4sIGxldHMKICAgIHJlbW92ZSB0aGF0
IGNhbGwuIFRoZSBzdHJpbmcgaXNuJ3QgdXNlZCBpbiB0aGF0IGZ1bmN0aW9uIGxhdGVyIG9uCiAg
ICBhbmQgbm90IHJlZ2lzdGVyZWQvcGFzc2VkIGFueXdoZXJlLgogICAgCiAgICBJdCBjYW4gb25s
eSBmYWlsIGlmIGl0IGVpdGhlciBjYW4ndCBhbGxvY2F0ZSBvciBpZiB0aGUKICAgIHZpckRvbWFp
bkRlZlB0ciB3b3VsZCBoYXZlIG5vIHV1aWQgc2V0ICh3aGljaCBpc24ndCBhbGxvd2VkKS4KICAg
IAogICAgVGhlcmVieSB0aGUgb25seSAiY2hlY2siIGl0IHJlYWxseSBwcm92aWRlcyBpcyBpZiBp
dCBjYW4gYWxsb2NhdGUgdGhlCiAgICBzdHJpbmcgdG8gdGhlbiBmcmVlIGl0IGFnYWluLgogICAg
CiAgICBUaGlzIHdhcyBpbml0aWFsbHkgYWRkZWQgaW4gWzFdIHdoZW4gdGhlIGNvZGUgd2FzIHN0
aWxsIGluCiAgICBBcHBBcm1vclJlc3RvcmVTZWN1cml0eUltYWdlTGFiZWwgKGxhdGVyIG1vdmVk
KSBhbmQgZXZlbiBiYWNrIHRoZW4gaGFkCiAgICBubyBmdXJ0aGVyIGVmZmVjdCB0aGFuIGRlc2Ny
aWJlZCBhYm92ZS4KICAgIAogICAgWzFdOiBodHRwczovL2xpYnZpcnQub3JnL2dpdC8/cD1saWJ2
aXJ0LmdpdDthPWJsb2I7Zj1zcmMvc2VjdXJpdHkvc2VjdXJpdHlfYXBwYXJtb3IuYztoPTE2ZGUw
ZjI2ZjQxNjg5ZTBjNTA0ODExMjBkOWY4YTU5YmExZjQwNzM7aGI9YmJhZWNkNmE4ZjE1MzQ1YmM4
MjJhYjRiNzllYjA5NTU5ODZiYjJmZCNsNDg3CiAgICAKICAgIFJldmlld2VkLWJ5OiBDb2xlIFJv
Ymluc29uIDxjcm9iaW5zb0ByZWRoYXQuY29tPgogICAgQWNrZWQtYnk6IEphbWllIFN0cmFuZGJv
Z2UgPGphbWllQGNhbm9uaWNhbC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gRWhy
aGFyZHQgPGNocmlzdGlhbi5laHJoYXJkdEBjYW5vbmljYWwuY29tPgoKY29tbWl0IDlkMzhiY2U2
ODk1NTc5MjNjNzg2ZWU0YjM2NDU3ODMwYTE2NzgwMWMKQXV0aG9yOiBDaHJpc3RpYW4gRWhyaGFy
ZHQgPGNocmlzdGlhbi5laHJoYXJkdEBjYW5vbmljYWwuY29tPgpEYXRlOiAgIFdlZCBPY3QgMTYg
MDg6NDc6MzYgMjAxOSArMDIwMAoKICAgIHZpcnQtYWEtaGVscGVyOiBjbGFyaWZ5IGNvbW1hbmQg
bGluZSBvcHRpb25zCiAgICAKICAgIFdoaWxlIG9ubHkgdXNlZCBpbnRlcm5hbGx5IGZyb20gbGli
dmlydCB0aGUgb3B0aW9ucyBzdGlsbCBhcmUgbWlzbGVhZGluZwogICAgZW5vdWdoIHRvIGNhdXNl
IGlzc3VlcyBldmVyeSBub3cgYW5kIHRoZW4uCiAgICBHcm91cCBtb2Rlcywgb3B0aW9ucyBhbmQg
YW4gYWRkaW5nIGV4dHJhIGZpbGUgYW5kIGV4dGVuZCB0aGUgd29yZGluZyBvZgogICAgdGhlIGxh
dHRlciB3aGljaCBoYWQgdGhlIGJpZ2dlc3QgbGFjayBvZiBjbGFyaXR5LgogICAgQm90aCBhZGQg
YSBmaWxlIHRvIHRoZSBlbmQgb2YgdGhlIHJ1bGVzLCBidXQgb25lIHJlLWdlbmVyYXRlcyB0aGUK
ICAgIHJ1bGVzIGZyb20gWE1MIGFuZCB0aGUgb3RoZXIga2VlcHMgdGhlIGV4aXN0aW5nIHJ1bGVz
IGFzLWlzIG5vdAogICAgY29uc2lkZXJpbmcgdGhlIFhNTCBjb250ZW50LgogICAgCiAgICBSZXZp
ZXdlZC1ieTogQ29sZSBSb2JpbnNvbiA8Y3JvYmluc29AcmVkaGF0LmNvbT4KICAgIEFja2VkLWJ5
OiBKYW1pZSBTdHJhbmRib2dlIDxqYW1pZUBjYW5vbmljYWwuY29tPgogICAgU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEVocmhhcmR0IDxjaHJpc3RpYW4uZWhyaGFyZHRAY2Fub25pY2FsLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
