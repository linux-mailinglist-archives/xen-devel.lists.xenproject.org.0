Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785F97C8D1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800651.1210598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srFqu-0000vZ-4y; Thu, 19 Sep 2024 12:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800651.1210598; Thu, 19 Sep 2024 12:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srFqu-0000tj-1p; Thu, 19 Sep 2024 12:01:40 +0000
Received: by outflank-mailman (input) for mailman id 800651;
 Thu, 19 Sep 2024 12:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1srFqs-0000td-8i
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:01:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2612::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb666218-767e-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 14:01:36 +0200 (CEST)
Received: from DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) by PAVPR08MB9818.eurprd08.prod.outlook.com
 (2603:10a6:102:31e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Thu, 19 Sep
 2024 12:01:31 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::5d) by DU7PR01CA0019.outlook.office365.com
 (2603:10a6:10:50f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Thu, 19 Sep 2024 12:01:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 19 Sep 2024 12:01:30 +0000
Received: ("Tessian outbound d89c8a00b6f7:v457");
 Thu, 19 Sep 2024 12:01:30 +0000
Received: from Lb287f309d4fe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3333778-C2E6-46B6-836E-36D143975083.1; 
 Thu, 19 Sep 2024 12:01:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb287f309d4fe.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Sep 2024 12:01:24 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DBAPR08MB5781.eurprd08.prod.outlook.com (2603:10a6:10:1ad::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 19 Sep
 2024 12:01:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 12:01:20 +0000
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
X-Inumbo-ID: eb666218-767e-11ef-a0b8-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OzonhXmvf6d29LX1x1zjWWcu6i6+lHq8u6OW0ErU0Vh2yNzoW4R8XVadyJzHSdeAdY+sDNbpbFF2TQEBIfVH6LTrVBxs3uKjxPm/0onKq2ksvkQDR6+m+49J8RcYsuHnmX22P25tUknISgTt0Hs/M2P7SrPVxR8E2XPbFcfoNYjDfPnU0GxyfdWHrTYwhRIc+TYDQbln+Dbb00wguYE+BMzGSmWpdytmonzwogUGNyCWGaTtu6Q8ExIALDp8/17HZxFGdJXgTRtt3e4DZE4ggXUB75GCfsI5gMT66bXka/ZghgUQUKvDP2zyg/nFHKwg20vUa/CKoMxjLsIBLI/KLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkfwx5WfqhM0LiT5sZj+LHXEF/oBdw2DmteDkv4ltWs=;
 b=lMs3in+SVBi0yBrhDTd3eKttNQCPUUqx1j7paHgK63f7bepa8mjUuA6lVTYfNeauyQTlssCIcmJl45XJqJOtS2tOM4pZyAvsfzsoyCm+OgkuQq16TwUu0l93ccRLvvoiP1Yz2S8XXQzkxJ15grw7RI4rc4mML6ZuYmFF0zQm4a6UzV8y3rFKlF0Z9FZedYe46f/6qOp0hOnvetPh/8lSU3BkAfX2lXmjln2lYOAR16TmOVu/1qrUcMrtX1QV3sTSkFNNAXV+2A6OSSUxhLB0TOIR7a5GcKq3ASrdFKH4ABnzrtE5GM/j4eWRvI3J3Qb3+GoIBt6U7ramEKtZdB3c7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkfwx5WfqhM0LiT5sZj+LHXEF/oBdw2DmteDkv4ltWs=;
 b=FC4herQSs06n1qJd/yXQf3lF1gYQmowbD5R6b35BlwKXZbyC1yPFeYNooh6cK8Cu72T6Jf6JSqS88T6b8MxGXWk5CHdFJMlqQLqo50MPEJHGqaZ8bG9dukyUXm6La8/nM9Hj2NJmClzG+T/tyBZLR7YKodJJ67XzpMEzjVZWnEY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22c35da17cb706cb
X-TessianGatewayMetadata: /IqqOpgR6wufNjVOTbYj7yVW5RfY/w7yUZv9V/cx/QYK9fuge4ULmzftga4blzQaaqVVBrAuPaBgRBFZGeY5v9qY3WPqfsBYVaiFgOzTkTKXins39pvmhCNKikWU/BS1RKEqqJ4t9xlVd1zJ3sphKIe65ThWsvTwwgBoC4NTABg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiJWnSe4cUGFXf5KjV7kFHqSQOcI9Lnuc0KoPlomumxIXm0zF2AdUL0QYQ0K3dmHEdRGbwme8Rf6QQPhfXlNsLBVtJ2+5+UgwWXZN+Z7HmycmEHwZT9kDlPnsPsaSRydmyMCfcZ1+5IjxKmGxbZKdnBHZPGM4dLCT3zW+nPaS+houhajvrqCOhbsTo/n2CbY+8FrgrDKLxAATMyHpj83uVhD2MeRPVJ6VlGEHXDZ011Y9T4KlKaFyGJUqkr+Yz6Q/gAalAyf2QuexAvBGfLe/14mVroJGqBJThMY7jmvSucjrah36N+U0zfwxoAc6oyH/RLWd8nlfX/lRAR0LpYeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkfwx5WfqhM0LiT5sZj+LHXEF/oBdw2DmteDkv4ltWs=;
 b=SR82nLzMUen5JqjXFsXssZ3HGq1ghyUsyP/9CURjftyf5Zpe0aQB7bVv37iTNN/ax1CH/z9oXPoIdUBkYhF23ncln0qUiPWW0lU9eLL5wc//PVYHd4aWDoOxlta/2ddwZ3CXKIVJ7A11UHz9+/udhE99j1McuSf4BrtioIo3Li7jjVEjJQNm6IOQYg2Ay5K581xNqXBcCj8j+6lBkdVLXvX84l63ck0qlQhyz37+9Vat1GuO3tnU9zH3f/bwudBlHnzLke2wVZH5wIjbU5hItF7Yw7D2GJNGPKquU/ub0jLQBY9++5UdbFYZ47ctDnrh/oPwF+T+ItRLcaZages9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkfwx5WfqhM0LiT5sZj+LHXEF/oBdw2DmteDkv4ltWs=;
 b=FC4herQSs06n1qJd/yXQf3lF1gYQmowbD5R6b35BlwKXZbyC1yPFeYNooh6cK8Cu72T6Jf6JSqS88T6b8MxGXWk5CHdFJMlqQLqo50MPEJHGqaZ8bG9dukyUXm6La8/nM9Hj2NJmClzG+T/tyBZLR7YKodJJ67XzpMEzjVZWnEY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Artem
 Mygaiev <artem_mygaiev@epam.com>, Hisao Munakata
	<hisao.munakata.vt@renesas.com>, Julien Grall <julien@xen.org>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
Thread-Topic: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
Thread-Index: AQHbCDKnNzyGC8DY7ki21+yQsaede7JfBtYA
Date: Thu, 19 Sep 2024 12:01:20 +0000
Message-ID: <C3DB9D13-B9E6-4F8D-9678-59555E36AD68@arm.com>
References: <20240916121851.3587139-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20240916121851.3587139-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DBAPR08MB5781:EE_|DU2PEPF00028D08:EE_|PAVPR08MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: 86512a20-9cf5-4e22-19ac-08dcd8a2cc76
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?8ti78dV9Uw8Aki99VmnxtqCVsHEHKRDexsV3IATHMKdt+I6q1hWflqiZ+Oti?=
 =?us-ascii?Q?71gv4PNleVo6gz+yZH0nNt+udBGA9WewtqXIN9HInZdpNININqAFUm3Gtf+G?=
 =?us-ascii?Q?5XqqGr2rwEER1cdBVJANKYv+JC/D1hmASN66zzIPPsEhQ0f0wGcOslPdQX+V?=
 =?us-ascii?Q?CMkeXKMGRsJV7pZDxaYKIPiMTmS3gEUnv5x8L1R5fla+v6Byjg3ZEsYjulvI?=
 =?us-ascii?Q?cwJ8nMtILPVZ2NCQ4N9uRboBs90BajZONIHUcMsT/L+IrKvsQd/Ko1nrgg3a?=
 =?us-ascii?Q?jWsxIGhgtXE2CwJ7XTCM3v0bHcpVBMdC4b+IKAWaFM9jsaWJkXp1Roy9SHVJ?=
 =?us-ascii?Q?yjUDeLXv9J90aU/ERoNk/329QDF4CJtxbogmLD5+g8SjWdEXvfByymgLPEy+?=
 =?us-ascii?Q?61FXXRshxmdMejWk3iqk2jxdtaUtKzW842sJz8qY3VdZRIqVrt1Lv2yhhCiZ?=
 =?us-ascii?Q?RKNABxIgfN8G2xpW6AFYh466e0mhcgtnJ3umTMKWLiuQNMC775MubKL1ROOD?=
 =?us-ascii?Q?2v2OSUlSo9fyhU+JZmDjKO1/jHO/VCqPGvoyXpS1e1IhzL7TecZusj95hmPF?=
 =?us-ascii?Q?8Lr8ixYdIA2qzd+07Y3P7vq2JD7kwX/Efc6sQc9p4CJrKUGyVPpzN0ZP1LME?=
 =?us-ascii?Q?DBjCdqe7XwvlLx2Vl4tOo7G4le5ySziSeYsVixesFibMJ7Imuh8mkKYPMTYt?=
 =?us-ascii?Q?dG7xdAqRoCNZnhwWTwBQHzBxQtpYaTereiN7JbT3nvs/ZuFJ5PE5erm+LJF+?=
 =?us-ascii?Q?IqZyvTR39L/gAj0ar2iZ7I9Wi2cHEtadvriyTns1U5c1yWPzOGDdTL3dKzx5?=
 =?us-ascii?Q?6R/4ShOvcCJyrNQX6oZHwjPSV3PDI5oCEjBMo0c3VgnpHd1095pr7AUWhTnL?=
 =?us-ascii?Q?RBscnbZ2eCZsdsSKAWvcopY1bakj9XNRYkZ3WGQTy9B+i1VbEhe+u6lIJ0uL?=
 =?us-ascii?Q?2W+RS+wJtW/rJUmHbYtbgOotlrNzLxldmnAiL7b57ACxvJtL4lyEf7SbiQF4?=
 =?us-ascii?Q?073XyuupnGOyJIsQmQ4zx0wfPgPkBTJny4SGXRWS6/BoqpKhFtW34/fGInVV?=
 =?us-ascii?Q?McneAbbwIBYWeEsHSsXfLThC9/bJ+QQ0Zk7K1R3Z9aDg9/pwIKMtRZsHXPJj?=
 =?us-ascii?Q?MXFBu/hnzjHO81aqfy+RKo8KVJ6VNQ7eNhcI/GyoqPmdQmr7ACqZvqcgK/tr?=
 =?us-ascii?Q?UFgLzWSzZY4YtwpM0kiYOrRcsK9Me/t824TRku4ft3V5A2WwqrxvKcKPMCwT?=
 =?us-ascii?Q?reNJe1ei2DHbwqz41BG2CrQhF6XRet1NEXJUB7dY832NuK62GPmbimMLQOGc?=
 =?us-ascii?Q?nD5ZD3F+ltR1Mic+YBk0DcBhb2jtRhTKA8r3x3/Lvo5IeSytygRcff5fdtX8?=
 =?us-ascii?Q?8t3MJmknD+f7m627d2p5Y4UnKLneFrlNxOhkz1a1sqrGXstTng=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <43B0630C5E54B641B3810841CAE2A99D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5781
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eb7a40f0-1be2-495a-9048-08dcd8a2c672
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KQ+T4PLGlFbpWu9BdvRco4tYxgu7Xs6hCQoNe3yREjP+TM9sN5LjBCXoMnJ+?=
 =?us-ascii?Q?S14aq4Jwv03GCP6egzTe+ZY/+U+0dvMZBEMXsZH/JLaoJ0p8TS32kSmYaC6C?=
 =?us-ascii?Q?vl4SWYwzDcJy9GJo+KKbVQVf0JoqJL/eTP2kjN3jQB/o3lwFE8PiinsuvJcB?=
 =?us-ascii?Q?CyT/cCF6dcnVjUfzhbyreoXVzk8VrDC12W5rkxtJspYKlkmw3Eum9zMvvOrF?=
 =?us-ascii?Q?W6MzeOml4UYYK/S6tlUbIlo65lO1arAWXvuOuorEKKDw2Hdoxu/ym4i7PNCj?=
 =?us-ascii?Q?wGGAQfzcXMxYm3pFuyBiBO+8a12mDcmT+DnZqDE5H5VVfukKlSnu5DwebvJP?=
 =?us-ascii?Q?Foy8PsNkxPdedr0emvL6+iKjc40fsLV6s05N0k4i9XmhH6dpaF0cEJJkUVtE?=
 =?us-ascii?Q?89zaZVWb7JnujQI3beJFMCtRXvQsiNxSNDGe0AaqUTVCWJv5nMbzlqotezhH?=
 =?us-ascii?Q?qAXEKlzvGW5+xVhyMCCfWxktueJeKKV2eoqKleNhPMBMQ2cOMm+NO0GztMLw?=
 =?us-ascii?Q?OsHqo6t6l1KTz+CH5gzpQA/YmItkWDy7Xg35z07e2lcT3B32V4O9bdkkkL2o?=
 =?us-ascii?Q?Ny5Fs8XQ3UFqjH0o6HXKnlifZZETOs+J05BV5awIYrmsRm8v/owxpqZRcYjF?=
 =?us-ascii?Q?LCrBAnC+1Wruqs3XOI8Jou/KA/YLqiDJ+tzoRDYzsqwSqfNkZfw0MdAyn6PC?=
 =?us-ascii?Q?OtlNyhzsGo6xjZCsHPVaeUXJmv/wcZR8zbr98UVCWYz5Hf7JmpxiF6E5Ul0E?=
 =?us-ascii?Q?HgK3bDVyjLaaA0BWJKyGC1dVAq+oJAB+u5iszOhNuurf8rD5M5FrnAf2NKds?=
 =?us-ascii?Q?KHjJXvXehdwe/k/dYUu+UNKwPLcO0ks8wDDUgDzO4mLT6e/f+s9PhxN0kRxj?=
 =?us-ascii?Q?7MCBRQjDE/nQqOZ+py7liuMNSS7PftjBRHBWwS4W4WqmV/FQCmHBpmnTcYma?=
 =?us-ascii?Q?6t3yNq3KpdVvfOTXAthlfz0REd5UQCZWzNgY05NsmedaFGScfu+5V9LIGeaX?=
 =?us-ascii?Q?DtDIKbRTD4U9tGB/knMkz1YaVCqiv7u7IJlN9eW3Qa81ci8f50umCmn9Gxr/?=
 =?us-ascii?Q?y81G/eEvnbiyqt76pGfvcl+5UgtExfb8sc1dkIIYQXEkQKh98zpvNZM7bbC2?=
 =?us-ascii?Q?Fr43YErzAnfJB6PFFvjn5IctYR6VxlCF9nJ1/XBUduOGUVQzZWeS1jwkx8hy?=
 =?us-ascii?Q?xzs0TAPJxmPGiOvP3MLcShPMAz+/BkH7/9uG0iaD/Xm2t0/Ka9eAfHL/yoTs?=
 =?us-ascii?Q?MV+a+fYWAG+3+u8wHCUcZ+FoL3vTyVl8WmZyFnRfhLE3RprdASOJtkqrRTSn?=
 =?us-ascii?Q?sASEP6l54qf7I0j33elwSLRMfjNy4kgn7Ub1hBG+TGUbn2i87aAWvBJKMTuw?=
 =?us-ascii?Q?Ie3ofv/WadaZbfCQVPs+6Jc9KYamxEL/4Zqw0MMUumayin4bGwMjCjKEfCue?=
 =?us-ascii?Q?rhMYdmfIL6AoFT5GEX9wZkp+D66k/pFa?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 12:01:30.5892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86512a20-9cf5-4e22-19ac-08dcd8a2cc76
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9818

Hi Ayan,

> On 16 Sep 2024, at 14:18, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> AoU are the assumptions that Xen relies on other components (eg platform
> platform, domains)
> to fulfill its requirements. In our case, platform means a combination
> of hardware, firmware and bootloader.
>=20
> We have defined AoU in the intro.rst and added AoU for the generic
> timer.
>=20
> Also, fixed a requirement to denote that Xen shall **not** expose the
> system counter frequency via the "clock-frequency" device tree property.
> The reason being the device tree documentation strongly discourages the
> use of this peoperty. Further if the "clock-frequency" is exposed, then
> it overrides the value programmed in the CNTFRQ_EL0 register.
>=20
> So, the frequency shall be exposed via the CNTFRQ_EL0 register only and
> consequently there is an assumption on the platform to program the
> register correctly.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
> Changes from :-
>=20
> v1 - 1. Removed the part of requirement which states that Xen exposes the
> frequency of the system timer by reading the "clock-frequency" property.
>=20
> 2. Added a rationale for AoU.
>=20
> 3. Reworded the AoU.
>=20
> v2 - 1. Reworded the commit message. Added R-b.
>=20
> .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
> docs/fusa/reqs/intro.rst                      | 10 ++++++++
> 2 files changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fu=
sa/reqs/design-reqs/arm64/generic-timer.rst
> index f2a0cd7fb8..86d84a3c40 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> @@ -30,7 +30,7 @@ Read system counter frequency
>=20
> Description:
> Xen shall expose the frequency of the system counter to the domains in
> -CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" proper=
ty.
> +CNTFRQ_EL0 register.
>=20
> Rationale:
>=20
> @@ -116,6 +116,28 @@ Rationale:
>=20
> Comments:
>=20
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Assumption of Use on the Platform
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Expose system timer frequency via register
> +------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
> +
> +Description:
> +Underlying platform shall program CNTFRQ_EL0 register with the value of =
system
> +timer frequency.

How about: CNTFRQ_EL0 register shall be programmed with the value of the sy=
stem timer frequency.

It prevent to use "platform" which is quite undefined here.

> +
> +Rationale:
> +Xen reads the CNTFRQ_EL0 register to get the value of system timer frequ=
ency.
> +While there is a provision to get this value by reading the "clock-frequ=
ency"
> +dt property [2], the use of this property is strongly discouraged.

I would put the second sentence as a comment as only the first one is the r=
ationale explaining
why we need it to be correct.

> +
> +Comments:
> +
> Covers:
>  - `XenProd~emulated_timer~1`
>=20
> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
> index 245a219ff2..aa85ff821c 100644
> --- a/docs/fusa/reqs/intro.rst
> +++ b/docs/fusa/reqs/intro.rst
> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
> OpenFastTrace parses through the requirements and generates a traceabilit=
y
> report.
>=20
> +Assumption of Use
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +To fulfill one or more design requirements, there may be underlying assu=
mptions
> +on one or more components that Xen interacts with directly or indirectly=
. For
> +eg, there may be assumptions on the underlying platform (hardware + firm=
ware +
> +bootloader) to set certain registers, etc. The important thing here is t=
hat
> +anyone who validates these requirements, need to consider the assumption=
 on the
> +other components.

I would simplify a bit:
Xen is making several assumptions on the status of the platform or on some
functions being present and functional. For example, Xen might assume that
some registers are set.
Anybody who wants to use Xen must validate that the platform it is used on
(meaning the hardware and any software running before Xen like the firmware=
)
fulfils all the AoU described by Xen.

What do you think ?

Cheers
Bertrand

> +
> The following is the skeleton for a requirement.
>=20
> Title of the requirement
> --=20
> 2.25.1
>=20


