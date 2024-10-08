Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D35993E8B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 08:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812631.1225409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3Gh-0004So-IA; Tue, 08 Oct 2024 06:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812631.1225409; Tue, 08 Oct 2024 06:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3Gh-0004Qk-FI; Tue, 08 Oct 2024 06:00:23 +0000
Received: by outflank-mailman (input) for mailman id 812631;
 Tue, 08 Oct 2024 06:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gcc3=RE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sy3Gf-0003LM-Ks
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 06:00:21 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2608::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f7657c-853a-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 08:00:19 +0200 (CEST)
Received: from AM6P192CA0035.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::48)
 by GV2PR08MB8003.eurprd08.prod.outlook.com (2603:10a6:150:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 06:00:11 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:209:83:cafe::4) by AM6P192CA0035.outlook.office365.com
 (2603:10a6:209:83::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 06:00:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Tue, 8 Oct 2024 06:00:09 +0000
Received: ("Tessian outbound 1cf41b4bd505:v473");
 Tue, 08 Oct 2024 06:00:09 +0000
Received: from L31b5525c66d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DBB61AA-6699-4306-AD18-6DCB99BFD93D.1; 
 Tue, 08 Oct 2024 06:00:02 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L31b5525c66d6.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Oct 2024 06:00:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV2PR08MB9326.eurprd08.prod.outlook.com (2603:10a6:150:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 05:59:57 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 05:59:57 +0000
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
X-Inumbo-ID: 98f7657c-853a-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qw3q+jdC9TIKsUiJ6TOsD3FMnYkN673aKyQHg/PyzhaaKetC7G9vXkCLSyfKUyFIJJ9OZ4sbZNzilVFqIqcdE5uTMYBB/fmqdsVfTeyg2egPHoeuw4vChXklBGNRp7WeB6ZyuMoMjzQIRX8dLS++1M01qRR7YGUHbVDmfGIeUtX7o6fzyi5k1F3scU1IIQvauywV9+R2SmLQ+2/JA14XMo0jsCk242uVyE0oum0GnaDPK75q20YYKN085kwcghnPz1VSqSX86dktdH7gVAN/cXFOqSBZl0t9PgYm7qO0mDMn18Jhhnd4kisS/N3XaBLao5s/9nyP8/8fzeHcBEN+SA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRCEqCyMsoz+j4uNpGlBOdtWaIj1N+tXt+fPR807E24=;
 b=Y3xw1ziRRvBiZ8JV2sjUV3OImyr5W/OkgfqWslBfzX+lksMVVUbc4nkDuLY5h74SGUWuM46llGHUWQOWw5mKHJuPTslvowJUZvtHqVdgipX4Z+wFKDeTfgbV7lspUuqw2TLKpUQlIjl7CzYQdDWfgEkD7f16PWI7a/jzko/6/H8g5owDkAx14mqjwzxkeT0D22NSTP74LQWnxePpG5Sd8NlG860rZZiELl0a7Cqdv0gKH/L/tpQw6NtD+ONlnv+HliKr75w3dpdCBjHw42V8K8IfoThFRwaU4/IeHdZc5OViX0tEtfyRBIaxICOXbIyMStHwAvYtRss8uBSH4Hvvgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRCEqCyMsoz+j4uNpGlBOdtWaIj1N+tXt+fPR807E24=;
 b=mWQzkQzvLV6HM4klQOsDRQAgOedj2VNvBLRva2GluAumLGRz+4zK8oHIPGcGxd+AJL2HiTH9gdjM07Rl6/I7bm1glVurasQGaagl61QQmcY4vEW8EpIf4c6swM3fDSZeJmKqFK36sejwnBnJ3eMXbRx4AcklYQhkbPOocTgiJoo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2924a6db62dbd442
X-TessianGatewayMetadata: 3Da2/y6F+SEV9SdtW6gjez6JolyuiVRd7OjZZLYFtyVvao7FSTdq/RT47tBqLYuaqlruS9G2pexGjtC8QO01OMXzCrFD4/OG/nR+pbHYLhHgvAc3UeuM/ecOG+wsKm5ySwG8pFgb4Fdm2js+47ezwTCl+mmjx+G4JLKCiKadxEA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYVmJene64omy9Bs1En71Kzl5LJjHVKlJjPm+PTV+rTlQlyUvqGZjqfsqDWLLBrhjgP52sMW8f5E2L8mAbQvxd5/1wNWwIM8osYP53MAmpv9X/tn9+Aaqoz/h/u11RexdIsS6Go+JuaO3Zea8YuAQC+NwVZfBXY7tScDmVxuT6sFTc/f7cwnVvI+0UOJdtUyyWWsxO50e8LRL5D1j57Hv4YVs+oVr4EElwSO6/gSCsqMAipSYleAvPDn91yoLszRDLXCxFldsaI5Nm74EbIMC2N9DApeG0sWIyoCE1vY7tVgA3jVyI59Fh0OQ02l0qsgijGaCOhkX+jbM3KoNYqUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRCEqCyMsoz+j4uNpGlBOdtWaIj1N+tXt+fPR807E24=;
 b=YnlGoJEE+uzSSxjSxEm3ugh2QK3hn2/+Or7rpgL+HutbWQHT2Qg8dhVNKSRY7tCL1wbp1ax97TZMAEWjTYn6bf9ey53vhyjM6qY5AMKhjhw/uoJOWkW7SjlQ74OJiOUi8uXcCY9yOTAkr+lNyoMwLOP4aABqsFp6V+29rE1EpiGZTny/vhA9ZryFTs2Rr4V2oK6LcHb4SAbmw3igCALLxyqs1NDzAtZPy273NpLFFknTCNNQ5B9hEdbEK2yA0wWBHy/YsLht9NH3aYfTDF3AdmoeUty+CsrtdBOcZBCwh732yjYgHr8kKW+x0rzdTtK7nlyYXrtrnjYeK/wx+mCKLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRCEqCyMsoz+j4uNpGlBOdtWaIj1N+tXt+fPR807E24=;
 b=mWQzkQzvLV6HM4klQOsDRQAgOedj2VNvBLRva2GluAumLGRz+4zK8oHIPGcGxd+AJL2HiTH9gdjM07Rl6/I7bm1glVurasQGaagl61QQmcY4vEW8EpIf4c6swM3fDSZeJmKqFK36sejwnBnJ3eMXbRx4AcklYQhkbPOocTgiJoo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Replace VM with domain
Thread-Topic: [PATCH] docs: fusa: Replace VM with domain
Thread-Index: AQHbGOZmO2f9eW2m8k6uL+vxaGKAvbJ8XMAA
Date: Tue, 8 Oct 2024 05:59:57 +0000
Message-ID: <EC2E3BA4-D74A-4A10-91C9-95B3ACD09AD1@arm.com>
References: <20241007182603.826807-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20241007182603.826807-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV2PR08MB9326:EE_|AM4PEPF00027A5E:EE_|GV2PR08MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ea886a-08ea-49bc-bc39-08dce75e7752
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?dOmcPDH5keMRH1mdCxBm2DI5J2spL3txNl0eRh6qmvMRR6Tt6svC7BeKQ3cD?=
 =?us-ascii?Q?QG7RoOqnVWakUbueibVjWtiTZeaJ3nBCPdhQsLDcxoH4ahjkOuQDGe/fKJxK?=
 =?us-ascii?Q?sO1sadb712RFH9LszTSnYkfdEiou3UzH7RBv7PQw5FhuDqrxR1WfLHnXncpl?=
 =?us-ascii?Q?LILxRNMK/NQnucTNbH9VS1qsTw4aFyCEtg1s7BQ2zsoWIrqxDfRYOhxv4zgL?=
 =?us-ascii?Q?X+8H1KNY4+8HdCar0fPtorW6cARZMhpmz4nQesuue8rt4SmYPr8u3wFV/bS3?=
 =?us-ascii?Q?okKWcIuR2elvMymYL97Uv85b8cCFcAeSQDX5qi+p0Kf6/pQ/m2eojz9tHBfu?=
 =?us-ascii?Q?i1OONGSrvP1XOQkGfevRqP4RtR91bFWpgTB91efZluuuck2NNQaP1GZoUkBe?=
 =?us-ascii?Q?mUJYOOERxySQ+e1/ldGWzNWzyh6FPJ2L52Q5Xug8JJNYWZhnU2IuSlIBSuaA?=
 =?us-ascii?Q?JBB4rZ86rPD2iR9PQ25ga227stxD5qRkr4a0TGqu/udtgj59sjjMYWnqVwov?=
 =?us-ascii?Q?V83G3YwuNPWJW/QGpQpxmGa9PXAPDi9ZM1upFKaiG0+Hjl4Hcld8TN5i+xOk?=
 =?us-ascii?Q?XlAlwQ2P9qLFIFdLYweteF46+UH/30jTgnkIpVt2mXi2Eo+KiQhdwsQiQ/5X?=
 =?us-ascii?Q?pqo3hSTUDIs1Xjpebr4+TTKvnWxrGXN7PyJy3XVNcOhm9VwVlx480GOT4t/W?=
 =?us-ascii?Q?cjFbvXL8B+X+fpWi7SDRUOx/+PNyKew/0OPzopiRBK8j7X7pxZVGMvm4LT02?=
 =?us-ascii?Q?gPbJ7sD5wppRVFBYLyY2OwFMjSXgue8SAKwo34eAI3dbnfUHcODf6gRilwJq?=
 =?us-ascii?Q?w9qpl+0ND6Z6NkE8rsoMAPGlt/E+aFjrP9ZGSHmun78mC/3Z3OTmSB9BUyT/?=
 =?us-ascii?Q?4RfsiLBJKoygxtke4cm73cHl5DEJlDUPwX7yPGMYnxeSfXXAMVm2HZexZ5YX?=
 =?us-ascii?Q?6BwdrEcUwhWuZbMsA7LFx63R6m1m/5xRCw+0YeLlVJwPpztp1f0rqaebsKEf?=
 =?us-ascii?Q?aWbNaF9gSLTukDMN7S+j1c8Rp9ygU5jVpX5hjzToNwO928hBXFUums37ZHdz?=
 =?us-ascii?Q?Wn406n6pZeuiBxUk1UF9xe316ZRdywnKHDo6lNUYSiMN/Zr6Pa+VCotBL/Lx?=
 =?us-ascii?Q?x7dXUa66oBHKcU4fTum9mhLDqUVsdvEyeU0VW1TEI+7x+KezqOCNg0Za/hKS?=
 =?us-ascii?Q?al7w1c/zIG+3rGZsjWOiVZhW1huy5H0KYcGR9VNeoNYM9blcuZ0sqMlLDxd3?=
 =?us-ascii?Q?e9URJNJRFEI6JtCVbd96FFKEa+qCm4FEbFoaZcRstliOVeINk1QvDkvSo1PU?=
 =?us-ascii?Q?KAsmKNFKMJw9nfP29FIPpDUB?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <999FBE62FF102544B874837A5BDFDCB0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9326
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6924e84-f838-4006-1c20-08dce75e7038
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HsxyZUBSev6xpFF71bAQigC7GapXMxdmFlmThOki7XDqRIZnUTkVlcnXStiC?=
 =?us-ascii?Q?IwEvWgYV8+ovBSq0xtZEGE9tEgkraRmYFXD77AdKkpjj0loNEsFiyI4T2g6q?=
 =?us-ascii?Q?VM+MmAJwxE4YWLIRFSiTl5b9kwnpJFi7f8jwMo4k/75OlgsyUl14EdH4yjiL?=
 =?us-ascii?Q?h0fP8igLK5qsetVpLz2/Y0H9KyW/H5abtAAxbt4E0Raj+T5rtKWdn9Hf+fI8?=
 =?us-ascii?Q?iDK26hc635X1J1j4nZ8XWjd8ThQd7kMGo7vELAWUb0ncqtvc6ZKH20UOf8Q5?=
 =?us-ascii?Q?uDtxrxyue9Aeqs7Mo5C0vuSfDkbYRDC7WPPOa+UBNU9maB0r9GsYH+plAffH?=
 =?us-ascii?Q?IM/7FVB62xLPsHdu4Qoee8H4x8xhY0R0XAxvFzhn/SB3TmEuX2ZKLf7v3Vdm?=
 =?us-ascii?Q?oW1KpMM9MMy+f3/2Anbp+DoSeFqvxGesBlMQJ5KbPn3Vs6gKLUzgwvwGP9A2?=
 =?us-ascii?Q?maAZwiqsqlSz7SApbfTO2OX4Sim611snemrhBMtMfTHVPSNomMQYG42fgnZI?=
 =?us-ascii?Q?P3SQW0W4z/orGt+Vwmc2/FvUv7Q8VeLpWciBjLOdjOWCu1yQ4AkxbXyrRlE7?=
 =?us-ascii?Q?hO/4QIEp4Zk01h9uZWNsuuai7aZ/J/zfOOEmHu16+bMB754IP4z51YYPC6En?=
 =?us-ascii?Q?SEE8kyErbB74crk3ez6dSZ6UrfyUfhUWwtChSgTPif72IhzgBWR5JcpwTo2+?=
 =?us-ascii?Q?m2HO1fDsShO2Qf+ahxOmR0H+lmqafNXEUYq6fH8yOTZDIkLu4DsYu3mL26ML?=
 =?us-ascii?Q?iAYF7Cc7KuWsoJpYk+GPrl8UusZnPAg7rrptl87nlJE/Lcmud9dykfg+Q6L5?=
 =?us-ascii?Q?+VndypiFc8lPq4jxAmcnd0O7TcTgNKHUojfSdjcGDjwU4cK414WQt84kIZ3I?=
 =?us-ascii?Q?T1vgh2BOr9Oo2LoWNfvvRE9vsPdY/3tpzHfxQVI8bJEaeZXMwMwMO42D2nmx?=
 =?us-ascii?Q?DPC0XzispuCqgviVo2qiZfaU8ARxguQ7vpDiJg0xVMBuqh+wNGlppoj+WLie?=
 =?us-ascii?Q?CvUG1sVATd6ftfgajvKpIvtMTrGs3mk1km4O28n5ddRdWDPmnCEs+xcylVMW?=
 =?us-ascii?Q?06APyT/IC6s1Prflq2VbdpDU7l4trbGe9Tq6hT52hi2nsgFX0YBQzSy0e//D?=
 =?us-ascii?Q?DdhUiO6N2R7tC2O5z6J1PqlI8y44Zk49zpu7MveVCQW1qXNycRYOjxP4oooE?=
 =?us-ascii?Q?r7H6YN1TYBez2CR/5N6yrL5X7NoEdchxFWN1B3+DLRzZNx5P55EO1UdasAGb?=
 =?us-ascii?Q?syhJng/vOA9ZsKV8ZZY0rozLyZBXSHVDQu5+/lywjxU0fHZAvw181Fik8QZs?=
 =?us-ascii?Q?yPy/t6ghC7Orw16yfvSrO2ptUXRIIESmJ52P/1QbDZ7y5cYijbPFqqCcfHMx?=
 =?us-ascii?Q?f8MIsHc=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:00:09.3370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ea886a-08ea-49bc-bc39-08dce75e7752
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8003

Hi Ayan,

> On 7 Oct 2024, at 20:26, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> We should use the word domain everywhere (instead of VM or guest).
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/fusa/reqs/market-reqs/reqs.rst        | 26 +++++++++++-----------
> docs/fusa/reqs/product-reqs/arm64/reqs.rst | 10 ++++-----
> 2 files changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index e98f348cf4..f456788d96 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -3,13 +3,13 @@
> Functional Requirements
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> -Run Arm64 VMs
> --------------
> +Run Arm64 domains
> +-----------------
>=20
> -`XenMkt~run_arm64_vms~1`
> +`XenMkt~run_arm64_domains~1`
>=20
> Description:
> -Xen shall run Arm64 VMs.
> +Xen shall run Arm64 domains.
>=20
> Rationale:
>=20
> @@ -18,13 +18,13 @@ Comments:
> Needs:
>  - XenProd
>=20
> -Provide timer to the VMs
> -------------------------
> +Provide timer to the domains
> +----------------------------
>=20
> -`XenMkt~provide_timer_vms~1`
> +`XenMkt~provide_timer_domains~1`
>=20
> Description:
> -Xen shall provide a timer to a VM.
> +Xen shall provide a timer to a domain.
>=20
> Rationale:
>=20
> @@ -33,17 +33,17 @@ Comments:
> Needs:
>  - XenProd
>=20
> -Provide console to the VMs
> ---------------------------
> +Provide console to the domains
> +------------------------------
>=20
> -`XenMkt~provide_console_vms~1`
> +`XenMkt~provide_console_domains~1`
>=20
> Description:
> -Xen shall provide a console to a VM.
> +Xen shall provide a console to a domain.
>=20
> Rationale:
>=20
> Comments:
>=20
> Needs:
> - - XenProd
> \ No newline at end of file
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/=
product-reqs/arm64/reqs.rst
> index 97e90813ec..db91c47a02 100644
> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -16,8 +16,8 @@ Rationale:
> Comments:
>=20
> Covers:
> - - `XenMkt~run_arm64_vms~1`
> - - `XenMkt~provide_timer_vms~1`
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~provide_timer_domains~1`
>=20
> Needs:
>  - XenSwdgn
> @@ -35,8 +35,8 @@ Rationale:
> Comments:
>=20
> Covers:
> - - `XenMkt~run_arm64_vms~1`
> - - `XenMkt~provide_console_vms~1`
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~provide_console_domains~1`
>=20
> Needs:
> - - XenSwdgn
> \ No newline at end of file
> + - XenSwdgn
> --=20
> 2.25.1
>=20


