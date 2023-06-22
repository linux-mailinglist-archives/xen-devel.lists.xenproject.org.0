Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03C739C7C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 11:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553435.863995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGSG-0001Qn-HN; Thu, 22 Jun 2023 09:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553435.863995; Thu, 22 Jun 2023 09:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGSG-0001NL-DB; Thu, 22 Jun 2023 09:18:16 +0000
Received: by outflank-mailman (input) for mailman id 553435;
 Thu, 22 Jun 2023 09:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFZZ=CK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qCGSF-0001Ml-MQ
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 09:18:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7d00::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b61ec0dd-10dd-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 11:18:12 +0200 (CEST)
Received: from AS9PR05CA0157.eurprd05.prod.outlook.com (2603:10a6:20b:496::24)
 by DU0PR08MB9776.eurprd08.prod.outlook.com (2603:10a6:10:443::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 09:18:07 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:496:cafe::db) by AS9PR05CA0157.outlook.office365.com
 (2603:10a6:20b:496::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 09:18:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 09:18:07 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Thu, 22 Jun 2023 09:18:06 +0000
Received: from ba41415727ed.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF3CE3B8-5E22-4270-A262-CDA22D6493B7.1; 
 Thu, 22 Jun 2023 09:17:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba41415727ed.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 22 Jun 2023 09:17:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8034.eurprd08.prod.outlook.com (2603:10a6:150:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 09:17:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 09:17:57 +0000
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
X-Inumbo-ID: b61ec0dd-10dd-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTjSkr3n/T3ri/NdMKah3oBnCnAw955m4HsRV40jRI0=;
 b=hIuxSmyckM8XlMWsptL/nMDb+6Kq+j4c0FJY3QmQHuZ5M0nUv8FrkGcN2+rNQZmPdxzU3UFcs/nLoLazzU0tV0iP0A8vv2qXQwJUvMxUOMORGGxAW+FPcWrnifR7XNXCGY71HeA06H8oVcGnawdNOyPSiPx83xZOoWVDMGC0dyQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b25946707d7468a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imTWhGmaLfzGNai8Odvv252jYSSlsIVNizAIl+CYrVtKS4+xD4iIl+2hm1EbDlet3l+yGhUZ5ZY0mS38gC9ncBQTPg20AY02uzSzOvp0+ozB7hAYa5ieL6YzYDM7tS8eDnRYNIf+2emeriFLSac2iRlE8PTWak1MEqikX5GsHpXL0sftz/ahAS45ydmeSYlByYrjweApYsc7iAsKSx5DirYVuvtUA7/DLcIf5uEf73jLDA2fjeVbKD7F2oJqyr8H/f25+AkqucHcmcib9oWnFv0SQpxXS6TfxMYYGIh0l+Q0dUnwEbN86UGmEY/l0BpUKPQWURmeJNN8ErEF8WbOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTjSkr3n/T3ri/NdMKah3oBnCnAw955m4HsRV40jRI0=;
 b=lCrxe72Nf90yrgZKQ0REZfBEaMlzK5MnRZsYgSdPdHIt3O7fUER1mGjuCRzI/Eu7dAyRqzDDnk7BN6rYYcBeeyuHIclapVVgxsqPQVqaQIyuIVM7IEtevO0BI/b10mQhH+EUPZSEFOsw/sVNHf6Sy1IxQ7yews615tOio8jSWaPVFuIjheYs5BhYvuFY/T7PHBYFTgbiAdxfU4za+EN3KB0ryS5DNiTIRykDEXbHJP5yVgXrFtlFW+Yth4wkyZZwnwqbojONjFsONSVZoOtg5JffhO0BIrCH/BkWs/b4KnCeRZR5OpzBygNqdIH/A5ZA8Eqo6EpdYocYwWcEHbyxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTjSkr3n/T3ri/NdMKah3oBnCnAw955m4HsRV40jRI0=;
 b=hIuxSmyckM8XlMWsptL/nMDb+6Kq+j4c0FJY3QmQHuZ5M0nUv8FrkGcN2+rNQZmPdxzU3UFcs/nLoLazzU0tV0iP0A8vv2qXQwJUvMxUOMORGGxAW+FPcWrnifR7XNXCGY71HeA06H8oVcGnawdNOyPSiPx83xZOoWVDMGC0dyQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] tools/python: Fix memory leak on error path
Thread-Topic: [PATCH 2/2] tools/python: Fix memory leak on error path
Thread-Index: AQHZmhGBKe4OoL9s40qPc71ZQnCAd6+WoK6A
Date: Thu, 22 Jun 2023 09:17:57 +0000
Message-ID: <FD528CE9-3F97-447C-917D-0EDB7C263D87@arm.com>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
 <20230608135913.560413-2-luca.fancellu@arm.com>
In-Reply-To: <20230608135913.560413-2-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8034:EE_|AM7EUR03FT050:EE_|DU0PR08MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: f04a4b48-ebe4-4505-c122-08db73019729
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sfKa1JiR+n2V3t68SnZKGjrFQooTG3k77jWm/XLwCz6mC6G3obRgaytfn8DWig9dsQmYd/esT13QvrBlsL76RD19Y3bnZRLivoTysBcQUt11thRu91VdO5FL3Q29T6qHeiE5P/L5PGPNYjrmWOCXsNfWrfJczFxnI7Olgw0ADAyeWYMiPLt+4CFjz0iViVbzfRW/D3Zrhb+0G8T+ApEhdfnKaXonXG6ZALY2zXnsNJxMJw/sPidci5hjNcG9Q6R0uE8lX4Pwjwbu45Mwv4xmNQYsVFE2vtrl8gza0E1E+JGwQmGpver7GMNl2GiIcfPuGKCTUUV8NdZlZfDxFbY9EVY8s/C425z1ZBEtUwUWeGMvE+5Q6vkVe4iO6YRx+8kYUdxPLfeNN5BcGj2SvPRDuW0QDgxRLf+1v6kAAiSnMLeVNJdTOQNrLUXfOr2UZW/RpIglRPzcS7LIH+wsMWWa5bap40/YtYohIjgp7d/SGmITgrSewIn4YXu8ee6tFvd3A0kreBMj+YccK0lGDnXU/rcG8JaS7p5J6DQYAH66K2HM4CJ0XQ+UpxwLInFY+FK1hBAcIxMn+B5VzsEzqE7eJJqPbmLxnDM8pjIvJD1lGZmSSiHwuxi4fYmZhAd7fx7a5/fPRlp0ps8bnqs+aq+/Pg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(38100700002)(122000001)(2906002)(38070700005)(83380400001)(36756003)(33656002)(86362001)(6506007)(53546011)(2616005)(6512007)(26005)(186003)(71200400001)(54906003)(6486002)(478600001)(64756008)(91956017)(66446008)(66946007)(66556008)(66476007)(76116006)(41300700001)(8676002)(316002)(6916009)(5660300002)(4326008)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D667228D5808A4ABB206298770B9F0F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8034
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7291004d-a774-4e95-614f-08db730191a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1DEszmpmefJJxb+OE+jpBQcl0yhrpDSY7iVEP7oFaikVbhkhSJjOT1AAfKnpyKqvZG9QWazzgT62kushcvvBYrurf3vRfWzmD25oChUMn5iVlw2BHX6mFZAq8dXnSpDWE0CQe385uH4f8gzOQvlhHF6GdbePlYQrFkYPNF/WgQytZdL/0Gb5WQm9puCnlEvKTGT2y0QuEa4SZ3lw5h7zfF/WtehyoautkI/GdoO62NPyhfjW89SgzEZS5DcjzgHMp2muX3LKXBc3ykUdgMcXK86+IP2G14kjkOtdFvvkMh6JR27E2tyWp9/Kk9NJBhO2l1gf4v8TMXfSHlBN7W5WOP3XcEvXVsed+oGt5PD92EODCQEsjAfQmoAxC0yRFM3z2j+Bk+4nLFTnnW1w8OxWKMq3Wz07b/EKofv34nWUFLOpJ7Y8nHFtv25dHr3jFWhXCnbr1WrQ6eG1FlfwUw75kxdA3W21RNKGgE9Hre6k1p39KvQCu492XtEtdowpD70KFNKXam823DQ34KZKFg6ymNP76haVcxgqFcxbPeehg6oaiephK0aBTTZlr5YShcJO3thha6y5bcAYmcAMOp6jX5twJtJwNla7/XbJqRiLHMXHS2UDQNgJv+WI42jrRTgPDogk67npnApZVp/G2n5iJY11JGFtho/WxZJ2B/+mKzpXAH6SmYDaH9aekOtaBMyWibCeLGZ0Rhjjtr6PDnGUaKmRxOK6iHH9y5NZ0uRDk3kpqJMv/AX+hQRH9rlfpM0p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(46966006)(36840700001)(40470700004)(8676002)(5660300002)(8936002)(40480700001)(316002)(41300700001)(2906002)(6916009)(4326008)(40460700003)(70206006)(70586007)(33656002)(336012)(478600001)(54906003)(36756003)(6486002)(82740400003)(86362001)(82310400005)(53546011)(186003)(6512007)(2616005)(81166007)(356005)(47076005)(83380400001)(6506007)(36860700001)(107886003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 09:18:07.0846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f04a4b48-ebe4-4505-c122-08db73019729
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9776

DQoNCj4gT24gOCBKdW4gMjAyMywgYXQgMTQ6NTksIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2Vs
bHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBDb21taXQgNTZhN2FhYTE2YmZlIGludHJvZHVjZWQg
YSBtZW1vcnkgbGVhayBvbiB0aGUgZXJyb3IgcGF0aCBmb3IgYQ0KPiBQeV9CdWlsZFZhbHVlIGJ1
aWx0IG9iamVjdCB0aGF0IG9uIHNvbWUgbmV3bHkgaW50cm9kdWNlZCBlcnJvciBwYXRoDQo+IGhh
cyBub3QgdGhlIGNvcnJlY3QgcmVmZXJlbmNlIGNvdW50IGhhbmRsaW5nLCBmaXggdGhhdCBieSBk
ZWNyZW1lbnRpbmcNCj4gdGhlIHJlZmNvdW50IGluIHRoZXNlIHBhdGguDQo+IA0KPiBGaXhlczog
NTZhN2FhYTE2YmZlICgidG9vbHM6IGFkZCBwaHlzaW5mbyBhcmNoX2NhcGFiaWxpdGllcyBoYW5k
bGluZyBmb3IgQXJtIikNCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gLS0tDQoNCkhpIGFsbCwNCg0KSXMgdGhlcmUgYW55IGNoYW5jZSB0
byBoYXZlIHRoaXMgb25lIHJldmlld2VkIGJ5IHRoZSBlbmQgb2YgdGhlIG1vbnRoPw0KSeKAmW0g
YXNraW5nIGJlY2F1c2UgSSBoYXZlIGEgSmlyYSB0YXNrIGF0dGFjaGVkIHRvIHRoaXMgcGF0Y2gg
YW5kIG15IFBNIGlzIGNoYXNpbmcgbWUgOikNCg0KSWYgaXTigJlzIG5vdCBwb3NzaWJsZSBpdOKA
mXMgZmluZSBlaXRoZXIgYW5kIEnigJlsbCBoYXZlIGp1c3QgdG8gcmVwb3J0IHRoYXQuDQoNCkNo
ZWVycywNCkx1Y2ENCg0KPiB0b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMgfCA5ICsr
KysrKystLQ0KPiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYyBi
L3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPiBpbmRleCBlMTRlMjIzZWM5MDMu
LmQzZWEzNTBlMDdiOSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94
Yy94Yy5jDQo+ICsrKyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPiBAQCAt
OTE5LDExICs5MTksMTYgQEAgc3RhdGljIFB5T2JqZWN0ICpweXhjX3BoeXNpbmZvKFhjT2JqZWN0
ICpzZWxmKQ0KPiAgICAgICAgIHN2ZV92bF9iaXRzID0gYXJjaF9jYXBhYmlsaXRpZXNfYXJtX3N2
ZShwaW5mby5hcmNoX2NhcGFiaWxpdGllcyk7DQo+ICAgICAgICAgcHlfYXJtX3N2ZV92bCA9IFB5
TG9uZ19Gcm9tVW5zaWduZWRMb25nKHN2ZV92bF9iaXRzKTsNCj4gDQo+IC0gICAgICAgIGlmICgg
IXB5X2FybV9zdmVfdmwgKQ0KPiArICAgICAgICBpZiAoICFweV9hcm1fc3ZlX3ZsICkgew0KPiAr
ICAgICAgICAgICAgUHlfREVDUkVGKG9ianJldCk7DQo+ICAgICAgICAgICAgIHJldHVybiBOVUxM
Ow0KPiArICAgICAgICB9DQo+IA0KPiAtICAgICAgICBpZiggUHlEaWN0X1NldEl0ZW1TdHJpbmco
b2JqcmV0LCAiYXJtX3N2ZV92bCIsIHB5X2FybV9zdmVfdmwpICkNCj4gKyAgICAgICAgaWYoIFB5
RGljdF9TZXRJdGVtU3RyaW5nKG9ianJldCwgImFybV9zdmVfdmwiLCBweV9hcm1fc3ZlX3ZsKSAp
IHsNCj4gKyAgICAgICAgICAgIFB5X0RFQ1JFRihweV9hcm1fc3ZlX3ZsKTsNCj4gKyAgICAgICAg
ICAgIFB5X0RFQ1JFRihvYmpyZXQpOw0KPiAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gKyAg
ICAgICAgfQ0KPiAgICAgfQ0KPiAjZW5kaWYNCj4gDQo+IC0tIA0KPiAyLjM0LjENCj4gDQo+IA0K
DQo=

