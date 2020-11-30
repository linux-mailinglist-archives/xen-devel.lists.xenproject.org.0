Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1798A2C8F53
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 21:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41447.74602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpxt-00076y-RK; Mon, 30 Nov 2020 20:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41447.74602; Mon, 30 Nov 2020 20:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpxt-000752-NH; Mon, 30 Nov 2020 20:40:05 +0000
Received: by outflank-mailman (input) for mailman id 41447;
 Mon, 30 Nov 2020 20:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjpxs-0006qj-1n
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 20:40:04 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 881d8c57-f111-48ee-b312-43c435f234f5;
 Mon, 30 Nov 2020 20:40:03 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUKU9wc018045; Mon, 30 Nov 2020 20:39:58 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0b-0039f301.pphosted.com with ESMTP id 353ejmwv1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 20:39:57 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB3952.eurprd03.prod.outlook.com (2603:10a6:803:72::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 20:39:54 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 20:39:54 +0000
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
X-Inumbo-ID: 881d8c57-f111-48ee-b312-43c435f234f5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYvSCKzUsPlPPhaJRh2DIAEIw2H/fFnP89Re2l8LKvcWnJWFdLrJtDpxcXe3NaJyIti6AAxQUzDtaMpC5Bj4a1hVOS1yjB4ZISjY8kKTo3QgghS9uODrh+UIh+WzsKmwsl71+WS095FN0i3O6aexKGb/sFwXJKohR/CFkRSkptxGF9tc+JdhVRhGCu3A+gZCLZkFEjOxVfF4D9YU7re4el4YtVW7KZOdc4uahYBz7mj4TSseTV/QrS/3k1xGmbFjoQhqIIaLWIswpVPxnzqFSyfNQduTbT31OyXqxDYpLRtrEZ9RfUI26F+udG4jmUau5SJC7x2gt++zodt5/0fmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jj6GLLuP7XyB7Gz+CcOMdnBFBEt6b+3WFAq4cTASqA=;
 b=DK7SH78piaoOXDkAVA2l0XpItIF7LJxXYBfvoL3U78gGLNeLwg1BWebJ52JJK8zTuVX8OYCh8In9TrmHNQIw1mJbT0jXgS101b/rHPvesU8iARjn30yKAzrGQzXXxYLcZiEL2uKQtbdXevQeQzv+6OoMCY0RYaTKfeoTaKMJIyWgmeulR5KpcvSPCul1+Y6yZ0DeLzk/CVklK/KuftQw6hNxapLYku/hcugA4KKyJPYEjDtO1LIP2iVmRhSVJ8zh4qiSTSyKsFTzuCUFBB5+FBOh26rVym3lLGQ8TriPUefAl/Q3mw+JCeIKNGdLxNi1VoLjPmeeovYvdL1FZQHfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jj6GLLuP7XyB7Gz+CcOMdnBFBEt6b+3WFAq4cTASqA=;
 b=w/xEDy5mV+neY8c1BvqKm/bhC5i9Hvst8JsvmD6QsTFM5j0IWFbU7CZqzLLVhKKSeFgipaU53BEZL8PrT/ZbVkV4z5jk+TStIU1tKIK7G+vSMFDJCgIgYtm2ynENJyP+n22N9bRFDVZrOMLI9Aw+fgVW1NQcvM3tQClbGGjJWdQf1lPX8HG0iNTwQlHkfXOs4lG6fex5SNDg//bFMO9kZSqrw/2ZgvHAnDCKwJq5jOZfJ1uRy9eN7+AoZaCyOJKq/oeyDg8PwBBJIoAwgBBW2HLou7CmQ5Jr4g4by3yvU1VkPbLlCySy57NZueS9v8h1R/QH1NWp3Wj4sTUM7q+LEQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 6/7] xen/arm: Add CP10 exception support to handle VMFR
Thread-Topic: [PATCH v2 6/7] xen/arm: Add CP10 exception support to handle
 VMFR
Thread-Index: AQHWxyRSFZ5B0f9NVEG4OUHzk+RfiKnhI6CA
Date: Mon, 30 Nov 2020 20:39:54 +0000
Message-ID: <87h7p67f52.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <58ff66d0daf610dfe8e09516302cb0c0fe17fc59.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <58ff66d0daf610dfe8e09516302cb0c0fe17fc59.1606742184.git.bertrand.marquis@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [85.223.209.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71e2a1c6-bf7c-4ab9-6c8f-08d8957017da
x-ms-traffictypediagnostic: VI1PR03MB3952:
x-microsoft-antispam-prvs: 
 <VI1PR03MB3952F12CF92EC2D2679C34DCE6F50@VI1PR03MB3952.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VyKhbWWqtgY1hZI1dGaQiEwhjnj9zBYI8TuPOxr80u8gpaY/pJKqrSvROh/8L/+IU6883n1pFRboFbv15wixekncQreDDauYQq9AqPZgs6GS7R4Pzb5h8/oW9lIzjDzpp//IdGskIsdxYSOCv1QGN/BdsAuP9KW/ckerZSSUZ5g4nbtrrrSSPohinTcDrl0vHt1T0Jcc5euu9UMqmweYSXicsZcC/gOjpY0EZB1d7HpitZkatPPQokC8EfazjauhiflbgA3HArASvOzaU9yPo5DjnwyR9sshe0jHTFKMGEbwSBxNtWHUhnLLVSsFY4Bu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(8936002)(8676002)(55236004)(478600001)(186003)(26005)(4326008)(316002)(6506007)(54906003)(2616005)(86362001)(36756003)(5660300002)(2906002)(6512007)(66556008)(66446008)(64756008)(66476007)(6916009)(91956017)(76116006)(83380400001)(66946007)(6486002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?HbIjzGRHnPSHTn6E5aIAXqGqi/tUuBpUYZqSDoVY0MA553fNDgwDkyfVXf?=
 =?iso-8859-1?Q?k7d8PMl3XF0c1v9CZDnlSYoxiLRhd4d7V9eT2R8kEjgpTlqzuyy/TQ1sU6?=
 =?iso-8859-1?Q?lPkfNZsAV6s//3Y+u/n1tciQmDVvsjD0WJcy5uOZP2/MngWUkzGl7DdWpo?=
 =?iso-8859-1?Q?6hTd2CLzLNgNS3MfjxKzsbJUhKwYp3Wjt1GTH9jYiuGbFHle86w+8hZTUU?=
 =?iso-8859-1?Q?xWID6hyWcNmqe8jCjhnZvRTz8YUMDDcYy9qu2iQxF4tZB3Fhd+6NpgN7W3?=
 =?iso-8859-1?Q?xuxpvNyloLMeMH+JA+weMLctae5xDGicvXFrICYYQqckP4zcSvmUDwiO5V?=
 =?iso-8859-1?Q?pDANykgF1zBy6jby2ScO+odj921oJCp7P6fHwFIpO3Ofl+7bc/2VT0BN/f?=
 =?iso-8859-1?Q?TZKA4y7/4lsq3lXQvuZqZlvw3fSmmCp1xzAqIImSQrZpY00aE1lPD3XxQ1?=
 =?iso-8859-1?Q?3p6JtJDSLDlf3X2Y6gnozHOa9VlTrplW2PKZ//R/H5BcCbFrFnn+6IszmK?=
 =?iso-8859-1?Q?M3F2SRX+Vpm+crfxDAN53oVvzyEAi+/q+aX33ci3kHB5iv1+T6KlTtVOd5?=
 =?iso-8859-1?Q?JymsYP1Op5CS0l8U9dFSZ7TAMMfvKfrMVkmWuB0mHjdItJI9S0TCt23brb?=
 =?iso-8859-1?Q?eLvNZ58QW7KJIqX23QgPPNJ2XKMg0Du6fP3paVXO3IZtj8QqVULjQV3tMs?=
 =?iso-8859-1?Q?jsH/Y3zktOn28l+ps8bL/PqCmR2ne1dWC34RyfjJ0vAjkM5X0bUEcZr652?=
 =?iso-8859-1?Q?rTJ+PYM1dfaD0PHs2ZhvpWXvMm6rPldhy+41pvjpaLmJKlc7WD+qDsNdu5?=
 =?iso-8859-1?Q?hy6AsbPdUS3TFgCeqWJMVLhmZ7E6mLi+RLsvRYFT3RCy0JeHfn+6Mv/rZb?=
 =?iso-8859-1?Q?CKWoX8VDky+9mEaIY0jCGSHwg7FH8RAZD0LH9d6VLLEA7TZAqyzSR2iMaN?=
 =?iso-8859-1?Q?PNTCsJOq63Qovk9pdMl6lLQAZEETSCxfwwXYmsfZx9NjSot26Bd31uF33P?=
 =?iso-8859-1?Q?1ESqtUpjSWxGwJ1l6c2Wad+SmE+Mb5IeXpFww8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e2a1c6-bf7c-4ab9-6c8f-08d8957017da
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 20:39:54.0637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PPs403ePclVRYmeMDNvXJtThhxtavq2OFg9N2FfS0v6zZEz0W2V9+cgYlned6E/MP+hBAZ/Mdk0YCby9gXL1cz1JxSCHU8u+z6fwQZ6QawQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3952
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_11:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=876 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011300132


Bertrand Marquis writes:

> Add support for cp10 exceptions decoding to be able to emulate the
> values for VMFR0 and VMFR1 when TID3 bit of HSR is activated.
> This is required for aarch32 guests accessing VMFR0 and VMFR1 using vmrs
> and vmsr instructions.

is it VMFR or MVFR? According to the reference manual, it is MVFR. Also,
you are missing MVFR2.

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: rebase
> ---
>  xen/arch/arm/traps.c             |  5 +++++
>  xen/arch/arm/vcpreg.c            | 38 ++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/perfc_defn.h |  1 +
>  xen/include/asm-arm/traps.h      |  1 +
>  4 files changed, 45 insertions(+)
>
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 22bd1bd4c6..28d9d64558 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2097,6 +2097,11 @@ void do_trap_guest_sync(struct cpu_user_regs *regs=
)
>          perfc_incr(trap_cp14_dbg);
>          do_cp14_dbg(regs, hsr);
>          break;
> +    case HSR_EC_CP10:
> +        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
> +        perfc_incr(trap_cp10);
> +        do_cp10(regs, hsr);
> +        break;
>      case HSR_EC_CP:
>          GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>          perfc_incr(trap_cp);
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index d0c6406f34..9d6a36ca5d 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -634,6 +634,44 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const u=
nion hsr hsr)
>      inject_undef_exception(regs, hsr);
>  }
> =20
> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
> +{
> +    const struct hsr_cp32 cp32 =3D hsr.cp32;
> +    int regidx =3D cp32.reg;
> +
> +    if ( !check_conditional_instr(regs, hsr) )
> +    {
> +        advance_pc(regs, hsr);
> +        return;
> +    }
> +
> +    switch ( hsr.bits & HSR_CP32_REGS_MASK )
> +    {
> +    /*
> +     * HSR.TID3 is trapping access to MVFR register used to identify the
> +     * VFP/Simd using VMRS/VMSR instructions.
> +     * In this case MVFR2 is not supported as the instruction does not s=
upport
> +     * it.
> +     * Exception encoding is using MRC/MCR standard with the reg field i=
n Crn
> +     * as are declared MVFR0 and MVFR1 in cpregs.h
> +     */
> +    GENERATE_TID3_INFO(MVFR0, mvfr, 0)
> +    GENERATE_TID3_INFO(MVFR1, mvfr, 1)
> +
> +    default:
> +        gdprintk(XENLOG_ERR,
> +                 "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
> +                 cp32.read ? "mrc" : "mcr",
> +                 cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs-=
>pc);
> +        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
> +                 hsr.bits & HSR_CP32_REGS_MASK);
> +        inject_undef_exception(regs, hsr);
> +        return;
> +    }
> +
> +    advance_pc(regs, hsr);
> +}
> +
>  void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
>  {
>      const struct hsr_cp cp =3D hsr.cp;
> diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perfc=
_defn.h
> index 6a83185163..31f071222b 100644
> --- a/xen/include/asm-arm/perfc_defn.h
> +++ b/xen/include/asm-arm/perfc_defn.h
> @@ -11,6 +11,7 @@ PERFCOUNTER(trap_cp15_64,  "trap: cp15 64-bit access")
>  PERFCOUNTER(trap_cp14_32,  "trap: cp14 32-bit access")
>  PERFCOUNTER(trap_cp14_64,  "trap: cp14 64-bit access")
>  PERFCOUNTER(trap_cp14_dbg, "trap: cp14 dbg access")
> +PERFCOUNTER(trap_cp10,     "trap: cp10 access")
>  PERFCOUNTER(trap_cp,       "trap: cp access")
>  PERFCOUNTER(trap_smc32,    "trap: 32-bit smc")
>  PERFCOUNTER(trap_hvc32,    "trap: 32-bit hvc")
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index 997c37884e..c4a3d0fb1b 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -62,6 +62,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr);
>  void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr);
> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
> =20
>  /* SMCCC handling */


--=20
Volodymyr Babchuk at EPAM=

