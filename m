Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8D16A9592
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505859.778835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY30w-0003n3-08; Fri, 03 Mar 2023 10:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505859.778835; Fri, 03 Mar 2023 10:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY30v-0003ji-T0; Fri, 03 Mar 2023 10:51:49 +0000
Received: by outflank-mailman (input) for mailman id 505859;
 Fri, 03 Mar 2023 10:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/yG=63=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pY30t-0003jc-Up
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:51:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2070.outbound.protection.outlook.com [40.107.13.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 634b564e-b9b1-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:51:45 +0100 (CET)
Received: from FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::10)
 by DU0PR08MB8346.eurprd08.prod.outlook.com (2603:10a6:10:40a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 10:51:15 +0000
Received: from VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::7a) by FR0P281CA0128.outlook.office365.com
 (2603:10a6:d10:97::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.6 via Frontend
 Transport; Fri, 3 Mar 2023 10:51:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT005.mail.protection.outlook.com (100.127.144.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 10:51:14 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Fri, 03 Mar 2023 10:51:14 +0000
Received: from e0dbf0f09e6f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B86537BA-C905-470B-BFEC-F02688F24D62.1; 
 Fri, 03 Mar 2023 10:51:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0dbf0f09e6f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 10:51:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8134.eurprd08.prod.outlook.com (2603:10a6:20b:54f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 10:51:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 10:51:00 +0000
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
X-Inumbo-ID: 634b564e-b9b1-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmR9G8IZqGsaKBKUmsPPY0EdU70TZ1wJi1bKDS4ntcc=;
 b=WLkvWx0lDHIwEM/F+uhII+j3iSNij5AdT4mAfLflLnplSDlA8TZm/sAhyxo2Ss5fIarYZ4bu3fsuJ6b7qc/S1F5b5RN1aSsyFnWrurVzszemBsXYh54d0hKhBcwUhjBEVJoUMDuGfB1yOQe9WeXMulaXJBYvMdkDOKTyMsazZaM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdd73dd9953db9d7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwVX31M8/RYlfNA1nd4RYj2pvC3QHmU/W/QicH/3dh7oo+pdopIQcv3ErxJMm0b5nCL/Mv0yoQvh8t8iqLlwGLHEs8JuPmB8MgJwSIRBZsMhq3LOLOjITG/Mt0IKlRGruDctqiY/to7BsyBNQ3lp+tHgBgmpMDwr8cftrkS/ee6fEr3vITjv7Un/5aVInB6tlECtBcf8MG7I3yavkE+sSuLUgGbh97Nnb9oDN30rRXV50bYKRcC3pLQC/o5rwYzKdFUuLfFfUe6WBAskQWw9ToRofnznP7hAbptYhDnBGpByCeA1/OOgnStSU0Cn3Q5R5QWgiQwmAB81nHFDddkh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmR9G8IZqGsaKBKUmsPPY0EdU70TZ1wJi1bKDS4ntcc=;
 b=Wz4WRjPwO5DgNmS14XsXAQwR/sZUTBaSvQn6OUC51xafyI1K5Fr0z2WKXHq8nEi8oekN5jnFVNp+zg+AmsuY5M0phgAfE3TURO6qUT7+3AOUuQ1xUCcly7M4QBZxF7EBTjJvJM24/0yyxbggWygeVOB8SkLJQNzgt4Dffjp/s9iyScPzfpzoE5qy+cO78OBxCK7LmGtljmWIokbjfP6kFx/y8fg2gG9RBSjtZqS5JB3ga8CUigQbWFoaX4AW6IRJ4G4ygjUF0MYiZJRhEErgJ530K0G6hpPiJbelMe7V5XYHlG7kTRhlXBJcMuelUVmGgmimCjtQEAaGFZEK1MC+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmR9G8IZqGsaKBKUmsPPY0EdU70TZ1wJi1bKDS4ntcc=;
 b=WLkvWx0lDHIwEM/F+uhII+j3iSNij5AdT4mAfLflLnplSDlA8TZm/sAhyxo2Ss5fIarYZ4bu3fsuJ6b7qc/S1F5b5RN1aSsyFnWrurVzszemBsXYh54d0hKhBcwUhjBEVJoUMDuGfB1yOQe9WeXMulaXJBYvMdkDOKTyMsazZaM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v7 15/20] xen/arm: move regpair_to_uint64() and
 uint64_to_regpair() to regs.h
Thread-Topic: [XEN PATCH v7 15/20] xen/arm: move regpair_to_uint64() and
 uint64_to_regpair() to regs.h
Thread-Index: AQHZRtMhup5QB/7pQ0mR9lSg6Z90EK7o7mGA
Date: Fri, 3 Mar 2023 10:51:00 +0000
Message-ID: <18852A93-9016-4C25-BE75-872F92BB5CEF@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <ee6ebe4d22c3aecf35b7a4813ca95b2978eed534.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <ee6ebe4d22c3aecf35b7a4813ca95b2978eed534.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8134:EE_|VI1EUR03FT005:EE_|DU0PR08MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 64dbb942-1d47-4a25-4026-08db1bd535e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jbc/cwZPo2PrTOHiNAD908nEI3110oOS1qI3ymqrVBiRwfSXokf8JtO1Gc2pw9HoA+rf4G5s7FEzRu9tG8z9iNsFpDOCdbRR3PE4QYl0KlI77O9AIzLgldK5nH8SrgX9IjVmTV5j+CllehRsaxtcXSZoFUE3GQjsk3KqJ6D89LazNKGVxSxIeeagN7L787uZe3OZ7kuf34TJosemTCXjefosRttdFZGSBlTHZyu4hupbgyJ5ndJXx7h0JgAkpo8W4khulW2sLZ+WFRkuytfaWiHS/0m9YXwYSm2uHMOi6pwGMT3RP0ZXI//x2HP6z8CVR47EVlDAkDOQzG8qyBkVkt3pzk1EWM7XLhBH4K8rMDjoUg8bRokHAn+geWJTwEY9a99Rdof+oORfwiq3pqpivwfJM0Fqam3+EL4FqXnqDQt1TBr+XIy9ylQUus4RxOd6aszofIlb2FuLFSV4bsUb94LVk2acIwLDpCY7yjYlvhlbY8ZcbHnQH50sp+B+jxGIF1AP4SI7qnGsBBBTVMcIP/SDv8buDNkBzP/DOcZOiQ16C13cfQ/8wUyxdJIgf01hTpA6exBDfWpPBCwytZZSmj09M/RJMVWYWby2edfQQi43qeMorM/ysPCKzSsfcdpMr7J1HXsWBBrI/G4SS2grprW1samCbJ72TNrfi0fK7C+rr4gStAYgLibDS0wS1RrWn2cM3soCLC7NCa1n//fAABf7EqBnWsD9AkV6NhAL7DE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(2616005)(38070700005)(41300700001)(86362001)(316002)(478600001)(33656002)(36756003)(71200400001)(54906003)(83380400001)(76116006)(66946007)(66476007)(64756008)(6916009)(4326008)(66556008)(66446008)(91956017)(8676002)(6486002)(122000001)(5660300002)(6506007)(8936002)(26005)(38100700002)(186003)(2906002)(6512007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2B71F33F3C09A1468B83A161049BF507@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8134
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31ed52a0-bd03-4c01-d692-08db1bd52d81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AGUeJzHyM9lbiyJbqNj8fgJoITj+3jsk2JKd5FaUzTjFz34fdx7kf3HGsjIBOgxQhZKpSLBzFfufN2oN44IZttPoxNBcjHmUH6w8AIxkxSYwt9SKrzvE/YgYolnxqJ7Vry0XZ4oN+yQK941Spy5OLCybVt/oZF5Xei22+nkVBtZrrjIKE9H8q5dNTYM0yqkhfWD1p+37DtIqyBp68w0QkyrJpVtDLpngL6UKNSFhxKtF5FE1PtWoe3GmuKkvws8F+cAMt7Hr+vo88oS682hwUuIN0fsXwoxFCx0nmX0XBT8vHFQAxsb/h7oqSTjA9zE4EQnNTtwC0CyyykN7E6uQpX67rcsFltfVlw/p4WJtOcPIIqKakxvmVneEoFl3N3FZwuiMkbiUh5KgDsYoQgcWNUE2c7iJmsa8D77BWOiGc3A/TvCk2G7zeVpg/n5ImzY9k7D43EVP9vuUjrXNFe9pDhkeEN3xxKR7ByWoYEquiZbTKMtNr+LC/Ze5bUhXK3vtqiZ8TwFQj8EHmc4hgnBrIJJvnGwCMphn+IH0D2hcyAC1qPd/i+GjgKOa07BQ4OB+HlsZtSYVmwfgK1op3IVFYvNVUySlqpa5yiBsbQz5kDFRwIy7/OaccdsGwM5jo8RLIuTXlFP4h48QuyGagpgTLwlVUGK1qTdrQSJ8/9LLgJAsUHMS2GU3QvsyqVGhVaiDOLBaNSptK1+/Gonl6RvDfw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(316002)(47076005)(54906003)(478600001)(83380400001)(81166007)(2906002)(82740400003)(36756003)(5660300002)(82310400005)(86362001)(356005)(70586007)(70206006)(40460700003)(40480700001)(4326008)(33656002)(8676002)(36860700001)(6862004)(6486002)(53546011)(8936002)(336012)(41300700001)(6512007)(6506007)(26005)(2616005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 10:51:14.8451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dbb942-1d47-4a25-4026-08db1bd535e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8346

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Moves the two helper functions regpair_to_uint64() and
> uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
> specific regs.h. This enables reuse of these functions in the FF-A
> mediator in a subsequent patch.
>=20
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Please move Michal R-B after your signed off.

With that fixed:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/regs.h | 12 ++++++++++++
> xen/arch/arm/tee/optee.c        | 11 -----------
> 2 files changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/r=
egs.h
> index 0693a681315f..aa39e83ee5f4 100644
> --- a/xen/arch/arm/include/asm/regs.h
> +++ b/xen/arch/arm/include/asm/regs.h
> @@ -60,6 +60,18 @@ static inline bool guest_mode(const struct cpu_user_re=
gs *r)
> register_t get_user_reg(struct cpu_user_regs *regs, int reg);
> void set_user_reg(struct cpu_user_regs *regs, int reg, register_t val);
>=20
> +static inline uint64_t regpair_to_uint64(register_t reg0, register_t reg=
1)
> +{
> +    return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
> +}
> +
> +static inline void uint64_to_regpair(register_t *reg0, register_t *reg1,
> +                                     uint64_t val)
> +{
> +    *reg0 =3D val >> 32;
> +    *reg1 =3D (uint32_t)val;
> +}
> +
> #endif
>=20
> #endif /* __ARM_REGS_H__ */
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 9cb9f16d43cb..47027ecef47c 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -268,17 +268,6 @@ static int optee_domain_init(struct domain *d)
>     return 0;
> }
>=20
> -static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
> -{
> -    return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
> -}
> -
> -static void uint64_to_regpair(register_t *reg0, register_t *reg1, uint64=
_t val)
> -{
> -    *reg0 =3D val >> 32;
> -    *reg1 =3D (uint32_t)val;
> -}
> -
> static struct page_info *get_domain_ram_page(gfn_t gfn)
> {
>     struct page_info *page;
> --=20
> 2.34.1
>=20


