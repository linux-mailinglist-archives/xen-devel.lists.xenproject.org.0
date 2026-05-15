Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHC2KKYLB2phrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 14:03:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F158154F04E
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 14:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309947.1580959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNrGL-0001kV-61; Fri, 15 May 2026 12:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309947.1580959; Fri, 15 May 2026 12:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNrGL-0001iJ-3O; Fri, 15 May 2026 12:03:29 +0000
Received: by outflank-mailman (input) for mailman id 1309947;
 Fri, 15 May 2026 12:03:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNrGK-0001iD-2s
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 12:03:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNrGJ-00AdT2-3S
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 14:03:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a070b83-bab6-0a2a0a5309dd-0a2a45048258-38
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 14:03:26 +0200
Received: from [52.101.72.24]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a070b8e-1dec-0a2a45040019-34654818456a-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 14:03:26 +0200
Received: from AS4P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::14)
 by AM9PR08MB6308.eurprd08.prod.outlook.com (2603:10a6:20b:287::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 12:03:24 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::1a) by AS4P251CA0022.outlook.office365.com
 (2603:10a6:20b:5d3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 12:03:24 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Fri, 15 May 2026 12:03:23 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6390.eurprd08.prod.outlook.com (2603:10a6:20b:31b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 12:02:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 12:02:21 +0000
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
 b=ZEoF3oRK6Rfy4n8Jl2CvrNrVEquuKCp3RknHvPGbagAAjN5veINlJ3CQa7hfg2lyEVGB8c8c1nHKLdKFUmlNTGDoZEKlq3ogiwKuncERoSftbaPZRFw34QOXQYl+saxpzuXDOfJUsIQyIXpYy/OMfniX8+yoyswnqi/a6YQdIcWUufpIuOqAspx1vooDaL8QH180P0ExQveP8gofKJmjhZx3hIO+tgoGL4Cv09YKZM+4quXiSbTtNGanXiaezQtOS9GHn7MYldPf7tKEXR2BrWH7IU2I/ZTEWH2USyXHjBd3B28W5Msuvb56eBmYlevyUK7GZMseSC9zxzrWWC0o/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vinw5w+7JZxyZ5ZVD3zdPrApkvslbuawIliYH6+lY4=;
 b=DQYUO3oPpAZa7un5vcZJpPE9tAF8JNNzx7Ph/7APJHGrfgUDxq25BYSMZOMng+BepRDxfeSU5HtRvmXdVwn3GrYqF+L+jrS53YMLDs8st7q3WpmnQVc3JXX/cykqLJfVYE3H5HiLVZRHrZTR8FkHYerjvrLRJXmDDZnRVWYr4AYI5CmhLgw/8jGqr15QQD9pENWPVn9/OEVXCoznhQzDdeUMjKluzh93fLeQH202XiCBtGjmkfSjTr4YFAnokEkNE665EUlfrUzleDuCM9l1dWPktCMrGPXE9Yfr3PYFLFs+hISwki/hBCiA1ApFF0q01ac8JY8iLrSeKzkwIWgUYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vinw5w+7JZxyZ5ZVD3zdPrApkvslbuawIliYH6+lY4=;
 b=dOlA6s3v4lTrlCmXLp1luxdOmRfNH+qCRL+ou2cCIQp040ItTq/9xJWtnWk3XUi/TBqnTm87K3jGS17xmyPjpQ3GFv+xfbegmHD3+VEB1x7+orNTplT7voHMI/mxGHtITMUivITWRFSnNkjZcUE87QoFFramRSO8t0nOlFLm1RQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUxcYrqieXmGZkzox+X1vui//aqsb9UVE5kkOB96lhTpZUcCLMges7cZ1qqVJ0+cbBvLPhIApFM5wWWekeRUseiA0ElSKQxaXU5EfvL8smdYmrf1QWZ5tHsGGxfLPKliIkiO+OgNCAuHyxgm5T+1rVfY2AgIs/CDU8L5iX0QnGdZeVL1i9qnGNCRkzf2+VyEqlVIZlRxLe9SRlRwgvOdYo++VZO43amTHZZt6F+U8bV6dhKHnLlkEaSxDrOBGhU/l+ZZLaxjRmMxa8yOQl6agUPE5eJHVmU+9uWsKpGE9Tvsq57JjwPRCrT+zG9lfwaRREtQPuDwOAHKtGJ+iwPaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vinw5w+7JZxyZ5ZVD3zdPrApkvslbuawIliYH6+lY4=;
 b=piKTlCar/2CONK68aCWW8zrJM/MRyeuOrRo2LBQ2aOgwoauTA5scpnZvIzwXb/uEEDnAM0/05ejvMO44pwCctjfylWCXgrflr7UKIZS/lgKA/3AazeZDVlOI3QoABLhW+5GUP7vQ+iRy9xXRln/n5cTH0qlFrqYD3KUjkjCdXr11bmo6T8x9TdE6iw0Xyuzpi14dCgWablA9x5bQN1ZDzipkNvxE9OINA2o3VJy91steYn9Kw6lrHp9BbPlKCs3b1YPz0OGlR+bvNp8doqzSuRb4Fq5RzCnPqmvZINhnjjx2Y6waTvI9sFmduEAyOmAeVhE6hN6V3ojqDEA93XquTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vinw5w+7JZxyZ5ZVD3zdPrApkvslbuawIliYH6+lY4=;
 b=dOlA6s3v4lTrlCmXLp1luxdOmRfNH+qCRL+ou2cCIQp040ItTq/9xJWtnWk3XUi/TBqnTm87K3jGS17xmyPjpQ3GFv+xfbegmHD3+VEB1x7+orNTplT7voHMI/mxGHtITMUivITWRFSnNkjZcUE87QoFFramRSO8t0nOlFLm1RQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/gicv3: Detect normal NC ITS command queues
Thread-Topic: [PATCH] arm/gicv3: Detect normal NC ITS command queues
Thread-Index: AQHc5E+Snj3ItlO/Dk2J2zISdlUxorYO/JuA
Date: Fri, 15 May 2026 12:02:21 +0000
Message-ID: <05997446-AB81-433D-84D9-48A5FBE1D62D@arm.com>
References:
 <4d72da78b9c30f5da62c8e03c3b03a01c24101eb.1778836836.git.mykola_kvach@epam.com>
In-Reply-To:
 <4d72da78b9c30f5da62c8e03c3b03a01c24101eb.1778836836.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6390:EE_|AMS1EPF0000004E:EE_|AM9PR08MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a51058-a965-4eae-3140-08deb279f719
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 l0Sz099HEPT6hcOXx5wSYSS7BfpdJmoW+oybL8UfV7tQvmiohpyEhljTKB6lL3VUAWT0T8Cef2NvTpYzXIwyxihfFL5qRnvtdRXSEIdMWBeDtmjpy1PQ7mzMeMm9NieptPKwSp/hXdl7FLUe8cdHIxgk8TabW8ZhHy8HQGnvTPPXFOBSYD+Dar3p6CAwS8O/gVd8ZHOoNiey8ibkTTNlmLkGZs8RDmRmrDfRH0yaDmsY44qMKDu7n5OXBRBEnhjIEqJsu3FI/VJfZ/cXjZSILV0ZRXhPT/ZmNltjjvK30vlCcysrnJYPGZveFB6kbSSFEUVbWcaGGVdAUJ7BZzVI/ww6HgI3OBihSiklL5zKFpZ0m4wjPzt2i50nODjgS1E47LroLir5l31iwXSiVU/R4cFE9QsKhXS+pbUOU9jTBVDi2vWm12hMvvID7OGflZfgDQDLYrhV037K5YLiIGHvyTQpQ6a/0GveOPSL7cIWIABf8S6JUVxBQP2DR6zGu4eZvv0uyiGaGmZioE1SfP7eG/Ti7UdVmpzqkY4XEKq7kAcQFDf/shufjoz0qZo/rTWeRKpWivVFZ9A0yRxfG9aLdxtBrlXEecgpqCqnIrubdEjn+3OJ8EohxPQhorQjkI91DqcS8l7w/eurbzQzK5dn10JgEnFPq24epOr+N7BZompRMpwyQ8g5mncXC23SIQOxQBP+/ujtwCVhinObEbtAuWG3lq7OdriqUeHvmabi1ldw7GDF/6CET3ccqY5mgYbi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A0544D87BAA5641808C9AD6B4C7613C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 tS0NlemIt8INys3iVFjlFNTAN0AlRSsTuUwl6LPTA+AHf8bl8E+7YrUbG3vrfmH3Qzm51KlpZhfde/znqDrKC1oNSDbExSgvSVAvOrAGQtdGQ2hTy4Ahc7iQOqncUTWPsUxVCA0oPD0/0FT190cHHMajbjqmkYJDBLJpa+U+4X9vUMXGBPnl3bn3Qa4pXUT1w1uZRLXVomLLR88C0hug0qpVq7Op2Mq6hwA7jSjPndwNYXaaMcvl62r+PaATPqmub4+e+Jnta/mu8G6YK3sggfs3xRc1+kcDpP609BgDybDc8eO8w6Ax+TJ+hLwAA/RMhhHbIM/vBpBWKeUg/AZZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6390
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3df0c0dc-9f1d-480d-7b61-08deb279d1ff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|35042699022|376014|36860700016|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	nbyz99ten2GKTxMSsV5cGizCrnsMpnxh0jMKK6htf+/AsIq3ymmZWY17ia8O3N1ksL8s5YsS/VTWivcnTTLRYn2ReKfte3A25wjlrq3njKSMjezOtuup1N+uYA/uSmOMroFzUi4ootETAP+gf//sNe+hJhC+pnVoZ4rUnv6BaVX3kOADP0wNkfzw34S1g8DsgpDyrLLqjhmbmOZiJKS/Uem60eXc7o7mqTM/kpsqL0i37LIvHpHWnk+kpNh2JvuE2qA8fOChWq00HxTE5wiW4k80BLAIqz0yE7T4VNBgT1ljm/cOkhiGPpLrcHoB+aLxwORB1MNo6qPbF2QmRvJY4U/E4Rxu+VfF4GaL7NuqASLrka7XHmMm8SJAtxelRdMFOB1Aco8npDXclkdQT03VBGyE1lu4mtROS9CC7AMTHflVbI6Emkj+MzoIf7UzbQijyZLLGW7gUmmTQAwE7bUmFJcL6ef67aA8IJ/8KGGulGS/pJ06RMgSvm1Vc87KqyXmdxv/7GZBGIT0Hgv1/XnpV4Gbs9XK7FhsOIDmnvCEXBzrtif9JjeanBYSRSaAjZprFmwDbyCaKN8ZAQdIz3hwQdU7qRBMR0js/gy47mgpw4OhbzlIrKQ/2Cc8gM5Q8JfGCRGcQFP797KAkdPo7nyW6wy7iv98i/bbbrtQRaNtF60Aj8dptDgRwlbfIG7pvrUtT7ShiXfo/CtWF7fzbIhQwYun87sRW3VVz+SH/4/wYYk=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(35042699022)(376014)(36860700016)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oVR79mBo8BOro7h/ScE2XKUrbGn5xgv8tfjGv3uG7gSACcmAYFM4gx0OrywMWG7te+4SZdqanC6DRYwaMe/zsYH/x3K2Ut1yvgdqTsXygTO2qOZPmeni5r4DLj9QvnNy9Vmecn1P+zKhW/6iFW0Y1LkZM4IQer2xiDVxmIOSneXTMpRU6amyKG0pNQq2XCkdhbBqat7/VjQoSB2rD/1cCXf+T8vMKgT+Nqi4tSgUEKjZJsinwSbpDbqUA7dVVDHKmhajn/WRD62/ldQ93M2llyJHg4/wgFwA3NIFI6xmR5vs2HvnARpfoQ8MCUcxt/e2e6GWXifSsK6BGC0Vhf+lNOeRt6BxH3DI5PnsQMD+BwUgTfZWOdgwOeJe9+XWaGSzqeFWa/bsmYge0pYkyXm1dxU5UlH58PzvKimhbBZ+W10Tw6O87e8AGbf/Ofr83yZA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 12:03:23.8660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a51058-a965-4eae-3140-08deb279f719
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6308
X-purgate-ID: tlsNG-ebf023/1778846606-2AB633FF-941374B9/0/0
X-purgate-type: clean
X-purgate-size: 1673
X-Rspamd-Queue-Id: F158154F04E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi Mykola,

> On 15 May 2026, at 10:40, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> GITS_CBASER.InnerCache uses the GIC BASER cacheability encoding.
> Both 0b000 (Device-nGnRnE) and 0b001 (Normal Inner
> Non-cacheable) describe non-cacheable accesses to the command queue.
>=20
> its_map_cbaser() only checked whether the shifted field was zero,
> so an ITS that reports Normal Inner Non-cacheable would not set
> HOST_ITS_FLUSH_CMD_QUEUE. Decode the field before comparing it with
> the unshifted enum value, matching the handling of ITS BASER tables
> and GICR_PROPBASER.
>=20
> Fixes: 8ed8d21373be ("ARM: GICv3 ITS: map ITS command buffer")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> xen/arch/arm/gic-v3-its.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 9005ce8ce5..7560d46c6d 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -424,7 +424,8 @@ static void *its_map_cbaser(struct host_its *its)
>      * If the command queue memory is mapped as uncached, we need to flus=
h
>      * it on every access.
>      */
> -    if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
> +    if ( MASK_EXTR(reg, GITS_BASER_INNER_CACHEABILITY_MASK) <=3D
> +         GIC_BASER_CACHE_nC )
>     {
>         its->flags |=3D HOST_ITS_FLUSH_CMD_QUEUE;
>         printk(XENLOG_WARNING "using non-cacheable ITS command queue\n");
> --=20
> 2.43.0
>=20
>=20

Looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



