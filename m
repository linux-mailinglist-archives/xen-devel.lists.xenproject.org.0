Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E7385FF4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:41:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfoM-00025m-Bf; Thu, 08 Aug 2019 10:38:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hvfoL-00025h-GD
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:38:21 +0000
X-Inumbo-ID: a1466874-b9c8-11e9-b3d8-6f54690f5aed
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1466874-b9c8-11e9-b3d8-6f54690f5aed;
 Thu, 08 Aug 2019 10:38:16 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gIkCqq34jyQlisNNhjBHIypY7khcgWG3JourM2vqZAxb2r/8/zji7KiioL7caAgX2peNITfK8u
 pIQ1A/ZzYzRPxZoWI4A8/YDSi2PUbpkMZBtX1YjBaNSKyZM4+BExC5pn37byLA9szNeoIL6wfh
 xGDhKSYQaUEUHRefSIksh8en50Vat1OCUOEzf9IOxN9T0S6zha/1KPRxY8Ri2S5YZhk4b+5r+Y
 7FfgJfOuz6lEIvfk1lm5t26VJLdWvjLsOsUYtxbKgc6rAp9uONfUB8RQu+lb58PdZd/Y1U+uVo
 YdA=
X-SBRS: 2.7
X-MesageID: 4031392
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4031392"
Date: Thu, 8 Aug 2019 11:38:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190808103813.GR1242@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-21-anthony.perard@citrix.com>
 <20190807150346.upizhcngos3prol4@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807150346.upizhcngos3prol4@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6MDM6NDZQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNDozOToyOVBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+ICtCT09MRUFOCj4gPiArWGVuUHZoRGV0ZWN0ZWQgKAo+ID4g
KyAgVk9JRAo+ID4gKyAgKQo+ID4gK3sKPiA+ICsgIC8vCj4gPiArICAvLyBUaGlzIGZ1bmN0aW9u
IHNob3VsZCBvbmx5IGJlIHVzZWQgYWZ0ZXIgWGVuQ29ubmVjdAo+ID4gKyAgLy8KPiA+ICsgIEFT
U0VSVCAobVhlbkluZm8uVmVyc2lvbk1ham9yICE9IDApOwo+IAo+IFRoYXQncyBJTU8gZGFuZ2Vy
b3VzLiBVc2luZyB0aGUgdmVyc2lvbiBhcyBhbiBpbmRpY2F0aW9uIHRoYXQKPiBYZW5Db25uZWN0
IGhhcyBydW4gc2VlbXMgbGlrZSBhIGJhZCBpZGVhLCBzaW5jZSByZXR1cm5pbmcgYSBtYWpvcgo+
IHZlcnNpb24gb2YgMCBpcyBhIHZhbGlkIG51bWJlciB0byByZXR1cm4uIENhbid0IHlvdSBjaGVj
ayBhZ2FpbnN0Cj4gc29tZXRoaW5nIGVsc2UgdGhhdCBkb2Vzbid0IGRlcGVuZHMgb24gaHlwZXJ2
aXNvciBwcm92aWRlZCBkYXRhPyAoaWU6Cj4gbGlrZSBzb21lIGFsbG9jYXRpb25zIG9yIHN1Y2gg
dGhhdCBoYXBwZW4gaW4gWGVuQ29ubmVjdCkKPiAKPiBBIHBhcmFub2lkIGNvdWxkIHByb3ZpZGVy
IGNvdWxkIGV2ZW4gcmV0dXJuIG1ham9yID09IDAgYW5kIG1pbm9yID09IDAKPiBpbiBvcmRlciB0
byBhdHRlbXB0IHRvIGhpZGUgdGhlIFhlbiB2ZXJzaW9uIHVzZWQsIHNpbmNlIGd1ZXN0cyBhcmUg
bm90Cj4gc3VwcG9zZWQgdG8gaW5mZXIgYW55dGhpbmcgZnJvbSB0aGUgWGVuIHZlcnNpb24sIGF2
YWlsYWJsZSBoeXBlcnZpc29yCj4gZmVhdHVyZXMgYXJlIHJlcG9ydGVkIGJ5IG90aGVyIG1lYW5z
LgoKSSdtIHN1cmUgYSBwYXJhbm9pZCBwcm92aWRlciB3b3VsZG4ndCB1c2UgYSBkZWJ1ZyBidWls
ZCBvZiBPVk1GIDotKS4gU28KdGhhdCBhc3NlcnQgZG9lc24ndCBtYXR0ZXIuIFRoZXJlJ3Mgbm90
aGluZyBkYW5nZXJvdXMgaW4gYSBgbm9wJyEgOi1ECgpCdXQgSSBjb3VsZCB1c2UgbVhlbkluZm8u
SHlwZXJQYWdlcyBpbnN0ZWFkLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
