Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40933106E40
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 12:07:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY6jx-0001jS-0X; Fri, 22 Nov 2019 11:04:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6SD+=ZO=amazon.com=prvs=222105d68=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iY6jv-0001jM-G1
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 11:04:39 +0000
X-Inumbo-ID: de6e8cf2-0d17-11ea-9631-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de6e8cf2-0d17-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574420676; x=1605956676;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zh9u5wZSI6JQnKpPBs0NJ7Bz0BP358JSP8CdIft7EGo=;
 b=NVdJdplnx6D4gctY/VYF6x0ox4JsvZpHORfwl48OmL0QiPYQ0/7ugJ99
 1nw8SKUbkPFUUAlEQNkXOwbbpkl07GYQhO3qAiOllNwu2ooSicozPGIz8
 RWbjJ3YgbSOp1AeYFYkgtxY0pWIGQOTlpvKFRpwscfkZ8K0Zer4BR2SpH g=;
IronPort-SDR: Pemx2pK21B68xY528Ma8eh2u5aT0V3YeICLDg7h/5txhzDrSPR40P4cNmWUDY17HNzDHSZgBLV
 gjAW5mkXpQVA==
X-IronPort-AV: E=Sophos;i="5.69,229,1571702400"; 
   d="scan'208";a="5317764"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 22 Nov 2019 11:04:34 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7F084241748; Fri, 22 Nov 2019 11:04:32 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 22 Nov 2019 11:04:31 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 22 Nov 2019 11:04:31 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 22 Nov 2019 11:04:31 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 7/8] x86: be more verbose when running on
 a hypervisor
Thread-Index: AQHVoJzVCNe0iXau6UuZHmPU2CahoaeXB7Vw
Date: Fri, 22 Nov 2019 11:04:30 +0000
Message-ID: <6b639b3453474af1a22f2055057d09b5@EX13D32EUC003.ant.amazon.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-8-liuwe@microsoft.com>
In-Reply-To: <20191121185049.16666-8-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.33]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 7/8] x86: be more verbose when running on
 a hypervisor
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAyMSBOb3ZlbWJlciAyMDE5IDE5OjUxDQo+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlz
dCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBDYzogV2VpIExpdSA8bGl1d2VA
bWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyDQo+IDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jv
c29mdC5jb20+OyBKYW4NCj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BB
VENIIHY0IDcvOF0geDg2OiBiZSBtb3JlIHZlcmJvc2Ugd2hlbiBydW5uaW5nIG9uIGENCj4gaHlw
ZXJ2aXNvcg0KPiANCj4gQWxzbyByZXBsYWNlIHhlbl9ndWVzdCB3aXRoIHJ1bm5pbmdfb25faHlw
ZXJ2aXNvciBib29sZWFuLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjQ6DQo+IDEuIEFjY2VzcyAtPm5hbWUg
ZGlyZWN0bHkuDQo+IDIuIERyb3AgUm9nZXIncyByZXZpZXcgdGFnLg0KPiAtLS0NCj4gIHhlbi9h
cmNoL3g4Ni9zZXR1cC5jIHwgNyArKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9z
ZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMNCj4gaW5kZXggMTk2MDZkOTA5Yi4uMTIzNDM2
YjM1YSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMNCj4gKysrIGIveGVuL2Fy
Y2gveDg2L3NldHVwLmMNCj4gQEAgLTY4OSw2ICs2ODksNyBAQCB2b2lkIF9faW5pdCBub3JldHVy
biBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQ0KPiAgICAgIGludCBpLCBqLCBlODIw
X3dhcm4gPSAwLCBieXRlcyA9IDA7DQo+ICAgICAgYm9vbCBhY3BpX2Jvb3RfdGFibGVfaW5pdF9k
b25lID0gZmFsc2UsIHJlbG9jYXRlZCA9IGZhbHNlOw0KPiAgICAgIGludCByZXQ7DQo+ICsgICAg
Ym9vbCBydW5uaW5nX29uX2h5cGVydmlzb3I7DQoNCldoeSBub3Qgc3Rhc2ggaG9wcyBoZXJlPyBU
aGVuIHlvdSBjYW4uLi4NCg0KPiAgICAgIHN0cnVjdCBuczE2NTUwX2RlZmF1bHRzIG5zMTY1NTAg
PSB7DQo+ICAgICAgICAgIC5kYXRhX2JpdHMgPSA4LA0KPiAgICAgICAgICAucGFyaXR5ICAgID0g
J24nLA0KPiBAQCAtNzYzLDcgKzc2NCw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRf
eGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApDQo+ICAgICAgICogYWxsb2NpbmcgYW55IHhlbmhlYXAg
c3RydWN0dXJlcyB3YW50ZWQgaW4gbG93ZXIgbWVtb3J5LiAqLw0KPiAgICAgIGtleGVjX2Vhcmx5
X2NhbGN1bGF0aW9ucygpOw0KPiANCj4gLSAgICBoeXBlcnZpc29yX3Byb2JlKCk7DQo+ICsgICAg
cnVubmluZ19vbl9oeXBlcnZpc29yID0gISFoeXBlcnZpc29yX3Byb2JlKCk7DQo+IA0KPiAgICAg
IHBhcnNlX3ZpZGVvX2luZm8oKTsNCj4gDQo+IEBAIC03ODgsNiArNzg5LDggQEAgdm9pZCBfX2lu
aXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkNCj4gICAgICBwcmlu
dGsoIkNvbW1hbmQgbGluZTogJXNcbiIsIGNtZGxpbmUpOw0KPiANCj4gICAgICBwcmludGsoIlhl
biBpbWFnZSBsb2FkIGJhc2UgYWRkcmVzczogJSNseFxuIiwgeGVuX3BoeXNfc3RhcnQpOw0KPiAr
ICAgIGlmICggcnVubmluZ19vbl9oeXBlcnZpc29yICkNCj4gKyAgICAgICAgcHJpbnRrKCJSdW5u
aW5nIG9uICVzXG4iLCBoeXBlcnZpc29yX3Byb2JlKCktPm5hbWUpOw0KDQouLi5hdm9pZCBjYWxs
aW5nIGh5cGVydmlzb3JfcHJvYmUoKSBhZ2FpbiBoZXJlLg0KDQogIFBhdWwNCg0KPiANCj4gICNp
ZmRlZiBDT05GSUdfVklERU8NCj4gICAgICBwcmludGsoIlZpZGVvIGluZm9ybWF0aW9uOlxuIik7
DQo+IEBAIC0xNTY5LDcgKzE1NzIsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hl
bih1bnNpZ25lZCBsb25nDQo+IG1iaV9wKQ0KPiAgICAgICAgICAgICAgbWF4X2NwdXMgPSBucl9j
cHVfaWRzOw0KPiAgICAgIH0NCj4gDQo+IC0gICAgaWYgKCB4ZW5fZ3Vlc3QgKQ0KPiArICAgIGlm
ICggcnVubmluZ19vbl9oeXBlcnZpc29yICkNCj4gICAgICAgICAgaHlwZXJ2aXNvcl9zZXR1cCgp
Ow0KPiANCj4gICAgICAvKiBMb3cgbWFwcGluZ3Mgd2VyZSBvbmx5IG5lZWRlZCBmb3Igc29tZSBC
SU9TIHRhYmxlIHBhcnNpbmcuICovDQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWls
aW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
