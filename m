Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690CE3BB6C1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 07:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149784.277042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0H3r-0005F6-Nk; Mon, 05 Jul 2021 05:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149784.277042; Mon, 05 Jul 2021 05:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0H3r-0005D3-KU; Mon, 05 Jul 2021 05:22:27 +0000
Received: by outflank-mailman (input) for mailman id 149784;
 Mon, 05 Jul 2021 05:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kFf=L5=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m0H3q-0005Cx-4J
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 05:22:26 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa53cf44-dd50-11eb-8439-12813bfff9fa;
 Mon, 05 Jul 2021 05:22:23 +0000 (UTC)
Received: from DU2PR04CA0255.eurprd04.prod.outlook.com (2603:10a6:10:28e::20)
 by DB7PR08MB3628.eurprd08.prod.outlook.com (2603:10a6:10:44::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Mon, 5 Jul
 2021 05:22:21 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::ef) by DU2PR04CA0255.outlook.office365.com
 (2603:10a6:10:28e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 05:22:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 05:22:21 +0000
Received: ("Tessian outbound 2e56506fe389:v97");
 Mon, 05 Jul 2021 05:22:21 +0000
Received: from f073af98f6a2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E3C03425-9106-426A-BC87-38A17EA73601.1; 
 Mon, 05 Jul 2021 05:22:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f073af98f6a2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 05:22:11 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB5535.eurprd08.prod.outlook.com (2603:10a6:803:13e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 5 Jul
 2021 05:22:07 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 05:22:07 +0000
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
X-Inumbo-ID: fa53cf44-dd50-11eb-8439-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OGhvD8CfzA774M3J3ivX1/+nTSAE75dy61AKqLYvS8=;
 b=8fGFTknBODM4oK0YtE0sOx9A5MR6+EeNvOBGMGvp7G3BBJAjT1X6ZNaPq055E2u18yH35+/dXWssQR4eX5gobTwu/nl6M3eouk3Rv+FI6ypj9BnqpBnFAjFaQFOljOsnuFfql72S8cxLHUpVuVbsVEMQtMWi3qeWIe98+C9jJ5E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9Z7gKZZrhJenUcIadU2b6knDTGDYZ67kDVeqNlLzAZt/JlmcCgeQXLSuHRe+M2fSxlRKv3MmZbl9pk6KAnvrEcZs/5wTrZKbrymkBWEswjyjGZCERBHt04h9Vv5VTKflf1Z3qJpX8D/JgM0QD+3mQrHCBlniPPK+Y5zERa0Qpw6PlfzGuAw4b/ilxHWrQJ45kizsrs+8motvwEJiCr+5miYox4cHpLiR1HSAAL2u49KqTRXpfv9IOCZ45H/ODWpVrMoU8z3keJq1fv+5YA2+noPi7rj/w5rtwoJSlsj14cKOjIOXhLIuCx15RN6ggvmuL3OwpRv8e3+z8m49uApZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OGhvD8CfzA774M3J3ivX1/+nTSAE75dy61AKqLYvS8=;
 b=M0UMzMWdzkGfhPCrl8TcIJE+ObcOmN5+me6xZ3oDR8Y2/o4Y2YSxT+8OR80+B2DEcnmMcNZ8+H+LSXAHt4fuDoKmu288SD0pGsNQrQJDo0Vm2Kb8IsZLwWDgjpMzHN6Y21+aRjAlfi6g5WiVRRuIakK/dAJOAkRJayYIwe3ifNHfboSCgno5O8jjZv4TQcAE10F5nnqYQrK8W81zLavCZ2tav18++w9iXhP6Y9UzuCJiaxv8i97v32Fpd45o7Rc4gIZIyRHlg3NQNcDOzb95JcuueEGiUZ0GT7MD9f3BhFo5en3e+OTaVvTRICquoYp0Sv4If+lP9xy/OeIcLYiITg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OGhvD8CfzA774M3J3ivX1/+nTSAE75dy61AKqLYvS8=;
 b=8fGFTknBODM4oK0YtE0sOx9A5MR6+EeNvOBGMGvp7G3BBJAjT1X6ZNaPq055E2u18yH35+/dXWssQR4eX5gobTwu/nl6M3eouk3Rv+FI6ypj9BnqpBnFAjFaQFOljOsnuFfql72S8cxLHUpVuVbsVEMQtMWi3qeWIe98+C9jJ5E=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [PATCH 4/9] xen/arm: static memory initialization
Thread-Topic: [PATCH 4/9] xen/arm: static memory initialization
Thread-Index: AQHXW0b3OiAcoe7xDE2AVcNY0dwUCqsNAWAAgB/3qYCABuqiQA==
Date: Mon, 5 Jul 2021 05:22:07 +0000
Message-ID:
 <VE1PR08MB52150F476CA7E1989F9067C7F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
 <e0a312a1-f430-3ff0-6dd6-fcfe18e58071@suse.com>
 <7f77349f-015e-83d3-d646-af9897e31348@xen.org>
In-Reply-To: <7f77349f-015e-83d3-d646-af9897e31348@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7786580DF9C5D843A331F94601885256.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f8ef3700-517e-4836-4def-08d93f74dd79
x-ms-traffictypediagnostic: VI1PR08MB5535:|DB7PR08MB3628:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3628D5F92CB19EC6B754D5BFF71C9@DB7PR08MB3628.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a/wPqC2HRjyacr7JbeXWqkVzwT994y1wJaAvJjcNLoq7xbZsKqCdgdxllfgWdmuQTKHXoMyfDkZZGKNqXNJYfw8Z7rQJgGdxvzC1fNTbgE116dgRTArO59p4zsKzIG0KmawHWUypZ6Kc0DVFThjY5aCPhUG3C2YFjH/Jj2H1JRmEBWATEmKehTiKZUH5tJCHLVYonzyso5vEfhsNmGfhAUp5wq8eoI9058JcfScmytJltMYzkE7wLA67ouwVGrd1RmXwb4eW7QPLlIDUGahPkk2McEh43cTh0hzTpmtmbRj4zM+tQltYlRg2as/W+DVGg50uAxe5L2ZtRtv4txxx/XVVNIQrzj4SSXVOzzA53kKUsEwnrRAdcd8PW0LJEXWym55AdpmpFSZXvp6TXDZ/75t8qjGN1uuEhJN4jCzWqqqcFQICvt4AqBfEUhkPS4w+Pq6tiRAU1Pqxh6N/eMlhooBVTPlqqEFYd38vjbwNn0bxucHg+2FnzEfMqOYVtTQ7mmThkGyM1r8LQeMc1euRtdb4rMinhMVwxNO/BQCpmG3bo+/MeQ44mUQf6FHE1DsbbRmT8LtdN/16ITFL++rKpDGddiAMs0EmKZBNYIiJEWdA/C9yjBxBtjux1ux5zVbg/zDUvq0jCP2F7xdQU7I8xw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(39850400004)(396003)(5660300002)(7696005)(8936002)(478600001)(6506007)(66946007)(66446008)(66476007)(53546011)(66556008)(64756008)(26005)(33656002)(54906003)(8676002)(4326008)(76116006)(71200400001)(122000001)(55016002)(9686003)(110136005)(86362001)(83380400001)(38100700002)(2906002)(52536014)(316002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzdaQ2Zlc2xtOWU0M1pjS2FjUm1pbkg4dlByQ2VOcTlJak1PSXVOblN2Q1F2?=
 =?utf-8?B?TGl0NmZhT1VPNURIMkU3QVJJK1pGdVdSVkcxa3RjT05qcURyc3NLQ0dDWTBx?=
 =?utf-8?B?c3l1My9QRWFOd083TzY1V01mTTRFa3E1U2x2OG8ycEE0TUlsY201QVJTMWFK?=
 =?utf-8?B?U3ZXSWpucjFSY1JLR3lYUXQ4VXIxOWZSY1FZenhjekxETDAzTTNVSlVpL3Vp?=
 =?utf-8?B?WG5TcSsyQVlPbXpQZ05LWVEyS2k1TVZLVG5QbWpSU25Gd1BwWWxZS1lnUUVi?=
 =?utf-8?B?VWRDNEEvcWh3MTJIdFhucE51SWVTVmpPemw4SVN0N2YzYWdNVm9FOWtaK1E3?=
 =?utf-8?B?TXN5VG5BVGFVdEJzaFE0cTJwYmY3ZlN4WW1RVHdYR3FpRG1Wa1VuNTV4SUsw?=
 =?utf-8?B?UHFianRwdFZ3Y0N6Zi80V0ZIQUkvSnlKSGRIMEYxZGhIUWgzOXhobWtIZHgy?=
 =?utf-8?B?OGdrQzdtMGtTclJYQ0dKdEVmeVdndG5KMFJYUVBsVFVPS3E4OWZBWnFNRWdx?=
 =?utf-8?B?NXUyUmphWDRtcW5KQkhKbXRqbDdYVFRqUUNMTzhvWHNsMHAxOEtKTGhkZ3dH?=
 =?utf-8?B?T0wrbUtGRVB2a1BOdjlKTzBJWkMrUCtkWnU0K1BaemR3YnYrWnQzRTdTMUo2?=
 =?utf-8?B?VHI3ZG5kMHVqak1GSCswM2gxdmo1S25uZWpUNFhGbmhnSXNLeXlyOGFaQThP?=
 =?utf-8?B?T2pFYmd0ZGU3YktaZjhJQ3ZoYnNXWGxKaThsamdWS2xPaXJRMERXS2tEbU5i?=
 =?utf-8?B?TEZiK1FaL2F6NjVjbk83aFdqTlo2SHd3RUhucnlINTQwRC9CWVl0bEpDdGVO?=
 =?utf-8?B?eTNqbml6Tk1QdVppOWI4WHI0K2RCS3hDNlQyWERTVEFkclpIRWZjL2NIVlM2?=
 =?utf-8?B?b1BQRC9iVjExa3o4bU5EdURUakoxMXpPVmtpVmUvZDMzZzM4NzVkMmdnOVBr?=
 =?utf-8?B?d0xxQjMwL3VBVVJHMzhzMHdielZ3U0ZZcDZPVkh1Z29tUklKV2VKREgySW0r?=
 =?utf-8?B?ckkwR0M3dTBkdS9NeE01bGRLVzB4MnNrbTl4cFpxejZvcjF2NE0yWEdXMG5h?=
 =?utf-8?B?d2gzUmJIajhtdlJ4MkNYQ3hlOW1RU3IxREZmVC9GRjZDK0toU3h2Qzd3Yngy?=
 =?utf-8?B?eUJZZXhBYnlmUm5VVHQ0MCtNWVpBdjR0UllTTmtwaDZMMm1JWW9maHBvTm95?=
 =?utf-8?B?aWw0SHplTE1uR24zRjhjNzcya2JrK0hJOC9xU21ydklLcHJHc1I5UDM0c0Vl?=
 =?utf-8?B?V0JOeXh1Y3ZRYmp1UFZqZGtDVnRBZTFxRFZHUEdYNW9pRnZHRmMrY05hT2Ra?=
 =?utf-8?B?N0lyb2Frc3RadVhxOWVCd0l2VHU4bGJmekVkbVZ1eFBYcDl5WVdQYjVkL2RK?=
 =?utf-8?B?NHdXRXZEczFtRFVraWRaVzdDMVM5Mno1WjBWTkFxeW14RWJ6K0JwUE9TV2pP?=
 =?utf-8?B?eFVVT3V4ajFiTGdjbWU4UlNwUjdqbnRMUGxwSGRTN0RoUWNUNnFaSXhPU1hi?=
 =?utf-8?B?ZktnQ25nakJzeXJSa3ZWTHdNQmR3WFlWc0xiU3dYRmR2Uk01TzI3MTFFQWlT?=
 =?utf-8?B?d1lnSmJUK250UHp5L0E4d3lCVnlKSWZyVkZLQngwYWI1S01lcHNmMmtnR0k4?=
 =?utf-8?B?UGdBSHRvcVROVGxMeXROS1VCeUtaUi9FbzZBbkFPOGFXcVJaRk1UajIyV29K?=
 =?utf-8?B?RVZKSDFUSytPMW9va1pnMHV0RmdNMXpJYjlRT1luVjBST0Z5ZnRaWDhSS1M2?=
 =?utf-8?Q?lYMIYPhns62cRXMnxg9dLIU9VnALfARATqII3xx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5535
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c12c467a-298c-4b38-0172-08d93f74d539
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7/kKs6aknlsowqzNKyn8VMMXoV+CCzQ7Xz+SvoX6iRbzTKwriIg3pnxwJuBJVf+K1iP8PdqtoCUnmkdZ+8kD7GF74l4b4AWMXeIfMhw2fW+/ZooLADOfnLLoCJPgHLALYCGv3dXtcR5DKn/Vbx4o0js5B2+VPx/tSwmzdSZKy4kX5EhajPl8BD7dLPk+mPFTAQyEhSU3p0xnnIyA2bdfJP0ur3yCJlvTVw6snvXGpdfniq8pUfEwh+b0W/3vVx3jxsoW7yShaXtzmH3yi0WEqEZDCLu0ZYHTehuP1yh3sgAy28glGJwB6txzFW+OFv9ejW5XmHMIJi44Y+McUUlanGKwnQkrTrXJzGmdP/cVhjxhdC4861f99JsDXxWogIz2PSqqY88RkO+AlEzKHrtuKoaMtMEsH5SsMvkSquDBe1013pzlKQYHKEY5Qptgka2W1wzEbabN2P4ANps8I5pOVfHn6PmiVFFkVw47p4nnmv62455c8/oSrk7ZezPsS4ODWGMkXZzE7s+kfyaNW5z+V7VGpm2hKv0r2W1d4E7B6mO9UoFbwfQB+Cxhc0IFgrcZ38mwuOErSaPPeYQwj+akV/WcrSEmjdZmXWO/ZZxuSH/b18Ibi8t+qlyNRj3FC09NZVb7WUO3JFoQUvmHHRT1LLxB87mfMmhBPB+nTWKk9BqioU5/3Qnl3NPdUIFeUarvHml11/rO4cN5CWJipQ3jOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(46966006)(36840700001)(47076005)(2906002)(186003)(36860700001)(9686003)(8936002)(82740400003)(478600001)(55016002)(26005)(33656002)(82310400003)(107886003)(86362001)(110136005)(52536014)(70586007)(5660300002)(54906003)(8676002)(81166007)(336012)(53546011)(4326008)(83380400001)(316002)(6506007)(7696005)(70206006)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 05:22:21.4016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ef3700-517e-4836-4def-08d93f74dd79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3628

SGkgSnVsaWVuIGFuZCBKYW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAx
LCAyMDIxIDE6NDYgQU0NCj4gVG86IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFBl
bm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzldIHhlbi9hcm06IHN0YXRpYyBtZW1vcnkgaW5p
dGlhbGl6YXRpb24NCj4gDQo+IEhpLA0KPiANCj4gT24gMTAvMDYvMjAyMSAxMDozNSwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+ID4gT24gMDcuMDYuMjAyMSAwNDo0MywgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ID4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jDQo+ID4+IEBAIC02MTEsNiArNjExLDMwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBp
bml0X3BkeCh2b2lkKQ0KPiA+PiAgICAgICB9DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiArLyogU3Rh
dGljIG1lbW9yeSBpbml0aWFsaXphdGlvbiAqLw0KPiA+PiArc3RhdGljIHZvaWQgX19pbml0IGlu
aXRfc3RhdGljbWVtX3BhZ2VzKHZvaWQpIHsNCj4gPj4gKyAgICBpbnQgYmFuazsNCj4gPg0KPiA+
IFdoaWxlIEknbSBub3QgYSBtYWludGFpbmVyIG9mIHRoaXMgY29kZSwgSSdkIHN0aWxsIGxpa2Ug
dG8gcG9pbnQgb3V0DQo+ID4gdGhhdCB3aGVyZXZlciBwb3NzaWJsZSB3ZSBwcmVmZXIgInVuc2ln
bmVkIGludCIgd2hlbiBkZWFsaW5nIHdpdGggb25seQ0KPiA+IG5vbi1uZWdhdGl2ZSB2YWx1ZXMs
IGFuZCBldmVuIG1vcmUgc28gd2hlbiB1c2luZyB0aGVtIGFzIGFycmF5DQo+ID4gaW5kZXhlcy4N
Cj4gDQo+ICsxLg0KPg0KDQpVbmRlcnN0b29kLiBUaHguDQoNCj4gPg0KPiA+PiArICAgIC8qDQo+
ID4+ICsgICAgICogVE9ETzogQ29uc2lkZXJpbmcgTlVNQS1zdXBwb3J0IHNjZW5hcmlvLg0KPiA+
PiArICAgICAqLw0KPiA+DQo+ID4gTml0OiBDb21tZW50IHN0eWxlLg0KPiA+DQoNClN1cmUsIHRo
eC4NCg0KPiA+PiBAQCAtODcyLDYgKzg5Niw5IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNp
Z25lZCBsb25nDQo+IGJvb3RfcGh5c19vZmZzZXQsDQo+ID4+ICAgICAgIGNtZGxpbmVfcGFyc2Uo
Y21kbGluZSk7DQo+ID4+DQo+ID4+ICAgICAgIHNldHVwX21tKCk7DQo+ID4+ICsgICAgLyogSWYg
ZXhpc3RzLCBTdGF0aWMgTWVtb3J5IEluaXRpYWxpemF0aW9uLiAqLw0KPiA+PiArICAgIGlmICgg
Ym9vdGluZm8uc3RhdGljX21lbS5ucl9iYW5rcyA+IDAgKQ0KPiA+PiArICAgICAgICBpbml0X3N0
YXRpY21lbV9wYWdlcygpOw0KPiA+DQo+ID4gSSBkb24ndCB0aGluayB0aGUgY29uZGl0aW9uYWwg
aXMgcmVhbGx5IG5lZWRlZCBoZXJlPw0KPiA+DQoNClN1cmUsIHJpZ2h0LiANCkxpa2Ugd2hhdCBK
dWxpZW4gc3VnZ2VzdHMsICBpbml0X3N0YXRpY21lbV9wYWdlcygpIGlzIGFscmVhZHkgYWJsZSB0
byBjb3BlIHdpdGggbnJfYmFua3MgPT0gMC4NCg0KPiA+PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2Vf
YWxsb2MuYw0KPiA+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+PiBAQCAtMTM3
Niw2ICsxMzc2LDM3IEBAIGJvb2wgc2NydWJfZnJlZV9wYWdlcyh2b2lkKQ0KPiA+PiAgICAgICBy
ZXR1cm4gbm9kZV90b19zY3J1YihmYWxzZSkgIT0gTlVNQV9OT19OT0RFOw0KPiA+PiAgIH0NCj4g
Pj4NCj4gPj4gK3N0YXRpYyB2b2lkIGZyZWVfcGFnZShzdHJ1Y3QgcGFnZV9pbmZvICpwZywgYm9v
bCBuZWVkX3NjcnViKSB7DQo+ID4+ICsgICAgbWZuX3QgbWZuID0gcGFnZV90b19tZm4ocGcpOw0K
PiA+DQo+ID4gV2l0aCBwZHggY29tcHJlc3Npb24gdGhpcyBpcyBhIG5vbi10cml2aWFsIGNvbnZl
cnNpb24uIFRoZSBmdW5jdGlvbg0KPiA+IGJlaW5nIGFuIGludGVybmFsIGhlbHBlciBhbmQgdGhl
IGNhbGxlciBhbHJlYWR5IGhvbGRpbmcgdGhlIE1GTiwgSQ0KPiA+IHRoaW5rIGl0IHdvdWxkIGJl
IHByZWZlcmFibGUgaWYgdGhlIE1GTiB3YXMgcGFzc2VkIGluIGhlcmUuIElmIGRvbmUNCj4gPiB0
aGlzIHdheSwgeW91IG1heSB3YW50IHRvIGNvbnNpZGVyIGFkZGluZyBhbiBBU1NFUlQoKSB0byBk
b3VibGUgY2hlY2sNCj4gPiBib3RoIHBhc3NlZCBpbiBhcmd1bWVudHMgbWF0Y2ggdXAuDQo+ID4N
Cg0KVGhhbmsgZm9yIHRoZSBzdWdnZXN0aW9ufg0KDQo+ID4+ICsgICAgLyogSWYgYSBwYWdlIGhh
cyBubyBvd25lciBpdCB3aWxsIG5lZWQgbm8gc2FmZXR5IFRMQiBmbHVzaC4gKi8NCj4gPj4gKyAg
ICBwZy0+dS5mcmVlLm5lZWRfdGxiZmx1c2ggPSAocGFnZV9nZXRfb3duZXIocGcpICE9IE5VTEwp
Ow0KPiA+PiArICAgIGlmICggcGctPnUuZnJlZS5uZWVkX3RsYmZsdXNoICkNCj4gPj4gKyAgICAg
ICAgcGFnZV9zZXRfdGxiZmx1c2hfdGltZXN0YW1wKHBnKTsNCj4gPj4gKw0KPiA+PiArICAgIC8q
IFRoaXMgcGFnZSBpcyBub3QgYSBndWVzdCBmcmFtZSBhbnkgbW9yZS4gKi8NCj4gPj4gKyAgICBw
YWdlX3NldF9vd25lcihwZywgTlVMTCk7IC8qIHNldF9ncGZuX2Zyb21fbWZuIHNub29wcyBwZyBv
d25lcg0KPiAqLw0KPiA+PiArICAgIHNldF9ncGZuX2Zyb21fbWZuKG1mbl94KG1mbiksIElOVkFM
SURfTTJQX0VOVFJZKTsNCj4gPj4gKw0KPiA+PiArI2lmZGVmIENPTkZJR19BUk0NCj4gPg0KPiA+
IElmIGF2b2lkYWJsZSB0aGVyZSBzaG91bGQgYmUgbm8gYXJjaC1zcGVjaWZpYyBjb2RlIGFkZGVk
IHRvIHRoaXMgZmlsZS4NCj4gPiBBc3N1bWluZyBhbm90aGVyIGFyY2ggZ2FpbmVkIFBHQ19yZXNl
cnZlZCwgd2hhdCdzIHdyb25nIHdpdGggZW5hYmxpbmcNCj4gPiB0aGlzIGNvZGUgcmlnaHQgYXdh
eSBmb3IgdGhlbSBhcyB3ZWxsPyBJLmUuIHVzZSBQR0NfcmVzZXJ2ZWQgaGVyZQ0KPiA+IGluc3Rl
YWQgb2YgQ09ORklHX0FSTT8gQWx0ZXJuYXRpdmVseSB0aGlzIG1heSB3YW50IHRvIGJlDQo+ID4g
Q09ORklHX1NUQVRJQ19BTExPQ0FUSU9OLCBhc3N1bWluZyB3ZSBjb25zaWRlciBQR0NfcmVzZXJ2
ZWQgdGllZCB0bw0KPiA+IGl0Lg0KPiA+DQoNClRvIG5vdCBicmluZyBkZWFkIGNvZGVzIGluIG90
aGVyIGFyY2hzLCBJJ2xsIHVzZSBtb3JlIGdlbmVyaWMgb3B0aW9uIENPTkZJR19TVEFUSUNfQUxM
T0NBVElPTi4NCg0KPiA+PiArICAgIGlmICggcGctPmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQg
KQ0KPiA+PiArICAgIHsNCj4gPj4gKyAgICAgICAgLyogVE9ETzogYXN5bmNocm9ub3VzIHNjcnVi
YmluZy4gKi8NCj4gPj4gKyAgICAgICAgaWYgKCBuZWVkX3NjcnViICkNCj4gPj4gKyAgICAgICAg
ICAgIHNjcnViX29uZV9wYWdlKHBnKTsNCj4gPj4gKyAgICAgICAgcmV0dXJuOw0KPiA+PiArICAg
IH0NCj4gPj4gKyNlbmRpZg0KPiA+PiArICAgIGlmICggbmVlZF9zY3J1YiApDQo+ID4NCj4gPiBO
aXQ6IFBsZWFzZSBoYXZlIGEgYmxhbmsgbGluZSBiZXR3ZWVuIHRoZXNlIGxhc3QgdHdvLg0KPiA+
DQoNClN1cmUuIFdpbGwgZG8uDQoNCj4gPj4gKyAgICB7DQo+ID4+ICsgICAgICAgIHBnLT5jb3Vu
dF9pbmZvIHw9IFBHQ19uZWVkX3NjcnViOw0KPiA+PiArICAgICAgICBwb2lzb25fb25lX3BhZ2Uo
cGcpOw0KPiA+PiArICAgIH0NCj4gPj4gKw0KPiA+PiArICAgIHJldHVybjsNCj4gPg0KPiA+IFBs
ZWFzZSBvbWl0IHJldHVybiBzdGF0ZW1lbnRzIGF0IHRoZSBlbmQgb2YgZnVuY3Rpb25zIHJldHVy
bmluZyB2b2lkLg0KPiA+DQoNClN1cmUsIHRoeA0KDQo+ID4+ICt9DQo+ID4NCj4gPiBPbiB0aGUg
d2hvbGUsIGJpa2Ugc2hlZGRpbmcgb3Igbm90LCBJJ20gYWZyYWlkIHRoZSBmdW5jdGlvbidzIG5h
bWUNCj4gPiBkb2Vzbid0IG1hdGNoIHdoYXQgaXQgZG9lczogVGhlcmUncyBubyBmcmVlaW5nIG9m
IGEgcGFnZSBoZXJlLiBXaGF0DQo+ID4gZ2V0cyBkb25lIGlzIG1hcmtpbmcgb2YgYSBwYWdlIGFz
IGZyZWUuIEhlbmNlIG1heWJlIG1hcmtfcGFnZV9mcmVlKCkNCj4gPiBvciBtYXJrX2ZyZWVfcGFn
ZSgpIG9yIHNvbWUgc3VjaD8NCj4gPg0KDQpPay4gVGh4LiBBbHdheXMgbm90IGdvb2QgYXQgZ2l2
aW5nIG5hbWVzLiBJJ2xsIHRha2UgbWFya19wYWdlX2ZyZWUoKQ0KDQo+ID4+IEBAIC0xNTEyLDYg
KzE1MzAsMzggQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFwX3BhZ2VzKA0KPiA+PiAgICAgICBzcGlu
X3VubG9jaygmaGVhcF9sb2NrKTsNCj4gPj4gICB9DQo+ID4+DQo+ID4+ICsjaWZkZWYgQ09ORklH
X1NUQVRJQ19BTExPQ0FUSU9ODQo+ID4+ICsvKiBFcXVpdmFsZW50IG9mIGZyZWVfaGVhcF9wYWdl
cyB0byBmcmVlIG5yX21mbnMgcGFnZXMgb2Ygc3RhdGljDQo+ID4+ICttZW1vcnkuICovIHZvaWQg
X19pbml0IGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBnLA0KPiB1bnNp
Z25lZCBsb25nIG5yX21mbnMsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIG5lZWRfc2NydWIpIHsNCj4gPj4gKyAgICBtZm5fdCBtZm4gPSBwYWdlX3RvX21mbihw
Zyk7DQo+ID4+ICsgICAgdW5zaWduZWQgbG9uZyBpOw0KPiA+PiArDQo+ID4+ICsgICAgZm9yICgg
aSA9IDA7IGkgPCBucl9tZm5zOyBpKysgKQ0KPiA+PiArICAgIHsNCj4gPj4gKyAgICAgICAgc3dp
dGNoICggcGdbaV0uY291bnRfaW5mbyAmIFBHQ19zdGF0ZSApDQo+ID4+ICsgICAgICAgIHsNCj4g
Pj4gKyAgICAgICAgY2FzZSBQR0Nfc3RhdGVfaW51c2U6DQo+ID4+ICsgICAgICAgICAgICBCVUdf
T04ocGdbaV0uY291bnRfaW5mbyAmIFBHQ19icm9rZW4pOw0KPiA+PiArICAgICAgICAgICAgLyog
TWFyayBpdCBmcmVlIGFuZCByZXNlcnZlZC4gKi8NCj4gPj4gKyAgICAgICAgICAgIHBnW2ldLmNv
dW50X2luZm8gPSBQR0Nfc3RhdGVfZnJlZSB8IFBHQ19yZXNlcnZlZDsNCj4gPj4gKyAgICAgICAg
ICAgIGJyZWFrOw0KPiA+PiArDQo+ID4+ICsgICAgICAgIGRlZmF1bHQ6DQo+ID4+ICsgICAgICAg
ICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+PiArICAgICAgICAgICAgICAgICAgICJQYWdlIHN0
YXRlIHNoYWxsIGJlIG9ubHkgaW4gUEdDX3N0YXRlX2ludXNlLiAiDQo+ID4NCj4gPiBXaHk/IEEg
cGFnZSAoc3RhdGljIG9yIG5vdCkgY2FuIGJlY29tZSBicm9rZW4gd2hpbGUgaW4gdXNlLiBJT1cg
SQ0KPiA+IGRvbid0IHRoaW5rIHlvdSBjYW4gYXZvaWQgaGFuZGxpbmcgUEdDX3N0YXRlX29mZmxp
bmluZyBoZXJlLiBBdCB3aGljaA0KPiA+IHBvaW50IHRoaXMgY29kZSB3aWxsIG1hdGNoIGZyZWVf
aGVhcF9wYWdlcygpJ2VzLCBhbmQgaGVuY2UgbGlrZWx5IHdpbGwNCj4gPiB3YW50IGZvbGRpbmcg
YXMgd2VsbC4NCj4gPg0KDQpZZWFoLCBJIHdhcyBmb2xsb3dpbmcgdGhlIGxvZ2ljIGluIGZyZWVf
aGVhcF9wYWdlcy4NCkhtbW0sIEkgY291bGQgbm90IHRoaW5rIG9mIGFueSBzY2VuYXJpbyB0aGF0
IHdpbGwgbGVhZCB0byBQR0Nfc3RhdGVfb2ZmbGluaW5nLCB0aGF0J3Mgd2h5DQpJIHdhcyBub3Qg
aW5jbHVkaW5nIGl0IGF0IHRoZSBmaXJzdCBwbGFjZS4NCkZvciBicm9rZW4gaXNzdWUsIHRiaCwg
SSBqdXN0IGNvcHkgdGhlIGJ1Z19vbiBmcm9tIGZyZWVfaGVhcF9wYWdlcywgYWZ0ZXIgcXVpdGUg
YSB0aW1lIHRoaW5raW5nLA0KSSBhbHNvIGNvdWxkIG5vdCBmaW5kIGFueSBzY2VuYXJpbyB3aGVu
IGEgcGFnZShzdGF0aWMgb3Igbm90KSBjYW4gYmVjb21lIGJyb2tlbiB3aGlsZSBpbiB1c2UuIDsv
DQoNCj4gPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gPj4gKysrIGIveGVuL2luY2x1
ZGUveGVuL21tLmgNCj4gPj4gQEAgLTg1LDYgKzg1LDEyIEBAIGJvb2wgc2NydWJfZnJlZV9wYWdl
cyh2b2lkKTsNCj4gPj4gICB9IHdoaWxlICggZmFsc2UgKQ0KPiA+PiAgICNkZWZpbmUgRlJFRV9Y
RU5IRUFQX1BBR0UocCkgRlJFRV9YRU5IRUFQX1BBR0VTKHAsIDApDQo+ID4+DQo+ID4+ICsjaWZk
ZWYgQ09ORklHX0FSTQ0KPiA+DQo+ID4gSVRZTSBDT05GSUdfU1RBVElDX0FMTE9DQVRJT04gaGVy
ZT8NCj4gPg0KPiA+IEphbg0KPiA+DQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg0KQ2hlZXJz
DQoNCi0tDQpQZW5ueSBaaGVuZw0K

