Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCAB95C66F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 09:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782177.1191654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shOdN-0000NP-Q7; Fri, 23 Aug 2024 07:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782177.1191654; Fri, 23 Aug 2024 07:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shOdN-0000KK-Mq; Fri, 23 Aug 2024 07:22:57 +0000
Received: by outflank-mailman (input) for mailman id 782177;
 Fri, 23 Aug 2024 07:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jBOo=PW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1shOdL-0000KE-ON
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 07:22:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f403:2612::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8258a895-6120-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 09:22:52 +0200 (CEST)
Received: from AS9PR05CA0078.eurprd05.prod.outlook.com (2603:10a6:20b:499::22)
 by AS1PR08MB7658.eurprd08.prod.outlook.com (2603:10a6:20b:479::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Fri, 23 Aug
 2024 07:22:47 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:499:cafe::3e) by AS9PR05CA0078.outlook.office365.com
 (2603:10a6:20b:499::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 07:22:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11
 via Frontend Transport; Fri, 23 Aug 2024 07:22:47 +0000
Received: ("Tessian outbound 7d86ec5dfeb5:v403");
 Fri, 23 Aug 2024 07:22:46 +0000
Received: from L213838b8f558.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CA48648-8AEA-4A67-99B3-7567CE5DB143.1; 
 Fri, 23 Aug 2024 07:22:05 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L213838b8f558.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Aug 2024 07:22:05 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA4PR08MB6061.eurprd08.prod.outlook.com (2603:10a6:102:e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Fri, 23 Aug
 2024 07:22:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 07:22:02 +0000
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
X-Inumbo-ID: 8258a895-6120-11ef-8776-851b0ebba9a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PbAcVGvljX7io9VGsXo47xXAmBAjc1enXDc9M4JzEsxqnoEpREkXi/wP/d/NnPXW7nWcxouO/ifid7D621wei2FE3YCCdjdgkQR66c7Zic/dLnQTab7YQ4+NXo+cDWt3spuXgLjmmw2pAcxdzZRFOuLfAS+r35jMJnmDzMgMaGC1FdgQyQ8kgOJ9oeU1h69i8jOl3ah/06XjWxyBSL4m14ARc9bmV9smKEwh11iH8S0rKNJFZUYJAdgSOZ8WpZBt79GE56oVK1N+++uvky1J0LS45Vcjt6DVhkQIYulEtI80rGa+mIAXLi0iqjCK+zWM8nVABrujVcj014U3kEsrpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hGzt4cutWk9HQVuYquuOv8AS/JhqBbPZklOWcgKRbU=;
 b=mEJKp13kTb91RT97RUKTFFtX49r8cjHSJWuvSKlWD1VokWPMJ13yJqaMZpGCFnDVOi78/AIMMVfRlC17NplQ0r2G6h8f8wk2kUx8jpZ2AIeG7omzxyreqW/gSdKXO15lou1wQaLWffLT+Ll8Kz05TrttcI3/dk9YAG2VjamnwRX8fXjCw/6EdHZNpZF7ZXaNlNpBl4Jy8gdy9OgFrS6eW2EWlic78oFGRLMI2Km/ApGgudj0vleXLWtXcS5ODBa6VX0wWMOMSHTp/2tIYTwdnQnIE7o42mUcWT9d2nFib4jZBXTh7PNmY7j7zmBCFg0UAhquO81bA7mOERp+YONshA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hGzt4cutWk9HQVuYquuOv8AS/JhqBbPZklOWcgKRbU=;
 b=n/V5PQT/2L24rh6kK9n08ktMtzy/E83a//zRsmCN5C7zF8MFMcOBESmT9e8tuhd/y88uLzkriWhHuRQV0g4iTLMuwv+6YDkpAfeW8FsxG6GSAj7nn/wC5QG18f8QSLufddTVqbh21LoSxJwgDirmUkzmVGAzIGWC89LfQYWjXBA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d45208716cd4d226
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siPq77wH3xgP20lSctqlv6c2laJsN99QvKgF3oJNGbu1LIuUarVJikUM20ohLAmL96wRRCSp5H+EUDnaa7iWpQnlwObydKuotBuFrjUupMMC9dNRWqevyjic6JuFQY/PLQmVf0jZO6PVFcWlgk2itxodlmIUEWqWodG/84AmAAcSaRJXNzK3xSnYmXi+m9SfDhBwyR978B/OysijwCxtjU4sYhESyCIM4fbicYrIaI1bK2K2TRnQg1nT18rbUyMH0JiE7PtghtRkLY81m1sQZeL6DLCcJb1OhMaUpYusTrtwDtfhb2Tq0sRzjXGawGxJudKkGU3sSLg62jh0O/fhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hGzt4cutWk9HQVuYquuOv8AS/JhqBbPZklOWcgKRbU=;
 b=XBzRuIxKiScaVw30INJJ85I0krZOtwly6inElkM8E1zcP+Uec+hXjKfkussZeC262l9lX3VfYRMYPC3tjSN+VUh9umh6z6ZJi6RToSbyJJbSyvZdUJrtz+RoDFjNKagxT+hM7UnK4dxbnj5A8nklpf/kBB7pwB3tPSwMf8VDNRkRHRI+jSHrRyn+DSdFu7Nh89rcZV9HaIbS3Icv8oY55ZUthz8Xy7ndft8VhtCyaXMXSKAcWKIRNxiq7bjAOr4udz0zC3CsQYBKLQMCt2oE9qNwSNyRNCcNFDmOEL5mif7dyxgbBLvIIZ68SkecTGL0QJ5L/ep4myayiuI0a5/IeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hGzt4cutWk9HQVuYquuOv8AS/JhqBbPZklOWcgKRbU=;
 b=n/V5PQT/2L24rh6kK9n08ktMtzy/E83a//zRsmCN5C7zF8MFMcOBESmT9e8tuhd/y88uLzkriWhHuRQV0g4iTLMuwv+6YDkpAfeW8FsxG6GSAj7nn/wC5QG18f8QSLufddTVqbh21LoSxJwgDirmUkzmVGAzIGWC89LfQYWjXBA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for generic timer
Thread-Topic: [PATCH] docs: fusa: Add requirements for generic timer
Thread-Index: AQHa8u0jnfgC5boSJE+t9AfK5MrS+7Ix0ZQAgAEsHYCAADb0AIAAiWCAgAC2X4A=
Date: Fri, 23 Aug 2024 07:22:02 +0000
Message-ID: <9DA45539-F136-40D8-BF46-E63EA1B8ADA6@arm.com>
References: <20240820103816.1661102-1-ayan.kumar.halder@amd.com>
 <5F0AF572-3437-4372-96EB-42F46B3A3155@arm.com>
 <101a7105-5638-4c69-a5b0-29c252284aea@amd.com>
 <D3358591-F9E2-44A6-A22A-FC2AA8857C68@arm.com>
 <alpine.DEB.2.22.394.2408221327400.3871186@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2408221327400.3871186@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA4PR08MB6061:EE_|AMS1EPF0000003F:EE_|AS1PR08MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: b2819b0a-1927-40d2-6cd3-08dcc344634b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?YgoJg1ZLp/g/47rbCuzb8YfsYr4B4Q/qQzagWCN3VD+mRNpRKky4ryZlj1oA?=
 =?us-ascii?Q?ISpc+2yyqeKGJpbvEfVpVaHUNRXuMr3XP7g+sXTJrrLICZm5PvFW4NiGK2o5?=
 =?us-ascii?Q?ULqGpjSOVnJ9pBxxhXbqe1RI8ZR+aKJO77N0K0jCLEiND6XwFLei+XbGgXPH?=
 =?us-ascii?Q?GaIkinxfp9nsA7/Rk03Hy9UYENCv3TTm7sG960jvagtMspZTamNy9iITn4xp?=
 =?us-ascii?Q?/eF1O9U0d243Dn+MFDYt4urIpDNjGnNctmju8lfp83t1DWv0cZki/wfVJwjE?=
 =?us-ascii?Q?jDCaDVHOFJsioRC4oCiTMmjbk/5ZwUljs8nDGc09bVHJFXQMXaN945oO6IHi?=
 =?us-ascii?Q?lB5eGGsicT7+2bSDmbhHSsL7NSDCldkCne21G3B8UtkQkjzSplRFtFFeT4cD?=
 =?us-ascii?Q?CLLs1+TrfZqu9Mi9hBP3G65ZH6iSm07EzhbRCNxU0aG1yX6ux2dMB6u6Wu5t?=
 =?us-ascii?Q?ysVb6JWTEtmYwMOPVrCHthKqrg3vdLJ7Gd5ebceBq7S+voblQAut4LOzPbJD?=
 =?us-ascii?Q?ttStXqAebsqlHbOyz9fjv27jCj5dJHZ02Nxj8D4QglTH7XMeLp9RTkDOkhF5?=
 =?us-ascii?Q?g2EvRqHgoAKCNMATQMMCG1qOcPg34fMGj1OClhcY3uqHFjCQR6VlDgCxYle8?=
 =?us-ascii?Q?faqbXJea9oQuMfYxFDzccX83tCxWOJcoUGSMIr8dMbZTPSqsuwOI91Ej5KV5?=
 =?us-ascii?Q?wO/zHFsvH+0pY4ErGEs+bMA3x6DgjYKbaV1lqrYWy7hFOzdc57GsDEQEIHTQ?=
 =?us-ascii?Q?7VtqfNCd+2CHEUee0CVAhtbb+W/wJSNi4yxGoGjTkH5jS4hWs/6m25791o+X?=
 =?us-ascii?Q?H+kcqh+tJLjuuEugeujXUWUkYE6WahOO+j8euBLOVQB0GdXVAhv9URFiLW74?=
 =?us-ascii?Q?dJxybzKacr8w8j3lLjwpOTW+XNLecmaNtzucwBk35LfbRUKmtc/9VC5Gg4zR?=
 =?us-ascii?Q?hsnEqpZpn2LP1lpb+V2Y52bGLkA7uVCpQCahm1CNWbuIgfe/rINzMBoYN5Cl?=
 =?us-ascii?Q?cwm309ZYFHKY3dHRJVPaf6GM4ttueSjPRZh1pUpQezA8I0G1mPdaxqe6+N3T?=
 =?us-ascii?Q?kehPS2ldW9O6MwuP4g+CmtQY43uC/TECNhVo+/9y/0hY/9sZOYjjkTpq7vl4?=
 =?us-ascii?Q?Haie9F8SdthephwZeaYvGaWSzyeBxQuvNk9htMSFEfsv7Cxl9AdRYpIiWjy2?=
 =?us-ascii?Q?2KDp9q5CfeRyqvR1xSPF6NFI6yJHbkWSKbgeSfFlUG9JScG9Q5VxPCw0ebfG?=
 =?us-ascii?Q?kIgHzZP82bN7/zU34I9/qo2BveFVNGlWxG4p+r1hhoeqZidHz4DkXj9m7tJT?=
 =?us-ascii?Q?q7uvY6KaSBlkf0KIt/ZVb+EsOmCRYRUAx2+Q3zHhSNvLU0N8pjIhl2K7RHW2?=
 =?us-ascii?Q?qw2Y+Z0VDAwwwVbzpcPlwqg5Bp54eT8GhwZckNXdX0dLdRpFPA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EC717A4836AACD4FAA7F77FAB3CCBB23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6061
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f2a8627-114f-4184-7423-08dcc3444877
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yDHiGi4cSOKvq8nlhL0PmEXXSfz5dFaw0PW3KtohM5gZxHARTG4eGMgezLX1?=
 =?us-ascii?Q?d5H3mtoNmLLXm7HaJxc40KEm1STO4JzVmzWH+gu6aUQKVUiWauMDDn6g86VA?=
 =?us-ascii?Q?1skpbQyd7Fit0EtyOtTINo9UhQpUALrQONdQsuV2zAnM76Gp9RulYS+nihAn?=
 =?us-ascii?Q?HNsZVt3rCCOYewvTpNwVf7TajUrlTnf/lCgAmXRXCJLsYCpzXd76seVUB9px?=
 =?us-ascii?Q?3c8X9sTEPEInLTPc64Nxk/8q+lPNJvmVT4Bf++sbYoUJ83q0NI76mt37qGaR?=
 =?us-ascii?Q?c9rfFnVm+5U/Sxen+y1MQBA7/IKu28y7ZQf+H09kSGl2vt1PJ3+csiRzIf3b?=
 =?us-ascii?Q?zVjiBN3AmpnjI93Fj2Ewhe8LpDqh/zxZlM77WsgLgB7+3TYrJrK4S+08nhBj?=
 =?us-ascii?Q?u8Ud2AV9WxoChGDgVFoDC4aeWAxj0lR9EweVmC1He8cmX1hWyFynVDvV7fSE?=
 =?us-ascii?Q?33m4SCrn42nWHZcxxhM8Kx9ZUSiYRe6fZes+2NQhMfQHWhFjjX0biIR+/Bfm?=
 =?us-ascii?Q?ZJhcAeIIO2xMa+uv4guN0O+ZnqjoACaO/XaN8CH0yLNB+Joxj7Xb1cy24V1a?=
 =?us-ascii?Q?0LvBIq5I4Ivm98OJKREgMHz/niuMWa6uo/5SllaQHd3+5XdO2polIggToorr?=
 =?us-ascii?Q?OhYW4nm68hEKd/uCpVyhINgH+XHflmwS0iS9M72Jg4vgidgzS8RoKXDtrUlN?=
 =?us-ascii?Q?VEU1XGL4H4PEyrCgeHVGdiBbrlhAbFU3YcnDQhMobvterivypdVn23xNdgqf?=
 =?us-ascii?Q?D3NgYsp288eR6txKXfEatpLUTi53FydapawC8kyA82yrAl+d9wwTJNOP5Jbr?=
 =?us-ascii?Q?5VXUAvxG9k3fAXoV83QT4RSnnyhSwYn6nNZQmEl5N7FILW4g9lDMsLg8aX6e?=
 =?us-ascii?Q?MLvJfE/ij0O2tjKGwRTgG1jGFsNyMTCx+BtFIXysJz4OX1nr1A2D41dLPS7W?=
 =?us-ascii?Q?MSZSvPok1mD+oc9jiP9lOh7nk/mman8UceY2rnua2mvav6s4P6ZulPwZ6hli?=
 =?us-ascii?Q?xO3VqzjBV77oY3rSHaaXTF5SQBdptrNcyM3kKbt8yhqqdjHsE8RWVtpO+JTJ?=
 =?us-ascii?Q?kZs6FAwuFTvPF2yeWRNa8DJfwXXaK9nfYSh835h0GlhK/SX2eVHiC+fPhYq9?=
 =?us-ascii?Q?Qjq1bwHt08ffcr7lSEXsWCFpAyWWiZev8dQpfhf5hhOSA4tSb+wMumJCzzUV?=
 =?us-ascii?Q?mIcyGOAYlm4bAON3CT6VJ3i15zUxt/BwMcuiYW2CDWr0jFJhhkajWF+VvpSC?=
 =?us-ascii?Q?aX0P/kc9KMpMxGFzCntjFhdjOV+YC50CCTQO4CrbxonO+HvWyU3zTu7DZmKb?=
 =?us-ascii?Q?qdmfxbYc96r/3xNuZ/d55oA89HrO52tkMj6KkaUwR/PJkTw9FSYqz44wE2fe?=
 =?us-ascii?Q?DWdPTTCftIYoOpNDgpOXmO0OpBIE2c2TMeUGlNyBa1kvph7+WZ04onqVXssZ?=
 =?us-ascii?Q?CT1QcDdloPH3a1MgpsXsqnXfUpXxkQ5n?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:22:47.0222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2819b0a-1927-40d2-6cd3-08dcc344634b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7658

Hi Stefano,

> On 22 Aug 2024, at 22:29, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 21 Aug 2024, Bertrand Marquis wrote:
>>> On 22 Aug 2024, at 11:00, Michal Orzel <michal.orzel@amd.com> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> I agree with all your comments with a few exceptions, as stated below.
>>>=20
>>> On 21/08/2024 17:06, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>> Hi Ayan,
>>>>=20
>>>>> On 20 Aug 2024, at 12:38, Ayan Kumar Halder <ayan.kumar.halder@amd.co=
m> wrote:
>>>>>=20
>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>=20
>>>>> Add the requirements for the use of generic timer by a domain
>>>>>=20
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>> .../reqs/design-reqs/arm64/generic-timer.rst  | 139 +++++++++++++++++=
+
>>>>> docs/fusa/reqs/index.rst                      |   3 +
>>>>> docs/fusa/reqs/intro.rst                      |   3 +-
>>>>> docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
>>>>> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  24 +++
>>>>> 5 files changed, 202 insertions(+), 1 deletion(-)
>>>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>> create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
>>>>> create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst
>>>>>=20
>>>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/doc=
s/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>> new file mode 100644
>>>>> index 0000000000..bdd4fbf696
>>>>> --- /dev/null
>>>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>> @@ -0,0 +1,139 @@
>>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>>> +
>>>>> +Generic Timer
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +
>>>>> +The following are the requirements related to ARM Generic Timer [1] =
interface
>>>>> +exposed by Xen to Arm64 domains.
>>>>> +
>>>>> +Probe the Generic Timer device tree node from a domain
>>>>> +------------------------------------------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_generic_timer_probe_dt~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall generate a device tree node for the Generic Timer (in acco=
rdance to
>>>>> +ARM architected timer device tree binding [2]).
>>>>=20
>>>> You might want to say where here. The domain device tree ?
>>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +Domains shall probe the Generic Timer device tree node.
>>>>=20
>>>> Please prevent the use of "shall" here. I would use "can".
>>>> Also detect the presence of might be better than probe.
>>>>=20
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~emulated_timer~1`
>>>>> +
>>>>> +Read system counter frequency
>>>>> +-----------------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_generic_timer_read_freq~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall expose the frequency of the system counter to the domains.
>>>>=20
>>>> The requirement would need to say in CNTFRQ_EL0 and in the domain devi=
ce tree xxx entry.
>>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +Domains shall read it via CNTFRQ_EL0 register or "clock-frequency" d=
evice tree
>>>>> +property.
>>>>=20
>>>> I do not think this comment is needed.
>>>>=20
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~emulated_timer~1`
>>>>> +
>>>>> +Access CNTKCTL_EL1 system register from a domain
>>>>> +------------------------------------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall expose counter-timer kernel control register to the domain=
s.
>>>>=20
>>>> "counter-timer kernel" is a bit odd here, is it the name from arm arm =
?
>>>> Generic Timer control registers ? or directly the register name.
>>> This is the name from Arm ARM. See e.g.:
>>> https://developer.arm.com/documentation/ddi0601/2023-12/AArch64-Registe=
rs/CNTKCTL-EL1--Counter-timer-Kernel-Control-Register?lang=3Den
>>=20
>> Right then i would use the same upper cases: Counter-timer Kernel Contro=
l
>> register and still mention CNTKCTL_EL1 as it would be clearer.
>>=20
>>>=20
>>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +Domains shall access the counter-timer kernel control register to al=
low
>>>>> +controlling the access to the timer from userspace (EL0).
>>>>=20
>>>> This is documented in the arm arm, this comment is not needed.
>>>>=20
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~emulated_timer~1`
>>>>> +
>>>>> +Access virtual timer from a domain
>>>>> +----------------------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall expose the virtual timer registers to the domains.
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +Domains shall access and make use of the virtual timer by accessing =
the
>>>>> +following system registers:
>>>>> +CNTVCT_EL0,
>>>>> +CNTV_CTL_EL0,
>>>>> +CNTV_CVAL_EL0,
>>>>> +CNTV_TVAL_EL0.
>>>>=20
>>>> The requirement to be complete should give this list, not the comment.
>>>>=20
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~emulated_timer~1`
>>>>> +
>>>>> +Access physical timer from a domain
>>>>> +-----------------------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall expose physical timer registers to the domains.
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +Domains shall access and make use of the physical timer by accessing=
 the
>>>>> +following system registers:
>>>>> +CNTPCT_EL0,
>>>>> +CNTP_CTL_EL0,
>>>>> +CNTP_CVAL_EL0,
>>>>> +CNTP_TVAL_EL0.
>>>>=20
>>>> same as upper
>>>>=20
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~emulated_timer~1`
>>>>> +
>>>>> +Trigger the virtual timer interrupt from a domain
>>>>> +-------------------------------------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall enable the domains to program the virtual timer to generat=
e the
>>>>> +interrupt.
>>>>=20
>>>> I am not sure this is right here.
>>>> You gave access to the registers upper so Xen responsibility is not re=
ally to
>>>> enable anything but rather make sure that it generates an interrupt ac=
cording to
>>>> how the registers have been programmed.
>>> I'm in two minds about it. On one hand you're right and the IRQ trigger=
 is a side-effect
>>> of programming the registers correctly. On the other, these are design =
requirements which
>>> according to "fusa/reqs/intro.rst" describe what SW implementation is d=
oing. Our way of injecting
>>> timer IRQs into guests is a bit different (phys timer is fully emulated=
 and we use internal timers
>>> and for virt timer we first route IRQ to Xen, mask the IRQ and inject t=
o guest). If I were to write
>>> tests to cover Generic Timer requirements I'd expect to cover whether r=
.g. masking/unmasking IRQ works,
>>> whether IRQ was received, etc.
>>=20
>> This is true but i think it would be more logic in non design requiremen=
ts to
>> phrase things to explain the domain point of view rather than how it is =
implemented.
>>=20
>> Here the point is to have a timer fully functional from guest point of v=
iew, including
>> getting interrupts when the timer should generate one.
>>=20
>> Maybe something like: Xen shall generate timer interrupts to domains whe=
n the timer condition asserts.
>=20
> Both statements are correct.
>=20
> Michal's original statement "Xen shall enable the domains to program the
> virtual timer to generate the interrupt" is correct. The timer interrupt
> will be generated by the hardware to Xen, if the guest programs the
> registers correctly. If Xen does nothing, the interrupt is still
> generated and received by Xen.
>=20
> Bertrand's statement is also correct. Xen needs to generate a virtual
> timer interrupt equivalent to the physical timer interrupt, after
> receiving the physical interrupt.
>=20
> I think the best statement would be a mix of the two, something like:
>=20
> Xen shall enable the domain to program the virtual timer to generate
> the interrupt, which Xen shall inject as virtual interrupt into the
> domain.

This should be split into 2 reqs (2 shall) and the second one might in
fact be a generic one for interrupt injections into guests.

Cheers
Bertrand

>=20
>=20
> That said, I also think that any one of these three statements is good
> enough.


