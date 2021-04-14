Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0C35F568
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110654.211219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfsb-0005Li-QH; Wed, 14 Apr 2021 13:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110654.211219; Wed, 14 Apr 2021 13:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfsb-0005LI-N6; Wed, 14 Apr 2021 13:48:29 +0000
Received: by outflank-mailman (input) for mailman id 110654;
 Wed, 14 Apr 2021 13:48:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF16=JL=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lWfsa-0005LD-45
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:48:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e77d77cb-7106-4f02-867b-da82c25a2eda;
 Wed, 14 Apr 2021 13:48:25 +0000 (UTC)
Received: from DU2PR04CA0187.eurprd04.prod.outlook.com (2603:10a6:10:28d::12)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 13:48:23 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::1b) by DU2PR04CA0187.outlook.office365.com
 (2603:10a6:10:28d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 13:48:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 13:48:23 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Wed, 14 Apr 2021 13:48:23 +0000
Received: from 2d75c8666bb1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4B508318-6164-43B2-9C90-B3196AB57037.1; 
 Wed, 14 Apr 2021 13:47:54 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d75c8666bb1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 13:47:54 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5775.eurprd08.prod.outlook.com (2603:10a6:800:1a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 13:47:52 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 13:47:52 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0049.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:152::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 13:47:52 +0000
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
X-Inumbo-ID: e77d77cb-7106-4f02-867b-da82c25a2eda
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv5tpFVsPfH2f4UuEmfi6lMjjnlbZkYldOCHFYrL/7A=;
 b=fnIVbJQrta9IB6Ou6uT4fyDxN5k1Yq742Fo5TLECPXiBuAIt+8ZNn32dFcg8V/bKA610rnZA4hEY13WInWVCwz3+wCjYUtYZfHxfaL6+zHNcJ0nN2aFQbr44azqk6JnhFKvdz0MMiDSU0pPrwwmGg98/Ulmau4SJDiQ+/oklMQw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4016c72cc0b90b9b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6AbnAIeO1NZOQv5JXPgfJRxRdi9J1P2J41Sz4s/HzTm/pevpbPRWCbpN/MaPWUrDlwCu9vfbXsIIGIKoNVengTu39vA7TmZ8h8eeV/HJiTR5xCXqWBy42AKKc+EKjrcy0tUOJpjwoNkthieGfcdwixgnY2ZIxSTJwlGqzRtnZP9KqkS6kR70D+pHduMZcwEfrNRMuwdgQVVpmAUfcQ3KMb3jFsMlFrnG+k1B8D97Ym7EGhAJq352VQT5RkD57r79Jkx/iJQFsyVkwBhaInT4Swk6JoWRqR9LYEekGWJZQVXLwaxYAY2AfCLS6hdnWG9mLmzS/8T/E3ynHok62O4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv5tpFVsPfH2f4UuEmfi6lMjjnlbZkYldOCHFYrL/7A=;
 b=IWM8MBqKGoO3sOwkcfwE0v+tKezzfnlXnpDWtaoAk9BLgLTMrm97BzgxVFy9XM4l3Uto+jLJryHSoJYvJFFDcIeIAE6g0jMjWqR/Dxcoe6zMYHUXgXZvvDkRWvxXmdQFY6kMwtr6QhFDJgNlcRvSCPxIeVoj8pxMZT4e87fuG5ANJw3z0q4X9qT0/KA0nupr+k9yIkMjhzEqbmWbR/Fv56NNKKnOVabm0JPVnjjzil1HgPyYBIzSb/wppd7aJjGkOLXm9B6Zjv2LB3hpejmALtCgfVzv4KFe9NaqUWFUXPujRak7Ww5wJuZn366F4oCIyAgYX+uWfkpGdjpWmrh69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv5tpFVsPfH2f4UuEmfi6lMjjnlbZkYldOCHFYrL/7A=;
 b=fnIVbJQrta9IB6Ou6uT4fyDxN5k1Yq742Fo5TLECPXiBuAIt+8ZNn32dFcg8V/bKA610rnZA4hEY13WInWVCwz3+wCjYUtYZfHxfaL6+zHNcJ0nN2aFQbr44azqk6JnhFKvdz0MMiDSU0pPrwwmGg98/Ulmau4SJDiQ+/oklMQw=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is NULL
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <269e20a7-9f2c-f989-0ea0-7ab6c6bb9c11@xen.org>
Date: Wed, 14 Apr 2021 14:47:45 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F5760FAD-466F-46EC-A3A4-BAC2B5E73BC8@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-3-luca.fancellu@arm.com>
 <3424d24f-b189-c125-7b84-96848bbdcfd7@xen.org>
 <04326BA4-6E73-44BA-AB19-8F2B99000D8B@arm.com>
 <269e20a7-9f2c-f989-0ea0-7ab6c6bb9c11@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::18) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79fc0931-b286-413b-3c3a-08d8ff4bf8f4
X-MS-TrafficTypeDiagnostic: VE1PR08MB5775:|AS8PR08MB6008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB60082BF76EA6DAB98CF232B3E44E9@AS8PR08MB6008.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UScNSOzTRau4SVjSzueTjhAmTAKJewFW9KYH4KmPWRUn0AHX/xxjob6zm7gmhdyp62S70cCc0sWgjD7O4X1qwdnziw3uKZUIxgaTB43w/yH+jJvNFbuMi+Mor1ABrBGjz0NSxLgw28UL3nzrEXeFnZVt7RLk2iW8iRV6rbdxkyTqB7PatJAMyRfxmR14lY63kvMVJxTACy8Oee5T5EIEkfuxAVzXdA5//ifHGmroXCDPykhc0N/xvcWCkFTlfsPpnsu9Y3u40VZCcQbw3S+SEE5DwuKd3P4oWoRT7VAtGaAi9hqUuhoV7fNILH/T58YUD+h8wWf/CJN++V3iGUNWJU8y75u7Gjmbj89ByRCR1iQoxPXXomS/1jvgybtlvtmrjAEo30hafSTQHJRpC4t/nkLq3I9GFRlBDsTGOKvWGhJFsWqgct5W+0YUhsR+rOrndvB7lukmmzq76hAIjnj0npBS0pGXtzNYZMn+/M8GfFrI+/btKXNFjdtzu+oIlvVokVO2cLHythlAzo4CiDvRAHvMpZBYGBR1f5WlvFgCITmwBzBEh2sChs69RcC7+yd0pbVvoZriwpsFa19pFCyCUJar0N43QHbtpAKah0TDsTzKk7+8jAN7fM9DI7wuarIyDWj5XS5Sw2MFYEU6y0xcQpiiH+PT5JgnJTRMKZNBf5uzLIgLtxeG4xml7LdIY76x
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(2906002)(54906003)(7696005)(52116002)(53546011)(2616005)(38350700002)(498600001)(38100700002)(186003)(5660300002)(86362001)(33656002)(16526019)(956004)(83380400001)(66476007)(8676002)(26005)(66946007)(8936002)(6486002)(6666004)(66556008)(36756003)(4326008)(6916009)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?04UBOkP0CY/bjnGBQ9jQvLGxw8Sa//Qrz2pkBiSgNU89UrtcVq9sZUdbXuSO?=
 =?us-ascii?Q?xQcmjc18c6+kGnDCGdMGPfLIsP+DOi4tL9S0ZnjNjzcWmUyC98hqrt6e20tv?=
 =?us-ascii?Q?rWFcUaNXWsLNyaXS+diwA4E6pu4e6VFKMWueqTfxBs8IpCI1d80E1LT07oOv?=
 =?us-ascii?Q?HleATed0JIyM3sh3R+lBMYAdWP5OpCeMDrhZ/8rYVqDMQIguceKF4YXU8jgK?=
 =?us-ascii?Q?t0kw0FqFk422DlhsVve/q9TicUSGwfkVKuxP1gKzBsNGdAxNcTHkjDDS32a9?=
 =?us-ascii?Q?YXZ6s7YMDjC7KL90W9QAE8dfqNzPseIoTeADXslJkv1txw1YTwxQ2P/V4XOQ?=
 =?us-ascii?Q?wCDNx8OH0X7eKOdInBzHOwg3xPf6nvdTIv2hR7RwNBH98fBifzLx2g+DrB+B?=
 =?us-ascii?Q?hsZDaIiea9sZLg8D7AhzZhQoNst5YFBsTCrHdOZb3nrOXWV2IFTIm2vefqxq?=
 =?us-ascii?Q?pcnPo3+R17tiSjvQSvhht8HAIB0u6WVG4UmIVTeOfFkpOf9nLJlQjgsyzUlm?=
 =?us-ascii?Q?41Sw9t0b2xBniAJSl7B1ys0BR+X0raFOR8EE+LLSbS513PqkyaaH9SCRUQs4?=
 =?us-ascii?Q?C+dpYMejRusgga5uLMXRyPlbtU75Gz/IJMfND3s89D7ztpbm3z4Wvzv6PiM/?=
 =?us-ascii?Q?6rYoAhr4qn2tInBc7GlFnfQ/CRAF4bGYkw2UlsEe5tczExZHbvYgluPsY/rs?=
 =?us-ascii?Q?jrxmdePpJlslO+IaWBf3bGVXFT2yYKEJvRl5GlUIgPn73i6Saby5SFcFWFFa?=
 =?us-ascii?Q?e/WXZAi/VzGPzlSmJPdDXANrMajpHX3eLTnetxm52AtfnkSMwhFcBkdvfufQ?=
 =?us-ascii?Q?al1OrYrGR76dpeUvooCOGvjGUvUMAXKMVVAoOHz6SPVgHsqeUCllzQltSIe6?=
 =?us-ascii?Q?GLjAZ2nNrXjLjM7nwND82BJr+xOkOJ3hkYT1l/JUislbMRfJ4sSXPKgiCaX4?=
 =?us-ascii?Q?VxwpERndd58mMPs7HmUESh17sZRHHBFRSVeRY6AAWG8ukwuHHOFgfdFiaqJR?=
 =?us-ascii?Q?yRNelFniouRxzim+JHkF0JFW7jPwBd/shHal1TmDsrfx27t5XzNOIyqW/Ko3?=
 =?us-ascii?Q?7hYRPW/rRrHcVznVHkSVPl0zy7ELKCG+xDc09oqa+x+YsH2QId+Bew0sZdF7?=
 =?us-ascii?Q?R+DViYPv/hBK3+VbGlp8sm+uelfRCUMIs90CIFtmSL0v7+cJlQLfdw+xn/Pk?=
 =?us-ascii?Q?a43gJe/GZUcOloR+PQCwMtbNaNTO1hI12e9oOHZ8cR9wbhEwa5Vp4YNKIbnV?=
 =?us-ascii?Q?bKmG7WkZhJPBUD9/qK+PKvUl2zh1CH7iFHpURe4UigjUozKKb0tSjxcFfo7S?=
 =?us-ascii?Q?LKaS5sGE0gYm2Ovz9kl90EUW?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5775
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e94c4d86-9625-43bc-ec27-08d8ff4be65b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oD81GxrhllmL+qmsdyusSIxSehoOEIaQnwEEl3vMGc0Ot9fow5FVXkQiabo3rhyl1PKO0aB3zY/O/o14j1ZOprU730oK+S07/y2wGFyFHMk1B/rfUE+4+GWF7vjzCmSCtxORY/BRnAobi06vlNmq/dC8GSGlnI7ZL9aNlcoslsVxn2qOLBICjRmJSakIsT8Ffs6tXhKkcXygVbJTzWYHaMqJYpW6eMrgPsV1XIbi3C3aEW0EXnaLqOg+orLjVok+Tv5R60Yb6kkiSubGJHrUFx3RDZzPFW6B7nYdcuT8gNHWUqXvjj/oIDvcZfi8AvN6FTlkZSpF5u/EsFKXftp9C/GMOWWhhVoxgj2NGVU5vA9l7717XTK5m6NE7tcUU9J3cgdReoKuoIPk8o67meq6OA+lRVUcXpqcnlTuaEve63+0uc4Lz+C8O1p16+EnXLzGAeEp36nvihz4gj0xHTouAREliAjCglZO1WoJLYP7ylrUA8m0Tv9FSVUQGp4f0EjQB67ozIoqQXA88lbtGm+wOBR+nqE1sFwrLcsp+eV7toiU7Sn9yB+c4wFh0jnviRC6YWBm9IEMXa51wpnbMZhmeZ8v2AlEzhRUKz1d4kcZ4FcDMqqzxW9nKvuAZxh8rYw26UW0miRhzoYyCxUUxfFHD8BucKSJ4Q3167qDfQM4t6E=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39830400003)(346002)(396003)(136003)(376002)(36840700001)(46966006)(356005)(36756003)(8936002)(8676002)(81166007)(6666004)(70586007)(86362001)(2616005)(316002)(44832011)(47076005)(26005)(478600001)(82310400003)(956004)(2906002)(336012)(186003)(70206006)(5660300002)(4326008)(16526019)(6486002)(53546011)(6862004)(83380400001)(36860700001)(33656002)(7696005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 13:48:23.7246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fc0931-b286-413b-3c3a-08d8ff4bf8f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008



> On 14 Apr 2021, at 14:45, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 14/04/2021 12:29, Luca Fancellu wrote:
>>> On 14 Apr 2021, at 12:16, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Luca,
>>>=20
>>> On 14/04/2021 10:14, Luca Fancellu wrote:
>>>> Among the common and arm codebase there are few cases where
>>>> the hardware_domain variable is checked to see if the current
>>>> domain is equal to the hardware_domain, change this cases to
>>>> use is_hardware_domain() function instead. >
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>> v4 changes:
>>>> - removed unneeded check for domain NULL from is_hardware_domain
>>>>   introduced in v3
>>>=20
>>> After this change, this patch is only avoid to open-code is_hardware_do=
main(). Although, it adds an extra speculation barrier.
>>>=20
>>> I am not against the change, however I think the commit message needs t=
o updated to match what the patch is doing.
>>>=20
>>> Can you propose a new commit message?
>> Hi Julien,
>> Yes I agree, what about:
>> xen/arm: Reinforce use of is_hardware_domain
>> Among the common and arm codebase there are few cases where
>=20
> I would drop 'common' because you are only modifying the arm codebase.
>=20
>> the hardware_domain variable is checked to see if the current
>> domain is equal to the hardware_domain, change this cases to
>> use is_hardware_domain() function instead.
>=20
>=20
>> In the eventuality that hardware_domain is NULL, is_hardware_domain
>> will return false because an analysis of the common and arm codebase
>> shows that is_hardware_domain is called always with a non NULL
>> domain pointer.
>=20
> This paragraph seems to come out of the blue. I would drop it.
>=20
> How about:
>=20
> "
> There are a few places on Arm where we use pretty much an open-coded vers=
ion of is_hardware_domain(). The main difference, is the helper will also b=
lock speculation (not yet implemented on Arm).
>=20
> The existing users are not in hot path, so blocking speculation would not=
 hurt when it is implemented. So remove the open-coded version within the a=
rm codebase.
> "
>=20
> If you are happy with the commit message, I will commit it the series tom=
orrow (to give an opportunity to Stefano to review).
>=20

Hi Julien,

Yes your version is much better, thank you very much!

Cheers,
Luca

> Cheers,
>=20
> --=20
> Julien Grall


