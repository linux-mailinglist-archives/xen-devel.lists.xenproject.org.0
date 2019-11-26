Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD26110A12F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:28:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcjr-0007Fx-1k; Tue, 26 Nov 2019 15:26:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G2sx=ZS=amazon.com=prvs=226091ee5=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZcjp-0007Fs-IM
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:26:49 +0000
X-Inumbo-ID: 297c4d28-1061-11ea-a3a3-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 297c4d28-1061-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574782009; x=1606318009;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+XmbJVGyqxmpBJ/a3fENfV2XLKbh3T4FafVOPudMqvQ=;
 b=RGgjDX6qZ0Mtn3hnZzTrzt4qscGco1FQbrjyJjaycqBlh4LoIYhbY0X+
 U+C1LnfywOeZvdewPEfaUT47Ajb13dw1uau3Fs8f24fTs6JWt0oACPkHc
 keaCJSGY7J1nMHyMKj9gSYu7SbNzAikTB+WFfHBCL8QnaAaRRuEUP3z14 Y=;
IronPort-SDR: 4EYUUC7VAKA+a01GKrDFXTlzw1oyAEhK3UoLjcdMw+fJ3CE6okoSGaST+WtXEJuuKJC+rphCoP
 3qyIO20CtFgw==
X-IronPort-AV: E=Sophos;i="5.69,246,1571702400"; d="scan'208";a="11364259"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Nov 2019 15:26:47 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2DBA2A06AE; Tue, 26 Nov 2019 15:26:44 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 15:26:44 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 15:26:43 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 26 Nov 2019 15:26:43 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
Thread-Index: AQHVpGO9i8ZtI5j/j0uhqwrBCqQB3KedftkAgAADmACAABBgQA==
Date: Tue, 26 Nov 2019 15:26:43 +0000
Message-ID: <e5c0b20deada46399c1fe73fb8e34a30@EX13D32EUC003.ant.amazon.com>
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
 <24029.13124.935192.209484@mariner.uk.xensource.com>
 <d71df9cc-ebde-0139-c313-dc6e47e7e45d@suse.com>
In-Reply-To: <d71df9cc-ebde-0139-c313-dc6e47e7e45d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMjYgTm92ZW1iZXIgMjAxOSAxNDoyNw0KPiBUbzogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGNpdHJpeC5jb20+DQo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFBhdWwNCj4gRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1BBVENIIGZvci00LjEzXSBkb2NzL3hsOiBEb2N1bWVudCBwY2ktYXNzaWduYWJsZQ0KPiBz
dGF0ZQ0KPiANCj4gT24gMjYuMTEuMjAxOSAxNToxNCwgSWFuIEphY2tzb24gd3JvdGU6DQo+ID4g
R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTNdIGRvY3MveGw6IERvY3VtZW50
IHBjaS1hc3NpZ25hYmxlDQo+IHN0YXRlIik6DQo+ID4+ICA9aXRlbSBCPHBjaS1hc3NpZ25hYmxl
LXJlbW92ZT4gW0k8LXI+XSBJPEJERj4NCj4gPiAuLi4NCj4gPj4gK01ha2UgdGhlIGRldmljZSBh
dCBQQ0kgQnVzL0RldmljZS9GdW5jdGlvbiBCREYgbm90IGFzc2lnbmFibGUgdG8NCj4gPj4gK2d1
ZXN0cy4gIFRoaXMgd2lsbCBhdCBsZWFzdCB1bmJpbmQgdGhlIGRldmljZSBmcm9tIHBjaWJhY2ss
IGFuZA0KPiA+PiArcmUtYXNzaWduIGl0IGZyb20gdGhlICJxdWFyYW50aW5lIGRvbWFpbiIgYmFj
ayB0byBkb21haW4gMC4gIElmIHRoZSAtcg0KPiA+PiArb3B0aW9uIGlzIHNwZWNpZmllZCwgaXQg
d2lsbCBhbHNvIGF0dGVtcHQgdG8gcmUtYmluZCB0aGUgZGV2aWNlIHRvIGl0cw0KPiA+PiArb3Jp
Z2luYWwgZHJpdmVyLCBtYWtpbmcgaXQgdXNhYmxlIGJ5IERvbWFpbiAwIGFnYWluLiAgSWYgdGhl
IGRldmljZSBpcw0KPiA+PiArbm90IGJvdW5kIHRvIHBjaWJhY2ssIGl0IHdpbGwgcmV0dXJuIHN1
Y2Nlc3MuDQo+ID4+ICsNCj4gPj4gK05vdGUgdGhhdCB0aGlzIGZ1bmN0aW9uYWxpdHkgd2lsbCB3
b3JrIGV2ZW4gZm9yIGRldmljZXMgd2hpY2ggd2VyZSBub3QNCj4gPj4gK21hZGUgYXNzaWduYWJs
ZSBieSBCPHBjaS1hc3NpZ25hYmxlLWFkZD4uICBUaGlzIGNhbiBiZSB1c2VkIHRvIGFsbG93DQo+
ID4+ICtkb20wIHRvIGFjY2VzcyBkZXZpY2VzIHdoaWNoIHdlcmUgYXV0b21hdGljYWxseSBxdWFy
YW50aW5lZCBieSBYZW4NCj4gPj4gK2FmdGVyIGRvbWFpbiBkZXN0cnVjdGlvbiBhcyBhIHJlc3Vs
dCBvZiBYZW4ncyBCPGlvbW11PXF1YXJhbnRpbmU+DQo+ID4+ICtjb21tYW5kLWxpbmUgZGVmYXVs
dC4NCj4gPg0KPiA+IFdoYXQgYXJlIHRoZSBzZWN1cml0eSBpbXBsaWNhdGlvbnMgb2YgZG9pbmcg
dGhpcyBpZiB0aGUgZGV2aWNlIG1pZ2h0DQo+ID4gc3RpbGwgYmUgZG9pbmcgRE1BIG9yIHNvbWV0
aGluZyA/DQo+IA0KPiBEZXZpY2VzIGdldCByZXNldCBpbiBiZXR3ZWVuLCBzbyB3ZWxsIGJlaGF2
aW5nIG9uZXMgc2hvdWxkIG5vdA0KPiBzdGlsbCBiZSBkb2luZyBETUEgYXQgdGhhdCBwb2ludC4g
TWlzYmVoYXZpbmcgb25lcyB3b3VsZCBiZXR0ZXINCj4gbm90IGJlIGFzc2lnbmVkIChiYWNrIGFu
ZCBmb3J0aCkgYW55d2F5LiBCdXQgYSByZWNlbnQgcGF0Y2ggb2YNCj4gUGF1bCdzIHN1Z2dlc3Rz
IHRoYXQgcGVvcGxlIHN0aWxsIHdpc2ggdG8gZG8gc28sIG9uIHRoZQ0KPiBhc3N1bXB0aW9uIHRo
YXQgc3VjaCBETUEgd2lsbCBkcmFpbiBzdWZmaWNpZW50bHkgcXVpY2tseS4NCg0KWWVzLiBJIHdp
bGwgaG9wZWZ1bGx5IGZpbmQgdGltZSB0byBwb3N0IHRoZSBuZXh0IHZlcnNpb24gb2YgdGhhdCBw
YXRjaCB0aGlzIHdlZWsuDQoNCiAgUGF1bA0KDQo+IA0KPiA+IChGb3IgdGhhdCBtYXR0ZXIsIHBy
ZXN1bWFibHkgdGhlcmUgYXJlIHNlY3VyaXR5IGltcGxpY2F0aW9ucyBvZg0KPiA+IGFzc2lnbmlu
ZyB0aGUgc2FtZSBkZXZpY2UgaW4gc2VxdWVuY2UgdG8gZGlmZmVyZW50IGd1ZXN0cz8pDQo+IA0K
PiBSaWdodC4NCj4gDQo+IEphbg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
