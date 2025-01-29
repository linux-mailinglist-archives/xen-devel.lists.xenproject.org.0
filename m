Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C5A220E2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 16:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879227.1289449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdAJa-0000vn-RG; Wed, 29 Jan 2025 15:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879227.1289449; Wed, 29 Jan 2025 15:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdAJa-0000t9-OW; Wed, 29 Jan 2025 15:49:18 +0000
Received: by outflank-mailman (input) for mailman id 879227;
 Wed, 29 Jan 2025 15:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Ogr=UV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tdAJY-0000t2-Hw
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 15:49:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f403:2613::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9729d633-de58-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 16:49:15 +0100 (CET)
Received: from DU6P191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::16)
 by PAWPR08MB10923.eurprd08.prod.outlook.com (2603:10a6:102:470::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 15:49:11 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::b6) by DU6P191CA0059.outlook.office365.com
 (2603:10a6:10:53e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Wed,
 29 Jan 2025 15:49:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Wed, 29 Jan 2025 15:49:10 +0000
Received: ("Tessian outbound 7a81a5980674:v560");
 Wed, 29 Jan 2025 15:49:10 +0000
Received: from Ld9bf03250bcb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1756614B-F63B-4733-BE26-C352A8EEFCF5.1; 
 Wed, 29 Jan 2025 15:49:04 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld9bf03250bcb.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jan 2025 15:49:04 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9353.eurprd08.prod.outlook.com (2603:10a6:102:302::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 15:49:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 15:49:02 +0000
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
X-Inumbo-ID: 9729d633-de58-11ef-a0e6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=snS/l2/0zd7Ix6qeqnD2ADtX8x0Vo7WYquU8qfHvW+dE3U+upK/PLeKFkO0kNQYfF8RcI3UP0FxCMF8UgQo4fJ0lsQRa+Rke74/i48Bl1NWBr2ATl5854KMVj309dBbrT/TMknhzfVs4ajVzJB0nMJ5AWAkq+IFiIFm3bEbf4pD/SrRjRGwHrV9MPtymVsKkDLFEw4wKUBi3e1yrtwNkL6l0Sq9WelGdWLvlKiAEgi5hO31RKxJliBVLvbfIHjDjNcC683jrhDQ33lIr7gspGFIZp4pU8LnFxEw570DYrdu5Rvta1BTUiKTVCrh8oEvdNhYkcpEeV7fWyK7vslPiVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zio1Ob2iOtULBNc7H/FdduLNVGHP14O1EMaJZwRvXJo=;
 b=ApZN0zp/o/PZcWX/0KMI641onaacFjyltJMkh/EUuYMm5peY/zqXzjZ4iwaiMyngEoc28O9ZD1FvsFMlA40eArx5yU2flrkXoHO1HVdH63p9Zs5nP5XiPannoeRjCH4ENC5vUFh34BFkfzmOOPxVpqVMTfpOTRZW/aWnpp6yWBtLK2Ro1WD3Ra/puImzYx+/cAJFBTbgE3OsBWrMfycbkGIu5Wxl4GZLoOwWFSegmbRpQADHl/zDafhTQ66oem7hLb+vF7FgKsU1MUAvrpNzRedVptbpS5MjqNZgr9MSSRRw/PaoZM6vYYSEdcJstvD4hSc9IVIM23hliWdpI0PPNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zio1Ob2iOtULBNc7H/FdduLNVGHP14O1EMaJZwRvXJo=;
 b=LLuM/35pKCZ1B3qJdNOmWgFtC2VL6DMofjL95qO8fTWc/xcG1mZlcGKjmPeXXhxrHuV2mBh40jfHcexgudPM6qVCV+9mFf6KyrDaopT7dHF5ZL/tgemEKA9/HJDYUl+lIs+QJhLYCSf6mPD6rh/eyYe1psmTUErEge3aFRcGWGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b592fee4e6f6e6cb
X-TessianGatewayMetadata: UTD8kXsM+Ha14pOPiGndl41VaC7f7v4NmGZpxuw4hM6ukedXrKaCqasRjdYrlxkqPrHYrZd97BChFgaLlamRKroSKh8EYz5ysaSxX0xOBElE3Z8S3UosWckRPvWhXjFy6trk8CMur7g96XZVnWuMrwPtc0umYPz1PeOEVnfVmxs=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLY+PPtsaLG/em6OUlXJdsgPPQKrptlWgx7XXy9qHdWmdGhbubsgufjHsFPNBcIOpbYlg15/FwMIB4XjK5f5CmQ9oj0hrmJgN9AMCtb9FI3g5bDm2HJfYq0xVFQ95eQViHoQ9oYUrm5z6I6Z90qPwM7AcJ54zKFBTc+NQGSOe9b/u8CaD4xn833Wuc8oTTappaBJpNQ5mL8I+q06NeuNQYUWP1fe0W72nDTwgArVeWTzCCFNKsxz6nm1Ug3uXnbzsamPn3DeLVDKVkk4jb9m/01mmJY1KKcJayN2/NJE+S6w4KNoZ6VFSPCU8c6cl8/cHH1q1scpanek3qMqjIRxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zio1Ob2iOtULBNc7H/FdduLNVGHP14O1EMaJZwRvXJo=;
 b=o2l60IjsY/efWOa308SYogTmSzHqTCr5oCRb/Oo3o2XCInmmS3Fi9JNNN4TVrkS8Ruu1xfDw4BJ3Z5bcTwoneSUwS+jd+xAq+d3m4TQ6CblTlNeLdyfbB5OuWhmQI3NboyPhDLgmCeAarZkSX2opARGxZufV50ex/yrh4UVqn/qknQJ/Wzgb3mfUswz9jfAN8ICh5qY4Auu35D8AplgYBVASYYuhd9BdnbCYYH48p2t7qPe1eW8WhkFgYMQ+FLRvzuIv7P+E0v3xwkKH92SvPZEiSKc9USqff1spFX+XfTd6Rw3SoNHpflzhV/EVKykgPr/Tk5qguINO8Dq1fOix1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zio1Ob2iOtULBNc7H/FdduLNVGHP14O1EMaJZwRvXJo=;
 b=LLuM/35pKCZ1B3qJdNOmWgFtC2VL6DMofjL95qO8fTWc/xcG1mZlcGKjmPeXXhxrHuV2mBh40jfHcexgudPM6qVCV+9mFf6KyrDaopT7dHF5ZL/tgemEKA9/HJDYUl+lIs+QJhLYCSf6mPD6rh/eyYe1psmTUErEge3aFRcGWGo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Topic: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Index: AQHbZr2QpA/avZzDqk6Vb2qnMvbcCbMt+LgAgAAEYwA=
Date: Wed, 29 Jan 2025 15:49:02 +0000
Message-ID: <E930B9A0-6C32-476C-8829-7FD4C991F4A9@arm.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
 <CAJ=z9a1ynFU86ac=1Q7i=xSNh2bjnZJ3+tPjsjWvfw7294n_NA@mail.gmail.com>
In-Reply-To:
 <CAJ=z9a1ynFU86ac=1Q7i=xSNh2bjnZJ3+tPjsjWvfw7294n_NA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9353:EE_|DB1PEPF000509EB:EE_|PAWPR08MB10923:EE_
X-MS-Office365-Filtering-Correlation-Id: e168b4c4-f9e3-44c7-9329-08dd407c7917
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?oq8DbMpGpfmKorYANWkKjIJlF8S+UA5MZ+Na9V6kXM5J6UhNCCOt1AhQGCXM?=
 =?us-ascii?Q?TcxCl5Pxfn92OTssJZKJZF0S8RfxdRiautEaG4cAWdqOC95P1PyJ6MmyHw6p?=
 =?us-ascii?Q?vMPwoFO7nWqALTgV7M8GKcBG0MZxt9h4DlXdLHmC+/ow2C1mkHyVbUH6Hyyo?=
 =?us-ascii?Q?/tGDip5yLEMAJ+YciKVYjt7qZZyuDSoX2/hYTRAlxt+2JiqTdzNzdABtaMvz?=
 =?us-ascii?Q?Q8h2uZUXpoT/zgWorsUKgPskkU8VXH/P2tqiNolgLsAG/kih79c4t2j68KP1?=
 =?us-ascii?Q?FOKKN0Xi+VOPQRIH+nKmhvAo1cOZ9B9aAWlOJdyvmxLMQvkVvvdxvsXBrMUf?=
 =?us-ascii?Q?TaTmB/a5XDjh/tF30FijMXU8VbF2OLsggzTepNQZ66Nz4Q1bVmNDYvlzJke1?=
 =?us-ascii?Q?07dYmvY7rQ1+CsGyULFqZ8HBGaXw1NcNoTxPbbT+pLHV38odLiD+MkjMlGRi?=
 =?us-ascii?Q?sxhorTmmnawMyMmSQELMfQi0cRy9n8Aw3uQgcBYCq7mhhe0xPbt0K5uq6G9+?=
 =?us-ascii?Q?U3gV7eCxYGoeYNh5d5HcVskH/x1+tqUgUKPP8KMs61kYni07JFeZX1EeaF6/?=
 =?us-ascii?Q?7vvJrvxYpI1hi9LV42XVi7Rm1VGTELaiqcFv5enVjy/TRBlAb0lnF9bp9eP4?=
 =?us-ascii?Q?vZzULvN0jCLCwZS1UYCO86f9Lr9ro81kvOJlGf4fHnTlmbeI3EFkHbppiaHc?=
 =?us-ascii?Q?VHnG7ztNO5UwBmRdPVtn/gjA6lgUyrfYoEmQ9QQUQ4Vw7055L45Om9hajhth?=
 =?us-ascii?Q?TPXXyMnIjgeY9fvLFc5QK0SXJTk4xmZiJ5it54FYLlzqVWpCZpG9Vc2mP0Vp?=
 =?us-ascii?Q?TLKWwNI4NjUsU0Rcq9u4PG/6p0Yy5Pv6R+cBCzpyy1xf2iaWdYrQvIXYFkeL?=
 =?us-ascii?Q?upgNEmX2KmhNrCIKvT0p1JikSsL/alRRUViHD4MlvHwRG1fMgDz/FbrEj+QF?=
 =?us-ascii?Q?5v2nydppADbohA5fZIq3fkhbZWrmWgEvIhqaHNBrds13pB2h3PswW9O90Ono?=
 =?us-ascii?Q?4a149GMCDPgoFwWgaTFdTMUfu0d8AtvrDrqkA9jSpFyIe/WlpLRjalDb9coR?=
 =?us-ascii?Q?lJfbNYtokTWhsfJUVBgm1VawVp6E72fJSOHjfLi1M1CF/ztTLHKv2P0M/k/p?=
 =?us-ascii?Q?2uABPnFAYCS7bn4ixEQ5Va3nzYohsAvecrR72WZ1sFJyWEAadWdPINXRnapw?=
 =?us-ascii?Q?c3jZKb440lQ6rTcUXaNAmx7FWNrjHb9PEDbo6GWrfncrCYe7YI61J5Js2C3l?=
 =?us-ascii?Q?z+BmB47GA7Jo8SA2bZ6CGchTZpwfQstZ/CqgPpe+PPaPSnopO3UlXT30OX1w?=
 =?us-ascii?Q?7jrp7e+LmPbqXZ1R5fixLVLEyIo8wmCgQzuWOQ13fCutL6BeTbpFHGp/kwTb?=
 =?us-ascii?Q?IX4YUaekR0qQZu6ntQloz49txcF4q6capC65UEMZOSHlM80wPhjXTkCyfF9b?=
 =?us-ascii?Q?qbOggNoCvsfnj+xS7jcO70F2vsnw5lD6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3429C3DC1010E245A0D22D2A49F82C59@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9353
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1cea7836-eaf6-48bf-5126-08dd407c7424
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35042699022|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AIMVRPC1NljhIAQm5trCqPhkxR2dCAoDtX+KWpCzZ3jRPsTvABEWEKz04Ya+?=
 =?us-ascii?Q?Bh6bxjWa1ldgUK2QkJu12+yYZaaarWGw69g+lm8av0v+wbzx3S7UnaHyA1vr?=
 =?us-ascii?Q?rDkPR3pUkjXLpCk2KKSMT4baEvuuzvW/d1+o82muiMIg89z8ologTe+A+K2U?=
 =?us-ascii?Q?3K6d/cSgqpfoc99FsijwgLXSgrHafNp0CaEFYbC+i3/p296l2dQGP/Po34kj?=
 =?us-ascii?Q?hxj02FPO45Qr83L7dz5+0Fz9aI74Nr6DqNYJi9jSojroXHpijB5V+5szonWz?=
 =?us-ascii?Q?EElZoapcXAqvXo0rebKH8dW8WzLHvNps/9zpU3M/J47RS966m5a9vvPoFayl?=
 =?us-ascii?Q?ijRDxMO4USROD8Gn2VuIwYIUQ2For1OHk45zNFgjL62ZD99vlyAMKE/OX0gp?=
 =?us-ascii?Q?006l4egnw/RGQQIRnE8C8zJ31xVNYkvePSLSW0jA8ToP0lWw2U3lh5F7nmom?=
 =?us-ascii?Q?IdaovNTz+sTjpE2NtH/Kx0zFcqFCKvx1VNkbdu65q3x8/akyueO2WvezizC0?=
 =?us-ascii?Q?Mcoj4MbyEYktaEwDkWnZQxDJHeUZtyWGRuLNo1PuNyv/qkH++s4CDRuRi2D3?=
 =?us-ascii?Q?hgzzZdK8kSqe1sBG/p/MhaAdBauO3LVEHx7HL81O3Jcw2Y7XkNkdUHWSRTIS?=
 =?us-ascii?Q?krnzkXUlxOO2AB5V0pRV7aMMfTE9Rz/X/1zgar/rGymj6zZTzPzM52cKmvuH?=
 =?us-ascii?Q?hE3/mQpfyaltKyIHJbEy23iqZMQJDJBeAsxIUctAmWu0h2gnx6zS21Q7ZLEA?=
 =?us-ascii?Q?sPToRJiqQYFpq+yTrMBFo9kDLG06zznSqSHBUEUQamcE3tHk6nvtZskJkuLA?=
 =?us-ascii?Q?+yTg6k58314rTvELEecIMPDwHmjx+bKG/H+Tnqp5CrInA2JvzuAMNjdYezeH?=
 =?us-ascii?Q?C84XFk6qQ8KY5AkdHz0RROneXQiT7cPeUAB1hx63J6uErejev/iAqA72QfC5?=
 =?us-ascii?Q?X4qFATDjkyfgSdEB8XeqleEZjbwS6ndX10gSky6aSnb2f+uGolj9C8vm6FDm?=
 =?us-ascii?Q?Sy7iFMdpzK/ty3Fb9FIv0zwPAtkJglM3EjKPoLOr0I2Pby8p30zCHtt66l6D?=
 =?us-ascii?Q?7EkEmIOe0VQbspD4tW9Zbu86zW+UBQRKSAj/edCHfq/KOtd+5tvTZz3LfKqC?=
 =?us-ascii?Q?eyGa3++46eh7+s4yXufcGnk2bo0yBBM+bFvX0SwMmT8s0qQ3ZFYmtNBBxGaQ?=
 =?us-ascii?Q?yvP4kNRSNRuGUAvRbg7vtzlUCKkQ07tNbbHexGpBLVfNJg5tmRxIjMxBmwkH?=
 =?us-ascii?Q?IttuinbMfp6p94dny+VlMbrdZmS82W3DSSVB7gC3TY5RwkhHSK7o/usF3EOB?=
 =?us-ascii?Q?5a68MHVHChFsW/2T4MxLyrTmWya+c3gWlp7hEvi7rl1K399pUsEQf6GRNWi6?=
 =?us-ascii?Q?x6drHxoUFaeVstUxUT2WF8/ImwvaiE071F3Fx2QcZKOofCOJubTOZb41Mkc7?=
 =?us-ascii?Q?Mc+3AF3bpIHKKvUxnrS+e0NxWnVtWOmUig3xZ4xa7yMnQxDo59LMl6JaqJWC?=
 =?us-ascii?Q?UIkskuUSLbqwfeI=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(14060799003)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 15:49:10.8032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e168b4c4-f9e3-44c7-9329-08dd407c7917
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10923

Hi Julien,

Welcome back :-)

> On 29 Jan 2025, at 16:33, Julien Grall <julien.grall.oss@gmail.com> wrote=
:
>=20
> Hi,
>=20
> On Tue, 14 Jan 2025 at 16:50, Ayan Kumar Halder <ayan.kumar.halder@amd.co=
m> wrote:
> We have written the requirements for some of the commands of the XEN_VERS=
ION
> hypercall.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  .../design-reqs/arm64/version_hypercall.rst   | 33 ++++++++
>  .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
>  docs/fusa/reqs/index.rst                      |  2 +
>  .../reqs/product-reqs/version_hypercall.rst   | 82 +++++++++++++++++++
>  4 files changed, 182 insertions(+)
>  create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rs=
t
>  create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/doc=
s/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> new file mode 100644
> index 0000000000..1dad2b84c2
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> @@ -0,0 +1,33 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Capabilities
> +------------
> +
> +`XenSwdgn~arm64_capabilities~1`
> +
> +Description:
> +Xen shall have a internal constant string storing "xen-3.0-aarch64".
>=20
> Can you explain why we need to specify how Xen is storing the string? At =
least to me this feels a bit overkill. What matters is what/how the VM is s=
een.

This is a design requirement and as such it should be testable so it would =
be easier to have something saying:
Xen shall have a constant named XXX storing YYY.

Just saying "an internal constant" seem a bit limited here and not saying m=
uch that could be tested easily.

Why do you think this would be an overkill ? do you expect the constant nam=
e to change a lot ?
I would see more as an overkill the fact that the value is stored in a requ=
irement.

Cheers
Bertrand


