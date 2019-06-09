Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C13A3F1
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jun 2019 07:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZqAq-0006Py-NV; Sun, 09 Jun 2019 05:15:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8b0I=UI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hZqAp-0006Po-8a
 for xen-devel@lists.xenproject.org; Sun, 09 Jun 2019 05:15:19 +0000
X-Inumbo-ID: 8fa35d20-8a75-11e9-8e79-17a7e6d8c416
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fa35d20-8a75-11e9-8e79-17a7e6d8c416;
 Sun, 09 Jun 2019 05:15:13 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hZqAj-0003ij-5d; Sun, 09 Jun 2019 05:15:13 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hZqAi-00007q-TP; Sun, 09 Jun 2019 05:15:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hZqAi-0002oA-Sj; Sun, 09 Jun 2019 05:15:12 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-137443-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=fe0c2770a72af3a34f79c84676b7bf0c97090bda
X-Osstest-Versions-That: ovmf=b8993a34ae0069080138536249dc6a72bbd7b696
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 09 Jun 2019 05:15:12 +0000
Subject: [Xen-devel] [ovmf test] 137443: all pass - PUSHED
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

ZmxpZ2h0IDEzNzQ0MyBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzc0NDMvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICBmZTBjMjc3MGE3MmFmM2EzNGY3OWM4NDY3NmI3YmYw
Yzk3MDkwYmRhCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBiODk5M2Ez
NGFlMDA2OTA4MDEzODUzNjI0OWRjNmE3MmJiZDdiNjk2CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzczNzQgIDIwMTktMDYtMDUgMTc6MTg6MTggWiAgICAzIGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM3NDQzICAyMDE5LTA2LTA3IDEyOjIwOjQzIFogICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQXJkIEJpZXNo
ZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CiAgSmlhbiBKIFdhbmcgPGppYW4uai53
YW5nQGludGVsLmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgogIExpbWlu
ZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogIE1hcmMgQ2hlbiA8bWFyYy53LmNoZW5AaW50
ZWwuY29tPgogIE1hcmMgVyBDaGVuIDxtYXJjLncuY2hlbkBpbnRlbC5jb20+CiAgU3RhciBaZW5n
IDxzdGFyLnplbmdAaW50ZWwuY29tPgogIFdhbmcsIEppYW4gSiA8amlhbi5qLndhbmdAaW50ZWwu
Y29tPgogIFhpYW95dSBMdSA8eGlhb3l1eC5sdUBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1k
NjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2
NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dz
L2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0
dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRp
b24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJF
QURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2Rl
IGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0
ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9y
ZzovaG9tZS94ZW4vZ2l0L29zc3Rlc3Qvb3ZtZi5naXQKICAgYjg5OTNhMzRhZS4uZmUwYzI3NzBh
NyAgZmUwYzI3NzBhNzJhZjNhMzRmNzljODQ2NzZiN2JmMGM5NzA5MGJkYSAtPiB4ZW4tdGVzdGVk
LW1hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
