Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624379779CC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:38:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798012.1208134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0sS-0007ZU-KE; Fri, 13 Sep 2024 07:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798012.1208134; Fri, 13 Sep 2024 07:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0sS-0007Xd-Gl; Fri, 13 Sep 2024 07:38:00 +0000
Received: by outflank-mailman (input) for mailman id 798012;
 Fri, 13 Sep 2024 07:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Xx=QL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sp0sR-0007XX-71
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:37:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [2a01:111:f403:260d::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17f62997-71a3-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 09:37:57 +0200 (CEST)
Received: from DB8PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:10:110::17)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.9; Fri, 13 Sep
 2024 07:37:54 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::4d) by DB8PR04CA0007.outlook.office365.com
 (2603:10a6:10:110::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Fri, 13 Sep 2024 07:37:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13 via
 Frontend Transport; Fri, 13 Sep 2024 07:37:53 +0000
Received: ("Tessian outbound ee7a81b3b7b9:v441");
 Fri, 13 Sep 2024 07:37:52 +0000
Received: from Lf2eb325cecd4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E95A4282-7C50-4C02-8834-16511B77C8CD.1; 
 Fri, 13 Sep 2024 07:37:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf2eb325cecd4.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Sep 2024 07:37:46 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB9978.eurprd08.prod.outlook.com (2603:10a6:20b:631::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 07:37:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7982.008; Fri, 13 Sep 2024
 07:37:41 +0000
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
X-Inumbo-ID: 17f62997-71a3-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oGOHIWxlIT08b9y1dtEbprS5njUblZBO2OvhGm9PiDy+l1zSC7YYjJsfVbhs+nJdOiUX8bxDbORvUKredPV5od5pwBj1xEbFDgs+NNizcFlwMeAXXeK9xqpHVIPEwAmMtXwsBlEXs8Ox5HwQm2l0/8DbUPP+PGN0rClDSNzC1G1iXL4km7tQNj/p5KhMwjVTFpVmLftis5cEalgh1/cKiw3CXeCirOWq8NnU43Uskyk4GV+Wsz/I+Tzt0tVk/whOmyfnEwTZ47qzV9tzbXm6JpYZGKpE2uVbtvBcRgKSp8hTS6t+DVlwAnsOq+DLs/VNiJ13R9dWdB7ipCSACNzAvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCoXoP3wlWY0DUyOsrjReRd3qRM24R+57vCMe4hiR8I=;
 b=O/PN+Lk9sjECt7ONgG9yFzKrscIcDcV4cgcp+YtJzl9A3NMBxyfqSEwYjGuo1icxDtu4ZC2e72J4axeCHPsQ/ZY2vLvSHUshh9cd0Fb0t9UUafVpTTHS2Cqu3yyXRqKRY+45FXxka3OSz+JdJaVkgNP68r9rXhXqfI9gvnY3aD+UWVeQFNWhp4+fiBy65Dp293MZyQ1zZV7r4ycH+vamnSFfiHH8qVjjyRp8iM7cgc8tl+ju5OLKfiCHo0ULfhQZDPp/Tx3H1hbIP/GyCnjEVSZQ1wxhVfIH2wn7Iz++yg/ahxSRtEAv7kXA4Pc0rO/R5yICPFEVT4da3Fdp+X0egg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCoXoP3wlWY0DUyOsrjReRd3qRM24R+57vCMe4hiR8I=;
 b=piiUphZQFk/XmRudU5/ONEcZjQUQY4FktEnsdT2mjM2pbLRTCvakB43/wHImfUdRXEEzj1tA8VXfm0fSL570qfwU6kIu7P4B870WipfDS30IhfTh9vapxQ93/Lyd9FCVdf2Pes/KtvCScQKb3p0Gga1ecDe7yAIv9G2a1yqnvWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30531114593eafea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHAtcbwd3vYj4ym/RyvibC1GYgZiiHjvt47LglO5VGfYkBuVKchdvrE32RXZHoy6DR1AkJWZbm4i58EHu3ka6Pn1vRCcI/RSlb9aAYzTN1k/24HcstCraLVTEvlD8gxI71h+fhsJ3+NmSzRXb6vAhlpYgc2QYIlI+4+rxIQ8v90NW+/dqg7JDy6cuMRRj183jExhRdPRqgz64M8DXV+lHOH0j4NKKftiiJnXS1KT3pIuzXfmyRS3TXVkPP2/EfPXjFLes9q6YPteVwejJs4k52TvNpnjCdmRRFPgl/wXlQ2wcKsAtQlv5K+RAQeqStn7xgi8IwoOetOfI053/6uz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCoXoP3wlWY0DUyOsrjReRd3qRM24R+57vCMe4hiR8I=;
 b=ShNukGdpwPO66aiXxwOfMva3fghYh5imMxpZsyqGDDc2vxDkYJCdUqHSmAIwSThdu9NR2UH/fKIZ9to+g9bs1exvaZOthFx6znhL7HJ3zQKNZJVuq9JATw7f6h7CrVnPhg5wBZyU7EFKMVx94xrgkpC8Y+WEFBGeJ2vLcTWipBgQTlaSIWm1ssj2lZbGfFFp4kRW7oRg7sjYKESCJWE3+6O+Ubk9lkioJhhJxjBjTuEw9ZppvPRRhh6CHWF13UJKq1g1fv7AfJ6w4xnFOqK1psg1ys0ZLVR7fWPZ0GGU5Z5RJTv03HTvtKBq3lDuAHq9s5WI4j8icRLTZqyTybeLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCoXoP3wlWY0DUyOsrjReRd3qRM24R+57vCMe4hiR8I=;
 b=piiUphZQFk/XmRudU5/ONEcZjQUQY4FktEnsdT2mjM2pbLRTCvakB43/wHImfUdRXEEzj1tA8VXfm0fSL570qfwU6kIu7P4B870WipfDS30IhfTh9vapxQ93/Lyd9FCVdf2Pes/KtvCScQKb3p0Gga1ecDe7yAIv9G2a1yqnvWs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm: Drop deprecated early printk platform options
Thread-Topic: [PATCH] arm: Drop deprecated early printk platform options
Thread-Index: AQHbBaRsVhEiVv6NsUivTMavfUgn4LJVSBqAgAAJvoCAAAJyAA==
Date: Fri, 13 Sep 2024 07:37:41 +0000
Message-ID: <55C1FFD4-7220-483A-A38D-A17E934DDDBD@arm.com>
References: <20240913061529.213002-1-michal.orzel@amd.com>
 <3307FCC0-8268-4D7F-A988-F460552CB83C@arm.com>
 <7f0dcfb1-82d0-4649-a978-65aac4f292c7@amd.com>
In-Reply-To: <7f0dcfb1-82d0-4649-a978-65aac4f292c7@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB9978:EE_|DU2PEPF0001E9C5:EE_|AS8PR08MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 159fe605-fb3f-499f-263e-08dcd3c6fa13
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Xx++D/gliE19TH7Yp6XTcQme9MQCnsk9FBnb7ROft7S5osZoeNyEt1neggRi?=
 =?us-ascii?Q?PPrgVYOzkIVaJ/UzTqte+szN9B339P09YbtvRqvE1pqw5CB+vRTlOG9HvBSM?=
 =?us-ascii?Q?c3R/YeK/77wn7vUKp4n0wmddyFX+v81hMjs7bUd4d/53/F95itzyiP18wovK?=
 =?us-ascii?Q?0L+5d92+4QUzz0CATYX2gU8KxeXOSX9EpS76TM7dBKFjcib9hKfQUQMNtPq/?=
 =?us-ascii?Q?1nZWWzOXZfEMNEoNIMG5edhOHXlNiXXdhilVcvoWbR0AQUQYPulKoRlEmWQY?=
 =?us-ascii?Q?MgE+p40REjO+HAuxfPw+LSvQHCCFPRRE7Egjsv2HZehp+g3u3AnAcXeoiLsx?=
 =?us-ascii?Q?4aDEWroLGO+mRpLxJZSGBA5DRv/eQoT3uoFqmPn1+XYK7czgDqvyjAGhnwEk?=
 =?us-ascii?Q?dWo/PgHtFaCcw2r8iFXE+vfQEVvVQUYZtNHpklzTHNGeUOPzNwelyOXzvZYr?=
 =?us-ascii?Q?fpGyMh1fv9ijdTtZt8XWdfifhmrvANEy9WDAJL8upVs05NM/fVZLQQAKRwkx?=
 =?us-ascii?Q?fLVoSB18frI1PxkaH7sqDlvOrTMolzsFuf8ShuiDhDV5542AS1BpSkfbao2H?=
 =?us-ascii?Q?3D0MoOFQFy+gfe8XenuKQ/eeBAGRlyoUkcXHMNkaa04YZ2ClZkNGPTJ9xfZL?=
 =?us-ascii?Q?5x08iTuWhLe48hmzwTGR8x+7zsHh2H3ssJHi+07R0YVUw5630Kh9XaPZz5Ql?=
 =?us-ascii?Q?I5Gt6EHVLee2N06kcb6qOKcUyreXeZMK5PLyCzcora0REa7iNYFAE2IKdhFQ?=
 =?us-ascii?Q?awu8G+uvBeTb/1bNccqs2RNngZoL45C/B7X4BgdVrepmxA/UkUCy+AoQSlf2?=
 =?us-ascii?Q?bdVHc3ZN/AMLSoPGIjbsyDfCCOTCjbrTLvyuIjg3BG/7qMKiBVs0K3r7Opdk?=
 =?us-ascii?Q?mUvqWdalir2m2emSV9MZn/qpl5r2cIe1VmfO/c8ijaidG9159GAMouD5TxrA?=
 =?us-ascii?Q?oZqpARH+9iNmbOezgNVX8SunTMpuPl3i17wP6UeS80qvl8zMaasAwvEnqr5g?=
 =?us-ascii?Q?jV35zUfqULLQJXTthoQXPO04xCOEJ+vQXS4wptSpphK8dhBBx2TGhSEteKSi?=
 =?us-ascii?Q?W8x3G0WX5bfOUJeoww0zYp+1bWCKxkj4D4kPWvegSASe7Nh1AqjchHbGdjIZ?=
 =?us-ascii?Q?BJrZI4pNO8cjvtQ6UQrkhAHu5nlRE9Zy7eYdbXLChGsfFTptb9qE82Fsfvw8?=
 =?us-ascii?Q?UgOpR8/nPeIlSJu9fdbo5Qb0km0ALTH9mjhfahi/uxoYyq8NP5FKKvH6nM/q?=
 =?us-ascii?Q?rWhRCm59Vnzioa0wefAWDP7OthpNtWnaB5m7UIG6aLlQXO+hU5ztfYRjxF4L?=
 =?us-ascii?Q?dFC1Z2DBUVTwsgHbwYjiPYGsrk5R0BH45ZzraH3QwKFTB+hvPk2h/lTbj3Tq?=
 =?us-ascii?Q?miq2hhY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9EF0D23EB785CF43A65E820A2F0B33DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9978
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cfb94b32-c678-46f9-d26c-08dcd3c6f2d5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ldEtwloBPVev85wyF2z7TcIXR6sWBMQdNj+BILgQEBEgmvN2MKB9FjM+XrU?=
 =?us-ascii?Q?kq3gCO8wvzasiTnGVjkzV7UOjHTPudLQSs5LPJW2j2mjAz4TlaqL6VM5Eiot?=
 =?us-ascii?Q?EXxxREYhVj7sFaMQ8yf4PCLsX86AcfODz1EPXi7lDpXOMyfghVWdbkjYcVTs?=
 =?us-ascii?Q?0rh0UvCYNixjiKnmEIbjrbmtVddpIaOXYEX9Y/pJyCaTYVWwGG7OF35DDEGc?=
 =?us-ascii?Q?MtiL5H7J+3hwtABesJa5DVAJxVWJdzPiYpc4NwmDaPtuaI26pLSA46t9sKG2?=
 =?us-ascii?Q?/Iq++bw0n/Zg2nWiAKOi/C4IMrRbUXBuUUPnf1GjsgObR8UfEEbWmVmjMtI3?=
 =?us-ascii?Q?ofr3h05/vm8QX4wqB5AlBwbXfJDA777JNbH0XivNfVOAm3XTORKseDS8NCtF?=
 =?us-ascii?Q?cyHQL5q46PSIeFnE1Y0TehsBIq2HKgjdL4usUnZPJ3V1rF7gVvXamFjCKpZ7?=
 =?us-ascii?Q?jxUznR+BtL8UlywKn+dVK7TqK6Nhgq1oFbW+7A8o14YImt51XJ/3hMbkIDpf?=
 =?us-ascii?Q?viZ4BMtQq286oAE4wmKCGJ8sFqgiOj9O5KtImP5DX5HUjy36FZR27SC95F5T?=
 =?us-ascii?Q?moKlRrjE7PXO3/74BfiAdP7paHlUPpIgwPKS1Rg7B1pGbhiayELev+NkiH5d?=
 =?us-ascii?Q?9Rm9A7fqAjWM0bHAo79DObDTNBmcyGqryf2nb+Tmil4nYdTcMKGrbTSVLY7l?=
 =?us-ascii?Q?pHCIpMy4nL0UNwfyrGAKvUC+9pCBjsSNPKJ0LPON48ExVGf6sfbRSt+PCxg9?=
 =?us-ascii?Q?qj3Yd2Ev7nANz7pe13qu7J6DYjmI3KFpTprUerZSyWlC9CdfJiLVzmWSMvYH?=
 =?us-ascii?Q?sOR+pTVJX5SryoOSbAAySS7c6u/SwUpPBiDik53jJ6LSSqAsumIPXL0FpIs/?=
 =?us-ascii?Q?h2uQ0RjRtgLWFtYVb6Z+CB+qCXhvRo0Hx7dWOawIxtDbW6KIjoMm+Vk5OYnc?=
 =?us-ascii?Q?Ksqiq5u80JUjpvMLr3Bc3sqTp39kUQIOrEBSY3DAK/M7B/35UZBbLJb5rVge?=
 =?us-ascii?Q?+CO8nHeJ59YPutPRngrMtu3M5dI2iIkRNPaVTUKgl/LR/6p47BbishCZ7sqK?=
 =?us-ascii?Q?PweejFk0Oy4KolsF4o35AkCsM8A3t66+10Npdh6yK6pfKC4lUuEMPrXbAqR8?=
 =?us-ascii?Q?Drq3mF66byHd9Pmy/TLK0KrX9/oiNWWWXmsaMhYt7UrCGghv46ITZf9T8LRg?=
 =?us-ascii?Q?8Ts+LsHAqBlWg2VYHIpLFoS4V33UGWEvuI6wlc40D6WbmwNkbrwyI07wAJtP?=
 =?us-ascii?Q?ninQY9HkSNDiFTLpc5tjZteZ0Ky77BJMXSU6XumbG1BdBHhJM0aklO8zt6IP?=
 =?us-ascii?Q?x1fHqcPCYEFR2v8diAEOLerkHttyhmZbnbaFcBUUrmUCjjJNyIb43wLwBCXA?=
 =?us-ascii?Q?uy6XtWiKeWOA+rBNGNvIhvdbeSSI?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 07:37:53.1843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159fe605-fb3f-499f-263e-08dcd3c6fa13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008

Hi,

> On 13 Sep 2024, at 09:28, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> On 13/09/2024 08:54, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Michal,
>>=20
>>> On 13 Sep 2024, at 08:15, Michal Orzel <michal.orzel@amd.com> wrote:
>>>=20
>>> The predefined configurations for early printk have been deprecated for
>>> a sufficient amount of time. Let's finally remove them.
>>>=20
>>> Note:
>>> In order not to loose these predefined configurations, I wrote a wiki
>>> page: https://wiki.xenproject.org/wiki/Xen_on_ARM_Early_Printk
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>>> ---
>>> docs/misc/arm/early-printk.txt |   4 -
>>> xen/arch/arm/Kconfig.debug     | 155 ++-------------------------------
>>> 2 files changed, 9 insertions(+), 150 deletions(-)
>>>=20
>>> diff --git a/docs/misc/arm/early-printk.txt b/docs/misc/arm/early-print=
k.txt
>>> index bc2d65aa2ea3..e6b9124a38e3 100644
>>> --- a/docs/misc/arm/early-printk.txt
>>> +++ b/docs/misc/arm/early-printk.txt
>>> @@ -35,8 +35,4 @@ Other options depends on the driver selected:
>>>=20
>>>  - For all other uarts there are no additional options.
>>>=20
>>> -As a convenience it is also possible to select from a list of
>>> -predefined configurations available in the list of choice for "Early
>>> -printk" for specific platform.
>>> -
>>> By default early printk is disabled.
>>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>>> index eec860e88e0b..2fa0acd2a3f1 100644
>>> --- a/xen/arch/arm/Kconfig.debug
>>> +++ b/xen/arch/arm/Kconfig.debug
>>> @@ -13,177 +13,67 @@ choice
>>> Choose one of the UART drivers for early printk, then you'll
>>> have to specify the parameters, like the base address.
>>>=20
>>> - Deprecated: Alternatively, there are platform specific options
>>> - which will have default values for the various parameters. But
>>> - such option will soon be removed.
>>> -
>>> config EARLY_UART_CHOICE_8250
>>> select EARLY_UART_8250
>>> bool "Early printk via 8250 UART"
>>> help
>>> Say Y here if you wish the early printk to direct their
>>> - output to a 8250 UART. You can use this option to
>>> - provide the parameters for the 8250 UART rather than
>>> - selecting one of the platform specific options below if
>>> - you know the parameters for the port.
>>> + output to a 8250 UART.
>>>=20
>>> - This option is preferred over the platform specific
>>> - options; the platform specific options are deprecated
>>> - and will soon be removed.
>>> config EARLY_UART_CHOICE_CADENCE
>>> select EARLY_UART_CADENCE
>>> depends on ARM_64
>>> bool "Early printk via Cadence UART"
>>> help
>>> Say Y here if you wish the early printk to direct their
>>> - output to a Cadence UART. You can use this option to
>>> - provide the parameters for the Cadence UART rather than
>>> - selecting one of the platform specific options below if
>>> - you know the parameters for the port.
>>> + output to a Cadence UART.
>>>=20
>>> - This option is preferred over the platform specific
>>> - options; the platform specific options are deprecated
>>> - and will soon be removed.
>>> config EARLY_UART_CHOICE_EXYNOS4210
>>> select EARLY_UART_EXYNOS4210
>>> depends on ARM_32
>>> bool "Early printk via Exynos4210 UART"
>>> help
>>> Say Y here if you wish the early printk to direct their
>>> - output to a Exynos 4210 UART. You can use this option to
>>> - provide the parameters for the Exynos 4210 UART rather than
>>> - selecting one of the platform specific options below if
>>> - you know the parameters for the port.
>>> + output to a Exynos 4210 UART.
>>>=20
>>> - This option is preferred over the platform specific
>>> - options; the platform specific options are deprecated
>>> - and will soon be removed.
>>> config EARLY_UART_CHOICE_IMX_LPUART
>>> select EARLY_UART_IMX_LPUART
>>> depends on ARM_64
>>> bool "Early printk via i.MX LPUART"
>>> help
>>> Say Y here if you wish the early printk to direct their
>>> - output to a i.MX LPUART. You can use this option to
>>> - provide the parameters for the i.MX LPUART rather than
>>> - selecting one of the platform specific options below if
>>> - you know the parameters for the port.
>>> + output to a i.MX LPUART.
>>> +
>>> config EARLY_UART_CHOICE_MESON
>>> select EARLY_UART_MESON
>>> depends on ARM_64
>>> bool "Early printk via MESON UART"
>>> help
>>> Say Y here if you wish the early printk to direct their
>>> - output to a MESON UART. You can use this option to
>>> - provide the parameters for the MESON UART rather than
>>> - selecting one of the platform specific options below if
>>> - you know the parameters for the port.
>>> + output to a MESON UART.
>>>=20
>>> - This option is preferred over the platform specific
>>> - options; the platform specific options are deprecated
>>> - and will soon be removed.
>>> config EARLY_UART_CHOICE_MVEBU
>>> select EARLY_UART_MVEBU
>>> depends on ARM_64
>>> bool "Early printk via MVEBU UART"
>>> help
>>> Say Y here if you wish the early printk to direct their
>>> - output to a MVEBU UART. You can use this option to
>>> - provide the parameters for the MVEBU UART rather than
>>> - selecting one of the platform specific options below if
>>> - you know the parameters for the port.
>>> + output to a MVEBU UART.
>>>=20
>>> - This option is preferred over the platform specific
>>> - options; the platform specific options are deprecated
>>> - and will soon be removed.
>>> config EARLY_UART_CHOICE_PL011
>>> select EARLY_UART_PL011
>>> bool "Early printk via PL011 UART"
>>> help
>>> Say Y here if you wish the early printk to direct their
>>> - output to a PL011 UART. You can use this option to
>>> - provide the parameters for the PL011 UART rather than
>>> - selecting one of the platform specific options below if
>>> - you know the parameters for the port.
>>> + output to a PL011 UART.
>>>=20
>>> - This option is preferred over the platform specific
>>> - options; the platform specific options are deprecated
>>> - and will soon be removed.
>>> config EARLY_UART_CHOICE_SCIF
>>> select EARLY_UART_SCIF
>>> bool "Early printk via SCIF UART"
>>> help
>>> Say Y here if you wish the early printk to direct their
>>> - output to a SCIF UART. You can use this option to
>>> - provide the parameters for the SCIF UART rather than
>>> - selecting one of the platform specific options below if
>>> - you know the parameters for the port.
>>> + output to a SCIF UART.
>>>=20
>>> - This option is preferred over the platform specific
>>> - options; the platform specific options are deprecated
>>> - and will soon be removed.
>>> -
>>> - config EARLY_PRINTK_BRCM
>>> - bool "Early printk with 8250 on Broadcom 7445D0 boards with A15 proce=
ssors"
>>> - select EARLY_UART_8250
>>> - config EARLY_PRINTK_DRA7
>>> - bool "Early printk with 8250 on DRA7 platform"
>>> - select EARLY_UART_8250
>>> - config EARLY_PRINTK_EXYNOS5250
>>> - bool "Early printk with the second UART on Exynos5250"
>>> - select EARLY_UART_EXYNOS4210
>>> - depends on ARM_32
>>> - config EARLY_PRINTK_FASTMODEL
>>> - bool "Early printk with pl011 on ARM Fastmodel software emulators"
>>> - select EARLY_UART_PL011
>>> - config EARLY_PRINTK_HIKEY960
>>> - bool "Early printk with pl011 with Hikey 960"
>>> - select EARLY_UART_PL011
>>> - config EARLY_PRINTK_JUNO
>>> - bool "Early printk with pl011 on Juno platform"
>>> - select EARLY_UART_PL011
>>> - config EARLY_PRINTK_LAGER
>>> - bool "Early printk with SCIF0 on Renesas Lager board (R-Car H2 proces=
sor)"
>>> - select EARLY_UART_SCIF
>>> - config EARLY_PRINTK_MIDWAY
>>> - bool "Early printk with pl011 on Calxeda Midway processors"
>>> - select EARLY_UART_PL011
>>> - config EARLY_PRINTK_MVEBU
>>> - bool "Early printk with MVEBU for Marvell Armada 3700 SoCs"
>>> - select EARLY_UART_MVEBU
>>> - depends on ARM_64
>>> - config EARLY_PRINTK_OMAP5432
>>> - bool "Early printk with UART3 on TI OMAP5432 processors"
>>> - select EARLY_UART_8250
>>> - config EARLY_PRINTK_RCAR3
>>> - bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
>>> - select EARLY_UART_SCIF
>>> - config EARLY_PRINTK_SEATTLE
>>> - bool "Early printk with pl011 for AMD Seattle processor"
>>> - select EARLY_UART_PL011
>>> - config EARLY_PRINTK_SUN6I
>>> - bool "Early printk with 8250 on Allwinner A31 processors"
>>> - select EARLY_UART_8250
>>> - config EARLY_PRINTK_SUN7I
>>> - bool "Early printk with 8250 on Allwinner A20 processors"
>>> - select EARLY_UART_8250
>>> - config EARLY_PRINTK_THUNDERX
>>> - bool "Early printk with pl011 for Cavium ThunderX processor"
>>> - select EARLY_UART_PL011
>>> - depends on ARM_64
>>> - config EARLY_PRINTK_VEXPRESS
>>> - bool "Early printk with pl011 for versatile express"
>>> - select EARLY_UART_PL011
>>> - config EARLY_PRINTK_XGENE_MCDIVITT
>>> - bool "Early printk with 820 on Xgene mcdivitt platform"
>>> - select EARLY_UART_8250
>>> - config EARLY_PRINTK_XGENE_STORM
>>> - bool "Early printk with 820 on Xgene storm platform"
>>> - select EARLY_UART_8250
>>> - config EARLY_PRINTK_ZYNQMP
>>> - bool "Early printk with Cadence UART for Xilinx ZynqMP SoCs"
>>> - select EARLY_UART_CADENCE
>>> - depends on ARM_64
>>> endchoice
>>>=20
>>>=20
>>> @@ -219,25 +109,6 @@ config EARLY_UART_BASE_ADDRESS
>>> depends on EARLY_PRINTK
>>> hex "Early printk, physical base address of debug UART"
>>> range 0x0 0xffffffff if ARM_32
>>> - default 0xF040AB00 if EARLY_PRINTK_BRCM
>>> - default 0x4806A000 if EARLY_PRINTK_DRA7
>>> - default 0x1c090000 if EARLY_PRINTK_FASTMODEL
>>> - default 0x12c20000 if EARLY_PRINTK_EXYNOS5250
>>> - default 0xfff32000 if EARLY_PRINTK_HIKEY960
>>> - default 0x7ff80000 if EARLY_PRINTK_JUNO
>>> - default 0xe6e60000 if EARLY_PRINTK_LAGER
>>> - default 0xfff36000 if EARLY_PRINTK_MIDWAY
>>> - default 0xd0012000 if EARLY_PRINTK_MVEBU
>>> - default 0x48020000 if EARLY_PRINTK_OMAP5432
>>> - default 0xe6e88000 if EARLY_PRINTK_RCAR3
>>> - default 0xe1010000 if EARLY_PRINTK_SEATTLE
>>> - default 0x01c28000 if EARLY_PRINTK_SUN6I
>>> - default 0x01c28000 if EARLY_PRINTK_SUN7I
>>> - default 0x87e024000000 if EARLY_PRINTK_THUNDERX
>>> - default 0x1c090000 if EARLY_PRINTK_VEXPRESS
>>> - default 0x1c021000 if EARLY_PRINTK_XGENE_MCDIVITT
>>> - default 0x1c020000 if EARLY_PRINTK_XGENE_STORM
>>> - default 0xff000000 if EARLY_PRINTK_ZYNQMP
>>=20
>> Shouldn't we put a default 0 value here ?
> No, we should not. It's done like that on purpose to trigger build error
> if user enables early printk but forgets to specify an address. Adding de=
fault 0
> would remove this guard behavior.
>=20

Ok makes sense.

>>=20
>>>=20
>>> config EARLY_UART_PL011_BAUD_RATE
>>> depends on EARLY_UART_PL011
>>> @@ -250,7 +121,6 @@ config EARLY_UART_PL011_BAUD_RATE
>>> not try to initialize the UART, so that bootloader or firmware
>>> settings can be used for maximum compatibility.
>>>=20
>>> - default 115200 if EARLY_PRINTK_FASTMODEL
>>> default 0
>>>=20
>>> config EARLY_UART_PL011_MMIO32
>>> @@ -274,13 +144,6 @@ config EARLY_UART_8250_REG_SHIFT
>>>=20
>>> Default to 0.
>>>=20
>>> - default 2 if EARLY_PRINTK_BRCM
>>> - default 2 if EARLY_PRINTK_DRA7
>>> - default 2 if EARLY_PRINTK_OMAP5432
>>> - default 2 if EARLY_PRINTK_SUN6I
>>> - default 2 if EARLY_PRINTK_SUN7I
>>> - default 2 if EARLY_PRINTK_XGENE_MCDIVITT
>>> - default 2 if EARLY_PRINTK_XGENE_STORM
>>> default 0
>>=20
>> Seeing that all know example are setting this to 2, wouldn't it
>> make sense to change the default to 2 ?
> It would be a change in behavior and would not fit the purpose of this pa=
tch.
> Also, the EARLY_UART_8250_REG_SHIFT Kconfig help mentions 0 as a default.
> There might be platforms 8250 based where we don't know the correct reg s=
hift value.
> Better not to make any assumptions.
>=20

Ok.

> ~Michal



