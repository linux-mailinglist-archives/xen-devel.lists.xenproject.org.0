Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96119C7031
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 14:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835668.1251537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBD3J-0005Rk-OK; Wed, 13 Nov 2024 13:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835668.1251537; Wed, 13 Nov 2024 13:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBD3J-0005Oa-LJ; Wed, 13 Nov 2024 13:04:57 +0000
Received: by outflank-mailman (input) for mailman id 835668;
 Wed, 13 Nov 2024 13:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=90UW=SI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tBD3I-0005OU-3w
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 13:04:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f403:2613::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcc4783a-a1bf-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 14:04:49 +0100 (CET)
Received: from AM9P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::16)
 by AS2PR08MB8286.eurprd08.prod.outlook.com (2603:10a6:20b:555::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 13:04:39 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::f4) by AM9P250CA0011.outlook.office365.com
 (2603:10a6:20b:21c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Wed, 13 Nov 2024 13:04:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Wed, 13 Nov 2024 13:04:38 +0000
Received: ("Tessian outbound 1ec1574b55f7:v490");
 Wed, 13 Nov 2024 13:04:37 +0000
Received: from L64b64417803a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F712FBC-9F8E-42D1-9B4A-BFC1D5966042.1; 
 Wed, 13 Nov 2024 13:02:59 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L64b64417803a.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 13 Nov 2024 13:02:59 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB6231.eurprd08.prod.outlook.com (2603:10a6:20b:298::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 13:02:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 13:02:56 +0000
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
X-Inumbo-ID: dcc4783a-a1bf-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjE2IiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRjYzQ3ODNhLWExYmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTAzMDg5Ljc5NDE2OCwic2VuZGVyIjoiYmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aGBu5v7uEHMFvK0OnTzFO9zH39cY7cHfJql8CCwNCuXNP6IBJgl6k9OPTzaE4K2Szk5dZOfr4YJTkE3pg4Dc/5l+U6lxb5jSuAXfNm7bMAPM75P++WZEvAqHIq4ibtuZ8xTfgbTkMYZ5Cv7CPrhCOw2PwJrRL8CZx3f+BQJmkbwjCrtByw2C82nQSyzKOkS6PH6q5yRzASXo18TJQEoqQJzVoZfnHGNPfL2kV2RwruzTlaFAlMZ+JJrWgbg68Nxs27sxoX1nP+wFR/es1lLi4yP1Blk8f43FfTUgyzlly5n5t4KuK5FwoXgHSxYuFGUedEoT/jdVd4yv2S+Mk+o5yQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtXakdXxxQX8VgK6AEqrXJ97WbccNMtcvZpttwVTUqo=;
 b=QG91gNLN9/HsWJNxrudNjHsrxtrXPk4NDsl4CntT/hXAZLGuWPjd9uU6ahvVq8FQTcdpIQIRRCm5087yNOuU3G8DEocmi2hjGpVkB5SAIpKZt/n6o5on9f6RByv40IUvDn0uT2Q+zEuzHcqUisuVFF3/mo/6aad7OlVwPiX8QFBacPM3gvYFQA0UqXY/uA3LvdYfZebWUrSHhSn08qKwANx4l9bXzQQ4OpPmomBtsZfheYv4adi2oNVuyHmsF+w1MAEHRuw0F8kbEy5V6jDwsDK1qhCZJvvBV424Deb1VfDbV5DL7MbHNw7+W20ea0Bzw36YhHq6zQQ81PspvViFqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtXakdXxxQX8VgK6AEqrXJ97WbccNMtcvZpttwVTUqo=;
 b=J6M/lguJXNnh3wJXgp52hNwUHvcP9aCG6WsHz5mU20O08TKMvxOLQuP7nUFtkRUBq2FezBI3WJw9joICqy9X3IvBFHddvWnlUWJTVGEj1g2XNOkhI/iCqVEPdAJUSZFwD7OHyUG9Q8Jvq5C/nEZUOLiTlW13nPGpcesd6I9W/xs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f8801c05a0cce91
X-TessianGatewayMetadata: dL8lJIQ/6m1MP2Zvp+9VTievChKI4C+e8B+WddXeN1k/NRnZtotwOFVvr7mMXNiPIc913xnmm+DcZPcohQL2PsazkeoSPxSNtD/iPUsTukH05JcmABW9mcSW1rPit9oFOBznGm+k5V+LGHLG+z80eVaB2aYN61do0Dqxcd1tvm8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVeTek2jLxQcRbpjy+2SIh+z+6KCZxBwEybmAphvvsuvr0LkgyI3B94oUmu82j8Esr1CiXyOd0id1oeVyIx2rONdQrwqKO4WjzHGKgKhxWpxi4h0dYYR6nefXDIlixh8S3h75O31NmomVeEyFVQrd2ezEhWSPl0yT4gXo5y0c4JJ0gG/vvUoBXuNFAPNOYHl4xpmwsyj2jxK1knWnJZx3HnwZOjjwaffn7vAoYpIU1GYNTptsINBBPAmeekx6HW3ocBK46DmOJbgJpfAZjaFi8vswImBqyL20zBwl6UcdtV5qTcb9TXwT8z9hdy0r89oxXszV/psx1KAq2Fr5oiEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtXakdXxxQX8VgK6AEqrXJ97WbccNMtcvZpttwVTUqo=;
 b=KIHY17wUvuWNdhZpJ+1t8feX2su+RUGvwAnGdSSzuE6CTeiuxuHmhno4fkVF79VOrHqwrrDKkBqcPcX6kXi+c5uUhkNhb6Qev7yXmTJunnCDiCHaQY2ruE6m0FKavrY6A2TNOsCGAcX1p1ZMlbb//JD2eauOsK1YsQ1WS3Z8BqHcLLpcGrKwQvmGVBe9ANamS5czM3HsIDq5pwjmhdQT/QpEsLLvAehy31CJyxmDdc4a+B9x2Doh+pF89HRxbimyin1gOV8uP7XpIEsK2++e0h1+SCUeQXILNKUKwbaWaycxdMjsGK91R3d4Enost619Yai7Pm/MEVMvFBajg9TDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtXakdXxxQX8VgK6AEqrXJ97WbccNMtcvZpttwVTUqo=;
 b=J6M/lguJXNnh3wJXgp52hNwUHvcP9aCG6WsHz5mU20O08TKMvxOLQuP7nUFtkRUBq2FezBI3WJw9joICqy9X3IvBFHddvWnlUWJTVGEj1g2XNOkhI/iCqVEPdAJUSZFwD7OHyUG9Q8Jvq5C/nEZUOLiTlW13nPGpcesd6I9W/xs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Kelly Choi
	<kelly.choi@cloud.com>
Subject: Re: Xen 4.20 Development Update [August-October]
Thread-Topic: Xen 4.20 Development Update [August-October]
Thread-Index: AQHbNR5PhCaakyOetU2B1BUXrcTlIrK1LmyA
Date: Wed, 13 Nov 2024 13:02:56 +0000
Message-ID: <51B2EC23-B47D-4782-ADD8-C2201B380C12@arm.com>
References:
 <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
In-Reply-To:
 <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB6231:EE_|AMS0EPF00000192:EE_|AS2PR08MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f09180-7de9-4bf6-dfb0-08dd03e3bac8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?I/zdJywoKWxgymnXtX/KYLbzNlCQAuHw5+gZr/XOnZfScVnl+nqYfXryBkp+?=
 =?us-ascii?Q?j/0PqziLl+9rNJImptoVP4dG1BYn19QGvIYGWgHmUKd+nexYNbXp8WKNneH6?=
 =?us-ascii?Q?IR/Le3ptUMA72bEY24XZSqLbl/aPDC0LsMN6cLE0EqZr3+3Xw5LRGSAjLAgx?=
 =?us-ascii?Q?xqFas2x2yP7/Kkje3ji1LsmbgR/7nnAwvS8X7QUjteJ/hNAoYmpZy7+QDdM6?=
 =?us-ascii?Q?ZyzIBkpb+x+fxKo/fWQaIAGPBUXpna3hRCbYWipezC0hGOECnK6RoF7NKPJI?=
 =?us-ascii?Q?1MpnwGQ7IwZEtiycOB4tEqDzEYDFPQ8bWVpgsP6O1Fn2aGFfMRm5KgvG+/nz?=
 =?us-ascii?Q?jDLPlIUlercjuZmFLaYk1M3R/NWUoOzkv+pTcmWdz0QWkiptPEfLfRIXbcPw?=
 =?us-ascii?Q?imqH4jj3gk7L6lfD6Rt0xABQRPWao5//GZ4VC2UjgauaY7VSNKZG5XSzXc04?=
 =?us-ascii?Q?c89w5CjIaggXTj7FLdYwCUx2OE28YUzoD5z0kUWXLVTVoIg9ns3gb9GHPDyQ?=
 =?us-ascii?Q?NSlvTG/fog5BV719POvwTrXQv5p7QvZOHta/zVUwzAwfbXhGeTMEFOZtyLuY?=
 =?us-ascii?Q?Lm+S5O9haI7AS/fXSv2wurVl6zJnp0Du9Ba+ZqVE9wfc8kKwIACY5rrX3hbJ?=
 =?us-ascii?Q?q/+x01YXczY2UHBJ2p2vkONLRvAxpu3ASGhTW28gL7+jPyW901JMcEMjRiYu?=
 =?us-ascii?Q?O16HHjR0znN/4qyrYC+5uA5BIJ0WwcDdwzPuJIv5NR9PUXIf4H4VSx6gqP1A?=
 =?us-ascii?Q?Cf72bJ/Wnp3L6oi89BMU8g4ecw7sFWlMJCKGPfBZlc5hY/BAmZ3JlgRuMbaf?=
 =?us-ascii?Q?7WVenSy3BCWCFEm6Ovbchn248A8lksEIwuAd5a6FTviaJxbJZn+vu2rQPFQv?=
 =?us-ascii?Q?rQ9ZaSSp5R9b/njt3bNmqp86uvdrTyoC6qjNpIaxqOWDXZRz42nP5rVZNQls?=
 =?us-ascii?Q?THoZ8VqbZi0vcAm40VbLASu5237UaFWkq/DuBLUupmlp8mVv+y8JHwqdoFgb?=
 =?us-ascii?Q?cmTxS2kiik4ItBjWhSy7zjmdscJlqxNIIll86o1iZgccjwBt8++7R4Wn7H1V?=
 =?us-ascii?Q?zl2G9UWdTbKu5CHRyEjFtiENuy6ayahppo16Kh/z/uY7eFk4E3j6rRql9q66?=
 =?us-ascii?Q?38wd/8xj4qFMHaDXId5f7hOTeeasmwFKV7DwC17NcUuEpKlBdn4pcLmWqudH?=
 =?us-ascii?Q?N7iCqYzjh+5Uy+XuccCH4EXPUv7K8dC73n0Iz9LbGJaWObL45/rGZW/5q2im?=
 =?us-ascii?Q?Bn6xU49ScoQRPYReX1GrOucuoykyZxvP6MVE5CMf2+yjcZDZVWJtDF5tOa4Y?=
 =?us-ascii?Q?MsecU4kOjQxV+Gsmci4Hvamp?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7493988B2D95124FBA61A2B3C2D7C8FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6231
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62f61fcd-5f0f-4114-09e2-08dd03e37dfa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kfPrTe98imFkwndIA2kn8xMJ+3jCny5/+ru/oVfpjh3RJZ/nhcT1kyv4OCwD?=
 =?us-ascii?Q?2ZL1Ub+4rfAxnILmdbFq8izvCcx9rqdVmUesMiViShrzqXM67pHDNOM9H0zI?=
 =?us-ascii?Q?+0hNm07MEmJuHpeX+bs/l1AXlhv2kkR01vRKxl9FGbp3VkU2h803iCOuFj+N?=
 =?us-ascii?Q?dWdEt40qVFJWHADwuQfiQC91yJNaBe4NAulYpExGCOqglICzyckKQcm7Tq0W?=
 =?us-ascii?Q?OREwL/ZH15SS1jsft1sbxjAGkxRiwaU45LGcFeTP9qey4b0NfynT3dlt0m2J?=
 =?us-ascii?Q?v1WQUsJeENYhRJCrCKrkYKQphEzdOZzJI9mKqZ/iBasWmOdg4u3WxJueDOBK?=
 =?us-ascii?Q?PY2IcojzrDD//laIPEiM4sy5H17aiwQpiD1Ge9Kw/dD4X+vTpxAaIzjsLtZH?=
 =?us-ascii?Q?5Q0a0vwrHGNAuef31MB/unMXD7pZh/pYE6miWLPsesSCafalLsMu5PT3OuDV?=
 =?us-ascii?Q?qiJIiL0lFt8acI8eT2pEPQuVhxV9wVvRG+zRDdNpSRNIYngHJw3gt4spkA5b?=
 =?us-ascii?Q?rFxEI4UmV+fJGeSlh2r53DX3LI0zQGgkJ9NG5oCms/cijlOpNp5IryX5JBqv?=
 =?us-ascii?Q?6LdshACLugvK0O0r7SITml6qTM5rAjlmsDWUDZHSp8kdW9bCO1Cjzv6892nQ?=
 =?us-ascii?Q?4q2VTvvaXVvEUNCCT4bTsePp//P3bq5V2GC1QbJCr1Q/siRhankAiZBQH5uO?=
 =?us-ascii?Q?xn3J/HXlM+8H4JNGlrab3tnc/UGwijl/jDOVpHbvSEvQPlw6QUYtn7A4XQHS?=
 =?us-ascii?Q?vdweg0tt38M/IHc4f1/6/yLmF7fIrOO/YHzJmcolvK5RXy09WHm2e5SZUOLW?=
 =?us-ascii?Q?cqsqujQZz3Ht0SO6hA1GRUEidTmjPx9hL1AssSsrlOwvItZK0kKkm9H//zy/?=
 =?us-ascii?Q?bfE/Foa4nxcMMgkAFOn1XzQV4A7JuBbRJRN/MQgcOdsCUH/ipkv0FqEOqq0f?=
 =?us-ascii?Q?K2cOWh+yihn1cLd+jEcUAtBIn0L1fiuO+zTvH1YfuuYRswSh8fsPu4UXDe76?=
 =?us-ascii?Q?IIe4uWnQaecoGQl/7HyWQuFMXl4XubWojCQF8zyCOipMw5KD6J6hGxnvfrSG?=
 =?us-ascii?Q?cyQLTqfb08uLY8VGzSoAQdtROLPr2v5EulnEInxt8CVPiWRZN+CEwEHCrWbc?=
 =?us-ascii?Q?3J4L396qajpMo1Mem8Vz3g3EmZOWKLHEuY/pU0scXXwS8iX9FvmI4fn9bOwb?=
 =?us-ascii?Q?Gx3gg8mUY0zcw6mFjU3sHI/KiXVoZrnW+tF5dcMmJ3jCu1eTCQ8kSherAepY?=
 =?us-ascii?Q?NvNrx0ewitLuwvLKKfE1a1ZnkPvUZ5Yde8TFi2asYQQr1M8kG5WZhGo4VCsv?=
 =?us-ascii?Q?eykKFyssNGuX1pfB7LfHfL21I8hgAvDOJPoUrSQ2t1SJAK1mZamhtOHLxpIN?=
 =?us-ascii?Q?Wsp8e1k=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 13:04:38.2039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f09180-7de9-4bf6-dfb0-08dd03e3bac8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286

Hi Oleksii,

> On 12 Nov 2024, at 16:16, Oleksii Kurochko <oleksii.kurochko@gmail.com> w=
rote:
>=20
> Hello everyone,
>=20
> This email only tracks big items for xen.git tree. Please reply for items=
 you
> would like to see in 4.20 so that people have an idea what is going on an=
d
> prioritise accordingly.
>=20
> You're welcome to provide description and use cases of the feature you're
> working on.
>=20
> =3D Timeline =3D
>=20
> ---> We are here
> * Last posting date: Nov 29, 2024
> * Feature freeze date: Dec 20, 2024
> * Hard code freeze: Jan 17, 2025
> * RC1: TBD
> * Release: Feb 21, 2025
> ( current release schedule: https://wiki.xenproject.org/wiki/Xen_Project_=
X.YY_Release_Notes )
>=20
> All patches that wish to go into 4.20 must be posted no later than the la=
st posting
> date. All patches posted after that date will be automatically queued
> into next release.
>=20
> RCs will be arranged immediately after freeze.
>=20
> =3D Projects =3D
>=20
> =3D=3D Hypervisor =3D=3D=20
>=20
> *  Remove the directmap (v4)
>   -  Elias El Yandouzi
>   -  https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1d=
fc@citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8
>=20
> *  remove libxenctrl usage from xenstored (v1)
>   -  Juergen Gross
>   -  https://lore.kernel.org/xen-devel/20241023131005.32144-1-jgross@suse=
.com/T/#md016c48a0889740d1822aa68f7f33d4ad48f4805
>=20
> *  automation: Refresh the remaining Debian containers (v2)
>   -  Javi Merino
>   -  https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@c=
loud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e
>=20
> *  Move gic_preinit() to common code (v2)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/2fe01b5a-aebb-4141-9cdd-887b5984d6=
b8@suse.com/T/#m8144a030ef64a479068482c864c9258a5cb43a87
>=20
> *  stubdom: reduce xenstore library dependencies (v1)
>   -  Juergen Gross
>   -  https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse=
.com/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83
>=20
> *  xen: address violations of MISRA C Rule 13.6 (v2)
>   -  Federico Serafini
>   -  https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.sera=
fini@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29
>=20
> =3D=3D=3D x86 =3D=3D=3D=20
>=20
> *  Expose consistent topology to guests (v7)
>   -  Alejandro Vallejo
>   -  https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.v=
allejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b
>=20
> *  Boot modules for Hyperlaunch (v8)
>   -  Daniel P. Smith
>   -  https://lore.kernel.org/xen-devel/20241102172551.17233-1-dpsmith@ape=
rtussolutions.com/T/#m94a2f6b9d410c6d624aaebd7c2bf85584c74383e
>=20
> *  x86/mm: miscellaneous fixes (v2)
>   -  Roger Pau Monne
>   -  https://lore.kernel.org/xen-devel/Zyyo8qMobqQT-rA5@macbook/T/#m2df34=
239b793501c6246c85c4b00e52f9c439ac0
>=20
> *  x86/ucode: Simplify/fix loading paths further (v1)
>   -  Andrew Cooper=20
>   -  https://lore.kernel.org/xen-devel/20241107122117.4073266-1-andrew.co=
oper3@citrix.com/T/#m76304334081e6b4b0976c6c474f1f0772e0625d1
>=20
> *  Address Space Isolation FPU preparations (v2)
>   -  Alejandro Vallejo
>   -  https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.v=
allejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d
>=20
> *  Fix module-handling use-after-free's (v2)
>   -  Andrew Cooper=20
>   -  https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.co=
oper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed
>=20
> *  Reuse 32 bit C code more safely (v4)
>   -  Frediano Ziglio
>   -  https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.=
ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7
>=20
> *  x86/alternatives: Adjust all insn-relative fields (v2)
>   -  Andrew Cooper=20
>   -  https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.co=
oper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
>=20
> *  x86: address violations of MISRA C Rule 16.3 (v1)
>   -  Federico Serafini
>   -  https://lore.kernel.org/xen-devel/cover.1725958416.git.federico.sera=
fini@bugseng.com/T/#m46c991ed7ea7a6fe505056facddfcc684be01ab6
>=20
> *  Support device passthrough when dom0 is PVH on Xen (v16)
>   -  Jiqian Chen
>   -  https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Ch=
en@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
>=20
> *  x86emul: misc additions (v5)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/0b9a0ae8-a39c-49d8-b4e7-f2a4631280=
58@suse.com/T/#m5aae1045eb07d85fb029bdef12a78cdb6bfe780e
>=20
> *  x86/HVM: drop stdvga caching mode (v2)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e1=
71@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117
>=20
> *  x86/HVM: emulation (MMIO) improvements (v1)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/31906cba-8646-4cf9-ab31-1d23654df8=
d1@suse.com/T/#mdae2f21b929170d60a8640e82857700c940e65c7
>=20
> =3D=3D=3D ARM =3D=3D=3D=20
>=20
> *  Enable early bootup of AArch64 MPU systems (v5)
>   -  Ayan Kumar Halder
>   -  https://lore.kernel.org/xen-devel/20241107150330.181143-1-ayan.kumar=
.halder@amd.com/T/#m9cfd8bed109cc703b6ae8b8b6faaa116c08598ee
>=20
> *  Add support for S32CC platforms and LINFlexD UART (v2)
>   -  Andrei Cherechesu=20
>   -  https://lore.kernel.org/xen-devel/20240930114715.642978-1-andrei.che=
rechesu@oss.nxp.com/T/#m8452ac342fdcf989fc1e498c097812b50157f2cc
>=20
> *  Arm cache coloring (v9)
>   -  Carlo Nonato
>   -  https://lore.kernel.org/xen-devel/20241025095014.42376-1-carlo.nonat=
o@minervasys.tech/T/#md18fb02842c4ad2cd61b456be89020affcc452a3
>=20
> *  ffa: Improvements and fixes (v2)
>   -  Bertrand Marquis
>   -  https://lore.kernel.org/xen-devel/cover.1729066788.git.bertrand.marq=
uis@arm.com/T/#mb0c8aab97d46f9c9e933b3b9b0eef7e717e1f2e5

I would like to have this for next release and i plan to post the v3 next w=
eek.

Cheers

>=20
> *  Add Virtio-PCI for dom0less on ARM (v1)
>   -  Edgar E. Iglesias
>   -  https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.igl=
esias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b
>=20
> =3D=3D=3D RISCV =3D=3D=3D=20
>=20
> *  Setup memory management (v5)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1731344883.git.oleksii.kuroc=
hko@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28
>=20
> =3D=3D=3D PPC =3D=3D=3D=20
>=20
> *  Early Boot Allocation on Power (v5)
>   -  Shawn Anastasio
>   -  https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@ra=
ptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d
>=20
> =3D=3D Completed =3D=3D=20
>=20
> =3D=3D=3D Hypervisor =3D=3D=3D=20
>=20
> *  libxl: Implement QEMU command line probe (v1)
>   -  Anthony PERARD
>   -  https://lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.per=
ard@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb
>=20
> *  xen/bitops: hweight() cleanup/improvements (v3)
>   -  Andrew Cooper=20
>   -  https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.co=
oper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4
>=20
> *  Move percpu code to common (v2)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kuroc=
hko@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f
>=20
> *  xen/livepatch: improvements to loading (v3)
>   -  Roger Pau Monne
>   -  https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau@c=
itrix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7
>=20
> *  Move {acpi_}device_init() and device_get_class() to common code (v5)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5cec=
a0c15e.camel@gmail.com/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829
>=20
> *  blkif: reconcile protocol specification with in-use implementations (v=
1)
>   -  Roger Pau Monne
>   -  https://lore.kernel.org/xen-devel/20240903141923.72241-1-roger.pau@c=
itrix.com/
>=20
> =3D=3D=3D x86 =3D=3D=3D=20
>=20
> *  Drop Xeon Phi support (v1)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/44147507-65a4-4f21-aada-fa647f53ff=
d0@suse.com/
>=20
> *  Utilize ucode_force and remove opt_ucode_allow_same (v7)
>   -  Fouad Hilly
>   -  https://lore.kernel.org/xen-devel/20240822130426.492931-4-fouad.hill=
y@cloud.com/
>=20
> *  Switch flat driver to use phys dst for ext ints (v2)
>   -  Matthew Barnes
>   -  https://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e79068d=
26bb5f.1728311378.git.matthew.barnes@cloud.com/
>=20
> *  x86/shutdown: change default reboot method preference (v1)
>   -  Roger Pau Monne
>   -  https://lore.kernel.org/xen-devel/20240802105613.99197-1-roger.pau@c=
itrix.com/
>=20
> =3D=3D=3D ARM =3D=3D=3D=20
>=20
> *  iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support (v1)
>   -  Grygorii Strashko
>   -  https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd5=
49@xen.org/T/#t
>=20
> *  xen/arm: dt overlay fixes (v2)
>   -  Michal Orzel
>   -  https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orz=
el@amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078
>=20
> =3D=3D=3D RISC-V =3D=3D=3D=20
>=20
> *  initialize bootinfo from dtb (v2)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kuroc=
hko@gmail.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316
>=20
> *  Register Xen's load address as a boot module (v3)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1728472163.git.oleksii.kuroc=
hko@gmail.com/T/#t
>=20
> *  device tree mapping (v9)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kuroc=
hko@gmail.com/T/#t


