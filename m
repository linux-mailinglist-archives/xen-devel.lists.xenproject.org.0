Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A461A90E679
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 11:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743561.1150481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJrDP-0007cL-J3; Wed, 19 Jun 2024 09:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743561.1150481; Wed, 19 Jun 2024 09:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJrDP-0007aQ-G4; Wed, 19 Jun 2024 09:02:51 +0000
Received: by outflank-mailman (input) for mailman id 743561;
 Wed, 19 Jun 2024 09:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Pjt=NV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sJrDO-0007Qe-Pw
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 09:02:50 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b386900e-2e1a-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 11:02:49 +0200 (CEST)
Received: from DUZPR01CA0332.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::18) by AS8PR08MB6614.eurprd08.prod.outlook.com
 (2603:10a6:20b:338::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 09:02:46 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::48) by DUZPR01CA0332.outlook.office365.com
 (2603:10a6:10:4b8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Wed, 19 Jun 2024 09:02:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Wed, 19 Jun 2024 09:02:45 +0000
Received: ("Tessian outbound 01519d7ebfdb:v339");
 Wed, 19 Jun 2024 09:02:45 +0000
Received: from 50a9dff24f94.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1D5C608D-3008-4564-9A2C-FC66A6B72883.1; 
 Wed, 19 Jun 2024 09:02:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50a9dff24f94.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jun 2024 09:02:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB9537.eurprd08.prod.outlook.com (2603:10a6:10:459::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 09:02:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 09:02:35 +0000
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
X-Inumbo-ID: b386900e-2e1a-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Df/cpKb00GgJeb7wMCAyoCtgxFw78VB8dPAFA9+LLEio4PaUNlMT/yaXIQERZvhEnz9hUEI5X7D4vaR9EnzRGAXvc4ZEX01MZySJUlW4+Y+ocLIRDbOcgaQunq6Hozj01mFsYPYTgvOL/Mtb4tYZ3Do27/4xErlcCXCHgD/3EErgyjKOk8K2x7Z2VZaO6QnXaM4TrlM7HHarSee60eKPcGcvkfOMjm+sEK18/kud+Bome7ZFA7IF/ZyvmqWfXvacdktS+a0DewIlInnM6KH4mTUGTy8TiAF0DZMkh1XQTLQ/y2u8TEaAS8ZIL+BhRNOFDqK8hQYWZYvQyJgvmT0+Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg8wFKGvi0pJ6iFSBlBGiM/4Rp2i3FxBb1Sx8wo+uGA=;
 b=WEO3q9QBLlkz2k/0VdE1eupLrmLWDQvq4Ir+BjBiGOmdG7eyJr4/ZPGDB2FSFF2TqDCmPRtTmQF6I3AJyAznRLrV2EUBbHQRayy3XEcTFQIJpyu2xl8MbfOulKTAQL824F65O2dUj9MGFBGFsgAD7XXYDLRzT+8Mn2dDsNyfgKNe0NA3ve2Ar2z08Q9KJvnHBGH565UwWRVBy/vULzI4KhwJnfg3L/IsLLrqBmYTFMLJpGAnyL7qeumkxBUZHpO6LpNvJWwCTX29CLuy/9c5Umnk8xk83wraXFqeebXyrB10vyzedQt2pt/VA8fAvn0n4g9f7URVzTSRaX2LJ0FHUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg8wFKGvi0pJ6iFSBlBGiM/4Rp2i3FxBb1Sx8wo+uGA=;
 b=dL7BtiPJZA3lHrylTwL2wU263RsLwO2oC2WBVLqr806SEJTeEy9aN9tzpzYYdFFD13knpnhf3sYY/ZBk1GSQn3OL0lJklwFui4NXTIaT/abI+bovF5w1860OxK8kvWanQZ4EF98zQHdWUn7BRoZ8dO/i2WUPCaOhXAtxcoxBJUo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f2aa740b65bad843
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbVVfGK9mvbr+hFDApZAdyTdvICPFvLVGg3tJNVpV2dcLgUFJjTJkxuQggryn1YRbB3HHTXKfcw8Bh6v4frp13okupsdIzGHWh+YxgYaqUvUSEYOjIxXj4V8TEFNw2+UwWAPEKOzXAHs06yfuYpU5iazjpzQEtp41IuTXe44EXgCHoAFdqWiizCZ+k2IB7lKkKRIFmrLV+4WkexVIeqxT8aiaBmwPEmy0QL8KkVuJ0XJlQDO0d4jQGRA4SSoyjAEN+hyLjtIV3jDWUtL+k5ZR2ILLhGwspDbVzXrmMtU/T9NupBma+9K5bFj3IYY2lL6393tanoWV0xjVpgaWDjVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg8wFKGvi0pJ6iFSBlBGiM/4Rp2i3FxBb1Sx8wo+uGA=;
 b=G1cJH2IZ4BbjlrhSXEg8A3Ve/mv3B8mbwsjBxuCyvkwSWzxZIM54e/wd5yeRJZQthl5m8GyGtjkrBHPz9yWZdJ6aP6CgB2MJoKr/APCSkbLB2oPB/Bkhg4JFD2l0IyOUFSVgk32ndIdnksvMMgfE1uEN61fruniYV9wrLXAYWs0PUl51jXqm4qDXeooYc8fHk8u5v7yiS1cDJyRwCwNvJYEjW0Olh1lyPA4RRkJnkwvh40UakUw+PNqOqNX+Z+x95OOMBJ3TiLroZAXFDNcpStlpAfWsrFnWWRp3iNKZ6oFFrapI7qd+DieMILJdcBkI/AyjDghO7SX/+hHBqBDMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg8wFKGvi0pJ6iFSBlBGiM/4Rp2i3FxBb1Sx8wo+uGA=;
 b=dL7BtiPJZA3lHrylTwL2wU263RsLwO2oC2WBVLqr806SEJTeEy9aN9tzpzYYdFFD13knpnhf3sYY/ZBk1GSQn3OL0lJklwFui4NXTIaT/abI+bovF5w1860OxK8kvWanQZ4EF98zQHdWUn7BRoZ8dO/i2WUPCaOhXAtxcoxBJUo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
Thread-Topic: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
Thread-Index: AQHawhSD1mJnwmtkoE+LLMyZ3OtgsbHOyqWA
Date: Wed, 19 Jun 2024 09:02:35 +0000
Message-ID: <8C571FCD-3EAF-40B5-8694-625880176F8B@arm.com>
References: <20240619064652.18266-1-michal.orzel@amd.com>
In-Reply-To: <20240619064652.18266-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB9537:EE_|DB1PEPF000509E7:EE_|AS8PR08MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fa9972-87eb-485a-6eac-08dc903e95d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?s0H8eU5HiWkzRs5WH68numXuG2hsSzL+4QOpmz8h3vL9TWHS23C3IKuI19pi?=
 =?us-ascii?Q?22QsdI+t4r8NXmZumXxvH+nALAEg9ByvKPGa3EPp/Zygia+C3I8IcFel8DIf?=
 =?us-ascii?Q?uciUJtFZn0gZYzKQMh7SijqRBg+tGrTbHBrAled3iwaaXQBdI4wQm4oZ5YKw?=
 =?us-ascii?Q?pYfuPhhgsga2O6gMnS3s9MGPWLZy+rl9M8d1A96LQUoXOlEKuD4Iy+iXdn7h?=
 =?us-ascii?Q?13wJn9j1bNfHHBewqSelPE0TvXJzNRutTzzy2LvaL7zna47a6Q9TpdVwXHS2?=
 =?us-ascii?Q?+J0XllpBpMKbx3wcu++vPLhy4hkMzrMIFH19RxPpz2UagrRBshxyOTBSOA58?=
 =?us-ascii?Q?Xa9zl3gsnxkpZTuaJAGr25bZanHdOe3QxrnKTCuw+Gx2ioQHVm6qUq60zNj4?=
 =?us-ascii?Q?h5mnJs1yp55hlFNRo6qZk26oYtdU7TNXeFD8jRBELjUG4s3WdOta35XxjoN4?=
 =?us-ascii?Q?1zkyNnPKYH2umgMVZVcQJk6Hay/hXkm7Rcj7IW+74iB7JEGW5M9On0uvXV9A?=
 =?us-ascii?Q?Nz81u0UXqaIN+VK7ZdlLfyQ7cyURK6wZwIYqt+PCurIJPiWDdZsEHAuwYBOK?=
 =?us-ascii?Q?WziHQGtOlOinXmtDoZgiSbWW7Z0SUgmPcUNJAwzkJeO5DyM+SU0l5uwQUecf?=
 =?us-ascii?Q?uKzP+aWW/FnvTsGslzt+4BuB8HlkNK8nCQhbgQeIA+WE3iNWiXalAO6AVpu7?=
 =?us-ascii?Q?Wfc1FmKfHpQ1DRJjqmjnnyUbtDLRZUdOQxMdHpQpRBiqWixB0Us8aSpoE7M7?=
 =?us-ascii?Q?AYX2K5VX600nYWAuq5xnvXDfQ+HGQp1RMF+yAChS+MkCWfNXLexVH4o6vhil?=
 =?us-ascii?Q?qMq9bF6X1Lsq00SsF2LDplFwRZ8ncAY2oP1gW9WWpQv/wH4GbJoGzyfAuscf?=
 =?us-ascii?Q?eDQLHXE587/KyR5JAWFDbqOT04Fa+Ct2b4KAJTRT/saLOwkdCt+KM+zxP63X?=
 =?us-ascii?Q?YgJry1ks39nIAgk1mjbbgPNa313edQxJuLRSJsFDq7lROlnNDFj/wLH/Slgg?=
 =?us-ascii?Q?s91rPDQAP1Zlmt4cFSASxrP/HQSOi5wObBRugBSzqnD30BxsKi7/u43je1Nw?=
 =?us-ascii?Q?9W+sBz9eVG3CMs1lLHm/Dr1/fk7mXOxmLnGBcAi/ObB1V3v+1UFdGWxMBex5?=
 =?us-ascii?Q?H8yv+0aDi81Xp5GFLtFzatRcnFiYJV0h2xspvjz3ZA3AeVh+F0VXhJIlhkbK?=
 =?us-ascii?Q?AUq76VyX3Mg8D68Ojn3LRW2bxQncKClnhJmt6rSDvor/h6tsUW0DL9wsunWj?=
 =?us-ascii?Q?XpUQVmpDAcki8WgrWzcMUdlG9n9tZZF0+PVvuLl2D1uZBoc4Q2t14+DXbFKt?=
 =?us-ascii?Q?9CDME8gBfl99GiueHfc8e6bu?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <99F336B890451043A54434852F1BBE0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9537
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8af0bcd0-f2a6-4608-dd6a-08dc903e900c
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|34020700013|82310400023|1800799021|35042699019|36860700010|376011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mr4LQ8vF8sQdwhg7lMDqMxvDBXqu9LshdjGXo3c0HnXCBtcNoM71pJ1dXTV9?=
 =?us-ascii?Q?qGxhvW5Bdte1AgFrfXKRBbM0kmMxtiPVN/Ny/jZRXquDTMr/8aAXZ3dpXyt0?=
 =?us-ascii?Q?3BtaMmDN/bX+xyShi402gBeJ3NQSDh3gKuXyi+bbon6xi8bO/6CwN4TysbDq?=
 =?us-ascii?Q?LXvb1LSBBDcPGBeOlFZ6deP/KyuWexzRIay/9oJGvCfcADDn7iYZq2SjN8Pe?=
 =?us-ascii?Q?x9FuIQsPfrRG0HvVL9kBmoH2EREt1p0YvUAG0xuNptn+NfNEAU4HiFdBYLHA?=
 =?us-ascii?Q?EFKZWiDgNsCNh9diVwu9cI4lwm9zjgHw3MJ1VkEgGlWdeFUF66YHXkV6HqXp?=
 =?us-ascii?Q?GRqmnkeScH52rwy5TtDOBKa3fCRW3so0bgWKehbbvO1mMKjiiYdzesPglvgB?=
 =?us-ascii?Q?BR5mnDMb0v4/4APeAqV/pXrxYam9k01nBZSVkuJ9nowHN0ePnqs41JVuCex4?=
 =?us-ascii?Q?NdNZbdSZwE2u0I71STtaiFi3clmt4PQ7K1SEBWQSnmPh3lIozxx8JlBpzHY7?=
 =?us-ascii?Q?Vv15s7POVfY0xy+OaclfytzvEu1oMRDVrPYxTEhLvz9VXeiWfat2+hApXM+B?=
 =?us-ascii?Q?Dyx2gvRuPLXSMIzdwIzUqEyueLpdGEPBjRdvt99nn4ZNs2VV1kWerJk/IIAz?=
 =?us-ascii?Q?bmudxE+aTzj+v5ydGV76db8KkAVr6xY1FP2Ln0t+yfmCvuWDr7cMcYvTczcX?=
 =?us-ascii?Q?56WsmMLaHYaCcTk91GX48DyJxDlC3qwBZvh9l2RDVXc7CEGt7+OrdCcwAghR?=
 =?us-ascii?Q?/8L1bXyHHgWDd7D42UL7xD+vmTGn51LH0E1ZoRVQbuDn/Vcs0TJIHViu/qei?=
 =?us-ascii?Q?hyt61RUpb1BqqRjkdo/4LkcUNvZmq/F3jy4SNjvwqvh/CVeREtfktx6xjC05?=
 =?us-ascii?Q?awfV3yGaO3/JCKHiaZCMheCS8xlVzqZd5GLx7d3GuGC/UBeRhO19JcFQWTMe?=
 =?us-ascii?Q?dRQOG7M4/NcPQPeBgZtPkvvB3en1edvlaXl78P8pmUD2TSIYaQvT1iIzPPMJ?=
 =?us-ascii?Q?jATTQR7xOmZT/tWOGWZEjVxEnGiSOLq0DJ320x2+9b4wLrajx+BKX0Z88Neg?=
 =?us-ascii?Q?rpm5rsGRAtoARoysLufsQgfW6+phHlUEQn0tyK6F7HAKBEjEwFuxUaSaLJ6q?=
 =?us-ascii?Q?2qtr/jWveQRlC7flYPdM0yisp78OkYrvHcb+mFouKUTWgdvToFQ6zd7yFngf?=
 =?us-ascii?Q?1XtEJ9ln0aigAlBDxUPXUuiybayME1nsaqNBngK2eDw3OP0hOzUR2nBx3qj/?=
 =?us-ascii?Q?JFDG1gmvvLEttxlm0KbxToRpYef/rhdtWfqt/+Y1DCyiOnf+ez6T517W5AVK?=
 =?us-ascii?Q?XVm+BQU6zz+7++bcimXJcBnb98QSCJh+X+EMeZcbskZvDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(34020700013)(82310400023)(1800799021)(35042699019)(36860700010)(376011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 09:02:45.5907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fa9972-87eb-485a-6eac-08dc903e95d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6614

Hi,

Adding Oleksii for Release ack.

Cheers
Bertrand

> On 19 Jun 2024, at 08:46, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Building Xen with CONFIG_STATIC_SHM=3Dy results in a build failure:
>=20
> arch/arm/static-shmem.c: In function 'process_shm':
> arch/arm/static-shmem.c:327:41: error: 'gbase' may be used uninitialized =
[-Werror=3Dmaybe-uninitialized]
>  327 |         if ( is_domain_direct_mapped(d) && (pbase !=3D gbase) )
> arch/arm/static-shmem.c:305:17: note: 'gbase' was declared here
>  305 |         paddr_t gbase, pbase, psize;
>=20
> This is because the commit cb1ddafdc573 adds a check referencing
> gbase/pbase variables which were not yet assigned a value. Fix it.
>=20
> Fixes: cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem should be direct=
-mapped for direct-mapped domains")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Rationale for 4.19: this patch fixes a build failure reported by CI:
> https://gitlab.com/xen-project/xen/-/jobs/7131807878
> ---
> xen/arch/arm/static-shmem.c | 13 +++++++------
> 1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index c434b96e6204..cd48d2896b7e 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -324,12 +324,6 @@ int __init process_shm(struct domain *d, struct kern=
el_info *kinfo,
>             printk("%pd: static shared memory bank not found: '%s'", d, s=
hm_id);
>             return -ENOENT;
>         }
> -        if ( is_domain_direct_mapped(d) && (pbase !=3D gbase) )
> -        {
> -            printk("%pd: physical address 0x%"PRIpaddr" and guest addres=
s 0x%"PRIpaddr" are not direct-mapped.\n",
> -                   d, pbase, gbase);
> -            return -EINVAL;
> -        }
>=20
>         pbase =3D boot_shm_bank->start;
>         psize =3D boot_shm_bank->size;
> @@ -353,6 +347,13 @@ int __init process_shm(struct domain *d, struct kern=
el_info *kinfo,
>             /* guest phys address is after host phys address */
>             gbase =3D dt_read_paddr(cells + addr_cells, addr_cells);
>=20
> +            if ( is_domain_direct_mapped(d) && (pbase !=3D gbase) )
> +            {
> +                printk("%pd: physical address 0x%"PRIpaddr" and guest ad=
dress 0x%"PRIpaddr" are not direct-mapped.\n",
> +                       d, pbase, gbase);
> +                return -EINVAL;
> +            }
> +
>             for ( i =3D 0; i < PFN_DOWN(psize); i++ )
>                 if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
>                 {
> --=20
> 2.25.1
>=20


