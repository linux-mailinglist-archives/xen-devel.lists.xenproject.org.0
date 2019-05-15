Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1921EA6E
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 10:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQpX8-0004uQ-0h; Wed, 15 May 2019 08:45:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ez+k=TP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQpX7-0004uJ-B1
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 08:45:05 +0000
X-Inumbo-ID: b7be5170-76ed-11e9-860d-6fb41c24ea21
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7be5170-76ed-11e9-860d-6fb41c24ea21;
 Wed, 15 May 2019 08:44:57 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: SD+XoMpkau0ywCWlbAMuMwSA54HueERkGKu0IZKROkY6D84mU4Iw3c1L23ANeSOQN3MtTTk7Ca
 ies3tirwV54KEIgUv72e/KorNJ0F90lD9ElIs2eew7C2nTDrDJnH0SNK5/xVe7PUrxJlWs+kPi
 iz1KGt+puQEOvuOECkHjatcGjhS6pyvlq4ImxDBw/bfM7X9NFPduvsrVH78nvnbJe1JAtKXzeX
 jD/z2onurndYksCpiohq++voRqHUtJVGuD6SscAWNqBFNWwyWY3YK8A91UZsWSqZDo3pQtTsjn
 X6I=
X-SBRS: 2.7
X-MesageID: 446882
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="446882"
Date: Wed, 15 May 2019 10:44:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190515084443.f4v3otqjqu2ofnrk@Air-de-Roger>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-5-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508132403.1454-5-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/5] iommu: introduce iommu_groups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDI6MjQ6MDJQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFNvbWUgZGV2aWNlcyBtYXkgc2hhcmUgYSBzaW5nbGUgUENJZSBpbml0aWF0b3IgaWQs
IGUuZy4gaWYgdGhleSBhcmUgYWN0dWFsbHkKPiBsZWdhY3kgUENJIGRldmljZXMgYmVoaW5kIGEg
YnJpZGdlLCBhbmQgaGVuY2UgRE1BIGZyb20gc3VjaCBkZXZpY2VzIHdpbGwKPiBiZSBzdWJqZWN0
IHRvIHRoZSBzYW1lIGFkZHJlc3MgdHJhbnNsYXRpb24gaW4gdGhlIElPTU1VLiBIZW5jZSB0aGVz
ZSBkZXZpY2VzCj4gc2hvdWxkIGJlIHRyZWF0ZWQgYXMgYSB1bml0IGZvciB0aGUgcHVycG9zZXMg
b2YgYXNzaWdubWVudC4gVGhlcmUgYXJlIGFsc28KPiBvdGhlciByZWFzb25zIHdoeSBtdWx0aXBs
ZSBkZXZpY2VzIHNob3VsZCBiZSB0cmVhdGVkIGFzIGEgdW5pdCwgZS5nLiB0aG9zZQo+IHN1Ympl
Y3QgdG8gYSBzaGFyZWQgUk1SUiBvciB0aG9zZSBkb3duc3RyZWFtIG9mIGEgYnJpZGdlIHRoYXQg
ZG9lcyBub3QKPiBzdXBwb3J0IEFDUy4KPiAKPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBuZXcg
c3RydWN0IGlvbW11X2dyb3VwIHRvIGFjdCBhcyBhIGNvbnRhaW5lciBmb3IKPiBkZXZpY2VzIHRo
YXQgc2hvdWxkIGJlIHRyZWF0ZWQgYXMgYSB1bml0LCBhbmQgYnVpbGRzIGEgbGlzdCBvZiB0aGVt
IGFzCj4gUENJIGRldmljZXMgYXJlIHNjYW5uZWQuIFRoZSBpb21tdV9vcHMgYWxyZWFkeSBpbXBs
ZW1lbnQgYSBtZXRob2QsCj4gZ2V0X2RldmljZV9ncm91cF9pZCgpLCB0aGF0IGlzIHNlZW1pbmds
eSBpbnRlbmRlZCB0byByZXR1cm4gdGhlIGluaXRpYXRvcgo+IGlkIGZvciBhIGdpdmVuIFNCREYg
c28gdXNlIHRoaXMgYXMgdGhlIG1lY2hhbmlzbSBmb3IgZ3JvdXAgYXNzaWdubWVudCBpbgo+IHRo
ZSBmaXJzdCBpbnN0YW5jZS4gQXNzaWdubWVudCBiYXNlZCBvbiBzaGFyZWQgUk1SUiBvciBsYWNr
IG9mIEFDUyB3aWxsIGJlCj4gZGVhbHQgd2l0aCBpbiBzdWJzZXF1ZW50IHBhdGNoZXMsIGFzIHdp
bGwgbW9kaWZpY2F0aW9ucyB0byB0aGUgZGV2aWNlCj4gYXNzaWdubWVudCBjb2RlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gLS0t
Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBD
YzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+IENjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IFRpbSBEZWVn
YW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0t
LQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIHwgNzYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMgICB8ICAzICsrCj4gIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAgICAgfCAgNyArKysr
Cj4gIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgICAgfCAgMyArKwo+ICA0IGZpbGVzIGNo
YW5nZWQsIDg5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiBpbmRl
eCBkM2E2MTk5Yjc3Li4xMTMxOWZiYWFlIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4g
QEAgLTY1NSw2ICs2NTUsODIgQEAgc3RhdGljIHZvaWQgaW9tbXVfZHVtcF9wMm1fdGFibGUodW5z
aWduZWQgY2hhciBrZXkpCj4gICAgICB9Cj4gIH0KPiAgCj4gKyNpZmRlZiBDT05GSUdfSEFTX1BD
SQo+ICsKPiArc3RydWN0IGlvbW11X2dyb3VwIHsKPiArICAgIHVuc2lnbmVkIGludCBpZDsKPiAr
ICAgIHVuc2lnbmVkIGludCBpbmRleDsKCkknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQgb2Yg
dGhlIGluZGV4IGZpZWxkLCBpc24ndCBpdCBlbm91Z2ggdG8KanVzdCB1c2UgdGhlIElEIGZpZWxk
PwoKVGhlIElEIGlzIGFscmVhZHkgdXNlZCBhcyBhIHVuaXF1ZSBrZXkgaW4gdGhlIGNvZGUgYmVs
b3cgZm9yIHRoZSByYWRpeAp0cmVlIG9wZXJhdGlvbnMuCgo+ICsgICAgc3RydWN0IGxpc3RfaGVh
ZCBkZXZzX2xpc3Q7Cj4gK307Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHJhZGl4X3RyZWVfcm9vdCBp
b21tdV9ncm91cHM7Cj4gKwo+ICt2b2lkIF9faW5pdCBpb21tdV9ncm91cHNfaW5pdCh2b2lkKQo+
ICt7Cj4gKyAgICByYWRpeF90cmVlX2luaXQoJmlvbW11X2dyb3Vwcyk7Cj4gK30KPiArCj4gK3N0
YXRpYyBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmFsbG9jX2lvbW11X2dyb3VwKHVuc2lnbmVkIGludCBp
ZCkKPiArewo+ICsgICAgc3RydWN0IGlvbW11X2dyb3VwICpncnA7Cj4gKyAgICBzdGF0aWMgdW5z
aWduZWQgaW50IGluZGV4Owo+ICsKPiArICAgIGdycCA9IHh6YWxsb2Moc3RydWN0IGlvbW11X2dy
b3VwKTsKCkNhbiBiZSBtb3ZlZCB3aXRoIHRoZSBkZWNsYXJhdGlvbiBhYm92ZS4KCj4gKyAgICBp
ZiAoICFncnAgKQo+ICsgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArICAgIGdycC0+aWQgPSBp
ZDsKPiArICAgIGdycC0+aW5kZXggPSBpbmRleCsrOwoKQUZBSUNUIG5vbmUgb2YgdGhpcyBpcyBz
dWJqZWN0IHRvIHJhY2VzIGJlY2F1c2UgaXQncyBhbHdheXMgcHJvdGVjdGVkCmJ5IHRoZSBwY2lk
ZXZzIGxvY2s/Cgo+ICsgICAgSU5JVF9MSVNUX0hFQUQoJmdycC0+ZGV2c19saXN0KTsKPiArCj4g
KyAgICBpZiAoIHJhZGl4X3RyZWVfaW5zZXJ0KCZpb21tdV9ncm91cHMsIGlkLCBncnApICkKPiAr
ICAgIHsKPiArICAgICAgICB4ZnJlZShncnApOwo+ICsgICAgICAgIGdycCA9IE5VTEw7CgpEbyB5
b3UgbmVlZCB0byBkZWNyZWFzZSBpbmRleCBoZXJlLCBvciBpcyBpdCBmaW5lIHRvIGJ1cm4gbnVt
YmVycyBvbgpmYWlsdXJlPwoKPiArICAgIH0KPiArCj4gKyAgICByZXR1cm4gZ3JwOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgc3RydWN0IGlvbW11X2dyb3VwICpnZXRfaW9tbXVfZ3JvdXAodW5zaWduZWQg
aW50IGlkKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdycCA9IHJhZGl4X3RyZWVf
bG9va3VwKCZpb21tdV9ncm91cHMsIGlkKTsKPiArCj4gKyAgICBpZiAoICFncnAgKQo+ICsgICAg
ICAgIGdycCA9IGFsbG9jX2lvbW11X2dyb3VwKGlkKTsKPiArCj4gKyAgICByZXR1cm4gZ3JwOwo+
ICt9Cj4gKwo+ICtpbnQgaW9tbXVfZ3JvdXBfYXNzaWduKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+
ICt7Cj4gKyAgICBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHM7Cj4gKyAgICB1bnNpZ25lZCBp
bnQgaWQ7Cj4gKyAgICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdycDsKPiArCj4gKyAgICBvcHMgPSBp
b21tdV9nZXRfb3BzKCk7CgpUaGlzIGluaXRpYWxpemF0aW9uIGNhbiBiZSBkb25lIGF0IGRlY2xh
cmF0aW9uIHRpbWUuCgo+ICsgICAgaWYgKCAhb3BzIHx8ICFvcHMtPmdldF9kZXZpY2VfZ3JvdXBf
aWQgKQo+ICsgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgIGlkID0gb3BzLT5nZXRfZGV2aWNl
X2dyb3VwX2lkKHBkZXYtPnNlZywgcGRldi0+YnVzLCBwZGV2LT5kZXZmbik7Cj4gKyAgICBncnAg
PSBnZXRfaW9tbXVfZ3JvdXAoaWQpOwo+ICsKPiArICAgIGlmICggISBncnAgKQogICAgICAgICAg
ICAgXiBleHRyYSBzcGFjZQo+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsKPiArICAgIGlm
ICggaW9tbXVfdmVyYm9zZSApCj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJBc3NpZ24g
JTA0eDolMDJ4OiUwMnguJXUgLT4gSU9NTVUgZ3JvdXAgJXVcbiIsCj4gKyAgICAgICAgICAgICAg
IHBkZXYtPnNlZywgcGRldi0+YnVzLCBQQ0lfU0xPVChwZGV2LT5kZXZmbiksCj4gKyAgICAgICAg
ICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgZ3JwLT5pbmRleCk7CgpXb3VsZG4ndCBpdCBi
ZSBtb3JlIGhlbHBmdWwgdG8gcHJpbnQgdGhlIGdyb3VwIElEIHJhdGhlciB0aGFuIHRoZSBYZW4K
aW50ZXJuYWwgaW5kZXg/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
