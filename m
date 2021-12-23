Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C172C47E80B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 20:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251171.432446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0TX1-0006Xx-72; Thu, 23 Dec 2021 19:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251171.432446; Thu, 23 Dec 2021 19:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0TX1-0006V1-42; Thu, 23 Dec 2021 19:13:39 +0000
Received: by outflank-mailman (input) for mailman id 251171;
 Thu, 23 Dec 2021 19:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pwdt=RI=epam.com=prvs=29912ec7ef=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n0TX0-0006Uv-2X
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 19:13:38 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d8dac21-6424-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 20:13:36 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BNIRnCn022133;
 Thu, 23 Dec 2021 19:13:32 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d4umw8jvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 19:13:32 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7277.eurprd03.prod.outlook.com (2603:10a6:102:107::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 19:13:29 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 19:13:29 +0000
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
X-Inumbo-ID: 6d8dac21-6424-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LymKownDeuAc3Z7dVVbP9pTWUmk7E/n5ChC5DzjCPxO3CQVKglW/r+F+j2oKvxZz527eJ/HYcoj2l3D8FqSH5tD4fig1swpcZDukoV8j/etT42LfBvnr0S+WC/HyFIb246M8tEsQvDW9Imb6WWdpZs3uU4BxMahtitrQwJawXLHGHng2MOEl1TaT/Tw360bxHC4XkqM4DGEXUUdUc7YJUfdCxKDXZNaFYAV8d30gf229otP/afMZ/XP65E3lW67UgIw33pb0wkE54o+zhwAf6wK4Fy7+hNNkOd1CkxItwb++UbUFgoT8D1C8QC23+c4BRVQpOg5NOqXPkz9660JSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbQIJUZvQE+dO43TFV4zyFEWtoMy6T09zAKfTLa0Uik=;
 b=NradpcgszvQ91cO0Zud13kspEFwg69XLIeqEI1IRLdR3pMQqw1ZliETd+Lm9AFLhG02jJSl4voUfij447714PinG10DIbsckTaHtrpmoFSSTS0d12hdSfwoefArHP0gaO98hbZSrdcNxBGQjWfd/CM89VT/dhiSaQlkKNlnuHA5IcIwThlOic8UZfRqR9eDJXJoJ2Sj81fMKfbNsg+pPzuUREJskLThF+z08fYGux74fYix0k1dqwqESDHo2C3Cfc4C5JgaxQXyMI/p7C6qecwREhnRDx6DSO6Im5wzWRrxv1lrj+ggDCrdGBmY0OWLiO7eL88m0avIijOBj58ZK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbQIJUZvQE+dO43TFV4zyFEWtoMy6T09zAKfTLa0Uik=;
 b=QJjwCfsB/Yj8QS5Wa12M41XqKXgBx0Pr8tPrE4fUX/9OeLxNA5bom39VTBw3t98+GFpvl7cVjTI4q2fnaOhdiE7JMC85f9A9myoU9ulAirgzxwNZ4oLe9GUWgjnZf+8otVenXW96CzZKNfFje4Pn1tOZi9C+ADwrtEM5k0QgKPuDJ5eDiKMA9mHG/AbjMWC9Aavn6Y5vn8gxuoqRKL/cV9GfAVs+G4aLWI+BIhcrN6MoQSL8CrQCA9Zv/po4aN62Cvjgh/jiVePaIX/gjlpC3VTvqgpvYPxvVpvBOhqqdzzqs+FH27FrSb4PNTW9LmN8Zjn6+yuxbsqnAzOvONsqLg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross
	<jgross@suse.com>
Subject: Re: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Topic: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Index: AQHX8M3K+4k+NJRDpU6TSJ1TAn9Owqw8KP2AgAIxjYCAAQwEgIABGisA
Date: Thu, 23 Dec 2021 19:13:29 +0000
Message-ID: <20211223191328.GB101400@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112201653500.2060010@ubuntu-linux-20-04-desktop>
 <20211222102417.GA2882292@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221633000.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112221633000.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fc2313c-5e30-459f-991b-08d9c6484db3
x-ms-traffictypediagnostic: PA4PR03MB7277:EE_
x-microsoft-antispam-prvs: 
 <PA4PR03MB7277609FFB15C3631602FC89E37E9@PA4PR03MB7277.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /7+2IKh2VoCmtSC974oQOuAjoK+FscT/tgArdHOHxta8oYWaDutWYBOu1x/vDQuyMKz3H1r/osIc3RIqD26Uobf7fPD6ss/SN7QgjjdBfNhrV9MxP9H9W1oVjQzvkWFcdQBgxILaQtEZ4E1wPRN+QQ12Z9taq7loCnwXEAXx3FFl4th+rGJQjN4OBZFF2Ua11CIgSOiGrs1SnHSxJwhkt0f0HvzcCl4I51I+hCv1yoB2LjazCZd2Vxa5crGKZ6U4ISdG0aPEe9kSeXEsixlJKtLUkpvFpR5+/g4CIDFTIhQ23Mi/qazHjdCa/D49/QBoTgduWgnaI/OgFQsaxA+V2HKdyPfBbRku35vXDduzpoNxsVlK0EMw73cwMNDWF8fBTuMTKc4Xg8Osyc6quMHmrx5wTltWNa4F/MIjCOMbBhHBuks+y/ByRdkzSSP8cCKna6QGnytH/MT6iXyiPNERSJQ+xHcM+m9PHkWA9NGA6H4OSfGKe+I2GtGxhejZ2rSenCDCnoUuI2U4jc6HaFEAmVsR4b+gytouaGudm6CL41TzHgtQkKANDmOfArHejN1dKRQ7DAzb0U23wGH3NQ4uFJUpAZaNOsUwaD4rORrV4bnZ/nHhpAW8MRSIMUOOYVYfoGAjDJIGsAgdM6zwIb0IwZLCOpPso0vmxtlauJL2DcTYRDHXknD8fJ/i7athg6rhWXMadZEg4MxzyLqa3ANTOA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6506007)(83380400001)(1076003)(2906002)(508600001)(26005)(186003)(6916009)(66476007)(76116006)(6486002)(316002)(91956017)(9686003)(38100700002)(66946007)(33656002)(64756008)(66446008)(6512007)(8676002)(5660300002)(4326008)(54906003)(122000001)(33716001)(8936002)(38070700005)(66556008)(71200400001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YCD1Oao2cW3BQZs9sIpvyBNiDp3lvPEWxdmMIv2DB8lwVRjwr0dgBmRL9Jmw?=
 =?us-ascii?Q?ikOUNQPR9tSk92o0ucBeO3YLqfbnYPN0HGqRAf2xEXQdbwtUszRf98bOupzd?=
 =?us-ascii?Q?/g8SlQ/ClgcvseOfKkXt0yy0Lw7hrWdMSZQh7hFVi2ig/freXWWG1yr9qlwS?=
 =?us-ascii?Q?H1hLKIJRz14ox4Xc0/QbYYU3teifjrt5o/WZ6LSiPpzPeA/fYtJaCBksgaiP?=
 =?us-ascii?Q?GOlNNXUDEvi10/FqDK19ur8tFQ/puaFsVrBiz9btla63qQM0puukDfuqwugb?=
 =?us-ascii?Q?M0nickO4IzRwXokFzK7z3IF97DbsgW1v11mCyZfooMLi8Zu601gBtXIw4g5X?=
 =?us-ascii?Q?mOtLSjBLfFJOAHLjtCcHS9T41X7sySdwnnGb0rcIFLU/HuQ3/qmhxPFhMRPN?=
 =?us-ascii?Q?MU4aDtDnUHBV40L4IZzEMr8QS9kWRCmE5ONAfJ9XhFOnWWHVzGIZGXLqBFqQ?=
 =?us-ascii?Q?df7Xn5g0Xq11p6IaaIDJqzcgpmYLkwiphc00p6FOesxdLUNjKYhA8lPGI8rs?=
 =?us-ascii?Q?xv6xDRHPg0G1PAvDhMTNwfzxUIQYe/JOg43A43jbkBl/Md+OLyF5Plp+RrC/?=
 =?us-ascii?Q?7cG3g//3ghf6EOIVB6BuNjXWJ4k1QWjFj0dU568kLXwg8IsVQkUD8SQUq1cr?=
 =?us-ascii?Q?3P6z5iRs/c5Jybea5SfTeG75FckABvlnm+pajE6e+JvOU7FqhHqJytxLCg/7?=
 =?us-ascii?Q?OG6+L3DyHwuGeVefG5sapYgV1BztAvbm55bsEm/oHRWo5VvQwJUK/4tIJJue?=
 =?us-ascii?Q?RCgANcRSzZkEAfv0DTi6CAFKmec5Y1mY8hlbxlzL587rYUZBQs2WEapv6BKM?=
 =?us-ascii?Q?RolbX1lXsMtPrTfbr/zm+HNvw6y69kOsZFNndQbu4SVJZnPcErHjsCtonfdF?=
 =?us-ascii?Q?Q4tb3VhYm5GVsvEqG+vAcmUf+LF83F0qDKORzuar9ejVpBNCKUhZV9R/5M00?=
 =?us-ascii?Q?DqnQHkOX58JZ4xxb92/6KtKMVWE+AP0+QzUIieFL4IRxQzg6tD/nFzia3Q2+?=
 =?us-ascii?Q?q1F7yO2vh5x/pvyLUpucaCUrYin9fKxZ+9Gy1pZYXmo+1waPR2khuXWZuofb?=
 =?us-ascii?Q?PZg36kTdYybn6/LhdwJk/uYFTmt3deCeGRB5Uq6CfrO+F/K1Sx6Q0G/OGW56?=
 =?us-ascii?Q?0LJqJDBOxNMSEEqygWyUNVJujD3VdzHiT7E4A1PorkUjkwea8DsX6oNGaH0+?=
 =?us-ascii?Q?thfnFbqoOjO5beUIKWxSmez3DzCq7FzVP2SqcD72HcDeCz1JoPsMBwSaWQ6u?=
 =?us-ascii?Q?YHXZAk4HJZ0BetEpzfk3IQ/7wMfUJvFFjiqLwZq652MEcPWOPXZBiN+AOCPR?=
 =?us-ascii?Q?cyvwZw5dJURJ95U47Rpn2YuG1QawsXS94L8dyyOSajOvlR/RXPDpKgmBVMhb?=
 =?us-ascii?Q?jFnw7ENl3+mWLjT5SitM5pf0KVXmCBfMS8anntiaX9/E6CkZkA47jVo/SfiT?=
 =?us-ascii?Q?hqYYNLnxbQ/rPRUhxZUKKCVjxDaBHGaU3zV7k/v/GJF5vx9MbmM87nd1+jWZ?=
 =?us-ascii?Q?0QLVywYnX+8DyKGUXV5Kic/CUewF7sjdmVrPIlrmCp4ZtbY1EM0kpAkUxD/9?=
 =?us-ascii?Q?9Cs4vlK1/WAju+2UCrpDCXfnOuVxW1+1lObAPh2ZiEFKWhpTplRG+siJCjfJ?=
 =?us-ascii?Q?Lhs6tUD0d0pAqSOG7lx9oxcUM5gkYRme9BvvOTEdcH+2dCKscA72b2+S3RDI?=
 =?us-ascii?Q?H1yYc9PZGcVEt2ky5hqQmIVmgSs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17CB88EB9F664A43B9D4A478863E3315@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc2313c-5e30-459f-991b-08d9c6484db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 19:13:29.2571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: usCWaNlK0Si6aGPSB8ym7hgWI4+k8YY0LQ3bYfcGGj9RV3C/BVrFAwW/phy9J8ZJVWNgzixx1hrS+zT1Qyqwt+yOYGdTqsXf93d4pvw+2VQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7277
X-Proofpoint-ORIG-GUID: 9VfEO0I2_vnLz40hKA3XMHplGhQkMi7l
X-Proofpoint-GUID: 9VfEO0I2_vnLz40hKA3XMHplGhQkMi7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230100

Hi Stefano,

On Wed, Dec 22, 2021 at 06:23:33PM -0800, Stefano Stabellini wrote:
> On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> > On Mon, Dec 20, 2021 at 04:54:25PM -0800, Stefano Stabellini wrote:
> > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > This enumeration sets SCI type for the domain. Currently there is
> > > > two possible options: either 'none' or 'scmi_smc'.
> > > >=20
> > > > 'none' is the default value and it disables SCI support at all.
> > > >=20
> > > > 'scmi_smc' enables access to the Firmware from the domains using SC=
MI
> > > > protocol and SMC as transport.
> > > >=20
> > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > ---
> > > >  docs/man/xl.cfg.5.pod.in         | 22 ++++++++++++++++++++++
> > > >  tools/include/libxl.h            |  5 +++++
> > > >  tools/libs/light/libxl_types.idl |  6 ++++++
> > > >  tools/xl/xl_parse.c              |  9 +++++++++
> > > >  4 files changed, 42 insertions(+)
> > > >=20
> > > > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > > > index b98d161398..92d0593875 100644
> > > > --- a/docs/man/xl.cfg.5.pod.in
> > > > +++ b/docs/man/xl.cfg.5.pod.in
> > > > @@ -1614,6 +1614,28 @@ This feature is a B<technology preview>.
> > > > =20
> > > >  =3Dback
> > > > =20
> > > > +=3Ditem B<sci=3D"STRING">
> > > > +
> > > > +B<Arm only> Set SCI type for the guest. SCI is System Control Prot=
ocol -
> > > > +allows domain to manage various functions that are provided by HW =
platform.
> > > > +
> > > > +=3Dover 4
> > > > +
> > > > +=3Ditem B<none>
> > > > +
> > > > +Don't allow guest to use SCI if present on the platform. This is t=
he default
> > > > +value.
> > > > +
> > > > +=3Ditem B<scmi_smc>
> > > > +
> > > > +Enables SCMI-SMC support for the guest. SCMI is System Control Man=
agement
> > > > +Inferface - allows domain to manage various functions that are pro=
vided by HW
> > > > +platform, such as clocks, resets and power-domains. Xen will media=
te access to
> > > > +clocks, power-domains and resets between Domains and ATF. Disabled=
 by default.
> > > > +SMC is used as transport.
> > >=20
> > > Would it make sense to actually enable SCMI-SMC support for the guest=
 by
> > > default if the guest has any devices directly assigned?
> >=20
> > Hi Stefano,
> >=20
> > Previously we discussed with Oleksandr about introducing new dom.cfg
> > parameter, such as scidev[] lists all sci related nodes, which will hel=
p to
> > avoid extra domctl calls.
>=20
> The concerning part is (too much) information the user needs to provide
> in device tree or dom.cfg. We can be flexible with the number of extra
> domctl calls, but of course it would be good to avoid them too.
>=20
>=20
> > But there is still a question how mediator types should be set for
> > different domains? I know currently system supports only one mediator
> > type, but different implementation should be also possible.
>=20
> I think it is fine to have an option sci=3D"scmi_smc" in dom.cfg, that is
> not a problem. The issue is a detailed list of SCMI IDs or a second list
> of device tree paths, because those are far harder to write correctly.
>=20
>=20
> > For example, if we have to start dom0 and domd using scmi_mailbox
> > mediator and domU using scmi_smc, because our system supports only 2
> > mailboxes.
>=20
> Yeah that's fine, it could be done with the sci option you are
> suggesting.

Thank you for suggestions. I will use this approach in v2.=

