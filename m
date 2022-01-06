Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816A4866E0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 16:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254122.435670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Uvf-00053d-Q1; Thu, 06 Jan 2022 15:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254122.435670; Thu, 06 Jan 2022 15:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Uvf-00050D-Mt; Thu, 06 Jan 2022 15:43:51 +0000
Received: by outflank-mailman (input) for mailman id 254122;
 Thu, 06 Jan 2022 15:43:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+KX=RW=epam.com=prvs=30058094e3=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n5Uve-000504-Mm
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 15:43:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 705a2d1c-6f07-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 16:43:49 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206Fhhp8021208;
 Thu, 6 Jan 2022 15:43:45 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ddt5mhdub-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 15:43:44 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR2PR03MB5210.eurprd03.prod.outlook.com (2603:10a6:101:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 15:43:39 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 15:43:38 +0000
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
X-Inumbo-ID: 705a2d1c-6f07-11ec-81c0-a30af7de8005
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwudkKmYfSs0mTUSGxfk6D91SAii0tWIT4WWb4ASYqbRUZX/FbC+a+dEZ/Z+6TM/Wnh6rZVy/mIlh58I+RGJTNsluaC9C25sEOmPAe6g7BLX5q1zNheMyY+9chpBTe453p6OSnU00eHlA7lR+ZXxsNR+DtYpfEfBo8pCBAqQhia9kGZRs9AVHBjPPSUntV+ujAxVwxNiUOMMLA0gvnr4Aa0ELnicQWl7hcy7ffASTsbF1lN7zenyJkFPz2qxbCVNASC1gp68PIolvQo+6NqPqvlarMtlqClTznVcc0IR1dljZ2Ysfk8K/AUxI8r+EaKe6Fib5qnM2EYXNcPu+lXH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAlntnNhoFpYfvvabp6Qniskt45Dh4DKpT7RlcdZV00=;
 b=THJ+XhHWPyssz3rIu1oNELukwo2GyZJTn111d/MrqadWg1F9/+iUAIcP518wB7dBMK9HM0eRmebwMF16UGOoQCE2HHu1cjFashXX7LsWa8y0G2BZNLTg0XGC9u/qZ4KBuk3wEQHlrzCj7eZNDN7kSXTZFqDLmvHbIeBeeWkxoaifwUz8kFtiUgoDPtAtbeTc7zxtssTfpfNx/G6BqlMHIOYNfJvV921GipOHq6PmUriFdmfqGTS1X7hp4psTvDy9p6WhO44qtYaDMi9UDXsnettM3fpOqykaIZxPri4E1z3mLH06+diWIg43SiLFV78Kpnrik73TApEiE29Cl9Ftrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAlntnNhoFpYfvvabp6Qniskt45Dh4DKpT7RlcdZV00=;
 b=jhNiS3FvKEsKG1d6qQB8Robv0Eqf+apegDKzgymlMu0F1s0y26RcvPpVlRheWVz+1md2U4vbKzR4ULcgFQFx3PtazNTRWsg1HFF1KM3ctxri4VCROLEmWZpLMitL0a0Yx8Jq1VT4GGwYuoEhDqHlbIBK9v/P+SIbNgHuYRolb0xSDLpS4uOFHrvrhlCtBMLP49/mm0HEo9TWj6ttIDLijCGZVSH7UHypZzzJhye82X36/bR9i/CrXiOhrNBhSEmqeSuWmXw2veXIbTvXBy0bUFldzy5dLb/ES9+4OdKR8aSGix5ot1iWScSoxre8SoshAR/o4na6oWcSTHZWWTJSqw==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw2ks6AgAAeBwCAAAQPgIAABfaAgAAsl4CABKcNgIAGOOkAgAAnH4CAD3d9gIAEwfEAgAACbgCAABxaAA==
Date: Thu, 6 Jan 2022 15:43:38 +0000
Message-ID: <20220106154338.GA1460271@EPUAKYIW015D>
References: <20211217132304.GA4041869@EPUAKYIW015D>
 <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
 <20211217135855.GA4072899@EPUAKYIW015D>
 <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
 <20211220154127.GA1688861@EPUAKYIW015D>
 <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
 <20211224170243.GA1022822@EPUAKYIW015D>
 <045b2836-c95d-541b-462b-d276ae058b0d@xen.org>
 <20220106135328.GA1413532@EPUAKYIW015D>
 <55954632-e2c7-5455-6538-29c7990c8f62@xen.org>
In-Reply-To: <55954632-e2c7-5455-6538-29c7990c8f62@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3322df6a-d398-4017-67f6-08d9d12b4f11
x-ms-traffictypediagnostic: PR2PR03MB5210:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR2PR03MB521038DF562C8804554033C4E34C9@PR2PR03MB5210.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rS4UpzGgykrG5phR1RZZYT5INTF5bv9T0Dtibz5cYjwANhEPpfWO7eTy7nnEemIoFL8WsrCX2/gevCHDD8sRk4U/q5AlHj47R77KiLITD/GEpoYyWMf7xiqMGKIncHXGANBYi1IEHL4A5f69i4JulmYCshz/C8q3bMOJzpf6v1wQ5BZnJkfgEJpCSyiBn9YZK+ZaAdm6TjZdfn0cukP6AbaY4xl5JXyVsS3SZIPeMmOz8IqYPDO6R4q7GIX2PQr+V/2aVS21RC8QPYWU5hmjj/PFnoP0xrgyWJChw6jlLji5uFjaQfdfilq4zedeN5NflEzISnL7OkB1Swgt7yjYhe0GM33t8yYW4e5bwT5ULthNJBaJnEm+5BoxC2PKZbNQveZddod/IYxlVMcTPUFDKJ0VopE5JsQv4z//sx9s4PbYy/hOTmRdscJvj5AKDqo31OhnakXDf6Bv24rg5zhCGTDHTNku7jtfvAW6GrMlINDoGfoNecskv3x1xK+WRYzuLv6FtLmNXPAttylriQjGsZJ1dnhwRuOSaC6Y0xMngM/Mfifc6jOuR9GJlQ0alJ4i23mQ0yIQK9r/X7RVZfK5frxjNaGalXE43PXzPdSWn1klcq/8i1IWAmBuGYl3QjIje5J55mscR0XDXS7qVhqGI/yYeJ2/npW2moU46j41rPC/kZV2IwF4KcS9zPPT3RrQh6OZ6xwc2xnW4H4ej+bbqA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(508600001)(76116006)(33656002)(71200400001)(4326008)(6916009)(6506007)(122000001)(66476007)(66556008)(8676002)(5660300002)(6486002)(6512007)(9686003)(91956017)(186003)(83380400001)(53546011)(1076003)(26005)(33716001)(38070700005)(2906002)(86362001)(66946007)(66446008)(64756008)(8936002)(316002)(54906003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3OepuhOgh3r3yWXjsWFTzdPKc8IssR2rRoL7Sdi1CimRx3AkZWEi3M8mtyV/?=
 =?us-ascii?Q?/a4Tn729fzQvss7J1Wt31s2WhRyBR1qChUHcOVV0eGcgD9OluE1089syVv/W?=
 =?us-ascii?Q?hITCi9Yw+tP7CtRo6lSBIpTU93NwmhnbMtmCacW4ijJBFS7BYE8uFGrtKIF1?=
 =?us-ascii?Q?4RAJ2TJzJayrViLkn72QbDijX7WwfaygeByKhDuq6bkyA+4UI91KSaNd9jq6?=
 =?us-ascii?Q?vFk1CwdfiEHjxZqjWMPO+jKzoWAERdm0w9+xqhrNM0exmBSkCYMrYp4cZ+XB?=
 =?us-ascii?Q?3SLkIUIBhAYXPlClcfCE2ErdtJtlmMH2Jb2WXMHutQi9Wvn7ZXwc1MpNmcxv?=
 =?us-ascii?Q?nuUHjas0UD8ohM9Ax4UpZ553V4z3smXUhWjNzS1ynr34THn7WyyXUSM4EeHT?=
 =?us-ascii?Q?rcORtATYTepnE5jTSIu8DN1iISjx5dbc53SJ585oxf1dlF5I1DFJ66FXdxKR?=
 =?us-ascii?Q?s+GPaIlPYIRZTv3Pp9JLhXkYbGW2EnqdK/BA3rouONege5ZJcfuZ0umsHVhf?=
 =?us-ascii?Q?FR3bbAA3PI8IE8tGFR8lIf8b8IdO/+g/jrzhoi0vqw9Qgt6OcuxT++MuzrS/?=
 =?us-ascii?Q?Y+nYV7DncKKHQO3juCeKEHmIwbWG6usS4xl4kAoQ0q5VEBdY+ZXnrIfnXlIO?=
 =?us-ascii?Q?bHIZkOZDOwJD8vTkECXhrBW2o8Q2f/iq0Mtk4gEANG3oLHrRC6qqJpa0FlN/?=
 =?us-ascii?Q?jTum2xbcnu3s9bQMOPlUI5f2Xt9rqtIx2ghT1mZjSBlfwdw4ECeh5GFhNNuc?=
 =?us-ascii?Q?iAj3vNNp29pskWjIvxyM3V4M+MLS6skYUwd8kRIM+nkGcphvvh2k2FrSKkqH?=
 =?us-ascii?Q?mtYhamI5igQ8StGAfmkpIjd5Z5EV359e7VpIcIoSzyyG2uStpnQbbQ4pa4F8?=
 =?us-ascii?Q?j+BY+4/Z23qzIvZmJKeiCCEt6B/Jr28SBtQdd2M3hbcJK3AemWO+1lHjQGae?=
 =?us-ascii?Q?yHP5hII0r68pM2S8z+/5XySUNSTsv33bpczDaVbnXO9aK8u7Td7BYW98IT0w?=
 =?us-ascii?Q?p9bxX8L4yMFYvgtLtD9k+NJcnY5tNv61TOI54w5iVGvJkw2inYooX8Gb73I3?=
 =?us-ascii?Q?QZcUf99LvJIUvQkDxZlu+RQR0xLjQXJ08uXhrGfR2ZZeaHwiMomPm34dxj++?=
 =?us-ascii?Q?0AwFpyQFmDeRhnOFutwy3Tx6c1YVDem1/pT10XfL2FRJdI00BOTZ/sy1zPQN?=
 =?us-ascii?Q?cySRB07+EyQdKqAFQIQkmPeCD45nVW0DjuHLRhcgBkkg8ydO5Q2VQ61ynCOR?=
 =?us-ascii?Q?3eFTzCH8BIxr+Cpa9kQiyzSRgWEbbrC5Evw4owdgm70BKJt2E/en1GQe5FZq?=
 =?us-ascii?Q?ACC0vQizYeWRAT4FdL2kXR6ee4kLp6jwm0k+If5IElt3lnyF9Y8UfWZZEDnl?=
 =?us-ascii?Q?T3M91Tztg2kCXYmgXIn7D2vEjq6xKqYlw4FNDx8Q0OAj3qX4h6Y8Z6sSuI3A?=
 =?us-ascii?Q?A8VqmXvQuTHxF/I4NitORfqXEr/di/Ei18NQ6i2dyG3canQzNEhOgrYldOI0?=
 =?us-ascii?Q?tXIFRetfpOGCypOI8xtOTyI9QB65kW9tUr4hZveH1QlqvoPN/0L3NiU1WHJC?=
 =?us-ascii?Q?W5LOReg3JsmPwmS8wS1bEHrVuUNRS0dDB/1cHlIVKyBV5+3vxN5RsPr81Ml4?=
 =?us-ascii?Q?sSb6xeSyNOzdI0rwwMxzPxwn4IAa1QmcDXUbmYA7FNctF5p8MZsX9bLcQ06w?=
 =?us-ascii?Q?TqJyAPljYHJeiuaWraWHmT1kmHs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F0CA44642A0F943A562F3A67BA1BAF6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3322df6a-d398-4017-67f6-08d9d12b4f11
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 15:43:38.8881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6XTcuDoYOoxWrOoS26cla0vLHChDztzjIKFVPGoeofZhM7oo49LPg2sGBiMmOPiHGJ/rblgFA1EGjvloHmuPJIp5qiFAnS2wnQuyT8WXMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5210
X-Proofpoint-GUID: PE8t8Kr1ttUMEW14HbpweyRVnuaAEeeo
X-Proofpoint-ORIG-GUID: PE8t8Kr1ttUMEW14HbpweyRVnuaAEeeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_06,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060110

On Thu, Jan 06, 2022 at 02:02:10PM +0000, Julien Grall wrote:
>=20
>=20
> On 06/01/2022 13:53, Oleksii Moisieiev wrote:
> > Hi Julien,
>=20
> Hi,
>=20
> >=20
> > On Mon, Jan 03, 2022 at 01:14:17PM +0000, Julien Grall wrote:
> > > Hi,
> > >=20
> > > On 24/12/2021 17:02, Oleksii Moisieiev wrote:
> > > > On Fri, Dec 24, 2021 at 03:42:42PM +0100, Julien Grall wrote:
> > > > > On 20/12/2021 16:41, Oleksii Moisieiev wrote:
> > > > > > >      2) What are the expected memory attribute for the region=
s?
> > > > > >=20
> > > > > > xen uses iommu_permit_access to pass agent page to the guest. S=
o guest can access the page directly.
> > > > >=20
> > > > > I think you misunderstood my comment. Memory can be mapped with v=
arious type
> > > > > (e.g. Device, Memory) and attribute (cacheable, non-cacheable...)=
. What will
> > > > > the firmware expect? What will the guest OS usually?
> > > > >=20
> > > > > The reason I am asking is the attributes have to matched to avoid=
 any
> > > > > coherency issues. At the moment, if you use XEN_DOMCTL_memory_map=
ping, Xen
> > > > > will configure the stage-2 to use Device nGnRnE. As the result, t=
he result
> > > > > memory access will be Device nGnRnE which is very strict.
> > > > >=20
> > > >=20
> > > > Let me share with you the configuration example:
> > > > scmi expects memory to be configured in the device-tree:
> > > >=20
> > > > cpu_scp_shm: scp-shmem@0xXXXXXXX {
> > > > 	compatible =3D "arm,scmi-shmem";
> > > > 	reg =3D <0x0 0xXXXXXX 0x0 0x1000>;
> > > > };
> > > >=20
> > > > where XXXXXX address I allocate in alloc_magic_pages function.
> > >=20
> > > The goal of alloc_magic_pages() is to allocate RAM. However, what you=
 want
> > > is a guest physical address and then map a part of the shared page.
> >=20
> > Do you mean that I can't use alloc_magic_pages to allocate shared
> > memory region for SCMI?
> Correct. alloc_magic_pages() will allocate a RAM page and then assign to =
the
> guest. From your description, this is not what you want because you will
> call XEN_DOMCTL_memory_mapping (and therefore replace the mapping).
>=20

Ok thanks, I will refactor this part in v2.

> >=20
> > >=20
> > > I can see two options here:
> > >    1) Hardcode the SCMI region in the memory map
> > >    2) Create a new region in the memory map that can be used for rese=
rving
> > > memory for mapping.
> >=20
> > Could you please explain what do you mean under the "new region in the
> > memory map"?
>=20
> I mean reserving some guest physical address that could be used for map h=
ost
> physical address (e.g. SCMI region, GIC CPU interface...).
>=20
> So rather than hardcoding the address, we have something more flexible.
>=20

Ok, I will fix that in v2.

> >=20
> > >=20
> > > We still have plenty of space in the guest memory map. So the former =
is
> > > probably going to be fine for now.
> > >=20
> > > > Then I get paddr of the scmi channel for this domain and use
> > > > XEN_DOMCTL_memory_mapping to map scmi channel address to gfn.
> > > >   > Hope I wass able to answer your question.
> > >=20
> > > What you provided me is how the guest OS will locate the shared memor=
y. This
> > > still doesn't tell me which memory attribute will be used to map the =
page in
> > > Stage-1 (guest page-tables).
> > >=20
> > > To find that out, you want to look at the driver and how the mapping =
is
> > > done. The Linux driver (drivers/firmware/arm_scmi) is using devm_iore=
map()
> > > (see smc_chan_setup()).
> > >=20
> > > Under the hood, the function devm_ioremap() is using PROT_DEVICE_nGnR=
E
> > > (arm64) which is one of the most restrictive memory attribute.
> > >=20
> > > This means the firmware should be able to deal with the most restrict=
ive
> > > attribute and therefore using XEN_DOMCTL_memory_mapping to map the sh=
ared
> > > page in stage-2 should be fine.
> > >=20
> >=20
> > I'm using vmap call to map channel memory (see smc_create_channel()).
> > vmap call sets PAGE_HYPERVISOR flag which sets MT_NORMAL (0x7) flag.
>=20
> You want to use ioremap().
>=20

I've used ioremap originally, but changed it to vmap because ioremap
doesn't support memcpy.
What if I use __vmap with MT_DEVICE_nGnRE flag?

> > Considering that protocol is synchronous and only one agent per channel=
 is
> > expected - this works fine for now.
> > But I agree that the same memory attributes should be used in xen and
> > kernel. I fill fix that in v2.
>=20
> I am a bit confused. Are you mapping the full shared memory area in Xen? =
If
> yes, why do you need to map the memory that is going to be shared with a
> domain?
>=20

Xen should have an access to all agent channels because it should send
SCMI_BASE_DISCOVER_AGENT to each channel and receive agent_id during
scmi_probe call.


Best regards,

Oleksii=

