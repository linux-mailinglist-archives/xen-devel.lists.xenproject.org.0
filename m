Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303746E639C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522812.812416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokdu-0000Pb-9w; Tue, 18 Apr 2023 12:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522812.812416; Tue, 18 Apr 2023 12:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokdu-0000MD-6Q; Tue, 18 Apr 2023 12:41:06 +0000
Received: by outflank-mailman (input) for mailman id 522812;
 Tue, 18 Apr 2023 12:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pokdt-0000M7-09
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:41:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47a9a16f-dde6-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 14:41:03 +0200 (CEST)
Received: from DUZPR01CA0228.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::23) by PA4PR08MB6237.eurprd08.prod.outlook.com
 (2603:10a6:102:f3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:40:56 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::96) by DUZPR01CA0228.outlook.office365.com
 (2603:10a6:10:4b4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 12:40:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 12:40:56 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Tue, 18 Apr 2023 12:40:56 +0000
Received: from a6842cc5434d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9BE524D5-DDFF-4263-8789-15D8B149079E.1; 
 Tue, 18 Apr 2023 12:40:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6842cc5434d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 12:40:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7675.eurprd08.prod.outlook.com (2603:10a6:10:37e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:40:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 12:40:42 +0000
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
X-Inumbo-ID: 47a9a16f-dde6-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuBqlIVqw3weVo48w1CdKjXEop0iDtlBi0UM7Hgax94=;
 b=w4QLKCmF8gA6bw1NGrAmU90fr2U/yiaqIyHtVNeTdlNqJU2P3dFfQxtl2jR9w4rYdou1rRttMYlt25xU+TQmUXmp4XXWAX0ZNySDB4upRcN3wKRrwZGc4LB0axxaRM/SLxibygbwODUUAUCDD62QGjX6W2XCA/Ly0+ibdBy3ck0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce5cbdeb159a52f7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PquUTDtQtnrt5IM2HageNjSgPxCXcL3+uM4R30lxUyBZCyJbnq8qEdtFuFcyBwsYv6cNoQE1whKvjSOlvFZtS6gxf18lv0a3YTIDKHurxNj/enmxBM5yXHNgb5+q2TRJ3/AT6zrxtQtpYlOulPxJxh8xRgPfArtRLRA08njnBvDuYtCMg4UZioOIxpgawQFZ/OGWXzXX9EuyZ0rh6ZIMsXrDuXVWAtgITjjGnDXVVsNX9GZ0s6t86RUfESMP24+6M4nkNeCtxZUFDayr12GViFkN2tm+P8Jm/5NhHpgZ5LCTH8T7AkXgBFjrTBhoCLpiFx87pnQq2cMM+SI5/AXndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuBqlIVqw3weVo48w1CdKjXEop0iDtlBi0UM7Hgax94=;
 b=E7mkRzEKQc+U7yT1suU8+Tpqe06l0eTNrWTALxjeMhcg+SD2WF1411+51e959qHi+2I7WfhVeg3wmmmpHGlzR6+96W7qEUmv1l+Z2T29Igqgh1jWQQVt17oi6ENtlsvmsj64vltbFgMSuemLAVM9OYz4gl7alApzu17IsRlVnMdd90V7Z6dBdKK4Ses/UpT+QvzLwNLzSuxhkQjkraLa+U5Ik0sQmK0Ar5hJPhT6OwiGIMJQOGu7P3fljYGUYoR7o5UNt4+dWPmJBxFh/LBRuu/ZLCBoFTkInUnqprDxKDwqlVTfyFKI6pBiBFlx0ZxLVmwtBoFup5MRG5ZNjkF1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuBqlIVqw3weVo48w1CdKjXEop0iDtlBi0UM7Hgax94=;
 b=w4QLKCmF8gA6bw1NGrAmU90fr2U/yiaqIyHtVNeTdlNqJU2P3dFfQxtl2jR9w4rYdou1rRttMYlt25xU+TQmUXmp4XXWAX0ZNySDB4upRcN3wKRrwZGc4LB0axxaRM/SLxibygbwODUUAUCDD62QGjX6W2XCA/Ly0+ibdBy3ck0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZbSQq1oowf9vRd0a2ZPNGYXQmqK8xC64A
Date: Tue, 18 Apr 2023 12:40:41 +0000
Message-ID: <109F3491-6845-4A5F-9F77-F24D8970B1BE@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-6-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB7675:EE_|DBAEUR03FT053:EE_|PA4PR08MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d737754-dc53-427b-4421-08db400a27bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Gb8u6m7/XlYSQgFRMH2qrdSFSZBTS0bqjG9Kf4amhqfF9bM1kT0YX+UOlPbzl73PbWKWyLweyacuWfRBMkBJqzuqThD1RiG4xXjn4C82pj3GE06agEr8oi17WhW/1ZYq54/APLs+jXw5pdcEmZMlPoxLH01Vxp+aZSruoCeV5mSJPvQKs2nCXQI++459hgMBs0yyedHvjGnwESbZ//AuOEyk8C31TKme4SPierDHSEUhE2d+4YGaJINajpBE9VWxwAeSDfSMdSlQTWS8lkSunIlztxYZiZecEMTxt6+YTV1rL9uig5iG5htx17g68Cn//iv5Dm6eC/Aj7MM2HYjzsKPYoIvlifFNjYyJKENeLlcblFhpNAagAfftgtZxfRKYSaBba3eI9QWEf3HfyXitb/+EWpEU80ql7uz51gjhMRuflkunhyH765gfdCZmK6oHPK8N2Yh1H0rkqe36fYVTDtc3crFObUhSBBHEuTGjtaamvVtjYCj+SG5SEQEXciOh6/xab8eKO+YYug2m8sNFzdJOsskrjk0/jWEVFiosdIyHTA8EhWhRiqEICZRtjyewlmo/aFllriT3FqHQheo8IPExuVXTrjO4nOUST43R2n6HR97jgc6YEv1esN43Mt+ccOy70CISuajIvbEyME5sow==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(6862004)(5660300002)(4326008)(76116006)(30864003)(2906002)(66946007)(41300700001)(91956017)(8936002)(8676002)(6636002)(316002)(478600001)(6486002)(71200400001)(53546011)(6506007)(6512007)(186003)(64756008)(66446008)(66476007)(66556008)(37006003)(2616005)(83380400001)(122000001)(54906003)(38100700002)(38070700005)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5B339A795A41A64295EC7B9DFA4FF1A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7675
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7740d9b-76aa-4c57-1cf1-08db400a1f2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3UpkKZsUMlVvH59/Z8rR+A1SK/wof7OOZCwDxl2+jrS8/We2Tai5fXd5ZS0TrlgE3xBqgAxxFu0VrPTtU6I/kTzxVXdhf+hWoMYM51vpDaO5GjLwJXUkpPZuvNAdCdPOVyM6Fur/swqWFw1eMFSgtj7c/d9WotUC8ImDdx4soXhITeTHKPpL4E4pOj8Kgc3/7pDOQNx4q+46jZpzK8raD7ribJFNlwHD+UGNNcL5gIvxGW8WdGYzosLTJg3sCV4x6LZrC90upU7oCJrIXSOKsnO+YHITd0k/KzlGXAr4M1WiDNSbyp6BmJzY1S8fzasqq8Q87xRqG9Jyyd7AIttzP4WOUrH3HRSS+hP5uKTuZ5TENF6KQ4Lzk4qoZ3pjTRZ+9ikI0+TN/pKx0iz2QEzYVcLvb/WlJTO99urwMGSwk5KR9PNjrd3eKTkNtgMAhW9cUlNd9fqKzW1D2LqpmNLV7a5qem8uBLj3Kp9uaPBGiZyLtYI56oOop1PBlDt+OVwe798BXyo6SDkygRGmrZS/P8n2imXDDFhd8o8XP+bDwqCyzmEHodfPxQqljCKDLMhaw5FL6WFQF2OvvBx4FjBvAfQg91WR79u+seou84mtJaSE2tKEGAglbofLWGa0x/V17hg8NUkbgtCMHNcpwqcj+XuCrIFjkS4ymG8SsxLITSyrgayxw+hCOWxJpgBMMHAyCCqFYEb5qL/9WQcxdET0gA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(36756003)(8936002)(6862004)(8676002)(40460700003)(5660300002)(2906002)(30864003)(82310400005)(33656002)(86362001)(40480700001)(478600001)(6486002)(54906003)(6636002)(37006003)(186003)(107886003)(2616005)(36860700001)(6512007)(53546011)(6506007)(70586007)(70206006)(26005)(41300700001)(356005)(82740400003)(316002)(83380400001)(81166007)(4326008)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 12:40:56.3597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d737754-dc53-427b-4421-08db400a27bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6237

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Save/restore context switch for SVE, allocate memory to contain
> the Z0-31 registers whose length is maximum 2048 bits each and
> FFR who can be maximum 256 bits, the allocated memory depends on
> how many bits is the vector length for the domain and how many bits
> are supported by the platform.
>=20
> Save P0-15 whose length is maximum 256 bits each, in this case the
> memory used is from the fpregs field in struct vfp_state,
> because V0-31 are part of Z0-31 and this space would have been
> unused for SVE domain otherwise.
>=20
> Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
> creation given the requested vector length and restore it on
> context switch, save/restore ZCR_EL1 value as well.
>=20
> Remove headers from sve.c that are already included using
> xen/sched.h.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v4:
> - No changes
> Changes from v3:
> - don't use fixed len types when not needed (Jan)
> - now VL is an encoded value, decode it before using.
> Changes from v2:
> - No changes
> Changes from v1:
> - No changes
> Changes from RFC:
> - Moved zcr_el2 field introduction in this patch, restore its
>   content inside sve_restore_state function. (Julien)
> ---
> xen/arch/arm/arm64/sve-asm.S             | 141 +++++++++++++++++++++++
> xen/arch/arm/arm64/sve.c                 |  68 ++++++++++-
> xen/arch/arm/arm64/vfp.c                 |  79 +++++++------
> xen/arch/arm/domain.c                    |   7 ++
> xen/arch/arm/include/asm/arm64/sve.h     |  13 +++
> xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
> xen/arch/arm/include/asm/arm64/vfp.h     |  10 ++
> xen/arch/arm/include/asm/domain.h        |   2 +
> 8 files changed, 284 insertions(+), 39 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
> index 4d1549344733..8c37d7bc95d5 100644
> --- a/xen/arch/arm/arm64/sve-asm.S
> +++ b/xen/arch/arm/arm64/sve-asm.S
> @@ -17,6 +17,18 @@
>     .endif
> .endm
>=20
> +.macro _sve_check_zreg znr
> +    .if (\znr) < 0 || (\znr) > 31
> +        .error "Bad Scalable Vector Extension vector register number \zn=
r."
> +    .endif
> +.endm
> +
> +.macro _sve_check_preg pnr
> +    .if (\pnr) < 0 || (\pnr) > 15
> +        .error "Bad Scalable Vector Extension predicate register number =
\pnr."
> +    .endif
> +.endm
> +
> .macro _check_num n, min, max
>     .if (\n) < (\min) || (\n) > (\max)
>         .error "Number \n out of range [\min,\max]"
> @@ -26,6 +38,54 @@
> /* SVE instruction encodings for non-SVE-capable assemblers */
> /* (pre binutils 2.28, all kernel capable clang versions support SVE) */
>=20
> +/* STR (vector): STR Z\nz, [X\nxbase, #\offset, MUL VL] */
> +.macro _sve_str_v nz, nxbase, offset=3D0
> +    _sve_check_zreg \nz
> +    _check_general_reg \nxbase
> +    _check_num (\offset), -0x100, 0xff
> +    .inst 0xe5804000                \
> +        | (\nz)                     \
> +        | ((\nxbase) << 5)          \
> +        | (((\offset) & 7) << 10)   \
> +        | (((\offset) & 0x1f8) << 13)
> +.endm
> +
> +/* LDR (vector): LDR Z\nz, [X\nxbase, #\offset, MUL VL] */
> +.macro _sve_ldr_v nz, nxbase, offset=3D0
> +    _sve_check_zreg \nz
> +    _check_general_reg \nxbase
> +    _check_num (\offset), -0x100, 0xff
> +    .inst 0x85804000                \
> +        | (\nz)                     \
> +        | ((\nxbase) << 5)          \
> +        | (((\offset) & 7) << 10)   \
> +        | (((\offset) & 0x1f8) << 13)
> +.endm
> +
> +/* STR (predicate): STR P\np, [X\nxbase, #\offset, MUL VL] */
> +.macro _sve_str_p np, nxbase, offset=3D0
> +    _sve_check_preg \np
> +    _check_general_reg \nxbase
> +    _check_num (\offset), -0x100, 0xff
> +    .inst 0xe5800000                \
> +        | (\np)                     \
> +        | ((\nxbase) << 5)          \
> +        | (((\offset) & 7) << 10)   \
> +        | (((\offset) & 0x1f8) << 13)
> +.endm
> +
> +/* LDR (predicate): LDR P\np, [X\nxbase, #\offset, MUL VL] */
> +.macro _sve_ldr_p np, nxbase, offset=3D0
> +    _sve_check_preg \np
> +    _check_general_reg \nxbase
> +    _check_num (\offset), -0x100, 0xff
> +    .inst 0x85800000                \
> +        | (\np)                     \
> +        | ((\nxbase) << 5)          \
> +        | (((\offset) & 7) << 10)   \
> +        | (((\offset) & 0x1f8) << 13)
> +.endm
> +
> /* RDVL X\nx, #\imm */
> .macro _sve_rdvl nx, imm
>     _check_general_reg \nx
> @@ -35,11 +95,92 @@
>         | (((\imm) & 0x3f) << 5)
> .endm
>=20
> +/* RDFFR (unpredicated): RDFFR P\np.B */
> +.macro _sve_rdffr np
> +    _sve_check_preg \np
> +    .inst 0x2519f000                \
> +        | (\np)
> +.endm
> +
> +/* WRFFR P\np.B */
> +.macro _sve_wrffr np
> +    _sve_check_preg \np
> +    .inst 0x25289000                \
> +        | ((\np) << 5)
> +.endm
> +
> +.macro __for from:req, to:req
> +    .if (\from) =3D=3D (\to)
> +        _for__body %\from
> +    .else
> +        __for %\from, %((\from) + ((\to) - (\from)) / 2)
> +        __for %((\from) + ((\to) - (\from)) / 2 + 1), %\to
> +    .endif
> +.endm
> +
> +.macro _for var:req, from:req, to:req, insn:vararg
> +    .macro _for__body \var:req
> +        .noaltmacro
> +        \insn
> +        .altmacro
> +    .endm
> +
> +    .altmacro
> +    __for \from, \to
> +    .noaltmacro
> +
> +    .purgem _for__body
> +.endm
> +
> +.macro sve_save nxzffrctx, nxpctx, save_ffr
> +    _for n, 0, 31, _sve_str_v \n, \nxzffrctx, \n - 32
> +    _for n, 0, 15, _sve_str_p \n, \nxpctx, \n
> +        cbz \save_ffr, 1f
> +        _sve_rdffr 0
> +        _sve_str_p 0, \nxzffrctx
> +        _sve_ldr_p 0, \nxpctx
> +        b 2f
> +1:
> +        str xzr, [x\nxzffrctx]      // Zero out FFR
> +2:
> +.endm
> +
> +.macro sve_load nxzffrctx, nxpctx, restore_ffr
> +    _for n, 0, 31, _sve_ldr_v \n, \nxzffrctx, \n - 32
> +        cbz \restore_ffr, 1f
> +        _sve_ldr_p 0, \nxzffrctx
> +        _sve_wrffr 0
> +1:
> +    _for n, 0, 15, _sve_ldr_p \n, \nxpctx, \n
> +.endm
> +
> /* Gets the current vector register size in bytes */
> GLOBAL(sve_get_hw_vl)
>     _sve_rdvl 0, 1
>     ret
>=20
> +/*
> + * Save the SVE context
> + *
> + * x0 - pointer to buffer for Z0-31 + FFR
> + * x1 - pointer to buffer for P0-15
> + * x2 - Save FFR if non-zero
> + */
> +GLOBAL(sve_save_ctx)
> +    sve_save 0, 1, x2
> +    ret
> +
> +/*
> + * Load the SVE context
> + *
> + * x0 - pointer to buffer for Z0-31 + FFR
> + * x1 - pointer to buffer for P0-15
> + * x2 - Restore FFR if non-zero
> + */
> +GLOBAL(sve_load_ctx)
> +    sve_load 0, 1, x2
> +    ret
> +
> /*
>  * Local variables:
>  * mode: ASM
> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
> index 78f7482619da..5485648850a0 100644
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -5,14 +5,29 @@
>  * Copyright (C) 2022 ARM Ltd.
>  */
>=20
> -#include <xen/types.h>
> -#include <asm/cpufeature.h>
> +#include <xen/sched.h>
> +#include <xen/sizes.h>
> #include <asm/arm64/sve.h>
> -#include <asm/arm64/sysregs.h>
> -#include <asm/processor.h>
> -#include <asm/system.h>
>=20
> extern unsigned int sve_get_hw_vl(void);
> +extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ff=
r);
> +extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
> +                         int restore_ffr);
> +
> +static inline unsigned int sve_zreg_ctx_size(unsigned int vl)
> +{
> +    /*
> +     * Z0-31 registers size in bytes is computed from VL that is in bits=
, so VL
> +     * in bytes is VL/8.
> +     */
> +    return (vl / 8U) * 32U;
> +}
> +
> +static inline unsigned int sve_ffrreg_ctx_size(unsigned int vl)
> +{
> +    /* FFR register size is VL/8, which is in bytes (VL/8)/8 */
> +    return (vl / 64U);
> +}
>=20
> register_t compute_max_zcr(void)
> {
> @@ -60,3 +75,46 @@ unsigned int get_sys_vl_len(void)
>     return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
>             SVE_VL_MULTIPLE_VAL;
> }
> +
> +int sve_context_init(struct vcpu *v)
> +{
> +    unsigned int sve_vl_bits =3D sve_decode_vl(v->domain->arch.sve_vl);
> +    uint64_t *ctx =3D _xzalloc(sve_zreg_ctx_size(sve_vl_bits) +
> +                             sve_ffrreg_ctx_size(sve_vl_bits),
> +                             L1_CACHE_BYTES);
> +
> +    if ( !ctx )
> +        return -ENOMEM;
> +
> +    v->arch.vfp.sve_context =3D ctx;
> +
> +    return 0;
> +}
> +
> +void sve_context_free(struct vcpu *v)
> +{
> +    xfree(v->arch.vfp.sve_context);
> +}
> +
> +void sve_save_state(struct vcpu *v)
> +{
> +    unsigned int sve_vl_bits =3D sve_decode_vl(v->domain->arch.sve_vl);
> +    uint64_t *sve_ctx_zreg_end =3D v->arch.vfp.sve_context +
> +            (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));

You do quite some computation here for something which does not change
during the life of the VM.
Could we save the context_end in the vcpu instead and just do this=20
computation on init and free only ?

> +
> +    v->arch.zcr_el1 =3D READ_SYSREG(ZCR_EL1);
> +
> +    sve_save_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
> +}
> +
> +void sve_restore_state(struct vcpu *v)
> +{
> +    unsigned int sve_vl_bits =3D sve_decode_vl(v->domain->arch.sve_vl);
> +    uint64_t *sve_ctx_zreg_end =3D v->arch.vfp.sve_context +
> +            (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));

Same as before.

> +
> +    WRITE_SYSREG(v->arch.zcr_el1, ZCR_EL1);
> +    WRITE_SYSREG(v->arch.zcr_el2, ZCR_EL2);
> +
> +    sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
> +}
> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
> index 47885e76baae..2d0d7c2e6ddb 100644
> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -2,29 +2,35 @@
> #include <asm/processor.h>
> #include <asm/cpufeature.h>
> #include <asm/vfp.h>
> +#include <asm/arm64/sve.h>
>=20
> void vfp_save_state(struct vcpu *v)
> {
>     if ( !cpu_has_fp )
>         return;
>=20
> -    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> -                 "stp q2, q3, [%1, #16 * 2]\n\t"
> -                 "stp q4, q5, [%1, #16 * 4]\n\t"
> -                 "stp q6, q7, [%1, #16 * 6]\n\t"
> -                 "stp q8, q9, [%1, #16 * 8]\n\t"
> -                 "stp q10, q11, [%1, #16 * 10]\n\t"
> -                 "stp q12, q13, [%1, #16 * 12]\n\t"
> -                 "stp q14, q15, [%1, #16 * 14]\n\t"
> -                 "stp q16, q17, [%1, #16 * 16]\n\t"
> -                 "stp q18, q19, [%1, #16 * 18]\n\t"
> -                 "stp q20, q21, [%1, #16 * 20]\n\t"
> -                 "stp q22, q23, [%1, #16 * 22]\n\t"
> -                 "stp q24, q25, [%1, #16 * 24]\n\t"
> -                 "stp q26, q27, [%1, #16 * 26]\n\t"
> -                 "stp q28, q29, [%1, #16 * 28]\n\t"
> -                 "stp q30, q31, [%1, #16 * 30]\n\t"
> -                 : "=3DQ" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpreg=
s));
> +    if ( is_sve_domain(v->domain) )
> +        sve_save_state(v);
> +    else
> +    {
> +        asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> +                     "stp q2, q3, [%1, #16 * 2]\n\t"
> +                     "stp q4, q5, [%1, #16 * 4]\n\t"
> +                     "stp q6, q7, [%1, #16 * 6]\n\t"
> +                     "stp q8, q9, [%1, #16 * 8]\n\t"
> +                     "stp q10, q11, [%1, #16 * 10]\n\t"
> +                     "stp q12, q13, [%1, #16 * 12]\n\t"
> +                     "stp q14, q15, [%1, #16 * 14]\n\t"
> +                     "stp q16, q17, [%1, #16 * 16]\n\t"
> +                     "stp q18, q19, [%1, #16 * 18]\n\t"
> +                     "stp q20, q21, [%1, #16 * 20]\n\t"
> +                     "stp q22, q23, [%1, #16 * 22]\n\t"
> +                     "stp q24, q25, [%1, #16 * 24]\n\t"
> +                     "stp q26, q27, [%1, #16 * 26]\n\t"
> +                     "stp q28, q29, [%1, #16 * 28]\n\t"
> +                     "stp q30, q31, [%1, #16 * 30]\n\t"
> +                     : "=3DQ" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.f=
pregs));
> +    }
>=20
>     v->arch.vfp.fpsr =3D READ_SYSREG(FPSR);
>     v->arch.vfp.fpcr =3D READ_SYSREG(FPCR);
> @@ -37,23 +43,28 @@ void vfp_restore_state(struct vcpu *v)
>     if ( !cpu_has_fp )
>         return;
>=20
> -    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> -                 "ldp q2, q3, [%1, #16 * 2]\n\t"
> -                 "ldp q4, q5, [%1, #16 * 4]\n\t"
> -                 "ldp q6, q7, [%1, #16 * 6]\n\t"
> -                 "ldp q8, q9, [%1, #16 * 8]\n\t"
> -                 "ldp q10, q11, [%1, #16 * 10]\n\t"
> -                 "ldp q12, q13, [%1, #16 * 12]\n\t"
> -                 "ldp q14, q15, [%1, #16 * 14]\n\t"
> -                 "ldp q16, q17, [%1, #16 * 16]\n\t"
> -                 "ldp q18, q19, [%1, #16 * 18]\n\t"
> -                 "ldp q20, q21, [%1, #16 * 20]\n\t"
> -                 "ldp q22, q23, [%1, #16 * 22]\n\t"
> -                 "ldp q24, q25, [%1, #16 * 24]\n\t"
> -                 "ldp q26, q27, [%1, #16 * 26]\n\t"
> -                 "ldp q28, q29, [%1, #16 * 28]\n\t"
> -                 "ldp q30, q31, [%1, #16 * 30]\n\t"
> -                 : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs)=
);
> +    if ( is_sve_domain(v->domain) )
> +        sve_restore_state(v);
> +    else
> +    {
> +        asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> +                     "ldp q2, q3, [%1, #16 * 2]\n\t"
> +                     "ldp q4, q5, [%1, #16 * 4]\n\t"
> +                     "ldp q6, q7, [%1, #16 * 6]\n\t"
> +                     "ldp q8, q9, [%1, #16 * 8]\n\t"
> +                     "ldp q10, q11, [%1, #16 * 10]\n\t"
> +                     "ldp q12, q13, [%1, #16 * 12]\n\t"
> +                     "ldp q14, q15, [%1, #16 * 14]\n\t"
> +                     "ldp q16, q17, [%1, #16 * 16]\n\t"
> +                     "ldp q18, q19, [%1, #16 * 18]\n\t"
> +                     "ldp q20, q21, [%1, #16 * 20]\n\t"
> +                     "ldp q22, q23, [%1, #16 * 22]\n\t"
> +                     "ldp q24, q25, [%1, #16 * 24]\n\t"
> +                     "ldp q26, q27, [%1, #16 * 26]\n\t"
> +                     "ldp q28, q29, [%1, #16 * 28]\n\t"
> +                     "ldp q30, q31, [%1, #16 * 30]\n\t"
> +                     : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpr=
egs));
> +    }
>=20
>     WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
>     WRITE_SYSREG(v->arch.vfp.fpcr, FPCR);
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 769fae8fe25e..060fc30bbb5d 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -552,7 +552,12 @@ int arch_vcpu_create(struct vcpu *v)
>=20
>     v->arch.cptr_el2 =3D get_default_cptr_flags();
>     if ( is_sve_domain(v->domain) )
> +    {
> +        if ( (rc =3D sve_context_init(v)) !=3D 0 )
> +            goto fail;
>         v->arch.cptr_el2 &=3D ~HCPTR_CP(8);
> +        v->arch.zcr_el2 =3D vl_to_zcr(sve_decode_vl(v->domain->arch.sve_=
vl));
> +    }
>=20
>     v->arch.hcr_el2 =3D get_default_hcr_flags();
>=20
> @@ -582,6 +587,8 @@ fail:
>=20
> void arch_vcpu_destroy(struct vcpu *v)
> {
> +    if ( is_sve_domain(v->domain) )
> +        sve_context_free(v);
>     vcpu_timer_destroy(v);
>     vcpu_vgic_free(v);
>     free_xenheap_pages(v->arch.stack, STACK_ORDER);
> diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/=
asm/arm64/sve.h
> index a4c53e3e8e2e..fc162c9d2cf7 100644
> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -24,6 +24,10 @@ static inline unsigned int sve_decode_vl(unsigned int =
sve_vl)
> register_t compute_max_zcr(void);
> register_t vl_to_zcr(unsigned int vl);
> unsigned int get_sys_vl_len(void);
> +int sve_context_init(struct vcpu *v);
> +void sve_context_free(struct vcpu *v);
> +void sve_save_state(struct vcpu *v);
> +void sve_restore_state(struct vcpu *v);
>=20
> #else /* !CONFIG_ARM64_SVE */
>=20
> @@ -42,6 +46,15 @@ static inline unsigned int get_sys_vl_len(void)
>     return 0;
> }
>=20
> +static inline int sve_context_init(struct vcpu *v)
> +{
> +    return 0;
> +}
> +
> +static inline void sve_context_free(struct vcpu *v) {}
> +static inline void sve_save_state(struct vcpu *v) {}
> +static inline void sve_restore_state(struct vcpu *v) {}
> +
> #endif /* CONFIG_ARM64_SVE */
>=20
> #endif /* _ARM_ARM64_SVE_H */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/incl=
ude/asm/arm64/sysregs.h
> index 4cabb9eb4d5e..3fdeb9d8cdef 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -88,6 +88,9 @@
> #ifndef ID_AA64ISAR2_EL1
> #define ID_AA64ISAR2_EL1            S3_0_C0_C6_2
> #endif
> +#ifndef ZCR_EL1
> +#define ZCR_EL1                     S3_0_C1_C2_0
> +#endif
>=20

What about ZCR_EL2 ?

> /* ID registers (imported from arm64/include/asm/sysreg.h in Linux) */
>=20
> diff --git a/xen/arch/arm/include/asm/arm64/vfp.h b/xen/arch/arm/include/=
asm/arm64/vfp.h
> index e6e8c363bc16..8af714cb8ecc 100644
> --- a/xen/arch/arm/include/asm/arm64/vfp.h
> +++ b/xen/arch/arm/include/asm/arm64/vfp.h
> @@ -6,7 +6,17 @@
>=20
> struct vfp_state
> {
> +    /*
> +     * When SVE is enabled for the guest, fpregs memory will be used to
> +     * save/restore P0-P15 registers, otherwise it will be used for the =
V0-V31
> +     * registers.
> +     */
>     uint64_t fpregs[64] __vfp_aligned;
> +    /*
> +     * When SVE is enabled for the guest, sve_context contains memory to
> +     * save/restore Z0-Z31 registers and FFR.
> +     */
> +    uint64_t *sve_context;
>     register_t fpcr;
>     register_t fpexc32_el2;
>     register_t fpsr;
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index 78cc2da3d4e5..6b5ec3bd0680 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -195,6 +195,8 @@ struct arch_vcpu
>     register_t tpidrro_el0;
>=20
>     /* HYP configuration */
> +    register_t zcr_el1;
> +    register_t zcr_el2;
>     register_t cptr_el2;
>     register_t hcr_el2;
>     register_t mdcr_el2;
> --=20
> 2.34.1
>=20

Cheers
Bertrand


