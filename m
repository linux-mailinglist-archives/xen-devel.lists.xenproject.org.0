Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C83A2AB85
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 15:36:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882872.1292952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg2yW-000565-3v; Thu, 06 Feb 2025 14:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882872.1292952; Thu, 06 Feb 2025 14:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg2yV-00054N-W6; Thu, 06 Feb 2025 14:35:27 +0000
Received: by outflank-mailman (input) for mailman id 882872;
 Thu, 06 Feb 2025 14:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUPl=U5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tg2yU-00054F-3y
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 14:35:26 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a33a26-e497-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 15:35:24 +0100 (CET)
Received: from AM9P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::19)
 by PA4PR08MB6160.eurprd08.prod.outlook.com (2603:10a6:102:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 14:35:21 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::3a) by AM9P193CA0014.outlook.office365.com
 (2603:10a6:20b:21e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 14:35:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 6 Feb 2025 14:35:20 +0000
Received: ("Tessian outbound d73f074635d5:v567");
 Thu, 06 Feb 2025 14:35:20 +0000
Received: from L991da0e94c33.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5B64C630-CA02-4D76-BFD6-FCEEE36627EE.1; 
 Thu, 06 Feb 2025 14:35:09 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L991da0e94c33.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Feb 2025 14:35:09 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by VE1PR08MB5773.eurprd08.prod.outlook.com (2603:10a6:800:1a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Thu, 6 Feb
 2025 14:35:07 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 14:35:07 +0000
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
X-Inumbo-ID: 99a33a26-e497-11ef-a073-877d107080fb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bao9qg9M3oB3JgGAuoTz4C8MhW7gHOQZgiPv4YCx/yKa7LNVqMYrTb/Ge6kX8jjzJTz/LIcmSGy2XGYND5s7pt2MgTvWCrGuX6gH/F/59AxfTrU35lndFn4BioqIGpROWrO6hUxErIALojW7xVxQGGAOicVRKk/AHb8LIGZPR4R5Aj/Lq7VWaMI82AUK04mi4tukcC3F4AiIDafhMgbr9u5cMwWCDFq58PgOlpjf1Iw6IChEfs6xSM2iM3wZcglvRPKXeFk9LDlcTciPLpKW/IPNIzmFn9sNFwtQbYiX0ELhMlCJqwBdmTS6nJtFG8eza0tkB2uDJfXPdIEdN/FWRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt8YGRTgOzbJvuOGpCpVdrbfjNF6ABBvmPIXwcKd+0w=;
 b=BLOhf+5tDk3KH3+2oBIqgHqSoYXIIN7ACK+hQMPUnV5WzCWrCMItKqRxtU7YmQkAzL6rRZN7BVTRKbryPxTPwmpQRzryggMp4YVN3+G1tF9FVfAfAUblNtU4Nu1Wm2eV8cHVUBy+aKf7i+vS74mTLoerjK6h5bzNd6ZlJWd4Ak2DttSPfratJSnxh0EtJ6aqYQ4Ym2mLHHvES7N+6R1nq+h97sXuix2I2pdwBI+HhkxAcXasOmyKZ0ZgmFSh12npbJNfZetQMYr47kf2gl9aLIONqMC0YHl85xGdV/R7OJlr7ifHQGJlNiEgI1kv5HjT+I6DzDXl7ptVaecenV+OIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt8YGRTgOzbJvuOGpCpVdrbfjNF6ABBvmPIXwcKd+0w=;
 b=JUoIwKE8OXG15od8nGa9U221hu1GRk9+bLuaRPIhthGswWD/Oq63Z/ze8QK7oHInSNy+VPAQb0CnbqRvdWINW+jC9DiKH6dUVKUXO6Jy+Q/q4lQduEDCu+F4WA8h3hdVEQKTHzPU/XusZ2PBKwa/Zh46adVeXyLD7+xi87NMrHc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ce17ef11c396905
X-TessianGatewayMetadata: gxpp+sabHuzR53rqey4SaLv1WdeWcOlsi61mOrJRR/i/CKHGXUH4AhdQRkwS08ownUwT91cVIWFQcMErApJsrNBYaddZDYjlzWrMFX0RhIxNw8pEl1N8ItqaiCGjeYdcit2514aQx/5ZSuvm0ESFj9702k5lBLsbrAUw1epyT+g=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypnZ+V0bMAlD7WQz0QzX1BLplKubUzy5Rb/Rgpqi5lMeLaJPqAs/lSmF2JHJwPeGbqO+ZrQg0e3JO0C0ucJLgHWOehVcu172WujTUzGLO1Lw8sHE5lIM2PxtUwbkdpLegXntHadLUqyGUbQT1jcE4w4e8dbWY/cS0B31eqtodmEZMMvK1myBpdF4FBpzydZwEREjk9vmOUT8a5qrl3wn4tIQuzYC6uWVtlXzY6hk4OqZoy0RnKALuF26tmitVxCunxwCM9a1/P505z/GAlog8F6D/lT1sWEHLS+Zt+ROXppgLOb0DMRxGjLelTRyc97ejEqocyGZQGeG/OpfYHx2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt8YGRTgOzbJvuOGpCpVdrbfjNF6ABBvmPIXwcKd+0w=;
 b=fnAzBgE7Z3ivbvHVC7TKF0NEEw0Hl/PvmDe7zj6F8g5wq+YYU/unBfj7yS4X0Js0GWespOUQmNf6q8TpiL432Lt5HCmOXTePw06FZkFJYwJgZg8m3Mb78S10AgwSIrw2qERnr5FaFdRaXn/JO73kTAekFyn9KMjXfWMhj0uZoGyObuPcH/1enp6bodvX674gH8TMOggZg50piz1DPwCs38MtX40T+aC+KTmWTSUSH4voi76uFqkJQBoK4PVdlwAjgvtYFUymN7kTXomacXcMK0KQJ8r49p19I96mHO6xjCmftBkm0/5AsagKLODAkuNXzQwS707c96H3JCezQAoIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt8YGRTgOzbJvuOGpCpVdrbfjNF6ABBvmPIXwcKd+0w=;
 b=JUoIwKE8OXG15od8nGa9U221hu1GRk9+bLuaRPIhthGswWD/Oq63Z/ze8QK7oHInSNy+VPAQb0CnbqRvdWINW+jC9DiKH6dUVKUXO6Jy+Q/q4lQduEDCu+F4WA8h3hdVEQKTHzPU/XusZ2PBKwa/Zh46adVeXyLD7+xi87NMrHc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/5] xen/arm: mpu: Ensure that the page size is 4KB
 (arm32)
Thread-Topic: [PATCH 1/5] xen/arm: mpu: Ensure that the page size is 4KB
 (arm32)
Thread-Index: AQHbdzpqtIpuo2GIUkyMVN0/alLW77M6WgmA
Date: Thu, 6 Feb 2025 14:35:07 +0000
Message-ID: <FDA88F80-DFB8-44A2-AE6E-F8F6DFC899DF@arm.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250204192357.1862264-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|VE1PR08MB5773:EE_|AM4PEPF00027A5D:EE_|PA4PR08MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b6a728-266e-4c0c-1d0c-08dd46bb7bfa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Vvky/60bWj2LlHw0Lc6cvcGvrfutgZ0vS+rhwL/gkSbPaNJCMoxZ+R/mE/GT?=
 =?us-ascii?Q?Eo//zk9nvNer9hNvDH5xFA2Nb7VUFbemqm7ZXwnqwfkwG9Ea3ePdLlVXcMma?=
 =?us-ascii?Q?C2FNOsOd501+4lCs0UIW7HB0OjaeXxXqxF3V0Bl8r0mzQ0ci1WTk1CfesC93?=
 =?us-ascii?Q?cPfxItNrFVV6Df5Sgi8gFL8aOAmQtKn0pbzobk4CfERpZmE5Gm4MaunajVLG?=
 =?us-ascii?Q?7qvD4U3gfBL/WD6R+HRUN3jWyjpvk/m3Lr0nyc1fzrM7eF5TTeAk+KOZIXe1?=
 =?us-ascii?Q?UWDRSMlhW+42/7dJu4sdYNMYsw2msoXouqujjQh8tG44SpziSYu9f6Y8DYPp?=
 =?us-ascii?Q?3ojljQStruGmtnf/wyw4JdsS/tw9AgA2qVrfeZHoMjGMMrRq6NrYWSgsLbdh?=
 =?us-ascii?Q?mfEXLLIuRytko28Zq1epCWfRwlDXE01GpzU/oygGgbXfByHTy7GNYaG1t2BD?=
 =?us-ascii?Q?LYFgmnNqHRHfcDIXCHfYylKO5VrGfV8/TEuGf74I6/vHVzdVtaS78U+qgb3J?=
 =?us-ascii?Q?kPUVtcFyxul6ar2t1VRNlWqBQU8RCzaL2NHbQnuZ0sepS6sMo3KDyW9iwavR?=
 =?us-ascii?Q?yqN/eeHGG0Rhl789+3WjFkC9iuO9D98ZKb3aZpeftdkpKcJUb/x8F9RAzrPP?=
 =?us-ascii?Q?v/qubelvi8XSXkGKp6YKmeqiPpr6WLc30DILTBVyK25BhGkrMg+B3kwfnQ8J?=
 =?us-ascii?Q?j3Ii/4B/zSGixYPeYEWD2zYW8oHWj806K3qz7mlruezNl47jed3TCzmVmcuH?=
 =?us-ascii?Q?bTCD35B3LSQ9CfcUosMn8C2do6aIGJ4fdwJ+5m28xckSP4R1op+jfPj5xT6u?=
 =?us-ascii?Q?N8Hbpb9Dx2i4MTO/N5mroPcvwVU93/fphX9yumGTDMWWYM2kPw8am4xCZCEB?=
 =?us-ascii?Q?4a85Ke7j2eTuaXuy+qYX6hFukc8X1XZXZ0/aF9M05FQ8HV1O56VGS+ciJHm3?=
 =?us-ascii?Q?6/SWNH+ceZR0QhhdiCtzsxEwYEnEBcmE02/4QSXAZRYnRKYj7MTdnv3dbgWl?=
 =?us-ascii?Q?Ps71WzSd/axoTDGi105vxbNIBcBwRxOcFPKEREAOFYfJcYRr05qe50OU/ryo?=
 =?us-ascii?Q?tyI68qBUXc2RYte4cXdoR6VEYwc+ek69/A7LXLnMakXJhAnLzM21cPDcdTVe?=
 =?us-ascii?Q?q7Y44YugOZpIm7zzS+XFhzlnoXddUQ8tWH9sxLopCFqNKiuzxB89qJTwWiFl?=
 =?us-ascii?Q?DvQpTiWw5iaoxd/yJE5ojtawT84rLiLYRz96evPSVsEuvMyyDp6l5wCu+qCS?=
 =?us-ascii?Q?3hCRKeSa7kU0G812yvpxvAtlLM+vX4b0CICCTl4JpvZHctRJFZUl7UyoFRTn?=
 =?us-ascii?Q?1Ov8Ny5qsty8/yMaLNrDJer3S4w9jJ7A/nQhkD7ht1HikEWPOXxdEA9TjUQS?=
 =?us-ascii?Q?Ss92iDyc9TLxP+et5kxjSynoizabsd3hv4dLBMLlSbBNfobcYMcu+5LKE8s5?=
 =?us-ascii?Q?CifO7/+3qc+CRzPN5dgp97AJKwAwzaUZ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <892F562CB186F24992E05A7606DA7876@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5773
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	274efb94-1f62-4029-33df-08dd46bb73e5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700013|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pIF3tOtsrZBtW/7zfiaJnt83QqWvb/4Q0pzst0eojMA3E/N3YEW8NJ4i+qm/?=
 =?us-ascii?Q?HFdqOO7ivzAasgssDL47U8rfUUmP2ikgfssb4wPIUz/C8gkVA7yILDgsB7GR?=
 =?us-ascii?Q?MPgZYoBY/EFYr1KiV9XmRZPHGHVtg5waSGHkBrcie0jYvzh/WDiS0xMAHnPp?=
 =?us-ascii?Q?SbLfepEPod8lo00mFpAG1bB2Mg95jgh0ZgKh6M/vODQyBkQRGtYRd64z5xyY?=
 =?us-ascii?Q?2hhK6zMZakzuvFdfRCqAQyM9RIszd3AHcx5UlLR9LtQFHuCKLfTuNUOQbb/9?=
 =?us-ascii?Q?wD/AIZDOdzRSgQnghPc0YGWcHUBVo0kGGmHpNTnNJ6yDNDfVC8Hcke5dCqQD?=
 =?us-ascii?Q?6jaFCqYN/TiTm7FfhkqzaM41Upz/GZMujZxyu8Jj6iOXzjBwrXKRLMTHkimy?=
 =?us-ascii?Q?w1kb9pbpjI9v2nVMM8YvwlGHotNknmyFsRuNI0+b0phNEuaRspVYUoVl8wnz?=
 =?us-ascii?Q?y8xpV2Sm9s1dfCTFCTuuVpy3rs1zfclSudFP0OjSAmCPU8rpdmnN5EI7g6C/?=
 =?us-ascii?Q?Q6RoZfHBx6LOVnpyHgYGRqhhK7zsp7hsXRoKdABuVDmCaophmAykY/zp1vBV?=
 =?us-ascii?Q?dx1m2RqdllbOXlCSGevwmhVVYl1/0K9zw70TLVpEsKH3/BuQKPTVk4wDQIR6?=
 =?us-ascii?Q?NYIU78Jy7TvEl5BApET04LZnYrwJ1zTPNrsxhdDHL8M2MCKKYl0Xjfq4PRGr?=
 =?us-ascii?Q?W4atpV/UBaEUBrLUBWcNZLTI6JBLzfmrdIM5hMkj+u+xXngUn5zPuHGH9RV5?=
 =?us-ascii?Q?wQG68MFYRTts4/DDI05SKH4XvzxMxcbSUne/dn7CKsK7yQn2myWNChmA2OdP?=
 =?us-ascii?Q?JtLFzZboSABdbnMLLNnVUGokQc7+5bDvLsAtkpwKXDbUDc9oP1tyrDl5dHgg?=
 =?us-ascii?Q?hagGCtEJmMii5bEF7HvWlfaKPnEAIc/x0BXb1kPvek4gIw9eidFIoKL5Kt6p?=
 =?us-ascii?Q?PTpbEMcbRHg7oKyKgYhgP90XiI50sVKnrnNvgqOVaC4C06CHcx4UIi1jxveq?=
 =?us-ascii?Q?rrASxaHtoyEnBxEYINVK1zl6tTRlPDvXWboWB2NqaZTNPk8dtWDOrTaD19+y?=
 =?us-ascii?Q?afU72ecqPAjtjDpzNzkMk5zmMQATnyG7zc+YKfYpsb78Ma1W5heUh8uUGpkj?=
 =?us-ascii?Q?IKXrYSbNwGk9SsLQxF26gIcBtOFglPcWNfGCV6RmVlEXu+dFyn3l91Oy9909?=
 =?us-ascii?Q?h7uet20TGDaMtgA24RtJkbp/R+Y9xDjhcWlbk04Sb+HSDmoL+ppAVcin/Pwz?=
 =?us-ascii?Q?7XGj4DDHL4GEdQ9tRWheHdNdlbg8Wkn8K0O7DHMZwo8ZuiLaA/BUxS/r91ga?=
 =?us-ascii?Q?1q/03E4xAlERYVbiHRQlChDKYG3PH3mXX+b1+aNApfV8uoOC0On93jGr3k/Z?=
 =?us-ascii?Q?fvT6F3jNSSk4kazh4UMvrvKy6TXiEOqIOqD9SzBUGLLblF3JRUxAwHshk3UU?=
 =?us-ascii?Q?Eln54REDOwLFaXuvqvRx443k8T2xycJLV3UPsUz2fzQZNwxL9eK+qy09ylO1?=
 =?us-ascii?Q?rXzNRXvoS5G1ORc=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:35:20.8827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b6a728-266e-4c0c-1d0c-08dd46bb7bfa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6160

Hi Ayan,

> On 4 Feb 2025, at 19:23, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> Similar to "xen/arm: mpu: Define Xen start address for MPU systems", adde=
d
> a build assertion to ensure that the page size is 4KB.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

This looks ok to me and in line with what is done for arm64.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



