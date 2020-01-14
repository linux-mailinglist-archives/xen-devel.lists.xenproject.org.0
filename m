Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE713A4A9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 10:57:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irItC-00007W-0p; Tue, 14 Jan 2020 09:53:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ZHO=3D=amazon.co.uk=prvs=275b1edda=pdurrant@srs-us1.protection.inumbo.net>)
 id 1irItA-00006b-Hh
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 09:53:32 +0000
X-Inumbo-ID: b7ed7eec-36b3-11ea-835f-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7ed7eec-36b3-11ea-835f-12813bfff9fa;
 Tue, 14 Jan 2020 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578995611; x=1610531611;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Ayok1xG+cqGewAYdUp1/aeHSCV4oOLwwf+7MGMCwyvc=;
 b=UCKIe91FG5Gp51oE/TZ+bQw5HBFyf/wda9pLoNvJA+hi/ojBQpDEBoX8
 wCliWiY0FDzNHLugZSUyqJaOB2wNBep6KlqUk4eOKjh3ayPWufJrx7igr
 DY4QmWr36Gy2p95RTPnkRwyw/DMx68sP1z86MQrZE4AMTFwVpJSXY7ECl M=;
IronPort-SDR: rgEAnk9EE1t6PGvhk11DsSdxSvqBJGaNq9eh4oYt5dJd9o4uIE+qYgABhCHO9CIwU4O5CNnTvz
 nad8O23iulkQ==
X-IronPort-AV: E=Sophos;i="5.69,432,1571702400"; d="scan'208";a="10175148"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 14 Jan 2020 09:53:19 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 181D0A1E60; Tue, 14 Jan 2020 09:53:17 +0000 (UTC)
Received: from EX13D05EUC004.ant.amazon.com (10.43.164.38) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 14 Jan 2020 09:53:17 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D05EUC004.ant.amazon.com (10.43.164.38) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 09:53:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 14 Jan 2020 09:53:16 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] docs/misc: livepatch: Espace backslash
Thread-Index: AQHVyl6zHSPyPFWh90C9Hqezo2GHZKfp6rfwgAABJ9A=
Date: Tue, 14 Jan 2020 09:53:15 +0000
Message-ID: <b73c17351c23402196b8998f8438f397@EX13D32EUC003.ant.amazon.com>
References: <20200113221227.20857-1-julien@xen.org> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.165]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] docs/misc: livepatch: Espace backslash
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSnVsaWVuIEdy
YWxsDQo+IFNlbnQ6IDEzIEphbnVhcnkgMjAyMCAyMzoxMg0KPiBUbzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IENjOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0
cml4LmNvbT47IFdpZWN6b3JraWV3aWN6LCBQYXdlbA0KPiA8d2lwYXdlbEBhbWF6b24uZGU+OyBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlaw0KV2lsaw0KPiA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT4NCj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIXSBk
b2NzL21pc2M6IGxpdmVwYXRjaDogRXNwYWNlIGJhY2tzbGFzaA0KPg0KDQpzL0VzcGFjZS9Fc2Nh
cGUsIEkgYXNzdW1lDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
