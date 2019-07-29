Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC47921E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 19:30:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs9Q3-000546-Ei; Mon, 29 Jul 2019 17:26:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs9Q1-000541-Et
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 17:26:41 +0000
X-Inumbo-ID: 04d57fba-b226-11e9-9155-2f4bca8c002f
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04d57fba-b226-11e9-9155-2f4bca8c002f;
 Mon, 29 Jul 2019 17:26:37 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: z4f0wRLC8uiLiEO1u2Vu1MXdZov0Tzrc2mFuL+anWpT1YBI7QZeDw2ZAPBlH0Zy6lFCoCbn46H
 /jPewcVn1leuGcau1Kxg+fnVoT7+X6DBZG1iBHOXFnkYlY1tzyf1ME9VtqfE4EPW6D4aeQZH5j
 b5bar7Q13taJ8jQL8Ek1b2PbBxDjvjXAByLeurwoxwp26BDr3FY2bLC9Rw+KOfueJUJ1j77ILP
 7dXfZVVImyTDIktysvNBRe6FYo2DAxITJIlqKO/RbBltQPaztJxICk9Eq0F27AnuSuIxUEUirR
 VpA=
X-SBRS: 2.7
X-MesageID: 3584623
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3584623"
To: Jan Beulich <JBeulich@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-2-andrew.cooper3@citrix.com>
 <d3179354-a1c3-6e67-8f4e-821878f80a14@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <05d466ab-1d28-a369-331e-350f09464f37@citrix.com>
Date: Mon, 29 Jul 2019 18:26:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d3179354-a1c3-6e67-8f4e-821878f80a14@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy()
 to online nodes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDcvMjAxOSAxNjo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMDcuMjAxOSAx
NDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9j
LmMKPj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4gQEAgLTgxMSwxMSArODExLDE4
IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfZnJlZV9idWRkeSh1bnNpZ25lZCBpbnQg
em9uZV9sbywKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGRvbWFpbiAqZCkKPj4gICB7Cj4+ICAgICAgIG5vZGVpZF90IGZpcnN0LCBub2Rl
ID0gTUVNRl9nZXRfbm9kZShtZW1mbGFncyksIHJlcV9ub2RlID0gbm9kZTsKPj4gLSAgICBub2Rl
bWFza190IG5vZGVtYXNrID0gZCA/IGQtPm5vZGVfYWZmaW5pdHkgOiBub2RlX29ubGluZV9tYXA7
Cj4+ICsgICAgbm9kZW1hc2tfdCBub2RlbWFzayA9IG5vZGVfb25saW5lX21hcDsKPj4gICAgICAg
dW5zaWduZWQgaW50IGosIHpvbmUsIG5vZGVtYXNrX3JldHJ5ID0gMDsKPj4gICAgICAgc3RydWN0
IHBhZ2VfaW5mbyAqcGc7Cj4+ICAgICAgIGJvb2wgdXNlX3Vuc2NydWJiZWQgPSAobWVtZmxhZ3Mg
JiBNRU1GX25vX3NjcnViKTsKPj4gICAKPj4gKyAgICAvKgo+PiArICAgICAqIGQtPm5vZGVfYWZm
aW5pdHkgaXMgb3VyIHByZWZlcnJlZCBhbGxvY2F0aW9uIHNldCBpZiBwcm92aWRlZCwgYnV0IGl0
Cj4+ICsgICAgICogbWF5IGhhdmUgYml0IHNldCBvdXRzaWRlIG9mIG5vZGVfb25saW5lX21hcC4g
IENsYW1wIGl0Lgo+IFdvdWxkIHlvdSBtaW5kIGFkZGluZyB0aGUgYXBwYXJlbnRseSBtaXNzaW5n
ICJzIiB0byAiYml0Ij8KCk9vcHMgeWVzLgoKPgo+PiArICAgICAqLwo+PiArICAgIGlmICggZCAp
Cj4+ICsgICAgICAgIG5vZGVzX2FuZChub2RlbWFzaywgbm9kZW1hc2ssIGQtPm5vZGVfYWZmaW5p
dHkpOwo+IERlc3BpdGUgbXkgZWFybGllciBhY2s6IENvZGUgZnVydGhlciBkb3duIGFzc3VtZXMg
YSBub24tZW1wdHkgbWFzaywKPiB3aGljaCBpcyBubyBsb25nZXIgZ3VhcmFudGVlZCBhZmFpY3Mu
CgpOb3RoaW5nIHByZXZpb3VzIGd1YXJhbnRlZWQgdGhhdCBkLT5ub2RlX2FmZmluaXR5IGhhZCBh
bnkgYml0cyBzZXQgaW4KaXQsIGVpdGhlci4KClRoYXQgc2FpZCwgaW4gcHJhY3RpY2UgaXQgaXMg
ZWl0aGVyIEFMTCwgb3Igc29tZXRoaW5nIGRlcml2ZWQgZnJvbSB0aGUKY3B1PT5ub2RlIG1hcHBp
bmdzLCBzbyBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBwcm9ibGVtIGluIHByYWN0aWNlLgoKPiBJ
IHRoaW5rIHlvdSB3YW50IHRvIGFwcGVuZCBhbgo+ICJpbnRlcnNlY3RzIiBjaGVjayBpbiB0aGUg
aWYoKS4KCkkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGFzc2VydCB0aGF0IGNhbGxlcnMg
ZG9uJ3QgZ2l2ZSB1cyBjb21wbGV0ZQpqdW5rLgoKPiBXaXRoIHRoYXQgZmVlbCBmcmVlIHRvIHBy
b21vdGUgbXkKPiBBLWIgdG8gUi1iLgoKSG93IGFib3V0OgoKwqDCoMKgIGlmICggZCApCsKgwqDC
oCB7CsKgwqDCoMKgwqDCoMKgIGlmICggbm9kZXNfaW50ZXJzZWN0KG5vZGVtYXNrLCBkLT5ub2Rl
X2FmZmluaXR5KSApCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9kZXNfYW5kKG5vZGVtYXNrLCBu
b2RlbWFzaywgZC0+bm9kZV9hZmZpbml0eSk7CsKgwqDCoMKgwqDCoMKgIGVsc2UKwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKwqDCoMKgIH0KCj8KClRoaXMgY2hh
bmdlIGhhcyBwYXNzZWQgbXkgbm9ybWFsIHNldCBvZiBwcmVwdXNoIGNoZWNrcyAobm90IG5vdCB0
aGF0CnRoZXJlIGlzIGFueXRoaW5nIGludGVyZXN0aW5nIE5VTUEtd2lzZSBpbiB0aGVyZSkuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
