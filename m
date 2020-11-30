Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155622C8EDD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 21:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41424.74565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpan-0004Jw-54; Mon, 30 Nov 2020 20:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41424.74565; Mon, 30 Nov 2020 20:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpan-0004JW-1f; Mon, 30 Nov 2020 20:16:13 +0000
Received: by outflank-mailman (input) for mailman id 41424;
 Mon, 30 Nov 2020 20:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjpal-0004JP-Vd
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 20:16:12 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09c36977-c9b0-47a3-a232-578e9196c575;
 Mon, 30 Nov 2020 20:16:10 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUK7H9G023941; Mon, 30 Nov 2020 20:16:04 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 353epuns3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 20:16:04 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB3136.eurprd03.prod.outlook.com (2603:10a6:802:2f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 20:15:53 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 20:15:53 +0000
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
X-Inumbo-ID: 09c36977-c9b0-47a3-a232-578e9196c575
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIBOjWjrIFPEVjFAGsPq4cdB5KKhNNTnyQZD9zTSh5z6IBRcpujNuG9lz6coQhN64cHz27GBx6DFlgPa6xXEsi4IHk/khdLL6C7ckft9KR6wwCVxFY6SdSckJteuz/cJwVyyrXytNJOMvAcjBoXwPAETcJFMjk4IujWSr8KvCsX3IWYbb8rHvPSRWR83hqiF3vOLa1IBgcUVdFf/XUaU8QSJG8tmnwYMW0AtCs+nv3TQ6aaCujZ7ATXqX919x21Vek78Gxzkmo6pQUouTnKWzJY4Jn3PZob4rOEpgrxz2VBmYif6uEpep2Nzcm0uTGOVcQCD6T6klsouZsphigRXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FbDhL/syt/rYJ2rMzkj3W5HWlVabCifNiS1DWUfHLI=;
 b=lxiimcZLDIeJ+j+fQubO+6FxSoevQ5JNBc99ZVVSxXzns95uXQSxYTykufedV7fkdiow2Bl90/CRyTQQw6E50oam1JwYkvcR0k34fBczxfc7cdDgCp/rdb2XrojGpqFTgtjqggs7K0RsN3eK9G1WBwBDIXD8u7zT0cL5utjRA+wkOgxA3o+NJLTKBCZ3LSV6tCkCt2cIewXfPRhDo0wnqnBK7+lTk3wc8avNSXh16h9W8cGitDE0GMATN8DDn7+m0mdgCcnVYHUClBRZmC2vwkfTC9v+eAZI9De3xXKfO3eFKen2T7Vw/azQK5wbmiR/a2RD9JYPWfkvEIC5mC0CwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FbDhL/syt/rYJ2rMzkj3W5HWlVabCifNiS1DWUfHLI=;
 b=y/I+Inf0zx2jNaojRNQPlWu5pFd8E++2JFwHWjHD7dOoLFcx2Fkb1TfzK6J/dbueoPumKypxiieTbKddazNqDw+vhk5n2D63JAlUPW6Hw1cpeeYd9WrdgdET4PhkJCsQQBmL1VpWhUpGCMJK9DYRF3QlovE/dtofMAcaMnRm4kCK6mQXh18fTlqMB0MJq3C4poqmnDUno8dVhBnDSazSrE/JxzNqiPelou7IscevkHEtL8JMpEVG9ibT+OaeZxLna9CZ75/DG92W720gevnLzpoQBfHgZoaK99srT/sC1+EWo1DCMFDPal+F4pDdjSTxdmKYws9BXLdSDAooDs+a4Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Topic: [PATCH v2 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Index: AQHWxyRRyTw/iUdji0eQScYdbZeE1KnhHOoA
Date: Mon, 30 Nov 2020 20:15:53 +0000
Message-ID: <87tut67g93.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <539cc9c817a80e35a2532dba5bc01e9b2533ff56.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <539cc9c817a80e35a2532dba5bc01e9b2533ff56.1606742184.git.bertrand.marquis@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [85.223.209.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 479a6e53-9f9b-4354-0275-08d8956cbd1a
x-ms-traffictypediagnostic: VI1PR03MB3136:
x-microsoft-antispam-prvs: 
 <VI1PR03MB313605E02163791D1CFD849AE6F50@VI1PR03MB3136.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WDhzFUnZmzKzmqVj7iqApyiM5/4hK4gtBX04p9JxMO+Ox+hwq4mCZt9YBbp4/hOcBinSDwanlt8tN/n/fsPWSRN21/PML4PoFQksZcbpVAC+vYID3UsCQRj+4WSstMxpU7+lIdbsLkbj1dT/uKeyVKJlg93SE6J+JjNoMgkwdXsryfK5H5bPEE14VLWx+ArRrTgb24yOE20VWQWxArwv/0iNNevh4Mn2bXAnbSRtqQ13YdidIRjiPeZu7xFNaMHSbvt6DaUihHCepg6DD1JgSP3mDumSzZR0Ws0RcQdc9cb9+uo2Wk4L83vw2e0tQCdwMmAyefypiVjOZb2WAscOYQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(186003)(55236004)(5660300002)(2616005)(26005)(4326008)(36756003)(6506007)(66556008)(83380400001)(64756008)(316002)(71200400001)(54906003)(6512007)(6916009)(86362001)(66476007)(478600001)(76116006)(66446008)(91956017)(6486002)(2906002)(66946007)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?yqTJLC6lTnYCCsOeBUTT9rMo9ssldVf8ubbj7/sYqS9k2DxXA5j5OaQE26?=
 =?iso-8859-1?Q?o3Y3y6RwoKxjl/RHy1fozO4dybTNnQOkglYp8FjMfU0f8t6mh+vwxFhwKK?=
 =?iso-8859-1?Q?XTLMcbSJjxVlzK4t12J4NjQjf90yiXjRUkNkkXFPi5DylMP3BdeFpxXeYl?=
 =?iso-8859-1?Q?mhib23a0odWqNIOpz1Ypq9LVHirYCznDQCvgZEStAiHfifFNM9X1nZwCSy?=
 =?iso-8859-1?Q?LbC9Yj67bYsrndwekq8Cu3WGfo4topRqRxlBSgk+B+1FAEscrwN72h5/MI?=
 =?iso-8859-1?Q?hSnbq5TfOqNsjAD/Uuro5nO4jLpXic4S3R23FVxRnBgFx1kqeZcT6oVVA7?=
 =?iso-8859-1?Q?zNx7REn1AG8ifcJJ3iFy5S0PehAJnpRTawwdi+tVhXgLs0HoKNyGXDkUZt?=
 =?iso-8859-1?Q?S2F7kuXz6FwUpvc+J5aIeD+fd6B36Yx/UzuFXR66G3ORa7RYDoVy75iMVR?=
 =?iso-8859-1?Q?4yb56aMrWN47f4rqpWFEs170dtQLuhFnpJsGJ9NwlGONloeuvccsHwl3cP?=
 =?iso-8859-1?Q?orQbX9qv+RH7wZpvfj+m8sR7DG6ue6LuNCOZKTio5/v68Oe7RUf0c0NvDr?=
 =?iso-8859-1?Q?pd9jngoUxvqwuYan9YlmdDwKjEzqgU1YZrFZO8hNLpPQhVFEPkrwxhBRiM?=
 =?iso-8859-1?Q?1BtoQS5C72MtctqUFWwyRKg1UP1lNpp3g3cTpmOCXVdKmvvocKlAGxx9pJ?=
 =?iso-8859-1?Q?gL11OSSlz5XawfUywh0qk09gglhOyccidedqNVcYi1q2MkMsbbbLCuv9T8?=
 =?iso-8859-1?Q?4aJdMqT+L82BZZcf02xwVZZb5oICIdesB7/sZ2nyVDTZQi+WQkEuHIcb7j?=
 =?iso-8859-1?Q?C2nMBhgjcyPCAXopjuBysomVcBzF+74mUQNoQHlhc2vEM5aPpyOGw/WkJa?=
 =?iso-8859-1?Q?7nzT6fohVcf2H1kK+mzYDC623Ig0DAr0v7qb/FOF8ASSnh3ZtwPDXZArj5?=
 =?iso-8859-1?Q?sC8CukmS0FREOalEezzhZfR0aZv+pDgf6ojTenNv+GZO9OYQmGwApXLuBG?=
 =?iso-8859-1?Q?WtpyzySof2MJeDe3Wy9IlrtzYekzwZxRMnC+hG?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479a6e53-9f9b-4354-0275-08d8956cbd1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 20:15:53.3793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqNL1xyYnMFDt8o8Pyh/1sbLlrkjQqzTAd7WesV6+IBL5x/C8Op2gKzd0pDYszQelKaY3TqbhiTQJbspZFPH+S7u4P8TUaMr0yKzsHuOP+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3136
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_08:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300129


Bertrand Marquis writes:

> Create a cpuinfo structure for guest and mask into it the features that
> we do not support in Xen or that we do not want to publish to guests.
>
> Modify some values in the cpuinfo structure for guests to mask some
> features which we do not want to allow to guests (like AMU) or we do not
> support (like SVE).
>
> The code is trying to group together registers modifications for the
> same feature to be able in the long term to easily enable/disable a
> feature depending on user parameters or add other registers modification
> in the same place (like enabling/disabling HCR bits).
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: rebase
> ---
>  xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/cpufeature.h |  2 ++
>  2 files changed, 53 insertions(+)
>
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 204be9b084..309941ff37 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -24,6 +24,8 @@
> =20
>  DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
> =20
> +struct cpuinfo_arm __read_mostly guest_cpuinfo;
> +
>  void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
>                               const char *info)
>  {
> @@ -156,6 +158,55 @@ void identify_cpu(struct cpuinfo_arm *c)
>  #endif
>  }
> =20
> +/*
> + * This function is creating a cpuinfo structure with values modified to=
 mask
> + * all cpu features that should not be published to guest.
> + * The created structure is then used to provide ID registers values to =
guests.
> + */
> +static int __init create_guest_cpuinfo(void)
> +{
> +    /*
> +     * TODO: The code is currently using only the features detected on t=
he boot
> +     * core. In the long term we should try to compute values containing=
 only
> +     * features supported by all cores.
> +     */
> +    identify_cpu(&guest_cpuinfo);
> +
> +#ifdef CONFIG_ARM_64
> +    /* Disable MPAM as xen does not support it */
> +    guest_cpuinfo.pfr64.mpam =3D 0;
> +    guest_cpuinfo.pfr64.mpam_frac =3D 0;
> +
> +    /* Disable SVE as Xen does not support it */
> +    guest_cpuinfo.pfr64.sve =3D 0;
> +    guest_cpuinfo.zfr64.bits[0] =3D 0;
> +
> +    /* Disable MTE as Xen does not support it */
> +    guest_cpuinfo.pfr64.mte =3D 0;
> +#endif
> +
> +    /* Disable AMU */
> +#ifdef CONFIG_ARM_64
> +    guest_cpuinfo.pfr64.amu =3D 0;
> +#endif
> +    guest_cpuinfo.pfr32.amu =3D 0;
> +
> +    /* Disable RAS as Xen does not support it */
> +#ifdef CONFIG_ARM_64
> +    guest_cpuinfo.pfr64.ras =3D 0;
> +    guest_cpuinfo.pfr64.ras_frac =3D 0;
> +#endif
> +    guest_cpuinfo.pfr32.ras =3D 0;
> +    guest_cpuinfo.pfr32.ras_frac =3D 0;
> +
> +    return 0;
> +}
> +/*
> + * This function needs to be run after all smp are started to have
> + * cpuinfo structures for all cores.
> + */

This comment contradicts with TODO at the beginning of
create_guest_cpuinfo().

> +__initcall(create_guest_cpuinfo);
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index 64354c3f19..0ab6dd42a0 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -290,6 +290,8 @@ extern void identify_cpu(struct cpuinfo_arm *);
>  extern struct cpuinfo_arm cpu_data[];
>  #define current_cpu_data cpu_data[smp_processor_id()]
> =20
> +extern struct cpuinfo_arm guest_cpuinfo;
> +
>  #endif /* __ASSEMBLY__ */
> =20
>  #endif


--=20
Volodymyr Babchuk at EPAM=

