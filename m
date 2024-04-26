Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2648B32CD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712539.1113275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0H2W-00052F-FF; Fri, 26 Apr 2024 08:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712539.1113275; Fri, 26 Apr 2024 08:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0H2W-000502-Be; Fri, 26 Apr 2024 08:34:40 +0000
Received: by outflank-mailman (input) for mailman id 712539;
 Fri, 26 Apr 2024 08:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYji=L7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s0H2V-0004ye-5V
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:34:39 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0670a56-03a7-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 10:34:36 +0200 (CEST)
Received: from DUZPR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::8) by AS2PR08MB9787.eurprd08.prod.outlook.com
 (2603:10a6:20b:604::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 08:34:34 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::1b) by DUZPR01CA0065.outlook.office365.com
 (2603:10a6:10:3c2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Fri, 26 Apr 2024 08:34:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Fri, 26 Apr 2024 08:34:32 +0000
Received: ("Tessian outbound b7675f20d34d:v315");
 Fri, 26 Apr 2024 08:34:32 +0000
Received: from ef299b9418e8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1327EF5-29D7-4AAC-9EA9-24782D688573.1; 
 Fri, 26 Apr 2024 08:34:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef299b9418e8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Apr 2024 08:34:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9150.eurprd08.prod.outlook.com (2603:10a6:20b:57a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 08:34:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 08:34:23 +0000
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
X-Inumbo-ID: d0670a56-03a7-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Q7hXQS1zWPlFaeBKodjY3BM9CTvE35+bFLQTVRU5/U5PK20Jvtcfwke9r5JvMgm/1K35TWZjF96dPiMtesplhqf0aM0R5eEtcsIRzuqtMRMZxWuCssZ2zHXNe2vcM15A0i5bkUyUTYvsYJqRcny1aFuMppYexI+LngROtmFsH/Na6OohM/vdcCcdMIcavKIUOODQCFlboH7lt+Z1yZHr1mDd25vFQbaM4JdzUTWe+mLbaW1LWQX+YXWBUFJeO3NLZRjRb6JJ9BuRhyQIFMtq2CY0GKHMIBRRYkj3Pmm2WzCRq4j1nSgRsqi5UqAAKzqGimGay+lmajbcRTo6N3s/dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkuM/TRIQefcUAM/UnQTpfPfnwdxOrboQa341g3Is3A=;
 b=ik7S+3t0ZboEdHl9HHVGc2ntpeGccwamXNtJPFI1dum3rW0twFeKG30gVfNP/xuMKphnhUntjql7E/aY6M1Tvj/jPHX38wZNDzdRNsDt66c3Ybzc7n4R1+hkTWT0cfuJsMX8ILYH5nZC++2K3OQ8lxXzTyzkb2x27UpHZIE8lG/n58ammuiu/QxsquDsVPFeia5J+bJhLoyaKx0P5qwtSENW9dA4l+g3Wx3jsAdhiHp4nPlKMCLA4xZZ28pmRoThS0RQVH9ZbtvdEzFrDo8sk2Yken9hXO9P/TtzQFGAxGMyAxdEE+y7y2uGgRr6/MSw5sBkIpwwc+WF7WafgY4xog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkuM/TRIQefcUAM/UnQTpfPfnwdxOrboQa341g3Is3A=;
 b=k5HhBH4vuA3SSAKawuJVzWl4WD2PsmU5GxKBP04PX6v6d2u8EkO4Y8a38Qg0lUBuVyLUMG8y0y9X84Xd7Joi2kptAyKjc4o0tKyjfV4QFkVfjP+wtyMRCyCujm2c9f8nYCaEkfWV0fDCIMHDNpFNwAx9x4lm6IUkmy46EcEzCQ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6750dff9dc6eba2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnmLRfFpiO8XyTyB0RUiFzkA6iU+M38G36aqe7vCQjIuWYUEKyGBQTJ8m+80KdeZHzjSwHXdR/C5lMf5dH7F8DHQnl8rmqjmRdDLDEmPkOlVYnflmL++GdShuEw0vbJk3v4UVegDRmjNLWbtZm6Gge+d5jpWH4545wiH9GhrU4rNZMVu1ZQUH/VmlR3rKNmqPSlArlHeVBcbmFFRtIkQmzpY2YyWQS7PkaXzKbEwcE1Dx40/8Ij9TRyp7BW7prGjZd4BQNC4LomiXY0iC6opw8wpAS97qf7I/w68ly0lHTItwRBr+rZm3zu7S/j4M0S+HHMtLFVuXYEvxcKjbbJVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkuM/TRIQefcUAM/UnQTpfPfnwdxOrboQa341g3Is3A=;
 b=DEp+Vcez4GOcD++IebjtBdMbSldR1hSYFI1F0r6nltbVjkeh9PsiJM9CLt2p+vFNA9gnTro+sCS17J0C4F+2xwv/zeG5FS3Q+47dDvJJKL23PMXkf/IqjMD2l+tA3Wm0aomUVxXdpeniRdJ0GkQ01OoLbhKQH9nHzN3nPiQkER5HQJILzD6hSbJFk4XBIHxBUM6/pmwEyx+ST9wQnDyBnPrrbzqhkSrQFDPrDwKHrb0zkh8yzbvp7HcgOTT2uQzWj9mMYYJuWBf+d44AtAGQ1XVu5z5JXL53ctzwFYC8LJi1VadFwt9qQ9YlcvwB0SNHxYoTU0Pjfs1qDjikRmZfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkuM/TRIQefcUAM/UnQTpfPfnwdxOrboQa341g3Is3A=;
 b=k5HhBH4vuA3SSAKawuJVzWl4WD2PsmU5GxKBP04PX6v6d2u8EkO4Y8a38Qg0lUBuVyLUMG8y0y9X84Xd7Joi2kptAyKjc4o0tKyjfV4QFkVfjP+wtyMRCyCujm2c9f8nYCaEkfWV0fDCIMHDNpFNwAx9x4lm6IUkmy46EcEzCQ4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, Alessandro Zucchelli
	<alessandro.zucchelli@bugseng.com>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH] automation/eclair: reorganize pipelines
Thread-Topic: [XEN PATCH] automation/eclair: reorganize pipelines
Thread-Index: AQHalxT+g/fClqgaI0iwNGAhwN+Th7F6Ot6A
Date: Fri, 26 Apr 2024 08:34:23 +0000
Message-ID: <6DA0DCCE-6638-4F9F-83DB-A6CC1ED91BD8@arm.com>
References:
 <fe1fe9c964d1f2ba3cb46cbaf798cf698f341386.1713885065.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2404241704430.3940@ubuntu-linux-20-04-desktop>
 <74f86426-b3bb-4af7-85ca-15851acee6fd@bugseng.com>
 <8be082b6d22d61c0b14910680d3833a7@bugseng.com>
In-Reply-To: <8be082b6d22d61c0b14910680d3833a7@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9150:EE_|DB3PEPF00008859:EE_|AS2PR08MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 56011a2c-2eea-460b-0ec4-08dc65cbb2a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|7416005|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?OHP6mhp7VnWHE+OQrFkMvSfyS2Yi2F6gGIUf5MgrU7r7ytgRTRZLvruIilbU?=
 =?us-ascii?Q?C3bSVzK9VWuaBVG13nXSQt+GdmsbdVIElcUZzAmyL8G9t/E8430zS+V5HIOs?=
 =?us-ascii?Q?Z2h3xueqw2QY82ICjFpAXNvCaukY/WcTNEJKJtkrjBEUC0xhPaFIAUhVIyvn?=
 =?us-ascii?Q?WmO3YbezhKY6BLxAjRK0Bh8rqMciUvuO646izjsqEr1IGFYKwjNBFWXOx8J7?=
 =?us-ascii?Q?sAjNRRTYW2LinOOuBuaAzvhEeLmO8uP4y/a0uaqF/4NOUr5DC/cz6Pie3wJ5?=
 =?us-ascii?Q?W2GwIXqlm0IrUn0jw+FTFtGG07ft6s4zmgVzB4t7MdlVhciat5ATQSaMXRrs?=
 =?us-ascii?Q?2F8D5DVQ/OI+Ovm1WrFwK29b25XAPAxYg/0SgiSZxxKXixeAJ/CeP5NDw6Q2?=
 =?us-ascii?Q?GtOpsIK+fnQyiTS9q0h9IHvzWBGYPYqPD2gba1Uyw4yJlrM0WuVq8JFZMf3e?=
 =?us-ascii?Q?EsF6q8yhQ4mZFvwniNR1iBHvcESZ7Vv7pzQ629KJRocSxIHBZ3NzxS5kUXNg?=
 =?us-ascii?Q?bTx/M0dfWjPm+qhkqPuIorvMQXfoWUQUzHRkowbMoPKcl6UJBELXkxtSQ6qT?=
 =?us-ascii?Q?fJS3kl3E5Qbfy917L68WgZh/4kZraT8szUKkWb6esu5H2zPLjGHt/6pcS9F5?=
 =?us-ascii?Q?rzG4kVfmfpoLIjY585WpamDU/Fr+O1RRDCTgEPmk8TipqZAJgP2wRZbfqhAb?=
 =?us-ascii?Q?MW5XgmRIc07YDXe4zlMv8M+SAakr0rGU3VAYx5+Di1pxGRSOiM+BmcwfU7B/?=
 =?us-ascii?Q?441y3Lu/hI9e083gOI4q4bjCCJKh6kvL35zQtQZNTHea4UJWfJ1gst+nwuE6?=
 =?us-ascii?Q?HBhfCIwCCuZ5Kr9A56HnI8s+9P0LJbXVMBEG7A2pbbthMf6WQ8w+kPL8Au1K?=
 =?us-ascii?Q?hrX5U5SLsNgQVUSl7m7wyQpWvG5r4OaA0aeucBG6rhFBtjIJXDFUOwvOxOSF?=
 =?us-ascii?Q?iNTEtaZZ/srrHfP24kU44y64bSK3aWs/IdweldEzpSomKUo1oh6O7zTo/I2W?=
 =?us-ascii?Q?VMNwCPNbbHL1TN3+ncDnnT1QuMv24aojKMzHt+u2D2C7N0vPu/zOBgpe+Alw?=
 =?us-ascii?Q?eYi91pKSwOve9mNAQhQMtLJRR7lzhvtA5WpOpVHmVIjSRb4m8Z524svbgz9j?=
 =?us-ascii?Q?Zw1XKWR4xuUnxwnoMmOR8PAAaZ8IPJR75T34/JL/3UZDfxXT/N0qGm8Ji8pm?=
 =?us-ascii?Q?WqUgF/Q+I8ABBscwk6SzLo0UygUJGsKLv34dZ+R/py1GCtJUH3+Dmoze4on6?=
 =?us-ascii?Q?66WLDIuSJqaDqwJ/LmdAU0xjSJfPqcVRVNXJFoi25AXmwQAOvhZYqoRXRaYP?=
 =?us-ascii?Q?ks9s8IhN905sm10C+kWCzrBBvASZgvlk7m6VbnHtVkGeng=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <72F034DE7FEA5C4EB85F6D70BC7C5F1A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9150
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7fcb7d9e-6341-42f7-e8d2-08dc65cbacf6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+WWMONhwsBudmdUxQWSQjyU3de1DSxgmuJXP1OZ83v+rX3Th6WCzV53DbAiR?=
 =?us-ascii?Q?bxpH7Eu9UDLPHAJLEApHrNhxQh25dSGaX7HJ9lIrf5lhuDfuDs0TIZ+SuO9G?=
 =?us-ascii?Q?E4R8vr7tEDjNi6w2qnXdZ612hK1d58JyZGVn7RtaFcdrCYzVb3a82MbhIKt7?=
 =?us-ascii?Q?eXxK4O4HBzn4++Vx4Ccn6sH5M0n7vuAn51owx8kcb96RT/aVp9OUdb+ATUZp?=
 =?us-ascii?Q?fSa0l5Nqi3RxT+igvZ0OcRtZmLpD/1Rn/VFUArxfpZgyWYT81ioDsDoSBSy6?=
 =?us-ascii?Q?q5xGAcTl39EnaRH7155CoskHNfdMC2vezNWwDRYmfj6wRMULhjcUoIhjvGZI?=
 =?us-ascii?Q?fk9gWEh2o+uW9OVJkUfqoLt65Nz0+VEVR9T+Ajy2IDV4bXxLZrk+/R4gl6Vy?=
 =?us-ascii?Q?00Nnkx6A+qgCvwPkmmUorEH2zKeP1uGsPCAeHlr2ZuvcgSwhPhO2LeNACpTQ?=
 =?us-ascii?Q?HZYTq2V27sQtUFJDMu9U/B8cXSpYxKVGpslBsyau8s73cXDoRneag1MxkkAs?=
 =?us-ascii?Q?1EDf5qmW0fQPvbgYYo8/AZI2Oea04jr9kEHYeXaxL30wrShsfaM2Yp//9Fj5?=
 =?us-ascii?Q?2W3AellX3h25p0/iLwqzADzHGtbuylJHk/RTSnpw1yVvUIEbhUw4NnGIpOfu?=
 =?us-ascii?Q?2Zj9wTAkrUcnKAsTrM0u4tGd+SOB26RL2/e/xF3F11xTlMNJXUEf56BjQSCj?=
 =?us-ascii?Q?y5QCY3S36D5DrnYgwLOMKxvsODol5sKmu6XoxI9RP9mFx6/DNxzCZwYWGOaZ?=
 =?us-ascii?Q?IDlpIP5fYh1bPJL5MnfrwdSTTr/x1hJusyyJxY4RHOW2rhLw49zarAT+fHFU?=
 =?us-ascii?Q?jY5PO4Yboy7dUhCqytVU7NyCqCeXH2+mQxi3lQe47nTlm3PBdQpjc+CeKABV?=
 =?us-ascii?Q?oYROxU97M2VO2PkVAXHsxS6R5tfZ9a0QIXlg3BaMb4JWdsd5+WxCa4+HhJBv?=
 =?us-ascii?Q?UDa+QQpHgWflpUtE/WaLUW3U+9d9WIBpycZ8PWET1bBFqBLwn9g34cMBDjUK?=
 =?us-ascii?Q?8ZfZNg2ZuW5CVlrnFfjGlSWgpBWe0N1k1cyHlrfq5Twp0nAWYChnnxXUjnyV?=
 =?us-ascii?Q?rKJbXBySEc8my4Gnq5YMlNTEXRIWXtPyMggji9Y1+yt7TwWzTZUtX5+mfPHT?=
 =?us-ascii?Q?WS60RvDIXAH0qy0lpiLH6lZv9BB8pibP0g/g7JhoQyQKv65l37zdrXnKIoB4?=
 =?us-ascii?Q?CAreTQ1LKcEVm6fGp15uLPSIXun7UWa6Zza05f/37SIaubf0zHdmNeM8tY5P?=
 =?us-ascii?Q?ZSgvhi7wsYj4Eedsq/8s/hyz8wlRmy+fobdUGglxw2qR4BIpyyh+WOStvanD?=
 =?us-ascii?Q?R+K+IRQlxV5ZnV+dZVlaoLuJE7UlkL45RfBmrVuEHRmCNxjiCn85j3E3txY/?=
 =?us-ascii?Q?8j9OpQBMGq2QvHh72R5GGq8puwN4?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 08:34:32.9630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56011a2c-2eea-460b-0ec4-08dc65cbb2a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9787



> On 25 Apr 2024, at 14:32, Nicola Vetrini <nicola.vetrini@bugseng.com> wro=
te:
>=20
> On 2024-04-25 11:40, Federico Serafini wrote:
>> On 25/04/24 02:06, Stefano Stabellini wrote:
>>> On Tue, 23 Apr 2024, Federico Serafini wrote:
>>>> From: Simone Ballarin <simone.ballarin@bugseng.com>
>>>> Introduce accepted_guidelines.sh: a script to autogenerate the
>>>> configuration file accepted.ecl from docs/misra/rules.rst which enable=
s
>>>> all accepted guidelines.
>>>> Introduce monitored.ecl: a manual selection of accepted guidelines
>>>> which are clean or almost clean, it is intended to be used for the
>>>> analyses triggered by commits.
>>>> Reorganize tagging.ecl:
>>>>   -Remove "accepted" tags: keeping track of accepted guidelines taggin=
g
>>>>    them as "accepted" in the configuration file tagging.ecl is no
>>>>    longer needed since docs/rules.rst is keeping track of them.
>>>>   -Tag more guidelines as clean.
>>>> Reorganize eclair pipelines:
>>>>   - Set1, Set2, Set3 are now obsolete: remove the corresponding
>>>>     pipelines and ecl files.
>>>>   - Amend scheduled eclair pipeline to use accepted.ecl.
>>>>   - Amend triggered eclair pipeline to use monitored.ecl.
>>>> Rename and improve action_check_clean_regressions.sh to print a
>>>> diagnostic in case a commit introduces a violation of a clean guidelin=
e.
>>>> An example of diagnostic is the following:
>>>> Failure: 13 regressions found for clean guidelines
>>>>   service MC3R1.R8.2: (required) Function types shall be in prototype =
form with named parameters:
>>>>    violation: 13
>>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>> Fantastic work, thank you!
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Is this patch safe to commit now? Or would it cause gitlab-ci breakage?
>> Yes, it is safe because the ECLAIR analysis is still allowed to fail.
>> Committing this patch wouldn't break the CI but it will highlight some r=
egressions with the orange badge and the following messages:
>> arm:
>> Failure: 5 regressions found for clean guidelines
>>  service MC3R1.R1.1: (required) The program shall contain no violations =
of the standard C syntax and constraints, and shall not exceed the implemen=
tation's translation limits:
>>   violation: 5
>=20

Hi Nicola,

> +Cc ARM maintainers, Luca Fancellu
>=20
> after some investigation on these regressions on R1.1, there are some con=
cerns with the current code:
> 2209c1e35b479dff8ed3d3161001ffdefa0a704e introduced the struct
>=20
> struct membanks {
>    unsigned int nr_banks;
>    unsigned int max_banks;
>    struct membank bank[];
> };
>=20
> with a flexible array member at the end; this is well-defined in C99, but=
 what is non-standard (a GNU extension) is having this struct as a member t=
o another struct/union in a position other than the last.
>=20
> This is still supported by GNU (albeit reliance on this is undocumented f=
or Xen), but what is concerning here is the following (taken from [1]):
>=20
> "A structure containing a C99 flexible array member, or a union containin=
g such a structure, is not the last field of another structure, for example=
:
>=20
> struct flex  { int length; char data[]; };
>=20
> struct mid_flex { int m; struct flex flex_data; int n; };
>=20
> In the above, accessing a member of the array mid_flex.flex_data.data[] m=
ight have undefined behavior. Compilers do not handle such a case consisten=
tly. Any code relying on this case should be modified to ensure that flexib=
le array members only end up at the ends of structures.
> Please use the warning option -Wflex-array-member-not-at-end to identify =
all such cases in the source code and modify them. This extension is now de=
precated."
>=20
> It looks like this option, and the corresponding deprecation of the exten=
sion, will be available starting from GCC 14, so this might impact future c=
ompiler updates for Xen builds.
>=20
> Linux is also concerned about this (see [2]), so I think the changes in s=
truct layout introduced by the series [3] should be reviewed to determine w=
hether this change was deliberate or happened as a byproduct. If this is de=
termined not to be a legitimate concern, then this can be documented as an =
use of the GNU extension.

Thanks for letting us know, so the change was deliberate, the effect probab=
ly not, I guess we need to find a way to fix this in order to use this inte=
rface.

Cheers,
Luca



