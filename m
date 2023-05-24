Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBE70F1B3
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538904.839268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kOM-0002TQ-E6; Wed, 24 May 2023 09:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538904.839268; Wed, 24 May 2023 09:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kOM-0002R4-9r; Wed, 24 May 2023 09:02:46 +0000
Received: by outflank-mailman (input) for mailman id 538904;
 Wed, 24 May 2023 09:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1kOK-0002Qw-WE
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:02:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bec8e311-fa11-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 11:02:44 +0200 (CEST)
Received: from AM0PR02CA0032.eurprd02.prod.outlook.com (2603:10a6:208:3e::45)
 by DB9PR08MB8740.eurprd08.prod.outlook.com (2603:10a6:10:3d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 09:02:15 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:3e:cafe::9c) by AM0PR02CA0032.outlook.office365.com
 (2603:10a6:208:3e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 09:02:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 09:02:14 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Wed, 24 May 2023 09:02:13 +0000
Received: from 0f70156dfcd2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08E81128-BBDB-4B50-8710-4FBACE2D9294.1; 
 Wed, 24 May 2023 09:02:02 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f70156dfcd2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 09:02:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8258.eurprd08.prod.outlook.com (2603:10a6:150:89::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 09:01:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:01:59 +0000
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
X-Inumbo-ID: bec8e311-fa11-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEONkkL9IaVASxqNP9PS1iiTVljciUjFEiI0xhZTpkY=;
 b=uPLGcgRzoBPtxrMAeM2kqWOIRPjT+jptjfJCU4NewcBpvitjWWT8qsPwB6jd6LaExoTHEwuPuqKglABnjo7wB5NGzOakoDdMygr9EuH0kyrpOAgfwZ3+4GT5HSg44/PDI8PbypdVKPxg7yQG1pVvuo0ZTsNLOtFVZzp4/6GCoVI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e73089b0b7829119
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLuCavJpVuafjEKsehCt2mbq2D8wzkqCpGKXT4DPIqudilfZJlJWfVTuOXTBkH3OPyS/7HwjHPsJoj2F8mNL2QtKkVBmHOXf9sI/6VDAoSZCl8vmiCovsBplJYRWIu/zvSP/WPsN/A2Ii8uS2Y1TEHSck2L1qJIyu5GXA+tEVEMdkp1eiYF/oD26mq2swEwR8J3n6td7Cp1J4kDoOVObrG41XEvf7oz+q45coO22JOOeU530nmIpblht/r7xNZA/9kGctfuM1QegPqjX7SqI1HJYGnri+WG5eAcycILAqBKwaKpPyrwR7YnbehKGIFvaTCkad5ZK/fc/hVX+bBDuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEONkkL9IaVASxqNP9PS1iiTVljciUjFEiI0xhZTpkY=;
 b=T0DwA04jnrFHqMq0jRSjCpt0OSf5YaP9+OSSl9Ekkn8XN6JhdKBRbg2goUusqltGbi7eVRFP/l1M0QMDnycNQYG2HKPptYcZM+seqnzYPb3fAmXld8K2Kw+JSl6hBSkWx+L5emAvwafvLQ3kpwzgLo/KTOclmu8r7Krw9G3zXWWkyFinbtt+zSrzvzoDE1s0v1J47KUnimoS1HqbyKgEJQdHWkJYy3boPLCfJYKEjwdeIGOFtjW+QTyXkIzFA9b9hs+JODcpdCIjXtO99ftVSBM5SBKk5y/3/qrDDdMA4FTGsIqOup3CEo3YP1osPs0rn83yJIwtkyGKm3RbIXDZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEONkkL9IaVASxqNP9PS1iiTVljciUjFEiI0xhZTpkY=;
 b=uPLGcgRzoBPtxrMAeM2kqWOIRPjT+jptjfJCU4NewcBpvitjWWT8qsPwB6jd6LaExoTHEwuPuqKglABnjo7wB5NGzOakoDdMygr9EuH0kyrpOAgfwZ3+4GT5HSg44/PDI8PbypdVKPxg7yQG1pVvuo0ZTsNLOtFVZzp4/6GCoVI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v7 01/12] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZjUpOMMV4Yflw9E2LiWKuLwqFE69pIiaA
Date: Wed, 24 May 2023 09:01:56 +0000
Message-ID: <98D7529A-FF7E-4079-B4FB-7EA096CB6822@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-2-luca.fancellu@arm.com>
In-Reply-To: <20230523074326.3035745-2-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8258:EE_|AM7EUR03FT054:EE_|DB9PR08MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3ed4f2-624b-4667-3ead-08db5c35913b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DlGiHYbb6qAWt9NiF9Bk4Bbjj1xCwMTCHQA66GFUsZzPEaFsfvDK+hh+OoVhrzdPJOaFWYhwH4y5UzK6OLdTC8iJtDYC161/tURV/Cm+bIxs0UypOfhJxtx1k98ir3O4zqT740EkRI+3y8u7i6t44mqTf8dx6IzumqBCE4ZEKep598DwnhIQF/zWF9N7jRPtiIObRgCinjGQbz5p7LHVPuL7a79PNy4lq17bVaMYqsYZviX+x+mu0C4FkI2Kah6gxx3vySx2kYO3u16dq+P0/lCaoU9SLzd2+0SsSVjBzgzeVSQsAiroiYjY1Ku1l2ltoZudVdug6Jen30uQonPpwiwv8vZJEh+ZGO04uN33g+4tef3GOWEu40m5c1whGFoi5TSgVH+xt+aSmMDeh2ISBY+8v8wNgRyuohjydBqRbvRbJVsFL+ORWaM0HWsR9l8gzODLVPWz6V/X8Q5p71oICDtuuQFntp6/snw2Egl+hM8DaUspkD5z3EG2ncJ/Pxf7Fc10U1OIdr2JPyzo4pY1nsyezIRwtyIWaKutya6PtT1FCMHNllXtgqwfw4BQCKn0XOMkD2YF1j77s4iL/YlfA0qlSyguxWlpzeCEF5+xxGFDajz+XvbDeYTPmKJ8msdjAKU7rd7smdTLYy0Ftdg5vA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(54906003)(86362001)(37006003)(41300700001)(6486002)(478600001)(316002)(66446008)(91956017)(4326008)(6636002)(66476007)(66556008)(76116006)(6666004)(71200400001)(64756008)(66946007)(5660300002)(38070700005)(8676002)(6862004)(8936002)(38100700002)(122000001)(30864003)(26005)(33656002)(6512007)(6506007)(53546011)(83380400001)(2906002)(2616005)(186003)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1143C7A69B0A4B429C9923E595167895@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8258
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f949864-f35d-402b-6e0c-08db5c35867f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EY7HEwMpWuAvnDHX8zTiSgtRb7BEyWz2HGvXMGY7x5RIiO1eWPdRQH4YaC7i1oAVV1CJ8wgXsSdWloJnj6os+M9masZYSEyAFF916wsOODgEKrJI1tCU54Yn6WLDRVrozE6KgekMnYjzxArPeaquziunJdAmxmEQ9/u2YFTAqSWnAp+Px+d0IlaO8pRzBdmwkLLiLmzx65E1ikq0q6GygpC4YRjgTbjNZA1sesRngTcT1fAot9DYSIp5CYij1Inhs5dtYRmDbi2gUDUDtHaG7G5oynDWaPTaXiti1tAWkwz64IejFzLyUWEsHxkrhMYLjfq3ZXN/n+unRZ4KaF/+/QF5D8ECke10o3pcN5YoFwklWwgTkgHjdqr9p4EkiY6P+Enk0JyHDCIzbYxJqB9Nf2lt/kNXmO3yC/4ysgYNfj8m9b3isu594Q+fJ+Ssx0h3GTMp0/Yb/+1iROvt/WOxtB1sEmNOS7r/YV+32ARVC85ELruInonKevDEjOkketwgGujvbAYOPXYzLbJVlwxTZjZRZ2SOK//uZhBh2vEnAzIAFpfzYsV/yuujDBuUTcEK79WMojkzs36F08EZPGVsbEWc8tjvpEuQkMXbiYnbGdk7oxJAnlD0AU9JeIY7wQ9QV0MEGYsfvdlmYpZBQMCKe81YTLauAtVU2lSzw16JgeWBqKFEMN3q4cvGZRcMqTxDaGiT8j8RxgxmgtB0nO/zWY8lvJuYKIhYmSQIliR5AZ4J2WJx0wytXKdhFAbLWEFg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(30864003)(2906002)(36860700001)(53546011)(186003)(83380400001)(47076005)(86362001)(2616005)(336012)(40480700001)(82740400003)(81166007)(356005)(6862004)(36756003)(5660300002)(8936002)(316002)(41300700001)(70586007)(70206006)(40460700003)(6666004)(6486002)(33656002)(26005)(107886003)(6512007)(6506007)(4326008)(478600001)(8676002)(6636002)(37006003)(54906003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:02:14.1877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3ed4f2-624b-4667-3ead-08db5c35913b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8740

Hi Luca,

> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Enable Xen to handle the SVE extension, add code in cpufeature module
> to handle ZCR SVE register, disable trapping SVE feature on system
> boot only when SVE resources are accessed.
> While there, correct coding style for the comment on coprocessor
> trapping.
>=20
> Now cptr_el2 is part of the domain context and it will be restored
> on context switch, this is a preparation for saving the SVE context
> which will be part of VFP operations, so restore it before the call
> to save VFP registers.
> To save an additional isb barrier, restore cptr_el2 before an
> existing isb barrier and move the call for saving VFP context after
> that barrier. To keep a (mostly) specularity of ctxt_switch_to()
> and ctxt_switch_from(), move vfp_save_state() up in the function.
>=20
> Change the KConfig entry to make ARM64_SVE symbol selectable, by
> default it will be not selected.
>=20
> Create sve module and sve_asm.S that contains assembly routines for
> the SVE feature, this code is inspired from linux and it uses
> instruction encoding to be compatible with compilers that does not
> support SVE, imported instructions are documented in
> README.LinuxPrimitives.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

with one minor NIT that could be fixed on commit...

> ---
> Changes from v6:
> - modified licence, add emacs block, move vfp_save_state up in the
>   function, add comments to CPTR_EL2 and vfp_restore_state, don't
>   use variable in init_traps(), code style fixes,
>   add entries to README.LinuxPrimitives (Julien)
> - vl_to_zcr is moved into sve.c module as changes to the series led
>   to its usage only inside it, remove stub for compute_max_zcr and
>   rely on compiler DCE.
> Changes from v5:
> - Add R-by Bertrand
> Changes from v4:
> - don't use fixed types in vl_to_zcr, forgot to address that in
>   v3, by mistake I changed that in patch 2, fixing now (Jan)
> Changes from v3:
> - no changes
> Changes from v2:
> - renamed sve_asm.S in sve-asm.S, new files should not contain
>   underscore in the name (Jan)
> Changes from v1:
> - Add assert to vl_to_zcr, it is never called with vl=3D=3D0, but just
>   to be sure it won't in the future.
> Changes from RFC:
> - Moved restoring of cptr before an existing barrier (Julien)
> - Marked the feature as unsupported for now (Julien)
> - Trap and un-trap only when using SVE resources in
>   compute_max_zcr() (Julien)
> ---
> xen/arch/arm/Kconfig                     | 10 ++--
> xen/arch/arm/README.LinuxPrimitives      |  9 ++++
> xen/arch/arm/arm64/Makefile              |  1 +
> xen/arch/arm/arm64/cpufeature.c          |  7 ++-
> xen/arch/arm/arm64/sve-asm.S             | 48 +++++++++++++++++++
> xen/arch/arm/arm64/sve.c                 | 59 ++++++++++++++++++++++++
> xen/arch/arm/cpufeature.c                |  6 ++-
> xen/arch/arm/domain.c                    | 20 +++++---
> xen/arch/arm/include/asm/arm64/sve.h     | 27 +++++++++++
> xen/arch/arm/include/asm/arm64/sysregs.h |  1 +
> xen/arch/arm/include/asm/cpufeature.h    | 14 ++++++
> xen/arch/arm/include/asm/domain.h        |  1 +
> xen/arch/arm/include/asm/processor.h     |  2 +
> xen/arch/arm/setup.c                     |  5 +-
> xen/arch/arm/traps.c                     | 27 ++++++-----
> 15 files changed, 210 insertions(+), 27 deletions(-)
> create mode 100644 xen/arch/arm/arm64/sve-asm.S
> create mode 100644 xen/arch/arm/arm64/sve.c
> create mode 100644 xen/arch/arm/include/asm/arm64/sve.h
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c7f..41f45d8d1203 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -112,11 +112,15 @@ config ARM64_PTR_AUTH
>  This feature is not supported in Xen.
>=20
> config ARM64_SVE
> - def_bool n
> + bool "Enable Scalar Vector Extension support (UNSUPPORTED)" if UNSUPPOR=
TED
> depends on ARM_64
> help
> -  Scalar Vector Extension support.
> -  This feature is not supported in Xen.
> +  Scalar Vector Extension (SVE/SVE2) support for guests.
> +
> +  Please be aware that currently, enabling this feature will add latency=
 on
> +  VM context switch between SVE enabled guests, between not-enabled SVE
> +  guests and SVE enabled guests and viceversa, compared to the time
> +  required to switch between not-enabled SVE guests.
>=20
> config ARM64_MTE
> def_bool n
> diff --git a/xen/arch/arm/README.LinuxPrimitives b/xen/arch/arm/README.Li=
nuxPrimitives
> index 1d53e6a898da..76c8df29e416 100644
> --- a/xen/arch/arm/README.LinuxPrimitives
> +++ b/xen/arch/arm/README.LinuxPrimitives
> @@ -62,6 +62,15 @@ done
> linux/arch/arm64/lib/clear_page.S       xen/arch/arm/arm64/lib/clear_page=
.S
> linux/arch/arm64/lib/copy_page.S        unused in Xen
>=20
> +---------------------------------------------------------------------
> +
> +SVE assembly macro: last sync @ v6.3.0 (last commit: 457391b03803)
> +
> +linux/arch/arm64/include/asm/fpsimdmacros.h   xen/arch/arm/include/asm/a=
rm64/sve-asm.S
> +
> +The following macros were taken from Linux:
> +    _check_general_reg, _check_num, _sve_rdvl
> +
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> arm32
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 28481393e98f..54ad55c75cda 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
> obj-y +=3D mm.o
> obj-y +=3D smc.o
> obj-y +=3D smpboot.o
> +obj-$(CONFIG_ARM64_SVE) +=3D sve.o sve-asm.o
> obj-y +=3D traps.o
> obj-y +=3D vfp.o
> obj-y +=3D vsysreg.o
> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeat=
ure.c
> index d9039d37b2d1..b4656ff4d80f 100644
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -455,15 +455,11 @@ static const struct arm64_ftr_bits ftr_id_dfr1[] =
=3D {
> ARM64_FTR_END,
> };
>=20
> -#if 0
> -/* TODO: use this to sanitize SVE once we support it */
> -
> static const struct arm64_ftr_bits ftr_zcr[] =3D {
> ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
> ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0), /* LEN */
> ARM64_FTR_END,
> };
> -#endif
>=20
> /*
>  * Common ftr bits for a 32bit register with all hidden, strict
> @@ -603,6 +599,9 @@ void update_system_features(const struct cpuinfo_arm =
*new)
>=20
> SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
>=20
> + if ( cpu_has_sve )
> + SANITIZE_REG(zcr64, 0, zcr);
> +
> /*
> * Comment from Linux:
> * Userspace may perform DC ZVA instructions. Mismatched block sizes
> diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
> new file mode 100644
> index 000000000000..4d1549344733
> --- /dev/null
> +++ b/xen/arch/arm/arm64/sve-asm.S
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Arm SVE assembly routines
> + *
> + * Copyright (C) 2022 ARM Ltd.
> + *
> + * Some macros and instruction encoding in this file are taken from linu=
x 6.1.1,
> + * file arch/arm64/include/asm/fpsimdmacros.h, some of them are a modifi=
ed
> + * version.
> + */
> +
> +/* Sanity-check macros to help avoid encoding garbage instructions */
> +
> +.macro _check_general_reg nr
> +    .if (\nr) < 0 || (\nr) > 30
> +        .error "Bad register number \nr."
> +    .endif
> +.endm
> +
> +.macro _check_num n, min, max
> +    .if (\n) < (\min) || (\n) > (\max)
> +        .error "Number \n out of range [\min,\max]"
> +    .endif
> +.endm
> +
> +/* SVE instruction encodings for non-SVE-capable assemblers */
> +/* (pre binutils 2.28, all kernel capable clang versions support SVE) */
> +
> +/* RDVL X\nx, #\imm */
> +.macro _sve_rdvl nx, imm
> +    _check_general_reg \nx
> +    _check_num (\imm), -0x20, 0x1f
> +    .inst 0x04bf5000                \
> +        | (\nx)                     \
> +        | (((\imm) & 0x3f) << 5)
> +.endm
> +
> +/* Gets the current vector register size in bytes */
> +GLOBAL(sve_get_hw_vl)
> +    _sve_rdvl 0, 1
> +    ret
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
> new file mode 100644
> index 000000000000..e05ccc38a896
> --- /dev/null
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Arm SVE feature code
> + *
> + * Copyright (C) 2022 ARM Ltd.
> + */
> +
> +#include <xen/types.h>
> +#include <asm/arm64/sve.h>
> +#include <asm/arm64/sysregs.h>
> +#include <asm/processor.h>
> +#include <asm/system.h>
> +
> +extern unsigned int sve_get_hw_vl(void);
> +
> +/* Takes a vector length in bits and returns the ZCR_ELx encoding */
> +static inline register_t vl_to_zcr(unsigned int vl)
> +{
> +    ASSERT(vl > 0);
> +    return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
> +}
> +
> +register_t compute_max_zcr(void)
> +{
> +    register_t cptr_bits =3D get_default_cptr_flags();
> +    register_t zcr =3D vl_to_zcr(SVE_VL_MAX_BITS);
> +    unsigned int hw_vl;
> +
> +    /* Remove trap for SVE resources */
> +    WRITE_SYSREG(cptr_bits & ~HCPTR_CP(8), CPTR_EL2);
> +    isb();
> +
> +    /*
> +     * Set the maximum SVE vector length, doing that we will know the VL
> +     * supported by the platform, calling sve_get_hw_vl()
> +     */
> +    WRITE_SYSREG(zcr, ZCR_EL2);
> +
> +    /*
> +     * Read the maximum VL, which could be lower than what we imposed be=
fore,
> +     * hw_vl contains VL in bytes, multiply it by 8 to use vl_to_zcr() l=
ater
> +     */
> +    hw_vl =3D sve_get_hw_vl() * 8U;
> +
> +    /* Restore CPTR_EL2 */
> +    WRITE_SYSREG(cptr_bits, CPTR_EL2);
> +    isb();
> +
> +    return vl_to_zcr(hw_vl);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index c4ec38bb2554..83b84368f6d5 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -9,6 +9,7 @@
> #include <xen/init.h>
> #include <xen/smp.h>
> #include <xen/stop_machine.h>
> +#include <asm/arm64/sve.h>
> #include <asm/cpufeature.h>
>=20
> DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
> @@ -143,6 +144,9 @@ void identify_cpu(struct cpuinfo_arm *c)
>=20
>     c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
>=20
> +    if ( cpu_has_sve )
> +        c->zcr64.bits[0] =3D compute_max_zcr();
> +
>     c->dczid.bits[0] =3D READ_SYSREG(DCZID_EL0);
>=20
>     c->ctr.bits[0] =3D READ_SYSREG(CTR_EL0);
> @@ -199,7 +203,7 @@ static int __init create_guest_cpuinfo(void)
>     guest_cpuinfo.pfr64.mpam =3D 0;
>     guest_cpuinfo.pfr64.mpam_frac =3D 0;
>=20
> -    /* Hide SVE as Xen does not support it */
> +    /* Hide SVE by default to the guests */

Everything is for guests and as Jan mentioned in an other comment
this could be wrongly interpreted.

Here I would suggest to just stick to:
/* Hide SVE by default */

Cheers
Bertrand


