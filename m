Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B24914C961
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 12:16:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwlHm-0000yD-Gf; Wed, 29 Jan 2020 11:13:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwlHl-0000y6-Mx
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 11:13:29 +0000
X-Inumbo-ID: 600f0cd2-4288-11ea-8884-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 600f0cd2-4288-11ea-8884-12813bfff9fa;
 Wed, 29 Jan 2020 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580296409; x=1611832409;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qewwKG4wv0BbG7MXey9YjvkCtj6/rx+Myh50MiYAI4w=;
 b=hZjyFgTmJqK/RhyubGlOPVoybe1VlCAzw5ocsm5Q8rPrEOXczxhQiM7L
 0mtugikeAPpasS3lOl16ashzNILFDGXbjx+ULBqTFe874uO+FM9KAgypK
 rDiDZ6xaKspwTErrN7XTQjWgqrlTNnbXnfvviVCxKnK6S4CDn0QwZtsbe c=;
IronPort-SDR: iJuImykVGzXTSpne3f78v5IQLEhkWmJK7AWo51Y6G/Xw4n1IQqRFc/CkKBPb1PSouPRAdREpM0
 kzpCEqsb6/4g==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="23138916"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 29 Jan 2020 11:13:14 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 70DAEA28BC; Wed, 29 Jan 2020 11:13:13 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 11:13:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 11:13:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 11:13:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] Xen 4.14 dates
Thread-Index: AdXWkkwE4oZwwZGcROeg+q8Um7FCagAAhukAAAAOZNA=
Date: Wed, 29 Jan 2020 11:13:11 +0000
Message-ID: <b87beec316d0451ba831a2814b4bad6f@EX13D32EUC003.ant.amazon.com>
References: <a239c82563154aa7801fc9fa2ec70b1b@EX13D32EUC003.ant.amazon.com>
 <3e143e03-d67e-f626-22ba-792b5e96f70e@suse.com>
In-Reply-To: <3e143e03-d67e-f626-22ba-792b5e96f70e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] Xen 4.14 dates
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEphbnVhcnkgMjAyMCAxMTowOA0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBYZW4gNC4xNCBkYXRlcw0KPiANCj4g
T24gMjkuMDEuMjAyMCAxMTo1NSwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPiAgIEknbSBub3Qg
YXdhcmUgb24gYW55IHByaW9yIGRpc2N1c3Npb24gdy5yLnQuIGRhdGVzIGZvciBYZW4gNC4xNCBz
byBhcw0KPiBSTSBJJ2QgbGlrZSB0byBwcm9wb3NlIHRoZSBmb2xsb3dpbmc6DQo+ID4NCj4gPiBM
YXN0IHBvc3Rpbmc6IE1heSAxc3QgMjAyMA0KPiA+IEhhcmQgRnJlZXplOiBNYXkgMjJuZCAyMDIw
DQo+ID4gUmVsZWFzZTogSnVuZSAyNnRoDQo+IA0KPiBXYXMgNC4xMyByZWFsbHkgbW9yZSB0aGFu
IDEuNSBtb250aHMgbGF0ZT8gVGhlIGFib3ZlIHdvdWxkIG1ha2UNCj4gaXRzIG9yaWdpbmFsbHkg
cGxhbm5lZCByZWxlYXNlIGRhdGUgT2N0IDI2dGggKHRoZSBhY3R1YWwgb25lIHdhcw0KPiBEZWMg
MTh0aCkgd2l0aCBvdXIgY3VycmVudCA4IG1vbnRoIGNhZGVuY2UuDQo+IA0KPiBKdXN0IHdvbmRl
cmluZywNCg0KSSBmb3VuZCB0aGUgbGFzdCA0LjEzIHVwZGF0ZSBlbWFpbCBmcm9tIEp1ZXJnZW4g
c3RhdGluZyByZWxlYXNlIG9uIE5vdiA3dGguIDggbW9udGhzIHdvdWxkIHB1dCByZWxlYXNlIG9u
IEp1bCA3dGggYnV0IEkgcm91bmRlZCBkb3duIGFzIEknbSBjb25zY2lvdXMgdGhhdCBhbnkgc2xp
cCBpcyBnb2luZyB0byBtb3ZlIHRoaW5ncyBpbnRvIGhvbGlkYXkgc2Vhc29uLg0KQW5vdGhlciBv
cHRpb24gd291bGQgYmUgdG8gc2xpcCBvdXQgdG8gfjEgeWVhciBhZnRlciB0aGUgcGxhbm5lZCA0
LjEzIGRhdGVzLg0KDQogIFBhdWwNCg0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
