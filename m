Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB219EDF
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:17:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6Ia-0001C8-V8; Fri, 10 May 2019 14:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP6IZ-0001C0-1l
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:14:55 +0000
X-Inumbo-ID: fb892632-732d-11e9-a685-ab3915c70598
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fb892632-732d-11e9-a685-ab3915c70598;
 Fri, 10 May 2019 14:14:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 065A1A78;
 Fri, 10 May 2019 07:14:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B776D3F73C;
 Fri, 10 May 2019 07:14:51 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f86f38d4-17be-fcc7-470d-3e9940969448@arm.com>
Date: Fri, 10 May 2019 15:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mm: free_page_type() is PV-only
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKVGhhbmsgeW91IGZvciBzZW5kaW5nIHRoZSBwYXRjaCEgSSB3aWxsIHJlYmFzZSBt
eSBNMlAgc2VyaWVzIG9uIHRvcCBvZiB0aGlzLgoKQ2hlZXJzLAoKT24gMTAvMDUvMjAxOSAxNTox
MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgaXQgYWxyZWFkeSBoYXMgYSBDT05GSUdfUFYg
d3JhcHBlZCBhcm91bmQgaXRzIGVudGlyZSBib2R5LCBpdCBpcwo+IHN0aWxsIHVzZWxlc3NseSBp
bnZva2luZyBtZm5fdG9fZ21mbigpLCB3aGljaCBpcyBhYm91dCB0byBiZSByZXBsYWNlZC4KPiBB
dm9pZCBtb3JwaGluZyB0aGlzIGNvZGUgaW50byBldmVuIG1vcmUgc3VzcGljaW91cyBzaGFwZSBh
bmQgcmVtb3ZlIHRoZQo+IGVmZmVjdGl2ZWx5IGRlYWQgY29kZSAtIHRyYW5zbGF0ZWQgbW9kZSBo
YXMgYmVlbiBtYWRlIGltcG9zc2libGUgZm9yIFBWCj4gcXVpdGUgc29tZSB0aW1lIGFnby4KPiAK
PiBBZGp1c3QgYW5kIGV4dGVuZCB0aGUgYXNzZXJ0aW9ucyBhdCB0aGUgc2FtZSB0aW1lOiBUaGUg
b3JpZ2luYWwKPiBBU1NFUlQoIXNoYWRvd19tb2RlX3JlZmNvdW50cyhvd25lcikpIHJlYWxseSBt
ZWFucwo+IEFTU0VSVCghc2hhZG93X21vZGVfZW5hYmxlZChvd25lcikgfHwgIXBhZ2luZ19tb2Rl
X3JlZmNvdW50cyhvd25lcikpLAo+IHdoaWNoIGlzbid0IHdoYXQgd2Ugd2FudCBoZXJlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0g
YS94ZW4vYXJjaC94ODYvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAgLTI2MzIs
NyArMjYzMiw2IEBAIGludCBmcmVlX3BhZ2VfdHlwZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWcKPiAg
IHsKPiAgICNpZmRlZiBDT05GSUdfUFYKPiAgICAgICBzdHJ1Y3QgZG9tYWluICpvd25lciA9IHBh
Z2VfZ2V0X293bmVyKHBhZ2UpOwo+IC0gICAgdW5zaWduZWQgbG9uZyBnbWZuOwo+ICAgICAgIGlu
dCByYzsKPiAgIAo+ICAgICAgIGlmICggbGlrZWx5KG93bmVyICE9IE5VTEwpICYmIHVubGlrZWx5
KHBhZ2luZ19tb2RlX2VuYWJsZWQob3duZXIpKSApCj4gQEAgLTI2NDAsMTEgKzI2MzksMTEgQEAg
aW50IGZyZWVfcGFnZV90eXBlKHN0cnVjdCBwYWdlX2luZm8gKnBhZwo+ICAgICAgICAgICAvKiBB
IHBhZ2UgdGFibGUgaXMgZGlydGllZCB3aGVuIGl0cyB0eXBlIGNvdW50IGJlY29tZXMgemVyby4g
Ki8KPiAgICAgICAgICAgcGFnaW5nX21hcmtfZGlydHkob3duZXIsIHBhZ2VfdG9fbWZuKHBhZ2Up
KTsKPiAgIAo+IC0gICAgICAgIEFTU0VSVCghc2hhZG93X21vZGVfcmVmY291bnRzKG93bmVyKSk7
Cj4gKyAgICAgICAgQVNTRVJUKHNoYWRvd19tb2RlX2VuYWJsZWQob3duZXIpKTsKPiArICAgICAg
ICBBU1NFUlQoIXBhZ2luZ19tb2RlX3JlZmNvdW50cyhvd25lcikpOwo+ICsgICAgICAgIEFTU0VS
VCghcGFnaW5nX21vZGVfdHJhbnNsYXRlKG93bmVyKSk7Cj4gICAKPiAtICAgICAgICBnbWZuID0g
bWZuX3RvX2dtZm4ob3duZXIsIG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKSk7Cj4gLSAgICAgICAg
aWYgKCBWQUxJRF9NMlAoZ21mbikgKQo+IC0gICAgICAgICAgICBzaGFkb3dfcmVtb3ZlX2FsbF9z
aGFkb3dzKG93bmVyLCBfbWZuKGdtZm4pKTsKPiArICAgICAgICBzaGFkb3dfcmVtb3ZlX2FsbF9z
aGFkb3dzKG93bmVyLCBwYWdlX3RvX21mbihwYWdlKSk7Cj4gICAgICAgfQo+ICAgCj4gICAgICAg
aWYgKCAhKHR5cGUgJiBQR1RfcGFydGlhbCkgKQo+IAo+IAo+IAo+IAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
