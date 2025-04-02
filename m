Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4CA78A71
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 10:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935252.1336683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztwI-00076F-Pu; Wed, 02 Apr 2025 08:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935252.1336683; Wed, 02 Apr 2025 08:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztwI-00073o-ND; Wed, 02 Apr 2025 08:59:14 +0000
Received: by outflank-mailman (input) for mailman id 935252;
 Wed, 02 Apr 2025 08:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tztwG-00073g-DJ
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 08:59:12 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2606::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd247e3c-0fa0-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 10:59:09 +0200 (CEST)
Received: from AS4P195CA0047.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::24)
 by AS4PR08MB8166.eurprd08.prod.outlook.com (2603:10a6:20b:58d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Wed, 2 Apr
 2025 08:59:06 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::30) by AS4P195CA0047.outlook.office365.com
 (2603:10a6:20b:65a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 08:59:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 2 Apr 2025 08:59:05 +0000
Received: ("Tessian outbound 15d661e369c7:v605");
 Wed, 02 Apr 2025 08:59:05 +0000
Received: from L6f5d68abc7e9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4614241-5C08-4965-B67D-2B944BD217CF.1; 
 Wed, 02 Apr 2025 08:58:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L6f5d68abc7e9.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Apr 2025 08:58:59 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI0PR08MB10390.eurprd08.prod.outlook.com (2603:10a6:800:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 08:58:53 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 08:58:53 +0000
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
X-Inumbo-ID: bd247e3c-0fa0-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DE39kHoaB3RnYehiv/G62bJoGkuG7N3NB8zRhNMjrVZHFvH+mWMDcTxY+Ikidzs65gQaQIAqmYDyMTthkk+0DX5vrs15rSvFmAFIVIyJ9YuaegGjFhZRJ9D7hdwWhZupsQoYrtxQxWXlqXQTxaKY10Bpj6UDsoZtQ2FVVyqtz+sYorVJ1bnmvo2n6ZrbhkGf9Y4Oiz2FxcIxG504yagMKOnk9TZtUf5X7H/yOGj05BAR1g2XxpjncfxDAMz/SZVb5J4YtaI+HmUk70baThoEGn932ZAftSDeB0Eiuy+jzZpPSII0SR8iWNC6SCpXT7ePdjqz0wUARB1jnAqcVy55zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVh+cLsbXjVRZjKSAGe4AE+4zxFPQNuouxrlS5koUM8=;
 b=MJq1Tami6X70JbYhg7VAhKgCTRXc35ZR+AkZNH20WeFxsuwtjegcITQswYT7/Q/cwssjuZSepWOb5QMdHm34SoYflmfrxCaIvc7KWgEeR3mdgtljdfNhlacABThU6HSBmXTwDD0Evw/duZcnopmQQU/p7kzp/fQ1mLH2RjaUHzGzlXSdnlpORr+S49bWVU5KzVky7bWvwJjZnwAMXW+PJa7ec6lH2B9iWkVSC34MVUtCpR2274WBpRR5zFEALtFh0OjRWnuoEVffgh0Q6/39UozmT0eMwNBOa+XQUcMdZSToc50ejD8uejl00Me8EF18MLxSG7hOI2beDBzhmT2gag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVh+cLsbXjVRZjKSAGe4AE+4zxFPQNuouxrlS5koUM8=;
 b=Q5VEgIMgt4xVvKbk/bbD17hTzMkPG5nLsmHZiSiQ21uzMJPdtWTSmze0FWNp9PfDtOJ4t+TVAxDQgVqsjYF9MltAzh7nLZRnOlnsXryasruHOXvcdRcZUoqcvn1BV3bx2EMtR3V445+8NnqFnDoAhqLe/DDsUJJll2miop75rls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 586b74d149800357
X-TessianGatewayMetadata: DwH9Zun0JciJ5IPa4n8VNrj/haWi6UlH6UIhCFOAHjHtc9GqlhUI7HYaYAJjowgW1/Nc/tFTAiUeBAJ0RfkhTlsk5B5xOQvWIUD/PSSmQKiNGOnJgoYo8qrWntCfgwDQlRbz3C2eviWwSkk0YHFkTmhDxWUGhU/EHLkg7q5aP/Q=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AN2wfbgc3APcaVuVmpN3jHbbKx3tlUGp+NFcS42BHia9fQaar+1F1feB/W52lu2VsdVDSNoxjUQFJr4KasuURVGv3Qk08vUM7GR8EyBCHMA9RYimGLDMsYAAb0xvGlTHhFaekXWntlSor7AGFV2VbKUOGb6sD08C72PHTTwWHyZvXilva42msP1mE1f9jN6zpd5j1gEzx+/xh4luY1ZJI2Qfe2Kvr36qdJ8dt4Ek6zR50PjMwqQCP4RLuPOngjlseUunBR72k+9BKW1Z99mnX005CiC2Nxh+FmF7WeJ3svvMA0HsX0j6LWwqNglBk10fvArJiByPCBR5AUQ9+fudFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVh+cLsbXjVRZjKSAGe4AE+4zxFPQNuouxrlS5koUM8=;
 b=bqyfgEhlle1+1sz3H2KlPHEwv6H23pK/82b6Ibi/qKXLFv9Tx+q5Jx3bNIsRqs+0ZwHe7ZYhHpLRujQQKUYpW6KV+AolonTJlYXkAUPkLtY7IKxyywU55ZuCUQxtZ60AXQTCJbDK3+u36wvo/XC3dcrixp3o9WZCdXg2eeYCbeagGO006r5NGz2S7Rs7ibKyHscpPJ1seiAeIvWGcK7jAOD+S7DWBvsYTMd9U1qpxvSNfJGvddoyMbZ20z+8uk7nn0svXPe5FIFDCYVSpqicgrxhXch/lIQk86ZNOE3vJ5E1itgfu3UzdiXpeAQNN+GzZzqYC9jZ8eldIPvmzHYznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVh+cLsbXjVRZjKSAGe4AE+4zxFPQNuouxrlS5koUM8=;
 b=Q5VEgIMgt4xVvKbk/bbD17hTzMkPG5nLsmHZiSiQ21uzMJPdtWTSmze0FWNp9PfDtOJ4t+TVAxDQgVqsjYF9MltAzh7nLZRnOlnsXryasruHOXvcdRcZUoqcvn1BV3bx2EMtR3V445+8NnqFnDoAhqLe/DDsUJJll2miop75rls=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Don't call process_shm_chosen() during ACPI boot
Thread-Topic: [PATCH] xen/arm: Don't call process_shm_chosen() during ACPI
 boot
Thread-Index: AQHbo6s3fHChr4GXjUe34zIKQkrL6rOQE4WA
Date: Wed, 2 Apr 2025 08:58:52 +0000
Message-ID: <DB88128D-3712-43A7-93EA-F487A82448BD@arm.com>
References: <20250402084233.114604-1-michal.orzel@amd.com>
In-Reply-To: <20250402084233.114604-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI0PR08MB10390:EE_|AM4PEPF00027A66:EE_|AS4PR08MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: d260ce14-6a26-439b-987e-08dd71c49f54
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?X2Q4/VSV6YFx16lfvvZMZIJUgPAzmpWGP3VgsnuHsc74Ij0u0/kSShuOxe4Y?=
 =?us-ascii?Q?JezdeBoOKrM/oD8z1pAHprN1cK9YkJN8RvJW/3cf6ZQffJBxB0j1W4TO5GNw?=
 =?us-ascii?Q?GxhPPb8o5DWmRnIaqeYOq71sWHfPS5oBYLTmDRxYD7urlgCPAjum4cukSMgQ?=
 =?us-ascii?Q?WwAhA40ADJyydpgHoYhgeB1VPbdsvn7nXHf7PBCSR5lqr75rCJVuDNPCHjob?=
 =?us-ascii?Q?XutnvI0aMnxatIu2ljKZJTmWuAbdN4IsVnLJkGI/KFxgbqpoaAa3quzb8wlT?=
 =?us-ascii?Q?s1ZoBqN/0RnUFXVCX3x2me8w5mYt0a9hzBsgQkhibqFUmg0gs6o+9ULemhbG?=
 =?us-ascii?Q?2SBKfXqTu+zc1HufgO6anMErAf9nD5Q/TvSuOGENduEzoVnTV+0b3PsnxH7F?=
 =?us-ascii?Q?FIemIon+Etoi52jj3hr2p6noY/Pi39kbL96hc3nRTJ8NCVKfxyP1TN8zyecY?=
 =?us-ascii?Q?T9fNOWReue0/xU9n0PgO2FZOxamyJSbNec/tsi8K/HnZqY4zTkQX+E+6RKbU?=
 =?us-ascii?Q?vDKQcw/LmsWMzBseTNvyopaMyb60D3VuImyYQfAEiAVNYXs8GIWLPUgFi+dB?=
 =?us-ascii?Q?PwRa1tqez903kuf7r80RRRUOc/cKz0Ju3/ttETSCnNm1NtS7J07zYqEmu/Xh?=
 =?us-ascii?Q?x7tNH3CM//WT5DHmMkegvyMY+8tnL/lTzXYb7dT9HUqQArI159IHc05oBgHv?=
 =?us-ascii?Q?BBhryhN45DnWQ9JlyTS40rr98pzrbAoBQ4O7QSMk3hiGnNNs+At+tFkjQ9cj?=
 =?us-ascii?Q?xWkyQxrMHtiCoUD4u4x942p3xAZvSQFXI8n7ucZmY4ZQMM92iRN76ewBamBn?=
 =?us-ascii?Q?aFusXDMfJctUBVN8SA927R44cjiPi5JE5J9OjFFT0YKnS8sGjqshy5UL1U3t?=
 =?us-ascii?Q?6pRM/bwmZC4UJtQElY40uXyGpMSlb7KHEJ1Md/RM/0IaubUz7er+d9Y7qcbQ?=
 =?us-ascii?Q?Hgwyu95Ynqw8WK+CdoEw7bK+s/MwMLKFlNefoQU3X4NfpL6VUdfzGGHv/FxL?=
 =?us-ascii?Q?/nnV+fDHVNWmjFdYPg9/Pg9omAWoAWwor6E7aJLG5eQjDjxYTq+PL5oMOG4p?=
 =?us-ascii?Q?xMeFEUWEwTzmhOtck+RsmcvEas6dBda0xK/NuE7lQM0FIJpvQqQk+p9D5svz?=
 =?us-ascii?Q?Wmjb8EHNAVwd4OPRxPd9OyR1fjeFJws9dCkbGzG0CNOaGIIw5/Y4boaoR5Cu?=
 =?us-ascii?Q?5U5DarMWnBGchc3ZNUiJuoz/syy040RRucuB/tEStiphPj328k283bxUtKq6?=
 =?us-ascii?Q?cAO/KG4CnlRYUQOSQ448cnT42QjyTrZ23+nKGe2FpS+FzZ28XIWHYMmp/4+E?=
 =?us-ascii?Q?dklecIYUQAks4Tzw+rXbYyntFVN6UI8qGd2oIaO7FkBSXCO6BuUthHnOblx+?=
 =?us-ascii?Q?YkdBYiNZZqlxC9JKU29yV0VvIEHPrai6HbI8azL/6Y9nDfk+yHYAxMZjIa78?=
 =?us-ascii?Q?QpDWBa7cUgpcrg2G/LKd8AJlr/uH1ujC?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD34DCF07D88DF408DDA51EED0ECBA0F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10390
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad2abcca-ea9e-4341-ff4a-08dd71c497b7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?urvYiIEAhMlOTRdijp+SEdzwwTRtceBwwDd6Q5wt8rRVXmXkItUnsi0b4N27?=
 =?us-ascii?Q?QOURMkm5yR7N7bOorujSb5Vdpas8xxxYVL3AWEn0GkxsTehogVagxszHxOZu?=
 =?us-ascii?Q?Kt+ySToOJGGFrH0ftTSve8qexqrbcmD5oupY8lzkTyLyNjSrDzDDxBSs/Klh?=
 =?us-ascii?Q?S1QD+HQYWro0NeVyeJLZSMnN9FMZ9jLDZV+mGae2vIuDFrgixYJg6wxKAfc5?=
 =?us-ascii?Q?w8gV536UXePPqQ8Jt1tzOmKbFH+FGcb7bQ8jMKFsPjvTTgUqsdAd65MP+eZf?=
 =?us-ascii?Q?IsjIiEwBBAW5jZRkJggkemxFrzLfXFq6VuKiyLfkrfdUbpOVYn1sl4aqU/2L?=
 =?us-ascii?Q?fjQJwQJtgY+03elrUfqH5zFOfUw8eaVGNngCvLUET+rR55ndBOtmHdNvO9pF?=
 =?us-ascii?Q?NOp19jof66X7xtCenIXqrQY2wOouHK2U5GJPEQBMaoCMgw2uLnXRjenXIoq0?=
 =?us-ascii?Q?F+UxgoIRBvCC4PaWKuo2UZxyv2RDynd20ayR+KrelkLV0MXVbt7aZk49AIC6?=
 =?us-ascii?Q?3axGVuAlzz0Y7SKMgc/DVQ5qBnY+Mz9oUcwbnnhDGVHTZItPwGQhzHa8UwvS?=
 =?us-ascii?Q?jWVPwlXegU24lhJMjscNqRF0bL5G6OmDbmyigBtnvuGhTiadIsabp3YfY5nS?=
 =?us-ascii?Q?oYPdYqe0iJqfSbB66cBVc+x8NJFRTxCGocCHFkpNYJaL8Bf7NiPtqTydT9kj?=
 =?us-ascii?Q?TLIARD2nRANgNULdYO7Z4i9fSD1Zv/XB3bQHAI7Ia6KI/hKhELEVigs4bK5f?=
 =?us-ascii?Q?ZRPsTzpJ6LRBqJoFcLNSS/TgUf1rYHxuoiSdANJ9ZogLs7p8DJ7NMP6BFKTT?=
 =?us-ascii?Q?Y95zmjALFHuIZyI/Fp8S6vS1JCTmQIma8bIbDVO61hV9xYP1P0O9L6hJeXno?=
 =?us-ascii?Q?zBY4ErUY0S64Cx7h989v/eBv9HZnVpje+S4gvRMrk1kD9B8vIGnt+8ZcAIfn?=
 =?us-ascii?Q?9QGMI6l7fdT8YDcRuyOefkzA4RlChkNGBnNcaiZu+tcceY426TbImIgYs6hd?=
 =?us-ascii?Q?AJmqPlKYNi4MHtpbqqzijQVAii/pNxrMj7auKn1IphA1eQmQ+djSCJvQ8A9i?=
 =?us-ascii?Q?ohGMQr23CUT2TjrGWy7gr4VZI19F48x80+rgw8TH2oYDkUUxZwGBkmDc3aEr?=
 =?us-ascii?Q?Tj6m/AES8hUoMmtouchx5Nnl7ztlEYig0Nzw7xgPRi2Tij//0aPyPWwM43IR?=
 =?us-ascii?Q?o/HBykis2WndUUUGaMciKtF/qEDnk6Ucg+g8L72iTpl1IIp7AdQpA6XEtex5?=
 =?us-ascii?Q?eEfbnsQRekJv+LVdc79CGrRwYQCtXHPnmdffz43gX1OeZcDmWJdiunJ7YxjU?=
 =?us-ascii?Q?doWHChWOOCut1e7x+AAukEN0Kpf4GGHceOZ1yMdMJjQ/P/snz+Lz17SKXMqf?=
 =?us-ascii?Q?xgGKIGsbh9zpAObEHGNfZFGWs0hrEz22OqVWXY7y6VctZ4JaAvn+L0Up5mK7?=
 =?us-ascii?Q?hjugrka9xmilOzHTBLmd5ZCXE7wdh/t4YVjbLGn79paHXgXpNz3MFUcj71ha?=
 =?us-ascii?Q?Me1YjAwigV7WPxg=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 08:59:05.6503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d260ce14-6a26-439b-987e-08dd71c49f54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8166

Hi Michal,

> On 2 Apr 2025, at 10:42, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Static shared memory requires device-tree boot. At the moment, booting
> with ACPI enabled and CONFIG_STATIC_SHM=3Dy results in a data abort when
> dereferencing node in process_shm() because dt_host is always NULL.
>=20
> Fixes: 09c0a8976acf ("xen/arm: enable statically shared memory on Dom0")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/domain_build.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 2b5b4331834f..85f423214a44 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2325,9 +2325,12 @@ int __init construct_hwdom(struct kernel_info *kin=
fo)
>     else
>         allocate_memory(d, kinfo);
>=20
> -    rc =3D process_shm_chosen(d, kinfo);
> -    if ( rc < 0 )
> -        return rc;
> +    if ( acpi_disabled )
> +    {
> +        rc =3D process_shm_chosen(d, kinfo);
> +        if ( rc < 0 )
> +            return rc;
> +    }
>=20
>     /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
>     rc =3D gic_map_hwdom_extra_mappings(d);
> --=20
> 2.25.1
>=20


