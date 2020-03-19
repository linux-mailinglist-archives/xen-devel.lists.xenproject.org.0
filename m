Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A52618B18B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 11:34:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEsSQ-0003Ly-LG; Thu, 19 Mar 2020 10:31:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f9wY=5E=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jEsSP-0003Lp-8I
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 10:31:21 +0000
X-Inumbo-ID: c58a694e-69cc-11ea-bbe0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c58a694e-69cc-11ea-bbe0-12813bfff9fa;
 Thu, 19 Mar 2020 10:31:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44D14B197;
 Thu, 19 Mar 2020 10:31:19 +0000 (UTC)
Date: Thu, 19 Mar 2020 11:31:18 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <71c4eeaf-958a-b215-3033-c3e0d74a9cfa@suse.com>
Message-ID: <alpine.LSU.2.21.2003191129050.24428@pobox.suse.cz>
References: <20200319095606.23627-1-mbenes@suse.cz>
 <20200319095606.23627-2-mbenes@suse.cz>
 <71c4eeaf-958a-b215-3033-c3e0d74a9cfa@suse.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/xen: Make the boot CPU idle task
 reliable
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
Cc: jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, jpoimboe@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 live-patching@vger.kernel.org, boris.ostrovsky@oracle.com, jslaby@suse.cz,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxOSBNYXIgMjAyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cgo+IE9uIDE5LjAzLjIwMjAg
MTA6NTYsIE1pcm9zbGF2IEJlbmVzIHdyb3RlOgo+ID4gVGhlIHVud2luZGVyIHJlcG9ydHMgdGhl
IGJvb3QgQ1BVIGlkbGUgdGFzaydzIHN0YWNrIG9uIFhFTiBQViBhcwo+ID4gdW5yZWxpYWJsZSwg
d2hpY2ggYWZmZWN0cyBhdCBsZWFzdCBsaXZlIHBhdGNoaW5nLiBUaGVyZSBhcmUgdHdvIHJlYXNv
bnMKPiA+IGZvciB0aGlzLiBGaXJzdCwgdGhlIHRhc2sgZG9lcyBub3QgZm9sbG93IHRoZSB4ODYg
Y29udmVudGlvbiB0aGF0IGl0cwo+ID4gc3RhY2sgc3RhcnRzIGF0IHRoZSBvZmZzZXQgcmlnaHQg
YmVsb3cgc2F2ZWQgcHRfcmVncy4gSXQgYWxsb3dzIHRoZQo+ID4gdW53aW5kZXIgdG8gZWFzaWx5
IGRldGVjdCB0aGUgZW5kIG9mIHRoZSBzdGFjayBhbmQgdmVyaWZ5IGl0LiBTZWNvbmQsCj4gPiBz
dGFydHVwX3hlbigpIGZ1bmN0aW9uIGRvZXMgbm90IHN0b3JlIHRoZSByZXR1cm4gYWRkcmVzcyBi
ZWZvcmUganVtcGluZwo+ID4gdG8geGVuX3N0YXJ0X2tlcm5lbCgpIHdoaWNoIGNvbmZ1c2VzIHRo
ZSB1bndpbmRlci4KPiA+IAo+ID4gQW1lbmQgYm90aCBpc3N1ZXMgYnkgbW92aW5nIHRoZSBzdGFy
dGluZyBwb2ludCBvZiBpbml0aWFsIHN0YWNrIGluCj4gPiBzdGFydHVwX3hlbigpIGFuZCBzdG9y
aW5nIHRoZSByZXR1cm4gYWRkcmVzcyBiZWZvcmUgdGhlIGp1bXAsIHdoaWNoIGlzCj4gPiBleGFj
dGx5IHdoYXQgY2FsbCBpbnN0cnVjdGlvbiBkb2VzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBN
aXJvc2xhdiBCZW5lcyA8bWJlbmVzQHN1c2UuY3o+Cj4gPiAtLS0KPiA+ICBhcmNoL3g4Ni94ZW4v
eGVuLWhlYWQuUyB8IDggKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3hl
bi1oZWFkLlMgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwo+ID4gaW5kZXggMWQwY2VlMzE2M2U0
Li5lZGM3NzZhZjBlMGEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwo+
ID4gKysrIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKPiA+IEBAIC0zNSw3ICszNSwxMSBAQCBT
WU1fQ09ERV9TVEFSVChzdGFydHVwX3hlbikKPiA+ICAJcmVwIF9fQVNNX1NJWkUoc3RvcykKPiA+
ICAKPiA+ICAJbW92ICVfQVNNX1NJLCB4ZW5fc3RhcnRfaW5mbwo+ID4gLQltb3YgJGluaXRfdGhy
ZWFkX3VuaW9uK1RIUkVBRF9TSVpFLCAlX0FTTV9TUAo+ID4gKyNpZmRlZiBDT05GSUdfWDg2XzY0
Cj4gPiArCW1vdiBpbml0aWFsX3N0YWNrKCVyaXApLCAlX0FTTV9TUAo+ID4gKyNlbHNlCj4gPiAr
CW1vdiBwYShpbml0aWFsX3N0YWNrKSwgJV9BU01fU1AKPiA+ICsjZW5kaWYKPiAKPiBJZiB5b3Ug
bmVlZCB0byBkaXN0aW5ndWlzaCB0aGUgdHdvIGFueXdheSwgd2h5IG5vdCB1c2UgJXJzcCBhbmQK
PiAlZXNwIHJlc3BlY3RpdmVseT8KCkkgY291bGQsIEkganVzdCBwcmVmZXJyZWQgdGhlIHVuaWZp
Y2F0aW9uIGluc3RlYWQuIFdpbGwgY2hhbmdlIGl0IGlmIHlvdSAKdGhpbmsgaXQgd291bGQgYmUg
YmV0dGVyLgoKTWlyb3NsYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
