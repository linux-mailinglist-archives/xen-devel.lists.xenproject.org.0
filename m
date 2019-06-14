Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168654637C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 17:57:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hboXx-0008Qh-8W; Fri, 14 Jun 2019 15:55:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h4uC=UN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hboXv-0008QY-GL
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:55:19 +0000
X-Inumbo-ID: ce240d08-8ebc-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ce240d08-8ebc-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 15:55:17 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hboXt-0002un-8I; Fri, 14 Jun 2019 15:55:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hboXs-0000Mi-Sl; Fri, 14 Jun 2019 15:55:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hboXs-0006gk-S1; Fri, 14 Jun 2019 15:55:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-137684-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=fc7d997c35372126823c3b0acf7b67c45cbeea36
X-Osstest-Versions-That: ovmf=562688707145df9d695f3fc3cb9524f3881f0e2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Jun 2019 15:55:16 +0000
Subject: [Xen-devel] [ovmf test] 137684: all pass - PUSHED
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

ZmxpZ2h0IDEzNzY4NCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzc2ODQvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICBmYzdkOTk3YzM1MzcyMTI2ODIzYzNiMGFjZjdiNjdj
NDVjYmVlYTM2CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICA1NjI2ODg3
MDcxNDVkZjlkNjk1ZjNmYzNjYjk1MjRmMzg4MWYwZTJjCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
Mzc1OTUgIDIwMTktMDYtMTEgMDE6MTE6MzggWiAgICAzIGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM3Njg0ICAyMDE5LTA2LTEyIDIyOjIwOjA3IFogICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQXJkIEJpZXNo
ZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CiAgQ2hhc2VsIENoaXUgPGNoYXNlbC5j
aGl1QGludGVsLmNvbT4KICBDaHUsIE1hZ2dpZSA8bWFnZ2llLmNodUBpbnRlbC5jb20+CiAgRGFu
ZGFuIEJpIDxkYW5kYW4uYmlAaW50ZWwuY29tPgogIEdhcnkgTGluIDxnbGluQHN1c2UuY29tPgog
IEhhbyBBIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAgS3J6eXN6dG9mIEtvY2ggPGtyenlzenRv
Zi5rb2NoQGFybS5jb20+CiAgTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KICBMZWlm
IExpbmRob2xtIDxsZWlmLmxpbmRob2xtQGxpbmFyby5vcmc+CiAgTWFnZ2llIENodSA8bWFnZ2ll
LmNodUBpbnRlbC5jb20+CiAgUGllcnJlIEdvbmRvaXMgPHBpZXJyZS5nb25kb2lzQGFybS5jb20+
CiAgUmF5IE5pIDxyYXkubmlAaW50ZWwuY29tPgogIFNhbWkgTXVqYXdhciA8c2FtaS5tdWphd2Fy
QGFybS5jb20+CiAgWW9uZ2hvbmcgWmh1IDx5b25naG9uZy56aHVAaW50ZWwuY29tPgogIFpodSwg
WW9uZ2hvbmcgPHlvbmdob25nLnpodUBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNt
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
ZS94ZW4vZ2l0L29zc3Rlc3Qvb3ZtZi5naXQKICAgNTYyNjg4NzA3MS4uZmM3ZDk5N2MzNSAgZmM3
ZDk5N2MzNTM3MjEyNjgyM2MzYjBhY2Y3YjY3YzQ1Y2JlZWEzNiAtPiB4ZW4tdGVzdGVkLW1hc3Rl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
