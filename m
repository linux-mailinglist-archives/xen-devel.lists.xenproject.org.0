Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C19F983DA8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 09:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802387.1212603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sszlR-0003wb-HN; Tue, 24 Sep 2024 07:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802387.1212603; Tue, 24 Sep 2024 07:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sszlR-0003tZ-Dw; Tue, 24 Sep 2024 07:15:13 +0000
Received: by outflank-mailman (input) for mailman id 802387;
 Tue, 24 Sep 2024 07:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Gt=QW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sszlP-0003tD-Rr
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 07:15:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb7dcba2-7a44-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 09:15:09 +0200 (CEST)
Received: from AS4P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::19)
 by DB8PR08MB5532.eurprd08.prod.outlook.com (2603:10a6:10:f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 07:14:59 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::ad) by AS4P191CA0023.outlook.office365.com
 (2603:10a6:20b:5d9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 07:14:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Tue, 24 Sep 2024 07:14:58 +0000
Received: ("Tessian outbound 45432d802583:v465");
 Tue, 24 Sep 2024 07:14:58 +0000
Received: from L46a741500ea0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BDE86CD-03BD-4477-A5CE-3D1446840BCD.1; 
 Tue, 24 Sep 2024 07:14:51 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L46a741500ea0.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2024 07:14:51 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DBAPR08MB5573.eurprd08.prod.outlook.com (2603:10a6:10:1a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 24 Sep
 2024 07:14:48 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 07:14:48 +0000
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
X-Inumbo-ID: bb7dcba2-7a44-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U41gNhjk2zEq22tyvQqp8lpNZ03+HX18zpPGCto97LE+rPjinEtsdwLjQOjGSiQF94xg5mwt5C3T9Ct33HJv1VKQq0Oz0X6MIXNaDq9h43JCNT8Kma8UCBKHJSH3CVn+pxLr5qVY9twbM+6auGKEX+hGGL5M+VaIqesRwS1VPiLqk4CXH3djSLHmRZ/xYc3XrsaSky9o9dRdAuni8zS1Ev6O6IggEYB1NsHIJ2sg5aPDhKhpfdeZbPw1ztOzS0GmRKFdlP6rqnsWOChxhbpA0zcmR4xwpm2vOKJXwMEITeBa5Sc+uZzbsayXBsAqrwnqTZ0BEntiYPvucg+9AgJVQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9tUJBLHzjNFYrmXb4X3shFaywWwuaU0jo160R7Y4GQ=;
 b=NK+ylX5IKoPDuwDaQVu66EaQu2kh/NTiu/SwJQ+OfLkKCiIu5wWO7dHDmeJomAr4pxZGDIQH7raP4+GxMW633m5tJ+5w6QSAbhwpxAFySW/NgFUwKZPk+IAx/6QfXDewUF1uX3tvNN7wmnj2c82DcYUpJeBwKecuZL/ezIUENjBQ30VOJAtL4OuBWPD8WKTGqlPJFGL4VBnH/bztc9D0RIIIKtun0yFqAGYiVkzEC9+KBjsxF5ZF8DhpJE5qfxOfvNgppoLNY2mtsSpWiOdVLhIGC7sWGMYsKuLHQfnGeSMMqVjz+iDE41u8YhxvfYELkTicVL/I7XQJDnpfFoG/gQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9tUJBLHzjNFYrmXb4X3shFaywWwuaU0jo160R7Y4GQ=;
 b=mx83qynaTOJbOrD9iyD7lhaTq/ZGp6S9LmKcD5hMW/HTPcx9OgHQjTVgj9AirQy0eSTYykBGURVJJcui9iBgVKJQzolJvFG55MX7XI80TouzyRIJhnqEa6Tun+xgq0Lj5mfD81wEEZuRrBPBAMNeTqh4yKOIjQD/ndIl0KfkYZs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d153cc01e7d02069
X-TessianGatewayMetadata: j32Ku4Vt0S7jesuwBxLbGKEdtAiQSlLqz9d5CBWZ00TMUkXPqyxYwkDMfEAg/CqfjGsv7081b4pIi90MWmp7RFDunkrWT5YRjNWMMAv4FNKBrUOoXE1doci5ydTl5dHxH4HLDtWbP4Etx6VPKq0gO1/CSoPQRy6PWoXdzpRcEwk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLy1cm8sufN6f/XdGO12BpBJw+mDRyzLSMZbigGMqsKuDoruoLJnCjNVrVZF3qJe3Ndj5LOFU5AKQs+ORw22hOjPSI7PL08EAHlk07eRTPzoaxPm71C2TCPnfMvjQH3jfIEwEaQG6TCY4DYu9zHS8TSxZvnTfE7HFqbSl64hhY9RHJrrrcLZBW0Y99y1zIPcToaW6LbgqB1GPDwYh457/6pHlzqTE1lLpBb+ZxzHMJ0iiwI8s8IjQ6LfR3EGQmCYX8AYuJhUbvrVWUjQMbXD0F14TLkJ6Q5THo+uTW4lMCzxg9O8wyPf0Qd79dhRxEsqBmf2cjDdSiaERXEFByAg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9tUJBLHzjNFYrmXb4X3shFaywWwuaU0jo160R7Y4GQ=;
 b=A5THc4m5H55Gui+J2yYtSVpETPUJLOP9kfAJbniWfkMyn4grPM8fVZWknz6JUE6OQhl6i/4UnDzhKNhE3CQCgtWLvhqj3pUTRNALJrtG1+C8PlzjbdsxuWqisFqMx0P0HJf4fV/prr0IPf3rQLqGqf7qVZe0pNJKSGYJxGp0hZBeup+BJ97BQimBUTwFAvQFysQZIZXSzFMbBM2QxYm9EZjfuLQAsbu29zG+sTkW8k34iHeHieLreenbrvm7MBpvf0FDsAyuLuIi0qqOoNZE5KCS2Ag2Ivozwl0CIZXi2LQjfpfj+prdWuKACP9L/JavPY53q7+8pITFq7qxrtu1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9tUJBLHzjNFYrmXb4X3shFaywWwuaU0jo160R7Y4GQ=;
 b=mx83qynaTOJbOrD9iyD7lhaTq/ZGp6S9LmKcD5hMW/HTPcx9OgHQjTVgj9AirQy0eSTYykBGURVJJcui9iBgVKJQzolJvFG55MX7XI80TouzyRIJhnqEa6Tun+xgq0Lj5mfD81wEEZuRrBPBAMNeTqh4yKOIjQD/ndIl0KfkYZs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>,
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
Thread-Topic: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
Thread-Index: AQHbCDKnNzyGC8DY7ki21+yQsaede7JfBtYAgAacA4CAAO+VgA==
Date: Tue, 24 Sep 2024 07:14:48 +0000
Message-ID: <F7E20E7F-FEB1-4A70-8D76-75B5A827048E@arm.com>
References: <20240916121851.3587139-1-ayan.kumar.halder@amd.com>
 <C3DB9D13-B9E6-4F8D-9678-59555E36AD68@arm.com>
 <87472b10-8e36-462f-a4fb-973684bceaa1@amd.com>
In-Reply-To: <87472b10-8e36-462f-a4fb-973684bceaa1@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DBAPR08MB5573:EE_|AM3PEPF00009B9B:EE_|DB8PR08MB5532:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0700e0-447a-49d4-c247-08dcdc689953
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7EfkX+Y763lqmZb+mCl+59L+pcegSIaJ0mB5pqo4TCg+nsZDgI2mY8g7Yxi+?=
 =?us-ascii?Q?ZF0hgU3ytUnK5HIWTOMw/oQNGk0UXYvOb1EbEY5geKNrkrTZwnUHEJj6LsUT?=
 =?us-ascii?Q?fYzEr0iJO49x8+6zwhHgWE/wq6ZNYxl64OCk5WItZyc+Z1gxGhAzarDT2xon?=
 =?us-ascii?Q?5XudjLOX7BQ6Dje1dYBcYpfQdHhUqsW3PQjQce2JT1k40303gYz7a00SWIwU?=
 =?us-ascii?Q?Q5WELED48WmIhoxBIArWfVrEn9pds+3VhXlgeyP7Ug1mvBCRFTNDpoYMr4kn?=
 =?us-ascii?Q?ElIKCcR4Beww1Uxhtcu626laxsxdP93NmYBItkKok117VOoD7MwjAJlcJ0y/?=
 =?us-ascii?Q?uQOhfeP+MEZAeO9ciUpJshYIwz25Svb7XB9PrWS24T7BsZB158mAVmSayU0Z?=
 =?us-ascii?Q?3kGNf3/uV4cfkRsWOMKxC3mYpdZK4YmtWnZav0NkuVUbjRb2npU+ihT8EktF?=
 =?us-ascii?Q?YqIv9dZi0aF8/X9PxNPuIoqsKJx9DMwxJ6q+e8u+8MLKGUMvHjc4iwd8xXeE?=
 =?us-ascii?Q?ZDTIlRL/NJsgyxoN/d3JL7vpmaYZ23bSBFLsHurdEKb/1+39ACBHAj55vyvn?=
 =?us-ascii?Q?GfVpAa8e/7qh1gdOvMXRSd5ldZmyxXhq7MKNVKLsXmGl0COHWk0f2DRZMIkp?=
 =?us-ascii?Q?FL2fPeznxv1D7RykhMWsbXDnTg556bOLG7wJpSaY3eFTtfa/ffJnyfsm78Ke?=
 =?us-ascii?Q?Jn8bml9qPg8+cR6WFY/UJifmP1bAfxD643hSSBFuzQ0WVBkl5nptzRzQKFsZ?=
 =?us-ascii?Q?n0RSwDgJkCmzQpSXv9Km0w0t9Z3iXXs8Ig2IBU8jMtdviHYSIsCgLqcbv9L9?=
 =?us-ascii?Q?N/duQzHsbMMP167SV5onnjN0w8fIC8mJ8r5GEf0RN+D+/8uDjdMrVv6FpVnf?=
 =?us-ascii?Q?xJGAjWD3kUUq+Iez3dNjk8PELYImdUT7S7PLsZkZBbpGQW6BKZqTLzCMDYb1?=
 =?us-ascii?Q?OCRibv1P9JHGUMy9g/QAdksUB/v2+pkdbg0BZ3y4mRK0zzPJp2JtoGDhGGw/?=
 =?us-ascii?Q?XL/noMMgnqrwzoDj15+0VpbkrGRyFyqjdOKuZnlRdnWbHhqF+RPH73w/671g?=
 =?us-ascii?Q?Vj9v+b0x+oiqV7wTtw+7FkfIULgnEP3viavXjXEHS7WyfAddFmdgAH6R2cVg?=
 =?us-ascii?Q?4ETBKNQqBAkojZMa4R0lBWbUajW3YUIVtywHSaIAaHMY2q7BNLUhlBuGsn+Q?=
 =?us-ascii?Q?EBwtxvHc2HLufww3cROfGEE3NZYl+xZu4l6Tnmr2hLoZ0PDVmk+s+7dkzPPN?=
 =?us-ascii?Q?SazzHiGEKi19ZvTLKIkji+gzvX/ch1rw7XGF5tnDUx7mpt/p6ILf8i6TksV0?=
 =?us-ascii?Q?14yh1krT4MfPjtyJguFHDiu/XsITDFZsIoIzHsGqNeW27Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <816269E89A3B0549AD6D368B3D8CFE85@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5573
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71398358-dcae-411e-8419-08dcdc689335
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fz5wz9yWLX83/Vkq5WVo2Nq6VCcw2gtgM435TDoXQeEuWTkHVtoMRM2z9TG6?=
 =?us-ascii?Q?kIxny7y3ClmAqgDmKgZGObPYn1aRzIZf8oL2IpmbmJkX4hzpWMP87Bdru5fQ?=
 =?us-ascii?Q?FDiZJ5R45io9ToAhefU0nlFx8wUxuhfyS+livjl3hThnhqNTt9CXCK/RlV1G?=
 =?us-ascii?Q?8F9TgtQuPCIzYiylTK6S1hJOSFKMsgBif0OwZdkWPyRC5r272ZEjWxvTc8WA?=
 =?us-ascii?Q?WPjHYD7TeabHH8was9tMcZ3d9HUHrcwLXVfsBNbGHoORZKS7Xz0a1LOeIMmc?=
 =?us-ascii?Q?MR5j4PJpF3eFFQ7Kyx83avah+RNUsbe1kpOw7wNICzptXXAXw91HK5xWaihC?=
 =?us-ascii?Q?bpDsl4j53jbAAz/xKzq/ZwoEZ1+4audeS81N275qTVrhMATHFNe4eGiDZx5f?=
 =?us-ascii?Q?BwFT1qZI3GyTR/qSZs1xuc64XasVb3y+LE0gN6iemie9h+MDfgs33X9filIs?=
 =?us-ascii?Q?9SgkRD7Tks4yERd27GioTRquedBKo8foQxI7EHfsvIZGymtU/c/damjvc/G+?=
 =?us-ascii?Q?G8mzoN218/Ytr6vCyikJzGtDbZ+RtU3dZDVSS7OK3SC2HbmWNqYortZyQjq+?=
 =?us-ascii?Q?jYOwAOuY63YJNMF97+Vm7VUEZaaO2FnJoTwnJIevnBaJBbpFywwIXep1daXz?=
 =?us-ascii?Q?IUHXo9SZtgv9EjQrplYrRg09IyVcyEWj6C8UZ3q82//qZV7O0XIW5Ey2PYqT?=
 =?us-ascii?Q?8AGPbrr4f1fFsHNfa4Za9vDQf+9PhVofkYTnmOGFWAUyit1DZfoXvNRBNCZx?=
 =?us-ascii?Q?1kQvsl2PqWnlabafpY+WrN8fv+f1OQoI8SS4DKke06h2wAY+TpFWghRbGqiR?=
 =?us-ascii?Q?ZqGhAYsGEDd4+tVnrDr7cAY+Fe5hNQd+Mz4fPWw43dpbDJ/dZpzfI793EJMa?=
 =?us-ascii?Q?ka7t9XG/naafUXf6QodaJMkwTTdDnIKCwnYCFBMEqsxpzeFIOgy5/x+SWnyX?=
 =?us-ascii?Q?aQAOvKxDjFWVjf4AI6HqNeIUNg+mgwEvmqKDVmTaqtCYo81+WLA20uNCZDXH?=
 =?us-ascii?Q?GIpM76Zz9T1nJO6NWYLVAEYy7VR4vEipBbtbELrPhNrAUsjBZC2bjBYG5Y1T?=
 =?us-ascii?Q?IIhWEau2eRM1XrWR4i2xIWVJTloHBztce/yF3F8nHrFlvbtNk0qZCZge67LE?=
 =?us-ascii?Q?6FP8gdybhODI44sw0U7UU+7vPALGEJH52RV4qlqiyDNIBT20owVA1zWFKik+?=
 =?us-ascii?Q?IGlYeFIi1tkNuDcTYtYIjgPq/qm9jeCizIORnYwlhzUNfPMlJt0zkf5biFP9?=
 =?us-ascii?Q?vRNMnkAphzyAuTw1YPtmX0jeSBP3D2cDNtPeksH9xsxnc5ozSrYA6C6Pkfms?=
 =?us-ascii?Q?101fPwslbwKmZSo8Q+mzFU/2kTmqnVSFAnKa30++h2h6nm8HCgi6QHP0z5Lt?=
 =?us-ascii?Q?+F0ozagaBwDSFLzYwEEY0V7O2e2W?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:14:58.6099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0700e0-447a-49d4-c247-08dcdc689953
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5532

Hi Ayan,

> On 23 Sep 2024, at 18:57, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 19/09/2024 13:01, Bertrand Marquis wrote:
>> Hi Ayan,
> Hi Bertrand,
>>=20
>>> On 16 Sep 2024, at 14:18, Ayan Kumar Halder <ayan.kumar.halder@amd.com>=
 wrote:
>>>=20
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>=20
>>> AoU are the assumptions that Xen relies on other components (eg platfor=
m
>>> platform, domains)
>>> to fulfill its requirements. In our case, platform means a combination
>>> of hardware, firmware and bootloader.
>>>=20
>>> We have defined AoU in the intro.rst and added AoU for the generic
>>> timer.
>>>=20
>>> Also, fixed a requirement to denote that Xen shall **not** expose the
>>> system counter frequency via the "clock-frequency" device tree property=
.
>>> The reason being the device tree documentation strongly discourages the
>>> use of this peoperty. Further if the "clock-frequency" is exposed, then
>>> it overrides the value programmed in the CNTFRQ_EL0 register.
>>>=20
>>> So, the frequency shall be exposed via the CNTFRQ_EL0 register only and
>>> consequently there is an assumption on the platform to program the
>>> register correctly.
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>> Changes from :-
>>>=20
>>> v1 - 1. Removed the part of requirement which states that Xen exposes t=
he
>>> frequency of the system timer by reading the "clock-frequency" property=
.
>>>=20
>>> 2. Added a rationale for AoU.
>>>=20
>>> 3. Reworded the AoU.
>>>=20
>>> v2 - 1. Reworded the commit message. Added R-b.
>>>=20
>>> .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
>>> docs/fusa/reqs/intro.rst                      | 10 ++++++++
>>> 2 files changed, 33 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/=
fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> index f2a0cd7fb8..86d84a3c40 100644
>>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> @@ -30,7 +30,7 @@ Read system counter frequency
>>>=20
>>> Description:
>>> Xen shall expose the frequency of the system counter to the domains in
>>> -CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" prop=
erty.
>>> +CNTFRQ_EL0 register.
>>>=20
>>> Rationale:
>>>=20
>>> @@ -116,6 +116,28 @@ Rationale:
>>>=20
>>> Comments:
>>>=20
>>> +Covers:
>>> + - `XenProd~emulated_timer~1`
>>> +
>>> +Assumption of Use on the Platform
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Expose system timer frequency via register
>>> +------------------------------------------
>>> +
>>> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
>>> +
>>> +Description:
>>> +Underlying platform shall program CNTFRQ_EL0 register with the value o=
f system
>>> +timer frequency.
>> How about: CNTFRQ_EL0 register shall be programmed with the value of the=
 system timer frequency.
>>=20
>> It prevent to use "platform" which is quite undefined here.
>>=20
>>> +
>>> +Rationale:
>>> +Xen reads the CNTFRQ_EL0 register to get the value of system timer fre=
quency.
>>> +While there is a provision to get this value by reading the "clock-fre=
quency"
>>> +dt property [2], the use of this property is strongly discouraged.
>> I would put the second sentence as a comment as only the first one is th=
e rationale explaining
>> why we need it to be correct.
>>=20
>>> +
>>> +Comments:
>>> +
>>> Covers:
>>>  - `XenProd~emulated_timer~1`
>>>=20
>>> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
>>> index 245a219ff2..aa85ff821c 100644
>>> --- a/docs/fusa/reqs/intro.rst
>>> +++ b/docs/fusa/reqs/intro.rst
>>> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
>>> OpenFastTrace parses through the requirements and generates a traceabil=
ity
>>> report.
>>>=20
>>> +Assumption of Use
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +To fulfill one or more design requirements, there may be underlying as=
sumptions
>>> +on one or more components that Xen interacts with directly or indirect=
ly. For
>>> +eg, there may be assumptions on the underlying platform (hardware + fi=
rmware +
>>> +bootloader) to set certain registers, etc. The important thing here is=
 that
>>> +anyone who validates these requirements, need to consider the assumpti=
on on the
>>> +other components.
> I think there is a typo.
>> I would simplify a bit:
>> Xen is making several assumptions on the status of the platform or on so=
me
>> functions being present and functional.
> s/functional/functionality.

no that sounds weird, functional is right in the sentence i think.

>> For example, Xen might assume that
>> some registers are set.
>> Anybody who wants to use Xen must validate that the platform it is used =
on
>> (meaning the hardware and any software running before Xen like the firmw=
are)
>> fulfils all the AoU described by Xen.
>>=20
>> What do you think ?
>=20
> It sounds ok.

Good
Cheers
Bertrand

>=20
> - Ayan



