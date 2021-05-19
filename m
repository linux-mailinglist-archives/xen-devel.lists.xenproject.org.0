Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C2388529
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 05:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129792.243417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljChb-0005Ow-N2; Wed, 19 May 2021 03:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129792.243417; Wed, 19 May 2021 03:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljChb-0005N2-Jb; Wed, 19 May 2021 03:16:55 +0000
Received: by outflank-mailman (input) for mailman id 129792;
 Wed, 19 May 2021 03:16:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljChZ-0005Mt-LT
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 03:16:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f8d1b0a-06ed-4e27-b295-cb0b56c015b5;
 Wed, 19 May 2021 03:16:50 +0000 (UTC)
Received: from AM0PR10CA0113.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::30)
 by DB6PR0802MB2197.eurprd08.prod.outlook.com (2603:10a6:4:85::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 03:16:48 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:e6:cafe::45) by AM0PR10CA0113.outlook.office365.com
 (2603:10a6:208:e6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 19 May 2021 03:16:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 03:16:48 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Wed, 19 May 2021 03:16:48 +0000
Received: from 19eb3a260be2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA835598-D0CF-4475-8F97-AE5AD337A706.1; 
 Wed, 19 May 2021 03:16:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19eb3a260be2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 03:16:42 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4320.eurprd08.prod.outlook.com (2603:10a6:803:100::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 03:16:35 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 03:16:34 +0000
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
X-Inumbo-ID: 1f8d1b0a-06ed-4e27-b295-cb0b56c015b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ5dh24l587YaolIFC7gsI2CKlT3cx0O/yOShvalRvk=;
 b=vi1E8EiM+ZK+jhu5sMUqGGU9xpH418gQ/hiKkyB+YqkeoXzKOjMxdpFqjxusDT2CHdM2XcTXydXXANlnZQjyLYKTkvQMH1oBPrARgd2Eh9OwFVsl1qRyxVPi1hlhdgQALkZ+50I7Q+pnfP0u0jpE8yJpzKWwLPzWrcbPZBZXMys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JguJ5EIFnuVxp8rz2QhSuLXj0tn4ahKHYWwsXznNe8+gtMAR1vtTzHRd4HG6phwut8z6j9zuscy+fjd8di5fxOffUTZvH+U8vVNnKauitlV8sSqYmyQMjVaw//0MJgkCjkMWtl4Rnz8r0JdBeQ0w+2/1PeNfF8a/Mco+ars3ckaufGgT64nMzresf+pjOAEAAYnH+TBdNM4ASVX/UT81lsjVvmLgC6HDG7YqedjAo6o5j6NLrTSTr94pOhKywT0Q3u+xRnVevzTVZFMOYMjHU0WQysslOiE6tN/UPjLDKwF50QbxEd7uqHUo4CprImQw4rgkaJdYAit8AwuGL+NRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ5dh24l587YaolIFC7gsI2CKlT3cx0O/yOShvalRvk=;
 b=CprisYbhQMgNOIQAwujoAIJdennH4GleNmXHy4oLW/BS9wgvWiD54uo811y6fqaplAuiSnwDoY3gAe4Zr2xkkPdn6JluP9Twq8kp03fEeCDomma/KwoJb3ksj6bG0YqMTlwXdkyCjHdIzrZcNFDm2z50yUhjqSrjSIFfaXtK+Knd9cpXq4eci8D1SJfeSqGIolrZhpgLgSnMsQtYJhlz46CH4hZr+Cd/jOaTlcHmg8ZcyAYnXdoRM6zV4H9DhSxJ/Q+xxCqhCVRvD9QQq8OwQe8MliEHaFV0MRhDoe/P13kxjkTNhHPEl1GLBs1B76zxsAzF263IVO5/XwXVJ60DHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ5dh24l587YaolIFC7gsI2CKlT3cx0O/yOShvalRvk=;
 b=vi1E8EiM+ZK+jhu5sMUqGGU9xpH418gQ/hiKkyB+YqkeoXzKOjMxdpFqjxusDT2CHdM2XcTXydXXANlnZQjyLYKTkvQMH1oBPrARgd2Eh9OwFVsl1qRyxVPi1hlhdgQALkZ+50I7Q+pnfP0u0jpE8yJpzKWwLPzWrcbPZBZXMys=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 03/10] xen/arm: introduce PGC_reserved
Thread-Topic: [PATCH 03/10] xen/arm: introduce PGC_reserved
Thread-Index: AQHXS6W8Xfb+Jc0d2U+rpPnqyW8lIKro/c8AgAEW9PA=
Date: Wed, 19 May 2021 03:16:32 +0000
Message-ID:
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
In-Reply-To: <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 291AA81FE4629542806F779287CB7FBE.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d87d4042-e0c7-468a-b8f7-08d91a748a14
x-ms-traffictypediagnostic: VI1PR08MB4320:|DB6PR0802MB2197:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB219787C7BC742CEA630B5309F72B9@DB6PR0802MB2197.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3Ob/qSpJMIUvBsHX6PrxcB8tMt8pdcDMP4WUVC7exXok+JI0hMD9xpZ+OEaVWFVUEI6RpfHC+cfsaI9TS/XKmiCPMk7O9ML0mHQ5bNL1vOlRJo4tWBYYfx+FucOQZUN7GeTWOWIJ3zS0kxanohLFqHMrhRo+Vu0zmUNmHLeCTs6rzNR7Qw3wN8MwRqWSejH5SGz2M8ftXGhTk4mNAdytzcI8pe6ozSg6Z7yP1lSx90M47rSa0H+uDdl/+BU1IugTdUOrEC3buJhnZXWDpsIYzhaRCrlA/5VCfetrEol1GxYnS4Gu0nit0aZ/5Z6D3vuhnZBvKvHzhDyxgrO8Sbvhr/jH4zHEP3MZym/flIsu/JLoMq7Y1wxg0bZf11ywLtDux0RBhWkwCb8gb3O8xiR5C3AcD4Yw6U3Q376xmMCErDFI4GxokB2u4Sg8bFxm96RTxlR4bWCOcSpkOTbuZmfD/fGVeUHOOAbEeGyRcRwXxp5buHWCv1EFSKlr1GF2w4D2ZWRcCedVvuGs24Ws97PjW84/nhzYZFfJjGJBzZ+7lN0TNXWPOiKQ10LFGrvdr2ZNtjltzKQt/bFNkaM0zCGY0IvwBeVqN2QtcATJ0ohaL5w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(55016002)(8676002)(66446008)(478600001)(9686003)(64756008)(6506007)(33656002)(52536014)(86362001)(26005)(66476007)(4326008)(186003)(66556008)(71200400001)(76116006)(66946007)(5660300002)(8936002)(7696005)(110136005)(54906003)(122000001)(83380400001)(53546011)(316002)(2906002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?WFFXd3BRcTVpU3pjVEplb1g3VnprUWVRdnVQMFJqSGxzMVVnK05wcXJVRUVq?=
 =?utf-8?B?R0E3RXozekVPMEdESG9xaHM4QVpOMURWcUtOZ1NoM2psdVkvK0Q0andEZFQ0?=
 =?utf-8?B?VFRNRjVRM2dmbW9VeGVjQ1BkQWU4Q2oxUU1sR0ZPSTd0WkRTRlY3c053a29K?=
 =?utf-8?B?RytRY0FCallncmYzT2pHUHd4QmpmMWFsdXU1K3diWmdKd29HMzBEVU1SK3dC?=
 =?utf-8?B?eklSdkdySVphTDhwRXp2VnRqbWZDakUrN1FPVmFoVTBVeVpVWDFRWUFUeXZZ?=
 =?utf-8?B?YWlHcHFIc1lJN0xZTWhiTUtoSHpjaE1IdlBKTEZtemtoQjFnbHBiQm1jUEw2?=
 =?utf-8?B?V1MzdDdVTk9iTEExSjY2VTl6NjRZNEFvUVRKaEFLczZkWE1Xd2JOekg4bU00?=
 =?utf-8?B?QU5mYUNTUzB4UWZMRncyam5HZ2xoeFpaM3lIeWV5L2pPVmc5T3BvT1lRbjZX?=
 =?utf-8?B?WWJncThXZVF4UTE4R3hBWThOZ2RMckhIcEVHZ2ovbTNSbEhpTnJNMGZxNmZO?=
 =?utf-8?B?WDhwSjhMZUZKK3FkaXp2aG5iNHhoOURqbk4wbEJXZzB3eko1ZmdlM2g5dW1D?=
 =?utf-8?B?QUZjbytIMThUNGNaNGNGdTRyQW9uRHNYdHNLMUM0VmxnMks1MmRtYWpWZ1Vj?=
 =?utf-8?B?NWFURUhzQ3k2N21YcW44eWoxV2RFS0E5YkhnaTB6bDZPZ2w5aGtxTEw0QjJP?=
 =?utf-8?B?bUZyaXZsT0dmVnZweHNUNDNGT01aR1QvTUVyRUpWTUpZa1Rnbm9Fb2xuUGM5?=
 =?utf-8?B?anllSkhDbnZiZFRUUnBvMXFBQkNRdWEvaWJZZ2ZHdmo5UHVrTmQ5ZFpaT0FW?=
 =?utf-8?B?WjdyMzJ6VUFiT01oTFZyNGp3Uzkxc1QwbmVkSklLZjdlVkI5V3cvY0ZaUWNt?=
 =?utf-8?B?U094ZEpRMGI0a1J0MzMxZFozYWZzSldQenV0QVQweEZLMklyUm5LSHorVHd4?=
 =?utf-8?B?dkl1eXEyZlUweDlsSVJVL1VYWW54blovVjBWL1B0ckhtTk1iRk1tVDBnRk9v?=
 =?utf-8?B?ejF2TS8xYXYrV3FZbk5YSTlOZ01aank0dTVZaEh3bUNwS3ZKWHFtVytRV3R0?=
 =?utf-8?B?dE91SjhqRktwdmFHWU1VRk5RSnJERS9pRVp2L20yN1ZEcURwY01TMnZTN3R2?=
 =?utf-8?B?Y2RSNEY4VktuajNRQXRFSGJTZXN6Rzc3RnpmVk1TOEF2UlRpK1VVSjg1aXpa?=
 =?utf-8?B?WC9nY0laOW1XZjg3ODFPeGpwdkFtcFJYTkIwbzRRVStXRXBhWHNTVGRaSnhh?=
 =?utf-8?B?VnVreTl6Ni9EdTl0cVpOM2NvNjJwajQ5RjNlNlFqajZvL2gxbEVtdEhtRTVl?=
 =?utf-8?B?cFp4OWcrc3JPeWpDSnhQNEVkSi9wUzg2eEtzeXNvd3k2c1UzUTRNdkJhQkVl?=
 =?utf-8?B?UCtOaFhRWTladU1hekNvcEhzWHY1OVpqd1JBZ2crdy94cHhqRmQ4S1E3enZJ?=
 =?utf-8?B?cVhnVlU4UFZ1WVZWUnBRZnI3ZW5TR3l6ckdYKzhWMEpMWDFEUUJyOThQa2hF?=
 =?utf-8?B?dmw4T29QVk9NZEFiWHdGaGhiVkYvQUd5RHdETTYwV2doWHFHYkdxK3pVTzVo?=
 =?utf-8?B?RnRBQzYwTjRidnJvL3FYYWd3TG5TYjZRc25SSDl0T0FLSDNIcXNwVnpDaFNF?=
 =?utf-8?B?d1BLYkV2ODltaGtNUzhLMXoyY3pBbU1zR2FQcFBzeXp3ck9WQ2lvTm4yc0pP?=
 =?utf-8?B?NmtLTFlUMytYbVZjcFl6QU0vYmJQaFp6WmpRUE5GcGMybjkxS2FlbS8xZGR2?=
 =?utf-8?Q?nCRkh9+EV7oNbTZ/Pzr2DDI1jxOL/WV3bMV8eN2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4320
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a590840-e9c9-4f3c-1fc6-08d91a748204
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hLvHBDM7Ls/Gjm14H3iIeJx4requUIOz/GgDFqBd2sGcdXSV2rAHNZlZ5fDaI4xtCPnJrih0VlyESamVHLwFiPzggmhc3Xoydz/pTEWka9H9p6XXafzze/a+fUpDiyYr2HV+VjcUlVwNfAWSAHCIwCAV1tLiE0gIfjNjCaGBMVkIu8YRNt5WSdcGJEeu8xnhJqRLlKscPC+R6tmBcEBjTRfgSBK5IQleFPnpNGs+WYL97GCPUx2cO13a4FvmFwi9AkWJmu543OyG9djzofWyOCvuhrxwN36vzy8t8T6dZNFxqr4K9IeZs+WvJrrqb8HpFx5jvpdjtXKogZIknWAw3T2pxShX4tgw8G4RJLkx61PfEn0TYofrGBKrBAslq7CiY5VqcI/ST8puNXaOgaTUPC91MiR/TBgNmCIXzt9vZE61f2nYMl1JRn+s8FrGLOR/8z3TtySIFkrBkZ4DanNSsbjJgSpWg83FgW+rVcvHN1e9urWkmsCZcsok3buIdY4vrWlvHKzZXMR3VwFQq2nZXpsF+YyMECic7GEO66OgqoMsRYd1c6QtfuJPXltHGMBkGIG004dEGEqPafRTGhwKZ1DMi/KCjrKRasM4IptsAJbm17uZOQS7JHa0ALbqle41Ks1SXBJjCN0GbpLD6gie+3g8PBN52GdmUT5C12Nz76w=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(36860700001)(8936002)(47076005)(52536014)(5660300002)(82740400003)(356005)(81166007)(70206006)(83380400001)(2906002)(82310400003)(70586007)(86362001)(8676002)(54906003)(110136005)(9686003)(7696005)(316002)(33656002)(4326008)(55016002)(186003)(26005)(6506007)(53546011)(478600001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 03:16:48.4248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d87d4042-e0c7-468a-b8f7-08d91a748a14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2197

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDU6
NDYgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDAzLzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgUEdDX3Jlc2VydmVkDQo+IA0KPiANCj4gDQo+IE9u
IDE4LzA1LzIwMjEgMDY6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEluIG9yZGVyIHRvIGRp
ZmZlcmVudGlhdGUgcGFnZXMgb2Ygc3RhdGljIG1lbW9yeSwgZnJvbSB0aG9zZSBhbGxvY2F0ZWQN
Cj4gPiBmcm9tIGhlYXAsIHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBwYWdlIGZsYWcgUEdD
X3Jlc2VydmVkIHRvIHRlbGwuDQo+ID4NCj4gPiBOZXcgc3RydWN0IHJlc2VydmVkIGluIHN0cnVj
dCBwYWdlX2luZm8gaXMgdG8gZGVzY3JpYmUgcmVzZXJ2ZWQgcGFnZQ0KPiA+IGluZm8sIHRoYXQg
aXMsIHdoaWNoIHNwZWNpZmljIGRvbWFpbiB0aGlzIHBhZ2UgaXMgcmVzZXJ2ZWQgdG8uID4NCj4g
PiBIZWxwZXIgcGFnZV9nZXRfcmVzZXJ2ZWRfb3duZXIgYW5kIHBhZ2Vfc2V0X3Jlc2VydmVkX293
bmVyIGFyZQ0KPiA+IGRlc2lnbmF0ZWQgdG8gZ2V0L3NldCByZXNlcnZlZCBwYWdlJ3Mgb3duZXIu
DQo+ID4NCj4gPiBTdHJ1Y3QgZG9tYWluIGlzIGVubGFyZ2VkIHRvIG1vcmUgdGhhbiBQQUdFX1NJ
WkUsIGR1ZSB0bw0KPiA+IG5ld2x5LWltcG9ydGVkIHN0cnVjdCByZXNlcnZlZCBpbiBzdHJ1Y3Qg
cGFnZV9pbmZvLg0KPiANCj4gc3RydWN0IGRvbWFpbiBtYXkgZW1iZWQgYSBwb2ludGVyIHRvIGEg
c3RydWN0IHBhZ2VfaW5mbyBidXQgbmV2ZXIgZGlyZWN0bHkNCj4gZW1iZWQgdGhlIHN0cnVjdHVy
ZS4gU28gY2FuIHlvdSBjbGFyaWZ5IHdoYXQgeW91IG1lYW4/DQo+IA0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4gLS0tDQo+ID4g
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggfCAxNiArKysrKysrKysrKysrKystDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaA0KPiBpbmRleA0KPiA+IDBiN2RlMzEwMmUuLmQ4OTIyZmQ1ZGIgMTAwNjQ0DQo+ID4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9tbS5oDQo+ID4gQEAgLTg4LDcgKzg4LDE1IEBAIHN0cnVjdCBwYWdlX2luZm8NCj4gPiAg
ICAgICAgICAgICovDQo+ID4gICAgICAgICAgIHUzMiB0bGJmbHVzaF90aW1lc3RhbXA7DQo+ID4g
ICAgICAgfTsNCj4gPiAtICAgIHU2NCBwYWQ7DQo+ID4gKw0KPiA+ICsgICAgLyogUGFnZSBpcyBy
ZXNlcnZlZC4gKi8NCj4gPiArICAgIHN0cnVjdCB7DQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAg
ICAgICAgKiBSZXNlcnZlZCBPd25lciBvZiB0aGlzIHBhZ2UsDQo+ID4gKyAgICAgICAgICogaWYg
dGhpcyBwYWdlIGlzIHJlc2VydmVkIHRvIGEgc3BlY2lmaWMgZG9tYWluLg0KPiA+ICsgICAgICAg
ICAqLw0KPiA+ICsgICAgICAgIHN0cnVjdCBkb21haW4gKmRvbWFpbjsNCj4gPiArICAgIH0gcmVz
ZXJ2ZWQ7DQo+IA0KPiBUaGUgc3BhY2UgaW4gcGFnZV9pbmZvIGlzIHF1aXRlIHRpZ2h0LCBzbyBJ
IHdvdWxkIGxpa2UgdG8gYXZvaWQgaW50cm9kdWNpbmcgbmV3DQo+IGZpZWxkcyB1bmxlc3Mgd2Ug
Y2FuJ3QgZ2V0IGF3YXkgZnJvbSBpdC4NCj4gDQo+IEluIHRoaXMgY2FzZSwgaXQgaXMgbm90IGNs
ZWFyIHdoeSB3ZSBuZWVkIHRvIGRpZmZlcmVudGlhdGUgdGhlICJPd25lciINCj4gdnMgdGhlICJS
ZXNlcnZlZCBPd25lciIuIEl0IG1pZ2h0IGJlIGNsZWFyZXIgaWYgdGhpcyBjaGFuZ2UgaXMgZm9s
ZGVkIGluIHRoZQ0KPiBmaXJzdCB1c2VyIG9mIHRoZSBmaWVsZC4NCj4gDQo+IEFzIGFuIGFzaWRl
LCBmb3IgMzItYml0IEFybSwgeW91IG5lZWQgdG8gYWRkIGEgNC1ieXRlIHBhZGRpbmcuDQo+IA0K
DQpZZWFoLCBJIG1heSBkZWxldGUgdGhpcyBjaGFuZ2UuIEkgaW1wb3J0ZWQgdGhpcyBjaGFuZ2Ug
YXMgY29uc2lkZXJpbmcgdGhlIGZ1bmN0aW9uYWxpdHkNCm9mIHJlYm9vdGluZyBkb21haW4gb24g
c3RhdGljIGFsbG9jYXRpb24uIA0KDQpBIGxpdHRsZSBtb3JlIGRpc2N1c3Npb24gb24gcmVib290
aW5nIGRvbWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbi4gDQpDb25zaWRlcmluZyB0aGUgbWFqb3Ig
dXNlciBjYXNlcyBmb3IgZG9tYWluIG9uIHN0YXRpYyBhbGxvY2F0aW9uDQphcmUgc3lzdGVtIGhh
cyBhIHRvdGFsIHByZS1kZWZpbmVkLCBzdGF0aWMgYmVoYXZpb3IgYWxsIHRoZSB0aW1lLiBObyBk
b21haW4gYWxsb2NhdGlvbg0Kb24gcnVudGltZSwgd2hpbGUgdGhlcmUgc3RpbGwgZXhpc3RzIGRv
bWFpbiByZWJvb3RpbmcuDQoNCkFuZCB3aGVuIHJlYm9vdGluZyBkb21haW4gb24gc3RhdGljIGFs
bG9jYXRpb24sIGFsbCB0aGVzZSByZXNlcnZlZCBwYWdlcyBjb3VsZA0Kbm90IGdvIGJhY2sgdG8g
aGVhcCB3aGVuIGZyZWVpbmcgdGhlbS4gIFNvIEkgYW0gY29uc2lkZXJpbmcgdG8gdXNlIG9uZSBn
bG9iYWwNCmBzdHJ1Y3QgcGFnZV9pbmZvKltET01JRF1gIHZhbHVlIHRvIHN0b3JlLg0KIA0KQXMg
SmFuIHN1Z2dlc3RlZCwgd2hlbiBkb21haW4gZ2V0IHJlYm9vdGVkLCBzdHJ1Y3QgZG9tYWluIHdp
bGwgbm90IGV4aXN0IGFueW1vcmUuDQpCdXQgSSB0aGluayBET01JRCBpbmZvIGNvdWxkIGxhc3Qu
DQoNCj4gPiAgIH07DQo+ID4NCj4gPiAgICNkZWZpbmUgUEdfc2hpZnQoaWR4KSAgIChCSVRTX1BF
Ul9MT05HIC0gKGlkeCkpDQo+ID4gQEAgLTEwOCw2ICsxMTYsOSBAQCBzdHJ1Y3QgcGFnZV9pbmZv
DQo+ID4gICAgIC8qIFBhZ2UgaXMgWGVuIGhlYXA/ICovDQo+ID4gICAjZGVmaW5lIF9QR0NfeGVu
X2hlYXAgICAgIFBHX3NoaWZ0KDIpDQo+ID4gICAjZGVmaW5lIFBHQ194ZW5faGVhcCAgICAgIFBH
X21hc2soMSwgMikNCj4gPiArICAvKiBQYWdlIGlzIHJlc2VydmVkLCByZWZlcnJpbmcgc3RhdGlj
IG1lbW9yeSAqLw0KPiANCj4gSSB3b3VsZCBkcm9wIHRoZSBzZWNvbmQgcGFydCBvZiB0aGUgc2Vu
dGVuY2UgYmVjYXVzZSB0aGUgZmxhZyBjb3VsZCBiZSB1c2VkDQo+IGZvciBvdGhlciBwdXJwb3Nl
LiBPbmUgZXhhbXBsZSBpcyByZXNlcnZlZCBtZW1vcnkgd2hlbiBMaXZlIFVwZGF0aW5nLg0KPiAN
Cg0KU3VyZSwgSSB3aWxsIGRyb3AgaXQuDQoNCj4gPiArI2RlZmluZSBfUEdDX3Jlc2VydmVkICAg
ICBQR19zaGlmdCgzKQ0KPiA+ICsjZGVmaW5lIFBHQ19yZXNlcnZlZCAgICAgIFBHX21hc2soMSwg
MykNCj4gPiAgIC8qIC4uLiAqLw0KPiA+ICAgLyogUGFnZSBpcyBicm9rZW4/ICovDQo+ID4gICAj
ZGVmaW5lIF9QR0NfYnJva2VuICAgICAgIFBHX3NoaWZ0KDcpDQo+ID4gQEAgLTE2MSw2ICsxNzIs
OSBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyB4ZW5oZWFwX2Jhc2VfcGR4Ow0KPiA+ICAgI2RlZmlu
ZSBwYWdlX2dldF9vd25lcihfcCkgICAgKF9wKS0+di5pbnVzZS5kb21haW4NCj4gPiAgICNkZWZp
bmUgcGFnZV9zZXRfb3duZXIoX3AsX2QpICgoX3ApLT52LmludXNlLmRvbWFpbiA9IChfZCkpDQo+
ID4NCj4gPiArI2RlZmluZSBwYWdlX2dldF9yZXNlcnZlZF9vd25lcihfcCkgICAgKF9wKS0+cmVz
ZXJ2ZWQuZG9tYWluDQo+ID4gKyNkZWZpbmUgcGFnZV9zZXRfcmVzZXJ2ZWRfb3duZXIoX3AsX2Qp
ICgoX3ApLT5yZXNlcnZlZC5kb21haW4gPSAoX2QpKQ0KPiA+ICsNCj4gPiAgICNkZWZpbmUgbWFk
ZHJfZ2V0X293bmVyKG1hKSAgIChwYWdlX2dldF9vd25lcihtYWRkcl90b19wYWdlKChtYSkpKSkN
Cj4gPg0KPiA+ICAgI2RlZmluZSBmcmFtZV90YWJsZSAoKHN0cnVjdCBwYWdlX2luZm8gKilGUkFN
RVRBQkxFX1ZJUlRfU1RBUlQpDQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGll
biBHcmFsbA0KDQoNCkNoZWVycywNCg0KUGVubnkgWmhlbmcNCg==

