Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EBE554D4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 18:47:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfoXG-0005jB-AG; Tue, 25 Jun 2019 16:43:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HSsO=UY=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hfoXE-0005j6-HV
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 16:43:08 +0000
X-Inumbo-ID: 4cb5363c-9768-11e9-9809-ef9ffd646308
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cb5363c-9768-11e9-9809-ef9ffd646308;
 Tue, 25 Jun 2019 16:43:03 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6hQc9utovwAYFgkf9jJdjIYO5TS8WPNAxUEd/nhPndnZ8Pkp5rKTFi3rsu84t031LpqgW5m483
 lmUocO+/REM4uiggWEdLqhoaNLKnBXMmuWKVouzNrkAguH8ZHcjZZlU/JjEZhovCbagRL+m/Tv
 BdPw7Xx7pQ1ObT5tT4o3yb+avvAQJi6LI2DH1L4tcrVq6b+DDHyNFrbHLvsxreOVGqHXFcFFXc
 Eyibriw8w3lTe7hrErjTAUDZ31urDllA1c+fVWsznZ39kyaXyd70qHNFjvcEpfCk3lmmkFk/ly
 Vzc=
X-SBRS: 2.7
X-MesageID: 2237570
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2237570"
From: Lars Kurth <lars.kurth@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall
 <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: Migrating key developer docs to xen.git sphinx docs and
 refreshing them in the process
Thread-Index: AQHVKogYFsqm61IG8EyIbkU2yX65b6aq95aAgAAV6wCAABEmAIAADMIAgAAwgoCAAJdFAIAARlSAgAAI0oCAAD98AA==
Date: Tue, 25 Jun 2019 16:34:14 +0000
Message-ID: <C115C70A-4B61-41FC-BBF4-398C9F1A2CCC@citrix.com>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
 <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
 <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
 <20d7c8ce-a149-52c5-ba44-0ff5d8e63419@arm.com>
 <alpine.DEB.2.21.1906241430320.2468@sstabellini-ThinkPad-T480s>
 <90c2cbd6-2b00-03cc-55fd-cbc8ac80cde9@arm.com>
 <BB14443D-9037-4D24-BB69-F94849799AAB@citrix.com>
 <b0d228cd-e01a-4437-7103-2a9f23c9af31@citrix.com>
In-Reply-To: <b0d228cd-e01a-4437-7103-2a9f23c9af31@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <72CDD841F0C1AA4E9D695F2548B146BB@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Migrating key developer docs to xen.git sphinx docs
 and refreshing them in the process
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI1LzA2LzIwMTksIDE0OjQ3LCAiQW5kcmV3IENvb3BlciIgPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgT24gMjUvMDYvMjAxOSAxMzoxNSwgTGFycyBL
dXJ0aCB3cm90ZToNCiAgICA+IE9uIDI1LzA2LzIwMTksIDEwOjAzLCAiSnVsaWVuIEdyYWxsIiA8
anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+ICAgICA+Pj4gVGhlIHBv
aW50IGhlcmUgaXMgdGhhdCB3ZSBjYW4gYmUgZmxleGlibGUgYW5kIGNyZWF0aXZlIGFib3V0IHRo
ZSB3YXkgdG8NCiAgICA+ICAgICA+Pj4gbWFpbnRhaW4gdGhlIGRvY3Mgb24geGVuLmdpdC4gQnV0
IGFzIGEgdGVjaG5vbG9neSBpcyBjZXJ0YWlubHkgYmV0dGVyDQogICAgPiAgICAgPj4+IHRoYW4g
dGhlIHdpa2k6IHdlIGRvbid0IGhhdmUgdG8ga2VlcCB0aGVtIGFsbCB1cC10by1kYXRlIHdpdGgg
dGhlIGNvZGUsDQogICAgPiAgICAgPj4+IGJ1dCBhdCBsZWFzdCB0aGlzIHdheSB3ZSBoYXZlIGEg
Y2hhbmNlIChpZiB3ZSB3YW50IHRvKS4gSWYgd2UgbGVhdmUgdGhlbQ0KICAgID4gICAgID4+PiBv
biB0aGUgd2lraSwgdGhlcmUgaXMgbm8gY2hhbmNlLg0KICAgID4gICAgID4+DQogICAgPiAgICAg
Pj4gSSBjYW4ndCBzZWUgaG93IHhlbi5naXQgaXMgZ29pbmcgdG8gYmUgYmV0dGVyIGlmICJ3ZSBk
b24ndCBoYXZlIHRvIGtlZXAgdGhlbQ0KICAgID4gICAgID4+IGFsbCB1cC10by1kYXRlIi4NCiAg
ICA+ICAgICA+IA0KICAgID4gICAgID4gVGhhdCdzIGJlY2F1c2UgYSBjb250cmlidXRvciBjb3Vs
ZCBhZGQgYSBwYXRjaCBhdCB0aGUgZW5kIG9mIGEgc2VyaWVzIHRvDQogICAgPiAgICAgPiB1cGRh
dGUgb25lIG9mIHRoZSBkb2NzLCBldmVuIGlmIHRoZSBkb2MgaW4gcXVlc3Rpb24gY29tZXMgd2l0
aCBubw0KICAgID4gICAgID4gcHJvbWlzZXMgb2YgYmVpbmcgdXAtdG8tZGF0ZS4NCiAgICA+ICAg
ICANCiAgICA+ICAgICBJIHRoaW5rIHRoaXMgaXMgZ29pbmcgdGhlIHdyb25nIGRpcmVjdGlvbi4g
VGhlIGdvYWwgb2YgdXNpbmcgeGVuLmdpdCBpcyB0byB0cnkgDQogICAgPiAgICAgdG8ga2VlcCB0
aGUgZG9jdW1lbnRhdGlvbiB1cC10by1kYXRlLg0KICAgID4gICAgIA0KICAgID4gSSBhZ3JlZSB3
aXRoIEp1bGllbiBhbmQgdGhpcyB3YXMgYWxzbyBub3QgbXkgaW50ZW50aW9uLiBUaGUgcmVhc29u
IHdoeSBJIGJyb3VnaHQgdGhpcyB1cCBub3cgaXMgdGhhdCB0aGUgaW4tdHJlZSBkb2NzIGFyZSBw
cmV0dHkgbXVjaCBhIG1lc3MgdG9kYXkgYW5kIGFyZSBzdGFsZSBpbiBtYW55IHdheXMuIEFuZCB0
aGV5IGxvb2sgVEVSUklCTEUgYW5kIGFyZSBub3QgZWFzaWx5IHNlYXJjaGFibGUuIEhvd2V2ZXIs
IEFuZHkncyBsYXRlc3Qgc2V0IG9mIHBhdGNoZXMgcHJvdmlkZSBhbiBvcHBvcnR1bml0eSB0byBj
b25zb2xpZGF0ZSBzb21lIG9mIHRoZSBpbi10cmVlIGRvY3MgaW4gYSBuaWNlbHkgcmVuZGVyZWQg
YW5kIHNlYXJjaGFibGUgZm9ybWF0Lg0KICAgIA0KICAgIFNvIHRoZSBwbGFuIGhlcmUgaXMgdG8g
Z2V0IGEgY29uc2lzdGVudCBhbmQgdW5pZm9ybSBzZXQgb2YgaGlnaCBxdWFsaXR5DQogICAgZG9j
cy4NCiAgICANCiAgICBBcyBmYWlyIHdhcm5pbmcsIEknbSBpbnRlbmRpbmcgdG8gYmUgZmFpcmx5
IHN0cmljdCB3aXRoIHdoYXQgZ29lcyBpbg0KICAgIChxdWFsaXR5IHdpc2UpLCBiZWNhdXNlIEkn
bSBnb2luZyB0byBkbyBteSBiZXN0IHRvIGVuc3VyZSB0aGF0IHRoZQ0KICAgIHNwaGlueCBkb2N1
bWVudGF0aW9uIGRvZXNuJ3QgZGV2b2x2ZSBpbnRvIHRoZSBtZXNzIHRoYXQgd2lraSBvciB0aGUN
CiAgICBtYWpvcml0eSBvZiBkb2NzLyBjdXJyZW50bHkgaXMuDQoNCkkgd2hvbGVoZWFydGVkbHkg
YWdyZWUNCiAgICANCiAgICA+IEkgaGF2ZSBiZWVuIGZvY3Vzc2luZyBvbiBwcm9jZXNzIHJlbGF0
ZWQgYW5kIGtleSBkZXZlbG9wZXIgcmVsYXRlZCBkb2NzLCBiZWNhdXNlIHdobyBtYWludGFpbnMg
dGhlbSBpcyBub3QgYWN0dWFsbHkgYW4gaXNzdWUgaW4gdGhlb3J5LiBFdmVyeW9uZSByZWFsbHkg
b3VnaHQgdG8gY2FyZSwgYmVjYXVzZSBldmVyeW9uZSBpcyBpbXBhY3RlZCBieSB0aGVzZS4NCiAg
ICANCiAgICBUaGUga2V5IHBvaW50IGlzIGZvciBtYWludGFpbmVycy9yZXZpZXdlcnMgdG8gYmUg
YXdhcmUgb2Ygd2hldGhlcg0KICAgIGRvY3VtZW50YXRpb24gZXhpc3RzIGZvciB0aGUgYXJlYSBv
ZiBjb2RlIGJlaW5nIG1vZGlmaWVkLCBhbmQgaWYgc28sDQogICAgd2hldGhlciB0aGUgc3VibWl0
dGVkIHBhdGNoIHNob3VsZCBhbHNvIHBhdGNoIHRoZSBkb2N1bWVudGF0aW9uLg0KDQpJIGFtIHdv
bmRlcmluZyB3aGV0aGVyIHRoaXMgaXMgc29tZXRoaW5nIHdoaWNoIGNvdWxkIGJlIGFkZHJlc3Nl
ZC4gT25lIHBvc3NpYmlsaXR5IG1heSBiZSB0byBoYXZlIFNVUFBPUlQubWQgcG9pbnQgdG8gZG9j
dW1lbnRhdGlvbi4gQnV0IHRoYXQgaXMga2luZCBvZiBhc3N1bWluZyB0aGF0IFNVUFBPUlQubWQg
d29ya3MgYW5kIGlzIHdpZGVseSB1c2VkLiBUaGVyZSBtYXkgYmUgYmV0dGVyIG9yIG9ydGhvZ29u
YWwgd2F5cyB0byBwb2ludCB0byByZWxldmFudCBkb2NzIChlLmcuIGJ5IHBvaW50aW5nIHRvIGRv
Y3MgaW4gaGVhZGVyIGZpbGVzIGFuZCBvdGhlciBzb3VyY2UgZmlsZXMpLiANCiAgICANCiAgICBS
ZXZpZXdlcnMgdGVuZCB0byBiZSBmYWlybHkgZ29vZCBhdCBub3RpY2luZyBwYXRjaGVzIHdoaWNo
IGFsc28gbmVlZCB0bw0KICAgIHBhdGNoIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRv
YyAoc3VibWl0dGVycywgbGVzcyBzbyksIGJ1dCB0aGlzDQogICAgYXBwcm9hY2ggbmVlZHMgZXh0
ZW5kaW5nIHRvIHRoZSB3aG9sZSBvZiB0aGUgc3BoaW54IGRvY3MgKHdoaWNoIGluIHR1cm4NCiAg
ICByZXF1aXJlcyB0aGUgZG9jcyB0byBzdGF5IGhpZ2ggcXVhbGl0eSBzbyBpdHMgZWFzeSBmb3Ig
bWFpbnRhaW5lcnMgdG8NCiAgICBrbm93IHdoYXQgaXMgd2hlcmUpLg0KICAgIA0KQWx0aG91Z2gg
dGhpcyBkb2VzIG5vdCBhcHBseSBpbiBteSBwcm9wb3NhbCwgSSB0aGluayB0aGUga2V5IGlzc3Vl
IGhhcyBiZWVuIHRoYXQgcmV2aWV3ZXJzIGFuZCBzdWJtaXR0ZXJzIG9mIGNvZGUgb2Z0ZW4gZG9u
J3QgdXNlIG91ciBkb2N1bWVudGF0aW9uLiBUaGUgd2lraSBpcyBzZWVuIGFzIGEgc2VwYXJhdGUg
dGhpbmcgYW5kIGFsc28gaGFzIHRoZSBkaXNhZHZhbnRhZ2UgdGhhdCBpdCBkb2Vzbid0IGxlbmQg
aXRzZWxmIHRvIHN1cHBvcnRpbmcgZGlmZmVyZW50IHZlcnNpb25zIG9mIFhlbi4gQW5kIG1vc3Qg
b2YgdGhlIHRpbWUsIGRldmVsb3BlcnMgZG8gbm90IHVzZSBpdCBhbmQgbmVpdGhlciBjb250cmli
dXRlIHRvIGl0Lg0KDQpNeSBob3BlIHdhcyB0aGF0IGJ5IGhvc3RpbmcgZG9jdW1lbnRhdGlvbiBy
ZWxhdGVkIHRvIGNvbnRyaWJ1dGlvbiB3b3JrZmxvdyBhbmQgb3RoZXIgZXNzZW50aWFsIHRhc2tz
IGNsb3NlIHRvIG90aGVyIHVzZWZ1bCBkb2N1bWVudGF0aW9uIHRoaXMgd291bGQgZW5hYmxlIGNo
YW5nZS4NCg0KQEFuZHkgYW5kIG90aGVyczogSSBuZWVkIHRvIGtub3cgd2hldGhlciB5b3UgYWdy
ZWUgd2l0aCBteSBwcm9wb3NhbCBhbmQgd2hldGhlciBhbnlvbmUgaGFzIG90aGVyIHN1Z2dlc3Rp
b25zLg0KDQpSZWdhcmRzDQpMYXJzDQogDQoNCg0KIA0KICAgIA0KICAgIA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
