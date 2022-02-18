Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B54BB527
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 10:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275255.471036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKzNf-0004Q3-7V; Fri, 18 Feb 2022 09:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275255.471036; Fri, 18 Feb 2022 09:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKzNf-0004OE-3G; Fri, 18 Feb 2022 09:16:47 +0000
Received: by outflank-mailman (input) for mailman id 275255;
 Fri, 18 Feb 2022 09:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mscz=TB=epam.com=prvs=4048df52bb=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nKzNd-0004O8-CY
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 09:16:45 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c66d1ed-909b-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 10:16:43 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21I98aT4024031;
 Fri, 18 Feb 2022 09:16:36 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ea8jar1gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 09:16:36 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM6PR0302MB3223.eurprd03.prod.outlook.com (2603:10a6:209:1d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 09:16:33 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4995.020; Fri, 18 Feb 2022
 09:16:33 +0000
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
X-Inumbo-ID: 7c66d1ed-909b-11ec-8723-dd0c611c5f35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ3spoHrDqbdN/D2vsbIjUPJnHVRB6/3hKkeeJjZEbpPagCtQ4JhkAX+46w5LrF7T1GPtIH1dbFthubmymEomjPVGSyGkd5QziHLVJ1//yEExzH42bGKTDc8c9wFlUhWcR+wTh7TQU2D9SNHcHPNqNMtlL/0eA1SN7P1HP2FpMJpFh47TNxRiouKsIq9UPUXHCmMc/iVgNc4mKAsqW0/PXjXeKPoERMOX3cQol9s851LdTxXOouDYnZ4fc/N1hnGHLa4zTBF6YdPzzft6iikkKT1AothVyZj46oJ7n1/S8mqL960DdUaZC5Jpq4mJPqTv2YN0wm64+zy4486b2nJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EqCdQ3YamF9qUl0RJEherENn3kpxyXsvfJ+HCmnHrI=;
 b=Ght2iHLPsx/2LY7X77UrR24zfxKHXk9K6IFTlVN8l33y8ePU3/OmtO/LVZQwcavFJ/bIDi6ctAClZCUfGiCNh3w9bbzVE+HUE2bGSCFib1MZJODC/1QpSvPwM77PiSHjgrESUX7+XoOAXxNpF1lMdjXnNSp/FtFEClCAjW20aqLB6rD7S4NEzCPay8JI6s0W14XVqubhd7Hvkh8WxCAwom4LObYEQKJ9gMHa1UDnjYWcX/3gLfhc3FS8UAQTJ3gXaDVlEvsQXWK2s6zOZp9/4WDFa7K6SHB5BFB7GYjSkaPHSO6DfAY/OX4SOzTb4HgNlpaNyexblnBltT7Pmn/hnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EqCdQ3YamF9qUl0RJEherENn3kpxyXsvfJ+HCmnHrI=;
 b=sBkwJ4/6uKZ7S8CgwC5WUvaYZyu73HiMHohHh1eViOQIYiJRIboMHeg7UmpQjfyOM5DMkDkUwqv4QUFMlSr7mVYfdYUu6ITZU5ByedcdgVHsuWgVPXakcEjW0+y+NvPjXAaFykHmzsuXfh7YA0C1tNox6VxOovJbG6Tb5bFcMwYHW7XuD1KWZ0vcRnPP7SFOkbtnSUi/pXzLM9Fk3bFpNali6LPgI7ROeLCSLoYW1qrjJLdX+UJES3ezGbyRLIMJLdAXPuVDKqrxLQ1fu/00J+GGloyYFOm8x7d6LhtKdJLF3M6jK6AOVNNkcFk6z5Oy+sczCtFd0208uzQH5k5F+A==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Nick Rosbrook <rosbrookn@ainfosec.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Thread-Topic: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Thread-Index: AQHYHRW3O86755dYV0qSgPdVO9oeMayX6acAgAEsnQA=
Date: Fri, 18 Feb 2022 09:16:33 +0000
Message-ID: <20220218091632.GA1486420@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
 <ab6d8d13-30cf-d322-668e-f3f5aaa56824@xen.org>
In-Reply-To: <ab6d8d13-30cf-d322-668e-f3f5aaa56824@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29a83539-7b35-4092-0413-08d9f2bf5b6e
x-ms-traffictypediagnostic: AM6PR0302MB3223:EE_
x-microsoft-antispam-prvs: 
 <AM6PR0302MB32234D8B6694B2F3480579A1E3379@AM6PR0302MB3223.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oBvpv2ghFzqbNzn0y4EQd2P7i1Pgu+GlRD/O2WzS1cxbfBzGh+4Ez84qmslmbaKZCTj+61OjfSwymVUX/LHyfrbuPjpr3Zd2wss4XWk8AXkY4xTLA+F6V0O9vve49xPXdHQ3SmVXcBb+Ve3kCjVY0vgeftPgL6K9Uut0ek9RHai7hTqahGTVT7vIGP11FCd8xwDX7GTFaQBKxEOZ9Owg852rQmlS8u6jpNjpuAu00e8VBfs8P/R/HEdCLvje05P3BaiP6bljr/lqBrcOJl13Qv7RZMf65ePsq1fKAHMSd654cvb9asOjuSUVRB60F1ZeL2GIayWMs/JFqOUHpnog87W5EhAKGQ6cZN5yiiL3Ct+scqlBrVdgnljLvh4UhGQ0+0oLrQcdlAjcOPU+lf0Nm6H1BznZ/Q8AdslPEPQQFzoFz04cN+5D2pNhj6AoV1pPLdrVIBLykDfiPbZl+KCi4c2o13QV8Rsda7wJQQppfpDz5pxe8QM02p3tqaK88DC0aIgSJe+A0KxEM49WOBD3EDzdtrnt3KAcBmh3E0qovZ0RvMPf5yLl9gRXyTShqmxAnmKr5e600p66vHsXB8JBIB5jyUxyGbRPPgPuhlh0M+kzdp8A0R/4Z6daLilfL6QHUBmDyb8GRiGmzJVR7juzBKgWJPx2U//vDVXLkHCwXIOuHgzzM3rX6U16JiQ1qURQBoPHBT/nt2xd6Hbloyz+Y2emsecYtJ3ykznGB3ssvnxbLmSf4EoxSHifvcRsgJOX0M+eukapfigP4BRqYJ1k3jnECXDhgXbkWhdU3BpaxqQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(71200400001)(508600001)(7416002)(2906002)(966005)(6486002)(5660300002)(76116006)(66946007)(8936002)(186003)(26005)(33656002)(66556008)(66476007)(86362001)(66446008)(64756008)(4326008)(91956017)(8676002)(1076003)(33716001)(316002)(122000001)(38100700002)(83380400001)(53546011)(6916009)(6506007)(54906003)(9686003)(6512007)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DehOmVzR3DYxqa+MDKvOZCme099biZcg4vQ++9UirZrDFSqn6g7zpj4FGFMH?=
 =?us-ascii?Q?Y9Ecwjjq1Mpqux97LNZsGZcjAtSf7dAjfOQVI/DqEnpwoXyV7dZxzgvd+/BR?=
 =?us-ascii?Q?AInFyO/102AO23KvJebs+Ft+YJpT1T8tyWtq8BKfuvLveKlGCWfPjHl50+0o?=
 =?us-ascii?Q?6aMk84MyHNG7Hzvn1BBWLjUMMmVb3xOITx84zFScjc7lgKYp3exFQt4imf5H?=
 =?us-ascii?Q?QC+3WQgWT6aPSxKeBQojifVan3OpaYylMemCindSAPniN2iqzMJdoo5Qcqe3?=
 =?us-ascii?Q?IfezLIQ3f4LCFdt0arW3MsUC8FxFucp2nu2wpAA99SU1Y2nhkhkOWOa8t89S?=
 =?us-ascii?Q?z0Hq2DhWYlazN+DgUOJ+1vcjbafvH+hzJ+z+TgoPsRf7C/4Dzy2+izRrlIa6?=
 =?us-ascii?Q?G19XVNU0NgbOW/WEYCULC5h6bXJCgaA0F/9O6Y/4WflqRx2BAuUPy5CpJsy8?=
 =?us-ascii?Q?1latsi6bXH/ZkddHeFYod1iJ5V9yHt5uFLjCCdvEdvHEWTiLJBiscQ8Kstkh?=
 =?us-ascii?Q?kyX5SXbEI9cU2/WKcdKIYsiIS3hBVdh1bzP3+XwRjn6hVZfZx5Ky2a8LsFn1?=
 =?us-ascii?Q?5fK1zJfZ57kdcUM2WznHCHVymFcJnId/5qYikFxZ6hjWMsenR9BUUVK4dGGA?=
 =?us-ascii?Q?vIssrFUQtP+gsAxOrSTA4Pr9/BjMIed2co0i+w3sp3vsK06NGUw6D+9FOMll?=
 =?us-ascii?Q?U1BzS9IddHRavnDV14y0VSVHjhrA4sKrcUWoUOfpsIaUIGZXpqHWi5EtgG3M?=
 =?us-ascii?Q?ZGj+EjS0Z1cIaby78J3j3mTFvX/uyy56UYZVkfjmTxu+EsmrO3yb594W6Ept?=
 =?us-ascii?Q?QkMZWkawlqGuLmjR/B/zHrBP7K4qNXO09Lx2YB4ZBCwivig9PBCNUbtXfhRu?=
 =?us-ascii?Q?tyq4aa01fmyRvVoODx/G/6/D2czACX15GcSkG1aS8R2XtWbHOPrnXSugEO0Z?=
 =?us-ascii?Q?isoCN90zR6AUwEqSPMekh2cLJPPArmnYumOV75v8y0yh2R3LjPnuDC7txbUB?=
 =?us-ascii?Q?BYnmE4Y917XhrWPHl+eKNOumQYjgvMp2LfF1RGdUSO4a0l8iTV7+w8IjztCb?=
 =?us-ascii?Q?Jph4DcpI/dI0BxqzCaGfXXg7HzwkveyymQcmZc8IZj61FxIXYt8H0DudDd7Z?=
 =?us-ascii?Q?Dz8VcXXBtkK3eiTUazorHEpgwkoETU3svH3/7hHgtlSI9I50stcR4eUIE19n?=
 =?us-ascii?Q?gGaNcFr+7Nd2AIhFZZ4JOz6TTacG10k5mcalXlOK41GvAuIQK7Y3k0ic0HCb?=
 =?us-ascii?Q?LY3y6miLTxhxec96aWknCnO7QKQNDGSGDc/12d0xO2nSJKm7K8ZEWV0ZS1B7?=
 =?us-ascii?Q?BFEpSVX2G36RreeumKKrOVxg34/TZGmFKp8g/j9xsEpzMbiK4jaBTlTLWH9C?=
 =?us-ascii?Q?silqVjf7w+3L1OXIJSkps9VPiKLMD1312JT/Jz4y/Jud5Ttj+L9emSy/I4mk?=
 =?us-ascii?Q?cGWR1Kc7EDRmPJIE9FCq5hmASmtLFoF/e+9qyTbnS7SY21FBaiEOCtdSUoiQ?=
 =?us-ascii?Q?tEUHaSISXXYCtPA4ic94j0u/SvfV64juw2SO/eHLjqKWmpbDlrPLMW58+vl7?=
 =?us-ascii?Q?dWS0XpMJUFiKp3U8jDkeWVk+E7vUBmNCeHHsXv1AKm9l2qh7vjvrZDb0cu+e?=
 =?us-ascii?Q?eAVRj615mstj2Ktu6ugPzj+iXYmVuzu/y/gPrcTiRvnqbgM2O4EZpOxAtgKZ?=
 =?us-ascii?Q?G3QqF19OtQkYEGvWaXrHrfWAIks=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0CE841105886904E98607A1116C9554D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a83539-7b35-4092-0413-08d9f2bf5b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 09:16:33.5621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zjG2ebqitn9eyTZqvMuzSwDo3NDDlhrW3Ep/wT1PdkRMaMRDrLumZyq+KcXwIBq0uP5/VcKnMA1N8DyCnwOU0I1G821+cozwWNSsyhyXGS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0302MB3223
X-Proofpoint-GUID: EZ8hh8c9iDMgeDhS9itqvQkjsCbNOZ0J
X-Proofpoint-ORIG-GUID: EZ8hh8c9iDMgeDhS9itqvQkjsCbNOZ0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180060

Hi Julien,

On Thu, Feb 17, 2022 at 03:20:36PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 08/02/2022 18:00, Oleksii Moisieiev wrote:
> > If set, Xen is allowed to assign the devices even if they are not under
> > IOMMU.
>=20
> I think you mean "not protected by an IOMMU".

Yes. Thanks.
>=20
> > Can be confugired from dom.cfg in the following format:
>=20
> s/confugired/configured/
>=20
> > force_assign_without_iommu =3D 1
> >=20
> > This parameter has the same purpose as xen,force-assign-without-iommu
> > property in dom0less archtecture.
>=20
> s/archtecture/architecture/
>=20
Shame on me :(. I'll fix that.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >   docs/man/xl.cfg.5.pod.in              |  9 +++++++++
> >   tools/golang/xenlight/helpers.gen.go  |  5 +++++
> >   tools/golang/xenlight/types.gen.go    |  1 +
> >   tools/libs/light/libxl_arm.c          |  3 +++
> >   tools/libs/light/libxl_types.idl      |  1 +
> >   tools/xl/xl_parse.c                   |  3 +++
> >   xen/common/domain.c                   |  2 +-
> >   xen/drivers/passthrough/device_tree.c | 19 +++++++++++++++++--
> >   xen/drivers/passthrough/iommu.c       |  5 ++++-
> >   xen/include/public/domctl.h           |  5 ++++-
> >   xen/include/xen/iommu.h               |  3 +++
> >   11 files changed, 51 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index b98d161398..ddf82cb3bc 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -1614,6 +1614,15 @@ This feature is a B<technology preview>.
> >   =3Dback
> > +=3Dover 4
> > +
> > +=3Ditem B<force_assign_without_iommu=3DBOOLEAN>
> > +
> > +If set, Xen allows to assign a devices even if it is not behind an IOM=
MU.
> > +This renders your platform *unsafe* if the device is DMA-capable.
>=20
> I agree this is going to be unsafe. But the more important bit here is th=
is
> is not going to work because the guest has no way to translate a GFN to a=
n
> MFN.
>=20
> Your guest will need to be direct map to make it usable. So I would add t=
hat
> this will *not* work with DMA-capable devices.
>=20
> Also, can you explain in the commit message why you want to allow this
> setup?

Ok, I will update the commit message.

>=20
> >       xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 093bb4403f..f1f19bf711 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -512,7 +512,7 @@ static int sanitise_domain_config(struct xen_domctl=
_createdomain *config)
> >       if ( iommu )
> >       {
> > -        if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
> > +        if ( config->iommu_opts >> XEN_DOMCTL_IOMMU_MAX )
>=20
> XEN_DOMCTL_IOMMU_MAX will be defined as:
>=20
> (1U << _XEN_DOMCTL_IOMMU_force_iommu)
>=20
> This means the shift will do the wrong thing. However, AFAICT, this new
> option will only be supported by Arm and likely only for platform device =
for
> the time being.

Thanks, I will fix that.

>=20
> That said, I am not convinced this flag should be per-domain in Xen.
> Instead, I think it would be better to pass the flag via the device assig=
n
> domctl.

Do you mean that it's better to set this flag per device, not per
domain? This will require setting this flag for each device which should
require either changing the dtdev format in dom.cfg or setting
xen,force-assign-without-iommu in partial device-tree.

Both of those ways will complicate the configuration. As was mentioned
before, we don't want to make domain configuration more complicated.
What do you think about that?


>=20
> >           {
> >               dprintk(XENLOG_INFO, "Unknown IOMMU options %#x\n",
> >                       config->iommu_opts);
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passth=
rough/device_tree.c
> > index 98f2aa0dad..103608dec1 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -198,6 +198,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, s=
truct domain *d,
> >   {
> >       int ret;
> >       struct dt_device_node *dev;
> > +    struct domain_iommu *hd =3D dom_iommu(d);
> >       switch ( domctl->cmd )
> >       {
> > @@ -238,6 +239,16 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, =
struct domain *d,
> >               return -EINVAL;
> >           ret =3D iommu_add_dt_device(dev);
> > +
> > +        /*
> > +         * iommu_add_dt_device returns 1 if iommu is disabled or devic=
e don't
> > +         * have iommus property
> > +         */
> > +        if ( (ret =3D=3D 1) && (hd->force_assign_iommu) ) {
> > +            ret =3D -ENOSYS;
> > +            break;
> > +        }
> > +
> >           if ( ret < 0 )
> >           {
> >               printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
> > @@ -275,10 +286,14 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl,=
 struct domain *d,
> >           ret =3D iommu_deassign_dt_device(d, dev);
> > -        if ( ret )
> > -            printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \=
"%s\""
> > +        if ( ret ) {
> > +            if ( hd->force_assign_iommu )
> > +                ret =3D -ENOSYS;
> > +            else
> > +                printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assi=
gn \"%s\""
> >                      " to dom%u failed (%d)\n",
> >                      dt_node_full_name(dev), d->domain_id, ret);
> > +        }
> >           break;
> >       default:
> > diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/=
iommu.c
> > index 6334370109..216a9058c0 100644
> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -193,6 +193,8 @@ int iommu_domain_init(struct domain *d, unsigned in=
t opts)
> >       hd->node =3D NUMA_NO_NODE;
> >   #endif
> > +    hd->force_assign_iommu =3D opts & XEN_DOMCTL_IOMMU_force_iommu;
> > +
> >       ret =3D arch_iommu_domain_init(d);
> >       if ( ret )
> >           return ret;
> > @@ -534,6 +536,7 @@ int iommu_do_domctl(
> >   {
> >       int ret =3D -ENODEV;
> > +
>=20
> Spurious change.

I'll remove this.

>=20
> >       if ( !is_iommu_enabled(d) )
>=20
> Should not this check be updated to check force_assign?

That's a good point. I'll take a look on it.

>=20
> >           return -EOPNOTSUPP;
> > @@ -542,7 +545,7 @@ int iommu_do_domctl(
> >   #endif
> >   #ifdef CONFIG_HAS_DEVICE_TREE
> > -    if ( ret =3D=3D -ENODEV )
> > +    if ( ret =3D=3D -ENOSYS )
>=20
> AFAICT, none of the code (including callee) before ret have been modified=
.
> So why are you modifying the check here?
>

Because this check will fail if we have CONFIG_HAS_DEVICE_TREE define,
but do not have CONFIG_HAS_PCI and iommu_do_dt_domctl will not be
called.
Same thing if switch/case inside iommu_do_pci_domctl go to default and
return -ENOSYS. This part looked strange for me. But I will definitely
go through this part once again.

Or maybe I've misinterpreted this part?=20

> >           ret =3D iommu_do_dt_domctl(domctl, d, u_domctl);
> >   #endif
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index b85e6170b0..bf5f8c5b6b 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -81,8 +81,11 @@ struct xen_domctl_createdomain {
> >   #define _XEN_DOMCTL_IOMMU_no_sharept  0
> >   #define XEN_DOMCTL_IOMMU_no_sharept   (1U << _XEN_DOMCTL_IOMMU_no_sha=
rept)
> > +#define _XEN_DOMCTL_IOMMU_force_iommu 1
> > +#define XEN_DOMCTL_IOMMU_force_iommu  (1U << _XEN_DOMCTL_IOMMU_force_i=
ommu)
> > +
> >   /* Max XEN_DOMCTL_IOMMU_* constant.  Used for ABI checking. */
> > -#define XEN_DOMCTL_IOMMU_MAX XEN_DOMCTL_IOMMU_no_sharept
> > +#define XEN_DOMCTL_IOMMU_MAX XEN_DOMCTL_IOMMU_force_iommu
> >       uint32_t iommu_opts;
> > diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > index 6b2cdffa4a..a9cf2334af 100644
> > --- a/xen/include/xen/iommu.h
> > +++ b/xen/include/xen/iommu.h
> > @@ -330,6 +330,9 @@ struct domain_iommu {
> >        * necessarily imply this is true.
> >        */
> >       bool need_sync;
> > +
> > +    /* Do not return error if the device without iommu is assigned */
> > +    bool force_assign_iommu;
> >   };
> >   #define dom_iommu(d)              (&(d)->iommu)
>=20
> Cheers,
>=20
> --=20
> Julien Grall

Also I've posted a task on AT-F Phabricator asking about the feedback
about my SCMI implementation.
Link: https://developer.trustedfirmware.org/T985
Hope I'll be able to start a discussion and get an implementation, which
is approved by AT-F.

Best regards,
Oleksii.=

