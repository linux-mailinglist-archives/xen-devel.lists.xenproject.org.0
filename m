Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D508A5C29A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 14:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908127.1315277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzdI-0002fy-4k; Tue, 11 Mar 2025 13:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908127.1315277; Tue, 11 Mar 2025 13:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzdI-0002e6-28; Tue, 11 Mar 2025 13:26:56 +0000
Received: by outflank-mailman (input) for mailman id 908127;
 Tue, 11 Mar 2025 13:26:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azTi=V6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1trzdG-0002e0-CR
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 13:26:54 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e4c152b-fe7c-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 14:26:52 +0100 (CET)
Received: from CWXP123CA0005.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::17)
 by DU5PR08MB10660.eurprd08.prod.outlook.com (2603:10a6:10:51d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 13:26:48 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:401:73:cafe::a8) by CWXP123CA0005.outlook.office365.com
 (2603:10a6:401:73::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 13:26:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 11 Mar 2025 13:26:47 +0000
Received: ("Tessian outbound 68993334049c:v585");
 Tue, 11 Mar 2025 13:26:47 +0000
Received: from Lf30772f9515b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D53D5C6-C03F-4B8A-B56F-5C0230249073.1; 
 Tue, 11 Mar 2025 13:26:40 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf30772f9515b.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Mar 2025 13:26:40 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB8928.eurprd08.prod.outlook.com (2603:10a6:20b:5fb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 13:26:34 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 13:26:34 +0000
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
X-Inumbo-ID: 7e4c152b-fe7c-11ef-9ab9-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=f2DiNipdUcDc6DR1f6ZyNlr/DFgq2PADeVqIHTXF2hgZkRUCKffzo+/gGXzw8teVU6u8J+dG8+2Tg5EtRBCvs7kFBn2r0p2pxuGPwBqXroiH7tYttFkZCr1b+Q+CdzZIrJ11bAxTPXwF+Qed1PcFu1xE3QRjgJY5Py1/v3gG8BMIDEekBzefY1OIgFPK0h+8fq/NubACbOjg0Y8CWyMXEV6ZTScsP1MjFyOD6WnWRIIIaL3GXlSncBh2ttqbdvwyjrk2hlFwswiMQYfkFu2bVAm+rgMrKpwqAXyvAgqFfcXLjigZa5OlQ/XoJipG6UPm6RANgJla/hJz5VtEvpOC+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9NQZ3BDqrgJzkgCiJowRBuLXW/eZjQYayZ9t22HBDs=;
 b=S0U3SEcHoeOx58TNH+saHhcWjr2T2tXy6S1NgTO3citjozwBGg9kQo+B13aDibaeD/kR2rT7Xj3m1UUiF+w55YubHVOsquTmD57fuPrXLK6T5K7dqgG1UXYsqnsQzQKp0UGGxFterBaV6YaOC7pld8wFo+pWXigwOgQmhJ9BAmLxsfqpWAOzFgKJXRZ4iVcRJsF6RP9jPx+JUya1j3UDnO4ry+NLDCpqV0y56oMHMLxdCKgrRnoR1DleciK98jvNqKjkP9whGEV0xqQx62QcL3ldNJ7s59FUTgOD7l4aLG2nBOddB0qWiKwJ4s1Lky7U69t15h/QsZRnXL4qHu+Q6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9NQZ3BDqrgJzkgCiJowRBuLXW/eZjQYayZ9t22HBDs=;
 b=EVsx2BMvo9RObMl4PiNGCn16Of/hBuFvRrTA0ebS0wX/0acYgsAB217WdV/8gmQsKC8jNXJnu7/wAXpQZfgGnpFg88bg+87wEopj+/iqATMvTtocK8lSXU6ls93/n4Lk0VZ2yPwdISCns60Bxu3SaHC8lTya8VeoT/V8QM4flHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb02871ef85a9609
X-TessianGatewayMetadata: ro0fVwQgGngrJBlU7YEepVejVyQbT6Ll5J87qweZxXKqJ4ohvupgEXk+eHr5vj9oA5SHicskzGHpjGMpsDeQoJPtsFEle84OscxhA+nYe/eAsfYu3u52pQHF9AyKctjKxccEXh7IDx/RTyI7zxaeKS+jDTdLxwFx700Y/IMLig0=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vmll9J5YaqwH3q7kUXrX+cWSWzIhrBtarcw/VquX80/pgPqjdRAnnqb4043taccNgjim64u5iTWILIFqku+w0nDpnwCotw5DGVQg114oF7jdmd97eG6MG40TTgQtlj2T5dt6S/82pJUmTUkDacC/USsvZiat2q7agDxjuwRPNpO75lrHYgyRXd/fFs19nnlFiJwdVRqBJmeUbZRIZkTMk5AJpkY3oH2+Rw4Z+Q6VB3Rc4NDxKL+oBMToCx5djvcj9EzdjfBnw0Pc9qHFLTMkQY87o50kDRQERkCRzAE0wgTKoB81i7eHaiE9TzKNcXfHceUb7e0BFlfHUvz7++JKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9NQZ3BDqrgJzkgCiJowRBuLXW/eZjQYayZ9t22HBDs=;
 b=RRdMZbsv79PDiaLqvGErq/fCSRxDjH4R1cD5HBtSh/NEosKwx0u6CuT6aEwAXOBP/nvCWyw73ILCpjJcq7jhjyxiEqv++CcWrJNOxfUg64Li24+IZxvZsyb5HSrG3sVY+SzTSEe9mNjf5jLZ/Oyg5rYcBj1ahU3MR2REmerSxpvJbPMjQLfLDRmiAnc8QdNBVHQDvBxRl0TEFFVoRRhLg7OVX2fDS0z/ifEkp+9aFWgEN3FHmzmmwjct4Ifoo/0rWyUUoe9HPB5+hFLqmS0h5b/OavJWKnYvjIOIuIB2+CxOj3yabVf3ifIObkvchleGq299um9EPePGWsINbcv6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9NQZ3BDqrgJzkgCiJowRBuLXW/eZjQYayZ9t22HBDs=;
 b=EVsx2BMvo9RObMl4PiNGCn16Of/hBuFvRrTA0ebS0wX/0acYgsAB217WdV/8gmQsKC8jNXJnu7/wAXpQZfgGnpFg88bg+87wEopj+/iqATMvTtocK8lSXU6ls93/n4Lk0VZ2yPwdISCns60Bxu3SaHC8lTya8VeoT/V8QM4flHg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Thread-Topic: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Thread-Index: AQHbkmScFxwSwnbWbUmo6sX8GQY3CLNtq7oAgAAILgCAAAOLgIAADxuAgAAnBoA=
Date: Tue, 11 Mar 2025 13:26:34 +0000
Message-ID: <69752546-1957-4515-B32F-DB541391AE8F@arm.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
 <20250311090409.122577-2-michal.orzel@amd.com>
 <69E0A550-5B43-4AE4-AD19-0456AA280871@arm.com>
 <2d66e9e2-e6a4-4552-960a-2e8d95555ff4@amd.com>
 <17173844-577F-44C0-AA74-984ACAEBABC3@arm.com>
 <8b06403d-02c9-49d1-a5d9-5aef57dde3cc@amd.com>
In-Reply-To: <8b06403d-02c9-49d1-a5d9-5aef57dde3cc@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB8928:EE_|AMS1EPF00000048:EE_|DU5PR08MB10660:EE_
X-MS-Office365-Filtering-Correlation-Id: 5145d59b-5604-4dc7-b8c8-08dd60a05fb5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?mkO9jvLhPLYLZWBc+nI3QkDHjZLRSOrvBxR2P2WMggGx6NyGKLAS840aBQsP?=
 =?us-ascii?Q?KwP8SvmM4Gl32bPPlOEbAMRkMWez7P45aUHdO00oImueNXZN19WZEepVFZRk?=
 =?us-ascii?Q?82Ii95PdvvpY618nAWO82RfpSTDp1lokMCOPOtAnUlmameAyTdvHbQK3MKZ9?=
 =?us-ascii?Q?RzyAvYJKWtGKYCePgPRuBh3x0dlwjR7ERWGyMPlltGU4NlSOL7DdPcKDYpzv?=
 =?us-ascii?Q?9AoFb5CIg5l2VvGUW3/LcwMoeLjhdYII+M6nrvdaSloSdw8Q3VL63E9xsCuK?=
 =?us-ascii?Q?ozYpT41TtWf16sb4lbHUrmOZrpiW0Ku0LahehgNC3AE0rHRESa4um02Iz8dh?=
 =?us-ascii?Q?y5PA/mc/QrA+mBjkF0bzwfqTB9L1xtVHx9xKJFtC7iz8ACcEosZXQuZl+PBq?=
 =?us-ascii?Q?S/1PfRRlnYeBRI87gdtdIoydn01O5G1PvS0BhlGAkwCDWSVu19ngfN+qlaXH?=
 =?us-ascii?Q?60Q/MnSR8+zJZCjgrh967Z+FJ9XPajH+qnkHciEikQYiQ5sxEHJhWgXAmvnt?=
 =?us-ascii?Q?1kxAyMCEpI8FddPdUJD1oATfnx4TpRqs6oKUTMo2hy1z6MY8gcRJ/zz85JNM?=
 =?us-ascii?Q?2FuHU4QDAwU54p2ABzI99EDtpVyjbVkJIfrmPrhqWQHnTWABF/XXEoUKhByA?=
 =?us-ascii?Q?QaUta1aRNRZ3BYvGYdkv/nBeSau9HkEN8xx0Pq5XjZpMkDsY8MxGWFXXMqSt?=
 =?us-ascii?Q?phZVboqEMZscWNK1yPZWkhtOIzrbYrbuVApLhYCzA5P+T0HymSKabiMCXX/9?=
 =?us-ascii?Q?KWu03yqeQHTBQuFaR5ZTAO9MUZWqtaLHCFOuQzJwde+6snADWfOKwLANJGHw?=
 =?us-ascii?Q?6uac1CC26TWzvmGtv6cuuqck+hYgnl+aotlOH2uQK/tDcmiFT3rqzFIusu67?=
 =?us-ascii?Q?OuD8MIqrd54sOXgJx/YO40KO7EYBSEouho+w9diKFHftvMBh/SygfBgLv2b5?=
 =?us-ascii?Q?PGHnv/t2CW6qE/9pYBBWnheUIzLAcDBFE+ojIOKetTa6/WBzPj4Y6DjDttvk?=
 =?us-ascii?Q?XgzSzRUtVaqm9X53ITwc/19dOJ9FySTqrFS/7RkR8InqzraxNBZICA2fosrr?=
 =?us-ascii?Q?wSYlpVTCmfkg/5kx4+I6dCTYfnKf+9IeHTDcaaxXcmL2D6721LnZ5f6/Ph6H?=
 =?us-ascii?Q?VXWnmUp1QniT+zj783U7p9RtJ+uAElgJWLSk7nYIi44XzN9jiik9XzBNSuaH?=
 =?us-ascii?Q?HBRHyGgENppvej4ifB1gGMYM1rsPKG8fR8X3iBEOsT4xzR+Y5b4VST97UmG/?=
 =?us-ascii?Q?/LEpK9QP1o+HURuL4GWRK0IcSKhZ21JgQPzqXtqVh95r9VqYKKiD+/fULGTG?=
 =?us-ascii?Q?UF5vO3gZ29sAtvfhQpWuxuSYhWCDVmTb1RMblGhowKyW+MQkYKOhFwwjjl9y?=
 =?us-ascii?Q?8NckVJNUS1687ZWm/jqnXcqXCKlQgNTACVF+7LIIeXqYRXfWgnPfSPAvxl3F?=
 =?us-ascii?Q?T2w/p179zXEB9CIL26/aqhirmO8aEVg/?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E0DA4CFF976D6543BFE30AB112360F07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8928
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af6faae5-7376-4424-8f0b-08dd60a05830
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yovP0UkJlFb3vv1hWaN0cFq6+8Noqnqr50igAdaBl5EKKFcdHSFYvShb5Hai?=
 =?us-ascii?Q?MY15tmgZSOyoYJE+ljKFMJjiJS+jWt318SUV9V22nzdwk+IR4vO4uC6jE/Jl?=
 =?us-ascii?Q?e7G7ZfxL98fpnA7s4lHCHdGNK7LQQljnqwS/ba8Fts+XdlEl95GRNb1wZ8RV?=
 =?us-ascii?Q?z4qzR38x35hDLoq7PyK+DfHgcVDPiMyo3Pm3iWyqXQ32TtM6gnCgg1NrjM8x?=
 =?us-ascii?Q?OsRGAG/LxjJ9oFrhEM4CuQHsBWq+RWyFqd1GTVYv3+a5+XxoqS0mHgGkrXJg?=
 =?us-ascii?Q?baqAcnfd0HKs8DIl4N3VnJ8BXXVHLk5kvAjBZ9Nf6DrfT5eB5m8/L/WPiK3I?=
 =?us-ascii?Q?u05VVgYPtiQAtG3T/PzrkpydJSqVj6UbyvsLkicZM3WSFX//xSB49MqjOK8A?=
 =?us-ascii?Q?3dd+JWHkMev5TuTwsQi9+yzPiHH5XNRDMLpzdEv6u1VEeRrReTbPHtcKkEv2?=
 =?us-ascii?Q?TJV2TRLDuyTdBYRHHQj8xnqKJybvMytqYYGvAXI230xnF7VkQ28GWDAT1cYZ?=
 =?us-ascii?Q?0wh56VtCS/Ih4S4frYjhMvO/hgixe734a4de2xnELVyOt2/2K3ql7k9Y89q1?=
 =?us-ascii?Q?c+djmiREA6pxGNPNcqyFvBHJItYaI3lHtMlUOVnlhkYGyjeMRF8cQWtNIqvk?=
 =?us-ascii?Q?jjMcUBx8AhKkjeyn/nz44QaYsaprP9EFNL94oVe3umRda0kYtD9ffGMx3yxf?=
 =?us-ascii?Q?/qsanK0vIw5estydb1dd6GRg8lY6nnGznSJe1xXsOr+lqoNhd613ObL51jyE?=
 =?us-ascii?Q?16o3Pf97AksCaBVGRBPSCNFXj/NDAc1sr2LlRiB/OwXKjgV1vxigS4TX8beG?=
 =?us-ascii?Q?acs9VIBZpEtDWFMXWrsPKxJf54F/iCvp2AAtyXVC4vis+EhR9H2XP5dKAKxv?=
 =?us-ascii?Q?tnNZsHABNHiCSyKAiUXMyIqxMiRSZfXNsgAcQTBqRVbMOEHssD33lOvu0Mdo?=
 =?us-ascii?Q?/YbRS6Xw37piwRCkL53pUX6IRmqBKjrpPeI8pXSTRcO9h5BvY5KpbQoUuMPA?=
 =?us-ascii?Q?lvgkMz+VJRNs48nQEZauti5xU0/38k5Hr4aBWcaPO7bnvmJtFUQcBaX22MXy?=
 =?us-ascii?Q?6dpPl/zpK0Mtq5nrgOzfE9TB3KHLY6TKg3Mr52dIDEsOTlNYdoEiqfOc8ftc?=
 =?us-ascii?Q?a/atAT8LqiU3Ez/3ifBZFa2VrZNw0BsQ2GFk7AId59nq5nqeZ0WQ9EAvkr2p?=
 =?us-ascii?Q?L9oH6NJV76XhHUsqqCTtUKbb0rqPLQKj0iNL9FzgQZMNyNh2Khy4kFU5CfyB?=
 =?us-ascii?Q?JQXK3latNxVW8EfR90cOFCAdApirNbgBvA/vOPlydWzXkCnsZPcfJEaeuE+S?=
 =?us-ascii?Q?fMGyljsA6uK8MSPgCvER8jNV925YkfWLqt5K7oy7fbVEfbwpwihWFUyXhIxM?=
 =?us-ascii?Q?udhiL4FmNr2qiHxgs7GdI0jLaRqNKgXvmsyGNAmlP8lJdV71PCRxaYdNBTjK?=
 =?us-ascii?Q?smXzvh9fn4YuQdIhTU7qQu/oLdpdrkFfveThjMwpusvwD1T7Q9Zz0xdA0Iy5?=
 =?us-ascii?Q?ATAizruYnUpAoZA=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 13:26:47.2319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5145d59b-5604-4dc7-b8c8-08dd60a05fb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10660

Hi Michal,

> On 11 Mar 2025, at 12:06, Orzel, Michal <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 11/03/2025 11:12, Bertrand Marquis wrote:
>>=20
>>=20
>>> On 11 Mar 2025, at 10:59, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 11/03/2025 10:30, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>> Hi Michal,
>>>>=20
>>>>> On 11 Mar 2025, at 10:04, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>=20
>>>>> At the moment, we print a warning about max number of IRQs supported =
by
>>>>> GIC bigger than vGIC only for hardware domain. This check is not hwdo=
m
>>>>> special, and should be made common. Also, in case of user not specify=
ing
>>>>> nr_spis for dom0less domUs, we should take into account max number of
>>>>> IRQs supported by vGIC if it's smaller than for GIC.
>>>>>=20
>>>>> Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 val=
ue.
>>>>> Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC m=
ax
>>>>> IRQs comparison common.
>>>>>=20
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> ---
>>>>> xen/arch/arm/dom0less-build.c   | 2 +-
>>>>> xen/arch/arm/domain_build.c     | 9 ++-------
>>>>> xen/arch/arm/gic.c              | 3 +++
>>>>> xen/arch/arm/include/asm/vgic.h | 3 +++
>>>>> 4 files changed, 9 insertions(+), 8 deletions(-)
>>>>>=20
>>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-bu=
ild.c
>>>>> index 31f31c38da3f..9a84fee94119 100644
>>>>> --- a/xen/arch/arm/dom0less-build.c
>>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>>> @@ -1018,7 +1018,7 @@ void __init create_domUs(void)
>>>>>       {
>>>>>           int vpl011_virq =3D GUEST_VPL011_SPI;
>>>>>=20
>>>>> -            d_cfg.arch.nr_spis =3D gic_number_lines() - 32;
>>>>> +            d_cfg.arch.nr_spis =3D min(gic_number_lines(), VGIC_MAX_=
IRQS) - 32;
>>>>=20
>>>> I would suggest to introduce a static inline gic_nr_spis in a gic head=
er ...
>>> Why GIC and not vGIC? This is domain's nr_spis, so vGIC.
>>=20
>> yes vGIC sorry.
>>=20
>>> But then, why static inline if the value does not change and is domain =
agnostic?
>>> I struggle to find a good name for this macro. Maybe (in vgic.h):
>>> #define vgic_def_nr_spis (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
>>> to denote default nr_spis if not set by the user?
>>=20
>> Yes that would work. My point is to prevent to have 2 definitions in 2 d=
ifferent
>> source file and a risk to forget to update one and not the other (let sa=
y if some
>> day we change 32 in 64).
>>=20
>>>=20
>>>>=20
>>>>>=20
>>>>>           /*
>>>>>            * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map i=
s
>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.=
c
>>>>> index 7cc141ef75e9..b99c4e3a69bf 100644
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -2371,13 +2371,8 @@ void __init create_dom0(void)
>>>>>=20
>>>>>   /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>>>   dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>>> -    /*
>>>>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>>>>> -     * 32 are substracted to cover local IRQs.
>>>>> -     */
>>>>> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int)=
 992) - 32;
>>>>> -    if ( gic_number_lines() > 992 )
>>>>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.=
\n");
>>>>> +    /* 32 are substracted to cover local IRQs */
>>>>> +    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), VGIC_MAX_IRQS)=
 - 32;
>>>>=20
>>>> and reuse it here to make sure the value used is always the same.
>>>>=20
>>>>>   dom0_cfg.arch.tee_type =3D tee_get_type();
>>>>>   dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>>>>>=20
>>>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>>>> index acf61a4de373..e80fe0ca2421 100644
>>>>> --- a/xen/arch/arm/gic.c
>>>>> +++ b/xen/arch/arm/gic.c
>>>>> @@ -251,6 +251,9 @@ void __init gic_init(void)
>>>>>       panic("Failed to initialize the GIC drivers\n");
>>>>>   /* Clear LR mask for cpu0 */
>>>>>   clear_cpu_lr_mask();
>>>>> +
>>>>> +    if ( gic_number_lines() > VGIC_MAX_IRQS )
>>>>> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\=
n");
>>>>=20
>>>> I am a bit unsure with this one.
>>>> If this is the case, it means any gicv2 or gicv3 init detected an impo=
ssible value and
>>>> any usage of gic_number_lines would be using an impossible value.
>>> Why impossible? GIC can support up to 1020 IRQs. Our vGIC can support u=
p to 992
>>> IRQs.
>>=20
>> Maybe unsupported is a better wording, my point is that it could lead to=
 non working system
>> if say something uses irq 1000.
> Actually, I took a look at the code and I don't think we should panic (i.=
e. we
> should keep things as they are today). In your example, if something uses=
 IRQ >
> VGIC_MAX_IRQS that is bigger than gic_number_lines(), then we will receiv=
e error
> when mapping this IRQ to guest (but you don't have to use such device and=
 in the
> future we may enable IRQ re-mapping). That's why in all the places relate=
d to
> domains, we use vgic_num_irqs() and not gic_number_lines(). The latter is=
 only
> used for IRQs routed to Xen.

So you will get an error later such an IRQ is mapped to a guest. Tracking w=
hy this is might not
be easy.
Anyway this is a hardware value that the user has no power on so if we pani=
c it would mean
Xen would never run on the given hardware without any chance for the user t=
o workaround the
problem so maybe the Warning is the best we can do here.

Maybe others have an other idea here but i will not object to this.

Cheers
Bertrand

>=20
> ~Michal
>=20


