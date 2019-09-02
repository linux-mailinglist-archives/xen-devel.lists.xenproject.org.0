Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75EFA5CD5
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 21:53:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4sHy-0007i7-Nt; Mon, 02 Sep 2019 19:46:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xopv=W5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i4sHx-0007i2-R7
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 19:46:57 +0000
X-Inumbo-ID: 6a68c792-cdba-11e9-aea7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a68c792-cdba-11e9-aea7-12813bfff9fa;
 Mon, 02 Sep 2019 19:46:54 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i4sHq-0005Hs-Cp; Mon, 02 Sep 2019 19:46:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i4sHq-00022l-3h; Mon, 02 Sep 2019 19:46:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i4sHq-0001dP-2g; Mon, 02 Sep 2019 19:46:50 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-140943-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=f2d1759c50fb28fa0e2e1bd65e7bd49ee7ed4693
X-Osstest-Versions-That: freebsd=32e0aaee87996d207cd719c68dcdb0a5df7e44f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Sep 2019 19:46:50 +0000
Subject: [Xen-devel] [freebsd-master test] 140943: all pass - PUSHED
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

ZmxpZ2h0IDE0MDk0MyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQwOTQzLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgZjJkMTc1OWM1MGZiMjhmYTBlMmUx
YmQ2NWU3YmQ0OWVlN2VkNDY5MwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgMzJlMGFhZWU4Nzk5NmQyMDdjZDcxOWM2OGRjZGIwYTVkZjdlNDRmNgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTQwODMxICAyMDE5LTA4LTMwIDA5OjE5OjM2IFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDE0MDk0MyAgMjAxOS0wOS0wMiAwOToxOTo1MiBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGJkcmFnb24gPGJkcmFnb25ARnJlZUJTRC5vcmc+CiAgYnJvb2tzIDxicm9va3NARnJlZUJTRC5v
cmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgZW1heCA8ZW1heEBGcmVlQlNELm9y
Zz4KICBmb3ggPGZveEBGcmVlQlNELm9yZz4KICBoc2VsYXNreSA8aHNlbGFza3lARnJlZUJTRC5v
cmc+CiAgamhiIDxqaGJARnJlZUJTRC5vcmc+CiAgamtpbSA8amtpbUBGcmVlQlNELm9yZz4KICBr
ZXZhbnMgPGtldmFuc0BGcmVlQlNELm9yZz4KICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAg
bWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgogIG1qZyA8bWpnQEZyZWVCU0Qub3JnPgogIG1qb3Jh
cyA8bWpvcmFzQEZyZWVCU0Qub3JnPgogIHJheSA8cmF5QEZyZWVCU0Qub3JnPgogIHNldmFuIDxz
ZXZhbkBGcmVlQlNELm9yZz4KICB0c29vbWUgPHRzb29tZUBGcmVlQlNELm9yZz4KICB0dWV4ZW4g
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
Z2l0CiAgIDMyZTBhYWVlODc5Li5mMmQxNzU5YzUwZiAgZjJkMTc1OWM1MGZiMjhmYTBlMmUxYmQ2
NWU3YmQ0OWVlN2VkNDY5MyAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
