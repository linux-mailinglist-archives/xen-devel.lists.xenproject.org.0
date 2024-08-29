Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B53964407
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785789.1195286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sje1Y-0007Ot-L6; Thu, 29 Aug 2024 12:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785789.1195286; Thu, 29 Aug 2024 12:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sje1Y-0007Li-Hx; Thu, 29 Aug 2024 12:13:12 +0000
Received: by outflank-mailman (input) for mailman id 785789;
 Thu, 29 Aug 2024 12:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zDJ=P4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sje1X-0007Lc-PT
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:13:11 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2606::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e4c48df-6600-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 14:13:10 +0200 (CEST)
Received: from AS4P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::6)
 by AM8PR08MB5747.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 12:13:05 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::46) by AS4P251CA0004.outlook.office365.com
 (2603:10a6:20b:5d2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 12:13:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 29 Aug 2024 12:13:05 +0000
Received: ("Tessian outbound de2677e4ad72:v403");
 Thu, 29 Aug 2024 12:13:04 +0000
Received: from L92bf38cd484f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB606583-F662-42FF-A808-48BB7CB84518.1; 
 Thu, 29 Aug 2024 12:08:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L92bf38cd484f.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Aug 2024 12:08:09 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB7884.eurprd08.prod.outlook.com (2603:10a6:10:3b0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 12:08:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 12:08:06 +0000
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
X-Inumbo-ID: 0e4c48df-6600-11ef-a0b0-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Th5sh/f6vId0ZL2r4rRuLvjYaDUv/nwIfqtTp8gLpLo/xdChrUMHa1UuVQWCyAU45eNVcS8QJnwhGjhoXLiDA/H3nQKv26P9eWKMFWBtHWtVQfw9wnnd/cDOJU74YtCF9ZBeSbietw1eJ5zxOlpLn1R+72w4cCdmyoqY1fRuIh5wWZdLGOhVoC7l0gzYEbKUXKLiyt9w8r6hfDgmTJTusH5YFOdD7fFXzJ87pibFzuD0c5fHQrbNnT62paX0+qykSi8BHVx7kY0UAHbF/benv7RUI4vnPSBq31zKTLhFaACsKHjmY9zX/PVxwSOqYd1o3YXYTVUIFpE9/SvryHUS+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lHEmkpXMa2uyIswJkRQ6NHRDOX+iQAljOHVIeoGEwY=;
 b=cEPFe5KyztDFX8RK3Jgz7lvslPa2Ud85C09t2xOpFBxfLeE/e4q+RTLlijIXLRRn43Is6j1PQ+0WManWJeV3gpW1QF0CtMzYMjjM87QUX4H5clqidsNWTCPybEOtviWohtXHLR3silVa9b7gpE/s18nP6EfTt0jgKTHMTqHOhmnzNCsZTtjORJ9DPF5Cz2210JU0SaRPtG9mCIFCpx3ZRMvko7qUwatMyF45QfLTV6vxv2/kpT+xS0Pf6IEO7M6T+R0QMGKnCkDfwU1si6/XaApUILXTQvoTRykrc10dmeTPFMJD6sCrrKsTgPfFVkh5exApeSXtUToXzpz24tWbiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lHEmkpXMa2uyIswJkRQ6NHRDOX+iQAljOHVIeoGEwY=;
 b=BIUrPygOVC9t+05OexclindTwNygMAWxOL70UjwWnFDlFLpWmL3XIWKg+OirWuaysc8xh6TXBV92ELrsL4zsCcL2AbcCnCjO0LF34KsoyiCNM91XQfYNkTvg0RaQXGw9QRiA9aKd3+aWMIS3WagaSTgrFgAJe5gUhqzZgPcV43w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58dfc2f987a37f44
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6rLeLMPyJwdh9bI88XsVDiKWJmlm56UFeYh6M9xTrXN7gTci1sup+bhu2oEjOUolfgnV+TmDRJDpL2QFhUrkG9YkQMCFJ/6GbQWJ4prOIceKBsS8CuqyzgdgWErjkaFA7ZCMghHxIXjXwuVLNT9m9bSKCfqBK/eHmA+tlHR3hoItjvwtDIGv+CE3GAYALhiRRk9vyLGqqoKuPaXYhz515xCMvWqNDFHgOzlLsDEScNUb68yn4glz5/qPjhN7FEYLC+gEl2lkkX0XSODtSmQJnY9FLMdtnRgVrW3rHxEaOKgBOAFlKhDdqXJKPvZO3jNDyvDm75g9I2RVAR6/AJe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lHEmkpXMa2uyIswJkRQ6NHRDOX+iQAljOHVIeoGEwY=;
 b=VXG+8L2nOjV1q2tUmiwl5hv9MngUzd3G+cDC0/zGbM0SBvYM0ZaAF3VN0mn3Y5euqLhj7sZTW4AV/jzVk/YNtfAMp5NxLrMso+fdF7pW0Y85DLl/dOdHctHNyitwJ9MMNaUZkjA8nRuR9BiktlIYrAh8qGqzoXyt/WLomzjEcLRMZIQLZmllAqYdDKhy0PBG+Zbw/wEVP2OrK0vhv1rtP0q/Hea6RfPr812mavACa1OmrclpR+s6JG2RVPZVzK387N771UFKi2RvbqfA9n673maBx1lO64GKu7zTkcykteT34Rk9FnRPj+23B4njevHdCBVI9QlFLnR9piBoQkVBow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lHEmkpXMa2uyIswJkRQ6NHRDOX+iQAljOHVIeoGEwY=;
 b=BIUrPygOVC9t+05OexclindTwNygMAWxOL70UjwWnFDlFLpWmL3XIWKg+OirWuaysc8xh6TXBV92ELrsL4zsCcL2AbcCnCjO0LF34KsoyiCNM91XQfYNkTvg0RaQXGw9QRiA9aKd3+aWMIS3WagaSTgrFgAJe5gUhqzZgPcV43w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Artem
 Mygaiev <artem_mygaiev@epam.com>, Hisao Munakata
	<hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH v2] docs: fusa: Add requirements for generic timer
Thread-Topic: [PATCH v2] docs: fusa: Add requirements for generic timer
Thread-Index: AQHa+gcFR3YtqyGnJ0KBJ/zbYknDerI+JBsA
Date: Thu, 29 Aug 2024 12:08:06 +0000
Message-ID: <43971A3E-4DE6-4DB2-83A4-265DDC3A1747@arm.com>
References: <20240829113120.3980270-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20240829113120.3980270-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB7884:EE_|AM4PEPF00027A6C:EE_|AM8PR08MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 783c6fd7-b971-4252-cbb3-08dcc823efde
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?j1564+aAxS/jTfpifIk843D1JPYURFSH7aytwY5qeBV1x62tFjy3NNTsnIgZ?=
 =?us-ascii?Q?y2uRZOLoXEveRKaFndXlpztmwN0INdXBmzzQwnVjPEt2k1grn16S/HZlDl0q?=
 =?us-ascii?Q?QLKxcwcw+51vLbADI3W6P2RhjhmbdxQt8Y375niNV+6YsQ4yzjFWk7FLRh+P?=
 =?us-ascii?Q?baWE0gOusBDjpCzGOzivXUSMOp/g9PwoCTybJHo+puTvMligZojR1N/AwORe?=
 =?us-ascii?Q?xXnOsBAEeaO+a8lsKSEdHyommAj+C9bRf9WZ+3J+/h1MjhXa4xIzsD+Q+w4q?=
 =?us-ascii?Q?2RWStYQuxudjYlqy9+MYzf2K9YMp/12GCQyCM4ZNMiME7ZecpWIGUUGdxNGs?=
 =?us-ascii?Q?9x+9mZFKtMuwyWQQIAmDbJbcmpgJpYXSEtTP/6Osndqa7XZl+krwhaOXH5Lo?=
 =?us-ascii?Q?pA99WZVirGGfcSTr/I2MGgmklKxYNZADvwsKPnyX4K0mUM7eMlV9okoJzFL2?=
 =?us-ascii?Q?MLyzvTlh4n5akwzl5QZig5/FPebTWb0ClFAIPt8kTiKfAlrnI64Vy775Z2jR?=
 =?us-ascii?Q?2Dxj2tAQI2kyKCiWzj8sUPK0EOpkTV6oH9grrM7wRtxw/dDt6tMGxy8yD13U?=
 =?us-ascii?Q?4f+6vEwiBe0pPVbFo8YIt/50VebPwZL7yQS8cf1Gt/RFZFdJmTdk6Lpvu9kV?=
 =?us-ascii?Q?S8mdZNH85fwWDEkKGeDgj0mD69mDppPUzSNrTCHCQAWJy3/2QONlRNEbr6rU?=
 =?us-ascii?Q?4b51FysMlxiNHg8QzQ/NHaiSTZ22W9ObusaIehspc3ljSquLu+nsCMqhgXBm?=
 =?us-ascii?Q?Y3DHgzhVUb0d8l3Pqfnq6W/CHuEbsSQgKzzPHv4LrvDSCIpxtLV0s+VzksH1?=
 =?us-ascii?Q?vEOm4MQ7tLTKQJXRRZyIVHbNtBOmr6SGTiJhd8QBjJ1m8VGMA/RTN5+ErpJL?=
 =?us-ascii?Q?ww9FtZMj7jtbNTYhIt1oV1XqkseFSXmpEWYtqMhDAIY7hoDPQYaXMwk407an?=
 =?us-ascii?Q?e9L4X3PtLCAWBX8U4ghKWDCoEdfF8awTCWS3D71txLuOnJaq//u2FJGUh94U?=
 =?us-ascii?Q?Kvei0MzZUURzTVpGv7oiuxJM7dptXfcFusAO9KtaQ9sHwcsYlosbzlNFqYCE?=
 =?us-ascii?Q?T0joXrL2nNwT0WO1DX1x6mF3+u4RUrKo3AIhscPaLemfkudK8IUi/FlWrp67?=
 =?us-ascii?Q?5lP97UeJLM2mm0igK2uAT+dhuJs3ipkJhrZxh1u9ceV8BJkd1ysCfYuHgbAV?=
 =?us-ascii?Q?ZWKaE+VEr1hbAls4a8FvuoVqKYhhjnid/LHST5++grLIkj2poq93FVycujV2?=
 =?us-ascii?Q?LhJakO4rDOkEBKkXNJ6QjhRHFAZkmr/gldHeyordqiv1OtZnxWC225vwmaC6?=
 =?us-ascii?Q?eeOLGTucLJibP4Qrlm9xR+njQx18gYHvVu1pljtyOOPm6Px29JbUIt7hNKqi?=
 =?us-ascii?Q?w6sJxb1L4+et583YcmRZlVh1GPSPbfozRSKKgwiXk+f/POuDBQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D73BCB5C183545458344D8B0F0116A31@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7884
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37fa33a4-e105-49ff-9023-08dcc8233dce
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wQJNkfk8Bbs5BsXl9D/cNhNoqLwP8W497p7chYLJtIgsNylSPAVhQ9xhQY4B?=
 =?us-ascii?Q?kndeGiPFyOepkhyHwiGDW+oRZ8v+eMsUWcFERLY15s7Xz3GzZPTBTkE+BeRW?=
 =?us-ascii?Q?kjAPaqJrVNRaEBMBB/mlgmB7eIcRqFKWGLR21z9qeFBVxqkauTA1CZ8XbuPL?=
 =?us-ascii?Q?mNVgr40pMHbk8BgPP6peb2BwP/CnRHLEv6Z6VY1Nt9EjNzYmtgmYexHQCA5I?=
 =?us-ascii?Q?hZgh5a8zaDPGIMLAUkMsCP9tyO9k0Ev8YX5JaomszW1wx+T9kCE16BKswFg9?=
 =?us-ascii?Q?pS6VdG+7+syKKvm32MG1CkSATLyAkXncZlsm6i7FJyfnFS+fF7h8bLwEob3J?=
 =?us-ascii?Q?pX1z43JtdIoD1ehilW86yUMo+4ouwZoGjdbhUwvEJn4y87tmGQVui/sK4c2O?=
 =?us-ascii?Q?ERuzlFohvwlUtDlzSezPRnS246If9NKDA5Dzmp822vc3em8M6TKheT4+SusD?=
 =?us-ascii?Q?Wryvr/t9doGrqvFmta1Hld6iHtnapYrDDQLQXcvjTXZvFbglYECuwUzia4Rq?=
 =?us-ascii?Q?An8CFgwbb9c+QM49PWsniSm+bh1C72wr9soC9lcn3TVbifyCXobN6Q19bGym?=
 =?us-ascii?Q?AlTpUuaGJ9ygUPf+nGqfFj1xhWiQrQrWMlUBxZpIyVH2AFyYKwKWXwFi0C4K?=
 =?us-ascii?Q?HQVprtgSvwe5Caa7R4HPMxKTNz+mKt6YTNkOv7lbzt2ilqR/9/QCm9Ikom8S?=
 =?us-ascii?Q?yqqcYAMGmq7g9rrSFckydY6HDUPrTQdmbyHUyB3ClGRzB85abMrJkNT7Uhb0?=
 =?us-ascii?Q?jG6sIFhiuwpIdoGtiM/uQPCd85lPBD0a1l7SiNv6/OaJtHsaSl0ntnwgpvsS?=
 =?us-ascii?Q?cXk++01144YT2l60dpZkcflDyR4FkBdLlObH7hghHOGNT24g6ln2nL6hWJS+?=
 =?us-ascii?Q?vCm4gngU2nnvFxZ4n6N0cOWMWj7aOEZT3a9SFkFtxqh4JCGlkjzEDiRoguhP?=
 =?us-ascii?Q?SeP1ng7ZvNMLzuo7gHWcoXk+QbFQxOiQUfWuYdehujhzfJuuMtxxjlnyw+ha?=
 =?us-ascii?Q?4sDIsZvCfd8mc/I4JH47kxBaiviP2g4XvI6+4UuCOyR+K1unw9cD97kyU+Mc?=
 =?us-ascii?Q?tn/RTl8q4LlsvCC2kg4utMpErdSGjfTKQefUv7QF7Dv5lJ/94Bm1r5+GOOTb?=
 =?us-ascii?Q?ea95hKy75kq6HzNx0iPPWDjs0T4tGr7LcsK7NII71BUacmeXFKxldJFLryYs?=
 =?us-ascii?Q?zzKqlSeMm9xCK++gzyGZRUOG874Erj+wXioxrEnj6BwD7dFHt/0/iHgNDKzX?=
 =?us-ascii?Q?lKXo9Tk2deZmq+AVXcN9Q/Hdt28p9g9FnWQ+iv5WV46jub3Xtay8ILuu5zqO?=
 =?us-ascii?Q?UOREwmAizV+oNlr38EUkDeVvtFcV6ZIvAMhRcXtKH/PkY4/tNHGnwzvA/pyX?=
 =?us-ascii?Q?w+Wg5ZM2faRnV21wq7qBA+T82fvIwvsnFuTL+xaaQVeXPkqtIwARi1O7LE9l?=
 =?us-ascii?Q?vV6u6omdtDZNeTqjcl7Zn7PZkdJCO2lr?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:13:05.2909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783c6fd7-b971-4252-cbb3-08dcc823efde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5747

Hi Ayan,


> On 29 Aug 2024, at 13:31, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> Add the requirements for the use of generic timer by a domain
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from -
>=20
> v1 - 1. Fixed some wordings as suggested in v1.
> 2. Removed the comments which mentions Domain specific usage details.
>=20
> .../reqs/design-reqs/arm64/generic-timer.rst  | 123 ++++++++++++++++++
> docs/fusa/reqs/index.rst                      |   3 +
> docs/fusa/reqs/intro.rst                      |   3 +-
> docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  23 ++++
> 5 files changed, 185 insertions(+), 1 deletion(-)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
> create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fu=
sa/reqs/design-reqs/arm64/generic-timer.rst
> new file mode 100644
> index 0000000000..f2a0cd7fb8
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> @@ -0,0 +1,123 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Generic Timer
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following are the requirements related to ARM Generic Timer [1] inte=
rface
> +exposed by Xen to Arm64 domains.
> +
> +Probe the Generic Timer device tree node from a domain
> +------------------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_probe_dt~1`
> +
> +Description:
> +Xen shall generate a device tree node for the Generic Timer (in accordan=
ce to
> +ARM architected timer device tree binding [2]) in the domain device tree=
.
> +
> +Rationale:
> +
> +Comments:
> +Domains can detect the presence of the Generic Timer device tree node.
> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Read system counter frequency
> +-----------------------------
> +
> +`XenSwdgn~arm64_generic_timer_read_freq~1`
> +
> +Description:
> +Xen shall expose the frequency of the system counter to the domains in
> +CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" proper=
ty.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Access CNTKCTL_EL1 system register from a domain
> +------------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
> +
> +Description:
> +Xen shall expose Counter-timer Kernel Control register (CNTKCTL_EL1) to =
the
> +domains.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Access virtual timer from a domain
> +----------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
> +
> +Description:
> +Xen shall expose the virtual timer registers (CNTVCT_EL0, CNTV_CTL_EL0,
> +CNTV_CVAL_EL0, CNTV_TVAL_EL0) to the domains.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Access physical timer from a domain
> +-----------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
> +
> +Description:
> +Xen shall expose physical timer registers (CNTPCT_EL0, CNTP_CTL_EL0,
> +CNTP_CVAL_EL0, CNTP_TVAL_EL0) to the domains.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Trigger the virtual timer interrupt from a domain
> +-------------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
> +
> +Description:
> +Xen shall generate virtual timer interrupts to domains when the virtual =
timer
> +condition is met.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Trigger the physical timer interrupt from a domain
> +--------------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_trigger_physical_interrupt~1`
> +
> +Description:
> +Xen shall generate physical timer interrupts to domains when the physica=
l timer
> +condition is met.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +[1] Arm Architecture Reference Manual for A-profile architecture, Chapte=
r 11
> +[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 78c02b1d9b..183f183b1f 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -7,3 +7,6 @@ Requirements documentation
>    :maxdepth: 2
>=20
>    intro
> +   market-reqs
> +   product-reqs
> +   design-reqs/arm64
> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
> index d67b18dd9f..245a219ff2 100644
> --- a/docs/fusa/reqs/intro.rst
> +++ b/docs/fusa/reqs/intro.rst
> @@ -55,7 +55,8 @@ Title of the requirement
>   be 'XenMkt', 'XenProd' or 'XenSwdgn' to denote market, product or desig=
n
>   requirement.
>   name - This denotes name of the requirement. In case of architecture sp=
ecific
> -  requirements, this starts with the architecture type (ie x86_64, arm64=
).
> +  requirements, this starts with the architecture type (eg x86_64, arm64=
)
> +  followed by component name (eg generic_timer) and action (eg read_xxx)=
.
>   revision number - This gets incremented each time the requirement is mo=
dified.
>=20
>=20
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> new file mode 100644
> index 0000000000..9c98c84a9a
> --- /dev/null
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Functional Requirements
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Run Arm64 VMs
> +-------------
> +
> +`XenMkt~run_arm64_vms~1`
> +
> +Description:
> +Xen shall run Arm64 VMs.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> +
> +Provide timer to the VMs
> +------------------------
> +
> +`XenMkt~provide_timer_vms~1`
> +
> +Description:
> +Xen shall provide a timer to a VM.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/=
product-reqs/arm64/reqs.rst
> new file mode 100644
> index 0000000000..7aa3eeab6a
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Domain Creation And Runtime
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Emulated Timer
> +--------------
> +
> +`XenProd~emulated_timer~1`
> +
> +Description:
> +Xen shall grant access to "Arm Generic Timer" for the domains.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_vms~1`
> + - `XenMkt~provide_timer_vms~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.25.1
>=20


