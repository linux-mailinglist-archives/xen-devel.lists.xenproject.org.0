Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6117D6EE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 00:02:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jB4tE-0001Zu-6K; Sun, 08 Mar 2020 22:59:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YRQZ=4Z=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jB4tD-0001Zp-3g
 for xen-devel@lists.xenproject.org; Sun, 08 Mar 2020 22:59:19 +0000
X-Inumbo-ID: 70745b1e-6190-11ea-b52f-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70745b1e-6190-11ea-b52f-bc764e2007e4;
 Sun, 08 Mar 2020 22:59:18 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jB4tB-0000Lp-JM; Sun, 08 Mar 2020 22:59:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jB4tB-0003Jb-7s; Sun, 08 Mar 2020 22:59:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jB4tB-0000ub-7I; Sun, 08 Mar 2020 22:59:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-148226-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-xsm:xen-build:fail:regression
 ovmf:build-i386:xen-build:fail:regression
 ovmf:build-amd64-xsm:xen-build:fail:regression
 ovmf:build-amd64:xen-build:fail:regression
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=80681884319d7ad45987348d30bae60cd3a43afb
X-Osstest-Versions-That: ovmf=3b9cd714542a8744252d973e1f163222a9f21b9e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Mar 2020 22:59:17 +0000
Subject: [Xen-devel] [ovmf test] 148226: regressions - FAIL
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

ZmxpZ2h0IDE0ODIyNiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDgyMjYvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgIDYgeGVu
LWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0ODExNAogYnVpbGQtaTM4NiAg
ICAgICAgICAgICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTQ4MTE0CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAg
ICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDgxMTQKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAg
ICAgICAgIDYgeGVuLWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0ODExNAoK
VGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIGJ1aWxk
LWkzODYtbGlidmlydCAgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBi
bG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgMSBidWls
ZC1jaGVjaygxKSAgICAgICAgICAgICBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1pMzg2LXhsLXFl
bXV1LW92bWYtYW1kNjQgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgIGJsb2NrZWQgbi9h
CiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAg
ICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAg
ICAgICAgICAgICAgICAgODA2ODE4ODQzMTlkN2FkNDU5ODczNDhkMzBiYWU2MGNkM2E0M2FmYgpi
YXNlbGluZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgM2I5Y2Q3MTQ1NDJhODc0NDI1
MmQ5NzNlMWYxNjMyMjJhOWYyMWI5ZQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ4MTE0ICAyMDIw
LTAzLTA1IDA3OjUyOjEyIFogICAgMyBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0ODE1NyAg
MjAyMC0wMy0wNiAwNDoxMzo0NCBaICAgIDIgZGF5cyAgICAyIGF0dGVtcHRzClRlc3Rpbmcgc2Ft
ZSBzaW5jZSAgIDE0ODIyNiAgMjAyMC0wMy0wNyAxMzo1NDoxOSBaICAgIDEgZGF5cyAgICAxIGF0
dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFu
ZHJlaSBXYXJrZW50aW4gPGF3YXJrZW50aW5Adm13YXJlLmNvbT4KICBBcmQgQmllc2hldXZlbCA8
YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQu
Y29tPgogIFBldGUgQmF0YXJkIDxwZXRlQGFrZW8uaWU+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBi
dWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hbWQ2NC1saWJ2
aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIGJ1
aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBibG9ja2VkIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQt
eGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVz
dC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAg
IGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdl
cwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9s
b2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2Yg
dGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5l
bWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rl
c3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBi
ZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0Lmdp
dDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJl
IDU3MyBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
