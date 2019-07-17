Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A946BA58
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 12:36:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnhFI-0000mF-T8; Wed, 17 Jul 2019 10:33:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CPjG=VO=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hnhFH-0000mA-9i
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 10:33:11 +0000
X-Inumbo-ID: 44a6d35c-a87e-11e9-a53c-8b4c8d8da84d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44a6d35c-a87e-11e9-a53c-8b4c8d8da84d;
 Wed, 17 Jul 2019 10:33:08 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GtAITv75Al93pdOATJAvC/Xg8OlnmBkEAhDKG7KgKdaogTmWaJsgTdalUV7Bv4PRgsZXRrQPU9
 wqf42teHJDE+WNvGbwe1qyzk7wHBfBxXyO6lin9m3zrZPRwJsWY1FlcfOBi1ed7BoHnMvzMV59
 Vlz+avp6L0F0I4I1h/ZzCheeBz+cNzj6poYnBR2dvNea2T+8M18dO6tQzqXsjr4n/eCFM+lSF/
 hIhD7azrZxZiQYZuN+TE0+F2OKK4Z3kjxELkn4718nnHmicmFYgcQfR1PR5z4OXMOYxM5e0OdO
 f4M=
X-SBRS: 2.7
X-MesageID: 3101587
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,274,1559534400"; 
   d="scan'208";a="3101587"
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [Xen-devel] Design session report: Xen on Distros
Thread-Index: AQHVOxcuh3hssQEwIECr3S0fCoZQO6bLmgAAgAAWKoD///HygIAAMmeAgAHYRQCAANGKAA==
Date: Wed, 17 Jul 2019 10:33:05 +0000
Message-ID: <A91E670B-D372-4560-B32D-9A5142957907@citrix.com>
References: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
 <86244630-aeb9-07a3-95f9-53d998b768ea@suse.com>
 <6dd744df-dcd8-552b-c8e4-a0d05abc7eeb@citrix.com>
 <35d77bc2-8d17-8686-c08e-211973ce49e5@suse.com>
 <76439de5430365dda0b83694444e59fa9cfdd3d0.camel@infradead.org>
 <21c9d3d4-831b-d8cd-5d81-3ce18b9f907e@citrix.com>
In-Reply-To: <21c9d3d4-831b-d8cd-5d81-3ce18b9f907e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <0D21C0FAA6C2AE41A33772DBB721FFF2@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Design session report: Xen on Distros
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Amit Shah <amit@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIEp1bCAxNiwgMjAxOSwgYXQgMTE6MDMgUE0sIEFuZHJldyBDb29wZXIgDQo+IA0KPiBX
ZSBjb3VsZCB0cml2aWFsbHkgdGhyb3cgdGhlIGZpeGVzIGludG8gdGhlIGJyYW5jaCwgdGFnIGl0
LCBzaWduIGl0IGFuZA0KPiB0aHJvdyBpdCBvdXQgaW50byB0aGUgb3BlbiwgYnV0IGRvaW5nIHRo
YXQgb24gdGhlIGVtYmFyZ28gZGF0ZSBpdHNlbGYNCj4gd291bGQgcmVzdWx0IGluIGFuIG9mZmlj
aWFsIHJlbGVhc2Ugb2YgWGVuIHdoaWNoIGhhcyBoYWQgMCB0ZXN0aW5nIGluDQo+IHRoZSBpbmN1
bWJlbnQgdGVzdCBzeXN0ZW0uDQoNClRoZSBwb2ludCBpcyB0aGF0IGFueW9uZSB3aG8gc2hpcHMg
LyBkZXBsb3lzIGEgZml4IG9uIHRoZSBkaXNjbG9zdXJlIGRhdGUgaXMgcHJldHR5IG11Y2ggc2hp
cHBpbmcgZXhhY3RseSB0aGF0LiAgSWYgaXTigJlzIG5vdCBnb29kIGVub3VnaCB0byBzaWduLCB3
aHkgaXMgaXQgZ29vZCBlbm91Z2ggdG8gZGVwbG95Pw0KDQpQcm9iYWJseSB0aGUgYmVzdCBhbnN3
ZXIgaXMgdGhhdCBpdOKAmXMgX25vdF8gcmVhbGx5IGdvb2QgZW5vdWdoIHRvIGRlcGxveTsgYW5k
IHNvIGl04oCZcyB3b3J0aCB0aGlua2luZyBhYm91dCBob3cgd2UgY2FuIGltcHJvdmUgdGhhdCwg
cGVyaGFwcyBieSBoYXZpbmcgZW1iYXJnb2VkIG9zc3Rlc3QgcnVucyBvciBzb21ldGhpbmcuDQoN
Cj4gV2hhdCBhIG51bWJlciBvZiBwZW9wbGUgd2FudCBpcyBmb3IgdGhlIHBhdGNoZXMgaW4gYW4g
WFNBIGFkdmlzb3J5IHRvDQo+IGFwcGx5IGNsZWFubHkgdG8gd2hhdGV2ZXIgcmFuZG9tIHRoaW5n
IHRoZXkgaGF2ZSBpbiB0aGVpciBsb2NhbC9kaXN0cm8NCj4gcGF0Y2ggcXVldWUuICBUaGlzIGlz
IGVudGlyZWx5IGltcG9zc2libGUgZm9yIHRoZSBzZWN1cml0eSB0byBhcnJhbmdlLA0KPiBhbmQg
ZnVydGhlcm1vcmUsIHdlIGhhdmUgZXhhY3RseSBvbmUgbG9jYXRpb24gd2hlcmUgdGhlIHBhdGNo
ZXMgd2UNCj4gcHJvZHVjZSB3aWxsIGJlIGNvbW1pdHRlZC4NCg0KSeKAmW0gbm90IHN1cmUgcGVv
cGxlIHdhbnQgdG8gYXBwbHkg4oCcd2hlcmV2ZXLigJ07IGl04oCZcyBtb3JlIHRoYXQgdGhlcmUg
d2FzbuKAmXQgYSBjbGVhciBwbGFjZSB0aGF0IHRoZXkgKmNvdWxkKiBhcHBseS4gIFdpdGhvdXQg
YW55IHByaW9yIGtub3dsZWRnZSwgSSB0aGluayB0aGUgbW9zdCBuYXR1cmFsIGV4cGVjdGF0aW9u
IHdvdWxkIGJlIHRoYXQgeW91IGNvdWxkIHRha2UgdGhlIG1vc3QgcmVjZW50IHBvaW50IHJlbGVh
c2UgYW5kIGp1c3Qgc3RhY2sgb24gYWxsIHRoZSBvdXRzdGFuZGluZyBYU0FzIHNpbmNlIHRoZW4u
ICBUaGVyZSBhcmUgcmVhc29ucyB3aHkgd2UgZG9u4oCZdCBkbyB0aGF0LCBidXQgSSB3b3VsZG7i
gJl0IGV4cGVjdCB1c2VycyB0byBndWVzcyB0aGF0Lg0KDQpUaGlzIGlzIHRoZSBzb3J0IG9mIGFy
ZWEgd2hlcmUgbWF5YmUgYSBkb2N1bWVudCBpbiB5b3VyIHNwaGlueCBzeXN0ZW0gd291bGQgYmUg
aGVscGZ1bCwganVzdCB0byBsYXkgb3V0IHRoZSBpc3N1ZXMuDQoNCj4gQXMgYSBwZXJzb25hbCB2
aWV3IGhlcmUsIEkgZG9uJ3QgdGhpbmsgYmxpbmRseSB0YWtpbmcgdGhlIGxhdGVzdA0KPiBzdGFn
aW5nLSRYLiRZIGlzIGEgdmlhYmxlIHN1YnN0aXR1dGUgZm9yIGF0IGxlYXN0IHVuZGVyc3RhbmRp
bmcgdGhlDQo+IHBhdGNoZXMgd2VsbCBlbm91Z2ggdG8gd29yayBhcm91bmQgdHJpdmlhbCBvZmZz
ZXRzL2Z1enogZHVlIHRvIG1pbm9yDQo+IHZhcmlhdGlvbnMuDQoNCkkgdGhpbmsgdGhpcyBpcyBm
aW5lIGZvciBkb3duc3RyZWFtcyB0aGF0IGhhdmUgZnVsbC1mbGVkZ2VkIGh5cGVydmlzb3IgZGV2
ZWxvcG1lbnQgdGVhbXMgKGxpa2UgWGVuU2VydmVyIG9yIEFtYXpvbiksIGJ1dCBpcyBhIGJpdCB0
b28gaGlnaCBhIGJhcnJpZXIgZm9yICJtb20tYW5kLXBvcCIgY2xvdWQgcHJvdmlkZXJzIG9yIGNv
bW11bml0eS1tYWludGFpbmVkIGRpc3RyaWJ1dGlvbnMuDQoNCiAtR2VvcmdlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
