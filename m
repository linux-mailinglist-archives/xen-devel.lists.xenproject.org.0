Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLMnJnMUhmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:18:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60A100289
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223603.1531086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOXf-0004RR-Q8; Fri, 06 Feb 2026 16:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223603.1531086; Fri, 06 Feb 2026 16:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOXf-0004Nr-ML; Fri, 06 Feb 2026 16:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1223603;
 Fri, 06 Feb 2026 16:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1voOXd-0004Nc-Tp
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:18:46 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81f36b62-0377-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:18:44 +0100 (CET)
Received: from DU2PR04CA0077.eurprd04.prod.outlook.com (2603:10a6:10:232::22)
 by VI0PR08MB10800.eurprd08.prod.outlook.com (2603:10a6:800:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 16:18:37 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::2f) by DU2PR04CA0077.outlook.office365.com
 (2603:10a6:10:232::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 16:18:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 16:18:36 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AM8PR08MB6435.eurprd08.prod.outlook.com (2603:10a6:20b:317::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 16:17:33 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 16:17:33 +0000
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
X-Inumbo-ID: 81f36b62-0377-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GTUppB/BHbxz54Ar06VKNARHj3IUYtVvF/U47RuGYlBOz+h8LQ4Wg+ZD105XoNKufw01caFJqk4XF+dvz8R49Je4GrlQUeNmTswJgViu6GW995hzzsUY2WHbTwyj6I9y+aCdizalNNhb6BmKlB8gPx6bd6nkNsamSCg/Piu2bZrtWWoZcqTp5THOwX6fmxTo/dbqlNfIZgy6YlEKJayVrPWzeeCwZT5UONx2BElW/nDcVX4qJhkDACSQTyFMq5swomZMuNWcfj4pPeWbt31XFSvT1SDsIW9Eo+KzLV/9ZRGz4GwS9HUP5WJ3zKHa4hM+EwRBsQiOlCFDMgSuTF5ahg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM+MsmT9gJMdqsLx2cZgzlibgHr5q5kJQWH0GYLA3xc=;
 b=kshrmkzjj8pVtKNoB8gU5bOuAXDwVX10uMBk32IPjh9Is1nO24uZEGT9NbEdUc1q5cN0RpQC1ciDfpEYqGmZaJlgB8nNSTrpbxyTqKorHPafRz5SPlB6Au/kLHupmw8y/z3WOCcy7aS6LBo/0KDdP/ZAHN42UJMuuyilLcxY5zEJLR7XB/SB6DHjicOIx4jHK8RZSgnpbDqoIxnUADpoJqJZngHQSEAcPFwuzc9Nr8/yOrBNqa6woixf1KcaHFcneU/FH13uPjx58cW9c1envcCjDS31d0tlEm2R5CqI4RnmckiIfdlEXFeZYveF0BjuM44RkrViKGXZ7SSjiJS1JQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM+MsmT9gJMdqsLx2cZgzlibgHr5q5kJQWH0GYLA3xc=;
 b=gxMDi5xRv9HAhgqdQbzth/0GO9OR0k+9P0M0w9pRQBiugUBt9oZCngIslOgwmUc6i9LKu3OJ+iWtNe0QlzZcXcBuowMyn4GRtzTzR5OGVohjHNtNEl0+JSxMutTMoUJwuFUo0VrxgEei+RXuL6+fEz2bPr6nPOAXgsoUSqijNcU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOnvKZuK+IoIv2mF4jujPb/N7XEnZjTB2BAL69UmxKC9TVVe2ldd9R9hOeqT9TGKZqY980cO9zjUVIy15wflkuJ0/yBymQdRcvhc09Gtk/JpnOmvK13OHqQBqUs6ugM5HDkfvtd1NdVkXhGzwxwUDRjS+6PLjO9GyHepj24dvvOEog4VLartD46710ipSxVGFrOXiVG5faIgC96/sWYDgj0qOi8TBcqMCUJoNjS7yOxP/lWStv7L4Jsjq3F2vmHXCHlST4OIAisoo5nVnrn0Y9xRCYrYyIJtMvVaq97whIN+pvY9JPwjadbDNVD48wGOApIv9/TUdCr55asxiX0Ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM+MsmT9gJMdqsLx2cZgzlibgHr5q5kJQWH0GYLA3xc=;
 b=XE2Q+XJE6uUwTJg9RkcEhV40YgN6hpGvM24K4af5YeMOXezjDijvpNTzVQZTmdjFTwp6stHNp2lbW4lBXNSMRfQuTns/JmCkDPbkcOSGcYZLd2vU/y+Lqcwe9784PDiy2vw9rJHRjulcdnX2UzFhpy0BEe8EvraER2wDn3UOmIC38UR98dOO7ZlppGWdOT3oFyt6bFoWS+BCAa72Row3xD4RCTKANVsh3VyOO0Ljb9aFInk0DutqWd3X53mJwumq/ACjulbTHNFc3IA/9x/G+m3+Wfuit03qDNlkLRy6gfVrOpwYvjmyCAB1om1lgQWhr56F/t9T/A7EOQqc/ezH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM+MsmT9gJMdqsLx2cZgzlibgHr5q5kJQWH0GYLA3xc=;
 b=gxMDi5xRv9HAhgqdQbzth/0GO9OR0k+9P0M0w9pRQBiugUBt9oZCngIslOgwmUc6i9LKu3OJ+iWtNe0QlzZcXcBuowMyn4GRtzTzR5OGVohjHNtNEl0+JSxMutTMoUJwuFUo0VrxgEei+RXuL6+fEz2bPr6nPOAXgsoUSqijNcU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 02/12] xen/arm: ffa: Fix MEM_SHARE NS attribute handling
Thread-Topic: [PATCH 02/12] xen/arm: ffa: Fix MEM_SHARE NS attribute handling
Thread-Index: AQHclTP7K3wg+ZaqtkSBKsmCVp4oSLV1a3IAgAByTIA=
Date: Fri, 6 Feb 2026 16:17:33 +0000
Message-ID: <24BD5FEB-06D2-40C0-A928-376A104B9E55@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <9886df295f4c4365668576cc956299ee36f36c8b.1770115301.git.bertrand.marquis@arm.com>
 <CAHUa44G9sGWp18EX=Zb-C-jDJn_V6BmEVvnza7t6gcx3rjsRww@mail.gmail.com>
In-Reply-To:
 <CAHUa44G9sGWp18EX=Zb-C-jDJn_V6BmEVvnza7t6gcx3rjsRww@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AM8PR08MB6435:EE_|DB5PEPF00014B91:EE_|VI0PR08MB10800:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1b92a1-e5c4-4488-5e49-08de659b61d4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d2tQK2V1Z0xiY1RKUGt5T0FKb3hSNE1OOTZpWkhiZ002VGxMQ3YzL1hjMC8r?=
 =?utf-8?B?dUhiSDVHYnVnTVNvdEFselRiMVAzRFNucGZYNlB6anYwd3JGUG5aRWZPVW53?=
 =?utf-8?B?b0tpL0ZHbUtLN3I1MzdtOEJyRUNjVmEzS3U0by9lMDJmaTU0V0k0MWl1Yngz?=
 =?utf-8?B?TmcybHE2c25pUVJDYkxMNFRyWi9rc1JmTUhwKzdaS2pzbzFzOHhpSkh2cjBI?=
 =?utf-8?B?dGtCekg5N3pISDE4U3hzU2NUb1FxSWhGTjlVV2E2bytld0tPSjFGZkhrMEdh?=
 =?utf-8?B?ZCswa1U2U2cwVzV1UUsrNlp4MFpUbENYZXVkR3M4QlorQkN6SWRkbFU5T0o1?=
 =?utf-8?B?bDI4amVFek5teWJHWFFKUzNHTTFMeVNQNFFKTFFIdXBKMWZONHZxdWYzeURW?=
 =?utf-8?B?RXZtSWx6eHl0MzFCNTV2OCtham9USFk5V0U3eG5FaTZjVE1YWDNwVjZOaVdS?=
 =?utf-8?B?bUEzaHVZUHRxVERMWWs5OE1EaVZabVZGRS9acHBnMmJsYnBCMkhPWXdXSzRx?=
 =?utf-8?B?MGs4bDdLbXByZUlqbXBFOEhWQWFRNjBLR0JYYnYyaWpzeFRWZUg5Q3JQd2J3?=
 =?utf-8?B?dmdHeWdxdXZzYXdQM3hMS25wZmZkZWpLeUorV285YUdOb0pTS2ExNXlEb1V4?=
 =?utf-8?B?SzlhWkt3SmtFY0ltY1hscGFHT0NlWW0zS1pHdlBDc2Zma2pxdG11cmIzam9C?=
 =?utf-8?B?WVpiRUpoTlRKeGhTdUt2WFdOS2lhQ0xHTW9taDJiLy9OTFhOVkdOTEFRSTdC?=
 =?utf-8?B?SXp5aFlqejkxVFlHWUR1ZVZHU3JCWVZmYm5yT3d4NXA0bWF6Yzd6NkRwSTQw?=
 =?utf-8?B?dVNxQnhibmdFeVFVSVpLNmNMak9hSzBmVFYzbFdSaUVkNTBhQ3k5VWxIWWxU?=
 =?utf-8?B?V2tSSkljazZXaFBLKzNZaytVNDVyKzc1ZnhGNEhxV0F1cVBXSDZidFl3dHdF?=
 =?utf-8?B?RFR1TjNsUU9vb3hHVEVLV1MzVW9wMUxJRVlKblZkQllvMVBFeUxUZDVyUnp4?=
 =?utf-8?B?TTJHSXN0ZUJTZ2srWDFCamN5SUxwekRuTTNrZU1HcW1LVXg3bXU1dUczbSty?=
 =?utf-8?B?eUFGb3JHcWJOamg2a005OUZ5VmwraDZ3d2Y1SHdzZ2Y2TTdETndOYnoyOUtB?=
 =?utf-8?B?SGRFcHo0aUE1cStUV1pHSlNQWDVLUm1iMlF0M0ZDRkNiRXFFZ0l5M2g1L2cx?=
 =?utf-8?B?RmdYaTBTNkpVcmtYV1hOR0lqL3NMQkF0MEJrTVBQSFJzakhHcmx5QUEwbjdk?=
 =?utf-8?B?cGFwR25uaDlhMUdHUWhIYVN4VnBPc3Y1SStuK1F6ZlgvUHRTMDhBUk5Rc2R5?=
 =?utf-8?B?a1VLSGNyN1o0MytyNzFsd3o5NVRxQno4UUVjYzhubTlXZnhTM0hKbE5tVWZL?=
 =?utf-8?B?REpBWVpvejJKK1U4ekt4QzF6anhrS1licnJUSFhFaUdBajdsb3dWUjR6ZDBh?=
 =?utf-8?B?Qkp6M3lHVTgyczBtRXZVcFV5NGpEd3YvMnZZaG84YS9RSXhud3pVWnhaM3Ew?=
 =?utf-8?B?N2JOSDVSV2NoVHpyN210bkcxdmlUTE1CZUllREh1R2lYRXFQTE5vMGhrZmVi?=
 =?utf-8?B?WEN6NnRaVUM5cGlMOXlBZlQwd1ZPQU1xVStwbDZ3Qk9Sd240aG5BbVBnSVhh?=
 =?utf-8?B?d0c0YTI1dEJBOTZkdGJtU2V4Z3pucXAxZFMrd2dnWWZNUnFrMDhxSUhGbVc5?=
 =?utf-8?B?emNSUzNJdk00VXQ1U1IrViszNmQyOWFqMGpXVlJnblVVRjZ3WGtZaVM5bzBp?=
 =?utf-8?B?SzQ5c2dDZDVicDJZOUJzT0dXdCt5dHFRZ1d0UWk3ck9iZCtrM0dKMFhlWDY1?=
 =?utf-8?B?MXNrMjJ6dWFyVnNIRkY4U3dZKzEvNGxZZ1R4VHltcDVVMEUyemZlYllra085?=
 =?utf-8?B?OHllUVo1R3BmSjBqKzMwYXFiMktsbjQ2cXdLU0EwaExERTFEa2xXdVNZbHly?=
 =?utf-8?B?aWhwd0pybHgzeVh3TTZkMEpPam1mWmxybTZmaGo4SWhKS0c2all5WmtKNU9q?=
 =?utf-8?B?b2p3R1BoRVlOQkM1ZGRRLzE0cjF0ZWk2TEV4YjZkYUlKeTZhb0M5VWxjcStH?=
 =?utf-8?B?NUlhTUlzMFpXdEVaNEExQ1VEWm1GbDg4bEFZT2t0VldZdS9naDB3QUtxQUF4?=
 =?utf-8?B?K2gxRGo0M1BqYlJONnV3a01RRkFLZFYydTZFUGJLNjd4NmdPbFNST29pNG5S?=
 =?utf-8?Q?BL+Hj0AY8Z6+cJn5FZWejqI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D65CDC11FEE31F47A2C3233E33BA6E19@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6435
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59e91ed0-b287-4167-3ec9-08de659b3c00
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFk4NndCVy9zcWwxcXFOY2ZjZjFsdlZzcGJzVGttU05ZbFFZTmxBc0ZKZWJK?=
 =?utf-8?B?RndUZmVPbTZnU1NQa241WXBFK0pteVM4dmRCcDZiMVdUMVVzZVZqcDlWV3Bu?=
 =?utf-8?B?d3BHNTRzN1ZTQlNyUDZMRVZJVmdFeGUzN2lScWtvOFNFTmNvQ01XdEY5RWVl?=
 =?utf-8?B?M2Ivc3NpTlZxTkRSN3MxQ1pDRXlJN2RnMmtONS9QVzk4cXFRVFJlRE5EMkFs?=
 =?utf-8?B?bWN4VHdmRUJXYWNlUEVaeEY1L1huUHp6TEJaaHN0R0xlZzBneFBBUmtzMXBV?=
 =?utf-8?B?S0tJRHZpWDByWjRZT210T2lBNlpEREhjcHdYVDV3VTVkZFNXUEkyVFlDUFFl?=
 =?utf-8?B?dVIxUGFDeE52LzREZzBqMEVIc2pyTWt6YjhJQmxhTTFnczNjRG5GWU9GQldz?=
 =?utf-8?B?ZmNqUzAyazJDSmYzWERtOEdqaG8wVUhTWEEwellybk84bzk2VE1XL2JpcWNq?=
 =?utf-8?B?QTlYcGRnRldXelUwOEtLdllicEp5V1JKS0QyVXM3M0dwN3FOalJRY0dXOW5t?=
 =?utf-8?B?eWdobzYxL1lGZmJabEZXWDBBZi8xeXhSMkNTVy85dFNUYnY3L2hRNnNWSUIr?=
 =?utf-8?B?K0ZjVTdaMWRLRHlZSU0wczR5ZmFqNkZJWWowdEV1R0dxbUNwbEFlekFzVGIw?=
 =?utf-8?B?elZQd2xhdUlQVGpuTGYycU9rV2tBQW9wNSt3YTM2SkNLNmZJOWhab2VLcENq?=
 =?utf-8?B?TnY2TlpscjBTTFlXc3pvSnExRDN2U2hMQ1QvUHdsMDdSNU9mUHRMVzdKWTBL?=
 =?utf-8?B?b0hLMjZ0ZTV1TTN2SjE4L2RRd1hIK1VydWEwNnRWRkxnSVFWY3B6aFl3d1Bv?=
 =?utf-8?B?RTI2WFp3YW9ROTNHd0tuK1dpNEFvZVEvK2J1Z2YrL0VvL2NqOHkzVEowSE5h?=
 =?utf-8?B?QXhJYk05NTArdzBqajZ6Y2VCYTFzanhteEd3WmhFU1NVUENiQmFlVW5EYWR5?=
 =?utf-8?B?aHVjVkZPcDFUc04zdVNrSWhtdUJNUWdJdE9XcG5Pb1ZBb1hlb3pSUGliTkF6?=
 =?utf-8?B?dXU1RS9WRXkzWUlITmVuYWlLMGhXKzFTc2tFUTFJcXRJRXBwbE9jSVJKVUVh?=
 =?utf-8?B?VCtINUdFaHdVaE5ySmhKdlBaMUdxeVJxV0Z6c0Zyd2V5bDBSZUxmdjRJRW5l?=
 =?utf-8?B?bTVjVEZKb2FVMlZUbU9kaDNGa3VuMjQ5cXVaZ01EQ29BaGI3Y2RPak1nTlo5?=
 =?utf-8?B?M1F0TDUvRzdyZjZOQlNYMVRFbS9LaU1uN21LSUM5WWQxYmQrWmc4bFgxMm1D?=
 =?utf-8?B?ZGZsbE8xQURSYktMNE8yMjJidy9EUDVpU3lKT1c2QmdMVzlPQU91V3VEcDVD?=
 =?utf-8?B?MTNBcWhwQ01xb3IyTlBydWF5MUlBRHY4THBmT0xiYVVZZFZzTDhKZWE5MmJH?=
 =?utf-8?B?NjYrQ2wwMVFXcUM0MmxmZ25DVDNlWEUxOGtCbTRJNThvaThHVCtUWnU5c0s0?=
 =?utf-8?B?b09MZXdMSnA2UU15clN5cW9GdTd3SGF3L1hWck5HSmdxaDM3VWRqSDRKd3du?=
 =?utf-8?B?Z1EzNUlXY0ZEQnJiWlk5V0J3aXYvdlZldFdHM21CckdQLzZIS09ER3VhTXJO?=
 =?utf-8?B?WEVoUVBoSUsrTEhGWExQODJvbkZ2cmNDS0F2UmIwTUlzaVlVMXQraUdNRy9y?=
 =?utf-8?B?SGxwUFM0N0ExdGdsaStyUU1ZektLeUk0VDZES0lkeFBWSmFMWC9leEdYNEI3?=
 =?utf-8?B?YmZFNXdFUFVzdFpSa0lpZUJ0RXVKYTNFZkEvTGNvRCtHN1MrQnozd0lEaDNq?=
 =?utf-8?B?N2ZxZ2VybTN6WVE2dmcwUTdPOVcyaXBWVFJnVWZPVGp1ZDg5YmVYbUpJTUZJ?=
 =?utf-8?B?Z041Yk9BaitIQlE5VHNKLzlCM0hkVVdtd0JDbjA1WUllQjREWVVkWjhaUlZt?=
 =?utf-8?B?ZDVsZkhHb2tiaWVrazQxVWRNUmRyK3ZVRXU2UzZlR2FmdGRiNlp5SVRDZTJ4?=
 =?utf-8?B?R0NieDhFTmVWZHBOOFBId2thSlppanVyc2FzVExjem5WeTJIRHFKVHo3bFBu?=
 =?utf-8?B?eU5TbFVMZm5raFQ5dUlLSzdVZDBXQ01rczZUaGNsUHo0bmJtR3gyMUpSSFhv?=
 =?utf-8?B?SDNRVXNRZHdIVnBoL2J6anFHTDRHNVhVUVNWcmdUT1BVTGpzdWFDSTNRdkdC?=
 =?utf-8?B?ZlBOMzgvWDVudDJON2JjUUlFL1ZvTjhaN3ZxZjh4M0lIcVZUNlNWRlF4ZE1V?=
 =?utf-8?B?UHRiZEpBMG51UXpTYnVjWWVqSTVpY1pjQ2VBaG9hbUFJaE81S2VYb2ZHQXNx?=
 =?utf-8?B?TDVnNWJqNzU1WTV5ZDBmak9wc1pRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SkT9H1KHE2xNLALQTBlN489eeiOsdxtDvq9TEBkvqufKZ38zmoA0PEKc5BmG/BY510Xe4lIe75rYPntHMbLv5p8hlFU8Y0T7baMnex+0YoQe9cYKxeDSqONJwjBFkZ7q2BpOqwDGakNr8EZFbDSfo0xl2HZ3MakQ7bqZT4dGhIIsc3QEOU4mo+WcQ/ttnJDAiA3gEAQfz8/Xvhsfnfv1hy8qJ+2QIwu9XH93cZPHxGT/xJUHDl+k7/sAP6kHmPa6MQP30ccxUzKEExqi1C+VwFBKTrNrzUtGBWE88CXLPFGNdZK8a72gX2MFfsykBejFgJOUoKx4EtCaEHKfnOCwzkRV/Q2TAiqDPcM45NWbMiIKby/WXRSf4LSxC+YcK9IMzm0VLlZhmMaSf7l+lwNLN8wyN8VitXJepTolLDN3gntWNce04gEC3Fm8/tIq9Zo5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:18:36.7795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1b92a1-e5c4-4488-5e49-08de659b61d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10800
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,linaro.org:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CA60A100289
X-Rspamd-Action: no action

DQoNCj4gT24gNiBGZWIgMjAyNiwgYXQgMTA6MjgsIEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xh
bmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4gT24gVHVl
LCBGZWIgMywgMjAyNiBhdCA2OjM44oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8YmVydHJhbmQu
bWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gVGhlIEZGLUEgbWVtb3J5IGF0dHJpYnV0
ZSBlbmNvZGluZyBpcyBjdXJyZW50bHkgYSBsaXRlcmFsIHZhbHVlICgweDJmKSwNCj4+IHdoaWNo
IG1ha2VzIHJldmlld3MgYW5kIHZhbGlkYXRpb24gaGFyZGVyLiBJbiBhZGRpdGlvbiwgTUVNX1NI
QVJFDQo+PiBhY2NlcHRzIHRoZSBOUyAobm9uLXNlY3VyZSkgYXR0cmlidXRlIGJpdCBldmVuIHRo
b3VnaCB0aGUgbm9ybWFsIHdvcmxkDQo+PiBtdXN0IG5vdCBzZXQgaXQgYWNjb3JkaW5nIHRvIEZG
LUEgc3BlY2lmaWNhdGlvbi4NCj4+IA0KPj4gSW50cm9kdWNlIG5hbWVkIGF0dHJpYnV0ZSBiaXQg
bWFza3MgYW5kIGV4cHJlc3MgRkZBX05PUk1BTF9NRU1fUkVHX0FUVFINCj4+IGluIHRlcm1zIG9m
IHRoZW0gZm9yIGNsYXJpdHkuDQo+PiANCj4+IFJlamVjdCBNRU1fU0hBUkUgZGVzY3JpcHRvcnMg
d2l0aCB0aGUgTlMgYml0IHNldCwgcmV0dXJuaW5nDQo+PiBJTlZBTElEX1BBUkFNRVRFUlMgdG8g
bWF0Y2ggRkYtQSB2MS4xIHJ1bGVzIHRoYXQgcHJvaGliaXQgbm9ybWFsIHdvcmxkDQo+PiBmcm9t
IHNldHRpbmcgdGhpcyBiaXQuDQo+PiANCj4+IEZ1bmN0aW9uYWwgaW1wYWN0OiBNRU1fU0hBUkUg
bm93IHJlamVjdHMgZGVzY3JpcHRvcnMgd2l0aCBOUyBiaXQgc2V0LA0KPj4gd2hpY2ggd2VyZSBw
cmV2aW91c2x5IGFjY2VwdGVkIGJ1dCB2aW9sYXRlIEZGLUEgc3BlY2lmaWNhdGlvbi4NCj4gDQo+
IFRvIGJlIGZhaXIsIGl0IHdhcyBhbHNvIHJlamVjdGVkIGVhcmxpZXIsIGJ1dCB3aXRoIGEgZGlm
ZmVyZW50IGVycm9yIGNvZGUuDQoNClRydWUsIHdpbGwgYWRhcHQgdGhlIGltcGFjdCBjb21tZW50
IHRvIHNheToNCg0KRnVuY3Rpb25hbCBpbXBhY3Q6IE1FTV9TSEFSRSBub3cgcmVqZWN0cyBkZXNj
cmlwdG9ycyB3aXRoIE5TIGJpdCBzZXQNCndpdGggdGhlIHJpZ2h0IGVycm9yIGNvZGUsIElOVkFM
SURfUEFSQU1FVEVSLg0KDQpUZWxsIG1lIGlmIHRoYXQgd291bGQgYmUgb2sgZm9yIHlvdSBhbmQg
aWYgaXQgY291bGQgYmUgZml4ZWQgb24gY29tbWl0IHdpdGgNCnlvdXIgUi1iIGlmIGl0IGlzIHRo
ZSBjYXNlLg0KDQo+IA0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxi
ZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZh
X3ByaXZhdGUuaCB8IDE3ICsrKysrKysrKysrKysrKystDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2Zm
YV9zaG0uYyAgICAgfCAgNiArKysrKysNCj4+IDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Rl
ZS9mZmFfcHJpdmF0ZS5oIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBpbmRl
eCBjZDdlY2FiYzdlZmYuLmI2MjVmMWM3MjkxNCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0
ZS5oDQo+PiBAQCAtMTI5LDExICsxMjksMjYgQEANCj4+ICNkZWZpbmUgRkZBX0hBTkRMRV9IWVBf
RkxBRyAgICAgICAgICAgICBCSVQoNjMsIFVMTCkNCj4+ICNkZWZpbmUgRkZBX0hBTkRMRV9JTlZB
TElEICAgICAgICAgICAgICAweGZmZmZmZmZmZmZmZmZmZmZVTEwNCj4+IA0KPj4gKy8qIE5TIGF0
dHJpYnV0ZSB3YXMgaW50cm9kdWNlZCBpbiB2MS4xICovDQo+PiArI2RlZmluZSBGRkFfTUVNX0FU
VFJfTlMgICAgICAgICAgICAgICAgIEJJVCg2LCBVKQ0KPj4gKw0KPj4gKyNkZWZpbmUgRkZBX01F
TV9BVFRSX1RZUEVfREVWICAgICAgICAgICAoMVUgPDwgMykNCj4+ICsjZGVmaW5lIEZGQV9NRU1f
QVRUUl9UWVBFX01FTSAgICAgICAgICAgKDJVIDw8IDQpDQo+PiArDQo+PiArI2RlZmluZSBGRkFf
TUVNX0FUVFJfTkMgICAgICAgICAgICAgICAgICgxVSA8PCAyKQ0KPj4gKyNkZWZpbmUgRkZBX01F
TV9BVFRSX1dCICAgICAgICAgICAgICAgICAoM1UgPDwgMikNCj4+ICsNCj4+ICsjZGVmaW5lIEZG
QV9NRU1fQVRUUl9OT05fU0hBUkUgICAgICAgICAgKDBVKQ0KPj4gKyNkZWZpbmUgRkZBX01FTV9B
VFRSX09VVF9TSEFSRSAgICAgICAgICAoMlUpDQo+PiArI2RlZmluZSBGRkFfTUVNX0FUVFJfSU5O
X1NIQVJFICAgICAgICAgICgzVSkNCj4+ICsNCj4+IC8qDQo+PiAgKiBNZW1vcnkgYXR0cmlidXRl
czogTm9ybWFsIG1lbW9yeSwgV3JpdGUtQmFjayBjYWNoZWFibGUsIElubmVyIHNoYXJlYWJsZQ0K
Pj4gICogRGVmaW5lZCBpbiBGRi1BLTEuMS1SRUwwIFRhYmxlIDEwLjE4IGF0IHBhZ2UgMTc1Lg0K
Pj4gICovDQo+PiAtI2RlZmluZSBGRkFfTk9STUFMX01FTV9SRUdfQVRUUiAgICAgICAgIDB4MmZV
DQo+PiArI2RlZmluZSBGRkFfTk9STUFMX01FTV9SRUdfQVRUUiAgICAgICAgIChGRkFfTUVNX0FU
VFJfVFlQRV9NRU0gfCBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBGRkFfTUVNX0FUVFJfV0IgfCBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBGRkFfTUVNX0FUVFJfSU5OX1NIQVJFKQ0KPj4gLyoNCj4+ICAqIE1lbW9y
eSBhY2Nlc3MgcGVybWlzc2lvbnM6IFJlYWQtd3JpdGUNCj4+ICAqIERlZmluZWQgaW4gRkYtQS0x
LjEtUkVMMCBUYWJsZSAxMC4xNSBhdCBwYWdlIDE2OC4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9zaG0uYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3NobS5jDQo+PiBpbmRl
eCA4MjgyYmFjZjg1ZDMuLjkwODAwZTQ0YTg2YSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS90ZWUvZmZhX3NobS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYw0KPj4g
QEAgLTUxMiw2ICs1MTIsMTIgQEAgdm9pZCBmZmFfaGFuZGxlX21lbV9zaGFyZShzdHJ1Y3QgY3B1
X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICBpZiAoIHJldCApDQo+PiAgICAgICAgIGdvdG8gb3V0
X3VubG9jazsNCj4+IA0KPj4gKyAgICBpZiAoIHRyYW5zLm1lbV9yZWdfYXR0ciAmIEZGQV9NRU1f
QVRUUl9OUyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9Q
QVJBTUVURVJTOw0KPj4gKyAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gKyAgICB9DQo+PiAr
DQo+PiAgICAgaWYgKCB0cmFucy5tZW1fcmVnX2F0dHIgIT0gRkZBX05PUk1BTF9NRU1fUkVHX0FU
VFIgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgcmV0ID0gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0K
Pj4gLS0NCj4+IDIuNTAuMSAoQXBwbGUgR2l0LTE1NSkNCj4+IA0KPiANCj4gTG9va3MgZ29vZCwg
YnV0IEkgdGhpbmsgdGhlIGNvbW1pdCBtZXNzYWdlIG5lZWRzIGEgc21hbGwgdXBkYXRlIG9yDQo+
IGNsYXJpZmljYXRpb24uDQoNClRoYW5rcy4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBD
aGVlcnMsDQo+IEplbnMNCg0KDQo=

