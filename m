Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229DD8639B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:46:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hviiY-00028O-2X; Thu, 08 Aug 2019 13:44:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hviiW-00028J-Ky
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:44:32 +0000
X-Inumbo-ID: a600b6f7-b9e2-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a600b6f7-b9e2-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 13:44:31 +0000 (UTC)
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
IronPort-SDR: VKYlQuDJ7TE35HhM7QI8xh+jt5UdVqh3RElN6GuxhGQLYyrFIg6eebrjJPtljXWGfsROh8Qfo+
 JNTpmNPxRHVCeAbrmlTQ98aCOBuQQL33jGe3H0t8bNn4K+utUFCXe4aPTav2pwxrQQmLR39fbs
 GIjUoTH6sfmxWtkWIavAOfZEL443WzhWuZAdxGKMmVv1dvSF8sZl+YHWaGs4BCbcrA9AGSeu7g
 ZN2cjweG4HTz0S090u601f74Ny47Su1IgsgBuxUcyD2C8dRE2MeuE6VPzPoqNZjwFg/qJyiEU6
 Z6A=
X-SBRS: 2.7
X-MesageID: 4165541
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4165541"
Date: Thu, 8 Aug 2019 15:44:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190808134423.ybqg3qkpw5ucfzk4@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-30-anthony.perard@citrix.com>
 <20190807155451.pkld6zhcxljzx6d7@Air-de-Roger>
 <20190808132832.GU1242@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808132832.GU1242@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 29/35] OvmfPkg/OvmfXen:
 Override PcdFSBClock to Xen vLAPIC timer frequency
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

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDI6Mjg6MzJQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6NTQ6NTFQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDA0OjM5OjM4UE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBQY2RGU0JDbG9jayBpcyB1c2VkIGJ5
IFNlY1BlaUR4ZVRpbWVyTGliQ3B1LCB0aGUgVGltZXJMaWIKPiA+ID4gaW1wbGVtZW50YXRpb24u
IEl0IHdpbGwgYWxzbyBiZSB1c2VkIGJ5IFhlblRpbWVyRHhlLiBPdmVycmlkZQo+ID4gPiBQY2RG
U0JDbG9jayB0byBtYXRjaCBYZW4gdkxBUElDIHRpbWVyIGZyZXF1ZW5jeS4KPiA+IAo+ID4gSSdt
IGtpbmQgb2Ygc3VycHJpc2VkIHRoYXQgaGlzIGlzIG5vdCBhdXRvbWF0aWNhbGx5IGRldGVjdGVk
Pwo+ID4gCj4gPiBJcyBpdCBhIGJ1ZyBpbiBYZW4gb3IganVzdCBhbHdheXMgaGFyZGNvZGVkIG9u
IE9WTUY/Cj4gCj4gSXQncyBoYXJkY29kZWQuIFdoeSB3b3VsZCB5b3UgbmVlZCBhdXRvIGRldGVj
dGlvbiB3aGVuIHlvdSBhbHdheXMgcnVuIG9uCj4gdGhlIHNhbWUgbWFjaGluZSA7LSkuCgpJIGRv
bid0IHRoaW5rIHRoYXQncyBwYXJ0IG9mIHRoZSBIVk0vUFZIIEFCSSBpbiBhbnkgd2F5LCBhbmQg
aWYgeW91CmhhcmRjb2RlIGl0IGluIE9WTUYgaXQgd291bGQgcHJldmVudCBYZW4gZnJvbSBjaGFu
Z2luZyB0aGUgZnJlcXVlbmN5CmluIHRoZSBmdXR1cmUgaWYgc3VjaCBuZWNlc3NpdHkgYXJpc2Vz
LiBXZSBzaG91bGQgdHJ5IHRvIGF2b2lkIHBhaW50aW5nCm91cnNlbHZlcyBpbnRvIGEgY29ybmVy
IHdoZW4gcG9zc2libGUuCgpEb2Vzbid0IE9WTUYgaGF2ZSBhIHdheSB0byBnZXQgdGhpcyBmcm9t
IHRoZSBoYXJkd2FyZSBpdHNlbGY/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
