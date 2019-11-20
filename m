Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF72F1038CA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 12:34:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXODN-00022h-I7; Wed, 20 Nov 2019 11:32:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DOry=ZM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iXODL-00022Z-UF
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 11:32:03 +0000
X-Inumbo-ID: 5c681564-0b89-11ea-a310-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c681564-0b89-11ea-a310-12813bfff9fa;
 Wed, 20 Nov 2019 11:31:57 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iXODF-0003CJ-Dm; Wed, 20 Nov 2019 11:31:57 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iXODF-00045N-6f; Wed, 20 Nov 2019 11:31:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iXODF-0004YS-5z; Wed, 20 Nov 2019 11:31:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-144214-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=7607174192166dd5d2d6913fc2fdb8ce539cd3c9
X-Osstest-Versions-That: ovmf=0b9ad0bc030bbd79073a26fc9b3527ff9128b9da
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Nov 2019 11:31:57 +0000
Subject: [Xen-devel] [ovmf test] 144214: all pass - PUSHED
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

ZmxpZ2h0IDE0NDIxNCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQyMTQvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICA3NjA3MTc0MTkyMTY2ZGQ1ZDJkNjkxM2ZjMmZkYjhj
ZTUzOWNkM2M5CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICAwYjlhZDBi
YzAzMGJiZDc5MDczYTI2ZmM5YjM1MjdmZjkxMjhiOWRhCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
NDQxNTEgIDIwMTktMTEtMTUgMTE6MjQ6MzcgWiAgICA1IGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTQ0MjE0ICAyMDE5LTExLTIwIDAzOjA5OjAzIFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgSGFvIEEgV3Ug
PGhhby5hLnd1QGludGVsLmNvbT4KICBSYXkgTmkgPHJheS5uaUBpbnRlbC5jb20+CiAgU2VhbiBC
cm9nYW4gPHNlYW4uYnJvZ2FuQG1pY3Jvc29mdC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2
aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQt
eGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVz
dC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdl
cwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9s
b2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2Yg
dGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5l
bWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rl
c3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBi
ZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0Lmdp
dDthPXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9t
ZS94ZW4vZ2l0L29zc3Rlc3Qvb3ZtZi5naXQKICAgMGI5YWQwYmMwMy4uNzYwNzE3NDE5MiAgNzYw
NzE3NDE5MjE2NmRkNWQyZDY5MTNmYzJmZGI4Y2U1MzljZDNjOSAtPiB4ZW4tdGVzdGVkLW1hc3Rl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
