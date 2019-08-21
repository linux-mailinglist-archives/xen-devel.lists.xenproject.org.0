Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEED96F3C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 04:09:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0FzX-0005q0-0z; Wed, 21 Aug 2019 02:04:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arVw=WR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i0FzV-0005ps-Cj
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 02:04:49 +0000
X-Inumbo-ID: 0a05314e-c3b8-11e9-adbd-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a05314e-c3b8-11e9-adbd-12813bfff9fa;
 Wed, 21 Aug 2019 02:04:42 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i0FzN-0007CF-IP; Wed, 21 Aug 2019 02:04:41 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i0FzN-0003Y4-AD; Wed, 21 Aug 2019 02:04:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i0FzN-00032u-7d; Wed, 21 Aug 2019 02:04:41 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140405-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=0970a80583a9a0595eb357f380e604b57136fa26
X-Osstest-Versions-That: ovmf=501de8146d4fda1d423cd935316661746bdb750b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Aug 2019 02:04:41 +0000
Subject: [Xen-devel] [ovmf test] 140405: all pass - PUSHED
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

ZmxpZ2h0IDE0MDQwNSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDA0MDUvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICAwOTcwYTgwNTgzYTlhMDU5NWViMzU3ZjM4MGU2MDRi
NTcxMzZmYTI2CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICA1MDFkZTgx
NDZkNGZkYTFkNDIzY2Q5MzUzMTY2NjE3NDZiZGI3NTBiCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
NDAyMDAgIDIwMTktMDgtMTYgMTE6Mzk6NTUgWiAgICA0IGRheXMKRmFpbGluZyBzaW5jZSAgICAg
ICAgMTQwMzMyICAyMDE5LTA4LTE5IDAxOjExOjA4IFogICAgMiBkYXlzICAgIDMgYXR0ZW1wdHMK
VGVzdGluZyBzYW1lIHNpbmNlICAgMTQwNDA1ICAyMDE5LTA4LTIwIDA3OjI0OjEwIFogICAgMCBk
YXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVy
IHRlc3Q6CiAgQW5kcmV3IEZpc2ggPGFmaXNoQGFwcGxlLmNvbT4KICBCb2IgRmVuZyA8Ym9iLmMu
ZmVuZ0BpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVggPHpoaWp1eC5mYW5AaW50ZWwuY29tPgogIEZl
bmcsIEJvYiBDIDxib2IuYy5mZW5nQGludGVsLmNvbT4KICBKb3JkYW4gSnVzdGVuIDxqb3JkYW4u
bC5qdXN0ZW5AaW50ZWwuY29tPgogIE1pY2hhZWwgRCBLaW5uZXkgPG1pY2hhZWwuZC5raW5uZXlA
aW50ZWwuY29tPgogIFNoZW5nbGVpIFpoYW5nIDxzaGVuZ2xlaS56aGFuZ0BpbnRlbC5jb20+CiAg
U2hpLCBTdGV2ZW4gPHN0ZXZlbi5zaGlAaW50ZWwuY29tPgogIFN0ZXZlbiBTaGkgPHN0ZXZlbi5z
aGlAaW50ZWwuY29tPgogIFpoaWNoYW8gR2FvIDx6aGljaGFvLmdhb0BpbnRlbC5jb20+CiAgWmhp
anUuRmFuIDx6aGlqdXguZmFuQGludGVsLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
aTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1x
ZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFt
ZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpM
b2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVz
ZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWls
O2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5n
aXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZv
dW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9
c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hl
bi9naXQvb3NzdGVzdC9vdm1mLmdpdAogICA1MDFkZTgxNDZkLi4wOTcwYTgwNTgzICAwOTcwYTgw
NTgzYTlhMDU5NWViMzU3ZjM4MGU2MDRiNTcxMzZmYTI2IC0+IHhlbi10ZXN0ZWQtbWFzdGVyCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
