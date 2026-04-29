Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBMsHirl8WlZlAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:02:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149C4934CE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297191.1573302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI2f5-0003QH-MI; Wed, 29 Apr 2026 11:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297191.1573302; Wed, 29 Apr 2026 11:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI2f5-0003OF-Iu; Wed, 29 Apr 2026 11:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1297191;
 Wed, 29 Apr 2026 11:00:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wI2f4-0003O9-5e
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 11:00:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI2f1-002MYY-SP
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 13:00:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f1e4e4-bab6-0a2a0a5309dd-0a2a4508b4ca-20
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 13:00:57 +0200
Received: from [52.101.66.23]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f1e4e8-63b5-0a2a45080019-34654217682e-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 13:00:57 +0200
Received: from CWLP123CA0199.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::21)
 by AS8PR08MB9645.eurprd08.prod.outlook.com (2603:10a6:20b:61a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 11:00:49 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:400:19c:cafe::54) by CWLP123CA0199.outlook.office365.com
 (2603:10a6:400:19c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 11:00:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 11:00:48 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS1PR08MB7402.eurprd08.prod.outlook.com (2603:10a6:20b:4c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:59:42 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 10:59:42 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EnGThWMZ2JKhXiegrYtDlDOEywv1Dzio+DpIkCvrf0M4o+Y32R/XkWW2vnhB2100vK+FNmJpp8k1W3umNdHS5KkmV/uYcbPaB1xtztPWiipYWE2SPOzDw+S82eGG0Q5L+UnIqI9Qi7KO7SpW7q7Y0On67LNv0tU3K2tCQWCzoyyQvSepxleqAsukutidBfPJtrpUyvEV7sQoQFhLSdKEOMg3O7tccVMKjetJBm51jZhZo0cKPCnVnu6YdmuwVXBi1AFatway+rrNbwshJXHjrS88e2DESEcftObhUfSq1X+tuF2RZv2woPgpelvw0kYYDPGNKDjDrP17p8NDPqEB5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWl6hUn8dnN4r97Jn4cC62/WM9wERjsWrVDmFzDmdB0=;
 b=uVY2VR1R5JFStgdqHFTXUC6Je41valN+H6uRGr8u+Pu9kHFWepTYG9+IgPDBAOjBeEzM4Okl6t5/VRmVNg8yG5HWj6E17Q/p/HAbFKpCcUC9AGN1oosPsKb832dGJ9dQPdPh3xuRLfLM1zUKjNU6dqepbU8WA6hh2nB/kl3DcEf8HgzFhAFPdj0Atl8xCZSn7lo7G0OuX59wtD7pvgpicJJ2EwPZtTrMpDNylzWIWa85QVJq+6rcG8t+2NLZDgQoY7H59d4Q9x6IXYvOyZpc2RQS1eUB6ZUIAg7AHTXHbnil0L4uHartEGV8wXVIldOvfW8vOzxwdCinQJoopwMr3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWl6hUn8dnN4r97Jn4cC62/WM9wERjsWrVDmFzDmdB0=;
 b=hU29RBnd9SxcK38tLfHStzX56jq1Q8ac0aFbxt6C2z5tIlqa/7gQd37kUpfm+xdYG3/QPnodhjY/cCbrXlmaBO6mwwRthvZ4P9dHpuGyek0jSVJ48QmccrdkB8WkII1lUMGCC46vxPMo5Va7wKsGgEyKy27dGoDAgtpdwr8yGQo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFKc5TkqqWUqM0znAOznmtuVE8tze9XCzRk0///YQXjD6GK+7NvBxhtRQgOm40/2VUYzNRGYQc7sU2MrOMBGV1F4//iqRzkXy6LNOllRCoISUUxPh1MxnenpthqxfBpRnQyL5tF/+2wA59jHBAYaJsVw1pw7Tt2zDQm5bNJlP2RxTc25LFrBbnkQx5cWZxCniafDHKxeL4wM3I4TplWyjsheGbrU4ZaII4bUc+jGlHR131fz6Up7b5EYx7GP5O1gkDfIgXObY+STft1GRNPXrKP+3eHwT3za5He2VFAcyYvLJnu5skkFHBHWmkmm5vHi0d5KB+CyL8hF08bnfmjhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWl6hUn8dnN4r97Jn4cC62/WM9wERjsWrVDmFzDmdB0=;
 b=uDsBfMqKd6jLqTJLYGkgyz/SjfisqKniHMkQcwGxhIvT59uIEN07l1NtGCL3QmngrUGnb75KOSqHM3Rjf+mQXDOSe1m83eewSQ9fOruReXEPB+eJk5fJPCSwbqRJaP2XCiYJ47NSFLeyncf0MENuUL+D2kdSukmI9MTBbPKp3I9UtfU3zufcpPapf3xjh8K7g952LJaxryS+Rn96jk0DcNbrfjW+exyp3aGLRnFyB/XgKPMAPEvBjhQUxTdvBFPeTpHoCRT4KBx/vHFzq2R5mIWoJUypJiCZwbksYL5WUJuUw6OxxCyHWeS1KcKyapMK6ohc2vp9+Z5hV7l65T77TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWl6hUn8dnN4r97Jn4cC62/WM9wERjsWrVDmFzDmdB0=;
 b=hU29RBnd9SxcK38tLfHStzX56jq1Q8ac0aFbxt6C2z5tIlqa/7gQd37kUpfm+xdYG3/QPnodhjY/cCbrXlmaBO6mwwRthvZ4P9dHpuGyek0jSVJ48QmccrdkB8WkII1lUMGCC46vxPMo5Va7wKsGgEyKy27dGoDAgtpdwr8yGQo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v4 02/11] xen/dom0less: rename kernel_zimage_probe() to
 kernel_image_probe()
Thread-Topic: [PATCH v4 02/11] xen/dom0less: rename kernel_zimage_probe() to
 kernel_image_probe()
Thread-Index: AQHc1xwVOtsB2tnchEy3Q2x22NSmlrX14DKA
Date: Wed, 29 Apr 2026 10:59:42 +0000
Message-ID: <EA0D6439-CA9E-450A-80BA-442A7C8F0A28@arm.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <d87dd4f04e3f0d421485091cf434a088f6693641.1777303844.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <d87dd4f04e3f0d421485091cf434a088f6693641.1777303844.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS1PR08MB7402:EE_|AM2PEPF0001C714:EE_|AS8PR08MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bd5f8b-ac1a-42b1-a391-08dea5de9245
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 n3Ry3R7wtrjsgDVOJYp7OrS80lUqo3T1SF0BezRYBpzWIjqElV0bZy8WYi4bZ4XF9DdLOZ8RFEe5PnRoZt1ns6941109MdjqlpFlq9igyAmVUP3clfyJ2tGj3VKZEDfkmFsjoTLGAT8i5cLvmrWAa1a0s0AUoh+3qq19J6/GIrn2q0Sm022kZYWICGzsx4blbj+IXvHAKrHGIIVjPt/F6c9ycJ02JP9IibBXS0Am5sOW8Fan2NRSJSwYY/XDwAogZhIpXW2daqcb0TjV3DoagKQFgyk+LeWzx2aJTWfZJUKUhVsVuEPM2I4TldV4bC1Y0wxj1qAP2UJToIFijrl0EtPivr/aDgJmLUxvmuV21aXQ/gdz82RCTNCtM6s8Fy9Sf42gD7HrHbbHcTrepxTznjC/SChpQEnYm6NsjoyXBI5JbEmNHXkR3yrQXFoxs36yBZZ9Cjp1jPDSSxPd/fLwbl/Vqf2aDQCQdhfNT4Q01WSZL/JXXsFk1RTdsppiVywNS7pOPYfdzVYHUXwJY5cirobJoBAUgxirD7iZZzSZIMBFVGT8kyagF+8r9YnIQZSk3ABOxZ1vrL7fDeMFmTrIiF1Iz9LAsoqMlzMpokAz22y896RbM2ihiQbMLkAeXW6BI3a/1+DwyreG3SerlgdnIDAMO2rgXwvXbqvqxxnKstZvA8zJEZ0xIWxjSLKtkknw4i5KoO33onYd0N9xX2e20FvID2Xz5oEPfB3MBhMIY0KzPgSuVR/S++A9gjhugz+KDmsAwBJ5rp3cs/xIEPuu5BQfTk8NAfVyNp/h6rYsp6I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5C6A879BF4D1E845AC43DC14C3E3AD82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 CJ/5GjduRz750ORSQlfqINCtviWVH2J1ElqLAprpKFQtM5o589hU/to5rJkSULyjxS8vMjN5PrxPD7Li5ZNDn/2geYuTmXZES5vXHWjyLpQ96tjGhsj2BxktrAgc9xKlrzIORVHIgdN1TKeN2mt7qj/N1rXRYpzyALGGLJubxSlQ2Vl0bb58ZBO+t/jv1H3+Sw5H4WhH9CPAC0IxszMqrzf6R69CAKdn25gG/mccGBz+n9JubzRdHrb2Pj7aXVcZA//Jas4XjJc04Q1pOG0lQ/N8I/7SdNLrphPh7+61iAs2AFeLxEg1FUgNAUcMjCxsCC0Y2xhJRLPR3ktSwZDmmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7402
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7cf2ab06-76e3-43f1-2962-08dea5de6a9b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700016|14060799003|376014|82310400026|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gC2rTodMeEffiV4X62W9KvAiR3IURg3dwI/CiR5zEAxcvRE1+HTjBkfu/a/p5uLlGqPG6bN7toS/PlyeFO6SGYvHK0llG+LZhb6P2owUg9tQPcPV3ViVsO9R6LW+tl+prBD6hn2QAJ5WACZP1rp+fteEcDkfrM6QNShsZUWajLXSjse890jd6dfDAXLxsu1vC1VUX9ipSLoq/m0ZutLAHD0c60XUpB3AnBXRBa/bIkDyCDVL/W45LNCzyEpob4tPnw3f/6FdkbZEzO1E44iZ7rBJBzU4oGgutNxd0eHDkxJ7cmud7IgCMJrdVx+HyFSMJFk/iQ0/3PqmCeJEyBjGpDlK7zyqIfFUC4YYlA2swhTUavtNESFEte+RII09NlTMF51cW3OloMd4LtOy61sBg0jEQ6X39F8R0o3ax46yKcLlMo75xMsmbutIMq4BdAhSdm3GlCi62Bbb2JhsDNKX9Wqd6H0R8pXe0E5OrgEyQtdcbrJS88TtHSRP/ZDEm9rYrZqd5sZeZ56I6x+Q6dwNOlKkbhTckDjuaDeltQXSOT83c91XShYXaC47uso6945xLXn0Kslw5zANQvUy0amXT91uXehI9BxCoBv7+dghYa31TgEoAu1LBA0y2hXpbdtgoV9a0lLqowh/gd26hH5JmxBxcek/ni6tghKtIfdfE1Relk1xaH0rxEpo2qGn2V+jfUZyV0aczgekY4+Z1pDDuMzZGKhbndbzOWUh/anZ+Vs=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700016)(14060799003)(376014)(82310400026)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0zd1ORJvinb8LkzN41ehLeP2JpfOoODk2KBc5BdrotYwFTRzMxg5lGPFawmnaKdURtPxGdX1VIrgSGBvgcL0nX86GxOvTsLBBuBKGIfC/X7jW9nXzp3pHvXls2iwkBgLJa18jEPJVSsuxYyNny8jD4xvedyvYBN1kDiHOSqczkqL+6hqVun267TA4zuX3FKyj2AkWKijSujudaC82R6o6/41EFb9+T3d3EwhHT2e7ZvbVhjUvHIs6qbi+NI5QmrsNqBog0og5ZO12e0ysJokOtmRmpQGiyyAojLY6xonfoYvZCXGrSgAnAouqZeAecY7Q1XbqVM1JAf96nVJCgff4ihRVLC2qsfA++xJdamSXMTc8LIbKMVNVzwlTfDXfWulbcqXXPxuLNyL7Givj6VnhIIlobDd2G4ggY0UHljSL2BlYif00BuFob4gz3V5xHww
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 11:00:48.7551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bd5f8b-ac1a-42b1-a391-08dea5de9245
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9645
X-purgate-ID: tlsNG-c1860d/1777460457-38567DB1-70AEBAC8/0/0
X-purgate-type: clean
X-purgate-size: 4465
X-Rspamd-Queue-Id: 8149C4934CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.68 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.724];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,xen.org:url]

Hi Oleksii,

>=20
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 9395b5af8745..a5554714cd7b 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -101,8 +101,8 @@ static paddr_t __init kernel_zimage_place(struct kern=
el_info *info)
>     paddr_t load_addr;
>=20
> #ifdef CONFIG_HAS_DOMAIN_TYPE
> -    if ( (info->type =3D=3D DOMAIN_64BIT) && (info->zimage.start =3D=3D =
0) )
> -        return mem->bank[0].start + info->zimage.text_offset;
> +    if ( (info->type =3D=3D DOMAIN_64BIT) && (info->image.start =3D=3D 0=
) )
> +        return mem->bank[0].start + info->image.text_offset;
> #endif
>=20
>     /*
> @@ -111,19 +111,19 @@ static paddr_t __init kernel_zimage_place(struct ke=
rnel_info *info)
>      * and above 32MiB. Load it as high as possible within these
>      * constraints, while also avoiding the DTB.
>      */
> -    if ( info->zimage.start =3D=3D 0 )
> +    if ( info->image.start =3D=3D 0 )
>     {
>         paddr_t load_end;
>=20
>         load_end =3D mem->bank[0].start + mem->bank[0].size;
>         load_end =3D MIN(mem->bank[0].start + MB(128), load_end);
>=20
> -        load_addr =3D load_end - info->zimage.len;
> +        load_addr =3D load_end - info->image.len;
>         /* Align to 2MB */
>         load_addr &=3D ~((2 << 20) - 1);
>     }
>     else
> -        load_addr =3D info->zimage.start;
> +        load_addr =3D info->image.start;
>=20
>     return load_addr;
> }
> @@ -131,8 +131,8 @@ static paddr_t __init kernel_zimage_place(struct kern=
el_info *info)
> static void __init kernel_zimage_load(struct kernel_info *info)
> {
>     paddr_t load_addr =3D kernel_zimage_place(info);
> -    paddr_t paddr =3D info->zimage.kernel_addr;
> -    paddr_t len =3D info->zimage.len;
> +    paddr_t paddr =3D info->image.kernel_addr;
> +    paddr_t len =3D info->image.len;
>     void *kernel;
>     int rc;
>=20
> @@ -215,7 +215,7 @@ int __init kernel_uimage_probe(struct kernel_info *in=
fo,
>         return -EOPNOTSUPP;
>     }
>=20
> -    info->zimage.start =3D be32_to_cpu(uimage.load);
> +    info->image.start =3D be32_to_cpu(uimage.load);
>     info->entry =3D be32_to_cpu(uimage.ep);
>=20
>     /*
> @@ -224,20 +224,20 @@ int __init kernel_uimage_probe(struct kernel_info *=
info,
>      * independent image. That means Xen is free to load such an image at
>      * any valid address.
>      */
> -    if ( info->zimage.start =3D=3D 0 )
> +    if ( info->image.start =3D=3D 0 )
>         printk(XENLOG_INFO
>                "No load address provided. Xen will decide where to load i=
t.\n");
>     else
>         printk(XENLOG_INFO
>                "Provided load address: %"PRIpaddr" and entry address: %"P=
RIpaddr"\n",
> -               info->zimage.start, info->entry);
> +               info->image.start, info->entry);
>=20
>     /*
>      * If the image supports position independent execution, then user ca=
nnot
>      * provide an entry point as Xen will load such an image at any appro=
priate
>      * memory address. Thus, we need to return error.
>      */
> -    if ( (info->zimage.start =3D=3D 0) && (info->entry !=3D 0) )
> +    if ( (info->image.start =3D=3D 0) && (info->entry !=3D 0) )
>     {
>         printk(XENLOG_ERR
>                "Entry point cannot be non zero for PIE image.\n");
> @@ -257,13 +257,13 @@ int __init kernel_uimage_probe(struct kernel_info *=
info,
>         if ( rc )
>             return rc;
>=20
> -        info->zimage.kernel_addr =3D mod->start;
> -        info->zimage.len =3D mod->size;
> +        info->image.kernel_addr =3D mod->start;
> +        info->image.len =3D mod->size;
>     }
>     else
>     {
> -        info->zimage.kernel_addr =3D addr + sizeof(uimage);
> -        info->zimage.len =3D len;
> +        info->image.kernel_addr =3D addr + sizeof(uimage);
> +        info->image.len =3D len;
>     }
>=20
>     info->load =3D kernel_zimage_load;
> @@ -289,7 +289,7 @@ int __init kernel_uimage_probe(struct kernel_info *in=
fo,
>      * Thus, Xen uses uimage.load attribute to determine the load address=
 and
>      * zimage.text_offset is ignored.

Should we update the comment as well?

Also in here:
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/xen/fd=
t-kernel.h;h=3D4d0467bb396a9cf317954fd511469e7f56d67844;hb=3Drefs/heads/sta=
ging#l111

Cheers,
Luca


