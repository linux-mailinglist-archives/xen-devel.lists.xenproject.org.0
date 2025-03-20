Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0EBA6AA59
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922776.1326601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvICp-0002py-1Y; Thu, 20 Mar 2025 15:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922776.1326601; Thu, 20 Mar 2025 15:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvICo-0002my-UR; Thu, 20 Mar 2025 15:53:14 +0000
Received: by outflank-mailman (input) for mailman id 922776;
 Thu, 20 Mar 2025 15:53:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tvI87-0007Wt-7i
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:48:23 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c05342e4-05a2-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:48:22 +0100 (CET)
Received: from PA7P264CA0167.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::18)
 by DB9PR08MB6474.eurprd08.prod.outlook.com (2603:10a6:10:255::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 15:48:16 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:102:36f:cafe::a7) by PA7P264CA0167.outlook.office365.com
 (2603:10a6:102:36f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 15:48:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 15:48:15 +0000
Received: ("Tessian outbound 9f6e20ec4b41:v597");
 Thu, 20 Mar 2025 15:48:15 +0000
Received: from Lab94811f23ea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 255F2787-858A-4F59-BC3A-113ECF7B3C0C.1; 
 Thu, 20 Mar 2025 15:48:08 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lab94811f23ea.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 15:48:08 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB8981.eurprd08.prod.outlook.com (2603:10a6:102:33e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 15:48:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 15:48:06 +0000
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
X-Inumbo-ID: c05342e4-05a2-11f0-9ea0-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W1xu0+8gwIH6ppH5gku78tzOnV+e4lAdt8r+gaVN3o5lwaqekXtO4sAm0BYOgC1VSy66x0ybZO0cHVsQOhkUtwsa8rcA64FdHALucV7j7U9+5YDbXj1XYBGnQNgCE/Uuc/l2I+yOK7XkQ7jfzERa92HivoVPcf1Q+eDKForx7R1r4S323qTfXHz5U6sF8f+rUdDUEds7rp88t60MQ5u9dKceXS/SmkeoUZOlV7h+Lh0LwXEMTWDPxGK71oP/exB0SdKjQ1EsjPhdKlPf83Nb6wYswtR+kQdC/6QV6d7FUH/ynePUtcToGLqviX4K/S9Xzl6doYz1POHiB366LZat8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVh7QtclDMmlrZy04OFVeLNWt8Cq4DMhVNyZawDDfjk=;
 b=QdGEYyl5be96yHrXkBwG7BGhC25L2LhMQatBcZgcETFNm7zauPHSPPnJO3a0iZqzyjwB7QivVoayTsLe3rUdK9FsqwRUag2TIhg6ZGLlHM45mZ9g+z58XdpOlZkH4ERQt7jUA0Api+V3l3s1Y19ATG7WuRPGwL/bysUmiEfjuxzKpuu18RbIEJ2a/xVeIMxMeTP7Qvg/ubtUmuMhxbOdtbcERDYWPD/NXBVSS0ljteO90XaR+6QoGdfNjbKtc8uc3KA0P8EY5wHrRice57oBVnB3dy7noRGsKj11MEzg0KOgpdfntuw+aN36T769rQ895rnMzUS3xbqTv3Ussd72WA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVh7QtclDMmlrZy04OFVeLNWt8Cq4DMhVNyZawDDfjk=;
 b=sAZ8e1FKcmh7yabkZ2yC7IeDRgsVo65Oy3fzmt2i3fhHlqe2JFV1T/TwcTFiSHgwPt7PPqFEdttl0vHmGSXgO5DrejUUfJsyLOuRBB3ltTaA5Jms4ZrBJLnJjx1bfXPkSBBydQnbFOtyyNfTotAzA9NbKHc1GU10g4ejI4Z9YbE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a8288f1712f9504
X-TessianGatewayMetadata: EuNHqn7dy93RBcgyY8gKSo/ll39wEA/bKUsqBet6TAAsb67Aku2cRrMmZ2cyhvczwc69rwoeg6Gh8WpATg6WP7q83RULd5z3vXg0BY2u2lR7NI1Ez76/uar9SNsVYejtbW/OxMaZ5Qv6jw5mPEzZkYc5IAs2NbC3m4fMNCAvulI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awfj+6pVxrG4U4XWBUUDs0WY2jgperc1ddlCLFoGDMIozKd5XEwe6drxi2bgHB6KUaERWZXHvs/v/e5rhekgEUU8rPqSZ+P67WZFN+HBTrJGihG4nLY8gRFz0Osg0civLTkJGPLWtUi+p7t4MUgmbrj2D8lsI0cB6KeXcGyu5b310wP4n0N2WaLSHL2MRjK2kk1Wq2ZtdFgJwXiKo7PXca0EidBw835fSLi8vfc1Mxy2buzLIFThy5a1uSlBh31bMjI9ftv9y9ys+U0bWDOYLMBGUr4wT3wfb9MJp4Kmw/rNM1EcyjJewH0QpxCfgGOtbNiqkUQnn2LGz8uoztvnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVh7QtclDMmlrZy04OFVeLNWt8Cq4DMhVNyZawDDfjk=;
 b=JPNrJTC4+yEQBiNGGCS+IbfmC2HETUqqlycWZnnRgUOT01/aVCa9FlFrckLEEggggSlsSeXHxDNpCyQdsp66RKZIpgT20rI5iigmHrNUoWDtYSjPCzlc28kV/r5jxyDkOpI2DA7CUZ/M5MSrKKcpMD8CBhynH+mT8WsK6FSixEGhOjvwtRKRGHK0Ku60FUzO9OoQLdu/RUAlbeuectqIBgWEWZIrzVzob+cYhBPsFPIQENYIy4JbTM/EjiPsR8nDVjsCM/U60MNSrzje4oyNTFD0SwAvVCdTBIjZnt5pR3NB8rX0BTTIN70jbmCZicYIUdAh5F6o1ZOGtb8uWsQxIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVh7QtclDMmlrZy04OFVeLNWt8Cq4DMhVNyZawDDfjk=;
 b=sAZ8e1FKcmh7yabkZ2yC7IeDRgsVo65Oy3fzmt2i3fhHlqe2JFV1T/TwcTFiSHgwPt7PPqFEdttl0vHmGSXgO5DrejUUfJsyLOuRBB3ltTaA5Jms4ZrBJLnJjx1bfXPkSBBydQnbFOtyyNfTotAzA9NbKHc1GU10g4ejI4Z9YbE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v2 3/5] xen/arm: ffa: Add buffer full notification support
Thread-Topic: [PATCH v2 3/5] xen/arm: ffa: Add buffer full notification
 support
Thread-Index: AQHbkcvmIfvaAChpR0q1sfiN2EYKc7N8K3MAgAAP2gA=
Date: Thu, 20 Mar 2025 15:48:06 +0000
Message-ID: <02A52278-F760-4BF5-841A-DF5B80DC9EC7@arm.com>
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <5bbdc8bc0377014a0c683f8f9e154267e4b27c1f.1741617888.git.bertrand.marquis@arm.com>
 <CAHUa44Fd=Q1YKBhjiTwhM+aVT7BX59234XW9HonogqW2er0+Cw@mail.gmail.com>
In-Reply-To:
 <CAHUa44Fd=Q1YKBhjiTwhM+aVT7BX59234XW9HonogqW2er0+Cw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB8981:EE_|AMS0EPF000001A9:EE_|DB9PR08MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3ed6d4-6cb2-4f55-83d6-08dd67c6a102
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z2pieDhtY21OOVRZQkZKcnhOcUNWeGZkbXFLMnpJREsraG8rS0dwY1FQaWR4?=
 =?utf-8?B?bE8yR3A4VURsVVlOTDBUK0FiL0Y1Y1RHcm10dTd1czlKbVlPSFB0Tjc0dVlh?=
 =?utf-8?B?eDhnN3RoQ251VXRxaXBrMU9qTWZMK0hTSFZsNThHS2wzVlV4eE5ON3ljcTBt?=
 =?utf-8?B?dUxYUU9WMWRrUGRUd0dNSDJMTHN6QmM0Sm9JZWxFaThSdWRNV1NLUytjWk92?=
 =?utf-8?B?bzlaL0xNRzltWkFEenZ0RkQzaGFpRm9MTVlpcWlkQmJHUmJBeWVxdkp4QkdW?=
 =?utf-8?B?a045cnEwOWNTRFpNblpPZmFUM2FRZzF0Y2ErNkFZVjQyVk1uSFZEVFEvRjcz?=
 =?utf-8?B?NnYxbGNaQlExVHI5aG9vK01ocE5aRUpvVFhJUHh5MldvR3VuVGY5RjBvcjFn?=
 =?utf-8?B?dmNscDd0R1VqZWZNR09RRVE1VTdpc0RqenJlbUlRVXNjVENoWWJ3V1hTTlZT?=
 =?utf-8?B?Q3pkQ2NMYTJMemNMdHE0S3A0eWJjL3d0MlpEV0pKRm43NjNvRUV3ZFFhS3dC?=
 =?utf-8?B?cnNwNjhJcjRDYUZQOWh3b2xZZU56UGJHVmYzcDNyalhpanFoVEZCZWlNNnpn?=
 =?utf-8?B?RW02dEloT1hscVJRZTF4bXdZTTBxVEE2bC80WW5MNFBlU0kvdUE0c0s5Mitk?=
 =?utf-8?B?NlVwREtqUHhlTERSZC9vcDZ0cm8yWGtCd21qY2hoZkRhUGZnUjU2azNZL0Er?=
 =?utf-8?B?VlpFdU5RUnlYRzBSQ2NMUm9YZEhoQnJOaXc0ZTNKZGp1UFBrYWRTbVFnTmQy?=
 =?utf-8?B?VDZhZGpUeDcrUzgvS3FLS0p0eTRYYzZNSHV6U3A2Mk10Z2FOaHFoYmRFaEhN?=
 =?utf-8?B?eVc0dlRIWloreDlMbkhXaWVUa1F1YUpKK3pxNGloNmd5SzRjRTRsdEp2NmRi?=
 =?utf-8?B?b3AzbzlSZCtIRjJDRGVsRkkrcm9lelNCMzBzd0x0ZmVOc3UyVERaVlFydGRF?=
 =?utf-8?B?RXhFTWxmTmgxZEZ6QitERDQ3WXhuYkg2RFVhQnlFdTZ5T0t1U21hai9yVUpi?=
 =?utf-8?B?VWpOR3QwV2wrYjYyWU14T1ovYW1xaTRwUEJPbk5nMWxrR3h4YTllVWQ1Qk5Q?=
 =?utf-8?B?aktZV09TVWgxaVU1MjJ5dVh6Q2QzbVlqdnZhdCs4dVA1SlJpcmtuZ3dlQ3l2?=
 =?utf-8?B?TXE1VU9ESzJVbmVDK3hUYlNJeGxIN2UxazFDTGpOZG0yU3JMLzlTVHZ6Q1Rj?=
 =?utf-8?B?RDZTdGRQVThTNGt2NkNGSHpPWEJhOXNiREx4Yy8zZUZoUUVZaitTWkZJL2VZ?=
 =?utf-8?B?QUQzNjNvUTliRE5aNVRqMmp6cTlIVzFEcjBuZk5pTlE1WkJCWVRaQ0lDL1ll?=
 =?utf-8?B?QUdveHM1bjBRbXNTd3Zndkg1T3NlRjJKTE5qUWE4WVVFRDlOTy9DOXF1am9t?=
 =?utf-8?B?dG1zM1RIWDloeHJaTEphdHpka2d4eDc3NjRiTDlPQjVpSlFjaklXSkErVjhr?=
 =?utf-8?B?L0lZUy9CbWRLdzVKbXNTT3FHNklZWStUL2NMcUtEUnovdGJYS2VIQy9KaGJP?=
 =?utf-8?B?OE8wdll5eGFBbld1RFdsVXJEZWttNnovQVhNaklOZWVNOGdRa2xiUnBQZENo?=
 =?utf-8?B?Y081R2FyUk5wV01Da1hNWHJYeUVoTVBLQXVmZnZHSlZtRHRjd3MvWFdHV1dT?=
 =?utf-8?B?anhRbldiYllhRkRvc25NMVFkVjNtbjRyTkJwMWx5NjVNRGgzbjFuMGtjbC9V?=
 =?utf-8?B?OXltRVRqN2tqK1J1VWs3SzErQjBpYzlvT01aQXN0Tkd1MzF4ODdRQWRaaFZs?=
 =?utf-8?B?OGQyUGpVbFVZc3pTa05EOFhHcEFTMFhab3czWitGMHVzZDlIamc1NmRvaHcx?=
 =?utf-8?B?YzJmS0k4SUtoWTNGS3lFZzNqcUpKZTAvNTN1QTJZQzdhYVRESklZazlQaisy?=
 =?utf-8?B?QnkyRzBhSjQvUWRQUWNGcXZMWGMvYXZ2UkpaYlBhczFvdXdjR05NRFZyMkJt?=
 =?utf-8?Q?OsCB8AWNigJKhtfCik6qiB6b0c3D4Pqo?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <91948CCF0667164E8DBE09D8B9413800@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b69751b3-6a82-4aa3-e96e-08dd67c69b7e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTcyZm9PZlUzUUNUWFM4SE9RbXdzeUhtUnZFbU5EY1FEd2RvUzNIQlZ4eGNQ?=
 =?utf-8?B?SnFJdU5LZXBZWEJ2WGgwVUR5SjRNR0dvb0VMeUlhcnR5ZlF5dWQwMEZHVVFR?=
 =?utf-8?B?aVZaTVJtOStWcm94ejNYWUVmOUk4eXVpL1JzYmJJK05ZbjBOTVo2c2xSMU4z?=
 =?utf-8?B?K3dac0RIK3dsU2NDWVFDbysrdTJUb3JqQkFPcU11aHUrNTZCMWNQZXZlRmQr?=
 =?utf-8?B?RmhOY0gyVk5NZFJRNWNMNWJKdzd6Wkl0TXJMaUswVTlhNFl4WEVjd2w4UFRH?=
 =?utf-8?B?RjRnbkEyTDZNWUVxUzc3NmgzbDhZWkpmNGhGL005eEozaUhmRmh3cmxJTFQv?=
 =?utf-8?B?ZnpZaEN2S2krdGovSXVBRk5uSEdHM3JyU1dSM2t6aWlienRvWEJxUFBYN21I?=
 =?utf-8?B?YksvallwNy92eUhJOXAwRnZybEozQ3RyNUxoMEtmSCtnMjRhR3lKVWRPRVZv?=
 =?utf-8?B?VnlpZlRWVWdHam02UER6dGNRT0phcDJZUUVSdHQ2RHY3dm5SM0dla2cxZjNr?=
 =?utf-8?B?VHdpdFh0VHNTSVZmOVNGZVRvcXlsRDh6UVBwb2tvdEVrbFRyeEdEeGNLamZt?=
 =?utf-8?B?QjU1Qi9wMzJheDVSMThLQTljbjV5cThLSklXWE5oYlJBbEVjWGk5eHkrZS92?=
 =?utf-8?B?TTlNeW5mWEVpZGw3MmVtMHlGS2xqQldjU1BSUDRIMU0zMlRMODVEN3VPYllt?=
 =?utf-8?B?UkdIenNRc2sxZEFaYXh3Sjd6R2VVUFFiZ3hxVS8zZjdNRDV0Yy9WVng4b3lL?=
 =?utf-8?B?MTF0bW1NaitnL3NlTmQ2ZnIzWDRiOGU3YkNTQmE3YWN1THBIdXlXTWNkTitP?=
 =?utf-8?B?a2xzTDNxdktWVG1MZWRJKzY5ZmtCU21oS0tFTGJyTkRSQkkrN3poZnZZdWtY?=
 =?utf-8?B?VmZqNVlPck9kYTEvSnhzZDdoc0F2N0xNdUxCVUFQeWZxMkd3WXFLekwyUUJy?=
 =?utf-8?B?WnI1eDN6bytnS3ExYlU5Q2VIR1pyTWZSK0p1WCtuN2VqYmF4N2I4MS9UTXYx?=
 =?utf-8?B?OWhXR1RjamJ0dFJMUGRMZmF5Zk5Wd0JOYWkweml1OTVCR3FjMG5wQ2hxSkhC?=
 =?utf-8?B?cjFiY1o0RTFCNUVTWVUrM2dHQmZ2RWprUXFNTVhLL3lqVkVYenR6OWVLUkRl?=
 =?utf-8?B?RHFNOW8rUzgyOTIxOTVidGlyKzMwbW01UUY5dmpMRUYxUEtBbVVTMzY1WGFX?=
 =?utf-8?B?TUVKcVN0NXRYeDRDQnBiS3puWTV3aEpDOUxGVFFIQ2s4REJKdDNjVHpFWUx2?=
 =?utf-8?B?NlBQYUIrRERlc1c4b3RJN0hvQWtqWExuamZuUUFycmpsQnowUlgvOUhYRlYr?=
 =?utf-8?B?K29hblJDT2s0eGZQMWxLczZrdEdNaUxUVWFNblFzcys1TTdqei92NHVMNCtk?=
 =?utf-8?B?V2JLTnlqYUVXbjVZTnR1QS90MHhSSWFrS045WndEMUV0TE8yVVhicHZCOTJJ?=
 =?utf-8?B?eGxNZ2NlWjdTeFVISjlCcXdxbEdSdkswd2NBNEY2dUNZamZpeVRic3IzMXQ3?=
 =?utf-8?B?OGNuSkZ1Lzk2dXRJb3RUZXFBeFpEanhyU0pQcWJ0L3BYQXk0aC9pd3Z5NkQw?=
 =?utf-8?B?QUVhdEdGYldSUmtScGdQZGE0b2VNRHRPNm16bTFURmw4MWdOZTRpUmtaL1Q2?=
 =?utf-8?B?eGVvQjk4amZyV0VoNUhzZkRKUk5nbGlTVm96bWV3QmVkcitBWTl4am5DS3dt?=
 =?utf-8?B?UDBxS01Wbjh6NmF6WlF0cUlIWWVvY3pSRGg4alRVb1c0T0ZhZDVsbXBROVph?=
 =?utf-8?B?Z3BGdkZ4SlpxTzVtOU5KcTNmZnRaTk9nb3htQkREdFJjSlJVUjVwREZVVnh1?=
 =?utf-8?B?MjF0YXZNQnN3UWV2RHJiM1dIaUZGb0NuZGR1L3FiOUNRQkFvdnZZaHRvWDRs?=
 =?utf-8?B?S3NIZDlRTThHOHphN0IxZUN4cnNJYkhtTUlROGFIUnFyZnQrT1dwaEZNakY2?=
 =?utf-8?B?b3pUTmRKRzRqaVY3bVBsakdOL3dyTHZDejVLS2hzdXBVSjZ1dG9jdHoxNDFo?=
 =?utf-8?Q?8OAAZIWegW89yu0Y9eMk/LsL+5fJfo=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 15:48:15.8179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3ed6d4-6cb2-4f55-83d6-08dd67c6a102
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6474

SGkgSmVucywNCg0KPiBPbiAyMCBNYXIgMjAyNSwgYXQgMTU6NTEsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMzo1MeKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEFkZCBzdXBwb3J0IHRv
IHJhaXNlIGEgUnggYnVmZmVyIGZ1bGwgbm90aWZpY2F0aW9uIHRvIGEgVk0uDQo+PiBUaGlzIGZ1
bmN0aW9uIHdpbGwgYmUgdXNlZCBmb3IgaW5kaXJlY3QgbWVzc2FnZSBzdXBwb3J0IGJldHdlZW4g
Vk0gYW5kDQo+PiBpcyBvbmx5IGFjdGl2YXRlZCBpZiBDT05GSUdfRkZBX1ZNX1RPX1ZNIGlzIHNl
bGVjdGVkLg0KPj4gDQo+PiBFdmVuIGlmIHRoZXJlIGFyZSAzMiBmcmFtZXdvcmsgbm90aWZpY2F0
aW9ucyBwb3NzaWJsZSwgcmlnaHQgbm93IG9ubHkNCj4+IG9uZSBpcyBkZWZpbmVkIHNvIHRoZSBp
bXBsZW1lbnRhdGlvbiBpcyBzaW1wbGlmaWVkIHRvIG9ubHkgaGFuZGxlIHRoZQ0KPj4gYnVmZmVy
IGZ1bGwgbm90aWZpY2F0aW9uIHVzaW5nIGEgYm9vbGVhbi4gSWYgb3RoZXIgZnJhbWV3b3JrDQo+
PiBub3RpZmljYXRpb25zIGhhdmUgdG8gYmUgc3VwcG9ydGVkIG9uZSBkYXksIHRoZSBkZXNpZ24g
d2lsbCBoYXZlIHRvIGJlDQo+PiBtb2RpZmllZCB0byBoYW5kbGUgaXQgcHJvcGVybHkuDQo+PiAN
Cj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJt
LmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gQ29kZSBzdHlsZSBmaXgNCj4+
IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYyAgIHwgMjYgKysrKysrKysrKysr
KysrKysrKysrLS0tLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaCB8IDEzICsr
KysrKysrKysrKysNCj4+IDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlm
LmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+PiBpbmRleCAwMGVmYWY4ZjczNTMu
LmQxOWFhNWM1YmVmNiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlm
LmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+IEBAIC05Myw2ICs5
Myw3IEBAIHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25faW5mb19nZXQoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpDQo+PiB2b2lkIGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX2dldChzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+IHsNCj4+ICAgICBzdHJ1Y3QgZG9tYWluICpkID0g
Y3VycmVudC0+ZG9tYWluOw0KPj4gKyAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50
ZWU7DQo+PiAgICAgdWludDMyX3QgcmVjdiA9IGdldF91c2VyX3JlZyhyZWdzLCAxKTsNCj4+ICAg
ICB1aW50MzJfdCBmbGFncyA9IGdldF91c2VyX3JlZyhyZWdzLCAyKTsNCj4+ICAgICB1aW50MzJf
dCB3MiA9IDA7DQo+PiBAQCAtMTMyLDExICsxMzMsNyBAQCB2b2lkIGZmYV9oYW5kbGVfbm90aWZp
Y2F0aW9uX2dldChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICAgICAgICovDQo+
PiAgICAgICAgIGlmICggKCBmbGFncyAgJiBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1AgKSAmJg0K
Pj4gICAgICAgICAgICAgICggZmxhZ3MgJiBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1BNICkgKQ0K
Pj4gLSAgICAgICAgew0KPj4gLSAgICAgICAgICAgICAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0g
ZC0+YXJjaC50ZWU7DQo+PiAtDQo+PiAtICAgICAgICAgICAgICAgIEFDQ0VTU19PTkNFKGN0eC0+
bm90aWYuc2VjdXJlX3BlbmRpbmcpID0gZmFsc2U7DQo+PiAtICAgICAgICB9DQo+PiArICAgICAg
ICAgICAgQUNDRVNTX09OQ0UoY3R4LT5ub3RpZi5zZWN1cmVfcGVuZGluZykgPSBmYWxzZTsNCj4+
IA0KPj4gICAgICAgICBhcm1fc21jY2NfMV8yX3NtYygmYXJnLCAmcmVzcCk7DQo+PiAgICAgICAg
IGUgPSBmZmFfZ2V0X3JldF9jb2RlKCZyZXNwKTsNCj4+IEBAIC0xNTYsNiArMTUzLDEyIEBAIHZv
aWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
KQ0KPj4gICAgICAgICAgICAgdzYgPSByZXNwLmE2Ow0KPj4gICAgIH0NCj4+IA0KPj4gKyNpZmRl
ZiBDT05GSUdfRkZBX1ZNX1RPX1ZNDQo+PiArICAgIGlmICggZmxhZ3MgJiBGRkFfTk9USUZfRkxB
R19CSVRNQVBfSFlQICYmDQo+PiArICAgICAgICAgIHRlc3RfYW5kX2NsZWFyX2Jvb2woY3R4LT5u
b3RpZi5idWZmX2Z1bGxfcGVuZGluZykgKQ0KPj4gKyAgICAgICAgdzcgPSBGRkFfTk9USUZfUlhf
QlVGRkVSX0ZVTEw7DQo+PiArI2VuZGlmDQo+PiArDQo+PiAgICAgZmZhX3NldF9yZWdzKHJlZ3Ms
IEZGQV9TVUNDRVNTXzMyLCAwLCB3MiwgdzMsIHc0LCB3NSwgdzYsIHc3KTsNCj4+IH0NCj4+IA0K
Pj4gQEAgLTE3OCw2ICsxODEsMTkgQEAgaW50IGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX3NldChz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJpdG1hcF9oaSk7DQo+PiB9DQo+PiANCj4+ICsjaWZkZWYgQ09ORklHX0ZGQV9WTV9UT19WTQ0K
Pj4gK3ZvaWQgZmZhX3JhaXNlX3J4X2J1ZmZlcl9mdWxsKHN0cnVjdCBkb21haW4gKmQpDQo+PiAr
ew0KPj4gKyAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+PiArDQo+PiAr
ICAgIGlmICggIWN0eCApDQo+PiArICAgICAgICByZXR1cm47DQo+PiArDQo+PiArICAgIGlmICgg
IXRlc3RfYW5kX3NldF9ib29sKGN0eC0+bm90aWYuYnVmZl9mdWxsX3BlbmRpbmcpICkNCj4+ICsg
ICAgICAgIHZnaWNfaW5qZWN0X2lycShkLCBkLT52Y3B1WzBdLCBub3RpZl9zcmlfaXJxLCB0cnVl
KTsNCj4+ICt9DQo+PiArI2VuZGlmDQo+PiArDQo+PiAvKg0KPj4gICogRXh0cmFjdCBhIDE2LWJp
dCBJRCAoaW5kZXggbikgZnJvbSB0aGUgc3VjY2Vzc2Z1bCByZXR1cm4gdmFsdWUgZnJvbQ0KPj4g
ICogRkZBX05PVElGSUNBVElPTl9JTkZPX0dFVF82NCBvciBGRkFfTk9USUZJQ0FUSU9OX0lORk9f
R0VUXzMyLiBJRHMgYXJlDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJp
dmF0ZS5oIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBpbmRleCBiZDY4Nzdk
OGM2MzIuLjFmNTA2N2Q1ZDBjOSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZh
X3ByaXZhdGUuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBA
QCAtMjEwLDYgKzIxMCw4IEBADQo+PiAjZGVmaW5lIEZGQV9OT1RJRl9JTkZPX0dFVF9JRF9DT1VO
VF9TSElGVCAgIDcNCj4+ICNkZWZpbmUgRkZBX05PVElGX0lORk9fR0VUX0lEX0NPVU5UX01BU0sg
ICAgMHgxRg0KPj4gDQo+PiArI2RlZmluZSBGRkFfTk9USUZfUlhfQlVGRkVSX0ZVTEwgICAgICAg
IEJJVCgwLCBVKQ0KPj4gKw0KPj4gLyogRmVhdHVyZSBJRHMgdXNlZCB3aXRoIEZGQV9GRUFUVVJF
UyAqLw0KPj4gI2RlZmluZSBGRkFfRkVBVFVSRV9OT1RJRl9QRU5EX0lOVFIgICAgIDB4MVUNCj4+
ICNkZWZpbmUgRkZBX0ZFQVRVUkVfU0NIRURVTEVfUkVDVl9JTlRSICAweDJVDQo+PiBAQCAtMjk4
LDYgKzMwMCwxMyBAQCBzdHJ1Y3QgZmZhX2N0eF9ub3RpZiB7DQo+PiAgICAgICogcGVuZGluZyBn
bG9iYWwgbm90aWZpY2F0aW9ucy4NCj4+ICAgICAgKi8NCj4+ICAgICBib29sIHNlY3VyZV9wZW5k
aW5nOw0KPj4gKw0KPj4gKyNpZmRlZiBDT05GSUdfRkZBX1ZNX1RPX1ZNDQo+PiArICAgIC8qDQo+
PiArICAgICAqIFBlbmRpbmcgSHlwZXJ2aXNvciBmcmFtZXdvcmsgbm90aWZpY2F0aW9ucw0KPj4g
KyAgICAgKi8NCj4+ICsgICAgYm9vbCBidWZmX2Z1bGxfcGVuZGluZzsNCj4+ICsjZW5kaWYNCj4g
DQo+IEl0IGRvZXNuJ3QgbWF0dGVyIGlmIHRoZXJlIGFyZSBvbmUgb3IgdHdvIGJvb2xzIGluIHRo
aXMgc3RydWN0Lg0KPiBIb3dldmVyLCB0aGUgaWZkZWYgcHJldmVudHMgdXNpbmcgSVNfRU5BQkxF
RChDT05GSUdfRkZBX1ZNX1RPX1ZNKQ0KPiBpbnN0ZWFkIG9mIGFuIGlmZGVmIGluIHRoZSBsb2dp
YyBjb250cm9sbGluZyBhY2Nlc3MgdG8gdGhpcyBmaWVsZC4NCg0KQWdyZWUsIEkgd2lsbCBtYWtl
IHRoaXMgZmllbGQgcHJlc2VudCBhbGwgdGhlIHRpbWUgYW5kIHN3aXRjaCB0byBJU19FTkFCTEVE
IHdoZW4NCm5vdyBwb3NzaWJsZS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMs
DQo+IEplbnMNCj4gDQo+PiB9Ow0KPj4gDQo+PiBzdHJ1Y3QgZmZhX2N0eCB7DQo+PiBAQCAtMzY5
LDYgKzM3OCwxMCBAQCB2b2lkIGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX2luZm9fZ2V0KHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzKTsNCj4+IHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25f
Z2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTsNCj4+IGludCBmZmFfaGFuZGxlX25vdGlm
aWNhdGlvbl9zZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpOw0KPj4gDQo+PiArI2lmZGVm
IENPTkZJR19GRkFfVk1fVE9fVk0NCj4+ICt2b2lkIGZmYV9yYWlzZV9yeF9idWZmZXJfZnVsbChz
dHJ1Y3QgZG9tYWluICpkKTsNCj4+ICsjZW5kaWYNCj4+ICsNCj4+IHZvaWQgZmZhX2hhbmRsZV9t
c2dfc2VuZF9kaXJlY3RfcmVxKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1aW50MzJfdCBm
aWQpOw0KPj4gaW50MzJfdCBmZmFfaGFuZGxlX21zZ19zZW5kMihzdHJ1Y3QgY3B1X3VzZXJfcmVn
cyAqcmVncyk7DQo+PiANCj4+IC0tDQo+PiAyLjQ3LjENCg0KDQo=

