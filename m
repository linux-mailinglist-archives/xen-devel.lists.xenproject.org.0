Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8CD98151
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 19:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0UQo-0008TG-SU; Wed, 21 Aug 2019 17:29:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arVw=WR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i0UQn-0008TA-SN
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 17:29:57 +0000
X-Inumbo-ID: 48328be8-c439-11e9-8980-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48328be8-c439-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 17:29:51 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i0UQg-00018x-Ur; Wed, 21 Aug 2019 17:29:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i0UQg-0000j6-JK; Wed, 21 Aug 2019 17:29:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i0UQg-0006ra-Ij; Wed, 21 Aug 2019 17:29:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140448-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=9c90d39b600bd33c7e0600865e6d860d46ce95f3
X-Osstest-Versions-That: ovmf=0970a80583a9a0595eb357f380e604b57136fa26
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Aug 2019 17:29:50 +0000
Subject: [Xen-devel] [ovmf test] 140448: all pass - PUSHED
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

ZmxpZ2h0IDE0MDQ0OCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDA0NDgvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICA5YzkwZDM5YjYwMGJkMzNjN2UwNjAwODY1ZTZkODYw
ZDQ2Y2U5NWYzCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICAwOTcwYTgw
NTgzYTlhMDU5NWViMzU3ZjM4MGU2MDRiNTcxMzZmYTI2CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
NDA0MDUgIDIwMTktMDgtMjAgMDc6MjQ6MTAgWiAgICAxIGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTQwNDQ4ICAyMDE5LTA4LTIxIDAyOjA2OjA3IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgRGFtaWFuIE5p
a29kZW0gPGRhbWlhbi5uaWtvZGVtQGludGVsLmNvbT4KICBEb25nLCBFcmljIDxlcmljLmRvbmdA
aW50ZWwuY29tPgogIEVyaWMgRG9uZyA8ZXJpYy5kb25nQGludGVsLmNvbT4KICBIYW8gQSBXdSA8
aGFvLmEud3VAaW50ZWwuY29tPgogIExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CiAg
TGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgTWlrZSBUdXJuZXIgPG1pa2V0dXJA
bWljcm9zb2Z0LmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
YW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
bWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVt
dXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ct
cmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9o
b21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmls
ZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQg
b2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVB
RE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hp
bmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvb3NzdGVzdC9v
dm1mLmdpdAogICAwOTcwYTgwNTgzLi45YzkwZDM5YjYwICA5YzkwZDM5YjYwMGJkMzNjN2UwNjAw
ODY1ZTZkODYwZDQ2Y2U5NWYzIC0+IHhlbi10ZXN0ZWQtbWFzdGVyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
