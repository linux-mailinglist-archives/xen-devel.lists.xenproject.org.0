Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BCFCE12D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 14:05:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHRhq-0007yw-I0; Mon, 07 Oct 2019 12:01:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J9qX=YA=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iHRho-0007yq-QM
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 12:01:36 +0000
X-Inumbo-ID: 35d5786c-e8fa-11e9-9bee-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35d5786c-e8fa-11e9-9bee-bc764e2007e4;
 Mon, 07 Oct 2019 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570449695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IyH1BTn6K3NsmrEJEqK6xE2Eu7WMZCbl/Oh841QVq9w=;
 b=M2IqRpFX4QRAe2h6ruySoKv8JO3KvrCtEAWEAJUMTauqCGpppBL6IIii
 XMbtX+wN8R4hCSvWrHt4296z+fWpPINzzFvAVsI4+8EKd7LYvSECYfWje
 PIyPAa7bpQQGoI1od60DEbI1GCzg+tsmpih8B24CgsuKcvla+8gcyUB6B 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KYD/qZrjSGokO3yKdhodDKRNo7Xy35IjMtmo2F/z8jugfN8tB2uru5HbaIw02auW0d1gJ8lLTw
 x/HGxeTKufsY8qV+X+jkBICEDUq+qJtG7R/fKFbWBYt9IYCL243XGGBk7lMelFKYpNtypTjhVL
 HBFFjN+h8XHU5hZgmCUYgpdT9BWUE/KYB4NytTkMrT6LRPXYILM8YJy88fQe+2aqf6rBoTxZFs
 vEMA+wk0503f65qeAjc7CBDcgg+/XXgpc3pthvOQRRO/OdP9kEj9vNEYYTDZPwO3pqpXZBqWZ1
 uUQ=
X-SBRS: 2.7
X-MesageID: 6801615
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,268,1566878400"; 
   d="scan'208";a="6801615"
From: Lars Kurth <lars.kurth@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Rich Persaud <persaur@gmail.com>, "Ian
 Jackson" <Ian.Jackson@citrix.com>
Thread-Topic: [PATCH 1/4] docs/sphinx: License content with CC-BY-4.0
Thread-Index: AQHVei0GF23MUwvctk6XmDQN6+Tnc6dPCMeA
Date: Mon, 7 Oct 2019 12:01:27 +0000
Message-ID: <3ED61DA0-6499-42D8-9244-CD9DA72891EB@citrix.com>
References: <20191003205623.20839-1-andrew.cooper3@citrix.com>
 <20191003205623.20839-2-andrew.cooper3@citrix.com>
In-Reply-To: <20191003205623.20839-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <23C87784B3C41F44A9023A38013F2BF2@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/4] docs/sphinx: License content with
 CC-BY-4.0
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDAzLzEwLzIwMTksIDIxOjU2LCAiQW5kcmV3IENvb3BlciIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgQ3JlYXRpdmUgQ29tbW9ucyBpcyBhIG1vcmUg
Y29tbW9uIGxpY2Vuc2UgdGhhbiBHUEwgZm9yIGRvY3VtZW50YXRpb24gcHVycG9zZXMuDQogICAg
U3dpdGNoIHRvIHVzaW5nIENDLUJZLTQuMCB0byBleHBsaWNpdGx5IHBlcm1pdCByZS1wdXJwb3Np
bmcgYW5kIHJlbWl4aW5nIG9mDQogICAgdGhlIGNvbnRlbnQuDQogICAgDQogICAgU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCiAgICAtLS0N
CiAgICBDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgIENDOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+DQogICAgQ0M6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPg0KICAgIENDOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQogICAgQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT4NCiAgICBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPg0KICAgIENDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCiAgICBDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4NCiAgICBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCiAg
ICBDQzogUmljaCBQZXJzYXVkIDxwZXJzYXVyQGdtYWlsLmNvbT4NCiAgICBDQzogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KICAgIC0tLQ0KICAgICBDT1BZSU5HICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysNCiAgICAgZG9jcy9SRUFETUUuc291cmNlICAg
ICAgICAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
CiAgICAgZG9jcy9hZG1pbi1ndWlkZS9pbmRleC5yc3QgICAgICAgICAgICAgIHwgIDIgKysNCiAg
ICAgZG9jcy9hZG1pbi1ndWlkZS9taWNyb2NvZGUtbG9hZGluZy5yc3QgIHwgIDIgKysNCiAgICAg
ZG9jcy9jb25mLnB5ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KICAgICBkb2Nz
L2d1ZXN0LWd1aWRlL2luZGV4LnJzdCAgICAgICAgICAgICAgfCAgMiArKw0KICAgICBkb2NzL2d1
ZXN0LWd1aWRlL3g4Ni9oeXBlcmNhbGwtYWJpLnJzdCAgfCAgMiArKw0KICAgICBkb2NzL2d1ZXN0
LWd1aWRlL3g4Ni9pbmRleC5yc3QgICAgICAgICAgfCAgMiArKw0KICAgICBkb2NzL2h5cGVydmlz
b3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QgfCAgMiArKw0KICAgICBkb2NzL2h5cGVydmlzb3It
Z3VpZGUvaW5kZXgucnN0ICAgICAgICAgfCAgMiArKw0KICAgICBkb2NzL2luZGV4LnJzdCAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKw0KICAgICAxMSBmaWxlcyBjaGFuZ2VkLCA1MiBp
bnNlcnRpb25zKCspDQogICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL1JFQURNRS5zb3VyY2UN
CiAgICANCiAgICBkaWZmIC0tZ2l0IGEvQ09QWUlORyBiL0NPUFlJTkcNCiAgICBpbmRleCAzMTBm
ZDUyYzI3Li44MGZhYzA5MWQzIDEwMDY0NA0KICAgIC0tLSBhL0NPUFlJTkcNCiAgICArKysgYi9D
T1BZSU5HDQogICAgQEAgLTQ3LDYgKzQ3LDkgQEAgdmFyaW91cyBkcml2ZXJzLCBzdXBwb3J0IGZ1
bmN0aW9ucyBhbmQgaGVhZGVyIGZpbGVzIHdpdGhpbiBYZW4tYXdhcmUNCiAgICAgTGludXggc291
cmNlIHRyZWVzLiBJbiBhbGwgc3VjaCBjYXNlcywgbGljZW5zZSB0ZXJtcyBhcmUgc3RhdGVkIGF0
IHRoZQ0KICAgICB0b3Agb2YgdGhlIGZpbGUgb3IgaW4gYSBDT1BZSU5HIGZpbGUgaW4gdGhlIHNh
bWUgZGlyZWN0b3J5Lg0KICAgICANCiAgICArU3BoaW54IGRvY3VtZW50YXRpb24gaXMgbGljZW5z
ZWQgdW5kZXIgQ0MtQlkgNC4wLiAgU2VlDQogICAgK2RvY3MvUkVBRE1FLnNvdXJjZSBmb3IgbW9y
ZSBzcGVjaWZpYyBpbmZvcm1hdGlvbi4NCiAgICArDQogICAgIEluIHNvbWUgY2FzZXMsIGNvbXBh
dGlibGUgM3JkIHBhcnR5IGNvZGUgaGFzIGJlZW4gaW1wb3J0ZWQgaW50byB0aGUNCiAgICAgWGVu
IHRyZWUsIHJldGFpbmluZyB0aGUgb3JpZ2luYWwgbGljZW5zZSwgc3VjaCBhcw0KICAgICAgIC0g
QUVTLTEyOCAzLjANCiAgICBkaWZmIC0tZ2l0IGEvZG9jcy9SRUFETUUuc291cmNlIGIvZG9jcy9S
RUFETUUuc291cmNlDQogICAgbmV3IGZpbGUgbW9kZSAxMDA2NDQNCiAgICBpbmRleCAwMDAwMDAw
MDAwLi5mMjBmYTkyYzI4DQogICAgLS0tIC9kZXYvbnVsbA0KICAgICsrKyBiL2RvY3MvUkVBRE1F
LnNvdXJjZQ0KICAgIEBAIC0wLDAgKzEsMzIgQEANCiAgICArU3BoaW54IGRvY3VtZW50YXRpb246
DQogICAgKw0KICAgICtBbGwgc291cmNlIHJlbmRlcmVkIGJ5IFNwaGlueCBpcyBsaWNlbnNlZCB1
bmRlciBDQy1CWS00LjAuDQoNClNvcnJ5IGZvciBvcGVuaW5nIHRoaXMgY2FuIG9mIHdvcm1zLiAN
Cg0KQWx0aG91Z2ggSSBoYWQgc2VlbiB0aGUgZGlzY3Vzc2lvbiBiZXR3ZWVuIFJpY2ggYW5kIHlv
dSBhYm91dCB0aGlzLCBJIGhhZCANCm5vdCBhY3R1YWxseSBkb25lIGFueSBncm91bmR3b3JrIG9u
IHRoZSBsaWNlbnNpbmcuIA0KDQpTbywgd2UgaGF2ZSB0byBsb29rIGF0IHR3byB0aGluZ3M6DQoN
CiogQ29tcGF0aWJpbGl0eToNCiAgIFNlZSBodHRwczovL2NyZWF0aXZlY29tbW9ucy5vcmcvMjAx
NS8xMC8wOC9jYy1ieS1zYS00LTAtbm93LW9uZS13YXktY29tcGF0aWJsZS13aXRoLWdwbHYzLyAN
CiAgIFRoaXMgbWFrZXMgQ0MtQlktNC4wIGluYm91bmQgY29tcGF0aWJsZSB3aXRoIEdQTHYzDQog
ICBJdCdzIG5vdCBjbGVhciB0byBtZSB3aGV0aGVyIEdQTHYyIGlzIGNvbXBhdGlibGUgd2l0aCBD
Qy1CWSA0LjA6IGxhY2sgb2YgcHVibGljbHkNCiAgIGF2YWlsYWJsZSBpbmZvcm1hdGlvbiBpbXBs
aWVzIHRoaXMgaXMgbm90IHRoZSBjYXNlIA0KDQoqIE91dHB1dCBMaWNlbnNlDQogICBCdXQgZXZl
biBpZiBpdCBpcywgdGhlIHByb2R1Y2VkIHNwaGlueCBvdXRwdXQgd291bGQgYmUgR1BMdjIsIG5v
dCBDQy1CWSA0LjANCiAgIFRoaXMgd291bGQgZXZlbiBiZSB0cnVlIGlmIG5vbmUgb2YgdGhlIG9s
ZGVyIEdQTHYyIGRvY3MgcG9ydGlvbnMgd2VyZSBpbmNsdWRlZCwgYXMNCiAgIHRoZSBBUEkgZG9j
cyBnZW5lcmF0ZWQgZnJvbSBzb3VyY2UgYXJlIEdQTHYyDQoNCkFzIHN1Y2ggdGhlIHN0YXRlbWVu
dCAiQWxsIHNvdXJjZSByZW5kZXJlZCBieSBTcGhpbnggaXMgbGljZW5zZWQgdW5kZXINCkNDLUJZ
LTQuMCIgaXMgd3JvbmcuIA0KDQpBbHRob3VnaCBpdCBpcyBwcm9iYWJseSBjb3JyZWN0IHRvIHNh
eSAiQWxsIENDLUJZIDQuMCBzb3VyY2UgcmVuZGVyZWQgYnkNClNwaGlueCBpcyBsaWNlbnNlZCB1
bmRlciBDQy1CWS00LjAiLCBiZWNhdXNlIFNwaGlueCByZXRhaW5zIHRoZSBzb3VyY2UgZmlsZQ0K
dG8gaHRtbCBtYXBwaW5nIGFuZCBsaW5rYWdlIGluIGRvY3MgZ2VuZXJhdGlvbiB3b3JrcyBkaWZm
ZXJlbnRseQ0KdG8gbGlua2FnZSBpbiBjb2RlLiANCg0KSSBhbSB3b25kZXJpbmcgd2hldGhlciBh
bnlvbmUgZWxzZSBoYXMgY29tZSBhY3Jvc3MgdGhpcy4gVGhpcyBxdWVzdGlvbiBpbg0KcGFydGlj
dWxhciBnb2VzIGJhY2sgdG8gUmljaCB3aG8gbWFkZSBhIHZlcnkgc3Ryb25nIGNhc2UgZm9yIEND
LUJZLTQuMCBiYXNlZA0KZG9jdW1lbnRhdGlvbi4gSSBkb24ndCB0aGluayB3ZSB3b3VsZCBoYXZl
IGFuIGlzc3VlIGlmIHRoZSBlbnRpcmUgc3BoaW54IGRvYy1zZXQNCmlzIEdQTHYyIGlmIG1vc3Qg
Y29udGVudCBpcyBsaWNlbnNlZCB1bmRlciBDQy1CWS00LjAsIGV4Y2VwdCB0aGF0IHN1Y2ggYW4N
CmFwcHJvYWNoIHdvdWxkIG1ha2UgcmUtdXNpbmcgdGhlIGVudGlyZSBzcGhpbnggZ2VuZXJhdGVk
IGRvY3NldCBtZXNzeS4NCg0KV2UgcHJvYmFibHkgYWxzbyB3YW50IHRvIG1haW50YWluIHRoZSBj
YXBhYmlsaXR5IHRvIGNvcHkgdGV4dCBmcm9tIHNvbWUNCmRvY3VtZW50YXRpb24gZnJlZWx5IGlu
dG8gdGhlIHNvdXJjZSB0cmVlIGFuZCB2aWNlIHZlcnNhLCBpZiBuZWVkZWQuIFRoaXMgaXMNCnBh
cnRpY3VsYXJseSB0cnVlIGZvciBjb250ZW50IGluIFRlY2huaWNhbCBEZWJ0LCB1c2VyIGNvbnRl
bnQgKG1heSBlbmQgdXAgaW4NCm1hbiBwYWdlcyksIGV0Yy4NCg0KTWF5YmUgdGhlIHJpZ2h0IGFw
cHJvYWNoIHdvdWxkIGJlIHRvIGR1YWxseSBsaWNlbnNlIHRoZSBkb2N1bWVudGF0aW9uDQpmaWxl
cyB1c2luZyBib3RoIEdQTHYyIGFuZCBDQy1CWSA0LjAgYW5kIHF1YW50aWZ5aW5nIHRoaXMgaW4g
dGhlIENPUFlJTkcNCmZpbGUgb2YgdGhlIGRvY3MgZGlyZWN0b3J5IChzdGFydGluZyBmcm9tIGEg
c3BlY2lmaWMgZGF0ZSkuIFdlIGNvdWxkIGV2ZW50dWFsbHkNCnJlLWxpY2Vuc2UgYWxsIHRoZSBv
dGhlciBzdHVmZiBvdmVyIHRpbWUsIHdoaWNoIHNob3VsZCBiZSByZWxhdGl2ZWx5IHN0cmFpZ2h0
Zm9yd2FyZA0KYW5kL29yIGV4Y2x1ZGUgc3BlY2lmaWMgcHJvYmxlbWF0aWMgZGlyZWN0b3JpZXMu
DQoNClRoaW5ncyBsaWtlIHN0YW5kYXJkaXNpbmcgc2F5IG1hbiBwYWdlcyB0byByc3QsIHdvdWxk
IHBvdGVudGlhbGx5IGFsc28NCmNyZWF0ZSBjb21wbGV4aXRpZXMgd2l0aCB0aGlzIHBhdGNoLCBi
ZWNhdXNlIG9mIA0KICAgICtUaGlzIGluY2x1ZGVzOg0KICAgICsgICogQWxsIFJlU3RydWN0dXJl
ZCBUZXh0IGZpbGVzOiAgICAgICAgICBkb2NzLyovKi5yc3QNCg0KSSBkb24ndCB3YW50IHRoaXMg
dG8gYmVjb21lIGEgbG9uZy13aW5kZWQgY29udmVyc2F0aW9uIGR1cmluZyB0aGUgNC4xMyBmcmVl
emUuDQpQbGVhc2Uga2VlcCB0aGlzIGluIG1pbmQgd2hlbiByZXNwb25kaW5nLg0KDQpJdCBtYXkg
bWVhbiB0aG91Z2gsIHRoYXQgd2UgY2FuJ3QgcmVzb2x2ZSB0aGlzIGJlZm9yZSA0LjEzIGlzIHJl
bGVhc2VkDQoNClJlZ2FyZHMNCkxhcnMNCg0KIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
