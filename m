Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42453477ABF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 18:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248161.428033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxugI-0000zI-EQ; Thu, 16 Dec 2021 17:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248161.428033; Thu, 16 Dec 2021 17:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxugI-0000wU-BJ; Thu, 16 Dec 2021 17:36:38 +0000
Received: by outflank-mailman (input) for mailman id 248161;
 Thu, 16 Dec 2021 17:36:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lkuu=RB=epam.com=prvs=29842dc016=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mxugH-0000wO-0t
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 17:36:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c9f256-5e96-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 18:36:35 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BGGcpaZ003956;
 Thu, 16 Dec 2021 17:36:31 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d03vjsfee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 17:36:30 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7134.eurprd03.prod.outlook.com (2603:10a6:102:f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 17:36:26 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 17:36:26 +0000
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
X-Inumbo-ID: b6c9f256-5e96-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ito8HJK5VA8sfgX7n+QjP6UPNDTfrjneJGzA90jgqK3zOvg7xYRn5GwjdR/tzHcaRH6MppMhNfd9Tv0CBNH1EFHfSnwcwZxcyUS/bu+tidoiWpqybzqNoeAzjLljYyme0NrYHkqcxLkGSoh1Af0GDSB/cmdNKvJYD2DS1rDdsV+OMatK4lSTJuKTpRl5IVjrWFj26iqz7VMycZwNjjTM3vMA5Q+14iDmqEpDfaq/7T4TDdQXx4uLaXLCDQTgb79t3D0WUT2+TSVMVpTW6n9HzZh5LBTWXw1tbYrfl4AU2JPWGs/fi3B/Agbs06GPMRPtDNZgxqoe2m+KOENQxzaboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+/XOKd7wnHe2drRKI7fLT7N1/71vl1GnG/k+ljNB1E=;
 b=D7OQ724V3I474IHxqF6ata5/ACQzMF3GTv7JW2R/zfl7utYH0xFJtLGZ8VbOkZXC4RU5Lb52zf3FoF6xdRk/WXlbyeFxc8stloKpzZcrUEHF7EQiqXpjlJxdnzHus1S3wnrB425RCNG95hMw59PCGuGO94buFLUZxQGlltFHOKddvmlWio/oqEsr2sLVXFtNiDf4YPUwjxwdJ3BNsF8GBoYiV10eKPo755GFy8TW77tmwNSrQE4qisyqnXyejDga7kpZp1hu6sYR//YKNvHPC/SZmdqgEgioFN73QIKnUeQnAaAsENNdz2nWDNftrM/KheR7594gDyqFHSFl4yrf3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+/XOKd7wnHe2drRKI7fLT7N1/71vl1GnG/k+ljNB1E=;
 b=qIOplq+qc5bF39RTUse64z4RMNOHmPeJwBq5mkD0IysVKuICygu952SuxOkAkS7/6w3wK+3I5BZPLDNgUQ3JVHaLSvesxq1JBU87vlOgcxXEeMYecW533+Eu/Ywxm+J/fe/KbR3NcbbujdaCMyzEvC2FQLPyIX4BD/KZmVpIg/GLZPzAIXJELts3C4QYMsF1r3hb5b+HLcslqk7FCMUtgIu/9XEVeZSF+ARL4575iyb46yOTiDuFUQ388qvJpVVNV0m/U+OBy94yq0mi4PB1ONAHu8a940d/4aXbo16aQ9hfg8KJYG7mN9Imq6mdM4y/BhF92honZa35pOY5kP/rSw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony
 PERARD <anthony.perard@citrix.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: AQHX8M3LpzWz4l8PQUiIA2nAUV0H+qwxu+8AgAOpWoA=
Date: Thu, 16 Dec 2021 17:36:26 +0000
Message-ID: <20211216173625.GA3623693@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <5876e66a-9a12-6a69-989f-a5ba6709886c@suse.com>
In-Reply-To: <5876e66a-9a12-6a69-989f-a5ba6709886c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9095e362-39c6-4343-c7cf-08d9c0ba9633
x-ms-traffictypediagnostic: PA4PR03MB7134:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7134641028B395054B53DCF8E3779@PA4PR03MB7134.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g2YAfKcO1BlUWR2Txnn8elX8/jfTtAJN/Zqot96lZ/yuUo6b/q821jwDoH/OQYKwTgX3CRxEIyst3bFJVHnhzjiEOsvRfcq3g4qvapSVtIxIett6rEpcoLHpNhdnXyyaUdoOeRPTZ6Z4WCWRpoE2d5qm33J77iIglOLk25rjJjrNSN96lJcqSDM7RfaOTB6QwtwovR0XpeVmtV8TMiL+aZ35CiVfiRne3AmiN9+0BXq4ALaJlLmLSw+nBQY2SgMVKn61uaShu0Nvaa30pjwo1gd6ZmEhuP5un+cpdfzQ3+N5JzwtNXUu0+qVPaU0VolPWhjQaLza8cr2p2fJ2N8TGE//WL4K7ocZqZTIuq/BsvyLPU5lonvZ/bc/xxr92CsRyK2HQ3JlelkzpwnP2YqwSPKlsM/QIKHArndtT18+wqBnod6IqXpnchBodu8OydVVafeyJNtcoldi/uLqNZnyiht9DsvMykh0faZCljkIdbfBlrxZHZvW/WnDg5rxjZoqkBVMargH895pz+uAqySOTyRNpsuFla9Rxrliwm27P+sML66McU7E5xQRdZIqC51UV49YkNRcl4XCtIlGuhzED120vtmI4JrgIxgc+8x8thQ11mtoh+nJGwQBYt8vZpAfGlX7mSMn9+B7SePld2VE4GPVqjVmQhCiaqRgnc/oEuJbhsWF3Es4NpT2/tU+Ym/QvDOIUODTFJNYhDqHtTNUwA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66946007)(4326008)(6916009)(76116006)(8936002)(91956017)(508600001)(83380400001)(1076003)(66446008)(66556008)(66476007)(86362001)(8676002)(71200400001)(26005)(6506007)(33656002)(5660300002)(9686003)(54906003)(38070700005)(53546011)(7416002)(2906002)(122000001)(38100700002)(64756008)(186003)(6486002)(6512007)(316002)(33716001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xISiWmuCa4i510E2RoaAhw8Y1DGw2+GLPnQKLtDRQjTW7VLhP6ug2YyprYrr?=
 =?us-ascii?Q?sNghiatRAKyIEClObbOgi5QsU26qFiHh08zXoAP4r9cwnfhwtknWA1Bu7H95?=
 =?us-ascii?Q?6iQaEXA8MgEAKSVLdNOQdLf+TmJDGcrt5aJWqFOs7hSj/kso4rSctA5Dqpi9?=
 =?us-ascii?Q?8Kuqor30yVsg7wDJCu/frc4/B7y1LDQ9longosxuD1heT6RSkLI9Jm2jCbae?=
 =?us-ascii?Q?eUB7N91FkYxIGl6/E/kwSoJwjPbo4prxSe3epAN4EaUs7EznaC1oepBXPv6D?=
 =?us-ascii?Q?pUW9Ed0hGaxybuYYlm7zvTutyQxI8wjus97AEoWWE9A51CfX+l0ZVbJQ+2iR?=
 =?us-ascii?Q?b+QeAg4AO3lyQeB4PlAx5XD8dOg1z/Kt/tZ527jno+XOVInitrQFW94rX9pT?=
 =?us-ascii?Q?z6h1Le8AaznCKH2Z/Usa1esgO6Qrpoao4wj+14to0NAeqA9rszq0ztvjZw8n?=
 =?us-ascii?Q?kzrfDEA+ce7IEyitNBqzh0h4dUFupdL9wbHfhl9xLxz6H7koIeMA+LSKmXZC?=
 =?us-ascii?Q?EvkKiXSHbTDMBZ/DgOi72V+VLkPxgcjXGWHgVBdpgwrIq4c5gssRmJKf/whl?=
 =?us-ascii?Q?noT21CMBtiojay5QZssQONqEWBCpXGsffK+YC8G250p4Ztm5iaqgRDEwJxh+?=
 =?us-ascii?Q?Tm+944JZG2hcWazcBLDX2q53ZIp7qL21BTNmGyDK4K7IrXPLyVFSGIfkOC33?=
 =?us-ascii?Q?Y3qFdKOUjQTohrEbneYi6kwY8CvWEnpCjX2JnEbjhNLgUAfPhKz5zAI8wmlu?=
 =?us-ascii?Q?h4AqPUurX7fTb5RstgndPnmfYVxAOx5O3n6bBKwz2fqEMoAWY38TSqbvm6Zi?=
 =?us-ascii?Q?/A1KLHWrA0WSDGrT3IxgfxgrxCEQKTRReypz1Dbp2gaOgN9UyYdIMoMYndqO?=
 =?us-ascii?Q?EURqaS5Tp9GOYgyHQzCuc5ODeTThCdnjK0x3OUQPDANjI5DDO30dnSMZ5LV6?=
 =?us-ascii?Q?hV08iaMWURTvLTIeIA8PiKLUKfi/YG9a8mAxZDZNwO+CIT6c4SXyt+qIPaiH?=
 =?us-ascii?Q?YQisqLpwyrxoWLrEZ+KOHv96kEzO4ZWdY5xlT61xwqV+v0m59Uof/HYg+H+i?=
 =?us-ascii?Q?X37U75wwsIYGGfY6aA8TcSbw2H6WckOZUgmakH/fISCQ/BhQY5U76MFFzQ+9?=
 =?us-ascii?Q?YPaiOVt6BY+04BJIQlRgWL2vKZj0TsNiPTVosBJtj4cp5/p6bJMtdAQHjzm8?=
 =?us-ascii?Q?+cALsqS6KKsVU5V0lS+7hKV+jvG+C9gndrCo36723YEayW7tb46uDdxTByPa?=
 =?us-ascii?Q?pXNtzgEDYBZNCN3S7ayO2hkVW4ljGEn/8a6rhHKy6iN9QtbmowL+oipnMjk5?=
 =?us-ascii?Q?/irdrhLbq2OZm1JjotIpv0vB9G26ImXz9W7Y+2AytCAoruGZs4uW+TZeOW0b?=
 =?us-ascii?Q?TXvRNsq4AoqAesDp6wnR7UwT+1LP2DWhee6rMeXlXbq6KEeIhJfbLRlZ1+l4?=
 =?us-ascii?Q?w/4fRaOreu0BXF6zrpwb3jaV0Ba3cvXEjXwHgDdGyYvBMUkE7g1nmqM4iN4E?=
 =?us-ascii?Q?M3oFLIJiINRbZXKZkyy7yRkFhP58bnMspQ5pMFm9vSl6zGZ+cku+MN0mFTBQ?=
 =?us-ascii?Q?vIDjICImFau4/QVEnFUpjXOy4mRy4POK8yXTF3raXw+45Tp7Yq5fqT0XF+Aq?=
 =?us-ascii?Q?/xoqxxPg9qMqXbFfH8cm+cvmao23CesftB0AowDspTFCPnmPiD6DodgM/zy4?=
 =?us-ascii?Q?SW6aGFvcC340DeTnXu0yFycibI4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <61DEE95302E2804AB1178E73018D8213@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9095e362-39c6-4343-c7cf-08d9c0ba9633
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 17:36:26.5436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slVLyRHmOG0u/3CxW8IYZ1OcSGWMKl+m+EC2XyC8OKaHabh3VR1QL/p98+5uhZ7c1bo+ns2k0AejezXhvtVc+pkb1GGnz8z4/pv3SGiaCic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7134
X-Proofpoint-GUID: zMrqiE1m4Zk3-Tu1Cm1EzTO00Sh9HXLf
X-Proofpoint-ORIG-GUID: zMrqiE1m4Zk3-Tu1Cm1EzTO00Sh9HXLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=825 clxscore=1015
 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160098

Hi Jan,

On Tue, Dec 14, 2021 at 10:41:30AM +0100, Jan Beulich wrote:
> On 14.12.2021 10:34, Oleksii Moisieiev wrote:
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
> >  #define XEN_DOMCTL_vmtrace_get_option         5
> >  #define XEN_DOMCTL_vmtrace_set_option         6
> >  };
> > +
> > +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
> > +struct xen_domctl_sci_device_op {
> > +    uint32_t size; /* Length of the path */
> > +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
> > +};
>=20
> This being - aiui - Arm-only, please enclose it by respective #if,
> just like we do for certain x86-only ops.
>=20

I agree. I will add #ifdefs in v2.

> I'm further afraid the term "SCI" is ambiguous with ACPI's System
> Control Interrupt, so there's some further tag needed in the names
> used here.
>=20

Thank you for remark. I'm thinking about SC as System Control.
What do you think?

> Finally please make padding explicit and check that it's zero on
> input.
>=20

I will align the comments in functions and structures in v2.

Best regards,
Oleksii.

