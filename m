Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43E194F12
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 03:33:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHelL-000725-M4; Fri, 27 Mar 2020 02:30:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WxMQ=5M=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHelL-000720-0n
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 02:30:23 +0000
X-Inumbo-ID: e7629eac-6fd2-11ea-92cf-bc764e2007e4
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7629eac-6fd2-11ea-92cf-bc764e2007e4;
 Fri, 27 Mar 2020 02:30:21 +0000 (UTC)
IronPort-SDR: xSaHpTk93e6Esr5Q7yI5BjuRoKBU6UdNfMNeKjHuMRe5dF6c9Rw0HHF0lAFUgLKFPDLT3A0Bed
 3xhETz/vRb0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 19:30:20 -0700
IronPort-SDR: eDgPGQzIUVhWozl+i5XmFm6ejQaQGeWomdaw3TnUdg4Qjg585N7MOwIaLDjING+t351SYqgN0W
 8PbTeTIHnOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; d="scan'208";a="271404785"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga004.fm.intel.com with ESMTP; 26 Mar 2020 19:30:19 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 19:30:19 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 19:30:19 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Fri, 27 Mar 2020 10:30:15 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Isaila Alexandru <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V6] x86/altp2m: Hypercall to set altp2m view visibility
Thread-Index: AQHV8VaFWzT4PZYI70qii0UzQw6fbqhBGkMQgBYP0gCABLEbAA==
Date: Fri, 27 Mar 2020 02:30:15 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECA76@SHSMSX104.ccr.corp.intel.com>
References: <20200303122240.27013-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5B06@SHSMSX104.ccr.corp.intel.com>
 <449a58ea-e168-6c1a-33f2-7efa0b9f5a7d@bitdefender.com>
In-Reply-To: <449a58ea-e168-6c1a-33f2-7efa0b9f5a7d@bitdefender.com>
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
Subject: Re: [Xen-devel] [PATCH V6] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBJc2FpbGEgQWxleGFuZHJ1IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCj4gU2Vu
dDogVHVlc2RheSwgTWFyY2ggMjQsIDIwMjAgNjo0NiBQTQ0KPiANCj4gDQo+IEhpIEtldmluIGFu
ZCBzb3JyeSBmb3IgdGhlIGxvbmcgcmVwbHkgdGltZSwNCj4gDQo+IE9uIDEwLjAzLjIwMjAgMDQ6
MDQsICBzVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEFsZXhhbmRydSBTdGVmYW4gSVNB
SUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgTWFyY2gg
MywgMjAyMCA4OjIzIFBNDQo+ID4+DQo+ID4+IEF0IHRoaXMgbW9tZW50IGEgZ3Vlc3QgY2FuIGNh
bGwgdm1mdW5jIHRvIGNoYW5nZSB0aGUgYWx0cDJtIHZpZXcuIFRoaXMNCj4gPj4gc2hvdWxkIGJl
IGxpbWl0ZWQgaW4gb3JkZXIgdG8gYXZvaWQgYW55IHVud2FudGVkIHZpZXcgc3dpdGNoLg0KPiA+
DQo+ID4gSSBsb29rIGZvcndhcmQgdG8gbW9yZSBlbGFib3JhdGlvbiBvZiB0aGUgbW90aXZhdGlv
biwgZXNwZWNpYWxseSBmb3Igb25lDQo+ID4gd2hvIGRvZXNuJ3QgdHJhY2sgYWx0cDJtIGNsb3Nl
bHkgbGlrZSBtZS4gRm9yIGV4YW1wbGUsIGRvX2FsdHAybV9vcA0KPiA+IG1lbnRpb25zIHRocmVl
IG1vZGVzOiBleHRlcm5hbCwgaW50ZXJuYWwsIGNvb3JkaW5hdGVkLiBUaGVuIGlzIHRoaXMgcGF0
Y2gNCj4gPiB0cnlpbmcgdG8gbGltaXQgdGhlIHZpZXcgc3dpdGNoIGluIGFsbCB0aHJlZSBtb2Rl
cyBvciBqdXN0IG9uZSBvZiB0aGVtPw0KPiA+IGZyb20gdGhlIGRlZmluaXRpb24gY2xlYXJseSBl
eHRlcm5hbCBkaXNhbGxvd3MgZ3Vlc3QgdG8gY2hhbmdlIGFueSB2aWV3DQo+ID4gKHRoZW4gd2h5
IGRvIHdlIHdhbnQgcGVyLXZpZXcgdmlzaWJpbGl0eSBjb250cm9sKSB3aGlsZSB0aGUgbGF0dGVy
IHR3bw0KPiA+IGJvdGggYWxsb3dzIGd1ZXN0IHRvIHN3aXRjaCB0aGUgdmlldy4gbGF0ZXIgeW91
IG5vdGVkIHNvbWUgZXhjZXB0aW9uDQo+ID4gd2l0aCBtaXhlZCAoaW50ZXJuYWwpIG1vZGUuIHRo
ZW4gaXMgdGhpcyByZXN0cmljdGlvbiBwdXNoZWQganVzdCBmb3INCj4gPiBsaW1pdGVkIChjb29y
ZGluYXRlZCkgbW9kZT8NCj4gPg0KPiANCj4gQXMgeW91IHN0YXRlZCwgdGhlcmUgYXJlIHNvbWUg
ZXhjZXB0aW9ucyB3aXRoIG1peGVkIChpbnRlcm5hbCkgbW9kZS4NCj4gVGhpcyByZXN0cmljdGlv
biBpcyBjbGVhcmx5IHVzZWQgZm9yIGNvb3JkaW5hdGVkIG1vZGUgYnV0IGl0IGFsc28NCj4gcmVz
dHJpY3RzIHZpZXcgc3dpdGNoaW5nIGluIHRoZSBleHRlcm5hbCBtb2RlIGFzIHdlbGwuIEkgaGFk
IGEgZ29vZA0KPiBleGFtcGxlIHRvIHN0YXJ0IHdpdGgsIGxldCdzIHNheSB3ZSBoYXZlIG9uZSBl
eHRlcm5hbCBhZ2VudCBpbiBkb20wIHRoYXQNCj4gdXNlcyB2aWV3MSBhbmQgdmlldzIgYW5kIHRo
ZSBsb2dpYyByZXF1aXJlcyB0aGUgc3dpdGNoIGJldHdlZW4gdGhlDQo+IHZpZXdzLiBBdCB0aGlz
IHBvaW50IFZNRlVOQyBpcyBhdmFpbGFibGUgdG8gdGhlIGd1ZXN0IHNvIHdpdGggYSBzaW1wbGUN
Cj4gYXNtIGNvZGUgaXQgY2FuIHdpdGNoIHRvIHZpZXcgMC4gQXQgdGhpcyB0aW1lIHRoZSBleHRl
cm5hbCBhZ2VudCBpcyBub3QNCj4gYXdhcmUgdGhhdCB0aGUgdmlldyBoYXMgc3dpdGNoZWQgYW5k
IGZ1cnRoZXIgbW9yZSB2aWV3MCB3YXMgbm90IHN1cHBvc2VkDQo+IHRvIGJlIGluIHRoZSBtYWlu
IGxvZ2ljIHNvIGl0IGNyYXNoZXMuIFRoaXMgZXhhbXBsZSBjYW4gYmUgZXh0ZW5kZWQgdG8NCj4g
YW55IG51bWJlciBvZiB2aWV3cy4gSSBob3BlIGl0IGNhbiBwYWludCBhIG1vcmUgY2xlYXIgcGlj
dHVyZSBvZiB3aGF0DQo+IHRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvIGFjaGl2ZS4NCg0KQ2FuIFZN
RlVOQyBiZSBoaWRkZW4gYW5kIGRpc2FibGVkIHdoZW4gZXh0ZXJuYWwgbW9kZSBpcyBiZWluZyB1
c2VkPw0Kb3IgaXMgaXQgYmVjYXVzZSB0aGUgbW9kZSBjYW4gYmUgZHluYW1pY2FsbHkgc3dpdGNo
ZWQgYWZ0ZXIgYSBWTSBpcyANCmxhdW5jaGVkIHNvIHlvdSBoYXZlIHRvIHJlc3RyaWN0IHRoZSB2
aWV3cyBpbiB0aGlzIHdheT8NCg0KPiANCj4gPiBidHcgSSdtIG5vdCBzdXJlIHdoeSBhbHRwMm0g
aW52ZW50cyB0d28gbmFtZXMgcGVyIG1vZGUsIGFuZCB0aGVpcg0KPiA+IG1hcHBpbmcgbG9va3Mg
YSBiaXQgd2VpcmQuIGUuZy4gaXNuJ3QgJ2Nvb3JkaW5hdGVkJyBtb2RlIHNvdW5kIG1vcmUNCj4g
PiBsaWtlICdtaXhlZCcgbW9kZT8NCj4gDQo+IFllcyB0aGF0IGlzIHRydWUsIGl0IHNpIGEgYml0
IHdlaXJkLg0KPiANCj4gPg0KPiA+Pg0KPiA+PiBUaGUgbmV3IHhjX2FsdHAybV9zZXRfdmlzaWJp
bGl0eSgpIHNvbHZlcyB0aGlzIGJ5IG1ha2luZyB2aWV3cyBpbnZpc2libGUNCj4gPj4gdG8gdm1m
dW5jLg0KPiA+DQo+ID4gaWYgb25lIGRvZXNuJ3Qgd2FudCB0byBtYWtlIHZpZXcgdmlzaWJsZSB0
byB2bWZ1bmMsIHdoeSBjYW4ndCBoZSBqdXN0DQo+ID4gYXZvaWRzIHJlZ2lzdGVyaW5nIHRoZSB2
aWV3IGF0IHRoZSBmaXJzdCBwbGFjZT8gQXJlIHlvdSBhaW1pbmcgZm9yIGENCj4gPiBzY2VuYXJp
byB0aGF0IGRvbTAgbWF5IHJlZ2lzdGVyIDEwIHZpZXdzLCB3aXRoIDUgdmlld3MgdmlzaWJsZSB0
bw0KPiA+IHZtZnVuYyB3aXRoIHRoZSBvdGhlciA1IHZpZXdzIHN3aXRjaGVkIGJ5IGRvbTAgaXRz
ZWxmPw0KPiANCj4gVGhhdCBpcyBvbmUgc2NlbmFyaW8sIGFub3RoZXIgY2FuIGJlIHRoYXQgZG9t
MCBoYXMgYSBudW1iZXIgb2Ygdmlld3MNCj4gY3JlYXRlZCBhbmQgaW4gc29tZSB0aW1lIGl0IHdh
bnRzIHRvIGJlIHN1cmUgdGhhdCBvbmx5IHNvbWUgb2YgdGhlIHZpZXdzDQo+IGNhbiBiZSBzd2l0
Y2hlZCwgc2F2aW5nIHRoZSByZXN0IGFuZCBtYWtpbmcgdGhlbSB2aXNpYmxlIHdoZW4gdGhlIHRp
bWUNCj4gaXMgcmlnaHQuIFN1cmUgdGhlIGV4YW1wbGUgZ2l2ZW4gdXAgaXMgYW5vdGhlciBleGFt
cGxlLg0KPiANCg0KQ2FuIHlvdSB1cGRhdGUgdGhlIHBhdGNoIGRlc2NyaXB0aW9uIGFuZCByZXNl
bmQ/IEknbGwgdGFrZSBhbm90aGVyIGxvb2sgdGhlbi4NCg0KVGhhbmtzDQpLZXZpbg0K

