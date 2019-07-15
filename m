Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFA6986A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:38:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn30S-0001wo-7O; Mon, 15 Jul 2019 15:35:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eZ1r=VM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hn30Q-0001wj-Vc
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 15:35:11 +0000
X-Inumbo-ID: 20f2cd10-a716-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20f2cd10-a716-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 15:35:09 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1lb7NDcAiULxva9Kgst6J07YpRskHK2uxgWjDan/1fw5ZuGS5+ZBm434zZgExeWzw+Ne/HSUyF
 1B7Ae6FBZzsL3wQwtpEv7uDRsHwy1AzefVR+0tdIKQb8xkZgoaDqWCSCXXrrwscz+3jNdKSFjb
 rte2rbK5CHl+NQ5dMwZ7aYxqAwqdv/Xp3WDjk4YiBi+P3KXobATFdxSKsgaxuTZDvWzV7QiIYC
 sHP4ZMCifdlXaHUl9YCGASqPat21COn6nu/JISnNVEU3tJAtJn9ddYayCnpca296bZjFuw6TFy
 NAk=
X-SBRS: 2.7
X-MesageID: 2988848
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2988848"
Date: Mon, 15 Jul 2019 17:34:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190715153459.j2yq4k3wuwolpwpq@Air-de-Roger.citrite.net>
References: <20190715123710.1780-1-paul.durrant@citrix.com>
 <20190715123710.1780-4-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715123710.1780-4-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 3/4] iommu: introduce iommu_groups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDE6Mzc6MDlQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
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
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpMR1RN
LCBqdXN0IHR3byBjb21tZW50cyBiZWxvdy4KCj4gLS0tCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KPiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+
IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDYzogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IAo+IHYyOgo+ICAtIE1vdmUgY29kZSBpbnRvIG5ldyBkcml2
ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jCj4gIC0gRHJvcCB0aGUgZ3JvdXAgaW5kZXguCj4gIC0g
SGFuZGxlIGZhaWx1cmUgdG8gZ2V0IGdyb3VwIGlkLgo+ICAtIERyb3AgdGhlIGdyb3VwIGRldnMg
bGlzdC4KPiAtLS0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvTWFrZWZpbGUgICAgfCAgMSAr
Cj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jICAgIHwgOTEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYv
aW9tbXUuYyB8ICA4ICsrKy0KPiAgeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICAgICAg
fCAgNyArKysKPiAgeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgICAgICAgfCAgMiArCj4g
IDUgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvTWFrZWZpbGUKPiBpbmRleCBkNTBhYjE4OGM4Li44YTc3MTEwMTc5IDEwMDY0
NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvTWFrZWZpbGUKPiBAQCAtNCw2ICs0LDcgQEAgc3ViZGlyLSQoQ09O
RklHX1g4NikgKz0geDg2Cj4gIHN1YmRpci0kKENPTkZJR19BUk0pICs9IGFybQo+ICAKPiAgb2Jq
LXkgKz0gaW9tbXUubwo+ICtvYmotJChDT05GSUdfSEFTX1BDSSkgKz0gZ3JvdXBzLm8KPiAgb2Jq
LSQoQ09ORklHX0hBU19QQ0kpICs9IHBjaS5vCj4gIG9iai0kKENPTkZJR19IQVNfREVWSUNFX1RS
RUUpICs9IGRldmljZV90cmVlLm8KPiAgCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2dyb3Vwcy5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjFhMmY0NjFjODcKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMKPiBAQCAtMCww
ICsxLDkxIEBACj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAxOSBDaXRyaXggU3lzdGVtcyBJ
bmMuCj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Cj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4gKyAqIHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2Us
IG9yCj4gKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4gKyAqCj4gKyAq
IFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLAo+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUg
aW1wbGllZCB3YXJyYW50eSBvZgo+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1Ig
QSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCj4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPHhlbi9pb21t
dS5oPgo+ICsjaW5jbHVkZSA8eGVuL3JhZGl4LXRyZWUuaD4KPiArCj4gK3N0cnVjdCBpb21tdV9n
cm91cCB7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaWQ7Cj4gK307Cj4gKwo+ICtzdGF0aWMgc3RydWN0
IHJhZGl4X3RyZWVfcm9vdCBpb21tdV9ncm91cHM7Cj4gKwo+ICt2b2lkIF9faW5pdCBpb21tdV9n
cm91cHNfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICByYWRpeF90cmVlX2luaXQoJmlvbW11X2dyb3Vw
cyk7Cj4gK30KPiArCj4gK3N0YXRpYyBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmFsbG9jX2lvbW11X2dy
b3VwKHVuc2lnbmVkIGludCBpZCkKPiArewo+ICsgICAgc3RydWN0IGlvbW11X2dyb3VwICpncnAg
PSB4emFsbG9jKHN0cnVjdCBpb21tdV9ncm91cCk7Cj4gKwo+ICsgICAgaWYgKCAhZ3JwICkKPiAr
ICAgICAgICByZXR1cm4gTlVMTDsKPiArCj4gKyAgICBncnAtPmlkID0gaWQ7Cj4gKwo+ICsgICAg
aWYgKCByYWRpeF90cmVlX2luc2VydCgmaW9tbXVfZ3JvdXBzLCBpZCwgZ3JwKSApCj4gKyAgICB7
Cj4gKyAgICAgICAgeGZyZWUoZ3JwKTsKPiArICAgICAgICBncnAgPSBOVUxMOwo+ICsgICAgfQo+
ICsKPiArICAgIHJldHVybiBncnA7Cj4gK30KPiArCj4gK3N0YXRpYyBzdHJ1Y3QgaW9tbXVfZ3Jv
dXAgKmdldF9pb21tdV9ncm91cCh1bnNpZ25lZCBpbnQgaWQpCj4gK3sKPiArICAgIHN0cnVjdCBp
b21tdV9ncm91cCAqZ3JwID0gcmFkaXhfdHJlZV9sb29rdXAoJmlvbW11X2dyb3VwcywgaWQpOwo+
ICsKPiArICAgIGlmICggIWdycCApCj4gKyAgICAgICAgZ3JwID0gYWxsb2NfaW9tbXVfZ3JvdXAo
aWQpOwo+ICsKPiArICAgIHJldHVybiBncnA7Cj4gK30KPiArCj4gK2ludCBpb21tdV9ncm91cF9h
c3NpZ24oc3RydWN0IHBjaV9kZXYgKnBkZXYsIHZvaWQgKmFyZykKCkknbSBub3Qgc3VyZSBJIHNl
ZSB0aGUgcG9pbnQgb2YgdGhlIGFyZyBwYXJhbWV0ZXIsIEFGQUlDVCBpdCdzCmNvbXBsZXRlbHkg
dW51c2VkLgoKPiArewo+ICsgICAgY29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzID0gaW9tbXVf
Z2V0X29wcygpOwo+ICsgICAgdW5zaWduZWQgaW50IGlkOwo+ICsgICAgc3RydWN0IGlvbW11X2dy
b3VwICpncnA7Cj4gKwo+ICsgICAgaWYgKCAhb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkICkKPiAr
ICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICBpZCA9IG9wcy0+Z2V0X2RldmljZV9ncm91cF9p
ZChwZGV2LT5zZWcsIHBkZXYtPmJ1cywgcGRldi0+ZGV2Zm4pOwoKSSB0aGluayBJIHdvdWxkIHBy
ZWZlciBpZCB0byBiZSBvZiBzaWduZWQgdHlwZSBoZXJlLCB0aGVuIHdoZW4geW91CnBhc3MgaXQg
dG8gZ2V0X2lvbW11X2dyb3VwIGl0J3MgYWxyZWFkeSBtYWRlIHVuc2lnbmVkLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
