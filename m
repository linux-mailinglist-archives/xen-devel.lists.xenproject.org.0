Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B8010CA54
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:26:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKi2-0006Be-6p; Thu, 28 Nov 2019 14:23:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaKhz-0006BZ-SL
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:23:51 +0000
X-Inumbo-ID: b25f943a-11ea-11ea-a3d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b25f943a-11ea-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 14:23:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C33B7B2F0;
 Thu, 28 Nov 2019 14:23:49 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <bba7474f-a9f7-0486-627d-16841436714a@suse.com>
Message-ID: <a8d87e72-7abf-a5b3-2ae1-86c33d5a6550@suse.com>
Date: Thu, 28 Nov 2019 15:23:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <bba7474f-a9f7-0486-627d-16841436714a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: StefanoStabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 IanJackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxMDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMTEuMjAxOSAx
OToxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjEvMTEvMjAxOSAwODozNCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyMC4xMS4yMDE5IDE4OjEzLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDIwLzExLzIwMTkgMTY6NDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+IE9u
IDIwLjExLjE5IDE3OjMwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA4LjExLjIwMTkg
MTI6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IFRoZSAuZmlsZSBhc3NlbWJsZXIgZGly
ZWN0aXZlcyBnZW5lcmF0ZWQgYnkgdGhlIGNvbXBpbGVyIGRvIG5vdCBpbmNsdWRlCj4+Pj4+Pj4g
YW55IHBhdGggY29tcG9uZW50cyAoZ2NjKSBvciBqdXN0IHRoZSBvbmVzIHNwZWNpZmllZCBvbiB0
aGUgY29tbWFuZAo+Pj4+Pj4+IGxpbmUKPj4+Pj4+PiAoY2xhbmcsIGF0IGxlYXN0IHZlcnNpb24g
NSksIGFuZCBoZW5jZSBtdWx0aXBsZSBpZGVudGljYWxseSBuYW1lZAo+Pj4+Pj4+IHNvdXJjZQo+
Pj4+Pj4+IGZpbGVzIChpbiBkaWZmZXJlbnQgZGlyZWN0b3JpZXMpIG1heSBwcm9kdWNlIGlkZW50
aWNhbGx5IG5hbWVkIHN0YXRpYwo+Pj4+Pj4+IHN5bWJvbHMgKGluIHRoZWlyIGthbGxzeW1zIHJl
cHJlc2VudGF0aW9uKS4gVGhlIGJpbmFyeSBkaWZmaW5nCj4+Pj4+Pj4gYWxnb3JpdGhtCj4+Pj4+
Pj4gdXNlZCBieSB4ZW4tbGl2ZXBhdGNoLCBob3dldmVyLCBkZXBlbmRzIG9uIGhhdmluZyB1bmlx
dWUgc3ltYm9scy4KPj4+Pj4+Pgo+Pj4+Pj4+IE1ha2UgdGhlIEVORk9SQ0VfVU5JUVVFX1NZTUJP
TFMgS2NvbmZpZyBvcHRpb24gY29udHJvbCB0aGUgKGJ1aWxkKQo+Pj4+Pj4+IGJlaGF2aW9yLCBh
bmQgaWYgZW5hYmxlZCB1c2Ugb2JqY29weSB0byBwcmVwZW5kIHRoZSAocmVsYXRpdmUgdG8gdGhl
Cj4+Pj4+Pj4geGVuLyBzdWJkaXJlY3RvcnkpIHBhdGggdG8gdGhlIGNvbXBpbGVyIGludm9rZWQg
U1RUX0ZJTEUgc3ltYm9scy4gTm90ZQo+Pj4+Pj4+IHRoYXQgdGhpcyBidWlsZCBvcHRpb24gaXMg
bWFkZSBubyBsb25nZXIgZGVwZW5kIG9uIExJVkVQQVRDSCwgYnV0Cj4+Pj4+Pj4gbWVyZWx5Cj4+
Pj4+Pj4gZGVmYXVsdHMgdG8gaXRzIHNldHRpbmcgbm93Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ29uZGl0
aW9uYWxpemUgZXhwbGljaXQgLmZpbGUgZGlyZWN0aXZlIGluc2VydGlvbiBpbiBDIGZpbGVzIHdo
ZXJlIGl0Cj4+Pj4+Pj4gZXhpc3RzIGp1c3QgdG8gZGlzYW1iaWd1YXRlIG5hbWVzIGluIGEgbGVz
cyBnZW5lcmljIG1hbm5lcjsgbm90ZSB0aGF0Cj4+Pj4+Pj4gYXQgdGhlIHNhbWUgdGltZSB0aGUg
cmVkdW5kYW50IGVtaXNzaW9uIG9mIFNUVF9GSUxFIHN5bWJvbHMgZ2V0cwo+Pj4+Pj4+IHN1cHBy
ZXNzZWQgZm9yIGNsYW5nLiBBc3NlbWJsZXIgZmlsZXMgYXMgd2VsbCBhcyBtdWx0aXBseSBjb21w
aWxlZCBDCj4+Pj4+Pj4gb25lcyB1c2luZyBfX09CSkVDVF9GSUxFX18gYXJlIGxlZnQgYWxvbmUg
Zm9yIHRoZSB0aW1lIGJlaW5nLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2luY2Ugd2Ugbm93IGV4cGVjdCB0
aGVyZSBub3QgdG8gYmUgYW55IGR1cGxpY2F0ZXMgYW55bW9yZSwgYWxzbyBkb24ndAo+Pj4+Pj4+
IGZvcmNlIHRoZSBzZWxlY3Rpb24gb2YgdGhlIG9wdGlvbiB0byAnbicgYW55bW9yZSBpbiBhbGxy
YW5kb20uY29uZmlnLgo+Pj4+Pj4+IFNpbWlsYXJseSBDT1ZFUkFHRSBubyBsb25nZXIgc3VwcHJl
c3NlcyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIGlmCj4+Pj4+Pj4gZW5mb3JjZW1lbnQgaXMg
aW4gZWZmZWN0LCB3aGljaCBpbiB0dXJuIGFsbG93cwo+Pj4+Pj4+IFNVUFBSRVNTX0RVUExJQ0FU
RV9TWU1CT0xfV0FSTklOR1MgdG8gc2ltcGx5IGRlcGVuZCBvbgo+Pj4+Pj4+ICFFTkZPUkNFX1VO
SVFVRV9TWU1CT0xTLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+Pj4gSSd2ZSBnb3QgYWNrcyBmcm9tIEtvbnJhZCBhbmQg
V2VpLCBidXQgc3RpbGwgbmVlZCBhbiB4ODYgYW5kIGEgcmVsZWFzZQo+Pj4+Pj4gb25lIGhlcmUu
IEFuZHJldz8gT3IgYWx0ZXJuYXRpdmVseSAtIErDvHJnZW4sIHdvdWxkIHlvdSByYXRoZXIgbm90
IHNlZQo+Pj4+Pj4gdGhpcyBnbyBpbiBhbnltb3JlPwo+Pj4+PiBJbiBjYXNlIHRoZSBuZWVkZWQg
eDg2IEFjayBpcyBjb21pbmcgaW4gYmVmb3JlIFJDMyBJJ20gZmluZSB0byBnaXZlIG15Cj4+Pj4+
IFJlbGVhc2UtYWNrLCBidXQgSSdtIGhlc2l0YW50IHRvIHRha2UgaXQgbGF0ZXIuCj4+Pj4gSGFz
IGFueW9uZSBhY3R1YWxseSB0cmllZCBidWlsZGluZyBhIGxpdmVwYXRjaCB3aXRoIHRoaXMgY2hh
bmdlIGluIHBsYWNlPwo+Pj4gQWN0dWFsbHkgLSB3aGF0IGlzIHlvdXIgY29uY2VybiBoZXJlPyBU
aGUgZXhhY3Qgc3BlbGxpbmcgb2Ygc3ltYm9scwo+Pj4gbmFtZXMgc2hvdWxkIGJlIG9mIG5vIGlu
dGVyZXN0IHRvIHRoZSB0b29sLiBBZnRlciBhbGwgdGhlIGNvbXBpbGVyIGlzCj4+PiBmcmVlIHRv
IGludmVudCBhbGwgc29ydHMgb2YgbmFtZXMgZm9yIGl0cyBsb2NhbCBzeW1ib2xzLCBpbmNsdWRp
bmcKPj4+IHRoZSBvbmVzIHdlIHdvdWxkIHByb2R1Y2Ugd2l0aCB0aGlzIGNoYW5nZSBpbiBwbGFj
ZS4gQWxsIHRoZSB0b29sCj4+PiBjYXJlcyBhYm91dCBpcyB0aGF0IHRoZSBuYW1lcyBiZSB1bmFt
YmlndW91cy4gSGVuY2UgYW55ICh0aGVvcmV0aWNhbCkKPj4+IHJlZ3Jlc3Npb24gaGVyZSB3b3Vs
ZCBiZSBhIGJ1ZyBpbiB0aGUgdG9vbHMsIHdoaWNoIGltbyBpcyBubyByZWFzb24KPj4+IHRvIGRl
bGF5IHRoaXMgY2hhbmdlIGFueSBmdXJ0aGVyLiAoR3JhbnRlZCBJIHNob3VsZCBoYXZlIGdvdCB0
byBpdAo+Pj4gZWFybGllciwgYnV0IGl0IGhhZCBiZWVuIGNvbnRpbnVpbmcgdG8gZ2V0IGRlZmVy
cmVkLikKPj4KPj4gVGhpcyBtaWdodCBhbGwgYmUgdHJ1ZSAodGhlb3JldGljYWxseSkuCj4+Cj4+
IFRoZSBsaXZlcGF0Y2ggYnVpbGQgdG9vbHMgYXJlIGZyYWdpbGUgYW5kIHZlcnkgc2Vuc2l0aXZl
IHRvIGhvdyB0aGUKPj4gb2JqZWN0IGZpbGVzIGFyZSBsYWlkIG91dC7CoCBUaGVyZSBpcyBhIHZl
cnkgcmVhbCByaXNrIHRoYXQgdGhpcyBjaGFuZ2UKPj4gYWNjaWRlbnRhbGx5IGJyZWFrcyBsaXZl
cGF0Y2hpbmcgdG90YWxseSwgZXZlbiBvbiBHQ0MgYnVpbGRzLgo+Pgo+PiBXZXJlIHRoaXMgdG8g
aGFwcGVuLCBpdCB3b3VsZCBiZSB5ZXQgYW5vdGhlciA0LjEzIHJlZ3Jlc3Npb24uCj4gCj4gSXQn
cyBwZXJoYXBzIGEgbWF0dGVyIG9mIHBlcmNlcHRpb24sIGJ1dCBJJ2Qgc3RpbGwgY2FsbCB0aGlz
IGEKPiBsaXZlIHBhdGNoaW5nIHRvb2xzIGJ1ZyB0aGVuLCBub3QgYSA0LjEzIHJlZ3Jlc3Npb24u
Cj4gCj4+IFRoaXMgaXMgYSBjaGFuZ2UgdG8gZml4IGEgY29uY3JldGUgbGl2ZXBhdGNoIGlzc3Vl
IHdpdGggQ2xhbmcuwqAgU3VyZSAtCj4+IGl0IHJlc29sdmVzIHRoZSBzeW1ib2wgdW5pcXVlbmVz
cyBmYWlsdXJlcyBmb3IgdGhlIGluLXRyZWUgYnVpbGQsIGJ1dAo+PiBjb25zaWRlcmluZyB0aGUg
cmlza3MgdG8gdGhlIGFyZWEgeW91IGFyZSBtb2RpZnlpbmcsIHRoZSBmYWN0IHlvdQo+PiBoYXZl
bid0IGV2ZW4gZG9uZSBhIGRldiB0ZXN0IG9mIGEgbGl2ZXBhdGNoIGJ1aWxkIG9uIEdDQyBtZWFu
cyB0aGF0IHRoZQo+PiBwYXRjaCBhcyBhIHdob2xlIGhhcyBub3QgaGFkIHdoYXQgSSB3b3VsZCBj
b25zaWRlciBhIHJlYXNvbmFibGUgYW1vdW50Cj4+IG9mIHRlc3RpbmcuCj4gCj4gV2hpbGUgQ2xh
bmcgaXMgdGhlIHByaW1hcnkgYXJlYSB3aGVyZSB3ZSBuZWVkIHRoaXMgY2hhbmdlLCBpdCBpcwo+
IGluIG5vIHdheSBsaW1pdGVkIHRvIHRoYXQgZW52aXJvbm1lbnQuIEdjYyBjYW4sIGF0IGFueSB0
aW1lLAo+IHN0YXJ0IHRyaWdnZXJpbmcgdGhlIGlzc3VlIGFnYWluIGFzIHdlbGwgLSBib3RoIGJl
Y2F1c2Ugb2YgY2hhbmdlcwo+IHRvIHRoZSBjb21waWxlciBpdHNlbGYsIG9yIGJlY2F1c2Ugb2Yg
KHBlcmhhcHMgc2VlbWluZ2x5IGlubm9jZW50KQo+IGNoYW5nZXMgd2UgZG8gdG8gWGVuLiBJIGNh
bid0IGltYWdpbmUgdGhlIHdvcmthcm91bmQgZm9yIHRoaXMKPiB3b3VsZCBiZSB0byBtYWtlIGl0
IGltcG9zc2libGUgYWx0b2dldGhlciB0byBzZWxlY3QgTElWRVBBVENIPXkuCgpBbmQgaW5kZWVk
IC0gb24gbXkgYm94IHdpdGggZ2NjIDQuMywgYSBmdWxsIGZyZXNoIGJ1aWxkIGZhaWxzIHdpdGgK
dHdvIGR1cGxpY2F0ZSBzeW1ib2xzLiBSb2dlcidzIHdvcmthcm91bmQgdGhlcmVmb3JlIGlzIG5v
dCBlbm91Z2gKaW4gYW55IGV2ZW50IGZvciA0LjEzLCB1bmxlc3Mgd2Ugd2FudCB0byAtIGluIHRo
ZSBsYXN0IG1pbnV0ZSAtCnJhaXNlIHRoZSBiYXIgb2Ygd2hhdCBnY2MgdmVyc2lvbnMgd2UgY2xh
aW0gY29tcGF0aWJpbGl0eSB3aXRoLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
