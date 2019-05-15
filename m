Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26D21EAB5
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 11:09:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQps7-0006mE-IM; Wed, 15 May 2019 09:06:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ez+k=TP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQps5-0006m7-Kh
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:06:45 +0000
X-Inumbo-ID: c108ca00-76f0-11e9-bd4a-4302c7566a49
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c108ca00-76f0-11e9-bd4a-4302c7566a49;
 Wed, 15 May 2019 09:06:41 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: mP/EFpiuzNT2NcxKT0BnA/WsSCNChSbWHTAQH3g3jlXTCEWEnHZSA1QCjxaLGF/debcj5vvWnx
 2QD0vUzJdv12piII+9vHCYEKdyhrJVsJ5tQrc1LdUqjNhQRwpDwVJVtJz0t1z0KtB8BDGY6dcN
 3qYdBn1OD5f/t9vUKpvnn2+KP+t1/HC7Jr+ZT6zo/6/p15g/wZDvng9Wc/L3Gg2tGjxzkzGk1e
 rOApsHS+ekFBdCQgsaFp9QqIc2wtm5DsFHtDN+ZKMydJPbI6cpE8a3WIzFNhYMruVaTNQS6tuV
 Ngo=
X-SBRS: 2.7
X-MesageID: 446144
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="446144"
Date: Wed, 15 May 2019 11:06:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190515090630.xz7yi4g67uc6hlnn@Air-de-Roger>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-6-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508132403.1454-6-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/5] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDI6MjQ6MDNQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLiB1c2luZyB0aGUgbmV3IGlvbW11X2dyb3VwIGluZnJhc3RydWN0dXJlLgo+IAo+
IEJlY2F1c2UgJ3NpYmxpbmcnIGRldmljZXMgYXJlIG5vdyBtZW1iZXJzIG9mIHRoZSBzYW1lIGlv
bW11X2dyb3VwLAo+IGltcGxlbWVudCB0aGUgZG9tY3RsIGJ5IGxvb2tpbmcgdXAgdGhlIHJlbGV2
YW50IGlvbW11X2dyb3VwIGFuZCB3YWxraW5nCj4gdGhlIG1lbWJlcnNoaXAgbGlzdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IC0t
LQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyAgIHwgNDcgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAg
ICAgICB8ICAyICsrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgNDcgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11
LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gaW5kZXggMTEzMTlmYmFhZS4u
NDkxNDBjNjUyZSAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5j
Cj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+IEBAIC03MjksNiArNzI5
LDcxIEBAIGludCBpb21tdV9ncm91cF9hc3NpZ24oc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gICAg
ICByZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIHN0cnVjdCBpb21tdV9ncm91cCAqaW9tbXVf
Z3JvdXBfbG9va3VwKHVpbnQxNl90IHNlZywgdWludDhfdCBidXMsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90IGRldmZuKQoKQ291bGQgeW91
IHVzZSBwY2lfc2JkZl90IHRvIHBhc3MgdGhlIFNCREY/Cgo+ICt7Cj4gKyAgICB1bnNpZ25lZCBp
bnQgaWQgPSAwOwo+ICsgICAgc3RydWN0IGlvbW11X2dyb3VwICpncnA7Cj4gKwo+ICsgICAgd2hp
bGUgKCByYWRpeF90cmVlX2dhbmdfbG9va3VwKCZpb21tdV9ncm91cHMsICh2b2lkICoqKSZncnAs
IGlkLCAxKSApCj4gKyAgICB7Cj4gKyAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7Cj4gKwo+
ICsgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBwZGV2LCAmZ3JwLT5kZXZzX2xpc3QsIGdy
cGRldnNfbGlzdCApCj4gKyAgICAgICAgICAgIGlmICggcGRldi0+c2VnID09IHNlZyAmJiBwZGV2
LT5idXMgPT0gYnVzICYmCj4gKyAgICAgICAgICAgICAgICAgcGRldi0+ZGV2Zm4gPT0gZGV2Zm4g
KQo+ICsgICAgICAgICAgICAgICAgcmV0dXJuIGdycDsKPiArCj4gKyAgICAgICAgaWQgPSBncnAt
PmlkICsgMTsKPiArICAgIH0KPiArCj4gKyAgICByZXR1cm4gTlVMTDsKPiArfQo+ICsKPiAraW50
IGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVz
LCB1OCBkZXZmbiwKClVzaW5nIHBjaV9zYmRmX3Qgd291bGQgYmUgYmV0dGVyIGhlcmUgdG8gcGFz
cyB0aGUgU0JERiBJTU8sIG9yCnVpbnQ8c2l6ZT5fdCwgb3IganVzdCBwbGFpbiB1bnNpZ25lZCBp
bnQuCgpBbHNvLCBJIHdvbmRlciBhYm91dCB0aGUgdXNlZnVsbmVzcyBvZiB0aGUgZG9tYWluIHBh
cmFtZXRlciwgc2hvdWxkbid0CnlvdSBkbyB0aGUgb3duZXJzaGlwIGNoZWNrIHNvbWV3aGVyZSBl
bHNlIChpZiByZXF1aXJlZCkgYW5kIGhhdmUgdGhpcwpmdW5jdGlvbiBqdXN0IGNoZWNrIHRoZSBJ
T01NVSBncm91cCBvZiBhIGdpdmVuIFBDSSAgZGV2aWNlPwoKKE5vdGUgeW91IHByb2JhYmx5IHdh
bnQgdG8gY29uc3RpZnkgdGhlIGRvbWFpbiBwYXJhbWV0ZXIgaWYgaXQgbmVlZHMgdG8Kc3RheSku
Cgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQz
MikgYnVmLCBpbnQgbWF4X3NkZXZzKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdy
cDsKPiArICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Owo+ICsgICAgaW50IGkgPSAwOwoKSXQgc2Vl
bXMgbGlrZSB0aGlzIHNob3VsZCBiZSB1bnNpZ25lZCBpbnQ/Cgo+ICsKPiArICAgIHBjaWRldnNf
bG9jaygpOwo+ICsKPiArICAgIGdycCA9IGlvbW11X2dyb3VwX2xvb2t1cChzZWcsIGJ1cywgZGV2
Zm4pOwo+ICsgICAgaWYgKCAhZ3JwICkKPiArICAgIHsKPiArICAgICAgICBwY2lkZXZzX3VubG9j
aygpOwo+ICsgICAgICAgIHJldHVybiAwOwo+ICsgICAgfQo+ICsKPiArICAgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkgKCBwZGV2LCAmZ3JwLT5kZXZzX2xpc3QsIGdycGRldnNfbGlzdCApCj4gKyAgICB7
Cj4gKyAgICAgICAgdWludDMyX3Qgc2JkZjsKPiArCj4gKyAgICAgICAgaWYgKCBpID49IG1heF9z
ZGV2cyApCj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsKPiArICAgICAgICBpZiAoIHBkZXYtPmRv
bWFpbiAhPSBkICkKPiArICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAgICAgIHNiZGYg
PSBQQ0lfU0JERjMocGRldi0+c2VnLCBwZGV2LT5idXMsIHBkZXYtPmRldmZuKTsKPiArCj4gKyAg
ICAgICAgaWYgKCB4c21fZ2V0X2RldmljZV9ncm91cChYU01fSE9PSywgc2JkZikgKQo+ICsgICAg
ICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgaWYgKCB1bmxpa2VseShjb3B5X3RvX2d1
ZXN0X29mZnNldChidWYsIGksICZzYmRmLCAxKSkgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAg
ICAgcGNpZGV2c191bmxvY2soKTsKPiArICAgICAgICAgICAgcmV0dXJuIC0xOwoKLUVGQVVMVD8K
Cj4gKyAgICAgICAgfQo+ICsgICAgICAgIGkrKzsKPiArICAgIH0KPiArCj4gKyAgICBwY2lkZXZz
X3VubG9jaygpOwo+ICsKPiArICAgIHJldHVybiBpOwo+ICt9Cj4gKwo+ICAjZW5kaWYgLyogQ09O
RklHX0hBU19QQ0kgKi8KPiAgCj4gIC8qCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiBpbmRleCA2MjEw
NDA5NzQxLi42OGIyODgzZWQ2IDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3BjaS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiBAQCAtMTU1NCw1
MyArMTU1NCw2IEBAIGludCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNl
ZywgdTggYnVzLCB1OCBkZXZmbikKPiAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAgCj4gLXN0YXRp
YyBpbnQgaW9tbXVfZ2V0X2RldmljZV9ncm91cCgKPiAtICAgIHN0cnVjdCBkb21haW4gKmQsIHUx
NiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sCj4gLSAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQz
MikgYnVmLCBpbnQgbWF4X3NkZXZzKQoKT2gsIEkgc2VlIHRoaXMgaXMgY29kZSBtb3ZlbWVudCBh
bmQgY2hhbmdlcyB0byBhbiBleGlzdGluZyBmdW5jdGlvbiwKaGVuY2UgbXkgY29tbWVudHMgYWJv
dmUgbWlnaHQgYmUgc3RhbGUsIG9yIHdpbGwgcmVxdWlyZSB0byBmaXh1cCB0aGUKY2FsbGVycyB3
aGljaCBtaWdodCBiZSBjdW1iZXJzb21lLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
