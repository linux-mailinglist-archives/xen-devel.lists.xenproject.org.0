Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F18A4BA73
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 10:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900020.1307958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1pv-0001nu-NG; Mon, 03 Mar 2025 09:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900020.1307958; Mon, 03 Mar 2025 09:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1pv-0001mx-J0; Mon, 03 Mar 2025 09:11:43 +0000
Received: by outflank-mailman (input) for mailman id 900020;
 Mon, 03 Mar 2025 09:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W32C=VW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tp1pt-0008Nq-OP
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 09:11:41 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 844f88df-f80f-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 10:11:40 +0100 (CET)
Received: from AS8PR07CA0014.eurprd07.prod.outlook.com (2603:10a6:20b:451::11)
 by DU0PR08MB7438.eurprd08.prod.outlook.com (2603:10a6:10:355::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 09:11:33 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:451:cafe::2a) by AS8PR07CA0014.outlook.office365.com
 (2603:10a6:20b:451::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.12 via Frontend Transport; Mon,
 3 Mar 2025 09:11:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Mon, 3 Mar 2025 09:11:32 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585");
 Mon, 03 Mar 2025 09:11:32 +0000
Received: from L74e6d75403e3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72664BC5-45D1-4D00-8A70-98C94D02308A.1; 
 Mon, 03 Mar 2025 09:11:25 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L74e6d75403e3.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Mar 2025 09:11:25 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB7616.eurprd08.prod.outlook.com (2603:10a6:10:320::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 09:11:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 09:11:22 +0000
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
X-Inumbo-ID: 844f88df-f80f-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A/RevZ6QtMAWN4eajEXDslFZIOeQa3C+Qlvur7322C0XJ2eW0F3WRHq4u06rOGKgH6q2TbEMYM7UMEUsRpwvPlMHsL3dik3p0raaZhbZ2+L13aJo/NU0oYP5ezc0LapmHKuThU2EX+bW6WzIQjLkx10wZnBXFicqs1KzGSwvyAjsih5tuRq6bw3BmAMFCAhPH3h4S/a1SpksaACMJgZrwB2tjaN6D8pO//W96GFa4e6yfPO0Tr1lvFb7vzhua+XEjXhYshzexiO2MZvyiqmlg+4Gco11gNfIGq5GqRnjAi3Eb0jofQ4A3XDth1y2HjuE4uey2tFwKpRJut73DJWvEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrEXBmqtB2OL9PYLmDwtUZ3XLsOvcPaENUy9zLZo234=;
 b=N2+HZuGrWafembRFs6DPYXmgqUEvs9fbbgkZzJ8norTJlg9DDSuadtag0QOQMmL16oncX/yDjrWYOr9feXMmkDWi/gbiTcDAqU1qecjHjPLIVjG1scuT1GckE9L+UnqOWSTv2X12kZ1hWoEbg+fE/nVT/kh46UnM8ZHYWp2ADhwrHRi/SkgkGEeUkHOuTfUpWvza2jK7Kd/4RnRW/T5H2i6T4a30JosofZ1Vono8H0fxp4SKOujrnRUBax+DmUFPQ+aOVC8EawrTVqKsUZnQGSXAZ7RX/A5vuKJAP7CoL/4I2fTqczyaHtz0knPzgBKHn19K5yKZOHIMzv4+wIswcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrEXBmqtB2OL9PYLmDwtUZ3XLsOvcPaENUy9zLZo234=;
 b=fDZ6kcFWfcjzB1it6pxe0xh1rIWaPk/QYy05uUzUGABfAUw58n/YHP3n4QcezWq5rfOLX7nvsD7XOK6Q3zFMpefgDyl0fKYG3mXcmhx+FA6XbCGWZu+SeZ1vKLz9bBolAVenQVydghXqUrq6v0CYaaSkBziu1p99czbVljrr6T8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc3e18ff044188b0
X-TessianGatewayMetadata: ax2Ov8GNp+dJby6astGx1v58mt780/tyNdU4waH4cEbYlilaCd48X7Woyc0JjeGughrvbS1b6CQWRUoPXhUhK4x7dScy7XVyr6lA03h2CyUNZ785VLslDtusw/fvM54fuQT0MxtwZaqtokMVlWNoPZMMJJbeqR0UkR+2Ymv5CsY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZtmV8L81wMuKSHEVshBY0LGva+BAkzFvmYZ3IzBFU/WTMpAimpGmSF/EII/SJi2Y/62umfwSms1ncxFjFgnFhctLIHhs6z0NXk9Hs9/eFJcCOnfoiPLMk46zZ6OyAzykjfz+vsbnI5cYb2EP6igMk30xmu9zGc+0hy/QlVE5YDLyKPvQWedDvOPun50w+ldPHEa2vO2u3G0CIzk5P0mUO8yl3YECrOmLdLm6NmHYoKsJgF6Kv0H6M1aUs6TkYlO0k5F1/uuZsNscIw3Oq9ZCo/tbxxDe5sgXZ/2sqJPM+c2wvk7/9uJP2cHBp1L6Hkul12TVmZzPqmw1JTUaFv5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrEXBmqtB2OL9PYLmDwtUZ3XLsOvcPaENUy9zLZo234=;
 b=ER9oZzw939yaCQ3iU1hPvakqEoAPVwms2u/O8iOAQ5fp/V96BmXIgiIxFXWm2i7Onu9joXEWLgn60w6yxNs4tOJPycCp9sp9nhpPyV+G/4nZhLSdnrq7UnwSbdJPhcIyBApaR0iV5HtRvEa3GhIzs4YeBl5NTu0XNk9Ec/Y1SPixWlzKhA2ZPhTb5a6OBoM24/iDtJqGIpsAC+lL4wJyb/oBqKCsqCg1jlgB9eJm9zZG68abBrMWorgiJ+hSni0Ca+6IUC4ISFWqArZcLISUIJxBXn84fiQuOteNC3AMaYreNropGIsUTj+CEH9nekWleuoaomwCgaQCK9synQQABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrEXBmqtB2OL9PYLmDwtUZ3XLsOvcPaENUy9zLZo234=;
 b=fDZ6kcFWfcjzB1it6pxe0xh1rIWaPk/QYy05uUzUGABfAUw58n/YHP3n4QcezWq5rfOLX7nvsD7XOK6Q3zFMpefgDyl0fKYG3mXcmhx+FA6XbCGWZu+SeZ1vKLz9bBolAVenQVydghXqUrq6v0CYaaSkBziu1p99czbVljrr6T8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/4] xen/arm: Don't blindly print hwdom in generic panic
 messages
Thread-Topic: [PATCH 4/4] xen/arm: Don't blindly print hwdom in generic panic
 messages
Thread-Index: AQHbjBo/T2YeCrZVnUCj55dU9yGL9rNhIDYA
Date: Mon, 3 Mar 2025 09:11:22 +0000
Message-ID: <0514B625-C5B5-4842-A83B-27415F955964@arm.com>
References: <20250303085650.74098-1-michal.orzel@amd.com>
 <20250303085650.74098-5-michal.orzel@amd.com>
In-Reply-To: <20250303085650.74098-5-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB7616:EE_|AM3PEPF00009BA0:EE_|DU0PR08MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e54aa96-79b9-4484-b506-08dd5a33644c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?POycjkI8W9neBkqD0pE9mrsHrIwfo5QfyKWbeYcoHYuSYNhRqzIqkZceYpym?=
 =?us-ascii?Q?XQhgZreK6wnnXkhLfOMqF7mK4E+jsaaf9H6VWi+0deeouAZcnj2bah1uEHdE?=
 =?us-ascii?Q?sdpcL9qlkkPowE5L6aSdRczA4i5G5868z47H53QA8dQ5kE9Op76OuwELB6AK?=
 =?us-ascii?Q?Yho5FHoEk9iAuU/JohmqsRROG+Xz8jFoIJ8KrV49ObTtaQLoVniV+G8sKfKv?=
 =?us-ascii?Q?FaqmV/kHLd3tr5oZWxfMdBtL3vHrh0+Ai+4Tufucs+e6pOoeUqANjLpFWWv8?=
 =?us-ascii?Q?RI2C+c6b70P711aXTrI8Xt4FlXOBBsuHBfNFBHdLWb/r6EyIZGKV2Vw05Z87?=
 =?us-ascii?Q?op0P9/orIk4ipuKg+/JivOCyKWY4Sq3abwAitKMJdvDX7VHnwRRsTiMyoSO4?=
 =?us-ascii?Q?CiOXHKB7L6lQt/81YHnDMx0DYBtjfhDDptxqmMJW8jAjyITTnyItbpPFx2oR?=
 =?us-ascii?Q?dLk0MEBaCVt9MwQJu6bfp+mbAxsqF+/gX2GBepQ2DtWY/hexyDI4jW7xaQel?=
 =?us-ascii?Q?37ZkfOHzOAl/EyHFcSSDCbMND83rrFfaaqh01rhuGgSHXvQz5oTelrD3FwYN?=
 =?us-ascii?Q?IBPRU2BWYaKd2xsW9yvAiaxG4jZVeggU+mCUarHUdBsOzlnXPI2jqgp2B+Pm?=
 =?us-ascii?Q?xy1WW3eFowcJubuurdhjh8sOZYkX0wjaXqxr8S7hyweZZa9K7lTYNDe6nJbr?=
 =?us-ascii?Q?LvA/D3alFAm5Rw/bOP/kH5Dg+Gd4ONtOtaYBZhkZP3uMI3KEnlxHIKUnvk1V?=
 =?us-ascii?Q?ZqtDg5MjUki1sb6ecId3Ta82OIeQemj9ur0VQafZOkesWxJMtYSIvEfe3Qyp?=
 =?us-ascii?Q?0UCJpi/d455qqizkVrb09kzLPzgKzm50bKFG02IDXIfy7rhe288RDVcj+2H1?=
 =?us-ascii?Q?JKyB3Lu4Msriwq6ttHTwQhO09WlK2TaL+JK+szoEH4xcOO/JWF7w1kbnEize?=
 =?us-ascii?Q?L1DGEnQ+xCHQC7TklgM/MzyC5vdXi7G5qtHz2ojsnPzPSVJqxfQGf1yv+/X6?=
 =?us-ascii?Q?VU6bEzfGgVKMw6wDN8N/JMPXuhhBIVLeeqrEWOFMPhTKgJGpQjnvLU1GYbaL?=
 =?us-ascii?Q?g3hWsz0eHWGx8Y7LeS/WSjpfOW1iy2Sknb7IZGYfvQVm9mBtJCosi6GWQj72?=
 =?us-ascii?Q?uV4h+8htvUoZE5Ia8fNYbqxarEVKyrmee9bbJKberNWXzhZ1ubLbWix35oXA?=
 =?us-ascii?Q?T/0gLl5hF8Hi/KecF0baZdoxxU2NXQ6p1F4RyeXEe6GXBEWtaEAduR8CFO5a?=
 =?us-ascii?Q?yu60ypR489VrI5WvCs9CEOZSpUytVDAG1QVUhfqelk277tRyLUtbWx8E2Hyt?=
 =?us-ascii?Q?2r1Mn2zoyo/bcDDtujZozXX7ufd4ZjaPQvxg1PyWTUTAT0j3l/egcRVJKP8q?=
 =?us-ascii?Q?QqYZ+Zr+LQ4JlAZdgmqLdrrwD7+w2qnO56fYQSw68cJJf50vMbN1b6nxwgny?=
 =?us-ascii?Q?tLRsnO2WK2NM1SVF+Hmaw//72dkbhEvt?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD13BBE48683EF4EB92582FE29075C5E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7616
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cbde1081-d623-4a1c-27ca-08dd5a335e5b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|14060799003|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QDtvWiVI3LOvu4M0QDITZs3gFSYQB2bGt1/0HExtdk5M8ldtNY+VMDfsVdAT?=
 =?us-ascii?Q?AqjsHEBe6B2YJ1EPOn4yZUAcGvl6izUjIqz47UgybFoUTAPYYwTkH00udiAB?=
 =?us-ascii?Q?jvNLVwSxGxayiJSeZRhzrIFftA1cP/NJkovgC/QlhnKzjr4iTZST1tlwzq3Y?=
 =?us-ascii?Q?5OSYSfi4mlNmg/ip+QK5mDC+R5tclR+A54Ts6I3nHh/O7py7/2y3CtymV6KD?=
 =?us-ascii?Q?iK2702Zo7KrWOLlv3f2FN5aWLvNhzDNQu62QGU3QQjkI2I4Y1bAffb3AiPxE?=
 =?us-ascii?Q?kjKmBWCnquo1dc4Ef8rAX3+60CkHe/H16bK9LeImbywZBz74YRS7rjLtAkAd?=
 =?us-ascii?Q?Zfeif0gCw/y9vjFsxNuQI63Lv7H66Ku1HtEk9goeXP660hgmNUkbxKk88zh1?=
 =?us-ascii?Q?6nlj0PPvv1IEPuj8tOvKIzCnR2FdrxIGZS+mIbo4Jh73mc/zzWIGbOebgdiU?=
 =?us-ascii?Q?VCFJlBa90KX94vIuxt/YrG51L86mz6boWXZPUOjPkK0EE507QSNs/XvHxfDG?=
 =?us-ascii?Q?Yr0q8YRPnVfwFnE1HJzXi085wTUlGwOYElxhxDxF10zkvFP2v/VL7B4dArC8?=
 =?us-ascii?Q?4BoXwDnOwb1DGEOKOQbdI7XTfaO9CUhHjO6X6je6hBRdVFvUbYM28/loyT8X?=
 =?us-ascii?Q?sWIyj3m+Exi/F2mY9Vn2BMwOoIS8gdZxyp3/tWwRocExqQ4dqZcfMjW3+P0n?=
 =?us-ascii?Q?TmplBkrprCmDe7K700E0KPxZ/VNHNMlqicB43vUAYdnr+MsNqAIF3legu3Rk?=
 =?us-ascii?Q?Uch3ILt9mRIPMppNz0snsZ+O3iCbt8gJ6jk/B8ruTbEzuQQiiHsdv7DMzqUa?=
 =?us-ascii?Q?Fjxg8JrYZy/+BxrslC4WzLAIQM4IQmF061ExKMfT0m6WB339uV77IJWqQYMV?=
 =?us-ascii?Q?ry9mmIrOIj1vvnr5uK7WoK5NbDKNsuZNirm9o+jwTx+IjY/zrhk8hIjNz5rz?=
 =?us-ascii?Q?5K0sq0CjvqzUI7AAXTn8NXXft7eTHi+0P+zTTgQ5D+7/FA1Es2m7btQQcxsn?=
 =?us-ascii?Q?MTGHxMWqN+loxxDX56XuUudMrlTN5iU0JATd2an9bIYia4G65Iqv7F3HCi1Y?=
 =?us-ascii?Q?s4Y7F2nPmAIL1RZtT/eHupU0OcOCzt034IbVU0Mdn8jV2M0ctS/c91NsaGut?=
 =?us-ascii?Q?ZgHCBErjGGM/BiIokOQeoMhr0X7je69y9eOYBosNomVlE1raHlYFIWqElLia?=
 =?us-ascii?Q?MaWm+/rFM9JTayAjb68gGrzlGiHtsYzTHKJkWKxDjXfUQxJdWuimhuiiOdtE?=
 =?us-ascii?Q?X+i62RH2iR5epgRJxfF9Awzo2G9Hc8NVXnJPI8Cc2kYoIs4ZS8GjVS1hkHL2?=
 =?us-ascii?Q?8XAypMPjpiW5upiz8+y428AIgUxBjMhSJPpTcUvMX27M8CdU2PfV4I+sayAk?=
 =?us-ascii?Q?kiRelQtd29P8akY7c3zTIWaPHwYnvcv3MYeN/Cf/C34+k5ZYW4t6SkN1ZX9p?=
 =?us-ascii?Q?KS60OUDcRbwAdAi5pPJ11NBKCvq3WGL0avtL7ZGK3YONm2Bvf1N9OPfz6h7t?=
 =?us-ascii?Q?y/i8Hi8KKCMw0vA=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 09:11:32.8434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e54aa96-79b9-4484-b506-08dd5a33644c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7438

Hi Michal,

> On 3 Mar 2025, at 09:56, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> These functions are generic and used not only for hardware domain. This
> creates confusion when printing any of these panic messages (e.g.
> failure when loading domU kernel would result in informing a user about
> a failure in loading hwdom kernel).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/domain_build.c | 4 ++--
> xen/arch/arm/kernel.c       | 4 ++--
> 2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index fe05cf6d855f..6531fe019f79 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2112,12 +2112,12 @@ static void __init initrd_load(struct kernel_info=
 *kinfo)
>=20
>     initrd =3D ioremap_wc(paddr, len);
>     if ( !initrd )
> -        panic("Unable to map the hwdom initrd\n");
> +        panic("Unable to map the %pd initrd\n", kinfo->d);
>=20
>     res =3D copy_to_guest_phys_flush_dcache(kinfo->d, load_addr,
>                                           initrd, len);
>     if ( res !=3D 0 )
> -        panic("Unable to copy the initrd in the hwdom memory\n");
> +        panic("Unable to copy the initrd in the %pd memory\n", kinfo->d)=
;
>=20
>     iounmap(initrd);
> }
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 80fad8b3362c..6eaf9e2b06b3 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -150,12 +150,12 @@ static void __init kernel_zimage_load(struct kernel=
_info *info)
>=20
>     kernel =3D ioremap_wc(paddr, len);
>     if ( !kernel )
> -        panic("Unable to map the hwdom kernel\n");
> +        panic("Unable to map the %pd kernel\n", info->d);
>=20
>     rc =3D copy_to_guest_phys_flush_dcache(info->d, load_addr,
>                                          kernel, len);
>     if ( rc !=3D 0 )
> -        panic("Unable to copy the kernel in the hwdom memory\n");
> +        panic("Unable to copy the kernel in the %pd memory\n", info->d);
>=20
>     iounmap(kernel);
> }
> --=20
> 2.25.1
>=20


