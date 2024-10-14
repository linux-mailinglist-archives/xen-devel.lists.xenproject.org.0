Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9E699D6AB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 20:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818820.1232102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Q0d-00040z-EH; Mon, 14 Oct 2024 18:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818820.1232102; Mon, 14 Oct 2024 18:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Q0d-0003xo-Ap; Mon, 14 Oct 2024 18:41:35 +0000
Received: by outflank-mailman (input) for mailman id 818820;
 Mon, 14 Oct 2024 18:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7KN=RK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t0Q0b-0003xi-PU
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 18:41:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2613::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed2abb8e-8a5b-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 20:41:31 +0200 (CEST)
Received: from DU7P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::21)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 18:41:27 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::16) by DU7P191CA0021.outlook.office365.com
 (2603:10a6:10:54e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Mon, 14 Oct 2024 18:41:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Mon, 14 Oct 2024 18:41:26 +0000
Received: ("Tessian outbound 5e8afd4f8faf:v473");
 Mon, 14 Oct 2024 18:41:26 +0000
Received: from Lccd797e1bc3c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA1EAF8F-12F0-4E44-A3D1-B5FF9A6AB7A1.1; 
 Mon, 14 Oct 2024 18:41:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lccd797e1bc3c.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2024 18:41:20 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB6345.eurprd08.prod.outlook.com (2603:10a6:10:252::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 18:41:16 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 18:41:16 +0000
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
X-Inumbo-ID: ed2abb8e-8a5b-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bvoJ7kOxApRkQlk1GaCJSzbJHzPT41ObKriSPjFe35ydaBYVKsx0pxLvT6tLmlwRbj6N8eTlFrTopplD6/UWvkBkxk+bU3hpD0OmoxLuNlCTRnH4wfLv45hOnqr5xTbKekKYdI73UkXVaq0KgnWYmfwF27Xqehk/AqIWYknHY7yjxO02d3jX/hnTjbgvGX9D8Ch4VHAgCxCKg9IGPDAdYyaBVaLDDBckDgSGgcKAzRTLaF3WCpIaAK56peDUJEsNfyNY6DdPQXap8+sm1JscEvLbWT7RX1vzbt6KKnZAx2Ls3rMXUsv3dIjmasxdBQ7ebNaQ9slfbFIi5z4Q/pISKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kj+BUQPrSHOQAAEY1FTjilqpcF5B3zpcubBvPUYpWA=;
 b=IM5xO6m4aSvNMBZ380QEsFPa0418khrYVBcklzJ2dZlIz3Rioov8M25ZkoVvP53KeU11K2UF+Q70u/UK5MED8B2EYK2KlsAsqtZvDKShyBUOEXCuc0PFLvLRCdywrMJVeN0Py+eZfOvVT530b654lc6kGoF3gP/27ak+rY5wsk0gDyU6cChQ0pmx7L1u4Tp2YXtK3J/mzz/9US97XWyqpNYqzlr/op/ILu4OShAP/6WCLT/eIx2VgH2t2yumbtkxYuQo1+tH6cd8SDNq/zZhYoBHXFXtlq73x2sLkb/h1i5C1Lt25ImSnQZiNlnLotPHmvKLhyqfv+OR4Ci6Xnt/yg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kj+BUQPrSHOQAAEY1FTjilqpcF5B3zpcubBvPUYpWA=;
 b=VljKfuJXvpwy+x86wNgjJocWb5EDF1X192S8kfWQeFxv92rX5Ksv4FRWUHErVr4ngD/DHHIaAAap45Um5BCt4tXbwva6ld1GCOjxr/+Arwe4RoJR8c57yb0KCy0yP/28Ua62aRH3GLBsHJTJBeOO/LP5V/mK9x7SZ23FsAy5YVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 663ba3b7ef8e8413
X-TessianGatewayMetadata: UEV/SKS4DwF4CKAMk3sU6tuW0vO2WJJs0ETMZYtSYWb4AC86MhGZBHTZFlxZFUUa7ruHitIpoVAYDWfJKB6s/LRZRJphLURh/p7RiN68I6gU87XOjie3uKMBfWgeEy0JFDpZMI5I3Pvv80LVhaO3S79FpLSUmBOzvZPyzpEPwMc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4aTXs1tM5UVd152AU0S4/jfY1F8PTRee6FEQ0jEs+Z+4BhsMYKmqKUUqUZuE2MCK5lCES5G7YXBgIdwABgoWieE7cLaLf18xoJmSRgwdzS8AWZMMi/MUYO16Kp+kf8JPrrv8cAqEa4LYlvOYHspc2gkg6Mmc1wm5O7MDTHT+XlGkI17QOMmj9Ch0ORdhy5G4yYOjrIG6iTU6KplBcuVDkAfj1Ly+JXIKkRkDtFqTGSDNXUsooOPwdejkKVAQFudqHdnoSnNfevwI3zPGZqwaM8lpZiHsw80z1aGPPCtO0G1ST0naPjFRzyhU4zL/hkLA6tijwOO01Q4p0bbWYEb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kj+BUQPrSHOQAAEY1FTjilqpcF5B3zpcubBvPUYpWA=;
 b=JQKJmrlGUV/nm2qhNJvbzwAChYSkRv2ni/FyVRsKpQ6mZuRlj4c9129OFj0YD0Bl/fQ/ISJwK39ES38C7tYw2yiog6U2v35uduDltT9VmARyTZ/Fopt4uyoedtIc+18O/0dGRU7K1FeK6/bI03abAHTtfUTl2tmxgglfofRV7kZRRmt9DN6vgB9WU7YCNitQoj3Ip7wthjsBqf8eoqScmzkYUEg23Yohcpi1dS2rz5Az256gZRhgIDzr+mftFeFNpa2yCFWePvYVCCHFaF1NL05hL5k+7+Y1yxQTrygzBQqflz8vxPQwC55wsbc+IPY0UtfoIMbpwws6FCjP7U34gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kj+BUQPrSHOQAAEY1FTjilqpcF5B3zpcubBvPUYpWA=;
 b=VljKfuJXvpwy+x86wNgjJocWb5EDF1X192S8kfWQeFxv92rX5Ksv4FRWUHErVr4ngD/DHHIaAAap45Um5BCt4tXbwva6ld1GCOjxr/+Arwe4RoJR8c57yb0KCy0yP/28Ua62aRH3GLBsHJTJBeOO/LP5V/mK9x7SZ23FsAy5YVY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
Thread-Topic: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when
 it is empty
Thread-Index: AQHbGx1zuo3cMSSGek+SPnPgA60oUbKGmwYA
Date: Mon, 14 Oct 2024 18:41:16 +0000
Message-ID: <14DF3C7C-22A8-430A-A7F5-F0AE974CAFBD@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20241010140351.309922-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB6345:EE_|DB5PEPF00014B89:EE_|AS8PR08MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c4e00d-8dde-4e12-7cd0-08dcec7fcf7f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?5ClXFwH/UtYJ+uTyg5FcCfTy8N/Q2otQfOxXmW2ObNphK2RP8A4Erk1ROqlO?=
 =?us-ascii?Q?YcAeFrUcjNq8nUzQe9Hqi8YWz59e9YnhomG2Cu3S55yEDTAmqM/rocu8MoiX?=
 =?us-ascii?Q?1Y/qYD8Q3fmEF9lz9Xf3i0prbDDKapWILtaMtzmYvBi2xYaVtnOs86QQM1Ls?=
 =?us-ascii?Q?CJEj8WgXatuJqPwniUd3eZ6SqORlKy4uxIEqOCWfL6AZB/M6FA+biE1DFs4c?=
 =?us-ascii?Q?SchGJCpWnl5iyaq/FyjEaluQfFwvcUK8V5OCKmkO8xcJR1DMkLa4o9W+YA7g?=
 =?us-ascii?Q?a8Hz2fSQWQzZWQYfSHt+XtjtE3Et8tJeV5cRm5GHfjVP+9pUPvAkiuHmozzc?=
 =?us-ascii?Q?jiC965YMfPt87FSArkcjtxsPbOohRtpMG+1JIYhXK9wz0gytQTJsYqKzN0WS?=
 =?us-ascii?Q?suypLUUbw3CXPJ3Nnv34RRUr9YmcUhDWLtsm0NaqSo1k0BmInP7Fg8t1Csia?=
 =?us-ascii?Q?u8N2AUI/wWq63vDUydqLPPOxJLhSMNhUz7H0TCOgAsyfZBdwzstzHygLZp48?=
 =?us-ascii?Q?7whIn8U/I1CvyzRbW15lK1NPm3IsLGm2mxklihkvt7tQEhk3sQA8zVWzQr32?=
 =?us-ascii?Q?N1oo2h6G31FuhY9ydJG0AWNCgMbxre/sRDdsOc5GhXfDyIdV9gSYJdkP/5Wd?=
 =?us-ascii?Q?K0W5NTUBVVfLkga2v9WoXAr5Cjt1FiWtdN3O8NM29bayEVBKV1q3QBmFZqny?=
 =?us-ascii?Q?eI6EgGomNVQylwe3wlNwpQ6VwN8VQ+41vNAS4awewCNqIlFLjRx5+blNgURH?=
 =?us-ascii?Q?+yH5kZP2VlpInLyQxmg0hkhMW0y44ZKF1Ujq10MOcGwKDI0AWlMGlvMu1aWH?=
 =?us-ascii?Q?EoJesdUn4ZobBJmjsItPnv1fSv/bIAiqT3Vz4v1aHPTZFmeNOYO9P557jQbY?=
 =?us-ascii?Q?pidD3TzkOYRe9+eH2GuJpGNZP31+LaKST2EtaihJUA8BBo9RbQRc5/ZbK5QU?=
 =?us-ascii?Q?VDFAQO7Q2yFKW35FqKbe/TRGWMvJQC+cHdXe9AEyi/7wq09KAiIMSZdfK28P?=
 =?us-ascii?Q?85IY1H8MOyRUC6HedA7CoYF4cs/sVt7TNaCSXz3GZVWOKFAld5L+xOzNcbag?=
 =?us-ascii?Q?BzY84gdktCzqroDb0EGougK+ceTJpFcCBFtxr1V8mJhRGLMsx+OpugytxZIt?=
 =?us-ascii?Q?B8GPf/VxcJxUFWFM1tnTbeQe3thNfr6G8YIps0yxzTVOkZvDqNSt0526VsCt?=
 =?us-ascii?Q?FY9K3GKwAfpSRpW2T/XSJRHl8RqS1ND+CLh2KqlbL7Cmc8OXY+kPPXw4by+r?=
 =?us-ascii?Q?LksvcQC0xNX6OsV26guHUD2GERcGWL4sOGwhgVDy6aAep/HYhSzE+nvQew4K?=
 =?us-ascii?Q?PqyVMneQAA+R8q+6uqWKAAdTiUeO3OCLYfAjrNdeV9ZTGg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AAE7D11193A4DE4CA407E3293AA79E28@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6345
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	173ade16-4f08-4705-de2a-08dcec7fc992
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PpkQF26pjrHeXqPJ+aRWiQFcxFzIXiBc2wjsJo3uP8a9mIJRyr2OSDY1gctv?=
 =?us-ascii?Q?HizMCesmSabE1CyIzDlGLcr0HS96uWmlT+o3D/I2U8tEsY9y1n42YHDB7LKC?=
 =?us-ascii?Q?HlvqYjFCbNB5Fc5gAGuPxW+Davmzth7pP3paIRO/B3Ri39qkHPFR4pP93vEa?=
 =?us-ascii?Q?48iwO+p3zGwaV1swSoA4LkGiZYn6pT8BxYDv33+Qx/uEmZJha/cCrirOvm0I?=
 =?us-ascii?Q?0+I9ddSEyTx33tx+l73FYN/ASIQEWS+v2iM8p49buL8JKQMgeNEznyt12x1C?=
 =?us-ascii?Q?a9sT/N/ciAbxd/4V4P1dK+6KsTDbbvCSuBKurzStSxoSFWG+QmDulOpKzHXW?=
 =?us-ascii?Q?GOBLQ/X+5WdP9fxRxKMF04YI6yDaFog3c+OKHlziCoOgd5eCZvb++p2quZHp?=
 =?us-ascii?Q?gnOf8Q69glUC19IRMQWfJUR0+tODmeGYFuaVrR2e2Yv5fTAStriUQPARVK3V?=
 =?us-ascii?Q?MBPIMWey4ZxVXnCoSGUVBlvPrhpB1uSJZt4lHFrVbLtY7b8LmuxJLugPOhV8?=
 =?us-ascii?Q?DEFm6JIfVc/aYHmZCGXjBAiQ+9hOPDJtkeaHjTF3ERzaSX++sruhjKMptyto?=
 =?us-ascii?Q?Qje0sOMiEKYhhlXN+J81sE6m4us84QNtJwRE/uA+F0LmuvNIQPyewweqbjqJ?=
 =?us-ascii?Q?VPRzngwd6FlyYXNmmlW5nZFxfbJY0PuyAmZlYMHuvqwgozHfaOUrhjo48IP+?=
 =?us-ascii?Q?WkLhWgPaIne0EzWrGisuCYpuXIB/VHzO/jN2crA299CMlTJyQ3iI7FU20wQN?=
 =?us-ascii?Q?Kve8PNfAPv6OnIyqrJVDT5kIPa7iuXSQDUE7xcd5rl6YVFZM0vxJhVOr0Q1b?=
 =?us-ascii?Q?UQ5xHG6q4D0R6TYtMRouc4SzToos0MgX5GasQ3pwMV2yRALNXKonwwj+AiG5?=
 =?us-ascii?Q?l91/A7/hSxt2RqkdpJRSqFupg3AIgkdlYyxBj3tkHETbijI9mkpJUMl0eu8g?=
 =?us-ascii?Q?xxarPG2RYGSTKU6gEQnNptyPkL1NK7ggG+QRGbzFbuuvS8hYTEHSFiQc3k6o?=
 =?us-ascii?Q?6E4yUlitZFTA5mDjXvstU34MVVKT5/dSvwa62RKvU+bsLZuGPRl9pcXuhnUV?=
 =?us-ascii?Q?ThbQLvr0xRUO7QUMS4nWHhxeFZ1J8O8+RQSG1Xsbf1CIJWAvxnEb9U7f3xYY?=
 =?us-ascii?Q?0VTZhwOxWLfapJhUPOaUYGZJbZBMMZTX4MG05vsbZhbEPVK9itPTv/WbaYy0?=
 =?us-ascii?Q?YiMrNS5EOZxFeJt80AwXHtF9WSYO9iktAQGAGk8bQ2DEzNrP7ohdfmc72Zg7?=
 =?us-ascii?Q?uZSIwVZ1IBuCNwUuWOWMQAchx/dEDOT4u21/woNVx0jcpCnXc32bx6YwEDa/?=
 =?us-ascii?Q?1QDmz9Y4DDNd+ny3jLzmGCoh0/pwhPb2C5scqfkxnV5HUOzTf4yESDfC2bi+?=
 =?us-ascii?Q?4iztwOzconigpAPxuilAT2c4bRnm?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 18:41:26.5695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c4e00d-8dde-4e12-7cd0-08dcec7fcf7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712

Hi Ayan,

> On 10 Oct 2024, at 15:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> If the BSS section is empty, then the function can just return.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com <mailto:luca.fancellu@arm=
.com>>


