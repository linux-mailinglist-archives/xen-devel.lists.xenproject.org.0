Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7261E27ED
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 19:07:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdd2r-00075Q-K0; Tue, 26 May 2020 17:07:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdd2q-00075L-BR
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 17:07:16 +0000
X-Inumbo-ID: 58ecf8f4-9f73-11ea-9dbe-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58ecf8f4-9f73-11ea-9dbe-bc764e2007e4;
 Tue, 26 May 2020 17:07:15 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8xyA8cgVOqztaCYCv9smMqkcUv3MbBxmnB58bnscb5p+c2b1evReH5p3Z7dZlOiT09IDIP6iV3
 1jJvzDO0W5ZvGxXIvn07fSMzKW/eVVVJC9E8q4XXFpcgQUCwxNu71fMYDINKy9R8zvPGkxguEW
 yzZaBNnPzfp5ftsFRxQm+BY7DaVaWKHFS1aSWHTOhqPsTwX7ZNQflPxy+jXbDz6oBeswYke3tp
 8pGWL6e7Ta2uzyCbRoaX2v+rT4gb+YDdHYfji/0d9b+0vYEfAPsMofS4RT6pgJQPt3mh97WvoC
 mV4=
X-SBRS: 2.7
X-MesageID: 18770012
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,437,1583211600"; d="scan'208";a="18770012"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH 5/5] gitignore: Ignore golang package directory
Thread-Topic: [PATCH 5/5] gitignore: Ignore golang package directory
Thread-Index: AQHWMFPdiIMBJ2MNy0CkFZ0ooWSGmqi6SAuAgAAbAoCAABjdAIAAAheA
Date: Tue, 26 May 2020 17:07:11 +0000
Message-ID: <1D4C50D9-BFA4-42B9-AE76-8E836CAD6430@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-6-george.dunlap@citrix.com>
 <24269.8059.28506.353748@mariner.uk.xensource.com>
 <A525D330-BCF9-4998-BEC5-425BA6C26CCF@citrix.com>
 <24269.19198.604986.160896@mariner.uk.xensource.com>
In-Reply-To: <24269.19198.604986.160896@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E913A99B232AC45B1F42429E7115FBD@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI2LCAyMDIwLCBhdCA1OjU5IFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIlJlOiBb
UEFUQ0ggNS81XSBnaXRpZ25vcmU6IElnbm9yZSBnb2xhbmcgcGFja2FnZSBkaXJlY3RvcnkiKToN
Cj4+IFtleHBsYW5hdGlvbl0NCj4gDQo+IFNvdW5kcyBxdWl0ZSB0YW5nbGVkLi4uDQo+IA0KPj4g
TmljaywgYW55IG9waW5pb25zPw0KPiAuLi4NCj4+PiBJcyB0aGVyZSBub3QgYSByaXNrIHRoYXQg
aHVtYW5zIHdpbGwgdHJ5IHRvIGVkaXQgaXQgPw0KPiANCj4gQW55d2F5IElTVE0gdGhhdCB5b3Ug
aGF2ZSBkZWZpbml0ZWx5IGNvbnNpZGVyZWQgdGhpcyBzbw0KPiANCj4gQWNrZWQtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPg0KPiANCj4gYXNzdW1pbmcgdGhhdCBh
bmQgTmljayBjb252aW5jZSB5b3Vyc2VsdmVzIHlvdSd2ZSBhZGRyZXNzZWQgdGhpcw0KPiBwb3Nz
aWJsZSBpc3N1ZS4NCj4gDQo+PiBJIHN1cHBvc2Ugc29tZW9uZSBtaWdodC4gIElmIHdlIGRlY2lk
ZSB3ZSB3YW50IHRvIHN1cHBvcnQgb2xkZXIgdmVyc2lvbnMgb2YgZ28sIHdlIHByb2JhYmx5IHdh
bnQgdG8gZmlndXJlIHNvbWV0aGluZyBvdXQgdGhlcmUuICBPcHRpb25zOg0KPj4gDQo+PiAxLiBD
b3B5IHRoZSBmaWxlcyB0byBhIHRlbXAgZGlyZWN0b3J5IGluc3RlYWQuICBUaGlzIGlzIGNvbXBs
aWNhdGVkIGJlY2F1c2Ugd2UgaGF2ZSB0byBmaW5kIGEgZ29vZCB0ZW1wIGRpcmVjdG9yeSwgYW5k
IHdl4oCZZCBoYXZlIHRvIGNvcHkgdGhlbSBldmVyeSB0aW1lLCBzbG93aW5nIGRvd24gdGhlIGlu
Y3JlbWVudGFsIGJ1aWxkICh0aG91Z2ggbm90IHRoYXQgbXVjaCkuDQo+IA0KPiBJIGRvbid0IHRo
aW5rIHRoYXQgaGVscHMgbXVjaC4NCj4gDQo+PiAyLiBQdXQgYSBmaWxlIGluIHRoZSBnZW5lcmF0
ZWQgZGlyZWN0b3J5IGxpa2Ug4oCcR0VORVJBVEVEX0RPX05PVF9FRElU4oCdLg0KPj4gDQo+PiAz
LiBQdXQgdGhlbSBpbiB0b29scy9nb2xhbmcvR0VORVJBVEVEX0RPX05PVF9FRElUL3NyYyBpbnN0
ZWFkLg0KPiANCj4gRG8gdGhleSBub3QgaGF2ZSBhIGhlYWRlciBjb21tZW50IHNheWluZyBETyBO
T1QgRURJVCA/DQoNClRoZSBnZW5lcmF0ZWQgZmlsZXMgZG8sIGJ1dCB0aGlzIGNvcGllcyBhbGwg
dGhlIGZpbGVzLCBpbmNsdWRpbmcgdGhlIG5vbi1nZW5lcmF0ZWQgb25lcy4NCg0KQW55d2F5LCBp
dCB0dXJucyBvdXQgaXMgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBnbyBtb2R1bGVzIHBlciBzZSwg
YnV0IG1vcmUgdG8gZG8gd2l0aCBteSBxdWl4b3RpYyBhdHRlbXB0IHRvIG1ha2UgaXQgcG9zc2li
bGUgdG8gYnVpbGQgZnJvbSBzdHVmZiBpbnN0YWxsZWQgbG9jYWxseSBpbiAkUFJFRklYLCByYXRo
ZXIgdGhhbiBoYXZpbmcgdG8gY2xvbmUgc29tZXRoaW5nIG92ZXIgdGhlIGludGVybmV0LiAgVGhl
IGN1cnJlbnQgdmVyc2lvbiBvZiB0aGUg4oCcYnVpbGQgdGVzdOKAnSBkb2VzbuKAmXQgYWN0dWFs
bHkgdXNlIHRoaXMgR09QQVRIIHN0dWZmLCBhbmQgd29ya3MgZXZlbiBvbiB2ZXJzaW9ucyBvZiBn
b2xhbmcgdGhhdCBkb27igJl0IGhhdmUgbW9kdWxlIHN1cHBvcnQuDQoNCknigJl2ZSBnb3QgYSBw
YXRjaCB0aGF0IHJlbW92ZXMgdGhpcyB3aG9sZSBmYWtlLUdPUEFUSCB0aGluZzsgSeKAmWxsIHNl
bmQgdGhhdCBhbG9uZyBpbiBsaWV1IG9mIHBhdGNoZXMgNCBhbmQgNS4NCg0KVGhhbmtzLA0KIC1H
ZW9yZ2U=

