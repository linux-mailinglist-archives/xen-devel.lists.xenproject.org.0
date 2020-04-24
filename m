Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A41B6F7B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 10:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRtFn-0002RU-2x; Fri, 24 Apr 2020 08:00:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnRG=6I=amazon.co.uk=prvs=376452958=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jRtFl-0002HK-KC
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 08:00:05 +0000
X-Inumbo-ID: 9bafcd6e-8601-11ea-9e09-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bafcd6e-8601-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1587715205; x=1619251205;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=2ZpEyeazpWKchcn+U0N4QknDfDMEt2hWmGG1HfY2APA=;
 b=c2A93OBtWnLtQZxl7fs921drcBcpx5Emll5uRrqah0Zx5cvyUKyTlJid
 NVQFhbMvSxhnCQe8BHVJ6WiDwP7uMbHAVmzSAGOkUg8YpKiiL6BNjDTEZ
 JoSVfS8avbOTHzYfBU8F59AOyVbfryfzgRcIT383gDY5ZkqVwvG2+qcN9 4=;
IronPort-SDR: lZoAwJ8OU/2qsfaRG7IkGaHTlRXJ336YlHPqCVbVh3+0j2kxOO9UqwaPw1tNlhxUxsXWJet/ty
 H1bTaspdB4lA==
X-IronPort-AV: E=Sophos;i="5.73,310,1583193600"; d="scan'208";a="27429851"
Subject: RE: [ANNOUNCE] Xen 4.14 Development Update
Thread-Topic: [ANNOUNCE] Xen 4.14 Development Update
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 24 Apr 2020 07:59:53 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id C2AE2A2514; Fri, 24 Apr 2020 07:59:52 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 24 Apr 2020 07:59:51 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 24 Apr 2020 07:59:50 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 24 Apr 2020 07:59:50 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Index: AQHWGguEBjuxACUXz0mOoCZT0DeYwaiH53MAgAAAkZA=
Date: Fri, 24 Apr 2020 07:59:50 +0000
Message-ID: <4b39d78bcbea431f95d391b7fa8a2163@EX13D32EUC003.ant.amazon.com>
References: <20200424073859.89-1-paul@xen.org>
 <7809d4e7-bc08-a0d3-b623-8e0478de951d@suse.com>
In-Reply-To: <7809d4e7-bc08-a0d3-b623-8e0478de951d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.8]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBPbiAyNC4wNC4yMDIwIDA5OjM4LCBQYXVs
IER1cnJhbnQgd3JvdGU6DQo+ID4gKiAgTWVtb3J5IHJlYWQgY2FjaGluZyBpbiBlbXVsYXRpb24g
KHY1KQ0KPiA+ICAgLSAgSmFuIEJldWxpY2gNCj4gDQo+IFVubGVzcyBpc3N1ZXMgYXJlIGZvdW5k
IHdpdGggdGhpcywgaXQgY2FuIGJlIG1vdmVkIHRvICJjb21wbGV0ZWQiIC0NCj4gSSBkaWQgY29t
bWl0IHRoaXMgeWVzdGVyZGF5Lg0KPiANCg0KU29tZW9uZSBqdXN0IGRyZXcgbXkgYXR0ZW50aW9u
IHRvIHRoZSBjb21taXQgc28gb25jZSBpdCBoaXRzIG1hc3RlciBpdCBzaG91bGQgaW5kZWVkIGJl
IG1hcmtlZCBhcyBzdWNoLg0KVGhhbmtzLA0KDQogIFBhdWwNCg==

