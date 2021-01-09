Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A82F02F9
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 19:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64278.113667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyJRG-0005yw-I3; Sat, 09 Jan 2021 18:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64278.113667; Sat, 09 Jan 2021 18:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyJRG-0005yE-Dr; Sat, 09 Jan 2021 18:58:14 +0000
Received: by outflank-mailman (input) for mailman id 64278;
 Sat, 09 Jan 2021 18:58:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bs86=GM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kyJRF-0005y9-Fy
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 18:58:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c661441e-c73e-44db-91ac-5be634cb7675;
 Sat, 09 Jan 2021 18:58:09 +0000 (UTC)
Received: from AM6P191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::47)
 by AM0PR08MB4561.eurprd08.prod.outlook.com (2603:10a6:208:12d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 18:58:07 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::af) by AM6P191CA0070.outlook.office365.com
 (2603:10a6:209:7f::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 18:58:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 18:58:07 +0000
Received: ("Tessian outbound 4d8113405d55:v71");
 Sat, 09 Jan 2021 18:58:06 +0000
Received: from a6f31b9aa8dd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 39193A4D-F44D-44E0-B474-EB0D418C3B7B.1; 
 Sat, 09 Jan 2021 18:58:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6f31b9aa8dd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 09 Jan 2021 18:58:01 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB9PR08MB6634.eurprd08.prod.outlook.com (2603:10a6:10:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 18:57:59 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3742.007; Sat, 9 Jan 2021
 18:57:59 +0000
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
X-Inumbo-ID: c661441e-c73e-44db-91ac-5be634cb7675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBRUDxhFFsrNYP9jnQ5IR4tfq/uqzetuyFrSvvv/CtY=;
 b=gMFEZ7lAxZp5MnoTcIY8YaORwP/aegHmw8dBh79om94jdHKG8KGDny9yaU3QdMa0NPM1/YxtDoR6xrHOFk91Q22hR3DiuHpTyV4nfM3O88r1tzEAi3SprGXCX6e30mVtOUpd2ZZs6sDYaXSHT8MVqity0DWM8J03OeEogX0zGtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa42724e744d1eee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEfoFbjkKJjPtD+lXjUojAgtw0obrUqVq5es1UFyerLy3eDCbFzA/jgeOp8+o0AuvdlKrNUmAuUzc/tHwpsaEjgu/6sdgj4lL1NTphwnhUI3ZrnazQM9YPB3aS/RFTLSgiQYVady1OIFsyUMvrsXQXFaVWZ+3cRovoFQu2/pgz4HXV7PHDHkYzARBxni1GtQjT9R8xZ13A1MqcH+LJG6RWl92W0d+7GSb9gDufls2O9vrUwHtlHulFC9fidnhLUM7RNtMucd1rGlXrAhBiUIN1qQX63K+L10nBCW44+wVukxd+ugL/RPuZhL+J22GcpvYzSGGee7lSK2f/YNPXZm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBRUDxhFFsrNYP9jnQ5IR4tfq/uqzetuyFrSvvv/CtY=;
 b=erILjrtu9x5baST69I3Rd31x+3qVjrQFvPJstHbO2uuY3miEabb+e3kab2vuglxcZpq+rovgl166D/YDmKdd7DMed8Aw7uKdkPR+ZVaT52jGHVr0DgK0JMBQVfQ7PfyKZEi3VfL/A0mUDTeraxTG+nTB9NO5Jip5NcCWmvE3KSs727gWRNXqzBkX0IIuiRxchD0HgPH/Aj7a+Ee/CGCV7WDjaXOVqG+WO4xHjePNcGGjYiHl5SMbsZ+Kwc41VXRqplb35EvctVjGYO/6m+D5AoNb/bajsOth7hreJ18m6Tko9CBQpDgqK4R+6j9y/+/F32h/P4cloW9Rgj4CQrMwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBRUDxhFFsrNYP9jnQ5IR4tfq/uqzetuyFrSvvv/CtY=;
 b=gMFEZ7lAxZp5MnoTcIY8YaORwP/aegHmw8dBh79om94jdHKG8KGDny9yaU3QdMa0NPM1/YxtDoR6xrHOFk91Q22hR3DiuHpTyV4nfM3O88r1tzEAi3SprGXCX6e30mVtOUpd2ZZs6sDYaXSHT8MVqity0DWM8J03OeEogX0zGtc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 09/11] xen/arm: smmuv3: Use fallthrough pseudo-keyword
Thread-Topic: [PATCH v4 09/11] xen/arm: smmuv3: Use fallthrough pseudo-keyword
Thread-Index: AQHW5c3lM8m+gSvX8UGq06ErkkqKrKoehnIAgAEgogA=
Date: Sat, 9 Jan 2021 18:57:59 +0000
Message-ID: <B169351B-587B-4BC1-83B1-67C8C639F47A@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <36f9a1e88eea2f2c4cc413688c7210583a3433fe.1610115608.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2101081640190.26153@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101081640190.26153@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b2ea6d01-23df-4281-8bc8-08d8b4d08072
x-ms-traffictypediagnostic: DB9PR08MB6634:|AM0PR08MB4561:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4561DB32BDB172558980CEE2FCAD0@AM0PR08MB4561.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RSXFCc9FtrFcZnP32MHqO8dA+bhl53w/CGEykIdIk/ZSUWtZxGPsTCzkiJ3JzkBoCtqVz7wFT+jn0GtftETpXz9AGzizs4JeimNn2QUt1ThIAR23nrv0HfZVihA7Xa/Ox1Bzpeh1V/YaxAYIJZ/beWtxqIQVjAjBEC0AHXTE2MAi+Biab80EZl7ZPv7kaTgN/5hBQwlohJYXu0RqM3oSuynV5yA5/YNeXfS7Jw/STB4tI5BgWHx9n7eMs/b1YjPtOeEvLEc7glJ+RwDhghbMuYwRFKFCIR2oot77LGlGYt1h0MXG4i3vLygQuDJfh7rPFbch7Sdp3ujLBXYN3WHZiaDSWJK7IromhcUPDDvDf5JkTWEiq0z29J9f4i4H90bEcd5PKNNYmFtCwRnmlb0NtNr3Pdky2UjSeZPv/uabSr5RdsaofxsSShxqjJ4S1jXA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(136003)(366004)(346002)(4326008)(71200400001)(2906002)(2616005)(8676002)(186003)(6506007)(53546011)(6486002)(6512007)(33656002)(26005)(91956017)(54906003)(36756003)(86362001)(6916009)(478600001)(8936002)(316002)(83380400001)(5660300002)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SlIycitGK05IUkhSVXR3RHZPdzNtNG91MUpXaVpMRHFwSTJrRkhtT3ZwTmhw?=
 =?utf-8?B?ck5LTUV6WlRGT0RodmF1c0xWc1dKMzVkQ043a1RabTJZOWtUKzZvOFl2QUpz?=
 =?utf-8?B?WU1PVGcvdEx3TGZFTDRjU0EzeWorb0hvNFpjaVRQWGFXY2t6NG54aFRrNjZQ?=
 =?utf-8?B?UGhVM1Z2NXhPTlJyQ05CbU12ZEpVVXNmNkorRGhUaFJBZmlJeTF0cHBweEVH?=
 =?utf-8?B?MmdBWkJmNEM4R1dXVUF6WkdzK2V1dnVadUtYaEkxNGdGZ0RoeWJsbDJQZkM4?=
 =?utf-8?B?bHJ2N25kZUNYS2dxcFZOUzdoSTg2VVBpNUFOamYxV0RQWUE3cDk5RUJtK2lo?=
 =?utf-8?B?WFJva0U2NnhtUmswZ1NNOVFPejQzbk4vUU5wVWh2TTNWTTY0eGFxdUVmeE5x?=
 =?utf-8?B?UVFRMmd0SWRkd1Y4TzdZR1M3VVJQM3dCaHNUdFd1L3RONlhEblo0ZHlzWGFF?=
 =?utf-8?B?Z280M3RONUVkQng1YkRhSDFNelRiR2tXM2NvZ3hwQXQvL3lVc3pCOGxFcTRB?=
 =?utf-8?B?aGRQYTZTeUp4Vk9oQzdrNUw1TDFXUVZhOEQ0VURqQldwVi9EcEE0NlB0aTNF?=
 =?utf-8?B?SjNNUXJONXJITGRyRWt4dW1tY2dpZXhHZDRvVWdsUUJmRjMrbm9hdnJHSlRs?=
 =?utf-8?B?ZG5YZFdwNENaV3cvZ1hoalF0OXg1aXBWMG9pY2tzMGFHd3pUN2tHWlNVSjRM?=
 =?utf-8?B?RWlETHB2SVVNR21OSzl6UERuclRBeXUyellsV3RYc3JTUG15bFNQSCszaHlB?=
 =?utf-8?B?TUlubkxWOStoRU5IV2EwQk53bUY4REp0NENra3ludzArSlJZOGFtQTFDZmJk?=
 =?utf-8?B?SmlsTzhSdHBuNFFQNlhEMTdMcExqQ0hmYm54MG8wQS81bk9sYWVCNCt1SVJS?=
 =?utf-8?B?ZEV5NzVLYmtrZFR6QzViK1crZEVCZm1yc0Z4QW5iYnFGdG9nL0ZrdzQ2aW03?=
 =?utf-8?B?eUpoZlpmcXNLR2c3alNseWZrL3JaZS9vMjYzNGRURW9CTGRoRi85MzlOVXo3?=
 =?utf-8?B?a0JkcCt1S2Fqc2svYkhFRFU4SENwZkpudG00QjZ2aFRKZnI2a1l5TkdEMWxY?=
 =?utf-8?B?VkQ2Uk56c2hyUC9Kc3p3VzduUS8zUFNuQ29iVk5maXNmMUxoVUFkRGVEa0VF?=
 =?utf-8?B?SytiQUNOWGNROHZSQ1BBSTA3OG52ZVZhcVNWTWtBY0VmeUxPS1BicWZ3NkNw?=
 =?utf-8?B?VzB4S0FNTlZBN3RZT05RN2gvVzFqd2FSajEwYXpWZG1vakJscXg2RTc3Z2FU?=
 =?utf-8?B?ekNPQ3Fjeis4ZzBSdjhKcStrc01FZmlUTkNwQjAvbVVQOHo4MGhuTHNVZTV4?=
 =?utf-8?Q?vzJFh2zgwhvC4LaEAKvG3JDr63CPHFEi/C?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB83F320FEC04842811E508F8AE95E78@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6634
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dde44d3d-ca77-453f-2e90-08d8b4d07bc0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YaWcZfc8EakVvgtYrtvjrqZX+PRILGXsQwU4npSP9kWNA1yXpsL6H1/cFsUx5sRrdTFY5Qq1rlivHYeVEar+PUGJc0RunJI896fOE8sotPynLzJKYtSIzFMhPNmmn8PVdLih3rWpaUXQugReGDvk2rv2Qv/q4JmMO639wvadwig2QTbtFV7OUxCY7e6MSrdWmFHIlwL+F+TbxJqnn0roKrE7e50YG5OLYVkS8uKEXajgW8GD28g/vZCexuFlddRdkfPDeE1E8DNgIYQUiXwxYcRshntLXclnbvxh6vIVbtZJy9QP4CkEksVx8zFAAi0dCHKB3DDWh3zoX7FUyZOiEJ/dILJuiFvsoavuRV9oMMkPR+yRhiQKsmaqNUtmfDidnRiEIvn4iqFlZeCMOu2Hm23I8y8psqYYhQgFjWKRo68tPevfSlwB3eWCTFuIr8h1CPREGhDizEcXFRq1eg+ko+x0mLVtzyNHeSgs/Zj6cqdnHWRgJ8e9k48xARx3uKjR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(46966006)(81166007)(8936002)(2616005)(86362001)(6506007)(2906002)(33656002)(107886003)(478600001)(356005)(70206006)(53546011)(336012)(70586007)(47076005)(83380400001)(6486002)(6512007)(34020700004)(5660300002)(6862004)(54906003)(36756003)(186003)(26005)(8676002)(4326008)(82310400003)(316002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 18:58:07.3573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ea6d01-23df-4281-8bc8-08d8b4d08072
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4561

SGVsbG8gU3RlZmFubywNCg0KVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHNlcmllcy4NCg0KPiBP
biA5IEphbiAyMDIxLCBhdCAxOjQ0IGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCA4IEphbiAyMDIxLCBSYWh1bCBTaW5n
aCB3cm90ZToNCj4+IE1lcmdlIHRoZSBwYXRjaCBmcm9tIGxpbnV4IHRvIHVzZSBmYWxsdGhyb3Vn
aCBwc2V1ZG8ta2V5d29yZC4NCj4+IA0KPj4gUmVwbGFjZSB0aGUgZXhpc3RpbmcgLyogZmFsbCB0
aHJvdWdoICovIGNvbW1lbnRzIGFuZCBpdHMgdmFyaWFudHMgd2l0aA0KPj4gdGhlIG5ldyBwc2V1
ZG8ta2V5d29yZCBtYWNybyBmYWxsdGhyb3VnaFsxXS4gQWxzbywgcmVtb3ZlIHVubmVjZXNzYXJ5
DQo+PiBmYWxsLXRocm91Z2ggbWFya2luZ3Mgd2hlbiBpdCBpcyB0aGUgY2FzZS4NCj4+IA0KPj4g
U2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+PiAtLS0N
Cj4+IENoYW5nZXMgaW4gVjQ6DQo+PiAtIFRoaXMgcGF0Y2ggaXMgaW50cm9kdWNlIGluIHRoaXMg
dmVyaXNvbi4NCj4+IC0tLQ0KPj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMu
YyB8IDcgKysrLS0tLQ0KPj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Fy
bS9zbW11LXYzLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQo+PiBp
bmRleCA1Y2UxNDg1MGI0Li5mNWY4YjRjOTgxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL3NtbXUtdjMuYw0KPj4gQEAgLTkzMiw3ICs5MzIsNiBAQCBzdGF0aWMgdm9pZCBhcm1f
c21tdV9jbWRxX3NraXBfZXJyKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+PiAJCSAq
Lw0KPj4gCQlyZXR1cm47DQo+PiAJY2FzZSBDTURRX0VSUl9DRVJST1JfSUxMX0lEWDoNCj4+IC0J
CS8qIEZhbGx0aHJvdWdoICovDQo+IA0KPiBUaGUgZmFsbHRocm91Z2gga2V5d29yZCBpcyB1bm5l
Y2Vzc2FyeSBoZXJlIGJlY2F1c2Ugb2YgZGVmYXVsdCwgcmlnaHQ/DQoNClllcyB5b3UgYXJlIHJp
Z2h0IGZhbGx0aHJvdWdoIGtleXdvcmQgaXMgdW5uZWNlc3NhcnkgaGVyZSBiZWNhdXNlICAiLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaOKAnSB3aWxsIG5vdCB0aHJvdWdoIHRoZSB3YXJuaW5nIHdoZW4g
YSBjYXNlIGxhYmVsIGZhbGxzIHRocm91Z2ggdG8gYSBjYXNlIHRoYXQgYnJlYWtzIG9yIHJldHVy
bnMuVGhlcmVmb3JlIHRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZSB0aGUgZmFsbHRocm91Z2gga2V5
d29yZCBoZXJlLg0KDQpSZWdhcmRzLA0KUmFodWwNCg0KPiANCj4gDQo+PiAJZGVmYXVsdDoNCj4+
IAkJYnJlYWs7DQo+PiAJfQ0KPj4gQEAgLTI0ODgsNyArMjQ4Nyw3IEBAIHN0YXRpYyBpbnQgYXJt
X3NtbXVfZGV2aWNlX2h3X3Byb2JlKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+PiAJ
c3dpdGNoIChGSUVMRF9HRVQoSURSMF9TVEFMTF9NT0RFTCwgcmVnKSkgew0KPj4gCWNhc2UgSURS
MF9TVEFMTF9NT0RFTF9GT1JDRToNCj4+IAkJc21tdS0+ZmVhdHVyZXMgfD0gQVJNX1NNTVVfRkVB
VF9TVEFMTF9GT1JDRTsNCj4+IC0JCS8qIEZhbGx0aHJvdWdoICovDQo+PiArCQlmYWxsdGhyb3Vn
aDsNCj4+IAljYXNlIElEUjBfU1RBTExfTU9ERUxfU1RBTEw6DQo+PiAJCXNtbXUtPmZlYXR1cmVz
IHw9IEFSTV9TTU1VX0ZFQVRfU1RBTExTOw0KPj4gCX0NCj4+IEBAIC0yNTA1LDcgKzI1MDQsNyBA
QCBzdGF0aWMgaW50IGFybV9zbW11X2RldmljZV9od19wcm9iZShzdHJ1Y3QgYXJtX3NtbXVfZGV2
aWNlICpzbW11KQ0KPj4gCXN3aXRjaCAoRklFTERfR0VUKElEUjBfVFRGLCByZWcpKSB7DQo+PiAJ
Y2FzZSBJRFIwX1RURl9BQVJDSDMyXzY0Og0KPj4gCQlzbW11LT5pYXMgPSA0MDsNCj4+IC0JCS8q
IEZhbGx0aHJvdWdoICovDQo+PiArCQlmYWxsdGhyb3VnaDsNCj4+IAljYXNlIElEUjBfVFRGX0FB
UkNINjQ6DQo+PiAJCWJyZWFrOw0KPj4gCWRlZmF1bHQ6DQo+PiBAQCAtMjU4OSw3ICsyNTg4LDcg
QEAgc3RhdGljIGludCBhcm1fc21tdV9kZXZpY2VfaHdfcHJvYmUoc3RydWN0IGFybV9zbW11X2Rl
dmljZSAqc21tdSkNCj4+IAlkZWZhdWx0Og0KPj4gCQlkZXZfaW5mbyhzbW11LT5kZXYsDQo+PiAJ
CQkidW5rbm93biBvdXRwdXQgYWRkcmVzcyBzaXplLiBUcnVuY2F0aW5nIHRvIDQ4LWJpdFxuIik7
DQo+PiAtCQkvKiBGYWxsdGhyb3VnaCAqLw0KPj4gKwkJZmFsbHRocm91Z2g7DQo+PiAJY2FzZSBJ
RFI1X09BU180OF9CSVQ6DQo+PiAJCXNtbXUtPm9hcyA9IDQ4Ow0KPj4gCX0NCj4+IC0tIA0KPj4g
Mi4xNy4xDQoNCg==

