Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE7907314
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 15:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739974.1146968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHk6h-0006ML-Dl; Thu, 13 Jun 2024 13:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739974.1146968; Thu, 13 Jun 2024 13:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHk6h-0006KD-BA; Thu, 13 Jun 2024 13:03:11 +0000
Received: by outflank-mailman (input) for mailman id 739974;
 Thu, 13 Jun 2024 13:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r+0=NP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sHk6f-0006K7-07
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 13:03:09 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2606::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46d00962-2985-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 15:03:07 +0200 (CEST)
Received: from AS4P192CA0038.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::7)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 13:03:04 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::52) by AS4P192CA0038.outlook.office365.com
 (2603:10a6:20b:658::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 13:03:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 13 Jun 2024 13:03:03 +0000
Received: ("Tessian outbound 221fbec6f361:v332");
 Thu, 13 Jun 2024 13:03:03 +0000
Received: from 940064599862.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B967D27-3EE2-4E99-9382-AF3B89D923D4.1; 
 Thu, 13 Jun 2024 13:02:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 940064599862.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jun 2024 13:02:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9555.eurprd08.prod.outlook.com (2603:10a6:102:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Thu, 13 Jun
 2024 13:02:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 13:02:54 +0000
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
X-Inumbo-ID: 46d00962-2985-11ef-90a3-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I/NU2m9PmsKwwzf3+hVuHttgGQ5kD92te3JwAuJnq1/yD8Lg18B/Ry0M9LCz7483UHA8Z+C2DeDzPdl9eO1Nq3rQcVKeCxpBQ0mOBVEXb78KbBPggFErqX1k/qFi5LmlAQYlpEcq4/XP2qDeoUZa1KoeFcjdUCHzd5dVa0BSQsXjU/vWBScagezjTe+C6/LhhRQEI/euPNZi4iDO0O5peTsUzpqyhc/jGXQCkIZbdRrA5yUXgd25PUBNV2+DxUteFQ1FLcYleFNwYVVfZHYK1QA3S+5w14gGGNDXkGjFrrSQTCSKV5SJaQutH0LyXMNwDL7p3PqoMINd4qJ09r0qtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wit2hO10V1XrX9FpSsEGmKtI8e6EPJiPCcFfRW8Xkb8=;
 b=WIrwas9msiryzxjSico7g+L4NUHN6G2FiCYQDwYxzY8p8wyXISWQIc3dyfoWAZSw1D9WO8b8RmWCYKtRPjF8qBBR2QoBUxqMUHJEM1IzMoyR1hAJJTZJyCuCO6yGrcMPaFRDTZWyLsuO97kSqiWfznx2Pihcpj3nMSsG+B+SguT3oPXQ18UtYntRshpE3PxfkhKYFLQUVaaOTC3F63j/pR+54zMUoXM7+LzmrWNUrSxaJmVMJTsIqDmpmzUGu9HeUq77AbBtXX/gGvlHMaXDP93U3k+3mbIInT60feP7IPJDx1g+m9PyJguHP0oA/c8xQOhk+sk9ylr2VG7WJAcWcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wit2hO10V1XrX9FpSsEGmKtI8e6EPJiPCcFfRW8Xkb8=;
 b=P2SOx/jYYSffWVpoduUupvmEIvXOYfDkmLJlJmk54dNYT1sZS4U11sO92Pao+odLf1lHRrUmZu599iLzlPgVDLSaLQj07naeiJp2bV91kkKvoSEIisjCTQ1heVSDMNmmC3E0KiTtOIh9mv274ZqNj/KwIXqnO97jpwjP5Q1kqv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22364ac81a1ca692
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqHgm4t2P3xR6ViklXnLwlkmY9WbTSAyR3t2QewjbRIQ6ZC3VZusnabsgdopSGI79UIzLQJqNq4D+7mwOIg0zdnoGTHKiA/Wf6w27jznb0ArGXcRRtV0mtb+FDVTSkFMhLOq9gvkOcFfgLX6An4oonsz/kkdDWN9pJz7HOWMoGLtmFitGNwoCilvNBa8Kkgsi1/P+ELFqIBKptu+laJdPNePegHQyVNqk6sIzanqbJzLyITEw/8MzpVqxjhfLiHKe1+sHp1sbLHd9DLZgpwKfRIf5i8cNQYRsxP9n7n3pgcOTkhfnh+A0Ue3O0xRIMVXSqLjCovVn9xMofGFXV6OyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wit2hO10V1XrX9FpSsEGmKtI8e6EPJiPCcFfRW8Xkb8=;
 b=kzUZfkjV17tm+TtP1MhwTt+DuERNJv659PXUzTsYsowRrrO9GiRINv4LyxDBPgvGxX6wBcoyFoCHt0fXfXLYhrD40nhhLEZpLXjaEeKD6z/sknGDnGu1NQ2sOwPpUy5+A75SZY0I9L+5Ra4FMEOQ2h6n5bPa7XM5USPGv9GfeMO4oi3YDNASyGxpkTdNN2mZvLUT79dhhdJfpTo34yLQymBPiFFOZQJngXgE5Qj9nL6GEpywVvcTF3ZcHRO3JnVEC+tX0VT+v8wpKkzdQlyaCENrJkIm8cLmmAwYCZBaY+U0+gFg8hfTYXggnkSwQHusTjSfSB1TQacOkh2BDr5Y7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wit2hO10V1XrX9FpSsEGmKtI8e6EPJiPCcFfRW8Xkb8=;
 b=P2SOx/jYYSffWVpoduUupvmEIvXOYfDkmLJlJmk54dNYT1sZS4U11sO92Pao+odLf1lHRrUmZu599iLzlPgVDLSaLQj07naeiJp2bV91kkKvoSEIisjCTQ1heVSDMNmmC3E0KiTtOIh9mv274ZqNj/KwIXqnO97jpwjP5Q1kqv8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Oleksii K. <oleksii.kurochko@gmail.com>, Jens Wiklander
	<jens.wiklander@linaro.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v6 0/7] FF-A notifications
Thread-Topic: [XEN PATCH v6 0/7] FF-A notifications
Thread-Index:
 AQHauwL3zf/sfUoleE2hXc1GLXTtIrHBJtUAgABPbgCAALAvgIAAOhUAgANIXoCAAAULAA==
Date: Thu, 13 Jun 2024 13:02:54 +0000
Message-ID: <DBAF0EF2-0A4D-4F5C-9BD2-C8DEBB54125A@arm.com>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
 <3C40228F-21AA-4CBF-A4BE-1C42DE6E94EB@arm.com>
 <615f1766-253d-43dc-b0f0-f8e2eb7360b5@xen.org>
 <8558AEB5-2F38-4F8C-A017-794E32045068@arm.com>
 <6a255f3dccc609e680659ed05b613c21a33cfb20.camel@gmail.com>
 <fefb0ceb-0713-4520-b9a7-e37aa2f77850@xen.org>
In-Reply-To: <fefb0ceb-0713-4520-b9a7-e37aa2f77850@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9555:EE_|AM3PEPF0000A78E:EE_|DU4PR08MB11174:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a71c84d-530e-4385-b039-08dc8ba92905
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230035|1800799019|366011|376009|38070700013;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Ecf0VlpH76SILhrSVXmJjuBdUy41s1YHM4jYUdw6aJNfJ4o9Q+Okz/i2fjD+?=
 =?us-ascii?Q?O5CzatUW6GaKtS43OXwybTF1EDEVoePgpsyz+rjlhpVhCxKUJGVUR5ntdsSX?=
 =?us-ascii?Q?wcx9bt1hjiCLeVtK7FNoZVpRzudmzEHZu5knLcGND7ylJqXo7NUynBDvVKrS?=
 =?us-ascii?Q?4HLkVnqcqFkV7ABes77DPVQumlmn1QoEjnvBOXygLdLGm9n6jARnHUoFAnrO?=
 =?us-ascii?Q?A+ZgR3/e5B2UNmuwbkkclb9BSDZVPhQn6DtRHGymnolThX5DJ/DbxalK+3yJ?=
 =?us-ascii?Q?gKBmauRZsmSaVd/jzlPXUIWC1WlQNKGvxcdpIlFx3wK0DBSgrCURl/50lyeY?=
 =?us-ascii?Q?Nw7tHAyKJAA0E3RBoGyXbp15MRHFVGUXR3eyXsZdJGKGGozzpeodMUrhM6Fr?=
 =?us-ascii?Q?SWtXITXr5oMec1sxesRxaG+1x+ZmAzLHghiPDZHDWnKPB1rLwfFu7m3gAQ1k?=
 =?us-ascii?Q?m+lOmq0Sm5ldhOyigUQzVVkhxy7c/th4D9LcMnS8PGEeltm64XDlKHLmJT+C?=
 =?us-ascii?Q?PbBvk3BHK0VByMCFnMqGZtSTAz8jxGgJXfQ2gKAL13gFhnO7EhSORHAdq2RT?=
 =?us-ascii?Q?pw7gd0Uni8yQuQ5mD8Pw+wvUtP+SI+hGjHmrO+2hweBjGqpDhE8QIIo6J51I?=
 =?us-ascii?Q?sN4hC68jx6tO3Yo6RRyLkA5Ce0PqERkiZIJWoouqcSffKQk3pkNxA8uKS83u?=
 =?us-ascii?Q?tUoiBBcPhhhllQiFDPwVBG6Uill1KdHBlHQ6YCbB2vk1To6izIisuybzbXA5?=
 =?us-ascii?Q?JfmD5JH2qjkWBBqbnbDJR/svx46ZX50ewOd+dEL9bDUkZkzBeV9pdvcrQhb3?=
 =?us-ascii?Q?4MFiypOQybP6ks9WYwcCj9HDujCxjN22FiOaAinwgZz3oyxPYbDuGvIfTeJA?=
 =?us-ascii?Q?nfuujdZHs7xz67p9IXRMMqxm5gfiCBs2QN9m/K9zTNuO2dLhnguHqcn8+xSY?=
 =?us-ascii?Q?BctWIZEpsOZle5/DcbRNIjOVRiV6ghl8v5tR1k0dWzDSLhlZd9CAWeUMTEdQ?=
 =?us-ascii?Q?e0l5du1uXk0Zibx9wAZKWlq0QyBHZZufKE0gSi2v9gpDSdfalQHVodUP17gT?=
 =?us-ascii?Q?4befilxwMZcAiVRVLqESZnyqzCS2DykxA6zZnyyH3pBC1uCH3e30nHsWgA2S?=
 =?us-ascii?Q?wZUwioY9BNGUWCrzfgr8r+zxBL8bFmrNy8UWdF8lHRDKetFOtUZPwLEEFu9q?=
 =?us-ascii?Q?+nLv6AsoEofgrIoN+W+XWLctxx9ZfSmIdM40tu+K5bK+jov6R8PdB1Cg7JUj?=
 =?us-ascii?Q?e92DcqgSG7lOKwK6bW9mcJFnt7QnrR6gM/EvDKVEzjiY3pjeHeOBQkrzB2dM?=
 =?us-ascii?Q?UsKbzDzytw9W/DMWAqTGcN3dHGsWdhRu0HXBo/fMaDya3UaO4M2DxjwiaS6H?=
 =?us-ascii?Q?dXvTWx8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(376009)(38070700013);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <80D13C2FD1497040892C6256DCD85AA4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9555
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d61d2d05-28c4-4c79-b03d-08dc8ba923fe
X-Microsoft-Antispam:
	BCL:0;ARA:13230035|36860700008|34020700011|82310400021|1800799019|376009|35042699017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DordZGFqFPLUySKNP6DBfpxXR2IrlZH+yGYtKyJvz8gHJUZ5dYmzcGH+dTB7?=
 =?us-ascii?Q?3XB+2h61tEIO7bn5NaPdUIfLe+i941G4vHzutiyFexv/9LJ+GVr/FpQzCQbk?=
 =?us-ascii?Q?v487olANPlQOUjIsjXlKOgU5l7w6EFW2WRjoo7bvIMKPuf32aS77mGA5XKk7?=
 =?us-ascii?Q?suenf57CLiol6hDyUIYKrQEV23dhDXY/Qs6ceZJUYhQxqktG6SFHAOSjhzAi?=
 =?us-ascii?Q?aOqcNbd4m2v63OK204QV4veb1ec61/lnipdtqPM9gEMCpQqqfGvr8Uoi+ibM?=
 =?us-ascii?Q?BoTcEjdkjxSq+OGVKawjMs0rlEI9YhJNTglUkfyNXpxrxqVVUvv7kWxN4D9i?=
 =?us-ascii?Q?6bVa5INEaGe1kYuA8O1M8JTJDNYDERz4T9B+5wJeE4GaYtWeYsU0EXJNRy/R?=
 =?us-ascii?Q?S0DQ2DpBog/qfbXTwnUe+KdBT8SJ1u5ybvSmc+d4dSbdS/Ntpw0KruQb6SvS?=
 =?us-ascii?Q?ZQMtsPgzB9jtdVD4tLLGsJKu+LSZrRhYf6YoUYp6AqpODXykfNdE6Zvp6wsP?=
 =?us-ascii?Q?mYcEq1xh2T6LhdbMJQxwRg6PJROyU7xy5+WMWpSlYIhO1qxshqth+QAxuTtM?=
 =?us-ascii?Q?e0mdezqTFcrBisF0Gjs4uieB+dTb1nfIXW2wWJaeagVIDOhtg2E2c1uobLci?=
 =?us-ascii?Q?SNc3Bd8NF0J0fTOWTcP9rirt659zsnW8Dl1a9OL84lbgupNSgvU6Ul4pSm/4?=
 =?us-ascii?Q?ATd76hMHfZ7xZxrx6DGKQQijZJx6A9TU518VjUDzTA2LtkJnPqApQp5OZYhR?=
 =?us-ascii?Q?FfcTVh/zFCXsbcfCC3XyJ4rqWr/bGnxCPYPbhicJO4SmP6tvLx5ti0OExKqR?=
 =?us-ascii?Q?pj9BIXa1zYbuWRFsNjaBROGOj8wiP8Cgd2nA8sfRR+1v38xLyAgSMRRJoHw4?=
 =?us-ascii?Q?xeKRlvZS6h1/TnbuCmwChPIQITEq5w22C46qLpK/Dw7f0J7RLJDEAzSRlMlU?=
 =?us-ascii?Q?7+puRgM9MFnUMSxveXz0DCfX6uljtwHZxxmX9Ex95gY9SKQ5XwQlH7TzCNEq?=
 =?us-ascii?Q?j9dviyLc54YWPKtxsdXaQD7saI6UK232gbAz20GXyUzgRayL0T5nbOKSLT5k?=
 =?us-ascii?Q?PkDPx8SzSF4XbZcJaCML0Xxz/UrkmEUe2vuioC4ZBySmy7BRSRDuJzikq211?=
 =?us-ascii?Q?lQio+r9gzc62914AB5UMbYeYoArh9aQZ4oRagNxWjHr2JztRQqk4eTQWfbo2?=
 =?us-ascii?Q?OZJSOKphd2KsS11XuteQVTz76t75uR5ElW8SEWjaViU0xGjtThjDY/6snNfz?=
 =?us-ascii?Q?4YsDMjXJQYInEQGK8oo4/1JpcfgwxcrTiGgVNcjhoJlh+/XXYTM1YJtwc6Z3?=
 =?us-ascii?Q?lXVlxe5jvQZKpXbVP0v2VmGsuCrtYC9lYg1QAAPsF4pXN7jBwUd2xjFzUtiK?=
 =?us-ascii?Q?WCvzHj91NbJ8R8xXt2iR6Em4rOUoc2nEW6SRyfAKrZyM/WRBpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230035)(36860700008)(34020700011)(82310400021)(1800799019)(376009)(35042699017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 13:03:03.3115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a71c84d-530e-4385-b039-08dc8ba92905
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174

Hi Julien,

> On 13 Jun 2024, at 14:44, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 11/06/2024 11:36, Oleksii K. wrote:
>> Hi Bertrand and Julien,
>> On Tue, 2024-06-11 at 07:09 +0000, Bertrand Marquis wrote:
>>> Hi Julien and Oleksii,
>>>=20
>>> @Oleksii: Could we consider having this serie merged for next release
>>> ?
>> We can consider including it in Xen 4.19 as it has a low impact on
>> existing systems and needs to be explicitly activated:
>>  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> It is now merged.

Great, thanks a lot :-)

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


