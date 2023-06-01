Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F280719916
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542360.846125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fN8-0002uv-Sz; Thu, 01 Jun 2023 10:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542360.846125; Thu, 01 Jun 2023 10:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fN8-0002sq-Of; Thu, 01 Jun 2023 10:17:34 +0000
Received: by outflank-mailman (input) for mailman id 542360;
 Thu, 01 Jun 2023 10:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtZ5=BV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q4fN7-0002sV-CC
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:17:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8373a880-0065-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 12:17:29 +0200 (CEST)
Received: from AS9PR04CA0049.eurprd04.prod.outlook.com (2603:10a6:20b:46a::34)
 by PAXPR08MB6734.eurprd08.prod.outlook.com (2603:10a6:102:13c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 10:17:26 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::e) by AS9PR04CA0049.outlook.office365.com
 (2603:10a6:20b:46a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 10:17:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 10:17:26 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 01 Jun 2023 10:17:26 +0000
Received: from d8e7fbe355c7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 908E6320-9375-4E14-9173-2472E9284174.1; 
 Thu, 01 Jun 2023 10:17:15 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8e7fbe355c7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jun 2023 10:17:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8485.eurprd08.prod.outlook.com (2603:10a6:150:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 10:17:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 10:17:12 +0000
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
X-Inumbo-ID: 8373a880-0065-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkyDZWZ31nZrITU7d2xuGBLuuwf7xzfRD3gl/Prd20k=;
 b=qukPlmRaCyxFiK+jUhoN/TyBLiRpeAtsX9HoAo+ZIz/SCM87QlCYOJ3Lks+vwiqPBHazlRgFcHoNN9Raq4Dk+nqbIdi+Y20X3hPdXm7hCaf+RLg7qtjgF2RdLURk7HPASxRBexR6719GXS0UumdKLtCpa2yKAeQxCQzJ/VfTO5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53e29a2ac1a8a48f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/mce57q0rHtxI7EH6HzsyckOv+mxhu1zHJlBBA8YcdMEOmatsI565fRLIegBgZiWZlJ/LQMfKTVaFAkpA/6PBMF/O0+iQsjxk93RRlWIuR6oZnw1RIM/D9ZcrgsxYnGKFJw3Ju3FXyAUc6zTNVI7h/s9Qqkv+1GRjnpNnbNlM53Pj0otfI79d5R6tDZEEOGvtruW5msCoF2Qms4NUjuC2TzIZiw9o7R+h0pwJFUUSVkRV9l/AguA6/LOC6sMFY8Vvff+gkTrzr62hCloNphvXka0rCO56yfHgJYZf1Bo5mnqHCQolIMjySpatPdBhsGWQjaRpNQLX+Uz84n8CkoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkyDZWZ31nZrITU7d2xuGBLuuwf7xzfRD3gl/Prd20k=;
 b=c89LGdjcGnPcUYiK1n6kWU9+MKuPSSkBg+7H0Sis5bPqsd/4f7Pmctwn6f0DUY2/OZ4IVJN5ATp3QVBf0MpobPSXRGR5IQ3SQ3Kp5UI8dpp0zr374cWiWwZTl7B5ktc42s9wJ9ryYWDLzff/ChNUjlaT1BvJf/rtHC3c6kXeb/kLRuLjRt2my1OE8hAa3F84n/S3i1iFjJeZ4v9Wa7CYJkIeUxnbwrTRnKbhjLy8QpWZ6jGsh85w4bSAQaInLZ/cYkIpgul28gcETAy4pxGVgFwnEwX4Ny8bnw50ZyJ3/7Ei+XinIBpEkNgwUvkYut+vqn1aqx2DUc2xPNNKdmkNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkyDZWZ31nZrITU7d2xuGBLuuwf7xzfRD3gl/Prd20k=;
 b=qukPlmRaCyxFiK+jUhoN/TyBLiRpeAtsX9HoAo+ZIz/SCM87QlCYOJ3Lks+vwiqPBHazlRgFcHoNN9Raq4Dk+nqbIdi+Y20X3hPdXm7hCaf+RLg7qtjgF2RdLURk7HPASxRBexR6719GXS0UumdKLtCpa2yKAeQxCQzJ/VfTO5k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v8 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZk5D1jJiTqe/exUWY7qvkOxvTtq91vUaA
Date: Thu, 1 Jun 2023 10:17:11 +0000
Message-ID: <A7BE07AF-6EBB-4801-B538-27F0389BC75F@arm.com>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
 <20230531072413.868673-6-luca.fancellu@arm.com>
In-Reply-To: <20230531072413.868673-6-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB8485:EE_|AM7EUR03FT040:EE_|PAXPR08MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: fec158ef-e194-44a7-dc42-08db628965f7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SB69FafGnBxNrUYxAXVCbrwD8wPztyZfr3EWrQoqIUySr70gT40OYPbNboN1jIdhCiVL7/+LntXcp7cULe1oiOeaZlznjJgYyzGgk3VjsHVQu2lg/eHbD0Q6SIBd+J9sbGNheJI2jnfTR3Q4dKtCkDMjXg2x90a8Vy9bT8u4iZOBZsMK2BdRv9Hd95oza89zXumich8eQOeknBIpfNW56Stoa8YgFO13PyoZS7TGAA2oVsF1s9EFQvUGNYIVauAEh/eM/kZzyO0MZ7Hw9jToroSBjo0tLWE2XxK0BO4QHRSY8HcpBPJ7pfyhXJRlcPWnIXOB+xzBE+ducLbI3rYFgvRoVFEWPnAd+3TlIwaOc7PbvBt3IuZg8iEI699nY4Eu7l5TnshMYduwOQEHipUwi1uYLVEpkhdqtAV8SZSFTxb0sD1YdlAycweRiGUICd7Fdgx9yq3l2zzB2SGTjfNLmHK31ef2FBefohnLffOz1TVlypqHvN0tU67uTVUAt1ohN0gf6B9ZNiaEb9j9TunW4+b6C97ZxvPiqhrH1kZoUgiV1fz0jrqqySAQUlyNB0n0imeFS3c56Cg3TjT3OKqrp+P+U+ui9eRpSD7Mf6wqje3HIi7vR9ifx5VBfgDpQvplLNO29ol2WSXxC95JlrdncQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(66556008)(5660300002)(91956017)(66946007)(41300700001)(66476007)(66446008)(64756008)(76116006)(6862004)(8936002)(37006003)(8676002)(54906003)(478600001)(6506007)(186003)(6512007)(6486002)(316002)(4326008)(6636002)(71200400001)(53546011)(26005)(2616005)(30864003)(2906002)(83380400001)(122000001)(38070700005)(86362001)(33656002)(38100700002)(36756003)(45980500001)(579004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3D8A54C6AE24C94382408B81E01B3B7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8485
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a33dd33-dd5d-4c23-b789-08db62895d49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rA55XiTuc5kV5NCtyXYMUy7A64RB9ytReW10ZPgBlUbVWqlZMH5lMSizsce2lW+Tlaiklsv4uVDHcIVxfAu4KRWa3BQx2kbN0yHPxffBH981eADD3PnpUjXeSD5t1rzeT1h8C6syCPgu7y8yYxs5YFN/2giMlAnvq1C4Kr5ZD4uomE05v2oiZpBp6FOe2BKJKUwLqZVsbSXckX2xENwM6R9bjN4glRyV9/rmIzgMrwXlyA4f5vdxzfK54iG7ov00H3cEBo8o3IPGCzQP41PMx1kDuARJOQdDQLYDTD8ybroM/5Ix140XNxRzixK/WO5RXVCcSBsloFtL5K44UtBq6EFb4k6TpnDAd6NFqjsDiOHLroO14NM/lAX/FFHm21j95yGFTlhu8gLwy5NaGUsjD3c4swhjhTPA8ih/qZR/2nRr0kv+3GqvaPwIqD4CJgud18+nw/6SoMluW1xiZGyDYuk1ktGM8y/xiqg7wA/0S8ywQz5AHAD3kWelj3Cwl3qj5ePYfhyRttxMR7mgxGB68HdYgoAiX7jatllMbN/5DDmIJJaeL0mHVy7OUDCtmGkK2qIRNGuYM78AyvbZt+00fwKObUkRAJKqyvO37IwgtYZ+c90ozRAETpR+1Y5uhhPltecD9mVuXw8OgGAXDH5vSjyhAklU2c3ajGoIV2yeG55r2SMAVKPl4D49+2zW4us8pUc+jFaRgke+zk0uE6pIz2hWpOLgWhj39lAHcR5wJmc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(107886003)(6512007)(26005)(6506007)(53546011)(336012)(41300700001)(47076005)(186003)(6486002)(36860700001)(2616005)(478600001)(40460700003)(54906003)(37006003)(81166007)(6636002)(356005)(4326008)(70206006)(70586007)(40480700001)(82740400003)(82310400005)(316002)(5660300002)(6862004)(8676002)(8936002)(2906002)(30864003)(33656002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:17:26.3060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec158ef-e194-44a7-dc42-08db628965f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6734

Hi Luca,

> On 31 May 2023, at 09:24, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
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
> List import macros from Linux in README.LinuxPrimitives.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from v7:
> - Fixed comments for sve_context_init and sve_context_free,
>   protect arch.vfp.sve_zreg_ctx_end, arch.zcr_el1, arch.zcr_el2
>   with ifdefs. (Julien)
> - Given the changes, dropped Bertrand's R-by
> Changes from v6:
> - Add comment for explain why sve_save/sve_load are different from
>   Linux, add macros in xen/arch/arm/README.LinuxPrimitives (Julien)
> - Add comments in sve_context_init and sve_context_free, handle the
>   case where sve_zreg_ctx_end is NULL, move setting of v->arch.zcr_el2
>   in sve_context_init (Julien)
> - remove stubs for sve_context_* and sve_save_* and rely on compiler
>   DCE (Jan)
> - Add comments for sve_save_ctx/sve_load_ctx (Julien)
> Changes from v5:
> - use XFREE instead of xfree, keep the headers (Julien)
> - Avoid math computation for every save/restore, store the computation
>   in struct vfp_state once (Bertrand)
> - protect access to v->domain->arch.sve_vl inside arch_vcpu_create now
>   that sve_vl is available only on arm64
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
> xen/arch/arm/README.LinuxPrimitives      |   4 +-
> xen/arch/arm/arm64/sve-asm.S             | 147 +++++++++++++++++++++++
> xen/arch/arm/arm64/sve.c                 |  91 ++++++++++++++
> xen/arch/arm/arm64/vfp.c                 |  79 ++++++------
> xen/arch/arm/domain.c                    |   6 +
> xen/arch/arm/include/asm/arm64/sve.h     |   4 +
> xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
> xen/arch/arm/include/asm/arm64/vfp.h     |  16 +++
> xen/arch/arm/include/asm/domain.h        |   5 +
> 9 files changed, 320 insertions(+), 35 deletions(-)
>=20
> diff --git a/xen/arch/arm/README.LinuxPrimitives b/xen/arch/arm/README.Li=
nuxPrimitives
> index 76c8df29e416..301c0271bbe4 100644
> --- a/xen/arch/arm/README.LinuxPrimitives
> +++ b/xen/arch/arm/README.LinuxPrimitives
> @@ -69,7 +69,9 @@ SVE assembly macro: last sync @ v6.3.0 (last commit: 45=
7391b03803)
> linux/arch/arm64/include/asm/fpsimdmacros.h   xen/arch/arm/include/asm/ar=
m64/sve-asm.S
>=20
> The following macros were taken from Linux:
> -    _check_general_reg, _check_num, _sve_rdvl
> +    _check_general_reg, _check_num, _sve_rdvl, __for, _for, _sve_check_z=
reg,
> +    _sve_check_preg, _sve_str_v, _sve_ldr_v, _sve_str_p, _sve_ldr_p, _sv=
e_rdffr,
> +    _sve_wrffr
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> arm32
> diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
> index 4d1549344733..59dbefbbb252 100644
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
> @@ -35,11 +95,98 @@
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
> +/*
> + * sve_save and sve_load are different from the Linux version because th=
e
> + * buffers to save the context are different from Xen and for example Li=
nux
> + * is using this macro to save/restore also fpsr and fpcr while we do it=
 in C
> + */
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
> index a9144e48ef6b..56d8f27ea26a 100644
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -5,6 +5,7 @@
>  * Copyright (C) 2022 ARM Ltd.
>  */
>=20
> +#include <xen/sizes.h>
> #include <xen/types.h>
> #include <asm/arm64/sve.h>
> #include <asm/arm64/sysregs.h>
> @@ -14,6 +15,25 @@
>=20
> extern unsigned int sve_get_hw_vl(void);
>=20
> +/*
> + * Save the SVE context
> + *
> + * sve_ctx - pointer to buffer for Z0-31 + FFR
> + * pregs - pointer to buffer for P0-15
> + * save_ffr - Save FFR if non-zero
> + */
> +extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ff=
r);
> +
> +/*
> + * Load the SVE context
> + *
> + * sve_ctx - pointer to buffer for Z0-31 + FFR
> + * pregs - pointer to buffer for P0-15
> + * restore_ffr - Restore FFR if non-zero
> + */
> +extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
> +                         int restore_ffr);
> +
> /* Takes a vector length in bits and returns the ZCR_ELx encoding */
> static inline register_t vl_to_zcr(unsigned int vl)
> {
> @@ -21,6 +41,21 @@ static inline register_t vl_to_zcr(unsigned int vl)
>     return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
> }
>=20
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
> +
> register_t compute_max_zcr(void)
> {
>     register_t cptr_bits =3D get_default_cptr_flags();
> @@ -61,6 +96,62 @@ unsigned int get_sys_vl_len(void)
>             SVE_VL_MULTIPLE_VAL;
> }
>=20
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
> +    /*
> +     * Points to the end of Z0-Z31 memory, just before FFR memory, to be=
 kept in
> +     * sync with sve_context_free().
> +     */
> +    v->arch.vfp.sve_zreg_ctx_end =3D ctx +
> +        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
> +
> +    v->arch.zcr_el2 =3D vl_to_zcr(sve_vl_bits);
> +
> +    return 0;
> +}
> +
> +void sve_context_free(struct vcpu *v)
> +{
> +    unsigned int sve_vl_bits;
> +
> +    if ( v->arch.vfp.sve_zreg_ctx_end )
> +        return;
> +
> +    sve_vl_bits =3D sve_decode_vl(v->domain->arch.sve_vl);
> +
> +    /*
> +     * Currenly points to the end of Z0-Z31 memory which is not the star=
t of
> +     * the buffer. To be kept in sync with the sve_context_init().
> +     */
> +    v->arch.vfp.sve_zreg_ctx_end -=3D
> +        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
> +
> +    XFREE(v->arch.vfp.sve_zreg_ctx_end);
> +}
> +
> +void sve_save_state(struct vcpu *v)
> +{
> +    v->arch.zcr_el1 =3D READ_SYSREG(ZCR_EL1);
> +
> +    sve_save_ctx(v->arch.vfp.sve_zreg_ctx_end, v->arch.vfp.fpregs, 1);
> +}
> +
> +void sve_restore_state(struct vcpu *v)
> +{
> +    WRITE_SYSREG(v->arch.zcr_el1, ZCR_EL1);
> +    WRITE_SYSREG(v->arch.zcr_el2, ZCR_EL2);
> +
> +    sve_load_ctx(v->arch.vfp.sve_zreg_ctx_end, v->arch.vfp.fpregs, 1);
> +}
> +
> /*
>  * Local variables:
>  * mode: C
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
> index 6c22551b0ed2..add9929b7943 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -557,7 +557,11 @@ int arch_vcpu_create(struct vcpu *v)
>=20
>     v->arch.cptr_el2 =3D get_default_cptr_flags();
>     if ( is_sve_domain(v->domain) )
> +    {
> +        if ( (rc =3D sve_context_init(v)) !=3D 0 )
> +            goto fail;
>         v->arch.cptr_el2 &=3D ~HCPTR_CP(8);
> +    }
>=20
>     v->arch.hcr_el2 =3D get_default_hcr_flags();
>=20
> @@ -587,6 +591,8 @@ fail:
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
> index 4b63412727fc..65b46685d263 100644
> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -22,6 +22,10 @@ static inline unsigned int sve_decode_vl(unsigned int =
sve_vl)
> }
>=20
> register_t compute_max_zcr(void);
> +int sve_context_init(struct vcpu *v);
> +void sve_context_free(struct vcpu *v);
> +void sve_save_state(struct vcpu *v);
> +void sve_restore_state(struct vcpu *v);
>=20
> #ifdef CONFIG_ARM64_SVE
>=20
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
> /* ID registers (imported from arm64/include/asm/sysreg.h in Linux) */
>=20
> diff --git a/xen/arch/arm/include/asm/arm64/vfp.h b/xen/arch/arm/include/=
asm/arm64/vfp.h
> index e6e8c363bc16..4b399ccbfb31 100644
> --- a/xen/arch/arm/include/asm/arm64/vfp.h
> +++ b/xen/arch/arm/include/asm/arm64/vfp.h
> @@ -6,7 +6,23 @@
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
> +
> +#ifdef CONFIG_ARM64_SVE
> +    /*
> +     * When SVE is enabled for the guest, sve_zreg_ctx_end points to mem=
ory
> +     * where Z0-Z31 registers and FFR can be saved/restored, it points a=
t the
> +     * end of the Z0-Z31 space and at the beginning of the FFR space, it=
's done
> +     * like that to ease the save/restore assembly operations.
> +     */
> +    uint64_t *sve_zreg_ctx_end;
> +#endif
> +
>     register_t fpcr;
>     register_t fpexc32_el2;
>     register_t fpsr;
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index 331da0f3bcc3..99e798ffff68 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -195,6 +195,11 @@ struct arch_vcpu
>     register_t tpidrro_el0;
>=20
>     /* HYP configuration */
> +#ifdef CONFIG_ARM64_SVE
> +    register_t zcr_el1;
> +    register_t zcr_el2;
> +#endif
> +
>     register_t cptr_el2;
>     register_t hcr_el2;
>     register_t mdcr_el2;
> --=20
> 2.34.1
>=20


