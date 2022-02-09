Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB92F4AF3E5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 15:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269244.463274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnnC-0001DS-FR; Wed, 09 Feb 2022 14:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269244.463274; Wed, 09 Feb 2022 14:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnnC-0001AO-Am; Wed, 09 Feb 2022 14:17:58 +0000
Received: by outflank-mailman (input) for mailman id 269244;
 Wed, 09 Feb 2022 14:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iPq=SY=epam.com=prvs=403937cc0f=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHnnA-0001A4-G5
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 14:17:56 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11d35474-89b3-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 15:17:54 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 219E5jMV008185;
 Wed, 9 Feb 2022 14:17:44 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e4dpf8bm0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 14:17:44 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5406.eurprd03.prod.outlook.com (2603:10a6:802:a7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 9 Feb
 2022 14:17:29 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:17:29 +0000
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
X-Inumbo-ID: 11d35474-89b3-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ9xJJeT28t0SR6GHjHaj7/TbzoO+oMtZfiGOkApN3JbRapnsqXHnaSlRXaTO3TzFbveWeoWirvNI8QfwJMaWMw3vBjgY/wnEteCp5JkCr/kO4TCwVg/4qM2vvLRpgCBz+Zp/Ho0Ds8X7pevPq/n72Wya3cGTz5jWwYNQWvmg+xP88RlXCjYhtj0d8D5xq2pJBzpOj6Zlfa2wYM7tyiEzoijZJ4B1nJFvUeV1Xub4SfagPSJxhmKrqf87UVmtIiwBmgBBoqZH1lvRo3DZahZ4+CyjTyZKoIjlVfXWoMdeGdchtl4ZpbWlb+rlXKwkSyZwvZE2lu0K7Ka6boidYZ4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgZUCRpIP9tL0Us1M2E5QPOox4BZ1YK2v+q+up6biUU=;
 b=F2SB2WoqXSCIqxlvawIoPpfEBy7hVf/Qu+/RG1TG5xe6FH60GYatmhoR6/gEgH9PplyIfbeZYco71Rqvo6lMR8Ap4jNGNfjYMWeyEpB/STwiGgiTWxMjAuE07QxHmayTog5jKdAa3Uq1dpWBWwmTLX+rgVsPRzQmIllgmpLkuDPUGZOed3CDy+Gi59xfJs+45Ehn7g8E4wF6Jn1vh+mAMMsd6OCq8pRvqRaiL2tNM2pUifDwXJ4RDKt39Lxqe/8EIXG5+aiuvkf3S2iMdCTToNhYVlVmK+ahSAHllGiDg8o2n4k4qDmvMcRt6EyRDfYR58XWJdzA/5baAMi/zgfpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgZUCRpIP9tL0Us1M2E5QPOox4BZ1YK2v+q+up6biUU=;
 b=gU8vgK9VYgbIrN3hRNZCfGTQnHz95bZUYVy8SXsywkb71ymsGRMwjCs7RksDJYVPYp6WwCNZMsdkENXGd+pKdQgWAu8wAnyai1eXEfnI0y1pIwnRco++CiuZGA/FIVnHvmUCd/kachxcylKSrY+WjP/hO07HVxSjghSm3wnjDs85tjJLIOS4pn1pel3JXhHsffyqEncxatjc9/rOoI5I2pnQ3edBJc3bkLbrwZb90UaOKDKr72VnSAii14WK3JYXuSNBBA+gKsxHfXunUgSdnaFn8Yw0b1ZyT1eWRAeX3/xsLP7uCi/Ai08I25K/fww8RfyNePQexNUkvDHFPnod1g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
Thread-Topic: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
Thread-Index: AQHYHRW1S717SraA0Ui+K6wc2/TNAKyJ+LkAgAEKd4CAACCZgIAAIZQA
Date: Wed, 9 Feb 2022 14:17:29 +0000
Message-ID: <20220209141728.GA1258996@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
 <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
 <20220209102037.GA1025795@EPUAKYIW015D>
 <316bd101-af8b-d2f0-1db5-ea6c583acd59@xen.org>
In-Reply-To: <316bd101-af8b-d2f0-1db5-ea6c583acd59@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3731e1d3-de41-4d3a-5514-08d9ebd6e812
x-ms-traffictypediagnostic: VE1PR03MB5406:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB5406DDA66D5DF64EE39E8848E32E9@VE1PR03MB5406.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AAc+7RcjoJbsnyxbXt2PiBySaJut7jq8mEUxp9KAb7z4bgcjdiC+KK/l939Cl+iUXbyCFTVmOMb9fOXEr67fjcv+nXTtRzKxG/mDTNT97E0NvMSb6iWtD0y6/eRewjDIyO+0YOkKW9r4QAaJEvK8RLR+Zr+Mh31W3RnS4f2za5CGXxdCCi0dFkOlmi4s+1x7JPWF1JZxfpnuMI1Zwhgk2lhZx2Uxcd+LySuskJzCjPdX239mLxfkGiCuXBQvrIi1XiBnFLJUH4WJ5GTYK8rXNVutWOcRrgAnDSKQ7KZxkRplFaslknEVGowOwYMkUTOTWoQSKsUsMjVv3AKrxI4DF3kaJNOxBKlJjD9lMaMlux+M/c+CngrN+r2NskXwI0M1ONQm6Gsv9dnW7YokrJd/kHjTMhm0151mNnxTmJh7NbQ19B7sZDftuBKq8PSccb82vd6gwskyERNUizynVaKhZzJyF7mcOuhvMvmd2wEmBkiX07EhBp44t2rP6vaTxFRzeR2pF1O5tlC5gIpPLkgQWQafOpcV2Hc+Azu6uftK+BSslhWxK48aStG3Lu6LvQrtwviMSJxg0xX9WVCoIfO2cEYqas6itTT35hRParrYda5dG/ooerdT1MpxfkJDn2uCgmQ7Kv9IcQ7Udq3q5J8fuRI3cVTPi3xsVkDmSHwKkeqktcqFJHRxnGKYzWs6kgd4igjHhOS5RM7OrxzAj76LPL/8i06IzkczGN8jBkOYNn0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38070700005)(71200400001)(316002)(6486002)(86362001)(508600001)(66476007)(64756008)(66556008)(122000001)(6916009)(33716001)(76116006)(6512007)(53546011)(9686003)(1076003)(4326008)(83380400001)(54906003)(8676002)(2906002)(26005)(186003)(33656002)(6506007)(38100700002)(91956017)(66446008)(5660300002)(66946007)(8936002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JcKP4JyCXKxzQoBwMSfgP/9SHoJJG1Ha3WoqcgMsTXoO9bbdhv1pxZz++bp1?=
 =?us-ascii?Q?PMT123ve4+Xm0mnt6JJ7oR/E2/FSUMCza5SHeg3G3QpvXZpTlRXRPUM5j4io?=
 =?us-ascii?Q?vfMspw29Mcufaz8fRl6OexWk/yMPvFGFK5YGkriCa+IKDsVhZuJx0vOJCTHp?=
 =?us-ascii?Q?0tdllxJ/aV8RHNAYdzE07FPYunXESF7afRNqNWRHONdd+RPUhyIGCwGVKE57?=
 =?us-ascii?Q?PnqCqVp2TW2J+1DSOlHhofSgX271tO4NgoLcm8hCprHDVNYOc7x6mtS03inC?=
 =?us-ascii?Q?KC7mk8F9wNLc2tjrnzkpTXvYigcvPxfWFzdvyCQEePMDMpsekibRv8QFUJ7O?=
 =?us-ascii?Q?vf7/bHGRYFbEpeHd9MtSPzJAFMHiTR1VY33z3u0ZrhL7xWPK/nec1itoLFfb?=
 =?us-ascii?Q?8zh5sFfhn5wx0vd8Kego0KKIPPYp9ezCufRpY7bGCQLYzXsj45bp463+3RU/?=
 =?us-ascii?Q?ismVLDz0QDkMK1laIJmovMDvUP5PJSrZXFSVqHAz5iiqr2AMEvDbNaVbAK+4?=
 =?us-ascii?Q?z0gsVJNv8my9x1cZtwib2AMdlmcF7iuTm9a2u1mVRIUnCi2k6k1UjoGS6W4Z?=
 =?us-ascii?Q?Nn6zbna6stTnL4yb+Nbny9vHLt1g3AaYyZyhuEGtnfwwSUGjRdpi1w5R+FeR?=
 =?us-ascii?Q?2/wNpCALRlmHFy2/ZQ2/SyB2I52uoAEF1XAtKBqFAwSeTS399qBIedq9vrcT?=
 =?us-ascii?Q?njO/7zJyzyGfR92ASiAuXpC463lgDM5JHNhN6aewB2gHpnbVSTuhA/E388Kj?=
 =?us-ascii?Q?TT/H1AWbWDPm3Rml34hyG15JbMGJP4QkBLOgW9ihQKXiSmqHPn24Q0YNW+8H?=
 =?us-ascii?Q?gAuqsuweVx4U9mQKSic9ARMbNDLo+CXvtsKrp4YOkFfZ8W2dtofQmUSo65xd?=
 =?us-ascii?Q?r9sCsEpIUaCS/UeFcukEMTfs7PXhxHzBU3Yh7+XI84nmPQmFTnRWTpYCuA/d?=
 =?us-ascii?Q?u4XCkgrzGcVc2DfrRb41dE59zZhXezXOWbcn0eQxOo9guBc+5XtWJnzgznNP?=
 =?us-ascii?Q?if7Ag3aZ/FFF0cc4I8PiD1DVXUWUE2M7/oxsPQlFC4ZTkKHSXqFvrnsOFq1w?=
 =?us-ascii?Q?EmhyFd/lPWdqx+A0DfEPWhKeMchtLi4Vb1vHpetgXTU/v33WAGRZ3wuVoXKa?=
 =?us-ascii?Q?UdeqdyX+OXPqkpmfrKDp7gA8VByQXcbn0zxZoh5dIi3L3pPoL2aj5G401hFF?=
 =?us-ascii?Q?oKDJdRlnk2EO1zZ6bWzIjnSGH/cDfAVPNcVQ02EyOALMdE2P+fQRJuMfY+lT?=
 =?us-ascii?Q?oT7atZdxQWR9Z/gM9BqlSQIimYZZhvbBMFz62nGToiFbCmETExhWku22I3iu?=
 =?us-ascii?Q?xom7LxXV2fb65orN2uyIUIo9qvNfHAW+JiUGA963I17nINZwuksodFOvFYO3?=
 =?us-ascii?Q?kKW2xNDxANeAU7fX3YitPTFABBcmhAc6D8ci6mZqLohZMDTpePD9NEIW92Mf?=
 =?us-ascii?Q?5zC8iWu4Ge7/eBN+ehtBAJgsrGG0uciTV82dTgZorEhtXqwyDXqmYUJIx38G?=
 =?us-ascii?Q?b2ticELWgKLBuQ5d1TiYarQBBT8s7NZB+G/kmWBkJb48lqiaRMkmXPQxt8Mm?=
 =?us-ascii?Q?nBJlMtjULLDyT7IyscGOukGc62jyfzrTnG7xFq5PnmgLdvOcqI8ALiZP5BH+?=
 =?us-ascii?Q?cGdH3rSC+2gj4xCQ50LyarS4zXxZQZHtWaWoutP+BGYi9lsmSWzUXBj33Vqx?=
 =?us-ascii?Q?KqBI+SgFCW3xtPtQFQHkSwDxrZ4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EC359AE40092794BBE1C95934133846D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3731e1d3-de41-4d3a-5514-08d9ebd6e812
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 14:17:29.7573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zjx/I6jzRVLbpW4hWlZ2aeJkCtJ2hOY5yRQGYNYS7j7ko2Q9OHDjAe7lbh3+ek0YCj4zkJN34A/mfHLU228pCGlCciQLFD1BwgQXhHlqMOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5406
X-Proofpoint-GUID: _QqoDDcb-wD_-MxAw1EFijW5Ir7TpH8s
X-Proofpoint-ORIG-GUID: _QqoDDcb-wD_-MxAw1EFijW5Ir7TpH8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_07,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090082

Hi Julien,

On Wed, Feb 09, 2022 at 12:17:17PM +0000, Julien Grall wrote:
>=20
>=20
> On 09/02/2022 10:20, Oleksii Moisieiev wrote:
> > Hi Julien,
>=20
> Hi,
>=20
> >=20
> > On Tue, Feb 08, 2022 at 06:26:54PM +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > On 08/02/2022 18:00, Oleksii Moisieiev wrote:
> > > > If enabled, host device-tree will be exported to hypfs and can be
> > > > accessed through /devicetree path.
> > > > Exported device-tree has the same format, as the device-tree
> > > > exported to the sysfs by the Linux kernel.
> > > > This is useful when XEN toolstack needs an access to the host devic=
e-tree.
> > > >=20
> > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > ---
> > > >    xen/arch/arm/Kconfig           |   8 +
> > > >    xen/arch/arm/Makefile          |   1 +
> > > >    xen/arch/arm/host_dtb_export.c | 307 +++++++++++++++++++++++++++=
++++++
> > >=20
> > > There is nothing specific in this file. So can this be moved in commo=
n/?
> >=20
> > You're right. I will move it to common.
> >=20
> > >=20
> > > >    3 files changed, 316 insertions(+)
> > > >    create mode 100644 xen/arch/arm/host_dtb_export.c
> > > >=20
> > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > index ecfa6822e4..895016b21e 100644
> > > > --- a/xen/arch/arm/Kconfig
> > > > +++ b/xen/arch/arm/Kconfig
> > > > @@ -33,6 +33,14 @@ config ACPI
> > > >    	  Advanced Configuration and Power Interface (ACPI) support for=
 Xen is
> > > >    	  an alternative to device tree on ARM64.
> > > > +config HOST_DTB_EXPORT
> > > > +	bool "Export host device tree to hypfs if enabled"
> > > > +	depends on ARM && HYPFS && !ACPI
> > >=20
> > > A Xen built with ACPI enabled will still be able to boot on a host us=
ing
> > > Device-Tree. So I don't think should depend on ACPI.
> > >=20
> > > Also, I think this should depend on HAS_DEVICE_TREE rather than ARM.
> >=20
> > I agree. Thank you.
> >=20
> > >=20
> > > > +	---help---
> > > > +
> > > > +	  Export host device-tree to hypfs so toolstack can have an acces=
s for the
> > > > +	  host device tree from Dom0. If you unsure say N.
> > > > +
> > > >    config GICV3
> > > >    	bool "GICv3 driver"
> > > >    	depends on ARM_64 && !NEW_VGIC
> > > > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > > > index 07f634508e..0a41f68f8c 100644
> > > > --- a/xen/arch/arm/Makefile
> > > > +++ b/xen/arch/arm/Makefile
> > > > @@ -8,6 +8,7 @@ obj-y +=3D platforms/
> > > >    endif
> > > >    obj-$(CONFIG_TEE) +=3D tee/
> > > >    obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
> > > > +obj-$(CONFIG_HOST_DTB_EXPORT) +=3D host_dtb_export.o
> > > >    obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
> > > >    obj-y +=3D bootfdt.init.o
> > > > diff --git a/xen/arch/arm/host_dtb_export.c b/xen/arch/arm/host_dtb=
_export.c
> > > > new file mode 100644
> > > > index 0000000000..794395683c
> > > > --- /dev/null
> > > > +++ b/xen/arch/arm/host_dtb_export.c
> > >=20
> > > This is mostly hypfs related. So CCing Juergen for his input on the c=
ode.
> >=20
> > Thank you.
> >=20
> > >=20
> > > > @@ -0,0 +1,307 @@
> > > > +/*
> > > > + * xen/arch/arm/host_dtb_export.c
> > > > + *
> > > > + * Export host device-tree to the hypfs so toolstack can access
> > > > + * host device-tree from Dom0
> > > > + *
> > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > + * Copyright (C) 2021, EPAM Systems.
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or m=
odify
> > > > + * it under the terms of the GNU General Public License as publish=
ed by
> > > > + * the Free Software Foundation; either version 2 of the License, =
or
> > > > + * (at your option) any later version.
> > > > + *
> > > > + * This program is distributed in the hope that it will be useful,
> > > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > > + * GNU General Public License for more details.
> > > > + */
> > > > +
> > > > +#include <xen/device_tree.h>
> > > > +#include <xen/err.h>
> > > > +#include <xen/guest_access.h>
> > > > +#include <xen/hypfs.h>
> > > > +#include <xen/init.h>
> > > > +
> > > > +#define HOST_DT_DIR "devicetree"
> > > > +
> > > > +static int host_dt_dir_read(const struct hypfs_entry *entry,
> > > > +                            XEN_GUEST_HANDLE_PARAM(void) uaddr);
> > > > +static unsigned int host_dt_dir_getsize(const struct hypfs_entry *=
entry);
> > > > +
> > > > +static const struct hypfs_entry *host_dt_dir_enter(
> > > > +    const struct hypfs_entry *entry);
> > > > +static void host_dt_dir_exit(const struct hypfs_entry *entry);
> > > > +
> > > > +static struct hypfs_entry *host_dt_dir_findentry(
> > > > +    const struct hypfs_entry_dir *dir, const char *name, unsigned =
int name_len);
> > >=20
> > > This is new code. So can you please make sure to avoid forward declar=
ation
> > > by re-ordering the code.
> > >=20
> >=20
> > I can't avoid forward declaration here because all those functions
> > should be passed as callbacks for node template dt_dir. And dt_dir is
> > used in read and findentry functions.
>=20
> You can avoid most of those forward declarations if you define the static
> variable now but fill them up after (see [1]). I don't think we can avoid
> the static variable forward declaration without reworking the API.
>=20
> BTW, I could not fully apply the series on the staging tree:
>=20
> Applying: xen/hypfs: support fo nested dynamic hypfs nodes
> Applying: libs: libxenhypfs - handle blob properties
> Applying: xen/arm: Export host device-tree to hypfs
> Applying: xen/arm: add generic SCI mediator framework
> error: patch failed: MAINTAINERS:512
> error: MAINTAINERS: patch does not apply
> error: patch failed: xen/arch/arm/domain_build.c:1894
> error: xen/arch/arm/domain_build.c: patch does not apply
> error: xen/include/asm-arm/domain.h: does not exist in index
> Patch failed at 0004 xen/arm: add generic SCI mediator framework
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>=20
> From the errors, it sounds like your baseline is from a couple of months
> ago. Please make sure to send your series based on the latest staging (at
> the time you send it).
>=20

I'm sorry for that. I will fix all comments, mentioned above, make a
rebase and post v3 shortly.

> > > > +static int host_dt_dir_read(const struct hypfs_entry *entry,
> > > > +                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
> > > > +{
> > > > +    int ret =3D 0;
> > > > +    struct dt_device_node *node;
> > > > +    struct dt_device_node *child;
> > >=20
> > > The hypfs should not modify the device-tree. So can this be const?
> >=20
> > That's a good point.
> > Unfortunatelly child can't be const because it is going to be passed to
> > data->data pointer, but node can be const I think. In any case I will g=
o
> > through the file and see where const for the device_node can be set.
>=20
> Can you explain why that data->data is not const?

I reused struct hypfs_dyndir_id, added by @Juergen Gross in
4f1e5ed49c2292d3dd18160b7e728b1aa9453206 hope he will help to answer
this question.

> > > > +static HYPFS_DIR_INIT_FUNC(host_dt_dir, HOST_DT_DIR, &host_dt_dir_=
funcs);
> > > > +
> > > > +static int __init host_dtb_export_init(void)
> > > > +{
> > > > +    ASSERT(dt_host && (dt_host->sibling =3D=3D NULL));
> > >=20
> > > dt_host can be NULL when booting on ACPI platform. So I think this wa=
nts to
> > > be turned to a normal check and return directly.
> > >=20
> >=20
> > I will replace if with
> > if ( !acpi_disabled )
> >      return -ENODEV;
> >=20
> > > Also could you explain why you need to check dt_host->sibling?
> > >=20
> >=20
> > This is my way to check if dt_host points to the top of the device-tree=
.
> > In any case I will replace it with !acpi_disabled as I mentioned
> > earlier.
>=20
> dt_host will always points to the root of the host device-tree. I don't
> think it is the job of hypfs to enforce it unless you expect the code to =
be
> buggy if this happens. But then I would argue the code should be hardened=
.
>=20

I will refactor this check.

Best regards,
Oleksii.=

