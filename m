Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC76913E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:27:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1vD-0004Gg-Rq; Mon, 15 Jul 2019 14:25:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eZ1r=VM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hn1vC-0004Gb-Fl
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:25:42 +0000
X-Inumbo-ID: 6c854a1d-a70c-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6c854a1d-a70c-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 14:25:41 +0000 (UTC)
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
IronPort-SDR: skl3wzIQ4gGp8kCSHeZh5/ilDVRW0QRpjweRxcp34eJoc+KBT4ODuHl1As2bgO2WC/ISxxOIq6
 iAZeDyPf8WM4tgBbTjAuKi1qiJKUTf54Xmhc1Vh4VVKDujRhlErTxDh2hqCXMvnms7vh5YgI84
 2aX6OkhhCgiWCgk+fDNoW3Sosp3YW/Ejovke37sf4W0t0MRNpxaOOhBS+DrkIrZjFRVSPXZTyG
 Kmv2kvnSbeW9wmd9uJAWUWgyVYM6XcFn8TtcBM4RwoZZRycJnfxPhhCVUX6INRGiYILvz2oHyI
 qPg=
X-SBRS: 2.7
X-MesageID: 3050752
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3050752"
Date: Mon, 15 Jul 2019 16:25:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190715142529.mekz3mkgc45erv5c@MacBook-Air-de-Roger.local>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-7-anthony.perard@citrix.com>
 <20190715114657.kct664fsiupfbftf@MacBook-Air-de-Roger.local>
 <b330a32c-f63c-b66f-7406-7e72044f2f42@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b330a32c-f63c-b66f-7406-7e72044f2f42@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTI6NTA6MjlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8wNy8yMDE5IDEyOjQ2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+
ICsgICAgOwo+ID4+ICsgICAgOyBKdW1wIHRvIHRoZSBtYWluIHJvdXRpbmUgb2YgdGhlIHByZS1T
RUMgY29kZQo+ID4+ICsgICAgOyBza2lwaW5nIHRoZSAxNi1iaXQgcGFydCBvZiB0aGUgcm91dGlu
ZSBhbmQKPiA+PiArICAgIDsgaW50byB0aGUgMzItYml0IGZsYXQgbW9kZSBwYXJ0Cj4gPj4gKyAg
ICA7Cj4gPj4gKyAgICBPbmVUaW1lQ2FsbFJldCBUcmFuc2l0aW9uRnJvbVJlYWwxNlRvMzJCaXRG
bGF0Cj4gPiBTaW5jZSBQVkggYWxyZWFkeSBzdGFydHMgaW4gZmxhdCAzMmJpdCBtb2RlLCBJJ20g
bm90IHN1cmUgSSBzZWUgdGhlCj4gPiBwb2ludCBvZiB0aGlzIHJvdXRpbmUsIHNpbmNlIGl0IHNl
ZW1zIHRvIGJlIHVzZWQgZXhjbHVzaXZlbHkgdG8gc3dpdGNoCj4gPiBmcm9tIDE2IHRvIDMyYiBm
bGF0IG1vZGUuIFRoZSBjb21tZW50IG1lbnRpb25zIHNraXBwaW5nIHRoYXQgcGFydCwgYnV0Cj4g
PiBJJ20gbm90IHN1cmUgSSBzZWUgaG93IHRoYXQncyBhY2hpZXZlZC4KPiAKPiBJdHMgc29tZSBP
Vk1GIGxvY2FsIG1hZ2ljLsKgIFRoaXMgbWVhbnMgImptcAo+IGVuZF9vZl9UcmFuc2l0aW9uRnJv
bVJlYWwxNlRvMzJCaXRGbGF0Iiwgd2hpY2ggaXMgdGhlIGNvcnJlY3QgcGxhY2UgdG8KPiBnbywg
YnV0IHRoZSBjb2RlIHJlYWxseSBpcyBtaXNsZWFkaW5nIHRvIHJlYWQuCgpPaCByaWdodCwgaXQn
cyBPbmVUaW1lQ2FsbFJldC4gSSBndWVzcyB0aGlzIGlzIG9idmlvdXMgaWYgeW91IGFyZQpmYW1p
bGlhciB3aXRoIE9WTUYgY29kZSwgd2hpY2ggSSdtIG5vdC4gRXhwYW5kaW5nIHRoZSBjb21tZW50
IHRvCm1lbnRpb24gdGhhdCBqdW1waW5nIHRvIHRoZSBlbmQgb2YgdGhlIHJvdXRpbmUgaXMgYWNo
aWV2ZWQgYnkgdXNpbmcKT25lVGltZUNhbGxSZXQgd291bGQgaGF2ZSBoZWxwZWQgbWUsIGJ1dCB0
aGlzIG1pZ2h0IGJlIHRvbyB2ZXJib3NlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
