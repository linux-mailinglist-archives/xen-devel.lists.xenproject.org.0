Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0147D076
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 12:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250768.431869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzzQB-0003Lv-46; Wed, 22 Dec 2021 11:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250768.431869; Wed, 22 Dec 2021 11:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzzQB-0003Iq-06; Wed, 22 Dec 2021 11:04:35 +0000
Received: by outflank-mailman (input) for mailman id 250768;
 Wed, 22 Dec 2021 11:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rHP=RH=epam.com=prvs=2990e6cae6=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mzzQ9-0003Ik-3V
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 11:04:33 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef73e66c-6316-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 12:04:31 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BMAxntW030235;
 Wed, 22 Dec 2021 11:04:20 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d42cg833c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 11:04:20 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7471.eurprd03.prod.outlook.com (2603:10a6:102:10f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Wed, 22 Dec
 2021 11:04:15 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 11:04:15 +0000
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
X-Inumbo-ID: ef73e66c-6316-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AayGWCsQt01rjlgNsjG/TLIa/kI/+F4PNSBxlyF9q9mBzzGfml10IOkcIlJ714PLBd0903CZeutlSO7apH9Qch6YdkS+xhWellp9xHqmkvKJlSrxXvp0i8oVyWBPJ5ih+0jEbngwi49NxHavishlj9LbchZ5iFpgKdfAJJso5wpTr6oGzlkEvqO9UKL9W8gl2JQi1RehgZC1Jm5vArOX3WYQqNhhLxxkh0QH3dLy4Gs0wYnIJKrDULVLPsCLEiaDUtRWqN5mS6sixshy8AvBBPNH7BKcUm7HKCYfZbAYPZ/MBKhSODGC7dt1O85RyWhxRVWS0m2Jmjf80J+NSXeC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+x90w+uVjT0LbbwxmJrq4msfw3G5Y6ih3FSdxGr+yo=;
 b=FXcWFkzjzHhFEIB20UCcVU36nh16mTN2CsY1ccXxw8uTQmx5T2JKhKIsbEGFNyiRkk3u7NGLUzYutdrvKNySVyy1T1hf9ZLkDaMLTMnOiahweLOZ1XXXyUSfvDEaefPooe1TTQEiQU74YPMHbRYV3NOy2AWYNrPXh+qTur5fM4rmD7J88043DsaKFIJkpmgxSfzspuROaNvByzKnONwPr42aOEh2WGtNbx8JTxFpq2xfxYNUGzLrDYpzadS3HBDG6P7u9haMejhUru8kmIwHreN6zE3ZAfpyoiJkkytwKvuGONAjM25Gt2uGw8a4l0BYARe7f0tVtVYmjqWouM5Q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+x90w+uVjT0LbbwxmJrq4msfw3G5Y6ih3FSdxGr+yo=;
 b=MSWlI1mWd1CK/DqbaL8rQdqjaGjdzDfzTe+9YrkwKcf+qfHgKYdA8bBHxRB3jIXHJOTvjeH8evKldM9vsNqVJlogRyWwKx1FMFvkGzAFYWZ9EjNPEoX2XDWt+IRshCO6p0ld8IEaGrAHc/NaexBWZ7TEO2TIAirNw7epFrxnti2kFIvYUgExePi1q7FCPhO0Zr2ouuD5CB+fwQkhF3OnzaALWai9HHZuy5NzAWgIO9phNX40AiFnj6725KOt6VrZcsB7xy5+HhKTOoie//xUIs7KA88Z5DAibikFWQfi67EPwXDafJj+kizF6MKq9/p912Z2b8bIJYTNIkS62ntDzw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AA==
Date: Wed, 22 Dec 2021 11:04:15 +0000
Message-ID: <20211222110414.GA2883815@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03606bc4-6271-4202-73a2-08d9c53acb2a
x-ms-traffictypediagnostic: PA4PR03MB7471:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB747191BE11F9BD328CD67969E37D9@PA4PR03MB7471.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BwFv630iqjtfqGJYLwi8l+DXFA574VmBT6TSuWrIP946qcmZOiYeFl0JZ1TGRCmKF4bIdt4goJbSQWlQ5RC/MwuOzd3cwZhtGmJ0bTiOyNwZqET2l9jBSvm/XYzTuceBqsiXPlXJ7ZYiCe073Vla2c2G/8PC1McJ+Hcqm4ZL/PvjY1psUyaJTsqgYtxsyZ3fIj4GiEvs++fIYOcKUhQmA+Ny/Ex5vMWQY+IybXQZF/nwcBzDEGv3Y6GSCmQOJg0IOoMktYDOyuXNOkak1yKbKAQVmMCuUSYTLR2TmdKqaJIfk8GH1e20m9dt+5cDGcae9GEf5C/N9gf0KYdJfB0s0PVCHC4slQUra5uDPEVgQQh5SF8GzPMnEx4kv201e95Zyos6vRdKIbYmP4PGNhRIjdZHrJ5qRxbhe/ISDx1ZeIyHJRToXS/ddX69ORu6I+PZeNsjYhuFSRUDaxQESBl/pRqRWTiG0vn96Kr6Dk5fBzuki2xwdjJOQXI/+Sds9aubhb/ra04NUKyVnoNahAiA8UWe7vmdFlbjjPCs9g5zib3xWR3z5GopSBdhvSfeKoQq8FQtBY7YecZ6pjq/FpUdHeKKAdjfrSgr90Q0YovCTPTriMxLjH33AhJqDcaY3xtVqrtN1fYhrQ9DFJKBnh0dJCtiA4FBqzWfzOSNHxSqdc9j5xoqUSCpNxx0qMlFuEBS1OwldrtLnIBSUSRBp/oUEfmgMeo5XMwnYpaxyK2Z5SLITyjmFok/8Z8IBSkh08gRUp/SW+it5o9VUMiTIn/gwCDQVuPH749/xdDaRyIH609tsemalsYMCRz0QxOAYpJb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(186003)(8676002)(64756008)(4326008)(54906003)(30864003)(6506007)(38070700005)(2906002)(66446008)(66946007)(66556008)(66476007)(91956017)(316002)(71200400001)(26005)(76116006)(33716001)(6512007)(1076003)(122000001)(86362001)(83380400001)(8936002)(5660300002)(6916009)(966005)(33656002)(508600001)(9686003)(6486002)(38100700002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?y/f/2h7bF8U4487NOxEKu2f1HUoPb8zEfyMPOneTB8Wl6U5M678GxAdZCL7t?=
 =?us-ascii?Q?icto/5ht523i8BXy0XlLVnnD1fd12Zl0bs1M2s144JR3ZhM7wFIyC74vey+j?=
 =?us-ascii?Q?9cdTmHaDBJw17Oar4O24caQYYOaCbMe4mPjh23q874uU3PY5fOhbN3GWkKVO?=
 =?us-ascii?Q?+xtOxOvQ02GrfsQWClgF3lXJ8ZiuExWFjDd1Nr3gOZaonsxt2ydW4h094TXt?=
 =?us-ascii?Q?OVzanYG4MGqAXPSSBoGE4hYNJH3tuvToESd6eiP0wtwideN1Jfm6mYkOMbB5?=
 =?us-ascii?Q?HzxwJoglkOi7Ccg4DhDBGPy+h6grTc2zCDq3AeYDqvaLMPLnUnKmp9qW40Er?=
 =?us-ascii?Q?/Z/dTFMqEuHxyeEXCxwVnu1x9d99zkMoD6BvFlxw0p3scGfITBblhj3t1nmF?=
 =?us-ascii?Q?59ZfTzld7LAGLNTbL1B/c5AVQ8ySfeq8GWrQxLOZubd82URzIjviA/Fsd2HL?=
 =?us-ascii?Q?OA441yAtl2CobV+oaATGrD2KzwEban6qWIvVq/v4WP4wUmu6AFlhHVhnMBED?=
 =?us-ascii?Q?4tBJW04X+Gdpi/RuQwfgVY3GC/UVLJNn1cVAjw1tQhmzDHh4yduVP4+cZ1fn?=
 =?us-ascii?Q?8TYuGiAnz1txdOnH2fV5B2gt0QZUDgWZRNsrIiNOaIulmLOtLP8ub9GLpg+K?=
 =?us-ascii?Q?3v5HzGEBYVd9aib5Gym4leDtWG4KPtdz6TJBIKGdCpu7mGD99SXBpsNkAODq?=
 =?us-ascii?Q?JxsJVbAaCOo/yvabVh/rT9qKx35ecubWWykc60TeHL8dPDBYxUAVm4nsCuP+?=
 =?us-ascii?Q?2LiKnzv8OuHGyVw8dgaMaRh6VUub6aB4PTZO8FnezVhCDfz/hI9QS0g1uUTO?=
 =?us-ascii?Q?CsY+jXRdjNvObNUvdDyixu4N7lKEa7yMiAxtaQRxL9ddH5hKQO3wtgRZEGZB?=
 =?us-ascii?Q?ggzZbxRN4HrJWRRBfIK5EPAErZD79sZf6TISr/2iF+9Q6VIprE/1nvhHH3/e?=
 =?us-ascii?Q?u3rwk7Ini3GjMeuAVC9jbzoNWBgJviZgMRsaFZ6PubKQA+QTtWJZ6mQ1I7F6?=
 =?us-ascii?Q?5VTQqhux263Y4lhb7UjBJOT6dn5ymQfhHUlFmAMLmsVdqXaQS9jvSJmV3Aby?=
 =?us-ascii?Q?aZZp5v9s1mXJnO7UnFC8nMEN/TRqc6OLzl/ZZcjj7kltgHGyWlT+nqbZK/is?=
 =?us-ascii?Q?wyoge9OMb3kECqCLydL4AzJeIv9YAQou0NutNaeqmzvkSmfjf+QHkG6D4tmX?=
 =?us-ascii?Q?Ss1MpciUSj9YrtXuWboWmd6cH3WYKNv4TcoegTQOdJNk9a5wUsqdLEhpHgig?=
 =?us-ascii?Q?FkD8Fj4k8tQT/X4I+snsN20WlDPXgpCqHIRXpBzMctHeO7hFfRRtDy9Kqfnr?=
 =?us-ascii?Q?5Fujmi3bGYXpyO6K2Sbk/0+TsIcL8/2z+etskD13I1STsyMT7ABrjj3z4sTf?=
 =?us-ascii?Q?CnCk3dl+/Gup3tKtGPxGelC/EkTf1anRq0DiH0sMRd2vbybQ3uFVMVgOr6zb?=
 =?us-ascii?Q?/gLMhozdrw7/6JneF7rBbVo/T8iwe89yq9UtSsA8lzmThHIbQ/4E1PfoNn8e?=
 =?us-ascii?Q?IpMEntoDuvMvMwpsqWmR1/LzHUimwOVk4jg92n99Plz68a/0N4QIhD6Fp8Ql?=
 =?us-ascii?Q?2EQwAWdI6/A7lD2pCQ6S0S33cTCDnWD+VmkKq1hraPyAFlZ14sGX79dSpXps?=
 =?us-ascii?Q?79Qw6JoJLfx8TVlzt4pPssxPU7FF4vZ51Mqh88HKubsJEsTdtEAdPJhfQW38?=
 =?us-ascii?Q?H4f3dUNOJDUyAxVyetXowd/XeTM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D5F360217E78154690A5F370F9B0B24B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03606bc4-6271-4202-73a2-08d9c53acb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 11:04:15.5874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoOvwnUL4CcfrYORPA1lcZ5ekXxMzR92+/ZGJGvm7bAxT/NDXXZdRt0+6ddCA2XBzRQPSNk+8xU2RxFbWJuBLVRcLdAyqCPQCUGxLzw+wTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7471
X-Proofpoint-GUID: 9vzHv8vomBqM2-1znTAVY41f0BJ31LSs
X-Proofpoint-ORIG-GUID: 9vzHv8vomBqM2-1znTAVY41f0BJ31LSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112220063

On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wrote:
> On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > Hi Stefano,
> >=20
> > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wrote:
> > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > Hi Stefano,
> > > >=20
> > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellini wrote:
> > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > This is the implementation of SCI interface, called SCMI-SMC dr=
iver,
> > > > > > which works as the mediator between XEN Domains and Firmware (S=
CP, ATF etc).
> > > > > > This allows devices from the Domains to work with clocks, reset=
s and
> > > > > > power-domains without access to CPG.
> > > > > >=20
> > > > > > The following features are implemented:
> > > > > > - request SCMI channels from ATF and pass channels to Domains;
> > > > > > - set device permissions for Domains based on the Domain partia=
l
> > > > > > device-tree. Devices with permissions are able to work with clo=
cks,
> > > > > > resets and power-domains via SCMI;
> > > > > > - redirect scmi messages from Domains to ATF.
> > > > > >=20
> > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > ---
> > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++++++=
++++++++
> > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > >  5 files changed, 809 insertions(+)
> > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > >=20
> > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > >  	  support. It allows guests to control system resourcess via =
one of
> > > > > >  	  SCI mediators implemented in XEN.
> > > > > > =20
> > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > +
> > > > > >  endmenu
> > > > > > =20
> > > > > >  menu "ARM errata workaround via the alternative framework"
> > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfi=
g
> > > > > > new file mode 100644
> > > > > > index 0000000000..9563067ddc
> > > > > > --- /dev/null
> > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > @@ -0,0 +1,10 @@
> > > > > > +config SCMI_SMC
> > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > +	default n
> > > > > > +	depends on SCI
> > > > > > +	---help---
> > > > > > +
> > > > > > +	Enables mediator in XEN to pass SCMI requests from Domains to=
 ATF.
> > > > > > +	This feature allows drivers from Domains to work with System
> > > > > > +	Controllers (such as power,resets,clock etc.). SCP is used as=
 transport
> > > > > > +	for communication.
> > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makef=
ile
> > > > > > index 837dc7492b..67f2611872 100644
> > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > @@ -1 +1,2 @@
> > > > > >  obj-y +=3D sci.o
> > > > > > +obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
> > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scm=
i_smc.c
> > > > > > new file mode 100644
> > > > > > index 0000000000..2eb01ea82d
> > > > > > --- /dev/null
> > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > @@ -0,0 +1,795 @@
> > > > > > +/*
> > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > + *
> > > > > > + * SCMI mediator driver, using SCP as transport.
> > > > > > + *
> > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > + *
> > > > > > + * This program is free software; you can redistribute it and/=
or modify
> > > > > > + * it under the terms of the GNU General Public License as pub=
lished by
> > > > > > + * the Free Software Foundation; either version 2 of the Licen=
se, or
> > > > > > + * (at your option) any later version.
> > > > > > + *
> > > > > > + * This program is distributed in the hope that it will be use=
ful,
> > > > > > + * but WITHOUT ANY WARRANTY; without even the implied warranty=
 of
> > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See t=
he
> > > > > > + * GNU General Public License for more details.
> > > > > > + */
> > > > > > +
> > > > > > +#include <asm/sci/sci.h>
> > > > > > +#include <asm/smccc.h>
> > > > > > +#include <asm/io.h>
> > > > > > +#include <xen/bitops.h>
> > > > > > +#include <xen/config.h>
> > > > > > +#include <xen/sched.h>
> > > > > > +#include <xen/device_tree.h>
> > > > > > +#include <xen/iocap.h>
> > > > > > +#include <xen/init.h>
> > > > > > +#include <xen/err.h>
> > > > > > +#include <xen/lib.h>
> > > > > > +#include <xen/list.h>
> > > > > > +#include <xen/mm.h>
> > > > > > +#include <xen/string.h>
> > > > > > +#include <xen/time.h>
> > > > > > +#include <xen/vmap.h>
> > > > > > +
> > > > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > > > +
> > > > > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0056C=
) */
> > > > > > +#define SCMI_SUCCESS              0
> > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > +#define SCMI_DENIED             (-3)
> > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > +#define SCMI_BUSY               (-6)
> > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > +
> > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-smc")
> > > > > > +
> > > > > > +#define SCMI_SMC_ID                        "arm,smc-id"
> > > > > > +#define SCMI_SHARED_MEMORY                 "linux,scmi_mem"
> > > > >=20
> > > > > I could find the following SCMI binding in Linux, which describes
> > > > > the arm,scmi-smc compatible and the arm,smc-id property:
> > > > >=20
> > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > > >=20
> > > > > However, linux,scmi_mem is not described. Aren't you supposed to =
read
> > > > > the "shmem" property instead? And the compatible string used for =
this
> > > > > seems to be "arm,scmi-shmem".
> > > > >=20
> > > >=20
> > > > We use linux,scmi_mem node to reserve memory, needed for all
> > > > channels:
> > > >=20
> > > > reserved-memory {
> > > >     /* reserved region for scmi channels*/
> > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > >         no-map;
> > > >         reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > > >     };
> > > > };
> > > >=20
> > > > arm,scmi-shmem node used in shmem property defines only 1 page need=
ed to
> > > > the current scmi channel:
> > > >=20
> > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > >     compatible =3D "arm,scmi-shmem";
> > > >     reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > };
> > > >=20
> > > > For each Domain reg points to unigue page from linux,scmi_mem regio=
n,
> > > > assigned to this agent.
> > >=20
> > > If we were to use "linux,scmi_mem" we would have to introduce it as a
> > > compatible string, not as a node name, and it would need to be descri=
bed
> > > in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
> > >=20
> > > But from your description I don't think it is necessary. We can just =
use
> > > "arm,scmi-shmem" to describe all the required regions:
> > >=20
> > > reserved-memory {
> > >     scp-shmem@0x53FF0000 {
> > >         compatible =3D "arm,scmi-shmem";
> > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > >     };
> > >     scp-shmem@0x53FF1000 {
> > >         compatible =3D "arm,scmi-shmem";
> > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > >     };
> > >     scp-shmem@0x53FF2000 {
> > >         compatible =3D "arm,scmi-shmem";
> > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > >     };
> > >     ...
> > >=20
> > > In other words, if all the individual channel pages are described as
> > > "arm,scmi-shmem", why do we also need a single larger region as
> > > "linux,scmi_mem"?
> > >=20
> >=20
> > That was my first implementation. But I've met a problem with
> > scmi driver in kernel. I don't remember the exact place, but I remember
> > there were some if, checking if memory weren't reserved.
> > That's why I ended up splitting nodes reserved memory region and actual
> > shmem page.
> > For linux,scmi_mem node I took format from /reserved-memory/linux,lossy=
_decompress@54000000,
> > which has no compatible string and provides no-map property.
> > linux,scmi_shmem node is needed to prevent xen from allocating this
> > space for the domain.
> >=20
> > Very interesting question about should I introduce linux,scmi_mem node
> > and scmi_devid property to the
> > Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
> > Those node and property are needed only for Xen and useless for
> > non-virtualized systems. I can add this node and property description t=
o
> > arm,scmi.yaml, but leave a note that this is Xen specific params.
> > What do you think about it?
>=20
> Reply below
>=20
> [...]
> =20
>=20
> > > In general we can't use properties that are not part of the device tr=
ee
> > > spec, either https://urldefense.com/v3/__https://www.devicetree.org/s=
pecifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC=
595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git/tree/Documentation/devicetree/bindings__;!!GF_29d=
bcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXloYU=
aj$ [git[.]kernel[.]org]
> > >=20
> > > "linux,scmi_mem" is currently absent. Are you aware of any upstreamin=
g
> > > activities to get "linux,scmi_mem" upstream under
> > > Documentation/devicetree/bindings in Linux?
> > >=20
> > > If "linux,scmi_mem" is going upstream in Linux, then we could use it.
> > > Otherwise, first "linux,scmi_mem" needs to be added somewhere under
> > > Documentation/devicetree/bindings (probably
> > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml), then we ca=
n
> > > work on the Xen code that makes use of it.
> > >=20
> > > Does it make sense?
> > >=20
> >=20
> > Yes I agree. I think linux,scmi_mem and scmi_devid should be upstreamed=
.
> > I will add those properties to arm,scmi.yaml, mark them as related to X=
EN and send patch.
>=20
> I didn't realize that linux,scmi_mem and scmi_devid are supposed to be
> Xen specific. In general, it would be best not to introduce Xen specific
> properties into generic bindings. It is a problem both from a
> specification perspective (because it has hard to handle Xen specific
> cases in fully generic bindings, especially as those bindings are
> maintained as part of the Linux kernel) and from a user perspective
> (because now the user has to deal with a Xen-specific dtb, or has to
> modify the host dtb to add Xen-specific information by hand.)
>=20
>=20
> Let me start from scmi_devid.  Why would scmi_devid be Xen-specific? It
> looks like a generic property that should be needed for the Linux SCMI
> driver too. Why the Linux driver doesn't need it?
>=20

scmi_devid used during domain build. It passed as input parameter for SCMI_=
BASE_SET_DEVICE_PERMISSIONS message.
On non-virtualized systems - there is no need of this call, because OS
is the only one entity, running on the system.

I've chatted with Volodymyr_Babchuk and he gave a great idea to add a
list of device_ids to dom.cfg, such as:
sci_devs =3D [ 0, 1, 15, 35 ];

Using this approach, we can remove scmi_devid from the device tree and
just pass a list of scmi_devids to XEN using additional hypercall.
We can probably make hypercall taking devid list as input parameter.
This will take only 1 hypercall to setup sci permissions.

>=20
> In regards to linux,scmi_mem, I think it would be best to do without it
> and fix the Linux SCMI driver if we need to do so. Xen should be able to
> parse the native "arm,scmi-shmem" nodes and Linux (dom0 or domU) should
> be able to parse the "arm,scmi-shmem" nodes generated by Xen. Either
> way, I don't think we should need linux,scmi_mem.

This requires further investigation. I will try to make implementation
without linux,scmi_mem, using only arm,scmi-shmem nodes and share
reuslts with you.

