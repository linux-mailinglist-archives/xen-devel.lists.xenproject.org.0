Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD4569C3B3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 01:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497910.768688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTuFu-0005QH-Fn; Mon, 20 Feb 2023 00:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497910.768688; Mon, 20 Feb 2023 00:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTuFu-0005Nd-CO; Mon, 20 Feb 2023 00:42:10 +0000
Received: by outflank-mailman (input) for mailman id 497910;
 Mon, 20 Feb 2023 00:42:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNad=6Q=epam.com=prvs=6415815d8c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pTuFs-0005NX-GC
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 00:42:09 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6434a12c-b0b7-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 01:42:04 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 31J505nY014692;
 Mon, 20 Feb 2023 00:41:50 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ntppmqgyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 00:41:49 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB8276.eurprd03.prod.outlook.com (2603:10a6:102:23f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Mon, 20 Feb
 2023 00:41:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6111.018; Mon, 20 Feb 2023
 00:41:46 +0000
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
X-Inumbo-ID: 6434a12c-b0b7-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVjh/qpFqJTahQpIxXgqgSrZqraK63YVC7FaCr3aa/dq/xVtMjkLq/EJlAXHty3ksYOLYk7iL9Tsgwr8HLmBrucNbIDqyyw+Gp2a5rZtaXq0IKr1uhRcKg908SIhAEybhSZeRzhcNr556D1SIMqvku1uJgGayfpLI9BY/byQGX5IkLc/71aSciLbm+2qwbgIeEJu95T7YR8JLiyJjXyerXaGyBjEuoN5s74wBeNYMbpaOWqukRdX9cgzn2BDrtQkBAhRzFvJ7upU2xjvdFFTPkPsjy/vauVD/9d1kRqaMpeLjIW2CBiDYrlltMppn7+ZMrJC8shHHMbm4l9WHWq9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm/x4gMFk9mespj5XNY7cCddxNQ9zxoscHnKGXOrl2I=;
 b=DqBZXuuw9X6Oj7oZI/48qlJgPsyvG/L4UReX+QdCdaPu2GSQW2MHmu4hO6dcAU2Fnpr/PkHIzig/12H6PQyUAWNq2iyQWMy42E70LXQqrUvJ+iO3IT5O5u5gxQzM3vycuRllaRSZBOyKJn3gpMg65V4Ry84Cr9TyG+E+DgW5TLC4RH9GtWj0pRyK3GE6S2JEjRWhXhnSpx/cF1XUGh/Dz78juwWRHW1b6+/OwbG8pAs/C9RVgQSVK/D3B4t1Haq9B6xt65xMC/e7CcVl4zAd4K/p2mH+UrBv5i+ao3jwsJKGM4ZAqjIAkT6ZciMwy1NoCJPgLI1LM35+IXunPM7Oqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm/x4gMFk9mespj5XNY7cCddxNQ9zxoscHnKGXOrl2I=;
 b=IyCErNKC6x6JhYk6jlyivkIV7BzYOwMcexoZk80V0gLShiaizqfoFR1i5ZiEmYdEK51EnMhMCTh1K96OV92wfhOdpjvUI+hC4PZn9w+dpjkRbbv4fptYAlcLeiZW/l5m5QEiyqP86k4ZNtNsi4MV05xmWzYb59SZuSY7pVFflNqiA9Renn6EAuho29aeJ38EInTkhIX4uL2aU7eVB31n14J7ltnl1xdlgdczpKLLFZwExpqtl1r4B+/yI7a10rHXyC36N6vM81DG8YKkrRnUWimcEEDxlycqLFhDwJaYSY+1RfWBNVpIgo/eMZNps1Tl41mACq0OX+vlaDBeVnCRzg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Kevin Tian
	<kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
        Paul Durrant
	<paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 09/10] [RFC only] xen: iommu: remove last
  pcidevs_lock() calls in iommu
Thread-Topic: [RFC PATCH 09/10] [RFC only] xen: iommu: remove last
  pcidevs_lock() calls in iommu
Thread-Index: AQHYvUOAlPa0wkGiakOWSGDBM2amAa6z93GAgCQS54A=
Date: Mon, 20 Feb 2023 00:41:46 +0000
Message-ID: <87edql183b.fsf@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-10-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301271733240.1978264@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2301271733240.1978264@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB8276:EE_
x-ms-office365-filtering-correlation-id: 3b54ce26-d1ee-450f-2b19-08db12db3ea2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /H1dKnp/4P8KwVb9U3MIwmz8YuzzpAy1Yr44/ri9l5jztDJaH/aHPH1SJzodqX2hZHyWLawPebPG5frN1DSqDhLHq3gmQqtyoj0Dsc6jZm/xICay+WzXTOKas2UQnz6qsPa+y7nj/lEuYK9qCbAgxPR3uaywEg2/UznbdWJIy6zTsY8XaD3/6tYaxF8uqL4wDv5x9Zxmx/A3NIzURIz8Hy+g3XzOCaQ78mtMWow//rod8bnRWMfw1F2elSwKS1AvDprcJsZULQkZIgZsf01wNmGYxH839RYYMQF7r1kNJ666QfY1+6I8sf2yZm9SdwceoUsrdT2pR1Bn6qauCY5gTGoPD5oUarYY+XpurndVNXmfShNO0PWKSLuK6N+mAnHrEfXaAnqoClUBTTTKtLieOrZCN7OUGvRU52HLVS1Rtc8rF57IXc5XnAA7JH70IwaOmbQxmdsX4nfcc1/8hbTYZd/8XOnOkUC+ilmLscFXtIskLLkmUv5VjTv8N4ebODutQFfPGJDusUMgw5asJvbB3xCvTiU//7IaHxgJqGmorfxdSXD4gn3+01HxcbiJxgntUpib4CRVuJqeeb8/R1vKZBLSrP3ZDipaWx793JpsNdR3MVAkdbksJ6EJQnrq5cJ5dvDB30Rs4Ug5KUQ9eBv3SQ5e2Cm+lq1VgBnL+VJNOHKVUYHLmrTENZ3HKeF54wf3oXawmG21L1RY/T+v4QlPlw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199018)(41300700001)(2906002)(38070700005)(6506007)(36756003)(4326008)(5660300002)(8936002)(316002)(55236004)(91956017)(6916009)(86362001)(54906003)(66556008)(6486002)(64756008)(478600001)(71200400001)(76116006)(66476007)(66946007)(8676002)(66446008)(122000001)(38100700002)(186003)(26005)(6512007)(2616005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?fYt4tnP+koUKtli7oilb2HhpEZs9GTTQF62pNf8+T29KrxphpMnIs7Cjsf?=
 =?iso-8859-1?Q?1yM8i+r05RmZoGU5xn9Ytxr2R3vjesz5Odzos2wyNmKtJvVBrwORiIlhsh?=
 =?iso-8859-1?Q?urCKku4dWwkQBSj881DWNCnOE+WmvWd8NxwmGSh37kFXaOHynSumKsbgoT?=
 =?iso-8859-1?Q?Xpnb3Xjfat23JFRA4xx61LdmCRMWqIF9Wfz9ZPeMkbFhH9WisrEbB2G/HZ?=
 =?iso-8859-1?Q?yb6FX8iAztiVFZ4Jjn64e4F8HpEmPf1j99fSpRIfHGhWu9Fby2pPbnXiV+?=
 =?iso-8859-1?Q?Fh9GPzMKvnNAHWpZDOJxoYiMmJhMK3Ca/excxnRp6ZOfOs9lMHQ9F5jlea?=
 =?iso-8859-1?Q?rlAvvoc+Cz3+Bo9pfz2ej8zZNnH9CdMazXT8Ej4vH61m05TsFMeDynhH4O?=
 =?iso-8859-1?Q?fMjBTZdbUkG74lmINFb4PFrOD4S9zy+48QqrUnM7OmqndRrdcp5vR9bMNE?=
 =?iso-8859-1?Q?DDDs5XMejG9/2swHy/cfYn6D0hvNtZXeAwqQIUwFpsYUNSIyer0pYk7nEF?=
 =?iso-8859-1?Q?5t7S7TJFoxmV2ajOvRd697HOLNBuVc+HT0aUP8hCV+q/DnsPr1NcK4lo4S?=
 =?iso-8859-1?Q?z7pavBAhoiUkCDoZdxIw5SiL1xD/7F7jZxRHj7zTr2vLLCKss01Sx4qU42?=
 =?iso-8859-1?Q?0B5J/GdgIFs6rcpg51IJ6klKF0TSOYikI7PGVIbNs+io2j/93BXhr9DhRG?=
 =?iso-8859-1?Q?ttegQZZG8SLz+ZVvayA+mgWxy0GjVbh7x1CVG7H11YMqWiBRU+YYYMZyOT?=
 =?iso-8859-1?Q?vBksRYhGmvncvk6pWvpoF5XX3Avp/EOJPWd2VDeW6dxhXUezvQPhH1NuQ5?=
 =?iso-8859-1?Q?c9LmCCfpkguIm7MqqQnQnn9gziSAEksP4EKyzejxSKkWgYw3EA0H5owbPO?=
 =?iso-8859-1?Q?aUHl+2aomt13UgWF1sH8isYMaHbpxd9Ono7NxvJMilcYVz85jht2PNv8KE?=
 =?iso-8859-1?Q?moO5zjpmPS1Z+lLRJkJBknUUEPp/CThTI6XKJFnUtUZQSOjTxO4ZS+qkec?=
 =?iso-8859-1?Q?tcxRFukp/YIXvNm0D1fbRw9Tly61Ec/cY01LbmlVQtMhDBclp2xn9tKWLl?=
 =?iso-8859-1?Q?ss1EIDmFUlMeuSCzhErbNLolabr44/P8/YaM5lIuJztQvN2z+1chmlY7pd?=
 =?iso-8859-1?Q?LoJ0Yb1Jc8JGWdUNxzyFqVK6dlHQemHOIyEnnqMZ0bcFq3EpHK7l/O5uEq?=
 =?iso-8859-1?Q?OIEHZbgMUCqsOXR3NMA6CPpUUodLQGa+4MSUkzcA76N8e3/Bz7Sprm719/?=
 =?iso-8859-1?Q?JB3y387hRwa25pvfcQkkjS/XcxtehAl3MOTLJCMt1fctZJdf4DWG+O8Zmx?=
 =?iso-8859-1?Q?Ljo4eo1IdU1rg0k7djHkGEaUES30A7tG1wTVuYLKcw/B8KRLZygZPWVaik?=
 =?iso-8859-1?Q?oc3N63A0fGSrC6bzg2A5954BNP/JscHUxpjE3/zgl8Vo5XUCes4BeC8NmV?=
 =?iso-8859-1?Q?lV8m0MJfUk9L7FpucyDhUmcWzevapohEGqmG2yCmh9MfX++rNCU/gdoECK?=
 =?iso-8859-1?Q?sb9XO8y3Td0bwGHYSDlv1biQ3lKwXFma6zh6OaROaluP2Oc8aFkhAXvevz?=
 =?iso-8859-1?Q?KHqvdlUanecjIRh8uFXbmE1IHk609aPBdWy93rVmMtWKRmVsQdP0GfrIDK?=
 =?iso-8859-1?Q?i+DzmkQOYD2oPbOYa4UkxaIRFmy73uxTORg7R4ExzmZ6jK3Y7m4UXkEw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b54ce26-d1ee-450f-2b19-08db12db3ea2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 00:41:46.0541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pB7zQLE6g2ObiVMhQYc7oI+y5NxAA7umRaMjd9FlaqCOKyPPlVniN5wuRtoxxSZUFRf1jaSqAT8OxyVlVGIDA+Eblv8s5MurUfOjuzf433o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8276
X-Proofpoint-ORIG-GUID: 3CBTkM29f9pi-DIAanTOl-sfzVnavuRR
X-Proofpoint-GUID: 3CBTkM29f9pi-DIAanTOl-sfzVnavuRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-19_15,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200004


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> There are number of cases where pcidevs_lock() is used to protect
>> something that is not related to PCI devices per se.
>>=20
>> Probably pcidev_lock in these places should be replaced with some
>> other lock.
>>=20
>> This patch is not intended to be merged and is present only to discuss
>> this use of pcidevs_lock()
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> I wonder if we are being too ambitious: is it necessary to get rid of
> pcidevs_lock completely, without replacing all its occurrences with
> something else?
>

> Because it would be a lot easier to only replace pcidevs_lock with
> pdev->lock, replacing the global lock with a per-device lock. That alone
> would be a major improvement and would be far easier to verify its
> correctness.

This is the aim of this patch series. We can't just replace pcidevs_lock
with pdev->lock, because pcidevs_lock() locks not only PCI devices, but
a PCI subsystem as a whole. As I wrote on the cover letter, I identified
list of things that pcidevs_lock protect and tried to create separate
locks for them.

>
> While this patch and the previous patch together remove all occurrences
> of pcidevs_lock without adding pdev->lock, which is difficult to prove
> correct.

Previous patch removes occurrences of pcidevs_lock() in places which are
already protected with new locks. Sometimes, this is d->pdevs_lock,
sometimes it is sufficient to call pcidev_get() to increase refcounter,
in other cases we need to call pdev_lock(pdev), ...

And goal of this patch is to discuss pieces which left. As you can see,
there is no pointer to pdev to lock, this code does not traverse
d->pdev_list, etc. So it is not immediately obvious what exactly those
ASSERTs should protect. Maybe, they were added by mistake and are not
needed, actually. Maybe I missing some nuance of x86 IOMMU workings. I
really need maintainer's advice there.

>
>
>> ---
>>  xen/drivers/passthrough/vtd/intremap.c | 2 --
>>  xen/drivers/passthrough/vtd/iommu.c    | 5 -----
>>  xen/drivers/passthrough/x86/iommu.c    | 5 -----
>>  3 files changed, 12 deletions(-)
>>=20
>> diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passth=
rough/vtd/intremap.c
>> index 1512e4866b..44e3b72f91 100644
>> --- a/xen/drivers/passthrough/vtd/intremap.c
>> +++ b/xen/drivers/passthrough/vtd/intremap.c
>> @@ -893,8 +893,6 @@ int pi_update_irte(const struct pi_desc *pi_desc, co=
nst struct pirq *pirq,
>> =20
>>      spin_unlock_irq(&desc->lock);
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      return msi_msg_write_remap_rte(msi_desc, &msi_desc->msg);
>> =20
>>   unlock_out:
>> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrou=
gh/vtd/iommu.c
>> index 87868188b7..9d258d154d 100644
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -127,8 +127,6 @@ static int context_set_domain_id(struct context_entr=
y *context,
>>  {
>>      unsigned int i;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( domid_mapping(iommu) )
>>      {
>>          unsigned int nr_dom =3D cap_ndoms(iommu->cap);
>> @@ -1882,7 +1880,6 @@ int domain_context_unmap_one(
>>      int iommu_domid, rc, ret;
>>      bool_t flush_dev_iotlb;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      spin_lock(&iommu->lock);
>> =20
>>      maddr =3D bus_to_context_maddr(iommu, bus);
>> @@ -2601,7 +2598,6 @@ static void __hwdom_init setup_hwdom_rmrr(struct d=
omain *d)
>>      u16 bdf;
>>      int ret, i;
>> =20
>> -    pcidevs_lock();
>>      for_each_rmrr_device ( rmrr, bdf, i )
>>      {
>>          /*
>> @@ -2616,7 +2612,6 @@ static void __hwdom_init setup_hwdom_rmrr(struct d=
omain *d)
>>              dprintk(XENLOG_ERR VTDPREFIX,
>>                       "IOMMU: mapping reserved region failed\n");
>>      }
>> -    pcidevs_unlock();
>>  }
>> =20
>>  static struct iommu_state {
>> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrou=
gh/x86/iommu.c
>> index f671b0f2bb..4e94ad15df 100644
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -207,7 +207,6 @@ int iommu_identity_mapping(struct domain *d, p2m_acc=
ess_t p2ma,
>>      struct identity_map *map;
>>      struct domain_iommu *hd =3D dom_iommu(d);
>> =20
>> -    ASSERT(pcidevs_locked());
>>      ASSERT(base < end);
>> =20
>>      /*
>> @@ -479,8 +478,6 @@ domid_t iommu_alloc_domid(unsigned long *map)
>>      static unsigned int start;
>>      unsigned int idx =3D find_next_zero_bit(map, UINT16_MAX - DOMID_MAS=
K, start);
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( idx >=3D UINT16_MAX - DOMID_MASK )
>>          idx =3D find_first_zero_bit(map, UINT16_MAX - DOMID_MASK);
>>      if ( idx >=3D UINT16_MAX - DOMID_MASK )
>> @@ -495,8 +492,6 @@ domid_t iommu_alloc_domid(unsigned long *map)
>> =20
>>  void iommu_free_domid(domid_t domid, unsigned long *map)
>>  {
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( domid =3D=3D DOMID_INVALID )
>>          return;
>> =20
>> --=20
>> 2.36.1
>>=20

