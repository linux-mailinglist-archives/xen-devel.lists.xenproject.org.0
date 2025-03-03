Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD416A4BBD2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900105.1308027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2qD-0000Bo-PX; Mon, 03 Mar 2025 10:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900105.1308027; Mon, 03 Mar 2025 10:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2qD-00008S-ME; Mon, 03 Mar 2025 10:16:05 +0000
Received: by outflank-mailman (input) for mailman id 900105;
 Mon, 03 Mar 2025 10:16:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W32C=VW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tp2qB-00006u-Lw
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:16:04 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 829506c5-f818-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 11:16:02 +0100 (CET)
Received: from AM0PR02CA0213.eurprd02.prod.outlook.com (2603:10a6:20b:28f::20)
 by DB8PR08MB5337.eurprd08.prod.outlook.com (2603:10a6:10:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 10:15:58 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::60) by AM0PR02CA0213.outlook.office365.com
 (2603:10a6:20b:28f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 10:15:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Mon, 3 Mar 2025 10:15:56 +0000
Received: ("Tessian outbound a81432d5988b:v585");
 Mon, 03 Mar 2025 10:15:56 +0000
Received: from Ldf2ef66d0bcf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98197E00-94DD-40F5-9716-F5EEC5FEA032.1; 
 Mon, 03 Mar 2025 10:15:49 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ldf2ef66d0bcf.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Mar 2025 10:15:49 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS1PR08MB7475.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 10:15:44 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 10:15:44 +0000
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
X-Inumbo-ID: 829506c5-f818-11ef-9ab2-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oNf+ApEtqF970ALAWG3XRhSUVFiXrUzVTHoXQog6xq+eaNWs88AQTvwxos2EqMaCU2M1RxsO8Df+Mc3OyyJE5nJOLvE9CPwx1/0KbsL8r94QHitlb+wNkUbZ9+buBb8uataL7779GN4DQqMNGz7IIHSP7QPEjr+UF1WJzg94SXo9B8zUcmZeTLQ+ydKoJZo6qjjBRtMK8++g1bpsEZHrQ/kOOoaBGYwho7ARSm9Yle3YXM7r8dR4tVBrAU4+qg8NBp8aCcMZ3Dr32YYeGQIG982wa+CxG2COXc8/9IBY39TdIOyk1vEOQ8XjjrxuPmNCnDKGmrCeeVLNOmmhTip/ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rINrDBy0uW6uPJghORlDzeLImTt+zbATwKhpVchNsg=;
 b=Ld4Bfo/4NY8mcYg9f8gYjoOMw8Qd0WNq6edfDhozMg6oIrk3Tguqs3BtZxG1DCfocSwDa3e2h+dg4a45tCbFd66uiWmf6eVVTccpxro3+P8ZBBpRrDq82o9ylk7JScWXAyEIZzXoONKgqldUnlFnZ8kiTFFthvgn22nZVqwy7dwBa7+lrIt+zyd4+a5H9uDhYaQcano0j2d7HPVG14gCldDO6QkQRVtR+ebZDEF4MlzCkPoopgc8qge8qG6bY/4nBZe2xtXj3hgZId3qEYTjUdF0wSClsYHno52xdk3du1vQK9aoeamSQ70N1U5I6Oe9SZdHGgkIgeYy1Gj2HVxu5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rINrDBy0uW6uPJghORlDzeLImTt+zbATwKhpVchNsg=;
 b=YcEmEwwUtRWnvCLWywDieAos3n4VIHhKsbfxTrJr+TwT34woGDNyPZ4StOyL9PaI6zK55JOFW0GlJ6fcV1X4RMAPTGx2HB50CDvh+v/zA2is9S63U4YtjS+0mxB1s81Ab0RPSy+W5YG/uR9wniFEtKQPjGRTgy04pNZu13lInVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7f0790e83eed5eb
X-TessianGatewayMetadata: 4FijQYXym6qxgYm9VAYtgVq/8CqyJMnZ0I/r6OoGWvjthGis2Su3Hv9lThaUiBxLQCzBikbny3F5nwl9gfAeAMVDTJrn+fXv/J0xJeQK9lI7NmcPya4wLrzzpv3J0secIpME2dvsPC5Plye76XkbZhVIPo+5S8EFR0ejswyf7cE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/lZ5bLv8m5dmLdefqHSEd9eI8serLDfFUHxEJvsbmOTykOSehA+dxv1f7/0dhe9S0vmA6Jhhou2md6hqKO3971XbkG9yPAasOUuE6eEW/AIv+fMUIRCSly+mQp6gBdEyJitXiWe+WgSdr2vM6pzgTwYkjozOffdLWm2/E4Mad8uJ5kSOWX005k3Mr/x4XDlvuDR89cNc4jt2cDcL0aMNoWDHGmGvm5iIDFD7b0QNxnMjHVL01FOQV3ZxY8cX0NM7ete86Hzwnmtea1kvymHkgQPyps4f8O7jCG0v0bRd3jCtREpTvyH6ANf+o+KEQ8EQJfp+NrymWr+Z2L4Bq8gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rINrDBy0uW6uPJghORlDzeLImTt+zbATwKhpVchNsg=;
 b=G2XM52NdtZPn2JCakzWHKt9omG87R30+xJOX6kLCcj08LEOb/pxkuEDdIyODfn8GvGzbZ7ztYeD1hwTutcPuUzzqn1L2i61zTZz9VZyXqKPdt237bUjexmCUQOpP1JFir2beCZ9+tdOYhQHzXiMdDVJtyu+bQAm7fiLo17bGcKpD0bCpMvq14bsf8U/9txaR7dQ2Wmlirrb//m3+YS05Xx+naW7dNY4PcoVuQF4h4JmHjjNeAc+cr0r8+XBtdGhon+vG0/+vPp6Vsdajb3OAb1bosVV1LenjvXOEfJKQ8zAuhrf08FqfYjBt0XO4bQ8gozwgVrVrERI/48IxidiHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rINrDBy0uW6uPJghORlDzeLImTt+zbATwKhpVchNsg=;
 b=YcEmEwwUtRWnvCLWywDieAos3n4VIHhKsbfxTrJr+TwT34woGDNyPZ4StOyL9PaI6zK55JOFW0GlJ6fcV1X4RMAPTGx2HB50CDvh+v/zA2is9S63U4YtjS+0mxB1s81Ab0RPSy+W5YG/uR9wniFEtKQPjGRTgy04pNZu13lInVw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Fix platforms Kconfig indent
Thread-Topic: [PATCH] xen/arm: Fix platforms Kconfig indent
Thread-Index: AQHbjCRKzOONRh42LEq1htS2xcR2hbNhMZMAgAAAiYA=
Date: Mon, 3 Mar 2025 10:15:44 +0000
Message-ID: <14E001BC-6308-4F6A-BFBB-D6FD71883A07@arm.com>
References:
 <449a9f85d07aca65f607944c4bdab850760c9445.1740996436.git.bertrand.marquis@arm.com>
 <91efefb1-11e3-41d2-a098-3124cef6578e@amd.com>
In-Reply-To: <91efefb1-11e3-41d2-a098-3124cef6578e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS1PR08MB7475:EE_|AM3PEPF00009B9C:EE_|DB8PR08MB5337:EE_
X-MS-Office365-Filtering-Correlation-Id: b90501e0-3230-4c6b-e78f-08dd5a3c633a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?kkTiW9waeyz6xvUgacG3TSFxUMm5x2w9fqreigVX5ULZymeXtY+LfaMmyUg6?=
 =?us-ascii?Q?BjtVJdCY31DVmfLCfI7M6QyICBOVgoie7kQn3BLfxpk/sX6ezY1bQXxsnQEq?=
 =?us-ascii?Q?evpVXglK468dtNwaYlS3JQ+oL85BzWYl1bqtryUa8tS9ON1K7BwSzl9U+8sL?=
 =?us-ascii?Q?Iux/mYs3FOqmk0i253Y/VQkI/EqO2KAev7t8+Gs0tPOgRd08xLxag5PIKERR?=
 =?us-ascii?Q?4xwZUyU8KrZQMJLNF8PqyxL2lB/MxM8/71JOlY04PzsF7m4UBIqxiHOFm/5M?=
 =?us-ascii?Q?ZfhYy7GoaQKNWNVeVFp09epw0AyQCLWna2c2ZqAgIpcme42YYBpraA0JwTS1?=
 =?us-ascii?Q?/xwmSbgtPfnHiCqLaH0sSGUMfzOzobXg2j3ACYCafJ//kjGgg5thH8eitJtn?=
 =?us-ascii?Q?HoAugUT7ARXDHfBIVVLgBS80Jc1B4jK/mGsZJz/ifOUCdoODp+cIueDG5eiI?=
 =?us-ascii?Q?NXMR4/A++1QVP3r4ffSnRgKnKVH1C1DgUYMbrFfeENjZkhRNaTiu7VXpt8lM?=
 =?us-ascii?Q?ZYCWooB/BlfFcJBcpgDMDUa4djEtsNxHzZ8s7Jz5rCOH4eTGkPdtDqg9bUKz?=
 =?us-ascii?Q?0hzzpJGRXajcVp23ULee8KoNGWR7/nXVbB+QUWerU7HrTes4TZVHBlO6ycHb?=
 =?us-ascii?Q?p+alD1x9VPSJ4yQ/c4MhS1113x/DxKpjlWUUN+tUElr00JL1CetCFwZjELH4?=
 =?us-ascii?Q?yuG+ZjAAhgv7K2p2DLcx949H6FrglpDiTt4yvwzLTS5UbojjaExp02E+o9o0?=
 =?us-ascii?Q?4UY3zp2xox/PJN5Nrml6Xu8o/KR9fxdJX49qq3ad80Glmp80wIUAfs43geQB?=
 =?us-ascii?Q?HV4qfKk42YVJOl8StOfV8obZuNxmKu3COGTnnlbLhl4Vxdm7XtveM4d/aQ+V?=
 =?us-ascii?Q?57DYk0qLJ1tPt29lur6KO+dTtEzPIg+4HGsNN1SbdtxWKDHjZjddMn6gozlX?=
 =?us-ascii?Q?D0wpfbtAK8j70gP5xt5AzMY4KANp8cqa9cQYlNdpVVi6gmXvT8s2k7onK/u9?=
 =?us-ascii?Q?3JHs1H7uVFLxocbDjJllJrmCYJMxlnLvtubU9sucmcBfU/TSvUl3YeAED4Py?=
 =?us-ascii?Q?Dkf9TrimxfizF5/Kf7v4CT4i8zyc6pSXa50P7diBHcJtb1v4wR4IbsHomi8N?=
 =?us-ascii?Q?y0BUw0K4ZQPo1LNCXzRYheEaOCIgFH/n/8JD/bPK+MzHFtdIUBWSQNKngtcu?=
 =?us-ascii?Q?DE6ZmbfBd/Gev+G+Ot0Yo2K8tRw9MsfZBjkcuTv9fbdLs6UZCBwHUPBEQXYN?=
 =?us-ascii?Q?c6edfCmz73O8EH5o28jypskpuHjJ9TvzYHqyCOEZhPSo9m/jTH6FCWnzPM9Q?=
 =?us-ascii?Q?5G9vVNQ4YavrPtZfI9lfubfg8vvBqUz3xMMdlKl+4YbSf0MdCkafj8Zo8NQU?=
 =?us-ascii?Q?Gk4yx1UYEWItgJvamBRevpIpnV1UaBkG1ZjTVa18PkQkNxL31FXtRHwPXgDX?=
 =?us-ascii?Q?bmIOMjbCFUwcP4N/ccsR1YuKb7980Gsb?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <372E743CA6CDC84090731B8BE0FF2BB5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7475
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a58e057-3d4f-4cec-6ce0-08dd5a3c5bea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FX2HzHuyILtzw6fXX+St2jOIoRa35ISxwhdoAGHntyHK4rh5yHH4xdm/5EKZ?=
 =?us-ascii?Q?XGX1V3SvzbSi4k1/hIoqiDRxRIV4bXqlKL8UHxQ/yEMEG2vwi4Jlmoowl2Gb?=
 =?us-ascii?Q?1eKt67YS8Zq7XEjRuPCgZfmpJ7dAMopfA91B+mM9jodrYERql+mjQMNDocVT?=
 =?us-ascii?Q?cTwlTSDvpk+SAFhWuRloK93hMB1NoS0jxh8lpkJhuR/wtpHf9Mksyj1Oc1eZ?=
 =?us-ascii?Q?r9Z5JR+LfLkRdOKID9bzbDXQleNu/SgoYlm5jIv6Z36xi6LDwCbYlLSBeNUt?=
 =?us-ascii?Q?n8VB6Oc6duK6RSB0AlpdcYb3iEG8uhPeljg4/PUdtL4UCyOliALqMSZNF9PK?=
 =?us-ascii?Q?nv8kn6dy+TuOkj9JWTR2o7u3X0UsfCwRxPgNVDLnnFu2y4ZmbwuljsCYIL0m?=
 =?us-ascii?Q?c3YKKs/GTO9TaTwfXyQXLMqfpc8uQzYsDTCyMsFmQdPS5jxL7uZEACYyB5da?=
 =?us-ascii?Q?+NlEgjC6ismWiK6fsB0LKQPdQ5Po15ZjzyKT7uy3lLKxoCeAhIg48UHkAns7?=
 =?us-ascii?Q?1xXK0m87K8+eIKocS1Y/1iQnUjK4h7JNkHepY/9oSHCKQ/D8m8AgUf6mes3L?=
 =?us-ascii?Q?V+zSsgVINZyxbWgezUKRI7tAL3HECj1uSfn9YofxBz3KuHNE0lwWkRUDQswU?=
 =?us-ascii?Q?PLVwDqmM/By9C1SKI8xuobq8hjZKdH14fTfl8viJVadVRyMcDeJaTvT86TfS?=
 =?us-ascii?Q?5aMjUoHEgIHlYDzn2ej2Nww7seTgBxq7et9GAdMRghGmQF8P9W1vNnoc2ztl?=
 =?us-ascii?Q?QgtI0QUCH9tC4/RAw91bMTolkuC8Lj3cevRLbVOovIk+OzzgcKgpe+Gxjrq1?=
 =?us-ascii?Q?Gz3iIFJziFLeTVZFoq/JeZW75GL6SqZvGriCt0gwO2LMvpzQSLdWQFFKbsUK?=
 =?us-ascii?Q?Pz2PfTsKldvq0522kYzcXpq3ItBQFFga2h2KOYC9NM6/h+7M75GGafb62utq?=
 =?us-ascii?Q?Sg5/0cwk+rj7BRf3NPCBj3AUtE2o3hDxqSvfl/nNaoG1MwejqugWaRT+qo3v?=
 =?us-ascii?Q?1Cf2L58J5Mwwz/vTiaShon5Q16eVclaHdYlOYZZ2bVXPCyc/1xl8+kW/fiKL?=
 =?us-ascii?Q?qaFwC3JB0dOw748Q/yFpZtLdRCzlJ2h7VY/ktYoR2hVyEJob4zEToko+kKsO?=
 =?us-ascii?Q?86moAXWz4ST1BUgS9YuQ6nkc3mqagpBCrl2EZvDzT2KvwUbmeZNe/Xu1EbHh?=
 =?us-ascii?Q?DafZT7co7Zw6cFWSN9D0e2HfySEAsdJktrSol+/gFNLC0V+QOpT2mWkDOG6+?=
 =?us-ascii?Q?Bnv2reYJXwYh7U6LdqMgp3Bo2m4ySswwaUMyTpA//7/2UbZXBeHIJWYmIAFn?=
 =?us-ascii?Q?Oz95Mlf4y1rJ0awBUH9HVVxvXQZhEy9geUNucFxa0aOpMDt96etiVTPqpR1B?=
 =?us-ascii?Q?Sw3Vpj7V+DjtdOoKWsecip55zKDX5Dqyp7bPwYHjW1wPFH0H0LJdgftxw04p?=
 =?us-ascii?Q?DpyZJsL8rTdsMYceYz3nfMwUG3E1QS2CK+Ml40KF/FIM5eFhZErqHe2D/W2M?=
 =?us-ascii?Q?PHW1pTe9IrLTh20=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 10:15:56.5195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b90501e0-3230-4c6b-e78f-08dd5a3c633a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5337

Hi Michal,

> On 3 Mar 2025, at 11:13, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 03/03/2025 11:08, Bertrand Marquis wrote:
>>=20
>>=20
>> Fix platforms/Kconfig help indent to respect the standard (tab + 2
>> spaces).
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> Do you plan to fix also arch/arm/Kconfig.debug? You could squeeze it in t=
his
> patch as well :)

This one was in my stack of stuff to push after the release.
Happy to also fix Kconfig.debug to.
I will push a v2 with Kconfig.debug

Cheers
Bertrand

>=20
> ~Michal
>=20


