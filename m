Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE7998380
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 12:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815967.1230152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syqLV-0002Ej-LO; Thu, 10 Oct 2024 10:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815967.1230152; Thu, 10 Oct 2024 10:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syqLV-0002Bn-H6; Thu, 10 Oct 2024 10:24:37 +0000
Received: by outflank-mailman (input) for mailman id 815967;
 Thu, 10 Oct 2024 10:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3pA=RG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1syqLT-0002Bh-VV
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 10:24:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f403:2612::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7931a19-86f1-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 12:24:33 +0200 (CEST)
Received: from DU2PR04CA0198.eurprd04.prod.outlook.com (2603:10a6:10:28d::23)
 by DU0PR08MB9845.eurprd08.prod.outlook.com (2603:10a6:10:446::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 10:24:27 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::3d) by DU2PR04CA0198.outlook.office365.com
 (2603:10a6:10:28d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 10:24:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Thu, 10 Oct 2024 10:24:26 +0000
Received: ("Tessian outbound bcce15e2414a:v473");
 Thu, 10 Oct 2024 10:24:25 +0000
Received: from Lc8003771c39d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB4C7A22-4408-45B1-B4CE-EDDC11362C14.1; 
 Thu, 10 Oct 2024 10:24:19 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc8003771c39d.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Oct 2024 10:24:19 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB9006.eurprd08.prod.outlook.com (2603:10a6:102:33f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 10:24:14 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 10:24:11 +0000
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
X-Inumbo-ID: d7931a19-86f1-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v27Drsb0LzbcGlfA3HnFxYCC8lCvUSZvgQr9k944pSf4mNi+WvfFSpRPWT5OLAyueJDceMStMn5uSTM2QoXr4FsNQLRHecydTzPW8sAO6kl850BZlYJW8m5m09+AtYgBpmzaGQOeFH3gZz5DWPefI/gwijwOBVYMRlrLaX/0P8JhGdM5VFTq3stJnTN9gh9AYFpMeboK+sryDw4K/pcDcPnHnhBDhaSP0s6M8mHeFyWTmVJwcKCiz5opRcsMgNIo/ZU3izC+hQcc4zfenXETjtny72IZJYtCJLmtiCiap1oasK9oukLktKGsCdTkGYf5NybTh53KkYiWJtYQx63qrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVw/eNOv0sgkPjFHlbL1s0U1mudFbnnfKjwnacZvXT8=;
 b=Xg+2ifWRMVQKTwf3Q3hbfpXOuVEDRL9VFAO/LQa1NvGfqzRVZFDRYsTMoAztKEbJmd3NeA4pMP8boQYlYT6rQOXfdbD/RB2g1lVhUzNA5vG4Unx01yiPgjEqpzkDjc7RA/TVxSTCwcBnhFtHhZ7b4/e9M9vhHmYMKELTqvOYhnoXWaSSbFXNbHqm8FoI9EEnhiIrZvK7IZyULTGOPxUTtyLtFoBfkPwflNZYXYx+l1CUCml5zaHMEd1uG2DM3FmoBBDdjYhbppa4Zgg3DTYGrUi8RRe4N46ExjNJGWTD23nRLeeonZAUGwJfnECevUdI/75arR83l3SAG5z5VzKW3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVw/eNOv0sgkPjFHlbL1s0U1mudFbnnfKjwnacZvXT8=;
 b=apDKPUVDmD9iL5Rjdan3I/o3WO+nRymHJtubTHpK7DBTqQRGZiImVtf69JTAJjjmAuFmwSBDM7w9xu8XSnv0q8Yl8Gl439OPAQCOxxdytblS9he4oP91Y8HfgLm3g1qNapkeeaydmGEMwP4UuSeUI0eaO1MIEYsKeADFlEOvaMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38dfcc2f5e4c6587
X-TessianGatewayMetadata: tdl78zA7mTElc+TK40QtNyFXcI9BX2c+TP026ODwCA1WtW3kc/QHwwF+NWUpcCO2DuQIjaFIQoMCgtNMkpA4J4p5l+Lp1znI9ujV0+GyK+Yi52Kf+rD86Tfr8/cKCoWp+tqTIZPgEpASudb9byvqezwpQJrIh5Ch5UgIvpSBStg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtmyjBZ1pXG91LUu0RxVJiYLNlJdwXgrleMfV484mJwGtQIFrPtSqOUYkd6JTyKpQx0pc1QFZHr9NH5kQi2YP8JJkgN6AB66Uw82mJg/hpnB7leSWniuJj4TM5iK/AJIcMtFzBI2W2ZPAlt4+uGYR094SHHIVQ5EQ0AU1tIIahREn7hfhJDye7NS+82/SPtWi/P2mq/ygVkjdjHR42MwvD46SktjimtaIzu+NLmfoFeszJtrF0LaCA1Sf4QpjCUFJtZgV8nxezjRyX3oL/bEXpNoM/8zktYumawT2QQVAye3mIE9bvzr2jdElcxGY08uBSavdljyAFEG1+UK57nUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVw/eNOv0sgkPjFHlbL1s0U1mudFbnnfKjwnacZvXT8=;
 b=X2/4rTxZRVaHIMxB5GyBRl+/mFk6ZcawXyQOJVhr8t1JiDWHWvvyONb3buKKlgm6G/Hm3bctoI1r1jVsWOsk4IaaTmOtCTi765yRff79tkTi8tzxBdycHk55++pQD8ZaGGM94IDfRd6SMQb/GvjSLe5rrQzsmoewPoBI0aMw2vU3zvxRzPd/hrciI3quTZO4ZpxxPTi8whePBq5qNzv7/MUqOXNuFKL2CaF/KFkRn18mBOmBTQj6vmaekBe0Yr5j/PfT1FRn3qiMgkIwkJeNbI0e15Vptr2tfh3Pawnaxs/KJ6FvRbHxIKuJK4AqhHgeRFTydUXf7T0HNEpYGHg6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVw/eNOv0sgkPjFHlbL1s0U1mudFbnnfKjwnacZvXT8=;
 b=apDKPUVDmD9iL5Rjdan3I/o3WO+nRymHJtubTHpK7DBTqQRGZiImVtf69JTAJjjmAuFmwSBDM7w9xu8XSnv0q8Yl8Gl439OPAQCOxxdytblS9he4oP91Y8HfgLm3g1qNapkeeaydmGEMwP4UuSeUI0eaO1MIEYsKeADFlEOvaMg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Michal Orzel
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Artem
 Mygaiev <artem_mygaiev@epam.com>, Hisao Munakata
	<hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Topic: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Index:
 AQHbGOqFqldnvX8xNEmI4LnFnImSpbJ8YaSAgADTLwCAAEEygIAAgZcAgABSRgCAABPTgIABWyMAgAASXoA=
Date: Thu, 10 Oct 2024 10:24:11 +0000
Message-ID: <0400267E-5BF4-48A8-9B38-193F91C8F88D@arm.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
 <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
 <85FF2EB0-474D-4807-8DB3-FC502A5B2DE8@arm.com>
 <451c092a-af4b-40f4-a902-28f6f502d39a@amd.com>
 <7601808F-C5A6-4F20-A61A-A389252C7C5F@arm.com>
 <08fba71e-44ec-4905-b533-46697a43a59b@amd.com>
In-Reply-To: <08fba71e-44ec-4905-b533-46697a43a59b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB9006:EE_|DU2PEPF00028D0F:EE_|DU0PR08MB9845:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f350a7f-0985-432b-7c6d-08dce915b776
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?idG8AUgneuHha/JbRt2yk0tDPTR3rvaOV5bFId3VLNYNfdZTrWc9NaS7/fOz?=
 =?us-ascii?Q?IQrExAyF3fTfZogjHOfOvbfTeeUdgtjHg+zE0llGdLYp4Mo+ztN1SGn2ZVhS?=
 =?us-ascii?Q?0Z39E9q5+fQS7R4fB7qdlqMb8KTMbjmdt/cpAwnr2ZJYbfa8T470jKOcM3Dc?=
 =?us-ascii?Q?1hwGiuuzIKv25XGg5lFm7reLgkQ7+Aku85G4dD2NLx8nlomLkNLQYdQwuuwM?=
 =?us-ascii?Q?SEL+YtANyzrUtoHTPdP1SgoGlSbpd5yndHEozKhNYQr6JGW+Tb8RCaQQPmaU?=
 =?us-ascii?Q?70kz2ShpZ2dvDQPnykvGyPLaV+PL9F+1jFv5Yw6nZJ9CThKEraXFa4KtRGcp?=
 =?us-ascii?Q?+rQy5By37W04ow3NrTLGXk8L4ve41m3KdkA9O3ZI2DTQFrqlnQCRLAsorEl9?=
 =?us-ascii?Q?Xv8rnyG8yeVwd6FOQlpMh7oE+lVfBYm+LNXP+r/zWdYf97f2vW6bvaRZ516n?=
 =?us-ascii?Q?x+LkY4fSPEyjjEMnXWqkoQ1dxC7gy+NNhQ/D+sf6Z3CrZZ6uTrqdHK61G3KP?=
 =?us-ascii?Q?NPQPiBX6n098TaQ1l/GGJIHywjqohTqdMK2gH24iuXA8x5xJG7f6rliKJOsP?=
 =?us-ascii?Q?lKAD6+PhUF5mKhGJ+d8x5+0FAZSyaILzly5154yRW5bjUuQ1jY+gcfv7P/kB?=
 =?us-ascii?Q?pYgqO3GvrdElUpfebhRJc1AGdr/6viilaZhqBpAnqf0MUhWaSlTK8rOQaRKK?=
 =?us-ascii?Q?o5Eck/f9GV1MHUfKeA8NTmDjmTnWg7FMUeOG2pLeKzcLAkb7xanRxwYQrrwW?=
 =?us-ascii?Q?0Psawr1zpKUVzgFEkr5k4rZ6KO88n0eJsJE3MPN3rp9chJVpg9u8NLwihqnw?=
 =?us-ascii?Q?Yk4XGdRTZpKIHMr7469Zwx7K3DS9v5ASK/REL5/7w8c1A2jsIxgPm6OSFvUd?=
 =?us-ascii?Q?X432H8gsPmtjDpsc9iTiX43IDtQ4C7c9ePuv35YKcEJxmtgX6CAk+7hfwyWD?=
 =?us-ascii?Q?YE70I17GpPx++eLYXodmqTtdN9tEn4arOgxGEQOngUzZCxP9cp3yCXYMPQpo?=
 =?us-ascii?Q?Q8EmDT81qNQ7IfFBER28WK0DpBck4o908K7rIsj6x2DA5+68iVpmzQpGc38x?=
 =?us-ascii?Q?iZjJtSM1MOjSq31qY+TQS9/ZTh14s52kx/YGRR4gt5aZNT3UBg57OUEWtyi5?=
 =?us-ascii?Q?GFXuVK80dCwVr7KS4o4jeFN00X9GbYGn0w+pRSrCxS228Smot2YruN6hB8j1?=
 =?us-ascii?Q?ztRNpSGAkai99lDY8P5VVSlWcH55amamErvhBYRas7UsjBGwKgoN6XGSQnQa?=
 =?us-ascii?Q?Zg7WLP7IPusgag3YstiMZISBFffwHCWlrqiSOPDCG/tlV50FlyJPfjJwK7aX?=
 =?us-ascii?Q?6fNOJlYHrN2NFO/ZKrLt9d59I0h3Fr+sqo6QBH1cVrVigw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A16E86F5883CCB4088FD78BCBD336E20@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e53aeb6a-5cf2-40f8-0f7c-08dce915aef3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2A4kc1TTGPp3ATW573vr3B9MqHj2GU4h2MRz9gcL9TDCF3LOEww6Q50qGbrT?=
 =?us-ascii?Q?jVF849soYaPUrlYzxZczdqM/7Zqyk43eMI6Ij9FDvWybx6SXRkqUIBZyXhKP?=
 =?us-ascii?Q?Xh1eo/lHCGPN9jstJf1PKOBbOPS3t+AfUqUr/BjIY0HKvJySq7F1nxORS6a7?=
 =?us-ascii?Q?fX7OD51Mvul/fYg2lu+X5bkYgx5tSxnJYtx5gP1SoRTlB6f+iwmbDuRTR7k0?=
 =?us-ascii?Q?pHZ2N/MtqphAjOuqIGqhbhf2lVhuy4E+KPDhOyfkL4DG/ewzRYhy2E/UpRqp?=
 =?us-ascii?Q?onsyxE4ufYqcMN6UwZZimL0mTEtBU1/ZBQBLY5k97dkKCzSTBe/toE787l99?=
 =?us-ascii?Q?AQrpGfdMmjHAdMTyViLsANic5diQF+ZTPO/RA2D3C4eWvmk1+EXLhGqkCI4q?=
 =?us-ascii?Q?1L7atzDoOjAUZFXJn/NP67wB5xPN3OA0yEEI8+lKIb379brma02lI1HFvpjy?=
 =?us-ascii?Q?9gn+Ic4gCeS3rjK5V9BMwbSpzkhcou2m3R10Svj+ZNaEfR+z3ElZGcdb300Y?=
 =?us-ascii?Q?HfwLINsg/Km0epfvEg63EUUq1N6p/qn5Zsk9r+dkqCJVvj0LHBI1JTsoxgCB?=
 =?us-ascii?Q?dSfcZlUpjTmLxYpik9UG7yXC61mfsWHDLNfYK4Myt8GK3ZBNXuOzqsXoaqVP?=
 =?us-ascii?Q?AXwfliH0c+rGnUB8Cbg6OE/+CwteCjYmzQG0yaGSJs3jdkUnCH1/zubI/Pdo?=
 =?us-ascii?Q?cAvm7CaoF3h+wfVS6j1ZZEzlrUBN3aqjLrnFdhgNfvjWFlKu7N88//HWVE6O?=
 =?us-ascii?Q?7+JTxwklcDbXwhCnVXzsdSgHQEE7rF+TAMpsBouiBOIqplf4Jlgo12v3Yoly?=
 =?us-ascii?Q?W3vRh1oKCmBSPentbdb/pQymGixKvoTP2GOheWlBnWPz9Oy2wm6giRnHeiDA?=
 =?us-ascii?Q?rCgB2XFxOwjAWafQ24VGFthy91m2+4WqYZAd86AtiIvCrFjQ4BXDnrYijXny?=
 =?us-ascii?Q?3BL2fP2Jmf5XrHHKvE4YEbkZemXBTb1XV5TIdE3S6kOf+XbkPUhvWl2vDFhl?=
 =?us-ascii?Q?64hCkNnKDmui+Q5LEyw8wZxzHRpFg3Hcb0qB1/1QpsRv4gJSeLuCkm55N6P4?=
 =?us-ascii?Q?WW4WVO1cts2W+GVzBT9eQ0CJhDVA4r0lhuNlQCCsTR0fSAkrbkp5LfTUXSFM?=
 =?us-ascii?Q?qiH2FwOnZTazpArao/3cbJIJIEkqX5T84brWAR7bq4+mF1iB0welCyZdgun8?=
 =?us-ascii?Q?tS9BrBFFJukSiAdZTqZbtInF1FhpE5UjVcBzotBHMo6WMlfccusFd69FZp31?=
 =?us-ascii?Q?rRLg8uWFq4Y9bRKo1TDlr2R/hPVgECQtZGXLpxWrAetFTu4K4bsdzS8hY32+?=
 =?us-ascii?Q?y8YJ4Z63kF6ouweetnumLCCgfuheitNZ+l0o6jgrBBeExn62hlEHd1Jzquo1?=
 =?us-ascii?Q?NUbxtvLnWdCLfMO0w94Lm941djcc?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:24:26.1348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f350a7f-0985-432b-7c6d-08dce915b776
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9845

HI Ayan,

> On 10 Oct 2024, at 11:18, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> < snip>
>=20
>>> 4) AoU on domain - 1) Domains should not use HVC DCC registers as Xen d=
oes not emulate them.
>> Xen does not depend on that, the domain does so this is only a Xen expec=
ted behaviour and we should document that Domains shall not use it.
>=20
> Agreed, we need to document somewhere that Domains shall not use register=
s like HVC_DCC, etc which are not properly emulated by Xen.
>=20
> Yes, it should not be a part of AoU as Xen's behaviour is not dependent o=
n it.
>=20
>>=20
>> Xen behaviour if used should be specified.
> Agreed, there should be a document stating the behavior of Xen if non emu=
lated registers are accessed by domains (as an example).
>>=20
>>> The AoUs can either be tested or need to be stated explicitly in the sa=
fety manual.
>>>=20
>>>> - "integrator" (word always problematic in Fusa as usually use to bail=
 out
>>>> and give responsibility to someone else) shall and shall not do (for e=
xample
>>>> giving access to IOMMU registers to a domain)
>>> The responsibility with the integrator lies for things which cannot be =
tested. For eg Xen has to be built with a particular configuration (eg SMMU=
v3) or a specific CPU errata. Integrator should provide at the most X amoun=
t of memory for each domain. SMMU (or any specific device) should not be as=
signed to a domain (which should be under Xen's control).
>> Ack
>=20
>>=20
>>> For some of the AoUs which cannot be tested (eg Bootloader/Firmare need=
s to initialize the DDR, CNTFRQ_EL0 needs to contain the correct system cou=
nter frequency), the responsibility will lie with the integrator.
>> This is an AoU on the firmware or the platform not on the integrator.
>=20
> I agree that this is an AoU on firmware or platform. But we can agree tha=
t this AoU cannot be tested by us (within the scope of Xen's safety certifi=
cation) as we do not know on which hardware platform Xen is deployed. The s=
ystem integrator (or hardware manufacturer) should know the correct value o=
f system counter frequency. Thus, they should be able to test this.
>=20
> Our intention is to keep the scope of Xen's safety certification decouple=
d from a specific hardware platform. Is this making sense ?

It does as long as the expectations on the hardware are well documented.

>=20
>>=20
>>>> - interface and what we expect a domain will do with it
>>> This should be covered as part of AoU on domain. We can have more examp=
les of this in near future.
>> In my mind interface are for example hypercall numbers and behaviours.
>> I would not expect to find this kind of stuff as AoU.
>=20
> Yes, we will be having requirements for the hypercalls. Do you mean this =
?

Yes

Cheers
Bertrand

>=20
> - Ayan
>=20


