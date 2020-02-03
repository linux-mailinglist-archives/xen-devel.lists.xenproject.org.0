Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E28150A1F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:45:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydrk-0004Dc-6q; Mon, 03 Feb 2020 15:42:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iydri-0004DK-Ms
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:42:22 +0000
X-Inumbo-ID: c461730c-469b-11ea-ad98-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c461730c-469b-11ea-ad98-bc764e2007e4;
 Mon, 03 Feb 2020 15:42:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iydrg-0004vp-II; Mon, 03 Feb 2020 15:42:20 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iydrg-0007eJ-8k; Mon, 03 Feb 2020 15:42:20 +0000
Date: Mon, 3 Feb 2020 15:42:17 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203154217.22yp2qqj4itbzbml@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200203150154.GZ4679@Air-de-Roger>
 <20200203150724.bdnhkkyrntsdvxpl@debian>
 <20200203152106.GA4679@Air-de-Roger>
 <e64af101-1f13-c7e7-6ffe-6afd5db9393b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e64af101-1f13-c7e7-6ffe-6afd5db9393b@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDQ6MzI6NTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDIuMjAyMCAxNjoyMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgRmViIDAzLCAyMDIwIGF0IDAzOjA3OjI0UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4g
Pj4gT24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDQ6MDE6NTRQTSArMDEwMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+Pj4gT24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6NDk6MjRQTSArMDAw
MCwgV2VpIExpdSB3cm90ZToKPiA+Pj4+IEh5cGVyLVYgdXNlcyBhIHRlY2huaXF1ZSBjYWxsZWQg
b3ZlcmxheSBwYWdlIGZvciBpdHMgaHlwZXJjYWxsIHBhZ2UuIEl0Cj4gPj4+PiB3aWxsIGluc2Vy
dCBhIGJhY2tpbmcgcGFnZSB0byB0aGUgZ3Vlc3Qgd2hlbiB0aGUgaHlwZXJjYWxsIGZ1bmN0aW9u
YWxpdHkKPiA+Pj4+IGlzIGVuYWJsZWQuIFRoYXQgbWVhbnMgd2UgY2FuIHVzZSBhIHBhZ2UgdGhh
dCBpcyBub3QgYmFja2VkIGJ5IHJlYWwKPiA+Pj4+IG1lbW9yeSBmb3IgaHlwZXJjYWxsIHBhZ2Uu
Cj4gPj4+Pgo+ID4+Pj4gVXNlIHRoZSB0b3AtbW9zdCBhZGRyZXNzYWJsZSBwYWdlIGZvciB0aGF0
IHB1cnBvc2UuIEFkanVzdCBlODIwIG1hcAo+ID4+Pj4gYWNjb3JkaW5nbHkuCj4gPj4+Cj4gPj4+
IENhbiB5b3UgYWRkIHRoaXMgaXMgZG9uZSB0byBhdm9pZCBwYWdlIHNoYXR0ZXJpbmcgYW5kIHRv
IG1ha2Ugc3VyZQo+ID4+PiBYZW4gaXNuJ3Qgb3ZlcndyaXRpbmcgYW55IE1NSU8gYXJlYSB3aGlj
aCBtaWdodCBiZSBwcmVzZW50IGF0IGxvd2VyCj4gPj4+IGFkZHJlc3Nlcz8KPiA+Pgo+ID4+IE5Q
Lgo+ID4+Cj4gPj4+Cj4gPj4+PiArCj4gPj4+PiArc3RhdGljIHZvaWQgX19pbml0IGU4MjBfZml4
dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCj4gPj4+PiArewo+ID4+Pj4gKyAgICB1aW50NjRfdCBz
ID0gSFZfSENBTExfTUZOIDw8IFBBR0VfU0hJRlQ7Cj4gPj4+PiArCj4gPj4+PiArICAgIGlmICgg
IWU4MjBfYWRkX3JhbmdlKGU4MjAsIHMsIHMgKyBQQUdFX1NJWkUsIEU4MjBfUkVTRVJWRUQpICkK
PiA+Pj4KPiA+Pj4gSSB0aGluayBlbmQgc2hvdWxkIGJlIHMgKyBQQUdFX1NJWkUgLSAxLCBvciBl
bHNlIGl0IGV4cGFuZHMgYWNyb3NzIHR3bwo+ID4+PiBwYWdlcz8KPiA+Pgo+ID4+IE5vLCBpdCBz
aG91bGRuJ3QuCj4gPj4KPiA+PiBFODIwIGVudHJ5IHJlY29yZHMgdGhlIHNpemUgb2YgdGhlIHJl
Z2lvbiwgd2hpY2ggaXMgY2FsY3VsYXRlZCBhcwo+ID4+IGVuZC1zdGFydC4gVGhlIG9uZSB1c2Fn
ZSBpbiBwdi9zaGltLmMgZm9sbG93cyB0aGUgc2FtZSBwYXR0ZXJuIGhlcmUuCj4gPiAKPiA+IEht
LCBJIHNlZS4gSSdtIG5vdCBzdXJlIHRoaXMgaXMgY29ycmVjdCwgSSB0aGluayB0aGUgZTgyMCBl
bnRyeQo+ID4gc2hvdWxkIGxvb2sgbGlrZToKPiA+IAo+ID4gYWRkciA9IHM7Cj4gPiBzaXplID0g
UEFHRV9TSVpFIC0gMTsKPiA+IAo+ID4gQXMgcmFuZ2VzIG9uIHRoZSBlODIwIGFyZSBpbmNsdXNp
dmUsIHNvIGlmIHNpemUgZW5kcyB1cCBiZWluZwo+ID4gUEFHRV9TSVpFIHRoZW4gdGhlIGVudHJ5
IHdvdWxkIGV4cGFuZCBhY3Jvc3MgdHdvIHBhZ2VzLgo+IAo+IFJhbmdlcyBjYW4gc2Vuc2libHkg
YmUgaW5jbHVzaXZlIG9ubHkgd2hlbiBzcGVjaWZpZWQgYXMgW3N0YXJ0LGVuZF0KPiB0dXBsZXMu
IChzdGFydCxzaXplKSBwYWlycyBtYWtlIG5vIHNlbnNlIGZvciByZXByZXNlbnRpbmcKPiBbc3Rh
cnQsc3RhcnQrc2l6ZV0sIHRoZXkgb25seSBtYWtlIHNlbnNlIGZvciBbc3RhcnQsc3RhcnQrc2l6
ZSkuCj4gT3RoZXJ3aXNlLCBhcyBpbiB5b3VyIGV4YW1wbGUgYWJvdmUsIHNpemUgdGFrZW4gb24g
aXRzIG93biBpcyBvZmYKPiBieSBvbmUgKGkuZS4gaXMgcmF0aGVyICJsYXN0IGJ5dGUiIHRoYW4g
InNpemUiKS4KPiAKPiBNb2Rlcm4gTGludXgsIHdoZW4gbG9nZ2luZyB0aGUgbWVtb3J5IG1hcCwg
aW5kZWVkIHN1YnRyYWN0cyAxIGZyb20KPiB0aGUgc3VtIG9mIGFkZHIgYW5kIHNpemUsIHRvIHNo
b3cgYW4gaW5jbHVzaXZlIHJhbmdlLgoKV2Ugc2hvdWxkIHBlcmhhcHMgZG8gdGhlIHNhbWUgdGhl
bi4KCklmIHBlb3BsZSBhZ3JlZSB0aGlzIGlzIHRoZSB3YXkgdG8gZ28sIEkgY2FuIHdyaXRlIGEg
cGF0Y2guCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
