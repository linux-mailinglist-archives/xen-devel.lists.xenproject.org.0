Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346646CC1A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:43:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2u4-0007fr-WF; Thu, 18 Jul 2019 09:40:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MdgZ=VP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ho2u3-0007fm-LD
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:40:43 +0000
X-Inumbo-ID: 1a1c6f08-a940-11e9-b5de-dbb05f64fea0
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a1c6f08-a940-11e9-b5de-dbb05f64fea0;
 Thu, 18 Jul 2019 09:40:39 +0000 (UTC)
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
IronPort-SDR: cmySG5DJI0HhUY8iUxHU9Ucn4in7fNfNCI/B2Y//tEdKTptjWulyFRguQruuwheRbCM8FhvDj3
 Hi0yrzswgGmOX8WOkoLj8u44pmQJSq78JgG6r8+owv1l+AYExIlUsTlL8OriK6jjixkZcz0z8J
 zux91WlpODNRusFncI5UbyHZu4x+onwx9wUny8CZpJRRWBJnS5U18/XSn/qwpHxRMcpDccKwA0
 oHi8pnVQ0ohe6QNVljQLFERhMqgLTR/F94uvzaYxlojzzRzVbZNvVSnmtJ28NEWHzMnHmEOqc+
 kRo=
X-SBRS: 2.7
X-MesageID: 3220414
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,276,1559534400"; 
   d="scan'208";a="3220414"
Date: Thu, 18 Jul 2019 11:40:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190718094027.tlqycz7vsxx4exxf@Air-de-Roger.citrite.net>
References: <1563217075.6815.14.camel@amazon.com>
 <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
 <35baad47-f22c-2378-a7a5-f0c48c3eafb8@suse.com>
 <aca2e606-17fa-6266-1e9c-1989d4da6217@prgmr.com>
 <9d6fc9d6-f63a-ae65-bbfa-5e489fda9acf@citrix.com>
 <5274084e-ea01-8c61-5ca5-75bbe7ea987a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5274084e-ea01-8c61-5ca5-75bbe7ea987a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Foerster,
 Leonard" <foersleo@amazon.com>, Sarah Newman <srn@prgmr.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTE6MDA6MjNBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxNy4wNy4xOSAwMDoyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+IE9uIDE2
LzA3LzIwMTkgMDU6MjAsIFNhcmFoIE5ld21hbiB3cm90ZToKPiA+ID4gT24gNy8xNS8xOSA4OjQ4
IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ID4gPiA+IE9uIDE1LjA3LjE5IDIxOjMxLCBTYXJh
aCBOZXdtYW4gd3JvdGU6Cj4gPiA+ID4gPiBPbiA3LzE1LzE5IDExOjU3IEFNLCBGb2Vyc3Rlciwg
TGVvbmFyZCB3cm90ZToKPiA+ID4gPiA+IC4uLgo+ID4gPiA+ID4gPiBBIGtleSBjb3JuZXJzdG9u
ZSBmb3IgTGl2ZS11cGRhdGUgaXMgZ3Vlc3QgdHJhbnNwYXJlbnQgbGl2ZSBtaWdyYXRpb24KPiA+
ID4gPiA+IC4uLgo+ID4gPiA+ID4gPiAgwqDCoMKgwqAtPiBmb3IgbGl2ZSBtaWdyYXRpb246IGRv
bWlkIGlzIGEgcHJvYmxlbSBpbiB0aGlzIGNhc2UKPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqDCoMKg
IC0+IHJhbmRvbWl6ZSBhbmQgcHJheSBkb2VzIG5vdCB3b3JrIG9uIHNtYWxsZXIgZmxlZXRzCj4g
PiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoCAtPiB0aGlzIGlzIG5vdCBhIHByb2JsZW0gZm9yIGxp
dmUtdXBkYXRlCj4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoCAtPiBCVVQ6IGFzIGEgY29tbXVu
aXR5IHdlIHNob3VkbCBtYWtlIHRoaXMgcmVzdHJpY3Rpb24gZ28gYXdheQo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBBbmRyZXcgQ29vcGVyIHBvaW50ZWQgb3V0IHRvIG1lIHRoYXQgbWFudWFsbHkgYXNz
aWduaW5nIGRvbWFpbiBJRHMKPiA+ID4gPiA+IGlzIHN1cHBvcnRlZCBpbiBtdWNoIG9mIHRoZSBj
b2RlIGFscmVhZHkuIElmIGd1ZXN0IHRyYW5zcGFyZW50IGxpdmUKPiA+ID4gPiA+IG1pZ3JhdGlv
biBnZXRzIG1lcmdlZCwgd2UnbGwgbG9vayBhdCBwYXNzaW5nIGluIGEgZG9tYWluIElEIHRvIHhs
LAo+ID4gPiA+ID4gd2hpY2ggd291bGQgYmUgZ29vZCBlbm91Z2ggZm9yIHVzLiBJIGRvbid0IGtu
b3cgYWJvdXQgdGhlIG90aGVyCj4gPiA+ID4gPiB0b29sc3RhY2tzLgo+ID4gPiA+IAo+ID4gPiA+
IFRoZSBtYWluIHByb2JsZW0gaXMgdGhlIGNhc2Ugd2hlcmUgb24gdGhlIHRhcmdldCBob3N0IHRo
ZSBkb21pZCBvZiB0aGUKPiA+ID4gPiBtaWdyYXRlZCBkb21haW4gaXMgYWxyZWFkeSBpbiB1c2Ug
YnkgYW5vdGhlciBkb21haW4uIFNvIHlvdSBlaXRoZXIgbmVlZAo+ID4gPiA+IGEgZG9taWQgYWxs
b2NhdG9yIHNwYW5uaW5nIGFsbCBob3N0cyBvciB0aGUgY2hhbmdlIG9mIGRvbWlkIGR1cmluZwo+
ID4gPiA+IG1pZ3JhdGlvbiBtdXN0IGJlIGhpZGRlbiBmcm9tIHRoZSBndWVzdCBmb3IgZ3Vlc3Qg
dHJhbnNwYXJlbnQgbWlncmF0aW9uLgo+ID4gPiAKPiA+ID4gWWVzLiBUaGVyZSBhcmUgc29tZSBj
bHVzdGVyIG1hbmFnZW1lbnQgc3lzdGVtcyB3aGljaCB1c2UgeGwgcmF0aGVyCj4gPiA+IHRoYW4g
eGFwaS4KPiA+ID4gVGhleSBjb3VsZCBiZSBleHRlbmRlZCB0byBtYW5hZ2UgZG9tYWluIElEcyBp
ZiBpdCdzIHRvbyBkaWZmaWN1bHQgdG8KPiA+ID4gYWxsb3cKPiA+ID4gdGhlIGRvbWFpbiBJRCB0
byBjaGFuZ2UgZHVyaW5nIG1pZ3JhdGlvbi4KPiA+IAo+ID4gRm9yIGEgdjEgZmVhdHVyZSwgaGF2
aW5nIGEgcmVzdHJpY3Rpb24gb2YgInlvdSBtdXN0IG1hbmFnZSBkb21pZHMgYWNyb3NzCj4gPiB0
aGUgY2x1c3RlciIgaXMgYSBmaW5lLsKgIEd1ZXN0LXRyYW5zcGFyZW50IG1pZ3JhdGlvbiBpcyBh
IHZlcnkgaW1wb3J0YW50Cj4gPiBmZWF0dXJlLCBhbmQgb25lIHdoZXJlIHdlIGFyZSBsYWNraW5n
IGluIHJlbGF0aW9uIHRvIG90aGVyIGh5cGVydmlzb3JzLgo+ID4gCj4gPiBMb25nZXIgdGVybSwg
d2UgYXMgdGhlIFhlbiBjb21tdW5pdHkgbmVlZCB0byBmaWd1cmUgb3V0IGEgd2F5IHRvIHJlbW92
ZQo+ID4gdGhlIGRlcGVuZGVuY3kgb24gZG9taWRzLCBhdCB3aGljaCBwb2ludCB0aGUgY2x1c3Rl
ci13aWRlIG1hbmFnZW1lbnQKPiA+IHJlc3RyaWN0aW9uIGNhbiBiZSBkcm9wcGVkLsKgIFRoaXMg
aXNuJ3QgZ29pbmcgdG8gYmUgYSB0cml2aWFsIHRhc2ssIGJ1dAo+ID4gaXQgd2lsbCBiZSBhIHdv
cnRod2hpbGUgb25lLgo+IAo+IEFub3RoZXIgcHJvYmxlbSBhcmUgWGVuc3RvcmUgd2F0Y2hlcy4g
V2l0aCBndWVzdCB0cmFuc3BhcmVudCBMTSB0aGV5IGFyZQo+IGxvc3QgdG9kYXkgYXMgdGhlcmUg
aXMgY3VycmVudGx5IG5vIHdheSB0byBtaWdyYXRlIHRoZW0gdG8gdGhlIHRhcmdldAo+IFhlbnN0
b3JlLgoKSG0sIEkgZ3Vlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgeGVuc3RvcmVkIHJ1
bm5pbmcgZWl0aGVyIGluCmRvbTAgb3IgaW4gYSBzdHViZG9tYWluIHNob3VsZCBiZSBjb21wbGV0
ZWx5IHVuYXdhcmUgb2YgdGhlIGh5cGVydmlzb3IKYmVpbmcgdXBkYXRlZCB1bmRlciBpdCdzIGZl
ZXQuIFRoZSBoeXBlcnZpc29yIGl0c2VsZiBkb24ndCBoYXZlIGFueQprbm93bGVkZ2UgaXRzZWxm
IG9mIHhlbnN0b3JlIHN0YXRlLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
