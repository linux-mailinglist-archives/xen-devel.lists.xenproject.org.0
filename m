Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598AD4319D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 00:22:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbBaW-000495-7h; Wed, 12 Jun 2019 22:19:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y/WA=UL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hbBaV-00048t-1z
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 22:19:23 +0000
X-Inumbo-ID: 2036ce3c-8d60-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2036ce3c-8d60-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 22:19:21 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hbBaS-0007HD-Jp; Wed, 12 Jun 2019 22:19:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hbBaS-00086u-37; Wed, 12 Jun 2019 22:19:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hbBaS-0000Ka-2U; Wed, 12 Jun 2019 22:19:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-137595-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=562688707145df9d695f3fc3cb9524f3881f0e2c
X-Osstest-Versions-That: ovmf=f0718d1d6b47745a4249f4006807a45f2245dba1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Jun 2019 22:19:20 +0000
Subject: [Xen-devel] [ovmf test] 137595: all pass - PUSHED
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

ZmxpZ2h0IDEzNzU5NSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzc1OTUvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICA1NjI2ODg3MDcxNDVkZjlkNjk1ZjNmYzNjYjk1MjRm
Mzg4MWYwZTJjCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBmMDcxOGQx
ZDZiNDc3NDVhNDI0OWY0MDA2ODA3YTQ1ZjIyNDVkYmExCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
Mzc1MDMgIDIwMTktMDYtMDkgMDU6MTU6NTMgWiAgICAzIGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM3NTk1ICAyMDE5LTA2LTExIDAxOjExOjM4IFogICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQ2hyaXN0aWFu
IFJvZHJpZ3VleiA8Y2hyaXN0aWFuLnJvZHJpZ3VlekBpbnRlbC5jb20+CiAgQ2h1LCBNYWdnaWUg
PG1hZ2dpZS5jaHVAaW50ZWwuY29tPgogIEZhbiwgWmhpanVYIDx6aGlqdXguZmFuQGludGVsLmNv
bT4KICBIYW8gQSBXdSA8aGFvLmEud3VAaW50ZWwuY29tPgogIEtyenlzenRvZiBLb2NoIDxrcnp5
c3p0b2Yua29jaEBhcm0uY29tPgogIE1hZ2dpZSBDaHUgPG1hZ2dpZS5jaHVAaW50ZWwuY29tPgog
IFBpZXJyZSBHb25kb2lzIDxwaWVycmUuZ29uZG9pc0Bhcm0uY29tPgogIFJheSBOaSA8cmF5Lm5p
QGludGVsLmNvbT4KICBSb2RyaWd1ZXosIENocmlzdGlhbiA8Y2hyaXN0aWFuLnJvZHJpZ3VlekBp
bnRlbC5jb20+CiAgWmhpanUuRmFuIDx6aGlqdXguZmFuQGludGVsLmNvbT4KCmpvYnM6CiBidWls
ZC1hbWQ2NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1h
bWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRl
c3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21l
L2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAog
ICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBs
YW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBh
dAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9i
O2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNz
IGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9w
PW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54
ZW4ub3JnOi9ob21lL3hlbi9naXQvb3NzdGVzdC9vdm1mLmdpdAogICBmMDcxOGQxZDZiLi41NjI2
ODg3MDcxICA1NjI2ODg3MDcxNDVkZjlkNjk1ZjNmYzNjYjk1MjRmMzg4MWYwZTJjIC0+IHhlbi10
ZXN0ZWQtbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
