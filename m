Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B486AB11B9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:03:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Qaj-0007Pq-37; Thu, 12 Sep 2019 15:01:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sMgM=XH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i8Qah-0007Pd-8Z
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:00:59 +0000
X-Inumbo-ID: 1ed59509-d56e-11e9-959c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ed59509-d56e-11e9-959c-12813bfff9fa;
 Thu, 12 Sep 2019 15:00:57 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i8Qae-0002zd-Jr; Thu, 12 Sep 2019 15:00:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i8Qae-0004Ef-8S; Thu, 12 Sep 2019 15:00:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i8Qae-0008Or-7r; Thu, 12 Sep 2019 15:00:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141238-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=204ae9da230ecbf0910c21acac7aa5d5e8cbb8d0
X-Osstest-Versions-That: ovmf=7809492c10e8950a1b92581e6e87c6a4be069077
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Sep 2019 15:00:56 +0000
Subject: [Xen-devel] [ovmf test] 141238: all pass - PUSHED
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

ZmxpZ2h0IDE0MTIzOCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDEyMzgvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICAyMDRhZTlkYTIzMGVjYmYwOTEwYzIxYWNhYzdhYTVk
NWU4Y2JiOGQwCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICA3ODA5NDky
YzEwZTg5NTBhMWI5MjU4MWU2ZTg3YzZhNGJlMDY5MDc3CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
NDEyMTIgIDIwMTktMDktMTEgMDE6NTQ6MDMgWiAgICAxIGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTQxMjM4ICAyMDE5LTA5LTEyIDAxOjQwOjE3IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQnVydCBTaWx2
ZXJtYW4gPGJ1cnRtc0BnbWFpbC5jb20+CiAgSmlld2VuIFlhbyA8amlld2VuLnlhb0BpbnRlbC5j
b20+CiAgVml0YWx5IENoZXB0c292IDx2aXQ5Njk2QHByb3Rvbm1haWwuY29tPgogIFZpdGFseSBD
aGVwdHNvdiB2aWEgR3JvdXBzLklvIDx2aXQ5Njk2PXByb3Rvbm1haWwuY29tQGdyb3Vwcy5pbz4K
CmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1p
Mzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkz
ODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBv
biBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwpp
bWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2
YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVz
dC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBn
ZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVz
dC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoK
VGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoK
VG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvb3NzdGVzdC9vdm1mLmdpdAogICA3ODA5
NDkyYzEwLi4yMDRhZTlkYTIzICAyMDRhZTlkYTIzMGVjYmYwOTEwYzIxYWNhYzdhYTVkNWU4Y2Ji
OGQwIC0+IHhlbi10ZXN0ZWQtbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
