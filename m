Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3457E8D47FC
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 11:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732571.1138559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCbhR-0007nE-E5; Thu, 30 May 2024 09:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732571.1138559; Thu, 30 May 2024 09:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCbhR-0007kR-BL; Thu, 30 May 2024 09:03:53 +0000
Received: by outflank-mailman (input) for mailman id 732571;
 Thu, 30 May 2024 09:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lthE=NB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sCbhP-0007jh-IM
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 09:03:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260d::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87bdd136-1e63-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 11:03:50 +0200 (CEST)
Received: from AM8P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::8)
 by DB8PR08MB5499.eurprd08.prod.outlook.com (2603:10a6:10:fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 09:03:47 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21a:cafe::d1) by AM8P191CA0003.outlook.office365.com
 (2603:10a6:20b:21a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Thu, 30 May 2024 09:03:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7656.0 via
 Frontend Transport; Thu, 30 May 2024 09:03:45 +0000
Received: ("Tessian outbound a0025cf119c5:v327");
 Thu, 30 May 2024 09:03:45 +0000
Received: from 2bc1eb3bc0f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 69D9C1F4-9622-4E9D-9857-0D0B855F1120.1; 
 Thu, 30 May 2024 09:03:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2bc1eb3bc0f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 May 2024 09:03:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by FRZPR08MB11190.eurprd08.prod.outlook.com (2603:10a6:d10:139::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 30 May
 2024 09:03:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 09:03:36 +0000
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
X-Inumbo-ID: 87bdd136-1e63-11ef-90a1-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JYqwl4xl0KhAUQMUblpOGdPch8MJf7oMSG7e16o7jhrxNT3D1oCKsBKieyoSOYKB1psNhc9DUfA8V2yCGOfhVRJb73mK2vq4DYFBLvFM5aiYsc8ENRAZIeveuIbUjU377TAHCkssmgu2En/uXevkfbFnWTunZ/EN+Tkh56/cyuei7TugjVgKcwC6fl/n+iIVJD1HC7vKWY4FeFS2sjpRoiS8u7jAE4BrFl/mQg4YQZ0nJOdQEw9chQxYOiaan4p/oyvYnsxf5sEZbqCRs153+ZdX/tzJWU3CtCCFdfIHY/bvKtiJtnmILaW7Vd5qYLBK9FR2K5qs6Sr0qXnzXYTcig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBf+gGNTpvlyPFsg4FGV3jSyPfiHCbGdaEQksFAO3Dw=;
 b=blpvcJCtYdqeiY8YiMlk3aDmxfyWxAMN0sWUoWNZSQUpe5Msg5aJI+7rqPqrA+Lw+4mPA557i+CZmIwFsZm9kq61/xTlcenGcraZ2Ec0kD+2yWBdUPLeeCAmzeGjd1awuuGHMYypJR+K+CUpHKioxOCSlPjLO2mcl3fxcNlhrPgJ0z7OSo0nYlMsLzSLrFyn7MQPUbKCG1GaFSwnvP+t3Ifyz1HGTS+zomP3P3TrKRYcXEl/6QscBfN9bkm81LpZnmQzVSWoGqBHQfmBgtGR0TRs7UKcucHQcjtpz6jIe5JNOEIh1coQ7ImSNcVGDi0aVB++L55u8HywBN9B0S+Iww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBf+gGNTpvlyPFsg4FGV3jSyPfiHCbGdaEQksFAO3Dw=;
 b=EleRQWOY+wNZM7dVQLK/8v7OeZL9Dm5kwfDKo8kfZqXgU+B3hdfu2jP1WPEflw7ur+67xr726a3yVeEAP0uvniwZSh9k6fh1JeHZwlU7x9PR1RkTZI6TGwQbigAY9RE1nAFbAnTun1eBZ59ZNUqEydmhWAd3ZwxDgBXsYh1UPlM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f2f7685686976c73
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIk4va0MznYfibV2SzVm3OuGpH1BHWIM3ppvrSNOzdrj3ZRpAxmCwMP74wpBrtGV0j1Vky3tooO04yjIub1xPpEkxWy1w/2Lep3S0b2TAigC35SZhZ54qG4vvJ7IKpIs4jwBMFotljTO+tnBadcbu0ZZwXpjrIcXuRg0gPA7qtwUEPb/XoLb9wCMOGXcIdANo8kS8+40SoRSUHsXV/KNMh84KfuaBgIqFJUBJ41y+MSt4kemMK7HcwaYGEK0tt+P2HXn3VjemRlxkUVeB0MO6GqU3q9p7VjePi1tHb9GrObCeEuDnDi+zTj1bnc0/alUoWkiQEghBtim5j7HpgjeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBf+gGNTpvlyPFsg4FGV3jSyPfiHCbGdaEQksFAO3Dw=;
 b=V6YSO6IsGSL8NI8381qZpcCv73U2Cp9J6VlR1+rXCQX4o2IbIz8fiR5Hd27xFsc5Sx2k2G/j2cxHQL8XYoRvc/WrZ/nlnS5OUjVacoqke2+/LJ879zogE6Z6sZ4hIDma48Tx25+gdUNdsMOR0mONDvI+vHGQkb4MSqHWZVWLyhubq8J8aR2x8KmPtZyo9WnPE+GUr324lFLXIjvaJNkuytsOiIzvPujNrimHCPPd2D8TdTL6a6fsbiTcS2xBrWeEgSJBpRW0P9SoWOmCtvU2FNo7nYIbngkE/xxZRzgmtsUMn7of2MmSa+B2Rw+FpWvxmZNv2BlUFZu/+lftRc3dpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBf+gGNTpvlyPFsg4FGV3jSyPfiHCbGdaEQksFAO3Dw=;
 b=EleRQWOY+wNZM7dVQLK/8v7OeZL9Dm5kwfDKo8kfZqXgU+B3hdfu2jP1WPEflw7ur+67xr726a3yVeEAP0uvniwZSh9k6fh1JeHZwlU7x9PR1RkTZI6TGwQbigAY9RE1nAFbAnTun1eBZ59ZNUqEydmhWAd3ZwxDgBXsYh1UPlM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm: dom0less: add TEE support
Thread-Topic: [PATCH] arm: dom0less: add TEE support
Thread-Index: AQHasgjZKwS4pdCyJUe9LewXYMLHeLGutaSAgAAAkICAALRFAIAAEesA
Date: Thu, 30 May 2024 09:03:36 +0000
Message-ID: <91FCE951-780D-40A3-BF67-4788FA80DCE8@arm.com>
References: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
 <be133b0b-5b22-4b82-b5f6-3c257b45553f@xen.org> <87bk4oxpxk.fsf@epam.com>
 <eff6e2e6-5c58-4b19-99f4-3754f655210d@xen.org>
In-Reply-To: <eff6e2e6-5c58-4b19-99f4-3754f655210d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|FRZPR08MB11190:EE_|AM4PEPF00025F9A:EE_|DB8PR08MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: 23374a66-34d1-43b1-8714-08dc8087696a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?gZrZBjD9MswbsJB+QeWmP0Vqj79/RO+ThCLQNdW3S5udYSW6fAmitL2GUEOm?=
 =?us-ascii?Q?UWz8XySrA7p5IUvEtcQnjzqn5LPozlZBhygizZxdfwAn/uBYtvjycq9W9LyF?=
 =?us-ascii?Q?Fohx80g7z9msuY6U86RrAisr9ndlwKESu63fGzF+UTwcEou24NwCntd9vW7Q?=
 =?us-ascii?Q?b5fMzTxgcXroJ9l1tfK9A21nu9g8UGcmi5Mm2xjWIospFYm1n2CZOw0jl43M?=
 =?us-ascii?Q?pkimdfrqgOYkcKSPxuzFFcg/VXN626yuCd5QauyIuMxvFCjv3OKVSA1lmjfT?=
 =?us-ascii?Q?tA6DBSFTYc5xnzz6iq4UrepRhkf0dOz0d1EVlym++RoB75NsVWu5dvtODNL/?=
 =?us-ascii?Q?AcwFDJD6TQtRlPvYW9h0CIOaJFY2770KEoSEkci8y66NDJtmVHu9mrwoDz/+?=
 =?us-ascii?Q?xF3Z0AZ6rOgnm4heAsV5d71T43fzMq3kGg3GHSMwq8hK1WCGhJNAoz5FaAjL?=
 =?us-ascii?Q?4ATE/xkj4ugwmePDKYtYGuqwz68NTmdAtpaQYIapzMf3NLQejOMHq6QiFjBX?=
 =?us-ascii?Q?eQQxijBkL+UCxEZYJSJhUseb3iX+nNv1HSxkAhWnehZeVbwpajSbJEIC0JVw?=
 =?us-ascii?Q?Vqn+7FDztdzOU7VbfW1AJJ86yALlU5U0D5T1lc4JpBuNw2sGQJ7HKBg3+lbm?=
 =?us-ascii?Q?XeriAYQ+laLu0akAX7VH9MebzmBOlnlJAWHNS6q3TnoL2pOv/mcZKfGbm3ut?=
 =?us-ascii?Q?lgAenPoqeWp6+OTuYPBPX6caMRhoyVE5g3oS05nb3OP0jIxSiXkURvA7jyOH?=
 =?us-ascii?Q?KjcUhitDO4jt6MwIbb9F/qum28V7P9G/k9fUK/uoKxaXzcih17nAWWxSHYLl?=
 =?us-ascii?Q?iGpmtdlZ8lCkQ/BIQduk2UUWC1km+wPA/awhlxI9huFch0ECc78RmjrirqHW?=
 =?us-ascii?Q?FgNzsMh4p++ONaXzNJUPHA/VP4KlYIAOhKSn02mEzjGGXlkLPNJfholXAJz3?=
 =?us-ascii?Q?TNQ8GvmGKY4rEMlX7UKxNDza8YiF9NGLqjgE9iJ1AqcFeTwKeyV8CxgxHkWc?=
 =?us-ascii?Q?DJvXqKuEkhEqHw4HPU5NAXUPZVVRo9znvYM9SvaqSXafxz7zFz7P4w5ytm9F?=
 =?us-ascii?Q?IfmrzTwk2y9fXx5CMQPaa9Rh03iYl/gSx2HjQCoH7rXkeueBrO/7XKENpRof?=
 =?us-ascii?Q?Bhk9rnoiWbS+ajaS3JReIYEyL+h+YgO/wwr/Cf9PHm67ZMEvahs6WqE1hEg6?=
 =?us-ascii?Q?4JeqfBCgx0oBJpudxm4qNPNk66P+DYBZPfjx+GUYPXT+23BZdqpQEhEqQlN8?=
 =?us-ascii?Q?4Nfh5xH5aaGNv5NNcSBIKKkDYImaOlBYa4Az6wVVGGekXvBPSRXN4IcorgZE?=
 =?us-ascii?Q?el9BwZfuwRWMywfBms8ouQ8bFCdchWpNKwkAwFg9qHl5Gg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F5E7A21EE3C5CA48AF09995F75C68F33@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11190
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd2f1c10-4442-4cb8-9ab3-08dc80876427
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PC9rnt+LPrdxWmprW7oyZ1VJzXrdtK17x7YaTMiRTtqh3bzf2Z6DMYQp68bg?=
 =?us-ascii?Q?t3MMvrn+5PvvhhXguPpy7NBxZVO6XETK2Ggha5c6UumqvbtkLoah0Y4g4T9l?=
 =?us-ascii?Q?g1mVJUWhvsB1pJi3RhNfL2i0YT+9ZCG6CihrfzW/KwoZ0Mjem5sxZavs2GgL?=
 =?us-ascii?Q?h2BmTm8B1SGGEfnkQziJQ7/FveZx2i04QVHcN8MY9WWldviZKk4M0dVRAXp0?=
 =?us-ascii?Q?fDCGTFYjhc6KoIbip790SLngfKFJIoVl8IW2bx/ZGzH/gp2td6eU1+0EhVGI?=
 =?us-ascii?Q?fXLpTJCqTFuWyIqTFxHiuGqJC7Dd514G+h5HHbODOeBz/wfdQlKFCKOIL++g?=
 =?us-ascii?Q?nYxFVfRKRDX1Iz/w9XIAObkxBpKESRyJb4ZOtyCXxFS7ltHr07nVihZBt1ad?=
 =?us-ascii?Q?g2QurSPB7ELo2FOmBGRgL4u946LpOdkFkDKkRznBIQZ18DupFA9OxURS9sd+?=
 =?us-ascii?Q?GnzC9SyRRAFsL9ql8B1zmgiPCYHaCbGvGohwRKC/G5LsqI5qAycyHXLxkbts?=
 =?us-ascii?Q?duFJ2uFAo01JNDx/AiKGbmV8xDEczI6ES1ZuwsT4gwa0KLARh2YSkc/68RlZ?=
 =?us-ascii?Q?nRl2Dp/0bwPW9uMTOpHT07kpepFxtcizYi6y1S4fu+ZDihY0lDfbdZlYsqxt?=
 =?us-ascii?Q?03wIaV1oUVTUajMXfN4K4Mn9AmGERpcWuiefHBdOkK25326zg0oZMo8ey3O/?=
 =?us-ascii?Q?FhMzcoz8xHRr36jDpntXKSrDTXaPCBhNjuOOcAUZvv5OGNQrhzFD3vIDlv7x?=
 =?us-ascii?Q?xi1RctbpkHsyKE5x8Id9CqKTZW2IVcl0hXJDqk/YN+Peswh+2L8cwWQMo16U?=
 =?us-ascii?Q?3wWnzoQA2IfzORp6N96mUuaIe8apC6ILFwpXrwp06njnHGMiBAipNyfHUYD0?=
 =?us-ascii?Q?+DyePzabaev9gIHDOTtUcLcn3pAsFv5b6IIMDXXGVDI2PRoNaIu3Z6fN+wyx?=
 =?us-ascii?Q?1AvHizGRlVvJS7bLfpHGZSeXrzYQDo30TcWZZkmUvsCoMUZdms0LfAb7cO15?=
 =?us-ascii?Q?30UBS+U3OZ/OmsPAHGfrbppKh6jNLG0cYrVzBG8qzL2bzPxDia2+nF6grnzl?=
 =?us-ascii?Q?Kn7hmnqUiUHqNT8YEW+B/uKImOboOV3KwAVk2YnI2yjb8TJyZ2c7YJQqye2Q?=
 =?us-ascii?Q?Ng2iriBpoGQYCBpKuJtL57IeFp0pqCblj3U+DhMZa9VdHQPoytNkVGhpn/In?=
 =?us-ascii?Q?dbTeKeya4euN1PhEGCSQ2lmltRF3U2QBtFQLUvLu5WARuAd5YcvNAJK58AT/?=
 =?us-ascii?Q?DCmDxd5A1OTCjFNBMsK7MqgVGljStq/JMtKvz/jS9kti7WkkVvNFAs+egWBN?=
 =?us-ascii?Q?XZ6g7s8Nh1NExwI7jo9SX6BbsSdigzbYe7VHKtnR53aoP67ZyUUMqZ7EAIno?=
 =?us-ascii?Q?C6H+d1C34OrM/D8SPWprDw/OVSs9?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 09:03:45.6672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23374a66-34d1-43b1-8714-08dc8087696a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5499

Hi Julien,

> On 30 May 2024, at 09:59, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 29/05/2024 22:34, Volodymyr Babchuk wrote:
>> Hi Julien,
>=20
> Hi Volodymyr,
>=20
>> Julien Grall <julien@xen.org> writes:
>>> Hi Volodymyr,
>>>=20
>>> Can you clarify whether this is intended for the next release cycle?
>> Well, I don't think that this patch should be committed ASAP if this is
>> what you are asking about.
>>> On 29/05/2024 21:43, Volodymyr Babchuk wrote:
>>>> Allow to provide TEE type for a Dom0less guest via "xen,tee"
>>>> property. Create appropriate nodes in the guests' device tree and
>>>> initialize tee subsystem for it.
>>>=20
>>> The new property needs to be documented in
>>> docs/misc/arm/device-tree/booting.txt.
>>>=20
>> Yes, missed that.
>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>> ---
>>>>   xen/arch/arm/dom0less-build.c     | 69 +++++++++++++++++++++++++++++=
++
>>>>   xen/arch/arm/include/asm/kernel.h |  3 ++
>>>>   2 files changed, 72 insertions(+)
>>>> diff --git a/xen/arch/arm/dom0less-build.c
>>>> b/xen/arch/arm/dom0less-build.c
>>>> index fb63ec6fd1..1ea3ecc45c 100644
>>>> --- a/xen/arch/arm/dom0less-build.c
>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>> @@ -15,6 +15,7 @@
>>>>   #include <asm/domain_build.h>
>>>>   #include <asm/static-memory.h>
>>>>   #include <asm/static-shmem.h>
>>>> +#include <asm/tee/tee.h>
>>>>     bool __init is_dom0less_mode(void)
>>>>   {
>>>> @@ -277,6 +278,42 @@ static int __init make_vpl011_uart_node(struct ke=
rnel_info *kinfo)
>>>>   }
>>>>   #endif
>>>>   +#ifdef CONFIG_OPTEE
>>>> +static int __init make_optee_node(struct kernel_info *kinfo)
>>>=20
>>> Please introduce a callback in the TEE framework that will create the
>>> OPTEE node.
>> This is the reason why this is RFC.
>=20
> If this is meant an RFC, then I would recommend to tag your series with R=
FC. Similarly...
>=20
>=20
>> I wanted to discuss the right method
>> of doing this.
>=20
> ... if you have any open questions. Then please write them down after the=
 "---" (so they are not committed). So this is not a guessing game for the =
reviewer.
>=20
> For instance, if you hadn't asked the question, I wouldn't have realized =
you were not entirely happy with your solution. To me it looked fine becaus=
e this is self-contained in an OP-TEE specific function.
>=20
>> "optee" node should reside in "/firmware/" node as per
>> device tree bindings. But "/firmware/" node can contain additional
>> entries, for example linux device tree bindings also define
>> "/firmware/sdei". So, probably correct solution is to implement function
>> "make_firmware_node()" in this file, which in turn will call TEE
>> framework.
>=20
> Longer term possibly. But at the moment, we have no implementation of the=
 "sdei" node and I am not aware of any future plan. So I don't think it is =
necessary to split the work in two functions.
>=20
>> But we are making assumption that all TEE implementation will have its
>> node inside "/firmware/". I am not 100% sure that this is correct. For
>> example I saw that Google Trusty uses "/trusty" node (directly inside
>> the DTS root). On other hand, it is not defined in dts bindings, as far
>> as I know.
>=20
> TBH, if there is no official binding documentation, then Xen cannot sensi=
bly create those nodes because they are not "stable". So the first step wou=
ld be to have official binding.
>=20
>=20
> Bertrand, I couldn't find any documentation for the FFA binding. Do you k=
now if they will be created under /firmware?

There is not device tree entry needed for FF-A because it is detected throu=
gh a FF-A call.

>=20
>>>>   /*
>>>>    * Scan device tree properties for passthrough specific information.
>>>>    * Returns < 0 on error
>>>> @@ -650,6 +687,15 @@ static int __init prepare_dtb_domU(struct domain =
*d, struct kernel_info *kinfo)
>>>>       if ( ret )
>>>>           goto err;
>>>>   +#ifdef CONFIG_OPTEE
>>>> +    if ( kinfo->tee_type =3D=3D XEN_DOMCTL_CONFIG_TEE_OPTEE)
>>>> +    {
>>>> +        ret =3D make_optee_node(kinfo);
>>>> +        if ( ret )
>>>> +            goto err;
>>>> +    }
>>>> +#endif
>>>> +
>>>>       /*
>>>>        * domain_handle_dtb_bootmodule has to be called before the rest=
 of
>>>>        * the device tree is generated because it depends on the value =
of
>>>> @@ -743,6 +789,9 @@ static int __init construct_domU(struct domain *d,
>>>>   {
>>>>       struct kernel_info kinfo =3D {};
>>>>       const char *dom0less_enhanced;
>>>> +#ifdef CONFIG_TEE
>>>> +    const char *tee;
>>>> +#endif
>>>>       int rc;
>>>>       u64 mem;
>>>>       u32 p2m_mem_mb;
>>>> @@ -786,6 +835,18 @@ static int __init construct_domU(struct domain *d=
,
>>>>       else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore=
") )
>>>>           kinfo.dom0less_feature =3D DOM0LESS_ENHANCED_NO_XS;
>>>>   +#ifdef CONFIG_TEE
>>>=20
>>> I would rather prefer if this code is implemented in tee.c. We also...
>>>=20
>>>> +    rc =3D dt_property_read_string(node, "xen,tee", &tee);
>>>=20
>>> ... want to return an error if "xen,tee" exists because CONFIG_TEE is
>>> not set.
>>>=20
>>>> +    if ( rc =3D=3D -EILSEQ ||
>>>> +         rc =3D=3D -ENODATA ||
>>>> +         (rc =3D=3D 0 && !strcmp(tee, "none")) )
>>>> +    {
>>>> +        if ( !hardware_domain )
>>>=20
>>>=20
>>> I don't understand this check. Why would we require dom0 for OP-TEE?
>> OP-TEE is enabled for Dom0 unconditionally in create_dom0(void);
>=20
> I am sorry but this still doesn't make sense. AFAICT, this path is only u=
sed by domU. In some dom0less setup, we may not have dom0 at all. So why do=
 you want to prevent OP-TEE for such case?
>=20
> Or are you intending to check that "d" is not the hardware domain? If so,=
 you have the wrong check (you want to check is_hardware_domain(d) and AFAI=
K this path is not called for dom0.
>=20
>> This is another topic I wanted to discuss, actually, Should we use the
>> same "xen,tee" for Dom0? In this case we might want to alter Dom0 DTB to
>> remove TEE entry if user wants it to be disabled.
> Is there any existing use case to disable OP-TEE in dom0? I am asking bec=
ause removing the nodes will make the code a bit more complicated. So if th=
ere is no need, then my preference is to not do it.

I would say there are several:
- optee not supported in Xen (dom0 cannot access it anyway)
- optee to be used in a guest instead of dom0
- ff-a used to communicate with optee (in this case optee support is not us=
ed but ff-a is).

On this subject, I will not ask you to add support for FF-A for this but wh=
atever you do please keep in mind
that we will probably add the same for FF-A so that we end up with somethin=
g coherent where the tee can
be selected by configuration for guests or by device tree for dom0 or dom0l=
ess guests.

I will make a path on the next version of the patch for this.

Cheers
Bertrand



