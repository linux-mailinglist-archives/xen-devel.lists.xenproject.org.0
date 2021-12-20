Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C847B07F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 16:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249844.430234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzKnJ-0001us-7Q; Mon, 20 Dec 2021 15:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249844.430234; Mon, 20 Dec 2021 15:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzKnJ-0001sZ-44; Mon, 20 Dec 2021 15:41:45 +0000
Received: by outflank-mailman (input) for mailman id 249844;
 Mon, 20 Dec 2021 15:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CBxd=RF=epam.com=prvs=298802dd99=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mzKnH-0001sT-BG
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 15:41:43 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5301c3fc-61ab-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 16:41:41 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BKEpO5K024258;
 Mon, 20 Dec 2021 15:41:30 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d2uy2072t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 15:41:30 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR3PR03MB6571.eurprd03.prod.outlook.com (2603:10a6:102:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 15:41:28 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 15:41:28 +0000
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
X-Inumbo-ID: 5301c3fc-61ab-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7HvTTWPPFNuA/TaJXOqkwyNU9qsY2f/LmcYiSLbt4JJAea3o+y5KGOWULmm0i7QgJFryP6j4WOiMWJcm2iWGsqXvs+KqglgEQfoX6OqpFJP2XO1N8ivGbc83peYVnhL2qSySw5rv+Hw1CsaY62OqyvY7Rs4+1EW1ghYhqpifIUGcQQhzJxZJ4iTNh1KU3GeaHL3rEGan1KWLAzJy5qQYmBga45bAtvQMZAbzQhCjGYY71lJ68zzyxtuvF4NPclJZEADnYfevA1fiOVU2gCZki2GgH96fi1vJmV0snpH7aWOCF3DIbGxPjQ4rygIw3F6t2aUBNlyiiJPYLsxtJ2KRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3BXmTVfE+kfGVHoYLtw7B2qCfY0BKvJ951kywdyNCA=;
 b=c9yhNGGtI/WYyz9yzleUVKNlaBdmzG3v1LxEbJYubdyK/NrP26TV4zgwh0hbQn5mtWyOgLDHTIhbhE1rrz5U72M4RAROZltDfcKlkzk6aRqNjrPinQQUBRl3KzXlXLsRVk53btBXFeVxo141QTJ6qJVfsDs3Ap+aKnIvc36mMRlX5H80eztpwCgqYYM5EnSMHGRUDdrMkBfHQhHZd8Q3hFqHdJqFZFc+1MwW/RTj01neF8ulsK+cuaCdI9rnIJVP35u8E1SZl2byPYS10rxvy53S8W6jFJGQKUOEphQP/tyqCLgmU2mLFp6USWW6OxXZ5R/4Iq/2ZZ2kw7fdFmZJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3BXmTVfE+kfGVHoYLtw7B2qCfY0BKvJ951kywdyNCA=;
 b=M2lUF2ErYbnNhuZvEm2esSeeEAhKLmzj8jf13asreYSEC/PpwYout2H77PLWRy9QDtVZhYxBI8juxFcFacxtOtotE3gH4olRZO5tYVYsVQgJ8qZDzsEKvs2xUBU+nn9sxQTPqD/Htwn/kNAo5bRxCjdZX9ht55N3VZihAu0K3VtbeVuD5sh5jrpE/+2chUva0+gwwX6v7Z4X07NHu5KGOG3RlE1X/deESZI/6MLNU4U2b0QJuqb6E5APaXYsDWJ/BV1bQwbb/6Gb3+Pkb/g4j8j9dJsexsq7cazr8I/xkDcly5ERrEKdrazDd5/zVQbSQph1t70YtO6IvbDb+IOi6w==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw2ks6AgAAeBwCAAAQPgIAABfaAgAAsl4CABKcNgA==
Date: Mon, 20 Dec 2021 15:41:27 +0000
Message-ID: <20211220154127.GA1688861@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <51104b62-14a1-79b8-1184-4f4d8418a2f6@gmail.com>
 <20211217132304.GA4041869@EPUAKYIW015D>
 <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
 <20211217135855.GA4072899@EPUAKYIW015D>
 <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
In-Reply-To: <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 856e9850-27c1-4b5c-39fb-08d9c3cf3007
x-ms-traffictypediagnostic: PR3PR03MB6571:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB6571CB5CB9D50FAB5CECDCC5E37B9@PR3PR03MB6571.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6raLqfe2oYGX3AIDYln6rbl+1Ye0Ro9IVv2+vLc1/691A+QCtHpv8YBqTVKq9P4+oCFiW+VdPkirouBAz7HtLa78Ljuw+UMtKLEV9jJ619ubzOn6f2PpyGR7WH0f5r3rmQctdfzBmaNhzd8TrxYceiJFvi4pVxpoTOLiXqY+ydhLspWzOUOBnz4YBE+PW2HJKxbRXEJ0ZN+v1oeLNwykDbR/2IU+3LUqcgHxIr/7O/qOpyz0eICk3mb5Gt3aS3drVBTZ0Oarxia27+6YNlh/yHjFsVz5rXQv8+gHS07tR739aUGR+OkDcugOk/ZziG8vtOlBsRL3iNnSqrwG+M59PVpU1CfiBslCF0PeK7TsK4hKB7Ju9BZp+8n+d2OqZCdjskEIaGxPqmojdi7ceZijrOsUuJGS+BSYd5dTnbino192PsfObVklJJilnTrTMlBsvXowG+2m8V9XiamZkfdqjodv/W9T7d0Tv+ZxmSnK/EF3IH6twPCcn4cc63fcxAZIw+cW7+nAGCvxnZ+wPAKVWsADbQyQewFpzB+pd6S30sTquNRtbAZeeb95vmmwIQWRm0isSrTfcf+uy8VpWNyRxX70YPWjwD0n5c2VmnOyW5eSPiknvgcHFw4Vh7IBb/LZDsvuXXxurEDuB2f+Hhk5Szknoa+vinMJrvQ7oK8wZUUT2HvrcGOQZI7Re3Fdh1Ya1ITokUzass5VmSubFQuwPIm4HoY2XSnYhYuqcf4hG/+Q5fmROu/oFL1cOD5al/m3LkkH+qs//hsewgFIFVP70NemFyy8GHj4MtvrU3/yRY0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(76116006)(66946007)(66556008)(6486002)(66446008)(66476007)(91956017)(1076003)(38100700002)(8676002)(83380400001)(122000001)(33716001)(64756008)(86362001)(8936002)(5660300002)(6916009)(4326008)(6506007)(508600001)(966005)(33656002)(38070700005)(53546011)(26005)(186003)(316002)(6512007)(71200400001)(2906002)(9686003)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?c8CJa1KMUaydDpTbefczwHubDUiJ9Iit3rnVsl8x8pIn+uEkgOD7OPegWyh7?=
 =?us-ascii?Q?TRUBX3tf4nNz+ahFHCq1hbSTrtRSt6Bi2a4cXjK+lKpZs4JPZDGYa7fbfWlq?=
 =?us-ascii?Q?w2A8ubIz/EZLmHggx/GkFbR61XccBWwttUJBw8V0qrv6U/TJ3ybSj5XF22AN?=
 =?us-ascii?Q?eojWhq4FKLyjS8uN3IJLSpxt2NMQtCVDFzyC/MT0uZRfPIVtCqRsHaL6z+IS?=
 =?us-ascii?Q?jzyMFKXrdQ+zeWgrjOo7JLtsQfSQry8S2LHCFMseJVOHf1uR4BRK5G9ZB6pH?=
 =?us-ascii?Q?l9MX/GVlmPhxBwgVs16de3QFBo+a7nM6RzuEJMnxYgki78i5b1hFqI8xVP+d?=
 =?us-ascii?Q?QTmVD1+hMdakdWSweTw0lZI+uYOBG7Re6Sqm6+6ZaYLRn5//eUo4MWRW6Xe4?=
 =?us-ascii?Q?GH+J5at+CD3yts3v905dYvEfEW8IxXjonu/0tRJBs4XR8iQvJ3BTqoGW3+CZ?=
 =?us-ascii?Q?r8WABxC3h/ZJ+AnZgdUsRMl9S1pR3Q02eSU6kFnx6uIuOEwIVKK0PduiStNc?=
 =?us-ascii?Q?3OPiggHPE27Y4a5YqcH/xdESdVLKQ0HaTDexBJ8YgtXXVTZxZSm8wo/DIQHM?=
 =?us-ascii?Q?h669omrCmOlmLFTcUo7txWz88HeBk6DURfSCsAy0EmKoJ/VI+hTFpSxNqURl?=
 =?us-ascii?Q?w/SJWP+LeZhydT3A+pCUxdwjGe1w84MpR/RsMpslLAd4uwTDhXyJnBTh8/3Y?=
 =?us-ascii?Q?RfdA/QOCrEoO8Eeuf3yZb/LvmXeprVay1smye5uvMNNL6CByr61lzLPQUYMf?=
 =?us-ascii?Q?hLCZFnjgX0870kz2y9XEXiXeDX84ihu/JDx7KT1fCan5ef7artw6gawpJtp1?=
 =?us-ascii?Q?49Ry21kTw5z7ntUH+P8OV58wi5j++prROUGCCw8gCjBCHU3C+mprAZUAbq4X?=
 =?us-ascii?Q?rVanmZlMVHKS2xLY+7+e7XlPi+vdybTAHSg5qfDR+GMp5P1kRrJarykaQD3x?=
 =?us-ascii?Q?OAXHxktaq7n+tHmf7PaQV/yG2jrYWRPPobH4TBLqACTL90Y1pxFqIMK/H61x?=
 =?us-ascii?Q?3SPFHqI9Sk/h1kn1KkuoWPvUW2vKvqP+0JL2K99O+rNgXUycQPrbMNv3WH3Q?=
 =?us-ascii?Q?gNnwGN7cI74TNz9hY20oBJGLt2VAn+C9+rFDFRUs1g9haTaz4t7E88FwfQep?=
 =?us-ascii?Q?FId0Ig5kH/DAP9+F/OOhuYAkX5D7k5E5FhpHoXS3jYHMFQEm+igy/IR4PBDq?=
 =?us-ascii?Q?wtsucfE+Q3U7om2cNZa7KJhbOYahqVsVbVgkZMkouBwNLGJgU+osYz9u/HI6?=
 =?us-ascii?Q?IvbPbtiYYFb5VCjEfIrg4UAi3Y4TTkAkdTsOcSM8WWlyq3jzMYaO8KXdwv01?=
 =?us-ascii?Q?cXxF4LhhvN2CnSVJ/FKBo6f/lFd+9Xu6DrCpjzXXY4uwHizPFiZlpKb+elOh?=
 =?us-ascii?Q?Kj8ifDtx8QBo7Dy5eGHv6JJQtgYiyYGubSgWa1FwCWrxM+zh6sfZyEqVyiX+?=
 =?us-ascii?Q?YJiltSD4VEn+JPLkuTUMh7po4y4msmrziaFUVtVOJLwAJ/krjFMUnbQlqQ38?=
 =?us-ascii?Q?8Ui0WLt4GmnAI7cbM0TUWuw+TkqqgXxSuM8n9pBGngZDSNjXInR98wUqZk8y?=
 =?us-ascii?Q?zwG7QkyxxDsl/nCOyQmJURd+Se7qbNjWRLy/d2sFsC1gUapkwbPfyyI9Ld5f?=
 =?us-ascii?Q?qc5KNK28O6XuemjD6TwgM4Vw2/FRexiVAy7Qr/PBwsb6hxtmIE9g3htB7Kh2?=
 =?us-ascii?Q?XZsuE6ovJSh+SWkp2yuHlKuo9t8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6444D2EEE436094A9681C56B515E527B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856e9850-27c1-4b5c-39fb-08d9c3cf3007
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 15:41:27.9812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b51BmA5yP5qqbORpv/KPj73QhTrbsfeJeZOiBwJqw97vy7Hdv4LG9qkEemBx7+g2/h58aqITWldIDY/8nXUZvu4kmR0oCo4diYekZb3XfTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6571
X-Proofpoint-ORIG-GUID: vI70oUhGMdjH46lYfnaBUrsjA9Cflq5E
X-Proofpoint-GUID: vI70oUhGMdjH46lYfnaBUrsjA9Cflq5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_06,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112200089

Hi Julien,

On Fri, Dec 17, 2021 at 04:38:31PM +0000, Julien Grall wrote:
>=20
>=20
> On 17/12/2021 13:58, Oleksii Moisieiev wrote:
> > Hi Julien,
>=20
> Hi,
>=20
> > On Fri, Dec 17, 2021 at 01:37:35PM +0000, Julien Grall wrote:
> > > Hi,
> > >=20
> > > On 17/12/2021 13:23, Oleksii Moisieiev wrote:
> > > > > > +static int map_memory_to_domain(struct domain *d, uint64_t add=
r, uint64_t len)
> > > > > > +{
> > > > > > +    return iomem_permit_access(d, paddr_to_pfn(addr),
> > > > > > +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> > > > > > +}
> > > > > > +
> > > > > > +static int unmap_memory_from_domain(struct domain *d, uint64_t=
 addr,
> > > > > > +                                     uint64_t len)
> > > > > > +{
> > > > > > +    return iomem_deny_access(d, paddr_to_pfn(addr),
> > > > > > +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> > > > > > +}
> > > > >=20
> > > > > I wonder, why we need an extra level of indirection here. And if =
this is
> > > > > really needed, I wonder why map(unmap)_memory* name was chosen, a=
s there is
> > > > > no memory mapping/unmapping really happens here.
> > > > >=20
> > > >=20
> > > > I've added extra indirection to hide math like
> > > > paddr_to_pfn(PAGE_ALIGN(addr + len -1)
> > > > so you don't have to math in each call. unmap_memory_from_domain ca=
lled
> > > > from 2 places, so I moved both calls to separate function.
> > > > Although, I agree that map/unmap is not perfect name. I consider
> > > > renaming it to mem_permit_acces and mam_deny_access.
> > >=20
> > > I haven't looked at the rest of the series. But this discussion caugh=
t my
> > > eye. This code implies that the address is page-aligned but the lengt=
h not.
> > > Is that intended?
> > >=20
> > > That said, if you give permission to the domain on a full page then i=
t means
> > > it may be able to access address it should not. Can you explain why t=
his is
> > > fine?
> > >=20
> >=20
> > The idea was that xen receives some memory from the dt_node linux,scmi_=
mem,
> > then we split memory between the agents, so each agent get 1 page (we
> > allocate 0x10 pages right now).
>=20
> Thanks for the clarification. Does this imply the guest will be able to
> write message directly to the firmware?

We used DEN0056C Specification as base. Available on: https://developer.arm=
.com/documentation/den0056/latest.
SCMI transport is described in Section 5.1. We implemented Shared Memory tr=
ansport.
Firmware has N pages of the shared memory, used to communicate with Agents.
It allocates N agents and assign a page for each agent, such as:
-------------------------------------
| Agent H | Agent 1 | Agent 2 | ... |
-------------------------------------
Agent H is the privilleged Hypervisor agent, which is used to do the base c=
ommands,
such as getting Agent list, set\unset permissions etc.
Hypervisor assign agent to the guest and maps page, related to the agent to=
 the Guest.
So the Guest, which is Agent 1 will get an access to Agent 1 page.

Guest places SCMI message to Agent 1 memory, then sends SMC message.
Hypervisor process SMC request, add agent id to the message parameters and =
redirects it to the Firmware.
Based on the agent_id Firmware knows which page it should read.=20
Then after permission check ( if the resetId/clockID/powerID etc from messa=
ge
is assigned to agent_id ) it does changes to the HW and places response to =
Agent
shared memory and marks channel as FREE ( by setting free bit in shared mem=
ory ).
Once channel is marked as free - Guest read response from the shared memory=
.

Non-virtualized systems will work as well. OS should send SMC directly to t=
he Firmware.=20

>=20
> If so, this brings a few more questions:
>   1) What will the guest write in it? Can it contains addresses?
Guest can write scmi request to the shared memory, which include the follow=
ing data:=20
1) protocol_id - which protocol is requested, such as clock, power, reset e=
tc
2) message_id - action that should be done to HW, such as do_reset or get_c=
lock
3) message data - which includes reset_id/clock_id/power_id etc. that shoul=
d be changed.
Reset IDs and Clock IDs are assigned in Firmware. Guest receives ID, corres=
ponding to the device from the device-tree.=20
dt_node as an example:=20
&avb { =20
	scmi_devid =3D <0>;
	clocks =3D <&scmi_clock 0>;
	power-domains =3D <&scmi_power 0>;
	resets =3D <&scmi_reset 0>;
};

>   2) What are the expected memory attribute for the regions?

xen uses iommu_permit_access to pass agent page to the guest. So guest can =
access the page directly.

>   3) What's the threat model for the firmware? Will it verify every reque=
st?

Firmware reads data from agent page, then makes check if clockid/resetid/po=
werid
etc is assigned to agent.
During building guest, Xen sends permission request to the firmware for eac=
h device,
which is passed-through to the guest. So for avb from previous example the
device_id 0 permission request will be sent. Based on the device_id firmwar=
e will
set permission for clockid 0, resetid 0 and powerid 0.=20

Best regards,
Oleksii.=

