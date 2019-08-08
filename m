Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C738659A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 17:22:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvkCP-0001ys-Te; Thu, 08 Aug 2019 15:19:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvkCP-0001yl-9m
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 15:19:29 +0000
X-Inumbo-ID: e9617454-b9ef-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9617454-b9ef-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 15:19:27 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IyKyOUKcSTDoF7I1LYPWC97x9NJ6eNTKPa9k6WJL8Km8X2zslXP+5ZBVv9temj9+5x7NnIgHt4
 jGRR7DiQYRaFQwjo4RhHiitDTHwL6rNXkrA2RomNzJkgt+ZJTg09oAPuATAMi1SDaYVhAGUTK+
 QrMD7IOBCdopZ5kO6hL9U4bTFM6D8E0mJDV5YvnHcEqLQ3XCjYdc32QL8+2vXVG7InAYW3XkUE
 WVTN07+0p16/w3xEtsARtO4gq0MxO2CHsKGUhW9QgHXQ19iCbe1Fe47XMqkbxPnV/Gaa9Xva3b
 pmo=
X-SBRS: 2.7
X-MesageID: 4200620
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4200620"
Date: Thu, 8 Aug 2019 17:19:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190808151920.uqwzdbe72w7fotf5@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-36-anthony.perard@citrix.com>
 <20190807160957.csgyplb6cqfen5ix@Air-de-Roger>
 <20190808140348.GW1242@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808140348.GW1242@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 35/35] OvmfPkg/OvmfXen: use
 RealTimeClockRuntimeDxe from EmbeddedPkg
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDM6MDM6NDhQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDY6MDk6NTdQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDA0OjM5OjQ0UE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBBIFhlbiBQVkggZ3Vlc3QgZG9lc24n
dCBoYXZlIGEgUlRDIHRoYXQgT1ZNRiB3b3VsZCBleHBlY3QsIHNvCj4gPiA+IFBjYXRSZWFsVGlt
ZUNsb2NrUnVudGltZUR4ZSBmYWlscyB0byBpbml0aWFsaXplIGFuZCBwcmV2ZW50IHRoZQo+ID4g
PiBmaXJtd2FyZSBmcm9tIGZpbmlzaCB0byBib290LiBUbyBwcmV2ZW50IHRoYXQsIHdlIHdpbGwg
dXNlCj4gPiA+IFhlblJlYWxUaW1lQ2xvY2tMaWIgd2hpY2ggc2ltcGx5IGFsd2F5cyByZXR1cm4g
dGhlIHNhbWUgdGltZS4KPiA+ID4gVGhpcyB3aWxsIHdvcmsgb24gYm90aCBYZW4gUFZIIGFuZCBI
Vk0gZ3Vlc3RzLgo+ID4gCj4gPiBOb3QgdGhhdCB0aGlzIGlzIG5vdCBjb3JyZWN0LCBidXQgd2hh
dCdzIHRoZSBwb2ludCBpbiByZXF1aXJpbmcgYQo+ID4gY2xvY2sgaWYgaXQgY2FuIGJlIGZha2Vk
IGJ5IGFsd2F5cyByZXR1cm5pbmcgdGhlIHNhbWUgdmFsdWU/Cj4gCj4gSXQncyBub3QgYSBjbG9j
ayB0aGF0IGlzIHJlcXVpcmVkLCBpdCBpcyBhIGxpYnJhcnkgdGhhdCBpbXBsZW1lbnRzCj4gUmVh
bFRpbWVDbG9ja0xpYi4gU29tZXRoaW5nIG5lZWRzIGl0LCBzbyBpdCBpcyBwcm92aWRlZCwgZXZl
biBpZiBpdCBpcwo+IG9ubHkgdG8gZGlzcGxheSB0aGUgImN1cnJlbnQgdGltZSIuCj4gCj4gPiBJ
dCBzZWVtcyBsaWtlIGl0J3MgdXNhZ2UgaXMgbm90IHJlYWxseSByZXF1aXJlZCwgYW5kIGNvdWxk
IGluZGVlZCBiZQo+ID4gZHJvcHBlZCBhbHRvZ2V0aGVyPwo+IAo+IFdheSB0byBtdWNoIHdvcmsg
dG8gZHJvcCBpdC4gQWxzbywgSSBkb24ndCB3b3JrIHRvIGZvcmsgT1ZNRi4KPiAKPiBUaGUgQVJN
IGltcGxlbWVudGF0aW9uIG9mIE9WTUYgZm9yIFhlbiBkb2VzIHRoZSBzYW1lIHRoaW5nIGFuZCBz
aW1wbHkKPiBhbHdheXMgcmV0dXJuIHRoZSBzYW1lIHZhbHVlLgo+IAo+ID4gQWx0ZXJuYXRpdmVs
eSwgdGhlcmUncyB0aGUgUFYgY2xvY2sgd2hpY2ggaXMgYXZhaWxhYmxlIHRvIFBWSCBndWVzdHMK
PiA+IGFuZCB3aWxsIHJldHVybiBhIHByb3BlciB0aW1lLgo+IAo+IFdlIG1pZ2h0IG5lZWQgdG8g
ZG8gdGhhdCBvbmUgZGF5IEkgZ3Vlc3MsIGJ1dCByaWdodCBub3cgaXQgaXMganVzdCBhCj4gbmlj
ZSB0byBoYXZlLgoKQWNrLCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KClJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
