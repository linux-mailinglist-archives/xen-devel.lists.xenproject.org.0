Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DF550677C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307899.523271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjtr-0001Bw-Bp; Tue, 19 Apr 2022 09:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307899.523271; Tue, 19 Apr 2022 09:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjtr-00019I-8V; Tue, 19 Apr 2022 09:11:55 +0000
Received: by outflank-mailman (input) for mailman id 307899;
 Tue, 19 Apr 2022 09:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnw2=U5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngjtp-00015j-9J
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:11:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf99813d-bfc0-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 11:11:51 +0200 (CEST)
Received: from AM6P195CA0059.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::36)
 by DB6PR0802MB2616.eurprd08.prod.outlook.com (2603:10a6:4:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:11:49 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::a0) by AM6P195CA0059.outlook.office365.com
 (2603:10a6:209:87::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.21 via Frontend
 Transport; Tue, 19 Apr 2022 09:11:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 09:11:48 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Tue, 19 Apr 2022 09:11:48 +0000
Received: from 07582ea60787.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A7F9C95A-CF8B-4D27-A4A1-E15DD0568E37.1; 
 Tue, 19 Apr 2022 09:11:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07582ea60787.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Apr 2022 09:11:42 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB3183.eurprd08.prod.outlook.com (2603:10a6:803:47::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:11:40 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 09:11:40 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bf99813d-bfc0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nP7B4g1CQ7Hls5tgmaddDBfVEV3wloXf8QdYLFc7WWM=;
 b=gUMDynTTaETf5g11Z8U45We86eT82L1/0iHvD1wlnKiXZLrmS2Ve8A0hRJ6V2AyNzhpgqycy8dVgJ0mDwMtjfjk6iq3FAMOkWRw4XAjQnd7c3fECMCRSex6tETYApWTFMHOdWLpEFAO+KdYabkFwPYQtrZZFXASPX7E8mlbgIFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVjvWmJ8E0Mvs9h2xuVmd3rsRrq9glks0NEGqELgNIsKkdjPn74/K61QW9dHSXGaUZVdJfErz9f1N8JCGK5Zb7d+GY6w2kZA5kEibLHZm4XkGy7pKWAQswFMMnmqzOcIKL817IQYrtmIARaxfKMoX1K9oYpyntpQ4tAYFw9Q7DVWlLmt31BM7QiRQFN5nFaR1BCva5fOWC6PWFEc+heyV29EwQkads/zq7kN3QGTsp65D3y9xPODbxXDl6UoF+M+KiHkUCaToRNexpUNQ+GD+fHR+7wpMKiA3WDZH66nwY7he/CI7wQK9MLpGkCQje5HLK9GyaCLMnwIC6t9G48Ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nP7B4g1CQ7Hls5tgmaddDBfVEV3wloXf8QdYLFc7WWM=;
 b=JDZPzFEan/xfMk6k94jp7qpjMemWyWNBCaxu1O/ivfZHyexBkdt8QJmzxqtVw2XeB0uTbo/N3LBe4WbO+S5ZMZEGuK0Y47/AG34WsNZQxFFZto+JNE1RFPyMVF0l1pl14AK+HD+aKrgdYGgbcGfq8DQKnMGStmmzbEwMEHJU8aJG6t2KTtiuy2Xxv+eWcq44fpDfDNpx5GoHfbJ+0KZ+FgKTL9tB51devaRWia3ELCMg9KRRAPezOuksWgd5Ag8lqxO5TH4DtVkRJ85o5YtmSgwuX5+bxSUEDuS1dWIxbNiAIlZpPWv4m9olwyndsE6VV0MfAM9mcbFSstKP7l9czA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nP7B4g1CQ7Hls5tgmaddDBfVEV3wloXf8QdYLFc7WWM=;
 b=gUMDynTTaETf5g11Z8U45We86eT82L1/0iHvD1wlnKiXZLrmS2Ve8A0hRJ6V2AyNzhpgqycy8dVgJ0mDwMtjfjk6iq3FAMOkWRw4XAjQnd7c3fECMCRSex6tETYApWTFMHOdWLpEFAO+KdYabkFwPYQtrZZFXASPX7E8mlbgIFU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH V2 0/6] populate/unpopulate memory when domain on static
Thread-Topic: [PATCH V2 0/6] populate/unpopulate memory when domain on static
Thread-Index: AQHYUx8fG8TKp+50a0uuNwFvLPqiqKz27bYAgAABRyA=
Date: Tue, 19 Apr 2022 09:11:40 +0000
Message-ID:
 <DU2PR08MB7325B0B941E74A6EB794798BF7F29@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <505f2900-4f0b-e3ca-93c3-705028c1e826@suse.com>
In-Reply-To: <505f2900-4f0b-e3ca-93c3-705028c1e826@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0657D45F7A1AC44C949106950748AA3F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fdcc4472-e4c8-4f03-6a16-08da21e4a22f
x-ms-traffictypediagnostic:
	VI1PR08MB3183:EE_|AM5EUR03FT016:EE_|DB6PR0802MB2616:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB26164EDCEF279D7B07D4F944F7F29@DB6PR0802MB2616.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q4NRq4bjwnxpMxsO4xF+eYLoacPjVSPf9caCdYU5ZCXtYVjxHbaLoKg6Nt8c81iEokko36mWYMtl09d0Y3qXnC2UpUXXRrNYpLZTAlcE3/Ve1FwvijhIItXgPcy5pYQm+KrmELcp7S6HptZ+PBQzz7wZ2qOAkj1auVltADSWzvVFwnxF2+7h+oi9htguVq7fJraPpJwGhu3lrRDObNj2vRfntu8Qq/M+uO/jIe+EL1mxZb32ciWHl28fcNcSDNnAaxnHffcs7FEUVsON/XvIT23upQjrERLNPfG3R5Kf1tpH381RkdMM6SBncIGFy0HQl31gJcF5pu8n3sNWp/IX2F0WGujGDdutC/DyC7YqQzfirB7BfKycSbwV+niFvug8XaUgMz6JeK/xAlYNB+3dIM7dbYnopIwRv1zqW2+PLWNWGfUbKc+Je8ZGUAgAHbQrT+9pFlN7PHBaxgxXSHjyxNvRSlgF5jmZZXcP/W7zs+TPEvYrekbUKVldiHL+b2GbMlPf/YrsamTTsAfN80azxk0VSWx7aFXlazw2DMwA3OKSfOXy8g2phSpfp+0ZZKIMlzVQmgQP2i+mdppfSSkHLdwqJLz20GalmR2bAnsHKptHTHVZfYSEdFY6h3qDrDtYylN18ICCw+RnMPqHrKiPZgy9CtgJRW5YInMD8jl7iEi3dSiTa+rYkzKiNjJQyLZXUdoOf54LaEVbvafImOAIKA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(4326008)(316002)(122000001)(38070700005)(33656002)(8936002)(52536014)(55016003)(71200400001)(54906003)(6506007)(7696005)(186003)(6916009)(5660300002)(53546011)(26005)(508600001)(8676002)(66556008)(66946007)(66476007)(66446008)(64756008)(76116006)(86362001)(9686003)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3183
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c13cd8a7-7934-403d-f543-08da21e49d85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z8L28+nGM14OEsiCrPA0Oqg/jJCyVbuOt/nd8TFZmR7qSDsgEcrw9dv1CVUqdcmSyCoij4/PK4wSh0SpSCOjLGQw0uzvM6OLhDfaX+g2Z6xOsAfs+8vu7jv5dS7YBXAnnGYrZjjs8ZNU3qMQoYltSjCbLeokYLqz+KbtNQ9WAOAUg6K6yt0v0A7tvuAe0rJC/gW++KtTLKVnSWIOVG/vfLVjPS/Voa9yFnh5mCiicpnQkTKzB9/jHGz1h0kgA8Ol2RAtUwbTGmARef5fL/nv6ohFZtxFfmZUUvRmnBDco7tFg78ArgoBijs/GH/qkR4Mn4B96ktA8eUnQXgQ0lABQUGa/hp5767T7NARdFBF+PH0Wj7Kls3NQjIyhX2bD/gprTgkDzqWUm1SllQAcpxspdyJlNSzE7F0TjdCQWhJdLub/GThXjQC43/Dysa0BjLNw+p1nEp/U1KpAxtj6uGBeWlMDjVBGm4vAnWYxkZcJAKDzjhSYbNecxpkTnxfB967n1T85uXJocgYdkR9GA/8fUQmDt6Q0UbepULEtnNznO3dNAB1JwApmQoPQWJtImSB8R9xVcKaRO7+BpVWCldTcfOKCAZfJQV+mBpmuWZGph3INpeSN61VHDz++NWGL8WSh59FxE9a7NwW4NS+dp5sZd67y0MdHX3xGW4V0IAOY7fxsrVWnpw6tzLr4Pqqp3L7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(55016003)(186003)(26005)(83380400001)(86362001)(5660300002)(70206006)(70586007)(336012)(356005)(6506007)(2906002)(9686003)(7696005)(47076005)(40460700003)(54906003)(53546011)(82310400005)(36860700001)(316002)(52536014)(8936002)(4326008)(8676002)(81166007)(6862004)(508600001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:11:48.2997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcc4472-e4c8-4f03-6a16-08da21e4a22f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2616

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxOSwgMjAyMiA0
OjQ3IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47
DQo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3JnPjsgQmVydHJhbmQg
TWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsg
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDAvNl0gcG9wdWxhdGUvdW5wb3B1bGF0
ZSBtZW1vcnkgd2hlbiBkb21haW4gb24NCj4gc3RhdGljDQo+IA0KPiBPbiAxOC4wNC4yMDIyIDE0
OjIyLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBUb2RheSB3aGVuIGEgZG9tYWluIHVucG9wdWxh
dGVzIHRoZSBtZW1vcnkgb24gcnVudGltZSwgdGhleSB3aWxsDQo+ID4gYWx3YXlzIGhhbmQgdGhl
IG1lbW9yeSBvdmVyIHRvIHRoZSBoZWFwIGFsbG9jYXRvci4gQW5kIGl0IHdpbGwgYmUgYQ0KPiA+
IHByb2JsZW0gaWYgaXQgaXMgYSBzdGF0aWMgZG9tYWluLiBQYWdlcyBhcyBndWVzdCBSQU0gZm9y
IHN0YXRpYyBkb21haW4NCj4gPiBzaGFsbCBhbHdheXMgYmUgcmVzZXJ2ZWQgdG8gb25seSB0aGlz
IGRvbWFpbiBhbmQgbm90IGJlIHVzZWQgZm9yIGFueQ0KPiA+IG90aGVyIHB1cnBvc2VzLCBzbyB0
aGV5IHNoYWxsIG5ldmVyIGdvIGJhY2sgdG8gaGVhcCBhbGxvY2F0b3IuDQo+ID4NCj4gPiBUaGlz
IHBhdGNoIHNlcmllIGludGVuZHMgdG8gZml4IHRoaXMgaXNzdWUsIGJ5IGFkZGluZyBwYWdlcyBv
biB0aGUgbmV3DQo+ID4gbGlzdCByZXN2X3BhZ2VfbGlzdCBhZnRlciBoYXZpbmcgdGFrZW4gdGhl
bSBvZmYgdGhlICJub3JtYWwiIGxpc3QsDQo+ID4gd2hlbiB1bnBvcHVsYXRpbmcgbWVtb3J5LCBh
bmQgcmV0cmlldmluZyBwYWdlcyBmcm9tIHJlc3YgcGFnZQ0KPiA+IGxpc3QocmVzdl9wYWdlX2xp
c3QpIHdoZW4gcG9wdWxhdGluZyBtZW1vcnkuDQo+ID4NCj4gPiAtLS0NCj4gPiB2MiBjaGFuZ2Vz
Og0KPiA+IC0gbGV0ICJmbGFncyIgbGl2ZSBpbiB0aGUgc3RydWN0IGRvbWFpbi4gU28gb3RoZXIg
YXJjaCBjYW4gdGFrZQ0KPiA+IGFkdmFudGFnZSBvZiBpdCBpbiB0aGUgZnV0dXJlDQo+ID4gLSBj
aGFuZ2UgbmFtZSBmcm9tICJpc19kb21haW5fb25fc3RhdGljX2FsbG9jYXRpb24iIHRvDQo+ICJp
c19kb21haW5fc3RhdGljKCkiDQo+IA0KPiBJIGhhdmUgcmVzZXJ2YXRpb25zIGFnYWluc3QgdGhp
cyBuZXcgbmFtZTogVGhpcyBjb3VsZCBtZWFuIGZhciBtb3JlIGFzcGVjdHMgb2YNCj4gdGhlIGRv
bWFpbiBhcmUgc3RhdGljIHRoYW4ganVzdCBpdHMgbWVtb3J5IGFzc2lnbm1lbnQuIFdhcyB0aGlz
IGludGVuZGVkIChvcg0KPiBhdCBsZWFzdCBjb25zaWRlcmVkKT8NCj4gDQoNCk9rLiBKdWxpZW4g
Z2F2ZSBtZSB0d28gc3VnZ2VzdGlvbnMgYmFjayB0aGUgZGF5LCBtYXliZSB0aGUgb3RoZXIgImlz
X2RvbWFpbl91c2luZ19zdGF0aWNtZW0oKSINCmlzIGJldHRlciBhbmQgdG8gdGhlIHBvaW50LiBJ
J2xsIGNoYW5nZSBpdCBpbiB0aGUgbmV4dCBzZXJpZS4NCg0KPiBKYW4NCg0K

