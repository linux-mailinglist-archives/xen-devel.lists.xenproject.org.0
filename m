Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87A68302
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 06:31:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmsaS-0000dI-1c; Mon, 15 Jul 2019 04:27:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TQSl=VM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hmsaR-0000dD-5Z
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 04:27:39 +0000
X-Inumbo-ID: ddd5b0b0-a6b8-11e9-83a5-b75762aad805
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddd5b0b0-a6b8-11e9-83a5-b75762aad805;
 Mon, 15 Jul 2019 04:27:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 315A2AE44;
 Mon, 15 Jul 2019 04:27:33 +0000 (UTC)
To: Vasilis Liaskovitis <vliaskovitis@suse.com>, xen-devel@lists.xenproject.org
References: <20190528145416.16918-1-vliaskovitis@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <453c213e-48e3-25bf-b9fd-e3e5dafbcb0d@suse.com>
Date: Mon, 15 Jul 2019 06:27:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190528145416.16918-1-vliaskovitis@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 0/4] Support for reading runtime
 hypervisor parameters
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 jbeulich@suse.com, anthony.perard@citrix.com, dgdegra@tycho.nsa.gov
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDUuMTkgMTY6NTQsIFZhc2lsaXMgTGlhc2tvdml0aXMgd3JvdGU6Cj4gQ3VycmVudGx5
IHJ1bnRpbWUgcGFyYW1ldGVycyBvZiB0aGUgaHlwZXJ2aXNvciBjYW5ub3QgYmUgaW5zcGVjdGVk
IHRocm91Z2ggYW4KPiB4bCBjb21tYW5kLCBob3dldmVyIHRoZXkgY2FuIGJlIGNoYW5nZWQgd2l0
aCB0aGUgInhsIHNldC1wYXJhbWV0ZXIiIGNvbW1hbmQuCj4gQmVpbmcgYWJsZSB0byBjaGVjayB0
aGVzZSBwYXJhbWV0ZXJzIGF0IHJ1bnRpbWUgd291bGQgYmUgYSB1c2VmdWwgZGlhZ25vc3RpYwo+
IHRvb2wuCj4gCj4gVGhpcyBwYXRjaCBzZXJpZXMgaW1wbGVtZW50cyBhIG5ldyB4bCBjb21tYW5k
ICJ4bCBnZXQtcGFyYW1ldGVycyIKPiB3aGljaCB0YWtlcyBhIHN0cmluZyBvZiBpbnB1dCBwYXJh
bWV0ZXJzIGFuZCByZXR1cm5zIHRoZWlyIGN1cnJlbnQKPiB2YWx1ZXMgaW4gdGhlIGh5cGVydmlz
b3Igc2V0dGluZ3MuCj4gCj4gRXhhbXBsZXM6Cj4gCj4geGwgZ2V0LXBhcmFtZXRlcnMgImdudHRh
Yl9tYXhfZnJhbWVzIGdudHRhYl9tYXhfbWFwdHJhY2tfZnJhbWVzIgo+IGdudHRhYl9tYXhfZnJh
bWVzIGdudHRhYl9tYXhfbWFwdHJhY2tfZnJhbWVzIDogNjQgMTAyNAo+IAo+IHhsIHNldC1wYXJh
bWV0ZXJzIGdudHRhYl9tYXhfZnJhbWVzPTEyOAo+IAo+IHhsIGdldC1wYXJhbWV0ZXJzIGdudHRh
Yl9tYXhfZnJhbWVzCj4gZ250dGFiX21heF9mcmFtZXMgOiAxMjgKPiAKPiB4bCBnZXQtcGFyYW1l
dGVycyAiZ250dGFiX21heF9mcmFtZXMgZ250dGFiX21heF9tYXB0cmFja19mcmFtZXMiCj4gZ250
dGFiX21heF9mcmFtZXMgZ250dGFiX21heF9tYXB0cmFja19mcmFtZXMgOiAxMjggMTAyNAo+IAo+
IAo+IENoYW5nZXMgdjMtPnY0Ogo+IAo+IC0gRml4IHJldHVybiB2YWx1ZSBhbmQgbG9nZ2luZyBp
biBuZXcgbGlieGwgZnVuY3Rpb24uCj4gCj4gQ2hhbmdlcyB2Mi0+djM6Cj4gCj4gLSBTZXZlcmFs
IHN0eWxlIC8gZm9ybWF0dGluZyBmaXhlcwo+IC0gTGltaXRhdGlvbnMgZm9yIHNpZ25lZCBpbnRl
Z2VyIHBhcmFtZXRlcnMgYWRkZWQgaW4gY29kZSBhbmQgY29tbWl0IGxvZy4KPiAKPiBDaGFuZ2Vz
IHYxLT52MjoKPiAKPiAtIGZpeGVkIHNucHJpbnRmIGlzc3VlcywgZml4ZWQgbWVtb3J5IGxlYWtz
IGFuZCBlcnJvciBoYW5kbGluZwo+IC0gcmVtb3ZlZCB1bm5lY2Vzc2FyeSB3cmFwcGVyIGZ1bmN0
aW9uCj4gLSBPUFRfU0laRSBpcyBoYW5kbGVkCj4gCj4gTGltaXRhdGlvbnM6Cj4gCj4gLSBDdXN0
b20gcnVudGltZSBwYXJhbWV0ZXJzIChPUFRfQ1VTVE9NKSBhcmUgbm90IHN1cHBvcnRlZCB5ZXQu
IEknZCBsaWtlCj4gICAgdG8gZG8gdGhpcyBpbiBhIGZvbGxvdy11cCBzZXJpZXMuIFNlZSBhbHNv
IGRpc2N1c3Npb24gYXQKPiAgICBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVz
L2h0bWwveGVuLWRldmVsLzIwMTktMDMvbXNnMDEzODMuaHRtbAo+IC0gRm9yIGludGVnZXIgcGFy
YW1ldGVycyAoT1BUX1VJTlQpLCBvbmx5IHVuc2lnbmVkIHBhcmFtZXRlcnMgYXJlIHByaW50ZWQK
PiAgICBjb3JyZWN0bHkgYXQgdGhlIG1vbWVudC4KPiAKPiBWYXNpbGlzIExpYXNrb3ZpdGlzICg0
KToKPiAgICB4ZW46IGFkZCBoeXBlcmNhbGwgZm9yIGdldHRpbmcgcGFyYW1ldGVycyBhdCBydW50
aW1lCj4gICAgbGlieGM6IGFkZCBmdW5jdGlvbiB0byBnZXQgaHlwZXJ2aXNvciBwYXJhbWV0ZXJz
Cj4gICAgbGlieGw6IGFkZCBsaWJ4bF9nZXRfcGFyYW1ldGVycygpIGZ1bmN0aW9uCj4gICAgeGw6
IGFkZCBuZXcgeGwgY29tbWFuZCBnZXQtcGFyYW1ldGVycwo+IAo+ICAgZG9jcy9tYW4veGwuMS5w
b2QuaW4gICAgICAgICAgICAgICAgfCAgIDUgKysKPiAgIHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1
bGVzL2RvbTAudGUgIHwgICAyICstCj4gICB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAg
ICAgICB8ICAgMSArCj4gICB0b29scy9saWJ4Yy94Y19taXNjLmMgICAgICAgICAgICAgICB8ICAy
NiArKysrKysKPiAgIHRvb2xzL2xpYnhsL2xpYnhsLmMgICAgICAgICAgICAgICAgIHwgIDE5ICsr
KysrCj4gICB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICB0
b29scy94bC94bC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICB0b29scy94bC94
bF9jbWR0YWJsZS5jICAgICAgICAgICAgICB8ICAgNSArKwo+ICAgdG9vbHMveGwveGxfbWlzYy5j
ICAgICAgICAgICAgICAgICAgfCAgMjUgKysrKysrCj4gICB4ZW4vY29tbW9uL2tlcm5lbC5jICAg
ICAgICAgICAgICAgICB8IDExOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICB4ZW4v
Y29tbW9uL3N5c2N0bC5jICAgICAgICAgICAgICAgICB8ICA1MiArKysrKysrKysrKy0KPiAgIHhl
bi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCAgICAgICAgIHwgIDE4ICsrKysrCj4gICB4ZW4vaW5j
bHVkZS94ZW4vbGliLmggICAgICAgICAgICAgICB8ICAgMSArCj4gICB4ZW4veHNtL2ZsYXNrL2hv
b2tzLmMgICAgICAgICAgICAgICB8ICAgMyArCj4gICB4ZW4veHNtL2ZsYXNrL3BvbGljeS9hY2Nl
c3NfdmVjdG9ycyB8ICAgMiArCj4gICAxNSBmaWxlcyBjaGFuZ2VkLCAyNzYgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAKCkF0IHRoZSBYZW4gZGV2ZWxvcGVycyBzdW1taXQgbGFzdCB3
ZWVrIGluIENoaWNhZ28gdGhlcmUgd2FzIGEgcmVsYXRlZApkaXNjdXNzaW9uLiBUaGUgYmFzaWMg
b3V0Y29tZSB3YXMgdGhhdCB0aGVyZSBpcyBzb21lIG5lZWQgZm9yIGEgZ2VuZXJpYwpmcmFtZXdv
cmsgdG8gcmVwb3J0IGh5cGVydmlzb3Igc2V0dGluZ3MgdG8gZG9tMCwgZXNwZWNpYWxseSBmb3Ig
dGhlCmN1cnJlbnRseSBhY3RpdmUgbWl0aWdhdGlvbiBzZXR0aW5ncyBvZiBjcHUgdnVsbmVyYWJp
bGl0aWVzLiBUaGUgbW9zdAphcHByb3ByaWF0ZSBzb2x1dGlvbiBzZWVtcyB0byBiZSBhIGhpZXJh
cmNoaWNhbCBrZXktdmFsdWUgc3RvcmUgaW4gdGhlCmh5cGVydmlzb3Igd2hpY2ggY2FuIGJlIHF1
ZXJpZWQgdmlhIGEgbmV3IGludGVyZmFjZS4gVGhlIHNhbWUgaW50ZXJmYWNlCndvdWxkIGJlIHVz
YWJsZSBmb3IgcmVhZGluZyBoeXBlcnZpc29yIHBhcmFtZXRlcnMsIHRvby4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
