Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59694180F76
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 06:11:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBtcU-0005IZ-Uf; Wed, 11 Mar 2020 05:09:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FW8+=44=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jBtcT-0005IS-OQ
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 05:09:25 +0000
X-Inumbo-ID: 797ae3b4-6356-11ea-aeed-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 797ae3b4-6356-11ea-aeed-12813bfff9fa;
 Wed, 11 Mar 2020 05:09:24 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jBtcS-0007kc-8n; Wed, 11 Mar 2020 05:09:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jBtcR-00046M-V5; Wed, 11 Mar 2020 05:09:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jBtcR-0002xL-UN; Wed, 11 Mar 2020 05:09:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-148345-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=a3e25cc8a1dd3d1ea24ed02f90c44221e015e965
X-Osstest-Versions-That: ovmf=3b9cd714542a8744252d973e1f163222a9f21b9e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Mar 2020 05:09:23 +0000
Subject: [Xen-devel] [ovmf test] 148345: all pass - PUSHED
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

ZmxpZ2h0IDE0ODM0NSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDgzNDUvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICBhM2UyNWNjOGExZGQzZDFlYTI0ZWQwMmY5MGM0NDIy
MWUwMTVlOTY1CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICAzYjljZDcx
NDU0MmE4NzQ0MjUyZDk3M2UxZjE2MzIyMmE5ZjIxYjllCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
NDgxMTQgIDIwMjAtMDMtMDUgMDc6NTI6MTIgWiAgICA1IGRheXMKRmFpbGluZyBzaW5jZSAgICAg
ICAgMTQ4MTU3ICAyMDIwLTAzLTA2IDA0OjEzOjQ0IFogICAgNSBkYXlzICAgIDQgYXR0ZW1wdHMK
VGVzdGluZyBzYW1lIHNpbmNlICAgMTQ4MjgwICAyMDIwLTAzLTA4IDIyOjU5OjQ5IFogICAgMiBk
YXlzICAgIDIgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVy
IHRlc3Q6CiAgQW5kcmVpIFdhcmtlbnRpbiA8YXdhcmtlbnRpbkB2bXdhcmUuY29tPgogIEFyZCBC
aWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogIExhc3psbyBFcnNlayA8bGVy
c2VrQHJlZGhhdC5jb20+CiAgUGV0ZSBCYXRhcmQgPHBldGVAYWtlby5pZT4KCmpvYnM6CiBidWls
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
ZW4ub3JnOi9ob21lL3hlbi9naXQvb3NzdGVzdC9vdm1mLmdpdAogICAzYjljZDcxNDU0Li5hM2Uy
NWNjOGExICBhM2UyNWNjOGExZGQzZDFlYTI0ZWQwMmY5MGM0NDIyMWUwMTVlOTY1IC0+IHhlbi10
ZXN0ZWQtbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
