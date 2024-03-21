Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E2885D30
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 17:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696489.1087490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnL55-0005ND-4f; Thu, 21 Mar 2024 16:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696489.1087490; Thu, 21 Mar 2024 16:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnL55-0005LW-1a; Thu, 21 Mar 2024 16:15:51 +0000
Received: by outflank-mailman (input) for mailman id 696489;
 Thu, 21 Mar 2024 16:15:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpBj=K3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rnL53-0005LH-7U
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 16:15:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45c00c35-e79e-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 17:15:46 +0100 (CET)
Received: from DU2PR04CA0259.eurprd04.prod.outlook.com (2603:10a6:10:28e::24)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Thu, 21 Mar
 2024 16:15:42 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::2e) by DU2PR04CA0259.outlook.office365.com
 (2603:10a6:10:28e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 16:15:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 16:15:42 +0000
Received: ("Tessian outbound ff4e98f65004:v300");
 Thu, 21 Mar 2024 16:15:42 +0000
Received: from ab85671fa26a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7A4E214-0E0F-450E-864F-94930694AA1B.1; 
 Thu, 21 Mar 2024 16:15:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ab85671fa26a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Mar 2024 16:15:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB9996.eurprd08.prod.outlook.com (2603:10a6:102:35a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Thu, 21 Mar
 2024 16:15:33 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 16:15:33 +0000
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
X-Inumbo-ID: 45c00c35-e79e-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eYwBdgNdt6szFJnEV4pChF3MPDUP2rB9KtZV49kOGbjCQEnPP18i/qBovB1E4EoBJmXIGEo6eBBJ2s9B6zc4JU8HqrZleB/KED9+x4XvOIlbak6whA0w8Gh7D3l4Ff47sLxf2U5j4fHWGW4Lc+pVLWAoLggy7C/n4RxoN34+ZJXc920rZkwOeoWWFAePeCmc30X4Uu4beDcbQbBwjZtyPqc6ITMuTbbVLVLXqvVUCwMFYB5zCPhqcf0bHW4pmYV/p9MexibAFt5UX8yb/dTKD87jen4SolNslLZF8Z/TZcebEWYMKj/TMFU6oS7RPdLItAOLFJR9clyhZYabA+7mqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69aJvN153GSKxFDX3cPN7v7+CUGmUGaFIwQt6g7ryyo=;
 b=NfbOW9GYJwlMq50GPlJwmGkcR5Nlei53d2nUmUFpHiji9K52g6i7a4EcJByseww34ok3cK+NUnzNFtRFU8sLlqtwUqlMRXSmfGP07Ae6wlcK+PcnPOp5iA35Kt+4c6dzKAYJpMePmQHrGRbue8qzGun4Y5uD3tXDMtCMVqOq8TY+oroCe6XARRRHaNMExJ+bRwKZEd55AuzDRIo/dPVO8S33O1sAy0x4I+MTjzNzr9QkWoEE5c2CvuZrBeW3o0K1zhKTHBwfs2puj7cqLXp0Bu/GMj4XZzJOlqiKWOTe7SV7bJP+BkwEcBnNN7A9e3XUUOoOnjliH1JtVfOw4yARLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69aJvN153GSKxFDX3cPN7v7+CUGmUGaFIwQt6g7ryyo=;
 b=pBTKXMjquN+ItEOw5KLmbV2Li3E/S1FiFZzneIZbm0fc3I7z9r0L/mHi3SzbnI/CXfSjJyCgPsCNO3ohwc+UiQdnILa4WDR/jtTaoHz1yyIzNFlwvzaI/CSy2A4Qo5m9OgsrzEXsnMQvfL0odq+7bgmx4szEfzGKrwIfhFoscQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce255519c07dc19a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnAELmX9XjTJBWFUzbENONjoQjDewai5H/ViaZ5WceEeptEwti6WD2WKOU+9GcMaFYsRRmaECNziKXcnAKHXyNxjTk7sEQqBb1gfv0/h24m9oyC6omcfSjiKQGqw+yp7jJkIWsJxcnCE3esHv/i3a0gO4dDzLLtq1rXafybl1YxbWJXHIx5DCHXc7GD3Ps6jQjr1UrDTOuwbyjdG/y+SX3crEcjm4HymqpB0UhwGCaQS3gWzJvAuY0ViWY0beHaxtw+mq2LW8CRLNbLJ+EndntM2nsMzZ2Fx2LOMJ4A2/8JAtj0JmVLH9WJor/okXhMDTMdq/n2K3sBxpWKee2RatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69aJvN153GSKxFDX3cPN7v7+CUGmUGaFIwQt6g7ryyo=;
 b=IyZkTQuUgzzaUUz7gKy9sYHzhhLQitPyIef1gZYktHf08CDgqEibE8bRVfuPKfxPqswJOm9R8r/vApwme9oWhtOKhPhPbfmHE12lSB/KSG3Pi7QonHZ7iZ5FIqC6Iec7ve0BctgRZUnYRMMCq07nxmY1o8tQDzeRXvthPFAhmIglLk8o7kuX6ZJ3BeqcpXnqpZ2us7gclYuylcJ5vnwL09mfrB1XGkvK8EkLRaukqrBrEzNy4s6TpiglMimaiD3oe/lFih+8K8ysDskLECAKQaOn52LbPIHGi+XrM2jggRYBA4qL2+92Glt1u5g/ykb2BeJtTbmTW7wF0YpozTglUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69aJvN153GSKxFDX3cPN7v7+CUGmUGaFIwQt6g7ryyo=;
 b=pBTKXMjquN+ItEOw5KLmbV2Li3E/S1FiFZzneIZbm0fc3I7z9r0L/mHi3SzbnI/CXfSjJyCgPsCNO3ohwc+UiQdnILa4WDR/jtTaoHz1yyIzNFlwvzaI/CSy2A4Qo5m9OgsrzEXsnMQvfL0odq+7bgmx4szEfzGKrwIfhFoscQU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: John Ernberg <john.ernberg@actia.se>
CC: Julien Grall <julien@xen.org>, Peng Fan <peng.fan@nxp.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jonas Blixt
	<jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index:
 AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDz198AgAA1LICAAVx4AIAAQjaAgAEdtQCAAynKwIABnCuAgAZ8E4CAKNxCgIAApf0AgAKGQwCAAAbHgIAHmWEAgAtpgACAABVOgIAA6w+AgACMxYCAAAK5AA==
Date: Thu, 21 Mar 2024 16:15:33 +0000
Message-ID: <D1C06B7F-558C-4546-B3C3-F994263D2AA1@arm.com>
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
 <967020E7-3D03-416A-8BFC-6F4E4BD9D7B5@arm.com>
 <c17e0eeb-b679-4685-9ae9-6662c2035500@actia.se>
 <849f3f5a-b960-444a-a10e-1f2df36c22a7@xen.org>
 <2F07325F-428F-4570-BE14-B84DD0A1C9F7@arm.com>
 <1f5eba1a-7dc3-41f2-8986-26452c264770@actia.se>
In-Reply-To: <1f5eba1a-7dc3-41f2-8986-26452c264770@actia.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB9996:EE_|DB5PEPF00014B88:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e96a875-1cef-48f7-ca26-08dc49c22804
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6Ht5S6qTfLg49ALgBqMTZ5z4MERPFcUN76tooHbAPtuFoxWLR/6w7elkx+KHaq4wdlPnJlh8LjpQcXvqme59OTk40b8aMmYnVZNes4isryQhEXHeawpGDLjRtLv471QQuWu8sb+/2Z8//tWkFmEj4lAHpzS2Rdqy/mhJ74E8vEyfssl8SzMceyD3cLPLpROieSrf9KQwmdheM1HklfP5LiRkqC9t8P2PynVVyPQLw53MdVMZ6iXTjB817BdyhevKlrGQSZY6eCnx0yw+GvKN/xXk7YXvk9TbyDjCr2Cop3gT6YB/ORE/3nCS3N5qyGLQR6OhL3Sff3qAC9jN8GxZLhsEJNPeD2tg5k2qExVrmT1cCj6Gq9xm2zsKuPNnygGJbAkZxrwXitLiW6hw09aHC5Y0GRXejq9IpEGXST20KadILbgSUshN70wEkosIVOTOs2IEYxkK+tqgQDGo0EzORbotjUfhelb3zwf8eKQllOTTi2nlB/D9Mjq2hu61KasVMxJUX5feA89c40kRkNw7SjhMBQlF5X8p2c/ly6GqKPq5wvshG8wi222XQkKLDoaV3YJvZlnZ8DUuNuxsIbbYTAYMVUnbZ61B6dIrKyRGY/XqT9pHQ/tXbMSYLGDYXmpbMEAHguQeCQiDH2OVrFbPnDzKdlbdjkwlq5FhpF/8FBfLcRs9cxCbAsoS6zeotINyV0cWgaMKeusoQWpn3kP5jUNo+4LSs9JzYYVWsDYP4QI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <67925C69ECF4994D8E451A620D72DD31@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9996
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e941129-b6c5-4680-aa5f-08dc49c22292
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A2kq7EwSRLOjCW62+RmK8HL6YZFBieakHy0RNpL3SEzrS4RDBh0AUWAiZUtlItrjg4F32ZUxlicwYvdEFAYgj5SFRoYZlXCsYrxyaZTldDfNvG1p+SGfeLxc1i8OVgxFyXYqaAGOCLyGd/rYfQVByhsZ50R4KeZNUfwY5XTayh15s071TZFh9oMjhxleF4vIzGKqJTqUORiGrwn00UkwTK8YjnoPE6radVxcEj8cqRGbDi7UITI9mUFZftOp+cDrmTcT2PXTlLFO0VOR8YB5PIQpMiQrS2SsKsI2wI3FQ3vOcx9MlNTL8QgkRdz2/sRwtgtcDPFM9IW/bYrp2dPMz0NcUXu7r7lFy+0ks8qLl8fpVMEUrHqP2ov3/sEs4nUKf4BK09m41qp2OfyX3YWGdHkLYK+rq/cRuibSDyS2u/PTI/rLukyUga/DbPoBy1E0YBEFPyGulaZUT29Azc+84NLe6BkJPp+Z3wWZZ9H1IFsM1w1qUdJiG1TMb+xxUfPbaLZKnUx2kIxpa0BVUDnfcijTVK31AEBXtx74gpkxxuVjA8p+P4AqlKXLU6VFHp8VFXjROandMWl8Wddw0wlScH9k6p4zg/SGAP1WwUMsqhTFSFGKe2t9l1phQPvNKLqCNRzfcQCX4h42F//LyZciG28iyS2+CNAC+Cdo7VzcSat8wq/zL6MyoqYOG6AxFkwpD/ePfS6zFnTA3SqbjIiP+vuGR6eBH2ZB4BFMS2ENC1YQ7iG50EszLhGAu0XO27uO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 16:15:42.3497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e96a875-1cef-48f7-ca26-08dc49c22804
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055

Hi John,

> On 21 Mar 2024, at 17:05, John Ernberg <john.ernberg@actia.se> wrote:
>=20
> Hi Bertrand,
>=20
> On 3/21/24 08:41, Bertrand Marquis wrote:
>> Hi,
>>=20
>>> On 20 Mar 2024, at 18:40, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi John,
>>>=20
>>> On 20/03/2024 16:24, John Ernberg wrote:
>>>> Hi Bertrand,
>>>> On 3/13/24 11:07, Bertrand Marquis wrote:
>>>>> Hi,
>>>>>=20
>>>>>> On 8 Mar 2024, at 15:04, Julien Grall <julien@xen.org> wrote:
>>>>>>=20
>>>>>> Hi John,
>>>>>>=20
>>>>>> Thank you for the reply.
>>>>>>=20
>>>>>> On 08/03/2024 13:40, John Ernberg wrote:
>>>>>>> On 3/7/24 00:07, Julien Grall wrote:
>>>>>>>>> Ping on the watchdog discussion bits.
>>>>>>>>=20
>>>>>>>> Sorry for the late reply.
>>>>>>>>=20
>>>>>>>> On 06/03/2024 13:13, John Ernberg wrote:
>>>>>>>>> On 2/9/24 14:14, John Ernberg wrote:
>>>>>>>>>>=20
>>>>>>>>>>>      * IMX_SIP_TIMER_*:  This seems to be related to the watchd=
og.
>>>>>>>>>>> Shouldn't dom0 rely on the watchdog provided by Xen instead? So=
 those
>>>>>>>>>>> call will be used by Xen.
>>>>>>>>>>=20
>>>>>>>>>> That is indeed a watchdog SIP, and also for setting the SoC inte=
rnal RTC
>>>>>>>>>> if it is being used.
>>>>>>>>>>=20
>>>>>>>>>> I looked around if there was previous discussion and only really
>>>>>>>>>> found [3].
>>>>>>>>>> Is the xen/xen/include/watchdog.h header meant to be for this ki=
nd of
>>>>>>>>>> watchdog support or is that more for the VM watchdog? Looking at=
 the x86
>>>>>>>>>> ACPI NMI watchdog it seems like the former, but I have never wor=
ked with
>>>>>>>>>> x86 nor ACPI.
>>>>>>>>=20
>>>>>>>> include/watchdog.h contains helper to configure the watchdog for X=
en. We
>>>>>>>> also have per-VM watchdog and this is configured by the hypercall
>>>>>>>> SCHEDOP_watchdog.
>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>>> Currently forwarding it to Dom0 has not caused any watchdog rese=
ts with
>>>>>>>>>> our watchdog timeout settings, our specific Dom0 setup and VM co=
unt.
>>>>>>>>=20
>>>>>>>> IIUC, the SMC API for the watchdog would be similar to the ACPI NM=
I
>>>>>>>> watchdog. So I think it would make more sense if this is not expos=
ed to
>>>>>>>> dom0 (even if Xen is doing nothing with it).
>>>>>>>>=20
>>>>>>>> Can you try to hide the SMCs and check if dom0 still behave proper=
ly?
>>>>>>>>=20
>>>>>>>> Cheers,
>>>>>>>>=20
>>>>>>> This SMC manages a hardware watchdog, if it's not pinged within a
>>>>>>> specific interval the entire board resets.
>>>>>>=20
>>>>>> Do you know what's the default interval? Is it large enough so Xen +=
 dom0 can boot (at least up to when the watchdog driver is initialized)?
>>>>>>=20
>>>>>>> If I block the SMCs the watchdog driver in Dom0 will fail to ping t=
he
>>>>>>> watchdog, triggering a board reset because the system looks to have
>>>>>>> become unresponsive. The reason this patch set started is because w=
e
>>>>>>> couldn't ping the watchdog when running with Xen.
>>>>>>> In our specific system the bootloader enables the watchdog as early=
 as
>>>>>>> possible so that we can get watchdog protection for as much of the =
boot
>>>>>>> as we possibly can.
>>>>>>> So, if we are to block the SMC from Dom0, then Xen needs to take ov=
er
>>>>>>> the pinging. It could be implemented similarly to the NMI watchdog,
>>>>>>> except that the system will reset if the ping is missed rather than
>>>>>>> backtrace.
>>>>>>> It would also mean that Xen will get a whole watchdog driver-catego=
ry
>>>>>>> due to the watchdog being vendor and sometimes even SoC specific wh=
en it
>>>>>>> comes to Arm.
>>>>>>> My understanding of the domain watchdog code is that today the doma=
in
>>>>>>> needs to call SCHEDOP_watchdog at least once to start the watchdog
>>>>>>> timer. Since watchdog protection through the whole boot process is
>>>>>>> desirable we'd need some core changes, such as an option to start t=
he
>>>>>>> domain watchdog on init. >
>>>>>>> It's quite a big change to make
>>>>>>=20
>>>>>> For clarification, above you seem to mention two changes:
>>>>>>=20
>>>>>> 1) Allow Xen to use the HW watchdog
>>>>>> 2) Allow the domain to use the watchdog early
>>>>>>=20
>>>>>> I am assuming by big change, you are referring to 2?
>>>>>>=20
>>>>>> , while I am not against doing it if it
>>>>>>> makes sense, I now wonder if Xen should manage hardware watchdogs.
>>>>>>> Looking at the domain watchdog code it looks like if a domain does =
not
>>>>>>> get enough execution time, the watchdog will not be pinged enough a=
nd
>>>>>>> the guest will be reset. So either watchdog approach requires Dom0 =
to
>>>>>>> get execution time. Dom0 also needs to service all the PV backends =
it's
>>>>>>> responsible for. I'm not sure it's valuable to add another layer of
>>>>>>> watchdog for this scenario as the end result (checking that the ent=
ire
>>>>>>> system works) is achieved without it as well.
>>>>>>> So, before I try to find the time to make a proposal for moving the
>>>>>>> hardware watchdog bit to Xen, do we really want it?
>>>>>>=20
>>>>>> Thanks for the details. Given that the watchdog is enabled by the bo=
otloader, I think we want Xen to drive the watchdog for two reasons:
>>>>>> 1) In true dom0less environment, dom0 would not exist
>>>>>> 2) You are relying on Xen + Dom0 to boot (or at least enough to get =
the watchdog working) within the watchdog interval.
>>>>>=20
>>>>> Definitely we need to consider the case where there is no Dom0.
>>>>>=20
>>>>> I think there are in fact 3 different use cases here:
>>>>> - watchdog fully driven in a domain (dom0 or another): would work if =
it is expected
>>>>>    that Xen + Domain boot time is under the watchdog initial refresh =
rate. I think this
>>>>>    could make sense on some applications where your system depends on=
 a specific
>>>>>    domain to be properly booted to work. This would require an initia=
l refresh time
>>>>>    configurable in the boot loader probably.
>>>> This is our use-case. ^
>>>> Our dom0 is monitoring and managing the other domains in our system.
>>>> Without dom0 working the system isn't really working as a whole.
>>>> @Julien: Would you be ok with the patch set continuing in the directio=
n
>>>> of the
>>>> original proposal, letting another party (or me at a later time) imple=
ment
>>>> the fully driven by Xen option?
>>> I am concerned about this particular point from Bertrand:
>>>=20
>>> "would work if it is expected that Xen + Domain boot time is under the =
watchdog initial refresh rate."
>>>=20
>>> How will a user be able to figure out how to initially configure the wa=
tchdog? Is this something you can easily configure in the bootloader at run=
time?
>=20
> If you go through the trouble of enabling the watchdog in the bootloader =
you
> usually know what you're doing and set the timeout yourself.
>=20
> Since our systems can be mounted in really annoying locations (both in
> installations and world-wise) we need as much auto-recovery as possible t=
o
> avoid people having to travel to collect a unit that just needed a reset =
due
> to some unexpected obscure issue at startup.

I definitely get the need do not get me wrong.
I am just concerned by potential users having target restarting when using =
Xen because of that and not knowing why.

>>=20
>> Definitely here it would be better to have the watchdog turned off by de=
fault and document how to enable it in the firmware.
>>=20
>> Even if a long timeout is configured by default, a user could run into t=
rouble if using a linux without watchdog or not running linux or using dom0=
less without a linux having access to it.
>> I agree with Julien here that the concern could be that users would come=
 to us instead of NXP if there is system is doing a reset without reasons a=
fter some seconds or minutes.
>=20
> I could add myself as a reviewer for the iMX parts if that helps routing=
=20
> such
> questions (and future patches) also to me. We have experience with the QX=
P,
> and the QM (for the supported parts by this patch set) is identical.
>=20
> Would that help with the concerns?

Definitely it could help.

>=20
>>=20
>>>=20
>>>=20
>>> Overall, I am not for this approach at least in the current status. I w=
ould be more inclined if there are some documentations explaining how this =
is supposed to be configured on NXP, so others can use the code.
>>>=20
>>> Anyway, this is why we have multiple Arm maintainers for this kind of s=
ituation. If they other agrees with you, then they can ack the patch and th=
is can be merged.
>>=20
>> I agree with Stefano that it would be good to have those board supported=
.
>>=20
>> One thing i could suggest until there is a watchdog driver inside Xen is=
 to have a clear Warning at Xen boot on those boards in the console so that=
 we could at least identify the reason easily if a reset occurs for someone=
.
>=20
> How do other SoCs deal with this currently? The iMX SoCs aren't the only=
=20
> ones
> with a watchdog, just the first one added to Xen that pings the watchdog=
=20
> over
> an SMC. What about the OMAPs, the R-Cars, Xilinx's, Exynos' and so on?

As far as I know the watchdog is usually not active until a driver activate=
s it.
Which means that by default it will not fire.
Having it activated by the bootloader by default is not usual.
Now definitely on a lot of use cases the users are activating it in the boo=
loader
but their systems are design for it.

Do I understand that the default boot loader configuration is not activatin=
g it on your side ?

Regards
Bertrand

>=20
> Thanks! // John Ernberg



