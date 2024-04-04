Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A61898329
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 10:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700753.1094363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsIU4-0002aS-Pd; Thu, 04 Apr 2024 08:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700753.1094363; Thu, 04 Apr 2024 08:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsIU4-0002Xm-ME; Thu, 04 Apr 2024 08:30:08 +0000
Received: by outflank-mailman (input) for mailman id 700753;
 Thu, 04 Apr 2024 08:30:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7v7D=LJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rsIU3-0002Xg-Fh
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 08:30:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a13c6f4-f25d-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 10:30:06 +0200 (CEST)
Received: from DU6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::23)
 by GV2PR08MB8653.eurprd08.prod.outlook.com (2603:10a6:150:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 08:30:02 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::43) by DU6P191CA0019.outlook.office365.com
 (2603:10a6:10:540::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.28 via Frontend
 Transport; Thu, 4 Apr 2024 08:30:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22 via
 Frontend Transport; Thu, 4 Apr 2024 08:30:02 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300");
 Thu, 04 Apr 2024 08:30:01 +0000
Received: from c3068c9efd0b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 254D8AC3-BDA7-4996-B981-9A842AFA8CA0.1; 
 Thu, 04 Apr 2024 08:29:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3068c9efd0b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Apr 2024 08:29:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB7590.eurprd08.prod.outlook.com (2603:10a6:10:317::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 08:29:53 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 08:29:53 +0000
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
X-Inumbo-ID: 8a13c6f4-f25d-11ee-afe5-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GjgzeK+hakPvip2ZNUSMMpp3VW80+35unzxyYLRO2zsB2a8iUK+dKTgkJHKagFyuPUq0GB8caF6KPfUyPU90titK0Bv6Xx6e8fJlnI6/9L/Tl+scy+Dqp1egVEnWbF6xxztkSFT8XLSlOR/rplJ2je5UY7rO6rauqzWSSukRkmNPcJllTFCpE1Q9d4bxaFoABr3VZoYrDCId1GPVamRMMgNOWUMg0N4Xvz0QL5McZeW6zOKGb+5cFXNYouqwyl0NevsOibd2Rvo57Mv8hz85HF+CNPxy9SKx52M+2Ypeua4o1qZrmKftpD+HQgcSEvkplSDb3CCbKnf2rw10a4lg9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiuEi3DA1yEXDcusArxphXutTqifpUZ1MOc/n/PV/Jk=;
 b=lxKcKyPciIWRwCPk58qJT6MZcpXduh9AZ068HGwK1k/4JKGygMn5cl6kDiRoLrDEm+HQBFpdS+EuuZ0uiV+4rtcbDFGlpZNyPBhLMtvuMM+RcH/bVGMtNOFtG37ceriNqinfUBu9UjBe3saMyLJTjSwN4sRrCTGIU2HlSuQOzE4+gO0FsJuXH6CnV2eh+Oy6cY0MdrJ+Fqc5rz+a1DxyOraFY1WbezIaeBoplf0zfAsDaJX53kLmX2r0oZeubRDBZbWdH4V1dQSr4NrS75aqqcHLLacR8FgUZKJl48V3uYzv30F4kDS7TicHlGGaAUdCB9Tmoif9nDJ29QObsq34hA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiuEi3DA1yEXDcusArxphXutTqifpUZ1MOc/n/PV/Jk=;
 b=izuat4ICFUrsbBRiRUur0IURNKwYjLvgrBI4TxbHho+U4EjEzTMI7fUnxctJbSkXCRUT7bq/hq/U4lcJFxuqmJ2H33OGkqudEYugKA+iuWJVltZZ8ilkmECB+aiY1Y358bcvNyMkGBjgJ2dy9BTkPLgq799tPvFYCGOS/0G7t6s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e86af504c71abe19
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk9CY8kY4tZ56mCdGW4RnmA2EMvsITJ6wnRg0Y83lsK3daMbOcQEDLiOzGt71vafwL2q/PW14xjAbR5tbTLef5yu9OLwMylcyNBWxsd5b/7s3yNSc0qCFGi/1XW9Fr47U3/MNn/8bpVBTeIXBKx1/JDMCYM+Y1+if5kgU+fwOdaa60a4Abr1mEp5LfmihRE/ySQtrlRfOoNxDGfs40nbGJmAq8wDykOwpbRiRq+T3UEPQtw5gsTwbSR4yYQACd3ZJpFf9PV10TaoV1x9qCNsIhmY4lAm3APjYJAzwguDPOmvq6ldOUBOw0Q34yKQx1//KnH9buH8154F0nkWasSbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiuEi3DA1yEXDcusArxphXutTqifpUZ1MOc/n/PV/Jk=;
 b=SgWwOcADxqC7gbFkypDRNwMhBX1F8fgS/8kUsdM6xyeNgJrHP7/hxGlPWcPAZQDHbn7C115HAV+qrONvCEctVhX1siYRPB6l/AEilsU9jwEhugKt+0b8S1bo0iZnIacNStKpyU3Q5zGFsrE/xGmzveuAVOACG06INogHYaS0+9a2vPt2hu9DFc7TsyLcvNLL4lJndisEWlcH5pBG7maD80AO8cVYLLuYrzoL284YB7z+vzjYB8gCvXQFrsD8jX95zJLPS/zN8OaDrzqmfmgJ19CWVrOyvDLr4CQ6LtQc7XH5UZpwj8eLj42h4iK+E7TT86TtE0Rr/cZ2c5CoiRVR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiuEi3DA1yEXDcusArxphXutTqifpUZ1MOc/n/PV/Jk=;
 b=izuat4ICFUrsbBRiRUur0IURNKwYjLvgrBI4TxbHho+U4EjEzTMI7fUnxctJbSkXCRUT7bq/hq/U4lcJFxuqmJ2H33OGkqudEYugKA+iuWJVltZZ8ilkmECB+aiY1Y358bcvNyMkGBjgJ2dy9BTkPLgq799tPvFYCGOS/0G7t6s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: [PATCH v3] docs/misra: document the expected sizes of integer
 types
Thread-Topic: [PATCH v3] docs/misra: document the expected sizes of integer
 types
Thread-Index: AQHahi02L7CmbuGs70iGCAZey/rjT7FXyCAA
Date: Thu, 4 Apr 2024 08:29:53 +0000
Message-ID: <703E19A2-FED2-4DA1-B9AA-1AF55BBE85B4@arm.com>
References:
 <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB7590:EE_|DU2PEPF0001E9C1:EE_|GV2PR08MB8653:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8TPREFXUYwJ7z3rRIEEui5KOdS4a8dGdv3Rjh+1qkl3rfMzkN2tSx9lTo7blr3NWV9zmowlx12lwI8Yb1w08qX7dzBMeF2H+zorDm0XSLFEAI522QNqp1Q37TspeE5Jjz6bliwBlgAF6fTj6A4HaPubc+CA4+QJiUe/SD2cIOO7MUTgPr88TCoiws1VQmA1jXrb1VlS1ZQZ3ba2zUONQq3tRiVpp1PhlbSTCSmBCuVgbKpFuZ5L2JV1S0AOLU0Mf2Tej6U5UZikEjFLvyja36hXMrlgtP0sDVGapjgMrckZ9KmSIh+Hraxoc+Y77apkybra7fk0YQDwlnopasUUbssBnuz65GnI/VkLTGWfxX19QnNZY+nb5L+x650mU0eA2ZM1xxQi8Q+3TsU2Frweaaei8oTMBu0lkHh+IsBwG0X77noax3NyX2gjtMEXDWJq+QFMVtIu6t5j/bcCE1nUCpy7tHaDWNS42tH9XlRUysa5R5cl3RJOvl5IHOAJoRjuyCKRil1dV/LFLed4jOZRowruYxiNUkovIzaCr6NqsJJe7xHnK8es+TEmCoowyyX6MSf53diFfEqzFi4ZflUvRGp1aSFNGA4rx+CAqSpLkmhMujsfkB7alvH9hh/9JZq5wdFRpTTlhMl0yGuwVWO3Rf4g9pN4XMHRqzjF6+hnQWNU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FF0FA00762E3E4593592EE50F684D4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7590
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b672d9f-82b2-48e1-4c7d-08dc54816c24
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yPbfAcI/SlagYlIuFectWn29BkxJ6YnJDqMo7/t8+Dz2holP/4Ht41Lm0/GMG+kKdfwPj2TlSSBquyo+qMYeCyEdzG5wM0278yLefqnXqMUTL2IDDr31ThoDgG1V4J5ONnhdaN0sGv8QurMcDXPs2/PNNRwQmVD4LmWe0yVagYxyiuey4LR26E6p8xjQuLprKRY8AcdayjzYitPuDOa59LuUzAbmUGGvbmmgTfoIx5n9EIO+hXWFJTBJMCx0Ytu4glBmpdbDcUMg4fDzUqB+8tNPQSW695GwL1UcJnWnxpnkYMcwjvYnrlJZGaeITASlP9vUrBRy9S/bUxjKvvL+42QvwPc5FZGbBQ0BZt6Ci/mHFKQPF4WspXaJPZf/Nh1hmfEEixxT1x0onnKx76rhtDL3RoKLh9dD6z0L6v9qP8b+FZQTnkR0B6x64XfZ5EDORD/Xr3Q6pn8KTIOZwsUMfJdYJOSXPaUmZwu1fcz7JMfywx7oyf0rboQ3qL3hBfZTlQh37gWe0AeYiwalB3jcqlDrch2q7oNwWZFXVrgeNYkYyQ/tDLxALuLhqZ9matNgo1wDsGsDBydXp+agLSLdVyBLca2AnBl8q1iqdjqHhoJ1pMatcw5yeBmO3Eav4TA4y50XeUAjoQusVxdFrYXLqC0PWqNE1wQXQwcKdBuz+A3D7qU+/t8hR6eKYA+RdI8lB++0W8LbXdM1sIwYm9ypr1ajQDZANER1QGxZ2jnu/PMJD5eVO6GfXM3z3SGXL2GYNWvWEQkas10Ym2rQoN2npQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 08:30:02.1600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b672d9f-82b2-48e1-4c7d-08dc54816c24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8653

Hi Stefano,

> On 4 Apr 2024, at 03:12, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> Xen makes assumptions about the size of integer types on the various
> architectures. Document these assumptions.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v3:
> - add links to System V, AAPCS32 and AAPCS64
>=20
> ---
> docs/misra/C-language-toolchain.rst | 69 +++++++++++++++++++++++++++++
> 1 file changed, 69 insertions(+)
>=20
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-=
toolchain.rst
> index b7c2000992..84b21992bc 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -480,4 +480,73 @@ The table columns are as follows:
>      - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Sect=
ion "11.1 Implementation-defined behavior" of CPP_MANUAL.
>=20
>=20
> +Sizes of Integer types
> +______________________
> +
> +Xen expects System V ABI on x86_64:
> +  https://gitlab.com/x86-psABIs/x86-64-ABI
> +
> +Xen expects AAPCS32 on ARMv8-A AArch32:
> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst
> +
> +Xen expects AAPCS64 LP64 on ARMv8-A AArch64:
> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst

We still support armv7 somehow so we should add something for it here.

> +
> +A summary table of data types, sizes and alignment is below:
> +
> +.. list-table::
> +   :widths: 10 10 10 45
> +   :header-rows: 1
> +
> +   * - Type
> +     - Size
> +     - Alignment
> +     - Architectures
> +
> +   * - char=20
> +     - 8 bits
> +     - 8 bits
> +     - all architectures
> +
> +   * - short
> +     - 16 bits
> +     - 16 bits
> +     - all architectures
> +
> +   * - int
> +     - 32 bits
> +     - 32 bits
> +     - all architectures
> +
> +   * - long
> +     - 32 bits
> +     - 32 bits=20
> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)

Same here armv7 should be mentioned.

> +
> +   * - long
> +     - 64 bits
> +     - 64 bits=20
> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
> +
> +   * - long long
> +     - 64-bit
> +     - 32-bit
> +     - x86_32
> +
> +   * - long long
> +     - 64-bit
> +     - 64-bit
> +     - 64-bit architectures, ARMv8-A AArch32, ARMv8-R AArch32

Should this be all architecture except x86_32 ?

> +
> +   * - pointer
> +     - 32-bit
> +     - 32-bit
> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)

Armv7 missing here.

> +
> +   * - pointer
> +     - 64-bit
> +     - 64-bit
> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
> +
> +
> END OF DOCUMENT.
> --=20
> 2.25.1
>=20

Cheers
Bertrand


