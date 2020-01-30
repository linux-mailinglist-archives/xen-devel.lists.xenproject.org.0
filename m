Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED414DA9B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 13:31:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8wC-0005xC-3p; Thu, 30 Jan 2020 12:28:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ix8wA-0005x7-T4
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 12:28:46 +0000
X-Inumbo-ID: 0f37822e-435c-11ea-8a46-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f37822e-435c-11ea-8a46-12813bfff9fa;
 Thu, 30 Jan 2020 12:28:46 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix8w9-0003s0-8S; Thu, 30 Jan 2020 12:28:45 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix8w8-0000NY-U2; Thu, 30 Jan 2020 12:28:45 +0000
Date: Thu, 30 Jan 2020 12:28:36 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130122836.ccexm2c2j5i7umas@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130120807.GJ4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MDg6MDdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiAKPiA+ICt9Cj4gPiArCj4gPiAgLyoKPiA+ICAgKiBMb2NhbCB2YXJpYWJsZXM6
Cj4gPiAgICogbW9kZTogQwo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMg
Yi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPiBpbmRleCA5N2Y5YzA3ODkxLi44ZTAyYjRjNjQ4
IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gKysrIGIveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUwo+ID4gQEAgLTMyOSw2ICszMjksMTAgQEAgU0VDVElPTlMKPiA+ICAg
IGVmaSA9IC47Cj4gPiAgI2VuZGlmCj4gPiAgCj4gPiArI2lmZGVmIENPTkZJR19IWVBFUlZfR1VF
U1QKPiA+ICsgIGh2X2hjYWxsX3BhZ2UgPSBBQlNPTFVURShfX2ZpeF94X3RvX3ZpcnQoMSkpOwo+
IAo+IEkgYXNzdW1lIHRoZXJlJ3Mgbm8gd2F5IHRvIHVzZSBGSVhfWF9IWVBFUlZfSENBTEwgYmVj
YXVzZSBpdCdzIGFuCj4gZW51bT8KPiAKClllcy4KCkFuZCB0aGUgdHJpY2sgdG8gZ2VuZXJhdGUg
YSBzeW1ib2wgZGlkbid0IHdvcmsgZWl0aGVyLgoKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICAgIC8q
IFNlY3Rpb25zIHRvIGJlIGRpc2NhcmRlZCAqLwo+ID4gICAgL0RJU0NBUkQvIDogewo+ID4gICAg
ICAgICAqKC5leGl0LnRleHQpCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9m
aXhtYXAuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgKPiA+IGluZGV4IDgwOTQ1NDZi
NzUuLmE5YmNiMDY4Y2IgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2ZpeG1h
cC5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2ZpeG1hcC5oCj4gPiBAQCAtMTYsNiAr
MTYsNyBAQAo+ID4gIAo+ID4gICNkZWZpbmUgRklYQUREUl9UT1AgKFZNQVBfVklSVF9FTkQgLSBQ
QUdFX1NJWkUpCj4gPiAgI2RlZmluZSBGSVhBRERSX1hfVE9QIChYRU5fVklSVF9FTkQgLSBQQUdF
X1NJWkUpCj4gPiArI2RlZmluZSBfX2ZpeF94X3RvX3ZpcnQoeCkgKEZJWEFERFJfWF9UT1AgLSAo
KHgpIDw8IFBBR0VfU0hJRlQpKQo+ID4gIAo+ID4gICNpZm5kZWYgX19BU1NFTUJMWV9fCj4gPiAg
Cj4gPiBAQCAtMTEwLDggKzExMSw2IEBAIGV4dGVybiB2b2lkIF9fc2V0X2ZpeG1hcF94KAo+ID4g
IAo+ID4gICNkZWZpbmUgY2xlYXJfZml4bWFwX3goaWR4KSBfX3NldF9maXhtYXBfeChpZHgsIDAs
IDApCj4gPiAgCj4gPiAtI2RlZmluZSBfX2ZpeF94X3RvX3ZpcnQoeCkgKEZJWEFERFJfWF9UT1Ag
LSAoKHgpIDw8IFBBR0VfU0hJRlQpKQo+ID4gLQo+ID4gICNkZWZpbmUgZml4X3hfdG9fdmlydCh4
KSAgICgodm9pZCAqKV9fZml4X3hfdG9fdmlydCh4KSkKPiAKPiBUaGlzIHNlZW1zIGxpa2Ugc29t
ZSB1bnJlbGF0ZWQgY29kZSBtb3ZlbWVudD8KPiAKCkl0IGlzIHJlcXVpcmVkLiBUaGlzIHNlY3Rp
b24gaXMgbm90IHN1cHBvc2VkIHRvIGJlIHVzZWQgaW4gbGlua2VyCnNjcmlwdC4gSSBoYXZlIHRv
IG1vdmUgdGhhdCBtYWNybyBhaGVhZC4KCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
