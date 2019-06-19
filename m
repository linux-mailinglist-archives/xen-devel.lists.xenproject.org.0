Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15984B974
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 15:12:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdaKl-0006gj-Bi; Wed, 19 Jun 2019 13:09:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdaKj-0006ge-23
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 13:09:01 +0000
X-Inumbo-ID: 662122fe-9293-11e9-a2ab-5775f71bc719
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 662122fe-9293-11e9-a2ab-5775f71bc719;
 Wed, 19 Jun 2019 13:08:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 07:08:57 -0600
Message-Id: <5D0A33E40200007800239AE3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 07:08:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-5-roger.pau@citrix.com>
In-Reply-To: <20190619110250.18881-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/4] x86: check for multiboot{1,
 2} header presence
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEFmdGVyIGJ1aWxkaW5nIHRoZSBoeXBlcnZpc29yIGJpbmFyeS4gTm90ZSB0aGF0IHRoZSBjaGVj
ayBpcyBwZXJmb3JtZWQKPiBieSBzZWFyY2hpbmcgZm9yIHRoZSBtYWdpYyBoZWFkZXIgdmFsdWUg
YXQgdGhlIHN0YXJ0IG9mIHRoZSBiaW5hcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAtLS0KPiAgeGVuL2FyY2gveDg2
L01ha2VmaWxlIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvTWFrZWZp
bGUKPiBpbmRleCA4YThkOGYwNjBmLi45YmIzYmY2ZTZjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9NYWtlZmlsZQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+IEBAIC0xMDIsNiAr
MTAyLDkgQEAgCj4gc3ltcy13YXJuLWR1cC0kKENPTkZJR19TVVBQUkVTU19EVVBMSUNBVEVfU1lN
Qk9MX1dBUk5JTkdTKSA6PQo+ICAkKFRBUkdFVCk6ICQoVEFSR0VUKS1zeW1zICQoZWZpLXkpIGJv
b3QvbWtlbGYzMgo+ICAJLi9ib290L21rZWxmMzIgJChub3Rlc19waGRycykgJChUQVJHRVQpLXN5
bXMgJChUQVJHRVQpICQoWEVOX0lNR19PRkZTRVQpIFwKPiAgCSAgICAgICAgICAgICAgIGAkKE5N
KSAkKFRBUkdFVCktc3ltcyB8IHNlZCAtbmUgJ3MvXlwoW14gXSpcKSAuIF9fMk1fcndkYXRhX2Vu
ZCQkLzB4XDEvcCdgCj4gKwkjIENoZWNrIGZvciBtdWx0aWJvb3R7MSwyfSBoZWFkZXJzCj4gKwlv
ZCAtdCB4NCAtTiA4MTkyICQoVEFSR0VUKSB8IGdyZXAgMWJhZGIwMDIgPiAvZGV2L251bGwKPiAr
CW9kIC10IHg0IC1OIDMyNzY4ICQoVEFSR0VUKSB8IGdyZXAgZTg1MjUwZDYgPiAvZGV2L251bGwK
CldoYXQncyB0aGUgYmVoYXZpb3Igd2hlbiBhIHNpZ25hdHVyZSBpcyBfbm90IF8gZm91bmQ/IFdp
bGwKJChUQVJHRVQpIGdldCBkZWxldGVkIChieSBtYWtlKT8gSSBkb24ndCB0aGluayBpdCB3b3Vs
ZCAoYXMgd2UKZG9uJ3Qgc3BlY2lmaWMgLkRFTEVURV9PTl9FUlJPUiBhbnl3aGVyZSksIHNvIGEg
c3Vic2VxdWVudApyZWJ1aWxkIG1heSBub3QgZXZlbiBleGVjdXRlIHRoaXMgcnVsZSwgYW5kIGhl
bmNlIG1heSBsb29rIHRvIGJlCnN1Y2Nlc3NmdWwgZGVzcGl0ZSBpdCBub3QgYWN0dWFsbHkgaGF2
aW5nIGJlZW4uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
