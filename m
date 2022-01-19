Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75294938B0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 11:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258799.446122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA8LP-0007Rs-PK; Wed, 19 Jan 2022 10:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258799.446122; Wed, 19 Jan 2022 10:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA8LP-0007PB-Lx; Wed, 19 Jan 2022 10:37:35 +0000
Received: by outflank-mailman (input) for mailman id 258799;
 Wed, 19 Jan 2022 10:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAwr=SD=epam.com=prvs=30181e5aeb=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nA8LO-0007P5-0s
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 10:37:34 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdfa62eb-7913-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 11:37:32 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20JAZPxf001374;
 Wed, 19 Jan 2022 10:37:21 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dpfhurb3s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 10:37:21 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM6PR03MB4245.eurprd03.prod.outlook.com (2603:10a6:20b:b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 10:37:15 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 10:37:15 +0000
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
X-Inumbo-ID: cdfa62eb-7913-11ec-9bbc-9dff3e4ee8c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY/BKyMJVynwgVl9uT9kxe7z5GlK6dditXSm9nfjb6HrJOppUmR+bgKQO05ZnJFJnloucAaewU4edER5T511KCNUigkir7vmO6t0YHsDm5kKeuEpG9O7ZVMCH1Kf7cI7giOoiH+5rUQumuyAHAcNvibG/gikLequ5KmZJFFo/JyJ6voU+R8sh18m+mLMZTwVglcSnd4MvOuUVwrzgv8xJEZiH3nGJxtWQ/rTctvFVeaNMO1ZzIGcprmaW5asalc77LVvezmt/gfwsotXfEXFgArQcqWNTpQf8MQ4k0PpkR3mZVWRWXFFWCKacV67L9/WB8T0+BHfrPNOsdjmbFEvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAfxaFcPwTSEPGACiGT0lrm3EISMJk4FBhWpufo50gs=;
 b=SuiKNICzkhOLNM7zETgGHU4XAGiNr9oXf796EJzWipKBL+xQNuNRAJYOFYHFlFpxsDu2m7UGm4xrsFNRaNStbqtMQh7cA+F6v79ZuZB+Y7Ke0H2uifuNodeHOtirS4HZzDejbyBsUvutwGGSBrQ1yfepCgmQLd9f0HG5zYcnYsUETEHBPKOkA8eA00pZwrPRPFAx6whAN4+RjjqktEp4L8PB7qCwwY47EMJbvWbl2InoxhFAf8FZX8W9NruaUBc/e6hyLQEE/5UFw56yaAH4Yr6t+acGSN1mAC7xTmVLmnAb2E7e+jl33eO9ymP/m+5sCSEnPsPm78KQYhpDohqaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAfxaFcPwTSEPGACiGT0lrm3EISMJk4FBhWpufo50gs=;
 b=VdYM4x+PE0Zk7BJ8VUSmJN+rpfG6DPRaL2oEQpi4II/yYoJlPKzmzvx7SjPVvwgyKP9G/nwXYji0K4W7lVTUu3wRY6aa8nisTHL27fQHDlO6H7vEhRiEfn14WxTs1OSFiDuIOgwVU++T48x8AJG/qmfM02fsrOUgf2599SbchtbPn2+s7wl0mM0iQZeNk+FcWkywLHU3qnBAut+NmTUrMvPg0snlpEoVG6Eekqaq0E/Ou9pyysDUx5kFqaejqJQPmTtQCZotAiq1fDaWjRdzMN7crp2K7AE7wQMf7+JQoMj+2W4WKJK2fPNlqpkEMMOIq3+LqyEXmbGJOodv3zgmrA==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw2ks6AgAAeBwCAAAQPgIAABfaAgAAsl4CABKcNgIAGOOkAgAAnH4CAD3d9gIAEwfEAgAACbgCAABxaAIAABdkAgBQS24A=
Date: Wed, 19 Jan 2022 10:37:15 +0000
Message-ID: <20220119103715.GA3772829@EPUAKYIW015D>
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
x-ms-office365-filtering-correlation-id: 974373bb-c819-49e0-1003-08d9db37a931
x-ms-traffictypediagnostic: AM6PR03MB4245:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB4245D048EDC62DC6362954B5E3599@AM6PR03MB4245.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 890rdB+JMxGdRDrBzgsiEu2DYmFSUuwEzo0NKFVjEZy/+aVemvECsFGD+l1d0WPh5lVbINJP6C6x/gHERxEcIF0ji1fOm4A7sEXv3CCmAFWW1k4RxgJD/ReIcbjIMlNaXxEPl0rJ8Lscy5WBu0J3JZ72fzRFAAipxrnrH1DGZoepf6YyT/zJHh+Wc9Et6+me05oi6cVaJvVOjxAHzsXhfF682kWhMLDBA+lufrTFayhGANoqevCFpcsYwWrxyjxHHqpbt1Mj/x0fegQRBbdKoU9P8w+h3Sch4E7ZAdFzE2B4da8GX4bNRW3aMPdq/Ig5tjXvxxX0t6IV51za3O191GAVgjo+AhuIRBTLLuSF1lLa/TIBG5z7RwsSkAF/A66lAjzltNNI2/2V904AJk++RrVeEgu5tDK3HmEUBXkWyWYMidwIKGyMYnnUFhSkx8aT/njKJKvsXRYzX6TM3BANDkYayGQWWedg/XIYtLRtonQZPhLlgUkTYcK/2QnCTQdp+UBZ8MABMEsv+ShDxvcbliIkNMDVXGMZvAttd+50+dZ1xcotABZ77rv+Lxt5Sn3WcKTjAdQpsT/d7sam8Sus+/pdQWIPBnJYPWG7kk0SBbozAwxF+z9VzZ2UpdYXCV1X1ebhSUoMOI2CzmRhCgtf90R4tzGKUia3In4aucK/tSdl70eFCKps8+HVRdDSz5pvRVnWRV4xz+FfsxvXoFC3Tg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6486002)(8936002)(508600001)(33656002)(53546011)(83380400001)(6916009)(6506007)(8676002)(4326008)(38070700005)(1076003)(86362001)(2906002)(5660300002)(33716001)(6512007)(9686003)(66946007)(66476007)(66556008)(76116006)(66446008)(64756008)(91956017)(71200400001)(26005)(54906003)(316002)(38100700002)(122000001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?V1KaJUig2GC7Mj/zZxHuhxFU/hW0rphSO7OX2H9cQV9gLE54ZhEt6A4c7IhG?=
 =?us-ascii?Q?YqkWPbChM888yGgpNVs1lNow9MPBYX5WiZM740AcP2buVZbIAGtX2ecBpgkE?=
 =?us-ascii?Q?0EzX9d0YsEBILyenlEL5Phhw3+n9OanGVDNIEKBYGN7nLlRDBv6dowMQWJPZ?=
 =?us-ascii?Q?u6XZiwva5IUfk+1WhnH2NqcSkDR4nGndyBvo029/DK1UcGoobzZHObSoqc15?=
 =?us-ascii?Q?wXpRbZwNIubahlqhO6wKVteXENuOrSgeu015Pq6jzYtCobqwt+scmAI7VbaJ?=
 =?us-ascii?Q?oIgCmQQr7HNdNx3B5dJ831CLM5wqfdnBLmtCqoJHhYnR3lNzM3yGRpHIq/fo?=
 =?us-ascii?Q?vW/wxN6vl1wtE5AIYbgsDMjafpRmd3zVHL4S/wOcQ6IGowZzq8sb3Evaigxu?=
 =?us-ascii?Q?3E/ZWdPFf9bVs2OuNtKv1OQlZhiQ+v4kIQI9zTC/+c3cxfK4ADiGnI/5xwDX?=
 =?us-ascii?Q?eTa491uEXs/NwlL7Uax7rHajUJC+LpqmqJ3Wi68ydT85sDKs5dQ4E3QwTW0q?=
 =?us-ascii?Q?Mei7CbYq0awoPSmG0Ys5MHoEPLwzXCJu2KI8gajYnAQAbS4iQdxRZhrZxUqD?=
 =?us-ascii?Q?3jgB/RT4BIcoyaWwlfjJ779NBGAmhdPYpy6YubxMyCQjHDo+VcXOGRRrCGIa?=
 =?us-ascii?Q?KfPpm+Bqq0aqZiFVi6fensYOvCPO/vTlZlofEJ7DszxcTTLndsh1r9gqVeIb?=
 =?us-ascii?Q?j9LL9XMGSrn5bfxN5IHnbwerzzh1+plAsYttyDGGRDTTpS2vFenZVtXwTHjR?=
 =?us-ascii?Q?zVcliFQY8gQKovjiDhFEn4ADUl0fAguSCRZOhplewuW2clPDQcMk82GVUY/d?=
 =?us-ascii?Q?I+DLoReH2GVLDHy/Gmv8rFkjncxALnDrNVjldqJI4x8LkSIONF9g/8IKcejc?=
 =?us-ascii?Q?Vf1/wjbIJ0ecW/j+JXg9zlWfxJmorbGTchl7e5qgrfpnpTCtF1KaAIaovl9u?=
 =?us-ascii?Q?2NkQJ9wOBmZwfL8sipyEq3inHGQMT85kavwpMx2Ogc13N7Xe8jc65VcP22qt?=
 =?us-ascii?Q?WojM0QOPWwDJpbcg8sfzzaI+jzx5P06eIDrWIl9gJk/XkOtJeRgAFiJsWH/X?=
 =?us-ascii?Q?ntq6a3iaFJi+PM05fA5syfLrUNeBhFkDadFNk2l2KOyzgcBJQJaMPIuG/+UQ?=
 =?us-ascii?Q?1jVwocMNpPibOW+MjfvFzbvuZIDzYyLd4bXGop6MELThtpI3lH76D16CiB+U?=
 =?us-ascii?Q?zVVUmsVVEdx1KcIDFWg1vhetTrZJc/Jj91b4xk+lxrvJp3eSZ7TSEm0JqZC8?=
 =?us-ascii?Q?Ry8JN5YmzJTQM5bRiTxr210NT90koGWW1CJwN10m1Z30penMeMoiWHaTcRh/?=
 =?us-ascii?Q?Ul8nI+YHwpzIjd3eW2zBfsRTFz1YWxxJncTHkKfChh5IGtqu/9G9vS+hkzwJ?=
 =?us-ascii?Q?KKuyzOtVHDua1AOX2hhELY9JYWY4vXxaTQviFJ/nZMlKAGPfxk0sUd3Xtoje?=
 =?us-ascii?Q?S5gfCbOc2POXlN9PgtREQWSeNY7z0rnfmCHhi2g+3RSXKTWa56QfYXn5b6Kc?=
 =?us-ascii?Q?eVj8ayO+/OQ8wwBWuCXjGPyt/lDycHmPvFUS7IK4CPIGgQ7C48uq38S2Qf08?=
 =?us-ascii?Q?ZygjRM51RHOGzbAj48bikK2JRCVmF95beob5D/uGMSr1R7vG+yhMG0o0rXMy?=
 =?us-ascii?Q?GLThxulfTniv5bsf2G43hMSEwUnJC0eWDboUtS3v+DZ/qvnBAQ4Dc/IqAfKh?=
 =?us-ascii?Q?4Fj2RpssCTYocnz4WLMsswyUzmQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60B91E6ED0A22449878771BF74756DFF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974373bb-c819-49e0-1003-08d9db37a931
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 10:37:15.7416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZywwZag5CQ0ExYxwoOOBZ+O/YQOMPJfW9HsWXlsJkRJ7Bxnn2hB1wXpxOxK2x9f1Do6Ig9NIxBBWDfhxQ9xzz4wD8cwUa27rqhXwPcNoKW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4245
X-Proofpoint-ORIG-GUID: aRzq1bgV56jUKzYWImjlCC_wYV5lH2JW
X-Proofpoint-GUID: aRzq1bgV56jUKzYWImjlCC_wYV5lH2JW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_06,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190057

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

I'm thinking about the best way to reserve address for the domain.
We have xen_pfn_t shared_info_pfn in struct xc_dom_image which is not
used for Arm architecture. It can be set from shared_info_arm callback,
defined in xg_dom_arm.c.
I can use shared_info to store address of the SCMI and then use map_sci_pag=
e to
call XEN_DOMCTL_memory_mapping.

This will allow me to reuse existing functionality and do not allocate
extra RAM.

What do you think about that?

--
Best regards,
Oleksii.


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
> If yes, then I think it would be best to unmap the channel once they are
> used. This would prevent all sort of issues (e.g. Xen mistakenly written =
in
> them).
>=20
> Cheers,
>=20
> --=20
> Julien Grall=

