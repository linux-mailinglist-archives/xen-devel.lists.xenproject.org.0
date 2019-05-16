Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D446120B0E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:24:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIBo-0002Rg-DS; Thu, 16 May 2019 15:21:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRIBm-0002Rb-Uj
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:20:58 +0000
X-Inumbo-ID: 343a9ab4-77ee-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 343a9ab4-77ee-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 15:20:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 09:20:56 -0600
Message-Id: <5CDD7FD9020000780022FCC0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 09:20:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Ian Jackson" <Ian.Jackson@eu.citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
In-Reply-To: <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] preparations for 4.11.2
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDE3OjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDQvMjAxOSAxMzowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjYv
MDQvMjAxOSAxMjo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDE4LzAzLzIwMTkgMTY6
MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEFsbCwKPj4+Pgo+Pj4+IHRoZSByZWxlYXNlIGlz
IGR1ZSBieSB0aGUgZW5kIG9mIHRoZSBtb250aCwgYnV0IHdpbGwgbGlrZWx5IGRvbid0IG1ha2UK
Pj4+PiBpdCBiZWZvcmUgZWFybHkgQXByaWwuIFBsZWFzZSBwb2ludCBvdXQgYmFja3BvcnRzIHlv
dSBmaW5kIG1pc3NpbmcgZnJvbQo+Pj4+IHRoZSByZXNwZWN0aXZlIHN0YWdpbmcgYnJhbmNoLCBi
dXQgd2hpY2ggeW91IGNvbnNpZGVyIHJlbGV2YW50LiBUaGUKPj4+PiBvbmUgY29tbWl0IEkndmUg
cXVldWVkIGFscmVhZHkgb24gdG9wIG9mIHdoYXQgd2FzIGp1c3QgcHVzaGVkIGlzCj4+Pj4KPj4+
PiAyMmUyZjhkZGRmCXg4Ni9lODIwOiBmaXggYnVpbGQgd2l0aCBnY2M5Cj4+PiBmZmI2MGE1OGRm
NDg0MTljMWYyNjA3Y2QzY2M5MTlmYTJiZmM5YzJkICJ0b29scy9taXNjL3hlbnBtOiBmaXggZ2V0
dGluZwo+Pj4gaW5mbyB3aGVuIHNvbWUgQ1BVcyBhcmUgb2ZmbGluZSIgZm9yIDQuMTEgYW5kIGVh
cmxpZXIuCj4+IE9oLCBhbmQgNjc3ZTY0ZGJlMzE1MzQzNjIwYzNiMjY2ZTllYjE2NjIzYjExODAz
OCAidG9vbHMvb2NhbWw6IER1cDIKPj4gL2Rldi9udWxsIHRvIHN0ZGluIGluIGRhZW1vbml6ZSgp
IiBhZ2FpbiBmb3IgNC4xMiBhbmQgZWFybGllci4KPiAKPiBJbiBhZGRpdGlvbiwKPiAKPiAyZWM1
MzM5ZWM5MjEgInRvb2xzL2xpYnhsOiBjb3JyZWN0IHZjcHUgYWZmaW5pdHkgb3V0cHV0IHdpdGgg
c3BhcnNlCj4gcGh5c2ljYWwgY3B1IG1hcCIKPiAxMjkwMjVmZTMwOTMgIm94ZW5zdG9yZWQ6IERv
bid0IHJlLW9wZW4gYSB4ZW5jdHJsIGhhbmRsZSBmb3IgZXZlcnkKPiBkb21haW4gaW50cm9kdWN0
aW9uIgo+IDdiMjBhODY1YmMxMCAidG9vbHMvb2NhbWw6IFJlbGVhc2UgdGhlIGdsb2JhbCBsb2Nr
IGJlZm9yZSBpbnZva2luZyBibG9jawo+IHN5c2NhbGxzIgo+IGMzOTNiNjRkY2VlNiAidG9vbHMv
bGlieGM6IEZpeCBpc3N1ZXMgd2l0aCBsaWJ4YyBhbmQgWGVuIGhhdmluZwo+IGRpZmZlcmVudCBm
ZWF0dXJlc2V0IGxlbmd0aHMiCj4gODI4NTVhYmE1YmY5ICJ0b29scy9saWJ4YzogRml4IGVycm9y
IGhhbmRsaW5nIGluIGdldF9jcHVpZF9kb21haW5faW5mbygpIgo+IDQ4ZGFiOTc2N2QyZSAidG9v
bHMveGw6IHVzZSBsaWJ4bF9kb21haW5faW5mbyB0byBnZXQgZG9tYWluIHR5cGUgZm9yCj4gdmNw
dS1waW4iCj4gCj4gMzY1YWFiYjZlNTAyICJ0b29scy9saWJ4ZW5kZXZpY2Vtb2RlbDogYWRkCj4g
eGVuZGV2aWNlbW9kZWxfbW9kaWZpZWRfbWVtb3J5X2J1bGsgdG8gbWFwIiBpcyBwb3NzaWJseSBh
IGNhbmRpZGF0ZSwgYnV0Cj4gaXMgYWxzbyBjb21wbGljYXRlZCBieSB0aGUgc3RhYmxlIFNPTkFN
RS4gIEl0IGlzIHBlcmhhcHMgZWFzaWVzdCB0bwo+IGlnbm9yZSwgc2VlaW5nIGFzIHRoZSBpc3N1
ZSBoYXMgYWxyZWFkeSBnb25lIHVubm90aWNlZCBmb3IgMiB5ZWFycy4KClVubGVzcyB0aGVzZSBh
cmUgcmVhbGx5IHVyZ2VudCB0byBwdXQgaW4sIEknZCBsaWtlIHRoZW0gdG8gYmUgZGVmZXJyZWQK
dG8gNC4xMS4zLiBXaXRoIFhTQS0yOTcgb3V0IHdlJ3ZlIGFscmVhZHkgc3RhcnRlZCB0aGUgKGxl
YWYgdHJlZSkKdGFnZ2luZyBwcm9jZXNzLCBzbyBJIHdhcyByZWFsbHkgaG9waW5nIHRvIGdldCB0
aGlzIG11Y2ggZGVsYXllZApyZWxlYXNlIG91dCByYXRoZXIgc29vbmVyIHRoYW4gbGF0ZXIuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
