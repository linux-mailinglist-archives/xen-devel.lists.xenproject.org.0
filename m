Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED9B1394E1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 16:33:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir1fi-0008H6-Gy; Mon, 13 Jan 2020 15:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ir1fg-0008H1-60
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 15:30:28 +0000
X-Inumbo-ID: 9a5c2076-3619-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a5c2076-3619-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 15:30:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20E8CAD03;
 Mon, 13 Jan 2020 15:30:17 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20200113150455.400733-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0440d10-9ecb-68f2-5505-21cebe5143fc@suse.com>
Date: Mon, 13 Jan 2020 16:30:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113150455.400733-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] MAINTAINERS: Add explicit check-in
 policy section
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAxNjowNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBUaGUgIm5lc3Rpbmci
IHNlY3Rpb24gaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUgd2FzIG5vdCBpbml0aWFsbHkKPiBpbnRl
bmRlZCB0byBkZXNjcmliZSB0aGUgY2hlY2staW4gcG9saWN5IGZvciBwYXRjaGVzLCBidXQgb25s
eSBob3cKPiBuZXN0aW5nIHdvcmtlZDsgYnV0IHNpbmNlIHRoZXJlIHdhcyBubyBjaGVjay1pbiBw
b2xpY3ksIGl0IGhhcyBiZWVuCj4gYWN0aW5nIGFzIGEgZGUtZmFjdG8gcG9saWN5Lgo+IAo+IE9u
ZSBwcm9ibGVtIHdpdGggdGhpcyBpcyB0aGF0IHRoZSBwb2xpY3kgaXMgbm90IGNvbXBsZXRlOiBJ
dCBkb2Vzbid0Cj4gY292ZXIgb3BlbiBvYmplY3Rpb25zLCB0aW1lIHRvIGNoZWNrLWluLCBvciBz
byBvbi4gIFRoZSBvdGhlciBwcm9ibGVtCj4gd2l0aCB0aGUgcG9saWN5IGlzIHRoYXQsIGFzIHdy
aXR0ZW4sIGl0IGRvZXNuJ3QgYWNjb3VudCBmb3IKPiBtYWludGFpbmVycyBzdWJtaXR0aW5nIHBh
dGNoZXMgdG8gZmlsZXMgd2hpY2ggdGhleSB0aGVtc2VsdmVzCj4gbWFpbnRhaW4uICBUaGlzIGlz
IGZpbmUgZm9yIHNpdHVhdGlvbnMgd2hlcmUgdGhlcmUgYXJlIGFyZSBtdWx0aXBsZQo+IG1haW50
YWluZXJzLCBidXQgbm90IGZvciBzaXR1YXRpb25zIHdoZXJlIHRoZXJlIGlzIG9ubHkgb25lCj4g
bWFpbnRhaW5lci4KPiAKPiBBZGQgYW4gZXhwbGljaXQgIkNoZWNrLWluIHBvbGljeSIgc2VjdGlv
biB0byB0aGUgTUFJTlRBSU5FUlMgZG9jdW1lbnQKPiB0byBzZXJ2ZSBhcyB0aGUgY2Fub25pY2Fs
IHJlZmVyZW5jZSBmb3IgdGhlIGNoZWNrLWluIHBvbGljeS4gIE1vdmUKPiBwYXJhZ3JhcGhzIG5v
dCBleHBsaWNpdGx5IHJlbGF0ZWQgdG8gbmVzdGluZyBpbnRvIGl0Lgo+IAo+IFdoaWxlIGhlcmUs
ICJwcm9tb3RlIiB0aGUgIlRoZSBtZWFuaW5nIG9mIG5lc3RpbmciIHNlY3Rpb24gdGl0bGUuCj4g
Cj4gRElTQ1VTU0lPTgo+IAo+IFRoaXMgc2VlbXMgdG8gYmUgYSBjaGFuZ2UgZnJvbSBwZW9wbGUn
cyB1bmRlcnN0YW5kaW5nIG9mIHRoZSBjdXJyZW50Cj4gcG9saWN5LiAgTW9zdCBwZW9wbGUncyB1
bmRlcnN0YW5kaW5nIG9mIHRoZSBjdXJyZW50IHBvbGljeSBzZWVtcyB0byBiZToKPiAKPiAxLiAg
SW4gb3JkZXIgdG8gZ2V0IGEgY2hhbmdlIHRvIGEgZ2l2ZW4gZmlsZSBjb21taXR0ZWQsIGl0IG11
c3QgaGF2ZQo+IGFuIEFjayBvciBSZXZpZXcgZnJvbSBhdCBsZWFzdCBvbmUgKm1haW50YWluZXIq
IG9mIHRoYXQgZmlsZSBvdGhlcgo+IHRoYW4gdGhlIHN1Ym1pdHRlci4KPiAKPiAyLiBJbiB0aGUg
Y2FzZSB3aGVyZSBhIGZpbGUgaGFzIG9ubHkgb25lIG1haW50YWluZXIsIGl0IG11c3QgaGF2ZSBh
bgo+IEFjayBvciBSZXZpZXcgZnJvbSBhICJuZXN0ZWQiIG1haW50YWluZXIuCj4gCj4gSS5lLiwg
aWYgSSBzdWJtaXR0ZWQgc29tZXRoaW5nIHRvIHg4Ni9tbSwgaXQgd291bGQgcmVxdWlyZSBhbiBB
Y2sgZnJvbQo+IEphbiBvciBBbmR5LCBvciAoaW4gZXhjZXB0aW9uYWwgY2lyY3Vtc3RhbmNlcykg
VGhlIFJlc3Q7IGJ1dCBhbiBBY2sgZnJvbQo+IChzYXkpIFJvZ2VyIG9yIEp1ZXJnZW4gd291bGRu
J3Qgc3VmZmljZS4KPiAKPiBMZXQncyBjYWxsIHRoaXMgdGhlICJtYWludGFpbmVyLWFjayIgYXBw
cm9hY2ggKGJlY2F1c2UgaXQgbXVzdCBoYXZlIGFuCj4gYWNrIG9yIHItYiBmcm9tIGEgbWFpbnRh
aW5lciB0byBiZSBjaGVja2VkIGluKSwgYW5kIHRoZSBwcm9wb3NhbCBpbgo+IHRoaXMgcGF0Y2gg
dGhlICJtYWludGFpbmVyLWFwcHJvdmFsIiAoc2luY2UgU29CIGZyb20gYSBtYWludGFpbmVyCj4g
aW5kaWNhdGVzIGFwcHJvdmFsKS4KPiAKPiBUaGUgY29yZSBpc3N1ZSBJIGhhdmUgd2l0aCAibWFp
bnRhaW5lci1hY2siIGlzIHRoYXQgaXQgbWFrZXMgdGhlCj4gbWFpbnRhaW5lciBsZXNzIHByaXZp
bGVnZWQgd2l0aCByZWdhcmQgdG8gd3JpdGluZyBjb2RlIHRoYW4KPiBub24tbWFpbnRhaW5lcnMu
ICBJZiBjb21wb25lbnQgWCBoYXMgbWFpbnRhaW5lcnMgQSBhbmQgQiwgdGhlbiBhCj4gbm9uLW1h
aW50YWluZXIgY2FuIGhhdmUgY29kZSBjaGVja2VkIGluIGlmIHJldmlld2VkIGVpdGhlciBieSBB
IG9yIEIuCj4gSWYgQSBvciBCIHdhbnRzIGNvZGUgY2hlY2tlZCBpbiwgdGhleSBoYXZlIHRvIHdh
aXQgZm9yIGV4YWN0bHkgb25lCj4gcGVyc29uIHRvIHJldmlldyBpdC4KPiAKPiBJbiBmYWN0LCBp
ZiBCIGlzIHF1aXRlIGJ1c3ksIHRoZSBlYXNpZXN0IHdheSBmb3IgQSByZWFsbHkgdG8gZ2V0IHRo
ZWlyCj4gY29kZSBjaGVja2VkIGluIG1pZ2h0IGJlIHRvIGhhbmQgaXQgdG8gYSBub24tbWFpbnRh
aW5lciBOLCBhbmQgYXNrIE4KPiB0byBzdWJtaXQgaXQgYXMgdGhlaXIgb3duLiAgVGhlbiBBIGNh
biBBY2sgdGhlIHBhdGNoZXMgYW5kIGNoZWNrIHRoZW0KPiBpbi4KPiAKPiBUaGUgY3VycmVudCBz
eXN0ZW0sIHRoZXJlZm9yZSwgZWl0aGVyIHNldHMgdXAgYSBwZXJ2ZXJzZSBpbmNlbnRpdmUgKGlm
Cj4geW91IHRoaW5rIHRoZSBiZWhhdmlvciBkZXNjcmliZWQgYWJvdmUgaXMgdW5hY2NlcHRhYmxl
KSBvciB1bm5lY2Vzc2FyeQo+IGJ1cmVhdWNyYWN5IChpZiB5b3UgdGhpbmsgaXQncyBhY2NlcHRh
YmxlKS4gIEVpdGhlciB3YXkgSSB0aGluayB3ZQo+IHNob3VsZCBzZXQgdXAgb3VyIHN5c3RlbSB0
byBhdm9pZCBpdC4KPiAKPiBPdGhlciB2YXJpYXRpb25zIG9uICJtYWludGFpbmVyLWFjayIgaGF2
ZSBiZWVuIHByb3Bvc2VkOgo+IAo+IC0gQWxsb3cgbWFpbnRhaW5lcidzIHBhdGNoZXMgdG8gZ28g
aW4gd2l0aCBhbiBSLWIgZnJvbSAiZGVzaWduYXRlZAo+ICAgcmV2aWV3ZXJzIgo+IAo+IC0gQWxs
b3cgbWFpbnRhaW5lcidzIHBhdGNoZXMgdG8gZ28gaW4gd2l0aCBhbiBBY2sgZnJvbSBtb3JlIGdl
bmVyYWwKPiAgIG1haW50YWluZXIKPiAKPiBCb3RoIGZ1bmRhbWVudGFsbHkgbWFrZSBpdCBoYXJk
ZXIgZm9yIG1haW50YWluZXJzIHRvIGdldCB0aGVpciBjb2RlIGluCj4gYW5kL29yIHJldmlld2Vk
IGVmZmVjdGl2ZWx5IHRoYW4gbm9uLW1haW50YWluZXJzLCBzZXR0aW5nIHVwIHRoZQo+IHBlcnZl
cnNlIGluY2VudGl2ZSAvIHVubmVjZXNzYXJ5IGJ1cmVhdWNyYWN5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBbGJlaXQgSSBndWVzcyB0aGlzIGlzIHJh
dGhlciBzb21ldGhpbmcgd2hpY2ggbmVlZHMgdm90aW5nIG9uLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
