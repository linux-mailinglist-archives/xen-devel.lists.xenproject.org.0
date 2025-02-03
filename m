Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70059A25736
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 11:46:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880523.1290598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tetxL-0000Jc-F5; Mon, 03 Feb 2025 10:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880523.1290598; Mon, 03 Feb 2025 10:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tetxL-0000G8-BR; Mon, 03 Feb 2025 10:45:31 +0000
Received: by outflank-mailman (input) for mailman id 880523;
 Mon, 03 Feb 2025 10:45:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWJJ=U2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tetxJ-0000G2-Ts
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 10:45:30 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa77de61-e21b-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 11:45:26 +0100 (CET)
Received: from DUZPR01CA0101.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::22) by AS8PR08MB8088.eurprd08.prod.outlook.com
 (2603:10a6:20b:54d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 10:45:20 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::9e) by DUZPR01CA0101.outlook.office365.com
 (2603:10a6:10:4bb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 10:45:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 10:45:19 +0000
Received: ("Tessian outbound 4d4d74fe3cc9:v560");
 Mon, 03 Feb 2025 10:45:19 +0000
Received: from Lca349e499c41.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FADAA446-7832-4D4A-83F9-3AC4419D6B0B.1; 
 Mon, 03 Feb 2025 10:42:08 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lca349e499c41.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Feb 2025 10:42:08 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB8160.eurprd08.prod.outlook.com (2603:10a6:20b:561::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 10:42:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 10:42:05 +0000
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
X-Inumbo-ID: fa77de61-e21b-11ef-99a4-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YvHlEF5gAPrnwpGhw73JmSmkpvf5I2x+VD9HWeHZ/uEbZz0+v1rkdOdk60OkyJ1FTBTV1f0+D2T7zpZhCoiZxh1DSa9kXzs/h1CWLKuVocOuXzvq3atdPHCPlwGGIvAyTo/El1hvjgX36zZR0WPg2yy9bk1sqdxlgYzt/3Djmnb/MiZ9AcHA2R+rHWxrr5S+Ny1qKmAtOz7lD2IfYYXRQOT9GN1tSa9DlO1mD8ztSVL8OyAkzUrXdI4WeyEhdttqRwzJHOShnq/ZT3C5UD7+wGGfYLON1jpPJicekO/S4xiGG8S6HiaZKuXeV1zBqvm/8F6wQFP0rAvjjc7114Geag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPK00qTM4XZC8QYyqmoY04nPBIJVW12pPbP7HtxHtP8=;
 b=DjRPfuKSD0Xbxmfr4Y0u32XPavTMAEqsG6vffu7YRzVO+4Elo5OAckuO+1VgApqOjqrrnPSo5CGt9derASkmrbEbmu+0DgcTH0jF4ORCo3ZSp2W0XCrT6ZyC+uTpWd8tMAvrnO+2XdnAgl98nIXpyTQQ6YOo0C8kWM+4lgYuTnMwOhYQVW4qr9nPUynitvax6/QpilRiFSjkIGtxnGO5h3160ISqNbEYa2o+7PmE91CQM1MyzBrccldbVynWm4mSd2+oO4ZCR3psLnaEieI3901+Zvor2xWYb8yhYyBZjxdsJplq2FgYKPs20eJozEUEFRhw4OHu/2WPtrbqe1IdLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPK00qTM4XZC8QYyqmoY04nPBIJVW12pPbP7HtxHtP8=;
 b=iW0AoDXHZxSEdj9w2VwU9c0SDFcQOgQG52WHcfOThDIj3mO91QampjbU2ajNSmm6snmitpmdKbf6rlsPw57aK3T7dpV1VfSWnTd9ikidScTH4EmNULM0lT9Bpk1+N4FF8pZq0VuFOH/ViKG9mjhHHPLxYJAStUSeNreVbqpuytY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d150d3483c989971
X-TessianGatewayMetadata: dZwLcl+HSp6WEjYlXI2WlCc6RA+tSxl5ClHvKtktWW6xWBXZyvnOwuX2296pVZJbB0ApYqtXWBSltCAQllOJpXuSlwFxYOQqFZQ8N6x6JCClWTwrJADzY3QXqfy7qfYwMO3zkp15M7Sg/f8J42Lg6MkEPTJQvYvXhB32lJuz4kI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIt9KMz46qfDqTo4Gx5Cjr9Qq/dXYV5PRbc0mNJF7ceIWfBmSSPGeO8XcHKoQfIMhpbbWehoxCpxO0GG+y+M0skRoXYWjPttpplQqQCBesp4wb1hn9s4+PKQjAC6yRnQOWiMwzrIFIS6hBAsaS9Jrx7BJo0s3Y1/QJMFNP2YtdbFbyOfJFDqlrSn+MrFTX6xw3YpSqkaaskPHe6iMaMrGWlXv6RRAWC+PXMaeDQch5gNq8LlA6Yhj/91ODC+Yqix3V1yutFw/SM5u6RFfwc1KjO9PkLe0OMNqON0G6Gkt606kjv73NXHQA7xTLwX0LT2SqNMxxQ4lrSedomdUgYbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPK00qTM4XZC8QYyqmoY04nPBIJVW12pPbP7HtxHtP8=;
 b=Y6N3uzb4T0jqkYx4en6dY5s8kOIgNTYOE3BctkCUX3RGPN3ap9lEXeS9dxEyr0TOR/FIAUtgsYQlo0Ka6ZCctodyMLuXl2XmXVIWjAPopZM4shyscihKM3URctRPJsy8uJmQoQSflEy1NxYDF42y/Nl/VrYdFUpaT2gWfR8n+o7pTlIVGVXTg1V2bjyS5fuFstLxEjq9/0FOxNIpb96KRtIPJ9ppaP6boZ/Wbr1bASetxlxSvKSh5T5SSyeegiNudrrCzal8ZvpF4qUJdPuGP9Z5/+0Vi8iKh0XpSGSiSzMJ0oQegI60CBDUI4s2Vq2QFXrLTJQevLxvOdnyVVWdAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPK00qTM4XZC8QYyqmoY04nPBIJVW12pPbP7HtxHtP8=;
 b=iW0AoDXHZxSEdj9w2VwU9c0SDFcQOgQG52WHcfOThDIj3mO91QampjbU2ajNSmm6snmitpmdKbf6rlsPw57aK3T7dpV1VfSWnTd9ikidScTH4EmNULM0lT9Bpk1+N4FF8pZq0VuFOH/ViKG9mjhHHPLxYJAStUSeNreVbqpuytY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH] xen/arm: ffa: fix bind/unbind notification
Thread-Topic: [XEN PATCH] xen/arm: ffa: fix bind/unbind notification
Thread-Index: AQHbdiVuvpwzLBgvuEa9DOMuEIYWPLM1ZDAA
Date: Mon, 3 Feb 2025 10:42:05 +0000
Message-ID: <6510AE6D-AA1A-4AF7-93D1-0C2627F1893E@arm.com>
References: <20250203102123.3002912-1-jens.wiklander@linaro.org>
In-Reply-To: <20250203102123.3002912-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB8160:EE_|DU2PEPF00028CFD:EE_|AS8PR08MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d44bafd-7951-48d8-619e-08dd443fda70
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?T38xgwBZPVoGQn3aSL3zI3W27jhOt87QPMOu8i5q8/5YIBCVfRqJPoY65ThO?=
 =?us-ascii?Q?4Tgm3cW4D3DtMOrFrsgTyu8WDtrZO21hwnVrqTTmDb9FdqSVO8PysNf1szXT?=
 =?us-ascii?Q?ZHyPKh07fqc93n+w9iMtOAH9DSBZL8DHIzTKw5OYZcWKwrIM9Fo/e2IGUBJz?=
 =?us-ascii?Q?x8ZSSJS4IezNKwzc6K5+5C240n+o2FCiO88t47e8o+aHcxChVeZ2ZzPXTnCo?=
 =?us-ascii?Q?7GXN0gu494isQjywpo/FAV/HqGuk6kFNu0m/CzIdlCY47ub5IhNNFi1P5RTn?=
 =?us-ascii?Q?Q1q8qW/u2dsRCqo7zV2erO0oXP4h3TZoo9KIo8V1Y0hKt4r4gxmYgj6kXVpQ?=
 =?us-ascii?Q?XhyDf4iLE4appmorImU0GjNFmbNpjdrF2xEvNIldwtvebPEbTve2aMFl1+Lo?=
 =?us-ascii?Q?nIufTFG8oLkjFEZ1h+1tOwN/D2riOJH3VwvJn1Qu382Lbz8tM4zOClx2WlHo?=
 =?us-ascii?Q?fj0xQK8NyVhkfJN7QLgatcmVB2jWY01q8dH2Ou5GcrEkPa1/0dTf8ncepdf7?=
 =?us-ascii?Q?Q878NA64nXgDJsewpnOcOolNS42g5hCv0jduQGGJCfHBMtdSgkFJTWR8tKaT?=
 =?us-ascii?Q?Bb0bjxR2F7eYxGjOaFeaSAjkgKjgvJl33WdZGA4oif34liButCcM58bngA7k?=
 =?us-ascii?Q?nHyZ5iDcwUbed3Vo3hp4+kZtugqlT+I0I0/UiiWdD3cJDZYPNI/MNMpplFbg?=
 =?us-ascii?Q?qvpNH1qu79+0FJLEBQ+pYGi9sosBr6hM/MpM5MCahu73SYWIrJpq2OnKHYRu?=
 =?us-ascii?Q?sSx5hePI6NWsNJ8uofkNCGmNIcMtM9e3HTJ0upaBy1fN6f8OjBGX00bAGXu3?=
 =?us-ascii?Q?F7M+Fq6q3QkyGdH/e81I+z3ciZjvgx7HeUHlDAv+4XIGNmczt3DiPiChtd7u?=
 =?us-ascii?Q?kLxaEG5JpjNdp3FfgwX4Pas2y2jcPYmJZrwDk2oYjsJ/qQQB7PoJDPEu4xGU?=
 =?us-ascii?Q?aE/G+j3b2Stx6vvRReUdCjvbXzzUjYrqikOxBOfSaqvW1lerSRpbYdTIVDRW?=
 =?us-ascii?Q?XL/MlOeOsw8YUJa9V7LGtT5mHGM4lRmwaWGx3YZMV3B5ByIDXP2JqqiZZY9B?=
 =?us-ascii?Q?w8JvCI1veGcngGyplw6Ds4ixNK6z8pwylzGWgr3PjqX+UIBSV6I+U9Qcr4cU?=
 =?us-ascii?Q?ITpSElfBuCFp3HfhqPeaTeY+Um3KfIja0IMvxcaR2vHczAJbPnWEJgtgnapj?=
 =?us-ascii?Q?DH1uKeB7CVLRxBrXzdtSw5FAe8bT33SZW7LyMRMHEx6fXl2R18vgdxhycJWi?=
 =?us-ascii?Q?f6e0ozT/lwnjBPZaEYgmAAREorbF3Z3yICgZAP3YQPJ8g4y9P+7K7Q/tcf1k?=
 =?us-ascii?Q?IypeovmGWv8McQxnvlyTkfl8fhS7lm/2EJGq11eaTzrmctmyojfK7nD4Qek8?=
 =?us-ascii?Q?ymbKtqJMnPtmnSwtxv73NIlBS1M4sYAJPfD2ycQx6mLbhS8nisCkpe9l/4yv?=
 =?us-ascii?Q?L7pyqX8RU41+0ChTAOwT7ofzFzzv0OmQ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6000ADABFFC89B499C22A6E25C755354@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8160
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c05b77c-20e2-4f72-7c14-08dd443f66d7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tDEeqmrvbAWXIaLiv5TgWgn6t4+sJ4t2UQW/7UdcVIqJs9ARZHPenPGNgjmT?=
 =?us-ascii?Q?9z1PcMGBkRR0IWGULHuH9POhLLn8lqQJg0S7qkDUcKJRBT0gMd+uotw8xeZy?=
 =?us-ascii?Q?WPddwdnQkPQeb+IV2A23Wwx+Xlor1OBBUorFLl91vmYXGbJLXeW6Oe4AuCYV?=
 =?us-ascii?Q?g67SiVhseImCmyK/ix28iOfLQqDFIxpdvYLzzJG0vixwCJzbPsn9otuJbZjm?=
 =?us-ascii?Q?9ZOOk61OYe7BKbb0cbYEqrAiSz5POx/gMCTgC5frjHz32i8MeHkiUMF9bcCc?=
 =?us-ascii?Q?Dsmhiz+XlLIDWkolFvhqvnAs3Mv4IvxwtpFcolIjCAPX0nlwVP+5vpuxpSG7?=
 =?us-ascii?Q?PuSQEYwfohjpVsEpN+tvTrsrMDYRxW7KLPiopIAYPv9gE3uE45+u623IWFVn?=
 =?us-ascii?Q?N1dDyqtqFd+Q0Q0W034Wa9AQNVj2ZrYWWyGAtFWuhBfeG56T0fGDtPp4cOm4?=
 =?us-ascii?Q?GdtWHGjoNibqjWmTZIYnxI2DgH2ifPpEFp84qTjXGd7jZU2sBqBmh8+44YNf?=
 =?us-ascii?Q?oAyz/CU58SubL425PpMX4XNlXe+2lu1bNnQllOlZeUds7D/MpV/g1BhyR6pX?=
 =?us-ascii?Q?WOwmr5FY2I2XNmIrcxkC1uBaA2JJIp0S2YmgmCyBtTxAnF80TxOLjCSCnKH3?=
 =?us-ascii?Q?xYRT9zApXJA1NIUezB8I1fTn62uEaHOzXHYbMMzjXMqWyiEjU6GvhLoL2kFy?=
 =?us-ascii?Q?Jct/n0ekp49zuuCVu0uSUx6aEKAkOGSzem3yC2/HOHgy90YbSLwo3Ykbmcak?=
 =?us-ascii?Q?1LuAxxD+3u/NdKTpwGSmFHqcFwv4zVFQQaYNZD0PkasalhVCF3EQ7uXZP6Aq?=
 =?us-ascii?Q?XjCq6alxruzHK6t9xCj8SvbrzIi9JnJkYlyApXIiwjAeu/PSmlkF0yf5cnyt?=
 =?us-ascii?Q?CfT4yCTBk38p2o81MQI2aY/yWNXnqU2eT1pVNRiI0IdXeQ/tXzNQSu+Het9A?=
 =?us-ascii?Q?h2xNRsjnyAeIOEIRwAmXnKlQv+4g0aRYdOx/POPEmSrXZJXXJ2GLXqfoGONQ?=
 =?us-ascii?Q?Dxl0QHC/z3MrFoRLUS1HJmhR+f+0GKCHkJB+7A2GxZymdVSK40TL8D3ygif2?=
 =?us-ascii?Q?NdviYKu/g7Mg4Vaj8qcispTenow0ywE3Bqi1tBosJjrPZNdk8r5atPAfbyeC?=
 =?us-ascii?Q?z/KuUzbiFQrn1fj++kASG0ESeXN9isqTf9rNZvb5nu1aLWNqpA6x4md5sQJ8?=
 =?us-ascii?Q?0aLhdIozZzr3K70kr1sm66pomwiI38CxLkE/21f4mXCFIkvwQoG59smqEZNZ?=
 =?us-ascii?Q?/NB0Lg1Xp+2z2UZjcBqHVRzzzaIGFtMhGaTopaDowBQlv+VATZDp2dSyJOfW?=
 =?us-ascii?Q?A7y4xCo9ob9VONJnHps8i9JxZiR+KH4WF7IjRv8he5/Si10ROFoB5if1qocI?=
 =?us-ascii?Q?iCHUczEwF1TfrcHjbDkTLPO6Z46/UcmDru+9zyTDgEMCa0el1UQuYmbm0hpH?=
 =?us-ascii?Q?X4tyGQQ8k3snTJDEnqUtFD8nBEPTKGiCFBBtdSxc2e6Y+a4IGXf8iBtGR8T4?=
 =?us-ascii?Q?xCKT7Vto9YbDip4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 10:45:19.4904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d44bafd-7951-48d8-619e-08dd443fda70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8088

Hi Jens,

Thanks a lot for the finding.

> On 3 Feb 2025, at 11:21, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> The notification bitmask is in passed in the FF-A ABI in two 32-bit
> registers w3 and w4. The lower 32-bits should go in w3 and the higher in
> w4. These two registers has unfortunately been swapped for
> FFA_NOTIFICATION_BIND and FFA_NOTIFICATION_UNBIND in the FF-A mediator.
> So fix that by using the correct registers.
>=20
> Fixes: b490f470f58d ("xen/arm: ffa: support notification")
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

@Oleksii: This is a fix of a bug, can this be considered for 4.20 ?

Thanks
Bertrand

> ---
> xen/arch/arm/tee/ffa_notif.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 21b9e78f6399..00efaf8f7353 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -40,8 +40,8 @@ int ffa_handle_notification_bind(struct cpu_user_regs *=
regs)
>      * We only support notifications from SP so no need to check the send=
er
>      * endpoint ID, the SPMC will take care of that for us.
>      */
> -    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap=
_hi,
> -                           bitmap_lo);
> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap=
_lo,
> +                           bitmap_hi);
> }
>=20
> int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> @@ -61,8 +61,8 @@ int ffa_handle_notification_unbind(struct cpu_user_regs=
 *regs)
>      * We only support notifications from SP so no need to check the
>      * destination endpoint ID, the SPMC will take care of that for us.
>      */
> -    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_=
hi,
> -                            bitmap_lo);
> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_=
lo,
> +                            bitmap_hi);
> }
>=20
> void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> --=20
> 2.43.0
>=20


