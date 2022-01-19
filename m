Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6049377E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 10:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258787.446101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA7SD-0001Vi-2O; Wed, 19 Jan 2022 09:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258787.446101; Wed, 19 Jan 2022 09:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA7SC-0001Su-Th; Wed, 19 Jan 2022 09:40:32 +0000
Received: by outflank-mailman (input) for mailman id 258787;
 Wed, 19 Jan 2022 09:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAwr=SD=epam.com=prvs=30181e5aeb=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nA7SB-0001So-Pa
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 09:40:31 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d65a0464-790b-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 10:40:29 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20J92YeP002608;
 Wed, 19 Jan 2022 09:40:19 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dpfnsr5be-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 09:40:18 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7470.eurprd03.prod.outlook.com (2603:10a6:102:108::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 09:40:13 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 09:40:13 +0000
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
X-Inumbo-ID: d65a0464-790b-11ec-9bbc-9dff3e4ee8c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqKN9YZQayXV4oRCwgXz+yBXxlerN1w4clkbPIgn70NNQvqbMcUz+7oFB4PUtDnnL3oLxeTzcaY86bOQa4bqfQ3XaEJcLFa7jXK+fwrSqJpGW0nv7bo5jsLtHOaYl00yruns5wpdmybox5urrVZQD7MehScpFSF7PVKM2pblQYF4JW85JRPK4ScEWMat+UZw1D+tA3BhuEo6blHu27IJRbgYxUQyuStAh8khKOEemt6ZGhfnqJ6Ov3NunT319E7JtD4bo0XhGV89KAQFTJ7T3/ayX7vGVEcMapL+tesuu/FPgW4CELlB4xUnzM/reOKRS9Nh7hDiKc2IQoraBPj8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOZ4WMERj1a4/HyXu3p9Qi+rE7GWKSukMgF5jzAPfhE=;
 b=WlTbirjgL4VtV9RCXVJeRCBTuiHnlxOCMx376LFf22VQUUTPOkFq59r1PW7CqsyUr2JeKpwEvX9f0E/VUuX/edy0phMgUMho29i9GoA2PmakHzLg8Kd1ZO7OwmUJaxyBb1iwzdH6jL0URE4GpYHz6MRi3fuB8dhe7cth7q4izJNP0uZ9iDwKlQ1bcD1pmiVkrjvzGF6fkk7xb9r0S83806enUMYCOkpYrtQr4GhgeBvCZbVJv/fvPg55Eb2/n4UF4uKwdBg5KgOwX2qAHFUbbZec8OtBODfO5seuWUKjCxdOEUvLC+SrLM5dVFYHHhYj9x9QPthog3rObIN4/Ljp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOZ4WMERj1a4/HyXu3p9Qi+rE7GWKSukMgF5jzAPfhE=;
 b=lH9CyXqSDNTvL8UvXzUAs5Jf0YfhONKqufdpUucjodyaMu6Q+tMw1YOSKmmmNFCBqqwr8Io0m8IGUdmORLdtCC1n60pDtgMklJfI61JI86lk1oRNl7awm8d8Elze0u76c5LMQkds2dL8BmAcLkuJiAlRUgrjz9tkECmjjETPeJhoUjOlbXrhCR4EHNivHpB/RSXy+s8W3BAupRw7ey8Fl08YooP69t2yQEaRHXRC4MMzEdJpMcPgXhjTA5CscqqYV+svHjLFe8j9aIzzALzzGqjLrZSdV3///tTA47gFdC9F6x3SD60DDkiM2sKqEP6TCTqLDifXkJHbgnQKMQIubw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: 
 AQHX8M3LpzWz4l8PQUiIA2nAUV0H+qw0P2iAgAJehQCABnNTgIAAc5MAgADFCgCAAB+dgIAAA54AgAARtoCAABUwgIAA0niAgAEYP4CAATSeAIAonC6A
Date: Wed, 19 Jan 2022 09:40:13 +0000
Message-ID: <20220119094013.GA3756156@EPUAKYIW015D>
References: <YcHol8ads22asXGF@perard>
 <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop>
 <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org> <87lf0cx50o.fsf@epam.com>
 <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org> <87ee64x1hf.fsf@epam.com>
 <796960e7-62ab-6f05-b3c0-cd02d7e8a8ba@xen.org>
 <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112231056380.2060010@ubuntu-linux-20-04-desktop>
 <b85f7ea3-dd0c-1281-d1e2-1010fb2f5892@xen.org>
In-Reply-To: <b85f7ea3-dd0c-1281-d1e2-1010fb2f5892@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b474c8c-5314-418a-aba6-08d9db2fb194
x-ms-traffictypediagnostic: PA4PR03MB7470:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB74707A673B79D48D983B9085E3599@PA4PR03MB7470.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eIAcklOEr2toCU/3xOvSrdAc1Vx8I28Le8FLl8v7PEIt1ZNpDxhvLW+97007TnPvFzlAX2a2jS+2ORLsHhGts2rb1cr8hgA3waKNnMnSO96YeaHmmT0zReD0j2iudOYulDDJMiJZIi7v4M4T087IbT4IclStDzIkzVf3rVC1lj2UyBnzbXZiZyDFrYPrx9JZUdu1XXfE12L9uOeUgLT/2CDK+HmlY//PMr2GzDg7TizMpEXcBD6FCtuq/tOwnS2fXQjFcKcCy6r+VmYIDFbDQrxZIO9cZIaMEdcNWBylvdoeOVlXQ6DicUaGoMlR4+UlfKPj+B1UgqR0D+nkyCyYEkRzSSx+Ha6EtOEwNuW8tdqY7NWhfZf7OOjPtKvfHZT/g9x4bpyMdAsH0itjgziA3DTBinsudNT1lrF6Aiu4wcVPpZyHa/bFXGUZtbvnod4u9cAlCsIRY3S+j44qtNuwzrjySZCZAEhZG9OYHwlqjm58AMmPh2ShhM5ZyEr4AVEVPqy+YzIfAoMmalUYpAGoet41pojoEN1Ge3imbjk8C5kFm1jjLvPjAHP4qpXhwqzIgBpDSNoID1m5qldsWTPWLM111zuIoOvZRKXkJYszfGZ+BU/uv2s4/Vae8quiiL7stq2XOVE7Eu0AbIaSQqfjULyLYrRMlipTYgMpuf+COrhWk3BrLACZHqtjiAHVWt+UZJyZU0nJJICcx+BSHKmISLK8xHs+N/ATeIi1NkqCdgc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(1076003)(8936002)(4326008)(508600001)(33656002)(6486002)(8676002)(33716001)(71200400001)(6916009)(83380400001)(64756008)(66556008)(66476007)(66946007)(66446008)(86362001)(7416002)(186003)(5660300002)(76116006)(2906002)(91956017)(53546011)(122000001)(6506007)(38070700005)(38100700002)(26005)(6512007)(54906003)(9686003)(316002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?J8hLLYGXMTPcqOagzDaAi08H21AM3eCVRtFLtwj+hne8H3iRLw7kARUshAG3?=
 =?us-ascii?Q?T4io99KpUedtMiv84L3L0xalz0Oeza6O11RRg/ll/Pt6hONTdYTeCmk+mD+r?=
 =?us-ascii?Q?/eR85LQJyQ9Rsyb94xfr0upz1lpkV/icXZKufBEHGCUbRSXfsDyRt1SS0v0P?=
 =?us-ascii?Q?WAfVtIHqNoXGgKXrPjbiiEZ1KqKIL5Ums/QkNB5xa7554V3YVOXsXZJTpyEK?=
 =?us-ascii?Q?V+KzWCyn4af9HBftreLicygfwkcyAKR+Lel1frnK6boSx0JjNQOoG6lGT1SP?=
 =?us-ascii?Q?gUzaiQ7ynOlNkTT1urpug6yANxfZAJzwqnA330+SswiQthY+Vwia19EmGxrV?=
 =?us-ascii?Q?PDHPNTAj78ow1Hoo5hYMClkh42DkAIhilcxlTX+jBdOGbq0rvjkiC//29M6x?=
 =?us-ascii?Q?EZYvt6+d/CxJQqjRoZWshfQwErxy+L6Vpv6OJa/xh/CvAbYwlPDBUs9HL/WJ?=
 =?us-ascii?Q?5uFLRcdUZ1FxN/w9Tv480jQBucGDyS1kRQ0dZAiLbPolWdZkaZ6ieeJCT5L7?=
 =?us-ascii?Q?hN+7ybWRRmdQBL2CW+qs2B6jknQhvYrchTMq5XQVonBjzhkk9cJWXZOdQd1O?=
 =?us-ascii?Q?++k0gFa7W6PCUKJ0U6w0cM7ke+r8+32hMRkr1dn/tG4pz5A6qS3tjc2mirQk?=
 =?us-ascii?Q?mypUO6NsEBIRbYBk6mGP78/3aVMQe63wmr+Rg4YPfQbLj8wnn5WenI9vVBy9?=
 =?us-ascii?Q?F9poUrPKK+SvwxuVn1fd3FHRfTz9Z5CqGQkIFpxvaAxGgs5LfEndir5YRka8?=
 =?us-ascii?Q?IVuZ66O0xbL85J1gFlPkxh+7my0vvdyL2nnPUs4OH4IaB7TyNAwxIQFZJagl?=
 =?us-ascii?Q?i3kyAaxx/xE795dBf0uZMr8L7uT+yeu+tte1iei+qBM3KOF32VOy3n4uieJk?=
 =?us-ascii?Q?CBIRQFqTMBE63GID8SoDT318xwwqghseCBdvAMYCzMnSH5aiwcmlzqZLXQDY?=
 =?us-ascii?Q?93uxhiXmv+g56sFhQnxWwV8vBz5w95U7VI3Q1PgxHPxH3ozd/VfH7DlXtTNc?=
 =?us-ascii?Q?S/AS3WtLhBt2k+Y7CuJmgQ2LdxwcZehSrEjRhvk2O/veTvlDWlNnfmToB/Dx?=
 =?us-ascii?Q?hYCRFZ6a73X8fc9cWKl7nO5AxyHc2LPCbqjDonTgv5cQUUCtkv0zKSJRcV6f?=
 =?us-ascii?Q?BO7Gt+MthdlWCsR3atf00WHbJKeEV9ri+K21Ei1RErNXt2HBL+jugaJrsXAb?=
 =?us-ascii?Q?KP05UpNcbtpAA832R1fue1lgzNBKLUqebRAhTpKzeUbB4MqWjLCPmMOLSr40?=
 =?us-ascii?Q?jfAiy4i+IIaixZbTaD3rpPy46C/UarXGK2aLYoq6QoVu22aPVnBOzVcYMrFp?=
 =?us-ascii?Q?4c/4DLd/QB8Nej8liJFyZHNOuw4RmshjKUS1yDH1Y08IyEzqSEu59Ml8jUWA?=
 =?us-ascii?Q?4JApI8hPb+C8M7XPgo5Nk5s39A8pPeI2YKlFdxnmq0/ypJjHWR5GBAMISyjw?=
 =?us-ascii?Q?dZxc1aZo+bpzG+by3ec1OK3q0XugFm/lgget+NRuL6rHMPVVa6WSHYzlsqlE?=
 =?us-ascii?Q?9225N7mzBVCWtw0stxtqnUa/irqcS/dapiP9Q8clZ0nV3VZM2OsgCaKwYyeN?=
 =?us-ascii?Q?6Z31T9LBHXdtv5OkZYOTGrt1+mCoOTpBR8d+k79vSOuO+IPHuNqMkN3Z/CT2?=
 =?us-ascii?Q?rCckdu8RNYPZ3OPD0Un2molO9XyPOwkXdUBNv2ICbf7vBJCRWRXXp2MCRYN2?=
 =?us-ascii?Q?k5zimE9zfOb++f64A6+0DYQXsm8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5D5C38384D22A1498067AD2AB45FA59A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b474c8c-5314-418a-aba6-08d9db2fb194
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 09:40:13.8111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ScB55u2FwQdgeWWldyC4o2G+RxaIIaLdJfvaA6CbAlNGZ4aCIqmEc/CsAzhELpZjCIyDJG8H1iL83A/FbBa+2MjsVOPhdIF0u6aPgbRd7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7470
X-Proofpoint-GUID: FTiBLIj3ag21Nng4292pG0zHwB3ptUyt
X-Proofpoint-ORIG-GUID: FTiBLIj3ag21Nng4292pG0zHwB3ptUyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_06,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190052

Hi Julien,

On Fri, Dec 24, 2021 at 02:30:50PM +0100, Julien Grall wrote:
> Hi,
>=20
> On 23/12/2021 20:06, Stefano Stabellini wrote:
> > On Wed, 22 Dec 2021, Stefano Stabellini wrote:
> > > # Future Ideas
> > >=20
> > > A great suggestion by Julien is to start supporting the dom0less part=
ial
> > > device tree format in xl/libxl as well so that we can have a single
> > > "device_tree" option in dom.cfg instead of 4 (device_tree, iomem, irq=
s,
> > > dtdev).
> > >=20
> > > Even with that implemented, the user has still to provide a partial d=
tb,
> > > xen,reg and xen,path. I think this is a great step forward and we sho=
uld
> > > do that, if nothing else to make it easier to switch between dom0less
> > > and normal domU configurations. But the number of options and
> > > information that the user has to provide is still similar to what we
> > > have today.
> >=20
> > I have just realized that if we start to parse the partial DTB in
> > xl/libxl the same way that we do for dom0less guests (parse "xen,path",
> > "xen,reg", and "interrupts", making dtdev, irqs and iomem optional)
> > actually we can achieve the goal below thanks to the combination:
> > "xen,path" + "xen,force-assign-without-iommu".
> >=20
> > In other words, with dom0less we already have a way to specify the link
> > to the host node even if the device is not a DMA master. We can do that
> > by specifying both xen,path and xen,force-assign-without-iommu for a
> > device.
> >=20
> > This is just FYI. I am not suggesting we should introduce dom0less-styl=
e
> > partial DTBs in order to get SCMI support in guests (although it would
> > be great to have). I think the best way forward for this series is one
> > of the combinations below, like a) + d), or a) + c)
>=20
> I strongly prefer a) + c) because a warning is easy to miss/ignore. At le=
ast
> with the extra property the user made an action to think about it and agr=
ee
> that this is the way do it.
>=20
> It is also easier to spot if we ask the user to provide the configuration
> file.
>=20

Let me share my thoughts about c), which is:
c) require force-assign-without-iommu=3D"true" in dom.cfg

Adding this parameter to domain config means removing
xen,force-assign-without-iommu param from partial DTB. This will affect
dom0less configuration, which I can't test for now without extra effort.

What I suggest is to implement a) + d) in this patch series, which is:
    a) extend dtdev to cover all devices, including non-DMA masters
    d) or print a warning like:
    "WARNING: device assignment safety for device XXX cannot be
    verified. Please make sure XXX is not a DMA mastering device."

And introduce a) + c) with the next patch series where dom0less scmi
support will be done.
Maybe leave a comment in code that force-assign-without-iommu config parame=
ter
should be implemened.

What do you think about this?

--
Best regards,
Oleksii.=

