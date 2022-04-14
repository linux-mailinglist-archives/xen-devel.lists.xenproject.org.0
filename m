Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FCF500E50
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 15:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304743.519464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nez7y-0007o2-OQ; Thu, 14 Apr 2022 13:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304743.519464; Thu, 14 Apr 2022 13:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nez7y-0007kY-KW; Thu, 14 Apr 2022 13:03:14 +0000
Received: by outflank-mailman (input) for mailman id 304743;
 Thu, 14 Apr 2022 13:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNLD=UY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nez7x-0007kS-Ey
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 13:03:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d6cb100-bbf3-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 15:03:12 +0200 (CEST)
Received: from AS8P189CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::9)
 by DB8PR08MB5308.eurprd08.prod.outlook.com (2603:10a6:10:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 13:03:11 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::cd) by AS8P189CA0010.outlook.office365.com
 (2603:10a6:20b:31f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Thu, 14 Apr 2022 13:03:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 13:03:10 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Thu, 14 Apr 2022 13:03:10 +0000
Received: from 0ad73b1eb205.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4206359-1138-441E-A8C5-532AFE73C547.1; 
 Thu, 14 Apr 2022 13:03:04 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ad73b1eb205.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Apr 2022 13:03:04 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by DB7PR08MB3609.eurprd08.prod.outlook.com (2603:10a6:10:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 13:03:02 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 13:03:02 +0000
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
X-Inumbo-ID: 3d6cb100-bbf3-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUdA959nXskSGsrMqif2eNyPZW+CXka7xyoOctDgAh0=;
 b=PriuQlYbmzHbEntgvvdM8F2ul8cTecjjuJoUOse9xWjc2E+Y6ZB20fLZqRNSqla4bV3R2uDmXql/+HL54TBur203iYucTZ3/viJzJ0hmSumAd+Joxvu+qQbIH0fF2QSqwKEfY9XbAi4uJf2Q0pGDL4Cg+FlllpU9PbWWw3WHGQ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8c15194ae5b27af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxk/dCDqyg/PIiq0jMgWQJwxnJcADml8s33yw6TfTFfHOI958jhOEdH8vzRF+R5F1YZNjY/cQC42noAr/FSqPyEkaCQ3epZjt1mpgQwk9+5P/KwG36d8yigaJiXX+kjN3uGUiENFCyIOy3ItA3QtIxOqlLQteP0J609WDTHr06b6v7U3BVg586qpBsiYkNVzAzA6/ObHvz9ZkjCdUZNfQvSpNn+2HXpuHiBnzG1JqiB2Bau4c33CKyqbyAFt18cde/GN5rYNFetyOe8GuCr5aIFl2b9iyo49Ej/r92xh0sPdIBfLZCUNAGtumC9rKKIHn2L2B6b0UP8JNuU8YP1Heg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUdA959nXskSGsrMqif2eNyPZW+CXka7xyoOctDgAh0=;
 b=LvKX2B69wWDbLcGXRu2+vzhy7LhOCK/y6vs2QXryRZf4g8C8K2zkleYp3J/0TySg3Mx3pFf88W5/3T/P5QOTbl4YUXI/oX9B/WcrtHiTtYUzbk7mF/Z6yOVRxpJhHY+8DY8lOQJdq0VbyI0bDuz5Q9qg/qDLDZFzjUEYAlSJK+L4okGQnPyZrx+hSbOsZqkg9iZx9tI3Kh4cJLnPHUjlMs0vCaibJMsjapWqihq2RfzQYS1ShHn2xoMV5EqXmnqrbXG33nX+P4arLi6srzl8Yontvj9TMsioAecCApJDJlJo0B9j0kdy2Lw9LoF5SHwb3h7+LM46h8fqxaiwYfv8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUdA959nXskSGsrMqif2eNyPZW+CXka7xyoOctDgAh0=;
 b=PriuQlYbmzHbEntgvvdM8F2ul8cTecjjuJoUOse9xWjc2E+Y6ZB20fLZqRNSqla4bV3R2uDmXql/+HL54TBur203iYucTZ3/viJzJ0hmSumAd+Joxvu+qQbIH0fF2QSqwKEfY9XbAi4uJf2Q0pGDL4Cg+FlllpU9PbWWw3WHGQ0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"van.freenix@gmail.com" <van.freenix@gmail.com>, Michal Orzel
	<Michal.Orzel@arm.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V5 2/2] xen/arm: Add i.MX lpuart early printk support
Thread-Topic: [PATCH V5 2/2] xen/arm: Add i.MX lpuart early printk support
Thread-Index: AQHYT83RPYD4QIXhgkG5U0C1k6a0XqzvYFWA
Date: Thu, 14 Apr 2022 13:03:02 +0000
Message-ID: <E7F69DC4-59E5-40DF-8630-B4A22448C4D8@arm.com>
References: <20220414074452.14419-1-peng.fan@oss.nxp.com>
 <20220414074452.14419-3-peng.fan@oss.nxp.com>
In-Reply-To: <20220414074452.14419-3-peng.fan@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9f9526bc-c4ae-44a2-03ba-08da1e1720c2
x-ms-traffictypediagnostic:
	DB7PR08MB3609:EE_|AM5EUR03FT057:EE_|DB8PR08MB5308:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB53080965C371B393F14CC8FA9DEF9@DB8PR08MB5308.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G3xiymwoyWLWREtABEaTg4c5ZdGnwsIGxFHfHIq6uea7cIWQ8f97IeH63MjlauZwf6644kaAb9jyJo5BvbIcz2mxZv8mSGOkz60vsKteO/M/RodRSqsF7cdqSsx8d9Luoj2AUFvDmWG+51biNevNx5o2MK8mSdliUzWGcG2d3h/MEWP9zUElODmxzgF5q1G6sixe2koseU5IRTjTMKLqgFm6kVTM5wh7x0y8MuckoFQzrA/VSpFx0EidoGKwYfUD9tQh3XDdgdAcjlDm4/Koy3ryiKDPqTwNxRG6muh5KEatH/q/sQTF5o20Qtf+BrjL8TOYz/GWKHEtEgqyJ70wcWFE5sAeQ68h+G02tlICaU48QUCNETaIc++TcSf8UdoZ0ZjMvKcacLA+BkjZy93c/gwrZljgHMzArzO+2onXQXwZvfXrCD1RvySiIjW95XMu8zsLnYi1l6TmK7oz7eju0tRmyHGGQdmQq/ECczZobSBgYBbjoOFLe+86Q0fz+z8LFgulxz/ZOfL1FV1XoDjZptyqYJY9VT60g6QbZOt+3M2j3WlRjoQCGMV3bKPuwDtSKQiViSQmFbYrBFjjGS5/bHaDBr9ktteNvfOUxejsjujUA6pgbP0SH2gKbVkihZFD623P3Fk7xX95qx1FxMc8V7E7AWhrbAakFQI4B67pU/95iUZdiX7tYwHNQLaEalj8nxe/TsTV+L03i0KwUncB8q3qsJKXQfVyTXiFw0Szs9XSB7bej6G/q+PYb5HL84M1LGwhWFAVebk4mlNMhoy8sg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(5660300002)(38070700005)(122000001)(38100700002)(71200400001)(53546011)(6512007)(6506007)(316002)(6486002)(2616005)(6916009)(508600001)(2906002)(8936002)(7416002)(76116006)(8676002)(86362001)(66946007)(64756008)(4326008)(91956017)(66556008)(66446008)(66476007)(33656002)(36756003)(54906003)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <631A550A6A9EF14587677C594B264686@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3609
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70254571-c102-42e6-4d30-08da1e171ba4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GwBxF58KB+2A0QXap4KfWqA9kh14TvtdJqPm3Q9zC1iIh7yCwfU+19zHuXtTkqJhzv3juPqpZfDI1hvK6RN6puhahZtb3cqa++GNGsQJNuuJIM3ElwizQUghlzSvOBAuM2B4WEccUG5U/UkGgBlSMffbfv6aoo2V/M4TE6hfyD5cfx8+O91FkJ7MgxnCBJ2wDJo8dBNH9KI+rTfEeJqwKRkDkJ32IIlBUvvmKt1WyCpkR9r7hy6hfxN4ntY2a0Jb7WBN/ZAsOFMR1DGUZPAhp+WbtYbTPi1v66L2ebaaIbNuHBmTyWgiAFPL0h9T8QBiBX17L5ne5gMuV3W9+QfJBTG5ZHx6xGB8JZ+o8LhF4VUTzS5jwkMlywpa7NLDBeSbiN+GdJs2BNYYVwD2Yw/VDyv4zdPIRpLGKVHRY//kXJfRBGInuCz/PoXHDYGOi1+tc30c0c/8GAubOgaC1IPaZlnpg0zo9lLwp1Gk5r7BZ6mOJ7O93iGzyG20DD04A35RTmtGUiVsvUebFDIFOG29G2lHcCqyJ4YIzwnE4AyTuzDc4ogmTMlmuJ3Cqy67dVbkRxsGrhBrRCguMDy8m6P4QUXQUd++lt6lHEajMM8BD83sGEozBtI6Q+ZQcvNYM3JG3vmKZcZCpZ7Bhp0PU4qFko0Qw2D2h0ilKFEMLTkdAwcbiasOX9r1X6Cgp4l54R8K+yhP+QhihmSfPEzegxoN1Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(336012)(6512007)(8676002)(70586007)(70206006)(81166007)(54906003)(82310400005)(356005)(36860700001)(316002)(47076005)(4326008)(6862004)(2906002)(53546011)(508600001)(6486002)(5660300002)(186003)(86362001)(26005)(6506007)(40460700003)(33656002)(8936002)(2616005)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 13:03:10.8388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9526bc-c4ae-44a2-03ba-08da1e1720c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5308

Hi Peng,

> On 14 Apr 2022, at 08:44, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/Kconfig.debug              | 14 ++++++++
> xen/arch/arm/arm64/debug-imx-lpuart.inc | 48 +++++++++++++++++++++++++
> 2 files changed, 62 insertions(+)
> create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
>=20
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 35ccd13273..842d768280 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -58,6 +58,16 @@ choice
> 			This option is preferred over the platform specific
> 			options; the platform specific options are deprecated
> 			and will soon be removed.
> +	config EARLY_UART_CHOICE_IMX_LPUART
> +		select EARLY_UART_IMX_LPUART
> +		depends on ARM_64
> +		bool "Early printk via i.MX LPUART"
> +		help
> +			Say Y here if you wish the early printk to direct their
> +			output to a i.MX LPUART. You can use this option to
> +			provide the parameters for the i.MX LPUART rather than
> +			selecting one of the platform specific options below if
> +			you know the parameters for the port.
> 	config EARLY_UART_CHOICE_MESON
> 		select EARLY_UART_MESON
> 		depends on ARM_64
> @@ -186,6 +196,9 @@ config EARLY_UART_CADENCE
> config EARLY_UART_EXYNOS4210
> 	select EARLY_PRINTK
> 	bool
> +config EARLY_UART_IMX_LPUART
> +	select EARLY_PRINTK
> +	bool
> config EARLY_UART_MESON
> 	select EARLY_PRINTK
> 	bool
> @@ -283,6 +296,7 @@ config EARLY_PRINTK_INC
> 	default "debug-8250.inc" if EARLY_UART_8250
> 	default "debug-cadence.inc" if EARLY_UART_CADENCE
> 	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
> +	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
> 	default "debug-meson.inc" if EARLY_UART_MESON
> 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
> 	default "debug-pl011.inc" if EARLY_UART_PL011
> diff --git a/xen/arch/arm/arm64/debug-imx-lpuart.inc b/xen/arch/arm/arm64=
/debug-imx-lpuart.inc
> new file mode 100644
> index 0000000000..b169332932
> --- /dev/null
> +++ b/xen/arch/arm/arm64/debug-imx-lpuart.inc
> @@ -0,0 +1,48 @@
> +/*
> + * xen/arch/arm/arm64/debug-imx-lpuart.inc
> + *
> + * i.MX8QM specific debug code
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + * Copyright 2022 NXP
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <asm/imx-lpuart.h>
> +
> +/*
> + * Wait LPUART to be ready to transmit
> + * rb: register which contains the UART base address
> + * rc: scratch register
> + */
> +.macro early_uart_ready xb, c
> +1:
> +        ldr   w\c, [\xb, #UARTSTAT]   /* <- Flag register */
> +        tst   w\c, #UARTSTAT_TDRE     /* Check FIFO EMPTY bit */
> +        beq   1b                      /* Wait for the UART to be ready *=
/
> +.endm
> +
> +/*
> + * LPUART transmit character
> + * rb: register which contains the UART base address
> + * rt: register which contains the character to transmit
> + */
> +.macro early_uart_transmit xb, wt
> +        str   \wt, [\xb, #UARTDATA]  /* -> Data Register */
> +.endm
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> --=20
> 2.35.1
>=20


