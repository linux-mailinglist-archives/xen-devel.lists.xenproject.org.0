Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3C11452
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 09:39:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM6Gp-00043j-2H; Thu, 02 May 2019 07:36:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM6Go-00043e-A4
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 07:36:42 +0000
X-Inumbo-ID: 06a688df-6cad-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 06a688df-6cad-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 07:36:41 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 01:36:40 -0600
Message-Id: <5CCA9E07020000780022B074@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 01:36:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Vasilis Liaskovitis" <vliaskovitis@suse.com>
References: <20190322192809.3002-1-vliaskovitis@suse.com>
 <20190322192809.3002-2-vliaskovitis@suse.com>
 <5CA76DE50200007800224E9C@suse.com>
 <5df570f5ea7ca04610e73d3d8df5c4690e9d0669.camel@suse.com>
In-Reply-To: <5df570f5ea7ca04610e73d3d8df5c4690e9d0669.camel@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
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

Pj4+IE9uIDMwLjA0LjE5IGF0IDIxOjA1LCA8dmxpYXNrb3ZpdGlzQHN1c2UuY29tPiB3cm90ZToK
PiBPbiBGcmksIDIwMTktMDQtMDUgYXQgMTc6MDEgKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOk9u
IDIyLjAzLjE5IGF0Cj4gMjA6MjgsIDx2bGlhc2tvdml0aXNAc3VzZS5jb20+IHdyb3RlOgo+PiA+
IExpbWl0YXRpb25zOgo+PiA+IC0gQ3VzdG9tIHJ1bnRpbWUgcGFyYW1ldGVycyAoT1BUX0NVU1RP
TSkgYXJlIG5vdCBzdXBwb3J0ZWQgeWV0Lgo+PiA+IC0gRm9yIGludGVnZXIgcGFyYW1ldGVycyAo
T1BUX1VJTlQpLCBvbmx5IHVuc2lnbmVkIHBhcmFtZXRlcnMgYXJlCj4+ID4gcHJpbnRlZAo+PiA+
IGNvcnJlY3RseS4KPj4gCj4+IEZvciB0aGlzIGxhdHRlciBjYXNlIEkgd29uZGVyIHdoZXRoZXIg
aXQgd291bGRuJ3QgYmUgYmV0dGVyIHRvCj4+IHJldHVybiBiYWNrIHRoZSByYXcgYmluYXJ5IHZh
bHVlLCBhbGxvd2luZyB0aGUgY2FsbGVyIHRvIGZvcm1hdAo+PiBpdCBpbiBzdWl0YWJsZSB3YXlz
IChlLmcuIGJvdGggc2lnbmVkIGFuZCB1bnNpZ25lZCwgb3IgZGVjIGFuZAo+PiBoZXgpLgo+IAo+
IEN1cnJlbnRseSB0aGUgY2FsbGVyIGlzIG9ibGl2aW91cyB0byB0aGUgcGFyYW1ldGVycyBhbmQg
dGhlaXIgdHlwZXMsCj4gYW5kIGFsbCByZXRyaWV2ZWQgdmFsdWVzIGFyZSBwcmludGVkIHRvZ2V0
aGVyIGluIGEgc2luZ2xlIHN0cmluZyAoc2VlCj4gcGF0Y2ggNC80KS4gSSdkIGxpa2UgdG8ga2Vl
cCBpdCBsaWtlIHRoYXQgZm9yIHNpbXBsaWNpdHkuIE90aGVyd2lzZSBJCj4gdGhpbmsgdGhlIGNh
bGxlciBoYXMgdG8gZmluZCB0aGUgdHlwZXMgb2YgcmVxdWVzdGVkIHBhcmFtZXRlcnMgdG8KPiBw
cm9kdWNlIHRoZSByaWdodCBmb3JtYXR0aW5nLiBBY3R1YWxseSwgc2luY2UgT1BUX1VJTlQgaXMg
dXNlZCBmb3IgYm90aAo+IHNpZ25lZCBhbmQgdW5zaWduZWQgaW50ZWdlciBwYXJhbWV0ZXJzLCBj
YXNlLWJ5LWNhc2UgcGFyYW1ldGVyCj4gZm9ybWF0dGluZyB3b3VsZCBiZSByZXF1aXJlZCB0byBk
byB0aGlzLCBhbmQgdGhlIGxpYngqIGNhbGxlcnMgZG8gbm90Cj4gaGF2ZSB0aGF0IGtub3dsZWRn
ZS4gQSAiZ2V0XyIgcGVyLXBhcmFtZXRlciBmdW5jdGlvbiBwb2ludGVyLCB3aGljaAo+IHdvdWxk
IGhhbmRsZSBmb3JtYXR0aW5nIGZvciBlYWNoIHBhcmFtZXRlciwgYmUgaXQgaW50LCB1aW50LCBz
dHJpbmcgb3IKPiBjdXN0b20sIHNlZW1zIGNsZWFuZXIgdG8gbWUgdGhhbiBsZWF2aW5nIGl0IHRv
IHRoZSBjYWxsZXIuCgpJIGRpc2FncmVlLiBUaGUgY2FsbGVyIHJlcXVpcmVzIG5vIGtub3dsZWRn
ZSBvZiB0aGUgYWN0dWFsIGZvcm1hdC4KSXQgY291bGQgZWFzaWx5IGZvcm1hdCB0aGUgc3RyaW5n
IHR3aWNlIChvbmNlIGFzc3VtaW5nIGl0IG1pZ2h0IGJlIGEKc2lnbmVkIHF1YW50aXR5LCBhbmQg
YW5vdGhlciB0aW1lIGFzc3VtaW5nIGl0IG1pZ2h0IGJlIGFuIHVuc2lnbmVkCm9uZSkuIEFsbCBp
dCB3b3VsZCBuZWVkIHRvIGtub3cgaXMgdGhlIHdpZHRoIG9mIHRoZSBiaW5hcnkKcmVwcmVzZW50
YXRpb24uCgo+IEJ5IHRoZSB3YXksIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIHNlYXJjaGVz
IGluIFtfX3BhcmFtX3N0YXJ0Cj4gX19wYXJhbV9lbmQpLCB3aGljaCBhcmUgb25seSB0aGUgcnVu
dGltZSBwYXJhbWV0ZXJzLCBub3QgYWxsCj4gcGFyYW1ldGVycywgY29ycmVjdD8gU28gdGhlIHNl
cmllcyBzaG91bGQgYmUgcmVuYW1lZCB0byAiU3VwcG9ydCBmb3IKPiByZWFkaW5nIHJ1bnRpbWUt
b25seSBoeXBlcnZpc29yIHBhcmFtZXRlcnMiLiBUaGUgY29tbWFuZCBpcyB1c2VmdWwgZm9yCj4g
Y2hlY2tpbmcgcGFyYW1ldGVycyB0aGF0IGNhbiBiZSBjaGFuZ2VkIGF0IHJ1bnRpbWUgYWZ0ZXIg
YWxsLiAKClllcywgc3VjaCByZW5hbWluZyB3b3VsZCBzZWVtIGRlc2lyYWJsZS4KCj4gSSBiZWxp
ZXZlIHRoZXJlIGFyZSBjdXJyZW50bHkgbm8gc2lnbmVkIGludGVnZXIgcnVudGltZSBwYXJhbWV0
ZXJzLiBTbwo+IGFsdGVybmF0aXZlbHkgd2UgY291bGQgYWRkIGEgd2FybmluZyB0byB0aGUgY29t
bWl0IG1lc3NhZ2UgYW5kL29yIHRvCj4gdGhlIGNvZGUgc3RhdGluZyB0aGF0IHNpZ25lZCBpbnRl
Z2VyIHJ1bnRpbWUgcGFyYW1ldGVycywgaWYgYWRkZWQsCj4gd291bGQgbm90IGJlIHByaW50ZWQg
Y29ycmVjdGx5IGF0IHRoZSBtb21lbnQuIFRoaXMgd291bGQgZ2xvc3Mgb3Zlcgo+IHJhdGhlciB0
aGFuIHNvbHZlIHRoZSBpc3N1ZS4KClRoYXQncyBhbiBvcHRpb24uIEFzIGZvciBvdGhlciBhc3Bl
Y3RzLCBJIGRvbid0IGhlYXZpbHkgbWluZCBjYXNlcwpub3QgZ2V0dGluZyBkZWFsdCB3aXRoIHJp
Z2h0IGF3YXkgd2hpY2ggaGF2ZSBubyBwcmFjdGljYWwgdXNlIHJpZ2h0Cm5vdywgYXMgbG9uZyBh
cyB0aGUgcmVzdHJpY3Rpb25zIGFyZSBjbGVhcmx5IHNwZWxsZWQgb3V0LCBzdWNoIHRoYXQKbm8t
b25lIHdpbGwgYmUgc3VycHJpc2VkIHdoZW4gdHJ5aW5nIHRvIGFkZCBhIHJ1bnRpbWUgb3B0aW9u
IGJleW9uZAp3aGF0IHRoZSBjb2RlIGlzIGFibGUgdG8gZGVhbCB3aXRoLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
