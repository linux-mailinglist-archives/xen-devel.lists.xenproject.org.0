Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE591849F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 16:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749134.1157158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTr1-0001F6-5z; Wed, 26 Jun 2024 14:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749134.1157158; Wed, 26 Jun 2024 14:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTr1-0001C0-2e; Wed, 26 Jun 2024 14:42:35 +0000
Received: by outflank-mailman (input) for mailman id 749134;
 Wed, 26 Jun 2024 14:42:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx3L=N4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1sMTqz-0001Bq-G2
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 14:42:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2608::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 505e107d-33ca-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 16:42:30 +0200 (CEST)
Received: from DU6P191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::28)
 by AS2PR08MB9917.eurprd08.prod.outlook.com (2603:10a6:20b:55f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 14:42:26 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::23) by DU6P191CA0071.outlook.office365.com
 (2603:10a6:10:53e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 14:42:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Wed, 26 Jun 2024 14:42:26 +0000
Received: ("Tessian outbound 41160df97de5:v347");
 Wed, 26 Jun 2024 14:42:25 +0000
Received: from 9337e614a2ce.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4A7ACF4-6088-4BC0-B695-519286346531.1; 
 Wed, 26 Jun 2024 14:42:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9337e614a2ce.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Jun 2024 14:42:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI0PR08MB10655.eurprd08.prod.outlook.com (2603:10a6:800:209::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 14:42:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%3]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 14:42:15 +0000
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
X-Inumbo-ID: 505e107d-33ca-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Nu+LVQZ0k8vzjwJafLHgA6xdMk/rELVIBv5vrboONJ7ASPsuaWJ2O/pL6SOEN8zvDrZ/dW72gLvn4+EQvVXTFTxvt/VmBRfu2JQiICt8//lghqFeUBpDO/7vnw4X/7hvBPuGgllZ43vXgUrmINbWsLeeuynn35eUYgENWj3Vx5AI47N81CkXVsoeKj8cRXK/lKPEzGYchaex6VqN/IzSULDbYHH/XuLJhzMPT3hquj9E2dVwutdSzPpUV+Xyq7D8m+HbZ+3lLgNqR70jfych5qvHasFZoQ/HqEqgNbocrh0NB6OOQk6EbDeZqoJnXqkSahrcylcTZe910XAt212SGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcGzbTMuXg2d9EQHzHL9axGsId27hZQpNGXFy4fthp4=;
 b=b3RiZLtIPOtwu3bclXu51Ei5MCQwmkyCFa0d/7bKc2AnJeLysk2M/1TC7P8y0EXHTSEDPa1NzGkjp5ZJcoclKuaszTDTukZsCrHPL5WTHd5d2f2Z2Nh+kao3pJClWITY29ku/s30hjdE3IK3yYNxfsIKXXQ7iQwJAcSipaBIY50q3EQyQawMWsl3uYy8LzeYLcMj+0yo8N3ahPpmqH194gYHoEoUr/eIksFv6riCKw9pboDPOCcB8IzRIgua5s/eVt5UXUMIwB8Eq4+lEVbNliBdgktkj0AgIfRHhjnNBVIdKwN5ngOL6FpCinbUjpdX9FDlQkLVO84Tm3AfMZkulg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcGzbTMuXg2d9EQHzHL9axGsId27hZQpNGXFy4fthp4=;
 b=cLrgaK9MxRUiEb7DXFP3nqiUA8Qqv6NFkRtOF50rS+6rY2YCWaXZXe0vLKrxRHcKpgnIeVpnY8hQIehrjiCfKY0NlRoMsnAmC0L3iVoPJkYU0ylexpF60+veMmCMueVYUoirxlD+lXuA1WaxkYN4CY8xsqEsdrcNZyz5lL+e5jo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: de2e18f58063fd07
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evJzNLgUB9mAjxim/8TE9Jt87FuorPdpkJ1fL11cFuvbli3cjo/Frq1bXkL9UbidwhMvKxB+AV+ITccdFkZH30QVA7z0wbSfUQfFUdTrFhQT25/iZ49IvwLJdCCVZN5NNkr71wzoDmRZazGHC1tydABn1c4+VEnX7DNjTut8HtUwqekS4BAVYn+gpgJo3eTd1Yxea3OO8zZI3VK4UHZemZDzzntbmJagzqNIxX4dW1cCGTQsaN/5SnVKcZ05tOJAnBQMKmRltEB4zhbJH/8zneDeVTv2zwtsIWBYYyclEpPbqy0ZHbkeUbrxj1BoAFYVrJVgS6RcYV3LhRsv8BhFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcGzbTMuXg2d9EQHzHL9axGsId27hZQpNGXFy4fthp4=;
 b=aUM0DZIesrYZj3tVkj6RMpIwa1i6fcjp8FZiUDjn9wE8NU8qfypoTIly5znjNE3KX1k4HMrJwmA4TVY+fdKBtc5FFq6X/VUixZmm2x9cjH5zgKoJLPj7Xpvx4Y+34K2W6HHKQafhk2gH/aCdDORYI11PIgcz6WFVn8bPQXQJvGZaWxZBNf6lWNr2xsApnXeIgQdsgdkVe7weY1+2aTJHUaJ8jQw3vfrsBvQx/fDIGkCcwjRuxX32RVhxoKYIMm5C61jChTiE72bEHQTTIsKWy2cmx23zgrRftvAzmz1g8pBW8cNL35gMHcfab4K+pXLTzk3CGgbUafSDuiFxVfINwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcGzbTMuXg2d9EQHzHL9axGsId27hZQpNGXFy4fthp4=;
 b=cLrgaK9MxRUiEb7DXFP3nqiUA8Qqv6NFkRtOF50rS+6rY2YCWaXZXe0vLKrxRHcKpgnIeVpnY8hQIehrjiCfKY0NlRoMsnAmC0L3iVoPJkYU0ylexpF60+veMmCMueVYUoirxlD+lXuA1WaxkYN4CY8xsqEsdrcNZyz5lL+e5jo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory node
 probing
Thread-Topic: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory
 node probing
Thread-Index: AQHax5+US/AJkZu/L0SR6EusLPxlorHaHseA
Date: Wed, 26 Jun 2024 14:42:15 +0000
Message-ID: <EDBF2EA4-C235-4537-A4DE-3E111386F6D0@arm.com>
References: <20240626080428.18480-1-michal.orzel@amd.com>
In-Reply-To: <20240626080428.18480-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI0PR08MB10655:EE_|DU2PEPF00028D08:EE_|AS2PR08MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: 5458690f-63a4-49f2-0bbe-08dc95ee3281
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230038|376012|366014|1800799022|38070700016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UDB6UDd2UHhYM0liQXlrTWVKa1B1d1JEaExNVGpQRHcyQVlGUEpOcWlic0s3?=
 =?utf-8?B?N3YyRnU2dU9nNi9XKzZOK1NaL2t4eDJmTVptWTVJYS84WHZMZ1hheFAyY3Ra?=
 =?utf-8?B?WVZpU1NWeG1FNjAzelgwMXUwNHJjWGVxM1YyeVgyY1ZaM2d2MEVnSTJxUXBQ?=
 =?utf-8?B?enNSTVZWbkVsNEd2MHlNMDdWQmNPK2toQWM5bGR6Sjdsdkd3d3c0eDBiVkM3?=
 =?utf-8?B?bDRWM0JUcGE0aWNTSHpqaWdwVE5Pc29BaEhWclNwL0dVVTYrclZidkpyUG5W?=
 =?utf-8?B?dkxuTXBodVdUamo4RGZ6WFhTRDAyU0ZDL1ZOcEh3OXFsQ2l1VFQxK0hPbm45?=
 =?utf-8?B?RFVmYmIyNGdLOEl2R0ZiOFFBT1h5SFg4TTRrTlBsQ1JLWnBJU3RBd3dnUTBt?=
 =?utf-8?B?QzJzT3MveUt2NHd0STJIdVVTUlNVbys5blJrR0hNV21FMEFpdFM4UklxZTN3?=
 =?utf-8?B?Y1lwSkdFb2Jwc2lyZkJ3Qks5ZUJMYitGRHlDc1ArS21GcEYrS0kxWHFZNGpB?=
 =?utf-8?B?WVNaNUNPLzg2WDljWHhOR2hnTi9kQlAxMm1uTkUzNnBvMWlGOVhuUm9iS2p1?=
 =?utf-8?B?VTJLTFd1WnhBKzhFc3BqL0pTWjBTcTZsNEc1aGh1bWYrNDU4dVl3Q0ZST0hG?=
 =?utf-8?B?RDUrZWQwN3UzOUo2MXhhRzY4N2poZkpkelFQK1ZJYTRqWjJDaldjYXRSeE1B?=
 =?utf-8?B?SDBjSnFNSmdlWm1xR29vUG5IeGlLT2wwQW54RVR1cXhnUkoxMk9RNjRUb1I1?=
 =?utf-8?B?OUwvRXZVQW14aEhsUmVoTjZkL1NOTnlUU0lTdzk0RFJobXMxQlBCeGdBWkV1?=
 =?utf-8?B?WXNnV0dQby84OTdtaVBiQzMzTWVMcVdYRGZhVW91SDJ4QWQ1anRnbFQ5R3BZ?=
 =?utf-8?B?S0JEOUVJRzg2K2ZkVUtFWTFPVjlhWFUwVXNPS1U3cmJGSFc0QTdUR2RPdkpI?=
 =?utf-8?B?dUJQWmpUTzh6bXBnU3JsRjF0WU9mQVVtY0tXWVIvdCtTMXRxYXE5ZkdUckxF?=
 =?utf-8?B?QXhLY3dNSDdHMWZzMHIzVkFaK0tSRmVWWWQrajFiemZQUUVZa3d3emJsWlFL?=
 =?utf-8?B?QStLY09Ha1hiTFhKNExpNld4VllCUTUwOVYyZzZjallkdFl1S3JYYjVqL3lB?=
 =?utf-8?B?dEljRmxmaXdCWmNxZ3paWnpEQlMrTDdrSlhOOHY1cGd0WE5lazZUS0FXOGNz?=
 =?utf-8?B?K3VwMXBVNnByclQ5Zko1dzlBWXpqTUJpV0hMdmowSGpxcWtwNkwxRmNKOUVP?=
 =?utf-8?B?QW8zb1Z2SmFBRkFCek1qRnRab2FRemUxeTZ6OWVHbzNCOXhoWjJ0Q1Fad0Y1?=
 =?utf-8?B?bVcxY0FOZW9HaU1VQTAyV2RweGVBTlRobXZPOXdTbkM0M0R4UFJjMUx0MXp5?=
 =?utf-8?B?ak16L2IyZFhDUGxMTGVVR0g4QkNzWUxja051c2IrTzBwTDdsQXpHN3A4emJL?=
 =?utf-8?B?MnZEd2twTE52L1lYdWxnWHVOdmpCOXhZRFN5S3crYXFOUFZEVndSRHhxVU5l?=
 =?utf-8?B?SWNlaVNrVHFsMk9lMU9ob05DUXJBSXp5M1oxZC9ZQkFJQzBiSWw3djI3aVI2?=
 =?utf-8?B?TGxwbWYxUWJQQWpFa0tUbUdkeHdCaHpmcXdFTktUenNVNXlKU29aeHpRbFV2?=
 =?utf-8?B?UUFuMGFlNG8yanhSQzdBUHFPS0RFYWZYaDRCWmNJcHZxZWZuckQvczJpV21z?=
 =?utf-8?B?cmgvTWhpYVZiWTIxYWZxc2V5dU5MRi95Qmszby9zcHQ5aDArZHNkMFJ3Vit6?=
 =?utf-8?B?RHZZT0FHZWtRRWRKN0dmYUhUa3JzZFZvK1N6NjB0ZC9hS3FHRDFzSW1Oci9Y?=
 =?utf-8?Q?GlTpM0eziq3AEkGybzYJUqoB1IxxLqpv8kYEs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(376012)(366014)(1800799022)(38070700016);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0545CF19207DE140B3FF424CBE2F059A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10655
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	773bc698-3bae-4a12-3a85-08dc95ee2c51
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|36860700011|376012|1800799022|35042699020|82310400024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q21kZFlXMmV1eXg3N3hncUFQMXVsZ1dOZEVHcWFYeG83SFFrWkN2MTlENitB?=
 =?utf-8?B?TS9yRzFpYzhLaWoxZ3dTd3kwVGJJSmlIVisyQTlRa2ZDTTY2akhwNUY5MDQ1?=
 =?utf-8?B?UndoQVlJVjE2Z3picHZLZWRuT0pZOGt6RytOSzZrd0RTSE1MUjFIaG5EVTRE?=
 =?utf-8?B?cEd3STEzWlp6K1AzbTFIVEZDOTlDOGVjbW1pUjNaTjJOOTQ0REV5ZDlCNlEy?=
 =?utf-8?B?Mk9NanJsejA5S3hQb3p2S3BBR3ZhWFpZZFEvMnB1MHgyTUt6bytibFI3dFV5?=
 =?utf-8?B?OThCZWM0RFFRdjRrenBvVld1REV1RFFzcVlpN2ZOb3ZUTnI4OHZPMWhnbjdk?=
 =?utf-8?B?MHJ6czJpcXRGOW9ZWHFkVFEwaWZGVTZyMDJtdkFza2RrWXk0VHJkZjdsaHhO?=
 =?utf-8?B?L0xwSkxmU04zZUNqaU93dTNveEM2dWREcWhCdzEvd24zTFFiRUo4bmt6TmRW?=
 =?utf-8?B?NGtMOFNJWEpDK2ZrbFZ0L0tMRjlhdWl5M0Rpb0ZFNHFlcEhrS2ZtcXhTRWFO?=
 =?utf-8?B?Wmc3MEdvM2p4Z3BBQTFQd0JPVVdTR0VmcWxjUUtyK212TWdXc3VCUWpqajJP?=
 =?utf-8?B?eFBBY2ZhYmN2ZVFEMzB3b2wzeGJTZjcrNFlOTGpRWmRWcVNIdGErVGZxY2xo?=
 =?utf-8?B?b1N5bEUraXh0Nm9nS0pId3J2Yld1UGFYOXFrVjg0T0xsb2oyNzI4eHhXOFo5?=
 =?utf-8?B?b1lpcWxBWkRPekx0RnN0ZUVlSWNUaDF1dnZXZ0w1UDRKNzEvczNWcXFFckpE?=
 =?utf-8?B?UjVxeSs1NUFtaXMxaTRzMEJFRXhoeW5SZDBLc01FYkY1TzJhUUdyQnkrTHht?=
 =?utf-8?B?WGZPTU1sQlZlOWpYWEdESHBYZExvTXV6SlMyMEVtR1RhVGlodWdMRVBDWXgv?=
 =?utf-8?B?ZDExR1NGSHpkTXdqUjdFVi81c3VKRmF2M25ER25NT3JFdzU5UStFZjNYOG9o?=
 =?utf-8?B?WTdjdGlVTE00VGVLTkZEQ1p4a1Nva3NhNVh1TllkczdWbGZyUG9ENGFSMzhp?=
 =?utf-8?B?dktQekwwWWtXbkx0b0c2K2xSZ3UyeWRicndncytrcEFqTWNhU0p0ek8xaFQ5?=
 =?utf-8?B?dFVaSGhhY3ZpT2NxVWs0ZjhoOUpuZ2VPU0hhclBTSE54RFpVUzNzS3lUOWRZ?=
 =?utf-8?B?TjdwU2hlMUdqRHdmOXZsOGpIVlJqSlNldm9ELzdUYTI5enBjZVBuT1VqcmNJ?=
 =?utf-8?B?TE45NFlHQmRjOVE5V291K2N3MnlseG0rZCtTRG1WOW9Gck92YVhqWld0aUVI?=
 =?utf-8?B?emZvRGNHSHh2aUFBS3JQSkpmcjAvQVNjNUJxTEh2WjZKL3V2NG9hbS9DWG1J?=
 =?utf-8?B?Z05ERXNxNzdieG5ROTViRUtUOURlZjN5K1c0QlZCZGV3NGZYL3p2UWVZK3F5?=
 =?utf-8?B?R2VlR0JORThyV05NMUxlK0ZwZkJyN1M1MkFFaUpMUG1nQUJvZUNpNnF3Y0p5?=
 =?utf-8?B?aGhEMXV3NWptK1p1bFlXYjNkYUhiWVRualdjaC9oRjNxT0d4M2FVZ2ZUbmN2?=
 =?utf-8?B?em91L2VVZUlUWTdJbTlnYlBQdFdQZjNaWE5QMU4yM2RtWTlXK3FodFlPSk5x?=
 =?utf-8?B?MlNRL2w1amtaSU16L1F4T1VSSlpxMkJkVDlHaEtONGdxTHJiOWk5cW9FRWVn?=
 =?utf-8?B?V000L1pPaDlpYUxXY3pJKzlvNURkUlpTVDk5TjdXMjh5VEZsMWNxVlo3UVh6?=
 =?utf-8?B?cU1iOTRBY0trTEpPWnc2TmhyQzFFT0RKbDhXcWdKQ3dsSmNYRUpjTG01aGpv?=
 =?utf-8?B?WnVEVWJDS3ptQS9nT0VvUGIwZTl4WU1oejV2V0lIRk8yWTgwOEZFc2t0K2Q1?=
 =?utf-8?B?bFU4Q2FyU0ZYcnp1V1VBNWsyRXk2OGxIQW5ZS3N6S00vcERTamJScEhYelZq?=
 =?utf-8?B?a056SzlZbkVHWEpUNG8wUExoVVNtTEM1ZkUwRVhQZnExL2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230038)(36860700011)(376012)(1800799022)(35042699020)(82310400024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 14:42:26.1528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5458690f-63a4-49f2-0bbe-08dc95ee3281
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9917

SGkgTWljaGFsLA0KDQo+IE9uIDI2IEp1biAyMDI0LCBhdCAwOTowNCwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBNZW1vcnkgbm9kZSBwcm9iaW5nIGlz
IGRvbmUgYXMgcGFydCBvZiBlYXJseV9zY2FuX25vZGUoKSB0aGF0IGlzIGNhbGxlZA0KPiBmb3Ig
ZWFjaCBub2RlIHdpdGggZGVwdGggPj0gMSAocm9vdCBub2RlIGlzIGF0IGRlcHRoIDApLiBBY2Nv
cmRpbmcgdG8NCj4gRGV2aWNldHJlZSBTcGVjaWZpY2F0aW9uIHYwLjQsIGNoYXB0ZXIgMy40LCAv
bWVtb3J5IG5vZGUgY2FuIG9ubHkgZXhpc3RzDQo+IGFzIGEgdG9wIGxldmVsIG5vZGUuIEhvd2V2
ZXIsIFhlbiBpbmNvcnJlY3RseSBjb25zaWRlcnMgYWxsIHRoZSBub2RlcyB3aXRoDQo+IHVuaXQg
bm9kZSBuYW1lICJtZW1vcnkiIGFzIFJBTS4gVGhpcyBidWdneSBiZWhhdmlvciBjYW4gcmVzdWx0
IGluIGENCj4gZmFpbHVyZSBpZiB0aGVyZSBhcmUgb3RoZXIgbm9kZXMgaW4gdGhlIGRldmljZSB0
cmVlIChhdCBkZXB0aCA+PSAyKSB3aXRoDQo+ICJtZW1vcnkiIGFzIHVuaXQgbm9kZSBuYW1lLiBB
biBleGFtcGxlIGNhbiBiZSBhICJtZW1vcnlAeHh4IiBub2RlIHVuZGVyDQo+IC9yZXNlcnZlZC1t
ZW1vcnkuIEZpeCBpdCBieSBpbnRyb2R1Y2luZyBkZXZpY2VfdHJlZV9pc19tZW1vcnlfbm9kZSgp
IHRvDQo+IHBlcmZvcm0gYWxsIHRoZSByZXF1aXJlZCBjaGVja3MgdG8gYXNzZXNzIGlmIGEgbm9k
ZSBpcyBhIHByb3BlciAvbWVtb3J5DQo+IG5vZGUuDQo+IA0KPiBGaXhlczogM2U5OWM5NWJhMWM4
ICgiYXJtLCBkZXZpY2UgdHJlZTogcGFyc2UgdGhlIERUQiBmb3IgUkFNIGxvY2F0aW9uIGFuZCBz
aXplIikNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4NCj4gLS0tDQo+IDQuMTk6IFRoaXMgcGF0Y2ggaXMgZml4aW5nIGEgcG9zc2libGUgZWFybHkg
Ym9vdCBYZW4gZmFpbHVyZSAoYmVmb3JlIG1haW4NCj4gY29uc29sZSBpcyBpbml0aWFsaXplZCku
IEluIG15IGNhc2UgaXQgcmVzdWx0cyBpbiBhIHdhcm5pbmcgIlNoYXR0ZXJpbmcNCj4gc3VwZXJw
YWdlIGlzIG5vdCBzdXBwb3J0ZWQiIGFuZCBwYW5pYyAiVW5hYmxlIHRvIHNldHVwIHRoZSBkaXJl
Y3RtYXAgbWFwcGluZ3MiLg0KPiANCj4gSWYgdGhpcyBpcyB0b28gbGF0ZSBmb3IgdGhpcyBwYXRj
aCB0byBnbyBpbiwgd2UgY2FuIGJhY2twb3J0IGl0IGFmdGVyIHRoZSB0cmVlDQo+IHJlLW9wZW5z
Lg0KPiAtLS0NCg0KSXQgbG9va3Mgb2sgdG8gbWUsIA0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5j
ZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQpJ4oCZdmUgYWxzbyB0ZXN0ZWQgb24gRlZQ
LCBJ4oCZbGwgcHV0IGl0IHRocm91Z2ggb3VyIENJIGFuZCBJ4oCZbGwgbGV0IHlvdSBrbm93Lg0K
DQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KDQo=

