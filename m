Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582051001D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 21:11:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLY5B-0006Qo-2K; Tue, 30 Apr 2019 19:06:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BCrz=TA=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1hLY59-0006Qj-Ks
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 19:06:23 +0000
X-Inumbo-ID: 091675bc-6b7b-11e9-aa8a-7745b5ef29e7
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 091675bc-6b7b-11e9-aa8a-7745b5ef29e7;
 Tue, 30 Apr 2019 19:06:19 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Tue, 30 Apr 2019 21:06:18 +0200
Received: from linux-nq5u (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Tue, 30 Apr 2019 20:05:55 +0100
Message-ID: <5df570f5ea7ca04610e73d3d8df5c4690e9d0669.camel@suse.com>
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: Jan Beulich <JBeulich@suse.com>
Date: Tue, 30 Apr 2019 21:05:54 +0200
In-Reply-To: <5CA76DE50200007800224E9C@suse.com>
References: <20190322192809.3002-1-vliaskovitis@suse.com>
 <20190322192809.3002-2-vliaskovitis@suse.com>
 <5CA76DE50200007800224E9C@suse.com>
User-Agent: Evolution 3.30.4 
Mime-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/4] xen: add hypercall for getting
 parameters at runtime
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgZm9yIHRoZSBkZWxheSwgSSB3YXMgb24gYSBsb25nIHZhY2F0aW9uLgoKT24gRnJpLCAy
MDE5LTA0LTA1IGF0IDE3OjAxICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZTpPbiAyMi4wMy4xOSBh
dAoyMDoyOCwgPHZsaWFza292aXRpc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPiBMaW1pdGF0aW9uczoK
PiA+IC0gQ3VzdG9tIHJ1bnRpbWUgcGFyYW1ldGVycyAoT1BUX0NVU1RPTSkgYXJlIG5vdCBzdXBw
b3J0ZWQgeWV0Lgo+ID4gLSBGb3IgaW50ZWdlciBwYXJhbWV0ZXJzIChPUFRfVUlOVCksIG9ubHkg
dW5zaWduZWQgcGFyYW1ldGVycyBhcmUKPiA+IHByaW50ZWQKPiA+IGNvcnJlY3RseS4KPiAKPiBG
b3IgdGhpcyBsYXR0ZXIgY2FzZSBJIHdvbmRlciB3aGV0aGVyIGl0IHdvdWxkbid0IGJlIGJldHRl
ciB0bwo+IHJldHVybiBiYWNrIHRoZSByYXcgYmluYXJ5IHZhbHVlLCBhbGxvd2luZyB0aGUgY2Fs
bGVyIHRvIGZvcm1hdAo+IGl0IGluIHN1aXRhYmxlIHdheXMgKGUuZy4gYm90aCBzaWduZWQgYW5k
IHVuc2lnbmVkLCBvciBkZWMgYW5kCj4gaGV4KS4KCkN1cnJlbnRseSB0aGUgY2FsbGVyIGlzIG9i
bGl2aW91cyB0byB0aGUgcGFyYW1ldGVycyBhbmQgdGhlaXIgdHlwZXMsCmFuZCBhbGwgcmV0cmll
dmVkIHZhbHVlcyBhcmUgcHJpbnRlZCB0b2dldGhlciBpbiBhIHNpbmdsZSBzdHJpbmcgKHNlZQpw
YXRjaCA0LzQpLiBJJ2QgbGlrZSB0byBrZWVwIGl0IGxpa2UgdGhhdCBmb3Igc2ltcGxpY2l0eS4g
T3RoZXJ3aXNlIEkKdGhpbmsgdGhlIGNhbGxlciBoYXMgdG8gZmluZCB0aGUgdHlwZXMgb2YgcmVx
dWVzdGVkIHBhcmFtZXRlcnMgdG8KcHJvZHVjZSB0aGUgcmlnaHQgZm9ybWF0dGluZy4gQWN0dWFs
bHksIHNpbmNlIE9QVF9VSU5UIGlzIHVzZWQgZm9yIGJvdGgKc2lnbmVkIGFuZCB1bnNpZ25lZCBp
bnRlZ2VyIHBhcmFtZXRlcnMsIGNhc2UtYnktY2FzZSBwYXJhbWV0ZXIKZm9ybWF0dGluZyB3b3Vs
ZCBiZSByZXF1aXJlZCB0byBkbyB0aGlzLCBhbmQgdGhlIGxpYngqIGNhbGxlcnMgZG8gbm90Cmhh
dmUgdGhhdCBrbm93bGVkZ2UuIEEgImdldF8iIHBlci1wYXJhbWV0ZXIgZnVuY3Rpb24gcG9pbnRl
ciwgd2hpY2gKd291bGQgaGFuZGxlIGZvcm1hdHRpbmcgZm9yIGVhY2ggcGFyYW1ldGVyLCBiZSBp
dCBpbnQsIHVpbnQsIHN0cmluZyBvcgpjdXN0b20sIHNlZW1zIGNsZWFuZXIgdG8gbWUgdGhhbiBs
ZWF2aW5nIGl0IHRvIHRoZSBjYWxsZXIuCgpCeSB0aGUgd2F5LCB0aGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbiBzZWFyY2hlcyBpbiBbX19wYXJhbV9zdGFydApfX3BhcmFtX2VuZCksIHdoaWNoIGFy
ZSBvbmx5IHRoZSBydW50aW1lIHBhcmFtZXRlcnMsIG5vdCBhbGwKcGFyYW1ldGVycywgY29ycmVj
dD8gU28gdGhlIHNlcmllcyBzaG91bGQgYmUgcmVuYW1lZCB0byAiU3VwcG9ydCBmb3IKcmVhZGlu
ZyBydW50aW1lLW9ubHkgaHlwZXJ2aXNvciBwYXJhbWV0ZXJzIi4gVGhlIGNvbW1hbmQgaXMgdXNl
ZnVsIGZvcgpjaGVja2luZyBwYXJhbWV0ZXJzIHRoYXQgY2FuIGJlIGNoYW5nZWQgYXQgcnVudGlt
ZSBhZnRlciBhbGwuIAoKSSBiZWxpZXZlIHRoZXJlIGFyZSBjdXJyZW50bHkgbm8gc2lnbmVkIGlu
dGVnZXIgcnVudGltZSBwYXJhbWV0ZXJzLiBTbwphbHRlcm5hdGl2ZWx5IHdlIGNvdWxkIGFkZCBh
IHdhcm5pbmcgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZC9vciB0bwp0aGUgY29kZSBzdGF0aW5n
IHRoYXQgc2lnbmVkIGludGVnZXIgcnVudGltZSBwYXJhbWV0ZXJzLCBpZiBhZGRlZCwKd291bGQg
bm90IGJlIHByaW50ZWQgY29ycmVjdGx5IGF0IHRoZSBtb21lbnQuIFRoaXMgd291bGQgZ2xvc3Mg
b3ZlcgpyYXRoZXIgdGhhbiBzb2x2ZSB0aGUgaXNzdWUuCgpJZiBjb3JyZWN0IGZvcm1hdHRpbmcg
Zm9yIGFsbCBwb3NzaWJsZSB0eXBlcyBpcyBhIHJlcXVpcmVtZW50LCB0aGUKZ2V0X2Z1bmN0aW9u
IG1heSBiZSBuZWVkZWQuIE9yIHdlIGNvdWxkIHNlcGFyYXRlIGludGVnZXIgZnJvbSB1bnNpZ25l
ZAppbnRlZ2VyIHBhcmFtZXRlcnMgd2l0aCBhbiBhZGRpdGlvbmFsIE9QVF9JTlQgcGFyYW1ldGVy
IHR5cGUuIEkgZG9uJ3QKa25vdyBpZiBlaXRoZXIgb2YgdGhlc2UgaXMgZGVzaXJhYmxlIG9yIHNp
bXBseSBvdmVya2lsbCB0byBpbXBsZW1lbnQKanVzdCBmb3IgdGhpcyBjb21tYW5kLgoKSSAnbGwg
c2VuZCBhIHYzIHdoZW4gdGhlcmUgaXMgYWdyZWVtZW50IG9uIHRoZSBhYm92ZS4KClsuLi5dCgo+
ID4gKyAgICAgICAgICAgIHsKPiA+ICsgICAgICAgICAgICBjYXNlIE9QVF9TVFI6Cj4gPiArICAg
ICAgICAgICAgICAgIGxlbiA9IHNucHJpbnRmKHZhbCArIGJ1ZnBvcywgbWF4bGVuIC0gYnVmcG9z
LCAiJXMKPiA+ICIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChjaGFyKilw
YXJhbS0+cGFyLnZhcik7Cj4gCj4gV2hhdCB5b3UgcmV0dXJuIGhlcmUgaXMgdGhlIHZhbHVlIGFz
IHNldCBpbnRvIHRoZSBidWZmZXIgd2hlbiB0aGUKPiBvcHRpb24gd2FzIHBhcnNlZCwgYW5kIGJl
Zm9yZSB0aGF0IHN0cmluZyB3YXMgYWN0dWFsbHkgY29uc3VtZWQuCj4gSXMgdGhpcyByZWFsbHkg
d2hhdCdzIGludGVyZXN0aW5nIHRvIHRoZSB1c2VyPyBJJ2QgcmF0aGVyIGV4cGVjdCB0aGVtCj4g
dG8gYmUgYWZ0ZXIgd2hhdCBpcyBhY3R1YWxseSBpbiBlZmZlY3QuCj4gCj4gU2luY2Ugd2UndmUg
ZGVjaWRlZCBhZ2FpbnN0IGEgImdldCIgcGVyLW9wdGlvbiBob29rLCBJIGNvbnNpZGVyIGl0Cj4g
YWNjZXB0YWJsZSB0aGlzIHdheSBhcyBsb25nIGFzIHRoZSBiZWhhdmlvciBpcyBzcGVsbGVkIG91
dCBhbW9uZ3N0Cj4gdGhlIGxpbWl0YXRpb25zLgo+IAoKSSAnbGwgYWRkIHRoaXMgbGltaXRhdGlv
biB0byB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdGhlIG5leHQgdmVyc2lvbi4KCnRoYW5rcywKLSBW
YXNpbGlzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
