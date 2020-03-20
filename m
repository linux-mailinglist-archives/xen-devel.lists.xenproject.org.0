Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8E18D2D4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 16:25:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFJV2-00068v-Fw; Fri, 20 Mar 2020 15:23:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ak30=5F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jFJV1-00068o-6E
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 15:23:51 +0000
X-Inumbo-ID: ccd0e1d4-6abe-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccd0e1d4-6abe-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 15:23:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 23C6CABD7;
 Fri, 20 Mar 2020 15:23:49 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>, Ian Jackson <ian.jackson@citrix.com>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
 <b9535ad9a1cc8a7c3a9aeb2fc5e7ea7560966ebb.camel@infradead.org>
 <336e14a1-2c8b-8257-de40-3c6305a4ffcb@suse.com>
 <24180.53085.835170.696701@mariner.uk.xensource.com>
 <8c5ccb8d5f3cb3426b5782cc80391c9f8bcb71b8.camel@infradead.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <af5af47c-31ab-09bd-2f05-e5e2ce34780d@suse.com>
Date: Fri, 20 Mar 2020 16:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8c5ccb8d5f3cb3426b5782cc80391c9f8bcb71b8.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort
 xenstore-ls if a node disappears while iterating
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
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAgMTU6NTgsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPiBPbiBGcmksIDIwMjAt
MDMtMjAgYXQgMTQ6MTIgKzAwMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+PiBKw7xyZ2VuIEdyb8Of
IHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMS8yXSB0b29scy94ZW5zdG9yZTogRG8g
bm90IGFib3J0IHhlbnN0b3JlLWxzIGlmIGEgbm9kZSBkaXNhcHBlYXJzIHdoaWxlIGl0ZXJhdGlu
ZyIpOgo+Pj4gTm8sIHlvdSBqdXN0IGRvbid0IGNhcmUgZm9yIHRoZSB0cmFuc2FjdGlvbiB0byBz
dWNjZWVkIG9yIGZhaWwgKElNTyBpdAo+Pj4gc2hvdWxkIG5ldmVyIGZhaWwgYXMgeW91IGFyZSBy
ZWFkaW5nIG9ubHkpLgo+Pj4KPj4+IFNvIGp1c3Qgd3JhcCBldmVyeXRoaW5nIGludG8gYSB0cmFu
c2FjdGlvbi4KPj4KPj4gWWVzLiAgeGVuc3RvcmVkIHdpbGwgZG8gdGhlIG5lZWRlZCBidWZmZXJp
bmcuCj4+Cj4+IEkgdGhpbmsgaW4gcHJpbmNpcGxlIHRoZXJlIGlzIGEgcmlzayBoZXJlIHRoYXQg
dGhlIHRyYW5zYWN0aW9uIG1pZ2h0Cj4+IHJ1biBmb3IgYSBsb25nIHRpbWUsIGlmIHRoZSBvdXRw
dXQgZnJvbSB4ZW5zdG9yZS1scyBnb2VzIHRvIHNvbWV0aGluZwo+PiB0aGF0IGJsb2NrcyAoZWcg
YSBwYWdlcikgYW5kIGNhbid0IGJlIHdyaXR0ZW4gYWxsIGF0IG9uY2UuCj4+Cj4+IEJ1dCBpZiB0
aGlzIGlzIGEgcHJvYmxlbSBpdCBpcyBhIHByb2JsZW0gYWZmbGljdGluZyB4ZW5zdG9yZWQsIG5v
dAo+PiB4ZW5zdG9yZS1scy4KPj4KPj4gSWFuLgo+IAo+IAo+IFNvIGlmIEkgZG8gdGhpcy4uLgo+
IAo+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlX2NsaWVudC5jCj4gKysrIGIvdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVfY2xpZW50LmMKPiBAQCAtNjU4LDcgKzY1OCw2IEBAIG1haW4oaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQo+ICAgICAgIGNhc2UgTU9ERV93cml0ZToKPiAgICAgICAgICB0
cmFuc2FjdGlvbiA9IChhcmdjIC0gc3dpdGNoX2FyZ3YgLSBvcHRpbmQpID4gMjsKPiAgICAgICAg
ICBicmVhazsKPiAtICAgIGNhc2UgTU9ERV9sczoKPiAgICAgICBjYXNlIE1PREVfd2F0Y2g6Cj4g
ICAgICAgICAgdHJhbnNhY3Rpb24gPSAwOwo+ICAgICAgICAgIGJyZWFrOwo+IEBAIC02ODMsNiAr
NjgyLDcgQEAgYWdhaW46Cj4gICAgICAgICAgeHRoID0geHNfdHJhbnNhY3Rpb25fc3RhcnQoeHNo
KTsKPiAgICAgICAgICBpZiAoeHRoID09IFhCVF9OVUxMKQo+ICAgICAgICAgICAgICBlcnJ4KDEs
ICJjb3VsZG4ndCBzdGFydCB0cmFuc2FjdGlvbiIpOwo+ICsgICAgICAgIHByaW50Zigic3RhcnRl
ZCB0cmFuc2FjdGlvblxuIik7Cj4gICAgICAgfQo+ICAgCj4gICAgICAgcmV0ID0gcGVyZm9ybSht
b2RlLCBvcHRpbmQsIGFyZ2MgLSBzd2l0Y2hfYXJndiwgYXJndiArIHN3aXRjaF9hcmd2LCB4c2gs
IHh0aCwgcHJlZml4LCB0aWR5LCB1cHRvLCByZWN1cnNlLCBucl93YXRjaGVzLCByYXcpOwo+IAo+
IAo+IC4uLiBhbmQgdGhlbiByZXBlYXQgbXkgdGVzdCBjYXNlIGFzIHNob3duIGluIFtQQVRDSCAx
LzFdLCBJIHNob3VsZCBubwo+IGxvbmdlciBzZWUuLi4KPiAKPiB4ZW5zdG9yZS1sczoKPiBjb3Vs
ZCBub3QgYWNjZXNzIHBlcm1pc3Npb25zIGZvciA0MDc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkKPiB4ZW5zdG9yZS1sczogaW4geHNfZGlyZWN0b3J5ICgvbG9jYWwvZG9tYWluLzIvZm9vLzQw
Nyk6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAwCj4gCj4gCj4gQnV0IGl0IGRvZXMgc3Rp
bGwgaGFwcGVuLiBBbmQgZXZlbiBpZiBJIHR1cm4gdGhlIGVycngoKSBpbnRvIGEgd2FybigpCj4g
dG8gc3RvcCBpdCBhYm9ydGluZywgYW5kIGFkZCBhIHdhcm4oKSB3aGVuIHRoZSB4c190cmFuc2Fj
dGlvbl9lbmQoKQo+IHJldHVybnMgRUFHQUlOLi4uIHRoYXQgaXNuJ3QgaGFwcGVuaW5nIGVpdGhl
ci4gSSdtIGp1c3QgZ2V0dGluZwo+IGluY29uc2lzdGVudCBkYXRhLCB3aXRoaW4gYSB0cmFuc2Fj
dGlvbi4KCkhtbSwgeWVzLCB0aGlua2luZyBtb3JlIGFib3V0IGl0OiBhIG5vbi10cmFuc2FjdGlv
bmFsIHdyaXRlIG9mIGEgbm9kZQp3aGljaCBoYXNuJ3QgYmVlbiB3cml0dGVuIG9yIHJlYWQgYnkg
YW4gb25nb2luZyB0cmFuc2FjdGlvbiBpcyBub3QKaGFuZGxlZCBpbiBhIHNwZWNpYWwgd2F5LiBU
aGlzIGNvdWxkIGJlIGNoYW5nZWQsIGJ1dCB3b3VsZCByZXF1aXJlIHNvbWUKc3RydWN0dXJhbCBj
aGFuZ2VzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
