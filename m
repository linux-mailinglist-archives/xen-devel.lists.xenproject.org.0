Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971CE4AFC0E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 19:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269446.463535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHs5Y-0005mS-Vv; Wed, 09 Feb 2022 18:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269446.463535; Wed, 09 Feb 2022 18:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHs5Y-0005jn-Su; Wed, 09 Feb 2022 18:53:12 +0000
Received: by outflank-mailman (input) for mailman id 269446;
 Wed, 09 Feb 2022 18:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iPq=SY=epam.com=prvs=403937cc0f=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHs5X-0005jh-3p
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 18:53:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85195811-89d9-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 19:53:09 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 219IYVlO007604;
 Wed, 9 Feb 2022 18:53:05 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e4k0mg1vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 18:53:04 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DBAPR03MB6517.eurprd03.prod.outlook.com (2603:10a6:10:19a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 18:51:57 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 18:51:57 +0000
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
X-Inumbo-ID: 85195811-89d9-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxbKk3E6/9yB4MDJXhkm+UwXSy3vneND51tz02liEvV9CUyPuGGexkTlKsD9To1tUUoT0JYt3ltd36EPfSFq/MWxiTSCy88fcKN/NXPwuXgu7by/+F2BF9txucNZadbiigSbJTKdThhjfaV19BjWF3xfXilwIEAgIEogmuVvSYT9SautxHPbpilima+XvWBR47cRnJwxULrUICoN8Wl9d8igW2JDJ4yPRkY2C1GhNhkgijcCfoROlP2FqomxxZSMjj8h1OTwbH3d2WyJGRxKxaJ2+Q07OhHtxwjQzI2ceH33cDfazQI0PZpR7XQoFpzIPHvPoDn6T5v+7z4EisR4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Fz0jYHNqsq+CFUOHWsmDaJYjSHjqInO4tNdjh3ABGA=;
 b=YjxhNhdSY/P3hLwSEGKhHKFIl9FGvBapxRgMkk44RQeMpI9QhA4BiKitc0SGmTtInggaXyL4g20QZHP8tE+pj7r6fBiRb/sqGCIckrB/uYi4vksJ0b0tO40NpRrjUyILsgqowGenk6BLsZIMVR9hpg445QRicdKygGAhohCQuOE2C/yLVMcg9t7Mis35MAFIH7RP8lsm29ybq80S+Qf3RrTBB4bk0JwPLp72AQR9ZkCUKEOvkoXRl8/v+QVo7m4xQjV4RJtquCMge6TXmaXH7P10a8oJuU5XUb5NbdAab/pBzW/JbtXnGGWX8DjOYHQIXH9euV0wG0yK04oN4rJyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Fz0jYHNqsq+CFUOHWsmDaJYjSHjqInO4tNdjh3ABGA=;
 b=Ho/7rzDWON6dISG+Eo+DZgrz7fLK5xBUJDCIo2zVioiCPCrb0HvPxp2+dpwp3oxLohKmBA0NFpW0sqSHDSQPOWOkKE/X1dqPnVqPNBmNHhu7yfKmvBSiGJpL6TP6VtcbHTG0VLGWvkidvaz5IkOeNg0FklkJBkS4jImNyoyBzdVCE/X7Gu9SP+hPpTpjJFTiHq3JsjR9idL/2F8RnCspCQERIVtWWI/FnyXSX+odutP5Bg2TXrpdwOD+U1zbgyeBVx0wV4ECDXv/UjIYFKXK4BvbPkGS2z0Ca0VEzhv415eHm1pFrocdw9bLpxDZhck/aReV6kW2Es667pNLgt1bgA==
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
Thread-Index: AQHYHRW1S717SraA0Ui+K6wc2/TNAKyJ+LkAgAEKd4CAACCZgIAAbkMA
Date: Wed, 9 Feb 2022 18:51:57 +0000
Message-ID: <20220209185156.GA1475048@EPUAKYIW015D>
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
x-ms-office365-filtering-correlation-id: cb3f11e3-9526-420e-09f4-08d9ebfd3f88
x-ms-traffictypediagnostic: DBAPR03MB6517:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DBAPR03MB6517702AA019BE0DB0345852E32E9@DBAPR03MB6517.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZyvazkJANtfEVow93RhzJ+v9sCFj2M+u8kJ9en4NV7HqfORFXamdSJN+ylNaGLsmA60+CtgiAUgvnokizt+CHdZROBp9fFYshjWyPNTZ7rBnQ8bYYclKVsZsuiqWnvsgBRULDdxvTRpO+jjaceqbdtee3zaT+TrLClBdL/zkvl4y8i+52PTHz8zFzAk6qeLC0RvMOxbH4U1CpWmPeEJHyW6s4kjPCvvKMRbjCWN7A0XqzWqn4FPGZTtA37uTmx4ZMiWzutdd3iRmFiWgByLUR5/JtL799mrDQNrqgnM/CrFscoN2c+kU4Z9/SWc6CL4MvRL6jOEONwG0ONfmAs3/gioyYNJjMBsx7j00hio1vQKoqnJjhezFon5fIUCsdsCqWvK1QpNF70fnjrvHTJbmIV/BKENJKdi9fgSHAAam3t2CmfXwCKSq5qveKJ/EUZyzaxxW/qF8qiV2YUIL/uCuxpioxkj93AskLrtqcFwdZzkgjqjpbYQr3SqnuCUux6zFhdlglfLKk/+njekFHAO9oycWm97fLxW0ldNHyalc/ot/8BuKysNtP103rJDJ9+mFoIUri/elpazHpN9C0dTkAAHJsqYXZQpW0pRrmQaXc/CRm6sBZE2Hx44JYOJgFX+hzXSo77DzusE5iOIx/cGylBQJ3uU7hTHYG79vMZ51JmianALNaPPdKXBqR0nOJOpzNFiuaxyohJLlMRRT7MlZ/A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(1076003)(316002)(91956017)(71200400001)(33656002)(186003)(6486002)(508600001)(86362001)(66946007)(66556008)(4326008)(66476007)(76116006)(8676002)(26005)(6916009)(66446008)(64756008)(54906003)(5660300002)(38100700002)(8936002)(2906002)(33716001)(122000001)(6512007)(9686003)(38070700005)(83380400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?db8EQYTfH4QtjWdeNJan2cCOmEg87r8qrMcH5cniDG1IW6MtqWZrbLaZMKwE?=
 =?us-ascii?Q?YNTl43q1QH1MM9MKaGGr/KJuecjm5AYDecFeYBiEU8P15b0a/DBEYYs0mhok?=
 =?us-ascii?Q?xFRvud34QuTNxPaGbtnMnzABIriwz//rJlbo/Xj+lJZ48ooC9p43GdZbM8SQ?=
 =?us-ascii?Q?vaWABSYzQbhuRmUAOTUnm7+Tp0PLKlmM2IMxXYK5RyMZKGYbJbm+1KcPa16j?=
 =?us-ascii?Q?gGae8H+g5OqBO3P+soZ86Q1YX0ct+OsWG0TPcslPOFabEdVltcWlvu8r+MlS?=
 =?us-ascii?Q?oTNSPXoaJGPZRdNc6whqU3HN0P2r6ZTUZea/GQvxpjxuNpSPri84sNF5PpZs?=
 =?us-ascii?Q?9tHMUFCYCGJPyX06k9yNwZivzAYa7KniSCOMxTuFA+8sxkEkHmDFfsde7qLh?=
 =?us-ascii?Q?06LQax7D+8Tj8C9BKaZJ3VvO1EfzMIajpzESRFwPa5Bkb5PJWu4RA2GbffPD?=
 =?us-ascii?Q?/CqgpFNIYp0nUgoVlFK66b+SErMu7qVk5+K5hohsilw/d8rrKuOiYI3UIcH8?=
 =?us-ascii?Q?ynBaLOdCKmWo1KDsdfbITgrT+T/2n/28T09PDr8Do1knmpcvIrWRzqRo6V/2?=
 =?us-ascii?Q?Z2y2o50NFxakagKZVrWBhJ3mYDQyUxV2tkKEGqu2ApIaKX/o9Lvq4AFBgeOZ?=
 =?us-ascii?Q?oD8nQN8HtjjzZszNKDyDuGHGVU+ajMgyIfX5unLlaiX4kqg0r9QkdiWneErT?=
 =?us-ascii?Q?dJIInAO24aNwozCotu5Qt6f7y6qb7IQM1uCNLYKM0ALD9XAOyH2EQRzD3VtY?=
 =?us-ascii?Q?4RoU2miMZIYvBOsBnXtGRH3wZykUz3KkHAYxyTl+iyoT3+kriBL8EdrxACyK?=
 =?us-ascii?Q?25V0aeI0457b+D16b23GmjLwKIsXUZdnlCLXjqe4hb3JD/BUcxjGn1iCPYST?=
 =?us-ascii?Q?YBZA4Kc8S9/ivlM/vT5iPKnfCdPKF8jkPbPC15LKlCTP4vCjbnWvsH9+58Zy?=
 =?us-ascii?Q?IEY7xOdZd75uOKklorTr+Cyo54DUAiWO07sw31pr9i7Y8oOX1t2NviRsxUlb?=
 =?us-ascii?Q?rYSAvKFrdotNXQng71H75xlN2W7O1AKgiFtei/tDpYx0sx9nbzHTdkTvRCa5?=
 =?us-ascii?Q?W/OV5BHRJ8Rn+E3hvPn+80i2aBr2cNoY1RFfORcyHtKbExMATPlKfOi1V7y6?=
 =?us-ascii?Q?XPJOZu3TeOVWQFu3+j5+/E0y2yKhrg2F1r5XYLzTBDMwLoTenpJkJUihW1WT?=
 =?us-ascii?Q?ctVlS5Y/t5LVkmg8JZGenKiilZC/6ya8AoZvTp7oh5ASkSazzYgfGPcnoZbo?=
 =?us-ascii?Q?KafpFok0iQtXoa9QdRSBtLEApk2Jp+QFUpqcEd4UXQhhjX8X8t0f0lQBPysM?=
 =?us-ascii?Q?YReSRuasAoFS28V7DDSjtqODmMBLhoBxb08rnTbUlbyLjmygarBP5Fomw6Wl?=
 =?us-ascii?Q?iKssYpjBpA53Eg/NfzOuN8s2LbyyclssFkjtkfUxhqDt91HfWrYFfza3OSvD?=
 =?us-ascii?Q?nE/DnGFL4NAPogJeiY+G83Q7oofOtU9dsjU9i+RHMejVE1KYCb+HNmHuLzvM?=
 =?us-ascii?Q?C7vCo5bPqUzVfoQhPMIxRVSopHZQS7quCCtctJafysRTW7JZ8dFOjtkn62W1?=
 =?us-ascii?Q?knGC8N9hjEClYS6BOXoIj3XZxt/gmrBiLeY5jatCUY+HliHHsT08HZEh/IWF?=
 =?us-ascii?Q?OQLxAriR2mqN/z24R3wRXSv5U8uv9L8QLXEWtJ1y/1Fu96zDwWCUpfXn++a7?=
 =?us-ascii?Q?JGZ0iSWZ0hq1z9+E+bdkLkos1n8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD78674FB54BFB4D994F5DEAE90EF6AB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3f11e3-9526-420e-09f4-08d9ebfd3f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 18:51:57.3682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5qWDuKn7Gpwnkrb4aNdZw7Ag8kIByk0KTSd4u/RR9nYwuogL3JAkMz7Yc47vdh1cB2xx3q/ozPIvpl2Gz3ZxhdyHRMD2f6U86QOPIj71bqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6517
X-Proofpoint-GUID: 2K68kOZvUBJWDG2DM7XfAFTSpV7eV_gA
X-Proofpoint-ORIG-GUID: 2K68kOZvUBJWDG2DM7XfAFTSpV7eV_gA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_09,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090099

On Wed, Feb 09, 2022 at 12:17:17PM +0000, Julien Grall wrote:
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

Hi Julien,

Unfortunatelly I can't use acpi_disabled in host_dtb_export_init because
I've already moved host_dtb_export.c to the common folder.

As for the host->sibling - I took the whole assert:
ASSERT(dt_host && (dt_host->sibling =3D=3D NULL));
from the prepare_dtb_hwdom function. And this assertion was added by the
commit b8f1c5e7039efbe1103ed3fe4caedf8c34affe13 authored by you.

What do you think if I omit dt_host->sibling check and make it:

if ( !dt_host )
    return -ENODEV;

Best regards,
Olkesii.=

