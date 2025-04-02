Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E9EA78BD0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935568.1336946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvBW-0007DP-AX; Wed, 02 Apr 2025 10:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935568.1336946; Wed, 02 Apr 2025 10:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvBW-0007Au-7e; Wed, 02 Apr 2025 10:19:02 +0000
Received: by outflank-mailman (input) for mailman id 935568;
 Wed, 02 Apr 2025 10:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tzvBT-0007Ao-KX
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:18:59 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e255597a-0fab-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 12:18:56 +0200 (CEST)
Received: from DUZPR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::8) by AS8PR08MB10247.eurprd08.prod.outlook.com
 (2603:10a6:20b:629::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 10:18:53 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::4b) by DUZPR01CA0033.outlook.office365.com
 (2603:10a6:10:468::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 10:18:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 2 Apr 2025 10:18:53 +0000
Received: ("Tessian outbound ef9f95d5bce0:v605");
 Wed, 02 Apr 2025 10:18:52 +0000
Received: from L3d314bcd976c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D833CF91-E84F-4C8F-8022-451DC6DD6686.1; 
 Wed, 02 Apr 2025 10:18:46 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L3d314bcd976c.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Apr 2025 10:18:46 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV2PR08MB8437.eurprd08.prod.outlook.com (2603:10a6:150:c3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:18:43 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 10:18:43 +0000
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
X-Inumbo-ID: e255597a-0fab-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Atpl6NWHU8jfDt7LD3PSSUvUchZpCkWikk8m7zRcUW8c36vjBQn4NDEP6F14W3G1t5uNx4AgZfT1B5eVXP52TyGuJv/FpKwvWRrN9d8RpnX9HFJ+JJFvqrCuhDU8qgUac/WIiZUO+Ceggasl7UpJT/RaJblkkbYIwBO3k1rNAsJ9ePrfDCfIr1LpEDSbSGJm8Rvj7tQWrWUh5oI/XPnTwA0086+ddjXYUOZ4+HBDIouDzZia0K7aqtM0+1tD40lTab7xtiKlH/qERV/OT9SamWqk1Vsx15ELgYydOlsXStUqckt3ybtQ569XqkRe51LHD7FmCv+nqNnZQMqBIMNmgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r7GQpHsG6E2ot1GzGLTWIM4jFY2HlvvSvGZqHrVg+c=;
 b=dCEHCUNLerdgO95VzlMlKYpIr6pg/wTXnI8uGaZVpEVSYG+E/rNVnF8IikoRM98+1D+eDVcaQtbFbKcDYBT9k+EJ7TGhu1Kn+e3vtfSMapfHyjP4aLGn+MGGmMSgFLgO1khH92+yZVhr1oHQjeLa0Dy3wLYpCCuMDb+2pNERSZVlyCpaUN2wANYGTbHCtBoytilggJKrxDCvf5MwAolR8oY/DK/V4ey/W07F69JUHtf0fTT3Itr1YnFDSUEL2NjWYXJ+Z6E3DbuyNsrRmMQwPyvdmoj48zE5GpkcldSdiZfRtnBnQlA1+dDMkzoPxAUr/hc3dINOCtv35TfRPuc5FQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r7GQpHsG6E2ot1GzGLTWIM4jFY2HlvvSvGZqHrVg+c=;
 b=iAppds6dvgeRUZBuzq+276pg2T5fhzrOcTlkU5oxAzydcI49jd3eNE4K+GvMpSZdbEAFhByHRuRAPwO7Y9Iq7xsfwqbqa9nYRtoMYztaltVXeDarAc54TSNNRLaha5+LHPSKKs5TMXHT0lrcq7ZJsq1AKUtYJw/8EJvhi99GGBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b62a61eee17289cb
X-TessianGatewayMetadata: 8NLswAVgIqdOPBZql2eaQIy+F6zhTOdohc8KZpOUJobbkxWIVOszgAivwsYu3u3x4g9PiuiNPapGcNw61MFWA5TE5tEi2oXVcDMaM5YOyb8Xzeqe7K5S0KgpRcAcaJE40pIqi+kEkJTnrdozglWLlTly4v7/te05/JvGLh/k1RU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTRiYhqwjdx0lZbplQX6/zvVZzfEFNA+ckdO99w/Gp4kJGCik7R8vGoPM505LpMJZSKSI1PvT+QwIbEWKA12vgl7uSFysHZu/5diIMGSSgvohEeQLm28mjXL+sf7xy1c0Zo+lWZ3ZCP8jC94wm/PgT1gzpZHV8r8H6KXyZaL2iN/TZ99rpy+E8OLy7IBnzII26acpoVqTZ3c3AwZElAQRX6kAqtZVRrnQ1hzY5fsxbAzWloEwx8itK1s21sZTMg3q7UpBhZV2YqPb1SmnQFlxzklS7T/4bzj1Pgjfa91m3iTkzKfSEHTX8RTZHB0X/dy2ovSvIDQRMl4rV/OG2JyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r7GQpHsG6E2ot1GzGLTWIM4jFY2HlvvSvGZqHrVg+c=;
 b=WWJqSK3rn88rStSTQ3H1u3TyGxV7xRxjaJZ89w71XHibJDi/neifv70GW7rK3O2lkGw5GbYk3kQXEwN3HbzfF0wY76EQbhR+y8QWAzc3sB78OnypqnJDewvJq/+Ta2Foj64Rz1rE4lfDRPA0aj7VkyIQFEZ9SdKxFwyojpFLF/XFt1Zp8Lae63/eR4f2K8Buwzr2lK8I9ldnFZlDn5Q0EnkMKcdTRlR+746yRtS2H2O5OcVxGc9z1YXGOlwcFBw/C+ARzOesrijUuH8veFZtlFU5xKUZ0e6kWnLWzHnQIwx+47R/sLl9xlXXMAEHnqkl3j08MmIn03HjllNuevbzLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r7GQpHsG6E2ot1GzGLTWIM4jFY2HlvvSvGZqHrVg+c=;
 b=iAppds6dvgeRUZBuzq+276pg2T5fhzrOcTlkU5oxAzydcI49jd3eNE4K+GvMpSZdbEAFhByHRuRAPwO7Y9Iq7xsfwqbqa9nYRtoMYztaltVXeDarAc54TSNNRLaha5+LHPSKKs5TMXHT0lrcq7ZJsq1AKUtYJw/8EJvhi99GGBU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Include xen/vmap.h in mm.c
Thread-Topic: [PATCH] xen/arm: Include xen/vmap.h in mm.c
Thread-Index: AQHbo7d15E5qTwszR0+VWaNpReNh97OQKbwA
Date: Wed, 2 Apr 2025 10:18:43 +0000
Message-ID: <A97B7757-DD49-496A-B597-B668384091E4@arm.com>
References: <20250402101013.220310-1-michal.orzel@amd.com>
In-Reply-To: <20250402101013.220310-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV2PR08MB8437:EE_|DB1PEPF000509EE:EE_|AS8PR08MB10247:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c19ef7a-3058-4525-574e-08dd71cfc4de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?/VPLyDYByNEMPZ0aXB476OgZwxUf/HC6ObGUsqwq4ps0USnv0mHqS27A6I/b?=
 =?us-ascii?Q?v8KyQ5lRsbo24Ifs6BVWT4flm1u1o5E+4wml0aMRORZe41uU9nj3TrDko+54?=
 =?us-ascii?Q?QtisbK/OYDQ62Y8SCpsVG/PibIb6OsZnOUt2k6kKNwpdbDH8T1fB7BNpsW5v?=
 =?us-ascii?Q?JVm5c2KcWxvItC8yhx8yAl7U+YOogQtzujbNYS1eeSWGDsGN7uvIJOnSRaiM?=
 =?us-ascii?Q?gsEoqvI9chaWu5zwm4c8jSbabmpCzJVGUvLoPLNDDk2xiC8ftrRv8l4NaeEi?=
 =?us-ascii?Q?DkDrrfRkbz5YBrLLK/++sN20EJCZxJJpfsvjSfp5V5Qr++I442NLOX6yOvco?=
 =?us-ascii?Q?856m1wEmU6Hi6qQrI3l1L50KFGvxF2+NAWk7rxlJ2+obZmNQ2S2/ezCs4iz1?=
 =?us-ascii?Q?1g5WYVWXJWB7CGTO59jlkeVFm1TGkmzqplVjAuI9aUiT/f2am6b+pONlWC0i?=
 =?us-ascii?Q?2Eyyxj044Zk0TiXuI4a/Fbt5kfvKTcu0pFbGqyKMdieX7v4urlU6yY49h8yg?=
 =?us-ascii?Q?xByptelesJNQRx8sb7oCJ7yvJW/ap7Gt/aEU2jD8zgQZF8sYFbBLsaBJYy0n?=
 =?us-ascii?Q?obK3nDW7tQCg+dlUhUOP3up+sMOoxUmhag/h4uagUXXchjfQ+1zmApwOhNrt?=
 =?us-ascii?Q?XufQANfEuQg/itW/ZL/kPdd4RH6jb9gBu+eF0LzlAbDJEh73HpzdT/9ne0Dd?=
 =?us-ascii?Q?UDwhTr6JsEnqERpPkRqg0G3At+rYFBifztf+YEztk1sHUEX3B0IJcIu75mJg?=
 =?us-ascii?Q?ToLsA41dLO9k3KHgrEfFbOjWKf+FJGVK+i6TTQ74VO+TWGdPODp/REnMaMSj?=
 =?us-ascii?Q?Mcj8JApfQFwkOGvv3lfRTd6WQY1jZzKaJ/DhW8sjFcMBypqedBYrZvTZ607H?=
 =?us-ascii?Q?V+2MejXlwtH1tpj8DHjmqe4AOJZrgXcdrC59Cm9mCFZdS5YpBXwNE5/br/cq?=
 =?us-ascii?Q?B50REjafFag7Pldj4d8G41tDfAUgugGMbEFIvRWMIQq7C/5ck+GcqUFqerwT?=
 =?us-ascii?Q?3BNz2IqV7I2eBqE/w6m+BPl8crUaWSNWWsNNTpg9PQs78CF9g8IBb7bDsuQY?=
 =?us-ascii?Q?24JF3+Xh9gbD5Y4bgmBh5sO5LyzWbLc7EzfiZwitQTdMZG/8fB8JZH4tZOyV?=
 =?us-ascii?Q?gVVJWVQ29/Z6b6H6aCVQ/SY/+NZk2glrrcT8Djuc66hk0tPwESWyGtcivCGl?=
 =?us-ascii?Q?C5L9igkJbZz3Qlw3RpfYSUTp5e2xyx2kMytMa99CBBJ1DlclOn/sespQL+ZX?=
 =?us-ascii?Q?9ZcWdCVCIKEND+0wgRwgoNohAKtMi/fJUUzenEnCK2/aujrPFUSjsCFBxU7n?=
 =?us-ascii?Q?Uoo1gkhwrzl7+vzlsanYYAxt2Ids0SeBaG3cJmX/rhN4dXzR8602T3ZSQA5a?=
 =?us-ascii?Q?PpxQxHICKqLkTV996u3qwZDmwbgvuVrpTHbdQeU2rcNGgg2x/6DIWG/0Hf2y?=
 =?us-ascii?Q?r0rSTF1IHyT6ir/RVoTBb/3mor0nMIef?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E595C99BB7A125459D1E8511F60D01C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8437
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab5f61fc-cdb6-4960-9aeb-08dd71cfbede
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AUfdgSZZpUWpHi1VpXFL2yRyZM52gH2SCMl5glj46ecznJvr880qmCg8qBjI?=
 =?us-ascii?Q?tsL0iok/Jr8xkW386LbZm3lnjuzOSqg36VDD0U7d2uvLf7WaFIDnxeTkMkUT?=
 =?us-ascii?Q?qhRzaiOlOywu6psT3SLZR774zanC4gP1wFZuZEGX7ZknwR8FgXbJuyLjR1wG?=
 =?us-ascii?Q?935r6tkpNnhP2YR01q8z4Byfx5tXArAWJyeHegfDyCTMcMvQLfmNz/KxWNXn?=
 =?us-ascii?Q?pBzPF+t3+55ZTf+h4VKFfizO3zHnJB8doYgJYmSIuPAdVAB7zcJgdPKZQHR1?=
 =?us-ascii?Q?cji0eE8HmLDroXvYS2MKyAsHaVXsUoGhfTFYxyhfqkt1OY2LnMpKeJbRTbxH?=
 =?us-ascii?Q?fy/I30sZq9lg3IHrLmnT9pOMgrKG3ZwnOmQ7TrrsfnCj5OYf9PuJkGdFdZet?=
 =?us-ascii?Q?o4VMUDJ8ba9/PCjA74D9HoNmDwUpA6fqiplpiL2hWtWN2LHxg8EqCS6CcL24?=
 =?us-ascii?Q?P2dqBum6pZwUZt4GDtWmpYjPwqJ2bGt2LCZQcBrr+vZkv98jAgOGTS3SZ2JF?=
 =?us-ascii?Q?6lGlIlnIX2QzhjqN8Pyth/WDZEPEU3aTnap1UseW8JdaVRB6IULylO0zVB8f?=
 =?us-ascii?Q?ib1MYY8G5umOukHRpuYwh+7Ya1Xd1rFYecc1A4YFzoA0o1OBYQIAdAeyzAXJ?=
 =?us-ascii?Q?oEhUgBkRwn4iEmb+etpKZKXpdP7JE68aVjFqD4NMcwRCW5GQrLhvUhyrF//6?=
 =?us-ascii?Q?5JCRPl145Br2OnA441r2HxPkugbKJLzQkFfxgT3eJa6+B2Z81RndKgUJSrws?=
 =?us-ascii?Q?TOM32IohPA02cok0F/v6LaaYh/3zLpFAqJhqninrjzsj64Z5pNpEhydxzhcb?=
 =?us-ascii?Q?rIU/HaESfp/6GnHH4u8haJCn+2V8s8ktr8kdEH6W62WB57IWui6t+dCitdC+?=
 =?us-ascii?Q?+D4fVzNIVvkye4G28Q2C5xj2liSsL4MlX50eom0YYDlY8kfN61EAPWWVU5/a?=
 =?us-ascii?Q?0zNncyagpOdN30VE4U43L9YWnWdQPaOLmtLzFl39knPK+d1uZbrbPySs2NVG?=
 =?us-ascii?Q?ZAjxOUzgAqHPOAurY5cUJe0pndzjJrke4Ok7O0xzK7I49LTwblK3gU3SbBu5?=
 =?us-ascii?Q?LcKp5YM0Hy17KtfYCDwoW+ESg0+ivgrIWZbsfKOo64MMgSGkLANHcKA5BkOI?=
 =?us-ascii?Q?tWaK0ralF7NlxpfUUfd1ZCGCKwFQyDOIC72EUw6sdHIYacq4qn293ygaZrKf?=
 =?us-ascii?Q?i6FFwmBuxncSUubrhnN/yLhVwdlgjTz1gYRgSp28d5TlZpO9bWW88SD7PuEe?=
 =?us-ascii?Q?LGRGgNX5BF0Si+5YIqewfkDR+b3aOO2IO576NSWxFDohXMEDEgr2t7yQtZ9K?=
 =?us-ascii?Q?4Z56LNkULj7eylZ/COC7IVuMYS4q1fJ2znjji6F4gX1C//Sg2hm+F/y0kAxm?=
 =?us-ascii?Q?vYjai2p/jDzO5ErPo6u16nW/FxMGDDTbdzeL4dei9r0WIGq0qG7/7oYHs7QK?=
 =?us-ascii?Q?p0l5YhZHVSQq8Ch64vxGqIwf3WsgJviu?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:18:53.1084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c19ef7a-3058-4525-574e-08dd71cfc4de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10247

Hi Michal,

> On 2 Apr 2025, at 12:10, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> As reported by ECLAIR scan, MISRA requires declaration to be visible
> (R8.4). This is not the case for ioremap().
>=20
> Fixes: 2cd02c27d327 ("arm/mpu: Implement stubs for ioremap_attr on MPU")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> https://gitlab.com/xen-project/hardware/xen/-/jobs/9599092510
> as part of the most recent pipeline on staging:
> https://gitlab.com/xen-project/hardware/xen/-/pipelines/1748174980
> ---
> xen/arch/arm/mm.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 5a52f0c623e5..0613c1916936 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -12,6 +12,7 @@
> #include <xen/grant_table.h>
> #include <xen/guest_access.h>
> #include <xen/mm.h>
> +#include <xen/vmap.h>
>=20
> #include <xsm/xsm.h>
>=20
> --=20
> 2.25.1
>=20


