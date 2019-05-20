Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3478322A8C
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 05:54:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSZLt-00087V-3O; Mon, 20 May 2019 03:52:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bcwN=TU=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hSZLq-00087E-LJ
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 03:52:38 +0000
X-Inumbo-ID: b50708d1-7ab2-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b50708d1-7ab2-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 03:52:37 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hSZLo-00038y-UP; Mon, 20 May 2019 03:52:36 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hSZLo-0007NJ-Ep; Mon, 20 May 2019 03:52:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hSZLo-0000kT-E9; Mon, 20 May 2019 03:52:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-136470-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=1887b995a3598795dba8704f8eb964a644f21658
X-Osstest-Versions-That: ovmf=a11d371ef660db42c70a00f7e4297367ae5afec5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 May 2019 03:52:36 +0000
Subject: [Xen-devel] [ovmf test] 136470: all pass - PUSHED
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

ZmxpZ2h0IDEzNjQ3MCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzY0NzAvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICAxODg3Yjk5NWEzNTk4Nzk1ZGJhODcwNGY4ZWI5NjRh
NjQ0ZjIxNjU4CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBhMTFkMzcx
ZWY2NjBkYjQyYzcwYTAwZjdlNDI5NzM2N2FlNWFmZWM1CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzYzMDYgIDIwMTktMDUtMTUgMTE6MjI6NDUgWiAgICA0IGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM2NDcwICAyMDE5LTA1LTE3IDIwOjE5OjMwIFogICAgMiBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgRGFuZGFuIEJp
IDxkYW5kYW4uYmlAaW50ZWwuY29tPgogIEZ1IFNpeXVhbiA8c2l5dWFuLmZ1QGludGVsLmNvbT4K
ICBHYXJ5IExpbiA8Z2xpbkBzdXNlLmNvbT4KICBKaWFuIEogV2FuZyA8amlhbi5qLndhbmdAaW50
ZWwuY29tPgogIEpvZSBSaWNoZXkgPGpvZXJpY2hleUBnb29nbGUuY29tPgogIEtyenlzenRvZiBL
b2NoIDxrcnp5c3p0b2Yua29jaEBhcm0uY29tPgogIExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhh
dC5jb20+CiAgUmF5IE5pIDxyYXkubmlAaW50ZWwuY29tPgogIFNoZW5nbGVpIFpoYW5nIDxzaGVu
Z2xlaS56aGFuZ0BpbnRlbC5jb20+CiAgWmhpY2hhbyBHYW8gPHpoaWNoYW8uZ2FvQGludGVsLmNv
bT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdo
dCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9n
cwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJl
IGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBp
biBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3Nz
dGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJp
dHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3Rl
cgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24g
OgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvb3NzdGVzdC9vdm1mLmdpdAogICBh
MTFkMzcxZWY2Li4xODg3Yjk5NWEzICAxODg3Yjk5NWEzNTk4Nzk1ZGJhODcwNGY4ZWI5NjRhNjQ0
ZjIxNjU4IC0+IHhlbi10ZXN0ZWQtbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
