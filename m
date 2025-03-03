Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB498A4BA63
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 10:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899989.1307928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1oS-0008Qc-Nk; Mon, 03 Mar 2025 09:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899989.1307928; Mon, 03 Mar 2025 09:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1oS-0008Nw-Kp; Mon, 03 Mar 2025 09:10:12 +0000
Received: by outflank-mailman (input) for mailman id 899989;
 Mon, 03 Mar 2025 09:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W32C=VW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tp1oR-0008Nq-23
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 09:10:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2614::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b7eb229-f80f-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 10:10:05 +0100 (CET)
Received: from DU2PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:10:2b0::34)
 by AS8PR08MB9314.eurprd08.prod.outlook.com (2603:10a6:20b:5a5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 09:10:00 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::50) by DU2PR04CA0179.outlook.office365.com
 (2603:10a6:10:2b0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 09:10:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Mon, 3 Mar 2025 09:09:59 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585");
 Mon, 03 Mar 2025 09:09:59 +0000
Received: from L2d7f5f37ff74.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C20131F-B2A3-44DD-9067-26DDA6BF5898.1; 
 Mon, 03 Mar 2025 09:09:53 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L2d7f5f37ff74.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Mar 2025 09:09:53 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB6590.eurprd08.prod.outlook.com (2603:10a6:102:152::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 09:09:51 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 09:09:51 +0000
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
X-Inumbo-ID: 4b7eb229-f80f-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bmMVZVnWpijYu1p0FJUSGm031vEI425i3Zlikp/q/O2O1+5cLHWzVFXMYoZjyqidkguIy7PSyDJLA2CdyzQNSpsvvvYBATB6Ot6msrmg98q6bTe7ln8IkDlkzkktXgJ6yYV9W/zdHjG0/S3aTobv5DopZiwsOx81jLB+YKaUalKMDFu8hBt4f6UTuXL84IDFFPOhLEUd/QoN9v4rMhtHQ7I7Zp2GzgW+nAQ3QwIrNLTfpqfv9NdzjOsRA3HpHnjxTavbdUwPuUuxfvK+regRUc2dRg+uGBXtMKt7F7DUSkuLS7HAoZIdz+u1IzUQrAM1e3Af73W9+KT38T3iESfOPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLtSEBtH/YOjom9ksXtwr6R3PBcM23fI1z037HRSkg4=;
 b=t6JJyT1RlL/7JZ2LgcKnUUzW1ZEjzfueWQs84Z5YZorWGMuKgyxRGMnhLI36GijA439d8EMr/lBgyZE4QLqozvhXd8OE5/+UE3pPeUp6XjDAdM/egpfyJL/L17UbVQf8Smg7J0c8W0DuX62h6EYINBvJcDKCO5OC1qA9l/PmTvFssFxUR+SYvqEPx8ldjKzlyihaqVN2XeAYB0ERR0Oent8CR+uDZyzolR9yGdh+EIIbvBGBDBHFKvQJDdjpR0FDkmhM9IclqKX/xiqJuyj8i9yM/wM5C9Fo9Tif+GpstTSIMC6OA6z/Tj4miAlnnL7saT4iRJVZORk82t5LfR38Vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLtSEBtH/YOjom9ksXtwr6R3PBcM23fI1z037HRSkg4=;
 b=Ta3QVgplm5mviYitBF7WvwfMrnKSWmc9WjOA6Fzu9Dv/2CRy7sisiDGCvQ/5jXA1fb3ssGbubi2SFTxDK8x+Wz+J/aCy+QomtVYRgp5y1mi92uWFgiVLq4TAlcaeOPr6rw7PmUduTGEtyHpe9azxKcP6BjzWK4QgPsFxrjx0UoQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51414e6af33d89d7
X-TessianGatewayMetadata: Lu2rRnTd38ETXy51pMq/YDPwD/1SVL5LKNw9QwvyH/NWW9w4hw3NuA91be8AjPHobiZI4a++5m0ngpZKGuu7WRkSjDYY0jmvbe27BWWyqC7lh/dnGVzQizRz89HpcDHC8zXT+CQDMEqj16hLOn4bym6WnuQLB2oTRG+EeOPC0BE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmakqQHSqGKDibiJNiYKnjAHYDPjak/Kh+JXOlcUdV7/Qk+hk4WxI8qBgIuL7/N4fw4D9OQPw3bMBrjVacWwVpK5KsJu5CYa8Wd2yHXoAAx7oO0nx0DMV1zQc2K5ZlGe8LqyPIG+1u6cVSOuNaWg93sbEuFDCKZ94LMz0Pf0ih561Jp9AFN9uxJtB7/lXRf1oHhopEZzDPsRzJPNW8l1iowoRB4J6aZNzYuqxp1Uy5eBY8duE2rfU048hd2QydsuKJV4+Tdx7PbY99Nmiy9Y2lWCd6JNjeg4WVz81WFPUHrjtXF66swBH0flqLlR259T9ptF9Jks1QbjfBS/2oTwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLtSEBtH/YOjom9ksXtwr6R3PBcM23fI1z037HRSkg4=;
 b=Y90MZYNYym6m5g8vgRy+F79kGALlELZ98xR1bnCH8qIPGQTJX8EjiGWDkE3eoPSeM4z7w20a9X3BOh2JExf6Z1AAix5oT9ykMKEzWEaKXgJMeonWiQQVKJ4fHSOSawJlLuXKP9rTix4WxmhNlxb1tC9Inw77CgMEeYqrUyyHr00XFNhZPjsaHykI3GObynar4BTtAs+jsTMZVBUPum9T6PwjiNBobwNuKpwR8e5fdn+ldIF4FWEq+ekbYPWLrrxVEhGLUskwzS0ctLwnuBpWEsMN0LUNpju6rryXvU8EUqSBv/FV+QmMEHZE1m3Bjn6JDjTwsuhuGFW8JvAEo4l0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLtSEBtH/YOjom9ksXtwr6R3PBcM23fI1z037HRSkg4=;
 b=Ta3QVgplm5mviYitBF7WvwfMrnKSWmc9WjOA6Fzu9Dv/2CRy7sisiDGCvQ/5jXA1fb3ssGbubi2SFTxDK8x+Wz+J/aCy+QomtVYRgp5y1mi92uWFgiVLq4TAlcaeOPr6rw7PmUduTGEtyHpe9azxKcP6BjzWK4QgPsFxrjx0UoQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: dm: Bail out if padding != 0 for
 XEN_DMOP_set_irq_level
Thread-Topic: [PATCH 1/4] xen/arm: dm: Bail out if padding != 0 for
 XEN_DMOP_set_irq_level
Thread-Index: AQHbjBo7t73Clnqihk6b69GmAQ48FLNhH8gA
Date: Mon, 3 Mar 2025 09:09:50 +0000
Message-ID: <711E9F49-572E-4727-BD78-5CD34D71B4DB@arm.com>
References: <20250303085650.74098-1-michal.orzel@amd.com>
 <20250303085650.74098-2-michal.orzel@amd.com>
In-Reply-To: <20250303085650.74098-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB6590:EE_|DB1PEPF00039234:EE_|AS8PR08MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: d2baad2b-134a-4123-687c-08dd5a332ca8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?NYhUnNrmF6WVYUhY40hKkhKsfk3+I5cbjP3Z2/g5D/cE6koEjqYZI3ZBXria?=
 =?us-ascii?Q?E/aH6uv3JAzqrc+ArylgxZu6CwUfDYh2A8r0AYfhK+1wLFMmgTMY7xM1GAW2?=
 =?us-ascii?Q?0i2SUB/5SEHwqiRtbDYMahP23vyzIB9BdwEj5iV0tQR0fweLb453kM+8+fkc?=
 =?us-ascii?Q?CWrOhtkpAUQAwvsLRFDBzhFKUk93QwqauYezDRRejqa8B5WelOYUTy2Ws3QO?=
 =?us-ascii?Q?uTDRZmQ7TkGfrR2ZktMwp2Glxc0qXZoVtZ0+XVW/3uisyBJAi5qiuU1q7o3/?=
 =?us-ascii?Q?reTt09TZUTdXbrGpaWik6WZjuPeedPOpY7Ufauma9dz/bcVQhzSG9p4By77Q?=
 =?us-ascii?Q?StV/RZL/6mwyztOgt4ed1+sRRHVo+rt4CJdgCYu3nOYJp8mKXccMMoKYBmrp?=
 =?us-ascii?Q?GeJGzqBueMM3Nu5yXWPFRhTwGA5zILy08TniSEZ0p2cHBBOKXGxuuIazCs/P?=
 =?us-ascii?Q?3K8+InrWPCCDAq18P3G8i+5eunLj5wdAzhVkhOnAWPPl6jKRWiu0boNBrH4q?=
 =?us-ascii?Q?HxbE08/9nOPb+scgsZp54x0zdONWmyGozVsXzSwAo/DMyDDsYRRxX7MzR8Tb?=
 =?us-ascii?Q?o40GZhMWlvRugyXwKZVWDnwU5Bc0b547HeZ6Sh80h6btvzJ71Xkk1a+n5hqd?=
 =?us-ascii?Q?OTKHF4fj1cRIS6GEvLw32bqbGjnenICFFLZfvwuiOMSHPH/WKqvOd1X3NHBd?=
 =?us-ascii?Q?AH6gcN/zVdlAl8ce6sQb1Yo2ybgeeG//c1LJQcP0A8XUC3ne7WRfP5PwEH+5?=
 =?us-ascii?Q?FdGcxx9wlOT7MH09SsaWYjLKbVAeT8U4U5e99tV4LV9lkVTYjSVjBzNwMQG/?=
 =?us-ascii?Q?vpnyWHlew/R+0ZKTGWzEm5cZ0puO+4Cbqh8a2KMbnEH3CpkIpJ2vuodAZXlL?=
 =?us-ascii?Q?E3Wl+ZlNfaLhTsva/Hin0L6tlFWYMMN1WY0gmB32LDX+JgK9pMDwjGFEFgj8?=
 =?us-ascii?Q?tLAqg88cpZwL3FTLxo6TUgm5/X/tFOk0lBTiZdlMIMxeyeW1s/kX8MHuh7xX?=
 =?us-ascii?Q?HXUbQaHULEYahM5pjrfCnRLC11McRGDgaFsu9U6CVCO1fK1+/ENBls9T0EJz?=
 =?us-ascii?Q?qVlbw82VRqqMU0KyUDryzEJhSBG3wvyuE9TLubvB1wG9LweM2/BLcMXTfnnW?=
 =?us-ascii?Q?pob5LARQNuTWWYOLgsaHvwQoRql7aCoDKiT346sqi1X+S1rrp/3BC6KFshAp?=
 =?us-ascii?Q?8fTwCzCqDDQId6/TnSo7DPiwksFImnB9p9RUTbZzpc+JnhiH7RgXY40qkLC5?=
 =?us-ascii?Q?6fDnhjB9EUjMoOjsn1PNfN+ehc/GdZANWj2bWVMnBDMV57UXMbVBiQChNKR4?=
 =?us-ascii?Q?emSsolBOHCYKon4jqSDDaJ+dJ0wmLfQ8RJxbNduhXl+kOVcRenzOMtbkrzyU?=
 =?us-ascii?Q?OsLRe9dCwDjBZKCT+HQ/dnlZ/1ya5t6TK+X5yhyO/u2nu2BAnq4P/plxeuhd?=
 =?us-ascii?Q?L+PoSpBe+/sZRZb8x0fggLxIjOugiH2u?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3BB180D9A38CCC4C87680424CB0A5B04@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6590
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19f6d8cf-01b2-4e10-ede9-08dd5a33278f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|36860700013|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9yyWOqTEDExxrInODi7Na+hq6zZfY0v8I9qWiNzhMDlDzxge2Rfopyo7Bkw9?=
 =?us-ascii?Q?knPX0To5bIODfzqBV9hR9GCruGVuUtiqnq150oKLyD0PlYtpdT72EDgWdu6r?=
 =?us-ascii?Q?4t4XF+YeF/HqBpYOhB2XZ2hr18qQd/sKCUGz/zr8cA6vacRiANv/c7xcejlP?=
 =?us-ascii?Q?pK0iWxcworaX6lodeJPMS30bFEt3/bTTCdFxlCERiJQ5OKccJ4eKC8QvR3eG?=
 =?us-ascii?Q?7syICulTGQyGNHBQAQcNZbvNwiR4f7IUiBvPPsjApOvXyHtOoQmw2x6bO8Cc?=
 =?us-ascii?Q?BRko/6I3rEJRLPqGm/C2NTU+1Tvn+IJIRxlzVm94ey1I8iL2niFLKG+pr5aZ?=
 =?us-ascii?Q?Ock7aYTq3JWWnvXmF69Ul/ngyvBGqgt5h0ma7ijLGOzlQWQ+gzCfaVxdmSIx?=
 =?us-ascii?Q?O4EjOw5pkzGw6getHKbNVhqi8SyERD8ZpkQq8Jp1T7tUt8INu3ZPSyGCUS9L?=
 =?us-ascii?Q?Ms+BIFtap2mXm7Z8yVs2FDxvyu4AMIpXM4evP098j5xNGAdljSrTKmPwtXnr?=
 =?us-ascii?Q?zzV43+2ZU5fLPDZY0OhYdiVr/SFxhj0AwMSDTLGQu91u1RSiSdeH/OWLjLY1?=
 =?us-ascii?Q?omI6nrbTR7fP3tpjFEs3cKFeL7kh74sFSUzqk4Ie9cwB6a3o8jMiND0laEKv?=
 =?us-ascii?Q?B+8Wr865IPFT3flUcTnw3s5gs4pgUO8LBRvP77EQOXAXI/6QoDDawGqAtPs0?=
 =?us-ascii?Q?WG+JR/+A6a8iZVkvSlFTeD4ZrsAKkWd+7xTZ2bhnFfNOM1zuWzf6KEkWJKqA?=
 =?us-ascii?Q?hQ/EZgtDg1iiQWUk2/OXhTDdQuPqPiYyJLItF5eQdeIlZ/lmX7Uw5viXQzZd?=
 =?us-ascii?Q?qpIysF71V9qG1hcaG50l+JXupGLpHwSt4h6vCZXs3txOEB2eKkwzfGP7vRtf?=
 =?us-ascii?Q?e+P2tquyBe4wO1XuKLELKj/e/scjwyKI9GhLOwNmruyejA++it2YtTeTZ/0r?=
 =?us-ascii?Q?OLccsU85R0WVPx2nPoGE/5vQKyVCqJbTEyhnam8QrxXE1unoRk924GgKAYr/?=
 =?us-ascii?Q?d+e9iql0ZXNXngbGuQLbwybuFPU0rws0QC/7hUIrQgrtY+oOllP+K6IwyI79?=
 =?us-ascii?Q?33uk2XM+us761nmmPFAKOKAsc+JReXJi3Y3XnBR2r0OvnktW5mXtu5qCew5w?=
 =?us-ascii?Q?j2d03Mr/I3h2Y4fWVvCVHgu6klXj7Q+UMmzhpkp5+6vbh5W5gHGcMvlD9DdU?=
 =?us-ascii?Q?tqjlrWF2n6YE7qUlcIRn1e0XKAG/7ZPdlhiF4DKiUV0Dsvu8BD61CFP4ZJL9?=
 =?us-ascii?Q?4urDPRCAwhBORLK3sJ8Ah8zRX5lbqAKYc/v4tbXWSBuI/7WBKUGG+KYi/Z/Y?=
 =?us-ascii?Q?aNi+jMB52kq0b5z68oCmr9qBZAIg5YdGJcew/QyydZSzS6Dleky5FfDUvEz5?=
 =?us-ascii?Q?gMYht/dNahsCNx8y0v/tRFlmFpMSyLYepEyZGw1bshhP93jxZoZr91SqlHWP?=
 =?us-ascii?Q?dkZASiAJsX1lzjyqumdwJqYb7jhiEkC9qeCnvkDN9CRL1TFOTLWxCt8/RtF4?=
 =?us-ascii?Q?B8bGP7nTXR9xVuw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 09:09:59.5388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2baad2b-134a-4123-687c-08dd5a332ca8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9314

Hi Michal,

> On 3 Mar 2025, at 09:56, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> XEN_DMOP_set_irq_level operation requires elements of pad array (being
> member of xen_dm_op_set_irq_level structure) to be 0. While handling the
> hypercall we validate this. If one of the elements is not zero, we set
> rc to -EINVAL. At this point we should stop further DM handling and bail
> out propagating the error to the caller. However, instead of goto the
> code uses break which has basically no meaningful effect. The rc value
> is never read and the code continues with the hypercall processing ending
> up (possibly) with the interrupt injection. Fix it.
>=20
> Fixes: 5d752df85f2c ("xen/dm: Introduce xendevicemodel_set_irq_level DM o=
p")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> xen/arch/arm/dm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
> index 773a0a259272..fdb3d967ec98 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -93,7 +93,7 @@ int dm_op(const struct dmop_args *op_args)
>             if ( data->pad[i] )
>             {
>                 rc =3D -EINVAL;
> -                break;
> +                goto out;
>             }
>         }
>=20
> --=20
> 2.25.1
>=20


