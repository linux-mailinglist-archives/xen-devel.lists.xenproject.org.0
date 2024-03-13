Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128CD87A58E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 11:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692327.1079344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkLX3-0001fK-Op; Wed, 13 Mar 2024 10:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692327.1079344; Wed, 13 Mar 2024 10:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkLX3-0001cR-Kd; Wed, 13 Mar 2024 10:08:21 +0000
Received: by outflank-mailman (input) for mailman id 692327;
 Wed, 13 Mar 2024 10:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3YRL=KT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rkLX2-0001cL-CX
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 10:08:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ca038b3-e121-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 11:08:17 +0100 (CET)
Received: from DU7P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::7) by
 DU0PR08MB10357.eurprd08.prod.outlook.com (2603:10a6:10:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 10:08:08 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::7f) by DU7P250CA0020.outlook.office365.com
 (2603:10a6:10:54f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19 via Frontend
 Transport; Wed, 13 Mar 2024 10:08:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.45) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 10:08:08 +0000
Received: ("Tessian outbound 7b0d57313a48:v276");
 Wed, 13 Mar 2024 10:08:08 +0000
Received: from a83ffcad1a2c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 45186660-E173-4D11-9AC1-119630FD7BBF.1; 
 Wed, 13 Mar 2024 10:08:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a83ffcad1a2c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Mar 2024 10:08:01 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB6662.eurprd08.prod.outlook.com (2603:10a6:20b:397::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 10:07:58 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 10:07:58 +0000
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
X-Inumbo-ID: 9ca038b3-e121-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hV5RfcllN/BUofXVX4Vs/7JVL+UMmPxyj9VdZIOELxc7j8fh7GbrK1BVNQfULY0ryCIeJegvzMQ/9xQ2itRn+5AOlpK/8r6hZEEPljDLTrOMdGEktptdIIYNt1pEaIaT0AZ9CF3jydxq5Vi51PHIErnX6fkVyDuHlLx91kGgHghH+LrgS1iJ2wsdEAnfBSLsx/dnjfSijJzbOWTI8v1FzycLtVBts5/W9frLxehN1HyGxOAkHaUIeozEbFE3qN1ZT3QjsF+aWSeiojkJveom91whl58goLH4jugdVzYzwKnDo8DUD0KXdeBBRCq5ye+CWs4TPWZAxGIkWl0On9pGjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN7r9mIZHEPOlNH367+zhhdBwovKJXuQKqZam/V0Q9s=;
 b=csTAXBAQvG0FNQlMRAqgt8bwJWebXpN5bv6365NlI4IHKzWumKWqN6FW5b70X0e/H6EXKnfWL+mo0fOkeDDyt9qXgFt93ycf9TnTPWp2mzMG+rt0L1jIYfhS2rfYD+YWAy0lkesfEud9yrjngKOREyaBege3IwnBC565vUNIB1w42Yz2Blm1a8w3vxgcDVU9B8gtAyyAOkfqtzCcuyvIqHpI1X3QpJnIp77c8PpRIsz3YTG9eljBWKR48hM5Jux0Uf+DcjgCnUXQb1ddcaMMkK8gOUMNe64M8gGV6ssPmExmPhZnuWfQx8qIuEoBCFPb/C6ETiVkEJT2/UDrknL2/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN7r9mIZHEPOlNH367+zhhdBwovKJXuQKqZam/V0Q9s=;
 b=9ZgB9d/8kVj2/uHfskzGOIIeLBoiozA4nOfTmcA/aaIxDnB+d7H//lTeYoR6AMGNL3XdK16yzQQ2whVFSiNPhB5gyZekeVCvSs9T0peTpGUN3CEfXE3jCwrCy6I3wcWiV2cCqK+yfVeZT3PW6s86LJhNLmHeejVCQp8aEU2vehE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82f1ecd6626dd7f7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJQtzryGiINhu+UuUwOjJ9/xDIFjBDx+tc3KLonsKZ9+pUdEfG4Wo4fy26lBK0wYOi8rPRlnNrL9FgmFchMd4pFpXukxbbHPBP0nYMMyPV60awCimH46xeXjyLWNJF+eBZW7SxY9+AQXDT4gaNZFWrvGVK25F3eSUmJVWZmTikSVTYLZDEcotKaZhW/w28HoHLXnaDKlyhtQU9K/Zfy+dcOGFoMsjbPK10PsA0xQwyBjYN3f7yy5hZtwoKayQg9ZNuc/NCn41nwZDTerDD4RVqMli9cOi7/56KjSbIIL2v3j6pHtTM5AkMGMIb7VgyY5vOaVHwl/5likLDObaa8VHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN7r9mIZHEPOlNH367+zhhdBwovKJXuQKqZam/V0Q9s=;
 b=LUzmOYD51jJ9RSX91dHEr5083EKA20hAXrn2aF41L+xdqXvNYLwXqAj8DjGlpDO5Ls/gPjrSez//FacvXM2j/Rzr+2Ph5umgCT0aIx/iZfoHRpTuo1HA2qZrY9QSfJlzsYWo1AoXuB6+1yye7qtXdPwk4r42fMA9G/IFBmLdfwjt/oBtIjvsBKNW0Jg/YgRgkOZ0ycI7KkQFpP1wUJz+2ejISWBj8ne9yKeFkowMr05AN+YsJf8DNbVhGoNlWUuKcChWVFrk3aAFTI9SE/lTanOSLX1rX85QNjYqWaq3W0L6TSMa+/v47oOH6sYba+c7Z+nbP8WIvbqP+SjzU0XSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN7r9mIZHEPOlNH367+zhhdBwovKJXuQKqZam/V0Q9s=;
 b=9ZgB9d/8kVj2/uHfskzGOIIeLBoiozA4nOfTmcA/aaIxDnB+d7H//lTeYoR6AMGNL3XdK16yzQQ2whVFSiNPhB5gyZekeVCvSs9T0peTpGUN3CEfXE3jCwrCy6I3wcWiV2cCqK+yfVeZT3PW6s86LJhNLmHeejVCQp8aEU2vehE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: John Ernberg <john.ernberg@actia.se>, Peng Fan <peng.fan@nxp.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jonas Blixt
	<jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index:
 AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDz198AgAA1LICAAVx4AIAAQjaAgAEdtQCAAynKwIABnCuAgAZ8E4CAKNxCgIAApf0AgAKGQwCAAAbHgIAHmWEA
Date: Wed, 13 Mar 2024 10:07:58 +0000
Message-ID: <967020E7-3D03-416A-8BFC-6F4E4BD9D7B5@arm.com>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org>
 <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
 <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
 <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
 <848794f3-a337-49d9-84db-a969970f071b@actia.se>
 <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org>
In-Reply-To: <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB6662:EE_|DU6PEPF0000A7E1:EE_|DU0PR08MB10357:EE_
X-MS-Office365-Filtering-Correlation-Id: 3835d7dc-0746-42f3-6b30-08dc43457b5a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hN9jQo0VkVZuUmu+Q5DxRZm0LcSwCbxi85pxQ0/3U3XTfL0XfoYH9HhCNLQR7V0XKL93C8aGUmEzuUcJ1a2jpnLanZtR+DcMHJmsqDtu0g+XgtqO+yM9sLrbqdQdcop8scvmpJhX/WbRR8+6QbH4At9bBaE8o2vWvrkeJ+Uv65nNFplJKBsqg1B854H/3IXQwmwCkXxOhiIBhUvnjNmvKGz4+Pf5f3gThkdDlp0i7djPE8z9P0nlJQL5QMyKP/etQfw8/+wPbW6NdW6P9XsIVGmLQ124wSbgc+Htfg5Zhn8U1dxV3gQK3n33qzLy7uED4W+c3Or3gDf26UBUMdfem4Do2bkDmQvD7cpEZijPLTGhwfUEOsNWqrYTWyXjMaJifxqmokbp5x+gx4OGFsRLI7BTkjcHxFvmw8WO7I0mY134wHSHjVNqpEHcOWF9Za3djMtng2oNHLQHT8jJoiZIeUsceLq5HSD1WnOoiHyKW+vTR4aJ3/HmGGqVOVEQLjJnp1Kpviu6XUQw3m9XAffSGztT0Gyr8aQgZqEhPZFtNYGXg3sFD3zt2fmr9dFVAC6b8QUefTxe7jYpnGT9X/dDSV5y6YFiDlWxYSRa9NCTLKJ+IO8mX3CnT83rrbDwQDqOm0+/AlMa3g0bU8Nnta0NceQoxaBNlZ+ccAyJEdBQ+6z/2ugfuqVcVLGx/G+AX2k0+vTlbdA5pEESAC8+u5ScMRIiUB6+qgmuk6Ns8v3qSic=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D4DA68D0B49374D8BDEE55D1442CB3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6662
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e81294cd-a37e-4272-bf44-08dc434575ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mM4cwfB40crauwoa2pDkGQdVwPFZU+8UnzjM7EpmbbUR4OGH6aRPGww1rA0o62R4skE8y1eWnlTG2mznkJim1LkeKTA66zzw8OQ8eDMSLXl3vifmN9lV4jE7aWVkWm+dmv5fmtrPsXWj//txwF9a/hNa0h91X1Sqd+EXzkmpCCXNmRhY//owNKiuHlms2GfWaxB8uUHC7DoqZT97Ii44e/2wENvxDZN09v6MmPW2Zwl9j5/Ax6rZwDPPPtPbj1b85fKpq4zdGJXRvOJ9qTU4Vq/PZNQSrkvRIcMNO/dGtvbQ5Ut69DsBz2rssd7QXHqD5Ym0Gq325ZQIyOhw/7KYQpcfGv3Q75h4B7kXulPJjVGaIb8ZLZgr8ek+/SAActgREuSIUZGO8dPd+NRfEnFqR9dWmxJEbpfRa3Xi7TrrcZeaayoi6N9yuTdozMQxUcvf3Ibbt5FBjQDUtFC2n4+Kh7fORw84aCQCasQSZLUG38prNTrE6BztO1iCihyF6OfFuBpGkc/IqgHg/WmKEANbEfVV3J8kFCU2FaK1VmjRalV2nZkZHWoxAa7TBpHNJ65IVyGtJ+DEee/81E7D1nw47jDMAPs4uH8b9UX+m2Q9+8KACBqHpo0WtFj7Yf2jTJl2GoovEucRasgPsxPr3uPHm8gnzK3hyi/dOfWAJWdThDJ2Cs9EQ97IL7y7z/PgAIPk+lq7AeKV4yFNVDDMmWO2E9GWLPE73RvqRgkrqv4a5dtkGFS872rxCmOMMMdLmCMX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 10:08:08.1095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3835d7dc-0746-42f3-6b30-08dc43457b5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10357

Hi,

> On 8 Mar 2024, at 15:04, Julien Grall <julien@xen.org> wrote:
>=20
> Hi John,
>=20
> Thank you for the reply.
>=20
> On 08/03/2024 13:40, John Ernberg wrote:
>> On 3/7/24 00:07, Julien Grall wrote:
>>>  > Ping on the watchdog discussion bits.
>>>=20
>>> Sorry for the late reply.
>>>=20
>>> On 06/03/2024 13:13, John Ernberg wrote:
>>>> On 2/9/24 14:14, John Ernberg wrote:
>>>>>=20
>>>>>>     * IMX_SIP_TIMER_*:  This seems to be related to the watchdog.
>>>>>> Shouldn't dom0 rely on the watchdog provided by Xen instead? So thos=
e
>>>>>> call will be used by Xen.
>>>>>=20
>>>>> That is indeed a watchdog SIP, and also for setting the SoC internal =
RTC
>>>>> if it is being used.
>>>>>=20
>>>>> I looked around if there was previous discussion and only really
>>>>> found [3].
>>>>> Is the xen/xen/include/watchdog.h header meant to be for this kind of
>>>>> watchdog support or is that more for the VM watchdog? Looking at the =
x86
>>>>> ACPI NMI watchdog it seems like the former, but I have never worked w=
ith
>>>>> x86 nor ACPI.
>>>=20
>>> include/watchdog.h contains helper to configure the watchdog for Xen. W=
e
>>> also have per-VM watchdog and this is configured by the hypercall
>>> SCHEDOP_watchdog.
>>>=20
>>>>>=20
>>>>> Currently forwarding it to Dom0 has not caused any watchdog resets wi=
th
>>>>> our watchdog timeout settings, our specific Dom0 setup and VM count.
>>>=20
>>> IIUC, the SMC API for the watchdog would be similar to the ACPI NMI
>>> watchdog. So I think it would make more sense if this is not exposed to
>>> dom0 (even if Xen is doing nothing with it).
>>>=20
>>> Can you try to hide the SMCs and check if dom0 still behave properly?
>>>=20
>>> Cheers,
>>>=20
>> This SMC manages a hardware watchdog, if it's not pinged within a
>> specific interval the entire board resets.
>=20
> Do you know what's the default interval? Is it large enough so Xen + dom0=
 can boot (at least up to when the watchdog driver is initialized)?
>=20
>> If I block the SMCs the watchdog driver in Dom0 will fail to ping the
>> watchdog, triggering a board reset because the system looks to have
>> become unresponsive. The reason this patch set started is because we
>> couldn't ping the watchdog when running with Xen.
>> In our specific system the bootloader enables the watchdog as early as
>> possible so that we can get watchdog protection for as much of the boot
>> as we possibly can.
>> So, if we are to block the SMC from Dom0, then Xen needs to take over
>> the pinging. It could be implemented similarly to the NMI watchdog,
>> except that the system will reset if the ping is missed rather than
>> backtrace.
>> It would also mean that Xen will get a whole watchdog driver-category
>> due to the watchdog being vendor and sometimes even SoC specific when it
>> comes to Arm.
>> My understanding of the domain watchdog code is that today the domain
>> needs to call SCHEDOP_watchdog at least once to start the watchdog
>> timer. Since watchdog protection through the whole boot process is
>> desirable we'd need some core changes, such as an option to start the
>> domain watchdog on init. >
>> It's quite a big change to make
>=20
> For clarification, above you seem to mention two changes:
>=20
> 1) Allow Xen to use the HW watchdog
> 2) Allow the domain to use the watchdog early
>=20
> I am assuming by big change, you are referring to 2?
>=20
> , while I am not against doing it if it
>> makes sense, I now wonder if Xen should manage hardware watchdogs.
>> Looking at the domain watchdog code it looks like if a domain does not
>> get enough execution time, the watchdog will not be pinged enough and
>> the guest will be reset. So either watchdog approach requires Dom0 to
>> get execution time. Dom0 also needs to service all the PV backends it's
>> responsible for. I'm not sure it's valuable to add another layer of
>> watchdog for this scenario as the end result (checking that the entire
>> system works) is achieved without it as well.
>> So, before I try to find the time to make a proposal for moving the
>> hardware watchdog bit to Xen, do we really want it?
>=20
> Thanks for the details. Given that the watchdog is enabled by the bootloa=
der, I think we want Xen to drive the watchdog for two reasons:
> 1) In true dom0less environment, dom0 would not exist
> 2) You are relying on Xen + Dom0 to boot (or at least enough to get the w=
atchdog working) within the watchdog interval.

Definitely we need to consider the case where there is no Dom0.

I think there are in fact 3 different use cases here:
- watchdog fully driven in a domain (dom0 or another): would work if it is =
expected
  that Xen + Domain boot time is under the watchdog initial refresh rate. I=
 think this
  could make sense on some applications where your system depends on a spec=
ific
  domain to be properly booted to work. This would require an initial refre=
sh time
  configurable in the boot loader probably.
- watchdog fully driven by Xen. One might want to just make sure the hyperv=
isor is alive.
- hybrid model where the watchdog is driven by Xen until a domain comes up =
to drive it.
  This could make sense to relax the stress on boot time but would raise th=
e question of
   what should be done if the domain dies. This is also kind of complex as =
Xen should stop
   refreshing the watchdog when a domain starts doing it (might require a t=
rap and emulate
   initially that is then mapped directly to a domain). I am not completely=
 sure this makes sense.

Regards
Bertrand


>=20
> Let see what the other Arm maintainer thinks.
>=20
> --=20
> Julien Grall


