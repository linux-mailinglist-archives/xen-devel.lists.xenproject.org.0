Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A9486599
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 14:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254018.435501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TDD-0002v9-77; Thu, 06 Jan 2022 13:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254018.435501; Thu, 06 Jan 2022 13:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TDD-0002sd-3f; Thu, 06 Jan 2022 13:53:51 +0000
Received: by outflank-mailman (input) for mailman id 254018;
 Thu, 06 Jan 2022 13:53:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+KX=RW=epam.com=prvs=30058094e3=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n5TDC-0002sV-4d
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 13:53:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11e7364a-6ef8-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 14:53:48 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206DmhrC023671;
 Thu, 6 Jan 2022 13:53:38 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ddse8h86q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 13:53:38 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7021.eurprd03.prod.outlook.com (2603:10a6:102:e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 13:53:29 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 13:53:29 +0000
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
X-Inumbo-ID: 11e7364a-6ef8-11ec-9ce5-af14b9085ebd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXrpjAXxKS4DNHhsFYKYBXSjxKVkyg62gojWHlbYq2BFjVK8WOgfZXBCOF9yvhkqFYrxQIwiDuY4tBrOgyoHiC105MrBbRdj7D4ioXt8jSyrXlPb6+2MDdG67EfbsKW6AiK9Bpq/OLbZowwKNLMsP2E/icY2kHc0HNJCiQfzjx314Do6laQfoSWvKE7lJaGwe5NTOmaJLvbJuUSMT8p8/qJOtFen4qY6HuvlS0D70jhk1CExvwmUfiqdrGBVudiSs6MhElvfLx/3RtaYkxygbX+7ywTj+6UNRXU4Pm1N5BD20dkRGQUQ5D6N4RID+Cli28ZbWPUeU5qMNGQ7tBNimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3/EeVGGR9TVnkhJX98pVW672igX0DoBOOdHvgyMcvk=;
 b=GzSkwwqcwFKkAIBjs33Zrn7ClIn/CspoUDA04oiCgLt/ptthMpQqBrEQWEMzk6Ejcw7BR7qb4uDMbaWm62HHNu6VQPAPpr4HPZhieCIuI1HC0w9Bm2ZJy+n31LK1WvG0j4fwmQblahZ/xruOzJ0KRR1JGGtm/2gpB9GLZgilG1O4tdMfB2qvCEVP0PPzk50SmZWGu5cj3TK0BmNvbQM064fH3x+8CPvVcwIiROOCxnXeNMngHjlWBvzhQcEjRPbmdYaUI4zJPbicHus9bEXr+xqbLhJmBRw73tIiXyn+ywVRlUOqcXlYuDFWYOPEd/NO3tHbJcalVnptwydi08QO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3/EeVGGR9TVnkhJX98pVW672igX0DoBOOdHvgyMcvk=;
 b=Bnnr5GGye4oKGi932Wj7ckT3uLgymRVLbAqATKNhvUxshE4niAQ9Ok57PvYB5of+VCvSfFdgV11Lg4skAD8VGX3u69x7ZMskbPC8VY0r0CqD8wY2s7HS9duFbZ4xmHU5Zy/xuxdgNy/HVNtTngIgt5/2OpVP1qarMHz1j7kovqNrlYPG5pcRXQih3GUk7LqZQmBTSjXaQB4NitmDwTfp1KhIajdrhooDPepUUo8Yt6N5u2MMOTy533CoUG080fd6dHrlXvDTy4EcGz3mDGQMAXv1sEK15o2RkL5Xh+Trx54DvbIcOL/QoCZN53SCkigLdOUJZV6BorT0qDmePo336g==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw2ks6AgAAeBwCAAAQPgIAABfaAgAAsl4CABKcNgIAGOOkAgAAnH4CAD3d9gIAEwfEA
Date: Thu, 6 Jan 2022 13:53:29 +0000
Message-ID: <20220106135328.GA1413532@EPUAKYIW015D>
References: 
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <51104b62-14a1-79b8-1184-4f4d8418a2f6@gmail.com>
 <20211217132304.GA4041869@EPUAKYIW015D>
 <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
 <20211217135855.GA4072899@EPUAKYIW015D>
 <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
 <20211220154127.GA1688861@EPUAKYIW015D>
 <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
 <20211224170243.GA1022822@EPUAKYIW015D>
 <045b2836-c95d-541b-462b-d276ae058b0d@xen.org>
In-Reply-To: <045b2836-c95d-541b-462b-d276ae058b0d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa789d3b-5930-4b09-cd17-08d9d11beb6e
x-ms-traffictypediagnostic: PA4PR03MB7021:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB702185FD5E64F01DC1D3A3E2E34C9@PA4PR03MB7021.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fNmWLodguRcIvao546cE4fIiLwPSVLIicSzn4CtrIseJr9CEmyVoBWcSbYGSfea0OPvAhI6B+nOWufIZx/S8cmbxGmOU3UmKSVx0GI59iGea+Q3TM7dhmR1rko/Rzp0CmN43zH+V6RukqhnEugKwKAyQkbm/O3c66L8sCkQeH5ffEyudPQJ/23KAcI+Gi7HH7AEH5/zwduz1HS6S/H5b55jlkKo9RRWuenTEPtKtwOow2OT6ETBLvI9zau068+I/ZEvc1A+7Ix3p7xAmk3oSz33WL3p99cdpcCAhCnuXBKJyT4pw/aapQnL+prfFr68fLBxxiq9z16BKd6y69Q1avBbAOu5Qcft5Hn5e2kNgVDvu9w2ZCVRvXowpwZFuXbuQuIQ/9tqnNN1S7xHMrNFgG83k2ikLtbzPoH+FMM2pvENKoOkI+WHHR/pzXpVD5dz/71Ojmq/Qi7q0xhoy5a56jcNuVM1xgn9Yp41w3F3d7LFzYiK0bOCWjUNNfRqaBhK+r7JWG45BrmNihHCh2RZ8X6AOFlRl79t7o392cAY5KZNLjxX8OAyaYVlTnJnbKzy0VakqRw4aLp/7EvmDnlxJrqeGutAJ02sZcIc87qSpovhszB/981SRgkjswQLpAfkjiDJlPkLzlZ1AIZpC3UJNo5jlJ8RcSLdU2EkwbmXKtFCxNmuuA0KSxLMLG8L+eWWuEjUBU/tjwSj5K8XhcKKyBw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(64756008)(83380400001)(186003)(1076003)(316002)(86362001)(54906003)(66556008)(26005)(4326008)(8936002)(5660300002)(8676002)(38100700002)(33716001)(38070700005)(6512007)(9686003)(2906002)(71200400001)(122000001)(6916009)(91956017)(33656002)(76116006)(53546011)(66446008)(6506007)(66476007)(6486002)(66946007)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GNIeQNPay0ZEBcuiEucriz9CUj2M7lfRDFPU5gDsbkBdEOYLvru/nX0MYxgc?=
 =?us-ascii?Q?MikyVb+XE8yo2Ec8IfhKbT/xamipYM92+GZSYLQ8dKpd5UkvG9eIC7kuqWyu?=
 =?us-ascii?Q?ZbFvlL1iu/XdC/F+vaFBJeEpn+A5NW6mtliOsoTZsfTLv0qNzoajNEPgPGkZ?=
 =?us-ascii?Q?vyEFOVdTUc3ESeOScdqDhIVflXqh5IpQ5clol+3mjSJqts8ExEo4POguUBUb?=
 =?us-ascii?Q?PS8i1U7y7rqItmW+Bpv64a+hppf6ULbi4EtCVbI2QF4yehrnzZaGXRLwkA9W?=
 =?us-ascii?Q?HAfw43JbRSEIkNYqpAvSkf9glmBAY335RrA3yurgdtEWZJuTKJ2SrsmkLvCW?=
 =?us-ascii?Q?OmMQdiE9oCEaPI8dUNQy6ZZVPnHG9Fm4wPxiOv2578uY18vLJ9LZGEjAiPIt?=
 =?us-ascii?Q?TDc2dx+wnGsir4goUKgyHoicx3WsBERQvfySWgWVL8epCQ1EGuRba1yzpJ2F?=
 =?us-ascii?Q?EJJcJzXLKhNVeqT/5Dmlk0VuvokAAzTFyDev9cWBlNOsfdaU/S1QPPKGHdNP?=
 =?us-ascii?Q?YqZFjiYbo9MXKobnyj+tpCrnMDFrZmiDaHM9h4HjrPo0RZHGevf0eN5UvCyp?=
 =?us-ascii?Q?5KLdrM0ROABo1pKPIsUN8wExIrygZKKWmv95vN592SC+17p44fMvGuxUxgp8?=
 =?us-ascii?Q?n4VJtFbLYqKZQSrpSpVVvAZ+HUdDXYxAM6lfvfltoidQ+8pjf6JDaUocB9ts?=
 =?us-ascii?Q?E2vn7nDaEs8e565ALSlz8r62L/wFYPWl+39e5NhPnfpkhxOR8vH3i7d17o1y?=
 =?us-ascii?Q?nwkxUic2anwPfZRKSH28nfIREOBPZlnM8u35xhJZb8pdUZ3UeUQLzBtuvh/x?=
 =?us-ascii?Q?Y/5q4JNujrNLUiGKb4hvHqrQmbcXzm6o/tAtTFfkXXfPp+r+9cBlAbDjyRbi?=
 =?us-ascii?Q?nlSHz3nhxHmSLcJrYwOYK5F9SHr22xkG7Bq9VB+M6zh7iPje/6mqs90EWcLe?=
 =?us-ascii?Q?VlZa3TD/lGzhlPJZuv9H78DHlT4rPpqE8SN6sCF4coDHKtDGJvv5u+6VwY5+?=
 =?us-ascii?Q?eDcjRecRRbQAjpreeE8o8rdGpi6mPY1aEU2BvPRLepZgN61tVX8uDseLC1Ok?=
 =?us-ascii?Q?2qrHDmsBmE0UZ5QtBZkiKrYdcK6bAChwL6rWY1blvNtFIGBHnaPS+GXyBk5N?=
 =?us-ascii?Q?wEL8pvpsip8ihWHglBYMCuFBsJ34Y17TwBt5kqFn0yBealcNonmCfShBf35d?=
 =?us-ascii?Q?Hf/VL5KnF7/dR+zD7fwJvOe0Ii5Re1/iLd7giFkLeWC9GR7QQBddX0VxofkK?=
 =?us-ascii?Q?Kuua3SwBlQH87tUmzpjHBQb4LKljJvH1YN1bYvXM1STNJN1O0oYQ0JpB2u4v?=
 =?us-ascii?Q?kMm14WWilUUlJTAEMberA8HdBTysxBHbMru7ydR9KWHnKaTZrVc2ZZ9XcmSh?=
 =?us-ascii?Q?p4kkYVJPwAYThdXaiYU/Do1g8MhbA0HofZ5i06+Uz81zuheJfeZ1M3nB/VUA?=
 =?us-ascii?Q?NOV/LHYkPzQwJstGwS5DiDrsrihvf7tgeNUXDiJ8ZEdW+HASSCJQOGSf8l5R?=
 =?us-ascii?Q?RVawM3g4MdPSAcLz+PBDwKmLPeL2GIZ2+E8D96sM14UNGAzvVQMIr93oUPiU?=
 =?us-ascii?Q?g2PnnncousLhtg5bAQqnEcPwR885aERfKTKR16keb9IiknrEkX0neXFVMU03?=
 =?us-ascii?Q?9lZ2C4XC7wJAmgtZgmBTTRqy/otUcEPbjh3WAGT32DrKERyzy2dhUZXkEH3l?=
 =?us-ascii?Q?6G4SVQPhyjv90bzNSVPC7hgRsPU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4920F063D5FF21499ED18C8A869A724B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa789d3b-5930-4b09-cd17-08d9d11beb6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 13:53:29.2772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAzrODkqqM5SlSiRw9Hgo7NNegrwehGCriVV/BlVTZrsga5RocUdz1bznS4XrO2J9hYcYQZdzKOmyvnFEAEUNd4jM1o6+oiHlgPkFSbzRQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7021
X-Proofpoint-ORIG-GUID: RqhrKRgkuUQU6qs-zMie3InSpTC5VC7R
X-Proofpoint-GUID: RqhrKRgkuUQU6qs-zMie3InSpTC5VC7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_05,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060098

Hi Julien,

On Mon, Jan 03, 2022 at 01:14:17PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 24/12/2021 17:02, Oleksii Moisieiev wrote:
> > On Fri, Dec 24, 2021 at 03:42:42PM +0100, Julien Grall wrote:
> > > On 20/12/2021 16:41, Oleksii Moisieiev wrote:
> > > > >     2) What are the expected memory attribute for the regions?
> > > >=20
> > > > xen uses iommu_permit_access to pass agent page to the guest. So gu=
est can access the page directly.
> > >=20
> > > I think you misunderstood my comment. Memory can be mapped with vario=
us type
> > > (e.g. Device, Memory) and attribute (cacheable, non-cacheable...). Wh=
at will
> > > the firmware expect? What will the guest OS usually?
> > >=20
> > > The reason I am asking is the attributes have to matched to avoid any
> > > coherency issues. At the moment, if you use XEN_DOMCTL_memory_mapping=
, Xen
> > > will configure the stage-2 to use Device nGnRnE. As the result, the r=
esult
> > > memory access will be Device nGnRnE which is very strict.
> > >=20
> >=20
> > Let me share with you the configuration example:
> > scmi expects memory to be configured in the device-tree:
> >=20
> > cpu_scp_shm: scp-shmem@0xXXXXXXX {
> > 	compatible =3D "arm,scmi-shmem";
> > 	reg =3D <0x0 0xXXXXXX 0x0 0x1000>;
> > };
> >=20
> > where XXXXXX address I allocate in alloc_magic_pages function.
>=20
> The goal of alloc_magic_pages() is to allocate RAM. However, what you wan=
t
> is a guest physical address and then map a part of the shared page.

Do you mean that I can't use alloc_magic_pages to allocate shared
memory region for SCMI?

>=20
> I can see two options here:
>   1) Hardcode the SCMI region in the memory map
>   2) Create a new region in the memory map that can be used for reserving
> memory for mapping.

Could you please explain what do you mean under the "new region in the
memory map"?

>=20
> We still have plenty of space in the guest memory map. So the former is
> probably going to be fine for now.
>=20
> > Then I get paddr of the scmi channel for this domain and use
> > XEN_DOMCTL_memory_mapping to map scmi channel address to gfn.
> >  > Hope I wass able to answer your question.
>=20
> What you provided me is how the guest OS will locate the shared memory. T=
his
> still doesn't tell me which memory attribute will be used to map the page=
 in
> Stage-1 (guest page-tables).
>=20
> To find that out, you want to look at the driver and how the mapping is
> done. The Linux driver (drivers/firmware/arm_scmi) is using devm_ioremap(=
)
> (see smc_chan_setup()).
>=20
> Under the hood, the function devm_ioremap() is using PROT_DEVICE_nGnRE
> (arm64) which is one of the most restrictive memory attribute.
>=20
> This means the firmware should be able to deal with the most restrictive
> attribute and therefore using XEN_DOMCTL_memory_mapping to map the shared
> page in stage-2 should be fine.
>=20

I'm using vmap call to map channel memory (see smc_create_channel()).
vmap call sets PAGE_HYPERVISOR flag which sets MT_NORMAL (0x7) flag.
Considering that protocol is synchronous and only one agent per channel is
expected - this works fine for now.
But I agree that the same memory attributes should be used in xen and
kernel. I fill fix that in v2.

Best regards,
Oleksii.=

