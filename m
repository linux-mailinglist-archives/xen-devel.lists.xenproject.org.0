Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5B623009
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 11:19:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSeNg-0001f9-Ay; Mon, 20 May 2019 09:14:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x+15=TU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hSeNe-0001f4-Tl
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:14:50 +0000
X-Inumbo-ID: b742a64e-7adf-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b742a64e-7adf-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 09:14:48 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
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
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: M233AeOOLYe0Q04FuCv+Dmoy+9EPFDJ7Z00miECnVf/XQOWDWtnaL6w2bBueEoxgQl9d3gNBzZ
 HfSjDKMgtzuCkDm5IbmugsCXUbCEaOwZ8SFBCay19MtvnUDd0r8IfhE4nXsVe09H5Tbp/fqUem
 NHDjLQCf4mDzrwWRkG6W3+jKGWrwJoes13iqN04Ubs/fZXC2Su5Hb38xCsw4I99V5ioc4VeKfE
 Ug26OhL7lxccvC6czFVVx9RdCvqP31utAUJCtb8WP5ucXbwwJyoH84Q6DiOAW6SBoYM54xsJ/Z
 4nk=
X-SBRS: 2.7
X-MesageID: 638805
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="638805"
Date: Mon, 20 May 2019 11:14:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190520091435.k4txcb4m3lx7n4py@Air-de-Roger>
References: <20190517170555.17423-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517170555.17423-1-wei.liu2@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDY6MDU6NTVQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBBZnRlciA4OTk0MzNmMTQ5ZCBsaWJ4bCBuZWVkcyB0byBrbm93IHRoZSBjb250ZW50IG9mIGRf
Y29uZmlnIHRvCj4gZGV0ZXJtaW5lIHdoaWNoIFFFTVUgaXMgdXNlZC4gVGhlIGNvZGUgaXMgY2hh
bmdlZCBzdWNoIHRoYXQKPiBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2VfbW9kZWwgbmVlZHMgdG8g
YmUgY2FsbGVkIGJlZm9yZQo+IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0Lgo+
IAo+IFRoaXMgaXMgZmluZSBmb3IgbGlieGwgY29kZSwgYnV0IGl0IGlzIHByb2JsZW1hdGljIGZv
cgo+IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSwgd2hpY2ggaXMgdGhlIG9ubHkgcHVibGljIEFQ
SSB0aGF0IHRha2VzIGEKPiBidWlsZF9pbmZvLiBUbyBhdm9pZCBicmVhayBpdHMgdXNlcnMsIHBy
b3ZpZGUgYSBjb21wYXRpYmlsaXR5IHNldHRpbmcKPiBpbnNpZGUgdGhhdCBmdW5jdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKV2l0aCBvbmUgbml0
IGJlbG93LgoKPiAtLS0KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Cj4gQ2M6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KPiBDYzogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPiAKPiBQbGVhc2UgdGVzdC4KPiAtLS0KPiAgdG9vbHMvbGlieGwvbGlieGxfbWVt
LmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMgYi90b29scy9s
aWJ4bC9saWJ4bF9tZW0uYwo+IGluZGV4IDQ0OGEyYWY4ZmQuLmZlMWY5YzJmZjggMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9t
ZW0uYwo+IEBAIC00NTcsNiArNDU3LDI0IEBAIGludCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnko
bGlieGxfY3R4ICpjdHgsCj4gICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19pbml0KGJfaW5m
byk7Cj4gICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19jb3B5KGN0eCwgYl9pbmZvLCBiX2lu
Zm9faW4pOwo+ICAKPiArICAgIC8qCj4gKyAgICAgKiBJdCBoYXMgYmVjb21lIGEgcmVxdWlyZW1l
bnQgdGhhdCB0byBmaWd1cmUgb3V0IHdoaWNoIFFFTVUgdG8KPiArICAgICAqIHVzZSwgbGlieGwg
d2lsbCBuZWVkIHRvIHBlZWsgZF9jb25maWcncyBjb250ZW50LiBUaGUgY29kZSBoYXMKPiArICAg
ICAqIGJlZW4gY2hhbmdlZCBzdWNoIHRoYXQgb25lIHdpbGwgbmVlZCB0byBjYWxsCj4gKyAgICAg
KiBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2VfbW9kZWwgYmVmb3JlIGNhbGxpbmcKPiArICAgICAq
IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0IGluc2lkZSBsaWJ4bC4KPiArICAg
ICAqCj4gKyAgICAgKiBUaGlzIChwcm9ibGVtYXRpYykgcHVibGljIEFQSSBpcyB0aGUgb25seSBv
bmUgd2hpY2ggdGFrZXMgYQo+ICsgICAgICogYl9pbmZvLCBpbXBvc2luZyB0aGUgc2FtZSByZXF1
aXJlbWVudCBvbiB0aGUgdXNlcnMgb2YgdGhpcwo+ICsgICAgICogcHVibGljIEFQSSB3aWxsIGJy
ZWFrIHRoZW0uCj4gKyAgICAgKgo+ICsgICAgICogUHJvdmlkZSBhIGNvbXBhdGliaWxpdHkgc2V0
dGluZyBmb3IgdGhpcyBmdW5jdGlvbi4gVGhlCj4gKyAgICAgKiBjYWxjdWxhdGlvbiBkb2Vzbid0
IHJlYWxseSBjYXJlIHdoaWNoIFFFTVUgaXMgc2V0IGhlcmUsIHNvIHdlCj4gKyAgICAgKiBnbyB3
aXRoIHRoZSB1cHN0cmVhbSBkZWZhdWx0Lgo+ICsgICAgICovCj4gKyAgICBpZiAoIWJfaW5mby0+
ZGV2aWNlX21vZGVsX3ZlcnNpb24pCj4gKwliX2luZm8tPmRldmljZV9tb2RlbF92ZXJzaW9uID0g
TElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU47CgpUaGVyZSdzIGEgaGFyZCB0YWIg
aW4gdGhlIGxpbmUgYWJvdmUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
