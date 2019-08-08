Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95BC86056
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:47:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfts-0003oc-0N; Thu, 08 Aug 2019 10:44:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvftq-0003oV-5J
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:44:02 +0000
X-Inumbo-ID: 6ed36f52-b9c9-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6ed36f52-b9c9-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 10:44:01 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Oy+Zb0A5185T5n8/vpRDtu+l+Iif5sZddlgEUTVkLDxjOqrnH06JhjW12UNpZ99T+mVF1DbCob
 u+3xk+AD0TT25vCF+QzZZDtdnUlIZdrVkyfxQXU8MeCAhkkStm3z/s2BS9rj/6kx6s/cY9aFWr
 01juETdofoQ0yvHgPNdQUKszLGuJtHHXgirE+3aCP2l0MQlNHYALRep3U/RpStRy+O4N3xInRD
 4PxeweSVMLLJP9W10uisF+VWKqnZRXu9AojF0bmuTpqT7LUF5miqWhbPVSq/M+9oFaQVTGBYTO
 Xh8=
X-SBRS: 2.7
X-MesageID: 4202700
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4202700"
Date: Thu, 8 Aug 2019 12:43:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190808104354.wcl2vicpmvbl3rlz@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-21-anthony.perard@citrix.com>
 <20190807150346.upizhcngos3prol4@Air-de-Roger>
 <20190808103813.GR1242@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808103813.GR1242@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 20/35]
 OvmfPkg/XenPlatformPei: Introduce XenPvhDetected
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

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMTE6Mzg6MTNBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6MDM6NDZQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDA0OjM5OjI5UE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiArQk9PTEVBTgo+ID4gPiArWGVuUHZo
RGV0ZWN0ZWQgKAo+ID4gPiArICBWT0lECj4gPiA+ICsgICkKPiA+ID4gK3sKPiA+ID4gKyAgLy8K
PiA+ID4gKyAgLy8gVGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBiZSB1c2VkIGFmdGVyIFhlbkNv
bm5lY3QKPiA+ID4gKyAgLy8KPiA+ID4gKyAgQVNTRVJUIChtWGVuSW5mby5WZXJzaW9uTWFqb3Ig
IT0gMCk7Cj4gPiAKPiA+IFRoYXQncyBJTU8gZGFuZ2Vyb3VzLiBVc2luZyB0aGUgdmVyc2lvbiBh
cyBhbiBpbmRpY2F0aW9uIHRoYXQKPiA+IFhlbkNvbm5lY3QgaGFzIHJ1biBzZWVtcyBsaWtlIGEg
YmFkIGlkZWEsIHNpbmNlIHJldHVybmluZyBhIG1ham9yCj4gPiB2ZXJzaW9uIG9mIDAgaXMgYSB2
YWxpZCBudW1iZXIgdG8gcmV0dXJuLiBDYW4ndCB5b3UgY2hlY2sgYWdhaW5zdAo+ID4gc29tZXRo
aW5nIGVsc2UgdGhhdCBkb2Vzbid0IGRlcGVuZHMgb24gaHlwZXJ2aXNvciBwcm92aWRlZCBkYXRh
PyAoaWU6Cj4gPiBsaWtlIHNvbWUgYWxsb2NhdGlvbnMgb3Igc3VjaCB0aGF0IGhhcHBlbiBpbiBY
ZW5Db25uZWN0KQo+ID4gCj4gPiBBIHBhcmFub2lkIGNvdWxkIHByb3ZpZGVyIGNvdWxkIGV2ZW4g
cmV0dXJuIG1ham9yID09IDAgYW5kIG1pbm9yID09IDAKPiA+IGluIG9yZGVyIHRvIGF0dGVtcHQg
dG8gaGlkZSB0aGUgWGVuIHZlcnNpb24gdXNlZCwgc2luY2UgZ3Vlc3RzIGFyZSBub3QKPiA+IHN1
cHBvc2VkIHRvIGluZmVyIGFueXRoaW5nIGZyb20gdGhlIFhlbiB2ZXJzaW9uLCBhdmFpbGFibGUg
aHlwZXJ2aXNvcgo+ID4gZmVhdHVyZXMgYXJlIHJlcG9ydGVkIGJ5IG90aGVyIG1lYW5zLgo+IAo+
IEknbSBzdXJlIGEgcGFyYW5vaWQgcHJvdmlkZXIgd291bGRuJ3QgdXNlIGEgZGVidWcgYnVpbGQg
b2YgT1ZNRiA6LSkuIFNvCj4gdGhhdCBhc3NlcnQgZG9lc24ndCBtYXR0ZXIuIFRoZXJlJ3Mgbm90
aGluZyBkYW5nZXJvdXMgaW4gYSBgbm9wJyEgOi1ECj4gCj4gQnV0IEkgY291bGQgdXNlIG1YZW5J
bmZvLkh5cGVyUGFnZXMgaW5zdGVhZC4KCkl0J3MganVzdCBhIG5pdCwgYW5kIFRCSCBpdCdzIHF1
aXRlIHVubGlrZWx5IGZvciBhbnlvbmUgdG8gcmVwb3J0IGEKbWFqb3IgdmVyc2lvbiBvZiAwLCBp
dCdzIGp1c3QgdGhhdCBpZiB5b3UgaGF2ZSBzb21ldGhpbmcgZWxzZSB0bwphc3NlcnQgZm9yIGlu
aXRpYWxpemF0aW9uIGl0IG1pZ2h0IGJlIHNhZmVyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
