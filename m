Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B077269F3A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 00:55:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn9pP-0008KL-LQ; Mon, 15 Jul 2019 22:52:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Wlg=VM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hn9pO-0008KB-I0
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 22:52:14 +0000
X-Inumbo-ID: 2f7b5ddb-a753-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f7b5ddb-a753-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 22:52:13 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hn9pL-0001vt-6C; Mon, 15 Jul 2019 22:52:11 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hn9pK-0005XS-U8; Mon, 15 Jul 2019 22:52:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hn9pK-0005hJ-QW; Mon, 15 Jul 2019 22:52:10 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139016-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=163feb2e45cd088e65da1ff395dc3293065a4603
X-Osstest-Versions-That: freebsd=5c4a9b0e32c1f9c47d5b687d6036bb03c3cc071c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jul 2019 22:52:10 +0000
Subject: [Xen-devel] [freebsd-master test] 139016: all pass - PUSHED
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

ZmxpZ2h0IDEzOTAxNiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5MDE2LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMTYzZmViMmU0NWNkMDg4ZTY1ZGEx
ZmYzOTVkYzMyOTMwNjVhNDYwMwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNWM0YTliMGUzMmMxZjljNDdkNWI2ODdkNjAzNmJiMDNjM2NjMDcxYwoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM4ODg2ICAyMDE5LTA3LTEwIDA5OjE5OjM4IFogICAgNSBkYXlzCkZhaWxpbmcg
c2luY2UgICAgICAgIDEzODkyMSAgMjAxOS0wNy0xMiAwOToxOTozMiBaICAgIDMgZGF5cyAgICAy
IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzOTAxNiAgMjAxOS0wNy0xNSAwOToxOTo1
NyBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlz
aW9ucyB1bmRlciB0ZXN0OgogIGFlIDxhZUBGcmVlQlNELm9yZz4KICBhbGMgPGFsY0BGcmVlQlNE
Lm9yZz4KICBhdmcgPGF2Z0BGcmVlQlNELm9yZz4KICBjaHVjayA8Y2h1Y2tARnJlZUJTRC5vcmc+
CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGRpbSA8ZGltQEZyZWVCU0Qub3JnPgogIGRvdWdtIDxk
b3VnbUBGcmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVl
QlNELm9yZz4KICBqaGliYml0cyA8amhpYmJpdHNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJl
ZUJTRC5vcmc+CiAgbHVwb3JsIDxsdXBvcmxARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZy
ZWVCU0Qub3JnPgogIG5wIDxucEBGcmVlQlNELm9yZz4KICBwaGlsaXAgPHBoaWxpcEBGcmVlQlNE
Lm9yZz4KICBwaGsgPHBoa0BGcmVlQlNELm9yZz4KICBycnMgPHJyc0BGcmVlQlNELm9yZz4KICBz
Y290dGwgPHNjb3R0bEBGcmVlQlNELm9yZz4KICBzZWFuYyA8c2VhbmNARnJlZUJTRC5vcmc+CiAg
c2pnIDxzamdARnJlZUJTRC5vcmc+CiAgdGlqbCA8dGlqbEBGcmVlQlNELm9yZz4KICB0dWV4ZW4g
PHR1ZXhlbkBGcmVlQlNELm9yZz4KICB2bWFmZmlvbmUgPHZtYWZmaW9uZUBGcmVlQlNELm9yZz4K
CmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQteGVuLWZyZWVi
c2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNn
LXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAv
aG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZp
bGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5k
IG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJF
QURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0
cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNo
aW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L2ZyZWVic2Qu
Z2l0CiAgIDVjNGE5YjBlMzJjLi4xNjNmZWIyZTQ1YyAgMTYzZmViMmU0NWNkMDg4ZTY1ZGExZmYz
OTVkYzMyOTMwNjVhNDYwMyAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
