Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7FF225BCA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 11:37:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxSDe-0005D8-9f; Mon, 20 Jul 2020 09:36:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WdHU=A7=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1jxSDb-0005D3-Ue
 for xen-devel@lists.xen.org; Mon, 20 Jul 2020 09:36:19 +0000
X-Inumbo-ID: 76ee6292-ca6c-11ea-9f74-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76ee6292-ca6c-11ea-9f74-12813bfff9fa;
 Mon, 20 Jul 2020 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595237780;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JuuOUPIbdc96C0yQXLEYT6jO3VJLVFmxpWCcRtyTcik=;
 b=aIocrVwF3Bb9svjBoWyEsgwRsIEmQYMPOSPMhdOjNaXg5iMTWHKc0hG4
 lUPFpKSvlLcR/la91X0+H2aMVwNnBRgSKW+uc3x905LdfG8FezA/RbOIY
 9LwkvIHAxPWWuhdm7vozbIKOnwo7oSysy3+kDreA/QYnmEW+OHHvJRiwr M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ixA9MUFesw9e9JnxG/CkniUjmcHiGLcnbO9NrXMot3BiY8LZTWoKCRWPSlLFrkcnBQZ60StMw2
 0ipFci8hipUoPcvSw/WnSGqLLhyFHxLU4MHGqB7FTdT288adl+26QVgHVdX89oWQUlb/uycXhh
 X/KnsvTH+SNBByVODdEq6sfdGmABAmgjwaf2NwzIMJFnC+TByu72baAKIscYmsALb5rtEtM3xW
 9AbMwpT/YlqnHwk2IXk6m2kyFqAIdibcJwheOrJ5qqQIkWHFsNQ405cQmxWIXkk3wjqHgNHIqs
 aTI=
X-SBRS: 2.7
X-MesageID: 22736990
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="22736990"
From: Edwin Torok <edvin.torok@citrix.com>
To: "ehem+xen@m5p.com" <ehem+xen@m5p.com>, Christian Lindig
 <christian.lindig@citrix.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
Subject: Re: [PATCH 2/2] tools/ocaml: Default to useful build output
Thread-Topic: [PATCH 2/2] tools/ocaml: Default to useful build output
Thread-Index: AQHWXLQfZqk/9n2Ez0iUq9XU56BN2qkQJXHN///yCwA=
Date: Mon, 20 Jul 2020 09:36:14 +0000
Message-ID: <db4207051ac4ff18ab876e55bca9041b729daba6.camel@citrix.com>
References: <20200718033242.GB88869@mattapan.m5p.com>
 <1595234320493.39632@citrix.com>
In-Reply-To: <1595234320493.39632@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <55135C5AD82C224D8EA57CB5896094F3@citrix.com>
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "wl@xen.org" <wl@xen.org>,
 "dave@recoil.org" <dave@recoil.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDIwLTA3LTIwIGF0IDEwOjM4ICswMjAwLCBDaHJpc3RpYW4gTGluZGlnIHdyb3Rl
Og0KPiA+IFRpbWUgZm9yIGEgYml0IG9mIGNvbnRyb3ZlcnN5Lg0KPiANCj4gT0NhbWwgb3V0c2lk
ZSBYZW4gaGFzIG1vdmVkIHRvIGEgZGlmZmVyZW50IG1vZGVsIG9mIGJ1aWxkaW5nIGJhc2VkIG9u
DQo+IGR1bmUgd2hpY2ggaXMgZmFzdCwgZGVjbGFyYXRpdmUgYW5kIHJlbGlhYmxlLiBUaGUgT0Nh
bWwgeGVuc3RvcmUgaXMNCj4gc3RhZ25hdGluZyBiZWNhdXNlIG5vYm9keSB3aXRoIE9DYW1sIGV4
cGVyaWVuY2Ugd2FudHMgdG8gdG91Y2ggaXQNCj4gYW55bW9yZS4gSXQgd291bGQgYmUgYmVuZWZp
Y2lhbCBmb3IgdGhlIGhlYWx0aCBvZiB0aGUgT0NhbWwgeGVuc3RvcmUNCj4gdG8gc3BsaXQgaXQg
b3V0IHN1Y2ggdGhhdCBpdCBjb3VsZCBiZSB3b3JrZWQgb24gaW5kZXBlbmRlbnRseS4NCg0KQUZB
SUsgdGhlcmUgYXJlIDIgdW5zdGFibGUgaW50ZXJmYWNlcyB1c2VkIGJ5IG94ZW5zdG9yZWQsIGRl
Y291cGxpbmcgaXQNCndvdWxkIG1ha2UgdGhlIHZlcnNpb24gb2Ygb3hlbnN0b3JlZCBtb3JlIGlu
ZGVwZW5kZW50IGZyb20gdGhlIHZlcnNpb24NCm9mIGh5cGVydmlzb3I6IA0KaHR0cHM6Ly9hbmRy
ZXdjb29wLXhlbi5yZWFkdGhlZG9jcy5pby9lbi9kb2NzLWRldmVsL21pc2MvdGVjaC1kZWJ0Lmh0
bWwjcmVtb3ZlLXhlbnN0b3JlZC1zLWRlcGVuZGVuY2llcy1vbi11bnN0YWJsZS1pbnRlcmZhY2Vz
DQpJSVVDIHRoaXMgd291bGQgYWxzbyBhbGxvdyBzb21lIGNvZGUgdG8gYmUgZHJvcGVkIGZyb20g
dGhlIGh5cGVydmlzb3INCndoZXJlIG94ZW5zdG9yZWQgaXMgdGhlIGxhc3QgdXNlciBvZiB0aGUg
dW5zdGFibGUgaW50ZXJmYWNlLg0KDQo+ICBZb3UgbWlnaHQgYXJndWUgdGhhdCBNYWtlIGlzIHN0
aWxsIGFwcHJvcHJpYXRlIGZvciBidWlsZGluZyBPQ2FtbA0KPiBwcm9qZWN0cyBidXQgdGhlIE9D
YW1sIGNvbW11bml0eSBoYXMgbW92ZWQgdGhyb3VnaCBzZXZlcmFsIGJ1aWxkDQo+IHN5c3RlbXMs
IHN0YXJ0aW5nIGZyb20gTWFrZSwgYW5kIGxlYXJuZWQgdGhlIGhhcmQgd2F5IHRoYXQgdGhpcyBp
cw0KPiBub3QgYW4gZWFzeSBwcm9ibGVtLiBBZnRlciB5ZWFycyBvZiBtb3JlLW9yLWxlc3Mgc3Vj
Y2Vzc2Z1bCBidWlsZA0KPiBzeXN0ZW0gdGhlIGNvbnNlbnN1cyBpcyB0aGF0IGR1bmUgaXMgcmln
aHQgb25lIGFuZCBpdCBoYXMgcmVzdWx0ZWQgaW4NCj4gY29tYmluYXRpb24gd2l0aCB0aGUgT3Bh
bSBwYWNrYWdlIG1hbmFnZXIgdGhlIGVjb3N5c3RlbSB0byBmbG91cmlzaC4NCj4gQWx0ZXJuYXRp
dmVseSwgaXQgd291bGQgYmUgcG9zc2libGUgdG8gbW92ZSBPQ2FtbCB4ZW5zdG9yZSB0byBkdW5l
DQo+IHdpdGhpbiB0aGUgWGVuIHRyZWUgYnV0IGl0IHdvdWxkIGNyZWF0ZSBhIGRlcGVuZGVuY3kg
b24gaXQuDQoNCkknZCB3ZWxjb21lIGEgRHVuZSBiYXNlZCBidWlsZC1zeXN0ZW0uDQoNClRoZSBj
dXJyZW50IE1ha2VmaWxlIGJhc2VkIGJ1aWxkLXN5c3RlbSBkb2Vzbid0IGhhbmRsZSBkZXBlbmRl
bmNpZXMNCmNvcnJlY3RseSBmb3IgaW5jcmVtZW50YWwgZGV2ZWxvcG1lbnQ6IEkgb2Z0ZW4gaGF2
ZSB0byBydW4gJ21ha2UgY2xlYW4nDQppbiBvcmRlciB0byBzdWNjZXNzZnVsbHkgYnVpbGQgeGVu
c3RvcmVkIGFmdGVyIGNoYW5naW5nIGFuIC5tbCBmaWxlLA0Kb3RoZXJ3aXNlIHRoZSBsaW5rZXIg
ZmFpbHMgd2l0aCAnaW5jb25zaXN0ZW50IGFzc3VtcHRpb25zIG92ZXINCmludGVyZmFjZScsIGlu
ZGljYXRpbmcgdGhhdCBNYWtlIGhhc24ndCByZWJ1aWx0IHNvbWV0aGluZyB0aGF0IGl0DQpzaG91
bGQgaGF2ZS4gKEZvciB0aG9zZSB1bmZhbWlsaWFyIHdpdGggdGhpcyBpc3N1ZSwgc2VlIHRoZQ0K
J01vdGl2YXRpb24nIHNlY3Rpb24gaW4gDQpodHRwczovL25pY29sYXNwb3VpbGxhcmQuZnIvb2Nh
bWxidWlsZC9vY2FtbGJ1aWxkLXVzZXItZ3VpZGUuaHRtbCkNCkl0IGFsc28gbGFja3MgZ2VuZXJh
dGlvbiBvZiAubWVybGluIGZpbGVzIChmb3IgZWRpdG9yIGludGVncmF0aW9uLCBlLmcuDQpWaW0g
b3IgRW1hY3MpLCB3aGljaCB5b3UgZ2V0IGZvciBmcmVlIHdpdGggRHVuZS4NCg0KV2UgY291bGQg
c3RpbGwgcmV0YWluIGEgTWFrZWZpbGUgYXMgYW4gZW50cnlwb2ludCB0aGF0IGxhdW5jaGVzIER1
bmUNCndpdGggYXBwcm9wcmlhdGUgZmxhZ3MsIHdoaWNoIGFzaWRlIGZyb20gYWRkaW5nIGEgYnVp
bGQgcmVxdWlyZW1lbnQgb24NCkR1bmUgd291bGRuJ3QgcmVxdWlyZSBjaGFuZ2VzIHRvIHBhY2th
Z2UgYnVpbGRpbmcuDQoNCkkgdGhpbmsgYSBuaWNlIHdheSBmb3J3YXJkIGhlcmUgd291bGQgYmUg
dG8gdHJ5IHRvIHdyaXRlIGEgbWluaW1hbA0KYmluZGluZyB0byBnbnR0YWIgdG8gcmVwbGljYXRl
IA0KaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXRkaWZm
O2g9MzhlZWIzODY0ZCBpbg0KT0NhbWwsIHRoaXMgd291bGQgYm90aCBkZW1vbnN0cmF0ZSB0aGUg
YmVuZWZpdHMgb2YgRHVuZSAobWFraW5nDQpjb250cmlidXRpb24gZWFzaWVyKSwgYW5kIHJlZHVj
ZSB0ZWNobmljYWwgZGVidCB3aXRoaW4gWGVuLg0KDQpCZXN0IHJlZ2FyZHMsDQotLUVkd2luDQoN
Cg==

