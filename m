Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB26B116EC6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:13:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJkT-00076e-Bm; Mon, 09 Dec 2019 14:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieJkS-00076X-Ig
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:10:52 +0000
X-Inumbo-ID: b4bb8eb8-1a8d-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4bb8eb8-1a8d-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 14:10:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 060DBB227;
 Mon,  9 Dec 2019 14:10:51 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
 <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
 <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
 <dbfdc420-5755-5298-fc9c-7ac21a521d13@suse.com>
 <787c1ac3-a4b2-da01-b444-af030a5a49bc@xen.org>
 <7716910a-b3ee-32f1-cdf7-def1a8f258f4@suse.com>
 <fee3e4ec-213b-c3a9-a509-a125877be6f3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <359882b9-e6a4-508e-d339-841a021efa09@suse.com>
Date: Mon, 9 Dec 2019 15:11:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <fee3e4ec-213b-c3a9-a509-a125877be6f3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxNTowNiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMi82LzE5IDQ6
NDIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwNi4xMi4yMDE5IDE3OjIwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAwNi8xMi8yMDE5IDE2OjA2LCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+PiBPbiAwNi4xMi4yMDE5IDE1OjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4+IE9uIDA1LzEyLzIwMTkgMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24g
MDUuMTIuMjAxOSAxNzoyNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+IE9uIDA1LzEyLzIw
MTkgMTU6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiArLyoKPj4+Pj4+Pj4gKyAqIFN0
cmluZyBjb21wYXJpc29uIGZ1bmN0aW9ucyBtb3N0bHkgbWF0Y2hpbmcgc3RyY21wKCkgLyBzdHJu
Y21wKCksCj4+Pj4+Pj4+ICsgKiBleGNlcHQgdGhhdCB0aGV5IHRyZWF0ICctJyBhbmQgJ18nIGFz
IG1hdGNoaW5nIG9uZSBhbm90aGVyLgo+Pj4+Pj4+PiArICovCj4+Pj4+Pj4+ICtzdGF0aWMgaW50
IF9zdHJjbXAoY29uc3QgY2hhciAqczEsIGNvbnN0IGNoYXIgKnMyKQo+Pj4+Pj4+Cj4+Pj4+Pj4g
SSB0aG91Z2h0IHdlIHdlcmUgdHJ5aW5nIHRvIGF2b2lkIG5ldyBmdW5jdGlvbiBuYW1lIHdpdGgg
bGVhZGluZyBfPwo+Pj4+Pj4KPj4+Pj4+IFdlJ3JlIHRyeWluZyB0byBhdm9pZCBuZXcgbmFtZSBz
cGFjZSB2aW9sYXRpb25zLiBTdWNoIGFyZQo+Pj4+Pj4gLSBpZGVudGlmaWVycyBzdGFydGluZyB3
aXRoIHR3byB1bmRlcnNjb3JlcywKPj4+Pj4+IC0gaWRlbnRpZmllcnMgc3RhcnRpbmcgd2l0aCBh
biB1bmRlcnNjb3JlIGFuZCBhbiB1cHBlciBjYXNlIGxldHRlciwKPj4+Pj4+IC0gaWRlbnRpZmll
cnMgb2Ygbm9uLXN0YXRpYyBzeW1ib2xzIHN0YXJ0aW5nIHdpdGggYW4gdW5kZXJzY29yZS4KPj4+
Pj4KPj4+Pj4gSSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHdoeSBub24tc3RhdGljIHN5bWJv
bHMgb25seS4gVGhpcyB3b3VsZAo+Pj4+PiBwcmV2ZW50IHlvdSB0byB1c2UgdGhlIHRoZSBub24t
c3RhdGljIHN5bWJvbCBpZiB5b3UgaGFwcGVuIHRvIHJlLXVzZSB0aGUKPj4+Pj4gc2FtZSBuYW1l
Lgo+Pj4+Cj4+Pj4gSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQuIEFueXdheSAtIHdoYXQg
SSd2ZSBsaXN0ZWQgYWJvdmUgaXMKPj4+PiB3aGF0IHRoZSBsYW5ndWFnZSBzdGFuZGFyZCBtYW5k
YXRlcy4KPj4+IEFGQUlVLCBmb3IgYSBnaXZlbiB1bml0LCB0aGVyZSBpcyBvbmx5IG9uZSBwb29s
IG9mIGlkZW50aWZpZXJzLiBTbyB5b3UgCj4+PiBjb3VsZCBub3QgaGF2ZSBhbiBpZGVudGlmaWVy
IHVzZWQgYXQgdGhlIHNhbWUgdGltZSBieSBhIG5vbi1zdGF0aWMgYW5kIGEgCj4+PiBzdGF0aWMg
c3ltYm9sICh0aGF0J3MgZXhjbHVzaW5nIHRoZSB3ZWFrIGF0dHJpYnV0ZSkuIFNvIGl0IGZlZWxz
IAo+Pj4gc2xpZ2h0bHkgc3RyYW5nZSB0byBvbmx5IGNvdmVyIHRoZSBub24tc3RhdGljIHN5bWJv
bHMuCj4+Cj4+IEkgZ3Vlc3MgSSdtIHN0aWxsIG5vdCBnZXR0aW5nIHlvdXIgcG9pbnQuIFdoYXQg
dGhlIGFib3ZlIHRlbGxzCj4+IHVzIGlzIHRoYXQgc3RhdGljIHN5bWJvbHMgbWF5IHN0YXJ0IHdp
dGggYW4gdW5kZXJzY29yZSAoYnV0Cj4+IG5vdCBmb2xsb3dlZCBieSBhbm90aGVyIG9uZSBvciBh
biB1cHBlcmNhc2UgbGV0dGVyKS4gTm9uLXN0YXRpYwo+PiBzeW1ib2xzIG1heSBub3QuCj4+Cj4+
Pj4+IEFueXdheSwgaG93IGFib3V0IGNhbGxpbmcgaXQgY21kbGluZV9zdHJuY21wKCk/IFRoaXMg
d291bGQgYmUgZWFzaWVyIHRvCj4+Pj4+IHNwb3QgbWlzdXNlIG9uIHJldmlldyAoaS5lIHVzaW5n
IHN0cm5jbXAoKSByYXRoZXIgdGhhbiBfc3RybmNtcCgpKS4KPj4+Pgo+Pj4+IFdlIGFscmVhZHkg
aGF2ZSBjbWRsaW5lX3N0cmNtcCgpLCBvciBlbHNlIEkgd291bGQgaW5kZWVkIGhhdmUgdXNlZAo+
Pj4+IHRoaXMgcHJlZml4LiBObyBwcmVmaXggKG90aGVyIHRoYW4gdGhlIGxvbmUgdW5kZXJzY29y
ZSkgc2VlbWVkIHRoZQo+Pj4+IG5leHQgYmVzdCBvcHRpb24uCj4+Pgo+Pj4gQXMgd2UgcGFyc2Ug
YW4gb3B0aW9uLCBob3cgYWJvdXQgb3B0X3N0cm5jbXAoKT8KPj4KPj4gSSdkIHN0aWxsIGxpa2Ug
X3N0cm5jbXAoKSBiZXR0ZXIgaGVyZS4KPiAKPiBXaHk/ICBJdCBkb2Vzbid0IHRlbGwgeW91IGFu
eXRoaW5nIGF0IGFsbCBhYm91dCB3aGF0J3Mgc3BlY2lhbCBhYm91dCB0aGUKPiBmdW5jdGlvbi4g
IEluIGZhY3QsIEknZCBzYXkgaXQncyBjb25mdXNpbmcgLS0gdGhlICJfIiBkb2Vzbid0IG5vcm1h
bGx5Cj4gbWVhbiwgImRvIHNvbWV0aGluZyBkaWZmZXJlbnQgYW5kIHNwZWNpYWwiLCBidXQgImRv
IHRoZSBjb3JlIG9mCj4gc29tZXRoaW5nIHdoaWNoIG90aGVyIHRoaW5ncyBtaWdodCBjYWxsIi4K
PiAKPiBJJ2QgbXVjaCBwcmVmZXIgb3B0X3N0cm5jbXAoKSB0aGFuIF9zdHJuY21wKCkuCgpOb3Rl
ZCAtIHdpbGwgZG8uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
