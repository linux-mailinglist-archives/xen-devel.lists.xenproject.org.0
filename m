Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEA9A41A08
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 11:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895083.1303682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmVIy-0007wv-PK; Mon, 24 Feb 2025 10:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895083.1303682; Mon, 24 Feb 2025 10:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmVIy-0007uY-MB; Mon, 24 Feb 2025 10:03:16 +0000
Received: by outflank-mailman (input) for mailman id 895083;
 Mon, 24 Feb 2025 10:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqga=VP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tmVIw-0007su-Td
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 10:03:15 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2606::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ea52f74-f296-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 11:03:12 +0100 (CET)
Received: from AM0PR02CA0036.eurprd02.prod.outlook.com (2603:10a6:208:3e::49)
 by AS8PR08MB5879.eurprd08.prod.outlook.com (2603:10a6:20b:293::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 10:03:10 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:208:3e:cafe::64) by AM0PR02CA0036.outlook.office365.com
 (2603:10a6:208:3e::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Mon,
 24 Feb 2025 10:03:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Mon, 24 Feb 2025 10:03:09 +0000
Received: ("Tessian outbound c3a902884497:v585");
 Mon, 24 Feb 2025 10:03:09 +0000
Received: from Lf1f31ae374f5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B6B9704-1A23-4C20-A91D-726D9310446D.1; 
 Mon, 24 Feb 2025 10:03:03 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf1f31ae374f5.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Feb 2025 10:03:03 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9414.eurprd08.prod.outlook.com (2603:10a6:20b:596::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:03:01 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:03:01 +0000
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
X-Inumbo-ID: 8ea52f74-f296-11ef-9897-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oZiYKrpELKPro5IysJC5Fh/kB+9z9SUeRUVoZsTQmpdd0JtS3bpKlFjL2SoNRL0dtJaMeoIxHFAxVQ1booFkkZOMBKy/YXwqSzm37JBegLG/px6n+yXUp33HokSyuCdahLwHrP5qy0PE1us62ZCF+6ZxVRcgxJKqbf/qT0G0KDQxSBgVZc2fGmHqKLGYjTteI0mPVCBKAFWRCDXqzuoIciEg7GaXTNmVDsGB39/F2pF1HMWUMmv9MPsjbHnzH4ULeWSFDK5EdFjI3AMhufkg0Qq4tgIYFZlU5j4rbBG4z2dlpK3JjpJeVkEEGhwD646de/fcI3eXo3AOSHcddF5Iyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zR+hv84Esg2tu2Q7BI4KI1gLi2D7imcP3V1fDeWY3g=;
 b=L5dzmsOMg1en/R9yTx4CobjNnu62XLms8VgUEveBb0cKbQ+sjAiYchAbZBEuYGcbAgyKu4s+orgSy9DtxKwNKPRXX1F1sIidF4CYJAEi/vgMBV6fkLhvYnJXzm5rLYvO9c3YeyK4AuBR0gRU7nXUNuew04nPN9Z9BfUe9Mhtic0mThR2oHPCDmqRpIKKX03hOJuQiEnjvwkBGaAVjq11WmQ63dWPA0zWl2z8zqrVyX08VAyEnES1fPzl5Aje8wJYabFF9eO/pmqGcbjFL1dHPImIBhmh7CDliwigAomyVkuX0ilhA1oaIQZubbC3M8Vwy6L+5YIBK6c6cfr026tzHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zR+hv84Esg2tu2Q7BI4KI1gLi2D7imcP3V1fDeWY3g=;
 b=BUjI31GR86W/dK9CLRLJ1lNiwZuDnSiXTplHyhp414WFpdhSA0uzFu5nOqEQLAH4nEWQqfxP27OY0aFhFng0FrR6aJwQJCQ8LKXW6VXQGGdsWINYlH86bDWQJzidz7QDaXiydz7GmJEU1UPtktxZA0FSe3+jOIYVWb+J1lSUwrE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e2a81cbb58de6a0
X-TessianGatewayMetadata: a1l2/xNG3cz+2QNew4PhJWTULGo/k0pPDgRYFA8aLUl8rz5Ct+Q20+I9X8ccXWaiT6mCrSfgNzEo8FUiVZUXkFI/8+i04cp9zmp1bNUwHwt4/SC4pj4TmKsCO8/HIta0SVKqs97vhbdhFo93ZAP8n1SHbfQeDH19sriPLfykfEg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gq+vSpzxaylB15KBFq+pNVl9FqXyBLrq5yA5IcrffJiH26di7kiu5MO/smTc3qDMC2HTuXZ0w2+HAc0PfUK8GemaPXmRmLm/Euk2rn4uwxB6ygEKhCLK6aHvERBTTXFpcAhaFu87ItPMDsWpUutR0flM3XSKJKX0TMDLIEXzA63hcvRof88SzPwxInFrwlegj2eGcxWzHG/pvjZmbxpPDLyJzpa3wUnTtXceoGl6+R3AfWzpJYZ/8Njw3ufEpPsCmxsdFvAgjn0QMngTzgzJJ7nTEXZ9KB4ft5SknIE/bfFKAd1HTecyAl/NZOUOQ00Xz453GTlS1npAI175GitbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zR+hv84Esg2tu2Q7BI4KI1gLi2D7imcP3V1fDeWY3g=;
 b=T/4uQ6Ni6SxOFdM98ihMIUjAFnZCX2HDuH7kyRkklOkeW4ofWiewH9R6E/6gUX9SxcnZfadj0PHh9WyXqK2GWDiDxlPC/2fE1Wswsp1GG0eMdFx+kKpOQuBBVtzPSAry32feLcWYbb87g5E2K92u+QQ7z/4EKiBYnpdVxt+b3rwioodxct8wzORZdPuXv+N80OvOh/CfQhrycSG6V3g+7IG1n2/w4zm5YFhM3k/gEHFLz7sBl5QKH52/8AplIoBHGNQb3xl6TcaTtWJfJqaDr2FXAntN30vNCyE6aju6Rh7A1qVwVX3u+aUD43QNywlIYAyzX/yiyG2URTonTqRF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zR+hv84Esg2tu2Q7BI4KI1gLi2D7imcP3V1fDeWY3g=;
 b=BUjI31GR86W/dK9CLRLJ1lNiwZuDnSiXTplHyhp414WFpdhSA0uzFu5nOqEQLAH4nEWQqfxP27OY0aFhFng0FrR6aJwQJCQ8LKXW6VXQGGdsWINYlH86bDWQJzidz7QDaXiydz7GmJEU1UPtktxZA0FSe3+jOIYVWb+J1lSUwrE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v1 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v1 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHbZr2N0lH4GhPB/kOpvRdBJn3PXLMtgcUAgB5iFwCACpUwgA==
Date: Mon, 24 Feb 2025 10:03:01 +0000
Message-ID: <EBEA1F4C-C23E-471E-8F0B-0CC1BD86E850@arm.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <65584EA7-9B46-40E9-AFD8-B7C8F77A5DA0@arm.com>
 <34b229d2-e61d-4779-a07a-024eea81ee4e@amd.com>
In-Reply-To: <34b229d2-e61d-4779-a07a-024eea81ee4e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9414:EE_|AM2PEPF0001C70E:EE_|AS8PR08MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd6d7d2-29a9-4f9d-ad7f-08dd54ba7166
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?BVsG4cjrA3dgtJ5hR2DWWHqD4AT7rAIATcBWrqmND+Pt4RDZ8mh2w1lfNIbG?=
 =?us-ascii?Q?UJNHPTon/tDkta3viSik+p5FViYNhkhQBvOP49gzlTZoK3fIrXOC4kv6bVs8?=
 =?us-ascii?Q?TkcQ43vLQk5MpsyhfYgjOeV7uvogZuXuIIgaU1hY5yAZ1/YABySW8vyhe6Gh?=
 =?us-ascii?Q?JEvF/TBbEhTSEbWWeW21mby6+lZNlg9h8HkD6/PTEK62LsepU3IGWNPgIZPn?=
 =?us-ascii?Q?JELzMdXJB9jAPsKkKzM9hJnIoD02EL+5FmfCqdwJ9/RPUxsO0E6k6a1Ll4uz?=
 =?us-ascii?Q?383pWF92xOUuiyCWQVQhT+tvGSlwujhyoBpzXjmNkpt19/Hir0oQd9hIbS3A?=
 =?us-ascii?Q?TTGQ4m7tjLJxsPLQ2nE/afypUfBiLjZziCti/k6hhnFFbpxrcfI2igK4oTZz?=
 =?us-ascii?Q?BPhA2BQcJSDajQJGfEE1UidKUNncnFacyfsmNk6eo8oC3mwT4rI9XpMAis+Z?=
 =?us-ascii?Q?/DxxsZhcAmuvoCJ3SMD4x0m8G7D8WeWHY6GtGPShn9Wfk9zPdHI8qlmZDgVx?=
 =?us-ascii?Q?T5Gv4wqldGtHnh4DvtEVDh0VBbW9zEFz8SgDAUowaQayHLiZw+mMGCylOx56?=
 =?us-ascii?Q?nvNLK+xi5qxFgGD2JhqCyzUzqrARNdo+3la+QUTJ1zN76hfm513KJfs5uqD/?=
 =?us-ascii?Q?srzh04remf4MjnbAjSKWrQKsH0CjzOQv7zy8KVSyIOfSNkINy9vv33CC/aVb?=
 =?us-ascii?Q?vuWW3BuYSLhlq5h/l4F1M3AdWKYZbUEbZnc7LJrttCJI+jpAo/SNni4POi6c?=
 =?us-ascii?Q?vOHWcuO64EzsqWu8Gp2kuOL5xUZm6SCbbMQmFfUE2T09iMyX8si/JWB0ok0x?=
 =?us-ascii?Q?EGDS6ddZp87HuokY3BW6oegfxx4FPqsocyYatPBaXtw9f/BQX/a3ikEV3cn7?=
 =?us-ascii?Q?efZ5a0OxfcWauXy7S2XRN9EzG/ucbZOFgPX8TENr6n8m21sQ9B0iJaICQ1vm?=
 =?us-ascii?Q?3uDy549IYT7TtnOqCpqB+dqu/x8NjPdZ5arKiPTlpOtfQtxboVrGn6uQ0hTL?=
 =?us-ascii?Q?O+GTym5bJhKGdtrkKCX2f+szLoROMgWloZ7wdL55IEtts6FkAjHGFE8ZI1RC?=
 =?us-ascii?Q?z4ketPzgZjFbzGh3Bf1N2POql8G+33OTwvPd2azZHEQ+YDnTqqTzbA0hHDFI?=
 =?us-ascii?Q?72TKDOxgnY2ZCqqjLh1W5N/iHaGID8HEog9Vz2Xw4E4vknizQu78npYDxdsn?=
 =?us-ascii?Q?Pg56hcBN6WXHtB6RXgx4L2Zesf6DXG5UCqJ7sMfFLLqjbQeopwpwlDCLpIRh?=
 =?us-ascii?Q?ETqyYSkUIzt9nh45EIUKJQBNVqP55xGWLZpfl5rYTvS8CBGnW+lzk6UPPFK8?=
 =?us-ascii?Q?Wkfku5BBTCsx+Rj3xm1GI/+v8BWkxrEHyLjaTG/EuTgj0X4SeUa1NGg8T+3I?=
 =?us-ascii?Q?bpyqeoLVXcbifhIIUkWDoXIkMl8hdvW7ZHGSAs0aG+fzfXzo8Y2yLZlCISNt?=
 =?us-ascii?Q?Q99r1cqHEtXXpWWjfLXPney05ivkN9m0?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E05B576A2257BC45AAE68DC3E6CEC0B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9414
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fee64fe3-2eeb-4209-0d93-08dd54ba6c86
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FtfscncLUwXnKBREU769NdczKDUS5ChDzKgPT4abG1d9BIw+kwPuMKTO/1c2?=
 =?us-ascii?Q?aAdUWnsgCLaBefHYkfNF2S4Ysz5rhuDMth0Mto/8bP5owYwPAoMXggMprPIp?=
 =?us-ascii?Q?dtUlzPdh8Ee+R4SN4g9uNJFZ0Ew1FrdopsdJ9lhh4hdn1dUqh/870JW+dHUe?=
 =?us-ascii?Q?vSjugiakA0S8swwLO9eWh37Ok8AuaRJaqET7H+vBtyiHon4KKLP1y8LoIRsF?=
 =?us-ascii?Q?ih0RZnX00GB2VvkAs6MCKWV6/awgBB6CRBwxWr0xZoVtgCnDUoQRqZIqo7/n?=
 =?us-ascii?Q?83HYKN7DpPayevC9fZg/Vr/sc4SwW4iSWPxjk2hgb4qzcitGovMeCVptAWfv?=
 =?us-ascii?Q?Km7wpiuJ+NybcKmltBp9r48qM1lnk6Yyk/QaL8Vr+D6h81MFfSruYBccRydE?=
 =?us-ascii?Q?PnNlvOM4Sbn/HHSQwlutEOyXaL44gqvCVqvzW5Wnfp49Ffe2AlGOd+d94ta7?=
 =?us-ascii?Q?rcZw6yBxs9LTYIgSCT0e0Ak5Merv+Ey430hhPeXmRNxPIf6g5wa5ITOV7Yyo?=
 =?us-ascii?Q?hXo29EPap2EsEsqT3fZhiNTK6SB71WL1GGblSjX52y1aDb9DkNwA/LUInGCx?=
 =?us-ascii?Q?3gKDOABXC8ftZ+xzM9DeDrbLockn4olQYXjhz2TgSVbbS6QZrXT9gwrK72mK?=
 =?us-ascii?Q?4SpfzLQX6KnwzRMgHE89aSWNCRGhQUcHFLrD1y+7LBuVb4cC3hcjNG5uvK0D?=
 =?us-ascii?Q?dwN22Xwd88TRMnmNWvKTS1RE9W547K05C2lCDh9Jiu3AHVteHqXhW4gkSQqk?=
 =?us-ascii?Q?ohfJbwifwgvDway7sLZPr7r2YXWf/uRgD2mumMRnkOp7+hvPfbwQP94zjKfF?=
 =?us-ascii?Q?zMPJccwLbVs2Qa1KRoVpYNGzjt7XJgZ1Xz7X38EAs1zOaDg3ZFVc6N4689OR?=
 =?us-ascii?Q?MoVLzDAJRtNP8/xL6vIkBbUSqADtg556ocEb1pEs/sv0E8mAjFFq+3LwTkxa?=
 =?us-ascii?Q?qAPTmKRWcM0Vbs/mUNw24qDnasZpXGJDScL+b1avcs0+D8CQ+L93qTPgEQBl?=
 =?us-ascii?Q?Tzxhh8VHn61CA+FL/PR5iZwROehdJd8KiprznkhPBrGyyzlPfqJZIwcSZVH/?=
 =?us-ascii?Q?Jf9wuMizRjsKCP53YuV8W7PvbIUVBEFjS1QUjDa4kKMZELYyZCcEwMopXiVK?=
 =?us-ascii?Q?ABdsyg8CtCrsP0ffaL4u7BwAIQx9qHink+IZ7jeS5lmMd03NAC9LYQpPyPwD?=
 =?us-ascii?Q?LHdwKSn/KotKhWDmaz7m0zV+HlSNL3ptfjMMZUSauHx1snayOX4HwsMueIzl?=
 =?us-ascii?Q?CbkHhn2xognjFDEXdXZL1etloPdzzQnJ3vdc92yFBSla1YDSUGWt76BGRgsJ?=
 =?us-ascii?Q?hDpRGxOZ8MBhyI9QWC7zt2olRZzZZe1L9+IYLgVh9ZvJ7Gry7Q6jtdas4i0C?=
 =?us-ascii?Q?mITHN/3gK3prtiF5Xiec/n7E++E46Lrl6FRUSEGmOkaY62dyw5zWvm4muvY5?=
 =?us-ascii?Q?xKksfoDE3QlNDbH/cMx1w72dbygS92PDE2mcCPaG1RyT70D6LHUa8THKTOKE?=
 =?us-ascii?Q?DpQIcoW/5UnfGtI=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 10:03:09.8901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd6d7d2-29a9-4f9d-ad7f-08dd54ba7166
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5879

Hi Ayan,

> On 17 Feb 2025, at 17:26, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 29/01/2025 08:27, Bertrand Marquis wrote:
>> Hi Ayan,
>=20
> Hi Bertrand,
>=20
> I need some clarifications.
>=20
>>=20
>>> On 14 Jan 2025, at 20:50, Ayan Kumar Halder <ayan.kumar.halder@amd.com>=
 wrote:
>>>=20
>>> In the current patch, we have defined the requirements which are common=
 for
>>> all the commands.
>>>=20
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 52 ++++++++++++++++
>>> docs/fusa/reqs/index.rst                      |  2 +
>>> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>>> .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
>>> 4 files changed, 131 insertions(+)
>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa=
/reqs/design-reqs/arm64/hypercall.rst
>>> new file mode 100644
>>> index 0000000000..66dbcc3026
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> @@ -0,0 +1,52 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Hypercall
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Instruction
>>> +-----------
>>> +
>>> +`XenSwdgn~arm64_hyp_instr~1`
>>> +
>>> +Description:
>>> +Domains shall use the Arm instruction 'hvc' to interact with Xen.
>> Why are those requirements defining what "Domains" should do ?
>> Shouldn't we define them as what Xen shall do ?
>> Something around:
>> Xen shall treat Domain hypercall exceptions and hypercall requests from =
Domains.
>>=20
>> Or something around this idea.
> Xen shall treat domain hypercall exception as hypercall requests.

sounds good

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
> Hypercall is one of the communication mechanism between Xen and domains.
> Domains use hypercalls for various requests to Xen.
> Domains use 'hvc' instruction to invoke hypercalls.

ok

>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> +
>>> +Parameters
>>> +----------
>>> +
>>> +`XenSwdgn~arm64_hyp_param~1`
>>> +
>>> +Description:
>>> +Domains shall use register x0 to pass first parameter, x1 to pass seco=
nd
>>> +parameter and so on.
>> Same
> Xen shall use the register 0 to read the first parameter, register 1
> for second parameter and so on, for domain hypercall requests.

ok

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> +
>>> +Return value
>>> +------------
>>> +
>>> +`XenSwdgn~arm64_ret_val~1`
>>> +
>>> +Description:
>>> +Xen shall store the return value in x0 register.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_ret_val~1`
>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>> index 1088a51d52..d8683edce7 100644
>>> --- a/docs/fusa/reqs/index.rst
>>> +++ b/docs/fusa/reqs/index.rst
>>> @@ -10,5 +10,7 @@ Requirements documentation
>>>    market-reqs/reqs
>>>    product-reqs/reqs
>>>    product-reqs/arm64/reqs
>>> +   product-reqs/version_hypercall
>>>    design-reqs/arm64/generic-timer
>>>    design-reqs/arm64/sbsa-uart
>>> +   design-reqs/arm64/hypercall
>>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/marke=
t-reqs/reqs.rst
>>> index 2d297ecc13..0e29fe5362 100644
>>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>>> @@ -79,3 +79,19 @@ Comments:
>>>=20
>>> Needs:
>>>  - XenProd
>>> +
>>> +Version hypercall
>>> +-----------------
>>> +
>>> +`XenMkt~version_hypercall~1`
>>> +
>>> +Description:
>>> +Xen shall provide an interface for the domains to retrieve Xen's versi=
on, type
>>> +and compilation information.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Needs:
>>> + - XenProd
>>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/f=
usa/reqs/product-reqs/version_hypercall.rst
>>> new file mode 100644
>>> index 0000000000..fdb8da04e1
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>> @@ -0,0 +1,61 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Version hypercall
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +First Parameter
>>> +---------------
>>> +
>>> +`XenProd~version_hyp_first_param~1`
>>> +
>>> +Description:
>>> +Domain shall pass the first argument (as an integer) to denote the com=
mand
>>> +number for the hypercall.
>> Same here should be turned as Xen shall.
> Xen shall treat the first argument (as an integer) to denote the command =
number
> for the hypercall.

ok

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Second Parameter
>>> +----------------
>>> +
>>> +`XenProd~version_hyp_second_param~1`
>>> +
>>> +Description:
>>> +Domain shall pass the second argument as a pointer to buffer in guest =
memory.
>>> +
>> Ditto
> Xen shall treat the second argument as a pointer to buffer in guest memor=
y.

You might want to specify the addressing type (PA/IPA/VA) here.


Bertrand

> - Ayan
>>=20
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Return Value
>>> +------------
>>> +
>>> +`XenProd~version_hyp_ret_val~1`
>>> +
>>> +Description:
>>> +Xen shall return 0 in case of success or one of the error codes as def=
ined in
>>> +https://man7.org/linux/man-pages/man3/errno.3.html.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> --=20
>>> 2.25.1
>>>=20
>> Cheers
>> Bertrand



