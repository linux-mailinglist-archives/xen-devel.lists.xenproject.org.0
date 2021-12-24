Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2B47EF4A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 15:00:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251384.432701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0l6R-0007P5-46; Fri, 24 Dec 2021 13:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251384.432701; Fri, 24 Dec 2021 13:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0l6Q-0007Lo-Vk; Fri, 24 Dec 2021 13:59:22 +0000
Received: by outflank-mailman (input) for mailman id 251384;
 Fri, 24 Dec 2021 13:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uFu=RJ=epam.com=prvs=2992704931=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n0l6P-0007Li-E5
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 13:59:21 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af21d3ea-64c1-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 14:59:19 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BODeqQS019861;
 Fri, 24 Dec 2021 13:59:14 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d5afjgv4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Dec 2021 13:59:14 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7088.eurprd03.prod.outlook.com (2603:10a6:102:eb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 13:59:09 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 13:59:09 +0000
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
X-Inumbo-ID: af21d3ea-64c1-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G14NxuBf0tWcn/CDEsH5FYz7zoVFJypYEkxcMnzGntVqWWRepu8B72R9fI46cMsqZR5+FSWkxik7pgIHV9hbHbq66Ro7OwWIEVIc7WEmzBGEHo8LT2PYpyXENuDhXzLjr46M5gXqVPYQkl2EibubHAON9SdEp2ZcFwQyjGARUH1dpwGoSkzIDS5o2jsDA8KkP8PA0CsTE8kpz6ys/ZBwTeXAm0Zw9Q6iD4PxiwAPksMIEHJ7fuU86XfDd4GCmzFBLoiqAKJyTGj9aGJvgvBEYHS+NE8wd2qHp/iGK2uSjSoC1Rb+UFd3Y/pcVphNFZ7Ok7NTLptVD4elnEQtKFUIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9kf1b6ZxB571CuLyyJc7Jw/JChSxS819zhX89j+y3w=;
 b=ZB/c5+fr2HI5d47f88MsvYCYav+v9usvtT5PeMw1eANwOuTz78RbkV4sfSNriLF0tVJn1VPhOt2tVCM0h5H37NwBVyb2wRKunh0/ApENRd9upe1SRd5zIqB5PR+sv/Fmcba7tn2XGRc3VRsqJMsAycP7VtLX6IM1EXJWz6V9TzU/wzvspgDSwjMN8ShC5xkcycvwFl8QbBhSkeHDSa3ml76FizQcIJMOfT7oCS4rpUYdmQzeVSflqqIr8BhJ9NqPzgofxWzuNJhkXvmh4+ZDYFv1T1VF4ZVY6mfVjkC//gm1E9QVv4s4AG9cHKYKx1wOum6zfU9dxD3FPbly4k+QEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9kf1b6ZxB571CuLyyJc7Jw/JChSxS819zhX89j+y3w=;
 b=WGZu9cx9kfsX1JvtTHaNLLeBPsSbos6E0U09GBXfbAyZPUDTIAGpbtd3TZAF3KusaKmXjNoWJ402LRHFs5WuEbxj3t5DIWiJCjQm7dIZPnB5nYZK08YraBaBwZaZ9413bzH1aAx6ISRy/oURXnRgbAOgKZGZve3hF7QWtXNa4UTc9IASCQAUzw26QLpKWpvP373hWkPNKKlxN1nAFvaLHXhvJQcp+FdAo7MH0MgZohnDd30eTGQIksN+zCpwJs6ZTLQ5PSmF4HYzNQWbFNzTlBfuHuUT+rmocrOouJGrXYHk3EWV0DsbN4YAU7MTV518ez47JJSHoGp45PDaqhoF/Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgAEYTICAAFamgIAA3WqAgAAIW4A=
Date: Fri, 24 Dec 2021 13:59:09 +0000
Message-ID: <20211224135819.GA945512@EPUAKYIW015D>
References: 
 <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20211223190637.GA99855@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112231610270.2060010@ubuntu-linux-20-04-desktop>
 <437596a2-b375-fc79-a865-186f7eaf10a8@xen.org>
In-Reply-To: <437596a2-b375-fc79-a865-186f7eaf10a8@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d66c0d5-51f2-42bd-b92d-08d9c6e58ef9
x-ms-traffictypediagnostic: PA4PR03MB7088:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7088FAB4CFF5EDF4D267F5F9E37F9@PA4PR03MB7088.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1jWPR21gxbAzTRlQj3pKAz7kFZGv37l3bzhzcFkj/j4F7vy/1sggfMw4K9b6rj1uwPQoBWjeZ5hW2wzM40VQbzHyZHqPWCpyaq9IaxLaZpCKABPoTHf4MpN358pvnlIcW+jABmymZ01AaabQG02Mqm7ExmCTtnpRBT9vokBAktR023o8h+phw/OxA1vzW3nxgXrqMllLYhuuiCnP2TkKBNdSzoBEVc9CmBHgnUQme5OAQ4nBzc3j+06Q1UJAx3bVb1KG2ajPNISBIWAlMWCeaBYDK0ARJkFhQLEPw/lBdU4A3R9WI2S41VNpamFhRmIW6/qJbbrLYcr8FQ66+5x3Igq8F2xnkv1JbQ2dc+F9L4jITpsJMvxeDFg8xVJjOks3+bPi/CHC82dyuKal+wIPgmtTBL9ANx5uwCvelEQ1lHBQfmTCMzqUio6WMdru/JV21aW5Dp3a8zueVUtsSw2e4cETRT8MUckYb603Rk52Puoyrb/E086dJFimwtHya5nkGS4bACn/jMGqK4SRWELxvJBZDB9PqK4ph8Se+HqrrV2wg8wzTZHvLMr68XdTXkkDdKi2lBMgP3n3xJh2eRlK30mdvOzGp8THXuPwCe8yq/FtLqG4PCKXHegV+E51LOIbM/IdObIm+OdLVUO6leq45EG3a9F5h5UL1lsau0FTYX7j0Uv7tYwMEgPEd9OKOB4176QrEnhdO44MSF8JD+gHaw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66556008)(66446008)(66476007)(91956017)(26005)(66946007)(38070700005)(64756008)(33716001)(6916009)(76116006)(8936002)(186003)(6506007)(71200400001)(508600001)(4326008)(8676002)(54906003)(53546011)(1076003)(316002)(33656002)(6512007)(122000001)(5660300002)(6486002)(86362001)(38100700002)(9686003)(83380400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ODCecTU1Sy3OC+0tcDEfoXT6neSCzRK+U7PfBgpA6XbqBXaRSGJc361OjgSh?=
 =?us-ascii?Q?PFICGR8YI3snNJSKpNVSZD5orb58lRV+/s+eE2hSO/tbl8n/aEeisBgZob+U?=
 =?us-ascii?Q?7QAGjhyeK8FIwUZ1bkWXw/5xqeEaXzCRE+kY1HX4aEaUd6V+YosuunIsGM2H?=
 =?us-ascii?Q?aJvCrloHAPSSMgSQYzE/zmCqsvT2RxQ3PTP9zkWeZNCL6tXcqky9NXl32Tpn?=
 =?us-ascii?Q?oZEcXA7PEaa/JLJZwCtCQ4nQbWD9dw5mZWNkgmgl2Ulm6ARjOGApOJeiTAje?=
 =?us-ascii?Q?Fz1oT0M+v0qS0XFXeepC8jVz4L1VRxt49jDKtucHGriGMPmlSU1gME6DBKMz?=
 =?us-ascii?Q?yJm0zDjGze49BlOQzLbdZxpxNXudOwZHgbQ2YeDx7TD5FUdn+XlCs+3icQaS?=
 =?us-ascii?Q?rSHJbmJLfUGsWFqln31rVHxcoEdbKm+TUKJRLE2LE4jR2V7Y1mcuR5DhBV9l?=
 =?us-ascii?Q?hZ8jia/XtBkffdDocb6tVaKz9f57a4FMZGuGgTBuo9XFwKxQwrQEFZZ2s6kT?=
 =?us-ascii?Q?n0I6/70Oz3yVj9APgReX0iQD+6+sNmy/zdEHZR8yiftTnFN770RseWub8enW?=
 =?us-ascii?Q?1eig+ubPR5ApYeoLfHRgG31350Y+6M6WoEfNxX7WSbC0V7HuDi11gFGm4UnQ?=
 =?us-ascii?Q?gY8xrXhY17hQnmkDEU23KKqPTPzy0uGAG5lzTznjEmbrAsjGg/oKjhUXT64C?=
 =?us-ascii?Q?1p6rI++vo+cnyYQdQXOnCGjNcKIZBoHWbemMuutOZHnM+Vj9/zZQ4XDAqrEV?=
 =?us-ascii?Q?zcFDodu0pSKfeGiDLDgGxGBHwgx8fcTO/jPsNpsTwqub9mBdXUyxeuEJmcoc?=
 =?us-ascii?Q?mJHipPJlsljHcnvwPOGfL48p/9SHurSo1Bmw/CCNERnO6ziSAr8Gvo3Xf+lc?=
 =?us-ascii?Q?hvggvCjHcM4DN2EppvAPsHElx7dY+ezpAUlBN7OJ3kz4Rp7RahFe3LuIwVL1?=
 =?us-ascii?Q?JcFWGnP1YWki+fv102J6NJkSfRteQfCnSvvEyF4S5jyvoyH+GGKunLKX5+0T?=
 =?us-ascii?Q?w8n9AI2XdUkBSafAju7T69p95BMIfSudMYq0wT07T5VQwSHb9jc6gUqTHHoV?=
 =?us-ascii?Q?CPj1UycCIWGljlV+PTOXjkU7MQF5YTrkAiPwe2ijGXFgLBlbM/ondbpZB7x1?=
 =?us-ascii?Q?W1Iyx7LQvlQJVfa61mBpkAMiK/ZKj+UiztYhYbQRBC9EgFf3QwgD63byIuVx?=
 =?us-ascii?Q?9YAAuNJ40Pgx6tA4McpJQWcdEp8wEHRNF5pLohh8jjW71Z1U5gOvwVzLo1IF?=
 =?us-ascii?Q?/dNmWtl9lVLsG+rXmzHPvTbxNK6F4Xtk4ldJ9ZXu3tE9DqM3nEYPOKCvpjQh?=
 =?us-ascii?Q?V+fbbrbyYwkcDlBMrdfLedjFxp8qLxA2Dc2ZNAYZ9P8wMr+txX48WdTSHaYD?=
 =?us-ascii?Q?TTIDNqxxDi3GIDSsVWmf0ltjwN2NsmCvPZPv0xq2au6fK4rDQYPLJvGw+FMh?=
 =?us-ascii?Q?7/SgJccN+HJVF03PMtOHc8eY85ML2b7ww0/bNLfn4ISwywJD+yI7cQjPMoCk?=
 =?us-ascii?Q?0YTKDidhjRzjre8cb8jNH9OvdiayTW5Drl49o5OeUjQV+4rIg5MARzPB57+o?=
 =?us-ascii?Q?pPF8bqOKNRlly8Kdh6V2B4nHimHqBN6V0GCW0Zm8jAXY9nZ11tdkIkttb2Fz?=
 =?us-ascii?Q?uSZ9xo8gBNU96xKHtZxMsOaeXZWfTWkqS6l3rQdiKQyh8xRG5XYga5GaHrJ3?=
 =?us-ascii?Q?Jw/az/Ex7Jk+KHD/LXuaRsI0/vY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2F5DA9A88848FB41AD3691DEBEEF2C42@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d66c0d5-51f2-42bd-b92d-08d9c6e58ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 13:59:09.7239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbOe6f2yM4Ujxjf9h+HkM5gdTjPV0pC6XSTJZQPNExeoSOKHcOc3GzsbdiYk4H0lYqdjHTyeUSYpIaofzM6Dnjg7rDeVDo5rQ3RNnPMXnwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7088
X-Proofpoint-GUID: xbv6U0hrIN4MVD2O94jXOmye1IgWYYZC
X-Proofpoint-ORIG-GUID: xbv6U0hrIN4MVD2O94jXOmye1IgWYYZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-24_05,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=1 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxscore=1 mlxlogscore=211 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112240068

Hi Julien,

On Fri, Dec 24, 2021 at 02:29:13PM +0100, Julien Grall wrote:
> Hi,
>=20
> On 24/12/2021 01:16, Stefano Stabellini wrote:
> > > One more question: As you probably seen - Jan had a complains about S=
CI
> > > term. He said SCI is ambiguous with ACPI's System
> > > Control Interrupt.
> >=20
> > I see his point. As a term I see "SCMI" often and sometimes "SCPI" but
> > "SCI" is the first time I saw it with this patch series.
> >=20
> >=20
> > > I think of using SC (as System Control) instead. What do you think
> > > about it?
> >=20
> > Yeah, I am not great at naming things but maybe "ARM_SCI"?  "SC" alone
> > doesn't give me enough context to guess what it is.
>=20
> I might be missing some context. Why are naming everything SCI rather tha=
n
> SMCI?

Because we're expecting other interfaces and transport to be
implemented, such as for example:
scmi_mailbox, scpi_smc, scpi_mailbox, ti_sci_smc etc.

>=20
> >=20
> > Or we could broaden the scope and call it "firmware_interface"?
> How would this be used? Will it be a list of interface that will be expos=
ed
> to the guest?
>=20

The idea is to set mediator type for each Domain, so for example Xen can
use scmi_mailbox to communicate with SCP, Dom0 and DomD are also using
scmi_mailbox, but DomU using scmi_smc mediator because we have only 3
mailboxes in system. This is not implemented yet, right now, we are
introducing only scmi_smc support. In future, multiple mediator support
can be added to Xen.

Best regards,
Oleksii.

