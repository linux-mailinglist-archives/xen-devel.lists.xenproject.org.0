Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90219A352E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 08:13:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821607.1235511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1gDk-00038G-KR; Fri, 18 Oct 2024 06:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821607.1235511; Fri, 18 Oct 2024 06:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1gDk-000356-H8; Fri, 18 Oct 2024 06:12:20 +0000
Received: by outflank-mailman (input) for mailman id 821607;
 Fri, 18 Oct 2024 06:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bzP=RO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t1gDi-000350-TS
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 06:12:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2612::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecfe8aa2-8d17-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 08:12:17 +0200 (CEST)
Received: from DUZPR01CA0329.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::28) by DU4PR08MB11080.eurprd08.prod.outlook.com
 (2603:10a6:10:570::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 06:12:14 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::7a) by DUZPR01CA0329.outlook.office365.com
 (2603:10a6:10:4ba::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23 via Frontend
 Transport; Fri, 18 Oct 2024 06:12:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Fri, 18 Oct 2024 06:12:13 +0000
Received: ("Tessian outbound 5e8afd4f8faf:v473");
 Fri, 18 Oct 2024 06:12:13 +0000
Received: from L481dd9cd5ed9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D28E739-08F1-47AF-86D7-B1BE785576AD.1; 
 Fri, 18 Oct 2024 06:09:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L481dd9cd5ed9.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2024 06:09:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI0PR08MB11223.eurprd08.prod.outlook.com (2603:10a6:800:24f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 06:09:15 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 06:09:15 +0000
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
X-Inumbo-ID: ecfe8aa2-8d17-11ef-a0be-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W/2d7FGumldbcn1GzoSJ8fSmAT3yQ5VEY58q0RFcAARyMEH3mCuuaFvkEoRajigqHQL8JwhzCfBO+PiqHYg8fTtBA2Sf8+/oOZC1ObkbY+WVV5lUvM1DcLNmi0EpnN7BmaKNCcShH17ao0yApvddLn+YM19AUiwdxF0bcoL8rIVhVrrQBD14/sU3UJg5UI/j841+Q0uomL0cr/fPj3vTl8d5bPw+Pka7LXRAvn1FRQvMeqrm0MfcOasr+oPfx1T68oWZMj+rQYab6O6ai1/dNo56i1Nbi8hvtIp6R5xLxevdCv6uRCQyLTPth9gGDwdwLK9ErDx9wEeTmdx/yLrfJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLSayk7f4LAKxJ9ZTSTcIONVIZtmtgJTBlkRudhWPeA=;
 b=QRBMLf28zWH0midCi7taaQGVUNd/U0UQsk/Cb2QRgE8c84D/ATZnk9UzbIoTEBTl+t0MY40x/YzWjF2bk6kQQDumozEMIhmsr+3fkzPYf34strki/Zyi9aK0QYeRSdhOL7+s7x+B3oStGwUifBZpDJE5ZucgnzehsDuYRicqYBSbBZF+NbkOWdI5WGr8Xacz73U4fwprkjaWxRHuKTkhliyV3WlOi77kfPwN296DtxJbxBMZoNlte7SgyA8yCQpfUNDqoS6/BNDF7zHGep/SQDM7UdHS/ET0b13grPv8XvmsKEOaLUMwzGI2FPgBERSIxhGdp6NgLyY61GbWWGyCKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLSayk7f4LAKxJ9ZTSTcIONVIZtmtgJTBlkRudhWPeA=;
 b=DXxMafWd2MISlDGYDtJ/qKZwLIiMwa6oiooTOZBKYOYoZGamWKnoitqTxD5STTB2GtNzbVj6kNEhHKy22Tn6Ob5dde4+3nxj9H3Bo7+gJl6iYJ525CQmgyt1DAufN8GIriIubombc/ZXEHFkM6LcjjW/7PbEXLavJeEJg+43hfw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a9b310d84360d96
X-TessianGatewayMetadata: rdhre7KbGWekP4+mTOLdpAwytMnxEwHGmtZOR50jliD97jzwuwJG2nO/s6McHiMS5Woq/9QhxVycKiyTtZAv2AR6TrF8zsA93yqDdP+PO+pa4z6za6hcHIZpjkulIdCgLyNew4YKrd2lc5kg56k5LuaFSoUUsqevYquS8egNSUY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPKqKi2KOrThczoXdkPz/COCl6KOgFl07PIkwYxnefKJ2+yM9nWKZNVoveXr3yza9E9LU4yScg1tqzlwBPP1TYeM5xZUfBnTQRyuk1Kjs5w94zW6y3BBJRm9BFYREck3J1fvKKdVGiCWGGtbCpXwU84NdqZ2VcwJcBxf1UqSsBLybn/O02YYK66y84Hrup+PS9v1UFDUy55UB0ySZhYVvoTkixSHbjKQ/Yqk+4LKnE1glFcMmU5u65VLUlkj+TQMW3FSeFLfkKto9S0SZXUxrWbVTfDp0ASuISXpkYEeE7VxS5/U7ZFCBWxwM2XxzjS3lo117Tj8vd5xUJxPwqjWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLSayk7f4LAKxJ9ZTSTcIONVIZtmtgJTBlkRudhWPeA=;
 b=XrihAy1AXP6We8+olCC9c9wuasLyG21YTSnTy2moc0Lut8h9R5PgQb/uz12k2mqVQiO0sEyNRMTLprvKfd6EgbZdkoCVmT0b50CMX6fKU8ELK3HOWQxkME4q1/itM1osVKKaTEjfKKeLq+BVNuIsMGvLjcM5urusLIjBvXuYhtwSWhfwBvW0Q/3zdCLpgZeO/GcgWSoTYEqdCv3vugXFzySKm8kTOwwKfp+fimugq7mFq1zO80uSRI46oQLHp7KCd5zTnntdyoHg/rrx5C+76zlpEpLi6JRGFRJ0VC+2NOEBDEQ250cPIFG+mpARJwCtxZ5AGPNiRp+m5z8AnWdv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLSayk7f4LAKxJ9ZTSTcIONVIZtmtgJTBlkRudhWPeA=;
 b=DXxMafWd2MISlDGYDtJ/qKZwLIiMwa6oiooTOZBKYOYoZGamWKnoitqTxD5STTB2GtNzbVj6kNEhHKy22Tn6Ob5dde4+3nxj9H3Bo7+gJl6iYJ525CQmgyt1DAufN8GIriIubombc/ZXEHFkM6LcjjW/7PbEXLavJeEJg+43hfw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio
	<frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] MAINTAINERS: minor file line update
Thread-Topic: [PATCH v2] MAINTAINERS: minor file line update
Thread-Index: AQHbFk45v3QTT6ax202/2upCZc3+r7KMG9oA
Date: Fri, 18 Oct 2024 06:09:14 +0000
Message-ID: <0CE767AC-99B6-41E8-9707-46F2158F883B@arm.com>
References: <20241004111127.897937-1-frediano.ziglio@cloud.com>
 <2a020197-e061-4d8d-9d49-df7878153d85@suse.com> <87msj24qoe.fsf@epam.com>
In-Reply-To: <87msj24qoe.fsf@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI0PR08MB11223:EE_|DB5PEPF00014B9B:EE_|DU4PR08MB11080:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2c3626-a14e-4f5f-c42f-08dcef3bcf3e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?sIi0spGaZyCr3nqU4gX0zDKOgXfx4U9dYd6eqs/ud8BIrRjiKmmLeokwO5CV?=
 =?us-ascii?Q?J1Pj28yW5VSldRpCy/mhZEQnxaAmqHu9zWJfKeCJw+nUIo2frKSEVC+P8LjG?=
 =?us-ascii?Q?mEYDc+buq5KwvkmuLeGSzummexOc3ul3CtVpd9zoiwvcjzDUUm2TLxo9KYF4?=
 =?us-ascii?Q?ev17GZI43n8Qw/l9EFWwquX0w0LgwLLuPUFdk86ualJ/XYj0lq36hFj7RNKe?=
 =?us-ascii?Q?IkvX0GpYih5mngsD3RgrR9dmoI3EHCFIupzwheCu+3tGKrBnSzED3OHK9A9f?=
 =?us-ascii?Q?kWqkHppvYSwHgN0+HlRsLr8rh01OwIO7oztN6Q3NegrUBtZ3ZCVluS9Ezays?=
 =?us-ascii?Q?5EBQfHTlhxmVXLQBvy5h4LzS4oRO2xZcu5YPA8PyrFI8YhatnQR1R+JyLPUD?=
 =?us-ascii?Q?DBVcebbuwauqpEfAbTqPjmYgFk3tMYmmaF2BSqhbL3cQg5sMxxT7XZJUj8Qj?=
 =?us-ascii?Q?0II82lcf8BizQmZBcNHgLJt2ODwDyPQRB4FWE6Ksrelz7yNLxeUGJ3X1cU9G?=
 =?us-ascii?Q?yBaR7IYznuG4+JrcX46XQY7RH1HzWrlwqio6kysesdErzS0fT4GwNT5mV3u9?=
 =?us-ascii?Q?b1mS/Me03ekozOCi9FoP/UuooUEtFSQk7ZwClEonwwm4cDFx0pCGg6CFDdG+?=
 =?us-ascii?Q?sWQk2AqpQJBULP+8ptp3uYlYu/SEB3plreOdVQB1DZMMxIwNRNGjFLNGecXn?=
 =?us-ascii?Q?vx44OuQBLS+nP9yF/dYM/sSVtCAjJsWb2DaJnDUnq0yUf4mr1z6muYEZQPAI?=
 =?us-ascii?Q?mBHIodGKd7Gu69Y0TepT3FGkJ2O4Hk4lV0NzLjsdkE0LRvbsOYF35j3+O8Y5?=
 =?us-ascii?Q?X+0bdNaEUK5Ze7hI534zdjdEmD3QfWFzXTizscBzLrjMWeYKNRmbgXZVH4Wd?=
 =?us-ascii?Q?LYdYqJWvhzhqb6rAnX95yUfWTrZm+isPXjw/YrEedv91KXNXuAkVdyK2gi3d?=
 =?us-ascii?Q?19kNc+7SCOY/NVSdToFEqSobKSIDoNadQ+cANjicvTTgnMyy+I2JkFrnGGmB?=
 =?us-ascii?Q?fEQlre6k0X/pjfzvv99VBX5K7T0GZ/ydGeys6/+qZOrtP/HHiTZz/PwPXv3e?=
 =?us-ascii?Q?g0Lx8D+re+XP+sZZ/flvO4AM9KEoVbPvlbL8SKcyto01g6mwovbaccuOSzpf?=
 =?us-ascii?Q?Lg+f7PWaHQ3B/uC8GNm41/ywaPzE1LeeQq4XNbKeyEQs9wTytWpeRsnIvnaD?=
 =?us-ascii?Q?0SIjWvza/BH3ewjesNTazWl70s18VHrfIHDFMlQ5sdDVSAfKSubq1gEg6cRW?=
 =?us-ascii?Q?NZHbzAiWYUJDPV8K0eSM+ZMV6v/2j1Nd7biHWS+yfpNcOEfe1n/WiV5HQU/3?=
 =?us-ascii?Q?zj7olLpHnFfvgm5ZgTW1UTHPTjXPUO2Lgz1mfw1RKomUPA5fCZTq6yeQsykZ?=
 =?us-ascii?Q?hMjGNrM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0081685A8666C843839371058B5C774D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11223
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd916e07-9f6d-4b12-546a-08dcef3b649a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5lMcBCy2LuzypLB2kmvBou/bHu+mnTS16IcbRrVeE54iCOgUbTLZKmpPFVi2?=
 =?us-ascii?Q?aLRIqrW2IC4mb1H92FqA5li6qTUPBFcg5MSvOKuFw4F0NKQ6INTHFtBm27mU?=
 =?us-ascii?Q?sa3TZ8y3m+yWNGvb62f8QEyAvEh1kD0L0SJfGv5Oybr7LJNtNyemdpenrQX6?=
 =?us-ascii?Q?HTCqZ/NhTpWTtyEPFjvswm2D5LRwwfQJQ4ZlQao0UYMD7OQY4AKjDyuLE63r?=
 =?us-ascii?Q?sw2bwhZzO1Rruqv03I9+fzAPpaiWlMbxbYAMi7ZpsEOIR9Ctgqv+m69Y/4Q8?=
 =?us-ascii?Q?h7ja65LsFPxaAMm4G6eSIGluQp6bNLItFS8bZit5UruMD2FoSp/6f0MBn4Eh?=
 =?us-ascii?Q?N4yqlB+ZsrK0nyrx6X/ugnv9lgcw5rpIumrpDJJiV3Owoi89H1gXXeBi/dlf?=
 =?us-ascii?Q?me7yahrSvUb3f64KWdAnctFUcrH4DdVSFqqI6Qh1atli4rEhzK+ZpBjceoMN?=
 =?us-ascii?Q?EDIEFarkFYv4rCVbNi4eisfzgXggL0wNSQKWiKiON/sEQG5G3NfKky7H29LQ?=
 =?us-ascii?Q?6d+cgHpEp/EsT7G6CCc5o20M8bhct91zkQdJw557yYu/25kZq7sfDr0VP5aI?=
 =?us-ascii?Q?v2cqry4upvOwD6kZg10pTuGkLuwEYnNFDgP8vauFQTo7sCiGBSDYrtS1wYJx?=
 =?us-ascii?Q?K557EI9plhFqz5/fycc+ZUbl+trhe9rlUiYJh7WNlfwzfrjHPfFuoUwI6L4G?=
 =?us-ascii?Q?K8bSEgJ29Fafa637fr14WufdhPmpQ4k9k8JZKApumwUwqkU9iRWDnMrng+UO?=
 =?us-ascii?Q?fZH0H7gYJ78GzJSvsYOEN3fy8k7T+JroK9ub8g4a6SXc1wsKt0EUhib5OATi?=
 =?us-ascii?Q?yJ95ktzj62Z/utQqrLqJvz7+9Y1t4tGY3lpAUFyZuovtPBU6f32GEKlgce0D?=
 =?us-ascii?Q?w2IC3BHv3mUODPQ+DJ4b9AuewIA2Tj0hCpbUG3s7uvQvtHaUvq8OekrVaes6?=
 =?us-ascii?Q?kFiVKHm/qowMawM7INdY/GhT3sH3Q9zEvM2+bQ8TiKlmDe5ZIavWVffLHzou?=
 =?us-ascii?Q?9fKQmH1HoXP2WD/Q2QJzebaP8+yewLK3Txoc8bdbhBHMBX7yirbl4PHFdN3C?=
 =?us-ascii?Q?eo1Ezwkz1lqy3OdPkpVkOqP3KGMNIu7k9RyH5QD2fd+3gGNmt7F8xPY63tWX?=
 =?us-ascii?Q?ExXEoXE0NaZE6IF1+VeqiPt+NxDaiFm4dXL9lczkHXxNM0WGwzBmvqqjGv5f?=
 =?us-ascii?Q?APuUM0vxEJ5D0UWei/KZpKgEl2yUEN+neTEVf5lmPaFstoIOqW9UTe7FvKGX?=
 =?us-ascii?Q?9zFxuKr4Sl20qs/vJTKStnOtQDHNVbsTvDusB+Hr0m0zfJ+lcsdxDrEui9sP?=
 =?us-ascii?Q?MJ1q6IWDPZZw/dGMwoA1tE0ieKNThHdAKJJoJF4xV+0oPW2xjR9q6kdMQAn7?=
 =?us-ascii?Q?OhiG3FM5wrwlJJdFtfjgSftIvmOqBLrLYaSeIsZ2nQsiDRlQdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 06:12:13.8873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2c3626-a14e-4f5f-c42f-08dcef3bcf3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11080

Hi,

> On 17 Oct 2024, at 18:53, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> =
wrote:
>=20
> Jan Beulich <jbeulich@suse.com> writes:
>=20
> Hi
>=20
>> On 04.10.2024 13:11, Frediano Ziglio wrote:
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -517,7 +517,7 @@ F: stubdom/
>>> TEE MEDIATORS
>>> M: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> S: Supported
>>> -F: xen/arch/arm/include/asm/tee
>>> +F: xen/arch/arm/include/asm/tee/
>>> F: xen/arch/arm/tee/
>>=20
>=20
> Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
>> I think this is a change which actually wants ack-ing by the maintainer
>> named here, not THE REST. Cc-ing Volodymyr.
>>=20
>> Jan
>=20
>=20
> --=20
> WBR, Volodymyr


