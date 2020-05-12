Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE81CFBF2
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 19:22:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYYaG-00015q-Hp; Tue, 12 May 2020 17:20:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDyx=62=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYYaE-00015l-T8
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 17:20:46 +0000
X-Inumbo-ID: ea038eac-9474-11ea-b9cf-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea038eac-9474-11ea-b9cf-bc764e2007e4;
 Tue, 12 May 2020 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589304046;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Rz/OpGpQ+brWc/9YfLNcQ3O+xh9dhjXSF8ukKqAjjOI=;
 b=iWrKn0m2odbclo5nIe5Ok+7IErAwPvaDelVBu/z1zCiGx11v0b/g5v8m
 iT0gpjldbYlFiAUO6UoTDw1maeMU/52ZJs5Sf787YmRua6wNF90Fp/iOe
 IY7nlzprtdpPZ21xhpHxXYIHjp+GceV34sqoPoP05bbbPX71xs+XGdx/J 4=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: puPhiaKIFfltbd3Jd+DFXII/F/u6J0arkaLVLJtPPootupbEL+p1C1LwNu5daRrnIFoo+8ERlC
 eboSZutgWyjLkHRazGGqUk13arY05bvggI2TWF3I9mhX6czwNbaPgXTPwLpGyAPWy8Lh/yw7rP
 FkLuBFa0zTJtmWnN0AOyJOCE/cjlCLRk2UA6ylloTA1F7SKeEDEozKnyZr6IGGuXeoju6Zrp2y
 iDJe9dvuylw/k+a4zGvORq8ikxz5pn15pxfIXiEFrRJ8iCNU8oU8aSgBIIxc8EgE2NVip3Rxey
 rgs=
X-SBRS: 2.7
X-MesageID: 17365587
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17365587"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 3/3] golang/xenlight: add necessary module/package
 documentation
Thread-Topic: [PATCH 3/3] golang/xenlight: add necessary module/package
 documentation
Thread-Index: AQHWHzfORxaz+/l/VEu6tN0ApHJiJKikozQA
Date: Tue, 12 May 2020 17:20:08 +0000
Message-ID: <16919263-9167-4BB1-9583-F7899FE3A246@citrix.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <9f5000ceea14e6818e491df38eba161c800b4cf8.1588282027.git.rosbrookn@ainfosec.com>
In-Reply-To: <9f5000ceea14e6818e491df38eba161c800b4cf8.1588282027.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <E87C769079464643A2178899FBED12A6@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDMwLCAyMDIwLCBhdCAxMDozOSBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJv
b2tuQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBBZGQgYSBSRUFETUUgYW5kIHBhY2thZ2UgY29t
bWVudCBnaXZpbmcgYSBicmllZiBvdmVydmlldyBvZiB0aGUgcGFja2FnZS4NCj4gVGhlc2UgYWxz
byBoZWxwIHBrZy5nby5kZXYgZ2VuZXJhdGUgYmV0dGVyIGRvY3VtZW50YXRpb24uDQo+IA0KPiBB
bHNvLCBhZGQgYSBjb3B5IG9mIFhlbidzIGxpY2Vuc2UgdG8gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0
LiBUaGlzIGlzDQo+IHJlcXVpcmVkIGZvciB0aGUgcGFja2FnZSB0byBiZSBzaG93biBvbiBwa2cu
Z28uZGV2IGFuZCBhZGRlZCB0byB0aGUNCj4gZGVmYXVsdCBtb2R1bGUgcHJveHksIHByb3h5Lmdv
bGFuZy5vcmcuDQoNCmxpYnhsIGlzIGFjdHVhbGx5IHVuZGVyIHRoZSBMR1BMOyBJIGd1ZXNzIHdl
IHdhbnQgdGhlIHhlbmxpZ2h0IHBhY2thZ2UgdG8gYmUgdGhlIHNhbWU/DQoNCkFzIGRpc2N1c3Nl
ZCBiZWZvcmUsIGFyZ3VhYmx5IGRpc3RyaWJ1dGluZyB0aGUgKi5nZW4uZ28gZmlsZXMgd29u4oCZ
dCBiZSBzdWZmaWNpZW50IHRvIGNvbXBseSB3aXRoIHRoZSBsaWNlbnNlLCBiZWNhdXNlIHRoZXkg
YXJlIG5vdCB0aGUg4oCccHJlZmVycmVkIGZvcm0gb2YgbW9kaWZpY2F0aW9u4oCdOiB0aGF0IHdv
dWxkIGJlIGxpYnhsX3R5cGVzLmlkbCwgYWxvbmcgd2l0aCB0aGUgcHl0aG9uIGdlbmVyYXRvcnMu
DQoNCk9UT0gsIEkgc3VwcG9zZSB0aGF04oCZcyBzb3J0IG9mIEdvb2dsZeKAmXMgcHJvYmxlbSBp
biBzb21lIHdheXMuLi4NCg0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdo
dC9SRUFETUUubWQgYi90b29scy9nb2xhbmcveGVubGlnaHQvUkVBRE1FLm1kDQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjQyMjQwZTIxMzINCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi90b29scy9nb2xhbmcveGVubGlnaHQvUkVBRE1FLm1kDQo+IEBAIC0wLDAg
KzEsMTcgQEANCj4gKyMgeGVubGlnaHQNCj4gKw0KPiArIyMgQWJvdXQNCj4gKw0KPiArVGhlIHhl
bmxpZ2h0IHBhY2thZ2UgcHJvdmlkZXMgR28gYmluZGluZ3MgdG8gWGVuJ3MgbGlieGwgQyBsaWJy
YXJ5IHZpYSBjZ28uIFRoZSBwYWNrYWdlIGlzIGN1cnJlbnRseSBpbiBhbiB1bnN0YWJsZSAicHJl
dmlldyIgc3RhdGUuDQoNCldlIHNob3VsZCBwcm9iYWJseSB0cnkgdG8gc2xvdCBpdCBpbnRvIG9u
ZSBvZiB0aGUgb2ZmaWNpYWwgdGVybXMgd2UgdXNlIGluIFNVUFBPUlQubWQgKGFuZCBhbHNvIGFk
ZCBpdCB0byBTVVBQT1JULm1kISkuDQoNCkFUTSB5b3UgY2Fu4oCZdCBldmVuIGRvIGEgZnVsbCBW
TSBsaWZlY3ljbGUgd2l0aCBpdCBwcm9wZXJseSAodG8gaW5jbHVkZSBoYXJ2ZXN0aW5nIGRlc3Ry
b3llZCBkb21haW5zKTsgc28gSSB0aGluayBpdCB3b3VsZCBjb21lIHVuZGVyIOKAnGV4cGVyaW1l
bnRhbOKAnS4NCg0KPiBUaGlzIG1lYW5zIHRoZSBwYWNrYWdlIGlzIHJlYWR5IGZvciBpbml0aWFs
IHVzZSBhbmQgZXZhbHVhdGlvbiwgYnV0IGlzIG5vdCB5ZXQgZnVsbHkgZnVuY3Rpb25hbC4gTmFt
ZWx5LCBvbmx5IGEgc3Vic2V0IG9mIGxpYnhsJ3MgQVBJIGlzIGltcGxlbWVudGVkLCBhbmQgYnJl
YWtpbmcgY2hhbmdlcyBtYXkgb2NjdXIgaW4gZnV0dXJlIHBhY2thZ2UgdmVyc2lvbnMuDQo+ICsN
Cj4gK011Y2ggb2YgdGhlIHBhY2thZ2UgaXMgZ2VuZXJhdGVkIHVzaW5nIHRoZSBsaWJ4bCBJREwu
IENoYW5nZXMgdG8gdGhlIGdlbmVyYXRlZCBjb2RlIGNhbiBiZSBtYWRlIGJ5IG1vZGlmeWluZyBg
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHlgIGluIHRoZSB4ZW4uZ2l0IHRyZWUu
DQo+ICsNCj4gKyMjIEdldHRpbmcgU3RhcnRlZA0KPiArDQo+ICtgYGBnbw0KPiAraW1wb3J0ICgN
Cj4gKyAgICAgICAgInhlbmJpdHMueGVuLm9yZy9naXQtaHR0cC94ZW4uZ2l0L3Rvb2xzL2dvbGFu
Zy94ZW5saWdodCINCj4gKykNCj4gK2BgYA0KPiArDQo+ICtUaGUgbW9kdWxlIGlzIG5vdCB5ZXQg
dGFnZ2VkIGluZGVwZW5kZW50bHkgb2YgeGVuLmdpdCwgc28gZXhwZWN0IHRvIHNlZSBgdjAuMC4w
LTxkYXRlPi08Z2l0IGhhc2g+YCBhcyB0aGUgcGFja2FnZSB2ZXJzaW9uLiBJZiB5b3Ugd2FudCB0
byBwb2ludCB0byBhIFhlbiByZWxlYXNlLCBzdWNoIGFzIDQuMTQuMCwgeW91IGNhbiBydW4gYGdv
IGdldCB4ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAveGVuLmdpdC90b29scy9nb2xhbmcveGVubGln
aHRAUkVMRUFTRS00LjE0LjBgLg0KDQpJIHRoaW5rIEkgd291bGQgc2F5IHNvbWV0aGluZyBsaWtl
Og0KDQrigJQNCg0KVGhlIG1vZHVsZSBpcyBub3QgeWV0IHRhZ2dlZCBpbmRlcGVuZGVudGx5IG9m
IHhlbi5naXQ7IGlmIHlvdSBkb27igJl0IHNwZWNpZnkgdGhlIHZlcnNpb24sIHlvdeKAmWxsIGdl
dCB0aGUgbW9zdCByZWNlbnQgZGV2ZWxvcG1lbnQgdmVyc2lvbiwgd2hpY2ggaXMgcHJvYmFibHkg
bm90IHdoYXQgeW91IHdhbnQuICBBIGJldHRlciBvcHRpb24gd291bGQgYmUgdG8gc3BlY2lmeSBh
IFhlbiByZWxlYXNlIHRhZzsgZm9yIGluc3RhbmNlOiBgZ28gZ2V0IHhlbmJpdHPigKYuL3hlbmxp
Z2h0QFJFTEVBU0UtNC4xNC4xMGAuDQoNCuKAlA0KDQoNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbw0KPiBpbmRleCA2YjRmNDkyNTUwLi4zZWFhNWEzZDYzIDEwMDY0NA0KPiAtLS0gYS90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28NCj4gKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxp
Z2h0L3hlbmxpZ2h0LmdvDQo+IEBAIC0xNCw2ICsxNCw4IEBADQo+ICAqIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMNCj4gICog
TGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cu
Z251Lm9yZy9saWNlbnNlcy8+Lg0KPiAgKi8NCj4gKw0KPiArLy8gUGFja2FnZSB4ZW5saWdodCBw
cm92aWRlcyBiaW5kaW5ncyB0byBYZW4ncyBsaWJ4bCBDIGxpYnJhcnkuDQo+IHBhY2thZ2UgeGVu
bGlnaHQNCg0KDQpXaWxsIHRoaXMgY29tbWVudCByZXBsYWNlIHRoZSBjb21tZW50IGFib3ZlIGl0
IGluIHRoZSBwa2cuZ28uZGV2IG1vZHVsZSBwYWdlPw0KDQogLUdlb3JnZQ0KDQo=

