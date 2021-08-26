Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464123F86C8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 13:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172948.315587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJDxx-0000jk-Hh; Thu, 26 Aug 2021 11:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172948.315587; Thu, 26 Aug 2021 11:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJDxx-0000hW-EO; Thu, 26 Aug 2021 11:54:41 +0000
Received: by outflank-mailman (input) for mailman id 172948;
 Thu, 26 Aug 2021 11:54:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJDxv-0000hQ-Fe
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 11:54:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6325b758-0664-11ec-a9ec-12813bfff9fa;
 Thu, 26 Aug 2021 11:54:37 +0000 (UTC)
Received: from DB6PR0801CA0048.eurprd08.prod.outlook.com (2603:10a6:4:2b::16)
 by AM9PR08MB6289.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 11:54:35 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::31) by DB6PR0801CA0048.outlook.office365.com
 (2603:10a6:4:2b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 11:54:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 11:54:35 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Thu, 26 Aug 2021 11:54:35 +0000
Received: from 2acefc931bbd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 107B2DFB-897B-4CE3-940E-ADC1BBD014FF.1; 
 Thu, 26 Aug 2021 11:54:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2acefc931bbd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 11:54:24 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5557.eurprd08.prod.outlook.com (2603:10a6:10:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 11:54:22 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 11:54:22 +0000
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
X-Inumbo-ID: 6325b758-0664-11ec-a9ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIpY3vMVqb+2bMaTu9hXc3TN61O7zDHx/erMRumSs8w=;
 b=peE+u8t5LI4m4KbbtGB8Auhn+mujmFNJDC7a6flIJiMlBkGRFxT7NIwJgVqZQpbOMpv4YQiVhHvf/XIJqYeIjhASoB696dbatJ7lA0MQoNm+k4f8eXBECLFiC2k5RhhqcaezPQeIlQkPTeyDXR8nylBBuznK7aavLVwQOQ7JRBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ius5WIV6eObGN9D796GHXDaUsvPkfB08lPyFOEbFyQtYU8NC74o60f93SvTcEZhCfdjqTaP28IheWdd4DVSbyysxHFKuXopjQaEKqAqlZwRZ3GMVYWDv8QhS0OWT7fEQaGbwfuk2jLgapiH0135AFN43TBPbvp23dA54jnfCtCZQHiKuryqxlrH8be80JQcgNK39aEprDiT7lam5wNuWGznUAVzuEP5iBnB79/VA7nyNY05q0XHwS4w1Kv7F5zNV1vpmJjdd3vGutkfiltxiq+Zc2AcEymIW60ohpyTcQvRVwWqG8i9nGk1amv+e4CCCWXwreCaR93GEH3CN7RUhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIpY3vMVqb+2bMaTu9hXc3TN61O7zDHx/erMRumSs8w=;
 b=KCqXlqbXMbQfjTrF4UG4diBGw2a5hF/j7RLligbqpppF+0PqAaFBolJm7L28WjQuZDvgFs+pI1jykLj/k9KuElnSGM2MFbZaHziYGeQGHDJJ0Z9pHKJd0YwWQdBanAVmnLGhyvHDyuVj/s/SadC+e9pewhacVwiqPlIAew8qspTfwgjrF4KAIaEGGlXo78Dh5jSjNLNSOoqdCVh8OzJU8vj3JHX8AnJhPjIgaz8K2cdjf6w2xIc5owdDAmTnpZhyGpS3JX3GoYYy5CQImzmLKv0cOkDn8ihrVULEf72iZIp9JmRLP1uJkqKKzFRLfmtvNAEVZPc7z6/MyWJKxDHBgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIpY3vMVqb+2bMaTu9hXc3TN61O7zDHx/erMRumSs8w=;
 b=peE+u8t5LI4m4KbbtGB8Auhn+mujmFNJDC7a6flIJiMlBkGRFxT7NIwJgVqZQpbOMpv4YQiVhHvf/XIJqYeIjhASoB696dbatJ7lA0MQoNm+k4f8eXBECLFiC2k5RhhqcaezPQeIlQkPTeyDXR8nylBBuznK7aavLVwQOQ7JRBU=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
Thread-Topic: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse
 device tree memory node
Thread-Index: AQHXjps6uVXfLZKD7EKSvvhEptOzS6uEUqiAgAEPgfCAACd7AIAAOfNA
Date: Thu, 26 Aug 2021 11:54:21 +0000
Message-ID:
 <DB9PR08MB6857075036E85928BD83797A9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
 <4bd56df9-f95b-eb19-dbbc-d12b4f7b0668@xen.org>
 <DB9PR08MB6857604B3D4B690F2B8832BD9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <61189a13-31a5-b75d-f9b5-97f379dfcd99@xen.org>
In-Reply-To: <61189a13-31a5-b75d-f9b5-97f379dfcd99@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 980DF8CAB8F43943BB54A343910CD8E7.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b09b6960-9fc7-4efb-3374-08d968884681
x-ms-traffictypediagnostic: DBAPR08MB5557:|AM9PR08MB6289:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6289E0F11B13EF5E94D27CDF9EC79@AM9PR08MB6289.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 e5xhpDGWxQZ7UH413aPs8+84HFXsoWup6kt8vPz7gLq60c/extBpI94GYWsOWdlQE3hUwFS+RemiJpWihUhWD9lVIcplMs4m7mkWtflmjXPTELnYGDoz1SjZMmdYjyAw+dR9HITa4OjDsemtHIc5mApVaPsIN6xKrKWIMXN/hiMTjIpA4hW2fQ9yWHw1jSLHjcFPoQRntGTPrRXuSDEy7a9QrwhHFFz+VVs85G2ZFLyuHODs1opPYsG0AH3e4VkzSu3FgMH8Kno71Tg165pGdKOBf6RRxtJOhtOSlhee5JoR+AItFLimJYps1H2ykDPp/13lIE0w1rXPzD6vwQQBv7Zi/S26Aw62tb/0ld7aACXMAzfWDVw88uDWpuiQz8z2+nfUFVe30a8eJi8f5MMHi+xwqwu9+J7G9dvRZJJ7Jns7G+CcV7oZWAdmy22TXsoTpEsOh2U8zq/KDxBWJb7O/BxMHXaBSKyRp1+bwf9HeKLoVkaiAV7iSeAQEPF0cu0k0xBwL+wLjmjQ6zJTJlsrJpi+rKtGYI1/KSA4+Xmwds6I9JxZ0/qNfe1TkwPv5Kj0lu5Lo9ag0yptAGqczWbdlndaZZA+OQoejReikjB0Ca5WaGxydlw8u36askEH1fkCWFSOPegFQr9mxSbfAFH+vC9lbkDZp90zsSwpKQDjWatVibD+NYjIOfrdP7/EK+aOSVE62HgN9ZhH4rvK5nL3Pg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(66556008)(66446008)(86362001)(64756008)(66476007)(38070700005)(26005)(71200400001)(8936002)(76116006)(55016002)(316002)(83380400001)(186003)(2906002)(6506007)(53546011)(122000001)(66946007)(478600001)(9686003)(7696005)(38100700002)(110136005)(33656002)(8676002)(5660300002)(52536014)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXFKeERKMHNkU1FpTGpOM0dKRmFoUzF3bUFtVXFicHEvS3UvZHc0QmJsa2k4?=
 =?utf-8?B?N28wM0Y2cklTWWZ3cm9EOEx5RUNPS1VpTS9iWm5oWEYvanRoU0ZBQ1F2M2sz?=
 =?utf-8?B?NXdXWkJBb2NBWW1tOG1odEJxZ01KQ0x5VWhoM1lTWGdnRzdrbm5NY25Tak10?=
 =?utf-8?B?NXRDaEN0aVE3T1U4YU5vQ1EvRkF5OGM0WCtvUHAvVjd5d21wRytxUUVyeDBn?=
 =?utf-8?B?em1LSzhmL21CZzRsSVhvRk80aVBHM2ZRZnVGenlTdkZHQzl2L2xIL2hGWTYy?=
 =?utf-8?B?UjA5K2ZGWUFodjV2S2RvRU5FL241Q0NIRUpGekwvLzZ0WXdHbEkwYUdHVGVC?=
 =?utf-8?B?UVhPVmZ3ZUhKWkswQ29UUlhBZ3phTlVhRTZ4blA0ZWpieUpYa1c4d0VvNFlF?=
 =?utf-8?B?MUFZNTVHL0RuVVpaR3ZoWGhwS0pQQXZMU0V0Z29POTAwdk1FZDA0RVYwc1c2?=
 =?utf-8?B?SzgrZm43NnhLUHdURzFGM2k2MFptNm81MEVnTFNUQnVURVZ3cVpGVUFPVmN6?=
 =?utf-8?B?eHlmK3NNOUR6U3hibGVadUl3d3NSVTlDRzVFZUNaTDI0TGRmTDR5T0xta3dQ?=
 =?utf-8?B?S2x1eWk1RjJmZzBtWlFBV3JxdmI1QUh6K0kreWRTMFR4T01xRlMvY1FMamdj?=
 =?utf-8?B?eHBlTU5MTlZqaWhhaVRERktackl6KzB0eUcvRUlLTEZYdUYvM0RSODMxZnVP?=
 =?utf-8?B?ckc3STdBbXNaZVNhZ0ZKR0tpUlN5czl6YTMwakc3WXcwTUpHMU1qeGdDaHhO?=
 =?utf-8?B?RTB6WWMxSHZrUGlNTVdoQzgrbTRCQ0N4QjVDcERzZUkwRmtwS00xZ0w1T1JG?=
 =?utf-8?B?Rm16TnBzT0FvMFlsL1JoUUF5MmE2em1hN1lINnFwSDhOQ09KR1JIVEtabnFP?=
 =?utf-8?B?czJFQWNWQ1RTeHFUdGFlUGV5RFE3ZksrdnRUblhDR0N4cHRhSmc4YTlQb3pM?=
 =?utf-8?B?eEtRSm5Kcm82di96VUVXZkliWndPNWUvQ3Y5Wm1iVHRqZEFhNzJrN0ZuazVG?=
 =?utf-8?B?MG1aVEdadlJjQkZCT3p4cGVOOW9PcVF1WHFoTTM2dy9mRStNK0hSc2xlTmZz?=
 =?utf-8?B?OWpKYTZEb1FvV2x5dnlLam5ha01TTHoxa2NRVHo0UEVXSDRTTmwyamtyUDhW?=
 =?utf-8?B?ZWxyR1MvcWhIaElHNHptazBLYzNFbFpBWkNJQ3hIUjUyM3ZJVG9EaTlORGdX?=
 =?utf-8?B?QXJwQlVzYWp5emlYU0pqYlRETTl5NHFMa1dlNGcyU1dkQ2YvZS90TVgvUU5P?=
 =?utf-8?B?M0hBN1V2ZS9SL0ZDVmxoaUVOcHhJTHlLTk1ZVjhsRy9NRC9iM0hQeHBIUnh5?=
 =?utf-8?B?eUx1VVhZYjh4VWV1Vk5laFJiTUcyV3I3b3BXaVV5ZlJzaURnQ3FKMStRV0cz?=
 =?utf-8?B?TVE1QjNSSmJ5TXNnblc2ODI4SnRDV1NyT0lTeWl2dnlzN29rdFFScjBLR2ph?=
 =?utf-8?B?TW5BR1c1MmRnVkVyV3UwL2hiRzBsRTNaUUp1K2F5KzIxbUhBbWJ4aFBIZTZ0?=
 =?utf-8?B?OVBvbWpnUExLZUd4RXNHQnV1dk1xbHVxM0FqYkxlMy9MVW9LTjVhWHdXN0o4?=
 =?utf-8?B?a0Q5OWJrY0ROc05GVnJiY1pDVjJlQ1NiNUx1S0RVOHdQQURXdzJJZnNxZ09n?=
 =?utf-8?B?V3ZkUXBvbk1zUHBWMkhtSTBYRVV5UVRVQnZGZXlHQ2M3b1ptNk91UWVYd08y?=
 =?utf-8?B?aVcvSVUvVUN4T1VsNUlvb2hhM0htdDl0dDduTEh2My9HTTl4TzYyNTF0ZlFY?=
 =?utf-8?Q?CMmIxGHpcl4Lo6l4rN5oOR3fmimn1v4dC1Cs/yf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5557
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14b7edb9-0789-4425-ba33-08d968883e66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O/Myjhl/nZvvSchDGnMyQVKMgnyT5U2jTaGQ7QMMIKMleM71D3bJDRsGunQOmJAS1vT/WLUnEM6lM6R41fx4fl6/dfgK4kjpm0lg0gBuPTeKmiGv4qWx5TrBnWv9M8mLyIRlI/Q+WeMwtGxtMcvmGGrREdFav9tTbySvHlscrT3ZPHBcxVRqSo7tYQUfH7P+dh5t9Sj0+TonEbvh43T1QOQteDeK8giQfp9l/hkxccLRBjAgZVq0Q7Tr4MYtxJb3OTaTnS31I59AUysLPMZsYOigIUOzXB65pMpMeXS/PlS7oEiuxVswGyWrSfqlYsX+2Pn+hy6uJvgrL13kE00gRGCUed34iIBB7pMIZ4QwmnnMIoC1lce0pfEDCvNMAQHHlCG8o082krrtbVW2cGWvydwN6R4xEHG0HFnqmHT/c6Ci16IWu6uqphdor4188ThFYxPBiXIVzG05c+YdMgUmRahShh7Tm4gcfDzM1qWcM3Hyy3rC4AgmhhFV045wOjHbvtcDMZNi3qoEydjgtWNGkP9olL+xzFty+X0At/+H2szA1+juXilIzyzA5dKr9ue5xN4LxpnlI2s/f322eSXE9uz3x7gLgdNyQ+jguUbvxbAgnFKoMEkkZB+UC1A6QeYoV9bDx0KgXxqkUUwalssNFWUlfn+tV6B50okT7sD3qGWNZbDKgQhFGgX6p20G349jZI1y4eFsbM+2gE2R/SH+Ng==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(36840700001)(46966006)(316002)(83380400001)(33656002)(336012)(82740400003)(26005)(52536014)(2906002)(110136005)(186003)(36860700001)(86362001)(4326008)(9686003)(55016002)(82310400003)(356005)(5660300002)(8676002)(81166007)(6506007)(53546011)(478600001)(8936002)(47076005)(7696005)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 11:54:35.7259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09b6960-9fc7-4efb-3374-08d968884681
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6289

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjbml6UgMTY6MjIN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQ
QVRDSCAyMy80MF0geGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlDQo+IGRldmlj
ZSB0cmVlIG1lbW9yeSBub2RlDQo+IA0KPiANCj4gDQo+IE9uIDI2LzA4LzIwMjEgMDc6MzUsIFdl
aSBDaGVuIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwNCj4gDQo+IEhpIFdlaSwNCj4gDQo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjHlubQ45pyIMjXml6UgMjE6NDkNCj4gPj4gVG86IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Ow0KPiA+PiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0KPiA+PiBD
YzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiA+PiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjMvNDBdIHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBl
ciB0byBwYXJzZQ0KPiA+PiBkZXZpY2UgdHJlZSBtZW1vcnkgbm9kZQ0KPiA+Pg0KPiA+PiBIaSBX
ZWksDQo+ID4+DQo+ID4+IE9uIDExLzA4LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+
Pj4gTWVtb3J5IGJsb2NrcycgTlVNQSBJRCBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gZGV2aWNl
IHRyZWUncw0KPiA+Pj4gbWVtb3J5IG5vZGVzIGFzICJudW1hLW5vZGUtaWQiLiBXZSBuZWVkIGEg
bmV3IGhlbHBlciB0byBwYXJzZQ0KPiA+Pj4gYW5kIHZlcmlmeSB0aGlzIElEIGZyb20gbWVtb3J5
IG5vZGVzLg0KPiA+Pj4NCj4gPj4+IEluIG9yZGVyIHRvIHN1cHBvcnQgbWVtb3J5IGFmZmluaXR5
IGluIGxhdGVyIHVzZSwgdGhlIHZhbGlkDQo+ID4+PiBtZW1vcnkgcmFuZ2VzIGFuZCBOVU1BIElE
IHdpbGwgYmUgc2F2ZWQgdG8gdGFibGVzLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdl
aSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgICB4ZW4vYXJjaC9h
cm0vbnVtYV9kZXZpY2VfdHJlZS5jIHwgMTMwDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTMwIGluc2VydGlvbnMoKykNCj4gPj4+
DQo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+
PiBiL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gPj4+IGluZGV4IDM3Y2M1NmFj
ZjMuLmJiZTA4MWRjZDEgMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZp
Y2VfdHJlZS5jDQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+
ID4+PiBAQCAtMjAsMTEgKzIwLDEzIEBADQo+ID4+PiAgICAjaW5jbHVkZSA8eGVuL2luaXQuaD4N
Cj4gPj4+ICAgICNpbmNsdWRlIDx4ZW4vbm9kZW1hc2suaD4NCj4gPj4+ICAgICNpbmNsdWRlIDx4
ZW4vbnVtYS5oPg0KPiA+Pj4gKyNpbmNsdWRlIDx4ZW4vbGliZmR0L2xpYmZkdC5oPg0KPiA+Pj4g
ICAgI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+Pj4gICAgI2luY2x1ZGUgPGFzbS9z
ZXR1cC5oPg0KPiA+Pj4NCj4gPj4+ICAgIHM4IGRldmljZV90cmVlX251bWEgPSAwOw0KPiA+Pj4g
ICAgc3RhdGljIG5vZGVtYXNrX3QgcHJvY2Vzc29yX25vZGVzX3BhcnNlZCBfX2luaXRkYXRhOw0K
PiA+Pj4gK3N0YXRpYyBub2RlbWFza190IG1lbW9yeV9ub2Rlc19wYXJzZWQgX19pbml0ZGF0YTsN
Cj4gPj4+DQo+ID4+PiAgICBzdGF0aWMgaW50IHNyYXRfZGlzYWJsZWQodm9pZCkNCj4gPj4+ICAg
IHsNCj4gPj4+IEBAIC01NSw2ICs1Nyw3OSBAQCBzdGF0aWMgaW50IF9faW5pdA0KPiA+PiBkdGJf
bnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdChub2RlaWRfdCBub2RlKQ0KPiA+Pj4gICAgICAg
IHJldHVybiAwOw0KPiA+Pj4gICAgfQ0KPiA+Pj4NCj4gPj4+ICsvKiBDYWxsYmFjayBmb3IgcGFy
c2luZyBvZiB0aGUgbWVtb3J5IHJlZ2lvbnMgYWZmaW5pdHkgKi8NCj4gPj4+ICtzdGF0aWMgaW50
IF9faW5pdCBkdGJfbnVtYV9tZW1vcnlfYWZmaW5pdHlfaW5pdChub2RlaWRfdCBub2RlLA0KPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdCBzdGFydCwgcGFkZHJf
dCBzaXplKQ0KPiA+Pj4gK3sNCj4gPj4NCj4gPj4gVGhlIGltcGxlbWVudGF0aW9uIG9mIHRoaXMg
ZnVuY3Rpb24gaXMgcXVpdGUgc2ltaWxhciBvdCB0aGUgQUNQSQ0KPiA+PiB2ZXJzaW9uLiBDYW4g
dGhpcyBiZSBhYnN0cmFjdGVkPw0KPiA+DQo+ID4gSW4gbXkgZHJhZnQsIEkgaGFkIHRyaWVkIHRv
IG1lcmdlIEFDUEkgYW5kIERUQiB2ZXJzaW9ucyBpbiBvbmUNCj4gPiBmdW5jdGlvbi4gSSBpbnRy
b2R1Y2VkIGEgbnVtYmVyIG9mICJpZiBlbHNlIiB0byBkaXN0aW5ndWlzaCBBQ1BJDQo+ID4gZnJv
bSBEVEIsIGVzcGVjaWFsbHkgQUNQSSBob3RwbHVnLiBUaGUgZnVuY3Rpb24gc2VlbXMgdmVyeSBt
ZXNzeS4NCj4gPiBOb3QgZW5vdWdoIGJlbmVmaXRzIHRvIG1ha2UgdXAgZm9yIHRoZSBtZXNzLCBz
byBJIGdhdmUgdXAuDQo+IA0KPiBJdCB0aGluayB5b3UgY2FuIGdldCBhd2F5IGZyb20gZGlzdGlu
Z3Vpc2hpbmcgYmV0d2VlbiBBQ1BJIGFuZCBEVCBpbg0KPiB0aGF0IGhlbHBlcjoNCj4gICAgKiBt
YS0+ZmxhZ3MgJiBBQ1BJX1NSQVRfTUVNX0hPVFBMVUdHQUJMRSBjb3VsZCBiZSByZXBsYWNlIGJ5
IGFuDQo+IGFyZ3VtZW50IGluZGljYXRpbmcgd2hldGhlciB0aGUgcmVnaW9uIGlzIGhvdHBsdWdn
YWJsZSAodGhpcyB3b3VsZA0KPiBhbHdheXMgYmUgZmFsc2UgZm9yIERUKQ0KPiAgICAqIEFjY2Vz
cyB0byBtZW1ibGtfaG90cGx1ZyBjYW4gYmUgc3R1YmJlZCAoaW4gdGhlIGZ1dHVyZSB3ZSBtYXkg
d2FudA0KPiB0byBjb25zaWRlciBtZW1vcnkgaG90cGx1ZyBldmVuIG9uIEFybSkuDQo+IA0KPiBE
byB5b3Ugc3RpbGwgaGF2ZSB0aGUgImlmIGVsc2UiIHZlcnNpb24/IElmIHNvIGNhbiB5b3UgcG9z
dCBpdD8NCj4gDQoNCkkganVzdCB0cmllZCB0byBkbyB0aGF0IGluIGRyYWZ0IHByb2Nlc3MsIGJl
Y2F1c2UgSSB3YXMgbm90IHNhdGlzZmllZA0Kd2l0aCB0aGUgY2hhbmdlcywgSSBoYXZlbid0IHNh
dmVkIHRoZW0gYXMgYSBwYXRjaC4NCg0KSSB0aGluayB5b3VyIHN1Z2dlc3Rpb25zIGFyZSB3b3J0
aCB0byB0cnkgYWdhaW4sIEkgd2lsbCBkbyBpdA0KaW4gbmV4dCB2ZXJzaW9uLg0KDQoNCj4gQ2hl
ZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

