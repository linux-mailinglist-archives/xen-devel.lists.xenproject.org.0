Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B78A4867A9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 17:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254155.435737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Vcs-0004JP-K7; Thu, 06 Jan 2022 16:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254155.435737; Thu, 06 Jan 2022 16:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Vcs-0004HR-Gl; Thu, 06 Jan 2022 16:28:30 +0000
Received: by outflank-mailman (input) for mailman id 254155;
 Thu, 06 Jan 2022 16:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+KX=RW=epam.com=prvs=30058094e3=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n5Vcq-0004HJ-El
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 16:28:28 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac51adf2-6f0d-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 17:28:26 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206FhTvb027660;
 Thu, 6 Jan 2022 16:28:16 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ddt839j8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 16:28:16 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR2PR03MB5242.eurprd03.prod.outlook.com (2603:10a6:101:25::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 16:28:13 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 16:28:13 +0000
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
X-Inumbo-ID: ac51adf2-6f0d-11ec-81c0-a30af7de8005
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFy4oNjbuI7dUDWKuhrfYxGjogPuCSskiOoZNhZzGzgDHsjP4LiC9WKA/4WFKYhq5vTyj91Ufyfn+yL69q5CyL3qKdmkqrl8jjIl1dbjSN8eYZfZWMJb3wWfyE/Mpu1yfp07U77jLMHfrGosUULtxfB2kh6ja21KipA+gUN4XFJpnzpAobePm4yoI9zheN8cpvgx7fwsyIntacJ8z/H4a0QDtySu6Qz32NXhIseqPsNHw1wmIWmlA8YZ/aGjQ/kvQC9rbKK2fDy9FnVjrxQVnxCXGkUwnFkrzUlou8eiASWag9bZMJMiiclbyPfK8p+tP/bNhvl5z94n+N39wj7c/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfbQzZuort7WCJ6SRAV42POqlrp7bFCeYMElOAYp55k=;
 b=L2vNU51bbA6k2UakIlPNYre18aKhvfR3yI+uGjk0D5gofQoM+rAETdhjVRPCAAO1fafspE8Q1ocJSgllAO/SCmJPqOcVzSJ9vp/aCV50Ka4PbTNHoEZBwm8SVkTPApa3DQxboHjLPZirrJcOJVHzqZ2qXv35x9/eU3HeSjBeyi06kLWNqg/QIW297ZWnymn4Hp60LrEkLjmOuHgqUhSXzx8oF01c80QISkomnV5N2725cDF6jos1zG1dU+vIX2Wcc4POuu+4wX4tBDZ96Zy41Qb4qBVtmi6KKMJZ+7Z8VZIj4Gq54cwBUx0hqY/MZT1w30TKxaE7mVG3V1K8LJGOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfbQzZuort7WCJ6SRAV42POqlrp7bFCeYMElOAYp55k=;
 b=ni9JlX73qU8zyq3KfALCzSUq4v7oVvdCZn2gcWxevS+y1YzmcDfxEr60/R9ecu4R1U7LDMeTjPa8EZZEZw7RHavrnkyfdLM8zFiREKsSHLWHjE1Otvm5QR+M/RS5nF+xlLk9qILz1LY22VJn+TXTKAPOQqeWi2TNhpYCCn/deZmAevFOIxYPG+b7f0ONiHiWpGTuYnudZjE0p9L8pgAs/10tUv9HpzjsnHyg5zF2F2H/Od85HbCpDY/l5pqLIBfDO40UYWgm+3o29AaoMS2tVOwOh6bGiKH37ppHxy/Ug2DfVsJbXiBpIDm5ahotaAXUgMs0YZqml3aMHTf2iStJlw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw2ks6AgAAeBwCAAAQPgIAABfaAgAAsl4CABKcNgIAGOOkAgAAnH4CAD3d9gIAEwfEAgAACbgCAABxaAIAABdkAgAAGmwA=
Date: Thu, 6 Jan 2022 16:28:12 +0000
Message-ID: <20220106162812.GA1473861@EPUAKYIW015D>
References: <20211217135855.GA4072899@EPUAKYIW015D>
 <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
 <20211220154127.GA1688861@EPUAKYIW015D>
 <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
 <20211224170243.GA1022822@EPUAKYIW015D>
 <045b2836-c95d-541b-462b-d276ae058b0d@xen.org>
 <20220106135328.GA1413532@EPUAKYIW015D>
 <55954632-e2c7-5455-6538-29c7990c8f62@xen.org>
 <20220106154338.GA1460271@EPUAKYIW015D>
 <548d4954-96bf-6522-6cfc-98b4a0e02b51@xen.org>
In-Reply-To: <548d4954-96bf-6522-6cfc-98b4a0e02b51@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3846e56-c589-4395-726d-08d9d13188f7
x-ms-traffictypediagnostic: PR2PR03MB5242:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR2PR03MB52426D4C643BB2DD9BDAEB46E34C9@PR2PR03MB5242.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s23wmAtLmW9Zd7gBpD8cKonAoMrFpvzs4S6yG4MTNCOVOUZX0XEukjTSDcjqTxzHkDxTdeDdule5oWT42rsiYz1VO4sQ0EEtcSy22WrFUnKhPNlGVM8MdFjzdwwmbm1KiJcvWMyZcIVBmpa7b5mgWSso6lrajs0lrFW6pJnD9HULfNoR84+dR2TnacIbm28OFotdinY0SAAQ6MT3hr62k0CnPOUjf89hIxVq1hLKofLAfYrfmPXhr7MyZbq0gXCQDn7RmXpnP/lc7JdUNrqc/Dxanyk9aPeFSVfCHDY4AYsx2EjB1MjC1Hk8YTqaAj/ZhfS+msLahP12z6zhYYCAOW/JSXn/+55eL51+1JLeUJZa8aZaJNQfbscIhHSUdpl/iSjZuPtcRAADwr5BgOEI+7yYB9KBEErPeKxbdNBCZFt6459zZkw/vf87/4TcGKD1ppcHxaYjRzXekZ7pCGoh7rEH2qvl8Osj+XlUIowsCMQhziDiIaYksuw4zH/VmzwFRto2W+Md2bY+iUA5y/q3h8cJhuPohPkQ3oo44vflV2J9fw/7Yg+Keskc0U186QM9UHV8dZTOFo2x3szuGr2/l+AYYQncfB66VjQe/F1d3Y6vyyAxCLPwazr+nSH0rzi+uSuZerwgBkfNksvFwcY9Ae2vicVMX6MYB/28xrJmBL/Dg6/g+4UQ6YayW8lbAMjDEJW4/6JRsYAUSsX0bMs0TQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6512007)(26005)(66476007)(66946007)(6486002)(71200400001)(83380400001)(33656002)(33716001)(38070700005)(6916009)(8936002)(8676002)(38100700002)(53546011)(64756008)(316002)(66446008)(122000001)(186003)(66556008)(91956017)(76116006)(2906002)(5660300002)(86362001)(6506007)(54906003)(508600001)(1076003)(9686003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WzkNh60QO8gEjxJMRJT6IudUK/BXftR6x4sTbgE+Ehh8unpT4icIRXLEzKO/?=
 =?us-ascii?Q?oZyLC7vlnIYpA5VjO7tHodOynRTgjKW63+BNecUEYmp2EyW8ISLlS6QrLBFd?=
 =?us-ascii?Q?8MrVzXHvQYRVp88ILDYyxbg6NNmSxL63YBJjsabjRaEtE4145o7xJDkW4WlX?=
 =?us-ascii?Q?1qqH1zL6kbLnahm3Lxylam6I+57z9PvpVRSp2drP/LAUaj5FubPs9YDpf1A5?=
 =?us-ascii?Q?zMYbEPemiD5Ukgi2Q89kRRjfA4Q/FvEBdkcDbS9fbu9DrUurG+nQQ5BuguUn?=
 =?us-ascii?Q?8NoLxKfLic0t0Mc+da+/5nDNOGGdO8C2cDmki0PfFqAZR3E1wLp5cqVxEnXu?=
 =?us-ascii?Q?CtKFegy7SySqFDU51HqyteFXTYEQgNlBSfDUXV6ndK/8kEHKtVe+4Jjd2A/l?=
 =?us-ascii?Q?t1uhOL/IRXP1saoR8tC5OUovMOGHarA0OB5YpQjtVKbMrQw/liAPiEWnjnnO?=
 =?us-ascii?Q?7HYEVwhiHVAblk0zzFtoGvcFW/6ZeWHwy9NN1RB/UuEbTYJkcgqkl56VvG3f?=
 =?us-ascii?Q?7rLUZW/IoPjI39xQ71yfiG5U/C6LDHc2ZtOZnmce3Zblk4GP09Wzdu7Bn8DV?=
 =?us-ascii?Q?IZe+iFKH4tzLk9e3yuTfPbmobfAb9fDICz2n/0pqnhlc7dDIFF3Cs6KWNk14?=
 =?us-ascii?Q?FHDsKNHyGcWbqao4F2f0POqt/IS5jrHGdYUh2tF6aQTKfWpZM93XMeYq7pen?=
 =?us-ascii?Q?IyokOOzwG9G/A3PUSm0hegWP04oKcXhcfWoQBh+PTS6ucY0ditkahn+v5yG5?=
 =?us-ascii?Q?Nl4vOXus+Ky1RkAxMPERcCoHeC4NkZhThp4HOvAWZVF7tsL/lWmdrrV3pMCg?=
 =?us-ascii?Q?0e3cv+7+PqQu1aU2xUdMy+50rR5pqZnmYvC3Q0oFy4tBZOApxGt4irXqedLz?=
 =?us-ascii?Q?4BUdo6IA9CjAO0Nzj9Xyjr21bA4CNVx2WBRmyt4uj2GqGU1ffGMvrCypdh0w?=
 =?us-ascii?Q?iIZml9iiFPzrdhyqYjaGkZhTV5yRk21fynS/36bQT2rJTuCp3Nc6RVsndSnT?=
 =?us-ascii?Q?FlKpouzkG4pQoskyBk1HBAQ3KWGCpFgcTOYoxr9E29oTc2z4gLUhVri5Jh7Z?=
 =?us-ascii?Q?jyRbPcplr54n4yNo11dIP6YgM5IqRWyXyJi7tOI6Ka0NIcRfBlD8bXrWZ8b6?=
 =?us-ascii?Q?zColzYdo9dyTbgPZbT5K751WjwldwpuiED2vMG/0vdPz3tZU0ibabiwIqFaX?=
 =?us-ascii?Q?TiK7DNbu0mxTdKZsWX5IJYJDsVQgHpHmtrbHsxWbt8SbQ+9Z/dthGb/+CWMO?=
 =?us-ascii?Q?czHQ7001wi1siCGeIP47eb42WzHj2ZhKcRNLRO6L1OT2QplZZWM8QIB29u61?=
 =?us-ascii?Q?N3iv01uAx71o7kvwb+uvcaO9EysicmRj81gXssGwdBNHuIwSH/g7J0YU+WED?=
 =?us-ascii?Q?7JnXBNFEgkNWJMv04wkKYmsjeeeJwponLHeotR5J6MzBwh0pb/PKzrMgHwDw?=
 =?us-ascii?Q?+0ZTYMs4zx6ed2WLtIEmNK6N6LeTYCuLjgRqVWq+0jxm5WorzRaUPX/C7Lgb?=
 =?us-ascii?Q?qBlatsbPkcWbvQdekeZV2L9axYg5kEFnLrH5ldpPP/aCtxId/hKy3YbPKZBp?=
 =?us-ascii?Q?nWZF5EkE2WGZ+oY1ZhRRzesRHgrbVAgV0mDD8GzMm2Bea3dTpXqaEXtFVwI5?=
 =?us-ascii?Q?L/3j5IlnIGLnOHbolh0jnt0Pe7xBFgoWUEL5uB9Cd9JbXdp+QD0w36lGwBRb?=
 =?us-ascii?Q?BSh0cNI2y2jDO+eVC36u+ScUj9M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B8A1B3F807B6641BEF11A10956D15FB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3846e56-c589-4395-726d-08d9d13188f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 16:28:13.0062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmIuCFsaeSf1LF/jByQRiXb7Rx5h+DqbYFqRovkY2B0NbLAlfGeLbLJQqaUcgjYQZenHOJHxzvrHnSo783Ata4watm8zOM9wHe0E+g/WCG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5242
X-Proofpoint-ORIG-GUID: 3Hw26HD-739c6s-vnDetNEzrP_aofp5E
X-Proofpoint-GUID: 3Hw26HD-739c6s-vnDetNEzrP_aofp5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_06,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2112160000
 definitions=main-2201060114

Hi Julien,

On Thu, Jan 06, 2022 at 04:04:34PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 06/01/2022 15:43, Oleksii Moisieiev wrote:
> > On Thu, Jan 06, 2022 at 02:02:10PM +0000, Julien Grall wrote:
> > >=20
> > >=20
> > > On 06/01/2022 13:53, Oleksii Moisieiev wrote:
> > > > Hi Julien,
> > >=20
> > > Hi,
> > >=20
> > > >=20
> > > > On Mon, Jan 03, 2022 at 01:14:17PM +0000, Julien Grall wrote:
> > > > > Hi,
> > > > >=20
> > > > > On 24/12/2021 17:02, Oleksii Moisieiev wrote:
> > > > > > On Fri, Dec 24, 2021 at 03:42:42PM +0100, Julien Grall wrote:
> > > > > > > On 20/12/2021 16:41, Oleksii Moisieiev wrote:
> > > > > > > > >       2) What are the expected memory attribute for the r=
egions?
> > > > > > > >=20
> > > > > > > > xen uses iommu_permit_access to pass agent page to the gues=
t. So guest can access the page directly.
> > > > > > >=20
> > > > > > > I think you misunderstood my comment. Memory can be mapped wi=
th various type
> > > > > > > (e.g. Device, Memory) and attribute (cacheable, non-cacheable=
...). What will
> > > > > > > the firmware expect? What will the guest OS usually?
> > > > > > >=20
> > > > > > > The reason I am asking is the attributes have to matched to a=
void any
> > > > > > > coherency issues. At the moment, if you use XEN_DOMCTL_memory=
_mapping, Xen
> > > > > > > will configure the stage-2 to use Device nGnRnE. As the resul=
t, the result
> > > > > > > memory access will be Device nGnRnE which is very strict.
> > > > > > >=20
> > > > > >=20
> > > > > > Let me share with you the configuration example:
> > > > > > scmi expects memory to be configured in the device-tree:
> > > > > >=20
> > > > > > cpu_scp_shm: scp-shmem@0xXXXXXXX {
> > > > > > 	compatible =3D "arm,scmi-shmem";
> > > > > > 	reg =3D <0x0 0xXXXXXX 0x0 0x1000>;
> > > > > > };
> > > > > >=20
> > > > > > where XXXXXX address I allocate in alloc_magic_pages function.
> > > > >=20
> > > > > The goal of alloc_magic_pages() is to allocate RAM. However, what=
 you want
> > > > > is a guest physical address and then map a part of the shared pag=
e.
> > > >=20
> > > > Do you mean that I can't use alloc_magic_pages to allocate shared
> > > > memory region for SCMI?
> > > Correct. alloc_magic_pages() will allocate a RAM page and then assign=
 to the
> > > guest. From your description, this is not what you want because you w=
ill
> > > call XEN_DOMCTL_memory_mapping (and therefore replace the mapping).
> > >=20
> >=20
> > Ok thanks, I will refactor this part in v2.
> >=20
> > > >=20
> > > > >=20
> > > > > I can see two options here:
> > > > >     1) Hardcode the SCMI region in the memory map
> > > > >     2) Create a new region in the memory map that can be used for=
 reserving
> > > > > memory for mapping.
> > > >=20
> > > > Could you please explain what do you mean under the "new region in =
the
> > > > memory map"?
> > >=20
> > > I mean reserving some guest physical address that could be used for m=
ap host
> > > physical address (e.g. SCMI region, GIC CPU interface...).
> > >=20
> > > So rather than hardcoding the address, we have something more flexibl=
e.
> > >=20
> >=20
> > Ok, I will fix that in v2.
>=20
> Just for avoidance of doubt. I was clarify option 2 and not requesting to
> implement. That said, if you want to implement option 2 I would be happy =
to
> review it.
>=20

I think it's time for me to start working on v2. I think option 2 can be
implemented. If not - I will look for an alternative way.

> >=20
> > > >=20
> > > > >=20
> > > > > We still have plenty of space in the guest memory map. So the for=
mer is
> > > > > probably going to be fine for now.
> > > > >=20
> > > > > > Then I get paddr of the scmi channel for this domain and use
> > > > > > XEN_DOMCTL_memory_mapping to map scmi channel address to gfn.
> > > > > >    > Hope I wass able to answer your question.
> > > > >=20
> > > > > What you provided me is how the guest OS will locate the shared m=
emory. This
> > > > > still doesn't tell me which memory attribute will be used to map =
the page in
> > > > > Stage-1 (guest page-tables).
> > > > >=20
> > > > > To find that out, you want to look at the driver and how the mapp=
ing is
> > > > > done. The Linux driver (drivers/firmware/arm_scmi) is using devm_=
ioremap()
> > > > > (see smc_chan_setup()).
> > > > >=20
> > > > > Under the hood, the function devm_ioremap() is using PROT_DEVICE_=
nGnRE
> > > > > (arm64) which is one of the most restrictive memory attribute.
> > > > >=20
> > > > > This means the firmware should be able to deal with the most rest=
rictive
> > > > > attribute and therefore using XEN_DOMCTL_memory_mapping to map th=
e shared
> > > > > page in stage-2 should be fine.
> > > > >=20
> > > >=20
> > > > I'm using vmap call to map channel memory (see smc_create_channel()=
).
> > > > vmap call sets PAGE_HYPERVISOR flag which sets MT_NORMAL (0x7) flag=
.
> > >=20
> > > You want to use ioremap().
> > >=20
> >=20
> > I've used ioremap originally, but changed it to vmap because ioremap
> > doesn't support memcpy.
> > What if I use __vmap with MT_DEVICE_nGnRE flag?
>=20
> That's not going to help. Our implementation of memcpy() is using unalign=
ed
> access (which is forbidden on Device memory).
>=20
> You will need something similar to memcpy_toio() in Linux. I don't think =
we
> have one today in Xen, so I would suggest to import the implementation fr=
om
> Linux.
>=20

Ok. Then I'll import memcpy_toio from Linux kernel.

> >=20
> > > > Considering that protocol is synchronous and only one agent per cha=
nnel is
> > > > expected - this works fine for now.
> > > > But I agree that the same memory attributes should be used in xen a=
nd
> > > > kernel. I fill fix that in v2.
> > >=20
> > > I am a bit confused. Are you mapping the full shared memory area in X=
en? If
> > > yes, why do you need to map the memory that is going to be shared wit=
h a
> > > domain?
> > >=20
> >=20
> > Xen should have an access to all agent channels because it should send
> > SCMI_BASE_DISCOVER_AGENT to each channel and receive agent_id during
> > scmi_probe call.
>=20
> Hmmm... Just to confirm, this will only happen during Xen boot? IOW, Xen
> will never write to the channel when a domain is running?
>=20

Yes. Only during Xen boot.

> If yes, then I think it would be best to unmap the channel once they are
> used. This would prevent all sort of issues (e.g. Xen mistakenly written =
in
> them).
>=20

That's a good advise. Thank you.

Best regards,

Oleksii.=

