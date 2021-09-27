Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099741A3BA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 01:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197300.350338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUzo3-0000GP-N2; Mon, 27 Sep 2021 23:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197300.350338; Mon, 27 Sep 2021 23:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUzo3-0000Do-Is; Mon, 27 Sep 2021 23:13:07 +0000
Received: by outflank-mailman (input) for mailman id 197300;
 Mon, 27 Sep 2021 23:13:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WuYw=OR=epam.com=prvs=990419b1bf=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1mUzo1-0000Di-Vx
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 23:13:06 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77e233ea-1fe8-11ec-bc60-12813bfff9fa;
 Mon, 27 Sep 2021 23:13:04 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RN3oTN022921; 
 Mon, 27 Sep 2021 23:13:02 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bbq9tg14t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 23:13:02 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB8013.eurprd03.prod.outlook.com (2603:10a6:102:21c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 23:12:59 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b%5]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 23:12:59 +0000
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
X-Inumbo-ID: 77e233ea-1fe8-11ec-bc60-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azWj0i0FTrFaL+NXMxE23idqUY66tExIdoyF0LVJRnukU2K7w78wYlfJ+iUGD0md7/eGs92Ik8Tn9iRtdcZOMwDJrde69BolSCAbB/ndodfcAf+6UGSgDvil3rkWGVgTY1Q98BAyORWfktvWQP4CATZwZpFKbRbF4EbZc1OTOZIS46StQBjhZ2DtGKwJ3gF4fCM1CrdGzuRaPCP6ycE86ozNE7LuGRgCDtibskHPKCBfiUc8eEFypSiYWyfq0U1nemmGs3+V5bdjA4c3XSFWjhERy3MvMjAPAeHXKxWyW/KcCFdL7Lf2MVCrkgLCrbqK9HM6phSLGbTijx8Lzf7DqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=holjH+HfB8CXCHfIgJ8fG7J1vTR3WfyEe4KZjexySjc=;
 b=hYu9nUurlw/HXaeDL/RyrYAgXNL36aFabdcYanwCiIFB6oCzNH8T2cThPsTIFlqxAgHnjs3Mkmpc1RFe9XKx4fne9pHJhjH1bCC9T+DFl9XOYKfEjydukRzKL6QkVhlUr89bNP8DFGwjEdkIL5eeMDGvnIcvmpmGba+WnkD22a/HCH8CyKmC9q3e9ExJKALp13WfwM68HAVVWj+C2o8i2JmtD4O5W78bnSD32J0Jc04vItxetTC9yzKtKflKEbUgB5i5HzxTJhcfPDyoT3yGgvP+8n73E5988T7729YEaC8497rdYID2OSkc/Oq0hv5Fy2HR8uIg0mI9zFlpS9Bdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=holjH+HfB8CXCHfIgJ8fG7J1vTR3WfyEe4KZjexySjc=;
 b=FKc/DaLkfRcK1sjmSY8CbSm04wf6vuZp7Uwr+wPh6N7zBJDtY0hwH3fw0o7TIuzwgRvhdcx1/sZtkAXDct3BlwAnTgPLt85QNx56MIrOhBh1rHKib0UgLokjWmCLq6k5CMMrOsPXwpeU9iFXCVvE92jKt9fxG66Js1uqGMt10e0Iq5En7qAKvUxgVPrfUhpi4ITRGZI2JnDdVavuKJfFTKC1EBik94pbThkR7ibnmWK+CrhM4rODoOBIVyNsOqqdEA+6/O2vJHeT2tiLeAGHcKTjdjdPxxaI5QFzBpiB7PpWbRemO5fnHacwMpWAG60EukCD/5KDQdczCHQNJJhpTw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
Subject: Re: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
Thread-Topic: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
Thread-Index: AQHXs6cvn7zQUNndCEOzhQWRkGM4Xqu4gvCA
Date: Mon, 27 Sep 2021 23:12:59 +0000
Message-ID: <874ka5sjd1.fsf@epam.com>
References: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b000a409-c351-42a9-2f36-08d9820c5931
x-ms-traffictypediagnostic: PAXPR03MB8013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PAXPR03MB80135B378CD2F5B27BCCC72BE6A79@PAXPR03MB8013.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ga6NMVOXyBBKKBXDlpObTEK25VNXU08BLXUyWxdHyh7p7+U0KRYPOg4Z5WLaKgJJiIfr1g3fbMry8Ml8I04EQ16p+ihc+g+rn6HhXiO4pw8zGFaC12CloAbvix9HEltw0S3GziwQAGCf/oayCMN3B2lZ6rs/K2E1o6PcLX7aic9oRoXPap0LwFeDKPkTumWiVGu3OEvUg8Sc/BvdIyPc9ioTHHW+bFRUp4+4Pw8n9kk4/qOqEXDCkWt91Dp95YnBi48e3Q/dD7uqRt7afDbyWeUmjvZMKTKtDrlfHYl/Lm65x+bSbBh6sUlkwz2ACQgxJUhtDvStwP0TWSKjIsLkoUbTKKgwEJsJWSj2vLVzMFh4vWoKibky4onPxh9L0AiAx0P+w5g6YNAHDq+1TEc70f76yc9H5B58P8r1x7CCmWILfQ4+zhvEkbAmTHlhFOTQuEAt0f5wS9CBVbNL90wmEaVzadGHQh+UxzHG/m1FwVJ5BjX6E6B59J4w23P2go7qppcrImWkeVef1GqDV40bGeB+IgUwCB+ktxrmyX+5Vm1aiz5PBNMfMZgDX+2VUMA0boxHIT0CZ33K4DShBz1QN3JMqcumRzlw4LH1LU1jy9mAMIqRqpLcXRU9DhmoASo4KeT/TmvGJgeTaPOP07WulJSEfWJwFX27mMlmio1ZxjhvHKHIlMzfqneHTquH+KlJRFchu5pW10TpmnD7qfhomw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(6512007)(6486002)(508600001)(8676002)(86362001)(36756003)(6506007)(316002)(2906002)(38070700005)(5660300002)(6916009)(76116006)(66946007)(4326008)(54906003)(55236004)(66556008)(38100700002)(64756008)(8936002)(122000001)(71200400001)(66446008)(26005)(66476007)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?YTOW39LzUDr2X+59xfNuCCfIm1SCumiSsXb+JX4nZOecvGpeVR1xQiGkNH?=
 =?iso-8859-1?Q?IA1f3rZ1UwYuqLIjGPVHtAXlqEO1hVQpdvLH/qIbjuuwbzLSWLgevQgy8Z?=
 =?iso-8859-1?Q?npReXwOENqgZfM0fKtrhr0S+MJ8o/SYGGdGNhtDbXa/4T90vn09Qj4u4JI?=
 =?iso-8859-1?Q?KyooUPUPyAP++ccPEa+9H3gOxxlezAjpNXc88qesaswFyTJhe1v5TPNmno?=
 =?iso-8859-1?Q?kp+55UKwsnTI4/SeB5ao1AS1w+/tH8wJD1y0Z9z1mZktZjbp/2U7xvcyLq?=
 =?iso-8859-1?Q?VYl+6zwU9tbtrhHhMAp4hewenZUlitwR0/Yg8uEFWujnb/LR1fj+zQAfk6?=
 =?iso-8859-1?Q?UyvpGztTWtDwh8lFFeNy5oinCG7a0HDcYCRi00H4eAlaCkOZy1b61l7Fad?=
 =?iso-8859-1?Q?l+vqjg/DvTS8oWjGjZtDezjCs/Iue66NIUSSsD2XhzyIDIDKLDUI9j873V?=
 =?iso-8859-1?Q?W0ESd+PWRSHUzVNaCAY1a4SbMz8n81VtLPt9Gjd3K4oaDXHHnHjtItYXfz?=
 =?iso-8859-1?Q?MjcY901EvU41uPNq2l7NxNkaDLdYTRTlIm57xWvnWexRqtWhuUHIn/fD/N?=
 =?iso-8859-1?Q?gGgASJiP6PDTf9fuBWUMKMT+FJ2qR4yfJGDKDEKnhAX9e4GZ3XZus9hkiU?=
 =?iso-8859-1?Q?6rKcwPdWuV6i1OYjik7r+Nb6jroTgbQXwFNRLSlATe8sE+SAtaBJkeBHbm?=
 =?iso-8859-1?Q?AVszmtmPvuXyf2gl93KbpUpRwrliAn9NVyn7Zklh08OcanYqXg1VNyswSB?=
 =?iso-8859-1?Q?B8YwRuOocm1+hfNMyvFSefoNQwjx6zouQA7Ce6OUgYfevOpu2xMNQfj5Pd?=
 =?iso-8859-1?Q?CpnRiMB9PCccfkaZ7c8fnfLK7og10b1po/ILo3h16RQUIKCPbUplIBiFdz?=
 =?iso-8859-1?Q?5KPpgVRIuEz8pf2ZaKP7IDediVPTpRwqAlt6K9zPLAonRTkOahNqbr0isb?=
 =?iso-8859-1?Q?/2x5x9JZeKCICYmT3K0xQBVcILyOVXIb9M2ggqin0eVOz2ZvC3hXe0sZVE?=
 =?iso-8859-1?Q?xxhat3Eps1Dbg+GYgRF/qP71WND3Ajq4JBF0G7nbb5RChoUhMVom3y4eGV?=
 =?iso-8859-1?Q?M7njE2SBPMvQt/PBS7CvZl4+KYkuqDn9veZFrKScoCzfV214pOaeyQAtDQ?=
 =?iso-8859-1?Q?V1N96AeehCN9NfooHqlLKADSLMtxmjlvcUUVfPe76pEdz/fFQXObbVPdB2?=
 =?iso-8859-1?Q?giX8SOjgw4FF1N3YvWwcMPi/RjGdlBueDhg9AijOr2NuAzPIRUvH0Acvpz?=
 =?iso-8859-1?Q?xnN5+AcLlgrXYXU/xymm/Yh4voDcQTzPBnv9DSVYipJ1L4EIMkNUVME9Xz?=
 =?iso-8859-1?Q?tuZr8y3aO0GFgcsHUApbfv+ogd9u3VBqBTz3Z4TLGAb8HZ86sOVkY9r390?=
 =?iso-8859-1?Q?Vrp7DYJ8xv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b000a409-c351-42a9-2f36-08d9820c5931
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 23:12:59.6453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2W2vNbPZP89od0oz3Gf/wM0shEmL5Ovv1ROSyWMftZtoi8yjSxcx9leEKy33o40SM8UJeDa+gOo4H22V6pDKqMMqZnP7EiVXiEaXmjoYGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8013
X-Proofpoint-GUID: 5tzVb_ET1UP5xDQKnpjWUgr3bVJneTWK
X-Proofpoint-ORIG-GUID: 5tzVb_ET1UP5xDQKnpjWUgr3bVJneTWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=940 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270157


Hi Oleksandr,

Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Fix a possible copy-paste error in arm_smccc_smc's first argument (a0)
> for OPTEE_SMC_DISABLE_SHM_CACHE case.
>
> This error causes Linux > v5.14-rc5 (b5c10dd04b7418793517e3286cde5c04759a=
86de
> optee: Clear stale cache entries during initialization) to stuck
> repeatedly issuing OPTEE_SMC_DISABLE_SHM_CACHE call and waiting for
> the result to be OPTEE_SMC_RETURN_ENOTAVAIL which will never happen.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> I wonder whether this patch wants backporting to the old versions
> since OPTEE support went in.
> ---
>  xen/arch/arm/tee/optee.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 3453615..6df0d44 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -1692,7 +1692,7 @@ static bool optee_handle_call(struct cpu_user_regs =
*regs)
>          return true;
> =20
>      case OPTEE_SMC_DISABLE_SHM_CACHE:
> -        arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
> +        arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
>                        OPTEE_CLIENT_ID(current->domain), &resp);
>          set_user_reg(regs, 0, resp.a0);
>          if ( resp.a0 =3D=3D OPTEE_SMC_RETURN_OK ) {


--=20
Volodymyr Babchuk at EPAM=

