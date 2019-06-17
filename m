Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35248975
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:57:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcutw-0008AM-1L; Mon, 17 Jun 2019 16:54:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SIu5=UQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hcutu-0008AH-VH
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:54:34 +0000
X-Inumbo-ID: 9363907c-9120-11e9-afe9-cb130d3053f6
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9363907c-9120-11e9-afe9-cb130d3053f6;
 Mon, 17 Jun 2019 16:54:31 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bZZzZ30BVWkwcFZ5YV36H6mQRPHY9MdduC4Rm2O5KpiWcMZQnFbBF4WtDPRgmLZT/uIeRRDNsU
 Ot+Xg+ovhPO3xuk8hjw73kUJjWlfBgkQJo9s1v43DGGryy5U1cpfiMdZnctekVUJ+CqaA82Nl1
 WNAHwwuVUWnBNewMLC015fHra6cHpUxOfsTINKzK3RoS+GiOVNgCJ7M4u2QoU/f5YrsUfjk02y
 MvnM7oggzVDpNFXpGCMQbLyNrT2CxU8N21BIiYsl1/ejzphme5dkFuJ5YVSdxby3qVAyB7XL+o
 K70=
X-SBRS: 2.7
X-MesageID: 1843317
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1843317"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 3/4] xen: Import Xen public headers used by xen-hvm.c
Thread-Index: AQHVJSMVksnbyKoRC0SnNZiHFchLQ6agBEVg///oIwCAACLv8A==
Date: Mon, 17 Jun 2019 16:54:27 +0000
Message-ID: <8d3b855aab3d46f0ae02763f3fcc4f9c@AMSPEX02CL03.citrite.net>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-4-anthony.perard@citrix.com>
 <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
 <20190617164544.GA13449@perard.uk.xensource.com>
In-Reply-To: <20190617164544.GA13449@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/4] xen: Import Xen public headers used by
 xen-hvm.c
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxNyBKdW5lIDIwMTkgMTc6NDYK
PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogcWVtdS1k
ZXZlbEBub25nbnUub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDMvNF0geGVuOiBJbXBvcnQgWGVuIHB1YmxpYyBoZWFkZXJzIHVzZWQgYnkgeGVuLWh2bS5jCj4g
Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDU6MTU6NTFQTSArMDEwMCwgUGF1bCBEdXJyYW50
IHdyb3RlOgo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBBbnRo
b255IFBFUkFSRCBbbWFpbHRvOmFudGhvbnkucGVyYXJkQGNpdHJpeC5jb21dCj4gPiA+IFNlbnQ6
IDE3IEp1bmUgMjAxOSAxNjo0MQo+ID4gPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnCj4gPiA+
IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFudGhvbnkgUGVyYXJkIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pCj4gPiA+IDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4K
PiA+ID4gU3ViamVjdDogW1BBVENIIDMvNF0geGVuOiBJbXBvcnQgWGVuIHB1YmxpYyBoZWFkZXJz
IHVzZWQgYnkgeGVuLWh2bS5jCj4gPiA+Cj4gPiA+IEZvbGxvd2luZyAieGVuOiBGaXggYnVpbGQg
d2l0aCBwdWJsaWMgaGVhZGVycyIsIGltcG9ydCBvdGhlciBYZW4KPiA+ID4gcHVibGljIGhlYWRl
cnMgdGhhdCBhcmUgZGVzY3JpYmluZyBpbnRlcmZhY2VzLgo+ID4gPgo+ID4gPiBUaGUgaGVhZGVy
cyBhcmUgY2xlYW5lZCB1cCBhIGJpdCB3aGlsZSBpbXBvcnRpbmcgdGhlbS4gVGhlIGhlYWRlcgo+
ID4gPiBndWFyZCBzeW1ib2xzIGFyZSBjaGFuZ2VkIHRvIG1hdGNoIFFFTVUncyBjb2Rpbmcgc3R5
bGUsIHNvbWUgb3RoZXIKPiA+ID4gcGFydCBvZiB0aGUgZmlsZXMgdGhhdCBRRU1VIGRvZXNuJ3Qg
dXNlIGFyZSByZW1vdmVkLgo+ID4gPgo+ID4gPiB4ZW4tbWFwY2FjaGUuYyBkb2Vzbid0IG5lZWRz
IHBhcmFtcy5oLCBzbyByZW1vdmUgdGhlIGluY2x1ZGUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+ID4gPiAtLS0K
PiA+ID4gIGh3L2kzODYveGVuL3hlbi1odm0uYyAgICAgICAgICAgICAgICAgfCAgIDYgKy0KPiA+
ID4gIGh3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jICAgICAgICAgICAgfCAgIDIgLQo+ID4gPiAg
aW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2h2bS9lODIwLmggICB8ICAyOCArKysrKysrCj4gPiA+
ICBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2lvcmVxLmggIHwgMTAxICsrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL3BhcmFt
cy5oIHwgIDMzICsrKysrKysrKwo+ID4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNjUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3
L3hlbi9pbnRlcmZhY2UvaHZtL2U4MjAuaAo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvaHcveGVuL2ludGVyZmFjZS9odm0vaW9yZXEuaAo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9odm0vcGFyYW1zLmgKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL2h3L2kzODYveGVuL3hlbi1odm0uYyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwo+ID4g
PiBpbmRleCAyOTM5MTIyZTdjLi43MjVmOWMyMjc4IDEwMDY0NAo+ID4gPiAtLS0gYS9ody9pMzg2
L3hlbi94ZW4taHZtLmMKPiA+ID4gKysrIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCj4gPiA+IEBA
IC0yNiw5ICsyNiw5IEBACj4gPiA+ICAjaW5jbHVkZSAidHJhY2UuaCIKPiA+ID4gICNpbmNsdWRl
ICJleGVjL2FkZHJlc3Mtc3BhY2VzLmgiCj4gPiA+Cj4gPiA+IC0jaW5jbHVkZSA8eGVuL2h2bS9p
b3JlcS5oPgo+ID4gPiAtI2luY2x1ZGUgPHhlbi9odm0vcGFyYW1zLmg+Cj4gPiA+IC0jaW5jbHVk
ZSA8eGVuL2h2bS9lODIwLmg+Cj4gPiA+ICsjaW5jbHVkZSAiaHcveGVuL2ludGVyZmFjZS9odm0v
aW9yZXEuaCIKPiA+ID4gKyNpbmNsdWRlICJody94ZW4vaW50ZXJmYWNlL2h2bS9wYXJhbXMuaCIK
PiA+Cj4gPiBBRkFJQ1QgdGhlIG9ubHkgcGxhY2UgKGFwYXJ0IGZyb20gbGVnYWN5IGNvZGUgaW4g
eGVuX2NvbW1vbi5oKSB0aGF0Cj4gPiBwYXJhbXMuaCBpcyBuZWNlc3NhcnkgaXMgaW4geGVuX3N1
c3BlbmRfbm90aWZpZXIoKS4gSSB3b25kZXIgd2hldGhlcgo+ID4gdGhhdCB3b3VsZCBiZSBiZXR0
ZXIgbW92ZWQgaW50byB4ZW5fY29tbW9uLmggdG9vIChzaW5jZSBpdCdzIGp1c3QgYQo+ID4gd3Jh
cHBlciByb3VuZCB4Y19zZXRfaHZtX3BhcmFtKCkgYW5kIHRoZW4gdGhlIGluY2x1c2lvbiBvZiBw
YXJhbXMuaAo+ID4gY2FuIGJlIG1vdmVkIHRoZXJlIGFzIHdlbGwuCj4gCj4gOigsIEkgZGlkbid0
IHJlYWxpc2VkIHRoYXQgeGVuX2NvbW1vbi5oIG5lZWRlZCBwYXJhbXMuaCB0b28uIFRoYXQgcGF0
Y2gKPiBzZXJpZXMgbWlnaHQgbm90IGJ1aWxkIG9uIG9sZGVyIHZlcnNpb24gb2YgWGVuLiBJJ2xs
IG1vdmUgdGhlIGluY2x1c2lvbgo+IG9mIHBhcmFtcy5oIHRvIHhlbl9jb21tb24uaCwgYW5kIGZp
eCBwYXJhbXMuaCB0byBoYXZlIGFsbCB0aGUgbmVlZGVkCj4gI2RlZmluZXMuCj4gCj4gQWJvdXQg
eGVuX3N1c3BlbmRfbm90aWZpZXIoKSwgaXQncyBhY3R1YWxseSBtb3JlIHRoYW4gYSB3cmFwcGVy
LCBpdCdzCj4gYWxzbyBhIGZ1bmN0aW9uLiBBIHBvaW50ZXIgdG8gdGhlIGZ1bmN0aW9uIGlzIGdp
dmVuIHRvIGEgbm90aWZpZXIuCj4gU28gSSBkb24ndCB0aGluayB1c2luZyAiaW5saW5lIiB3aWxs
IHdvcmssIGFuZCBJIGRvbid0IHRoaW5rIGl0IG1ha2VzCj4gc2Vuc2UgdG8gaGF2ZSBhIGZ1bmN0
aW9uIHdpdGhvdXQgImlubGluZSIgaW4geGVuX2NvbW1vbi5oLiBTbyBJIHRoaW5rCj4geGVuX3tz
dXNwZW5kLHdha2V1cH1fbm90aWZpZXIgYXJlIGZpbmUgd2hlcmUgdGhlcmUgYXJlLCBkbyB5b3Ug
YWdyZWU/CgpPaCwgSSBoYWRuJ3QgcmVhbGl6ZWQgdGhleSB3ZXJlIGNhbGxiYWNrcy4gSW4gdGhh
dCBjYXNlLCBsZWF2ZSB0aGUgZnVuY3Rpb25zIHdoZXJlIHRoZXkgYXJlLiBXZSByZWFsbHkgb3Vn
aHQgdG8gaGF2ZSBhIHN0YWJsZSBBUEkgcmF0aGVyIHRoYW4gYSBwYXJhbXMgaW50ZXJmYWNlLi4u
IE5vdCBzb21ldGhpbmcgeW91IGNhbiBhZGRyZXNzIGhlcmUgdGhvdWdoLgoKICBDaGVlcnMsCgog
ICAgUGF1bAoKPiAKPiBUaGFua3MsCj4gCj4gLS0KPiBBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
