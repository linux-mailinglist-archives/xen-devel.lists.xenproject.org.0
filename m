Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D88FDC3B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 12:27:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZjv-0000Fd-Ax; Fri, 15 Nov 2019 11:26:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IpEL=ZH=amazon.com=prvs=215a7c561=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iVZjt-0000FX-Qj
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 11:26:09 +0000
X-Inumbo-ID: b8ab8b46-079a-11ea-a267-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8ab8b46-079a-11ea-a267-12813bfff9fa;
 Fri, 15 Nov 2019 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573817170; x=1605353170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vIVLfOsslJ/PTFrgNFxvzxOVV3MYvzvsUl1OGeZdG/o=;
 b=Q0r8maAfiirgQrezsssHIuTeOUtoQWrWnnf56/NV/GiSqGRT16EuLXWU
 HuHq/aDe1cjr4/Wni1eOcQrueWiu83pCtC1yvgt1LIjEGmqrA01qUBsb4
 gvQlOaYls1aCIQAKLNU1N5kKwXbS2qSRyGeQv3PgpulBlJMQjYAJX+52q E=;
IronPort-SDR: egh3X3lJ7pJVPqgX3CT/IY7+xng3OiZuWxuCtKb3AnR66Ri6e3c9ryNEUBKJu6N+cxji25h8WE
 JL7C8MyDy1sQ==
X-IronPort-AV: E=Sophos;i="5.68,308,1569283200"; 
   d="scan'208";a="4082208"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 15 Nov 2019 11:26:08 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id D77D6A1E0E; Fri, 15 Nov 2019 11:26:06 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 15 Nov 2019 11:26:06 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 15 Nov 2019 11:26:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 15 Nov 2019 11:26:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Thread-Topic: Call for new Release Manager for Xen 4.14+
Thread-Index: AQHVlbrSnQbXeRjO7U2yvrM4AIHL4KeMIuIA
Date: Fri, 15 Nov 2019 11:26:05 +0000
Message-ID: <10dd18cdc2874acebaeeed777a7a1aed@EX13D32EUC003.ant.amazon.com>
References: <921F6581-B12A-4EC0-B0E2-91FE61C3D48D@citrix.com>
In-Reply-To: <921F6581-B12A-4EC0-B0E2-91FE61C3D48D@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.193]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] Call for new Release Manager for Xen 4.14+
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Brian Woods <brian.woods@xilinx.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXJzIEt1cnRoIDxsYXJzLmt1
cnRoQGNpdHJpeC5jb20+DQo+IFNlbnQ6IDA3IE5vdmVtYmVyIDIwMTkgMjI6MzANCj4gVG86IHhl
bi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgSnVlcmdlbiBHcm9zcw0K
PiA8amdyb3NzQHN1c2UuY29tPg0KPiBDYzogY29tbWl0dGVyc0B4ZW5wcm9qZWN0Lm9yZzsgRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT47IEJyaWFuDQo+IFdvb2RzIDxicmlhbi53
b29kc0B4aWxpbnguY29tPg0KPiBTdWJqZWN0OiBDYWxsIGZvciBuZXcgUmVsZWFzZSBNYW5hZ2Vy
IGZvciBYZW4gNC4xNCsNCj4gDQo+IERlYXIgQ29tbXVuaXR5IE1lbWJlcnMsDQo+IA0KPiBKdWVy
Z2VuIHdpbGwgYmUgc3RlcHBpbmcgZG93biBhcyBSZWxlYXNlIE1hbmFnZXIgYWZ0ZXIgWGVuIDQu
MTMgaGFzIGJlZW4NCj4gZGVsaXZlcmVkLCBmb2xsb3dpbmcgdGhlIDQuMTEgYW5kIDQuMTIgcmVs
ZWFzZS4gUmVsZWFzZSBtYW5hZ2VycyBwcmlvciB0bw0KPiBKdWVyZ2VuIHdlcmUgSnVsaWVuIEdy
YWxsLCBLb25yYWQgV2lsaywgV2VpIExpdSBhbmQgR2VvcmdlIER1bmxhcC4gV2UgYXJlDQo+IGxv
b2tpbmcgZm9yIGFjdGl2ZSBjb21tdW5pdHkgbWVtYmVycyB0byBmb2xsb3cgaW4gcHJldmlvdXMg
cmVsZWFzZQ0KPiBtYW5hZ2VycyBmb290c3RlcHMuIEkgYWxzbyB3YW50ZWQgdG8gdGhhbmsgSnVl
cmdlbiBmb3IgcGVyZm9ybWluZyB0aGUNCj4gcm9sZS4NCj4gDQo+IFdlIGhhdmUgZGlzY3Vzc2Vk
IHdpdGggYSBudW1iZXIgb2YgcGVvcGxlLCBob3dldmVyIFdlaSBtYWRlIHRoZSB2ZXJ5IHZhbGlk
DQo+IHBvaW50IHRoYXQgd2Ugc2hvdWxkIG1ha2UgYW4gYW5ub3VuY2VtZW50IGFib3V0IHRoZSBy
b2xlIG9uIHRoZSBsaXN0LiAgSW4NCj4gdGVybXMgb2YgZWZmb3J0LCB0aGUgZWZmb3J0IHJlcXVp
cmVkIHByaW9yIHRvIHRoZSByZWxlYXNlIGlzIHJlbGF0aXZlbHkNCj4gbG93ICgxLTIgZGF5cyBh
IG1vbnRoKSwgaG93ZXZlciBpbiB0aGUgbGFzdCB0d28gbW9udGhzIG9mIHRoZSByZWxlYXNlIGdv
ZXMNCj4gdXAgdG8gMS0yIGRheXMgcGVyIHdlZWsuIFR5cGljYWxseSByZWxlYXNlIG1hbmFnZXJz
IG1hbmFnZSAyLTMgcmVsZWFzZXMuDQo+IA0KPiBXaGF0IGlzIGludm9sdmVkIGluIHRoZSByb2xl
IGlzIGRlc2NyaWJlZCBoZXJlOg0KPiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14
ZW4uZ2l0O2E9YmxvYjtmPWRvY3MvcHJvY2Vzcy94ZW4tDQo+IHJlbGVhc2UtDQo+IG1hbmFnZW1l
bnQucGFuZG9jO2g9ZDZhYmM5MGEwMjQ4Yjc2OTE2MWJjZTc5ZThkYzY5MDRjNjU0OTA0YTtoYj1I
RUFEDQo+IA0KPiBJZiB5b3UgYXJlIGEgY29tbXVuaXR5IG1lbWJlciB0aGF0IGZlZWxzIHRoZSBy
ZWxlYXNlIG1hbmFnZXIgcm9sZSB3b3VsZCBiZQ0KPiBhIGdvb2QgbWF0Y2ggZm9yIHlvdSwgcGxl
YXNlIGNvbnRhY3QgbWU6IGFsc28gZmVlbCBmcmVlIHRvIGFzayBtZSBvcg0KPiBwcmV2aW91cyBy
ZWxlYXNlIG1hbmFnZXJzIGFueSBxdWVzdGlvbnMNCg0KW1JlcGx5aW5nIHB1YmxpY2x5IGFzIHJl
cXVlc3RlZCBieSBMYXJzXQ0KDQpJIHdvdWxkIGJlIGhhcHB5IHRvIGRvIHRoZSBqb2IsIHNvIHlv
dSBjYW4gY29uc2lkZXIgbWUgYSBjYW5kaWRhdGUuDQoNCiAgUGF1bA0KDQo+IA0KPiBCZXN0IFJl
Z2FyZHMNCj4gTGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
