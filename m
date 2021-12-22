Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441D347D31F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 14:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250837.432013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n01sW-000300-2C; Wed, 22 Dec 2021 13:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250837.432013; Wed, 22 Dec 2021 13:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n01sV-0002x6-UH; Wed, 22 Dec 2021 13:41:59 +0000
Received: by outflank-mailman (input) for mailman id 250837;
 Wed, 22 Dec 2021 13:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rHP=RH=epam.com=prvs=2990e6cae6=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n01sT-0002x0-AQ
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 13:41:57 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb5fec27-632c-11ec-bb0b-79c175774b5d;
 Wed, 22 Dec 2021 14:41:52 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BMDDPf1008959;
 Wed, 22 Dec 2021 13:41:47 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d42nh8j9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 13:41:46 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7183.eurprd03.prod.outlook.com (2603:10a6:102:105::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 13:41:38 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 13:41:38 +0000
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
X-Inumbo-ID: eb5fec27-632c-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kf4Z5+G5S17EiSKPgSXH4B9eKLEfCpjPYFZL0hg8L4A3NoYM1pfl/P6qC1+j51z580Kbb8TRKxCtky/ttQtyMB5fUxONVvQSLkdyn5JDvur+M3BY7KdgJsMNxGD0EywY/hKn7Etg5tPgs3SxWbsnfOUYrd86Lvc8/w4e5VYbMnmq+j/eQDtfkbwV4+gqZjhVv1e2UPoWNSsBAIkKV4sZWx/5SgAJHbJNtu9q73o6/+UEOeKze0wjZ+eZ+p41iJwcXi7xIhXvXY5gh43smFWbAe3VzKwsXUHtqOUcYkKxRH9eG4e+IznkEXcVXnjBXUu/pTGcCf080/uaDJgaCEJ3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4Q3znZPg3b8lhI6948LAFtsV5cw9WrZs6RZfilHXas=;
 b=I7Jz4zfXhnf4CM2MayX8Qo5QF2l5qedGyveoW2a/zggADabvVBFhssn0nJjh/0SQl8gv2lXIzOItc7EEDAi1DG6Xe6G0T8e86tBjMUqn894m9uFTBrFnBN2u3ayIzCnLiXkLKLMc2VnZJ1OD0/IGi+5DABKoQPXmwoGwcZA3wIwTditA4Cap+5Lm+JqZDs2ogwd4HO0maZz19uZRrGPsdlC15pff0TupBmWa8zfW3jF48p+y5Y6T0OX6+PuuHhEEhQXdF6gdQNuliC+XCotwGUZ6eQXLMnMbODPGcL1/JlDHdgyNzT1HvPakcQ/K9Ti7q8jGnTHlOkLO51ECD1bOZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4Q3znZPg3b8lhI6948LAFtsV5cw9WrZs6RZfilHXas=;
 b=p+Z/tE91r/taCk6JufBb8k93343yrRj2+0p1Y8K17fPD7i9spPJRGRasaMwC8PbYcw2TkVb+G5N9UxyZD3XQcU2oRo7M68cFhH8PAhBilDgKiqpTtsIrUMDrKC3t7JngwS8Y1ESnUNSzqDW+pfYWvHmyFaA2oit311zmIVwuGJZ0IoDE3+GfhLes+pbHYQRpYg1JvDTkjZNVjizh4gNnX9Xf/4bW359b7VwBnSXw8ZXlZs8oQcyIVm3zbdv7wor9sqSHInGCmCCKVD0Z56HYKoVK5FJW9whV6ixXp9cyLzD4GOqZheg4SzjaRwXSpO24x3eauA8ftmz/Yj31YQYPCA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: AQHX8M3LpzWz4l8PQUiIA2nAUV0H+qw8NR4AgAJcjoA=
Date: Wed, 22 Dec 2021 13:41:38 +0000
Message-ID: <20211222134137.GB2926395@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112201703310.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112201703310.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3844dad-b418-4755-cff3-08d9c550c76f
x-ms-traffictypediagnostic: PA4PR03MB7183:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7183D66CBB62E491EE86BB30E37D9@PA4PR03MB7183.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P7Is41V0QUZ55xQ0JlXAKW73QIxA8bNF2j9NXDbOQQ8PIGvz76o0oMjLGzE6Zjx7F6QDM38y57gahjpkeMB6owVl3bkvU4wajNAxyuClhbZTTc6oz0JZSYuYN0LbNzq56pVa91e4uRSpE0JnshRc4do5zVXKIHVhQsBg67xQoYYcK6N5sIjHcSR5lcgI/SdVcJA7YO/Scs3G/KItqCvpIv+gwJAlICrKK4aAVyerYn0nMNEdIaHzfJMUvjgT7ceMhrcRDnahamPMmssW5k8i2xZ5ho5wixcjY329iAXng/M6jxNFSqB+7faXqaRwLNw2syQxbbeDrPtFXYE1DSHBMT1crFoQwg+XrlCaUYoa6UTdLHd4U7oICwa33zSQxPQ5ZYyqXic9uHtdylETY7Y4gp3WYGkcTxX38Y5wGiDoDwHJJvGKiGoL5z0NOuR2mUbHrN9fzJXZruVl2Wh8Ht7kOYNX49eYw5VGevUPknPkZkMLuJCEy4aRglvCRjmva6o1XnCCv6i+FJjwd4PCuUwm3UEwfZTctWtkv2BZtLttqFDv4fswKIvQKOHSxXbFLScC2lAnfQ2BEOt3Cl6pKb8f0eDQ+F+cbcGKCbJ96XJEJULimnLFC94P2QlH8+3blQqj7KDENJDh3fafHZfFM48F2XzuisPkr6arcENCBaS890QU/1G8CcN4QUDwIRPGzOVvSb2vnguh0nyIWgyKu45GRQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(66946007)(71200400001)(8936002)(66446008)(66476007)(76116006)(91956017)(9686003)(6512007)(33656002)(4326008)(1076003)(8676002)(66556008)(54906003)(508600001)(316002)(186003)(5660300002)(64756008)(122000001)(30864003)(38100700002)(38070700005)(7416002)(26005)(6506007)(2906002)(33716001)(83380400001)(6916009)(86362001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?unad6hD36gd7wsD8631ynJnt3qqGRTy0lyCKA1BCx0SmHB0dfUjKdmR3zxk3?=
 =?us-ascii?Q?2hzqn3obn4QSMSl0NITFRT5U89XSwRYlcGfcUJqNJBrCjIDB9bQWeBflGcNm?=
 =?us-ascii?Q?J34w9IIRvp3Nr2wyitmkdl6ydrNEXkK3ztqQxAtOpsIefNBKPWYjmZr+Se96?=
 =?us-ascii?Q?7BxCbRzLKZ49Wmuw67z0v1g7Hg0Tsc96/QuwK5L3Yqr0PbTo/yZr/HH/tvwg?=
 =?us-ascii?Q?y0OasR++VDQX6BBOev22KqkuqP6+34MTN8frlusw2V13k1uIJvwOU/xr7cqo?=
 =?us-ascii?Q?RCq3Ndn+6dR5vZTT5dGSwla01st/4Of6sJXwMH0zqma6+phEkL1kft0a8+D2?=
 =?us-ascii?Q?lWHcqRPanpMUOCls5+S81Tn+qldZ5Ev2TqdkXB4Pcul6wQzYXKl2UU6zhKTk?=
 =?us-ascii?Q?5wkkZCjOFP2LLR0PfKZFfd50n0r69oYtQEhGToi7zEwy5HJZ2CuZyafNluxG?=
 =?us-ascii?Q?GsZu9Drd4jSYh8ZAFeWp2pe+X6tuCKeq94P4DjT293PRRlCA9QO+lsRmaHRc?=
 =?us-ascii?Q?kLy0oKz9RAPmUms37veLAVArsY+n+WCyiqdZFk3hKGYLBWfM7AQcg3CH4XZp?=
 =?us-ascii?Q?zVRlTHp+m66q8MVihpu1b5ov0lXD6HYznENoW/9kGhbXHH0IYTGt+zm6PUtE?=
 =?us-ascii?Q?rk0DqV7Jh2JwP8f8N3B9QgCz7yFO46pC40nRJzhgR1IXt5/xjsHV2mD6jitd?=
 =?us-ascii?Q?gcgdJZgUmDpv5zUuSQTMkAcyQdPMpWK9IpIWBTMAk8kUxK78lF1awxa6GT7X?=
 =?us-ascii?Q?ymq4U2te7/o46B1N8R0E181eWY7Ac+GMkqs+18cbsAbWxkKUaS5PvPbUEKmH?=
 =?us-ascii?Q?3mTRnkax5UPk80XJBuovksR6CC3e7/ltS2ovDDCNs4bpr2agTQclfv3HMNZ8?=
 =?us-ascii?Q?J1JvMDoBYWJpkri9cPW5PtMKyEnZminpreGapCyNn7qJ91kugYJ3mM32L9Fa?=
 =?us-ascii?Q?dtUD8xeYUxpHxNe48X7oJOHSi2Nm+wqPXW64wCNiRSxjwBqVmB79GTEEsLtI?=
 =?us-ascii?Q?+hh06ExU0CFBUe6iiOuEX7hJLPafL3CngVznieXXj3B4wOHqcCVLknhOnrbP?=
 =?us-ascii?Q?P991MTQJQ8u6AGHaDlyNtXHausHkhNCaJknZnLsI8Q8w7+umvXY7qNZSUMei?=
 =?us-ascii?Q?A65ORhUXzrU16JXISGVY54IhExzRWaWbVBXCkFMyfn3HyBEvFsF9bm2bdCN9?=
 =?us-ascii?Q?YBdymQRNhTkYuVhoaHY+Fa6EP+5O0pYqZWG8UHOjKJWVMRNx4bffrXDhhhq9?=
 =?us-ascii?Q?RYkIDflzHGDCbpTD+fAVAGyz3Kw6nImzaNWaX+MPONWciXJptewLT1/a7NOI?=
 =?us-ascii?Q?UDWgMxV68taU2ljU5ORd+i0LtbZydwq28+Sk7kwkd+vZ0Oy2d27MRHi1iAGd?=
 =?us-ascii?Q?4cm/4Jjy6sOSuExkCUpL+X8fcKTovFc5sX9asg47J83JrZOy+TtmGnpRSP+s?=
 =?us-ascii?Q?S6wLywdrr6v1QjB0fktUH0okMS+hvOTZHN+k8kW7wdXLMiJCAYjZ3eC6YeDQ?=
 =?us-ascii?Q?O2N+St9tjjFP4wCZPUmyoX8C2Z5Z273G+/zT/a2QGCiezA0iUtzsXb+6xSRt?=
 =?us-ascii?Q?EDxbCmxLpAkyR+uSGZsr+b88QqpyXOirGGrfgJKo08/dwOBMiuFLmgHPAXwf?=
 =?us-ascii?Q?LuEuAr5voRzCq86bm0oqW86OUQS/cvxyIrr3xZ5d9FoiafWev4h7NYPnCHbn?=
 =?us-ascii?Q?bl/Hkb2b9iJiwfGiQ/TIe+ZRPZs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5AA8B99BC110B4791E172D501FD63E9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3844dad-b418-4755-cff3-08d9c550c76f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 13:41:38.2591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0EW1JD2zB8DZBU+KVYWjEl+fToME509RvE2elkFRpNfMqLHOpAlwYjz9AsP/5GU3G7j/od0FQaa4ccXDGFyMsS54egvvqluA7xM7ehs+cQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7183
X-Proofpoint-ORIG-GUID: AmkPZJDIP7YEErS_O4yFn5bn4Tq8-RNd
X-Proofpoint-GUID: AmkPZJDIP7YEErS_O4yFn5bn4Tq8-RNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_05,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220076

Hi Stefano,=20

On Mon, Dec 20, 2021 at 05:37:50PM -0800, Stefano Stabellini wrote:
> On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > Integration of the SCMI mediator with xen libs:
> > - add hypercalls to aquire SCI channel and set device permissions
> > for DomUs;
> > - add SCMI_SMC nodes to DomUs device-tree based on partial device-tree;
> > - SCI requests redirection from DomUs to Firmware.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >  tools/include/xenctrl.h           |   3 +
> >  tools/include/xenguest.h          |   2 +
> >  tools/libs/ctrl/xc_domain.c       |  23 ++++++
> >  tools/libs/guest/xg_dom_arm.c     |   5 +-
> >  tools/libs/light/libxl_arm.c      | 122 +++++++++++++++++++++++++++---
> >  tools/libs/light/libxl_create.c   |  54 ++++++++++++-
> >  tools/libs/light/libxl_dom.c      |   1 +
> >  tools/libs/light/libxl_internal.h |   4 +
> >  xen/arch/arm/domctl.c             |  15 ++++
> >  xen/include/public/domctl.h       |   9 +++
> >  10 files changed, 223 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index 07b96e6671..cdd14f465f 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -1238,6 +1238,9 @@ int xc_domain_getvnuma(xc_interface *xch,
> >  int xc_domain_soft_reset(xc_interface *xch,
> >                           uint32_t domid);
> > =20
> > +int xc_domain_add_sci_device(xc_interface *xch,
> > +                              uint32_t domid, char *path);
> > +
> >  #if defined(__i386__) || defined(__x86_64__)
> >  /*
> >   * PC BIOS standard E820 types and structure.
> > diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> > index 61d0a82f48..35c611ac73 100644
> > --- a/tools/include/xenguest.h
> > +++ b/tools/include/xenguest.h
> > @@ -242,6 +242,8 @@ struct xc_dom_image {
> > =20
> >      /* Number of vCPUs */
> >      unsigned int max_vcpus;
> > +
> > +    xen_pfn_t sci_shmem_gfn;
>=20
> We should be able to avoid introducing sci_shmem_gfn (more below)
>=20
>=20
> >  };
> > =20
> >  /* --- arch specific hooks ----------------------------------------- *=
/
> > diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> > index b155d6afd2..07bb390e17 100644
> > --- a/tools/libs/ctrl/xc_domain.c
> > +++ b/tools/libs/ctrl/xc_domain.c
> > @@ -2206,6 +2206,29 @@ int xc_domain_soft_reset(xc_interface *xch,
> >      domctl.domain =3D domid;
> >      return do_domctl(xch, &domctl);
> >  }
> > +
> > +int xc_domain_add_sci_device(xc_interface *xch,
> > +                              uint32_t domid, char *path)
> > +{
> > +    size_t size =3D strlen(path);
> > +    int rc;
> > +    DECLARE_DOMCTL;
> > +    DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN=
);
> > +
> > +    if ( xc_hypercall_bounce_pre(xch, path) )
> > +        return -1;
> > +
> > +    domctl.cmd =3D XEN_DOMCTL_add_sci_device;
> > +    domctl.domain =3D domid;
> > +    domctl.u.sci_device_op.size =3D size;
> > +    set_xen_guest_handle(domctl.u.sci_device_op.path, path);
> > +    rc =3D do_domctl(xch, &domctl);
> > +
> > +    xc_hypercall_bounce_post(xch, path);
> > +
> > +    return rc;
> > +}
>=20
> I'd skip this xc_ function and hypercall (more below)
>=20
>=20
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_ar=
m.c
> > index 5e3b76355e..368a670c46 100644
> > --- a/tools/libs/guest/xg_dom_arm.c
> > +++ b/tools/libs/guest/xg_dom_arm.c
> > @@ -25,11 +25,12 @@
> > =20
> >  #include "xg_private.h"
> > =20
> > -#define NR_MAGIC_PAGES 4
> > +#define NR_MAGIC_PAGES 5
> >  #define CONSOLE_PFN_OFFSET 0
> >  #define XENSTORE_PFN_OFFSET 1
> >  #define MEMACCESS_PFN_OFFSET 2
> >  #define VUART_PFN_OFFSET 3
> > +#define SCI_SHMEM_OFFSET 4
> > =20
> >  #define LPAE_SHIFT 9
> > =20
> > @@ -69,11 +70,13 @@ static int alloc_magic_pages(struct xc_dom_image *d=
om)
> >      dom->console_pfn =3D base + CONSOLE_PFN_OFFSET;
> >      dom->xenstore_pfn =3D base + XENSTORE_PFN_OFFSET;
> >      dom->vuart_gfn =3D base + VUART_PFN_OFFSET;
> > +    dom->sci_shmem_gfn =3D base + SCI_SHMEM_OFFSET;
> > =20
> >      xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn)=
;
> >      xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn=
);
> >      xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_=
PFN_OFFSET);
> >      xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
> > +    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->sci_shmem_gf=
n);
>=20
> Given that sci_shmem_gfn doesn't actually require any allocations, just
> a remapping of an existing and already specified physical page, then I
> don't think we need to add a new page to alloc_magic_pages for it.
>=20
> We can just #define a static address for the SCMI page in the domU
> addres space and use it for the mapping. No need to allocate a new
> page.
>=20

I think this could be implemented. I will refactor this part in v2.

>=20
> >      xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN=
,
> >              dom->console_pfn);
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.=
c
> > index eef1de0939..73ef591822 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -8,6 +8,8 @@
> >  #include <assert.h>
> >  #include <xen/device_tree_defs.h>
> > =20
> > +#define SCMI_NODE_PATH      "/firmware/scmi"
> > +
> >  static const char *gicv_to_string(libxl_gic_version gic_version)
> >  {
> >      switch (gic_version) {
> > @@ -101,6 +103,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *g=
c,
> >          return ERROR_FAIL;
> >      }
> > =20
> > +    switch (d_config->b_info.sci) {
> > +    case LIBXL_SCI_TYPE_NONE:
> > +        config->arch.sci_type =3D XEN_DOMCTL_CONFIG_SCI_NONE;
> > +        break;
> > +    case LIBXL_SCI_TYPE_SCMI_SMC:
> > +        config->arch.sci_type =3D XEN_DOMCTL_CONFIG_SCI_SCMI_SMC;
> > +        break;
> > +    default:
> > +        LOG(ERROR, "Unknown SCI type %d",
> > +            d_config->b_info.sci);
> > +        return ERROR_FAIL;
> > +    }
> > +
> >      return 0;
> >  }
> > =20
> > @@ -122,6 +137,7 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
> >      }
> > =20
> >      state->clock_frequency =3D config->arch.clock_frequency;
> > +    state->sci_agent_paddr =3D config->arch.sci_agent_paddr;
> > =20
> >      return 0;
> >  }
> > @@ -502,9 +518,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt=
)
> >      int res;
> >      LOG(DEBUG, "Creating OP-TEE node in dtb");
> > =20
> > -    res =3D fdt_begin_node(fdt, "firmware");
> > -    if (res) return res;
> > -
> >      res =3D fdt_begin_node(fdt, "optee");
> >      if (res) return res;
> > =20
> > @@ -517,9 +530,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt=
)
> >      res =3D fdt_end_node(fdt);
> >      if (res) return res;
> > =20
> > -    res =3D fdt_end_node(fdt);
> > -    if (res) return res;
> > -
> >      return 0;
> >  }
> > =20
> > @@ -902,10 +912,9 @@ static int copy_node(libxl__gc *gc, void *fdt, voi=
d *pfdt,
> >      return 0;
> >  }
> > =20
> > -static int copy_node_by_path(libxl__gc *gc, const char *path,
> > -                             void *fdt, void *pfdt)
> > +static int get_path_nodeoff(const char *path, void *pfdt)
> >  {
> > -    int nodeoff, r;
> > +    int nodeoff;
> >      const char *name =3D strrchr(path, '/');
> > =20
> >      if (!name)
> > @@ -925,12 +934,101 @@ static int copy_node_by_path(libxl__gc *gc, cons=
t char *path,
> >      if (strcmp(fdt_get_name(pfdt, nodeoff, NULL), name))
> >          return -FDT_ERR_NOTFOUND;
> > =20
> > +    return nodeoff;
> > +}
> > +
> > +static int copy_node_by_path(libxl__gc *gc, const char *path,
> > +                             void *fdt, void *pfdt)
> > +{
> > +    int nodeoff, r;
> > +
> > +    nodeoff =3D get_path_nodeoff(path, pfdt);
> > +    if (nodeoff < 0)
> > +        return nodeoff;
> > +
> >      r =3D copy_node(gc, fdt, pfdt, nodeoff, 0);
> >      if (r) return r;
> > =20
> >      return 0;
> >  }
> > =20
> > +static int get_node_phandle(const char *path, void *pfdt, uint32_t *ph=
andle)
> > +{
> > +    int nodeoff;
> > +    const char *name =3D strrchr(path, '/');
> > +
> > +    if (!name)
> > +        return -FDT_ERR_INTERNAL;
> > +
> > +    name++;
> > +    nodeoff =3D fdt_path_offset(pfdt, path);
> > +    if (nodeoff < 0)
> > +        return nodeoff;
> > +
> > +    *phandle =3D fdt_get_phandle(pfdt, nodeoff);
> > +    return 0;
> > +}
> > +
> > +static int make_scmi_shmem_node(libxl__gc *gc, void *fdt, void *pfdt,
> > +                           struct xc_dom_image *dom)
> > +{
> > +    int res;
> > +    char buf[64];
> > +    uint32_t phandle =3D 0;
> > +
> > +    res =3D get_node_phandle("/scp-shmem", pfdt, &phandle);
> > +    if (res) return res;
>=20
> I hope we'll be able to avoid requiring the user to write a partial
> device tree with SCMI info in order to use it.

I assuming that all SCMI related data is already present in partial
device-tree. Because all scmi nodes should be added to the original
platform device tree, which is used to build domu and dom0 dtbs.
So the structure should look the following way, taken h3ulcb as an
example;

r8a77951-scmi.dtsi - describe all scmi nodes and update
clock/power/reset etc in the device nodes;
 |
\ /
included in r8a77951-ulcb.dts - device tree for rcar h3ulcb board
 |
\ /
included in r8a77951-ulcb-xen.dts - xen dts files;
included in r8a77951-ulcb-domu.dts - domu dts file.

So the idea is that scmi configuration should be applied for both
virtualized and non-virtualized systems.

That's why I copy nodes from partial device-tree to domain device-tree.
Another advantage of this approach is that user can configure scmi node
for each domain by add/remove protocols. For example only clock and
resets could work through scmi for DomX. This can easily be configured
when using partial device-tree.

>=20
> But if we have to go down this route, then we need to add a description
> of scp-shmem under docs/misc/arm/
>=20
> Also, in general, we cannot mandate or require specific paths in device
> tree and instead we should find nodes based on the compatible string.
> (There are exceptions like /reserved-memory and /firmware but they are
> only a couple.)
>=20

I agree about the specific path. I will make it to use compatible string
in v2.

>=20
> > +    snprintf(buf, sizeof(buf), "scp-shmem@%lx",
> > +             dom->sci_shmem_gfn << XC_PAGE_SHIFT);
> > +    res =3D fdt_begin_node(fdt, buf);
> > +    if (res) return res;
> > +
> > +    res =3D fdt_property_compat(gc, fdt, 1, "arm,scmi-shmem");
> > +    if (res) return res;
> > +
> > +    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> > +                    GUEST_ROOT_SIZE_CELLS, 1,
> > +                    dom->sci_shmem_gfn << XC_PAGE_SHIFT, XC_PAGE_SHIFT=
);
> > +    if (res) return res;
> > +
> > +    LOG(DEBUG, "scmi: setting phandle =3D %u\n", phandle);
> > +    res =3D fdt_property_cell(fdt, "phandle", phandle);
> > +    if (res) return res;
> > +
> > +    res =3D fdt_end_node(fdt);
> > +    if (res) return res;
> > +
> > +    return 0;
> > +}
> > +
> > +static int make_firmware_node(libxl__gc *gc, void *fdt, void *pfdt, in=
t tee,
> > +                              int sci)
> > +{
> > +    int res;
> > +
> > +    if ((tee !=3D LIBXL_TEE_TYPE_OPTEE) && (sci !=3D LIBXL_SCI_TYPE_NO=
NE))
> > +        return 0;
>=20
> Shouldn't this be:
>=20
>     if ((tee !=3D LIBXL_TEE_TYPE_OPTEE) && (sci =3D=3D LIBXL_SCI_TYPE_NON=
E))
>=20
Yeah, I should fix this in v2. Thanks.

>=20
> > +    res =3D fdt_begin_node(fdt, "firmware");
> > +    if (res) return res;
> > +
> > +    if (tee =3D=3D LIBXL_TEE_TYPE_OPTEE) {
> > +       res =3D make_optee_node(gc, fdt);
> > +       if (res) return res;
> > +    }
> > +
> > +    if (sci =3D=3D LIBXL_SCI_TYPE_SCMI_SMC) {
> > +        res =3D copy_node_by_path(gc, SCMI_NODE_PATH, fdt, pfdt);
> > +        if (res) return res;
> > +    }
>=20
> Do we really need to copy the node from the partial device tree? That
> makes it a lot harder to use for the user. Ideally a user would only
> need to specify sci =3D "scmi_smc" and everything else should be done
> automatically.
>=20
> Can we automatically generate the SCMI device tree node instead? It
> looks like we should have all the information to be able to do it. If
> not, what is missing?
>=20
Please see the answer above.
>=20
> > +    res =3D fdt_end_node(fdt);
> > +    if (res) return res;
> > +
> > +    return 0;
> > +}
> > +
> >  /*
> >   * The partial device tree is not copied entirely. Only the relevant b=
its are
> >   * copied to the guest device tree:
> > @@ -1088,8 +1186,10 @@ next_resize:
> >          if (info->arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART)
> >              FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
> > =20
> > -        if (info->tee =3D=3D LIBXL_TEE_TYPE_OPTEE)
> > -            FDT( make_optee_node(gc, fdt) );
> > +        FDT( make_firmware_node(gc, fdt, pfdt, info->tee, info->sci) )=
;
> > +
> > +        if (info->sci =3D=3D LIBXL_SCI_TYPE_SCMI_SMC)
> > +            FDT( make_scmi_shmem_node(gc, fdt, pfdt, dom) );
> > =20
> >          if (d_config->num_pcidevs)
> >              FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_c=
reate.c
> > index dcd09d32ba..c7372fd344 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -596,6 +596,37 @@ out:
> >      return ret;
> >  }
> > =20
> > +static int map_sci_page(libxl__gc *gc, uint32_t domid, uint64_t paddr,
> > +                         uint64_t guest_addr)
> > +{
> > +    int ret;
> > +    uint64_t _paddr_pfn =3D paddr >> XC_PAGE_SHIFT;
> > +    uint64_t _guest_pfn =3D guest_addr >> XC_PAGE_SHIFT;
> > +
> > +    LOG(DEBUG, "iomem %"PRIx64, _paddr_pfn);
> > +
> > +    ret =3D xc_domain_iomem_permission(CTX->xch, domid, _paddr_pfn, 1,=
 1);
> > +    if (ret < 0) {
> > +        LOG(ERROR,
> > +              "failed give domain access to iomem page %"PRIx64,
> > +             _paddr_pfn);
> > +        return ret;
> > +    }
> > +
> > +    ret =3D xc_domain_memory_mapping(CTX->xch, domid,
> > +                                   _guest_pfn, _paddr_pfn,
> > +                                   1, 1);
> > +    if (ret < 0) {
> > +        LOG(ERROR,
> > +              "failed to map to domain iomem page %"PRIx64
> > +              " to guest address %"PRIx64,
> > +              _paddr_pfn, _guest_pfn);
> > +        return ret;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >                         libxl__domain_build_state *state,
> >                         uint32_t *domid, bool soft_reset)
> > @@ -762,6 +793,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain=
_config *d_config,
> >          goto out;
> >      }
> > =20
> > +    if (state->sci_agent_paddr !=3D 0) {
>=20
> Shouldn't we also check for sci_type =3D=3D XEN_DOMCTL_CONFIG_SCI_NONE ?
>=20
> If the user specifies sci_type =3D=3D XEN_DOMCTL_CONFIG_SCI_SCMI_SMC, we
> shouldn't automatically map any SCMI channels to the guest, right?
>=20
Sounds good. I will fix this in v2`=20
>=20
> > +        ret =3D map_sci_page(gc, *domid, state->sci_agent_paddr,
> > +                            state->sci_shmem_gfn << XC_PAGE_SHIFT);
> > +        if (ret < 0) {
> > +            LOGED(ERROR, *domid, "map SCI page fail");
> > +            rc =3D ERROR_FAIL;
> > +            goto out;
> > +        }
> > +    }
> > +
> >      dom_path =3D libxl__xs_get_dompath(gc, *domid);
> >      if (!dom_path) {
> >          rc =3D ERROR_FAIL;
> > @@ -1817,17 +1858,24 @@ static void libxl__add_dtdevs(libxl__egc *egc, =
libxl__ao *ao, uint32_t domid,
> >  {
> >      AO_GC;
> >      libxl__ao_device *aodev =3D libxl__multidev_prepare(multidev);
> > -    int i, rc =3D 0;
> > +    int i, rc =3D 0, rc_sci =3D 0;
> > =20
> >      for (i =3D 0; i < d_config->num_dtdevs; i++) {
> >          const libxl_device_dtdev *dtdev =3D &d_config->dtdevs[i];
> > =20
> >          LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->pa=
th);
> >          rc =3D xc_assign_dt_device(CTX->xch, domid, dtdev->path);
> > -        if (rc < 0) {
> > -            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
> > +        rc_sci =3D xc_domain_add_sci_device(CTX->xch, domid, dtdev->pa=
th);
> > +
> > +        if ((rc < 0) && (rc_sci < 0)) {
> > +            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d; "
> > +                 "xc_domain_add_sci_device failed: %d",
> > +                 rc, rc_sci);
> >              goto out;
> >          }
> > +
> > +        if (rc)
> > +            rc =3D rc_sci;
>=20
> I would make this simpler actually. Do we need to pass dtdev->path
> twice, once for xc_assign_dt_device and a second time for
> xc_domain_add_sci_device?
>=20
> I would skip adding xc_domain_add_sci_device altogether. A general SCMI
> enable/disable for the domain is necessary, but then we can just get the
> directly assigned devices from xc_assign_dt_device. There is no need to
> specify the list twice. If a device is not manageable via SCMI we can
> detect it automatically because it is going to be missing scmi_devid on
> device tree.
>=20
In one of my previous email I described the idea to make a list of
sci_devids in dom.cfg. Such as:=20
sci_devs =3D [0, 1, 35]
and pass this list to Xen via hypercall, then send permission requests
via scmi for each devid.
The advantages of this approach are the following:
- we don't need scmi_devid in device-tree anymore;
- we do only 1 hypercall to set permissions for devices;
- we don't need to pass device-tree node to Hypervisor, just devid.

What do you think about this approach?

>=20
> >      }
> > =20
> >  out:
> > diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.=
c
> > index fe9f760f71..b1d288a8b9 100644
> > --- a/tools/libs/light/libxl_dom.c
> > +++ b/tools/libs/light/libxl_dom.c
> > @@ -710,6 +710,7 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
> >          state->console_mfn =3D dom->console_pfn;
> >          state->store_mfn =3D dom->xenstore_pfn;
> >          state->vuart_gfn =3D dom->vuart_gfn;
> > +        state->sci_shmem_gfn =3D dom->sci_shmem_gfn;
> >      } else {
> >          state->console_mfn =3D xc_dom_p2m(dom, dom->console_pfn);
> >          state->store_mfn =3D xc_dom_p2m(dom, dom->xenstore_pfn);
> > diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl=
_internal.h
> > index 0b4671318c..f9f9cc633a 100644
> > --- a/tools/libs/light/libxl_internal.h
> > +++ b/tools/libs/light/libxl_internal.h
> > @@ -1407,6 +1407,10 @@ typedef struct {
> >      /* Whether this domain is being migrated/restored, or booting fres=
h.  Only
> >       * applicable to the primary domain, not support domains (e.g. stu=
b QEMU). */
> >      bool restore;
> > +
> > +    /* sci channel paddr to be set to device-tree node */
> > +    uint64_t sci_agent_paddr;
> > +    xen_pfn_t sci_shmem_gfn;
> >  } libxl__domain_build_state;
> > =20
> >  _hidden void libxl__domain_build_state_init(libxl__domain_build_state =
*s);
> > diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> > index 6245af6d0b..ba200407da 100644
> > --- a/xen/arch/arm/domctl.c
> > +++ b/xen/arch/arm/domctl.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (c) 2012, Citrix Systems
> >   */
> > =20
> > +#include <asm/sci/sci.h>
> >  #include <xen/errno.h>
> >  #include <xen/guest_access.h>
> >  #include <xen/hypercall.h>
> > @@ -175,6 +176,20 @@ long arch_do_domctl(struct xen_domctl *domctl, str=
uct domain *d,
> > =20
> >          return rc;
> >      }
> > +    case XEN_DOMCTL_add_sci_device:
> > +    {
> > +        int rc;
> > +        struct dt_device_node *dev;
> > +
> > +        rc =3D dt_find_node_by_gpath(domctl->u.sci_device_op.path,
> > +                                   domctl->u.sci_device_op.size,
> > +                                   &dev);
> > +        if ( rc )
> > +            return rc;
> > +
> > +        return sci_add_dt_device(d, dev);
> > +    }
>=20
> I would skip it and instead I would add a call to sci_add_dt_device in
> the implementation of XEN_DOMCTL_assign_device.
>=20
please see my comment above.
>=20
> >      default:
> >      {
> >          int rc;
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index b85e6170b0..671c72c3e8 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
> >  #define XEN_DOMCTL_vmtrace_get_option         5
> >  #define XEN_DOMCTL_vmtrace_set_option         6
> >  };
> > +
> > +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
> > +struct xen_domctl_sci_device_op {
> > +    uint32_t size; /* Length of the path */
> > +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
> > +};
> > +
> >  typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
> >  DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
> > =20
> > @@ -1265,6 +1272,7 @@ struct xen_domctl {
> >  #define XEN_DOMCTL_get_cpu_policy                82
> >  #define XEN_DOMCTL_set_cpu_policy                83
> >  #define XEN_DOMCTL_vmtrace_op                    84
> > +#define XEN_DOMCTL_add_sci_device                85
> >  #define XEN_DOMCTL_gdbsx_guestmemio            1000
> >  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
> >  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> > @@ -1326,6 +1334,7 @@ struct xen_domctl {
> >          struct xen_domctl_psr_alloc         psr_alloc;
> >          struct xen_domctl_vuart_op          vuart_op;
> >          struct xen_domctl_vmtrace_op        vmtrace_op;
> > +        struct xen_domctl_sci_device_op     sci_device_op;
> >          uint8_t                             pad[128];
> >      } u;
> >  };
> > --=20
> > 2.27.0
> > =

