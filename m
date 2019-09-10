Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A4AF2AD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 23:46:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7nua-0001cy-6p; Tue, 10 Sep 2019 21:42:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rcue=XF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i7nuY-0001cp-2y
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 21:42:54 +0000
X-Inumbo-ID: ee7cca24-d413-11e9-978d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee7cca24-d413-11e9-978d-bc764e2007e4;
 Tue, 10 Sep 2019 21:42:48 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7nuR-00016k-Gv; Tue, 10 Sep 2019 21:42:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7nuR-0003UC-6v; Tue, 10 Sep 2019 21:42:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i7nuR-0004gf-6I; Tue, 10 Sep 2019 21:42:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141189-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=000ab98574793b685e7a0f6a6e5032523d5c37c4
X-Osstest-Versions-That: ovmf=59b754c9f697d9627b0ccccd327d5132f0e1abb0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Sep 2019 21:42:47 +0000
Subject: [Xen-devel] [ovmf test] 141189: all pass - PUSHED
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

ZmxpZ2h0IDE0MTE4OSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDExODkvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICAwMDBhYjk4NTc0NzkzYjY4NWU3YTBmNmE2ZTUwMzI1
MjNkNWMzN2M0CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICA1OWI3NTRj
OWY2OTdkOTYyN2IwY2NjY2QzMjdkNTEzMmYwZTFhYmIwCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
NDEwOTEgIDIwMTktMDktMDYgMTM6Mzk6MjggWiAgICA0IGRheXMKRmFpbGluZyBzaW5jZSAgICAg
ICAgMTQxMTU4ICAyMDE5LTA5LTA5IDAzOjM4OjU3IFogICAgMSBkYXlzICAgIDUgYXR0ZW1wdHMK
VGVzdGluZyBzYW1lIHNpbmNlICAgMTQxMTgwICAyMDE5LTA5LTEwIDEzOjI5OjM3IFogICAgMCBk
YXlzICAgIDIgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVy
IHRlc3Q6CiAgQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgogIEZhbiwgWmhpanVYIDx6
aGlqdXguZmFuQGludGVsLmNvbT4KICBGZW5nLCBCb2IgQyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+
CiAgTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgUmF5IE5pIDxyYXkubmlAaW50
ZWwuY29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQt
YW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
bWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1k
NjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9s
b2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAg
IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFu
YXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtm
PVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBj
b2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1v
c3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVu
Lm9yZzovaG9tZS94ZW4vZ2l0L29zc3Rlc3Qvb3ZtZi5naXQKICAgNTliNzU0YzlmNi4uMDAwYWI5
ODU3NCAgMDAwYWI5ODU3NDc5M2I2ODVlN2EwZjZhNmU1MDMyNTIzZDVjMzdjNCAtPiB4ZW4tdGVz
dGVkLW1hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
