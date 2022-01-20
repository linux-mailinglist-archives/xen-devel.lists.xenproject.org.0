Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79442494BA5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 11:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259019.446676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUf9-0004lh-Py; Thu, 20 Jan 2022 10:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259019.446676; Thu, 20 Jan 2022 10:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUf9-0004io-LI; Thu, 20 Jan 2022 10:27:27 +0000
Received: by outflank-mailman (input) for mailman id 259019;
 Thu, 20 Jan 2022 10:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqpm=SE=epam.com=prvs=3019806f6f=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nAUf9-0004ih-1J
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 10:27:27 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8edbd30c-79db-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 11:27:25 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KA0gHh015137;
 Thu, 20 Jan 2022 10:27:21 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dpxy7h3d8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 10:27:21 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM6PR03MB4743.eurprd03.prod.outlook.com (2603:10a6:20b:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 10:27:17 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 10:27:17 +0000
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
X-Inumbo-ID: 8edbd30c-79db-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyVRkMafX8i8NVIlhUueBgbq+8qG2onT2jqjbTBg472jppyPZUONHZy+5usy2k7K9lm+NcDIO4JG4cQOLSjDT55EfM0rFz8mjEL2ORQqGIbXBKAjLqnaWDDU/i8LIshSkRMnIjnWYQugsOhi/Jcp3r0AtoRzfM+829NwzoYpfn45eJOxZxHFyaeIKpJ8bDZBcF8okYatrgnOTkttqSm9Lh0LtFj6pZejIHhawPUB773vnkxYBMCfR75foAcYqYT8HpVwoJMxRHDdwsSv3B72vaWhzMg7e/X1uMyDMR1+SQLXz6KXjscP0mFq67U+eu6h6t5xfrc8aVlIQT2d2ZcMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pc9b+WskC5Hu1LYFS6ZaqKPPfra/MYV78DT6EwdnI5M=;
 b=E4RGIK6x/DZmVRvdTn8gZTDBE9T8lVVoAcOZbZYbG2TzMlaDQPhs0bVx1RJESDARM2ZWbkW4C40P9B/f9+sSgnqBnQIxjEronHsqcaDCYSOqVO/6tlyRnlPw8pNUJ6tSJqfzE44GrZjyKrpcHd+zH3R2mHiHlp5KA/lIe/eqPtuPQ9hNYv6pHn+TSIbSPembVp4XN8jbnMsQID4/NLqhBwbOlUTnDNR342jdJ+7WrdJq5On7MN38IRvJrq9WaCeQemU7tn8w02VD2OY6kw/cgKqKCedKWv7VR+X86IOwhN/0PB5QTv8FSwjgIFsGlvKSIR4SHLxUHz8enj3UI6KvQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc9b+WskC5Hu1LYFS6ZaqKPPfra/MYV78DT6EwdnI5M=;
 b=S5fvokUssjWglfRDi3cP6xVkATVSFpZLQydbI8oTQkCwqwsyh5vakVKrCCMdp2ygmI8Gri6sG2EJHR9I8EK3e9cSADlzRgZgv9cK/n4UcYqsu2UwsY9/pByCOi11ErEl+Ekf9uSbtFZj5Db8EOBmNbGR79ymE0hHg8Oz8He5/QvPxPxhHRi4KAAeK0IZssUpN22LFCxXfMXnF7Q4hYqLF3v7qyIY5aurP5R1n33iCB7w204jzFI2I5mlpTfC6RKbXRZdTNOQYMGgpPl62qOGS5ORGO5kKpNReFX+m9753qH4HN69hC+59X2Kr4UWs62CHP2XUgsHN2hnd7PJsCZbVA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
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
 AQHX8M3LpzWz4l8PQUiIA2nAUV0H+qw0P2iAgAJehQCABnNTgIAAc5MAgADFCgCAAB+dgIAAA54AgAARtoCAABUwgIAA0niAgAEYP4CAATSeAIAonC6AgAEQDYCAAI9tAA==
Date: Thu, 20 Jan 2022 10:27:17 +0000
Message-ID: <20220120102716.GB4187695@EPUAKYIW015D>
References: <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org>
 <87lf0cx50o.fsf@epam.com> <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org>
 <87ee64x1hf.fsf@epam.com> <796960e7-62ab-6f05-b3c0-cd02d7e8a8ba@xen.org>
 <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112231056380.2060010@ubuntu-linux-20-04-desktop>
 <b85f7ea3-dd0c-1281-d1e2-1010fb2f5892@xen.org>
 <20220119094013.GA3756156@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191733320.19362@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2201191733320.19362@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54bafeb8-37e9-498c-a33a-08d9dbff6f03
x-ms-traffictypediagnostic: AM6PR03MB4743:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB474360FE437B7FC751EDF957E35A9@AM6PR03MB4743.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CkK8HIKayADR02ZssA5UqoUcrndoH0r4p+vO3vdxpm5RMMEeOrEAAni4eh7cQBZXOGUNG1Ksg5tdOosYtSzFdEe/qPBufHLy4jFK2b0MDF000bRZ9EwNcGNMCw0RcBVGzYLcW44VEV9YfzsW+5gIEcVXtgqxBZF3SA1umInv/Urg+NBQnJR7F/uA6p0VzzG5sq0TSTplXl+TE/vazQS246g8kdVHHNxBTy5aD1pPgU7WQsuQunQjDSQlNKcQr1uBFN6v3M1QMYbuuE4gIKSM9y59TQ1ivzpJX9Stj12QplAAdAQRbK0Eph+5DrwQpgY1kqTZvS8zDjrpJudsOVklLNaKxqmnhXQiBu1fMeZ79T81u44Lf7dST6evUSfx/r7dt2nTtfscm0+la7Bm4eo7X3SoAAO5u2x+W0h1dmjxP2TPzWEZlDNxdePYE3U9Rcv4fga1uzEdQmPaprirUstBekXbywxoIBfBn7RejAefI2HQeDnQ4ZRnCgiWBsg5k/qPeUVbcU2nCGYHVIqzB/OyunPMveoJErx8SAAGsZ6N0zxpABYK3l//H5zWHvuwsVyZ/frKWsteVhe/57jJWFoA9Qh7DtBPgT4o6L/7pcfqTXgReQSDVoDJX5pf66h9aD70Z2QG/h2nA9cHvE5foa1zxS50qXT5AeWGv6irKABovoacMlNsXT+SUdglqumNnK3xyjZOi1QBNsxq6a6nbnHQPQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(53546011)(6506007)(5660300002)(6916009)(83380400001)(38100700002)(6486002)(2906002)(9686003)(6512007)(4326008)(1076003)(66556008)(64756008)(86362001)(66946007)(33716001)(71200400001)(316002)(66446008)(66476007)(186003)(8936002)(38070700005)(8676002)(26005)(7416002)(508600001)(122000001)(76116006)(54906003)(91956017)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JIo53VsVL+bOXZwCrsfgFi9FJlOR71rTKPteJ8MtyBvzHF/oOkxYG+k/8r37?=
 =?us-ascii?Q?5mX68fIxqqYwun6YMNP336nbd8Yr6Y5i2LMFvSRhgfhCXrOuQEQSGalvkUwq?=
 =?us-ascii?Q?qzLGJDedcli5GIssTNOIw0aosjsnYpv1zir6Qgv/ftqrcD2VMt+pJIuNu/Z5?=
 =?us-ascii?Q?04xOMklok9oTZj4xOqaGOktLjJ0B0hHi5r+pkv7toZu2M/2Rr7EcMWdoFCPu?=
 =?us-ascii?Q?W9CjIPTB8/RSbrBq2Fp+bY0fyBSW1bsB1w1ZS8Zp2a1Ylg5hUZgOrQFlqqeG?=
 =?us-ascii?Q?gQ/WbTEvrZpVvkMTYaEX+U16EQDi9kQVJHUUCdBDb2VOdPiWkPDdqz1I1r7a?=
 =?us-ascii?Q?NVshSRTAwER/uDnqYStmdGpnyRMz6g+CkW+cLvTDOXwYpT4hWEfPjZBGdXKK?=
 =?us-ascii?Q?V+YvIrjTS6ycsxGAvp0hgdfcUjh7SSzyMAGuXGiNA52n3zkskULm2PSDUXzn?=
 =?us-ascii?Q?8d+RBluPLBj/WfrLxK2STMqtn5IPEJcGd132TEe9rKWprrPLxNSejnJ31XRX?=
 =?us-ascii?Q?9WZrLFkXKq17WXNVWFr0w0B6+3QAcZeGGq49oZc/OQB4D3i6A2lDbF0+QaDx?=
 =?us-ascii?Q?/w4G2KH47g9Yj6/dO//Zk3/z5YqJVXyLdnP2o+JIo8Uba0IByCWo8dvh819d?=
 =?us-ascii?Q?RIZLT68pBOu3oit4pcmBJXWM5N9PBZLZNxQhXTA/+TOS1N5X4Qz93orarJE/?=
 =?us-ascii?Q?kVE/9omJJTeDvC5Ok+g+/3FyBNKV2HfFtoLi+8HUMsg01AZiVcuoWrGlUgWb?=
 =?us-ascii?Q?gwmRh3Oj8Jd5y9GaUfOp/BJf4+EDN6xUU+hwFUAb28m7NQNn8HWmOAnB9iLe?=
 =?us-ascii?Q?63TQ5EM0+FoFn3Pev/j5Qe78gY78VuwowHzawN8wHQS9K4B8qPKxf8QEcgpl?=
 =?us-ascii?Q?wr0HZtFYvnJXV4PFd+zijwn7NIEdU934ILIF2Z1gDNBmSTHkSX3RyCJ4Ud4s?=
 =?us-ascii?Q?qDtejPa4hcG327phuopok1JEcWmOfWwy57LOGkfltSlghBtMoILEPka8FjRc?=
 =?us-ascii?Q?JOJCjGHwihsVttiqJIBQ5i7/ctgHVAl8eEaVz+NPMaE3oy5htFSzTQh8bI0Q?=
 =?us-ascii?Q?pZq4NZlOtp/M7s0My28kEgp7jSOvKde0KFy0PNrJ2Oi0zr843C3E4dHTDlXV?=
 =?us-ascii?Q?cgTqAGoM6US3yQlcqZWBrD/l460D0ytO89COdvv+L+E64PmtI0fIc53HxxO6?=
 =?us-ascii?Q?xdAzMrfLJzZ7XLDiZQS5yW3IsY/vfz8s0piEet/TqwQ3rJcogkXib9SeqF5V?=
 =?us-ascii?Q?MjczQ+EapC7aNE2ks//NgzUk5IxYKOpameR78xxPvYWbs6KyEKIMkdUHZ7sC?=
 =?us-ascii?Q?h0y4HNBNmeo+cb8lEKWPO7bCyvyDrU7oPq9Dyhq1LYzTB0Kkqlv4iNayX9M4?=
 =?us-ascii?Q?Pba48LUOxwGuCtTDAXJIPhD+uWJ5j7cJUrXtXcPPCf7KUubEiHOz/X2BHV7h?=
 =?us-ascii?Q?QQdZa3qaCu4fm9YiREeXQik+2EajUlDoD4IF+AKGZKuVi+whmF+6+Z/fXdQX?=
 =?us-ascii?Q?zuSyxufDPKXOUTwPzvD9xgQBYdl6LF1Hb5xFyph6eSgxmpxELfNU4cLnaJc8?=
 =?us-ascii?Q?bG4MUQ/sy+7OysVulxzQcPfoatbKPzOVTE+uOCtMqcdiGh/373ALjphX+4jt?=
 =?us-ascii?Q?2d/FKBZdnToYrdqwVBxCXhZoWf52yViea7lXelRc8uSy7vuGidvMac9vKL2w?=
 =?us-ascii?Q?/JenmPTkFahmyZI6aSERm+sQygs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1BB2E34EE530764C9D67459CE51520DB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bafeb8-37e9-498c-a33a-08d9dbff6f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 10:27:17.4351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPtcQ52d1hIXuX3Htrxhp5vzM65Ok/KG0O54JH2+T777BNVMVmBWYdhpxhghf94YoXMY2zXdQy57E37y7QH2c2IoVAmXynBh5igHDgPkudM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4743
X-Proofpoint-ORIG-GUID: 4kYmbRM4yyJ8ftEtTAXdClt2ZGdM3s8K
X-Proofpoint-GUID: 4kYmbRM4yyJ8ftEtTAXdClt2ZGdM3s8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_03,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200051

On Wed, Jan 19, 2022 at 05:53:55PM -0800, Stefano Stabellini wrote:
> On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> > On Fri, Dec 24, 2021 at 02:30:50PM +0100, Julien Grall wrote:
> > > Hi,
> > >=20
> > > On 23/12/2021 20:06, Stefano Stabellini wrote:
> > > > On Wed, 22 Dec 2021, Stefano Stabellini wrote:
> > > > > # Future Ideas
> > > > >=20
> > > > > A great suggestion by Julien is to start supporting the dom0less =
partial
> > > > > device tree format in xl/libxl as well so that we can have a sing=
le
> > > > > "device_tree" option in dom.cfg instead of 4 (device_tree, iomem,=
 irqs,
> > > > > dtdev).
> > > > >=20
> > > > > Even with that implemented, the user has still to provide a parti=
al dtb,
> > > > > xen,reg and xen,path. I think this is a great step forward and we=
 should
> > > > > do that, if nothing else to make it easier to switch between dom0=
less
> > > > > and normal domU configurations. But the number of options and
> > > > > information that the user has to provide is still similar to what=
 we
> > > > > have today.
> > > >=20
> > > > I have just realized that if we start to parse the partial DTB in
> > > > xl/libxl the same way that we do for dom0less guests (parse "xen,pa=
th",
> > > > "xen,reg", and "interrupts", making dtdev, irqs and iomem optional)
> > > > actually we can achieve the goal below thanks to the combination:
> > > > "xen,path" + "xen,force-assign-without-iommu".
> > > >=20
> > > > In other words, with dom0less we already have a way to specify the =
link
> > > > to the host node even if the device is not a DMA master. We can do =
that
> > > > by specifying both xen,path and xen,force-assign-without-iommu for =
a
> > > > device.
> > > >=20
> > > > This is just FYI. I am not suggesting we should introduce dom0less-=
style
> > > > partial DTBs in order to get SCMI support in guests (although it wo=
uld
> > > > be great to have). I think the best way forward for this series is =
one
> > > > of the combinations below, like a) + d), or a) + c)
> > >=20
> > > I strongly prefer a) + c) because a warning is easy to miss/ignore. A=
t least
> > > with the extra property the user made an action to think about it and=
 agree
> > > that this is the way do it.
> > >=20
> > > It is also easier to spot if we ask the user to provide the configura=
tion
> > > file.
> > >=20
> >=20
> > Let me share my thoughts about c), which is:
> > c) require force-assign-without-iommu=3D"true" in dom.cfg
> >=20
> > Adding this parameter to domain config means removing
> > xen,force-assign-without-iommu param from partial DTB.
>=20
> Why? No I don't think so.
>=20
>=20
> > This will affect dom0less configuration, which I can't test for now
> > without extra effort.
>=20
> We are just talking about adding:
>=20
> force-assign-without-iommu=3D"true"
>=20
> to the xl config file. For instance:
>=20
> dtdev =3D [ "/amba/serial@ff000000" ]
> iomem =3D ["0xff000,1"]
> force-assign-without-iommu=3D"true"
>=20
> It is unrelated to the dom0less partial DTB. There is no need to test
> dom0less to do this.
>=20

Oh. In this case I would be happy to add it in this patch series.

Best regards,
Oleksii. =

