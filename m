Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08614F0E4
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:51:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixZU4-0000hR-2l; Fri, 31 Jan 2020 16:49:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixZU3-0000hL-73
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:49:31 +0000
X-Inumbo-ID: a5e36d4f-4449-11ea-8bec-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5e36d4f-4449-11ea-8bec-12813bfff9fa;
 Fri, 31 Jan 2020 16:49:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixZU1-0007d2-6E; Fri, 31 Jan 2020 16:49:29 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixZU0-0000sA-SL; Fri, 31 Jan 2020 16:49:29 +0000
Date: Fri, 31 Jan 2020 16:49:25 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200131164925.k6okaittwjfbahnb@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <6afc369b-a93e-1512-d6ea-f9260fb83c7c@suse.com>
 <20200131143716.gtdb5wwoagxpb223@debian>
 <c08b3b1d-3d88-98c4-b175-ab5e1d2ec8c4@suse.com>
 <20200131161509.mjw2pvzjgv4zhdzc@debian>
 <07672921-8670-7004-56ce-68ddf5dab147@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07672921-8670-7004-56ce-68ddf5dab147@suse.com>
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
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6MTg6MTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzEuMDEuMjAyMCAxNzoxNSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgSmFu
IDMxLCAyMDIwIGF0IDA0OjM1OjIzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDMxLjAxLjIwMjAgMTU6MzcsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IE9uIEZyaSwgSmFuIDMxLCAy
MDIwIGF0IDAzOjI0OjA3UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4gT24gMjku
MDEuMjAyMCAyMToyMCwgV2VpIExpdSB3cm90ZToKPiA+Pj4+PiBJIHRyaWVkIHVzaW5nIHRoZSBh
c20oIi5lcXUgLi4iKSB0cmljayBidXQgaGl0IGEgcHJvYmxlbSB3aXRoICVjIGFnYWluLgo+ID4+
Pj4+Cj4gPj4+Pj4gbW0uYzo1NzM2OjU6IGVycm9yOiBpbnZhbGlkICdhc20nOiBvcGVyYW5kIGlz
IG5vdCBhIGNvbmRpdGlvbiBjb2RlLCBpbnZhbGlkIG9wZXJhbmQgY29kZSAnYycKPiA+Pj4+PiAg
ICAgICAgICAgICAgICBhc20gKCAiLmVxdSBIVl9IQ0FMTF9QQUdFLCAlYzA7IC5nbG9iYWwgSFZf
SENBTExfUEFHRSIKPiA+Pj4+Cj4gPj4+PiBXb3VsZCB5b3UgbWluZCBhbHNvIGluZGljYXRpbmcg
d2hhdCB0aGUgaW5wdXQgb3BlcmFuZCBhY3R1YWxseQo+ID4+Pj4gd2FzPyBBY2NvcmRpbmcgdG8g
bXkgbG9va2luZyBhdCBnY2Mgc291cmNlcyB3aGVuIHlvdSBmaXJzdAo+ID4+Pj4gbWVudGlvbmVk
IHRoaXMgKG9uIGlyYyBpaXJjKSwgbXVjaCBkZXBlbmRzIG9uIGl0IGFjdHVhbGx5IGJlCj4gPj4+
PiByZWNvZ25pemFibGUgYXMgYSBjb25zdGFudCBieSB0aGUgY29tcGlsZXIuCj4gPj4+Cj4gPj4+
IFNvbWV0aGluZyBhbG9uZyB0aGUgbGluZToKPiA+Pj4KPiA+Pj4gICBhc20gKCAiLmVxdSBIVl9I
Q0FMTF9QQUdFLCAlYzA7IC5nbG9iYWwgSFZfSENBTExfUEFHRSIKPiA+Pj4gICAgICAgIDo6ICJp
IiAoX19maXhfeF90b192aXJ0KEZJWF9YX0hWLi4uKSkKPiA+Pgo+ID4+IFF1aXRlIGEgYml0IG9m
IHBsYXlpbmcgbGF0ZXIsICVQMCBpcyBkb2N1bWVudGVkLCBzdXBwb3J0ZWQKPiA+PiBhbHJlYWR5
IGluIGdjYyA0LjEueCwgYW5kIGFsc28gdXNlZCBpbiBhIGZldyBjYXNlcyBieSBMaW51eC4KPiA+
PiAlcDAgd291bGQgYmUgYW5vdGhlciBkb2N1bWVudGVkIGFsdGVybmF0aXZlLCBidXQgc3VwcG9y
dCBmb3IKPiA+PiB0aGlzIGxvb2tzIHRvIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGxhdGVyLiBOb3Qg
YmVpbmcgYWJsZSB0byB1c2UKPiA+PiAlYzAgaGVyZSBzdGlsbCBzbWVsbHMgbGlrZSBhIGJ1ZyAo
YW5kIEkgZ3Vlc3MgSSdsbCBlbnRlciBvbmUuKQo+ID4gCj4gPiBPSy4gTGV0IG1lIHRyeSB0aGF0
Lgo+ID4gCj4gPiBJZiB0aGF0IHR1cm5zIG91dCBzdWNjZXNzZnVsLCBkbyB5b3Ugd2FudCBtZSB0
byBjaGFuZ2UgdGhlIG90aGVyCj4gPiBpbnN0YW5jZSB0byAlUDAgdG9vPwo+IAo+IFRoYXQgd2Fz
IGEgcHJldHR5IHNtYWxsIHZhbHVlLCB3YXNuJ3QgaXQ/IEkgZ3Vlc3MgaXQgbWlnaHQgYmUgc2Fm
ZXIKPiB0byBzd2l0Y2ggdG8gJVAgKGFuZCB0aGVuIHBlcmhhcHMgYWxzbyBlbHNld2hlcmUgaW4g
dGhlIGNvZGUgYmFzZSkuCgpZZXMuIFRoYXQgdmFsdWUgaXMgMHgyMDAwIGF0IHRoZSBtb21lbnQu
Cgo+IEJ1dCBkdXJpbmcgbXkgcGxheWluZyB3aXRoIGl0IEkgYWxzbyBub3RpY2VkIHRoZXJlJ3Mg
YSBzaWduZWRuZXNzCj4gYnVnIChhZmZlY3RpbmcgYWxsIHBvc3NpYmxlIG1vZGlmaWVycyksIHNv
IHdlIG5lZWQgdG8gd2F0Y2ggb3V0IGZvcgo+IHJlc3VsdHMgYmVpbmcgcmlnaHQgaW4gYW55IGV2
ZW50LgoKVXNpbmcgJVAwIHdvcmtzIGp1c3QgZmluZSBmb3IgdGhhdCBpbnN0YW5jZSwgdGhlIGdl
bmVyYXRlZCB2YWx1ZSBsb29rcwpjb3JyZWN0LCBzbyBJIHdpbGwgdXNlIGl0LgoKV2VpLgoKPiAK
PiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
