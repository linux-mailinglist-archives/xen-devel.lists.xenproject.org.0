Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC690C493F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 10:14:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZjl-0008Ji-H0; Wed, 02 Oct 2019 08:11:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFZjk-0008Jd-3R
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 08:11:52 +0000
X-Inumbo-ID: 487cf22c-e4ec-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 487cf22c-e4ec-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 08:11:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 88B28ACC6;
 Wed,  2 Oct 2019 08:11:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930191610.27545-1-andrew.cooper3@citrix.com>
 <f8eb4fdc-bec8-a6cd-2657-f163169eeee5@suse.com>
 <41d5ccea-b58c-ed3b-5cc8-8966d2850125@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2d26eef-521a-02b6-68b1-5477530c8901@suse.com>
Date: Wed, 2 Oct 2019 10:11:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <41d5ccea-b58c-ed3b-5cc8-8966d2850125@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/typesafe: Force helpers to be
 always_inline
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAyMjo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMC8yMDE5
IDA5OjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzAuMDkuMjAxOSAyMToxNiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IENsYW5nIGluIHBhcnRpY3VsYXIgaGFzIGEgaGFiaXQgb2Ygb3V0
LW9mLWxpbmluZyB0aGVzZSBhbmQgY3JlYXRpbmcgbXVsdGlwbGUKPj4+IGxvY2FsIGNvcGllcyBv
ZiBfbWZuKCkgYW5kIG1mbl94KCksIGV0Yy4gIE92ZXJyaWRlIHRoaXMgYmVoYXZpb3VyLgo+PiBJ
cyBzcGVjaWFsIGNhc2luZyB0aGUgdHlwZXNhZmUgaGVscGVycyB0aGVuIHRoZSByaWdodCBhcHBy
b2FjaD8gVGhlCj4+IGZ1bmRhbWVudGFsIGlkZWEgYWZ0ZXIgYWxsIGlzIHRvIGxldCB0aGUgY29t
cGlsZXIgZGVjaWRlLiBJIGNlcnRhaW5seQo+PiBhZ3JlZSB0aGF0IG5vdCBpbmxpbmluZyBzdWNo
IHRyaXZpYWwgZnVuY3Rpb25zIGRlc3BpdGUgdGhlIGlubGluZQo+PiBrZXl3b3JkIGxvb2tzIGZh
ciBmcm9tIG9wdGltYWwsIGJ1dCBpZiB0aGVyZSdzIHN1Y2ggYSBnZW5lcmFsIGlzc3VlCj4+IHdp
dGggY2xhbmcsIHNob3VsZG4ndCB3ZSBtYWtlICJpbmxpbmUiIGV4cGFuZCB0byAiYWx3YXlzX2lu
bGluZSIKPj4gdW5pZm9ybWx5Pwo+IAo+IElubGluZSBoYW5kaW5nIGlzIGEgbWVzcy4KPiAKPiBX
ZSBjdXJyZW50bHkgZGVmaW5lIGlubGluZSB0byBfX2lubGluZV9fLsKgIFVuZG9pbmcgdGhpcyBy
ZXN1bHRzIGluIGJ1aWxkCj4gZmFpbHVyZXMuCj4gCj4gTGludXggY3VycmVudGx5IGRlZmluZXMg
aW5saW5lIHRvIGFsd2F5c19pbmxpbmUgYW5kIHRoZXkgYXJlIGRlc3BlcmF0ZWx5Cj4gdHJ5aW5n
IHRvIHVuZG8gdGhpcyAobWlzKWJlaGF2aW91ci4KPiAKPiBUaGVyZSBhcmUgYSBmZXcgdXNlcyBv
ZiBhbHdheXNfaW5saW5lIGZvciBzYWZldHkgcHVycG9zZXMgKHRoZQo+IHNwZWN1bGF0aXZlIGhl
bHBlcnMpLsKgIE1vc3QgdXNlcyBvZiBhbHdheXNfaW5saW5lIGxvb2sgdG8gYmUgd29ya2Fyb3Vu
ZHMKPiBmb3IgdGhlIHNpemUtb2YtYXNtIGJ1Zy8obWlzKWZlYXR1cmUuCj4gCj4gSW4gYW4gaWRl
YWwgd29ybGQsIHdlIHdvdWxkbid0IG5lZWQgaXQgYXQgYWxsLCBidXQgSSBkZWZpbml0ZWx5IGRv
bid0Cj4gdGhpbmsgdGhhdCB0YWtpbmcgdGhlIExpbnV4IGFwcHJvYWNoIGlzIGEgY2xldmVyIG1v
dmUuwqAgV2UgZGVmaW5pdGVseQo+IGhhdmUgc29tZSBzdGF0aWMgaW5saW5lcyB3aGljaCB3b3Vs
ZCBiZXR0ZXIgbm90IGJlaW5nIGlubGluZS4KCklPVyB5b3VyIHN1Z2dlc3RlZCBhcHByb2FjaCAo
YXQgbGVhc3QgZm9yIHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUpIGlzIHRvCmRvIHdoYXQgeW91IGRv
IGhlcmUgYW5kIGNvbnZlcnQgaW5saW5lIHRvIGFsd2F5c19pbmxpbmUgYXMgd2Ugc2VlIGZpdD8K
SWYgc28sIHdlIHNob3VsZCBhdCBsZWFzdCBzZXR0bGUgb24gc29tZSBzdWZmaWNpZW50bHkgZmly
bSBjcml0ZXJpYSBieQp3aGljaCBzdWNoIGEgY29udmVyc2lvbiB3b3VsZCBiZSBqdXN0aWZpYWJs
ZS4KClNlZWluZyB0aGF0IHRoaXMgaXMgcHJpbWFyaWx5IHRvIGhlbHAgY2xhbmcgLSBkaWQgeW91
IGNvbnNpZGVyCmludHJvZHVjaW5nIHNvbWV0aGluZyBsaWtlIGNsYW5nX2lubGluZSwgZXhwYW5k
aW5nIHRvIGp1c3QgaW5saW5lIGZvcgpnY2MsIGJ1dCBhbHdheXNfaW5saW5lIGZvciBjbGFuZz8g
VGhpcyB3b3VsZCBhdCBsZWFzdCBwcm92aWRlIGEKc3VmZmljaWVudGx5IGVhc3kgd2F5IHRvIHVu
ZG8gdGhpcyBpZiBhIGJldHRlciBjbGFuZy1zaWRlIGFwcHJvYWNoIGNhbgpiZSBmb3VuZCBkb3du
IHRoZSByb2FkLgoKRnVydGhlcm1vcmUsIHdvdWxkbid0IHRoZSBsaXZlcGF0Y2ggYXNwZWN0IG9m
IHRoaXMgYmUgdGFrZW4gY2FyZSBvZgpieSBteSBwbGFuIHRvIHByZWZpeCBmaWxlbmFtZXMgKGlu
IHR1cm4gcHJlZml4aW5nIHN0YXRpYyBzeW1ib2wgbmFtZXMKaW4gb3VyIGthbGxzeW1zKSB3aXRo
IHRoZWlyIChyZWxhdGl2ZSkgcGF0aHM/IElmIHNvLCByYXRoZXIgdGhhbgpmdXJ0aGVyaW5nIHRo
ZSBtZXNzIGhlcmUsIHNob3VsZCBJIHNlZSBhYm91dCBhY3R1YWxseSBtYWtpbmcgdGhpcwp3b3Jr
IChhZGRyZXNzaW5nIGEgd2lkZXIgcmFuZ2Ugb2YgY2FzZXMsIGluY2x1ZGluZyBnY2MgY29tcGls
ZWQgY29kZQppbiBhIGZldyBpbnN0YW5jZXMpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
