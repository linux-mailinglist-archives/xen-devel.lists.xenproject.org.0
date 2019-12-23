Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5812937B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 10:08:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijJfv-0000mN-Cb; Mon, 23 Dec 2019 09:06:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htmo=2N=amazon.com=prvs=2537494bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijJft-0000mI-UN
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 09:06:49 +0000
X-Inumbo-ID: 885e0ca2-2563-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 885e0ca2-2563-11ea-b6f1-bc764e2007e4;
 Mon, 23 Dec 2019 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577092001; x=1608628001;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2H8tzpmxeS7USTqZi1TYYzYrme7HYFWk42y/pxa/gKo=;
 b=lZo62m3L/+tF5CMjE3zThfNpN2kbParnGsqk7DLYE6lW9Q3xR5A+S2B7
 QroOyuiKRW1Z00mJYUH+24S36KbopCCuIvz/7K8nip0wI+NVcYlMCF6lU
 Iifjzkfd7FLa+uRYRKf1CvVgcNNMh1FK134KOfuc33ycLBZa1Wiq2CyNY A=;
IronPort-SDR: zCjOAeN9KWVg08IBYx6DP5jis5xf65ivqbEQCdIePHQ8fX11knAdriiX3xw80FaLDzoERUcMzx
 1J0GNi51QYnA==
X-IronPort-AV: E=Sophos;i="5.69,347,1571702400"; d="scan'208";a="16511667"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 23 Dec 2019 09:06:30 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4FD66A1F9E; Mon, 23 Dec 2019 09:06:29 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Dec 2019 09:06:28 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Dec 2019 09:06:27 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 23 Dec 2019 09:06:27 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [qemu-mainline test] 145124: regressions - FAIL
Thread-Index: AQHVuW+Dd4GxK6bArE6NcFTHQhDuT6fHbVzw
Date: Mon, 23 Dec 2019 09:06:27 +0000
Message-ID: <ba33040826d747c09df531034e65ff6b@EX13D32EUC003.ant.amazon.com>
References: <osstest-145124-mainreport@xen.org>
In-Reply-To: <osstest-145124-mainreport@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [qemu-mainline test] 145124: regressions - FAIL
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

IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBvc3N0ZXN0IHNl
cnZpY2Ugb3duZXINCj4gU2VudDogMjMgRGVjZW1iZXIgMjAxOSAwODo1OQ0KPiBUbzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBvc3N0ZXN0LWFkbWluQHhlbnByb2plY3Qub3JnDQo+
IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtxZW11LW1haW5saW5lIHRlc3RdIDE0NTEyNDogcmVncmVz
c2lvbnMgLSBGQUlMDQo+IA0KPiBmbGlnaHQgMTQ1MTI0IHFlbXUtbWFpbmxpbmUgcmVhbCBbcmVh
bF0NCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0
NTEyNC8NCj4gDQo+IFJlZ3Jlc3Npb25zIDotKA0KPiANCg0KQWxsIHNhdmUtcmVzdG9yZSBmYWls
dXJlcyBBRkFJQ1MuLi4NCg0KcWVtdS1zeXN0ZW0taTM4NjogRXhwZWN0ZWQgdm1kZXNjcmlwdGlv
biBzZWN0aW9uLCBidXQgZ290IDANCnFlbXUtc3lzdGVtLWkzODY6IC9ob21lL29zc3Rlc3QvYnVp
bGQuMTQ1MTI0LmJ1aWxkLWFtZDY0L3hlbi90b29scy9xZW11LXhlbi1kaXIvaW5jbHVkZS9leGVj
L3JhbV9hZGRyLmg6MTIwOiByYW1ibG9ja19wdHI6IEFzc2VydGlvbiBgb2Zmc2V0X2luX3JhbWJs
b2NrKGJsb2NrLCBvZmZzZXQpJyBmYWlsZWQuDQoNCkRvbid0IGtub3cgd2hhdCBicm91Z2h0IHRo
aXMgaXNzdWUgaW4gYXMgeWV0Lg0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
