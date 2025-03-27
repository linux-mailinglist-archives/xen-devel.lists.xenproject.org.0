Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF0FA72B6B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928633.1331323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiYX-0001rb-Nr; Thu, 27 Mar 2025 08:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928633.1331323; Thu, 27 Mar 2025 08:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiYX-0001pY-Jr; Thu, 27 Mar 2025 08:25:41 +0000
Received: by outflank-mailman (input) for mailman id 928633;
 Thu, 27 Mar 2025 08:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yWE1=WO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1txiYV-0001oW-R3
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:25:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2612::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d821651-0ae5-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 09:25:34 +0100 (CET)
Received: from AM0PR02CA0123.eurprd02.prod.outlook.com (2603:10a6:20b:28c::20)
 by VI1PR08MB5453.eurprd08.prod.outlook.com (2603:10a6:803:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:25:27 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::c5) by AM0PR02CA0123.outlook.office365.com
 (2603:10a6:20b:28c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Thu,
 27 Mar 2025 08:25:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:25:26 +0000
Received: ("Tessian outbound 8df300e92501:v604");
 Thu, 27 Mar 2025 08:25:26 +0000
Received: from L9519e188a115.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FE448D4-928B-43D0-9389-4F42E26BD56C.1; 
 Thu, 27 Mar 2025 08:25:20 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L9519e188a115.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Mar 2025 08:25:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB9568.eurprd08.prod.outlook.com (2603:10a6:102:2f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:25:18 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:25:17 +0000
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
X-Inumbo-ID: 0d821651-0ae5-11f0-9ffa-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BYtUP7NdCicYBfgS6zFrIl8wdFcWTdf1/HSNAq706CLOc38rpx5WDcv87MMh3DfausPMCFLq3kbuAEaKa8mqLJ9zcMplBI2ET8Bg3HChJQQSFYMBF1KH+Gtd3uIK68udA3xWe2riHOfcfUOgIbZRxW8IWA4Ffbgg5lHooktuCVBRz3hjjEO6X5djpTESrBv83eU36UV/zC/POsF7tLfcvN6yV8rg5YFVUtQw+Qz6p8qdOE8r4QbR/4DZdrCGQKUrs2S/toWo6DRzdTWnjWuHf/KabvwihT2by+/ZeDID6J7GJUZPaqHFE8QJMwQgFheBViy2YhBj0xPw4dU1jzbtAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsWbQ8XPvQQavPeT9xIwqy5jPYVxgHMSp4EvJ2eDv/k=;
 b=amFjpyg94qfnBcmsAwVVo6TiRYBNyJn/zGkDH4VRdb9fMqkNy/uQvJBSyvPd47RCUa+s3UH57yCtXrxf7p7ZYw7/kLX8aZm6n9MyeQqSu5pEcXArMQjdH0tawbPpGahvst+oQLarN40QD5QxKmke5OagQB/uoZtn2u0jg0dtcACZbSUameE9Bwbn7PTJDIwxm+9hnqoWc2IIqZN0Ave94uUYrDgvPjOwBJjiUg6rtQ0xZQiiHNWBSQPVCYUxODUSR2qQKJuwwZQtopxA6KKlNROpqdP82xkmV7RNSEetCy1p2BOtyLtOzRcWlvuasTpZsH98BgUE92x9qlr79fe9Iw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsWbQ8XPvQQavPeT9xIwqy5jPYVxgHMSp4EvJ2eDv/k=;
 b=bvw46wnEbjAX/2X/IY3b0eRrigq9HVJ0FrHPuIHJOtmOaaa7Ag8wLnEIYivZ/C7b6xJ42/GUG/l9BakbtKqUxvnubCmyuw6tGIuUpOVVBbbhR6HevhkPtuX+CHEiiphEqRYj8euQOm2Cz5Gp39+cy4HeGyoklusaYgrl2QjXGZs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01ff917e7ade8b69
X-TessianGatewayMetadata: mZXUoC7cqHeXJtjrCM2a5JTQKzm6dq8z5f5UaegMFBSy9t+8D+yYqRMrlLq2enrhpbR/G682rLQbs5yV0J83vrXRIXg79beIKBA7UpYqoYKY4wV1qq0u4i7JP1yy5iZCf7r7nSIDkuN/BGwX6dDVhSnSKNN3+AosyK4Wv1Bw4rA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8nKAsXT3OZ9IA0bjSQ5kQVhhaqLjTgiQyB3atymA5s5SP7+i7aV+ARG6EWy4z7TiR/I387w+utQMVFkLZubAJr+wZo6oI97sOcrK5HOvQyR7uGcaKj9t2XVqVzbLMxNvrNxStp9U98dhWRDmnkJ8jA4xG+/DEhYmCbLZCwK1F4YYxFlRFwWtAHYFxvs/J3tznvCqPguyBcG26TxbVpSoP7bZ31cstqoAAkxW9eb4I7udG7Gr7pcvFYEjANolnYeezHwtIsAX7x2ItV/CCT5LMPD5OIP5RJ9DUvAjC3sgz0Va1++NMBng6mUTDKNZp+qdUqXY58ss0cIXK/zp2tq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsWbQ8XPvQQavPeT9xIwqy5jPYVxgHMSp4EvJ2eDv/k=;
 b=MEAl2ZoRDBlaSSCyl23TNN270gBUcRlWWaD7gzGj0HS/KnsVUAjE55+oONdhL9UH6NHk9utIUP6RpckIpOP/LXTH7PvncvTP0YveDaX+ZF5R3RngDqqPxznFrK1Da0bMOVDdW+67cXyQKE5wJO5dlxft451evcbd7eWZgRwPJdz0KRPuClV7SxaRAK9m21JDB1Rj/XIqMS1Xe9F+xq2EfAOesgYWq7GsdO9HhpiSWML3JkZfVoQuxBTJJFBkjZlAlam3tL+CZPH5WPTzgg02xEKxd7PS2EaQVN6OikBmzHJNhiNUDei2SIxO2OXY8lak1D9VCk3YjAffclOUTPWR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsWbQ8XPvQQavPeT9xIwqy5jPYVxgHMSp4EvJ2eDv/k=;
 b=bvw46wnEbjAX/2X/IY3b0eRrigq9HVJ0FrHPuIHJOtmOaaa7Ag8wLnEIYivZ/C7b6xJ42/GUG/l9BakbtKqUxvnubCmyuw6tGIuUpOVVBbbhR6HevhkPtuX+CHEiiphEqRYj8euQOm2Cz5Gp39+cy4HeGyoklusaYgrl2QjXGZs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbnMQnVQCSJAleWkGtVlVLXLrx+bOGED+AgACZt4A=
Date: Thu, 27 Mar 2025 08:25:17 +0000
Message-ID: <90051748-EA8A-4657-BCE1-EEDD1C4D080B@arm.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
 <338d8982-0a2e-4a40-a9a2-bed8f50d81e1@xen.org>
In-Reply-To: <338d8982-0a2e-4a40-a9a2-bed8f50d81e1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB9568:EE_|AMS0EPF000001B6:EE_|VI1PR08MB5453:EE_
X-MS-Office365-Filtering-Correlation-Id: e89e6ee7-a86b-4cc2-00f6-08dd6d08ed78
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DHpNPm43zshX9KuRyK9uZidfxtMavF0lGXyTNzdOfCqx1CfjL/aLXZfNH/jw?=
 =?us-ascii?Q?A35DG/iTw2wF9ZnyKn84EqmVJM2viR6HxHriOQF7b5lZ1y+0D/5TpT7gJ1PY?=
 =?us-ascii?Q?uWQKeu2nBBc5hCmRPjuWVKTGApOrd1NUyHWn+9g+ie7VzfsJnNgcTfMEfpCy?=
 =?us-ascii?Q?LBs5EOHVcq4sSLKcxuW7ls3FHQPqm4KSgECLkVzjofmnPDEcgcF1PyYN3NqN?=
 =?us-ascii?Q?Hle5R+g7Ldc6guSxD6abJzcTH1UwjgCrWo39I5flrRxrcja8DrZTUa6y+Bza?=
 =?us-ascii?Q?j7JE3B4lEWjoyh59D9Wx49Txklqe4pat0sNH8DovhJhFDJBpF+Sqeddq6ia+?=
 =?us-ascii?Q?2BhISB7BzrzcClljWGoZPZxSZQwZFMIz01HkmENR0I3vZXADLO0SXEPlSHHV?=
 =?us-ascii?Q?r7fJGbRrRQSzyMz/dCXOhFSKKZTDvcOVLpohbEDebgxYyyYJJVqpqaqc5ZIB?=
 =?us-ascii?Q?NaRcoyXvYm6yCJRlJgRqw7RLx++s93p9N/kgyghS7kw+GyNWItpuGuDorMIp?=
 =?us-ascii?Q?GAA5Vz0zi0PCAneAWSgezzJ9O34x3kr14J4A9dMJLhkZ5DFqd0d+Pds29nhF?=
 =?us-ascii?Q?LCgfIQXVU9GCQ3h8TwjpUdhqnQRCzj7ruNBBDfOQexENQOSG9ogBUzUzFxKh?=
 =?us-ascii?Q?Bt3PKHcDIJliMbBmWTkeOxSWrGWMf/NjJmzHHTyDAb4dhisvc2xYArL6FF3r?=
 =?us-ascii?Q?jlDa50V8IFPWFkP1TeLJ9yUN7r0G5xaZRyoIlolT7Vh8M+aUI6L1R15dDqPH?=
 =?us-ascii?Q?AW6QJRw2YoP1G+WRHebfJl4gavmLIsF9q/7JT4ew/oMd6ptf4pJJKBg1E5jG?=
 =?us-ascii?Q?A3njyB+Cajj/66EOGYLVk+MBZFL4ZT0tCS7DaUPFv1nnxtkTviT/7ExhAvv8?=
 =?us-ascii?Q?dcrSolyGH4rZf+SIge+rHIUpLv77bUuZkOBUDRUKY58xx/1N07Rfx76+Kg7A?=
 =?us-ascii?Q?xAsDyRAOc9b95ZDCz8KQAUi7QvfAuXmuxDofrYtLQservSFgofgL0SG3WdlI?=
 =?us-ascii?Q?dXUtN/UoyAlVCpdaHk87ej8TupPYxiTBbKjaqQR5NbZFVeZZxwLdB1z/Sg6I?=
 =?us-ascii?Q?CM7twPZ0jb1wZrP6HH+5fJURbvexDYzatW4MnQRJZGfAMGiaQ4SVunCOsms4?=
 =?us-ascii?Q?bq04G77xunzzJW21mlqGArLpzBakXhobUfq+a2Aqm5rPs8DXdGAXbdslnFwv?=
 =?us-ascii?Q?ziW7zy3OT+AUWbzMI2eh7jfETvx9NOwh9m/p2uSCxN7pB3LB6beU02azvZ4c?=
 =?us-ascii?Q?cfZKTBipoqH5SbRT34Wsx9b0FS7QqhWklilU8uUQV2YhtguiDEJvWF4yl71D?=
 =?us-ascii?Q?/xmLpaiPtjFX0+/9ZpX8b7Lojp3qz/aQZN4Stcmzhtn9vMTFLtELAKtLwrNw?=
 =?us-ascii?Q?375pgHwpZKjXiaSdMq2erzKEQn1G6i0Q29Qi8pS9oWutKB2x+tClNjoQyn85?=
 =?us-ascii?Q?cNRn35+IJSHwFmwQmZQHySBr7Gwte8X+?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79F7A7172AF9064FB4A3F9CBA93EEA69@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9568
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ba554b7-ab15-4d90-b17c-08dd6d08e835
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1MGW/WRO2B0My2+ag6rUA+7tM3CE80OFY2pOo4SwAVQpPpbwRbYY7ia/MzPd?=
 =?us-ascii?Q?qrR73Uzx445C0KOj6inUoO8ilLTulqpw1b8QkgNvp8UqoGuzQzEwv88twdXg?=
 =?us-ascii?Q?J79dV1BT/jhrUFR7biGN/isr/g9Rlh2Tidti+T33kr+Tq84ULM0VI6w1RD70?=
 =?us-ascii?Q?37TR85Yk58KCantuF+aBDSXDA7P23zusauYnymnCfb3EnMYL16cv3gK+cSx/?=
 =?us-ascii?Q?y6k/Oh0BKThTM4nWdyZ0SeOskcp2sFDwWBGpYZsTmRAYF8q3NeueiSkAVbff?=
 =?us-ascii?Q?qUdtgjnV3SM9FghzH1MLF8u5QQQ36IcsDYrVZ4V1f0T1M6x4JE9oP0zTbrHf?=
 =?us-ascii?Q?Xty0QnYj/37PJkHuMId/oRecxLXnU+isCRk9xYPrc83lUJEYPQ5PBzciZsaY?=
 =?us-ascii?Q?417uqsaKRWw/wUT6LlKkVUP1vmNp/NcYErY3xtbOVaGktg34QItRS4xT7/tJ?=
 =?us-ascii?Q?Uy+3lLJxEsejyLMIDdO4OQfYj9Vr5CGq42gEb9zaBZg72PtfYp+jGsoqApMs?=
 =?us-ascii?Q?vVpaG5M/6kjde/J9L+8DpMz1V710msJregvYs+lmGVyYfEFT11ab0f0E54sU?=
 =?us-ascii?Q?rbbXuJJb2N2ef1oiarovRGoYf4jsjuUSR0LFD6a2z0D5IE2kdb+4r2UTgAKA?=
 =?us-ascii?Q?P9SaJaYQg/ISfJsD29x4xwFSdnakYRwuODTIrMx0BcesXL6lLNPuxqYrSXn3?=
 =?us-ascii?Q?nzwKS0uVTYfFdSnnEwxZQVWTgefH2c4zfXNmwMN0Q1bTp2Trnd/f5GN6WEsq?=
 =?us-ascii?Q?qqsX9zXhwMH5wEc0tQW1HLrS25yOhIQts1hdQWRzxCl6pPWOSmV3yJA+VzJY?=
 =?us-ascii?Q?k5gE2xKoKAUVQ9SPylkYSmYzPMs1imIszmWn9wd8145c91xwrhoaqXp0b10t?=
 =?us-ascii?Q?fwXQoWOqvtRg1AGzW0bsrUiI97s7atDFv/7a5KG/aXtP9qoluRHvuDSdfQ7B?=
 =?us-ascii?Q?d/oCMv0affAZ75HWV1jVTiFJ9fjhH6fSejoTJnbaUN1yWyZ7NNk+SdLsUPuh?=
 =?us-ascii?Q?w33+4CQYtZabmt8QyBmGfk8+r/cTJFgYR8paQE4Ry+GpAj+xhu0156o6CrVL?=
 =?us-ascii?Q?79eHS/dxnRpr5BfAJFboHz70+raOBgRtrwibDoYd9YBYM0H4ZtGac7s3U3cF?=
 =?us-ascii?Q?CmsK0hiBbDJoWpTdGZB1sUPDRFisL+iRy16ou/DsQvTCjhlqwt+K7kSdJABw?=
 =?us-ascii?Q?zh1K17GWO6BW31FIQgjEAE3VxdZOtC7sZpFKn6SqvbO4ESIXsVQCFWl57hx/?=
 =?us-ascii?Q?qpihBZUi05x9Lg24ARyompoqUor28Pb9gyIbQ5wqFzzESu9QPfNXr54U/FwS?=
 =?us-ascii?Q?Odxpl2jrqBA1AKYtCOXiR+haq9msuXgWHTF2hEgKzTopz19HsNlXlPRDbLjV?=
 =?us-ascii?Q?PQWjfPQ36JioIZGKEV4ydA52Cv/EwMf2wqYwj2IPFu5XoBoyk0NUFuCJOVeY?=
 =?us-ascii?Q?4DQmNnZsZ+s48oeFEmalb563slxv+UKTSZX/cjJO7bBTHU6vSZU/WF+zT8ha?=
 =?us-ascii?Q?oCp4wT1PO6pf91kmWsBILlYtDDZj4xQkxR30jp8900iJvd6Ak4GCwEtdSw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:25:26.6615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e89e6ee7-a86b-4cc2-00f6-08dd6d08ed78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5453

Hi Julien,

> On 27 Mar 2025, at 00:14, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> I didn't dig in the spec and neither some of the callers. So I will mainl=
y focus on the implementation from Xen PoV.

Perfectly ok I think, Jens review should cover the spec point of view.

>=20
> On 24/03/2025 13:53, Bertrand Marquis wrote:
>> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
>> between VMs.
>> When activated list VMs in the system with FF-A support in part_info_get=
.
>> When VM to VM is activated, Xen will be tainted as Insecure and a
>> message is displayed to the user during the boot as there is no
>> filtering of VMs in FF-A so any VM can communicate or see any other VM
>> in the system.
>> WARNING: There is no filtering for now and all VMs are listed !!
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v4:
>> - properly handle SPMC version 1.0 header size case in partinfo_get
>> - switch to local counting variables instead of *pointer +=3D 1 form
>> - coding style issue with missing spaces in if ()
>> Changes in v3:
>> - break partinfo_get in several sub functions to make the implementation
>>   easier to understand and lock handling easier
>> - rework implementation to check size along the way and prevent previous
>>   implementation limits which had to check that the number of VMs or SPs
>>   did not change
>> - taint Xen as INSECURE when VM to VM is enabled
>> Changes in v2:
>> - Switch ifdef to IS_ENABLED
>> - dom was not switched to d as requested by Jan because there is already
>>   a variable d pointing to the current domain and it must not be
>>   shadowed.
>> ---
>>  xen/arch/arm/tee/Kconfig        |  11 ++
>>  xen/arch/arm/tee/ffa.c          |  12 ++
>>  xen/arch/arm/tee/ffa_partinfo.c | 274 +++++++++++++++++++++-----------
>>  xen/arch/arm/tee/ffa_private.h  |  12 ++
>>  4 files changed, 218 insertions(+), 91 deletions(-)
>> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
>> index c5b0f88d7522..88a4c4c99154 100644
>> --- a/xen/arch/arm/tee/Kconfig
>> +++ b/xen/arch/arm/tee/Kconfig
>> @@ -28,5 +28,16 @@ config FFA
>>       [1] https://developer.arm.com/documentation/den0077/latest
>>  +config FFA_VM_TO_VM
>> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
>> +    default n
>> +    depends on FFA
>> +    help
>> +      This option enables to use FF-A between VMs.
>> +      This is experimental and there is no access control so any
>> +      guest can communicate with any other guest.
>> +
>> +      If unsure, say N.
>> +
>>  endmenu
>>  diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 3bbdd7168a6b..e41ab5f8ada6 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -464,6 +464,18 @@ static bool ffa_probe(void)
>>      printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
>>             FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>>  +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>> +    {
>> +        /*
>> +         * When FFA VM to VM is enabled, the current implementation doe=
s not
>> +         * offer any way to limit which VM can communicate with which V=
M using
>> +         * FF-A.
>> +         * Signal this in the xen console and taint the system as insec=
ure.
>> +         * TODO: Introduce a solution to limit what a VM can do through=
 FFA.
>> +         */
>> +        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure=
 !!\n");
>> +        add_taint(TAINT_MACHINE_INSECURE);
>> +    }
>>      /*
>>       * psci_init_smccc() updates this value with what's reported by EL-=
3
>>       * or secure world.
>> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_part=
info.c
>> index c0510ceb8338..406c57b95f77 100644
>> --- a/xen/arch/arm/tee/ffa_partinfo.c
>> +++ b/xen/arch/arm/tee/ffa_partinfo.c
>> @@ -63,9 +63,156 @@ static int32_t ffa_partition_info_get(uint32_t *uuid=
, uint32_t flags,
>>      return ret;
>>  }
>>  -void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>> +static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_t *sp_count)
>> +{
>> +    uint32_t src_size;
>> +
>> +    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FL=
AG,
>> +                                  sp_count, &src_size);
>> +}
>> +
>> +static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
>> +                                   void *dst_buf, void *end_buf,
>> +                                   uint32_t dst_size)
>>  {
>>      int32_t ret;
>> +    uint32_t src_size, real_sp_count;
>> +    void *src_buf =3D ffa_rx;
>> +    uint32_t count =3D 0;
>> +
>> +    /* Do we have a RX buffer with the SPMC */
>> +    if ( !ffa_rx )
>> +        return FFA_RET_DENIED;
>> +
>> +    /* We need to use the RX buffer to receive the list */
>> +    spin_lock(&ffa_rx_buffer_lock);
>> +
>> +    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
>> +    if ( ret )
>> +        goto out;
>> +
>> +    /* We now own the RX buffer */
>> +
>> +    /* We only support a 1.1 firmware version */
>> +    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
>> +    {
>> +        ret =3D FFA_RET_NOT_SUPPORTED;
>> +        goto out_release;
>> +    }
>> +
>> +    for ( uint32_t sp_num =3D 0; sp_num < real_sp_count; sp_num++ )
>=20
> What's the upper limit of real_sp_count? Asking just in case we need to h=
andle preemption.

In theory that would be 32k but in practice the number of entries we can re=
ceive is
limited by the size of the exchange area we have with the secure world.

This area is currently defined to be one page and each entry is 8 byte in t=
he
case where firmware is 1.0 (24 bytes otherwise).

This is an upper limit of 500 entries.

Now I do think this is completely unrealistic to imagine a secure world wit=
h 500 SPs
so If you are ok I would rather define an upper limit in Xen (I would say 6=
4 SPs) that
can be changed in the code (through a define).

This call currently does not support preemption in the FF-A spec (and that =
is something
i will check for future versions) so I would have no solution to "continue"=
 it.

Would the "define" solution be acceptable for now ?

>=20
>> +    {
>> +        struct ffa_partition_info_1_1 *fpi =3D src_buf;
>> +
>> +        /* filter out SP not following bit 15 convention if any */
>> +        if ( FFA_ID_IS_SECURE(fpi->id) )
>> +        {
>> +            if ( dst_buf + dst_size > end_buf )
>=20
> Can "dst_buf + dst_size" overflow?

Well it would mean that the memory corresponding to the buffer in Xen
is mapped at a virtual address at the end of the 64bit space.
dst_size is set in the code (see ffa_handle_partition_info_get) so can only
be 8 or 24.

Probability is low but cannot be ruled out so I will modify the code to che=
ck
for overflow.

>=20
> Also, NIT: can you add parenthese to make clear about precedence?

ack

>=20
>> +            {
>> +                ret =3D FFA_RET_NO_MEMORY;
>> +                goto out_release;
>> +            }
>> +
>> +            memcpy(dst_buf, src_buf, MIN(src_size, dst_size));
>=20
> What's the maximum size of src_size and dst_size?

dst_size is set in the code (8 or 24) so there should be no issue here.
With the overflow checked upper we should be safe here.

>=20
>> +            if ( dst_size > src_size )
>> +                memset(dst_buf + src_size, 0, dst_size - src_size);
>> +
>> +            dst_buf +=3D dst_size;
>> +            count++;
>> +        }
>> +
>> +        src_buf +=3D src_size;
>> +    }
>> +
>> +    *sp_count =3D count;
>> +
>> +out_release:
>> +    ffa_hyp_rx_release();
>> +out:
>> +    spin_unlock(&ffa_rx_buffer_lock);
>> +    return ret;
>> +}
>> +
>> +static uint32_t ffa_get_vm_count(void)
>=20
> Is this meant to be called often? If so, can we instead have a counter th=
at will be incremented when the vTEE is first initialized and then decremen=
ted when the VM is destroyed?

As of now we could have a global counter that we increase or decrease
when a domain version is negociated and when a domain is destroyed.

We could also have some kind of global save of the result to be returned
to a guest.

But I did not do that because:
- cpu time required to update the list would be taken out an FF-A call
for FFA_VERSION of a VM which would require a global lock to protect
the data
- when we will have filtering the data will be per VM (which would make
the initial update more complex)
- incoming we have a notion of UUID and filtering depending on the
requested UUID which will make the global value only useable in a
limited number of cases.

I have 2 pending series on top of this one which would have to remove
such optimisations.

At the end this is definitely not something supposed to call often (linux
driver is calling it once during init).

>=20
>> +{
>> +    struct domain *d =3D current->domain;
> > +    struct domain *dom;
>=20
> NIT: "d" and "dom" are a bit too close. Could we rename "d" with "curr_d"=
?

i will go with curr_d dest_d to make this clearer.

>=20
>> +    uint32_t vm_count =3D 0;
>> +
>> +    /* Count the number of VM with FF-A support */
>=20
> This comment implies this is including the current VM. But ...
>=20
>> +    rcu_read_lock(&domlist_read_lock);
>> +    for_each_domain( dom )
>> +    {
>> +        struct ffa_ctx *vm =3D dom->arch.tee;
>> +
>> +        if ( dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0 )
>=20
> ... here you are excluding it. Also, it sounds like this is support by th=
e OS rather than the VM itself. Is that correct?

I have a comment to explain that one in a different serie that i will put h=
ere.

Basically before 1.2, the spec was a bit blurry on if or not the result sho=
uld include the
calling VM and in fact Linux driver (before 1.2) was ending with an error i=
f its own data
was included in the result hence this filter.

I will add a comment for that.

>=20
> > +            vm_count++;> +    }
>> +    rcu_read_unlock(&domlist_read_lock);
> > +> +    return vm_count;
>=20
> OOI, I guess this value is just used as an hint? Asking because the numbe=
r of domains can change at any point.

Definitely yes. The data is what it is when called but anything could chang=
e after.

This is mostly used as hint by callers.

>=20
>> +}
>> +
>> +static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
>> +                                   void *end_buf, uint32_t dst_size)
>> +{
>> +    struct domain *d =3D current->domain;
>> +    struct domain *dom;
>> +    int32_t ret =3D FFA_RET_OK;
>> +    uint32_t count =3D 0;
>> +
>> +    rcu_read_lock(&domlist_read_lock);
>> +    for_each_domain( dom )
>=20
> We can have quite a lot of domains in the system. So how can we ensure th=
is is not hogging a pCPU?
>=20
> I would be ok to delay the work, but we need a TODO so we remember to add=
ress it before this is security supported.

Definitely something not addressed in the spec for now that needs addressin=
g (as explained earlier).
We have other calls that can be "cut" and this one will need to support it =
in the future.

For now there is not much we can do and limit the number of SPs we allow wi=
ll not really solve
the issue in the VM to VM case so I will add a big TODO as you suggest.

>=20
>> +    {
>> +        struct ffa_ctx *vm =3D dom->arch.tee;
>> +
>> +        /*
>> +         * we do not add the VM calling to the list and only VMs with
>> +         * FF-A support
>> +         */
>> +        if ( dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0 )
>> +        {
>> +            /*
>> +             * We do not have UUID info for VMs so use
>> +             * the 1.0 structure so that we set UUIDs to
>> +             * zero using memset
>> +             */
>> +            struct ffa_partition_info_1_0 srcvm;
> > +> +            if  ( dst_buf + dst_size > end_buf )
>=20
> Same question as the other similar check.

Same answer and i will add an overflow check.

>=20
>> +            {
>> +                ret =3D FFA_RET_NO_MEMORY;
>> +                goto out;
>> +            }
>> +
>> +            srcvm.id =3D ffa_get_vm_id(dom);
>> +            srcvm.execution_context =3D dom->max_vcpus;
>> +            srcvm.partition_properties =3D FFA_PART_VM_PROP;
>> +            if ( is_64bit_domain(dom) )
>> +                srcvm.partition_properties |=3D FFA_PART_PROP_AARCH64_S=
TATE;
>> +
>> +            memcpy(dst_buf, &srcvm, MIN(sizeof(srcvm), dst_size));
>> +
>> +            if ( dst_size > sizeof(srcvm) )
>> +                memset(dst_buf + sizeof(srcvm), 0,
>> +                       dst_size - sizeof(srcvm));
>> +
>> +            dst_buf +=3D dst_size;
>> +            count++;
>> +        }
>> +    }
>> +    *vm_count =3D count;
>> +
>> +out:
>> +    rcu_read_unlock(&domlist_read_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +
>> +void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>> +{
>> +    int32_t ret =3D FFA_RET_OK;
>>      struct domain *d =3D current->domain;
>>      struct ffa_ctx *ctx =3D d->arch.tee;
>>      uint32_t flags =3D get_user_reg(regs, 5);
>> @@ -75,9 +222,9 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>>          get_user_reg(regs, 3),
>>          get_user_reg(regs, 4),
>>      };
>> -    uint32_t src_size, dst_size;
>> -    void *dst_buf;
>> -    uint32_t ffa_sp_count =3D 0;
>> +    uint32_t dst_size =3D 0;
>> +    void *dst_buf, *end_buf;
>> +    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
>>        /*
>>       * If the guest is v1.0, he does not get back the entry size so we =
must
>> @@ -89,118 +236,63 @@ void ffa_handle_partition_info_get(struct cpu_user=
_regs *regs)
>>      else
>>          dst_size =3D sizeof(struct ffa_partition_info_1_1);
>>  -    /*
>> -     * FF-A v1.0 has w5 MBZ while v1.1 allows
>> -     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
>> -     *
>> -     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
>> -     * rxtx buffer so do the partition_info_get directly.
>> -     */
>> -    if ( flags =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
>> -         ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
>> +    /* Only count requested */
>> +    if ( flags )
>>      {
>> -        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>> -            ret =3D ffa_partition_info_get(uuid, flags, &ffa_sp_count,
>> -                                        &src_size);
>> -        else
>> -            ret =3D FFA_RET_OK;
>> +        /*
>> +         * FF-A v1.0 has w5 MBZ while v1.1 allows
>> +         * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
>> +         */
>> +        if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 ||
>> +                flags !=3D FFA_PARTITION_INFO_GET_COUNT_FLAG )
>> +        {
>> +            ret =3D FFA_RET_INVALID_PARAMETERS;
>> +            goto out;
>> +        }
>>  -        goto out;
>> -    }
>> +        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>> +        {
>> +            ret =3D ffa_get_sp_count(uuid, &ffa_sp_count);
>> +            if ( ret )
>> +                goto out;
>> +        }
>>  -    if ( flags )
>> -    {
>> -        ret =3D FFA_RET_INVALID_PARAMETERS;
>> -        goto out;
>> -    }
>> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>> +            ffa_vm_count =3D ffa_get_vm_count();
>>  -    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>> -    {
>> -        /* Just give an empty partition list to the caller */
>> -        ret =3D FFA_RET_OK;
>>          goto out;
>>      }
>>  +    /* Get the RX buffer to write the list of partitions */
>>      ret =3D ffa_rx_acquire(d);
>>      if ( ret !=3D FFA_RET_OK )
>>          goto out;
>>        dst_buf =3D ctx->rx;
>> +    end_buf =3D ctx->rx + ctx->page_count * FFA_PAGE_SIZE;
>>  -    if ( !ffa_rx )
>> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>>      {
>> -        ret =3D FFA_RET_DENIED;
>> -        goto out_rx_release;
>> -    }
>> -
>> -    spin_lock(&ffa_rx_buffer_lock);
>> -
>> -    ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
>> -
>> -    if ( ret )
>> -        goto out_rx_hyp_unlock;
>> +        ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_b=
uf,
>> +                                  dst_size);
>>  -    /*
>> -     * ffa_partition_info_get() succeeded so we now own the RX buffer w=
e
>> -     * share with the SPMC. We must give it back using ffa_hyp_rx_relea=
se()
>> -     * once we've copied the content.
>> -     */
>> +        if ( ret )
>> +            goto out_rx_release;
>>  -    /* we cannot have a size smaller than 1.0 structure */
>> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
>> -    {
>> -        ret =3D FFA_RET_NOT_SUPPORTED;
>> -        goto out_rx_hyp_release;
>> +        dst_buf +=3D ffa_sp_count * dst_size;
>>      }
>>  -    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
>> -    {
>> -        ret =3D FFA_RET_NO_MEMORY;
>> -        goto out_rx_hyp_release;
>> -    }
>> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>> +        ret =3D ffa_get_vm_partinfo(&ffa_vm_count, dst_buf, end_buf, ds=
t_size);
>>  -    if ( ffa_sp_count > 0 )
>> -    {
>> -        uint32_t n, n_limit =3D ffa_sp_count;
>> -        void *src_buf =3D ffa_rx;
>> -
>> -        /* copy the secure partitions info */
>> -        for ( n =3D 0; n < n_limit; n++ )
>> -        {
>> -            struct ffa_partition_info_1_1 *fpi =3D src_buf;
>> -
>> -            /* filter out SP not following bit 15 convention if any */
>> -            if ( FFA_ID_IS_SECURE(fpi->id) )
>> -            {
>> -                memcpy(dst_buf, src_buf, dst_size);
>> -                dst_buf +=3D dst_size;
>> -            }
>> -            else
>> -                ffa_sp_count--;
>> -
>> -            src_buf +=3D src_size;
>> -        }
>> -    }
>> -
>> -out_rx_hyp_release:
>> -    ffa_hyp_rx_release();
>> -out_rx_hyp_unlock:
>> -    spin_unlock(&ffa_rx_buffer_lock);
>>  out_rx_release:
>> -    /*
>> -     * The calling VM RX buffer only contains data to be used by the VM=
 if the
>> -     * call was successful, in which case the VM has to release the buf=
fer
>> -     * once it has used the data.
>> -     * If something went wrong during the call, we have to release the =
RX
>> -     * buffer back to the SPMC as the VM will not do it.
>> -     */
>> -    if ( ret !=3D FFA_RET_OK )
>> +    if ( ret )
>>          ffa_rx_release(d);
>>  out:
>>      if ( ret )
>>          ffa_set_regs_error(regs, ret);
>>      else
>> -        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
>> +        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_siz=
e);
>>  }
>>    static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_priva=
te.h
>> index c4cd65538908..bd6877d8c632 100644
>> --- a/xen/arch/arm/tee/ffa_private.h
>> +++ b/xen/arch/arm/tee/ffa_private.h
>> @@ -187,6 +187,18 @@
>>   */
>>  #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>>  +/*
>> + * Partition properties we give for a normal world VM:
>> + * - can send direct message but not receive them
>> + * - can handle indirect messages
>> + * - can receive notifications
>> + * 32/64 bit flag is set depending on the VM
>> + */
>> +#define FFA_PART_VM_PROP    (FFA_PART_PROP_DIRECT_REQ_SEND | \
>> +                             FFA_PART_PROP_INDIRECT_MSGS | \
>> +                             FFA_PART_PROP_RECV_NOTIF | \
>> +                             FFA_PART_PROP_IS_PE_ID)
>> +
>>  /* Flags used in calls to FFA_NOTIFICATION_GET interface  */
>>  #define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
>>  #define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
>=20
> Cheers,

Thanks a lot those are very useful comments and feedback for the
code and the spec :-)

Cheers
Bertrand

>=20
> --=20
> Julien Grall



