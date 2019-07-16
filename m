Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D406A777
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 13:31:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnLdE-0004aw-Il; Tue, 16 Jul 2019 11:28:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxGA=VN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnLdD-0004ar-PF
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 11:28:27 +0000
X-Inumbo-ID: d3984ea7-a7bc-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3984ea7-a7bc-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 11:28:26 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qxdgzCJ/jffs5ebQTcnqIQtHlSBHkoLWyvz6b5tyalgGwQUUkILfRRAOQ9vcewYga0HT+exI9o
 fmwydzBP36DdqGxJqfW+6ZlZHQBh9wcH2bzbtqt/RFSAEkse1uBM9yngcXt1qpTlJfrFABr2Gs
 +HuP1Aufp1QMetu49Pt5op6Q39IoUaDKqcbf9x9a6sPCi8b8RSlJ8kJE6LFnp2UTDpE+I+0u3X
 OpqF5ARkw8blEzT5u9S0GXMF8ELcXG5poKI9qYaRYbnHQyTl8flkykIfworaNbHcnWXTrplLIH
 1OE=
X-SBRS: 2.7
X-MesageID: 3008840
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3008840"
Date: Tue, 16 Jul 2019 13:28:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190716112815.xulpw3gcoilqv43k@Air-de-Roger.citrite.net>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-5-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716101657.23327-5-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 4/4] iommu / pci: re-implement
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6MTY6NTdBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLiB1c2luZyB0aGUgbmV3IGlvbW11X2dyb3VwIGluZnJhc3RydWN0dXJlLgo+IAo+
IEJlY2F1c2UgJ3NpYmxpbmcnIGRldmljZXMgYXJlIG5vdyBtZW1iZXJzIG9mIHRoZSBzYW1lIGlv
bW11X2dyb3VwLAo+IGltcGxlbWVudCB0aGUgZG9tY3RsIGJ5IGxvb2tpbmcgdXAgdGhlIGlvbW11
X2dyb3VwIG9mIHRoZSBwZGV2IHdpdGggdGhlCj4gbWF0Y2hpbmcgU0JERiBhbmQgdGhlbiBmaW5k
aW5nIGFsbCB0aGUgYXNzaWduZWQgcGRldnMgdGhhdCBhcmUgaW4gdGhlCj4gZ3JvdXAuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAt
LS0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IHYzOgo+ICAtIE1h
a2UgJ21heF9zZGV2cycgcGFyYW1ldGVyIGluIGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoKSB1bnNp
Z25lZC4KPiAgLSBBZGQgbWlzc2luZyBjaGVjayBvZiBtYXhfc2RldnMgdG8gYXZvaWQgYnVmZmVy
IG92ZXJmbG93Lgo+IAo+IHYyOgo+ICAtIFJlLWltcGxlbWVudCBpbiB0aGUgYWJzZW5jZSBvZiBh
IHBlci1ncm91cCBkZXZzIGxpc3QuCj4gIC0gTWFrZSB1c2Ugb2YgcGNpX3NiZGZfdC4KPiAtLS0K
PiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMgfCA0NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAg
fCA1MSArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHhlbi9pbmNs
dWRlL3hlbi9pb21tdS5oICAgICAgICAgIHwgIDMgKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTEg
aW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBz
LmMKPiBpbmRleCBjNmQwMDk4MGI2Li40ZTZlODAyMmMxIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
Z3JvdXBzLmMKPiBAQCAtMTIsOCArMTIsMTIgQEAKPiAgICogR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8eGVuL2d1ZXN0
X2FjY2Vzcy5oPgo+ICAjaW5jbHVkZSA8eGVuL2lvbW11Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4vcGNp
Lmg+Cj4gICNpbmNsdWRlIDx4ZW4vcmFkaXgtdHJlZS5oPgo+ICsjaW5jbHVkZSA8eGVuL3NjaGVk
Lmg+Cj4gKyNpbmNsdWRlIDx4c20veHNtLmg+Cj4gIAo+ICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgewo+
ICAgICAgdW5zaWduZWQgaW50IGlkOwo+IEBAIC04MSw2ICs4NSw0OCBAQCBpbnQgaW9tbXVfZ3Jv
dXBfYXNzaWduKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB2b2lkICphcmcpCj4gICAgICByZXR1cm4g
MDsKPiAgfQo+ICAKPiAraW50IGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoc3RydWN0IGRvbWFpbiAq
ZCwgcGNpX3NiZGZfdCBzYmRmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fR1VF
U1RfSEFORExFXzY0KHVpbnQzMikgYnVmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgbWF4X3NkZXZzKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdy
cCA9IE5VTEw7Cj4gKyAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldjsKPiArICAgIHVuc2lnbmVkIGlu
dCBpID0gMDsKPiArCj4gKyAgICBwY2lkZXZzX2xvY2soKTsKPiArCj4gKyAgICBmb3JfZWFjaF9w
ZGV2ICggZCwgcGRldiApCj4gKyAgICB7Cj4gKyAgICAgICAgaWYgKCBwZGV2LT5zYmRmLnNiZGYg
PT0gc2JkZi5zYmRmICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGdycCA9IHBkZXYtPmdy
cDsKPiArICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICsKPiArICAg
IGlmICggIWdycCApCj4gKyAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICsgICAgZm9yX2VhY2hfcGRl
diAoIGQsIHBkZXYgKQo+ICsgICAgewo+ICsgICAgICAgIGlmICggeHNtX2dldF9kZXZpY2VfZ3Jv
dXAoWFNNX0hPT0ssIHBkZXYtPnNiZGYuc2JkZikgfHwKPiArICAgICAgICAgICAgIHBkZXYtPmdy
cCAhPSBncnAgKQo+ICsgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgaWYgKCBp
IDwgbWF4X3NkZXZzICYmCgpBRkFJQ1QgeW91IGFyZSBhZGRpbmcgdGhlIGNoZWNrIGhlcmUgaW4g
b3JkZXIgdG8ga2VlcCBjdXJyZW50CmJlaGF2aW91cj8KCkJ1dCBpc24ndCBpdCB3cm9uZyB0byBu
b3QgcmVwb3J0IHRvIHRoZSBjYWxsZXIgdGhhdCB0aGUgYnVmZmVyIHdhcwpzbWFsbGVyIHRoYW4g
cmVxdWlyZWQsIGFuZCB0aGF0IHRoZSByZXR1cm5lZCByZXN1bHQgaXMgcGFydGlhbD8KCkkgZG9u
J3Qgc2VlIGFueSB3YXkgYSBjYWxsZXIgY2FuIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBhIHJlc3Vs
dCB0aGF0CnVzZXMgdGhlIGZ1bGwgYnVmZmVyIGFuZCBvbmUgdGhhdCdzIGFjdHVhbGx5IHBhcnRp
YWwgZHVlIHRvIHNtYWxsZXIKdGhhbiByZXF1aXJlZCBidWZmZXIgcHJvdmlkZWQuIEkgdGhpbmsg
dGhpcyBmdW5jdGlvbiBzaG91bGQgcmV0dXJuCi1FTk9TUEMgZm9yIHN1Y2ggY2FzZS4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
