Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F092A193827
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 06:52:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHLOZ-00042b-Lu; Thu, 26 Mar 2020 05:49:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ASzm=5L=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHLOY-00042W-5Y
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 05:49:34 +0000
X-Inumbo-ID: 90b1ff2e-6f25-11ea-873f-12813bfff9fa
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90b1ff2e-6f25-11ea-873f-12813bfff9fa;
 Thu, 26 Mar 2020 05:49:32 +0000 (UTC)
IronPort-SDR: whQhljUOC6RsgP0/Y9oL7iKScQLdXO/vp/3dROH7cQK5zPwqbwNXU5GPGDZjfprsuz8/gCWWr7
 rkJreH4+xq9w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 22:49:31 -0700
IronPort-SDR: 4+GAZYuG5F/7DYO+M5gk6QETZozkzh3DeKGPffLG+/8rfPrTqJE4QG2EfvvNj6h7qAJnpeK8EZ
 uy99hvqjzJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="240581640"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga008.fm.intel.com with ESMTP; 25 Mar 2020 22:49:31 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Mar 2020 22:49:30 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.235]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 13:49:27 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/3] x86/nvmx: clarify and fix usage of
 nvmx_update_apicv
Thread-Index: AQHV/urx56O11h2t1UOQYEsoZRnaaKhXQBJw//+/ZACAAIa7cP//kuiAgACHZvD//4g4gABie9pg
Date: Thu, 26 Mar 2020 05:49:27 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA975@SHSMSX104.ccr.corp.intel.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-3-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5B44@SHSMSX104.ccr.corp.intel.com>
 <20200324095052.GF24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E604D@SHSMSX104.ccr.corp.intel.com>
 <20200324112237.GI24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E629A@SHSMSX104.ccr.corp.intel.com>
 <20200324121831.GL24458@Air-de-Roger.citrite.net>
In-Reply-To: <20200324121831.GL24458@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/3] x86/nvmx: clarify and fix usage of
 nvmx_update_apicv
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
VHVlc2RheSwgTWFyY2ggMjQsIDIwMjAgODoxOSBQTQ0KPiANCj4gT24gVHVlLCBNYXIgMjQsIDIw
MjAgYXQgMTE6MzM6MDBBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPiBGcm9tOiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNk
YXksIE1hcmNoIDI0LCAyMDIwIDc6MjMgUE0NCj4gPiA+DQo+ID4gPiBPbiBUdWUsIE1hciAyNCwg
MjAyMCBhdCAxMDoxMToxNUFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPiA+ID4gPiBG
cm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiA+ID4gPiBT
ZW50OiBUdWVzZGF5LCBNYXJjaCAyNCwgMjAyMCA1OjUxIFBNDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBPbiBUdWUsIE1hciAyNCwgMjAyMCBhdCAwNjowMzoyOEFNICswMDAwLCBUaWFuLCBLZXZpbiB3
cm90ZToNCj4gPiA+ID4gPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4gPiA+ID4gPiA+ID4gU2VudDogU2F0dXJkYXksIE1hcmNoIDIxLCAyMDIwIDM6
MDggQU0NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gVGhlIGN1cnJlbnQgdXNhZ2Ugb2Yg
bnZteF91cGRhdGVfYXBpY3YgaXMgbm90IGNsZWFyOiBpdCBpcyBkZWVwbHkNCj4gPiA+ID4gPiA+
ID4gaW50ZXJ0d2luZWQgd2l0aCB0aGUgQWNrIGludGVycnVwdCBvbiBleGl0IFZNRVhJVCBjb250
cm9sLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGUgY29kZSBpbiBudm14X3VwZGF0
ZV9hcGljdiBzaG91bGQgdXBkYXRlIHRoZSBTVkkgKGluIHNlcnZpY2UNCj4gPiA+ID4gPiBpbnRl
cnJ1cHQpDQo+ID4gPiA+ID4gPiA+IGZpZWxkIG9mIHRoZSBndWVzdCBpbnRlcnJ1cHQgc3RhdHVz
IG9ubHkgd2hlbiB0aGUgQWNrIGludGVycnVwdCBvbg0KPiA+ID4gPiA+ID4gPiBleGl0IGlzIHNl
dCwgYXMgaXQgaXMgdXNlZCB0byByZWNvcmQgdGhhdCB0aGUgaW50ZXJydXB0IGJlaW5nDQo+ID4g
PiA+ID4gPiA+IHNlcnZpY2VkIGlzIHNpZ25hbGVkIGluIGEgdm1jcyBmaWVsZCwgYW5kIGhlbmNl
IGhhc24ndCBiZWVuIGluamVjdGVkDQo+ID4gPiA+ID4gPiA+IGFzIG9uIG5hdGl2ZS4gSXQncyBp
bXBvcnRhbnQgdG8gcmVjb3JkIHRoZSBjdXJyZW50IGluIHNlcnZpY2UNCj4gPiA+ID4gPiA+ID4g
aW50ZXJydXB0IG9uIHRoZSBndWVzdCBpbnRlcnJ1cHQgc3RhdHVzIGZpZWxkLCBvciBlbHNlIGZ1
cnRoZXINCj4gPiA+ID4gPiA+ID4gaW50ZXJydXB0cyB3b24ndCByZXNwZWN0IHRoZSBwcmlvcml0
eSBvZiB0aGUgaW4gc2VydmljZSBvbmUuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFdo
aWxlIGNsYXJpZnlpbmcgdGhlIHVzYWdlIG1ha2Ugc3VyZSB0aGF0IHRoZSBTVkkgaXMgb25seSB1
cGRhdGVkDQo+ID4gPiB3aGVuDQo+ID4gPiA+ID4gPiA+IEFjayBvbiBleGl0IGlzIHNldCBhbmQg
dGhlIG5lc3RlZCB2bWNzIGludGVycnVwdCBpbmZvIGZpZWxkIGlzIHZhbGlkLg0KPiBPcg0KPiA+
ID4gPiA+ID4gPiBlbHNlIGEgZ3Vlc3Qgbm90IHVzaW5nIHRoZSBBY2sgb24gZXhpdCBmZWF0dXJl
IHdvdWxkIGxvb3NlDQo+IGludGVycnVwdHMNCj4gPiA+IGFzDQo+ID4gPiA+ID4gPiA+IHRoZXkg
d291bGQgYmUgc2lnbmFsZWQgYXMgYmVpbmcgaW4gc2VydmljZSBvbiB0aGUgZ3Vlc3QgaW50ZXJy
dXB0DQo+ID4gPiA+ID4gPiA+IHN0YXR1cyBmaWVsZCBidXQgd29uJ3QgYWN0dWFsbHkgYmUgcmVj
b3JkZWQgb24gdGhlIGludGVycnVwdCBpbmZvDQo+IHZtY3MNCj4gPiA+ID4gPiA+ID4gZmllbGQs
IG5laXRoZXIgaW5qZWN0ZWQgaW4gYW55IG90aGVyIHdheS4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBJdCBpcyBpbnN1ZmZpY2llbnQuIFlvdSBhbHNvIG5lZWQgdG8gdXBkYXRlIFJWSSB0byBl
bmFibGUgdmlydHVhbA0KPiBpbmplY3Rpb24NCj4gPiA+ID4gPiA+IHdoZW4gQWNrIG9uIGV4aXQg
aXMgY2xlYXJlZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEJ1dCBSVkkgc2hvdWxkIGJlIHVwZGF0
ZWQgaW4gdm14X2ludHJfYXNzaXN0IGluIHRoYXQgY2FzZSwgc2luY2UNCj4gPiA+ID4gPiBudm14
X2ludHJfaW50ZXJjZXB0IHNob3VsZG4ndCBpbnRlcmNlcHQgdGhlIGludGVycnVwdCwgYXMgaXQg
c2hvdWxkIGJlDQo+ID4gPiA+ID4gaGFuZGxlZCBub3JtYWxseS4NCj4gPiA+ID4NCj4gPiA+ID4g
QXMgd2UgZGlzY3Vzc2VkIGJlZm9yZSwgdm14X2ludHJfYXNzaXN0IGlzIGludm9rZWQgYmVmb3Jl
DQo+ID4gPiBudm14X3N3aXRjaF9ndWVzdC4NCj4gPiA+ID4NCj4gPiA+ID4gSXQgaXMgaW5jb3Jy
ZWN0bHkgdG8gdXBkYXRlIFJWSSBhdCB0aGF0IHRpbWUgc2luY2UgaXQgbWlnaHQgYmUgc3RpbGwg
dm1jczAyDQo+ID4gPiBiZWluZw0KPiA+ID4gPiBhY3RpdmUgKGlmIG5vIHBlbmRpbmcgc29mdGly
cSB0byBtYWtlIGl0IGludm9rZWQgYWdhaW4pLg0KPiA+ID4gPg0KPiA+ID4gPiBBbHNvIG52bXhf
aW50cl9pbnRlcmNlcHQgZG9lcyBpbnRlcmNlcHQgQWNrLW9uLWV4aXQ9MCBjYXNlOg0KPiA+ID4g
Pg0KPiA+ID4gPiAgICAgICAgIGlmICggaW50YWNrLnNvdXJjZSA9PSBodm1faW50c3JjX3BpYyB8
fA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgIGludGFjay5zb3VyY2UgPT0gaHZtX2ludHNyY19s
YXBpYyApDQo+IA0KPiBJJ3ZlIHJlYWxpemVkIHRoYXQgbnZteF9pbnRyX2ludGVyY2VwdCB3aWxs
IHJldHVybiAxIGZvciBpbnRlcnJ1cHRzDQo+IG9yaWdpbmF0aW5nIGZyb20gdGhlIGxhcGljIG9y
IHRoZSBwaWMsIHdoaWxlIG52bXhfdXBkYXRlX2FwaWN2IHdpbGwNCj4gb25seSB1cGRhdGUgR1VF
U1RfSU5UUl9TVEFUVVMgZm9yIGludGVycnVwdHMgb3JpZ2luYXRpbmcgZnJvbSB0aGUNCj4gbGFw
aWMuIElzIHRoaXMgY29ycmVjdD8NCg0KSXNuJ3QgYXBpY3YgZm9yIHZpcnR1YWwgbGFwaWMgaW5z
dGVhZCBvZiB2aXJ0dWFsIHBpYz8NCg0KPiANCj4gU2hvdWxkbid0IGJvdGggYmUgaW4gc3luYyBh
bmQgaGFuZGxlIHRoZSBzYW1lIGludGVycnVwdCBzb3VyY2VzPw0KPiANCg0KQnV0IEkgZG8gcmVh
bGl6ZSBvbmUgcG90ZW50aWFsIGlzc3VlIGFib3V0IDY3ZjlkMGI5LCB3aGljaCBtYXkgYnJlYWsN
CnZwaWMgZGVsaXZlcnkgd2hlbiBhY2stb24tZXhpdCBpcyBvZmYuIFdlIHNob3VsZCBhbHdheXMg
dXNlIGludGVycnVwdA0Kd2luZG93IHRvIGhhbmRsZSB0aGF0IHNpdHVhdGlvbiBmb3IgdnBpYy4g
U29ycnkgSSBkaWRuJ3QgY2F0Y2ggaXQgd2hlbg0KcHJvcG9zaW5nIHRoYXQgY2hhbmdlLi4uDQoN
ClRoYW5rcw0KS2V2aW4NCg==

