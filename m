Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6778F220F9C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 16:38:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jviX7-0008Gd-UC; Wed, 15 Jul 2020 14:37:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+F45=A2=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jviX6-0008GY-RJ
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 14:37:16 +0000
X-Inumbo-ID: ad450c14-c6a8-11ea-bca7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad450c14-c6a8-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594823835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/tMb/WMnsmLLYWFUNCttYu/ZMOUPlZZvZasyxQDli7c=;
 b=glCgp0v7E6U6ezsJqT8HTg8m2d9q1gRgQlyvNLO+k83Sa+LiaV5xNP25
 4cXI9k3PAkpu2cxKZk5eBf08F61dwcmo/6zQJNgqaqJu+uZmkmNaU4QTp
 hJz1DEL0DYIhIty0DCUkU3cbk1UZmXGHDAMVjiU35BI8NccuxEmY8oYzH 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ViQlBA6jt7rRCfn0fjTA5aMpL9bZBBDPr94kQYM+SOs9DiXNKJ+KZs7t1bxYSMtJh0Xaj8IOK1
 yEwFN/WCgLIbeAAm7fyC4M9FDMI7Ket2HKX/O5I/l/JZx9dj2YWxeoSEW8HOVsa5vqrmByTKFk
 3LanK4Jwgnw5K9kdYvMLuPbG16xbKGgQweQYYR+uSCGSMK5RNzeLMtPSXRl5+DL38481ZCX/sW
 ThmIZenkgsbQVnwLdI5zL4Lrdht4lu+mzzngBx0rvh0m4gvWhcoB6eArA4tZ5B8A/cj/C6tG6u
 3Mo=
X-SBRS: 2.7
X-MesageID: 22637927
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22637927"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v2] docs: specify stability of hypfs path documentation
Thread-Topic: [PATCH v2] docs: specify stability of hypfs path documentation
Thread-Index: AQHWWR59fvtpmEuro06JsoMrFTmX86kFdV+AgAMhtYA=
Date: Wed, 15 Jul 2020 14:37:11 +0000
Message-ID: <68F727A8-29B8-4846-8BE9-BD4F6E0DC60D@citrix.com>
References: <20200713140338.16172-1-jgross@suse.com>
 <8a96b1b9-cbcb-557a-5b82-661bbe40fe25@suse.com>
In-Reply-To: <8a96b1b9-cbcb-557a-5b82-661bbe40fe25@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <8ABD25FC33C9B44CB88AFDF79476C986@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDEzLCAyMDIwLCBhdCAzOjQ3IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTMuMDcuMjAyMCAxNjowMywgSnVlcmdlbiBHcm9z
cyB3cm90ZToNCj4+IEluIGRvY3MvbWlzYy9oeXBmcy1wYXRocy5wYW5kb2MgdGhlIHN1cHBvcnRl
ZCBwYXRocyBpbiB0aGUgaHlwZXJ2aXNvcg0KPj4gZmlsZSBzeXN0ZW0gYXJlIHNwZWNpZmllZC4g
TWFrZSBpdCBtb3JlIGNsZWFyIHRoYXQgcGF0aCBhdmFpbGFiaWxpdHkNCj4+IG1pZ2h0IGNoYW5n
ZSwgZS5nLiBkdWUgdG8gc2NvcGUgd2lkZW5pbmcgb3IgbmFycm93aW5nIChlLmcuIGJlaW5nDQo+
PiBsaW1pdGVkIHRvIGEgc3BlY2lmaWMgYXJjaGl0ZWN0dXJlKS4NCj4+IA0KPj4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gUmVsZWFzZS1hY2tlZC1i
eTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+DQo+IA0KPiBBY2tlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gSG93ZXZlciwgSSdkIGxpa2UgYWdyZWVtZW50
IGJ5IGF0IGxlYXN0IG9uZSBvdGhlciBSRVNUIG1haW50YWluZXIgb24NCj4gLi4uDQo+IA0KPj4g
QEAgLTU1LDYgKzU4LDExIEBAIHRhZ3MgZW5jbG9zZWQgaW4gc3F1YXJlIGJyYWNrZXRzLg0KPj4g
KiBDT05GSUdfKiAtLSBQYXRoIGlzIHZhbGlkIG9ubHkgaW4gY2FzZSB0aGUgaHlwZXJ2aXNvciB3
YXMgYnVpbHQgd2l0aA0KPj4gICB0aGUgcmVzcGVjdGl2ZSBjb25maWcgb3B0aW9uLg0KPj4gDQo+
PiArSW4gY2FzZSBhIHRhZyBmb3IgYSBwYXRoIGluZGljYXRlcyB0aGF0IHRoaXMgcGF0aCBpcyBh
dmFpbGFibGUgaW4gc29tZQ0KPj4gK2Nhc2Ugb25seSwgdGhpcyBhdmFpbGFiaWxpdHkgbWlnaHQg
YmUgZXh0ZW5kZWQgb3IgcmVkdWNlZCBpbiBmdXR1cmUgYnkNCj4+ICttb2RpZmljYXRpb24gb3Ig
cmVtb3ZhbCBvZiB0aGUgdGFnLiBBIHBhdGggb25jZSBhc3NpZ25lZCBtZWFuaW5nIHdvbid0IGdv
DQo+PiArYXdheSBhbHRvZ2V0aGVyIG9yIGNoYW5nZSBpdHMgbWVhbmluZywgdGhvdWdoLg0KPiAN
Cj4gLi4uIHRoZSBuZXdseSBpbXBvc2VkIGd1YXJhbnRlZSB3ZSdyZSBub3cgbWFraW5nLiBXZSBy
ZWFsbHkgd2FudCB0bw0KPiBhdm9pZCBkZWNsYXJpbmcgc29tZXRoaW5nIGFzIHN0YWJsZSB3aXRo
b3V0IGJlaW5nIHF1aXRlIGNlcnRhaW4gd2UNCj4gY2FuIGtlZXAgaXQgc3RhYmxlLg0KDQpUaGUg
ZGVjbGFyYXRpb24gb2YgbmV3IG5vZGVzIG11c3QgYWxsIGhhcHBlbiBpbiB0aGlzIGZpbGUsIHJp
Z2h0PyAgU28gYXMgbG9uZyBhcyB0aGUgbWFpbnRhaW5lcihzKSBmbyB0aGlzIGZpbGUgYXJlIGF3
YXJlIG9mIHRoYXQsIGFuZCBpdOKAmXMgY29tbWVudGVkIHNvIHRoYXQgcGVvcGxlIGtub3cgdGhh
dCBleHBlY2F0aW9uLCBJIHRoaW5rIGl04oCZcyBPSy4NCg0KQnV0IEkgdGhpbmsgdGhpcyBwYXJh
Z3JhcGggaXNu4oCZdCB2ZXJ5IGNsZWFyIHRvIG1lIHdoYXQg4oCcbWlnaHQgYmUgZXh0ZW5kZWQg
b3IgcmVkdWNlZCDigKZidXQgd29u4oCZdCBnbyBhd2F5IGFsdG9nZXRoZXLigJ0uDQoNCklUIHNv
dW5kcyBsaWtlIHlvdeKAmXJlIHNheWluZzoNCg0KMS4gUGF0aHMgbGlzdGVkIHdpdGhvdXQgY29u
ZGl0aW9ucyB3aWxsIGFsd2F5cyBiZSBhdmFpbGFibGUNCg0KMi4gUGF0aHMgbGlzdGVkIHdpdGgg
Y29uZGl0aW9ucyBtYXkgYmUgZXh0ZW5kZWQ6IGkuZS4sIGEgbm9kZSBjdXJyZW50bHkgbGlzdGVk
IGFzIFBWIG1pZ2h0IGFsc28gYmVjb21lIGF2YWlsYWJsZSBmb3IgSFZNIGd1ZXN0cw0KDQozLiBQ
YXRocyBsaXN0ZWQgd2l0aCBjb25kaXRpb25zIG1pZ2h0IGhhdmUgdGhvc2UgY29uZGl0aW9ucyBy
ZWR1Y2VkLCBidXQgd2lsbCBuZXZlciBlbnRpcmVseSBkaXNhcHBlYXIuICBTbyBzb21ldGhpbmcg
Y3VycmVudGx5IGxpc3RlZCBhcyBQViBtaWdodCBiZSByZWR1Y2VkIHRvIENPTkZJR19IQVNfRk9P
LCBidXQgd29u4oCZdCBiZSBjb21wbGV0ZWx5IHJlbW92ZWQuDQoNCklzIHRoYXQgd2hhdCB5b3Ug
bWVhbnQ/DQoNCiAtR2Vvcmdl

