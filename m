Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E369890
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:49:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn3BC-00036C-F1; Mon, 15 Jul 2019 15:46:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eZ1r=VM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hn3BB-000365-6C
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 15:46:17 +0000
X-Inumbo-ID: ad3301e2-a717-11e9-835e-5be3d9c91321
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad3301e2-a717-11e9-835e-5be3d9c91321;
 Mon, 15 Jul 2019 15:46:14 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wc5z+cVMBTAC90is0Pn2zAyJEqYdltKr+ZLa7qVPNEmdu03iapmMq76TyUfpOmla4JMsZ0+8Qh
 dYM58DLF/KEt62ACwr1qdsQWDvdEO5PGh0TJEQj5Cjvm9VHYO6fns0Sh/d2TpNXa66+5O6PFQL
 AzgSLH+mRXeDoDkBtLfZfkWy4MJPL0TPWHKl+yeFiJSxsYxwSi2nSMQnPnndAcGSMuxuOmMIqh
 tiI9zm0Sl+GrSvHu25O2D0kZllD+glVA2Cboj+fRqphv/ntkH4/ojsvwdWpdpP69ieOjRJxlev
 Kvk=
X-SBRS: 2.7
X-MesageID: 3027318
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3027318"
Date: Mon, 15 Jul 2019 17:46:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190715154602.mndwawkgavs7mbqg@Air-de-Roger.citrite.net>
References: <20190715123710.1780-1-paul.durrant@citrix.com>
 <20190715123710.1780-5-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715123710.1780-5-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 4/4] iommu / pci: re-implement
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDE6Mzc6MTBQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLiB1c2luZyB0aGUgbmV3IGlvbW11X2dyb3VwIGluZnJhc3RydWN0dXJlLgo+IAo+
IEJlY2F1c2UgJ3NpYmxpbmcnIGRldmljZXMgYXJlIG5vdyBtZW1iZXJzIG9mIHRoZSBzYW1lIGlv
bW11X2dyb3VwLAo+IGltcGxlbWVudCB0aGUgZG9tY3RsIGJ5IGxvb2tpbmcgdXAgdGhlIGlvbW11
X2dyb3VwIG9mIHRoZSBwZGV2IHdpdGggdGhlCj4gbWF0Y2hpbmcgU0JERiBhbmQgdGhlbiBmaW5k
aW5nIGFsbCB0aGUgYXNzaWduZWQgcGRldnMgdGhhdCBhcmUgaW4gdGhlCj4gZ3JvdXAuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAt
LS0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IHYyOgo+ICAtIFJl
LWltcGxlbWVudCBpbiB0aGUgYWJzZW5jZSBvZiBhIHBlci1ncm91cCBkZXZzIGxpc3QuCj4gIC0g
TWFrZSB1c2Ugb2YgcGNpX3NiZGZfdC4KPiAtLS0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
Z3JvdXBzLmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgIHwgNTEgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICB8ICAy
ICsrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMKPiBpbmRleCAxYTJmNDYxYzg3Li42ZDgwNjRl
NGY0IDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jCj4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMKPiBAQCAtMTIsOCArMTIsMTIgQEAK
PiAgICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiAgICov
Cj4gIAo+ICsjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgo+ICAjaW5jbHVkZSA8eGVuL2lv
bW11Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4vcGNpLmg+Cj4gICNpbmNsdWRlIDx4ZW4vcmFkaXgtdHJl
ZS5oPgo+ICsjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Cj4gKyNpbmNsdWRlIDx4c20veHNtLmg+Cj4g
IAo+ICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgewo+ICAgICAgdW5zaWduZWQgaW50IGlkOwo+IEBAIC04
MSw2ICs4NSw0NiBAQCBpbnQgaW9tbXVfZ3JvdXBfYXNzaWduKHN0cnVjdCBwY2lfZGV2ICpwZGV2
LCB2b2lkICphcmcpCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiAraW50IGlvbW11X2dldF9k
ZXZpY2VfZ3JvdXAoc3RydWN0IGRvbWFpbiAqZCwgcGNpX3NiZGZfdCBzYmRmLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQzMikgYnVmLCBpbnQg
bWF4X3NkZXZzKQoKbWF4X3NkZXZzIHNob3VsZCBiZSB1bnNpZ25lZCBBRkFJQ1QsIGJ1dCBpdCBz
ZWVtcyB0byBiZSBjb21wbGV0ZWx5CnVudXNlZC4gSSB0aGluayB5b3Ugd2FudCB0byBkby4uLgoK
PiArewo+ICsgICAgc3RydWN0IGlvbW11X2dyb3VwICpncnAgPSBOVUxMOwo+ICsgICAgc3RydWN0
IHBjaV9kZXYgKnBkZXY7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaSA9IDA7Cj4gKwo+ICsgICAgcGNp
ZGV2c19sb2NrKCk7Cj4gKwo+ICsgICAgZm9yX2VhY2hfcGRldiAoIGQsIHBkZXYgKQo+ICsgICAg
ewo+ICsgICAgICAgIGlmICggcGRldi0+c2JkZi5zYmRmID09IHNiZGYuc2JkZiApCj4gKyAgICAg
ICAgewo+ICsgICAgICAgICAgICBncnAgPSBwZGV2LT5ncnA7Cj4gKyAgICAgICAgICAgIGJyZWFr
Owo+ICsgICAgICAgIH0KPiArICAgIH0KPiArCj4gKyAgICBpZiAoICFncnAgKQo+ICsgICAgICAg
IGdvdG8gb3V0Owo+ICsKPiArICAgIGZvcl9lYWNoX3BkZXYgKCBkLCBwZGV2ICkKPiArICAgIHsK
CmlmICggaSA9PSBtYXhfc2RldnMgKQp7CiAgICBwY2lkZXZzX3VubG9jaygpOwogICAgcmV0dXJu
IC1FTk9TUEM7Cn0KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
