Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EAA4B4D8D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 12:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271430.465864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZI8-0006qN-Q7; Mon, 14 Feb 2022 11:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271430.465864; Mon, 14 Feb 2022 11:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZI8-0006oY-MY; Mon, 14 Feb 2022 11:13:12 +0000
Received: by outflank-mailman (input) for mailman id 271430;
 Mon, 14 Feb 2022 11:13:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fl/D=S5=epam.com=prvs=4044f48eaf=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nJZI7-0006oS-Q3
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 11:13:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16be63d1-8d87-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 12:13:09 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EB3sG8018396;
 Mon, 14 Feb 2022 11:13:06 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e7nvfr0ve-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 11:13:05 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VI1PR03MB4048.eurprd03.prod.outlook.com (2603:10a6:803:6c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 11:13:02 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 11:13:01 +0000
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
X-Inumbo-ID: 16be63d1-8d87-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKopcK520S2aotV2j/zX7iVnd1eVXHiRkIW1bD9cI5fddMntXkUYCDYtdBi66L2Av81fPWWULh5xtWZfGIG7noozTtUHc8YQH/NwZlqKv7jI7CKyZgoZJ0jwYC5cMoorew31XsGNGyt7bqzH5LUBc3jxoFpjkeEdL6HqVR7S+xCGMSFpplGo9+i/MyL9hc5ghPlzfULwO+ajybJhLyxXI8D6b6zoa1PhKNWrXQrPEns9hS2yD2W/xuvMhJPdTPM3L60A8NIWohaaGSnhF5mjGjSgiusZqXVusvP/FQcM5sFRGHd9EF8BdA3sOtbcqmlnJBLldYNObA29J64za8jbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWaxXS7Z1X7Gxf4sIFuQi9p23QJMjFL2IpMhQlPDNng=;
 b=Qo2MjaPPKY5TW254dHJcN8tG3f8YQNiH5uE05uAHi7Qo/I7Jq40PSvi/MzEsPf4SHNHvQHp3OwLDqcNnCZIAE4IMmnT9vwlLb1v8EPMgecPe7/r/Uh+cJ4FlJ+6Bq9l9aZ8X2F1SVa9JAsFIz+KCW1GZefke0oPpkKCOlu/x6h0v+Q5cs88Su/6d1yIzCbRtzxcW2SoCI5uff7M3vOQ4VsR70bFDuSs2qbLVjafnfs+0zo1CG5Wxys7ECq7zB+O7MHXtXGb5G4JQVUfDFIosSJKJJOmu3oDIkgqS0tth0zpKy4xNznfW9ZlVd0O4TXyUQNjouey4mIhoxV5IuJ+GNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWaxXS7Z1X7Gxf4sIFuQi9p23QJMjFL2IpMhQlPDNng=;
 b=UKlGRkQTJRRi1e4OivuvhQBERSk+EDt+uo2Yo0Av+WPzhfCujIr223RiPDMLYp1ptqhLXNaZKKhmpUUHcNWiMQaYg0f/xzzAnopF+VJWRN5pBtlbUx1jQp8SVTCvvbVHTUyHy9bmUWkTu50QbireKpH83IAwN/jZaG79oiqujZkbK1Lg9p+S6qiyhj9lZJT/cbrpi2jnmv4g3J16XWNv+BicBMcpbGMYSXAsEqYt5DlSZ8UVF+FEhej2n1zlOzQxAM62fLytGPMxkAk/RNZ/BUey1JRd/zOUrGpDqAiK8WMjIU6P2nlMyyE1CgANu9stJppviByXPsAbwojqOoTxuw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: AQHYHRW24Dmb0qV8ZkqAv39Pf6/nVayODW6AgAAg+ICAAAmzAIABqiEAgAMLQQA=
Date: Mon, 14 Feb 2022 11:13:01 +0000
Message-ID: <20220214111300.GA3615313@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com>
 <F9811680-C6EC-4372-A451-5C1DA279E35E@arm.com>
 <20220211104403.GA2291814@EPUAKYIW015D>
 <A9FF3FBC-C29D-4A17-8737-EBABEF240BA2@arm.com>
 <c13f6312-3922-4504-3248-e2e4701b1a10@xen.org>
In-Reply-To: <c13f6312-3922-4504-3248-e2e4701b1a10@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 439d4a28-00c0-460f-52ec-08d9efaaf725
x-ms-traffictypediagnostic: VI1PR03MB4048:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB404812D466520413022BB96AE3339@VI1PR03MB4048.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 S9RwJdiqOAVTc25eMhe+p3L2jzSEdFbkTPvBU0TRJminAERUojunD+DdWnOetbXEbTuPGZFU3mzW0Zr5X4yK1mcV9twJ58Xjh8yl0KDy6bOURwMoDykPvAdDK6dhwgL/nc9wieSZkusYRtAV0mEweqQoHcDCjOqJVqyDa0gtfEoFgvLmS4lnO0GqusKBpNnu6pKyBPfzYM/pJQ60EhTnKPfneladrwgLCn/EKHVTvHt24AOpRJUJK+R+bQrU1K8Kdimgy0q/Wv9IIQVqaj2f7aXpP18htBvhNCIVFbRVOeqURsplVl/nrvy1WZeCkHNOL7uznunuhkIwaquJCziPMs4qOYITpmAItwIwUBwdD79KA+HeSM75au7QHtGF3bNqImRZm8tmERhV1E9/75Lope9eh1Qal0bKbpBpo+BWnc4yEckQgNj3yR26yrhLI3ag/jfi1vTMEF8UUQaRpqfqGEpC+v7wSRNZs8QrSHzjVwGB1ANdZUDj8YgcbsMxH6DpOLKFXhRGNBgCB2VdQjK/IZWHt50t1XDpyVTl2c6b+7PFAE0iaLGijBTeh07sRbYIDBvj2k8wthZTxiJhIgg+MfaHXoCfNUl+70S89c+gRk05KZDOGRmSmkdbzkIUdicpGyjRTXF6jfnSGxKPZh7zGrTP2EFgNyjhVXM2vu4ux9RLd8dioemu22enmZFLkfu4BQw2RLHBA4X2ZrFiNJy/0sB0I0xaiAbjXpP03TEjzewEmjBnXqy77KjCKF+0zimwHlpD7FAZMcogRuswd6ZUHFVONP0iNyE5pcnskFOW6H8OmR34PxtpT3DIu1CyVl7pZ1MJVCjOn3YH+bUtm+dCVWjiaC6MwigWNKkm49qzQhMRnwxdUljgWEP9Ujdlr6jj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(76116006)(83380400001)(4326008)(91956017)(107886003)(86362001)(2906002)(5660300002)(66556008)(66476007)(8936002)(66446008)(64756008)(8676002)(6512007)(9686003)(966005)(6506007)(54906003)(6486002)(33656002)(6916009)(1076003)(71200400001)(186003)(33716001)(53546011)(122000001)(508600001)(38070700005)(38100700002)(316002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Cogbt11ya8WUbJEN8UdtLplpzCDXSVO72b8CXjNR0ubavWLFXeezZ9ETT9TG?=
 =?us-ascii?Q?uHQlrn7yGjEJlX09P/Ck7FIEonaeaUukgVT43cqrKveoiikMzD2yBSm8h7Mc?=
 =?us-ascii?Q?fnHaJnjiXZofJY7t2clG3k0NPUXIc/W9W02PWGof76k+h3UDaIX2xnHgzARG?=
 =?us-ascii?Q?0C58IlUZRKaVcWD7+XcHPxiW9xYf1kdFyIDdwT4/jLaYs+HySr2iK8uhlf66?=
 =?us-ascii?Q?iPBOFTzqAgrJNmTP2ZY82cKmxsXmRImhVadM3tZcAUip65RuRBpDO3BuiQS3?=
 =?us-ascii?Q?9DElyssxpu2rUSkGGhibZXOrYUFChXd5968bvK+fdZY1MNAVJK8Np3S+q02u?=
 =?us-ascii?Q?9yc+Dr5hgUAhMUEqXsDTxJKeqntjPoSdY7hOQaVLnJh3HGGccaW6ocVB7xGd?=
 =?us-ascii?Q?L081CIY72/cspg0opCb5YB9vVL0DfYwR7xiHa3LikvSVUQXN030A7ZCir3h7?=
 =?us-ascii?Q?hNjTjzO9t/xVPIE+VbqHd7IczY6hrkRwDWBiMgcWeRj2Eb4XPxIh3BEeofnx?=
 =?us-ascii?Q?nSpgpoRBQWX1rEcRDEYdC3TLONmWrMcVOd79FYKKR04CkQIPlFxE1S6+M7m9?=
 =?us-ascii?Q?qW0Mr9ZfcIVtESLRiMXQTGC/w3jTzt6w+EOOJniguEfEALT2GSrfnJ5ga0mb?=
 =?us-ascii?Q?Qeu1MSQEEqybOptR2U6u3lzA2Px9+M7tqNIyGK10bOSHtBalJdbD0Z+d1+Js?=
 =?us-ascii?Q?8IS8F3AYX0TrUyDjPfSDMla5HLvQJV3s4xlujJgwImyDgieibkzWWfLawO9a?=
 =?us-ascii?Q?AFuRSDZ97BrnbGyCwo/Y6A2VuklAIltlRgfEIJFqEHqnDxXZ5HQEwckphJb1?=
 =?us-ascii?Q?B198lefCuOr1jEbmwX/rDtpMe37wn/GdkQGnQG9RN5DAWnalDDkukUpt9HWV?=
 =?us-ascii?Q?e/u2FpPT356kSjOugY3zKUpGhbl41lx465suE1g+N47JwLiK+lz2izSymh1j?=
 =?us-ascii?Q?/DSPomTm3Hklw3TogasG7IItz51K9HRyK8E3E82pEjP7YZGC3JwrQSnD4zMl?=
 =?us-ascii?Q?T8GnuDRIfwA2rQ9leDc3hfO0U0BW4auZVONNeAr0uvTPA4rr5rJNG3Pat9nb?=
 =?us-ascii?Q?OCB6q4W69C06OEKYF1c+t8Ygduley2UPnh+/kOBDvjkR1yApJfScR2/1LuHP?=
 =?us-ascii?Q?iZNUW0JV0VYSh6368P3VG5I/LZ0jmBgQ1VAUKOdOkIcIBH7/0AMhwNQE7yxl?=
 =?us-ascii?Q?Fa6wrJKOYYMKyzma7NylRxHHs46k668yVF3BBY38tpuv3lEdEAdLNj9LlhQ3?=
 =?us-ascii?Q?xoCsU2zdUFHqxPKgNlnNgIYA3FVCZInqgZ4YI1j7BtoLxy4nr9T5KfhpxAR5?=
 =?us-ascii?Q?ZYTsSbHqnKg88FSINeesmyqnYH2AaPo0aeoNylsfoQkrCgJCImRFUpJn9oAW?=
 =?us-ascii?Q?Oh9ItWxh5Jkx3tSlyfgiDiX89jADFtsPOALDmq+TZsPJOUIVKLMZnxzoJghz?=
 =?us-ascii?Q?GP+GMnYEcfi3af7RnQpcJcTPIRscNuD+AZjNq5Zv0Iux2UV4M036n1/MiTnL?=
 =?us-ascii?Q?LiYid6Uj7AGzfUUo2SGzm4xtCBXJMFARO/JulFDyIx32QEp7mPtyD7ggA5+4?=
 =?us-ascii?Q?SHrfLm3WlK7GQwU/f7Hkqsq6xgEnXMSmgjeoYr70DlTHXY19qZMBkqfiWhBy?=
 =?us-ascii?Q?HI5EEI35Iq15FcM1yUGvGvmbVasHIyAyVksOh6abhzB2e6aUJB1ki6tX3i0p?=
 =?us-ascii?Q?Ki3VSQEnIFrqAE5dLQwXPz2/voA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <20477E8907A18E47A6B315465FF00150@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439d4a28-00c0-460f-52ec-08d9efaaf725
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 11:13:01.8751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fplD4PZ0p3LWiN/JQ5+OsIsITB/iUmHm1KtTnH1SN0srTGQQCwE3DkXepvvAAh0I8E1ScoovUUvnP7EoGFtICcI/qm3yY8UnOszEV3aqpjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4048
X-Proofpoint-GUID: XjdeaObatHf1vfpPiORV_B7SEGa_FKzs
X-Proofpoint-ORIG-GUID: XjdeaObatHf1vfpPiORV_B7SEGa_FKzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=911 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140068

Hi Julien,

On Sat, Feb 12, 2022 at 12:43:56PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 11/02/2022 11:18, Bertrand Marquis wrote:
> > Do you plan to add support for other boards ?
> >=20
> > Did you discuss more in general with the linux kernel guys to see if th=
is
> > approach was agreed and will be adopted by other manufacturers ?
> >=20
> > All in all I think this is a good idea but I fear that all this will ac=
tually only
> > be used by one board or one manufacturer and other might use a differen=
t
> > strategy, I would like to unrisk this before merging this in Xen.
>=20
> In the past we merged code that would only benefits one vendor (i.e. EEMI=
).
> That said, this was a vendor specific protocol. I believe the situation i=
s
> different here because the spec is meant to be generic.
>=20
> > @julien and Stefano: what is your view here ?
>=20
> I share the same concerns as you. I think we need to make sure all the
> pieces we rely on (e.g. firmware, DT bindings) have been agreed before we
> can merge such code in Xen.
>=20
> The first step is to have all the pieces available in public so they can =
be
> reviewed and tested together.
>=20
> Oleksii, on a separate e-mail, you said you made change for ATF. How much=
 of
> those changes was related to support for Xen? If they are some, then I th=
ink
> they should be upstreamed first.
>=20

Let me share changes, that were done to AT-F and Linux kernel
device-tree in terms of the SCMI mediator POC.
Changes to the Linux kernel:
https://github.com/oleksiimoisieiev/arm-trusted-firmware/pull/4
Based on renesas-rcar linux-bsp, branch v5.10/rcar-5.0.0.rc5

Changes to AT-F:
https://github.com/oleksiimoisieiev/linux-bsp/pull/3
Based on renesas-rcar/arm-trusted-firmware branch rcar_gen3_v2.5.

All changes that were done are not Xen specific. Given AT-F changes are
the implementation of the SCMI feature using SMC as transport. All
changes were done accoding to the DEN0056C [0] and DEN0028D [1].

We pass channel_id via SMC to the Firmware on r7 bits [15:0] (See Section
4.1 of [1]). Then Firmware converts channel_id to agent_id. Channel_id can'=
t be
equal to agent_id in our case, because, according to the 4.2.2.8 of [0]
- agent_id 0 is reserved to identify platform itself.


[0] https://developer.arm.com/documentation/den0056/latest
[1] https://developer.arm.com/documentation/den0028/latest

Best regards,
Oleksii.=

