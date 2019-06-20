Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C84CFD9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 16:02:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdxba-00076x-9E; Thu, 20 Jun 2019 13:59:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ywvk=UT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hdxbY-00076n-3d
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 13:59:56 +0000
X-Inumbo-ID: ab904c2c-9363-11e9-b0cb-3f97f07a363d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab904c2c-9363-11e9-b0cb-3f97f07a363d;
 Thu, 20 Jun 2019 13:59:50 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hdxbQ-0002Lq-M9; Thu, 20 Jun 2019 13:59:48 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hdxbQ-0007nk-EL; Thu, 20 Jun 2019 13:59:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hdxbQ-0007D4-Dh; Thu, 20 Jun 2019 13:59:48 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-138015-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=4cc7ca905d882bd40d71348235decd5c1ce32626
X-Osstest-Versions-That: freebsd=d946d8f14c81df5c94524f0c759db84880bbcae8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jun 2019 13:59:48 +0000
Subject: [Xen-devel] [freebsd-master test] 138015: all pass - PUSHED
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

ZmxpZ2h0IDEzODAxNSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4MDE1LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNGNjN2NhOTA1ZDg4MmJkNDBkNzEz
NDgyMzVkZWNkNWMxY2UzMjYyNgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgZDk0NmQ4ZjE0YzgxZGY1Yzk0NTI0ZjBjNzU5ZGI4NDg4MGJiY2FlOAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM3OTAxICAyMDE5LTA2LTE3IDA5OjE5OjM0IFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzODAxNSAgMjAxOS0wNi0xOSAwOToyMjowNiBaICAgIDEgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGJkcmV3ZXJ5IDxiZHJld2VyeUBGcmVlQlNELm9yZz4K
ICBjZW0gPGNlbUBGcmVlQlNELm9yZz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZGVscGhpaiA8
ZGVscGhpakBGcmVlQlNELm9yZz4KICBlbWFzdGUgPGVtYXN0ZUBGcmVlQlNELm9yZz4KICBnamIg
PGdqYkBGcmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBtYXJraiA8bWFya2pA
RnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgbW0gPG1tQEZyZWVCU0Qub3Jn
PgogIHNjb3R0bCA8c2NvdHRsQEZyZWVCU0Qub3JnPgogIHNldmFuIDxzZXZhbkBGcmVlQlNELm9y
Zz4KICB0YWthd2F0YSA8dGFrYXdhdGFARnJlZUJTRC5vcmc+CiAgdm1hZmZpb25lIDx2bWFmZmlv
bmVARnJlZUJTRC5vcmc+CiAgemVjIDx6ZWNARnJlZUJTRC5vcmc+CiAgemVpc2luZyA8emVpc2lu
Z0BGcmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2Qg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
YW1kNjQteGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoK
TG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhl
c2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFp
bDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3Qu
Z2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBm
b3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDth
PXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94
ZW4vZ2l0L2ZyZWVic2QuZ2l0CiAgIGQ5NDZkOGYxNGM4Li40Y2M3Y2E5MDVkOCAgNGNjN2NhOTA1
ZDg4MmJkNDBkNzEzNDgyMzVkZWNkNWMxY2UzMjYyNiAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
