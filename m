Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB39340505
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 12:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98896.187908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMrHg-0000nB-TU; Thu, 18 Mar 2021 11:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98896.187908; Thu, 18 Mar 2021 11:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMrHg-0000mm-Pr; Thu, 18 Mar 2021 11:57:48 +0000
Received: by outflank-mailman (input) for mailman id 98896;
 Thu, 18 Mar 2021 11:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hxsu=IQ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lMrHe-0000mf-Gg
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 11:57:46 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d658fa4-18b6-4e74-a333-5b41e7c33703;
 Thu, 18 Mar 2021 11:57:45 +0000 (UTC)
Received: from DB9PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:10:1db::30)
 by DB7PR08MB3628.eurprd08.prod.outlook.com (2603:10a6:10:44::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 11:57:42 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::bc) by DB9PR06CA0025.outlook.office365.com
 (2603:10a6:10:1db::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 11:57:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 11:57:41 +0000
Received: ("Tessian outbound eae0c21066a4:v87");
 Thu, 18 Mar 2021 11:57:41 +0000
Received: from ba563b853073.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B517CB43-3F85-469B-93C3-D8E04C798B79.1; 
 Thu, 18 Mar 2021 11:57:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba563b853073.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Mar 2021 11:57:35 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB5486.eurprd08.prod.outlook.com (2603:10a6:803:13b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 11:57:33 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 11:57:33 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0200.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Thu, 18 Mar 2021 11:57:32 +0000
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
X-Inumbo-ID: 8d658fa4-18b6-4e74-a333-5b41e7c33703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59GxXDnR8AYB0nQcvHH9zOhiO9jslDGqXyWUrvSuISU=;
 b=rvHlYHTrW1FnAe4ILKY5CqyiUuEDACE07i0yxL5zp3y2G3eo9TtJUNt1MH/Lwbyqs/QFi4cSQItkNH1dkOE7G8haI+9NhRchhOUgUOh2Kd+UOXAimCiKLJiLIJ5piDUM3y0prRzdNa8gXWv+gkVbSC/NQApBCt5hzHy/RUJB+vw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d048c893c9d313a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6rHw/5l4Qa3f2FJ2X36MsGGiiT5yax2Fgvzeol0InWG6/GfzfYU2oOT/jC+I9wKA/hfJAZeWwvJx3g1PWU26Src5YtKItsbe4b9sQrvC/1z/HVfpkmGC5FvWYrfRhLNko66zW+3V+wAK+8O6NTtahTLn8Iy2t5bBlaNIiwiMfaZ8O2EBdkaMFaDnvsTcCnjKzVFNyXOBphvwraX1ivYVhKQ4NPDPDYCGTXYyalwv1te2g1WyaZKk6h9X8zESeSlo1uNNklAqIy7C0E+UJDFWR916Q96a3nf3t/oNfYc2Qn6Rl7VVkcx6PqvRHr0oMzTtWfy8DaNCnx1/rYGwrYLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59GxXDnR8AYB0nQcvHH9zOhiO9jslDGqXyWUrvSuISU=;
 b=L6gqrGsFy6npIx2WJbITo/m+/x5zlhmJ7DXZ+88f45KxiAH1rtFxNg5VU5VjnsMfl6Ba2gCys+8KVx7mQC07If2Dd/hPeHy6aqanWc+cEx0Dg4MNVZWuVjCTtzwFbn/lxcYykJHLy4WfkzdoFo55M4htQMDR2HB3kyozygbcFG9rVVqwsrZd7PUMDD5/VL8mQ5TuXJ5xebOhW6A5J847Q+CBN7O11LopuNg/kSGZWSbdTU4cKIKGXmfWlolJ3qG2Ky16MdIxBkl7VEA2ZoCFjOisyt5DQv4arfmJpia3pgI+EDoWMgTJq5GhinMnqRVUYD8Em9BOaN88VXaHVpU4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59GxXDnR8AYB0nQcvHH9zOhiO9jslDGqXyWUrvSuISU=;
 b=rvHlYHTrW1FnAe4ILKY5CqyiUuEDACE07i0yxL5zp3y2G3eo9TtJUNt1MH/Lwbyqs/QFi4cSQItkNH1dkOE7G8haI+9NhRchhOUgUOh2Kd+UOXAimCiKLJiLIJ5piDUM3y0prRzdNa8gXWv+gkVbSC/NQApBCt5hzHy/RUJB+vw=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <cc1a28b2-7589-a500-1d31-a07adf35eebc@xen.org>
Date: Thu, 18 Mar 2021 11:57:26 +0000
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE6861C9-DDFB-4E4A-8ADC-BA95100BE8F6@arm.com>
References: <20210308115610.48203-1-luca.fancellu@arm.com>
 <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
 <72E0C95C-D5E1-471B-9590-F4D42E3E066B@arm.com>
 <7ed12d12-6fed-cc3a-4a0b-76ad732d4337@xen.org>
 <C468C8BE-67D0-440D-B8CC-253337A52889@arm.com>
 <cc1a28b2-7589-a500-1d31-a07adf35eebc@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0200.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::7) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f381fcc-a3e2-4af6-3c0e-08d8ea0508e5
X-MS-TrafficTypeDiagnostic: VI1PR08MB5486:|DB7PR08MB3628:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB36287F91EDB6672B94E6E159E4699@DB7PR08MB3628.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1DjQhP2eJ1l4yOf94lIIBSxkXN+a8WVCnxyX82xrsSnX8wST4BPVDVgKJ1CHhiYqfmQm/HVUW1emLidyrpcoAyQTrASNK094SD7tOIL0U2ZY47O8DYHtncPTMNEv1S9V1GO6LLCRoIdGCIKBv9In8nSQQpmd0mjjQx8ryEXifvDnaK5SA1m8UU9KWDXj94uXW9JkLsw3yriVawA3J1m741ntQrxgtHEC17SEsJpahKozSO/zn2lfXOcUaLp0vsbj8ptJVoOkwHvHmbBJCvi+9kwWApV11EBhSSUOXoekqLmN49S/lL6nu23P61a9xul6lp6Rz14K7RFbXHJtwMyUPgRIu8o4y3p5Vt0YdSYL9IBNAlXC9lLG03EhsCMPsGJbj8wWyUi+UNEwRhEZWgFKm6stubFq15mWFnsjrBlDCeikv3EynbCppLv9GEoJq9RqxXuIkpPgKJf/VZsHkAPPOqKCCgGYxW6ruvGAiXiZeLKx6oRldb5PExQS042Q7lcpsH5YZJGGk3URPZhaNSnqlYLSNlpcTC5HpQlOyeBRIoQUuFpGjfTOWl/LSy1xT7Pg8veBJT1wAKcBFssim472K9baOY6xGt63F3/pdLzBJw9mVmXeVstvYTEpzCxDYapKV4tBhDa1GEum+/zeWrD4Qoc5mJ+eQqkGsK0SWq2/RE4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7696005)(956004)(66946007)(4326008)(478600001)(316002)(6666004)(5660300002)(44832011)(38100700001)(53546011)(66556008)(186003)(66476007)(2906002)(8936002)(86362001)(6916009)(33656002)(36756003)(6486002)(2616005)(8676002)(54906003)(16526019)(26005)(83380400001)(52116002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?ZVNzTGpwRHlNQ0pQNFBGSWJUNEdaTmlIdjAwaEo0SUJEOXRlWVRCdWVob3hG?=
 =?utf-8?B?cnZoREM2MkJ5L2M4ZVJtemhWbFB1TFV4ekpua2VMblRFSGY5TW4xVVpRSFFz?=
 =?utf-8?B?Z1JZa3B1TGFaWkFKblFLU05iVUNhMHEycEsvMElVOWVZdDV2WDI2OWN0SU0r?=
 =?utf-8?B?K2ZSb3d4ZlNkdzErTTl0S0hpdUlBM29SN25Lc1lPZ3FITCs4RWFSTmpKaGE4?=
 =?utf-8?B?SEFueDBTYnJDUlVsVDBWd2t2Zm5vck5URlREaW1MWVFHeEFwdmVuMnVOZjBl?=
 =?utf-8?B?Z3ViM21yVE5tVTR2S1pBMVQwS1hwNFpNOGQ0blJjdGE3K1dEc2pBNHRBR3NR?=
 =?utf-8?B?OWdYNHVvVTJFUGVoODBzWmpPTjZSOE0rdDU4YTVkdnJ6U0pkMkcwVWR6NEZV?=
 =?utf-8?B?OFN4TFNORWFJQU4rSXZLMTBDLzl4NkhwY1VEMnJaV2V1VGRzZVpnMUdseEdO?=
 =?utf-8?B?Um5QcytscEFzUDNFQWdsUURmT1NIdnFFNEVnUFBjajhpaU1NcEgrRXphVE1E?=
 =?utf-8?B?VEM4dHlFckw5OEI2aWFrbmdYUStOdUJ5VlFncXc3R0w2dHJxb1ZxNlg2NjVR?=
 =?utf-8?B?dFl2cC9wWG11VThiNUlqTzEvdm1lYVpLZlpGd3pzY2lod3g3aldDMFRoOE5N?=
 =?utf-8?B?R2FybS9vNGg0WHN4am5aSzk4UnZ5YUMvK3JITnFtNlRQaHd0V3d1QVBIN1I3?=
 =?utf-8?B?dk1keVBSWlk3MlJTWmtzV0RnMWVrcHhVcnJqL2pZdHE1c1ppekZvRzJTb05r?=
 =?utf-8?B?c3N0OVFpWU9nT1JPSzNjNGxTN0l2VU0rbVVhMWRVWk9FTTZsTW9OcWVhUFda?=
 =?utf-8?B?UStSK1IyYnlWNGZWYldxVUFWWGtsdVdkVkhKazRBcWxuMTd2amxSYkpRekht?=
 =?utf-8?B?SFZnV3VEczJGSVF2V1NkUTk4Z1o1czBUaUppTTIyUFErVTJaOWxzOGZYUkNs?=
 =?utf-8?B?ZEhXS0dtRXVCaWhUL1ZZVWpySW43dUVDMzV5ZVhZN1JqdS84RUtqa2UvdGt2?=
 =?utf-8?B?UUQrTFJKbnBYMWl2R1VBUUtVREhzTXluUld0YkxURU5MdUxQTXl1SW1aWWFR?=
 =?utf-8?B?OGYwYkVnTURFMjV4Zjc5ZWx5MjUrOFJlVS8yQTZ4SHVQV1RQNTlmUU9VU2ZP?=
 =?utf-8?B?RWFnRC9TY0lVMUxOaEFWbUFBNHhaV2dGanhtUTNvbFdTK0phbDlOdzlmMmVH?=
 =?utf-8?B?MHBhdFJCNEFST2hrWEZtTjFsY1hkMDZXNTQwZFNYQ2laZE43NkZ3NU1GUElP?=
 =?utf-8?B?Qk5pUG9JOElPVThTL1ZsU1c5WmlIZ0M3RE1XL2VUNDFpeDFlY1lLeWs0aFpO?=
 =?utf-8?B?Q0ZMNW5rSERqeWJUZThuQzFqRlk2Z3oyeElSeXNEZUNIaEZ4REo3enBYazRP?=
 =?utf-8?B?OTYwQWI2d3lNQ2lCUWRqaUVHSDM2SmVYenZwQ1B2a0NlYUd0NkF3TWd6UzBE?=
 =?utf-8?B?QnNuN3ZwQWdRM3NGc0x3a1ZSQ1pMb1A1Q1Fpd1EzRy82cTBCdlFkeW9TNEYw?=
 =?utf-8?B?N1hKSEVKNDNGa2g0dDZmamswWkVMWmpZczk2cEpBdWdxS1JqdTNSYy9xUEE0?=
 =?utf-8?B?SkFZTlhmazYxR0Ewdm1YM1lkOElhVzhUTjhKZHFVc0RWdFBXak1mR01tUS9h?=
 =?utf-8?B?QllvQUNLZEVXanhwQ09YOGtmTXlIYWY2MFU1N1A2Ym1SMWJNNzAvbFlHNjYr?=
 =?utf-8?B?UzhPSHJ1YWRWNDl5RW5GcG5CYklBcmNPVmgwZzRPQVVqaE9hdGI5SmhTUTlm?=
 =?utf-8?Q?90GjYLmx0Cz5hYySxvKYR+Z+G2lZB2C4IgHSWpN?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5486
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6089f9da-0abf-446c-8a7f-08d8ea050394
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ipw07+X9drCfVznDcmzCQdVAfEQ1OmvO0DWX2E0NGbP/M9kbQ41sDj3Wir9aBpf1W/QlMn0OWyrT/IGiqFr4Gm6QD31A04pxnyJwvZN3V+qfY2VACKQlrfW2+8brXtOrLev+IPJ4G/s6hSLP2rnZA0cStbjhrGWMxck6bPWe7E2WmW6Fpz6cSkIPkxfJissHkS5UPw9NDB5tI7kbudQ6JsJvOuSVrUOP6XsUFDlxekNToDO+6yle6ee6zDqKElfiynDttwHvwsyu6rhwEqkfw4L7oRMEBKyRNsljPhqbG+jfpXlSR+hZj1txXe9OGh5bBGo0Q0pSGPwIe7fg08SM+ub8/hmh1CAw8YWO3s7hnNOOHVsOOk+wVWQLRCyfK5fTcg8ji+5L7f9oyLP9prQVzY93J2CPN+ZQ8YuWmqmu6FztCkZ3qFBwCowodi5qzBoQDfQewn5JP5r7Y/j1Ro8RtlPtcilFkQIcnQmN8c/BCA+6EDQchb5vA7tDrHOQvdn1S9hNvQy3M2HT2a0Wz310l1fS2+FjmId86rZnJlcZrdTYXN+JqzW0R5zHqxQf32WQi/FGW/EJ6AkRmNqk/xCyCKOSiD1AP+uNDjGEbKegKpU/ZHhQY6vW+q+w//toUpl+EuofZF6N2sWZADFRYpLTZ67E1B5/1gxRM2WmtclBU9X5ENQXNAFDYTy/f6UmN7W7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(36840700001)(46966006)(5660300002)(4326008)(86362001)(2906002)(54906003)(6666004)(82310400003)(336012)(82740400003)(33656002)(53546011)(36860700001)(47076005)(6862004)(316002)(44832011)(36756003)(6486002)(26005)(356005)(70206006)(81166007)(2616005)(8676002)(8936002)(956004)(7696005)(16526019)(478600001)(186003)(70586007)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 11:57:41.7472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f381fcc-a3e2-4af6-3c0e-08d8ea0508e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3628

Hi Julien,

I will create a new serie with all the improvements we have discussed.

Thank you for your time.

Cheers,

Luca

> On 18 Mar 2021, at 11:13, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 17/03/2021 17:04, Luca Fancellu wrote:
>> Hi,
>=20
> Hi Luca,
>=20
>> I=E2=80=99ve checked the common code and the arm part, I can confirm tha=
t the domid 0 is never allocated even if the domain 0 is not present, here =
the only places where domain_create(=E2=80=A6) is called using a variable v=
alue:
>=20
> Thanks for checking it!
>=20
>=20
>> 1) xen/arch/arm/domain_build.c
>> d =3D domain_create(++max_init_domid, &d_cfg, false);
>> Where max_init_domid has value 0 and it is defined in setup.c
>=20
> We might want to add a comment on top of this code to explain why the '++=
a' rather than 'a++'.
>=20
>> 2) xen/common/domctl.c
>> d =3D domain_create(dom, &op->u.createdomain, false);
>> For me seems that the dom variable won=E2=80=99t take the 0 value, if so=
meone could give another feedback it would be great.
>> On every other part where domain_create(=E2=80=A6) is used, it is called=
 with a constant value different from 0.
>=20
> I agree with the analysis. However, I feel this is fragile because we rel=
y on the caller to never pass 0. But it looks like domain_create() doesn't =
check if the ID is already used. So it would already be possible to overwri=
te hardware_domain.
>=20
> Therefore, this can probably be deffered.
>=20
>> For the hardware_domain being NULL and not handled in some situation, it=
 seems that it=E2=80=99s not directly related to this patch, but I can hand=
le it on a next serie, from a quick look it seems that many cases can be ha=
ndled by checking if the domain is NULL in is_hardware_domain(=E2=80=A6).
>=20
> Before this series, it is not possible to have hardware_domain =3D=3D NUL=
L at runtime because dom0 is always created.
>=20
> Cheers,
>=20
> --=20
> Julien Grall


