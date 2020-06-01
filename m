Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A31EA448
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 14:58:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfk0O-0003sW-EW; Mon, 01 Jun 2020 12:57:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/Ow=7O=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jfk0N-0003sR-13
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 12:57:27 +0000
X-Inumbo-ID: 6ffea176-a407-11ea-ab1a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ffea176-a407-11ea-ab1a-12813bfff9fa;
 Mon, 01 Jun 2020 12:57:24 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IF9IhDIb8z5HA63MExg7zcGbq0nBJdNoTHWrunxUYtLJYR+IXGLipaSg+S7ZnIonO0Lr+3scO0
 srRpMHlInlXuv7qVUhviqypG42r7BBAYVzWMMToxHQOUoZBmtXrWCdlXbqQVwb/FJ6r3ao3cad
 0wMWjvtD1iWgRc0se1mtJ41zBoCyvIb9Vpodif4IviotIItwCyC2yu1eC4vheP8J1VbTb7Bc59
 MXjiPVLHfznVXGTNUfegKeK20kqkfvlZLAVy2macqJ9z7EebRH0m+MZgPYNkCaplMcoK93apOX
 Lg8=
X-SBRS: 2.7
X-MesageID: 19171798
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,460,1583211600"; d="scan'208";a="19171798"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Topic: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Index: AQHWND0/xSJFUOR5YU28XikgbPuX46i7+DWAgALLwwCAAANFAIAABtKAgAA4IwCAAAT9gIAAAZ+AgAAlWICABGw3AA==
Date: Mon, 1 Jun 2020 12:57:20 +0000
Message-ID: <EEFCB4D0-9C2F-4527-8445-0FA78DE7285E@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
 <24273.8332.662607.125522@mariner.uk.xensource.com>
 <7eaa7541-f698-b29b-b4b3-1f40fc37c5d7@xen.org>
 <63838ce9-8dbf-aacf-521d-97540758a945@suse.com>
 <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
In-Reply-To: <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <18BC10998DB961448B4DC0AAABF0EEA0@citrix.com>
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI5LCAyMDIwLCBhdCA2OjI0IFBNLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEphbiwNCj4gDQo+IE9uIDI5LzA1LzIwMjAgMTY6MTEs
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjkuMDUuMjAyMCAxNzowNSwgSnVsaWVuIEdyYWxs
IHdyb3RlOg0KPj4+IE9uIDI5LzA1LzIwMjAgMTU6NDcsIElhbiBKYWNrc29uIHdyb3RlOg0KPj4+
PiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIlJlOiBYZW4gWFNNL0ZMQVNLIHBvbGljeSwgZ3J1YiBk
ZWZhdWx0cywgZXRjLiIpOg0KPj4+Pj4gV2hpY2ggaXNu4oCZdCB0byBzYXkgd2Ugc2hvdWxkbuKA
mXQgZG8gaXQ7IGJ1dCBpdCBtaWdodCBiZSBuaWNlIHRvIGFsc28gaGF2ZSBhbiBpbnRlcm1lZGlh
dGUgc29sdXRpb24gdGhhdCB3b3JrcyByaWdodCBub3csIGV2ZW4gaWYgaXTigJlzIG5vdCBvcHRp
bWFsLg0KPj4+PiANCj4+Pj4gSSBwcm9wb3NlIHRoZSBmb2xsb3dpbmcgYmVoYXZpb3VyIGJ5IHVw
ZHN0ZS1ncnViOg0KPj4+PiANCj4+Pj4gICAxLiBMb29rIGZvciBhbiBFTEYgbm90ZSwgVEJELiAg
SWYgaXQncyBmb3VuZCwgbWFrZSBYU00gYm9vdCBlbnRyaWVzLg0KPj4+PiAgICAgIChGb3Igbm93
LCBza2lwIHRoaXMgc3RlcCwgc2luY2UgdGhlIEVMRiBub3RlIGlzIG5vdCBkZWZpbmVkLikNCj4+
PiANCj4+PiBJIGFtIGFmcmFpZCB0aGUgRUxGIG5vdGUgaXMgYSB2ZXJ5IHg4NiB0aGluZy4gT24g
QXJtLCB3ZSBkb24ndCBoYXZlIHN1Y2gNCj4+PiB0aGluZyBmb3IgdGhlIGtlcm5lbC94ZW4gKGFj
dHVhbGx5IHRoZSBmaW5hbCBiaW5hcnkgaXMgbm90IGV2ZW4gYW4gRUxGKS4NCj4+IE91Y2ggLSBv
ZiBjb3Vyc2UuIElzIHRoZXJlIGFueXRoaW5nIHNpbWlsYXIgb25lIGNvdWxkIGVtcGxveSB0aGVy
ZT8NCj4gDQo+IEluIHRoZSBwYXN0LCB3ZSBkaXNjdXNzZWQgYWJvdXQgYWRkaW5nIHN1cHBvcnQg
Zm9yIG5vdGUgaW4gdGhlIHpJbWFnZSAoYXJtMzIga2VybmVsIGZvcm1hdCkgYnV0IEkgbmV2ZXIg
Z290IHRoZSBjaGFuY2UgdG8gcHVyc3VlIHRoZSBkaXNjdXNzaW9uLg0KPiANCj4gV2l0aCBKdWVy
Z2VuJ3MgaHlwZnMgc2VyaWVzLCB0aGUgaHlwZXJ2aXNvciBub3cgZW1iYmVkIHRoZSAuY29uZmln
LiBJcyBpdCBwb3NzaWJsZSB0byBleHRyYWN0IGl0Pw0KDQpUaGUgcHJvYmxlbSBpcyB0aGF0IHVw
ZGF0ZS1ncnViIGRvZXNu4oCZdCB3YW50IHRoZSBjb25maWcgb2YgdGhlICpjdXJyZW50bHkgcnVu
bmluZyogaHlwZXJ2aXNvciwgYnV0IG9mIHdoYXRldmVyIHNwZWNpZmljIGh5cGVydmlzb3IgdGhl
cmUgaXMgaW4gL2Jvb3QuDQoNClNvIGZvciBpbnN0YW5jZSwgd2hlbiBzb21lb25lIGZpcnN0IGRv
ZXMg4oCcYXB0LWdldCBpbnN0YWxsIHhlbuKAnSwgYWZ0ZXIgeGVuIGJpbmFyaWVzIGFyZSBwdXQg
aW4gL2Jvb3QsIHVwZGF0ZS1ncnViIGlzIGNhbGxlZCB0byBtYWtlIG5ldyBlbnRyaWVzIGZvciBp
dC4gIElkZWFsbHksIHdlIHdhbnQgaXQgdG8gY3JlYXRlIEZMQVNLIGdydWIgZW50cmllcywgYW5k
IGJvb3QgdGhlbSBieSBkZWZhdWx0LCBpZiBhbmQgb25seSBpZiAqdGhhdCBYZW4gYmluYXJ5KiBo
YXMgRkxBU0sgZW5hYmxlZCBhbmQgdGhlcmUgaXMgYSBwb2xpY3kgZm9yIGl0LiAgQXQgdGhlIHRp
bWUgdXBkYXRlLWdydWIgcnVucywgWGVuIHdpbGwgbm90IGJlIHJ1bm5pbmcuDQoNCkFuZCBpZiBh
IHVzZXIgaW5zdGFsbHMgc2V2ZXJhbCBYZW4gYmluYXJpZXMsIHNvbWUgb2Ygd2hpY2ggaGF2ZSBG
TEFTSyBlbmFibGVkIGFuZCBzb21lIG9mIHdoaWNoIGRvbuKAmXQsIHdlIHdhbnQgdXBkYXRlLWdy
dWIgdG8gZ2VuZXJhdGUgRkxBU0sgZW50cmllcyBmb3IgdGhlIGJpbmFyaWVzIHRoYXQgaGF2ZSBG
TEFTSyBlbmFibGVkLCBhbmQgbm90IGZvciB0aGUgb25lcyB3aGljaCBkb27igJl0LiAgU28gaHlw
ZnMgaXNu4oCZdCByZWFsbHkgYSBzdWl0YWJsZSBzb2x1dGlvbi4NCg0KVGhlIG9wdGlvbnMgcHJv
cG9zZWQgaGF2ZSBpbmNsdWRlZDoNCg0KMS4gTWFraW5nIHRoZSB0b29scyBub3QgZ2VuZXJhdGUg
YSBGTEFTSyBwb2xpY3kgdW5sZXNzIEZMQVNLIGlzIGVuYWJsZWQgaW4gdGhlIGh5cGVydmlzb3Ig
YmVpbmcgYnVpbHQuICBUaGlzIGlzIGZsYWt5IGJlY2F1c2UgdGhlcmXigJlzIG5vIG5lY2Vzc2Fy
eSBjb25uZWN0aW9uIGJldHdlZW4gdGhlIHR3byBidWlsZHMuDQoNCjIuIFVzaW5nIHRoZSB4ZW4g
Y29uZmlnIGZpbGUgbm9ybWFsbHkgY29waWVkIGludG8gL2Jvb3QuICBUaGlzIHNob3VsZCB3b3Jr
IG5vdywgYnV0IGl04oCZcyBiZWVuIHN1Z2dlc3RlZCB0aGF0IHBhY2thZ2VycyBtYXkgbm90IHdh
bnQgdG8gY29udGludWUgcHV0dGluZyB0aGUgeGVuIGNvbmZpZyBpbiAvYm9vdCBhbG9uZyB3aXRo
IHhlbi5neiwganVzdCBhcyB0aGV54oCZdmUgc3RvcHBlZCBwdXR0aW5nIHRoZSBMaW51eCBjb25m
aWcgaW4gL2Jvb3QgYWxvbmcgd2l0aCB2bWxpbnV6Lg0KDQozLiBNYXJrIHRoZSB4ZW4uZ3ogYmlu
YXJ5IGl0c2VsZiBzb21laG93IGFzIGhhdmluZyBGTEFTSy4gIFRoaXMgY291bGQgd29yayBmb3Ig
eDg2IGluIHRoZSBmdXR1cmUsIGJ1dCB3b27igJl0IHdvcmsgZm9yIGN1cnJlbnQgYmluYXJpZXM7
IGFuZCBpdCBzb3VuZHMgbGlrZSBpdCB3b27igJl0IHdvcmsgZm9yIEFSTSBlaXRoZXIuDQoNClVs
dGltYXRlbHksIEkgaGF2ZSB0aGUgZmVlbGluZyB0aGF0ICMxLCBhbHRob3VnaCBzb21ld2hhdCBh
d2t3YXJkLCBpcyBnb2luZyB0byBiZSB0aGUgYmVzdCBzb2x1dGlvbjogcGFja2FnZXJzIGNhbiBh
cnJhbmdlIHRoYXQgRkxBU0sgcG9saWNpZXMgb25seSBiZSBpbnN0YWxsZWQgd2hlbiBGTEFTSyBw
b2xpY2llcyBhcmUgY3JlYXRlZC4gIFBlb3BsZSBkb2luZyBzZWxmLWJ1aWxkcyBiYXNlZCBvbiBk
aXN0cm8gcGFja2FnZXMgd2lsbCBiZSBjb3ZlcmVkOyBwZW9wbGUgZG9pbmcgaG9tZS1ncm93biBz
ZWxmLWJ1aWxkcyB3aXRoIG5vbi1kZWZhdWx0IEZMQVNLIHNldHRpbmdzIHdpbGwgbmVlZCB0byB0
YWtlIGV4dHJhIGNhcmUgdG8gbWFrZSBzdXJlIHRoZSB0b29scyBkbyB0aGUgcmlnaHQgdGhpbmcu
DQoNCiAtR2Vvcmdl

