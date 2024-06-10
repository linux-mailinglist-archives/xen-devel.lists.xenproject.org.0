Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254C902621
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737418.1143724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhLz-0008DK-Pt; Mon, 10 Jun 2024 15:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737418.1143724; Mon, 10 Jun 2024 15:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhLz-0008Aw-LR; Mon, 10 Jun 2024 15:54:39 +0000
Received: by outflank-mailman (input) for mailman id 737418;
 Mon, 10 Jun 2024 15:54:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2do=NM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sGhLy-00088v-5t
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:54:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2613::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc79a9f7-2741-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 17:54:36 +0200 (CEST)
Received: from AM0PR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::44) by GV2PR08MB8124.eurprd08.prod.outlook.com
 (2603:10a6:150:74::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 15:54:29 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:208:aa:cafe::21) by AM0PR01CA0175.outlook.office365.com
 (2603:10a6:208:aa::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.24 via Frontend
 Transport; Mon, 10 Jun 2024 15:54:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 10 Jun 2024 15:54:28 +0000
Received: ("Tessian outbound 221fbec6f361:v332");
 Mon, 10 Jun 2024 15:54:28 +0000
Received: from 6a90a6854fa5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17213163-404A-447C-A4A6-79ED0BCB7E38.1; 
 Mon, 10 Jun 2024 15:54:21 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a90a6854fa5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 10 Jun 2024 15:54:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB6656.eurprd08.prod.outlook.com (2603:10a6:102:135::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 15:54:18 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 15:54:18 +0000
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
X-Inumbo-ID: bc79a9f7-2741-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VW2LiGdnb2XUJRJdWgE0e9OwVnilmxnDZGjOtAKlH8vzo+W37hKgK/zcuZNKGGviNPvJ50BbHgeVIlw/JiFyP8DrjXP4I6U4dpqoKa2cDD10m85C1DN8a17XeSGROyC+bnWw0CP5NgSHoQjdgkloySkm4g7rcrVUG0t+plLKZH92qF22VUVjjzy+szht1ZHUCFYuwh+R4JUA8YMvCJZgs4MhH7TZz6I+7M1ELcSW19YyPyQZOPHh1cGltpOXGUpVFrT1Icy2caRDKto1pKVZ9TS4cs2odfPNyRWpq32GCF9ndQWGYcccHHCXB6YX9NO1k92LonxhRrIrsr1VqX734Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTWnI8wwauVsQUR9yslO8/Uj3sbFNoZs/LAgkpZb6Dg=;
 b=T2MsZHZJfWVGDE4OztDKzoZj12vrFRLPbxfkXdJm368b3rUPKaHUZsxmEaprvChD9h8ygI+r4FoicMVSvmiR09uTd4C4WBpBIQCMYML4caXEzUjlXlgNPogQkM2fMiy+U6OsEYtAip1G6U/KiMlikx0OjjPv54r1YTlxh0Li8rpypwSwGPW8NuStrKQA214Am08VTkOL31IUC2vO3F3n05Om4/TgwFpnjaFT9uMsOnOYij5POggkVZVgp4lJULbKw6zRS30fKMOnTFHjt1ahCH959FwulLjZki3+l/Syp5IrbgLBKevijRpudu+lY5KvN5N3E5ra5SzPC7qQ3bl19w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTWnI8wwauVsQUR9yslO8/Uj3sbFNoZs/LAgkpZb6Dg=;
 b=jks4M6psIs4om8qRRLZeTSdf0zzG+lUxJAuyaKdIDgD64xZOzt8+hdGQomPSGdvnQ1dYiuOD8EUCr5Sog5RP/tFTSi6hSPM8+E64MIgBaTP/F2N86Ma9SqbMU3hs7TfpEUN8ArKelMFaA7Tn+a88d9Ht5KOEPcmKRQNAJNzL+hM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: faf34b9208f580df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKMTZ68IDMYQsxnbzykjWI6Y2NN/WXXiGHqWpCQdDtku2Addweoy8u6ZZDd6YgBhd7HjZWz5TZ5dRi+mQJv1IYr0eLSvAG0AvqnF5PMQpzFrJoh4hfEeuq5VwMJZimdLYkZXXSzUYPtC/jevSHO1/VDz/sF2DvOfVevqasa3ROPqrCtwACLKvFAC8CVuH7uY2+1rlQb3f1SPT5s1TmE159RtM/unyP2fKWOC/r0o93X4By6VQ+QVN8BLp0jwuY+V+vVoaV6Yt5oQPOw7hZ6pUlUr59ahENx7M3yExOCYLsxtmT3Wala2s3u2Tww4Ki1cRcdKhFYHEYzViH6QMUUCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTWnI8wwauVsQUR9yslO8/Uj3sbFNoZs/LAgkpZb6Dg=;
 b=STBMQJoKvwe17y8k66S4XRUjshNoBODBoSWdxctsrMDfttxfRNmZjgsSNnqYanUZa3XJwnI60wT1H08oaWFpDaUssc/brI8Zs4Bd5bxdL0noP83uKt8XrYk1cCmEPuIA+rG9+h08x0YG4Cha+RZEZ/nMUyVMqSKyOYec6ACX5cWaawmcvRNwJw/NWbvTYMDrDEquNR46Xkdd3d2y2lV+2/v7aeisCUtf3u2KEM3k75Y9u9zxYR+05et8SPreD0/CBIZfQs1omWS9BlU/nkEOwjCIztoovXtUzVYeJMcYgiGz8d6355PyGYVgSxSH3nu2X8ZMe7AMlEMYlCDsFVUBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTWnI8wwauVsQUR9yslO8/Uj3sbFNoZs/LAgkpZb6Dg=;
 b=jks4M6psIs4om8qRRLZeTSdf0zzG+lUxJAuyaKdIDgD64xZOzt8+hdGQomPSGdvnQ1dYiuOD8EUCr5Sog5RP/tFTSi6hSPM8+E64MIgBaTP/F2N86Ma9SqbMU3hs7TfpEUN8ArKelMFaA7Tn+a88d9Ht5KOEPcmKRQNAJNzL+hM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v6 0/7] FF-A notifications
Thread-Topic: [XEN PATCH v6 0/7] FF-A notifications
Thread-Index: AQHauwL3zf/sfUoleE2hXc1GLXTtIrHBJtUA
Date: Mon, 10 Jun 2024 15:54:18 +0000
Message-ID: <3C40228F-21AA-4CBF-A4BE-1C42DE6E94EB@arm.com>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
In-Reply-To: <20240610065343.2594943-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB6656:EE_|AMS0EPF000001B0:EE_|GV2PR08MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 71000f88-a2a1-4b92-8259-08dc89659c25
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?4Uleo4FmdebGHHf2U8loBeZH7fX6Bys8ISidMtFVH1tUzpl8AyIM3KYN5bSa?=
 =?us-ascii?Q?cniWuclSxUQHERrpOvKmfwVLKokdyytsFWwwSoguvPx6iZbzm8/SC27+F7L1?=
 =?us-ascii?Q?FOBBY8ml+tzZ8iI5YE7F9ohcHi/xhG+O+UJdrQks87PBuPoTiaX124KYaAvb?=
 =?us-ascii?Q?ceJErJfn1OcW+3AqQwRS6CTqzn+S4DC+oTb+E38zWexec+EbPkxgRrmMlrhs?=
 =?us-ascii?Q?igZAlANmXQcAP1hq9SDu+FsJKnXaE84UQ8k/nMjhfxO8kxKRQLODmsjNENXF?=
 =?us-ascii?Q?C2zj9W420YNLh3oXhim4F+4de9M9+v84qjB/yuxR9DIfIfUIMK3F/awG59oc?=
 =?us-ascii?Q?tuYDlca7RZEXQ0IirksP0Ro/K47ir7JKVkdXL2mqBJYlkvcAFo2JTME/xbnw?=
 =?us-ascii?Q?nW3ajum5zQt3gE+DT0sdWntsyGgYu0H2WpAGLanpyO50adKkkl36a/69EJ56?=
 =?us-ascii?Q?/K7c2c/h9/R0nuHTd3f7BPskzy4143/5J6PtwS6ea5zRTJ3+Nn4u9TTTpE3o?=
 =?us-ascii?Q?rk4WuQZnrVwz4VIljvzvXT5ZJlsRm7OFmy5RaSiYC0mc/Y+MjwUoXSnnMOes?=
 =?us-ascii?Q?A2fyLTlsSMbai3uGaulTSKaLS2pVHaOPAuPF6TVXKsb2El8dGgFSQiwcJwoZ?=
 =?us-ascii?Q?HSVWhFoZM7ZaBOUOIk+XJl/rl9wyqo9BS4v6qzVON2hpxXKdNMcUJh0iRuLy?=
 =?us-ascii?Q?kbH8vaa/UFyqsIN2KMvhCNRkyT+txInPlICogPoMzId0/hFlj3E33OJ3HjaR?=
 =?us-ascii?Q?f7j0Q3hsGY57rgHTrjdGhdbsaL5iAN4503K8psuyXDtVk9MpI0FNNWwUjdns?=
 =?us-ascii?Q?fI2XEzMC24vKK1XY91OY/8Es1M2iyxr7QId6NTqpGZ0SGfZ//nBw/0RchXW0?=
 =?us-ascii?Q?lcqmMsLbG4y65svh72sGYjaFIe8ZU86eRXfSL9QyjVyeVlnjIrDjmkoDDVLs?=
 =?us-ascii?Q?kYQffR7Yzbo2LJllnwuqtN0rMEPelsYI0vjR/aEX2Iw6Jscy1b/J4Nc9YE2O?=
 =?us-ascii?Q?lP+QYT0jPBZHp47Sv1RqDGkQWu43CmxkLm6Q/x/3IvhNn1rpYqxQB7cud/dX?=
 =?us-ascii?Q?ruYO6urV/ZTgbT1HM0pGk3sCMUuXP/PKmWM9peZtQsK8rDxDfHSowLtMb2uh?=
 =?us-ascii?Q?Q+7CvosmCqNFG32A3g3eklSHPURb/1AHUF9IUlypVcWBN/DShJjKHKPhDHAm?=
 =?us-ascii?Q?iuTEaENm+ZUeX3fXSECC/XMClmcqiXMs4v2Z5u4cDFlgVvBjKOpiMzVY1Rda?=
 =?us-ascii?Q?/usni4y74FfgPk8VP7IzczxObFvyszM1G1EUfpU1zaFIQ2I0wLuPx67ef4NC?=
 =?us-ascii?Q?qO9mRZg5R8O+MMllnmZQaIsB?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5BE74499A62E64E96968EA6B71B5B4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6656
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bf6584f-07e6-4786-8c87-08dc89659634
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qf5N0PDeFikb1BefHbn6Y9AP6EnhM5tGPGW34oP6WwLAzvF/kuhmtyqFZOm5?=
 =?us-ascii?Q?1cRyxwMg1ikVMc7CT5LEdQ3qej5/x9m5b8Oktv3osphqW/HgOtWXofUUaoUN?=
 =?us-ascii?Q?kDFqNQTT0lkgY8afCf39eT7u4b1ots7cpYKzasbYszzmo9iRMiVP/yhetcgg?=
 =?us-ascii?Q?/VnEqb6bFPen2TqMfT08V2A3l38fHxRi8/dYb/Zse3BU497VfHA0XNMW3ZAR?=
 =?us-ascii?Q?zccx4IHPglTU0ESGhG0hJ6lTWklFHV0UCZZN64QMS6KFt60BEVPPsC8Gm3zf?=
 =?us-ascii?Q?g6hsl8OHs8uOOtr0cVOXAC5ISopTygSRVi7oh227djlMN2j5KDv+Q6fdXgUs?=
 =?us-ascii?Q?VDrYnnvbRqvY4l37mD3Po0n16gCnv6TetORgbq2fWwmpTQ8ZU/zG+idYuOK2?=
 =?us-ascii?Q?GZq+WEJvjYRfwXA8P+zpVozOrxmUFQMKa0ohdOLTP5nr9UdPPD/Sa10nJ6Li?=
 =?us-ascii?Q?VqaCtXQtWrWH1CK9JDXbJWpRWMDhFTedYxlCOMbxRl1vTJxX9C6hbx0S/1c9?=
 =?us-ascii?Q?5STmx/jm7ItQIz8ErxDSGw1go2I8iZJMHvGZZ/AtjwNu9x1BDx0TJ7dneBJ0?=
 =?us-ascii?Q?HNrmJVrI9A3xTttROGE0jZR3PD9J/KpGIEgEe1zHONf/SVEMXugtKsCnu9fn?=
 =?us-ascii?Q?O6JuYD4sRpALLgPskJxMuIFDeOq3/bZ6BtqaU5HaY2JiLoXcEYUv5XpDLq9J?=
 =?us-ascii?Q?rkuFQ9llVLVqWPjciKaG8OXhr0GwdAcCzvjdQ5CP60tF1iDo7CZNiWZzDtSV?=
 =?us-ascii?Q?GPcA6PyaJREXap7N7T+qqI0ZRzuTjDn08Sxt8NDIurb1n4zhOx19+S0T8W+r?=
 =?us-ascii?Q?uw3Uolk/h0KwLLnLXbG+w+RONGtEchGnfsu/493IsAzFp98rWWu0SjYq95/7?=
 =?us-ascii?Q?4v+FOQnZ8vfkB9QMO+ap3P5sPdfcZxl5pOJTh2esJM5BZXaRhmwla+KEIAZV?=
 =?us-ascii?Q?AkoxonnXyfjj0lemLqCapSFeDEoKbB9HQdczeOJKv4fJkeL5pw6tG9Zlzkip?=
 =?us-ascii?Q?mw/4E5C3i3f2bfw52Q6a4DnK2Mocc3o7V7kWGN5ZaMRNDBCeSEgOhl9BFoy+?=
 =?us-ascii?Q?SLC8cY4MGVvR22qVq3lU8jfo9WW8hmf4JjIZoECmVDwoXg64un8uiHuU4f+2?=
 =?us-ascii?Q?Pna1xZI9Wj2XJ9Vxrwnak1bpJc5ySBJWY+RWHivrRcl4x1WNSKhRtXcj1Frw?=
 =?us-ascii?Q?qzPRsmxA1GTaTvRdNksd8KvXpcf7wpvTml8X4htvx2eSz3dGjYVnpCK8gJEP?=
 =?us-ascii?Q?WixO+2Qod34gQeXk80fsBnV+ftq5z01SNfCr/R5vIWtpS2nvG2WdSBQO/epz?=
 =?us-ascii?Q?llGSqPOMsTZ5Bb6wG4ZkrS5BKEqF39f2u5R/axLnpaXSSxj1LHHELvAJQJpY?=
 =?us-ascii?Q?UY+KBoI=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 15:54:28.3548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71000f88-a2a1-4b92-8259-08dc89659c25
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8124

Hi Jens,

> On 10 Jun 2024, at 08:53, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Hi,
>=20
> This patch set adds support for FF-A notifications. We only support
> global notifications, per vCPU notifications remain unsupported.
>=20
> The first three patches are further cleanup and can be merged before the
> rest if desired.
>=20
> A physical SGI is used to make Xen aware of pending FF-A notifications. T=
he
> physical SGI is selected by the SPMC in the secure world. Since it must n=
ot
> already be used by Xen the SPMC is in practice forced to donate one of th=
e
> secure SGIs, but that's normally not a problem. The SGI handling in Xen i=
s
> updated to support registration of handlers for SGIs that aren't statical=
ly
> assigned, that is, SGI IDs above GIC_SGI_MAX.
>=20
> The patch "xen/arm: add and call init_tee_secondary()" provides a hook fo=
r
> register the needed per-cpu interrupt handler in "xen/arm: ffa: support
> notification".
>=20
> The patch "xen/arm: add and call tee_free_domain_ctx()" provides a hook f=
or
> later freeing of the TEE context. This hook is used in "xen/arm: ffa:
> support notification" and avoids the problem with TEE context being freed
> while we need to access it when handling a Schedule Receiver interrupt. I=
t
> was suggested as an alternative in [1] that the TEE context could be free=
d
> from complete_domain_destroy().
>=20
> [1] https://lore.kernel.org/all/CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy=
4eWhyN+F+w@mail.gmail.com/
>=20
> Thanks,
> Jens

All patches are now reviewed and/or acked so I think they can get in for th=
e release.

Regards
Bertrand


