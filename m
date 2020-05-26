Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A301E2718
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 18:33:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdcVq-0003kE-Ub; Tue, 26 May 2020 16:33:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdcVp-0003k8-NT
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 16:33:09 +0000
X-Inumbo-ID: 950d4848-9f6e-11ea-81bc-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 950d4848-9f6e-11ea-81bc-bc764e2007e4;
 Tue, 26 May 2020 16:33:09 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: oS50+zsSVqefo8RHIfeozCbKo1gS6/8O/T+M9H5Qc9wCUsv6qju7t2Tu7Ss+g3r0wIwQIwHTc5
 8Z05fv48sXfoYqvVFEh1rWGIs//eSGhcc/64pIJ0BA7Drve/i3Uo3T3wJ5Pp78drBscpMeiHQt
 M9BS+F6XUbAIAbwHSIfPzr211pr1aUGfj8Cuuu8HSzKXyt40Hx9f2zgyPU74JbDHqj96F21Uj2
 WEYEa54d9mGQbGc8HjvITSH1NHL753i+iZzp/0d6yzes3dxYaNkoHx2CAChfs0EOaWIO/khyvr
 So0=
X-SBRS: 2.7
X-MesageID: 18494331
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,437,1583211600"; d="scan'208";a="18494331"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 5/5] gitignore: Ignore golang package directory
Thread-Topic: [PATCH 5/5] gitignore: Ignore golang package directory
Thread-Index: AQHWMFPdiIMBJ2MNy0CkFZ0ooWSGmqi6SAuAgAAbAoCAAA4+gIAAAy4A
Date: Tue, 26 May 2020 16:33:04 +0000
Message-ID: <73E47FDE-098C-4174-8295-5829B9EDA10C@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-6-george.dunlap@citrix.com>
 <24269.8059.28506.353748@mariner.uk.xensource.com>
 <A525D330-BCF9-4998-BEC5-425BA6C26CCF@citrix.com>
 <20200526162141.GA28056@six>
In-Reply-To: <20200526162141.GA28056@six>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D406E16ABB8874AA0B5F826109F8ADA@citrix.com>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Nick
 Rosbrook <rosbrookn@ainfosec.com>, Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI2LCAyMDIwLCBhdCA1OjIxIFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+PiBXaXRoIGdvbGFuZywgeW91IGRvbuKAmXQgcmVh
bGx5IGRpc3RyaWJ1dGUgcGFja2FnZSBiaW5hcmllczsgeW91IG9ubHkgZGlzdHJpYnV0ZSBzb3Vy
Y2UgZmlsZXMuDQo+PiANCj4+IEhvd2V2ZXIsIHdlIGRvbuKAmXQgd2FudCB0byB3YWl0IHVudGls
IHNvbWVvbmUgdHJpZXMgdG8gY2xvbmUgdGhlIHBhY2thZ2UgdG8gc2VlIGlmIHdl4oCZdmUgYnJv
a2VuIHRoZSBidWlsZDsgc28gdGhlIGN1cnJlbnQgbWFrZWZpbGUgZG9lcyBhIOKAnGJ1aWxkIHRl
c3TigJ0gb2YgdGhlIHBhY2thZ2UgZmlsZXMuDQo+PiANCj4+IEJlZm9yZSBnb2xhbmfigJlzIOKA
nG1vZHVsZXPigJ0gZmVhdHVyZSwgdGhlIG9ubHkgd2F5IHRvIGRvIHRoaXMgd2FzIHRvIGhhdmUg
dGhlIGNvZGUgdG8gYnVpbGQgaW5zaWRlICRHT1BBVEgvc3JjLyRQQUNLQUdFTkFNRS4gIFdlIGNh
biBzZXQgR09QQVRIIGJ1dCB3ZSBjYW7igJl0IGNoYW5nZSB0aGUg4oCcc3Jj4oCdIGNvbXBvbmVu
dCBvZiB0aGF0LiAgU28gd2UgdXNlZCB0byBzZXQgR09QQVRIIHRvICRYRU5ST09UL3Rvb2xzL2dv
bGFuZywgcHV0IHRoZSBmaWxlcyBpbiAkWEVOUk9PVC90b29scy9nb2xhbmcvc3JjLyRQQUNLQUdF
TkFNRSwgYW5kIA0KPj4gDQo+PiBXaXRoIHRoZSDigJxtb2R1bGVz4oCdIGZlYXR1cmUsIGNvZGUg
Y2FuIGJlIGJ1aWx0IGFueXdoZXJlOyB0aGUgYnVpbGQgYXQgdGhlIG1vbWVudCBkb2VzbuKAmXQg
cmVxdWlyZSBHT1BBVEguDQo+PiANCj4+IElmIHdl4oCZcmUgd2lsbGluZyB0byBsaW1pdCBvdXJz
ZWx2ZXMgdG8gdXNpbmcgdmVyc2lvbnMgb2YgZ29sYW5nIHdoaWNoIHN1cHBvcnQgbW9kdWxlcyBi
eSBkZWZhdWx0ICgxLjEyKyksIHRoZW4gd2UgY2FuIHByb2JhYmx5IGdldCByaWQgb2YgdGhpcyBi
aXQgaW5zdGVhZC4gIChBbmQgaWYgd2UgZG8gd2FudCB0byBzdXBwb3J0IG9sZGVyIHZlcnNpb25z
LCB3ZSBzaG91bGQgcmVhbGx5IGFkZCBzb21lIGNvZGUgaW4gdGhlIGNvbmZpZ3VyZSBzY3JpcHQg
dG8gZGV0ZXJtaW5lIHdoZXRoZXIgdG8gYnVpbGQgd2l0aCBtb2R1bGVzIG9yIEdPUEFUSC4pDQo+
PiANCj4+IE5pY2ssIGFueSBvcGluaW9ucz8NCj4gDQo+IEkgY2FuJ3QgdGhpbmsgb2YgYSByZWFz
b24gd2UgbmVlZCB0byBzdXBwb3J0IGFueXRoaW5nIG9sZGVyIHRoYW4gZ28NCj4gMS4xMSwgc28g
SSB0aGluayBpdCB3b3VsZCBiZSBmaW5lIHRvIGdldCByaWQgb2YgcmVtbmFudHMgb2YgdGhlIEdP
UEFUSA0KPiBidWlsZC4NCg0KT0ssIEnigJlsbCBzZW5kIGEgcGF0Y2ggdG8gcmVtb3ZlIHRoZSDi
gJxmYWtlIEdPUEFUSCBidWlsZOKAnSBzdXBwb3J0Lg0KDQogLUdlb3JnZQ==

