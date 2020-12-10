Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C52D6217
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 17:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49539.87623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOxG-0003ay-VR; Thu, 10 Dec 2020 16:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49539.87623; Thu, 10 Dec 2020 16:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOxG-0003aZ-RA; Thu, 10 Dec 2020 16:38:10 +0000
Received: by outflank-mailman (input) for mailman id 49539;
 Thu, 10 Dec 2020 16:38:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knOxF-0003Z3-10
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 16:38:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::611])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed6f33ec-5f2b-4bbc-8585-5f62605f5f63;
 Thu, 10 Dec 2020 16:38:07 +0000 (UTC)
Received: from AM5PR0701CA0052.eurprd07.prod.outlook.com (2603:10a6:203:2::14)
 by AM0PR08MB4081.eurprd08.prod.outlook.com (2603:10a6:208:12b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 16:38:05 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::c2) by AM5PR0701CA0052.outlook.office365.com
 (2603:10a6:203:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Thu, 10 Dec 2020 16:38:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 16:38:04 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Thu, 10 Dec 2020 16:38:04 +0000
Received: from f8ef368ec943.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7EB63844-9FDF-49C4-A5F9-438B19995B10.1; 
 Thu, 10 Dec 2020 16:37:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8ef368ec943.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 16:37:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB3993.eurprd08.prod.outlook.com (2603:10a6:10:ad::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 16:37:47 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 16:37:47 +0000
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
X-Inumbo-ID: ed6f33ec-5f2b-4bbc-8585-5f62605f5f63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tuYGK+NQTwfNA/B1wXFLTrbshqLP5tP6teJ5Jdu3Hc=;
 b=pdcboBcc84WlCgXp+cyJvQSW2rN/MQaj52fSa7WAFTM0d40X/iwOPN7NxXmgdL2YVY5D9ljGPfw65+AWtKWCtOyi62NPtTU9CO9kOsSYoLmJjhCjZLSz4kkB3rmE+C3Djhb5kZeFaPmbkas47c5umczWKaQ0ro3fGCr4fqR9YqM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: af727b833209f434
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR4/KQL/DZPtPrXcu7rl3snQy2pLJbVbjbr1qtLsBOsI8jQKQk00xzXrqlAJSuO9bFbodcF9cmlrhsuhvDF0soJ/nxiAbIKGnrAyEpsgBFNZJ0v3JIEuuZ60bewnarrG7ro0CaEwQVwpDudxvkgYozs8jCmLk8HI0X0Dxq0e9z7ijrq+KPKZTxzxcN+g6a/SaFd0vAnXXCvk+0NsIcX0UtgpAcrFDzfpQK4DA94NSzqndG+Tjgoc9zHJdJ1ikiLEshw0NllrZ9NbM4IgOY2LyK+ulg00Oyi40lpPf6WDLTaRW/I7j9dpi/QkcfmpY0LIKhOApT9VdIwitINbkZbtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tuYGK+NQTwfNA/B1wXFLTrbshqLP5tP6teJ5Jdu3Hc=;
 b=BrdOTJ9K0EZlWASNa7hfDn7Kl03E/Jwr7mfiKjqF1dmoOasiNn8qsaWZxnCmh3UdKWWwoCEhuAjAcMGGesodoi3LS6+HTadof+ic+WAizQT/q2bvAiNRLpE3xfWEBjztKtaB9GFsZ7vzbJUJJ9UWokIPbWfqhrwA7T6Qiv62ryloKWuo9R01YILps9mWLpCE+/42bpMbPob628wF3OcOg2Avgy3iAO58SMraKT2ZJexnAIr8zeIS9//5rgAcOmjepE8e+8Q7/lLqt2816uIQQqluWEPYuLG2aebacfSyTP/3DKjn9SfeA43ecg5jPc3VBhI3k9UMBAxJSW54l2UOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tuYGK+NQTwfNA/B1wXFLTrbshqLP5tP6teJ5Jdu3Hc=;
 b=pdcboBcc84WlCgXp+cyJvQSW2rN/MQaj52fSa7WAFTM0d40X/iwOPN7NxXmgdL2YVY5D9ljGPfw65+AWtKWCtOyi62NPtTU9CO9kOsSYoLmJjhCjZLSz4kkB3rmE+C3Djhb5kZeFaPmbkas47c5umczWKaQ0ro3fGCr4fqR9YqM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Topic: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Index:
 AQHWzklW+4XymezDRUeCGhvhzW8UY6nvZCkAgAEXL4CAAAS6AIAAAyYAgAADzoCAAAH7AA==
Date: Thu, 10 Dec 2020 16:37:47 +0000
Message-ID: <706337B0-8C4B-4CFE-99A3-650C149291FB@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
 <61b2677c-bc0d-af0b-95f8-f8de76a20856@xen.org>
 <BD35BA39-FE40-4752-9B21-CCD0F0D963B0@arm.com>
 <0ad1c0d0-a3f2-da98-0a0f-b90736cc11dc@xen.org>
 <FA121B9D-0B9F-4636-A7FC-0548C05E31F0@arm.com>
 <3630cf94-1fb8-a337-dde7-16907da9af3f@xen.org>
In-Reply-To: <3630cf94-1fb8-a337-dde7-16907da9af3f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f17724fb-b2f1-404c-edc4-08d89d29f7b4
x-ms-traffictypediagnostic: DB8PR08MB3993:|AM0PR08MB4081:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4081E3DCDF747C1A1B6E65DF9DCB0@AM0PR08MB4081.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KkAaWfuHECRkw+ZTOYJagveBUily9oiA3Jxb10HFxdihj0BnTSYzi/GynEL1JBhu3YfYBEmPwawmauYmSoCr/xOAYZbaDnbDrcSBEH2AbCA8dYjpjUHBPwD+O+qHNBUemPDTFygunchxic0epRTlQKnCKvAzPAyoR2o2v0a3P+QB+BAuXVrE8ruycSjgfN0Tv4HSfq6MjgNlBUoDu2aBTAiiTbeMUv+RQEseSFOSZ5rdLhPm65NAOkrjLiLzUZQIPp5RwBzrrhoxXclLAb0iWjK3zlUet1RtZxB5f4YWwArJc+H92nSigXwGffvagiFMezlWTR183PbBakjBP+RSn5+MeSwlHrkt1VrCESsxSbOVsoaCdOKOCnZ3SqV//bpy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(5660300002)(66946007)(33656002)(186003)(6506007)(53546011)(8676002)(2616005)(71200400001)(26005)(64756008)(86362001)(54906003)(316002)(76116006)(83380400001)(66556008)(66446008)(8936002)(6512007)(6486002)(66476007)(2906002)(36756003)(478600001)(91956017)(6916009)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?QUZrKytTNFRyZklGcFVGNE94OWp6SGFGNGIwT25lc0VNUUFRNmNLbkhFMTBJ?=
 =?utf-8?B?YU1VWTcrKzkxZTJxdnovS3R1Unl0bGhmNGM1U2VJdG1URDFMQy9rUmwybUtr?=
 =?utf-8?B?bE04Z1Y2VGlrNTFLYU13cHFBU2xRdGVrcUFoeEFzbmlBeGozU3RuWWV6Ny9I?=
 =?utf-8?B?Z2dUd2hUNGM3STVVQkZRYlJmRmFoRGpPcVJtd1g4UnAxSndXUXlJeksxM3cr?=
 =?utf-8?B?VXQrNUg1TWJ2VlAxcVcvWEN3Q0h4QnpRMkwvVnlVZG4xNkhKa054OTdDYWdv?=
 =?utf-8?B?cThlVjhtZWIrMXNvRmtIcFN6T0ZhNTQyL2xIaHlpcWh2dU5UQkVvZk45bHZB?=
 =?utf-8?B?dWNaRnhza3JjaXpuQlBKT3BKZ3hDVkY2UGtnMkxVUUg2c0FPc3l0VHF3UWhD?=
 =?utf-8?B?ZmFsRFZNZ3o0V1JuL2FONzdBTzczc0E3WVlZWFdJZmVwV29uYUNxNis1ZEZG?=
 =?utf-8?B?YTR4Q3VJSGpxUTdyb2cvUUdncE45NkQ4ZS9WRXpadjFINjlHeis4cVFMNlJU?=
 =?utf-8?B?VDM0NlhDYzRiZFhIQlZEN0NNZGpjUlZtKzVlYUMzTUtlQlgzYm9YVnBrZ3pG?=
 =?utf-8?B?WklESm5WS0ZGYlJ4Qm82ZTJDcUR2NE5CSER4M2RnZkxtRU14bm84Q2tEKzFx?=
 =?utf-8?B?YWVJVkE4THhidU5DNHIrMDJVT2dYWXp6NVFoWkFOZFpYaDF4L0hCdWNSM1dG?=
 =?utf-8?B?K1JWSHRza2VWSlVyTDFJYmRWNTdCWkdkTmZ6OWkzNGluczJYZlpjcHR2MExp?=
 =?utf-8?B?OTdrTklTZm1VMzc5RE9sNVNiZS9BOTdySUsvU210Q1djU0x1TWNaUTVnRjhK?=
 =?utf-8?B?dGdyMGRlRTkxRHBhTFA3RnladWZ1WmhFelNUaGM3VStLSCtvTEpLblNTU0Ra?=
 =?utf-8?B?YXRGdXFDMDVBVnQvc0k2WXNrMEcrL2NlbFpUYUl4R0JWSmphZEJybWZOd0Nt?=
 =?utf-8?B?b0ozb1JYOU9iL2k5L0JpMTFOOFVIUEZQODJ1b1kzV0lHTFE5ZGZlSTBaYU02?=
 =?utf-8?B?c0xzUW5XdzV3TlFlNHpiSnNjaHdYWTF3RnVHclEvdUFhVzhzdHB5RGJjdnkz?=
 =?utf-8?B?bHZqTlh6S1Z1M25hV2VlMmxEd1Q3K3hyUzhZRFRGWHJwQi85K1VXcG1rL1Ro?=
 =?utf-8?B?Qll4UFhaY2xacTE1NEpETCtESUVjYVRjQ3FFVzhFODlIRm9RUXlDb0xMSlQv?=
 =?utf-8?B?Rnk1azlGY0QraEwyY1pnOHpDSU5OTWY5Nnp2Sy94ZWZLQmx4eVFOUW1SMmlY?=
 =?utf-8?B?TVJoVmNFUDlsOEdhdFluL0ZkZUh2NTFyNlc2ZnNaYXFJcWc3aFMxYVBFemlC?=
 =?utf-8?Q?hpn5Ub3BIgWhz4LSQ3JcEitwufy53BgHuE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <863532BA7DCC524DB7EAC5621CB8B76C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3993
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cbb6a300-fae2-4ce6-fc2c-08d89d29ed60
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XPbz0/p8KPxtddnkrOCacDZ/W0y5hmnszZqokeDLkJVlB98HFD9ufPAjshRqbtKS2JE1yADFmhLIq05w0y4xpWzPs0Ty7YsyQ2QlONuT/lQnsvjV+cunVjBgfNStUrEd26i/pLNuorlrW8xd426NweeJKdrk/gpFcIGTdHAcjeVFBmWvhWTBSno3VzHlS9VX+C0UcEn6NyCQUf42GGabvCoxn4m0b3a+tdpwAdb44YjQOAqDOqX8NovSMAVksDqcUck3Uybo27Zz7uMjRlKr/ebfATYePLNLRWcqq04MmRS7j6/o44kBqfKLF7TzVSnZyoGQ7pVj6F3abOzm3q12ZKCDretx4Url2jf8qbK/T/x4hg+/9ziubi2cldbXln+ldds9ObuUXmuGbHK7A9Q8tg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(33656002)(8676002)(8936002)(4326008)(54906003)(5660300002)(70206006)(70586007)(107886003)(6506007)(36756003)(2906002)(478600001)(83380400001)(186003)(82310400003)(6486002)(36906005)(6862004)(316002)(26005)(82740400003)(6512007)(2616005)(47076004)(336012)(53546011)(356005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 16:38:04.7235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f17724fb-b2f1-404c-edc4-08d89d29f7b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4081

SGkgSnVsaWVuLA0KDQo+IE9uIDEwIERlYyAyMDIwLCBhdCAxNjozMCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDEwLzEyLzIwMjAgMTY6MTcs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBCZXJ0cmFu
ZCwNCj4gDQo+Pj4gT24gMTAgRGVjIDIwMjAsIGF0IDE2OjA1LCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+PiBPbiAxMC8xMi8yMDIwIDE1
OjQ4LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBIaSBKdWxpZW4sDQo+Pj4+PiBPbiA5
IERlYyAyMDIwLCBhdCAyMzowOSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6
DQo+Pj4+PiANCj4+Pj4+IEhpIEJlcnRhbmQsDQo+Pj4+PiANCj4+Pj4+IE9uIDA5LzEyLzIwMjAg
MTY6MzAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4gQ3JlYXRlIGEgY3B1aW5mbyBz
dHJ1Y3R1cmUgZm9yIGd1ZXN0IGFuZCBtYXNrIGludG8gaXQgdGhlIGZlYXR1cmVzIHRoYXQNCj4+
Pj4+PiB3ZSBkbyBub3Qgc3VwcG9ydCBpbiBYZW4gb3IgdGhhdCB3ZSBkbyBub3Qgd2FudCB0byBw
dWJsaXNoIHRvIGd1ZXN0cy4NCj4+Pj4+PiBNb2RpZnkgc29tZSB2YWx1ZXMgaW4gdGhlIGNwdWlu
Zm8gc3RydWN0dXJlIGZvciBndWVzdHMgdG8gbWFzayBzb21lDQo+Pj4+Pj4gZmVhdHVyZXMgd2hp
Y2ggd2UgZG8gbm90IHdhbnQgdG8gYWxsb3cgdG8gZ3Vlc3RzIChsaWtlIEFNVSkgb3Igd2UgZG8g
bm90DQo+Pj4+Pj4gc3VwcG9ydCAobGlrZSBTVkUpLg0KPj4+Pj4+IFRoZSBjb2RlIGlzIHRyeWlu
ZyB0byBncm91cCB0b2dldGhlciByZWdpc3RlcnMgbW9kaWZpY2F0aW9ucyBmb3IgdGhlDQo+Pj4+
Pj4gc2FtZSBmZWF0dXJlIHRvIGJlIGFibGUgaW4gdGhlIGxvbmcgdGVybSB0byBlYXNpbHkgZW5h
YmxlL2Rpc2FibGUgYQ0KPj4+Pj4+IGZlYXR1cmUgZGVwZW5kaW5nIG9uIHVzZXIgcGFyYW1ldGVy
cyBvciBhZGQgb3RoZXIgcmVnaXN0ZXJzIG1vZGlmaWNhdGlvbg0KPj4+Pj4+IGluIHRoZSBzYW1l
IHBsYWNlIChsaWtlIGVuYWJsaW5nL2Rpc2FibGluZyBIQ1IgYml0cykuDQo+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+
Pj4+IC0tLQ0KPj4+Pj4+IENoYW5nZXMgaW4gVjI6IFJlYmFzZQ0KPj4+Pj4+IENoYW5nZXMgaW4g
VjM6DQo+Pj4+Pj4gICBVc2UgY3VycmVudF9jcHVfZGF0YSBpbmZvIGluc3RlYWQgb2YgcmVjYWxs
aW5nIGlkZW50aWZ5X2NwdQ0KPj4+Pj4+IC0tLQ0KPj4+Pj4+ICB4ZW4vYXJjaC9hcm0vY3B1ZmVh
dHVyZS5jICAgICAgICB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+
Pj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oIHwgIDIgKysNCj4+Pj4+PiAgMiBm
aWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspDQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9jcHVmZWF0dXJlLmMgYi94ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5jDQo+Pj4+Pj4g
aW5kZXggYmM3ZWU1YWM5NS4uNzI1NTM4MzUwNCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vY3B1ZmVhdHVyZS5jDQo+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2NwdWZlYXR1cmUu
Yw0KPj4+Pj4+IEBAIC0yNCw2ICsyNCw4IEBADQo+Pj4+Pj4gICAgREVDTEFSRV9CSVRNQVAoY3B1
X2h3Y2FwcywgQVJNX05DQVBTKTsNCj4+Pj4+PiAgK3N0cnVjdCBjcHVpbmZvX2FybSBfX3JlYWRf
bW9zdGx5IGd1ZXN0X2NwdWluZm87DQo+Pj4+Pj4gKw0KPj4+Pj4+ICB2b2lkIHVwZGF0ZV9jcHVf
Y2FwYWJpbGl0aWVzKGNvbnN0IHN0cnVjdCBhcm1fY3B1X2NhcGFiaWxpdGllcyAqY2FwcywNCj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICppbmZvKQ0KPj4+
Pj4+ICB7DQo+Pj4+Pj4gQEAgLTE1Nyw2ICsxNTksNTUgQEAgdm9pZCBpZGVudGlmeV9jcHUoc3Ry
dWN0IGNwdWluZm9fYXJtICpjKQ0KPj4+Pj4+ICAjZW5kaWYNCj4+Pj4+PiAgfQ0KPj4+Pj4+ICAr
LyoNCj4+Pj4+PiArICogVGhpcyBmdW5jdGlvbiBpcyBjcmVhdGluZyBhIGNwdWluZm8gc3RydWN0
dXJlIHdpdGggdmFsdWVzIG1vZGlmaWVkIHRvIG1hc2sNCj4+Pj4+PiArICogYWxsIGNwdSBmZWF0
dXJlcyB0aGF0IHNob3VsZCBub3QgYmUgcHVibGlzaGVkIHRvIGd1ZXN0Lg0KPj4+Pj4+ICsgKiBU
aGUgY3JlYXRlZCBzdHJ1Y3R1cmUgaXMgdGhlbiB1c2VkIHRvIHByb3ZpZGUgSUQgcmVnaXN0ZXJz
IHZhbHVlcyB0byBndWVzdHMuDQo+Pj4+Pj4gKyAqLw0KPj4+Pj4+ICtzdGF0aWMgaW50IF9faW5p
dCBjcmVhdGVfZ3Vlc3RfY3B1aW5mbyh2b2lkKQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAgICAvKg0K
Pj4+Pj4+ICsgICAgICogVE9ETzogVGhlIGNvZGUgaXMgY3VycmVudGx5IHVzaW5nIG9ubHkgdGhl
IGZlYXR1cmVzIGRldGVjdGVkIG9uIHRoZSBib290DQo+Pj4+Pj4gKyAgICAgKiBjb3JlLiBJbiB0
aGUgbG9uZyB0ZXJtIHdlIHNob3VsZCB0cnkgdG8gY29tcHV0ZSB2YWx1ZXMgY29udGFpbmluZyBv
bmx5DQo+Pj4+Pj4gKyAgICAgKiBmZWF0dXJlcyBzdXBwb3J0ZWQgYnkgYWxsIGNvcmVzLg0KPj4+
Pj4+ICsgICAgICovDQo+Pj4+Pj4gKyAgICBndWVzdF9jcHVpbmZvID0gY3VycmVudF9jcHVfZGF0
YTsNCj4+Pj4+IA0KPj4+Pj4gSXQgd291bGQgYmUgbW9yZSBsb2dpY2FsIHRvIHVzZSBib290X2Nw
dV9kYXRhIGFzIHRoaXMgd291bGQgYmUgZWFzaWVyIHRvIG1hdGNoIHdpdGggeW91ciBjb21tZW50
Lg0KPj4+PiBBZ3JlZSwgSSB3aWxsIGZpeCB0aGF0IGluIFY0Lg0KPj4+Pj4gDQo+Pj4+Pj4gKw0K
Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX0FSTV82NA0KPj4+Pj4+ICsgICAgLyogRGlzYWJsZSBNUEFN
IGFzIHhlbiBkb2VzIG5vdCBzdXBwb3J0IGl0ICovDQo+Pj4+Pj4gKyAgICBndWVzdF9jcHVpbmZv
LnBmcjY0Lm1wYW0gPSAwOw0KPj4+Pj4+ICsgICAgZ3Vlc3RfY3B1aW5mby5wZnI2NC5tcGFtX2Zy
YWMgPSAwOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIC8qIERpc2FibGUgU1ZFIGFzIFhlbiBkb2Vz
IG5vdCBzdXBwb3J0IGl0ICovDQo+Pj4+Pj4gKyAgICBndWVzdF9jcHVpbmZvLnBmcjY0LnN2ZSA9
IDA7DQo+Pj4+Pj4gKyAgICBndWVzdF9jcHVpbmZvLnpmcjY0LmJpdHNbMF0gPSAwOw0KPj4+Pj4+
ICsNCj4+Pj4+PiArICAgIC8qIERpc2FibGUgTVRFIGFzIFhlbiBkb2VzIG5vdCBzdXBwb3J0IGl0
ICovDQo+Pj4+Pj4gKyAgICBndWVzdF9jcHVpbmZvLnBmcjY0Lm10ZSA9IDA7DQo+Pj4+Pj4gKyNl
bmRpZg0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIC8qIERpc2FibGUgQU1VICovDQo+Pj4+Pj4gKyNp
ZmRlZiBDT05GSUdfQVJNXzY0DQo+Pj4+Pj4gKyAgICBndWVzdF9jcHVpbmZvLnBmcjY0LmFtdSA9
IDA7DQo+Pj4+Pj4gKyNlbmRpZg0KPj4+Pj4+ICsgICAgZ3Vlc3RfY3B1aW5mby5wZnIzMi5hbXUg
PSAwOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIC8qIERpc2FibGUgUkFTIGFzIFhlbiBkb2VzIG5v
dCBzdXBwb3J0IGl0ICovDQo+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfQVJNXzY0DQo+Pj4+Pj4gKyAg
ICBndWVzdF9jcHVpbmZvLnBmcjY0LnJhcyA9IDA7DQo+Pj4+Pj4gKyAgICBndWVzdF9jcHVpbmZv
LnBmcjY0LnJhc19mcmFjID0gMDsNCj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4gKyAgICBndWVzdF9j
cHVpbmZvLnBmcjMyLnJhcyA9IDA7DQo+Pj4+Pj4gKyAgICBndWVzdF9jcHVpbmZvLnBmcjMyLnJh
c19mcmFjID0gMDsNCj4+Pj4+IA0KPj4+Pj4gSG93IGFib3V0IGFsbCB0aGUgZmllbGRzIHRoYXQg
YXJlIGN1cnJlbnRseSBtYXJrZWQgYXMgUkVTMC9SRVMxPyBTaG91bGRuJ3Qgd2UgbWFrZSBzdXJl
IHRoZXkgd2lsbCBzdGF5IGxpa2UgdGhhdCBldmVuIGlmIG5ld2VyIGFyY2hpdGVjdHVyZSB1c2Ug
dGhlbT8NCj4+Pj4gRGVmaW5pdGVseSB3ZSBjYW4gZG8gbW9yZSB0aGVuIHRoaXMgaGVyZSAoaW5j
bHVkaW5nIGFsbG93aW5nIHRvIGVuYWJsZSBzb21lIHRoaW5ncyBmb3IgZG9tMCBvciBmb3IgdGVz
dCByZWFzb25zKS4NCj4+Pj4gVGhpcyBpcyBhIGZpcnN0IHRyeSB0byBzb2x2ZSBjdXJyZW50IGlz
c3VlcyB3aXRoIE1QQU0gYW5kIFNWRSBhbmQgSSBwbGFuIHRvIGNvbnRpbnVlIHRvIGVuaGFuY2Ug
dGhpcyBpbiB0aGUgZnV0dXJlDQo+Pj4+IHRvIGVuYWJsZSBtb3JlIGN1c3RvbWlzYXRpb24gaGVy
ZS4NCj4+Pj4gSSBkbyB0aGluayB3ZSBjb3VsZCBkbyBhIGJpdCBtb3JlIGhlcmUgdG8gaGF2ZSBz
b21lIGZlYXR1cmVzIGNvbnRyb2xsZWQgYnkgdGhlIHVzZXIgYnV0IHRoaXMgd2lsbCBuZWVkIGEg
Yml0IG9mDQo+Pj4+IGRpc2N1c3Npb24gdG8gYWdyZWUgb24gYSBzdHJhdGVneS4NCj4+PiANCj4+
PiBJIHRoaW5rIHlvdSBtaXN1bmRlcnN0b29kIG15IGNvbW1lbnQuIEkgYW0gbm90IGFza2luZyB3
aGV0aGVyIHdlIHdhbnQgdG8gY3VzdG9taXplIHRoZSB2YWx1ZSBwZXIgZG9tYWluLiBJbnN0ZWFk
LCBJIGFtIHJhaXNpbmcgcXVlc3Rpb25zIGZvciB0aGUgc3RyYXRlZ3kgdGFrZW4gaW4gdGhpcyBw
YXRjaC4NCj4+PiANCj4+PiBJIGFtIGdvaW5nIHRvIGxlYXZlIHRoZSBzYWZldHkgYXNpZGUsIGJl
Y2F1c2UgSSB0aGluayB0aGlzIGlzIG9ydGhvZ29uYWwgdG8gdGhpcyBwYXRjaC4NCj4+PiANCj4+
PiBUaGlzIHBhdGNoIGlzIGludHJvZHVjaW5nIGEgZGVueSBsaXN0LiBUaGlzIG1lYW5zIHRoYXQg
YWxsIHRoZSBmZWF0dXJlcyB3aWxsIGJlIGV4cG9zZWQgdG8gYSBkb21haW4gdW5sZXNzIHNvbWVv
bmUgZGV0ZXJtaW5lIHRoYXQgdGhpcyBpcyBub3QNCj4+PiBzdXBwb3J0ZWQgYnkgWGVuLg0KPj4+
IA0KPj4+IFRoaXMgbWVhbnMgd2Ugd2lsbCBhbHdheXMgdHJ5IHRvIGNhdGNoIHVwIHdpdGggd2hh
dCBBcm0gZGVjaWRlZCB0byBpbnZlbnQgYW5kIGF0dGVtcHQgdG8gZml4IGl0IGJlZm9yZSB0aGUg
c2lsaWNvbiBpcyBvdXQuDQo+Pj4gDQo+Pj4gSW5zdGVhZCwgSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gdXNlIGFuIGFsbG93IGxpc3QuIFdlIHNob3VsZCBvbmx5IGV4cG9zZSBmZWF0dXJl
cyB0byB0aGUgZ3Vlc3Qgd2Uga25vdyB3b3JrcyAodGhpcyBjb3VsZCBwb3NzaWJseSBiZSBqdXN0
IHRoZSBBcm12OC4wIG9uZSkuDQo+PiBJIHVuZGVyc3Rvb2QgdGhhdCBhbmQgSSBmdWxseSBhZ3Jl
ZSB0aGF0IHRoaXMgaXMgd2hhdCB3ZSBzaG91bGQgZG86IG9ubHkgZXhwb3NlIHdoYXQgd2Ugc3Vw
cG9ydCBhbmQga25vdyBhbmQgbGV0IGV2ZXJ5dGhpbmcgZWxzZSBhcyDigJxkaXNhYmxlZOKAnS4N
Cj4+IEFuZCBJIGRlZmluaXRlbHkgd2FudCB0byBkbyB0aGF0IGFuZCBJIHRoaW5rIHdpdGggdGhp
cyBzZXJpZSB3ZSBoYXZlIHRoZSByZXF1aXJlZCBzdXBwb3J0IHRvIGRvIHRoYXQsIHdlIHdpbGwg
bmVlZCB0byByZXdvcmsgaG93IHdlIGluaXRpYWxpc2UgdGhlDQo+PiBndWVzdF9jcHVpbmZvIHN0
cnVjdHVyZS4NCj4+IEkganVzdCB3YW50IHRvIGxlYXZlIHRoaXMgZGlzY3Vzc2lvbiBmb3IgYWZ0
ZXIgc28gdGhhdCB3ZSBjYW4gYXQgbGVhc3QgcmlnaHQgbm93IGhhdmUgYSBjdXJyZW50IGxpbnV4
IGJvb3Rpbmcgd2l0aG91dCB0aGUgbmVlZCB0byBtb2RpZnkgdGhlIGxpbnV4DQo+PiBrZXJuZWwg
YmluYXJ5IHRvIHJlbW92ZSB0aGluZ3MgbGlrZSBTVkUuDQo+IA0KPiBPay4gU28gdGhpcyBwYXRj
aCBpcyBtb3JlIHRvIGZpbGwgdGhlIGdhcCByYXRoZXIgdGhhbiB0aGUgZmluYWwgc29sdXRpb24u
IFRoaXMgc2hvdWxkIGJlIGNsYXJpZmllZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCkkgY2Fu
IGFkZCB0aGF0IGluIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KPiANCj4gQWx0aG91Z2gsIGl0IGlz
IHN0aWxsIHVuY2xlYXIgdG8gbWUgd2h5IHRoaXMgY2FuJ3QgYmUgYW4gYWxsb3dsaXN0IGZyb20g
dGhlIHN0YXJ0LiBBcyB5b3Ugc2FpZCwgdGhlIGluZnJhc3RydWN0dXJlIGlzIGFscmVhZHkgdGhl
cmUuIFNvIGl0IHdvdWxkIGJlIGEgbWF0dGVyIG9mIGNvcHlpbmcgYml0cyB3ZSBrbm93IHdvcmsg
d2l0aCBYZW4gKHJhdGhlciB0aGFuIGNsb2JlcnJpbmcpLg0KDQpUaGUgYW5hbHlzaXMgdG8gZG8g
dGhhdCBwcm9wZXJseSBtaWdodCByZXF1aXJlIG1vcmUgd29yayBhcyB3ZSBzaG91bGQgc3RhcnQg
ZnJvbSBldmVyeXRoaW5nIG9mZiBhbmQgdGhlbiBnb2luZyBvbmUgYnkgb25lIGFuZCBtYWtpbmcg
c3VyZSB3ZSBub3Qgb25seSBkbyB0aGF0IGhlcmUgYnV0IGFsc28gaW4gSENSIHJlZ2lzdGVyIGJp
dHMuDQoNCkhlcmUgd2UgYXJlIGp1c3QgZXhwbGljaXRlbHkg4oCcaGlkaW5n4oCdIGZlYXR1cmVz
IHdoaWNoIGlzIHNvbWVob3cgZWFzeSB0byByZXZpZXcgYW5kIGNoZWNrLg0KDQpJIHdpbGwgbm90
IGhhdmUgdGltZSB0byBpbnZlc3RpZ2F0ZSBkZWVwZXIgdGhlbiB3aGF0IEkgZGlkIGFscmVhZHkg
YmVmb3JlIHRoZSBuZXh0IHhlbiByZWxlYXNlLg0KU28gYmVzdCBpIGNhbiBkbyBpcyBjaGFuZ2Ug
dGhpcyBwYXRjaCB0byBub3QgbW9kaWZ5IGFueXRoaW5nIGluIHRoZSBndWVzdF9jcHVpbmZvIHNv
IHRoYXQgc29tZW9uZSBlbHNlIGNhbiBkbyB0aGF0IHdvcmsgb24gdG9wIG9mIHRoaXMgc2VyaWUu
DQpJIGhhdmUgcGxhbm5lZCBzb21lIHRpbWUgdG8gd29yayBvbiBjb250aW51aW5nIHRoaXMgd29y
aywgYnV0IG5vdCBiZWZvcmUgbWFyY2guDQoNClJlZ2FyZHMNCkJlcnRyYW5kDQoNCj4gDQo+IENo
ZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

