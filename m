Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0B7FB30
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:39:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXjC-0001ci-1i; Fri, 02 Aug 2019 13:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q7GY=V6=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1htXjA-0001cd-Rj
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:36:12 +0000
X-Inumbo-ID: 7c8d50da-b52a-11e9-9581-af4f99e629b2
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c8d50da-b52a-11e9-9581-af4f99e629b2;
 Fri, 02 Aug 2019 13:36:10 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FEwseopK2xpYQajX7vizkzFKn3oiH1KXQMrfOykMTv+gXtBpALTr4DPUi6NbRadHDP0WT84koR
 heZlTXdP9tl6epmsFzjVufO6Vu84ZsiJZld7CwMws09Ww8ARaW0Yf7ez80+XSmmLEblIcnKUrJ
 N2G0bYROPEvZ+Gt55jiwNJuDcPdFZKnjXkd2CmROAB4DdxHDPoMvV7iUoQSq2XX0MkpM06U83F
 R9o+jNYOdDFnLQ3BFaGLgqjtf/ArxrunP/CRo+49dlsdGAbkkmYzsIVpkX6I5cghxrY5OMDUCO
 zqY=
X-SBRS: 2.7
X-MesageID: 3789024
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3789024"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Thread-Topic: [RFC] Re-working the patch submission guide
Thread-Index: AQHVSSOEZYGRU/jgzkCxBUMn3iC9Oqbn0AoA///hJwCAAABwAIAAGcwA
Date: Fri, 2 Aug 2019 13:36:06 +0000
Message-ID: <49846645-1D5F-463D-B699-05A9E242885C@citrix.com>
References: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
 <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
 <b72cded3-5cdd-38db-b607-fbf98614ead5@arm.com>
 <a4b8c295-64aa-c4a1-acf0-8126c3094495@arm.com>
In-Reply-To: <a4b8c295-64aa-c4a1-acf0-8126c3094495@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <BE626F3B84B23245BBAE140001820D4E@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] Re-working the patch submission guide
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDAyLzA4LzIwMTksIDE0OjAzLCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOg0KDQogICAgDQogICAgDQogICAgT24gMDIvMDgvMjAxOSAxNDowMiwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgID4gSGkgSmFuLA0KICAgID4gDQogICAgPiBPbiAwMi8w
OC8yMDE5IDEzOjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCiAgICA+PiBPbiAwMi4wOC4yMDE5IDEz
OjE0LCBMYXJzIEt1cnRoIHdyb3RlOg0KICAgID4+Pj4gMS41LjQgU2VuZGluZyBQYXRjaGVzIE1h
bnVhbGx5DQogICAgPj4+IFRoaXMgc2hvdWxkIGJlIHJlbW92ZWQgb3Igc3RhdGUgTk9UIFRPIERP
IHRoaXMNCiAgICA+Pg0KICAgID4+IFBsZWFzZSBkb24ndC4gSSdtIG5vdCBtZWFuaW5nIHRvIHN0
YXJ0IHVzaW5nIGdpdCBmb3IgcGF0Y2ggc3VibWlzc2lvbg0KICAgID4+IGFueSB0aW1lIHNvb24g
KGlmIGV2ZXIpLCBhbmQgSSBkb24ndCBzZWUgd2h5IHRoaXMgc2hvdWxkIGJlIGENCiAgICA+PiBy
ZXF1aXJlbWVudC4NCiAgICA+IFdlbGwsIHNvbWVvbmUgdXNpbmcgdGhpcyBpcyBsaWtlbHkgdG8g
bWVzcyBpdCB1cC4gU28gSSBhZ3JlZSB3aXRoIExhcnMgYW5kIHRoaXMgDQogICAgPiBzaG91bGQg
YXQgbGVhc3QgZGlzYWdyZWUgYW5kIGRpc2NvdXJhZ2UgdG8gdXNlIGl0Lg0KICAgIA0KICAgIHMv
ZGlzYWdyZWUvYmUgcmVtb3ZlZC8NCiAgICANCk9LLiBUaGF0IHNlZW1zIHRvIGJlIGFncmVlZC4g
VGhlIGludGVudGlvbiBvZiByZW1vdmluZyBpdCBpcyB0byBlbmNvdXJhZ2UgbmV3Y29tZXJzIHRv
IHVzZSB0aGUgdG9vbHMgd2UgaGF2ZSBhbmQgd2hpY2ggd2Uga25vdyB3b3JrLg0KDQpBbnkgb3Ro
ZXIgZ2VuZXJhbCBmZWVkYmFjayBvbiBob3cgSSBhbSBwbGFubmluZyB0byBhcHByb2FjaCB0aGlz
Pw0KDQpJbiBlc3NlbmNlLCB3ZSB3aWxsIGVuZCB1cCB3aXRoIA0KKiBXaGF0J3MgaW4gYSBwYXRj
aCBzZXJpZXMvcGF0Y2ggIC0gdGVybWlub2xvZ3kgYW5kIG91ciBleHBlY3RhdGlvbnMNCiAgIC0g
UG9zc2libHkgd2l0aCBhIGxpbmsgdG8gc29tZSBiZXN0IHByYWN0aWNlcyBhbmQgdG9vbHMgZm9y
IHBsYW5uaW5nIGZvciBtdWx0aXBsZSB2ZXJzaW9ucyAoYnV0IHNob3VsZCBub3QgYmUgcGFydCBv
ZiB0aGUgZG9jIGl0c2VsZikNCiAgIC0gTG9uZ2VyIHRlcm0gaXQgd291bGQgYmUgbmljZSB0byBn
ZXQgdG8gc29tZXRoaW5nIGxpa2U6IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQu
MTcvcHJvY2Vzcy9kZXZlbG9wbWVudC1wcm9jZXNzLmh0bWwgLSBUQkggSSBkb24ndCBsaWtlIHRo
ZSBkb2Mgb3RzZWxmIHZlcnkgbXVjaCwgYnV0IGl0IGhhcyBzb21lIGdvb2QgdG9waWNzIGluIGl0
IHdoaWNoIHdlIHNob3VsZCBjb3Zlcg0KKiBUaGUgdG9vbGluZyBtZWNoYW5pY3MgZm9yIGEgc2lu
Z2xlIHBhdGNoOiBzZXQtdXAgYW5kIHN0ZXBzIHVzaW5nIGdldF9tYWludGFpbmVycy5wbCANCiog
Rm9sbG93LXVwOiBtdWx0aXBsZSB2ZXJzaW9ucywgY2hlY2tpbmcgd2hlbiBzdHVmZiBoYXMgZ29u
ZSBpbiwgLi4uIA0KKiBTcGVjaWZpY3MgZm9yIFFFTVUsIC4uLg0KDQpMYXJzIA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
