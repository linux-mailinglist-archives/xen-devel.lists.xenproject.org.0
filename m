Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA003ECE7B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 08:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167163.305112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVrr-0007WZ-By; Mon, 16 Aug 2021 06:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167163.305112; Mon, 16 Aug 2021 06:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVrr-0007Um-8I; Mon, 16 Aug 2021 06:13:03 +0000
Received: by outflank-mailman (input) for mailman id 167163;
 Mon, 16 Aug 2021 06:13:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eR/w=NH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFVrp-0007Ug-QM
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 06:13:01 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 014ef70a-fe59-11eb-a442-12813bfff9fa;
 Mon, 16 Aug 2021 06:12:59 +0000 (UTC)
Received: from DU2PR04CA0258.eurprd04.prod.outlook.com (2603:10a6:10:28e::23)
 by PAXPR08MB6350.eurprd08.prod.outlook.com (2603:10a6:102:15b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 06:12:57 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::27) by DU2PR04CA0258.outlook.office365.com
 (2603:10a6:10:28e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Mon, 16 Aug 2021 06:12:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 06:12:57 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Mon, 16 Aug 2021 06:12:57 +0000
Received: from 716b5b8c657f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60DA8248-7124-46E8-BC4D-FE6770124EC1.1; 
 Mon, 16 Aug 2021 06:12:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 716b5b8c657f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Aug 2021 06:12:46 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3952.eurprd08.prod.outlook.com (2603:10a6:803:de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 06:12:44 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Mon, 16 Aug 2021
 06:12:44 +0000
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
X-Inumbo-ID: 014ef70a-fe59-11eb-a442-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvwoCVA58ndNI2NI0XBZln8fgZlsgMf1RkcRUufc6So=;
 b=S+Wzo+vLhwrobWr6WMIzEhDtB0Gkh1d5rzkJycX3/6qeo56pjbYDWdLWwmn6soQpZGLs9uuVk0iv6Exw98hodfUcyS7nBrtFabPTqRM4rrHZO4qIEusCkXkfW6mNv8nhoUswtVwSbKSTPYKblvnYyCW5pIFZBBSHMoq2ULxE2KI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/H7U8WlB4Ur1+AapX1pfU7CzkwGfjYRdCYZaVRZw4Td6ItCQnQK1J/orMMg74HUqa+gnW0XNU4hvOz8RRJWumdrkNSMgpZWPmkoghSuuKZ5o7m5JKfQf3xZl6tO/eH7uZWeB0pEBZKgXwR7TgN1L+KO23ANrddLt2yT+Qs9QMfaPKZHEoxKBXg10FmFgTRhfxQjgXoM0+4gXeQmVEYuydwdfwGYeg/ubFyLAPo3Wvo+VzqWH/iWloO0qAfd1f79kwifVbs4DTk5c1SdexGfo0uttbmcIJjIDiGUh9/4GZXcZ13DMik7kJXEpVy0XWqBpP5n8lKdwb3O5Ygm34pqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvwoCVA58ndNI2NI0XBZln8fgZlsgMf1RkcRUufc6So=;
 b=jCKHYNRdCs4WBfQ4uCCYPd58+bX9lttOaKicPTlDGbs3fs8YI3d/M/W+Vill4gHyNuL4cPaSN0hnpMg7PraAmP3u20DuTtx3kYc4/Ddo/q2c+RqBlOll1y6/+dl5ZVkI2QC+lKTAv/iQ652bRfFpHlZfVSukbreqttke7cZcxCz+3/Z1i0rD4ALcPvWKpanDVagfS7bl+at395PrczjNv5/C1M7YjYsorzkQKQintbWUW0Z2jZrsYvz3H2NfxwtrHs8vogu++XLvsbadKSPBH5U9MhorUlWFBFsX8c+bIgQ/mRzPuzk5pcvbHUv20aN8w0wgOgRyk2jAvMLimaNKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvwoCVA58ndNI2NI0XBZln8fgZlsgMf1RkcRUufc6So=;
 b=S+Wzo+vLhwrobWr6WMIzEhDtB0Gkh1d5rzkJycX3/6qeo56pjbYDWdLWwmn6soQpZGLs9uuVk0iv6Exw98hodfUcyS7nBrtFabPTqRM4rrHZO4qIEusCkXkfW6mNv8nhoUswtVwSbKSTPYKblvnYyCW5pIFZBBSHMoq2ULxE2KI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 05/10] xen/arm: static memory initialization
Thread-Topic: [PATCH V4 05/10] xen/arm: static memory initialization
Thread-Index: AQHXg5tWmR00uV2Z30qwTXivYZepy6txdBIAgARN83A=
Date: Mon, 16 Aug 2021 06:12:44 +0000
Message-ID:
 <VE1PR08MB52159DE4BEF0755B8FEF687DF7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-6-penny.zheng@arm.com>
 <6d131379-68e8-ff26-d579-db2afd678072@xen.org>
In-Reply-To: <6d131379-68e8-ff26-d579-db2afd678072@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 09D2B7ACD894FA439C6D68E6AE4A7AF1.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e6a1f4b3-588b-4a56-d774-08d9607ce485
x-ms-traffictypediagnostic: VI1PR08MB3952:|PAXPR08MB6350:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB635055FE3EB9133BDFAFD917F7FD9@PAXPR08MB6350.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wU69MY1M0g/IJdhxeB73l5fvfFDQEOzCJSOk1fqz0kw/km1cPGu57sUjnJJhUvrRJJwZZtoh+MgvbYTPpBHhJYbWn6OVfgtPlPiKRp+y+4A1XRC1gnUg58oinOLsaVNxjPa0g/MLstF5GVFF2Pk7d3Ixmc8a0A3y/yBgWTchBGOiVetkOxaKo2b6TXnjrQ1mYeiYUi2MEvRKNpPmbJWYo4hKvCTCZv38XAPHFfd7GCoOBBnGEFw3bw6BIi0EXrbLYT6dTO2MiquOSwDlUZPStldXuGK/7qLBwylaq7ZSFZgz0Gx7H4xSabLhHt4m9C0WAf2iJIuFoNWEYugo0LbKVPmtNEUikbjjJDg6cmh6yc1BbXO3AYtJY4ul1ydw3SggSo7KFnobit7EESaZj1ImkDHte7H2U8nanpckPTRoy2hcSH/F3Nd/Ma9fTt0eDKYrv07KAYiWcHULbQlrsxnps01nEcNcwRACoxxHZ5eKGF1pt0cjMXwKFVqNhF43+XE/H47CNgytuukhhHetrpqLvC/QE0ggSo93XIF+5xlVffsxdpwTGaZ+QG8mPTkfLXASXiS17WwP7evzmjTUn+zUGe5jOqlpZstNi6+2pI3NmJCICJNgJbLLt2y+x2+z30Wri+tw75EPtuFZat2ybcGIJ8+V2d5f8/0wA6BetAwtI7wvQ9tmd9EpUTy/+fNa/9dqABHHgw6nXWnQbeV+DPVtNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(9686003)(53546011)(2906002)(8936002)(110136005)(66946007)(66446008)(4326008)(5660300002)(66556008)(86362001)(76116006)(64756008)(66476007)(33656002)(52536014)(498600001)(54906003)(186003)(38070700005)(8676002)(6506007)(71200400001)(55016002)(83380400001)(7696005)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGdIcy9nV05ZbGNHM0R3UHUxMnBzd0tFaU8rTGZBTEYzVHVjNk50M0N3VTNr?=
 =?utf-8?B?R1BnMDZrYVpFY085ckZXVGxMU25tRlYyQS9pdVNkV055ano4a0lTS2QvNVBx?=
 =?utf-8?B?RUVjQ0xsQnhiRUhrVHJMcCt0eFhteHJCZUFEYTB5bjNaQ0I0blBIR2tBZGt5?=
 =?utf-8?B?Nm5nR0Z2Wkp5dVVYdTN0RGxLOVprVlNCbXRJbjNLTG9JTDJhcXpjVGlnSnhu?=
 =?utf-8?B?d0dJa1pGeW8yN3Btck05NDdPOXltT2ZUeXdIcUdrMDFGSkxLNyt1Q3g0OXM2?=
 =?utf-8?B?dDI5RERHZjFrUjB3T0k2K3pla2VmMXRBTUNLSldNQ1hkNFgwWW4yZC9JTFNN?=
 =?utf-8?B?RUZ0VEN0NGh0bTVYdGVYSkRiajVqMlVScFRzbUVBZ2U0eThRc3p5RjBNdXdK?=
 =?utf-8?B?aElCTGo3U080YnJIRlV6S1dLYk5CUWhkZVFGdmtQb1dkRFZhZzlseHV5MWRO?=
 =?utf-8?B?clRhRlptSm9Cc0dYR2lsYUV5YzMzeG9uRG1qeUZwL2crVUJEQVhnU2FEUStw?=
 =?utf-8?B?ZVJNRHJmd2hmb1VSVGVzTG0yQ2Q4a2kzQkpIaTZtZTB0Y0VPUTFmalNueTNo?=
 =?utf-8?B?NEpHZFdjeld1bnUwWk5DZjFaTmh3dVpNV3FGRzNVYVR2dG9weDViaVZYaytL?=
 =?utf-8?B?amJaMXNQbk9XcGFFeVZXZUk0eDJ2aUdMd21IRm1XdS9yQ2w2MG5rMUFNUHB2?=
 =?utf-8?B?ZmdPNTRxMW0wNEllQzhxQ1RvOXF6dFVqYWgwcndIaVFPelQyemVCcTcyWG8y?=
 =?utf-8?B?WHdIRCtxVzdJcGNYWGFoRmVNVnFVR09BaWUwWTNLenEwWWNqSDc0SHlqeUM3?=
 =?utf-8?B?anBiNG5kbmVJNlROdjBEUzNXdDJKSWJkUDdBR3Y3Tmp2bkgzbDJsYzBWN2lm?=
 =?utf-8?B?bUI3L0NJNGk3ajlRMFJRUW5ZNUFTV3U4RjFSTC9TUnNlZStqZi9EZncwUHpB?=
 =?utf-8?B?SUlNZm1xK3AwNmlYY1haclRkcmpSSXBvZ0lKbnAyUkF1UnRIQ1ZEQTAyS1hU?=
 =?utf-8?B?cVFRdkZFWW5zTHM5cHo1VHh0UFBsL1RsamE1ZExQVmVuRWh1NHJXUVk0ejdk?=
 =?utf-8?B?QlduVGxmU2NLWjE1c0dVeTNzZ3p4NEs3aEpVdmJOcFVwblhUczZLNXdlQk1I?=
 =?utf-8?B?NFhMeGJmY1ZoNVdrNXJwS3hRUysvYXlpNFJGOHRHTE5SRnkvWnVUelRkdUhR?=
 =?utf-8?B?am9teXdGK0wxdmJkWXRIaUowRXA2aDJMd0lWTW5YMW9ZWnZDZDRoSkh6eVhu?=
 =?utf-8?B?cERxRXVGazdMOUluOWFSdk4wYzM0QTk0K1RvQlpvVWZyWnI5MkoxbWxIVkJY?=
 =?utf-8?B?eGFVWHlQWm1xdVJtRitpWGJMaDFmTGJnQ3hmaGFqQVVKTWpaNjFWZ3p4WnBM?=
 =?utf-8?B?M1kveGVJU2RXLzRuRFBNREk2VjhkMEtMOXp3TDA3cmtpZG04bFVzcFovMGZj?=
 =?utf-8?B?TjAwNSsvclFCckdaOHJoZU0wSEJpN241V1dqUnZVazliYmg4ZDVNK1cxWUNo?=
 =?utf-8?B?K09yM3pNV2NmZXRPVHJjRW1jTDVHTGRMV01CMHBtZUxXZzg3OVQ2TTdZTm9J?=
 =?utf-8?B?aDRNNUhiSm5YSFplNVRFZEZzdVU1UmtNcTZiTkNXekxacWpwRVUrRTBJWFZ4?=
 =?utf-8?B?d2RCY3RaVjNvaUM1OWs4UGlTM2k5U0NaNkZUOEhQTjRRVnVlOHhNTFY3WVpt?=
 =?utf-8?B?Y3dla2o3RW1iZmlWYjVNbDZVa0RtQXI5dTJrak9lWXRCbnBGbWFMNVlvTjc0?=
 =?utf-8?Q?RBFgNiBCs89AWpGcnTRhpmkMbViW0iN/OEmWzUL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3952
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42019a45-0432-48cc-c0b3-08d9607cdcb0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZgfQz/4Zoy6wJ0lw7mxNtBdbPaKevNUlpr0hQkShN4ARUSQRHGyDgwx4YVd4X+m5kJMFF7ukcE2UDTsByMycnnkrqGTjZyVppDAxOL//HeGtpA4lh8gPo/4TS9uEfhnTI8qG/5doEpPGWz3QoSTJXoxWz0y8twTk75erjw8twBno4jkT6+ByQl50J6X0H72sr7+5MABr34LELhBkURACOOwaInjDqEZJWJa45AkJ40ayi0zRuBT1XgonF8/yK//KoWKvWX0Bj1K8RszTIqrSDiTm6M/He3FjDV5YDWUcpBo1Rs+84eOyq7hJpepbdi/+qHT6UCh6N48VvdKDpQaI9aVKUSu/VmfyGgDdLyewHO5HWxQf1wfn5VvjpG84KW0Rm0OsNMFYLkp1nNYCzYxV31EllfpSoskbXMli9MY9csQJuQ8RCNHmI3EHwhKeuLBNXK57T2IUng6AxB4IdR5kF/PPjaE/BegSvdYoJGKIc0W/dXX3ifHbQvBPp12C+kXw+dA76NdYvJrb2fXBz5Hq9SIn1UqImTQedcegsml3uze5aOpOkHwqm/btQ8X+b2FfUhta8q8v+D54YnEl7P/TYg0AYrd3vQOULzjA9Kw3mbD+w3Td9dDUn7afzOMKe2DEWuKbjw1AL2etewu5YrJk8KsT4Zgt6npmORiGzaJEiMb/Idn9xaVgS4xGGTV4vmGJ06fw3E6RvDpaa+YXZh+/rQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39830400003)(346002)(46966006)(36840700001)(86362001)(6506007)(47076005)(356005)(53546011)(2906002)(508600001)(33656002)(81166007)(36860700001)(8676002)(8936002)(7696005)(5660300002)(186003)(9686003)(55016002)(4326008)(336012)(110136005)(70586007)(70206006)(83380400001)(52536014)(54906003)(82310400003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 06:12:57.5733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a1f4b3-588b-4a56-d774-08d9607ce485
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6350

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMTMsIDIwMjEg
ODoyMSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+
IDxXZWkuQ2hlbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjQgMDUvMTBdIHhlbi9hcm06IHN0YXRpYyBtZW1vcnkgaW5pdGlhbGl6YXRpb24NCj4gDQo+
IEhpIFBlbm55LA0KPiANCj4gT24gMjgvMDcvMjAyMSAxMToyNywgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIHN0YXRpYyBtZW1vcnkgaW5pdGlhbGl6YXRpb24s
IGR1cmluZyBzeXN0ZW0gYm9vdCB1cC4NCj4gPg0KPiA+IFRoZSBuZXcgZnVuY3Rpb24gaW5pdF9z
dGF0aWNtZW1fcGFnZXMgaXMgcmVzcG9uc2libGUgZm9yIHN0YXRpYyBtZW1vcnkNCj4gPiBpbml0
aWFsaXphdGlvbi4NCj4gPg0KPiA+IEhlbHBlciBmcmVlX3N0YXRpY21lbV9wYWdlcyBpcyB0aGUg
ZXF1aXZhbGVudCBvZiBmcmVlX2hlYXBfcGFnZXMsIHRvDQo+ID4gZnJlZSBucl9tZm5zIHBhZ2Vz
IG9mIHN0YXRpYyBtZW1vcnkuDQo+ID4NCj4gPiBUaGlzIGNvbW1pdCBhbHNvIGludHJvZHVjZXMg
bmV3IENPTkZJR19TVEFUSUNfTUVNT1JZIHRvIGF2b2lkDQo+IGJyaW5naW5nDQo+ID4gZGVhZCBj
b2RlcyBpbiBvdGhlciBhcmNocy4NCj4gPg0KPiA+IFB1dCBhc3luY2hyb25vdXMgc2NydWJiaW5n
IGZvciBwYWdlcyBvZiBzdGF0aWMgbWVtb3J5IGluIFRPRE8gbGlzdC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+
IHY0IGNoYW5nZToNCj4gPiAtIG1vdmUgdGhlIG9wdGlvbiBDT05GSUdfU1RBVElDX01FTU9SWSB0
byBjb21tb24gY29kZSwgYW5kIHdpdGgNCj4gQXJtDQo+ID4gInNlbGVjdCJpbmcgaXQNCj4gPiAt
IHJlcGxhY2Ugcm91bmRfcGd7ZG93bix1cH0oKSB3aXRoIFBGTl9ET1dOKCkvUEZOX1VQKCkNCj4g
PiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9LY29uZmlnICAgIHwgIDEgKw0KPiA+ICAgeGVuL2Fy
Y2gvYXJtL3NldHVwLmMgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIHhl
bi9jb21tb24vS2NvbmZpZyAgICAgIHwgIDMgKysrDQo+ID4gICB4ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+ID4gICB4ZW4vaW5jbHVkZS94ZW4vbW0u
aCAgICB8ICA2ICsrKysrKw0KPiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9h
cm0vS2NvbmZpZyBpbmRleA0KPiA+IGVjZmE2ODIyZTQuLmNjN2E5NDNkMjcgMTAwNjQ0DQo+ID4g
LS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZp
Zw0KPiA+IEBAIC0xNSw2ICsxNSw3IEBAIGNvbmZpZyBBUk0NCj4gPiAgIAlzZWxlY3QgSEFTX1BB
U1NUSFJPVUdIDQo+ID4gICAJc2VsZWN0IEhBU19QRFgNCj4gPiAgIAlzZWxlY3QgSU9NTVVfRk9S
Q0VfUFRfU0hBUkUNCj4gPiArCXNlbGVjdCBTVEFUSUNfTUVNT1JZDQo+IA0KPiBHaXZlbiB0aGUg
bGlzdCBvZiBUT0RPcywgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgU1RBVElDX01FTU9S
WSBpcyB1c2VyDQo+IHNlbGVjdGFibGUgYW5kIGdhdGVkIGJ5IFVOU1VQUE9SVEVELg0KPiANCj4g
V2UgY2FuIHJlbW92ZSB0aGUgZGVwZW5kZW5jeSBvbiBVTlNVUFBPUlRFRCBvbmNlIGV2ZXJ5IGhh
dmUgYmVlbg0KPiBhZGRyZXNzZWQuDQo+IA0KDQpTdXJlLiBJJ2xsIGNoYW5nZSBpdCBVTlNVUFBP
UlRFRC4NCiANCmNvbmZpZyBTVEFUSUNfQUxMT0NBVElPTg0KICAgICAgICBib29sICJTdGF0aWMg
QWxsb2NhdGlvbiBTdXBwb3J0IChVTlNVUFBPUlRFRCkiIGlmIFVOU1VQUE9SVEVEDQoNCj4gPg0K
PiA+ICAgY29uZmlnIEFSQ0hfREVGQ09ORklHDQo+ID4gICAJc3RyaW5nDQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMgaW5kZXgNCj4g
PiBmNTY5MTM0MzE3Li4zNjlmNjYzMWVlIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9z
ZXR1cC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gPiBAQCAtNjIyLDYgKzYy
MiwyNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9wZHgodm9pZCkNCj4gPiAgICAgICB9DQo+
ID4gICB9DQo+ID4NCj4gPiArLyogU3RhdGljIG1lbW9yeSBpbml0aWFsaXphdGlvbiAqLw0KPiA+
ICtzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9zdGF0aWNtZW1fcGFnZXModm9pZCkgew0KPiA+ICsg
ICAgdW5zaWduZWQgaW50IGJhbms7DQo+ID4gKw0KPiA+ICsgICAgLyogVE9ETzogQ29uc2lkZXJp
bmcgTlVNQS1zdXBwb3J0IHNjZW5hcmlvLiAqLw0KPiA+ICsgICAgZm9yICggYmFuayA9IDAgOyBi
YW5rIDwgYm9vdGluZm8uc3RhdGljX21lbS5ucl9iYW5rczsgYmFuaysrICkNCj4gPiArICAgIHsN
Cj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGJhbmtfc3RhcnQgPQ0KPiA+ICsgUEZOX1VQKGJv
b3RpbmZvLnN0YXRpY19tZW0uYmFua1tiYW5rXS5zdGFydCk7DQo+IA0KPiBJIHdvdWxkIHByZWZl
ciBpZiBiYW5rX3N0YXJ0IGlzIGEgbWZuX3QuDQo+IA0KDQpTdXJlLCBpdCdzIG1vcmUgYXBwcm9w
cmlhdGUuDQoNCj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGJhbmtfc2l6ZSA9DQo+ID4gKyBQ
Rk5fRE9XTihib290aW5mby5zdGF0aWNfbWVtLmJhbmtbYmFua10uc2l6ZSk7DQo+IA0KPiBOSVQ6
IEkgd291bGQgc3VnZ2VzdCB0byBuYW1lIGl0IGJhbmtfcGFnZXMgb3IgYmFua19ucl9wYWdlcy4g
VGhpcyB3b3VsZA0KPiBtYWtlIGNsZWFyIGluIHRoZSB1c2VyIHRoYXQgdGhpcyBjb250YWlucyBw
YWdlcy4NCj4gDQoNClN1cmUuDQoNCj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGJhbmtfZW5k
ID0gYmFua19zdGFydCArIGJhbmtfc2l6ZTsNCj4gDQo+IG1mbl90IHBsZWFzZS4NCj4gDQoNClN1
cmUuDQoNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCBiYW5rX2VuZCA8PSBiYW5rX3N0YXJ0ICkN
Cj4gDQo+IFRoaXMgd2lsbCBtZWFuIHlvdSB3aWxsIG5lZWQgdG8gdXNlIG1mbl94KCkgZm9yIGJv
dGguIFRoaXMgY29kZSB3b3VsZCBiZSBsZXNzDQo+IG5pY2UgYnV0IGF0IGxlYXN0IGl0IGF2b2lk
cyBtaXhpbmcgYWRkcmVzcyBhbmQgTUZOLg0KPg0KDQpTdXJlLg0KDQo+ID4gKyAgICAgICAgICAg
IHJldHVybjsNCj4gPiArDQo+ID4gKyAgICAgICAgZnJlZV9zdGF0aWNtZW1fcGFnZXMobWZuX3Rv
X3BhZ2UoX21mbihiYW5rX3N0YXJ0KSksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYmFua19zaXplLCBmYWxzZSk7DQo+ID4gKyAgICB9DQo+ID4gK30NCj4gPiArDQo+ID4gICAj
aWZkZWYgQ09ORklHX0FSTV8zMg0KPiA+ICAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21tKHZv
aWQpDQo+ID4gICB7DQo+ID4gQEAgLTc0OSw2ICs3NjksOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
c2V0dXBfbW0odm9pZCkNCj4gPiAgICAgICAvKiBBZGQgeGVuaGVhcCBtZW1vcnkgdGhhdCB3YXMg
bm90IGFscmVhZHkgYWRkZWQgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLg0KPiAqLw0KPiA+ICAgICAg
IGluaXRfeGVuaGVhcF9wYWdlcyhtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fc3RhcnQpLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fZW5kKSk7
DQo+ID4gKw0KPiA+ICsgICAgaW5pdF9zdGF0aWNtZW1fcGFnZXMoKTsNCj4gPiAgIH0NCj4gPiAg
ICNlbHNlIC8qIENPTkZJR19BUk1fNjQgKi8NCj4gPiAgIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1
cF9tbSh2b2lkKQ0KPiA+IEBAIC04MDIsNiArODI0LDggQEAgc3RhdGljIHZvaWQgX19pbml0IHNl
dHVwX21tKHZvaWQpDQo+ID4NCj4gPiAgICAgICBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKHJh
bV9zdGFydCwgcmFtX2VuZCk7DQo+ID4gICAgICAgbWF4X3BhZ2UgPSBQRk5fRE9XTihyYW1fZW5k
KTsNCj4gPiArDQo+ID4gKyAgICBpbml0X3N0YXRpY21lbV9wYWdlcygpOw0KPiA+ICAgfQ0KPiA+
ICAgI2VuZGlmDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVu
L2NvbW1vbi9LY29uZmlnIGluZGV4DQo+ID4gMGRkZDE4ZTExYS4uOGY3MzZlZWE4MiAxMDA2NDQN
Cj4gPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4gPiArKysgYi94ZW4vY29tbW9uL0tjb25m
aWcNCj4gPiBAQCAtNjcsNiArNjcsOSBAQCBjb25maWcgTUVNX0FDQ0VTUw0KPiA+ICAgY29uZmln
IE5FRURTX0xJQkVMRg0KPiA+ICAgCWJvb2wNCj4gPg0KPiA+ICtjb25maWcgU1RBVElDX01FTU9S
WQ0KPiA+ICsJYm9vbA0KPiA+ICsNCj4gPiAgIG1lbnUgIlNwZWN1bGF0aXZlIGhhcmRlbmluZyIN
Cj4gPg0KPiA+ICAgY29uZmlnIFNQRUNVTEFUSVZFX0hBUkRFTl9BUlJBWQ0KPiA+IGRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGlu
ZGV4DQo+ID4gYTNlZTVlY2E5ZS4uMmFjYjczZTMyMyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4g
QEAgLTE1MTksNiArMTUxOSwyNiBAQCBzdGF0aWMgdm9pZCBmcmVlX2hlYXBfcGFnZXMoDQo+ID4g
ICAgICAgc3Bpbl91bmxvY2soJmhlYXBfbG9jayk7DQo+ID4gICB9DQo+ID4NCj4gPiArI2lmZGVm
IENPTkZJR19TVEFUSUNfTUVNT1JZDQo+ID4gKy8qIEVxdWl2YWxlbnQgb2YgZnJlZV9oZWFwX3Bh
Z2VzIHRvIGZyZWUgbnJfbWZucyBwYWdlcyBvZiBzdGF0aWMNCj4gPiArbWVtb3J5LiAqLyB2b2lk
IF9faW5pdCBmcmVlX3N0YXRpY21lbV9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZvICpwZywNCj4gdW5z
aWduZWQgbG9uZyBucl9tZm5zLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIG5lZWRfc2NydWIpIHsNCj4gPiArICAgIG1mbl90IG1mbiA9IHBhZ2VfdG9fbWZuKHBn
KTsNCj4gPiArICAgIHVuc2lnbmVkIGxvbmcgaTsNCj4gPiArDQo+ID4gKyAgICBmb3IgKCBpID0g
MDsgaSA8IG5yX21mbnM7IGkrKyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgbWFya19wYWdl
X2ZyZWUoJnBnW2ldLCBtZm5fYWRkKG1mbiwgaSkpOw0KPiA+ICsNCj4gPiArICAgICAgICBpZiAo
IG5lZWRfc2NydWIgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgLyogVE9ETzog
YXN5bmNocm9ub3VzIHNjcnViYmluZyBmb3IgcGFnZXMgb2Ygc3RhdGljIG1lbW9yeS4gKi8NCj4g
PiArICAgICAgICAgICAgc2NydWJfb25lX3BhZ2UocGcpOw0KPiA+ICsgICAgICAgIH0NCj4gPiAr
ICAgIH0NCj4gPiArfQ0KPiA+ICsjZW5kaWYNCj4gPg0KPiA+ICAgLyoNCj4gPiAgICAqIEZvbGxv
d2luZyBydWxlcyBhcHBsaWVkIGZvciBwYWdlIG9mZmxpbmU6DQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9tbS5oIGIveGVuL2luY2x1ZGUveGVuL21tLmggaW5kZXgNCj4gPiA2Njdm
OWRhYzgzLi44ZThmYjVhNjE1IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5o
DQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gPiBAQCAtODUsNiArODUsMTIgQEAg
Ym9vbCBzY3J1Yl9mcmVlX3BhZ2VzKHZvaWQpOw0KPiA+ICAgfSB3aGlsZSAoIGZhbHNlICkNCj4g
PiAgICNkZWZpbmUgRlJFRV9YRU5IRUFQX1BBR0UocCkgRlJFRV9YRU5IRUFQX1BBR0VTKHAsIDAp
DQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZDQo+ID4gKy8qIFRoZXNlIGZ1
bmN0aW9ucyBhcmUgZm9yIHN0YXRpYyBtZW1vcnkgKi8gdm9pZA0KPiA+ICtmcmVlX3N0YXRpY21l
bV9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZvICpwZywgdW5zaWduZWQgbG9uZyBucl9tZm5zLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgbmVlZF9zY3J1Yik7ICNlbmRpZg0KPiA+
ICsNCj4gPiAgIC8qIE1hcCBtYWNoaW5lIHBhZ2UgcmFuZ2UgaW4gWGVuIHZpcnR1YWwgYWRkcmVz
cyBzcGFjZS4gKi8NCj4gPiAgIGludCBtYXBfcGFnZXNfdG9feGVuKA0KPiA+ICAgICAgIHVuc2ln
bmVkIGxvbmcgdmlydCwNCj4gPg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCg0KQ2hlZXJzDQoN
Ci0tDQo+IEp1bGllbiBHcmFsbA0K

