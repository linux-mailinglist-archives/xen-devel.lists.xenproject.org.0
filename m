Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2630B1873
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 08:41:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8fDk-0002IJ-9N; Fri, 13 Sep 2019 06:38:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8fDi-0002IC-JW
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 06:38:14 +0000
X-Inumbo-ID: 0ec7abd0-d5f1-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ec7abd0-d5f1-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 06:38:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4FA0AE72;
 Fri, 13 Sep 2019 06:38:11 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-9-andrew.cooper3@citrix.com>
 <20190912185500.21621-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd18f519-f541-f0d5-5e96-086504ebc7b3@suse.com>
Date: Fri, 13 Sep 2019 08:38:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912185500.21621-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 8/8] x86/cpuid: Enable CPUID Faulting for
 the control domain by default
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAyMDo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgZG9tYWluIGJ1
aWxkZXIgbm8gbG9uZ2VyIHVzZXMgbG9jYWwgQ1BVSUQgaW5zdHJ1Y3Rpb25zIGZvciBwb2xpY3kK
PiBkZWNpc2lvbnMuICBUaGlzIHJlc29sdmVzIGEga2V5IGlzc3VlIGZvciBQVkggZG9tMCdzLiAg
SG93ZXZlciwgYXMgUFYgZG9tMCdzCj4gaGF2ZSBuZXZlciBoYWQgZmF1bHRpbmcgZW5mb3JjZWQs
IGxlYXZlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiB0byByZXN0b3JlIHRoZQo+IG9sZCBiZWhhdmlv
dXIuCj4gCj4gSW4gY3R4dF9zd2l0Y2hfbGV2ZWxsaW5nKCksIGludmVydCB0aGUgZmlyc3QgY3B1
X2hhc19jcHVpZF9mYXVsdGluZyBjb25kaXRpb24KPiB0byByZWR1Y2UgdGhlIGluZGVudGF0aW9u
IGZvciB0aGUgQ1BVSUQgZmF1bHRpbmcgbG9naWMuCj4gCj4gQWR2ZXJ0aXNlIHZpcnR1YWxpc2Vk
IGZhdWx0aW5nIHN1cHBvcnQgdG8gY29udHJvbCBkb21haW5zIHVubGVzcyB0aGUgb3B0LW91dAo+
IGhhcyBiZWVuIHVzZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBvcHRfZG9tMF9jcHVpZF9mYXVsdGluZyB3b3Vs
ZCBpZGVhbGx5IGxpdmUgaW4gZG9tMF9idWlsZC5jIG5leHQgdG8KPiBvcHRfZG9tMF92ZXJib3Nl
LCBidXQgdGhlIGZpbGUgaXMgY3VycmVudGx5IC5pbml0CgpBbmQgaXQgc2hvdWxkIHJlbWFpbiBz
byBpbW8uCgo+IHYyOgo+ICAqIEludHJvZHVjZSBhIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gcmV0
YWluIG9sZCBiZWhhdmlvdXIuCj4gICogQWR2ZXJ0aXNlIHZpcnR1YWxpc2VkIGZhdWx0aW5nIHN1
cHBvcnQgdG8gZG9tMCB3aGVuIGl0IGlzIHVzZWQuCj4gCj4gUkZDOiBUaGUgcHJldmlvdXMgbG9n
aWMgd2FzIHNsaWdodGx5IGJ1Z2d5IGluIHRoYXQgZXZlbiBQVkggZG9tMCdzIGhhZAo+IHZpcnR1
YWxpc2VkIGZhdWx0aW5nIHN1cHBvcnQgaGlkZGVuIGZyb20gdGhlbS4gIEdpdmVuIHRoYXQgdGhp
cyBjYXNlIGFsd2F5cwo+IGhpdHMgdGhlIENQVUlEIGludGVyY2VwdCwgaG93IG11Y2ggZG8gd2Ug
Y2FyZSBhYm91dCByZXRhaW5pbmcgdGhlIG9sZAo+IGJlaGF2aW91cj8KCkknbSBoYXZpbmcgdHJv
dWJsZSB3aXRoIHRoaXMgc3RhdGVtZW50OiBOZWl0aGVyIHRoZSBkZXNjcmlwdGlvbiBub3IKdGhl
IGFjdHVhbCBjb2RlIGNoYW5nZSBzdWdnZXN0IHlvdSBhbHRlciBiZWhhdmlvciBpbiB0aGlzIHJl
Z2FyZAooaS5lLiB3aXRoIHRoZSBvcHRpb24gdXNlZCBQVkggd291bGQgc3RpbGwgYmUgdHJlYXRl
ZCB0aGUgc2FtZSBhcwpQViBhZmFpY3QpLiBZZXQgaGVyZSB5b3Ugc2VlbSB0byBzdWdnZXN0IHRo
aW5ncyBjaGFuZ2Ugd2l0aCB0aGlzCnBhdGNoLgoKQXMgdG8gdGhlIHF1ZXN0aW9uLCBJIHRoaW5r
IEknZCBjb25zaWRlciB0aGlzIGEgYnVnZml4LCBhbmQgaGVuY2UKZm9yIHRoZSBiZWhhdmlvciB0
byBiZSBva2F5IHRvIGNoYW5nZS4gQnV0IGFzIHBlciBhYm92ZSBJIHdvdWxkCmV4cGVjdCB0aGUg
Y2hhbmdlIHRvIGluaXRfZG9tYWluX21zcl9wb2xpY3koKSB0byBhbHNvIGluY2x1ZGUKYWRkaW5n
IGlzX3B2X2RvbWFpbigpIHRvIHRoZSBjb25kaXRpb25hbCwgb3IgYWx0ZXJuYXRpdmVseSB0bwpv
dmVycmlkZSBvcHRfZG9tMF9jcHVpZF9mYXVsdGluZyB0byB0cnVlIGlmIGEgUFZIIERvbTAgaXMg
YmVpbmcKYnVpbHQuCgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jICAgfCA1OSAr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2FyY2gv
eDg2L2RvbTBfYnVpbGQuYyAgIHwgIDIgKysKPiAgeGVuL2FyY2gveDg2L21zci5jICAgICAgICAg
IHwgIDMgKystCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaCB8ICAxICsKPiAgNCBmaWxl
cyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKClBsZWFzZSBhbHNv
IHVwZGF0ZSB0aGUgY29tbWFuZCBsaW5lIGRvYy4KCj4gQEAgLTkyLDcgKzkzLDcgQEAgaW50IGlu
aXRfZG9tYWluX21zcl9wb2xpY3koc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgICAgICByZXR1cm4g
LUVOT01FTTsKPiAgCj4gICAgICAvKiBTZWUgY29tbWVudCBpbiBpbnRlbF9jdHh0X3N3aXRjaF9s
ZXZlbGxpbmcoKSAqLwo+IC0gICAgaWYgKCBpc19jb250cm9sX2RvbWFpbihkKSApCj4gKyAgICBp
ZiAoICFvcHRfZG9tMF9jcHVpZF9mYXVsdGluZyAmJiBpc19jb250cm9sX2RvbWFpbihkKSApCj4g
ICAgICAgICAgbXAtPnBsYXRmb3JtX2luZm8uY3B1aWRfZmF1bHRpbmcgPSBmYWxzZTsKCldoaWxl
IHVucmVsYXRlZCB0byB0aGUgb3ZlcmFsbCBjaGFuZ2UgaGVyZSwgSSB0aGluayB0aGUgY29tbWVu
dAp3b3VsZCBiZXR0ZXIgYmUgdXBkYXRlZCB0b28sIHRvIGRyb3AgdGhlIGludGVsXyBwcmVmaXgg
b2YgdGhlCmZ1bmN0aW9uIG5hbWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
