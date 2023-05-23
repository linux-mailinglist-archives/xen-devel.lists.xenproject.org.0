Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70070D515
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 09:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538263.838100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MVx-0001mj-Vj; Tue, 23 May 2023 07:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538263.838100; Tue, 23 May 2023 07:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MVx-0001ku-SY; Tue, 23 May 2023 07:33:01 +0000
Received: by outflank-mailman (input) for mailman id 538263;
 Tue, 23 May 2023 07:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIFg=BM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q1MVw-0001ko-0I
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 07:33:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 091b3c29-f93c-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 09:32:56 +0200 (CEST)
Received: from DB6PR07CA0191.eurprd07.prod.outlook.com (2603:10a6:6:42::21) by
 DB9PR08MB7844.eurprd08.prod.outlook.com (2603:10a6:10:39f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Tue, 23 May 2023 07:32:53 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::38) by DB6PR07CA0191.outlook.office365.com
 (2603:10a6:6:42::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14 via Frontend
 Transport; Tue, 23 May 2023 07:32:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 07:32:52 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Tue, 23 May 2023 07:32:52 +0000
Received: from 13639c6974b2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CB0692C-8997-4BDF-9F4C-512F26EAA047.1; 
 Tue, 23 May 2023 07:32:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13639c6974b2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 May 2023 07:32:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6123.eurprd08.prod.outlook.com (2603:10a6:10:20a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 07:32:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 07:32:43 +0000
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
X-Inumbo-ID: 091b3c29-f93c-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueLP7IRQmccCYSodzUQhi55gYNLSPf8dyedW1AWxZfY=;
 b=qMpp8nqiXDz5sJ9+vSQwjlW3aEVDqHPUSDo4ifTwX1r6e+cjIUR9wJmo73CQQir+5kxu3BF5/JAJfAs4UtJiO/RKOGnM6q/ZOcwU5HcTVC8xluBCMatcC1pYOlMFeT0DUIXGFpScVwJENlQE4cXcSofLrthhgbSe7FQHFgxCBp0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrsrULf2EZI7TtHOH3B9N5Wd4Xj/eT42GMZ3a2pQglsUuJvGMmHSdM4maIZeHTOYerl52nRfQQsJOxVLvMkUo3Tylb7SHcjaZGom90COQa4qFQOWLKEvopM7ylT1XWWbfcnbC+dRAfP9qxPYuB/r8LxPrjFmqKPS82IftWmfOEVK4V9jzMSiUVAzSKX+1UlNbGwuy4yugcVjQYxTYEo9C6WnODla53JXQU2idHk13NQ2G2nbDUQ0NSd6+YHPrtU+Cn7HKXXl1MOW75frKM5rkKIISfSMoImJ3pwUNjUZ41DuphqVk8ayZSRdmke7DigEf0q56Gti5rICHirrUaKx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueLP7IRQmccCYSodzUQhi55gYNLSPf8dyedW1AWxZfY=;
 b=lzP0T0gqpapp850Itr6D0Vk0ZcUKxOXCneHiFpg9IiiUMIKLqYLQwZKAImvybk9ygEOjZB7lDIbKtlBUhvfAG6bLz8kkum2c2BUMuOdqSDMTczEq+gyY2CELHaoFU+W/qte8L+M2R5gBlkdxh4NrF8S4jdVTwFPJ4nLq2Ufo8YFJ8hSWoc/pERumhs91yIWMY/YOwekKas72pVDo0S+q6aPqVVbIT7ppHxu4ZN09Lpe3llzyH5LSoOAPiyebaMw1e9/ucEtj6gsfil1bGRhpM+yl752LTaASahKdrKLqmEptQcQW+jqvUGwpAXfIrhR/wddo5d5RbvzkDe25fIWOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueLP7IRQmccCYSodzUQhi55gYNLSPf8dyedW1AWxZfY=;
 b=qMpp8nqiXDz5sJ9+vSQwjlW3aEVDqHPUSDo4ifTwX1r6e+cjIUR9wJmo73CQQir+5kxu3BF5/JAJfAs4UtJiO/RKOGnM6q/ZOcwU5HcTVC8xluBCMatcC1pYOlMFeT0DUIXGFpScVwJENlQE4cXcSofLrthhgbSe7FQHFgxCBp0=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index:
 AQHZd0ulMpqFICe/LUiDVq6+aDsW9687sveAgAFTkCCAACNagIAAAPgggAADbgCAKli08IAADIuAgAADKTA=
Date: Tue, 23 May 2023 07:32:43 +0000
Message-ID:
 <AS8PR08MB7991C727E0A90875055DA1D492409@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
 <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <13635377-e296-370d-121b-5b617dc210bc@suse.com>
 <AS8PR08MB7991DCE0DFC850FEA920BF8C92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c195ef53-1151-1fb2-0cf9-f6f47d20b75e@suse.com>
 <AS8PR08MB79919CD7C233345113F8D5C992409@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <79859cfb-ab60-8661-e1ec-75fac74531b4@suse.com>
In-Reply-To: <79859cfb-ab60-8661-e1ec-75fac74531b4@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D034F9FEEDFF1545A02644F6BDD11414.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6123:EE_|DBAEUR03FT018:EE_|DB9PR08MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 46218956-1992-4988-d754-08db5b5feb07
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HVYVoXM5tNUFVTO/vFnUv5sWHq7yss3KehxCxS+Gc3f/tErge9khm300nBcGEOmPSCGsVgJd90D3k6w8Ow1pIwet8T4rM7UZvRkNuli1+0RT43iRiCaK/VPUJc25s/MLFJgCFQ4aLH9PBh5rzxZP7DSyJj4oPgTAlzXPreYOLqAh9kauUDBLFKp7EGFRvasIRYHSQzKgdVX+CSzVClZNVEyUMWVSLwPWoczJVGprN+JFO0bS+SMXdEsVd0ed3m56G5VIA0DBqnXmjZmReFjxOoXFBBlAY294BJPdkBJDZ8mM2F3F1S4NNwPwjeQwf7wAI7QlGEjj8A8mYkZEbDmpb/r/1S1Fb4MgA3mwTr3LYayVhH5x8CpImv6EUo2I3gMQfOpC2gTvct6cNrQlItOjyzOdrI3f+wIXeQXl3deA5Dufp/7nZlzQIC52K+FUxw+RE8pmwgSAsKe4z/GMNL8QIa724t7XFwImLADYPuQTU3PU+Ea3/4f3DoiaXaiEJWOcHA9GY1w0wHQuU0+gXzhm6KQ5EebEhRo5pF+BkO7H1llG3C8QYIGc295k7Czt6AcQUcTy7N6REbW13a0BNGwAJEeFsQi9mE1AFF3yyMQif3Y8B1K6DyhQNUpyPty/dyyo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(38070700005)(122000001)(38100700002)(33656002)(86362001)(55016003)(9686003)(52536014)(7696005)(6506007)(478600001)(8936002)(8676002)(2906002)(186003)(54906003)(4326008)(6916009)(64756008)(316002)(26005)(66446008)(71200400001)(5660300002)(41300700001)(66476007)(76116006)(66556008)(66946007)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6123
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f32ab2d-2e58-4cac-adc0-08db5b5fe5ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w00FU5YcyQYpao0j7QRtJVwS520WZ7FLwaer0EuNZD1Eltl7Nckyad0zH2lVbgEbtIB1zBus5+cBXnNH17TFPIqeb05QA//xJAOC82nPIFdYBURE/cInCmwUJjLC3qm6LMhqZCRnrI0B/U/H8pc7hQL8CJcWjyjEAN0DU3O6xzeBpZuddSpRfrjRRWP4Kkja3P298fYUUQl33yHZRE4OuHr3QqK1UHCQW0O4EOWEVwEsOpuAyYHhUhPINwcrgxiX8mIFEab6XbQUGvyphG4yOTqWBslrq5aFovo2Z+l1FQAqfpuf+OxX4mwre1s5XFAcvd1apBGc4uT2BlCHOZneTLsaUoLAj7VrY6TNCja0HmUaimTozLe0iZU7imdWroIYAhmvnMorgKVUOGcBs0msHfg95A3M4Nsotedj1a+3b3nscM0tDxXHV2HscuWtD4cgxyBuR8Mygm2OF00o1QWDILu/whvwMuoxUcatq+Nyk73ZuHGcSSXJ1q8kI3hQomflU5xteHbMQ3OtL12CM+Awjc7KgJbYjOKmZIc9n6RWmPCDMEbzyNngNNxSD23pxlEZ0RfWIgSX2X8sLuGj8Ri7l16EOXKIxIlXWlj6yWg+w0n3pw5Xk0oCzehv70HBd1xJXdSWDQxG0i4/ic0wZxM7mxF31x8TMnwqfqPAjgsKPkw2i4LeVueulPipCHSt36xeCmO3F6P5gFanBJTX+wsT8xXaBgfk6Dy9sDYIjlNPMm3fQ/F2+RAkIgIyR1wU7KlZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(52536014)(40460700003)(8676002)(6862004)(8936002)(47076005)(33656002)(36860700001)(83380400001)(336012)(186003)(356005)(81166007)(82740400003)(2906002)(86362001)(55016003)(82310400005)(40480700001)(6506007)(26005)(9686003)(316002)(70206006)(4326008)(70586007)(478600001)(41300700001)(54906003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 07:32:52.6237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46218956-1992-4988-d754-08db5b5feb07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7844

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMDkvMTddIHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBlciB0byBwYXJzZSBkZXZp
Y2UNCj4gdHJlZSBOVU1BIGRpc3RhbmNlIG1hcA0KPiANCj4gPj4+PiBUaGUgWzJdIGxpbmsgeW91
IHByb3ZpZGVkIGRpc2N1c3NlcyBOVU1BX0xPQ0FMX0RJU1RBTkNFLg0KPiA+Pj4NCj4gPj4+IEkg
aW5mZXJyZWQgdGhlIGRpc2N1c3Npb24gYXMgIndlIHNob3VsZCB0cnkgdG8ga2VlcCBjb25zaXN0
ZW50IGJldHdlZW4gdGhlDQo+ID4+IHZhbHVlDQo+ID4+PiB1c2VkIGluIGRldmljZSB0cmVlIGFu
ZCBBQ1BJIHRhYmxlcyIuIE1heWJlIG15IGluZmVyZW5jZSBpcyB3cm9uZy4NCj4gPj4+DQo+ID4+
Pj4gTG9va2luZyBhdA0KPiA+Pj4+IExpbnV4J2VzIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9u
dW1hLnR4dCwgdGhlcmUncyBubyBtZW50aW9uIG9mIGFuDQo+ID4+Pj4gdXBwZXIgYm91bmQgb24g
dGhlIGRpc3RhbmNlIHZhbHVlcy4gSXQgb25seSBzYXlzIHRoYXQgb24gdGhlIGRpYWdvbmFsDQo+
ID4+Pj4gZW50cmllcyBzaG91bGQgYmUgMTAgKGkuZS4gbWF0Y2hpbmcgQUNQSSwgd2l0aG91dCBy
ZWFsbHkgc2F5aW5nIHNvKS4NCj4gPj4+DQo+ID4+PiBJIGFncmVlIHRoYXQgdGhlIE5VTUEgZGV2
aWNlIHRyZWUgYmluZGluZyBpcyBhIGxpdHRsZSBiaXQgdmFndWUuIFNvIEkgY2Fubm90DQo+ID4+
PiBzYXkgdGhlIGNhc2UgdGhhdCB5b3UgcHJvdmlkZWQgaXMgbm90IHZhbGlkLiBJIHdvdWxkIGxp
a2UgdG8gYXNrIEFybQ0KPiA+PiBtYWludGFpbmVycw0KPiA+Pj4gKHB1dHRpbmcgdGhlbSBpbnRv
IFRvOikgb3BpbmlvbiBvbiB0aGlzIGFzIEkgdGhpbmsgSSBhbSBub3QgdGhlIG9uZSB0bw0KPiBk
ZWNpZGUNCj4gPj4gdGhlDQo+ID4+PiBleHBlY3RlZCBiZWhhdmlvciBvbiBBcm0uDQo+ID4+Pg0K
PiA+Pj4gQmVydHJhbmQvSnVsaWVuL1N0ZWZhbm86IFdvdWxkIHlvdSBwbGVhc2Uga2luZGx5IHNo
YXJlIHlvdXIgb3BpbmlvbiBvbg0KPiA+PiB3aGljaA0KPiA+Pj4gdmFsdWUgc2hvdWxkIGJlIHVz
ZWQgYXMgdGhlIGRlZmF1bHQgdmFsdWUgb2YgdGhlIG5vZGUgZGlzdGFuY2UgbWFwPyBEbw0KPiA+
PiB5b3UNCj4gPj4+IHRoaW5rIHJldXNpbmcgdGhlICJ1bnJlYWNoYWJsZSIgZGlzdGFuY2UsIGku
ZS4gMHhGRiwgYXMgdGhlIGRlZmF1bHQgbm9kZQ0KPiA+PiBkaXN0YW5jZQ0KPiA+Pj4gaXMgYWNj
ZXB0YWJsZSBoZXJlPyBUaGFua3MhDQo+ID4+DQo+ID4+IE15IHN1Z2dlc3Rpb24gd291bGQgYmUg
dG8sIHJhdGhlciB0aGFuIHJlamVjdGluZyB2YWx1ZXMgPj0gMHhmZiwgdG8gc2F0dXJhdGUNCj4g
Pj4gYXQgMHhmZSwgd2hpbGUga2VlcGluZyAweGZmIGZvciBOVU1BX05PX0RJU1RBTkNFIChhbmQg
b3ZlcmFsbCBrZWVwaW5nDQo+ID4+IHRoaW5ncw0KPiA+PiBjb25zaXN0ZW50IHdpdGggQUNQSSku
DQo+ID4NCj4gPiBTaW5jZSBpdCBoYXMgYmVlbiBhIHdoaWxlIGFuZCB0aGVyZSB3ZXJlIG5vIGZl
ZWRiYWNrIGZyb20gQXJtDQo+IG1haW50YWluZXJzLA0KPiA+IEkgd291bGQgbGlrZSB0byBmb2xs
b3cgeW91ciBzdWdnZXN0aW9ucyBmb3IgdjUuIEhvd2V2ZXIgd2hpbGUgSSB3YXMgd3JpdGluZw0K
PiB0aGUNCj4gPiBjb2RlIGZvciB0aGUgInNhdHVyYXRpb24iLCBpLmUuLCBhZGRpbmcgYmVsb3cg
c25pcHBldCBpbg0KPiBudW1hX3NldF9kaXN0YW5jZSgpOg0KPiA+IGBgYA0KPiA+IGlmICggZGlz
dGFuY2UgPiBOVU1BX05PX0RJU1RBTkNFICkNCj4gPiAgICAgICAgIGRpc3RhbmNlID0gTlVNQV9N
QVhfRElTVEFOQ0U7DQo+ID4gYGBgDQo+ID4gSSBub3RpY2VkIGFuIGlzc3VlIHdoaWNoIG5lZWRz
IHlvdXIgY2xhcmlmaWNhdGlvbjoNCj4gPiBDdXJyZW50bHksIHRoZSBkZWZhdWx0IHZhbHVlIG9m
IHRoZSBkaXN0YW5jZSBtYXAgaXMgTlVNQV9OT19ESVNUQU5DRSwNCj4gPiB3aGljaCBpbmRpY2F0
ZXMgdGhlIG5vZGVzIGFyZSBub3QgcmVhY2hhYmxlLiBJTUhPLCBpZiBpbiBkZXZpY2UgdHJlZSwg
d2UgZG8NCj4gPiBzYXR1cmF0aW9ucyBsaWtlIGFib3ZlIGZvciBBQ1BJIGludmFsaWQgZGlzdGFu
Y2VzIChkaXN0YW5jZXMgPj0gMHhmZiksIGJ5DQo+IHNhdHVyYXRpbmcNCj4gPiB0aGUgZGlzdGFu
Y2UgdG8gMHhmZSwgd2UgYXJlIG1ha2luZyB0aGUgdW5yZWFjaGFibGUgbm9kZXMgdG8gcmVhY2hh
YmxlLiBJDQo+IGFtDQo+ID4gbm90IHN1cmUgaWYgdGhpcyB3aWxsIGxlYWQgdG8gcHJvYmxlbXMu
IERvIHlvdSBoYXZlIGFueSBtb3JlIHRob3VnaHRzPw0KPiBUaGFua3MhDQo+IA0KPiBJIGNhbiBv
bmx5IGFuc3dlciB0aGlzIHdpdGggYSBxdWVzdGlvbiBiYWNrOiBIb3cgaXMgInVucmVhY2hhYmxl
Ig0KPiByZXByZXNlbnRlZA0KPiBpbiBEVD8gDQoNCkV4YWN0bHksIHRoYXQgaXMgYWxzbyB3aGF0
IHdlIEkgYW0gdHJ5aW5nIHRvIGZpbmQgYnV0IGZhaWxlZC4gTXkgdW5kZXJzdGFuZGluZw0KaXMg
dGhhdCwgdGhlIHNwZWMgb2YgTlVNQSBpcyBkZWZpbmVkIGluIHRoZSBBQ1BJLCBhbmQgdGhlIERU
IE5VTUEgYmluZGluZw0Kb25seSBzcGVjaWZpZXMgaG93IHVzZXJzIGNhbiB1c2UgRFQgdG8gcmVw
cmVzZW50IHRoZSBzYW1lIHNldCBvZiBBQ1BJIGRhdGEsDQppbnN0ZWFkIG9mIGRlZmluZSBhbm90
aGVyIHN0YW5kYXJkLg0KDQpCeSBsb29raW5nIGludG8gdGhlIGV4aXN0aW5nIGltcGxlbWVudGF0
aW9uIG9mIE5VTUEgZm9yIERULA0KaW4gTGludXgsIGZyb20gZHJpdmVycy9iYXNlL2FyY2hfbnVt
YS5jOiBudW1hX3NldF9kaXN0YW5jZSgpLCB0aGVyZSBpcyBhDQoiaWYgKCh1OClkaXN0YW5jZSAh
PSBkaXN0YW5jZSkiIHRoZW4gcmV0dXJuLiBTbyBJIHRoaW5rIGF0IGxlYXN0IGluIExpbnV4IHRo
ZQ0KZGlzdGFuY2UgdmFsdWUgaXMgY29uc2lzdGVudCB3aXRoIHRoZSBBQ1BJIHNwZWMuIA0KDQo+
IE9yIGlzICJ1bnJlYWNoYWJsZSIgc2ltcGx5IGV4cHJlc3NlZCBieSB0aGUgYWJzZW5jZSBvZiBh
bnkgZGF0YT8NCg0KTWF5YmUgSSBhbSB3cm9uZyBidXQgSSBkb24ndCB0aGluayBzbywgYXMgaW4g
dGhlIExpbnV4IGltcGxlbWVudGF0aW9uLA0KZHJpdmVycy9vZi9vZl9udW1hLmM6IG9mX251bWFf
cGFyc2VfZGlzdGFuY2VfbWFwX3YxKCksIHRoZSBmb3IgbG9vcA0KImZvciAoaSA9IDA7IGkgKyAy
IDwgZW50cnlfY291bnQ7IGkgKz0gMykiIGJhc2ljYWxseSBpbXBsaWVzIG5vIGZpZWxkcyBzaG91
bGQNCmJlIG9taXR0ZWQgaW4gdGhlIGRpc3RhbmNlIG1hcCBlbnRyeS4NCg0KS2luZCByZWdhcmRz
LA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

