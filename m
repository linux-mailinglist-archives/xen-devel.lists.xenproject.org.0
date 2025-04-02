Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B049A78806
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 08:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935129.1336599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzrQi-0000P8-Jn; Wed, 02 Apr 2025 06:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935129.1336599; Wed, 02 Apr 2025 06:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzrQi-0000MH-GA; Wed, 02 Apr 2025 06:18:28 +0000
Received: by outflank-mailman (input) for mailman id 935129;
 Wed, 02 Apr 2025 06:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tzrQh-0000MB-6Q
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 06:18:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2613::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 491c8c42-0f8a-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 08:18:26 +0200 (CEST)
Received: from DB9PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:10:1da::30)
 by DBBPR08MB5978.eurprd08.prod.outlook.com (2603:10a6:10:1f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Wed, 2 Apr
 2025 06:18:19 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::b4) by DB9PR05CA0025.outlook.office365.com
 (2603:10a6:10:1da::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 06:18:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 2 Apr 2025 06:18:18 +0000
Received: ("Tessian outbound 850a7d29d40b:v604");
 Wed, 02 Apr 2025 06:18:17 +0000
Received: from Lb8a02b34d2a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 35317DBB-D55D-44B1-9F4E-C5A2EEBC9ABE.1; 
 Wed, 02 Apr 2025 06:18:11 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb8a02b34d2a5.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Apr 2025 06:18:10 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB6630.eurprd08.prod.outlook.com (2603:10a6:20b:337::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Wed, 2 Apr
 2025 06:18:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 06:18:05 +0000
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
X-Inumbo-ID: 491c8c42-0f8a-11f0-9ea7-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wmqsI2UKjOzThEu8Ng2ui8QtQlLswXS2X04N39fMWtO2sGFCeI8xXYChLBuDoJT6DJXO0vdVNa4jBDFk+pmXTFl9AYzKPFxEEVI4WR13ive15Avl+2FUFf09o9GovOlemaWSYN403ZXQBk9fAWUMYVxjJ+1b8FmjJldP+oFFGT50nDgJ9uUR0t3LXuuSxjLuEjRqWhx5EtotkE5AmY4OsEYl71w5LUZa10Ff1ds2qqIDfLJU495U3GvMdBEglq9EJOCXjtIaXnBbGViOzZQW76z2jDrSG4sjPDrxcYmQ+Jk9q6WLMsSJZ+2HU5kvKxZUVp/FKC4Dpvk4RmHvvacnxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9u1UHOwt3q+7T/calpbkRmllY4sydNWRR7pbH0F1sQ=;
 b=xXpyR90EM2Wco/dGygqvk1WqSEnKOAJGHwbIqmJKUDXjKCosyIshDXAo62Hpt9nIxuGa8/3jErtASr/IzoNjkEgUJLI4eSXosTKVDMJP+PyhwqGipkWXV09wTd45ccR9T+BP4LQbvvWYORSErfUTAwuuJMalUN1vlutaDLbQK8OWYY9lPzZ9oXP+VBmb1rKyssvzqWWPaGbrInrQJqK7kl2jBc8ChWK5pUMMMcHxbZn8CI2T9cdbT/RyegUgJpQHyCaP6h5cDmZ+da1FWa8ThE5/L8I8KvOxjgfWbYQpdJgYOhzOi5ye3obdf7bxfq3ee3VKX2SdyM+5ZG38NFUjzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9u1UHOwt3q+7T/calpbkRmllY4sydNWRR7pbH0F1sQ=;
 b=Rkg9rS1i01vcewIRg/zmcsgztDQnZeuggBHCrf4ZNpvWipORkZe53SB0W+gsjbRArPtL5/iUIARLpdneVu3b+jKq18BWZrjK9+45n6bqOF9aije6oFgCpOzepA8jvGSU4lwZD8uyrhyu0TykXSS2p/SwayVnw8PKfeMUcaM/KEI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c7716aa1fb92d11
X-TessianGatewayMetadata: sUIwyOUqhzT5OHJQyX+Z1HER1s6mD7YgbPgv2XkxsQKs+7O4VSZ7mwYcLVGvVFxjeXLI11oCmY3vUtWg3JhiGkjNqCZGmbIV6wi5pYlrzLLNBkrVn0QjGaRlZDzJKpyDAlsAnRoOd5DDCWm0+YJrw8moMnbNhdfKpkOwet5QzFA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpUjKaOVffTMjgIUJ4IEUdi3fUeox9EXsNoiBX6feGvaZ6QtTaRVJmkIShVsT7zxesYUdfrAE23p0L550RjyPRpF5IJEe/CWxk6YOd9MMrLeXe1jcT5V5sxIaJeVBiFuSGFOty5KHbuWNHCBbUpnPnbGz8ldkpjQqkO7dRGrFR718j4n+uk1VfaGpzDpc0E2V1WI0hW504hXybj7s1CRdBwTlxZ6b4KIeVnaN3J5PWK6+oVI4kHIe9c6k/KP16ZGQ6jc3zFBnc1xG7vQmTU8v2Wb8CDY9iBTaxlbXAs/F1s4vlwwvwus/ydlAFr6ZM/xVi+4TRoKdxdtWmgYW4UoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9u1UHOwt3q+7T/calpbkRmllY4sydNWRR7pbH0F1sQ=;
 b=LeJQWIMZbF4Jl39qFj1FOgqfY+TgNorhqZ7Wgcrp9paSQ9+EOG9dGMi9L7ggjaFjTIAVfRbB47LaCANGgNbfYI3HcEaJbkXn7g+gYf/wXjtBrb+Ij1sqyxspTOMg9bHTMWxjSL2qNQPcWVXsWWOh3qOkBtVx0Zy94dVEWM2IugsA2T8vk121SgXfy4SZ4fXxWpy3qNmHdQbGuJQxDGOeUSSNjL2H2uq4jX1U8kSfSfeFshC+nZWju2yXU78Bg/5uob0WTPHdy1qgrj2218Gh6ZYeCpla7ac2n+8NzTJvR5IfsP81k4jEaZIopNL6S+VvqMYY0K8IOnsl3mGFRVDglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9u1UHOwt3q+7T/calpbkRmllY4sydNWRR7pbH0F1sQ=;
 b=Rkg9rS1i01vcewIRg/zmcsgztDQnZeuggBHCrf4ZNpvWipORkZe53SB0W+gsjbRArPtL5/iUIARLpdneVu3b+jKq18BWZrjK9+45n6bqOF9aije6oFgCpOzepA8jvGSU4lwZD8uyrhyu0TykXSS2p/SwayVnw8PKfeMUcaM/KEI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Topic: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Index:
 AQHbouXQNh7nKprt5k2iUHPtnXy/N7OOxVgAgAAX+QCAAAdEAIAACRaAgAAIxYCAAA3XgIAA496A
Date: Wed, 2 Apr 2025 06:18:05 +0000
Message-ID: <12D5AACF-7A89-43A7-A729-0F0D7AE501EB@arm.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
 <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
 <f7a6dd50-28d9-409b-8740-f4433f2fd72e@amd.com>
 <237153F4-56B2-40AD-A2D4-824B621D3477@arm.com>
 <25e30373-139f-4827-91e7-a2dd6e85c433@amd.com>
 <16D32474-F78A-4E50-AA96-BE96D76D95FE@arm.com>
 <f06abd4c-dcf3-4b95-ba37-82b72da1f783@amd.com>
In-Reply-To: <f06abd4c-dcf3-4b95-ba37-82b72da1f783@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB6630:EE_|DU2PEPF00028D0B:EE_|DBBPR08MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b22c23-223e-47f5-8423-08dd71ae28d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?L3Pzb8h0I115EiWR/mfho21GaS1snBworCfy00iYLGhdJyBh1rWoj0T/r6cP?=
 =?us-ascii?Q?oWcwGIVEtrBkBtUNlSQWmC/JvlGAKd+zk4X9gEDNj4NmsaVXmUPG8jN/XkXZ?=
 =?us-ascii?Q?bwj6dKmqhFYNrfMP1hW7cKVA2gvbeVnryMmSpHfLc9kyzGE55G53iGza8d5/?=
 =?us-ascii?Q?zdrhZDw0u/WWvTaqQN/8s6MjtBwJm1Bi4y2L98Q6mn+6fwNXPQuazM4zX9oN?=
 =?us-ascii?Q?ltSKeH+e57eqvY4/+vBtxfpBZtRduNgUiL5VK2ipdrk/+UzshZhxPp67tbQT?=
 =?us-ascii?Q?JG2byRGF82XIFMV6KQYS0BAiIzc229Dl5pLX9wFkp62PlYP5gg+lFuMw6NTY?=
 =?us-ascii?Q?DMYL9xeY9WBO183Hl4HmmYPu2mGwvq43lU4CXc80Tqg1cfjjHWDIpdde9Orv?=
 =?us-ascii?Q?Zik8KebSBdeLORuQxFpghBLWypE6ApWjtlXOncbVOoqDEo9YdvGuTKqQg6Qa?=
 =?us-ascii?Q?F7rEnoKXsXp9RZTt4QByL9VWr49u3ueMVid8P414pNGoCu5A93U9JtSDMu8X?=
 =?us-ascii?Q?gzU/jfnmjJKR0FlIBNvb7KXq2w2GVPwOySDCaYy5XHgGDr10uUGeuoD+Ok4/?=
 =?us-ascii?Q?ClJOj72dimOzbkFtJ9wn6Ha2vhj+Dg+xgHtpZL38tcJCWQ+MX3NHhIqOcF9X?=
 =?us-ascii?Q?ceemCgIa3bDrvN9JBDXtFNF7/JPy43FJxxWmi8APYNNV79xB+UPPEb6nM3gy?=
 =?us-ascii?Q?/sEHDjR2wz6reyLurfUbWPu6lAQnGJEuPjXKBSSNUvUbm1UqqfmeZrk10V+t?=
 =?us-ascii?Q?6hgWIY87XfB45BneQ2s7v2qKHA8qTTGDNVEMszALdZ1ErxaYXTpJq85Q/+jR?=
 =?us-ascii?Q?0AmmlLm6Sela7JRs2VnxjUBSI2HDBwovuSnYDFc0zOulcgI5jsr+zA1ymst5?=
 =?us-ascii?Q?8gjB4YjDZaieVHmts7q+FR2ml4ZAeK8Q8lotnqKBd5X2wHEa5VVtVWQ/SNE8?=
 =?us-ascii?Q?ux4yvMNVAOvNstDfMz5TgXfdKt3rdb8ThpM58e5UEUtm01ZUbvG9lEoj5HBI?=
 =?us-ascii?Q?aOQopuxSwV/Xchoy7uM1gbvakptMt3ZUqbdvMEc/n14r7zTiW3L6VsHuGK8I?=
 =?us-ascii?Q?QGnbPUgponEotYYs7yQkkswcPQ0fYSO4VikVYmrEVIdJ9Nnx2BHx8T9TxvLE?=
 =?us-ascii?Q?JmuX53mlpstHAznnofdfe/7Y4tyFWC2uMT1EzHv3+RgbAS7oHSg3T1I7ylX6?=
 =?us-ascii?Q?6fIVh9fFIY9MrL6fTVcte7JVxVy8QCZRBFHf3wYdNdW0jBdOYufCJ+reUors?=
 =?us-ascii?Q?V4nzlOPcyuEFyyeWOLOQGeKEtcK3Vd7N4w4cUPoghVKE2tW8eJ2n1ci6FeKt?=
 =?us-ascii?Q?/vPrPHDuNwps87GW9k5PABEi0CDxCD8DMCs6e/aI9Uun65ta1jB++PY1xuz4?=
 =?us-ascii?Q?U6uHB9MUCbQAl1VYtJzrEKW6kLG3WsvziaQ3+4hYUjczz2AJZdq0GqHPtm5a?=
 =?us-ascii?Q?MvsgmpmjedL1beiEEYzAc5KWl/wdVswM?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F760F1AADE8BB745B71190A53D97A9A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6630
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	216203f2-4e95-4315-e45c-08dd71ae217a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|35042699022|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MJguCp8+ZciOGDafjNccPi08YB79pn39GWeJZaZzHjGNpKM/Vtr5zFFxhueo?=
 =?us-ascii?Q?DnUzYisqQmwHMxNftQRMzc9pks9iqdDp+QsMU+I7NEP3PYh7rDlOaxIOY7H7?=
 =?us-ascii?Q?q6Fxm5OHchOG24nk+mP+nXdWrkYCyYaq6KoYVglN7tXVRYuuqdOkZFX42lGy?=
 =?us-ascii?Q?tMKOIFBCP0MFN4fIphpbXEgEixUBPIoW0iEaOITlMAumPVHjiFDCWgh2T2PP?=
 =?us-ascii?Q?35gtCt6TXqos732jtHRH5M3jpSsIRLBAKuPy+HxgNS97gz1Z3nterXYgtwV4?=
 =?us-ascii?Q?WLBw+3mu6WsJXNBSpnsn3yAHgx0FLou4mswtkjTeS1xmodPGWKkfr0m3S4cT?=
 =?us-ascii?Q?7BS5TnquAfT9h9WMl42LDUcnhFPlpAQs3tHCTEuotR+kqcjOJ8LK3Qouz2xB?=
 =?us-ascii?Q?NajNMqBIsi6NqpKrP3SG6OgrWTNiDY/Juy+yvXNvTdM4KlhjO17pQhCeSh+y?=
 =?us-ascii?Q?mqu6yzXQ825facSHFBTaQDW2D6DzbP7B0Ko8VHebaSoS4m1yE4uUDLk5bkJW?=
 =?us-ascii?Q?qsOgepwnvWh9wd/lfdYdNbzm4toS5zUnJRR2cSp1yGBdOAmxrUTG8WJrORpf?=
 =?us-ascii?Q?zZkmk+z0G2LLzdzCDOcSefDmcI2kf03kJ/Qe2MVSvtdRWzt5YN47LgeGFNVT?=
 =?us-ascii?Q?dbuRNYl2diCpCEsgGryshM5XCj8qdnM000i4oo47gJqlm3bJNxwWa/AUODUo?=
 =?us-ascii?Q?DvlIwFfah1h2U9LYfivnU4GdNxITEJv3jCEBmqkqVVx6QtiPFYf6A71f9ms4?=
 =?us-ascii?Q?qeVogGgykoGlhqeGbQTtblfjjBx1VySQ/gwjWji0SUENrHtCwcIaR0xuEvtv?=
 =?us-ascii?Q?vs7qS4UQoIso5+Ekz1OHYuU388enCeU3EMElCqEkgJP7pfAsjIbTIqJJ5a9U?=
 =?us-ascii?Q?+YbjiO0sIULwvN1llAWsy02mlwXkKXg1lsP5/+1sflYjTSY8HWJMiM9NN/fQ?=
 =?us-ascii?Q?B0pF0n4d3jlN/VyIWAtFfoGdD0n7HaHI7MNcHcLmFkITXQYsOtQyxhS/ONw7?=
 =?us-ascii?Q?5gCanIjPYYIx1D94Mlikhuo1ERrTc07uX0PVTBEi9WI1IaOBBg9I4oqhQUlk?=
 =?us-ascii?Q?uIwIp5TUtexfLtoFzhkIa16vVpWHazOX9YaIzHftwkvPlRgUq6H618xg2qJi?=
 =?us-ascii?Q?q6wM83hdTzB5rM64axoMpITbFhxkEOLoWZcdtANo5fXCc+sWI8mC2Dy5UNIa?=
 =?us-ascii?Q?XLol5gt56p9KziWFLeTCmIRH3di3eOkbHjWELMbCo674IEqOVAv4ZPZNtuyn?=
 =?us-ascii?Q?RXfGRKqNsCrAmQpNIDZXPZ2p1Sy5qDQgKdVHEf0Bl5aMHGr/k5jQfnftLqJS?=
 =?us-ascii?Q?/JdLzHNIrLztDW6WckvBxE2SdAPJr0Wzdp3f3G30p0fHIxbpG+4MwnDB16PH?=
 =?us-ascii?Q?Y09wikG8vB/l84dirmppzh0Dt5vAurZscaiP4kpE5NvKaHO9hc0YiP1eb8ck?=
 =?us-ascii?Q?aMfVzdAH9w/gDJ6AkrVIh7aO/JM6/mnucGbA8URBryMOCup7Q2LAwQoAPwZx?=
 =?us-ascii?Q?1cuIWCBGVQcV7lU=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(35042699022)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:18:18.0070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b22c23-223e-47f5-8423-08dd71ae28d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5978

Hi Michal,

> On 1 Apr 2025, at 18:42, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 01/04/2025 17:53, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Michal,
>>=20
>>> On 1 Apr 2025, at 17:21, Orzel, Michal <michal.orzel@amd.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 01/04/2025 16:49, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>> Hi,
>>>>=20
>>>>> On 1 Apr 2025, at 16:22, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> On 01/04/2025 14:57, Bertrand Marquis wrote:
>>>>>>=20
>>>>>>=20
>>>>>> Hi Michal,
>>>>>>=20
>>>>>>> On 1 Apr 2025, at 11:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>>=20
>>>>>>> There's no benefit in having process_shm_chosen() next to process_s=
hm().
>>>>>>> The former is just a helper to pass "/chosen" node to the latter fo=
r
>>>>>>> hwdom case. Drop process_shm_chosen() and instead use process_shm()
>>>>>>> passing NULL as node parameter, which will result in searching for =
and
>>>>>>> using /chosen to find shm node (the DT full path search is done in
>>>>>>> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). Thi=
s
>>>>>>> will simplify future handling of hw/control domain separation.
>>>>>>>=20
>>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>>> ---
>>>>>>> xen/arch/arm/domain_build.c             |  2 +-
>>>>>>> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
>>>>>>> xen/arch/arm/static-shmem.c             |  4 ++++
>>>>>>> 3 files changed, 5 insertions(+), 15 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_buil=
d.c
>>>>>>> index 2b5b4331834f..7f9e17e1de4d 100644
>>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>>> @@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info=
 *kinfo)
>>>>>>>  else
>>>>>>>      allocate_memory(d, kinfo);
>>>>>>>=20
>>>>>>> -    rc =3D process_shm_chosen(d, kinfo);
>>>>>>> +    rc =3D process_shm(d, kinfo, NULL);
>>>>>>>  if ( rc < 0 )
>>>>>>>      return rc;
>>>>>>>=20
>>>>>>> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm=
/include/asm/static-shmem.h
>>>>>>> index fd0867c4f26b..94eaa9d500f9 100644
>>>>>>> --- a/xen/arch/arm/include/asm/static-shmem.h
>>>>>>> +++ b/xen/arch/arm/include/asm/static-shmem.h
>>>>>>> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_in=
fo *kinfo, int addrcells,
>>>>>>> int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>>>              const struct dt_device_node *node);
>>>>>>>=20
>>>>>>> -static inline int process_shm_chosen(struct domain *d,
>>>>>>> -                                     struct kernel_info *kinfo)
>>>>>>> -{
>>>>>>> -    const struct dt_device_node *node =3D dt_find_node_by_path("/c=
hosen");
>>>>>>> -
>>>>>>> -    return process_shm(d, kinfo, node);
>>>>>>> -}
>>>>>>> -
>>>>>>> int process_shm_node(const void *fdt, int node, uint32_t address_ce=
lls,
>>>>>>>                   uint32_t size_cells);
>>>>>>>=20
>>>>>>> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, =
struct kernel_info *kinfo,
>>>>>>>  return 0;
>>>>>>> }
>>>>>>>=20
>>>>>>> -static inline int process_shm_chosen(struct domain *d,
>>>>>>> -                                     struct kernel_info *kinfo)
>>>>>>> -{
>>>>>>> -    return 0;
>>>>>>> -}
>>>>>>> -
>>>>>>> static inline void init_sharedmem_pages(void) {};
>>>>>>>=20
>>>>>>> static inline int remove_shm_from_rangeset(const struct kernel_info=
 *kinfo,
>>>>>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shme=
m.c
>>>>>>> index c74fa13d4847..cda90105923d 100644
>>>>>>> --- a/xen/arch/arm/static-shmem.c
>>>>>>> +++ b/xen/arch/arm/static-shmem.c
>>>>>>> @@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struc=
t kernel_info *kinfo,
>>>>>>> {
>>>>>>>  struct dt_device_node *shm_node;
>>>>>>>=20
>>>>>>> +    /* Hwdom case - shm node under /chosen */
>>>>>>> +    if ( !node )
>>>>>>> +        node =3D dt_find_node_by_path("/chosen");
>>>>>>> +
>>>>>>=20
>>>>>> I would have 2 questions here:
>>>>>> - what if a NULL pointer is passed, wouldn't you wrongly look in the=
 main device tree ?
>>>>> Do you mean from hwdom or domU path? In the former it is expected. In=
 the latter
>>>>> it would be a bug given that there are several dozens of things that =
operate on
>>>>> this node being a /chosen/domU@X node before we pass node to process_=
shm().
>>>>>=20
>>>>>> - isn't there a NULL case to be handled if dt_find_node_by_path does=
 not find a result ?
>>>>> It wasn't validated before this change. It would be catched in early =
boot code
>>>>> so no worries.
>>>>=20
>>>> Then an ASSERT on NULL would be good.
>>> See below.
>>>=20
>>>>=20
>>>>>=20
>>>>>>=20
>>>>>> Couldn't the condition also check for the domain to be the hwdom ?
>>>>> I could although we have so many /chosen and hwdom asserts in the tre=
e in the
>>>>> dom0 creation that I find it not necessary.
>>>>=20
>>>> There are never to many asserts but ok :-)
>>>>=20
>>>> With an ASSERT added for the NULL case you can add my R-b.
>>> :(
>>> So you still want to put ASSERT for a case where host DT does not have =
/chosen
>>> node. I'd like to talk you to drop this idea. Normally I'm in favor of =
using
>>> ASSERTs but not for so obvious violations like missing /chosen.
>>=20
>> I am not quite sure why you do not want an assert here.
>> Reading the code the first that comes to mind is "what if this is still =
NULL after"
>> which would be clearly something no expected if someone sees an assert.
>>=20
>> Seeing the place where it is, that would not impact performance in any w=
ay.
>> So why not adding it ?
>>=20
>>>=20
>>> /chosen node is so crucial for Xen on Arm functioning that a lot of thi=
ngs would
>>> simply fail a lot  earlier than a point where we call process_shm() at =
the end
>>> (almost) of hwdom creation. There would be no modules, so the first exa=
mple that
>>> comes to my head is panic due to no kernel which happens way before pro=
cess_shm().
>>>=20
>>=20
>> Sure you might be right, what if something bypass this due to efi boot o=
r acpi boot and the
>> code comes down here ?
>>=20
>> Even it might be true now, this would make sure that no change in the co=
de is changing this.
>>=20
>> Anyway i will not argue on that for to long as it is kind of a matter of=
 taste.
>>=20
>> So feel free to put my acked-by without the assert.
> You gave me a reason to scan the code and I realized that in ACPI case, i=
f
> STATIC_SHM is enabled, it triggers a bug in process_shm_chosen. So, you w=
ere
> right and we found a latent bug that is not related to this series. But m=
aybe it
> would want to be handled as separate fix before the process_shm_chosen dr=
op?

Nice at least this was useful, and it also means that there are never to mu=
ch asserts :-)

I would suggest to resubmit this patch on top of an other one fixing the la=
tent issue to
make sure everything is merged in the right order but it is up to you as yo=
u will probably=20
be the one commiting both patches anyway.

Cheers
Bertrand

>=20
> ~Michal



