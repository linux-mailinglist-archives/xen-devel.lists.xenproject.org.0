Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD344AB37
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 11:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223844.386764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkO0Z-0004Vn-3l; Tue, 09 Nov 2021 10:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223844.386764; Tue, 09 Nov 2021 10:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkO0Y-0004U1-WF; Tue, 09 Nov 2021 10:05:39 +0000
Received: by outflank-mailman (input) for mailman id 223844;
 Tue, 09 Nov 2021 10:05:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHuC=P4=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mkO0X-0004Tv-79
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 10:05:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94b3f1da-4144-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 11:05:35 +0100 (CET)
Received: from DB8PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:10:100::43)
 by HE1PR08MB2907.eurprd08.prod.outlook.com (2603:10a6:7:2d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 10:05:33 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::5e) by DB8PR06CA0030.outlook.office365.com
 (2603:10a6:10:100::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 10:05:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 9 Nov 2021 10:05:32 +0000
Received: ("Tessian outbound 2bb1f94ba47e:v108");
 Tue, 09 Nov 2021 10:05:32 +0000
Received: from e3a949313907.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1328A7BF-1F89-40F0-ACA4-0A204C5C0AFF.1; 
 Tue, 09 Nov 2021 10:05:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3a949313907.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Nov 2021 10:05:22 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB9PR08MB7148.eurprd08.prod.outlook.com (2603:10a6:10:2cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 10:05:18 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165%3]) with mapi id 15.20.4669.011; Tue, 9 Nov 2021
 10:05:18 +0000
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
X-Inumbo-ID: 94b3f1da-4144-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zey6z0NrWG4VbMD6I16Lx9zOkqr1tv+CxPgc0xRsocE=;
 b=bM2mDv6l0IY1fVAyXbE8ReuOyDFyW52xCBhQOul6QLrOePoy7+VLqCV5+4wOgVqiBQHO2l/67QSKMCCANOwr5P9+5t/cLzDuELjAut9kyod3yAhnKYOVOVunrbnnhq8g2lFaYH7LSHnLN1Kn6YOVS9LyyHoG7FJtLxY55SMpxaU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJYkBjX3o80pYBoq3/IAZ2O3TUTYkEt/qqQzNYCezGEvV3DGPT6jR5YH1LjHFl3cVV/mxfaMIhQpiDZFpOerKJeSNqeddXJr5brrxy0rdgbgItU5FtFbtjp9OFYvgJ89Hlj0wDRKG3lkj4GQC2FsXqNE3uV4XNczD3+S35El8Xuvl8iupw9YCI2NP9BBV4HXqmgkPerql2o9/6eHNVjsQjBc7UBNdoUvIrcP0v5YRUwWqzBhrCq9vrAKVmCSM9vVjPvx03rx90pzamtJDUkmB2CcIQpJHsfzspffL9I2glzB02Mg4icrNcULZO7G+DvLfnTNiRMqk8hEQp44CT0OYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zey6z0NrWG4VbMD6I16Lx9zOkqr1tv+CxPgc0xRsocE=;
 b=SR6VjdC5hGHAMgSBOgYHCDiKfPun0j1E4LhRtJAlOEI8qSUbRxXE7wXURUd0kqBEPSe7slOkDrOmYCjLxYhKi9cb5r8v2EnaynGvbV9W7Yx3E0BeE/+8v53MOko4TzNh0EvMEDZyRnAnLG/OtcICDxy2nz0+pV9dKYG/6UNOJWy+nc2QJIuowaADZba74X/+MzPDkjEx9PkpF9rZrIN+dlJqfsWIzhobMJ2jArlJhl+TS2hikuz/5eOHrYtym8qGaHxEzvCH8SfMywZcl8ZLtcUapHg+qirODk0NhwV8Bp4PhR3WuHarFGa7200rGlXpN+UyN/vm09zwG7FdRUL3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zey6z0NrWG4VbMD6I16Lx9zOkqr1tv+CxPgc0xRsocE=;
 b=bM2mDv6l0IY1fVAyXbE8ReuOyDFyW52xCBhQOul6QLrOePoy7+VLqCV5+4wOgVqiBQHO2l/67QSKMCCANOwr5P9+5t/cLzDuELjAut9kyod3yAhnKYOVOVunrbnnhq8g2lFaYH7LSHnLN1Kn6YOVS9LyyHoG7FJtLxY55SMpxaU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <Michal.Orzel@arm.com>
Subject: RE: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
Thread-Topic: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
Thread-Index: AQHXwaKc9sR/Jlon9kSpv6953h7AKKv7Gsiw
Date: Tue, 9 Nov 2021 10:05:18 +0000
Message-ID:
 <DU2PR08MB732524AE5C80DFE2E6368D15F7929@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-2-penny.zheng@arm.com>
 <0eba23e2-54f4-0fe4-d811-c2fb8a0602b0@xen.org>
In-Reply-To: <0eba23e2-54f4-0fe4-d811-c2fb8a0602b0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F5CD2D256E8D44468DFB4C18FA1A0E8E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2d87ba32-72d8-4e5a-0220-08d9a36877a9
x-ms-traffictypediagnostic: DB9PR08MB7148:|HE1PR08MB2907:
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB290739BFE056EBB943903004F7929@HE1PR08MB2907.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 URq4mhKt2PPa9V/MuhaVDsQ4ZIiAIjKSC0TglO44cTjJ5YSfaMo0cmMQ4k/fN+eJHdrnb/tmRGqGs4Z4dw6iUIlHK8jypuJi/mN8hc0CTYbUMBFNPrF+9eRP/z9xyfOTcStCRPhZrYbJyAyC02Q80BMLk9rlUgVPsoORlg+uxAK8X4cdjsCHKIZ2YXzGrVNz0gzVuldZwX/3pJ/relIwI5/RXxzVQWWCIPiQDdgwuaRHTbVPv05/7UGra6ep0SJYBipKC20t8RreGE2WIti6DNy9yypZhQklM/iITML8Uehm/UmjFrOgHrEfG3tAD01r5Q9tlJR4gyenKcimzieBei5KHd9DOth6DSbo71L9pdZIe+FqbmXN8kjOjjZ0OU8/jgyhwxbfigZNC+E1AD8d2LruEAVyFwNnDQejCG9/NVpa4N4wLibjNIHaKPC8jTYCHxI09BHAmfUTYkG0I40guEead6x47dQXw8uFEAFEQfO+cGUljeRaiN+OF33KU5uRdfy1AK83oyd8LyXnwKuMdaNyYsm5jV2D6DorNUev7mONEM+v36c4dr5yWP+abt9rhrGoA9Svbwr0cxw8sjjq473Z4DPm0Yi5DkuLyd2slHtw4EE33IATsCjfGOMBKLBDQb0rvBLdneWlm05yGXScVW7RXysXY8Xi/uBNNZbJov8RLVtpnzHY8xqArzCrY+ndyPQ+b9BpwKy8UahJajEy3A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6506007)(186003)(316002)(53546011)(38100700002)(122000001)(9686003)(66446008)(76116006)(33656002)(52536014)(26005)(54906003)(66946007)(64756008)(66556008)(66476007)(110136005)(8676002)(83380400001)(5660300002)(71200400001)(38070700005)(86362001)(508600001)(4326008)(2906002)(7696005)(55016002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7148
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68a4c68c-6d82-411b-8c76-08d9a3686efc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I2ebybuSepGSXyD9dAq3zpsdbcFgc3wB/Dj6+QaQsd467rfbAnjWo1UtWP8oDc2V7Oj62xt9qYgP/jL2xddh8H+FlEZAUusVPRX9S15Qo7vYWNpoPoUyZWqmIQFako2F0uks41eTXab2DW3lb5xzrtL68YqSCzlFMBMXljqC4+rdxojG+mVPRkrcp+/qr1YSVC+nMQv2Xt7aUHMpgjS/0f8bGAVQPi1Knu3zTEVGHYrA2KfLSEIU9Hlj2O3gBprtP4s/wZM6TpAs49Ahczz49XJQu7NUOOouYlYFhxtu2RUQ+Sko30naBdVwpwxzwSuQnbDftPQUX9XUpEVD4PekKum2fzsEn4EuxAZDQctDg9LbeESf5pBdz810PZYFGGOi86Hy8iPdP7Najswyp8OtBJHfSbLGHXHrUlnVSI1VLjyyN0aCK2noUd7Nm0A1C+0i5O+N2XAeVhDzu613G83MxrSnqXfrbqAY4tViKjSAXtGVGQw2qKFwABIFw/EpAWRY3NO9oTLbkM8B/Vrtd6CL0Yrs1ISf4aBDRyjK8YQ8rZfmH61LzR8ng/w916kbElUoSsk1sPBTl3gGci8eou3NMxJkacyyod0sRczoLc1m7o+FiOpL3YGimaqC8lgneP8GYvlcsJ6olaSjssSWtkDwa59aokYXZG4a8tbP3A7OJMZqc3IkcXerTWhKHwN+9T5Hk3o4aVzXvkLJHXmssY6qMQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(110136005)(70586007)(4326008)(186003)(47076005)(70206006)(54906003)(316002)(26005)(82310400003)(508600001)(5660300002)(81166007)(52536014)(33656002)(36860700001)(86362001)(55016002)(356005)(7696005)(9686003)(336012)(83380400001)(8676002)(6506007)(53546011)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 10:05:32.9046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d87ba32-72d8-4e5a-0220-08d9a36877a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2907

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDE1LCAyMDIx
IDQ6NTcgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENj
OiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRy
YW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzZdIHhlbjog
aW50cm9kdWNlIFhFTl9ET01DVExfQ0RGX2RpcmVjdG1hcA0KPiANCj4gSGkgUGVubnksDQo+IA0K
PiBPbiAxNS8xMC8yMDIxIDA0OjA5LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+ID4gaW5kZXggMDE2NzczMWFiMC4uMzdlMmQ2MmQ0NyAxMDA2NDQNCj4gPiAtLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMNCj4gPiBAQCAtMzA2OSw4ICszMDY5LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGNv
bnN0cnVjdF9kb20wKHN0cnVjdCBkb21haW4gKmQpDQo+ID4gICB2b2lkIF9faW5pdCBjcmVhdGVf
ZG9tMCh2b2lkKQ0KPiA+ICAgew0KPiA+ICAgICAgIHN0cnVjdCBkb21haW4gKmRvbTA7DQo+ID4g
KyAgICAvKiBET00wIGhhcyBhbHdheXMgaXRzIG1lbW9yeSBkaXJlY3RseSBtYXBwZWQuICovDQo+
ID4gICAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGRvbTBfY2ZnID0gew0KPiA+
IC0gICAgICAgIC5mbGFncyA9IFhFTl9ET01DVExfQ0RGX2h2bSB8IFhFTl9ET01DVExfQ0RGX2hh
cCwNCj4gPiArICAgICAgICAuZmxhZ3MgPSBYRU5fRE9NQ1RMX0NERl9odm0gfCBYRU5fRE9NQ1RM
X0NERl9oYXAgfA0KPiA+ICsgICAgICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX2RpcmVjdG1h
cCwNCj4gPiAgICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLA0KPiA+ICAgICAgICAgICAu
bWF4X2dyYW50X2ZyYW1lcyA9IGdudHRhYl9kb20wX2ZyYW1lcygpLA0KPiA+ICAgICAgICAgICAu
bWF4X21hcHRyYWNrX2ZyYW1lcyA9IC0xLA0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2Rv
bWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYyBpbmRleA0KPiA+IDhiNTNjNDlkMWUuLjdhNjEz
MWRiNzQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYw0KPiA+ICsrKyBiL3hl
bi9jb21tb24vZG9tYWluLmMNCj4gPiBAQCAtNDg2LDcgKzQ4Niw4IEBAIHN0YXRpYyBpbnQgc2Fu
aXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QNCj4geGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNv
bmZpZykNCj4gPiAgICAgICAgICAgIH4oWEVOX0RPTUNUTF9DREZfaHZtIHwgWEVOX0RPTUNUTF9D
REZfaGFwIHwNCj4gPiAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfczNfaW50ZWdyaXR5IHwg
WEVOX0RPTUNUTF9DREZfb29zX29mZiB8DQo+ID4gICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RG
X3hzX2RvbWFpbiB8IFhFTl9ET01DVExfQ0RGX2lvbW11IHwNCj4gPiAtICAgICAgICAgICBYRU5f
RE9NQ1RMX0NERl9uZXN0ZWRfdmlydCB8IFhFTl9ET01DVExfQ0RGX3ZwbXUpICkNCj4gPiArICAg
ICAgICAgICBYRU5fRE9NQ1RMX0NERl9uZXN0ZWRfdmlydCB8IFhFTl9ET01DVExfQ0RGX3ZwbXUg
fA0KPiA+ICsgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX2RpcmVjdG1hcCkgKQ0KPiA+ICAgICAg
IHsNCj4gPiAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlVua25vd24gQ0RGIGZsYWdz
ICUjeFxuIiwgY29uZmlnLT5mbGFncyk7DQo+ID4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
PiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oDQo+ID4gYi94ZW4v
aW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oIGluZGV4IDE0ZTU3NTI4OGYuLmZjNDJjNmEzMTAgMTAw
NjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaA0KPiA+ICsrKyBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmgNCj4gPiBAQCAtMjksOCArMjksOCBAQCBlbnVtIGRv
bWFpbl90eXBlIHsNCj4gPiAgICNkZWZpbmUgaXNfNjRiaXRfZG9tYWluKGQpICgwKQ0KPiA+ICAg
I2VuZGlmDQo+ID4NCj4gPiAtLyogVGhlIGhhcmR3YXJlIGRvbWFpbiBoYXMgYWx3YXlzIGl0cyBt
ZW1vcnkgZGlyZWN0IG1hcHBlZC4gKi8NCj4gPiAtI2RlZmluZSBpc19kb21haW5fZGlyZWN0X21h
cHBlZChkKSBpc19oYXJkd2FyZV9kb21haW4oZCkNCj4gPiArLyogQ2hlY2sgaWYgZG9tYWluIGlz
IGRpcmVjdC1tYXAgbWVtb3J5IG1hcC4gKi8gI2RlZmluZQ0KPiA+ICtpc19kb21haW5fZGlyZWN0
X21hcHBlZChkKSAoZC0+b3B0aW9ucyAmIFhFTl9ET01DVExfQ0RGX2RpcmVjdG1hcCkNCj4gPg0K
PiA+ICAgc3RydWN0IHZ0aW1lciB7DQo+ID4gICAgICAgc3RydWN0IHZjcHUgKnY7DQo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCBiL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9kb21jdGwuaA0KPiA+IGluZGV4IDIzODM4NGI1YWUuLmI1MDVhMGRiNTEgMTAwNjQ0DQo+ID4g
LS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL2RvbWN0bC5oDQo+ID4gQEAgLTcyLDkgKzcyLDExIEBAIHN0cnVjdCB4ZW5fZG9tY3Rs
X2NyZWF0ZWRvbWFpbiB7DQo+ID4gICAjZGVmaW5lIFhFTl9ET01DVExfQ0RGX25lc3RlZF92aXJ0
ICAgICgxVSA8PA0KPiBfWEVOX0RPTUNUTF9DREZfbmVzdGVkX3ZpcnQpDQo+ID4gICAvKiBTaG91
bGQgd2UgZXhwb3NlIHRoZSB2UE1VIHRvIHRoZSBndWVzdD8gKi8NCj4gPiAgICNkZWZpbmUgWEVO
X0RPTUNUTF9DREZfdnBtdSAgICAgICAgICAgKDFVIDw8IDcpDQo+ID4gKy8qIElmIHRoaXMgZG9t
YWluIGhhcyBpdHMgbWVtb3J5IGRpcmVjdGx5IG1hcHBlZD8gKEFSTSBvbmx5KSAqLw0KPiA+ICsj
ZGVmaW5lIFhFTl9ET01DVExfQ0RGX2RpcmVjdG1hcCAgICAgICgxVSA8PCA4KQ0KPiA+DQo+ID4g
ICAvKiBNYXggWEVOX0RPTUNUTF9DREZfKiBjb25zdGFudC4gIFVzZWQgZm9yIEFCSSBjaGVja2lu
Zy4gKi8NCj4gPiAtI2RlZmluZSBYRU5fRE9NQ1RMX0NERl9NQVggWEVOX0RPTUNUTF9DREZfdnBt
dQ0KPiA+ICsjZGVmaW5lIFhFTl9ET01DVExfQ0RGX01BWCBYRU5fRE9NQ1RMX0NERl9kaXJlY3Rt
YXANCj4gDQo+IEluIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCB0aGlzIGZsYWcgd2FzIG9ubHkgc2V0
dGFibGUgZm9yIGRvbWFpbiBjcmVhdGVkIGJ5IFhlbi4NCj4gTm93IHRoaXMgaXMgYWxzbyBzZXR0
YWJsZSBieSB0aGUgdG9vbHN0YWNrLiBJIGRvbid0IHRoaW5rIHRoZSB0b29sc3RhY2sgY2FuDQo+
IHNlbnNpYmx5IHVzZSB0aGlzIGZsYWcgKGF0IGxlYXN0IGluIHRoZSBjdXJyZW50IHN0YXRlKS4N
Cj4gDQo+IFNvIGNhbiB5b3UgZXhwbGFpbiB3aHkgdGhpcyBmbGFnIGlzIGV4cG9zZWQgdG8gdGhl
IHRvb2xzdGFjaz8NCj4gDQoNCmlmIEkgbW92ZWQgWEVOX0RPTUNUTF9DREZfZGlyZWN0bWFwIHRv
IHRoZSBkb21haW4uaCwgYW5kIGxldCBpdCBob2xkIHRoZQ0KYml0IDgsIGluIGNhc2UgbGF0ZXIg
YW5vdGhlciBkZXZlbG9wZXIgd2FudHMgdG8gaW50cm9kdWNlIGEgbmV3IGZsYWcgdG8gYWNjaWRl
bnRseQ0KaG9sZCA4IGJpdCB0b28sIEkgd291bGQgbGlrZSB0byBhZGQgc29tZSBleHBsYW5hdG9y
eSBjb21tZW50cyBoZXJlIGFuZCBtYXliZSByZW5hbWUNCnRoZSBYRU5fRE9NQ1RMX0NERl9kaXJl
Y3RtYXAgdG8gWEVOX0RPTUNUTF9DREZfSW50ZXJuYWxfZGlyZWN0bWFwLCB3ZHl0Pw0KDQo+IENo
ZWVycywNCj4gDQo+IC0tDQoNCkNoZWVycw0KDQpQZW5ueSBaaGVuZw0KPiBKdWxpZW4gR3JhbGwN
Cg==

