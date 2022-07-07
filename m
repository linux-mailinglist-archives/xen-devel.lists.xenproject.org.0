Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14456A1BD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 14:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362967.593270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9QHZ-0004rI-4I; Thu, 07 Jul 2022 12:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362967.593270; Thu, 07 Jul 2022 12:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9QHZ-0004or-1T; Thu, 07 Jul 2022 12:06:57 +0000
Received: by outflank-mailman (input) for mailman id 362967;
 Thu, 07 Jul 2022 12:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmvb=XM=epam.com=prvs=9187b89ef8=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1o9QHX-0004og-CC
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 12:06:55 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 493008d5-fded-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 14:06:53 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267BwHFs030574;
 Thu, 7 Jul 2022 12:06:45 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3h5fvvb7ag-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 12:06:45 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM6PR03MB5266.eurprd03.prod.outlook.com (2603:10a6:20b:c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 12:06:39 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2d63:5490:24b9:415b]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2d63:5490:24b9:415b%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 12:06:38 +0000
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
X-Inumbo-ID: 493008d5-fded-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRWGbBSbIGuz1BF16vmi/wnRtSHjUlyixsh8p3if1M2g1YYKMFy5lKsfQQp6cZo9c0AFf1/tl97VYVV9VHxjnUwrH6Cc5BqFFLh9QLtWRAkqMf8wUcKJd2zKhJeC0mdQx67N4qu2sgNp7zvgJJ+oc3XL2u45XbUqSGOrZtAMZUwHyhDjsszM3+rFaEPB/aW1M6fSRajDy8eNlFZn3gZWTvZO48w7SFFEalTOR0ZfvcGRN7oWGDFW2glCW+r+GCNvGW9AstJ1ryFXH6v1Y770afq/Dvr5R4nJLT7wkV1rnDFYUH7EYinUUldD60laA1+vdUnI+Jpx8VIXs6/Niw4RNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GTJ/PGTCIjb+M63Zhn/rEyohdqXK81GiesLJm41nJc=;
 b=J8yUIkp1uDnxsDF2vNuQ+Hc93ZnZOAXn+ns65OtOYnF0xxIWxfTJj2fq5GvKMQRAUu1ncPt4QjsfFko7vvfO7G2dPMCjoJgOwlkfiuyRaTEB6H/y3SM/AtfaoaPby81tN/DIPnr4JmgQpYaPjpt3H6eaa6Hyd64x/YKf3nvlHlB9gPwtAyZcoZ/WZHqhSdRItPStaYQjngEW1N83am8XY0fOcuh/h4cxek3Ok0SZVXdbyjxhmVHX3P1X2ndQN6NyIpqsR6Wajjt6+/SO6mx35mBQczsGPVHTv3cU3VG2NJgrqW+FnM8ur91PObotahf691o1tqidwT4KfQrM5zgTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GTJ/PGTCIjb+M63Zhn/rEyohdqXK81GiesLJm41nJc=;
 b=IBSJQJOqjvcR6eYvuiHSvbt5Wn9siIyAjnsNDYBVgfPIgOx23mst9VJZ0vNZ2tj7DbbzdWUI/UG0QD6hU2dzxQZkuT2EEmlDUzWBbLRaAVfB1VO3ecsE1l0pBXZEmKstqJ29MdorRybMmHAXUnsZdtmu+K/BjSHvUxorD4OTrdENuikkC/TNh9ufI5QLeBoZlz1xupIC0yf4oN8NkYRJb1FSr0J8M+X4xShat9jXcUOyhot1WRw1xH3cBIwXXTNkkAOFUOcgwZXfVGHAVtXGNUNbtxq9Z6IMbsWXeT5lAqXAypPzdxZM0wSiiS4BXRYhSo3/PZcNdp2hKZVmNq5uvQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Nick Rosbrook <rosbrookn@ainfosec.com>,
        Anthony
 PERARD <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC] DVFS and Thermal management subsystem proposal
Thread-Topic: [RFC] DVFS and Thermal management subsystem proposal
Thread-Index: AQHYke02Cidd2c7KkEyfmAiMVFzcy61yzQ4AgAADHAA=
Date: Thu, 7 Jul 2022 12:06:38 +0000
Message-ID: <20220707120638.GA1989842@EPUAKYIW015D>
References: <20220707103500.GA1959452@EPUAKYIW015D>
 <16803e7f-5a7e-91c0-03f0-3133e0dff957@suse.com>
In-Reply-To: <16803e7f-5a7e-91c0-03f0-3133e0dff957@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cc53e90-6e79-4321-8abf-08da601125a0
x-ms-traffictypediagnostic: AM6PR03MB5266:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ofr+ESxF2Qx2R9PzT06BhKKzcJCqLnyU3IzNLQ/O7Yj4cr/7ZuqMjypV0LGSR8nZZUthqU1QIGxW7w9h7A9ehMDUT3xu+mrJPgcNUxn7LVRkLV5LvESEDdjKZ3ImpLKSOSWBfg23rDy8ahWpWjxaKTk/Vmo0jBF3yRha6xvT4MMbLMSzZ99Lo/EAEKXedLGTQaAkSdFZRABOJO+3Nvc+yNIZu06dtZ1BHf/LYk1jSAhuO6lOpXhUc94aq2b0aMeE02X6Py69qWun50LTQadNvIko6oPql6MnU08nOqxcGPNYM78XtD2DpDDfzHhe7vhDD8rfwNKszHEVAsNXf1YnccXqEC28Y1jHCbmZ4MQGHSqBI81+4V4O+/g7Xkjua1NFd/MKccAlkR55MromRQ4EK6rMUEZmDGmve9CAqxYfZTyjyv9yU1z/TPVD74UaDY805zAToTQCRSBL6tg/yDFeP8lwY2a6v7oPu88J8u8WXnrUdrsevLwGLBJT51GX0K3Ejn19Ngf8RRPJUk7jc3h8k4P90zMqQP2ObJX+v+Y78NFQLR4ewEJtUJQRG9u9Iv14aAPpvaRWxB06gWf0NNvNd/icIjB4aXRI7kI9sQ0tGR8hNpYA9HLCR23q0g3QxbmzURm0LS23O67h3VH/UDB5Le9LUU3RsyD5AtRgUBRXLxaqNC1BPrC0Km2BRIEGqMAINMJ/3N8gTtxNdgezJYsxAbciN1nD//iQM4MQeV+PQPEumVlwSYKLHQxEJ6HsJ1ZimJRGAKmoSXo3tRnZFib/WboicTCzZWmHIB50gFaw7VlwKqqkDwBW34JWHYnAGcFZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(396003)(136003)(376002)(39860400002)(346002)(5660300002)(76116006)(66556008)(66476007)(64756008)(66946007)(4326008)(8676002)(66446008)(8936002)(7416002)(33716001)(2906002)(6916009)(38100700002)(33656002)(86362001)(83380400001)(38070700005)(91956017)(122000001)(6486002)(71200400001)(41300700001)(316002)(478600001)(55236004)(54906003)(186003)(1076003)(26005)(9686003)(6512007)(53546011)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YAEabt9NIZk2m2MFhrgjFd4eaiRi80m9rlsUrmvYDHTpEjktlgtaAd1EneX8?=
 =?us-ascii?Q?OdUx3ePKq2CJP4GKksDsk0XV53CPA8P58+StTS4sDzufpadZH/G0wTRwe6O3?=
 =?us-ascii?Q?0yt+bI6vA6seQxU2RNof8Kv2ROs5kw+vaQ99BQT8gF4gaShoHgL7VINzg8nR?=
 =?us-ascii?Q?XeHnoHgC/lHIL2kwyNe7Jc4sX8wmgKLHSwsJRNzvoJd9H+BU2btOWrtWOJJS?=
 =?us-ascii?Q?XG0ala84jd+C2oN+BbMFn+b8+LpNkGoTUwBChsF7f7rVfS5a7zwto2dRQmUu?=
 =?us-ascii?Q?0/7/3A6eh8cGGXwWvUnedCH7lALkNv3vnM2OOVpLOFB0JoFzYZOBMTZYWi7D?=
 =?us-ascii?Q?A2ux3oRmdLVC1FUiUYbvNqT+uGpR5KOoSj/N4FRK95wERJwY9I2ZAOylV8wK?=
 =?us-ascii?Q?ZunBX4EMJgTglDCY0fhL82jpypCbQRi2eqs7sE5SI9CM6y3R3gtTuVofZECv?=
 =?us-ascii?Q?TyIznijK+phvSPHaBVbeqs13ALtFqoCwphKBJ1gOQP4VwsdsobWQW7zy4U72?=
 =?us-ascii?Q?JBt1deK2DUnzaAZezcYHrWESZSbuJDnHO2pb6DF1tc1rWHSwEv55oz9eISax?=
 =?us-ascii?Q?k0mNFWPDbiO9gEx78YJjO8xP938JcMQuY/zv8qNSkDq0ZtiSMY9YsnxCyZkd?=
 =?us-ascii?Q?v87cytKpMi9tLvX5PUfpK6DDwfSL+IaIwcH3cjOKks2EVLMygoyMcnez16ZJ?=
 =?us-ascii?Q?ha2Q2qhnOHXsnXSjW+WXUDRzbwG1oHqXpbB0nJ1/RXjp1dxYTu08TcVryVB+?=
 =?us-ascii?Q?B8047PSandfe+ABveguHVcA56VFtevDSPQ7XoK0TRxvz0IyDCEToq/rz2dpC?=
 =?us-ascii?Q?eeQ98YOgZW50jPTRQ2erNHNX7ZOKHvEH5M0QP5Pj7GJQyQHhnMHkZN5AmuLZ?=
 =?us-ascii?Q?ihYzjNX+Xl/+sQMz0yuPPi9LewpJvYM8aFr6yKYKc7VUB7KkhanWHpEgxke5?=
 =?us-ascii?Q?tsh0C7nGyhNwUY2zDXxPzyCjQnPwJJ0/a8e+c5pZtUY7yItXJN33RdinEdHY?=
 =?us-ascii?Q?1yjO2/L5HK85y0yjjUDJEOmt7oASEYtiIuN8AngAINsV2Pz7JqD3P77FgzO9?=
 =?us-ascii?Q?RaDq0SLw6EYFaki6kCijSUOjz6zoOPmqPefk9ifNoAtlVQmJ7ISygRTPEuXt?=
 =?us-ascii?Q?bdVfLApxxU4Sbbib8HhdYZ70H0TF+dpXOEdOuTq02lz5H0ZNiq1M62YasMFh?=
 =?us-ascii?Q?exzrZ3NZX/6gukbUUV3T56yk+JRMK7APuEaf+z+1hLFWWFR9Wxiyj84O4B2a?=
 =?us-ascii?Q?nsrKKyuVzjqLOUVhg4EAdNRGoyps2SHWnrW7FqPnNnRKXyXyu0L42bMUzpEc?=
 =?us-ascii?Q?NP47w1nY13D/WY5XXbsNd3yny8jyfOvaUWITMiQeijpX1gOpllKTnnfmE8lC?=
 =?us-ascii?Q?evAqYIiTBofd6wVwCrVR7MYz5r/COyrdRvR6wVey4NBkeP8o7twbcg67pJXi?=
 =?us-ascii?Q?CkRIXU7QcYYDJra+BNs5TkZ4Gfr4iaqPHhOibJ91IEiWoo8O5VSOOOpT1Gvt?=
 =?us-ascii?Q?4Vgg9Z3jqOLjalTYDOdt0VT3Yfkpx+muIAb4NsqhhDbl3sWetiZshUNm8RI9?=
 =?us-ascii?Q?t0WEw2Pk58BIQhTu+bHaQSbekA/SnXDcST3BJtMbps5rpsZalD40s/VvXkfm?=
 =?us-ascii?Q?4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6E4098D2890E2A4280AB5BABEC902926@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc53e90-6e79-4321-8abf-08da601125a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 12:06:38.7698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dk2NZh8vqGLPDuu9XsyEqbXfFaR4q5On2ynCasrnObdywXuOK1VP5OUhIg1zhjbrRzJWzmzv1VPjkRW427lOXCqMNUrcL83RTHamH9jo8X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5266
X-Proofpoint-ORIG-GUID: e6Qm8pTfDMgwiOYXS4j2nhAhWIQYsvRK
X-Proofpoint-GUID: e6Qm8pTfDMgwiOYXS4j2nhAhWIQYsvRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_09,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070048

Hi Jan,

On Thu, Jul 07, 2022 at 01:55:30PM +0200, Jan Beulich wrote:
> On 07.07.2022 12:35, Oleksii Moisieiev wrote:
> > # Synopsis
> > This document is intended to describe the design of the thermal based c=
pu
> > throttling in virtualized environments. The goal is to provide generic =
thermal
> > management subsystem, which should work with existing cpufreq subsystem=
 in XEN
> > and could be used on various architectures and hardware.
>=20
> Looks quite plausible to me, just two questions:
>=20
> > # Cpufreq subsystem in XEN
> >=20
> > ## Brief overview
> >=20
> >    Governors
> > +--------------------+
> > | +----------------+ |  struct cpufreq_governor {
> > | |  ondemand      | |      .name
> > | +----------------+ |      .governor
> > | +----------------+ |      .handle_option
> > | |  powersave     | |  }
> > | +----------------+ |
> > | +----------------+ |                              +------------------=
----+
> > | |  performance   | |->cpufreq_register_governor() | +----------------=
---+|
> > | +----------------+ |                              | |  cpufreq_dev_dr=
v  ||
> > | +----------------+ |   cpufreq_register_driver()->| +----------------=
---+|
> > | |  userspace     | |                              | +----------------=
---+|
> > | +----------------+ |                              | |     ...        =
   ||
> > | +----------------+ |                              | +----------------=
---+|
> > | |  ...           | |    struct cpufreq_driver {   +------------------=
----+
> > | +----------------+ |       .init                  +------------------=
----+
> > +--------------------+       .verify                |    Hardware      =
    |
> >                              .setpolicy             +------------------=
----+
> >                              .update
> >                              .target
> >                              .get
> >                              .getavg
> >                              .exit
> >                           }
> >=20
> > Cpufreq subsystem consists of 2 parts:
> > 1) Cpufreq governor, which should be registered using cpufreq_register_=
governor
> > call;
> > 2) Cpufreq driver, which provides access to the hardware should be regi=
stered
> > using cpufreq_register_driver call.
> >=20
> > ## Hardware drivers
> >=20
> > There are two Cpufreq hardware drivers implemented by us (see Appendix =
1 and
> > Appendix 2) to provide support for Rcar-3 and i.MX8 boards. Those drive=
rs are
> > designed to support thermal throttling subsystem. They are going to be =
the part
> > of the contribution package.
>=20
> Are these drivers also intended to act as "ordinary" cpufreq drivers,
> i.e. controlled by cpufreq governors instead of thermal ones?
>=20

The idea is that cpufreq drivers acts as ordinary cpufreq drivers,
controlled by cpufreq governors if temperature is fine. But cpufreq opp
level can be overriden by thermal subsystem if critical or passive
temperature was reached.

> > # XEN Dynamic Thermal management design
> >=20
> > ## Synopsis
> >=20
> > Introducing the design of the Dynamic Thermal Management for Xen hyperv=
isor.
> > This feature is an enhancement of the Xen DVFS feature and will allow s=
ystem
> > admin to configure different thermal governors which will perform CPU
> > throttling, based on the CPU cores temperature and thermal configuratio=
n.
> >=20
> > ## Top level design.
> >=20
> > +-----------------------------------------------+
> > |    XEN                                        |
> > |              +-------------------+            |
> > |              |      Thermal      |            |
> > |       +----->|     Governor      |            |
> > |       |      +---------|---------+            |
> > |       |                |                      |
> > |       |                +-------+              |
> > |       |                        |              |
> > |  +------------------+  +------------------+   |
> > |  |   Thermal        |  |    Cpufreq       |   |
> > |  |   Driver         |  |                  |   |
> > |  +------------------+  +------------------+   |
> > |                                               |
> > +-----------------------------------------------+
> >                     ^
> >                     |
> >                     |
> >            +--------v--------+
> >            |                 |
> >            |    Hardware     |
> >            |                 |
> >            +-----------------+
> >=20
> >=20
> > ## Thermal management subsystem design in XEN
> >=20
> >  +------------------+
> >  | +--------------+ |
> >  | |  powersave   | |               struct thermal_governor {
> >  | +--------------+ |                   .name
> >  | +--------------+ |                   .governor
> >  | |   stepwise   | |<------------+     .handle_option
> >  | +--------------+ |             | }
> >  | +--------------+ |             |
> >  | |     ...      | |             |
> >  | +--------------+ |             |
> >  +------------------+             v
> >           +----------------->register_thermal_governor()
> >           |
> > +---------v--------+                         Polling temperature
> > |   dyn_thermal    |<--------+             +--------------------+
> > +------------------+         +------------>|  polling_handler() |
> >                                            +--------------------+
>=20
> Polling (only)?
>=20
Here I described "worst" scenario when HW do not support IRQ in case of
alert. Both Rcar-3 and i.MX8 patforms have alerts so drivers will use
irq handlers to do throttling.

Best regards,
Oleksii.=

