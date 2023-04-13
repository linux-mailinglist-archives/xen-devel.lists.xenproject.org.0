Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E716E0DA3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520696.808563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwMI-0003zD-7C; Thu, 13 Apr 2023 12:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520696.808563; Thu, 13 Apr 2023 12:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwMI-0003wU-3L; Thu, 13 Apr 2023 12:47:26 +0000
Received: by outflank-mailman (input) for mailman id 520696;
 Thu, 13 Apr 2023 12:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73wY=AE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pmwMF-0003wO-Uy
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:47:24 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe12::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55a5d9c5-d9f9-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 14:47:23 +0200 (CEST)
Received: from DB8PR09CA0012.eurprd09.prod.outlook.com (2603:10a6:10:a0::25)
 by AS8PR08MB8223.eurprd08.prod.outlook.com (2603:10a6:20b:52b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:47:18 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0::4) by DB8PR09CA0012.outlook.office365.com
 (2603:10a6:10:a0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 12:47:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 12:47:17 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Thu, 13 Apr 2023 12:47:17 +0000
Received: from dafbc1c48e49.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA2553E5-1DDC-4E0D-BC9A-BBE9232C4840.1; 
 Thu, 13 Apr 2023 12:47:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dafbc1c48e49.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 12:47:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB9303.eurprd08.prod.outlook.com (2603:10a6:150:d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:47:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:47:02 +0000
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
X-Inumbo-ID: 55a5d9c5-d9f9-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYSNyVTp8W/FB7GwWnYK3bCKTHKAmsNBpUFfPF0J3sk=;
 b=7hgFXUVMbiJ7Xo1HjWj+0ndJs+/vDeVB+cASc2g2X68Dd4ec3tnHCoMw34augXRJQdUUdN5Wmal+a8G+4txIDc6HVirJ7toDSUzY7u4mqrQNIulVicfoepoy0vWbOJObvMCIqMi1297XOxVvenisB9MHJNIGFjvcTEE1EV7JVVs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6977f6572de6333
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2HZ3hRY0bEFOZGJiL36bVNPr/qs9XhAt7zHaDR9+As87iiw5FdlyROY55peNAJKbprN82dImc9GLsmpdcY/jRiSpCBnflEtL3XgXKlqzhzzmt0UN8lrUCXvrJb87V0tG5Kj+i54RBYiY1ETg6IFheVFKU2EEF4gJ0eKWzq/cX64cV3Ncu1Rg1co0evVg5g0MstnNGzwL8HJDbt2+/Q4TEEI3QotnhLL7VrmRHlTbrSoVq+c+r4yWDoHC1sx7E80uLJEDuSAybrFJhkFlSvkH9ld1qtez5cpXTwZdxQHi80a7f4I0kysAMkPLRpI2WtLOxcRlxHo7LEfSC3YoqW9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYSNyVTp8W/FB7GwWnYK3bCKTHKAmsNBpUFfPF0J3sk=;
 b=g1sqZJtVb/Th+AHabQL+OChYkNcI8JO9fkKU4Bzlc26CK+YtzoEKhWd6DWcP6zzw0ZmTYU1yjVga1GVcIBW1yMWZMjmNpzXO+Ymo+Ps8dg9loE8HZN4x6+Aeh8SF6SWrYckIwHvpQHL/F7ZiPgB9g78U+o/1Bk2INxn9HxIhKwwIHWyLSyIgbqNKJL6VSiqtRHTBQKZ1ODy4eB5bH33t42JrRNBeB7pdORDw1abFdsOTJx1bkkWZvZOvRT2SIRD/DzO5jGOovF8cYdnFNn8iZ2VgB6Tf3wWmnHqnYQW85SV8QaQVpyhDFR0wl7wObAOm8rh77s+oNGQvHbrhfD/CDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYSNyVTp8W/FB7GwWnYK3bCKTHKAmsNBpUFfPF0J3sk=;
 b=7hgFXUVMbiJ7Xo1HjWj+0ndJs+/vDeVB+cASc2g2X68Dd4ec3tnHCoMw34augXRJQdUUdN5Wmal+a8G+4txIDc6HVirJ7toDSUzY7u4mqrQNIulVicfoepoy0vWbOJObvMCIqMi1297XOxVvenisB9MHJNIGFjvcTEE1EV7JVVs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v5 01/12] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZbSQnZHhi12xjyUK0b5ypet9SdK8pMcIA
Date: Thu, 13 Apr 2023 12:47:02 +0000
Message-ID: <190AEC88-68BE-4DEA-84D5-9DDF0F63A365@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-2-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-2-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB9303:EE_|DBAEUR03FT032:EE_|AS8PR08MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: d8659d4c-50fd-412c-6170-08db3c1d3721
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G1/kKWLWtfq1Ih6vfQZDmdHc5EfSKHQhLcoJEzCZZUmZ5MDaYi1zL2dTEglvoo0Ew3m8quMHIKIJY8UN9VxxOldsoJG8xPE6PyDT8jX6ac7zaE243PsiJYLr3Y5Km9q8O1+/yZhZmEhQc0pe1u2lVoRdc776DcxwHODBmTFo9iWgTrO3gEmqwHJoGBonJyIrvEqstJhJcwyzGbX21msjtCsf9LKjhHHa+ie9gkn53zu8+Aw+cD0UV2ZzRnaLMOEzTJXJCM2MUuZ9xxsNcVWY09SraiiMAjN+ZsOKn+VQLjTBG752GwHJb411BiQce67+YGbfvtvWdcGPhVTr0u05QRoK0YUOXLPFXRVp3uKgT70HdZ0DthMJ4xM36JxEOrpmIDJEcuWaKIZbb2x9boQ1yAmcXUM+N4NEDmsAT8jhjmnHHQet2SM77BYeH0i4RkBYxTmOu2Nj5k+Lhzt/Aact9tpdBMCe+hndUAX53x8cakX3+W55r9VuB9zWsQ6aTG6twMbGFvxNvr0MCrb+X1rP2PyEi2xcFeXAhTS0FnJIhcMeTUfnqa4jTC9yCRvXjKD0jCwmTqBJzM8TCFSJKI0PCuoefFp4hqo3naTotStrBVKlPpJ8ZeexsldQ9GZ7+J271E6+Du/2ldpMFg/evBTNIziEo8v0xvJg8s/uvBgYkzE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(71200400001)(6486002)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(36756003)(76116006)(91956017)(37006003)(30864003)(2906002)(38070700005)(86362001)(122000001)(41300700001)(33656002)(5660300002)(8676002)(8936002)(6862004)(316002)(38100700002)(478600001)(54906003)(6636002)(53546011)(6512007)(6506007)(26005)(2616005)(186003)(83380400001)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FAC3C652EDC8B4CA1BEA307BC42661D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9303
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86a3bd36-fcc8-47b9-51bc-08db3c1d2e07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKriwFsla8SlnX7RH06F8Xj6vbc94kc7cpa+iPpRtpA/CXgsZSc81pYY/T/5Rhh7h/HhWHJXnENqGyyJ3G0I8A0BPsjpoz47xrTGONKsl/wK/HE311N2vja8oO689cNb+Z7FFaCiCPR0/tTfW6mNWrrBeUmFDvid5sd5cA3aFXvUv66Ubtz8DlaONMSFq2a666ElQOZjoxP5/hTzy0nmuFAnYZoBOBYHsiQyI9TNJMRSVpLTYIu+wbfrToquTVWo43o9AnC34FI7N3nBvcAOC24Uh7EproYy8lpWOyTb4Eg7WDw80FPfm3dSBOpbHYnddVG/b79GQZq6T/eIuFWo5ABA4BmlrCuldi/fVd6ku2WyVFyDT5csWRDbgdB+jTonHnSDovaQXAU3kUQ7xsPBXnYNWH9roZYCl+QqNloV5sofoZPJxR9I4qcfCsSuQPTLvrGr4I7oMndvgvY8r34J6RD+jQPnzBGqCU5ywC4g0xLwxI6j1HcA6KJR+5QA64cLrcUZbm6Fzg80dEn7WbgowA3BvL0ZoTJKoGBK7SNoaCZAfr7F7SYe//iFY6RTyXjll3DFvctumt76FSPGXKeqo9/kv/H5FOnoPm8aYbpXn9jI7CsyVfNPJksCjufT3zlKLaknN7sUYE7vE9eBUBVv4HkEntxYMwfWEVocSTnsoD/aqpa3ujOqdj1g6ZOKJbIYOg6f2Rg+mpQr6ZrtCnF6lnneYCGuP5zMqzESrXLc/Q8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(4326008)(6636002)(316002)(54906003)(37006003)(70206006)(70586007)(6486002)(478600001)(41300700001)(40480700001)(8936002)(5660300002)(6862004)(8676002)(82310400005)(30864003)(2906002)(81166007)(356005)(36756003)(82740400003)(86362001)(36860700001)(33656002)(336012)(2616005)(53546011)(6512007)(107886003)(40460700003)(186003)(26005)(47076005)(83380400001)(6506007)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:47:17.9709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8659d4c-50fd-412c-6170-08db3c1d3721
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8223

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
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
> that barrier.
>=20
> Change the KConfig entry to make ARM64_SVE symbol selectable, by
> default it will be not selected.
>=20
> Create sve module and sve_asm.S that contains assembly routines for
> the SVE feature, this code is inspired from linux and it uses
> instruction encoding to be compatible with compilers that does not
> support SVE.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
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
> xen/arch/arm/Kconfig                     | 10 +++--
> xen/arch/arm/arm64/Makefile              |  1 +
> xen/arch/arm/arm64/cpufeature.c          |  7 ++--
> xen/arch/arm/arm64/sve-asm.S             | 48 +++++++++++++++++++++++
> xen/arch/arm/arm64/sve.c                 | 50 ++++++++++++++++++++++++
> xen/arch/arm/cpufeature.c                |  6 ++-
> xen/arch/arm/domain.c                    |  9 +++--
> xen/arch/arm/include/asm/arm64/sve.h     | 43 ++++++++++++++++++++
> xen/arch/arm/include/asm/arm64/sysregs.h |  1 +
> xen/arch/arm/include/asm/cpufeature.h    | 14 +++++++
> xen/arch/arm/include/asm/domain.h        |  1 +
> xen/arch/arm/include/asm/processor.h     |  2 +
> xen/arch/arm/setup.c                     |  5 ++-
> xen/arch/arm/traps.c                     | 28 +++++++------
> 14 files changed, 201 insertions(+), 24 deletions(-)
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

I would prevent to mention SVE2 here unless both versions of SVE are suppor=
ted with this config.
Is it the case ?

Cheers
Bertrand

> +
> +  Please be aware that currently, enabling this feature will add latency=
 on
> +  VM context switch between SVE enabled guests, between not-enabled SVE
> +  guests and SVE enabled guests and viceversa, compared to the time
> +  required to switch between not-enabled SVE guests.
>=20
> config ARM64_MTE
> def_bool n
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 6d507da0d44d..24e08fd42596 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -12,6 +12,7 @@ obj-y +=3D insn.o
> obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
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
> index 000000000000..6f3fb368c59b
> --- /dev/null
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
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
> +/* Takes a vector length in bits and returns the ZCR_ELx encoding */
> +register_t vl_to_zcr(unsigned int vl)
> +{
> +    ASSERT(vl > 0);
> +    return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
> +}
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
>     guest_cpuinfo.pfr64.sve =3D 0;
>     guest_cpuinfo.zfr64.bits[0] =3D 0;
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 99577adb6c69..adb6ace2e24d 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -181,9 +181,6 @@ static void ctxt_switch_to(struct vcpu *n)
>     /* VGIC */
>     gic_restore_state(n);
>=20
> -    /* VFP */
> -    vfp_restore_state(n);
> -
>     /* XXX MPU */
>=20
>     /* Fault Status */
> @@ -234,6 +231,7 @@ static void ctxt_switch_to(struct vcpu *n)
>     p2m_restore_state(n);
>=20
>     /* Control Registers */
> +    WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);
>     WRITE_SYSREG(n->arch.cpacr, CPACR_EL1);
>=20
>     /*
> @@ -258,6 +256,9 @@ static void ctxt_switch_to(struct vcpu *n)
> #endif
>     isb();
>=20
> +    /* VFP */
> +    vfp_restore_state(n);
> +
>     /* CP 15 */
>     WRITE_SYSREG(n->arch.csselr, CSSELR_EL1);
>=20
> @@ -548,6 +549,8 @@ int arch_vcpu_create(struct vcpu *v)
>=20
>     v->arch.vmpidr =3D MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
>=20
> +    v->arch.cptr_el2 =3D get_default_cptr_flags();
> +
>     v->arch.hcr_el2 =3D get_default_hcr_flags();
>=20
>     v->arch.mdcr_el2 =3D HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
> diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/=
asm/arm64/sve.h
> new file mode 100644
> index 000000000000..144d2b1cc485
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Arm SVE feature code
> + *
> + * Copyright (C) 2022 ARM Ltd.
> + */
> +
> +#ifndef _ARM_ARM64_SVE_H
> +#define _ARM_ARM64_SVE_H
> +
> +#define SVE_VL_MAX_BITS (2048U)
> +
> +/* Vector length must be multiple of 128 */
> +#define SVE_VL_MULTIPLE_VAL (128U)
> +
> +#ifdef CONFIG_ARM64_SVE
> +
> +register_t compute_max_zcr(void);
> +register_t vl_to_zcr(unsigned int vl);
> +
> +#else /* !CONFIG_ARM64_SVE */
> +
> +static inline register_t compute_max_zcr(void)
> +{
> +    return 0;
> +}
> +
> +static inline register_t vl_to_zcr(unsigned int vl)
> +{
> +    return 0;
> +}
> +
> +#endif /* CONFIG_ARM64_SVE */
> +
> +#endif /* _ARM_ARM64_SVE_H */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/incl=
ude/asm/arm64/sysregs.h
> index 463899951414..4cabb9eb4d5e 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -24,6 +24,7 @@
> #define ICH_EISR_EL2              S3_4_C12_C11_3
> #define ICH_ELSR_EL2              S3_4_C12_C11_5
> #define ICH_VMCR_EL2              S3_4_C12_C11_7
> +#define ZCR_EL2                   S3_4_C1_C2_0
>=20
> #define __LR0_EL2(x)              S3_4_C12_C12_ ## x
> #define __LR8_EL2(x)              S3_4_C12_C13_ ## x
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include=
/asm/cpufeature.h
> index c62cf6293fd6..6d703e051906 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -32,6 +32,12 @@
> #define cpu_has_thumbee   (boot_cpu_feature32(thumbee) =3D=3D 1)
> #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
>=20
> +#ifdef CONFIG_ARM64_SVE
> +#define cpu_has_sve       (boot_cpu_feature64(sve) =3D=3D 1)
> +#else
> +#define cpu_has_sve       (0)
> +#endif
> +
> #ifdef CONFIG_ARM_32
> #define cpu_has_gicv3     (boot_cpu_feature32(gic) >=3D 1)
> #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) =3D=3D 1)
> @@ -323,6 +329,14 @@ struct cpuinfo_arm {
>         };
>     } isa64;
>=20
> +    union {
> +        register_t bits[1];
> +        struct {
> +            unsigned long len:4;
> +            unsigned long __res0:60;
> +        };
> +    } zcr64;
> +
>     struct {
>         register_t bits[1];
>     } zfr64;
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index 2a51f0ca688e..e776ee704b7d 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -190,6 +190,7 @@ struct arch_vcpu
>     register_t tpidrro_el0;
>=20
>     /* HYP configuration */
> +    register_t cptr_el2;
>     register_t hcr_el2;
>     register_t mdcr_el2;
>=20
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/=
asm/processor.h
> index 54f253087718..bc683334125c 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -582,6 +582,8 @@ void do_trap_guest_serror(struct cpu_user_regs *regs)=
;
>=20
> register_t get_default_hcr_flags(void);
>=20
> +register_t get_default_cptr_flags(void);
> +
> /*
>  * Synchronize SError unless the feature is selected.
>  * This is relying on the SErrors are currently unmasked.
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90e3..5459cc4f5e62 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -135,10 +135,11 @@ static void __init processor_id(void)
>            cpu_has_el2_32 ? "64+32" : cpu_has_el2_64 ? "64" : "No",
>            cpu_has_el1_32 ? "64+32" : cpu_has_el1_64 ? "64" : "No",
>            cpu_has_el0_32 ? "64+32" : cpu_has_el0_64 ? "64" : "No");
> -    printk("    Extensions:%s%s%s\n",
> +    printk("    Extensions:%s%s%s%s\n",
>            cpu_has_fp ? " FloatingPoint" : "",
>            cpu_has_simd ? " AdvancedSIMD" : "",
> -           cpu_has_gicv3 ? " GICv3-SysReg" : "");
> +           cpu_has_gicv3 ? " GICv3-SysReg" : "",
> +           cpu_has_sve ? " SVE" : "");
>=20
>     /* Warn user if we find unknown floating-point features */
>     if ( cpu_has_fp && (boot_cpu_feature64(fp) >=3D 2) )
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 061c92acbd68..a78a99ddadd0 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -93,6 +93,21 @@ register_t get_default_hcr_flags(void)
>              HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
> }
>=20
> +register_t get_default_cptr_flags(void)
> +{
> +    /*
> +     * Trap all coprocessor registers (0-13) except cp10 and
> +     * cp11 for VFP.
> +     *
> +     * /!\ All coprocessors except cp10 and cp11 cannot be used in Xen.
> +     *
> +     * On ARM64 the TCPx bits which we set here (0..9,12,13) are all
> +     * RES1, i.e. they would trap whether we did this write or not.
> +     */
> +    return  ((HCPTR_CP_MASK & ~(HCPTR_CP(10) | HCPTR_CP(11))) |
> +             HCPTR_TTA | HCPTR_TAM);
> +}
> +
> static enum {
>     SERRORS_DIVERSE,
>     SERRORS_PANIC,
> @@ -122,6 +137,7 @@ __initcall(update_serrors_cpu_caps);
>=20
> void init_traps(void)
> {
> +    register_t cptr_bits =3D get_default_cptr_flags();
>     /*
>      * Setup Hyp vector base. Note they might get updated with the
>      * branch predictor hardening.
> @@ -135,17 +151,7 @@ void init_traps(void)
>     /* Trap CP15 c15 used for implementation defined registers */
>     WRITE_SYSREG(HSTR_T(15), HSTR_EL2);
>=20
> -    /* Trap all coprocessor registers (0-13) except cp10 and
> -     * cp11 for VFP.
> -     *
> -     * /!\ All coprocessors except cp10 and cp11 cannot be used in Xen.
> -     *
> -     * On ARM64 the TCPx bits which we set here (0..9,12,13) are all
> -     * RES1, i.e. they would trap whether we did this write or not.
> -     */
> -    WRITE_SYSREG((HCPTR_CP_MASK & ~(HCPTR_CP(10) | HCPTR_CP(11))) |
> -                 HCPTR_TTA | HCPTR_TAM,
> -                 CPTR_EL2);
> +    WRITE_SYSREG(cptr_bits, CPTR_EL2);
>=20
>     /*
>      * Configure HCR_EL2 with the bare minimum to run Xen until a guest
> --=20
> 2.34.1
>=20


