Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD74B90E674
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 11:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743555.1150470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJrCh-00074i-7j; Wed, 19 Jun 2024 09:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743555.1150470; Wed, 19 Jun 2024 09:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJrCh-00072o-4b; Wed, 19 Jun 2024 09:02:07 +0000
Received: by outflank-mailman (input) for mailman id 743555;
 Wed, 19 Jun 2024 09:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Pjt=NV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sJrCf-00072i-7f
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 09:02:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20621.outbound.protection.outlook.com
 [2a01:111:f403:2611::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 986ac806-2e1a-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 11:02:03 +0200 (CEST)
Received: from AS9PR06CA0575.eurprd06.prod.outlook.com (2603:10a6:20b:486::6)
 by DU0PR08MB9876.eurprd08.prod.outlook.com (2603:10a6:10:424::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Wed, 19 Jun
 2024 09:01:59 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:486:cafe::32) by AS9PR06CA0575.outlook.office365.com
 (2603:10a6:20b:486::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Wed, 19 Jun 2024 09:01:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Wed, 19 Jun 2024 09:01:59 +0000
Received: ("Tessian outbound 43598937069a:v339");
 Wed, 19 Jun 2024 09:01:59 +0000
Received: from 043f9545d4df.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E3E8F6D-809F-4F3C-B4BA-D2494AAF358E.1; 
 Wed, 19 Jun 2024 09:01:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 043f9545d4df.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jun 2024 09:01:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS4PR08MB7456.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Wed, 19 Jun
 2024 09:01:50 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 09:01:50 +0000
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
X-Inumbo-ID: 986ac806-2e1a-11ef-90a3-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gEsJ6G2y9HNJVn5SfkkJvIJyQjf6CFt5s5hf8dUFcgsOC3HyVmokWfoZ4myla4bD0pfGQ0maqgrE38WHSrIly90mzOSJihXHqCoAbEeEPX4XU1BSplhCkKasSRcT6x/hmKb0U1X6gg0Bh0Qd6CNElL9ZlKMU0zWnabWGVcHekLQkYSVSwVcXbHY3g/kaQFoav4P0JQTn7yaUL3R6+7LY0r7Yjrio98QzolHsX8Mko6QK3HgJXBY1JFbIvlvKyT6ZM0Bd3VFbq3Lfhmh8LBJ1FtOMJNduv4ksn9Ps6qWgyvsiOhCOi9Jdevc9QZatnlLcYQ97/9NbkkAnTeMyEDxquA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17QQVv9ErczK1oQcsp8u/TK83FSQzoafjA3Kjd6F1bA=;
 b=C216jVECgkdSqQ2x5ArORrTUOy07kEs6VzvOQYPmI09lSCSLYxUsCr51xeHURVhULJX6ZC6XdXtFggU9BbtFfCpDr+gMoZqKkCPqxZ4/LogYEo28uOrp0roJ4HuSkwoNlu8lniWBrT/WENk4hbFaaRmFiMei5qVtwbdzFpZ/7BhXRb740myLhPnRz8Q6SsjWyp/qkOKfHwQ9Hdns1vJhiEpSw1U11tsH+8DfgBpzYbwAvz9ZS3hV11yICKYbl12Q8REmj/Ko5Lwg5JfCzwdfAeGlRaGgjv6yz2xfkseZ9TgZkXF9dr35Xet4YBhx6pjsYeIMjnhMeV9lJ+NzyrExYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17QQVv9ErczK1oQcsp8u/TK83FSQzoafjA3Kjd6F1bA=;
 b=ejd0EhwbZYTN5w5EUQ8B/KYCiuB7XoDUoYaSfDSWpi95I2rU+axXyjjhg7U3dYq5j83TD1Z+J7sO7v9IYYlPZnzVHgNfz2DAeUyHnvf0DFY8bb0pERM2FAo+RLklkxG4r6/p7aB4T4D7DmE+81jNieGx0y+0KHtvyPxpCrywTMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf73b05ed890de4c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/psGmLUNgkQ+terNqBgJomWx4FVlDbK/g36hVKT2L8yqyDvK6gP62ETBP/QFsS4hlWzVjDTB6cnxj2G5RQouJFWXeC0JXA+NY7Y9cwcrO7MYbdOQneTle+ZLZVBTReiSQdEcvf4SOTyHLveglj8T9ZZqc/kWOK7MmooD5i/HqqFgD3C/n7Gm3zycqO2lLKXIFqFM384MMO81D87rWHgzXfb+87eKvBiWCRrMQwraeLhBr46+70rELg2wLfYIEAv3uiVwx12Fi7ojoPCeGUjNlXPX0ti9QVf66E5469gHLUyAZ2v3CDkzyIpbhgZO7S6Exne/x6HjWTPQ1CguptWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17QQVv9ErczK1oQcsp8u/TK83FSQzoafjA3Kjd6F1bA=;
 b=FOUk6oZERtFlu5wJ4IydJCe8aIuK0PeulXBqs9ekzTYjckFz1CV7TBYB56f0Z7Bu5CRLKvTAtHsy74PHMWgDWJVmS5QR3qP5+wabODjd/HmQW291BZgCklcUVs7RO7LaZU1b0JicR/4lxgab7tt9gTOxOorUg4KGgA8UFqR0JgcUWjUtsSSBEkMjw5f4vEVx73nv/GzbgA1LXEemLIUSyMfJeJHrEv8mMnmLUTnkc5TTT2tFoJiTci2wHivnLZ1wjgz/ox8RQ07YJjYBqzPZPxq3UbqmyinS+lRE+1CwT1sIJhXqCjRy4A2w4L6GtVZEM3QZm1Kaf4qroxdUK57DXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17QQVv9ErczK1oQcsp8u/TK83FSQzoafjA3Kjd6F1bA=;
 b=ejd0EhwbZYTN5w5EUQ8B/KYCiuB7XoDUoYaSfDSWpi95I2rU+axXyjjhg7U3dYq5j83TD1Z+J7sO7v9IYYlPZnzVHgNfz2DAeUyHnvf0DFY8bb0pERM2FAo+RLklkxG4r6/p7aB4T4D7DmE+81jNieGx0y+0KHtvyPxpCrywTMo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
Thread-Topic: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
Thread-Index: AQHawhSD1mJnwmtkoE+LLMyZ3OtgsbHOym6A
Date: Wed, 19 Jun 2024 09:01:50 +0000
Message-ID: <81B3426E-D92F-4EF2-955C-5375635DE1F9@arm.com>
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
	DB9PR08MB6588:EE_|AS4PR08MB7456:EE_|AM2PEPF0001C714:EE_|DU0PR08MB9876:EE_
X-MS-Office365-Filtering-Correlation-Id: acc9ffe7-9360-435d-1fb0-08dc903e7a57
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?IPPpDYXd1qky6bqRiXd1YXEAAPSPcUcyLymYBiiTGvuXERlrzqTYdtHkcKCX?=
 =?us-ascii?Q?hV9tpLggBCxNbj3KFkZalH0MkKH7bVqUGJElw9Puj8WLhq34DUh8vlRIN6gp?=
 =?us-ascii?Q?GNkzNPJ5BKi2QnXRK/niqsU4uemFZHHb5C9CZwleImr0DnadfcXIxhAvPgGO?=
 =?us-ascii?Q?6+WsYAPpZFBgGiUvUbUsJHK1BadMTChyVGwAea8ydc+LOOakovVbwjegvddE?=
 =?us-ascii?Q?1gPfgx931fV3eEW2hQtvvzEzoHp6Pui/w46K01jarTBkgEPjVucBNw8yXtn6?=
 =?us-ascii?Q?g0I9/9XiAt1IudEGsqiMh2ZA25uWrMmScFNY9q5Z978aBdbDAkeYS+MAcWVN?=
 =?us-ascii?Q?7/cGWlQBILXxFZYig97U1zGol+dSVmvnFQnmnl0H5VzChz1UQVJ+2sTIGe1d?=
 =?us-ascii?Q?CMxmMEg30P9nINfLpraOFkMaqpBLuXcYdS+9ORA1ihNpXnJAHDDShG+IX6ad?=
 =?us-ascii?Q?NlRYiM94T9LCov2PGX44sN2c7R0WnJVCEuBhk6bs2ebNj97TWQuxG15S+LwO?=
 =?us-ascii?Q?qDnEItpIOCvHYuTRmJkaMsOVSgGl2D8ggvzf2Q2rkl4jt/htFGjYqTvhJmSO?=
 =?us-ascii?Q?FzlQf0rN6ZnkZb2NxWvcAvtQrMGEAa4b+ccrUBnK3jn50h5mCoeRkukRFuoC?=
 =?us-ascii?Q?0xdJWgcCBiYvOEkkaLEvRmd8cV0TQ4BnXr38BGqxAV7Jgh314Mi4LCDyA3Q7?=
 =?us-ascii?Q?yVrrCZpzSi71YS/Z33NCrM7Bxqw4m+VENIYtbVEObvYx95qjHSmL3iqDFvyB?=
 =?us-ascii?Q?vi8+Fl+YBp4M15q8KcuUKkqMnFJg4uHlxRrSxmokrqyHriR5J+kXdE9nGKKG?=
 =?us-ascii?Q?2RQ5rTSsqZ85ygoN8Is9ChKGP9BR8gbbL3+CaTTfM89FEntJkdjvWsX6+QSJ?=
 =?us-ascii?Q?ahCyz31RK6sb3UMQmxVhDnB9FrG9OeAO555lniuJJKdjCQl9h88B06b0V8m3?=
 =?us-ascii?Q?uQr6pyQks6Bf2tMLTsAkP6GQaGcGcdUc0TbS+4z7+ppNWWI55HBvo/8dfEa4?=
 =?us-ascii?Q?bguJhcKVLfJjLxUffiMbGv0JjLr/QtwfTCnSykdNzyULRhohupKlirY2LJjH?=
 =?us-ascii?Q?5sR/1HQUEFHbWwPb5kum+mruyh/acXf1NRVnFWIlO/0AaLjKVb9KCZKtwO2t?=
 =?us-ascii?Q?Pq0p03l43IE8CWXcMNrC4AE6TTpDAAUurkHg4QI2ICeZ4yVLqANDwpnbZOTW?=
 =?us-ascii?Q?gh9TX+Cw1YIz8nc0tfilqJgAXhXgwGc5Rmhc76UVeQETXunGRBmmaX9EoohF?=
 =?us-ascii?Q?Fws3TDXSrJU/xM3v2WDtrss9egnTEokVuuE2vqW/DQkN/87hVhSNV7ylWhim?=
 =?us-ascii?Q?1oF49qM1oWthtbWhc8UEBNbm?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3574B2439F756540A8B759FD2DF87CA4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7456
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1dca6199-2edd-4de6-aa22-08dc903e74eb
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|35042699019|34020700013|376011|1800799021|36860700010|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eByf2QhGDno41niZxGnxWdULxY3kr91SNjG8jgbCSijz31WmBLipBC8AXf45?=
 =?us-ascii?Q?ISMN6IB+efpRZPB4MB6tLLnCHA5he3N75q61v3mFZRx9xU5LgOysYSaThtjT?=
 =?us-ascii?Q?s6ej5bBp3NROzPU/j8Ayw9CtCQPfTH0x3/i3weJpI/uVzxvjDCumf+O6R8X1?=
 =?us-ascii?Q?61Yt80l83/n+6TzYzlC1FQ+U5Ms0Cg/D71RRlxuG6+5q6FkPu4+VEHjAyOO+?=
 =?us-ascii?Q?rEpTd/qzDKJeN9sHSqDZdw/SZcjRvoFJT1QgVIx0xnqV8fTdplmDxHN00DNn?=
 =?us-ascii?Q?y+MaF+erqAqoJqKvFluKcP9PkkjxbAPjW72UnHXRQndzstl5H/Hm5LG01KoL?=
 =?us-ascii?Q?40cALchrII3g59hIMvNPk2sMISnZjeQ+Ui7mO536XrEFAtB7zrNRXae5aA/B?=
 =?us-ascii?Q?v6gSPBTaVe7bFW5U70yyroHiTHHnIAgU5TTleuMPCEnNG7mFGMxLm4nDs+qr?=
 =?us-ascii?Q?ua1iZg18puG9hrfDemQ6N821w+oLOP+6HmaITYwLFpMITun55cjMPAn1Ukfy?=
 =?us-ascii?Q?xUtVZT8cF0RLn/LLzy/kMlXnB42GLTKnsEtM+sn3nRPVtRsHkUb/DX3fYBhE?=
 =?us-ascii?Q?piTVaUEw5NrRwEvZwDCG0vdvRvbIaYs06qyMFLp00eYOv+qT2JvcExaHYhy9?=
 =?us-ascii?Q?ZDa8mTVj+ddOMWwk/jXHvYbawDY6xDfKcihb/ztcQ4/2f6fxQKp057WnCdC3?=
 =?us-ascii?Q?vGOh20qEE9fNLzHFL7OGwT/x56Ohg+Lw1O8RDHzy6+m1rgWrd35uOOnFLsK7?=
 =?us-ascii?Q?18tdoHX4Mb7o6IJIRwE0XNY9etgyrj/lh6p9rQP/0krj/eMCprjSlIfkzYSz?=
 =?us-ascii?Q?gvKCCHZhDPWvU61fKYiuKkWJhbedRtbUy2EHRwPIbM9AvgODlqpFXCl9IZ0m?=
 =?us-ascii?Q?PfQSwnbYsb13MHHBQjtl2r0YVegAbCJf3qKdw2VrGY6DEA+vJ2FWE4dRBktM?=
 =?us-ascii?Q?hWUz8lXE9YcjKmPR5GtGiNXCQkD5dxw1GqzDnm67c/fiuDj3hs7Idwn1ZcOd?=
 =?us-ascii?Q?uVBtBpZOMTOROj2MZlq6liPATODxo71sHiVPZ9yyu+3Gas1h5/IMnhAQhFwZ?=
 =?us-ascii?Q?68OGS0liQiZgNuSrNPGBVgOdgM99eluh2bXm4oP/VBUA4TzOvV5jwpGsR0A7?=
 =?us-ascii?Q?FCseXevNFUIUS+q0iAnpBXrT5rOHPkm7PLOKEpOQT1Xe+L3CLDcbi28lhJ8J?=
 =?us-ascii?Q?ZsNGZdI4OjywY7FZKD/ESW4cuYQeGFLmaTbqicPKlDRkljgU3+F+mtRKXITz?=
 =?us-ascii?Q?JFwRTVZgVNOeCCIEzg+x0s92bw4EhR0eieBBOXVp5u2lbP2JawoiT6egnqz2?=
 =?us-ascii?Q?RTjtqOKtWsiV93yTcOgCn5qaUf4Ot6t145fzij1VOaoYKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(35042699019)(34020700013)(376011)(1800799021)(36860700010)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 09:01:59.4045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acc9ffe7-9360-435d-1fb0-08dc903e7a57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9876

Hi Michal,

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

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

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


