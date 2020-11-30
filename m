Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B272C8EFF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 21:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41432.74577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpgf-0005Ii-SD; Mon, 30 Nov 2020 20:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41432.74577; Mon, 30 Nov 2020 20:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpgf-0005IM-P6; Mon, 30 Nov 2020 20:22:17 +0000
Received: by outflank-mailman (input) for mailman id 41432;
 Mon, 30 Nov 2020 20:22:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjpge-0005IH-2Z
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 20:22:16 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c10ecc07-a308-4017-bfcc-1e0f39fe1958;
 Mon, 30 Nov 2020 20:22:15 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUKK9G9002260; Mon, 30 Nov 2020 20:22:09 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
 by mx0b-0039f301.pphosted.com with ESMTP id 353c7me372-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 20:22:09 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB4975.eurprd03.prod.outlook.com (2603:10a6:803:bc::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 20:22:07 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 20:22:07 +0000
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
X-Inumbo-ID: c10ecc07-a308-4017-bfcc-1e0f39fe1958
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL6IAv3KMYKuhVH4c2aO4zFSsF2O6raRwjuIR9+dYXYWdD1nhnvIWtTpsuImolGeVDo4sNIJNgUEar3/j4AU+/GvgSg0U5emQ1tR+GYCY5mhvtfm9XwJlNnhS/iqEsKT5U+OjYAOFFv4YxHoblnh4/B7EwXj4tlPLiFcH1xD6LdkqF7ZQl+DCi6rP+2c6YDFWEhAjz/P0vJetAIKnAI2pn8LJ12Dq1mYBy/zApiujWaTtqbtK1Tag5jrmZz19AbEua+SHCQobEfahVKQQ9sMlxwL9kAKQTM3j44LE4ieSizelorABXHPRr9GkM30hL6FRaiww9SY6CWu1mlzYiXslA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6bQ5RxLzW7tCkp+2j9zC7JMyKKjt3E5JTDlIk3GGrQ=;
 b=NLRc8uEtDUnwVWbRC3YGajPvP5u1LEgJ1UEyjm5zDatpO5lp3/b1bjlkDNYlV3pAaDTN+BIH2aDQGRvKhGXdbqyNn/9yUT1WN6Kpu1eCco00nnQjJDOorwRHa7re5GJAIIr7lpBb3d4cS2v58ta3lJGmvoCRevyquVzml63h2ymA8Os+S2UjQxlwvEygsY5VKCuRzbiW96bJYHC9guKK6I8g59Xfn+c65gDkX7/g00hdXm1qmaiZ4uhrLLCFpwiL1Bv7hAreSHjF702pP7XJgYzYEo49v/gWnweSNYEknDnOkAw287GBGDcNZYKnycOWkSPghiekY3FFqLYrwqwahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6bQ5RxLzW7tCkp+2j9zC7JMyKKjt3E5JTDlIk3GGrQ=;
 b=nByJwbXSK+d7kuc85fATdZBgg/eVF5AqpyYH/Nb7hBpsPAiHtyQZ+ImB4jd8y7f7o77+IWDp70OW9Rrma8zZ0h3cYHJuLNAdt11sCtQrcl4WQHqC1lDYUapeNMKigdHRmL9gxNZlvp3q8KGiQPIus8+tw5u7oNR5Q1aHGeIcVlFGaO9vR5L4W8c26cTqBLqsZQXuExzCxo4AE7Paf6w64dHqnJCgCyK6VC5t7PEc5lcJJ2Se4lazX5VUakOTASk/9EfW8deS8foHhHHGlbX8U+buEnRY+9IRANYpJNmB9HuACucjzRNL2ZFy0jp7qPqrT6yIQWpWFNFBn1Vlv/GV0w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Topic: [PATCH v2 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Index: AQHWxyRRk7rRSvoRk02jzxNDTD03R6nhHqgA
Date: Mon, 30 Nov 2020 20:22:06 +0000
Message-ID: <87pn3u7fyp.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <6db611491b25591829b9408267bd9bd50e266fe2.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <6db611491b25591829b9408267bd9bd50e266fe2.1606742184.git.bertrand.marquis@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [85.223.209.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e091f732-b180-4297-b7fb-08d8956d9bd0
x-ms-traffictypediagnostic: VI1PR03MB4975:
x-microsoft-antispam-prvs: 
 <VI1PR03MB4975E8B4904B9B77C4B9A9E7E6F50@VI1PR03MB4975.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zKa7wuP4WsSadwAki2hjM6y1VMIReP+/i4Pbs5gjTYdtAzmTm2M+5E133xvBFbWKg0nU9oErI94IfRPlAFTl90nlkMqgAEeap4tb48nR4qkw728ryDYd1vhjz1/hSGAgV7/n9EBTRByNHywbm+usahPhg99iJWQTD+TPdceUnkf5zlkoURCEY1rBuKrjwIiFn801YrMRPDffDK6WYnRgRwE8o+zTZNoK9k0P4LfOSeFN/xenNHGwVMx8l7ms471ZGtuJxFpiSOPTB66Ais4DIEac0L7AvTBh+YPKqlsijAmbICNec9/PW5nu4lq/lUEuE5fOeNjcHkskq4Oq/cvM0A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(5660300002)(36756003)(6506007)(478600001)(86362001)(83380400001)(66556008)(66476007)(66946007)(64756008)(66446008)(4326008)(6486002)(26005)(316002)(186003)(6512007)(8676002)(6916009)(2616005)(8936002)(2906002)(54906003)(55236004)(76116006)(91956017)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?OFhxjXu9Rcv7ifNACK67/SqGgOEpcAM9t8Vmzx+I5hiCbxR9fht+8oTO+g?=
 =?iso-8859-1?Q?0x/WhmFZJYyeP/akZfl3YAi6BIT2m0tvN8FF41KXgz4Tr/rSn/V1iaI2Md?=
 =?iso-8859-1?Q?FjwXtIwcw8v+tpNtslzcbf4lK8iSeOiIlQn2ge0k+REbFX/cXdujDhc7DF?=
 =?iso-8859-1?Q?R3lxZ7QuUI8wUHOPT4yN7ds/2xad0Q+4QuG1V83Z+uQdltf93wWFVgWrft?=
 =?iso-8859-1?Q?NqhPqD5Bb0qpgPtU34RnleQckII4o9yv/bZbDav5/5cIHFUL5IgJg6o1MD?=
 =?iso-8859-1?Q?5NbIqSqmAuD6HH7HV+68Hil1b2ggUoJ80bxmyta6sLZ5A0Fhs4BVg/gUbl?=
 =?iso-8859-1?Q?Y+vpNUh7+kHmgKb/FQod55GXKXoUptdsqe8HxT9gI5mtXkPVVLlqIrnvV0?=
 =?iso-8859-1?Q?2hfP2jC95JoiYUEVq2NMP6UErJSiE/+EA1B/u6vopX/K/pEbDGhDSVc2dJ?=
 =?iso-8859-1?Q?DZotlA3B/6Gwlm3Bvp25JXPuoGfNuv4ySp/IQyBJ4aTXimbPwTDoDZndwB?=
 =?iso-8859-1?Q?RcKcP3Z8keaI2fE0UOzhPMx8sNvNFto4A6zi4U6FUd+MilMJEVj19chRZT?=
 =?iso-8859-1?Q?JcXhQZBY3xHaL1PxS88zoakQP0ndbg7WyOgx+vgCn0kQcb3i7E79r49eOd?=
 =?iso-8859-1?Q?9S/awFQH93bmayA9/uLJrcSEmvrkUAkpB9WMNEjCJaQZx9DRNBULC0lq9r?=
 =?iso-8859-1?Q?mH/PhQniv/gYb1+UPbPkQ718A5AlNy/ARMOcfG1Hh95FfkInqfJoxjCR7F?=
 =?iso-8859-1?Q?pIp//AQ/i0Q3v4ssdjrPXPDyC5kDb1dMYJrSwoF8p5/gwjsnDyWcP9CWgH?=
 =?iso-8859-1?Q?CmAQRCjPR5wHi+R7RhHTbgiHrfOkaMbIrXdEok4fjhbPKdM+7SVwF7Kw4z?=
 =?iso-8859-1?Q?e1gnqjS1uphHWv3AztThVDHUwY2ur1gLdZWg3Xw66K0Dar2OIf0UuY/7Ia?=
 =?iso-8859-1?Q?jcYfVcP/ldFjHD9H5i0LFX5sROfFaxRGvvxoTs8s6zc5/gGJhTo/8eGa6v?=
 =?iso-8859-1?Q?XGS9OUkSZe01u2gIy/ogKmvLTrsqEZ76KAnUQg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e091f732-b180-4297-b7fb-08d8956d9bd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 20:22:06.9612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oRsJy63cLEdXbVq2itKK/eFOLSCDuSv2CqLC9/6s8v3K7omcGFePPIs9g4kbBn3PGekQg+RiqZ6VbbXXAhzj76RTr7VH1wHO6vHeB1pTHys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4975
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_11:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=910 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011300129



Bertrand Marquis writes:

> Add vsysreg emulation for registers trapped when TID3 bit is activated
> in HSR.
> The emulation is returning the value stored in cpuinfo_guest structure
> for most values and the hardware value for registers not stored in the
> structure (those are mostly registers existing only as a provision for
> feature use but who have no definition right now).

I can't see the code that returns values for the registers not stored in
the guest_cpuinfo. Perhaps you need to update the commit description?

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: rebase
> ---
>  xen/arch/arm/arm64/vsysreg.c | 49 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 8a85507d9d..970ef51603 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>          break;                                                          =
\
>      }
> =20
> +/* Macro to generate easily case for ID co-processor emulation */
> +#define GENERATE_TID3_INFO(reg,field,offset)                            =
\
> +    case HSR_SYSREG_##reg:                                              =
\
> +    {                                                                   =
\
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   =
\
> +                          1, guest_cpuinfo.field.bits[offset]);         =
\
> +    }
> +
>  void do_sysreg(struct cpu_user_regs *regs,
>                 const union hsr hsr)
>  {
> @@ -259,6 +267,47 @@ void do_sysreg(struct cpu_user_regs *regs,
>           */
>          return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
> =20
> +    /*
> +     * HCR_EL2.TID3
> +     *
> +     * This is trapping most Identification registers used by a guest
> +     * to identify the processor features
> +     */
> +    GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> +    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> +    GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> +    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
> +    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
> +    GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
> +    GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
> +    GENERATE_TID3_INFO(ID_MMFR1_EL1, mm32, 1)
> +    GENERATE_TID3_INFO(ID_MMFR2_EL1, mm32, 2)
> +    GENERATE_TID3_INFO(ID_MMFR3_EL1, mm32, 3)
> +    GENERATE_TID3_INFO(ID_MMFR4_EL1, mm32, 4)
> +    GENERATE_TID3_INFO(ID_MMFR5_EL1, mm32, 5)
> +    GENERATE_TID3_INFO(ID_ISAR0_EL1, isa32, 0)
> +    GENERATE_TID3_INFO(ID_ISAR1_EL1, isa32, 1)
> +    GENERATE_TID3_INFO(ID_ISAR2_EL1, isa32, 2)
> +    GENERATE_TID3_INFO(ID_ISAR3_EL1, isa32, 3)
> +    GENERATE_TID3_INFO(ID_ISAR4_EL1, isa32, 4)
> +    GENERATE_TID3_INFO(ID_ISAR5_EL1, isa32, 5)
> +    GENERATE_TID3_INFO(ID_ISAR6_EL1, isa32, 6)
> +    GENERATE_TID3_INFO(MVFR0_EL1, mvfr, 0)
> +    GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
> +    GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
> +    GENERATE_TID3_INFO(ID_AA64PFR0_EL1, pfr64, 0)
> +    GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
> +    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
> +    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
> +    GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
> +    GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
> +    GENERATE_TID3_INFO(ID_AA64MMFR0_EL1, mm64, 0)
> +    GENERATE_TID3_INFO(ID_AA64MMFR1_EL1, mm64, 1)
> +    GENERATE_TID3_INFO(ID_AA64MMFR2_EL1, mm64, 2)
> +    GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
> +    GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
> +    GENERATE_TID3_INFO(ID_AA64ZFR0_EL1, zfr64, 0)
> +
>      /*
>       * HCR_EL2.TIDCP
>       *


--=20
Volodymyr Babchuk at EPAM=

