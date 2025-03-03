Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C0A4BA64
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 10:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899991.1307938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1oh-0000Hm-1F; Mon, 03 Mar 2025 09:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899991.1307938; Mon, 03 Mar 2025 09:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1og-0000EK-T4; Mon, 03 Mar 2025 09:10:26 +0000
Received: by outflank-mailman (input) for mailman id 899991;
 Mon, 03 Mar 2025 09:10:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W32C=VW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tp1oe-0008Nq-Mb
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 09:10:24 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f403:260c::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 563a6970-f80f-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 10:10:23 +0100 (CET)
Received: from AM9P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::21)
 by AS4PR08MB7453.eurprd08.prod.outlook.com (2603:10a6:20b:4e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 09:10:17 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::4a) by AM9P195CA0016.outlook.office365.com
 (2603:10a6:20b:21f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 09:10:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Mon, 3 Mar 2025 09:10:16 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585");
 Mon, 03 Mar 2025 09:10:16 +0000
Received: from L1de0eecab397.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8DB3C2B-5428-437B-ADEF-1382A17817DD.1; 
 Mon, 03 Mar 2025 09:10:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1de0eecab397.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Mar 2025 09:10:08 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB6590.eurprd08.prod.outlook.com (2603:10a6:102:152::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 09:10:07 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 09:10:07 +0000
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
X-Inumbo-ID: 563a6970-f80f-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eXIIlEO4LOJH6coDQMP4Lz0aWAPIuD9zK86P/qbxWYCaTdsVr534Szy6I7MsgWqCe4X3N3bwHwmJRnAFPNdZ2AfSbfa2xzLPP+f3yaoLLLQE/W4UBjEqSpSGwMqJoLO+E66nqnH/inQ/JZlQ9Gei0Sn46wqS+qtNikKPM8Fkc7F66rM02naqx1p444MPlogMQ7EC2D1NYhJeUjbtwUMk7kRTa0E5PZBHmZsjgM1YBtSTDvj2Bb547bZMyE5QPKsT+skkgS3h3sLTUHa8mK0UOesEzS+J/CdCl+vrQQsGmJZpx8YELnmQWxgALV0vPq7ipZPKgVGfeE3YP+agwb+MAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnIFs8/rEBOiAcmY9FHzogK8jWg/5s0O8QhB1ONh5+o=;
 b=BVPgboZcSbQth5tPwrArnBbP6ZXUi9+sVSB2+zfFQ9HqIqVVAnRyZ6y93F+UqQnVqb7ccmk92wVj7ZC3aAX+oyer9AFBXFs9yHo9EM3tZXdOZwyfVJQYHFT+ap73j/4Dj62DIn9Y/YuS5h4VRs20G5km/hnOHjyKRkdqc4UDHw+XvLIhv98fL0lcqVcCUA1+Ecu+fbho0nMWgWLIsWzj+PpxNpBCr0hI8B4Imu3G2/O5uso8Q95chU+sCaHQVOBHCQsYnp0mWWODJZQnt/BMlOtgaO/dQjVw8jkjLJcyEScfYjti02ABfD8q4mCvuahrJYN/zwCN6DSvh2MQtN+TVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnIFs8/rEBOiAcmY9FHzogK8jWg/5s0O8QhB1ONh5+o=;
 b=onTJrQWJbbY8K5NR7S+Sa+BUk8j4CyGRnkMzPTiaRZ2GI+ThqhxG6cY2yV6bg/gEXPJBIKsjNtJ95WvG2EW7nJrP+QPvQIi9EwDvzXh72EVOz0dMF2npaZGbArSuKbIlcqJHp/gUM69gC84lrrzSiYH8pg/6eyyhi7noKIYEfRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d7787b4bcf06a5f7
X-TessianGatewayMetadata: G7f79dUeiRv/fCy/hPbmfEZ+l9jhFv+vLl5xidNI/jjZlNjzMPJoHNGPEdaVPRnHgyhLH5FL6fuUQ9fl0kmj0dBHu87Vcn/zF22qRkeyYJb2eqYzVG1ZyxuXSlS8N4zUVXOEEIg1ZRCxbXqEODvi1fKii72MS46lThOFlV82rUk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFz7oE4TOZdF6wB81Ygc6ihDS1SrsLqrYDAIcsOxvR59tjPybpxrxMqw0JbBnL8aCTxVsF+tG5EOcl9CmffbB8xMQESf7OOvwAYboNGbStkvLi9Dzzy4oGfqLbGFxpv9opKwJmv/DiramgUn+Himn8frx8YZ0B71zjeVg5DwPgZV7xp9PC9zigS5wnipotlO8DHFMTV5apPcq4NBbx9rFf3PUjNXbTAPOmQWrsn/W3UC6S9+Wpn/rIzYOw0YFH5+3kXCDr8Z/+rl8aOV8MNxuwkK/3u/RgqjJHA/OLCIhrW6q46UK6Lt/IhZtWevdf9qL8xNEuIMryC8nINA35cX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnIFs8/rEBOiAcmY9FHzogK8jWg/5s0O8QhB1ONh5+o=;
 b=rdwokJKQPpl56YvZpCAemVnXm9emEGSFUYaSh8rGl7AVfaYFk4uF6vuqesU2oiFRX0163Z6SG3pLV9BaGSQh1hgLZEFQkCKjr5HC4s1sKV7p7esUOhSm0XSawz0ZgCXfY+Vf0SzVXAf932CDWmQyBzGQigkJYZTuddnukNAYruAiiAFOawIjpp20VvfBllplEhVZZWYtoDR9kqFe8S0rNjXd0w8euzZGVcKQl62UqESLo64bbgaeCD3JKQnzRL5KHfALgAFOh3qCyyDZUxrjviAI8pc9ZiDiREoYzSX76lSoqPDg8h3iyOA7OFXnhR9tRuXK4ZmrYtd4PZcW1n0JjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnIFs8/rEBOiAcmY9FHzogK8jWg/5s0O8QhB1ONh5+o=;
 b=onTJrQWJbbY8K5NR7S+Sa+BUk8j4CyGRnkMzPTiaRZ2GI+ThqhxG6cY2yV6bg/gEXPJBIKsjNtJ95WvG2EW7nJrP+QPvQIi9EwDvzXh72EVOz0dMF2npaZGbArSuKbIlcqJHp/gUM69gC84lrrzSiYH8pg/6eyyhi7noKIYEfRw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/4] xen/arm: Check return code from
 fdt_finish_reservemap()
Thread-Topic: [PATCH 2/4] xen/arm: Check return code from
 fdt_finish_reservemap()
Thread-Index: AQHbjBo8JAfGWUcx3kan0vO/7ZnWI7NhH9yA
Date: Mon, 3 Mar 2025 09:10:07 +0000
Message-ID: <0FE3F34B-AEF8-491C-99D9-B470D75D0F99@arm.com>
References: <20250303085650.74098-1-michal.orzel@amd.com>
 <20250303085650.74098-3-michal.orzel@amd.com>
In-Reply-To: <20250303085650.74098-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB6590:EE_|AM3PEPF0000A79C:EE_|AS4PR08MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ece0f2-e012-465f-17b8-08dd5a3336ce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?X3y/MbAaU9TeLBd0HeucrgN6SHFB29yM7Bg0smgcHk/bkGPaMkONMl2odWfu?=
 =?us-ascii?Q?yzSHGRHxwKLNuucoIpYPjgeqrIfJf7/ugcKSgWVWHD3Z7cSeBP73BePivGjy?=
 =?us-ascii?Q?8aRaZIHGBoGh5s0zwkHyPKGdXFXzE217X7cjtUkVRoVvDp8Iz68d1+X8ZvfT?=
 =?us-ascii?Q?LVPvdHypyWhAAotFf6qhyvafoqo2shgSKr8eezffIrqHSJRcAYwT2DFHyat6?=
 =?us-ascii?Q?UA5zXB9WV1TopgrdMYkC7/pNH9xb567FCF1jwA279+4q81IZHTeaCygupcGX?=
 =?us-ascii?Q?QQ2wSXtStC/YOIJwkvxjWSqUsJ5MhFJgirdK95FdD9ifKUWouNa8ua8V1Dcy?=
 =?us-ascii?Q?c5D0cxh0BUXTABHe2MdOuC3J2Cz3tx75P2XdQwbAVs3I+QROgrRJVBq5l/5E?=
 =?us-ascii?Q?xjHbnXzZ8xcBOjq5N8gXclqZ70e+3H+2Pn9s4g7hWE4HJHAfOG2O2J6J3Muk?=
 =?us-ascii?Q?1J0Kwkf4Ao5EdWw2HMNDV/Pj9VE4X/clf8wo36ziNZ7+EE0GDXSIass2R0j4?=
 =?us-ascii?Q?LCWxwEv7oh13I7gM0lSyJQRqW+2JofYTQw2+ADKTAAm7OuYM6NGjfd0VpiYk?=
 =?us-ascii?Q?za6EIrVsLShZxdYwxIliep9FsYnIm/4ruw8lOsVujkDH1UYXQRVK1W68M1+p?=
 =?us-ascii?Q?GN7cs2kBURdDAbqSKcHqro0wU2nJDfD3qzEeQ8oKDI0YycT1gW5L4EgvQSOS?=
 =?us-ascii?Q?bCAfzGNWOkKYIy0/Bw6szJIKdRFt4kByardhObzwDm1kNSs3kyiGZ8QoNnty?=
 =?us-ascii?Q?AJ0WyQ4zHaS6R3RS7bLcnexEO0L3fYZ1zh6PTKGx8dpNilsv8XEmFl049O5r?=
 =?us-ascii?Q?NIe65pbc4zQ4IZTyAj3Gg9VohY34DlymHzzy+gWlTj57Gg3zDiQuIKri5nc/?=
 =?us-ascii?Q?Z/GCaUgTqQPlpe1bx1b4iIs4dG54L0iM3VysnYz6QaKV4ryoJdjIPKZQjkYk?=
 =?us-ascii?Q?OmEN9yN331P6ejZOvNehpicsCsp0+fQ931WU2Nh5haC98g37hYM8KKQn+1tq?=
 =?us-ascii?Q?89J4lZlF8J22Kc9fQevX7uX+HMYw1FVVK/iulHyM5DppQ7bphLtsve0cs6r4?=
 =?us-ascii?Q?ROhX64BApCBgBL/NWxz36Qsk7pYFXF/YeGQxQ1SJmpMV14++Qv2hzpWyEGQQ?=
 =?us-ascii?Q?Qxis+VV99shwJDi33Pa3JknkQI7jaMOhRu5jw/lN+gR0Vqtx5fGz4iQjPyoO?=
 =?us-ascii?Q?McmV9TuA+BLJBM4hN8+JpiMpDau91YWSZBZY8ES5+g9AH/1+hdBte372vpfb?=
 =?us-ascii?Q?wWveBtCsS6gbNzGA/5+fHhUcuLWhHy/64urYyAmNFnywRhXtcXP2JJQ2Piab?=
 =?us-ascii?Q?aLgMK+JcMPCwwLz0fD2iQnJhtqtskVouonZTZrIUK7fd1sPNgQ2uDTkpHbnj?=
 =?us-ascii?Q?2hhFYVxkyteejArqzYFsnak5dJyEyb0oZGRcyQ1pwY9pCFz6I5YYUd2TGxor?=
 =?us-ascii?Q?/ZGwIdpFaH1b5wKIDAp8qCFYoHtCcSwH?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <820506FB87B21440A2F2C0AABF621669@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6590
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8257b96-78e7-4ede-e37a-08dd5a333171
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|82310400026|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ngY//7f3M9sVZPuCgHt6gEnZfjBryeqD8uLfTIyuPjjyUw/4sE+89pajRX+C?=
 =?us-ascii?Q?NQx82gHVPC8SJxjZlgW8w/Pd+cjyewjVPJYviJRg4ClTcPr1F8Ddgitr/WiA?=
 =?us-ascii?Q?bISNOzuaB4bMmyH/PZ8aLT8qrB/0aF4lf5ARh5xVAt8hSzTs7HPOnOBexIne?=
 =?us-ascii?Q?hekFeO0wlvopsO8iCGD0QGk3stDj9PLIf3zvBzATOGqT6cuBoV5Di0xcUTs6?=
 =?us-ascii?Q?qFzuI20FqV47t02y4gQjoGovcn7iXq2K6C0MA/OsOz1OBwfPWscUnhzgREBh?=
 =?us-ascii?Q?o6WZXRU8NT0Yz4GyuZSVGxg0SJKfSCkELNEb2NdtU6y/K4Beip82EljQpkdz?=
 =?us-ascii?Q?lc8c/ZAu3owh5JWev4LtfR4RMIBW/Uwo0kt5/h6Td53hIdx1binY6yezPnPr?=
 =?us-ascii?Q?5P7ZzeRyPhBAPXayjl7kPlq8hrT2a/r+93v0aGRIowXeFSygtcg/Q2pwxK6M?=
 =?us-ascii?Q?DBIqnhfTL+50Vv8GWyKXon97JFCKAU2XkjTGRlOSxqn7ITWjarBKEoNsA8Oo?=
 =?us-ascii?Q?N0mUb9PrfT9aZsmW4t3CmJzEbCbZkML9Ur82FX5jae/Dtxc3gqrOu1/GRAc8?=
 =?us-ascii?Q?ZWliP2xc+HVy+aH4wwhQYDASeHxFagyvlBJmmUbJGGXdoYJA6ZwivgvVeHIX?=
 =?us-ascii?Q?JEox0P6uD3oqBeIEZ3Nst4KxpRn1tQOIr9QEpE7UqSd2Lq4JbnVr9nnThHdb?=
 =?us-ascii?Q?BWzxNof7XbQbKlrJdMJGgtDx5bXlX3fKoUIp9Mpkb+nap0A6qbSalQQuN9N0?=
 =?us-ascii?Q?YhszZZpfOeaSjneU6oFeNTn+8YGA5HGT1XgkL+0wjuJS1GfJqRPW1PrssIML?=
 =?us-ascii?Q?8r+RKU9z1CwgEpCzfpS/2GFnldF66WyR/uTm4ZMLI1qknOGL93whjCTK6NvJ?=
 =?us-ascii?Q?vBIEow3zdcq5tRK2gFC2ZUOjeE1yY3erb+cb5VWjsX0opCbiVQfZeSBwRyBr?=
 =?us-ascii?Q?jqUkF7/uhHcdi0Os3yB9CyIaMdyn+fyIDPq2xYdjGO0CZ/LRE5F10ML/DtfS?=
 =?us-ascii?Q?w91VaWO8hB4eWGhVtsk5yT/P2AVBaXKRADTcrlnsYFeMRzfPRlEgFAIjIP+1?=
 =?us-ascii?Q?iuqqNxOy4zd3cfWk8JnwxiUR1kbnAFYMMBlzZ7A9S86GlI5e//w0ygEHoTdm?=
 =?us-ascii?Q?uopeKEMnsfejJn8si582BxkvdDmsEBAY+YC07jFbUG99pqqrvpTvBzzUso0v?=
 =?us-ascii?Q?f/O1Z0CAIR/Pxy8nu6RkQxKBR3YG+292yF5xJ0cDT7lrJ3pzZM7ehglbzX5P?=
 =?us-ascii?Q?MasB8acwI20EGhaTrjdvEUq4nWHFBjQnmG8pb1fR7GrH2X6ddfw1OWB4f9ZZ?=
 =?us-ascii?Q?TwOfP7n7DHIsK88T+aJPJ+G1z/rOnQ3kQQ/AUkOsU5YCJoiAE6kXC/i6ZiVM?=
 =?us-ascii?Q?HpODdHwDBK0aNhrOQ07M7YzyM8gsEmRxZo6gGUPzVFtFbt14KX4S8xVaCqE2?=
 =?us-ascii?Q?S0mIwwZy2jLtKzAI1V36a1XI25RntBlq83txwG/v+gEdrCX3HwzBvol3ycvL?=
 =?us-ascii?Q?gT//PMFX5Cn8dxk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 09:10:16.5317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ece0f2-e012-465f-17b8-08dd5a3336ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7453

Hi Michal,

> On 3 Mar 2025, at 09:56, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> fdt_finish_reservemap() may fail (with -FDT_ERR_NOSPACE) in which case
> further DTB creation (in prepare_dtb_hwdom()) makes no sense. Fix it.
>=20
> Fixes: 13bb63b754e4 ("device tree,arm: supply a flat device tree to dom0"=
)
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/domain_build.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7b47abade196..fe05cf6d855f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2033,7 +2033,9 @@ static int __init prepare_dtb_hwdom(struct domain *=
d, struct kernel_info *kinfo)
>     if ( ret < 0 )
>         goto err;
>=20
> -    fdt_finish_reservemap(kinfo->fdt);
> +    ret =3D fdt_finish_reservemap(kinfo->fdt);
> +    if ( ret )
> +        goto err;
>=20
>     ret =3D handle_node(d, kinfo, dt_host, default_p2mt);
>     if ( ret )
> --=20
> 2.25.1
>=20


