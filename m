Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453C732E7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 17:38:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJIr-0005gI-S7; Wed, 24 Jul 2019 15:35:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UCFt=VV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqJIq-0005gD-1P
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 15:35:40 +0000
X-Inumbo-ID: afdb1f2d-ae28-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id afdb1f2d-ae28-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 15:35:38 +0000 (UTC)
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
IronPort-SDR: 9gY50784GWb4ruthtFXJkpN6/sgLMcOZ673XWSf+tvgEVkUp5tXAwmXIWpcvd6s5RygzKZcYOu
 IIxpq0BoSqhUTRs/QkPxAySAqrpvcuvTnkf0JKud+1xH2CNwN3wbVUHGvv3GSm98xTJof6xXMv
 9wteh9SB5ktT6DwiOWR0E+1GFyfzsW4S0woq2k6I+GCz9kjbS9GhOQIo1tlkzQN1WfPnJCRZmb
 FEd9TrPP1/y+znORE2iaylo5Psn+m0ekc7aFy7RHikwbQwpla3T63s+Oty+VU6ihdMwdbyDtrC
 nBQ=
X-SBRS: 2.7
X-MesageID: 3375116
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3375116"
Date: Wed, 24 Jul 2019 17:35:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190724153528.xgpzq6ta4vrxpitq@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <1f653322-5d4d-5393-5790-c63b07492050@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f653322-5d4d-5393-5790-c63b07492050@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: "Fredy P." <fredy.pulido@savoirfairelinux.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDI6NDc6MTlQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjQuMDcuMjAxOSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIEp1bCAyNCwgMjAxOSBhdCAxMDowMTo0MEFNIC0wNDAwLCBGcmVkeSBQLiB3cm90ZToK
PiA+PiBNeSBvYmplY3RpdmUgaXMgdG8gZ2V0IENQVSBmcmVxdWVuY3kgdGhyb3R0bGluZyBiYXNl
ZCBvbiB0aGUKPiA+PiB0ZW1wZXJhdHVyZSBpbiBhIFhlbi9PcGVuV1JUKGRvbTApIHN5c3RlbS4K
PiA+Pgo+ID4+IEFmdGVyIHRvIGV4cGVuZCBob3VycyByZWFkaW5nIFhlbidzIHdpa2ksIG1haWxp
bmcgbGlzdCBhcmNoaXZlcywKPiA+PiBjb21taXRzLCBnb29nbGluZyBhbmQgYXNraW5nIGluIHRo
ZSBJUkMgY2hhbm5lbCBJJ20gY29taW5nIGhlcmUgYXNraW5nCj4gPj4gZm9yIGhlbHAgYmVjYXVz
ZSBJIGhvcGUgdGhlcmUgaXMgc29tZXRoaW5nIEkgbWlzcyBhbmQgeW91IGNvdWxkIHBvaW50Cj4g
Pj4gaXQuCj4gPiAKPiA+IFRoYXQgc2VlbXMgbGlrZSBhbiBpbnRlcmVzdGluZyBwcm9qZWN0LCBJ
IGd1ZXNzIHlvdXIgZm9jdXMgaXMgc29tZQo+ID4ga2luZCBvZiBsb3ctcG93ZXIgZGV2aWNlPyAo
bm90IHRoYXQgaXQgbWF0dGVycyBtdWNoIGZvciB0aGUgY29udGV4dCBvZgo+ID4gdGhlIHF1ZXN0
aW9uKS4KPiA+IAo+ID4gQW55d2F5LCB0aGFua3MgZm9yIHlvdXIgaW50ZXJlc3Qgb24gWGVuIGFu
ZCB3YXlzIHRvIGltcHJvdmUgaXQhCj4gPiAKPiA+PiBNeSBmaXJzdCBxdWVzdGlvbiBpcywgdGhl
cmUgaXMgYW55IHdheSB0byBkbyBDUFUgZnJlcXVlbmN5IHRocm90dGxpbmcKPiA+PiBiYXNlZCBv
biB0aGUgdGVtcGVyYXR1cmU/Cj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBzdWNoIGdv
dmVybm9yIEFUTSBpbXBsZW1lbnRlZCBpbiBYZW4sIHRoZSBtb3JlCj4gPiB0aGF0IEkgdGhpbmsg
YWxsIGZyZXF1ZW5jeSB0aHJvdHRsaW5nIGlzIHN1cHBvc2VkIHRvIGJlIGRvbmUgYnkgZG9tMAo+
ID4gdXNpbmcgeGVucG0sIGJ1dCBub3QgWGVuIGl0c2VsZj8KPiAKPiBUaGUgb3JpZ2luYWwgYXV0
aG9ycyBvZiBQLSBhbmQgQy1zdGF0ZSBoYW5kbGluZyBsb29rIHRvIGhhdmUKPiBhc3N1bWVkIHRo
YXQgVC1zdGF0ZSBoYW5kbGluZyBzaG91bGQgd29yayBzaW1pbGFybHksIGkuZS4gYnkKPiBEb20w
IHVwbG9hZGluZyByZWxldmFudCBkYXRhLiBTZWUgcHVibGljL3BsYXRmb3JtLmggc3RhcnRpbmcg
YXQKPiAKPiAjZGVmaW5lIFhFTlBGX3NldF9wcm9jZXNzb3JfcG1pbmZvICAgICAgNTQKPiAKPiB3
aGVyZSBpbiBwYXJ0aWN1bGFyIHlvdSdsbCBmaW5kCj4gCj4gI2RlZmluZSBYRU5fUE1fVFggICAy
CgpPSywgSSBhc3N1bWVkIHRoZSBxdWVzdGlvbiB3YXMgYWJvdXQgcmVhZGluZyB0aGUgQ1BVIHRl
bXBlcmF0dXJlIGFuZAp0aGVuIGNoYW5naW5nIHRoZSBmcmVxdWVuY3kgb2YgdGhlIENQVSwgYnV0
IG5vdCByZWxhdGVkIHRvIFQtc3RhdGVzLgoKRldJVywgdGhlcmUncyBhbiBJbnRlbCBhcnRpY2xl
IGFib3V0IFQtc3RhdGVzIGZyb20gMjAxMzoKCmh0dHBzOi8vc29mdHdhcmUuaW50ZWwuY29tL2Vu
LXVzL2Jsb2dzLzIwMTMvMTAvMTUvYy1zdGF0ZXMtcC1zdGF0ZXMtd2hlcmUtdGhlLWhlY2stYXJl
LXRob3NlLXQtc3RhdGVzCgpUaGF0IGNsYWltcyBULXN0YXRlcyBhcmUgYmFzaWNhbGx5IGRlYWQs
IGFuZCBubyBtb2Rlcm4gcHJvY2Vzc29ycwpzdXBwb3J0IHRoZW0uCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
