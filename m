Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F944B4F59
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 12:52:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271472.465920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZtK-00056W-3w; Mon, 14 Feb 2022 11:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271472.465920; Mon, 14 Feb 2022 11:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZtK-00053P-0J; Mon, 14 Feb 2022 11:51:38 +0000
Received: by outflank-mailman (input) for mailman id 271472;
 Mon, 14 Feb 2022 11:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fl/D=S5=epam.com=prvs=4044f48eaf=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nJZtI-00053J-J1
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 11:51:36 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75205ab6-8d8c-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 12:51:35 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EBmegr031673;
 Mon, 14 Feb 2022 11:51:31 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7pbw0113-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 11:51:31 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DU2PR03MB8075.eurprd03.prod.outlook.com (2603:10a6:10:2e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 11:51:28 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 11:51:28 +0000
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
X-Inumbo-ID: 75205ab6-8d8c-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj8z6vQ8CYDd8y69gXvlohtC1M62RL2s5q/gw6qMU14S/yOcWO5AYyXT7sY+wZyjvz7OP0sLPhe20Oa9jTlFu+rDfhLAz0OelUVbEW5eobYcmSzT1hbJODJFnwnFT9H3nlzAYwyFIIT1hzwZcK9SYJjM1SXMEmJmcI/sNhMnSnkbruqxGrTrlCWivW7LQZQXi6T9p6P8QikM9VQC1Wk9s4AARouvPqcRv1rsi8g9aC1dne5tNMVLGM8pBe1FCLX68zhr15yqakYy8y4XFYNdmfiYkbpNkKyOhGZ8mQuky2ahza0NKPfpasUEnJ93UM6QwoOoC/bc5OP25ma1gXufog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fst2D0zh1VI0gfzIlirfbmElXSEF3iy1BK0XTAg6il4=;
 b=FzSAZueLRN7UHdGoiX+aSGEjJSbFhJCmYge7AvSVnazPFp5+5GxlBl5Vqhg4dYhOglcmH+hoN/76V0Onthn2DOpG6MLTg/MC6GB98HF4vDdq7VanhoEIbU1v6QkkXZGZZx97KWnTd5j1CaUwXe3benChd6fE2XKYimiFluJSJefmbqLVQzqaFrFTa2afFx2WEjROCEKelANw2R1GuiLhLhYWWJovMM3k8mVu7DgRoX5neRoCYcwOHq1MRXL6GpLZia8exYLr6sWlvd7uQXe6tzg/h7PY9emFrqdGQKCej0jVNx0MrXvMIcIu1M/1sjtuWb84jpE6vOGlTpWCY1Yt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fst2D0zh1VI0gfzIlirfbmElXSEF3iy1BK0XTAg6il4=;
 b=Oig+DFeLvIW7QlMsn8PiZ4a68kHvYkTeQwY3UpfOHH3A2kfxKIQn8IxtYc+/zZPJ8W/3h/7jRv4Il9nlDACOxwN31ZYnD3McW2nEdC+j0m9sGZYcJDKqO3vaegLc8TnQS+jIiqZHbuJXdKhGWEhJnPXc1nDR4VoY6Fl8/Pc4B1mIxJkK3wkOfIB82lsiZehnSE8DwpgRg3QE/3Jrf9cd+yvfvMw81GbQJtvd9cI2Prh/rO/KzTPBZSa8O2u/UxAo7czVSlyYbzPHSbJEuEH+V52t+AzUMK4y3Owo80LwlGgQZcxe9ETSwDFJxZmrc/mLj6eRq9DRNUtN6VFnGKLSSw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHYHRW24Dmb0qV8ZkqAv39Pf6/nVayODW6AgAAg+ICAAAmzAIABqiEAgAMLQQCAAAQDgIAABruA
Date: Mon, 14 Feb 2022 11:51:28 +0000
Message-ID: <20220214115127.GA3637134@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com>
 <F9811680-C6EC-4372-A451-5C1DA279E35E@arm.com>
 <20220211104403.GA2291814@EPUAKYIW015D>
 <A9FF3FBC-C29D-4A17-8737-EBABEF240BA2@arm.com>
 <c13f6312-3922-4504-3248-e2e4701b1a10@xen.org>
 <20220214111300.GA3615313@EPUAKYIW015D>
 <E78206B4-3793-498E-A580-F0561DF6D4AC@arm.com>
In-Reply-To: <E78206B4-3793-498E-A580-F0561DF6D4AC@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 915e20ac-91d6-4c85-2b03-08d9efb055be
x-ms-traffictypediagnostic: DU2PR03MB8075:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DU2PR03MB80751B068CC52B2C9717EBD9E3339@DU2PR03MB8075.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pQ0+pSBVf1iWNUhPgv9cjFL0PsmRQRDvk8lJK8mHbEimYCUyV4X3CnU4vMvbo6MqxsW9FcdNjeAb7GxGGQ6FCRGHg7+m/STxcDxuxkE/t2MYHlTeC9Qcyxnvt+hBUzNbjJgaTxpwlsFusctuJdXVrbktwGVxhSG6Gb6MYoFtYmZEBFERrqy3iM6afpn0WU+xys20zFxyCuL9w2oCWvESpPoX2lSSvrJJ+F1t0hrOtmk2sv0kdC5A8ndj1Gv62HO24yjSnCKEfFc0SpZFf5CiJDoPC62lDb6cxj2/sWztAMZGC2nVIb5pNCIZhvkLc3t+7Sm87WIarvADsujEsqmzvHkYknLDEIwMLcN6MF6hh/UTOzNMSI9+p463KITfJ2UzBmDQk0xs9jNqvwV9Y0P1h/4zR8oYUcdsiROsU44tHWRGsifLik2BMXzCuGj70qTyDpLJEc72afRePWvyy1nuu880tqFdB04q+pLTLslA1e3VxWqN3oNkWzJsWJicBVCwgC2i+eMtiP3sju3tgiOWitXadHf3KE9fdpVzkac152p7N7hpGn1bZrPki9zdXRtTI8rV6tuK3OkhfwU5/n3uWXNXEpCPM1oHTkudiW+QH0DOsMVdJwAYRR8FKUeC81PCRd86ljGELzwB00PNjA9cZVHX4O3OAUn5zd29sTadzSFYgx/l49DSZsFeyq+xYhm8/L2elyE+9XGFqJlEFoXEBPmM4fLn7JoseL5PVUMhMnKldohq6D2WZlvMMxfflFa8ix16X1Sfn5QppEvWMuxx2ZpcaIDIC636OKeszqimazygaCwQjsAg0D08WqhW/Pcux/iydGlnCk0a+EWaOL62pA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(6512007)(9686003)(54906003)(508600001)(71200400001)(6506007)(53546011)(6486002)(966005)(76116006)(2906002)(8936002)(4326008)(91956017)(66446008)(83380400001)(316002)(107886003)(64756008)(6916009)(26005)(186003)(1076003)(38070700005)(33656002)(66476007)(86362001)(33716001)(38100700002)(66556008)(66946007)(122000001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NhUDcflhKkGT4aXt551GMhcbyKVm0dey5Hbb00gtIVIOb9xxO6OcxXvzlpSN?=
 =?us-ascii?Q?qhVRIH9ClHI5Mi/TrUlXaCo6ZTA33slLc71cnmCQeMOOBYbgnrpiFxbgRQHO?=
 =?us-ascii?Q?hhbwm0XlzwKRX56IYCMXC7ylEDHjGEG8OUM4IWDrdhrLm5khmranUcURIYxQ?=
 =?us-ascii?Q?KXCXa+527wIHbpiur/pxxlvOT0D5d/C6sRW6RDLGbOHeFUEqu2HHF4X3STWu?=
 =?us-ascii?Q?irb+62W37UQRAQ9dyQJBH4lyZ9QW3JdlXs0NnaVmmfNsiQNQK921UK6aTBeh?=
 =?us-ascii?Q?oKDb9HmroTX7FMUJYw/csnnd2d09kLG21PVCmzF3r4jtbbVJQrhvF+nrhI7Q?=
 =?us-ascii?Q?s5K0Y7cKT3hDGhCfF/XZS5EjoVpjSi8LtGaKo/dqJnHcPq6b9FZfV2R5q3iR?=
 =?us-ascii?Q?zoBo2i31vPywNw51fEi4tdf2hsSPbTYv4/uM3+8hSGW/GVa+HRODenHvwq3j?=
 =?us-ascii?Q?ccVAMkBR4QO2w3+bzIFYK6NACW9NAEkkwtwcx9Vj7EQ+jSnPG+BDXFdGqKMd?=
 =?us-ascii?Q?eep2gK687emA1swwPIAJca8jjMEX5WMS9tUgCyE8G3cxr1/uptUO4FwSJEmr?=
 =?us-ascii?Q?MqAcNiiT2Rc2YoYdd5Etf1V/N0Av53AfO4VwjWR2GIAm2638vyZEMEGaJhs0?=
 =?us-ascii?Q?uUFl7FwVBDD9wMD1O4vCiqESRilXKmBWgjcITUBFHJ4q69scOsmKV/foSffo?=
 =?us-ascii?Q?7NYV9pqbQiZCZt+58eXnpSbdV6oxDJ/bHuowBdUxn3CgXfxdf9Kdltw/Fqr2?=
 =?us-ascii?Q?fEhezvHTA/XQ3h3Ns7aQIogUFiBzt5eL5gIjRp//64/q5GOvmBbAFVRscIK0?=
 =?us-ascii?Q?gSa6uVI1iSJliz6pIe3ASnSJw86QxCsb0VBSqsoY+8Kr3plrEZLn/6027rib?=
 =?us-ascii?Q?dmHvsvGFm6Uv0T2gON0B8Axc9qD8nUZXXXaFayzcbzWfZ5YT17R/zB/WkAkW?=
 =?us-ascii?Q?OovmInHYdNQL3A1L0WD983g50MLC7DHjCvJMOS75D9kLJNXpEXWaI39QKojX?=
 =?us-ascii?Q?0Olqj0VpHvnF3OGO69SuUnTk517rP8hdCivN+kQrwyUhhewBWpmsjpsQHFpf?=
 =?us-ascii?Q?II6Q2/Bx4S76QmzrRIbqGcinfx7cx2M81YN/cq6pKRChafshXrfRoLuIyWiL?=
 =?us-ascii?Q?fLB/nWofTeMF42Xq55Zs8HhcwOV9MwotPWf8nFHFrJoyd5UTvmoz9lq0Sx1T?=
 =?us-ascii?Q?xKWo6N6m1LAJp6kdJyj7wWNFV0vbzqjOlbsGq8AlBf/MWnEr5COmbUACKmxH?=
 =?us-ascii?Q?HsWepI/YLfeuBwLFYwW7Cq4YiI+/a2QRBHlzplfA0nUOfW3S4kW6hje9aY23?=
 =?us-ascii?Q?ExKfhPqb06Tn2M5xPBtTopUoCqNxdMaliK+Jo9Bg/CnGA/Y13eTfB4luzBqs?=
 =?us-ascii?Q?46Pq0ZuhlJJWk9paytGWw6E0RaorQNMF6qfBYP/qOM6NwVWLJ/vQCmo5+mdd?=
 =?us-ascii?Q?CIhjns8pp7zR4+489qx3rO3VRxPYqD4w8r0FWZTEY2Q/imIPWHdfOJLWOvxx?=
 =?us-ascii?Q?br/ODcVbMV6gNEIAiz1w8c5FQX1cYO2TNHrAtZ6IVpfKoO1ZxvL7+fl0g8Ke?=
 =?us-ascii?Q?trUnmyV/j2C9KDoIoOkCGqoa/9HiNHxMzn3e5Sn3wIucu2bpcn7ru0L17+xX?=
 =?us-ascii?Q?Vv55qiyqrS6I81mN6Z09jw03/QTTiw4LeycjSaFAXBjs+w3JTbO9Lsa1f/Cq?=
 =?us-ascii?Q?gI+2FnOwBWFWmLlqI/EIe6A4bvY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B3483B31BF10154DB26867698D94DE45@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915e20ac-91d6-4c85-2b03-08d9efb055be
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 11:51:28.0663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/NWkY3MiNdp8NqoBRbLxeTLNv7TtrhDYFnKXdQ/xtmALs2krbG2oksJaRst/1ojjip8SrrF86ecH4QQ0EFb0dh87WIj5Mc1KDlqSZNZ7lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8075
X-Proofpoint-GUID: you5i6Jk3vfZCT50tKfgK9dDCO_ktbdP
X-Proofpoint-ORIG-GUID: you5i6Jk3vfZCT50tKfgK9dDCO_ktbdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_04,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=791
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202140072

Hi Bertrand,

On Mon, Feb 14, 2022 at 11:27:21AM +0000, Bertrand Marquis wrote:
> Hi Oleksii,
>=20
> > On 14 Feb 2022, at 11:13, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com=
> wrote:
> >=20
> > Hi Julien,
> >=20
> > On Sat, Feb 12, 2022 at 12:43:56PM +0000, Julien Grall wrote:
> >> Hi,
> >>=20
> >> On 11/02/2022 11:18, Bertrand Marquis wrote:
> >>> Do you plan to add support for other boards ?
> >>>=20
> >>> Did you discuss more in general with the linux kernel guys to see if =
this
> >>> approach was agreed and will be adopted by other manufacturers ?
> >>>=20
> >>> All in all I think this is a good idea but I fear that all this will =
actually only
> >>> be used by one board or one manufacturer and other might use a differ=
ent
> >>> strategy, I would like to unrisk this before merging this in Xen.
> >>=20
> >> In the past we merged code that would only benefits one vendor (i.e. E=
EMI).
> >> That said, this was a vendor specific protocol. I believe the situatio=
n is
> >> different here because the spec is meant to be generic.
> >>=20
> >>> @julien and Stefano: what is your view here ?
> >>=20
> >> I share the same concerns as you. I think we need to make sure all the
> >> pieces we rely on (e.g. firmware, DT bindings) have been agreed before=
 we
> >> can merge such code in Xen.
> >>=20
> >> The first step is to have all the pieces available in public so they c=
an be
> >> reviewed and tested together.
> >>=20
> >> Oleksii, on a separate e-mail, you said you made change for ATF. How m=
uch of
> >> those changes was related to support for Xen? If they are some, then I=
 think
> >> they should be upstreamed first.
> >>=20
> >=20
> > Let me share changes, that were done to AT-F and Linux kernel
> > device-tree in terms of the SCMI mediator POC.
> > Changes to the Linux kernel:
> > https://urldefense.com/v3/__https://github.com/oleksiimoisieiev/arm-tru=
sted-firmware/pull/4__;!!GF_29dbcQIUBPA!je9Cu0n0498Yn76OLWjxxVaB7jWJtyWycHX=
0YARezTnc7aYHpGRJ8tSxHqIC0fTMUUSV$ [github[.]com]
> > Based on renesas-rcar linux-bsp, branch v5.10/rcar-5.0.0.rc5
> >=20
> > Changes to AT-F:
> > https://urldefense.com/v3/__https://github.com/oleksiimoisieiev/linux-b=
sp/pull/3__;!!GF_29dbcQIUBPA!je9Cu0n0498Yn76OLWjxxVaB7jWJtyWycHX0YARezTnc7a=
YHpGRJ8tSxHqIC0eDKS3ge$ [github[.]com]
> > Based on renesas-rcar/arm-trusted-firmware branch rcar_gen3_v2.5.
>=20
> You inverted the links but thanks this is really useful.
>=20

That's strange. Links looks good from xen.markmail.org interface.

> Did you push the ATF changes to mainstream ATF or discuss those with
> the maintainers ?

No. We did changes in ATF as a proof of concept.

>=20
> The strategy overall is nice but we need to make sure this is accepted an=
d
>  merged by all parties (ATF and Linux) to make sure the support for this =
will
> not only be available in Xen and for one board.

I've prepared patch to Linux kernel, which is introducing scmi_devid
binding, needed to set device permissions via SCMI. I've contacted
Sudeep Holla <sudeep.holla@arm.com>, who is the maintainer of the SCMI prot=
ocol
drivers. Waiting for the response.

Changes to ATF are not Xen specific and were done in terms of POC. We do
not have plans to upstream those changes right now.

>=20
> I will try to get in touch with the SCMI linux driver maintainer at arm t=
o get his view.
>=20

Thanks.

Best regards,
Oleksii.=

