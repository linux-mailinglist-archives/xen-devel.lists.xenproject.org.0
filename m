Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E5986CEB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804956.1215950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiMS-0006Un-Im; Thu, 26 Sep 2024 06:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804956.1215950; Thu, 26 Sep 2024 06:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiMS-0006Rm-Fo; Thu, 26 Sep 2024 06:52:24 +0000
Received: by outflank-mailman (input) for mailman id 804956;
 Thu, 26 Sep 2024 06:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCv=QY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1stiMR-0006RN-0r
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:52:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2613::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ba700b-7bd3-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 08:52:21 +0200 (CEST)
Received: from AS9PR07CA0033.eurprd07.prod.outlook.com (2603:10a6:20b:46b::19)
 by AS8PR08MB10289.eurprd08.prod.outlook.com (2603:10a6:20b:636::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 06:52:13 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:46b:cafe::ec) by AS9PR07CA0033.outlook.office365.com
 (2603:10a6:20b:46b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Thu, 26 Sep 2024 06:52:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 26 Sep 2024 06:52:12 +0000
Received: ("Tessian outbound 690adfc84afa:v465");
 Thu, 26 Sep 2024 06:52:12 +0000
Received: from L0a0614e03835.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3219FA43-834C-4203-A421-D58525E68890.1; 
 Thu, 26 Sep 2024 06:52:05 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0a0614e03835.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Sep 2024 06:52:05 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9771.eurprd08.prod.outlook.com (2603:10a6:102:31f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 06:52:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 06:52:02 +0000
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
X-Inumbo-ID: e0ba700b-7bd3-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tXuVr/YWGAXcI2FqufdxGKeEdc4SNdiK3fMdFX96bW1IvRR80pfVW7FjUEMtLJCbL7miogX47T2JpoTN5vK7YsmTlDX2cCgK8OFZOA63kLXsYhuRggIfwGA6zczjjd5yTY+r9Qr/pZJO+bToK2ND26/FXgjpA6zZyOPz2a+kSZm01sobCYAAfTDkp5tUyU9beswQvpyYlOVKoEWnd9SADf4u1TJ/lPdFThoGavUG8Nby4SKUn6xwjE7CpjLfYWmaZLLtnb7wJ5jXsyCEAjA0Acl/RMvLbCoeLN9ce232XKBYe2YAGRLiftpdkMWpA3AuFDXMzMxFOv5ObXQdbhMwZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZoBumWpKVDl3CP8hE2LKUBjGpYx59LLCGVSa9l2xns=;
 b=LraaEICq6u5Bjt2UfSFAs8kzqKzM59M1YzDe/2b/+fqDPriSn1IvM+37gfe8KgXhHgCwkJaxRRQI+UpNoFPNPGv7hnz7jYkJGwo4PNgnB9BSc64iMh4Z/DBtFlhpySuPVJ+gVIr1Eis75sqnhBTuYd7fdwOwa+//KwfwMpjrBu98Eyok/sk+XPYbBUI+klG1mO1+FkPjY6mUHZ/bXSdD0ncysHzNCR8YJ8Giheji3TW7vTnwBG6qwTnBc53X+WFJFDpIssLSFsAZRWVDP1u5ileut+3iV7hvOGW7kOSjxb5VYvfLF18sdgjG5/6DE8OJIP03vF6yK0ps2Mg86+XJnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZoBumWpKVDl3CP8hE2LKUBjGpYx59LLCGVSa9l2xns=;
 b=rYf6DCcAHG9+QPqOjvI0UBxiOY/VCWig4O9RawGnDM8XLpmW6adBGGetqrroFPW4F9v3Yh5U50njFYeV0WQJF18QZWVvk8gf2OVCujVcuHaJxWsW8yV/2P+9txNmr3KPtVQ3XB49T9DH2n8ZqOsiqB+Tw1txLI6tbWQZAIIdg+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53e66a2b922b6c92
X-TessianGatewayMetadata: C0zghvlDTU2Tnu0+4SUCiHfwyKRYVdrW5k5xSeYEBlJyMbI2cN8xwWJNtRVqC1E5c0WLnYR3Szgtn+WN0H9B37ZpUpP6nb1JQAuJf2MoH3IGXcJZeYI/qCC5yRjrXVyjVD+SUj58T2z/Pvhn4eqjGee1YSixz0C5cy+enAVslDc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrftyxBPjTMU1PdLDky5RwDUikyhewPOJm/nq21GPRNCV3fOgUvJAAApv/wFKL7MSCOh0IJ0csmllFgjQr8bbTxxWbImPI7XVrvq6Sn9IXnNbckSxf+SmrMhlUE9NLKdpEg4r5xTGI8FAiGJPNjT1tynBJAMvpl6V+LTdVMKAvJ6SJ6BdWZnVO8ma7/vlxS5NtnFMd/RwQhlZ3F2E4XJGHwXLoh5cdYrshwJeoQTJtNRzo8Kj+bZvT8nz4lXLXTIfbqch4qdXDIeKxQzitjFN7BcYvoJbAFb9CdZkS2nllaMn1r0woWleW7p12neQ4YSgUGQ5hJTe0WyGDxlk834MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZoBumWpKVDl3CP8hE2LKUBjGpYx59LLCGVSa9l2xns=;
 b=VBcJXbOY7ccVd0RZSgXTrM+aBTCAOsK1MRXG8i8LcZOqFAul48NrsDJnTOY9K+4tIzDk15IhivJ19uM+oHZoPBF6gizLJJYYDXJRJC4snr3kLXfqDQjxlXhPrXVXNzxW/pdkvoQvys92zagijr9R4Z7RI6K9OiDxvfwTwig75V50pgwuTYrTn4GbLn0fr4aCZ5BSaMq+h+ty0wURSWhIZBhGudrnMp2PtkbMc63v6GA4IT8HDzIshnVJ/9+0zBemm6jelyC8C8zId469mT/ehYxF4dVdsauGwz3t36iD3UwGo97Ps9OYDaWCRpN/CIvK48ANlA+fgGETKS+uNLc2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZoBumWpKVDl3CP8hE2LKUBjGpYx59LLCGVSa9l2xns=;
 b=rYf6DCcAHG9+QPqOjvI0UBxiOY/VCWig4O9RawGnDM8XLpmW6adBGGetqrroFPW4F9v3Yh5U50njFYeV0WQJF18QZWVvk8gf2OVCujVcuHaJxWsW8yV/2P+9txNmr3KPtVQ3XB49T9DH2n8ZqOsiqB+Tw1txLI6tbWQZAIIdg+o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 02/10] xen/arm: ffa: Rework feature discovery
Thread-Topic: [PATCH 02/10] xen/arm: ffa: Rework feature discovery
Thread-Index: AQHbCo5ExIbA7l69J0+4YFeayWExYrJjiLEAgAMWSoCAAJsygIACcdgA
Date: Thu, 26 Sep 2024 06:52:02 +0000
Message-ID: <F7F86CCF-1E57-4F0E-9373-2245A7D7AF11@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <6c841c341b7dc9e06eb1c02555e30b29bd400d20.1726676338.git.bertrand.marquis@arm.com>
 <4f1c91c2-a4ec-4dcf-a5b8-7d0607b1778c@xen.org>
 <66012F72-AEF4-478C-98A2-6D37195348B5@arm.com>
 <530ad746-a84b-45e4-89e1-c350eac255ac@xen.org>
In-Reply-To: <530ad746-a84b-45e4-89e1-c350eac255ac@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9771:EE_|AMS0EPF0000019B:EE_|AS8PR08MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f91c81f-0b91-47a7-4bb7-08dcddf7bff0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?1OwpceGR4mKAfNOjRuCFWLFfQZ9DVAaCjwYlmJKIwiz6ipWW8oOkFzFd//iK?=
 =?us-ascii?Q?TbgtjK0VlOFyS2Ybz8St6b4wHRpzQ9U86dhaG78Dv7SqFdbrDvrWWwH5LyB0?=
 =?us-ascii?Q?2kxLIKRolhygOd7JqaJq19TjK8vRUT54+cKy6Y7+ajWB97z4hHyFHkhmuVPx?=
 =?us-ascii?Q?gdNrKjxGCL2ctIlmmG3LCH43CtfBVcy5NaWQMZs4nLwc5Oglj+PEquKQTuvc?=
 =?us-ascii?Q?palemH1GLXlzru0jHbXM05uGPFFDh2V3251ZBL6votz0ib25ZYYm52HL+9We?=
 =?us-ascii?Q?qC40/VvuBVNkXiWRCHgwnpdDi6n+PyHvVK77qCYibDNvCGoYzFcbPLDtJUGa?=
 =?us-ascii?Q?Gy0SMMVhr0K/dxtZZ20yh4ZwpJAwuQiwYM2oQlHo32CSoqN+uHN5v1HgRCdL?=
 =?us-ascii?Q?Hdt1ASD/Jw3xd4JXXdS1T93Cah3AqxLzuLOQsUWX+PuQLDdByJXKdH7g1aDE?=
 =?us-ascii?Q?+QEM3NFLZXyCWsoK7VjmJIIip/+VjJJwCkmFjztUhKmGP/MRapLDFSWBOyPV?=
 =?us-ascii?Q?jqJ9n3L9mLdXp4zmLJrDn0jxdx2chYJsSEpoYzlFROC/ZJlTyuHA+FGUntFw?=
 =?us-ascii?Q?4bo62X3VXqwSutfqHjNibEivHc2+EhxZREBD1ortfrkO1Vmgv4pJPu9eVAyl?=
 =?us-ascii?Q?GdkNfDtbv8jwmR1pVQYbjDzJ7QZfvfbC0Cr/9+2QrJmKlOAiNcA5cvVDNwgP?=
 =?us-ascii?Q?0XMVdeIGfDTucGBBwT6sWxBeGo8FmwDgkhfwBpasGZXn5bkpyMIPNiNp96OK?=
 =?us-ascii?Q?wW7xBhmI2vCm4Cjve2nQYu+93eFsaHv17BH3xwdbMFL99uIlKVA6u9wGbFXs?=
 =?us-ascii?Q?8E67+TRtEfzoneSg42YUgxLNvCNF72JyWvfR9WXiOdXQ6v0vBon8XmeGrQ/z?=
 =?us-ascii?Q?30BbSFvGySIQyitIubP/Un2RvE9boCc6kB4vKakR8AnfruONi+A1Fp+txPSy?=
 =?us-ascii?Q?u7UqR6vCWOLmYEJw0O8SuaT6ePW9vVn5SV1NqNmRRbcjzFtPLTAGNXVaZi0Y?=
 =?us-ascii?Q?aU8T09isdTyTqY0NFL9BcwF48x58JWeM8BwKCChaURQdGKwPUHaLqj78fbGt?=
 =?us-ascii?Q?3J0BAMLrwa3ZvLpOa1rjoPKKk4EXEikG4ynp4ISw7rVxVgUwq8f93Npg0wwy?=
 =?us-ascii?Q?5FFoZGvrDy7vcMVEasAxePXsfRSMRGQRN7vjn69ICziisuEDqadWGYeZz4Q2?=
 =?us-ascii?Q?CH4HsLt9A8m+laHbWAIHPqUprRXOUK7S9fwEwE3Ln8Zcbyt0dVMrrW85juv9?=
 =?us-ascii?Q?30JMGavE2yguwjqJBhMAOv2SlB1q0I5fscDeARbX+bDLtbFwpxQzWys/7eT0?=
 =?us-ascii?Q?pRCNQG1RczWDxh+nN3bTMhBTN/GJeUY1goZ3AwM+cTGkEVRElpyiMVFo44f9?=
 =?us-ascii?Q?s8b2Nbehx95GcrjB5x/kIcwEgUCQjWjmfCqvaAXaD9tjbpxx+Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DC191D93EC0B184C85DE8180FC452F4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9771
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	60c870bd-9616-4478-da80-08dcddf7ba0e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lkbAMR5hom54b5HIQ+ZupBh7BGTv1efbdUdeFQpP7dr0xHuq7Mv/pNQUkYsH?=
 =?us-ascii?Q?kiwNcUK1mgBaWOE2XxE3fFBp7YshZk4KPJQv6rzNuKzLtELBt+z4izVtwU+C?=
 =?us-ascii?Q?77nyKWfDmkSo8neim4l2PfzrpIvrlgTItLOpb1XlBSSP1LrEd8maXveD5/V2?=
 =?us-ascii?Q?82+vFYdXn6AwOgwK7+rFfO+m0kZ26GkWdgWQkqkeQJ2dPO3RNWK+tUUqZXJC?=
 =?us-ascii?Q?0TiB3perppkuoOH2mXOKIz7srG+o6ccVZdUl3m002le9pdge+J2tYopxTizP?=
 =?us-ascii?Q?4sw5Bzioj88ThGfbFZJB0tGgrT7TnTI4asEqBzOJb9JjXYMeqKiVhTbLR6+1?=
 =?us-ascii?Q?gONJcJUJ+rFwSblmzweco5hOJaM9Yvk6qmlQ11s/sGX6+W6uF6xGYYsNsInv?=
 =?us-ascii?Q?/ANIA+RWzIeTUozGRbLt4/dhks3ZYZH2Ly+7olL6wBweB7pbfgoAILSV6MzD?=
 =?us-ascii?Q?TgZQJWDVQH+hJfaUXpYCTJUEmZQVAo8V9cr90hF1X1hUbot0yEKZo+EDNB3C?=
 =?us-ascii?Q?n5PdcQ6DZpdDzk28bF6L/Pro8rHYtH+AvZPKaazW9yWmq+zbUfiOQJr4EIyR?=
 =?us-ascii?Q?IA3kJwUG2wQ4pw1grnLhlNjU252gvLk3iufK54V3QlR9h1uNgx6FwYhnlvUQ?=
 =?us-ascii?Q?7s2VTklYwmHpKfb26d2v4BDMMfM1jmW0km253hiGXWrrdkaEdy3bQ3R0QIfv?=
 =?us-ascii?Q?bjc2Fq3XN9Fq8HOqN80IZKT2Ui1WjUlfBDx11tYN5aMwWtx4cFSaOeHeSSs4?=
 =?us-ascii?Q?YILeoGxJ3hM5wuASFKakQ294ujYbm0ri0rys0e6BwNz3+iZb9DHcUL1SIrsa?=
 =?us-ascii?Q?VrhUPArRNhWF0kiw8vUGnQnNhwsmuUFYI6FZ2CpgJIrN14ffmqEUEqoXnhmZ?=
 =?us-ascii?Q?r4eABGYE0f67kOFHPlPZE2bPwmOxgrt4LSS8fyhsusOGl0U691K7UqX2RMf0?=
 =?us-ascii?Q?4MO6jplP/hTOFwAd9GSJkRFwb2lWRHVFsu+A4mH//5tdc9hJPwzcKFFOcZG3?=
 =?us-ascii?Q?7vO1hAUuiwtIx2a2tDkNG3TkrYfN2ofK+M9z9yA3V1qXudOYSN1o3UaT4FIA?=
 =?us-ascii?Q?vFIbjbzlWti9LRsucMNAq0KE3T5Lbpz8iOmFqQUMZ53tLJg70jxUsah6RgbB?=
 =?us-ascii?Q?ySsxSdaJV6hueFMpMS9JhVbZODxTfDGRONLL1i1Fg8aE9Z5L048EpgTS4Q2D?=
 =?us-ascii?Q?d2h8ucyL5OAguEP3VufFZvybqnHNfG5/vMDleTwwXOczCgl1rthqn7lVHZat?=
 =?us-ascii?Q?z3kULuwL3HEFSQjkfvVYaOaame1v2QcObba3scTKWjrd9WVKQB2k2Bxlbj2U?=
 =?us-ascii?Q?L8Vw5Q5882hTa6UBwW5HUya4Bnx17xsUjiQyGVnudcrZjpGc0ZsGHnkxMIQT?=
 =?us-ascii?Q?Ve/XXaoEFb5K6KpWVRR+4FpMBok5JovvXW9IcYVIWS5yf0PLdT0vLLHDxkwY?=
 =?us-ascii?Q?0+EcyAvBfc/MvqnvPOI+vTp6k371Abqv?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 06:52:12.6155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f91c81f-0b91-47a7-4bb7-08dcddf7bff0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10289

Hi Julien,

> On 24 Sep 2024, at 19:31, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 24/09/2024 09:16, Bertrand Marquis wrote:
>>> On 22 Sep 2024, at 11:07, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 19/09/2024 14:19, Bertrand Marquis wrote:
>>>> Store the list of ABI we need in a list and go through the list instea=
d
>>>> of having a list of conditions inside the code.
>>>> No functional change.
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>>  xen/arch/arm/tee/ffa.c | 61 +++++++++++++++++++++--------------------=
-
>>>>  1 file changed, 30 insertions(+), 31 deletions(-)
>>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>>> index 7c84aa6aa43d..7ff2529b2055 100644
>>>> --- a/xen/arch/arm/tee/ffa.c
>>>> +++ b/xen/arch/arm/tee/ffa.c
>>>> @@ -74,6 +74,24 @@
>>>>  /* Negotiated FF-A version to use with the SPMC, 0 if not there or su=
pported */
>>>>  static uint32_t __ro_after_init ffa_fw_version;
>>>>  +/* List of ABI we use from the firmware */
>>>> +static const uint32_t ffa_fw_feat_needed[] =3D {
>>>> +    FFA_VERSION,
>>>> +    FFA_FEATURES,
>>>> +    FFA_NOTIFICATION_BITMAP_CREATE,
>>>> +    FFA_NOTIFICATION_BITMAP_DESTROY,
>>>> +    FFA_PARTITION_INFO_GET,
>>>> +    FFA_NOTIFICATION_INFO_GET_64,
>>>> +    FFA_NOTIFICATION_GET,
>>>> +    FFA_RX_RELEASE,
>>>> +    FFA_RXTX_MAP_64,
>>>> +    FFA_RXTX_UNMAP,
>>>> +    FFA_MEM_SHARE_32,
>>>> +    FFA_MEM_SHARE_64,
>>>> +    FFA_MEM_RECLAIM,
>>>> +    FFA_MSG_SEND_DIRECT_REQ_32,
>>>> +    FFA_MSG_SEND_DIRECT_REQ_64,
>>>> +};
>>>=20
>>> NIT: As we are creating an array, could be take the opportunity to prov=
ide a name for each feature (we could use macro for that)? This would make =
easier for the user to know which feature is missing.
>> In fact those are not "features" per say but ABI we need to use with the=
 firmware so maybe i should first rename the variable to say abi instead of=
 feat.
>=20
> Thanks for the clarification! With that in mind...
>=20
>> Now we could create some features out of those as in practice several AB=
Is are needed to be able to use one feature (for example notifications supp=
ort require the INFO_GET and the GET).
>> In your mind you wanted to have something like:
>> "Version", FFA_VERSION
>> "Direct Messages", FFA_MSG_SEND_DIRECT_REQ_32,
>> "Direct Messages", FFA_MSG_SEND_DIRECT_REQ_64
>> So that we could print a more meaningfull name or would you be ok with j=
ust printing "FFA_MSG_SEND_DIRECT_REQ_32" ?
>=20
> ... I was more thinking about printing which ABI is missing. This is more=
 helpful to the user than knowning which features will be missing.
>=20
> This has also the advantage that we can use macro to generate the names.

Ok then i will build a table of strings of the ABI names and use that to sa=
y what ABI is not supported when there is one.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


