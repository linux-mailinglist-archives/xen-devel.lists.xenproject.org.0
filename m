Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FCE173783
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:47:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7f1M-0002wA-73; Fri, 28 Feb 2020 12:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7f1K-0002w4-Rd
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:45:34 +0000
X-Inumbo-ID: 35ec3864-5a28-11ea-b0f0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35ec3864-5a28-11ea-b0f0-bc764e2007e4;
 Fri, 28 Feb 2020 12:45:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2CFA8AFA1;
 Fri, 28 Feb 2020 12:45:33 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <116e417c-f8bb-5eab-2356-7fa3532e219f@suse.com>
 <20200228123331.GX24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ee962c8-17f5-6c7c-cb36-158231887670@suse.com>
Date: Fri, 28 Feb 2020 13:45:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228123331.GX24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] AMD/IOMMU: correct handling when
 XT's prereq features are unavailable
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMzo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwMToxMDo1OVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2Ug
c2hvdWxkIG5laXRoZXIgY2F1c2UgSU9NTVUgaW5pdGlhbGl6YXRpb24gYXMgYSB3aG9sZSB0byBm
YWlsIGluIHRoaXMKPj4gY2FzZSAod2Ugc2hvdWxkIHN0aWxsIGJlIGFibGUgdG8gYnJpbmcgdXAg
dGhlIHN5c3RlbSBpbiBub24teDJBUElDIG9yCj4+IHgyQVBJQyBwaHlzaWNhbCBtb2RlKSwgbm9y
IHNob3VsZCB0aGUgcmVtYWluZGVyIG9mIHRoZSBmdW5jdGlvbiBiZQo+PiBza2lwcGVkIChhcyB0
aGUgbWFpbiBwYXJ0IG9mIGl0IHdvbid0IGdldCBlbnRlcmVkIGEgMm5kIHRpbWUpCj4gCj4gSSdt
IG5vdCBzdXJlIEkgc2VlIHdoeSBpdCB3b24ndCBnZXQgZW50ZXJlZCBhIHNlY29uZCB0aW1lLiBB
RkFJQ1QKPiBpbml0X2RvbmUgd29uJ3QgYmUgc2V0IGlmIGFtZF9pb21tdV9pbml0IGZhaWxzLCBh
bmQgaGVuY2Ugd2lsbCBiZQo+IGNhbGxlZCBhZ2FpbiB3aXRoIHh0ID09IGZhbHNlIGluIGlvdl9k
ZXRlY3Q/Cj4gCj4+IGluIHN1Y2ggYW4KPj4gZXZlbnQuIEl0IGlzIG1lcmVseSBuZWNlc3Nhcnkg
Zm9yIHRoZSBmdW5jdGlvbiB0byBpbmRpY2F0ZSB0byB0aGUgY2FsbGVyCj4+IChpb3Zfc3VwcG9y
dHNfeHQoKSkgdGhhdCBzZXR1cCBmYWlsZWQgYXMgZmFyIGFzIHgyQVBJQyBpcyBjb25jZXJuZWQu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAK
PiBMR1RNLCBidXQgaXQgbmVlZHMgdG8gZ28gaW4gd2l0aCAyLzIgQUZBSUNULCBvciBlbHNlIHlv
dSB3b3VsZCByZXBvcnQKPiBpbnRlcnJ1cHQgcmVtYXBwaW5nIGVuYWJsZWQgYW5kIHgyQVBJQyBh
bHNvIGVuYWJsZWQgYnV0IHdvbid0IGhhbmRsZQo+IGNvcnJlY3RseSBhIDMyIGJpdCBkZXN0aW5h
dGlvbiBmaWVsZC4KCldlbGwsIHRoaXMgaXMgYW4gaW1wcm92ZW1lbnQgb24gaXRzIG93biBpbW8s
IGV2ZW4gaWYgaXQgZG9lc24ndApmdWxseSBmaXggZXZlcnl0aGluZy4gVGhlIHByaW1hcnkgcG9p
bnQgaGVyZSBpcyB0byBtYWtlIElPTU1VCmluaXRpYWxpemF0aW9uIG5vdCBmYWlsIGFsdG9nZXRo
ZXIsIHdoZW4gdGhlIHN5c3RlbSBjb3VsZCBiZSBydW4KaW4geEFQSUMgbW9kZS4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
