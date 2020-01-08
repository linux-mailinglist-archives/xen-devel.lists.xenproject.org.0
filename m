Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACE134236
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:51:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAl8-0004nP-7j; Wed, 08 Jan 2020 12:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l8vY=25=amazon.co.uk=prvs=2696eec7a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipAl6-0004nI-01
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:48:24 +0000
X-Inumbo-ID: 27bb89c4-3215-11ea-b7e6-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27bb89c4-3215-11ea-b7e6-12813bfff9fa;
 Wed, 08 Jan 2020 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578487704; x=1610023704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YMUUgAlv4E89ULyZuGSZwgLgA73kFXicxiJR9tpMKbA=;
 b=jDK2/mD5FyPZAPewSOw4IilM8q3oOiei+244VUck7FyXRXrKgjLLzcQf
 LjIJYVEi6n08c+OZgUQURy2wN6aIGRb938jbpEz7W7jyPc8nKhEdkXiQK
 zMNpZMbioJXgZAX7fTpS+1lLdnVkXeMnh1hKqB5rFa9DtBpe5NMm7KOgh U=;
IronPort-SDR: otl/mhLTAk0XSedKU3mAZbkYpb9VWcdoBhHgIr6bO2V0CPTKBx/cCXvp+hTsztM8pNjlBqpXKi
 WIR+Y4LK6JBw==
X-IronPort-AV: E=Sophos;i="5.69,409,1571702400"; d="scan'208";a="10588084"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 08 Jan 2020 12:48:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id C7DC5C0793; Wed,  8 Jan 2020 12:48:20 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 8 Jan 2020 12:48:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 8 Jan 2020 12:48:19 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 8 Jan 2020 12:48:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Paul Durrant <pdurrant@gmail.com>
Thread-Topic: [Xen-devel] [PATCH 2/2] x86/hyperv: drop all __packed from
 hyperv-tlfs.h
Thread-Index: AQHVxYGR5JkVvMVfT0OQR365tmQxsafgfCEAgAA2mYCAAAXQIA==
Date: Wed, 8 Jan 2020 12:48:18 +0000
Message-ID: <fbebec77270c402c9db76b5cd1e472de@EX13D32EUC003.ant.amazon.com>
References: <20200107173902.13768-1-liuwe@microsoft.com>
 <20200107173902.13768-3-liuwe@microsoft.com>
 <CACCGGhAGY+VtgCtwMz39eRmPT0nch92r8P3JBGhhrWWPtYd+mQ@mail.gmail.com>
 <20200108122637.tc2aqdor4ykpk7ub@debian>
In-Reply-To: <20200108122637.tc2aqdor4ykpk7ub@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.252]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/2] x86/hyperv: drop all __packed from
 hyperv-tlfs.h
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <JBeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAwOCBKYW51YXJ5IDIwMjAgMTI6MjcNCj4gVG86IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAZ21haWwuY29tPg0KPiBDYzogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IFdlaSBM
aXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBKYW4NCj4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQ0KPiBk
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvMl0geDg2L2h5
cGVydjogZHJvcCBhbGwgX19wYWNrZWQgZnJvbQ0KPiBoeXBlcnYtdGxmcy5oDQo+IA0KPiBPbiBX
ZWQsIEphbiAwOCwgMjAyMCBhdCAwOToxMToxMkFNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6
DQo+ID4gT24gVHVlLCA3IEphbiAyMDIwIGF0IDE3OjM5LCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3
cm90ZToNCj4gPiA+DQo+ID4gPiBBbGwgc3RydWN0dXJlcyBhcmUgYWxyZWFkeSBuYXR1cmFsbHkg
YWxpZ25lZC4gTGludXggYWRkZWQgdGhvc2UNCj4gPiA+IGF0dHJpYnV0ZXMgb3V0IG9mIHBhcmFu
b2lhLg0KPiA+ID4NCj4gPiA+IEluIFhlbiB3ZSd2ZSBoYWQgaW5zdGFuY2Ugd2UgaGFkIHRvIGRy
b3AgcG9pbnRsZXNzIF9fcGFja2VkIHRvIHBsYWNhdGUNCj4gPiA+IGdjYyA5IChzZWUgY2E5MzEw
YjI0ZQ0KPiA+DQo+ID4gSSB0aGluayB5b3Ugc2hvdWxkIGFkZDoNCj4gPg0KPiA+ICJ4ODYvSU8t
QVBJQzogZml4IGJ1aWxkIHdpdGggZ2NjOSINCj4gPg0KPiA+IGhlcmUuDQo+IA0KPiBJIGhhdmUg
Zml4ZWQgaXQgdXAgbG9jYWxseS4gRG8geW91IHdhbnQgbWUgdG8gcmVzZW5kIHRoZXNlIHR3byBw
YXRjaGVzDQo+IGp1c3QgZm9yIHRoaXMgdXBkYXRlPw0KDQpBcyBsb25nIGFzIGl0IGlzIGZpeGVk
IHdoZW4gY29tbWl0dGVkIGFueSB3YXkgd2lsbCBkby4NCg0KICBQYXVsDQoNCj4gDQo+IFdlaS4N
Cj4gDQo+ID4NCj4gPiA+ICksIGl0IGlzIGJldHRlciBkcm9wIHRob3NlIGF0dHJpYnV0ZXMuDQo+
ID4gPg0KPiA+ID4gUmVxdWVzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPg0KPiA+
DQo+ID4gICBQYXVsDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
