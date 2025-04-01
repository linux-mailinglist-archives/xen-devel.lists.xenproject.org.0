Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71369A77F92
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 17:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934619.1336272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdvQ-00067m-Sx; Tue, 01 Apr 2025 15:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934619.1336272; Tue, 01 Apr 2025 15:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdvQ-00065r-QC; Tue, 01 Apr 2025 15:53:16 +0000
Received: by outflank-mailman (input) for mailman id 934619;
 Tue, 01 Apr 2025 15:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hrmQ=WT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tzdvP-00065g-1z
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 15:53:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f403:2612::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b2fce56-0f11-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 17:53:13 +0200 (CEST)
Received: from DU7P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::31)
 by AM9PR08MB6179.eurprd08.prod.outlook.com (2603:10a6:20b:2da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 15:53:08 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::f7) by DU7P190CA0007.outlook.office365.com
 (2603:10a6:10:550::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:53:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:53:08 +0000
Received: ("Tessian outbound d933a9851b56:v604");
 Tue, 01 Apr 2025 15:53:08 +0000
Received: from L33970440cb72.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90AFE4F8-7A86-4B1D-86F3-71C449262F14.1; 
 Tue, 01 Apr 2025 15:53:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L33970440cb72.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 15:53:01 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB8929.eurprd08.prod.outlook.com (2603:10a6:10:464::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 15:53:00 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:53:00 +0000
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
X-Inumbo-ID: 6b2fce56-0f11-11f0-9ea7-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mNkFiDa4laKkWdgVtDnKiTEw6BR5DTqaILzC0TfiFLIzdO1g7SkoRhFw9fMvIQHzYrdpX19DhuyAmEekYxA74yf6t0sTZPiqVfLBTDpR83BcD78pNZaaQC3A4/b0TJPNhyRXRyQS7gxgUXppo/TgW3fY61gKPcaoyR5NCpRmplsuCFhizFvI2K0IPjQC3J4/2dRxUM9QmB/z9RM++7nIck3siB+aezYzC1fvfB1IwCzs9mobe08QD8dtY7TBgJIdBTIzALhE9o3M2Oxr7x8y27uG/d5Z2QR01CLqkGVoFz38DE1R4T7LcFA7u/7Ttu7NbbSEknQBXOF39tdth+J4Bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUnVTkXdokWyRjr7ZWijg/ttinPRRX4MA2YSQFbSTc0=;
 b=QiSW4KZX91qvZRbh+B/ImJCXiJc8cvWA3kHi/+pCKzMVikdglfCE23S60e2/atjHuDQWf0/k1BolrA67AcznWLDR5IMH/o3hloRE6b8HYs2WU2DFcFaDDdK9CxhOehSzkpdJiBSbDuTXIqEmLcb9OshoJcvjgut61KNdp0+MsKERCgu4aAAq4+50OuHLWFOd2+PL90t/9Ol2RbSXyO/1By28ufj+ZtfJMCt9SOXtE7J4xEvu0noLQ0Vq5uocNAdi+DPu+t4hEgA5pH05TLRfVSoO+imb9UoaM/Ll9wcK5uZ8P6XBBYY7Cx26QBuhHaIzfM2Wl5WYIrMyWcbKi9YznA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUnVTkXdokWyRjr7ZWijg/ttinPRRX4MA2YSQFbSTc0=;
 b=MkpwIJEBDTU2OfzWaElpojs3WkqU70IlcGL0X1IAVtgMtLaqV7omgTd2YBOs7dCRPLhzWNcEE57WOgfHnc+D2FTfaA3AC4efkIkl+o0yXaKsCodJYv6wGlTQwoR4+QqITfU2M7GL8Tbu+2niTk6+E99gr/KxJrq7ytBxPsbYqYs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64e72adaf415f2fe
X-TessianGatewayMetadata: kQdjICLw47UegUDOXvnoNU7shGaZJVziiH8v/liJYkMhoNdxvMR1GfGtMEj8T/PMdATY2zs0mOVYqK6oGNJOZ2hAf0gUE1oBA4dMx8q+3lJvKYZhHudFN7jRYPdDs/GZrDRegriEI87lYdublptG6Y0SpQ4vVIgTgHt4eP1KRoI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJAWrmgx9th0CcEtUT8ueYyPu3/EZZobufomqFf2Wr8H7uR0FrtDwxYFJShHd9h98l+eMs11XbaZnl8Neyo40f+RD5sTeoAx6OWxdytUxjv4w24/UYIIlhq6U8/SkkINcGhoTS9ZfPRfK3uKYcGEsQHD4SchNaIf1QL0GKs4U7N9T9mgoO9g9/il6lKLZU/RjBjyyrAPZfDMsWUwQiEQn8pCvLn/VedqJUj2uShbjBcMg03FSNULXa/0bGfkrccaXrOyZAgB3Y3OqhvSuYpJAGFzzbUMVo0de3Sh7SzCnzSKIj4qZer0sPRrA943db87X2rJcjE14DgOhCl7QatM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUnVTkXdokWyRjr7ZWijg/ttinPRRX4MA2YSQFbSTc0=;
 b=xUF37JjBLNxx8dJlvRenCLLAqeOVufq9xIddGHKAzlJEcEVTBlePggPNeKtQ+7VkLzIHvNJ0s+1BIkQsvlOIEL8nRE/udP5fz6MO/qBfN4EgiaLa8AnrDAoGWfxEouJEsGxlXQKYUI35c2ZT8oxZGaonaxMJPTrgRS3cb04UsPDNdykp6toHOlVzwqaUIz8ncsagGQk7GgDzPoKDfc8QnRwvn4bf8qqDGSH/hNFaM4Fu0xZnWIko8zAwc+drNv7TBADrTMhtXIlmSQstiAzA8Y7PnJ8KHgD7gWtWKfTxdwFEEuMpofmDBmAr0WR0yraAGko1AJfrLZ7QhPgr1lCjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUnVTkXdokWyRjr7ZWijg/ttinPRRX4MA2YSQFbSTc0=;
 b=MkpwIJEBDTU2OfzWaElpojs3WkqU70IlcGL0X1IAVtgMtLaqV7omgTd2YBOs7dCRPLhzWNcEE57WOgfHnc+D2FTfaA3AC4efkIkl+o0yXaKsCodJYv6wGlTQwoR4+QqITfU2M7GL8Tbu+2niTk6+E99gr/KxJrq7ytBxPsbYqYs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Topic: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Index: AQHbouXQNh7nKprt5k2iUHPtnXy/N7OOxVgAgAAX+QCAAAdEAIAACRaAgAAIxYA=
Date: Tue, 1 Apr 2025 15:53:00 +0000
Message-ID: <16D32474-F78A-4E50-AA96-BE96D76D95FE@arm.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
 <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
 <f7a6dd50-28d9-409b-8740-f4433f2fd72e@amd.com>
 <237153F4-56B2-40AD-A2D4-824B621D3477@arm.com>
 <25e30373-139f-4827-91e7-a2dd6e85c433@amd.com>
In-Reply-To: <25e30373-139f-4827-91e7-a2dd6e85c433@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB8929:EE_|DB5PEPF00014B99:EE_|AM9PR08MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: df75397e-7fbe-4ead-25bf-08dd71354c50
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DLDWtoRRoY6nadXSEKotcjjpWA8SU0akGlkppZlqu5SCGTYJmhfAOzah8OV3?=
 =?us-ascii?Q?vdn83ErSc6yiShjCvIBEgFAgpV/qyfP76pHE+0FovZYSJMarfDDUI4xznkVm?=
 =?us-ascii?Q?WFy5/D453l3t0wYyS32d2tlj77xSt99QbBCilMaJXiqULoo3D1dhRZ8hI3Fe?=
 =?us-ascii?Q?cjhybHd3fxxBEyRrNAk6jlb/SrDYHAjWRVsHWyeM3a8WgNgHBwTdv9QWS7ti?=
 =?us-ascii?Q?DNpqD6B9SpMADl6HAk7AriMBxHuidFn81ePwijbokU5PgKykDoWe2W8U5ABy?=
 =?us-ascii?Q?qJnJdpGSIEf9SH6bsVlFZMRGt53h629UOemuI/uK6lyRT5kFkgwqptTPEu/l?=
 =?us-ascii?Q?0P2t+I22urcSn7glunfKfF3khLNiAVzol3LfwOmbDwN85Hoo38VJDYDB9IM+?=
 =?us-ascii?Q?Ce0xTRlYUDdIAwKUmcRK+2uqRq7lL7HzxEHe9aUjoSLjuow5Y9tx/WJn19wk?=
 =?us-ascii?Q?1DNWoMXg3QIPZ7YASZdA5mBBtqgZhgWxIQlvR+a/0e2DmqtAPQEq6+RAgRuJ?=
 =?us-ascii?Q?tfcv0WUQfaVoUq/C8hxyqnDzbgd4V48cv5+W5DwPE+AREd5O0/EwgTL0sqpY?=
 =?us-ascii?Q?6n+FV+HsbMc4IaAg68lKr6QLJqKu/cy+g4lmk3WoxUPLS8g/0gviNJM/QBs1?=
 =?us-ascii?Q?U0TOQJd2KRQYtYHWGjvFV/R3GVkuouvDC8keDR7my247n+QXQEP+cGTuYmAP?=
 =?us-ascii?Q?JIIuBFvmkNgRjvFk0TOEQZAMkYOEoGj+tH2RilYWQuqcNZ81ACs2ScnvCedK?=
 =?us-ascii?Q?ulh/g6Dml4u7qzuQ9ahwRnAHE1Cjo13zWIF60EfuCXPE/Wg2N90rYWDFs+m9?=
 =?us-ascii?Q?+ap2aq6jabnxN6kDD/Xyvt59sUByBlACKYHIuSCwZg0crytdIX3KQZz/Cg1W?=
 =?us-ascii?Q?ZFpCvAQC0jXIh1uEFzUJ48ehVQVqvWGIGrrnMVawfHK8ob/lIjGnNJ3SdQuI?=
 =?us-ascii?Q?2CPDXleejQ6V9+50nUPYLY4w8hm4i14VfB1OjZLHyxpRkv4KfNgaMI4oVji3?=
 =?us-ascii?Q?xbmiyHLHPp3qjI8QYvz+qn30acyN6OSds7RRZZJ6h4xTaGSR3f/BXuxGGwmg?=
 =?us-ascii?Q?iFxS8v2A9MDXNboB1kRHVqiaGS8TxhlhIr9NPg+5HbEiOengfb7u2CLbCkz5?=
 =?us-ascii?Q?qup6lQ0D2Or2Y8oQR1UNIqGPBcTUPvvV9LPhVYQqW5l+TyoN6pg21s9lR7e4?=
 =?us-ascii?Q?x7/LerpDmAsRuBKm0nUggARrmhr9FUnxHsFQ7Fn7x2HV4Mr5x3cXW+FtNiP3?=
 =?us-ascii?Q?FTDhB+1BYtmnPlmRZYCxP8nECJowW5uRLJGO+370lHD8fxcfB5iVZFg+wviZ?=
 =?us-ascii?Q?Wp/uSsM3iSCgyG5Lk1dtJwXEbnQK4B61r016NHWf0QhMTHSi4pEiOHxMxxPq?=
 =?us-ascii?Q?gGwohHj7FNSR/hEwBs/O9N0Q9jQBiYX5nyuIM0XJ5sZxVGVV/dGgU1PWzwLm?=
 =?us-ascii?Q?rAT5mxggNo9KpU5qVkNsw5vCCBAuG5108vyT8igURmx+xbxOrmTgXQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CEF6908CDA4C7C41A5CFB7E7F0363972@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08c679ea-7140-4bef-c582-08dd71354786
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|14060799003|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qQzoTQdUDlvFj31NXXWREz/Va+N9SfGQsFLh6vkIYpbBWMOPIR8qp2aeEzRa?=
 =?us-ascii?Q?9s+uVlqkHhXjmFU54eEoY5PO8LjjXk1cs1T67axfz/VcHpInN+d5XEYpq/cJ?=
 =?us-ascii?Q?Ogv6OTg1t1OM8zxiw2K9rIIjEu2cGm3WvUV/yq35qD3j3PAg/MQ3hmSlUY6y?=
 =?us-ascii?Q?6wczGWQ7PD+BM+QSVyCdO9fHhNw/qSTbAYhlYiYqmCn+GLK3vsv+oEcVGKep?=
 =?us-ascii?Q?kNkX4nVVJQ+LJg994ntrZjDyEtSLp4NIyrHgFCAI501F7QPb5FcxtLnpHvvZ?=
 =?us-ascii?Q?8xdyCtaThJ1egkeva/KMlBcuJU4yS7c9N40D2W+U48sOOn5JbBcy8Ye1OxZe?=
 =?us-ascii?Q?g6GPfMYZNJYVYG+5JvS1N81m8tZbw77UTWWq1Axds3IAZbUQudgieeGwKz+K?=
 =?us-ascii?Q?R5uK943ScDMWHcliYmRE8uM4pz3WDCnYPQmVsHo1K1vW3cyIpcM7Va8fjFcn?=
 =?us-ascii?Q?1XfIQttwgVfmJGb0mRJ+XuHO2rHZ7gAieYIwBJPA4SN/NmPthYvF01m9iUx/?=
 =?us-ascii?Q?aGedTHjXLkkYgMJU2RaF/JVQ/YoXoWbZ8I0RKpZe/qIx/+X0lGlDsDraNRB2?=
 =?us-ascii?Q?SwQ5j0TceEghhu7nQFyaG9Bnu+XtXjTk8TcEnE17KHtVdxOWaCuujr01tbp+?=
 =?us-ascii?Q?n4b3XZoNXhqqPSNW27SNypz80LDu/sQk+ZYcK7jQ3GrKuu39KKieSrmbCQZA?=
 =?us-ascii?Q?j2VgT3Dz6FC8iEEp1taVDWTYKnd76RaSFCham6vwmxhXx1lpbf4R6/yWAhK7?=
 =?us-ascii?Q?eievt8UTArcYci3xJGOldkbtussZZsS6LHM6Fuays5VhPrrbikbOBTP12kJe?=
 =?us-ascii?Q?LwtpLlRhqP+ty6mLVfAQRu3akBpVNplYK9OA9yDz4NWvQ8z+ra/pqbyXGd/j?=
 =?us-ascii?Q?eYv3Pdi/0tDTHjarKddj4yQu7seYQ4J4Me2x/RfrwTg9kbdsIy0Q0ehIHzM9?=
 =?us-ascii?Q?ZBG5+KBUA5P3l9SZ/rCof6kKDPD4jVHB8AeRaIz8yXRERF4WbnfHsHYRCW+6?=
 =?us-ascii?Q?107Undz/WSqrhKAcKImp6jl91IHSxsKa4tLUNbeYTYKlMWZfrmN7r5xAgFQy?=
 =?us-ascii?Q?eVAhAvCKhXriWhJIh4XHyzZmeFXjDX70sKLOyiqOzFDztWVfMWTOonsoB36L?=
 =?us-ascii?Q?aQtjMuIKqKTlyoTIrQCqqjyCNAHolGtL871IJmHIcs7i++CH5cAfEMzpeovE?=
 =?us-ascii?Q?VQlWAEk0dCkUmZ4N3zw6GGax8nxskGVlpHVgxcNqwogyPSaSzqg7d2qhyNH/?=
 =?us-ascii?Q?WYq3cPmH5LNxiBgk5CVpy2HQZ9yNUtuiqGXVwsBXrAnQ0Q82Tjzh8cweAO2v?=
 =?us-ascii?Q?gtvgZ1yCq9dJRJuN18O2LVmkopAcikFCGOp5bWOEJBBq8wyKKPoYozApFXjg?=
 =?us-ascii?Q?esJXyzUE871Zy0LiqkDEytxCWdA2dtisSVDJDXoydfG3xcSNkWvOIuRHA5Zr?=
 =?us-ascii?Q?S7odJsIiDlFCNT5kKTQtlftXsL6Soig4+pduYJpv9HgIaLjzG0EyVHvy+kkN?=
 =?us-ascii?Q?kw8EZ5zFkMZh9UA=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:53:08.3848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df75397e-7fbe-4ead-25bf-08dd71354c50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6179

Hi Michal,

> On 1 Apr 2025, at 17:21, Orzel, Michal <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 01/04/2025 16:49, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi,
>>=20
>>> On 1 Apr 2025, at 16:22, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 01/04/2025 14:57, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>> Hi Michal,
>>>>=20
>>>>> On 1 Apr 2025, at 11:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>=20
>>>>> There's no benefit in having process_shm_chosen() next to process_shm=
().
>>>>> The former is just a helper to pass "/chosen" node to the latter for
>>>>> hwdom case. Drop process_shm_chosen() and instead use process_shm()
>>>>> passing NULL as node parameter, which will result in searching for an=
d
>>>>> using /chosen to find shm node (the DT full path search is done in
>>>>> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
>>>>> will simplify future handling of hw/control domain separation.
>>>>>=20
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> ---
>>>>> xen/arch/arm/domain_build.c             |  2 +-
>>>>> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
>>>>> xen/arch/arm/static-shmem.c             |  4 ++++
>>>>> 3 files changed, 5 insertions(+), 15 deletions(-)
>>>>>=20
>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.=
c
>>>>> index 2b5b4331834f..7f9e17e1de4d 100644
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info *=
kinfo)
>>>>>   else
>>>>>       allocate_memory(d, kinfo);
>>>>>=20
>>>>> -    rc =3D process_shm_chosen(d, kinfo);
>>>>> +    rc =3D process_shm(d, kinfo, NULL);
>>>>>   if ( rc < 0 )
>>>>>       return rc;
>>>>>=20
>>>>> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/i=
nclude/asm/static-shmem.h
>>>>> index fd0867c4f26b..94eaa9d500f9 100644
>>>>> --- a/xen/arch/arm/include/asm/static-shmem.h
>>>>> +++ b/xen/arch/arm/include/asm/static-shmem.h
>>>>> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info=
 *kinfo, int addrcells,
>>>>> int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>               const struct dt_device_node *node);
>>>>>=20
>>>>> -static inline int process_shm_chosen(struct domain *d,
>>>>> -                                     struct kernel_info *kinfo)
>>>>> -{
>>>>> -    const struct dt_device_node *node =3D dt_find_node_by_path("/cho=
sen");
>>>>> -
>>>>> -    return process_shm(d, kinfo, node);
>>>>> -}
>>>>> -
>>>>> int process_shm_node(const void *fdt, int node, uint32_t address_cell=
s,
>>>>>                    uint32_t size_cells);
>>>>>=20
>>>>> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, st=
ruct kernel_info *kinfo,
>>>>>   return 0;
>>>>> }
>>>>>=20
>>>>> -static inline int process_shm_chosen(struct domain *d,
>>>>> -                                     struct kernel_info *kinfo)
>>>>> -{
>>>>> -    return 0;
>>>>> -}
>>>>> -
>>>>> static inline void init_sharedmem_pages(void) {};
>>>>>=20
>>>>> static inline int remove_shm_from_rangeset(const struct kernel_info *=
kinfo,
>>>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.=
c
>>>>> index c74fa13d4847..cda90105923d 100644
>>>>> --- a/xen/arch/arm/static-shmem.c
>>>>> +++ b/xen/arch/arm/static-shmem.c
>>>>> @@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struct =
kernel_info *kinfo,
>>>>> {
>>>>>   struct dt_device_node *shm_node;
>>>>>=20
>>>>> +    /* Hwdom case - shm node under /chosen */
>>>>> +    if ( !node )
>>>>> +        node =3D dt_find_node_by_path("/chosen");
>>>>> +
>>>>=20
>>>> I would have 2 questions here:
>>>> - what if a NULL pointer is passed, wouldn't you wrongly look in the m=
ain device tree ?
>>> Do you mean from hwdom or domU path? In the former it is expected. In t=
he latter
>>> it would be a bug given that there are several dozens of things that op=
erate on
>>> this node being a /chosen/domU@X node before we pass node to process_sh=
m().
>>>=20
>>>> - isn't there a NULL case to be handled if dt_find_node_by_path does n=
ot find a result ?
>>> It wasn't validated before this change. It would be catched in early bo=
ot code
>>> so no worries.
>>=20
>> Then an ASSERT on NULL would be good.
> See below.
>=20
>>=20
>>>=20
>>>>=20
>>>> Couldn't the condition also check for the domain to be the hwdom ?
>>> I could although we have so many /chosen and hwdom asserts in the tree =
in the
>>> dom0 creation that I find it not necessary.
>>=20
>> There are never to many asserts but ok :-)
>>=20
>> With an ASSERT added for the NULL case you can add my R-b.
> :(
> So you still want to put ASSERT for a case where host DT does not have /c=
hosen
> node. I'd like to talk you to drop this idea. Normally I'm in favor of us=
ing
> ASSERTs but not for so obvious violations like missing /chosen.

I am not quite sure why you do not want an assert here.
Reading the code the first that comes to mind is "what if this is still NUL=
L after"
which would be clearly something no expected if someone sees an assert.

Seeing the place where it is, that would not impact performance in any way.
So why not adding it ?

>=20
> /chosen node is so crucial for Xen on Arm functioning that a lot of thing=
s would
> simply fail a lot  earlier than a point where we call process_shm() at th=
e end
> (almost) of hwdom creation. There would be no modules, so the first examp=
le that
> comes to my head is panic due to no kernel which happens way before proce=
ss_shm().
>=20

Sure you might be right, what if something bypass this due to efi boot or a=
cpi boot and the
code comes down here ?

Even it might be true now, this would make sure that no change in the code =
is changing this.

Anyway i will not argue on that for to long as it is kind of a matter of ta=
ste.

So feel free to put my acked-by without the assert.

Cheers
Bertrand

> ~Michal



