Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D6C47E7ED
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 20:07:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251163.432424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0TQS-0004B9-4G; Thu, 23 Dec 2021 19:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251163.432424; Thu, 23 Dec 2021 19:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0TQS-00047s-0S; Thu, 23 Dec 2021 19:06:52 +0000
Received: by outflank-mailman (input) for mailman id 251163;
 Thu, 23 Dec 2021 19:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pwdt=RI=epam.com=prvs=29912ec7ef=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n0TQP-0003cs-RU
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 19:06:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a741fe-6423-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 20:06:48 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BNISA3Y001440;
 Thu, 23 Dec 2021 19:06:44 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d4weq87d1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 19:06:44 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7277.eurprd03.prod.outlook.com (2603:10a6:102:107::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 19:06:38 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 19:06:37 +0000
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
X-Inumbo-ID: 79a741fe-6423-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGFZa64oQWmbKCWFIRbRcN0MYlzDkUk+iu3UEViEwM46nIlngsQ2Zwc5BIqO8vgBNDvSgDT+nsU+8EDHJ1dfjKSjyODZDHXseZBF7H2qhJ0lhdGiNEejNDh08IAFw/KoF1/nQIJTSdIAD4QerpfhphBfFmN5golVSq8PLB3z+pr2M48CxTjySyb6YqwxAWeWdmvYIOntiF2M5UA8HPtWpkoso+lDA0C4lQAng2Cd6xnI/JB0Gv1snrjBwC70FtYVqpC4GpkCV5KL53QvpMyMilFxtHUknpXNtQlvftCTQweO6nkm5zMJo8cEHc8FcsMYNOQKYow8Pui3ZhUShanH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isnspActnNnDqfkhO67r+EGE+kG6a1RK16rZ2F5/wU4=;
 b=RP4mJFdjHzGbIWHDsCuGr71AXekZ7inTvAK0q2e4VTXOG0sfd2nxltPfyjRXv8W7R2FI3dREYlFqdJ3Mi2wtH5r4LgmRYopxA6ZFpXZ5yd1RQhLbYzv40E+8DtR8XZadyikZfc2WrPXBABcYTYoMuOXgmbInA3qLR4RTno89NuBAMV6b0TuxFVCUL4zdXwBEOs1AgCiidaVSLoEn2Wm5XueRzcvMQ9FfD10UbxUS2fd6jbEKZlRyN2NTnRW7hzSSws5RaueUfWcwjXLbCg+USQZ8133tG094JDhVWvW0V29yfb3KMrkJQmhG+IlWCNjpNRLP2BFMb6sFmrnyhT918g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isnspActnNnDqfkhO67r+EGE+kG6a1RK16rZ2F5/wU4=;
 b=KW51AkDrA2KlpbKev7orMuiNk4/ETm7F3784PS/CGnPksZGmfT7/d+vds9nE+LTJXfXh2zxoDAHfSZ1eU6ag2oAjYzz/7dfUDy3e3yCF2KbPBGGVRLNmXDQ9OttQg8cflnYuwMIEze9+Z+/YS0dj2UPvgFQ/G/G1NKju8QSayr3Gfw48HDRzf3LHxarHM3P+LXgHJX8qPWrNbxlp1oxDDw6ycp2vQw/0F5iGzqhNIJSlSfCvzmpyAxql8g1SoPgn0zo8TC24gcuROnRD3AkXBcvrOBj34rsXPOU2pDDSGts93QqEdzdBAWphD7zAOvXoYbEL6nPlIHsSdWLqFRdBFQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgAEYTIA=
Date: Thu, 23 Dec 2021 19:06:37 +0000
Message-ID: <20211223190637.GA99855@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56d7e3b1-e181-46fc-892b-08d9c6475884
x-ms-traffictypediagnostic: PA4PR03MB7277:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7277ABBB59C1700D9E5AE1BAE37E9@PA4PR03MB7277.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b7eg7okivi7Xe5DUNa6yLH/IwVXMMIGiw7o091ubv3PlIJpW02o/MsDt1O5xWXkei7lY061nAZXHU9aGrOqgQlHzVrxIFWH2cpuAO3WpjRC66Cu3nDuUEOB2tlmNZhQy++XELbHe7/i9Q7iuDtp1sAff7tFnbRhWWGZFjha8YwTSqnbAe6r8MarPct5BnvMdTfuSK+0uElwExj4ZBU0ATOVFYLUMOAoYcIKqpSe0yxiPc+0LIYKmgs4ZGsYx0x9sVMo7+u+0O322wANuY00D5J/+eoUvIKcci9di+A4wCp6fewkc1SrWrPm7GQDkDXNqchgGDT8yNb5ilQLuNLxzHJ1EevAakA2snCzYTtKmZfMvGkXnkv+OInVf4ggK+S1g/b5U16t9VPBKlQwuHqlXDnCJvhhullf94T4oneGMgArG5jr3LFnVw9YU4GSWcJSJmb+wY5tzk8ocTtdbBnMCPuBoGz9RSYbue9bInMWe4IWymBAFE9fgWiL8EXJZL+oe1/qtTJSd6+8MA5FwLTfnzirXW6rUhOW3q7sjQFX8gsBPLZMvDBx4YnnTgh7Uziuf459SKzY5vw06sr7q27qN7zGMdxdYpAOMxKf1FYYTOXNiMYCu0DgecEv1auaLO0jPmMBda2JWu7gtmB+BbzwE7tvxdsiaKqShyd/bfKYNieOQeTUoNQS1mRL+Br0qQVdq7PGhnMYMYFLKd1qylEkNlrELtGh60j6iEXgmfAsv4Bb0iEuYF1FvUaiJA35UgQQ6oXp0UeJDUM7bTMMG+m9r9RZLrieVH3j3EZGXOamTNwY9jsXdyQJ+gJ9o2Oh1y7+d
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66946007)(33656002)(64756008)(66446008)(8676002)(6512007)(316002)(76116006)(91956017)(9686003)(38100700002)(5660300002)(71200400001)(86362001)(66556008)(66476007)(4326008)(54906003)(38070700005)(122000001)(33716001)(8936002)(6486002)(966005)(83380400001)(1076003)(2906002)(6506007)(6916009)(26005)(186003)(30864003)(508600001)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/7tBUOwrxCxrojFtWIsHUT7DQpj/C48P5MXQqhjvDZK8Muce+AZZTSgChJTG?=
 =?us-ascii?Q?Wqd4Z52e8QQR6pu/oZV/24MU2j8EaJf5nEDj8vLoAVmOKIYkwtKWq0Pphcck?=
 =?us-ascii?Q?hd+GpVz8TQrv1ggvdmQARIMM6K43MezLhFzD7LKwlVcSZLcV45KNG4D9zzcl?=
 =?us-ascii?Q?jz9H/4GJy8hwSPPyPHwacMTzEym5OF6AtcZbKe9ZXX8b5cV7n2M7FSEjKuzZ?=
 =?us-ascii?Q?lU4FZCZVFU/KT8iI+0db2yhQi44UfIKjHhOg57wcHSGsBTgTlck0ZE4vGzls?=
 =?us-ascii?Q?OdeXYV9i5rvgiHDOuzwcgnDJlhYKJhbm3EF712PVDwJBK9IFTrAAk3vJ3yez?=
 =?us-ascii?Q?F0vbzEmSm591mZbSAAvf+iBbHhP9WdqB5cCc75nS1VI0gYOtVHue07D/zyhe?=
 =?us-ascii?Q?8qcOTx5pOAG28N9ddNh9qlFJNg76GyPKtAM/FHLPafgwmfNhxLeIGXnEh+FR?=
 =?us-ascii?Q?bfsPiMWNhmNoqHVe5yvTwjV/xCdiUI6SPBuv4+hJ1jEoyQFQNED6wPKs3D7X?=
 =?us-ascii?Q?19jpXjGWu980x8NLOEmbFSbORd88Y4xTz6vLsHoFeXEq1xeGX/SoaabpK14K?=
 =?us-ascii?Q?VdOg34IBTeSgdRSW13IwDqQkAiCkWayTRmaUBsso4aHXeQZZqkq+EvtkYSaV?=
 =?us-ascii?Q?DpYprQzPbkxyiqIDiTmcMrqNV+bqTs90ZaE7UaCxz6ZnHShWPu/cpdUB2/PG?=
 =?us-ascii?Q?Cm7FNTN7X2umYrBKTOqIIicjohdIyNBd+K2YDJbiJxqMQ9ZnmyDRR3qPSUmo?=
 =?us-ascii?Q?NarlIDFs/MbmE7ZXwyLZybLPhBmJfeaniIEhOOhBauJq54oiCG2qjfF8kpRZ?=
 =?us-ascii?Q?uVd+4RmDwt1GoZMo6E4jNAGyg06NnxUv3g9LJb0VLfn7KP5m2KJJqzWmvFJJ?=
 =?us-ascii?Q?UvWVCTk07e6fkO5fpqARGv5PxXggznJIZxRu5u1UCoZz7LDHFC4f5NwueBqI?=
 =?us-ascii?Q?ktoqHSjlYJNaW4Ghks4+3dDYs/KPqrIJhKsgvmohhLCI728raJ5CCsAmH5Il?=
 =?us-ascii?Q?vn2JnBEUK1u3LfZX1pvYXJgBQt7FEiGTVPUJEOJ9yENs1wY1u+MQn73r2ksO?=
 =?us-ascii?Q?P2rDzd73woYqaGEoBDeo6wvewJkfiR5sLfDQPgOIkEY40Z4ujwZWZ6BMG2lR?=
 =?us-ascii?Q?meRjTo2m0CL4p1Cx/aNAbJb2NMoI84HPT1OBIOaPTA11mBqxNeenkjVKykZR?=
 =?us-ascii?Q?/LQjA3rP62znBI1aFxj6xIqV4aQ693C0hRycNILOXn03GLeLVNlMo5gG3pN0?=
 =?us-ascii?Q?fuvVzPgdgsIKooD8D19VfoV4D/+bCPJ6zxAeTc8g6bixCPsczlxk7/WUIYpz?=
 =?us-ascii?Q?0s9qqaacKFzPM95Ha8zoC/K2C4kV1WnY/RQ7wVJCAIfUhfCcwdwJSiVi4DQa?=
 =?us-ascii?Q?7kne6BPdAYRoj3Yt3BkTw6nGKi6mgFEzKDTcNeEhrwtXqEUhXEs2VSAAEGDJ?=
 =?us-ascii?Q?jOLOZkdbso6zgiJa73wXPqz/+Dkw2RziME+hinKrwRNhX0/j2NOh9T4VtCKa?=
 =?us-ascii?Q?DI1asejiUsac0G3eVmCBid3k1FOIyO3zkFQeWG2gJoTJAfPCWPzLmeYq7RGw?=
 =?us-ascii?Q?0AoY04thrxxUn7vOO4GRd/XlsFaTvVI78yKDBb03nEsTVNDxwRrt/2h8ZrBm?=
 =?us-ascii?Q?Sm+8N8yeWCxdFo3vIkEkKvinJotEueUFVfey6SJ0bi6D7QVnxuvNMorJ/6OV?=
 =?us-ascii?Q?9qFkBaHng4VHOPLzbKJ6+bd1kWA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <57E7879188A0A345A05313FCFD76F673@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d7e3b1-e181-46fc-892b-08d9c6475884
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 19:06:37.8600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONlXLrgmcAAFeJJ7gDWrbelCidzVF6SjgbcrCPVcrHd6hgABswDWHk/d8fbMX+DuSR9M/TIjnDPvI88A9VrqLWsADYkFZ0Df11aAwMLo84k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7277
X-Proofpoint-GUID: 5OucUIc5rNCnYTy6BvyJZzZulGycsCAa
X-Proofpoint-ORIG-GUID: 5OucUIc5rNCnYTy6BvyJZzZulGycsCAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230099

Hi Stefano,

On Wed, Dec 22, 2021 at 06:23:24PM -0800, Stefano Stabellini wrote:
> On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> > On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wrote:
> > > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > > > Hi Stefano,
> > > >=20
> > > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wrote:
> > > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > Hi Stefano,
> > > > > >=20
> > > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellini wr=
ote:
> > > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > This is the implementation of SCI interface, called SCMI-SM=
C driver,
> > > > > > > > which works as the mediator between XEN Domains and Firmwar=
e (SCP, ATF etc).
> > > > > > > > This allows devices from the Domains to work with clocks, r=
esets and
> > > > > > > > power-domains without access to CPG.
> > > > > > > >=20
> > > > > > > > The following features are implemented:
> > > > > > > > - request SCMI channels from ATF and pass channels to Domai=
ns;
> > > > > > > > - set device permissions for Domains based on the Domain pa=
rtial
> > > > > > > > device-tree. Devices with permissions are able to work with=
 clocks,
> > > > > > > > resets and power-domains via SCMI;
> > > > > > > > - redirect scmi messages from Domains to ATF.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.co=
m>
> > > > > > > > ---
> > > > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++=
++++++++++++
> > > > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > > > >  5 files changed, 809 insertions(+)
> > > > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > > > >=20
> > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > > > >  	  support. It allows guests to control system resourcess =
via one of
> > > > > > > >  	  SCI mediators implemented in XEN.
> > > > > > > > =20
> > > > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > > > +
> > > > > > > >  endmenu
> > > > > > > > =20
> > > > > > > >  menu "ARM errata workaround via the alternative framework"
> > > > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kc=
onfig
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000..9563067ddc
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > > > @@ -0,0 +1,10 @@
> > > > > > > > +config SCMI_SMC
> > > > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > > > +	default n
> > > > > > > > +	depends on SCI
> > > > > > > > +	---help---
> > > > > > > > +
> > > > > > > > +	Enables mediator in XEN to pass SCMI requests from Domain=
s to ATF.
> > > > > > > > +	This feature allows drivers from Domains to work with Sys=
tem
> > > > > > > > +	Controllers (such as power,resets,clock etc.). SCP is use=
d as transport
> > > > > > > > +	for communication.
> > > > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/M=
akefile
> > > > > > > > index 837dc7492b..67f2611872 100644
> > > > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > > > @@ -1 +1,2 @@
> > > > > > > >  obj-y +=3D sci.o
> > > > > > > > +obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
> > > > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci=
/scmi_smc.c
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000..2eb01ea82d
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > @@ -0,0 +1,795 @@
> > > > > > > > +/*
> > > > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > > > + *
> > > > > > > > + * SCMI mediator driver, using SCP as transport.
> > > > > > > > + *
> > > > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > > > + *
> > > > > > > > + * This program is free software; you can redistribute it =
and/or modify
> > > > > > > > + * it under the terms of the GNU General Public License as=
 published by
> > > > > > > > + * the Free Software Foundation; either version 2 of the L=
icense, or
> > > > > > > > + * (at your option) any later version.
> > > > > > > > + *
> > > > > > > > + * This program is distributed in the hope that it will be=
 useful,
> > > > > > > > + * but WITHOUT ANY WARRANTY; without even the implied warr=
anty of
> > > > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  S=
ee the
> > > > > > > > + * GNU General Public License for more details.
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +#include <asm/sci/sci.h>
> > > > > > > > +#include <asm/smccc.h>
> > > > > > > > +#include <asm/io.h>
> > > > > > > > +#include <xen/bitops.h>
> > > > > > > > +#include <xen/config.h>
> > > > > > > > +#include <xen/sched.h>
> > > > > > > > +#include <xen/device_tree.h>
> > > > > > > > +#include <xen/iocap.h>
> > > > > > > > +#include <xen/init.h>
> > > > > > > > +#include <xen/err.h>
> > > > > > > > +#include <xen/lib.h>
> > > > > > > > +#include <xen/list.h>
> > > > > > > > +#include <xen/mm.h>
> > > > > > > > +#include <xen/string.h>
> > > > > > > > +#include <xen/time.h>
> > > > > > > > +#include <xen/vmap.h>
> > > > > > > > +
> > > > > > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > > > > > +
> > > > > > > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0=
056C) */
> > > > > > > > +#define SCMI_SUCCESS              0
> > > > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > > > +#define SCMI_DENIED             (-3)
> > > > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > > > +#define SCMI_BUSY               (-6)
> > > > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > > > +
> > > > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-sm=
c")
> > > > > > > > +
> > > > > > > > +#define SCMI_SMC_ID                        "arm,smc-id"
> > > > > > > > +#define SCMI_SHARED_MEMORY                 "linux,scmi_mem=
"
> > > > > > >=20
> > > > > > > I could find the following SCMI binding in Linux, which descr=
ibes
> > > > > > > the arm,scmi-smc compatible and the arm,smc-id property:
> > > > > > >=20
> > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > > > > >=20
> > > > > > > However, linux,scmi_mem is not described. Aren't you supposed=
 to read
> > > > > > > the "shmem" property instead? And the compatible string used =
for this
> > > > > > > seems to be "arm,scmi-shmem".
> > > > > > >=20
> > > > > >=20
> > > > > > We use linux,scmi_mem node to reserve memory, needed for all
> > > > > > channels:
> > > > > >=20
> > > > > > reserved-memory {
> > > > > >     /* reserved region for scmi channels*/
> > > > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > > > >         no-map;
> > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > > > > >     };
> > > > > > };
> > > > > >=20
> > > > > > arm,scmi-shmem node used in shmem property defines only 1 page =
needed to
> > > > > > the current scmi channel:
> > > > > >=20
> > > > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > >     compatible =3D "arm,scmi-shmem";
> > > > > >     reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > };
> > > > > >=20
> > > > > > For each Domain reg points to unigue page from linux,scmi_mem r=
egion,
> > > > > > assigned to this agent.
> > > > >=20
> > > > > If we were to use "linux,scmi_mem" we would have to introduce it =
as a
> > > > > compatible string, not as a node name, and it would need to be de=
scribed
> > > > > in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
> > > > >=20
> > > > > But from your description I don't think it is necessary. We can j=
ust use
> > > > > "arm,scmi-shmem" to describe all the required regions:
> > > > >=20
> > > > > reserved-memory {
> > > > >     scp-shmem@0x53FF0000 {
> > > > >         compatible =3D "arm,scmi-shmem";
> > > > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > >     };
> > > > >     scp-shmem@0x53FF1000 {
> > > > >         compatible =3D "arm,scmi-shmem";
> > > > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > > > >     };
> > > > >     scp-shmem@0x53FF2000 {
> > > > >         compatible =3D "arm,scmi-shmem";
> > > > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > > > >     };
> > > > >     ...
> > > > >=20
> > > > > In other words, if all the individual channel pages are described=
 as
> > > > > "arm,scmi-shmem", why do we also need a single larger region as
> > > > > "linux,scmi_mem"?
> > > > >=20
> > > >=20
> > > > That was my first implementation. But I've met a problem with
> > > > scmi driver in kernel. I don't remember the exact place, but I reme=
mber
> > > > there were some if, checking if memory weren't reserved.
> > > > That's why I ended up splitting nodes reserved memory region and ac=
tual
> > > > shmem page.
> > > > For linux,scmi_mem node I took format from /reserved-memory/linux,l=
ossy_decompress@54000000,
> > > > which has no compatible string and provides no-map property.
> > > > linux,scmi_shmem node is needed to prevent xen from allocating this
> > > > space for the domain.
> > > >=20
> > > > Very interesting question about should I introduce linux,scmi_mem n=
ode
> > > > and scmi_devid property to the
> > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
> > > > Those node and property are needed only for Xen and useless for
> > > > non-virtualized systems. I can add this node and property descripti=
on to
> > > > arm,scmi.yaml, but leave a note that this is Xen specific params.
> > > > What do you think about it?
> > >=20
> > > Reply below
> > >=20
> > > [...]
> > > =20
> > >=20
> > > > > In general we can't use properties that are not part of the devic=
e tree
> > > > > spec, either https://urldefense.com/v3/__https://www.devicetree.o=
rg/specifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQ=
iQYC595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > > > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/=
kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings__;!!GF=
_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhX=
loYUaj$ [git[.]kernel[.]org]
> > > > >=20
> > > > > "linux,scmi_mem" is currently absent. Are you aware of any upstre=
aming
> > > > > activities to get "linux,scmi_mem" upstream under
> > > > > Documentation/devicetree/bindings in Linux?
> > > > >=20
> > > > > If "linux,scmi_mem" is going upstream in Linux, then we could use=
 it.
> > > > > Otherwise, first "linux,scmi_mem" needs to be added somewhere und=
er
> > > > > Documentation/devicetree/bindings (probably
> > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml), then w=
e can
> > > > > work on the Xen code that makes use of it.
> > > > >=20
> > > > > Does it make sense?
> > > > >=20
> > > >=20
> > > > Yes I agree. I think linux,scmi_mem and scmi_devid should be upstre=
amed.
> > > > I will add those properties to arm,scmi.yaml, mark them as related =
to XEN and send patch.
> > >=20
> > > I didn't realize that linux,scmi_mem and scmi_devid are supposed to b=
e
> > > Xen specific. In general, it would be best not to introduce Xen speci=
fic
> > > properties into generic bindings. It is a problem both from a
> > > specification perspective (because it has hard to handle Xen specific
> > > cases in fully generic bindings, especially as those bindings are
> > > maintained as part of the Linux kernel) and from a user perspective
> > > (because now the user has to deal with a Xen-specific dtb, or has to
> > > modify the host dtb to add Xen-specific information by hand.)
> > >=20
> > >=20
> > > Let me start from scmi_devid.  Why would scmi_devid be Xen-specific? =
It
> > > looks like a generic property that should be needed for the Linux SCM=
I
> > > driver too. Why the Linux driver doesn't need it?
> > >=20
> >=20
> > scmi_devid used during domain build. It passed as input parameter for S=
CMI_BASE_SET_DEVICE_PERMISSIONS message.
> > On non-virtualized systems - there is no need of this call, because OS
> > is the only one entity, running on the system.
>=20
> OK. Even if it is only required for virtualized systems, I think that
> scmi_devid is important enough that should be part of the upstream
> binding. I think it is worth starting an email thread on the LKML with
> Rob Herring and the SCMI maintainers to discuss the addition of
> scmi_devid to the binding.
>=20

Ok I will start the thread about scmi_devid.
>=20
> > I've chatted with Volodymyr_Babchuk and he gave a great idea to add a
> > list of device_ids to dom.cfg, such as:
> > sci_devs =3D [ 0, 1, 15, 35 ];
> >=20
> > Using this approach, we can remove scmi_devid from the device tree and
> > just pass a list of scmi_devids to XEN using additional hypercall.
> > We can probably make hypercall taking devid list as input parameter.
> > This will take only 1 hypercall to setup sci permissions.
>=20
> But how would a user know which are the right SCMI IDs to add to the
> sci_devs list? Would the user have to go and read the reference manual
> of the platform to find the SCMI IDs and then write sci_devs by hand?
> If that is the case, then I think that it would be better to add
> scmi_devid to device tree.
>=20
> In general, I think this configuration should happen automatically
> without user intervention. The user should just specify "enable SCMI"
> and it should work.
>=20

Ok. This sounds reasonable.

>=20
> > > In regards to linux,scmi_mem, I think it would be best to do without =
it
> > > and fix the Linux SCMI driver if we need to do so. Xen should be able=
 to
> > > parse the native "arm,scmi-shmem" nodes and Linux (dom0 or domU) shou=
ld
> > > be able to parse the "arm,scmi-shmem" nodes generated by Xen. Either
> > > way, I don't think we should need linux,scmi_mem.
> >=20
> > This requires further investigation. I will try to make implementation
> > without linux,scmi_mem, using only arm,scmi-shmem nodes and share
> > reuslts with you.
>=20
> OK, thanks.

One more question: As you probably seen - Jan had a complains about SCI
term. He said SCI is ambiguous with ACPI's System
Control Interrupt. I think of using SC (as System Control) instead. What
do you think about it?=20

Best regards,
Oleksii.=

