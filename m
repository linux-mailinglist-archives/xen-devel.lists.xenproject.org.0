Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED4478BC7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 13:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248609.428811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myChe-0001xO-Nb; Fri, 17 Dec 2021 12:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248609.428811; Fri, 17 Dec 2021 12:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myChe-0001uw-K9; Fri, 17 Dec 2021 12:51:14 +0000
Received: by outflank-mailman (input) for mailman id 248609;
 Fri, 17 Dec 2021 12:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qsGH=RC=epam.com=prvs=29854569c1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1myChd-0001uq-1W
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 12:51:13 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffbd2053-5f37-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 13:51:06 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BHBvw6T015344;
 Fri, 17 Dec 2021 12:51:01 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d0ryq8hsg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 12:51:01 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6784.eurprd03.prod.outlook.com (2603:10a6:102:f0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 12:50:56 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 12:50:56 +0000
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
X-Inumbo-ID: ffbd2053-5f37-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3+IJnp3U4lHyI8iLCQGEyfzp+aHceYHE8k3n17MPG+UOt3/yTaU1MZTPrG5aysBFA6042yD0jupWBmeknzFqaMUGNXdeXlwmtABIlqBoazPMcchgv9HaYHwkRZSejM0b4kXuKU9sqKxl8em2/1UcF7dlm3xPE3P/tqQXaJ3Je/209W3VM4wi/ojUbBJ9CFVQ49jGJ8NPKR6oDh5f/v4JCybFzGsrh1PcQx6CEYBUpgqdM1rzZ7Qs4C8R+oGPPx4Q1LNk6ri/utRURYCkHAyOZJO+kkNGxWVoEGLFd2+RsRAUQrSnBOqiPBxeG1ZwfykCwvZ3nSxl98FZoOZdom3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzssSX9VZGpFxi8yNv19MUmcBjVLw/gpV4xwVtgpp+8=;
 b=V86DLh1U3FuAYFFZIbKLUfEVfaD7WvumQLb+SEaonjpwSdI+nTorZoubmXYEy2na9qTY2LZIjrX9LGCHbV/9SSqNE6ozRbT0/XkPbUgHljLrGXROwk1TddwL2eXrL/qC5KPTgaI9gVmbrNDg4MAxRAjhXOHVI1DBthzAUlLFjFQOzBjMuwdcDze0IqjaPvWIVnvTXhpGGGqyGrzHUhnjnsceHprf5UCAvBrtT646yXPs1ymJ5PTotLLX8P8qhlt6G80v/bVhiWgdkAYj3IBYGsvmFtnANXU7TNxHTLVEXy0aRPbi1Qm3C6dK9hIu5ZbXMazLf3aoQljKldLMsi344g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzssSX9VZGpFxi8yNv19MUmcBjVLw/gpV4xwVtgpp+8=;
 b=QUZbkitPIqk4O3voWAYRdBJVXh/6AfF1opvYemZ61sjrJSvcvHrmYkxIW+tz9Cix4P9bAKXTz9Htwa5wD1vjycXdJkKhD/FV7lAZThRFjkJg6RM5nCdKasITLiaYAY+7Qh+W2ScpqfCRxzTXm3dNAXKcguKRBHh+oPeCXQapnccuTk0pGVyTt+yztLwvlrVAdBLU3Aw7SPtwzCnblElmtiK6IutJTDGogUJu3jVQgN2iXf/RexKy8tAhvH+oSdZpt81LkZJcGk5e3Y76SIPYQRACuG8EE7TQZpbK5idzDOdpBsQl86oSHfKC/EByk75yIcTyeouKaB5SD2WxbrrpWQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 2/5] xen/arm: add generic SCI mediator framework
Thread-Topic: [RFC v1 2/5] xen/arm: add generic SCI mediator framework
Thread-Index: AQHX8M3IB9WR9OXgbE2xll7qsLGWC6w1/pyAgACpPoA=
Date: Fri, 17 Dec 2021 12:50:55 +0000
Message-ID: <20211217125055.GA4026247@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <c0afe4837fe99e7f7921fc43b130aa2234f234be.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112161831230.1662642@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112161831230.1662642@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ca6a4bc-cec8-466a-2d5b-08d9c15bde15
x-ms-traffictypediagnostic: PA4PR03MB6784:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB67841818F6D0C4956663B14CE3789@PA4PR03MB6784.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 802uWNboODdJnD6s336gInI0GpFthtKcLnL0oNaVM1oiMJIAPTkA4PXM3VxMLoN0UBoV4SVtVAKKekur2QmKBZQS+6hkiPzkc83IYgGJvbtyN6KKDFt/3tv2hio1o1zd0qn/IrTyfh9SArnlPN/2H011bxeUXVYm5nSBTCY+EMP8E6W9Y6WRxyDh2r1JGYPUTMSA+5pIUx2Jk29Tf6XseO66hxkgZ1wj8ILaxsYSWeiTCPO/UoR3uUsDVAojPl5oVy2jbn4D+zgDLiQk8ZJASvPT/evKr3vXQV5apFHx5zmBtrWIcmZv5ZF6Gl6/PUxsB724nI4AZg+kdk/I6mPVS5x0FQGPU3QVtWIIfyhKI+7zsfnOlyqlKn1AuG0BubWFYsKW1ZIGkjwBTY87gesxV0/7i8YgfCTipvHCOOLpA7VzTfg2JNekptsR1BndMNfAC9gnZfIAecmTKQSbIjtnWJbCwV6TqwqFeZ3bFRu/55NY4BOHlNCM8ET0KzIXLO3HIQ+gMD+K1ITBoiH0PTbnY8uhy5075BUnu4IY6C5LPiWDB+vh26Cb6gPkkLa65TIa2vigXNR+wClrM17h4rcDEWzTzbk3qa+Fb0gJ/M7YewX/cAUAKlo12wpmbElLMNohDIWO+2IZ+5n3LfIoYMQGtgZq1HZNq46gvF7w/tr9SVOepNIKiJnDf/AFXwjQWObINnU3aSu1fyGYzpx0M6/JriV6CK8gvUtDPoTaYH25IzAcydt6R59+DyK6JItd/VcBRXnAv2I7YDmSRq3v6eu63w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6512007)(122000001)(66556008)(66446008)(64756008)(1076003)(9686003)(38100700002)(71200400001)(6506007)(5660300002)(8936002)(6486002)(83380400001)(8676002)(38070700005)(66476007)(33716001)(508600001)(54906003)(30864003)(316002)(66946007)(86362001)(33656002)(26005)(76116006)(4326008)(186003)(91956017)(6916009)(2906002)(41533002)(2004002)(21314003)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sQG4HypCwgqUx9gYT+K7yVwl/MpOUT9MVWc+ELadE9kHOyGwUdKsGcxjijiv?=
 =?us-ascii?Q?khXj66yUObsRcry4NZD1Vr40T3oMlS8XCpFbc9WfVhC1qQlNmgTH5tTbSvjM?=
 =?us-ascii?Q?CGI9ul65z5moaL/8fe69NLSM6YNT7+eDS+02vpuYB/afBd7i5n20R+VAoage?=
 =?us-ascii?Q?rP6nXfaqxV3Bdi9E5H5iUzIbFUX3mhJO1rMV+mbQjj4Mzs0H3CJ9NwYPaz+x?=
 =?us-ascii?Q?142v4o/+neHQQd0qiZRtKdX1SPzW5lZAxQ0xymCo5pQiItVQ38t2GjwtlDtR?=
 =?us-ascii?Q?r6Y8ti73Dt3XaoHUSYBDoOG9KtQc9Cn8AsMlHmZ1t9rpp81lrx+hwTq6/YdP?=
 =?us-ascii?Q?KkeugN6xRNLPP/Cc+FwubtIBorMNoCisS1h6gNc8MoUVBMWEKO010e2StnBt?=
 =?us-ascii?Q?6rb6oLWejVDKFssn88OzIwyGAzArug7owXIaaBuoLeomLfZxZgsNFQCYSH47?=
 =?us-ascii?Q?t3mFtJIyZRkFzbVBseII/g6eXyFJphgdEZhw09zqoQ9PO4REjKGkXS36KnM5?=
 =?us-ascii?Q?f6jM9v2UxZgGVPYXmhNJRXKvwdkKXId2k88YyfZLVOlDnBQXLQzOOEYHoqiq?=
 =?us-ascii?Q?FPRLRqMrwWqnOaL9HRQ4pJrjT3l6sYfs2bFc4jLR3kZOPJZmPpyhNDmfENRA?=
 =?us-ascii?Q?umDK5QnvXH6/M96842loeFkh/E4ETWACy60xPdc8ZElEdee8DUVd2J064W6n?=
 =?us-ascii?Q?+0rOHwsEaWhySvbh2mCfim8t8w+8GquXF1h9kXH32Ufdd3E8Gp/oQwOZvMXu?=
 =?us-ascii?Q?zrC6DXNVlnwe4O5Qiwqz11uCR7kpG19UYoW/4UdXsV6dreCbX80Sa495b4JI?=
 =?us-ascii?Q?JfTR4bNN0lcVdCdYdaQSM9PUuWHcFjRrzdUz/bw8CkmffBHLPl0jiQu5TiVS?=
 =?us-ascii?Q?dPXJLjVcA4+umYq/HXtkKRf9oYmjDOUUyXFd0Mnd8ZOq01Z83ENIO/PxOR0H?=
 =?us-ascii?Q?LKRm8I/1bWu/4XRd+UQo0drE8Vo2bwZ5EkZwTLUjKLXyG9rMxANXsK582SKE?=
 =?us-ascii?Q?Ieb+Kswz+L0Pe7+n0uDi8YwvUSKF9YLAOlKz2gEv3BqlFkDSNJqVKwyTDBOB?=
 =?us-ascii?Q?O/l9bo8S4+CHA3iAaDQK8S9eIaFq7H3Ra98sznkTEGZGQq4AdHGvcLXZnVaK?=
 =?us-ascii?Q?JuT+xAliDZDhi9O+gzaZN5OLgWIlkNM59D8bALaz49Xs9GZ4qr4W58b/9wTX?=
 =?us-ascii?Q?JpJ4Pnp71IadE+fR0z9TpySxuSWk3fra3BsjJorLGPdRk/ZpnyQoNkn5lhR2?=
 =?us-ascii?Q?cu2EQiM3rsjNoz86K9ZryKvItrFO5kFLFo6Qinc/ssLp5QlFaIUdrJihlNh0?=
 =?us-ascii?Q?GdhK0xXQLdTbHsqZbvgwPnt7Q95uA12MOs5B9DcdBPPWqwuMbFcgLeiJfaD+?=
 =?us-ascii?Q?GtLKURQe20qc33kkkfaQPSTr2uyrv5W5zrSa6ZQfWwmoyth8AaHYZCtbHnqn?=
 =?us-ascii?Q?mDfTCqvN49ar1WObd6BEoqe0/ub4pCDSlpbft7GndP8+QlZd0rt4bMMBl1IV?=
 =?us-ascii?Q?nFvGIlmhhopks+Xd2Tip0Fjl6dLRfWiV3ogFM2Lwkj9KgeWCECNV2kb3Cz0T?=
 =?us-ascii?Q?FOc//0kyx7kX914bh3kF63u9NN7R2otUg7xyk3ozEm2brCEQ1SzlQETsOVKd?=
 =?us-ascii?Q?3SjtsVD/nk922BkzMe2ISPT03BGEG1VLDzUPHJjmJ+BOZilxXUmKa3HCIoZ8?=
 =?us-ascii?Q?RL0v9IkSU5Ggw1UpLuyr3PM/ZXw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AB0671866C6816489318214C672E185A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca6a4bc-cec8-466a-2d5b-08d9c15bde15
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 12:50:55.9563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IA1ExPeaL/h9GmgyFMT9TjPmAyJg/lQsEhywwZNMuuEdVqbmmjG5IvQdcJOjnWEPovNDgA7hlM88iF93Fo0drrO0ncdK7kuctr7BEpogP8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6784
X-Proofpoint-ORIG-GUID: 9JYDl3zOswziQplMrPwghEecQypaFILo
X-Proofpoint-GUID: 9JYDl3zOswziQplMrPwghEecQypaFILo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_04,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170074

Hi Stefano,

On Thu, Dec 16, 2021 at 06:45:11PM -0800, Stefano Stabellini wrote:
> On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > This patch adds the basic framework for SCI mediator.
> > SCI is System Control Interface, which is designed to redirect
> > requests for the Hardware (such as power-domain/clock/resets etc)
> > from the Domains to the firmware. Originally, cpg should be passed
> > to the domain so it can work with power-domains/clocks/resets etc.
> > Considering that cpg can't be split between the Domains, we get the
> > limitation that the devices, which are using power-domains/clocks/reset=
s
> > etc, couldn't be split between the domains.
> > The solution is to move the power-domain/clock/resets etc to the
> > Firmware (such as SCP firmware or ATF) and provide interface for the Do=
mains.
> > XEN shoud have an entity, caled SCI-Mediator, which is responsible for =
messages
> > redirection between Domains and Firmware and for permission handling.
> >=20
> > This is how it works: user can build XEN with multiple SCI mediators.
> > See the next patches, where SCMI-SMC mediator is introduced.
> > SCI mediator register itself with REGISTER_SCI_MEDIATOR() macro.
> >=20
> > At run-time, during initialization, framework calls probe for the first
> > matching device in the device-tree. When no device-tree is present - th=
e
> > first registered mediator should be probed.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >  MAINTAINERS                    |   6 ++
> >  xen/arch/arm/Kconfig           |   8 ++
> >  xen/arch/arm/Makefile          |   1 +
> >  xen/arch/arm/domain.c          |  24 +++++
> >  xen/arch/arm/domain_build.c    |  11 +++
> >  xen/arch/arm/platforms/rcar3.c |   3 +-
> >  xen/arch/arm/sci/Makefile      |   1 +
> >  xen/arch/arm/sci/sci.c         | 128 ++++++++++++++++++++++++++
> >  xen/arch/arm/setup.c           |   1 +
> >  xen/arch/arm/xen.lds.S         |   7 ++
> >  xen/include/asm-arm/domain.h   |   4 +
> >  xen/include/asm-arm/sci/sci.h  | 162 +++++++++++++++++++++++++++++++++
> >  xen/include/public/arch-arm.h  |  10 ++
> >  13 files changed, 365 insertions(+), 1 deletion(-)
> >  create mode 100644 xen/arch/arm/sci/Makefile
> >  create mode 100644 xen/arch/arm/sci/sci.c
> >  create mode 100644 xen/include/asm-arm/sci/sci.h
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e43dc0edce..5f96ea35ba 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -512,6 +512,12 @@ S:	Supported
> >  F:	xen/arch/arm/tee/
> >  F:	xen/include/asm-arm/tee
> > =20
> > +SCI MEDIATORS
> > +M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > +S:	Supported
> > +F:	xen/arch/arm/sci
> > +F:	xen/include/asm-arm/sci
> > +
> >  TOOLSTACK
> >  M:	Wei Liu <wl@xen.org>
> >  S:	Supported
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index ecfa6822e4..186e1db389 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -106,6 +106,14 @@ config TEE
> > =20
> >  source "arch/arm/tee/Kconfig"
> > =20
> > +config SCI
> > +	bool "Enable SCI mediators support"
> > +	default n
> > +	help
> > +	  This option enables generic SCI (System Control Interface) mediator=
s
> > +	  support. It allows guests to control system resourcess via one of
> > +	  SCI mediators implemented in XEN.
> > +
> >  endmenu
> > =20
> >  menu "ARM errata workaround via the alternative framework"
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index 07f634508e..6366ff55e5 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -8,6 +8,7 @@ obj-y +=3D platforms/
> >  endif
> >  obj-$(CONFIG_TEE) +=3D tee/
> >  obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
> > +obj-$(CONFIG_SCI) +=3D sci/
> > =20
> >  obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
> >  obj-y +=3D bootfdt.init.o
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 96e1b23550..80d0a23767 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -34,6 +34,7 @@
> >  #include <asm/platform.h>
> >  #include <asm/procinfo.h>
> >  #include <asm/regs.h>
> > +#include <asm/sci/sci.h>
> >  #include <asm/tee/tee.h>
> >  #include <asm/vfp.h>
> >  #include <asm/vgic.h>
> > @@ -688,6 +689,13 @@ int arch_sanitise_domain_config(struct xen_domctl_=
createdomain *config)
> >          return -EINVAL;
> >      }
> > =20
> > +    if ( config->arch.sci_type !=3D XEN_DOMCTL_CONFIG_SCI_NONE &&
> > +         config->arch.sci_type !=3D sci_get_type() )
> > +    {
> > +        dprintk(XENLOG_INFO, "Unsupported SCI type\n");
> > +        return -EINVAL;
> > +    }
> > +
> >      return 0;
> >  }
> > =20
> > @@ -764,6 +772,15 @@ int arch_domain_create(struct domain *d,
> >          /* At this stage vgic_reserve_virq should never fail */
> >          if ( !vgic_reserve_virq(d, GUEST_EVTCHN_PPI) )
> >              BUG();
> > +
> > +        if ( config->arch.sci_type !=3D XEN_DOMCTL_CONFIG_SCI_NONE )
> > +        {
> > +            if ( (rc =3D sci_domain_init(d, config->arch.sci_type)) !=
=3D 0)
> > +                goto fail;
> > +
> > +            if ( (rc =3D sci_get_channel_info(d, &config->arch)) !=3D =
0)
> > +                goto fail;
> > +        }
> >      }
> > =20
> >      /*
> > @@ -796,6 +813,7 @@ void arch_domain_destroy(struct domain *d)
> >      domain_vgic_free(d);
> >      domain_vuart_free(d);
> >      free_xenheap_page(d->shared_info);
> > +    sci_domain_destroy(d);
> >  #ifdef CONFIG_ACPI
> >      free_xenheap_pages(d->arch.efi_acpi_table,
> >                         get_order_from_bytes(d->arch.efi_acpi_len));
> > @@ -996,6 +1014,7 @@ enum {
> >      PROG_xen,
> >      PROG_page,
> >      PROG_mapping,
> > +    PROG_sci,
> >      PROG_done,
> >  };
> > =20
> > @@ -1056,6 +1075,11 @@ int domain_relinquish_resources(struct domain *d=
)
> >          if ( ret )
> >              return ret;
> > =20
> > +    PROGRESS(sci):
> > +        ret =3D sci_relinquish_resources(d);
> > +        if ( ret )
> > +            return ret;
> > +
> >      PROGRESS(done):
> >          break;
> > =20
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index d02bacbcd1..38874615dd 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -22,6 +22,7 @@
> >  #include <asm/kernel.h>
> >  #include <asm/setup.h>
> >  #include <asm/tee/tee.h>
> > +#include <asm/sci/sci.h>
> >  #include <asm/platform.h>
> >  #include <asm/psci.h>
> >  #include <asm/setup.h>
> > @@ -1894,6 +1895,10 @@ static int __init handle_device(struct domain *d=
, struct dt_device_node *dev,
> >                  return res;
> >              }
> >          }
> > +
> > +        res =3D sci_add_dt_device(d, dev);
> > +        if ( res < 0 )
> > +            return res;
> >      }
>=20
> It would be good to add the call to dom0less domUs too
>=20

Thank you, I will fix all mentioned places in v2.

>=20
> >      res =3D handle_device_interrupts(d, dev, need_mapping);
> > @@ -3075,6 +3080,10 @@ static int __init construct_dom0(struct domain *=
d)
> >      if ( rc < 0 )
> >          return rc;
> > =20
> > +    rc =3D sci_domain_init(d, sci_get_type());
> > +    if ( rc < 0 )
> > +        return rc;
>=20
> same here
>=20

TBD in v2

>=20
> >      if ( acpi_disabled )
> >          rc =3D prepare_dtb_hwdom(d, &kinfo);
> >      else
> > @@ -3109,6 +3118,8 @@ void __init create_dom0(void)
> >      dom0_cfg.arch.tee_type =3D tee_get_type();
> >      dom0_cfg.max_vcpus =3D dom0_max_vcpus();
> > =20
> > +    dom0_cfg.arch.sci_type =3D sci_get_type();
>=20
> and here
>=20
TBD in v2
>=20
> >      if ( iommu_enabled )
> >          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> > =20
> > diff --git a/xen/arch/arm/platforms/rcar3.c b/xen/arch/arm/platforms/rc=
ar3.c
> > index d740145c71..a268b09454 100644
> > --- a/xen/arch/arm/platforms/rcar3.c
> > +++ b/xen/arch/arm/platforms/rcar3.c
> > @@ -18,10 +18,11 @@
> >   */
> > =20
> >  #include <asm/platform.h>
> > +#include <asm/sci/sci.h>
> > =20
> >  static bool rcar3_smc(struct cpu_user_regs *regs)
> >  {
> > -    return false;
> > +    return sci_handle_call(current->domain, regs);
> >  }
> > =20
> >  static const char *const rcar3_dt_compat[] __initconst =3D
> > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
> > new file mode 100644
> > index 0000000000..837dc7492b
> > --- /dev/null
> > +++ b/xen/arch/arm/sci/Makefile
> > @@ -0,0 +1 @@
> > +obj-y +=3D sci.o
> > diff --git a/xen/arch/arm/sci/sci.c b/xen/arch/arm/sci/sci.c
> > new file mode 100644
> > index 0000000000..5961b4cd5d
> > --- /dev/null
> > +++ b/xen/arch/arm/sci/sci.c
> > @@ -0,0 +1,128 @@
> > +/*
> > + * xen/arch/arm/sci/sci.c
> > + *
> > + * Generic part of SCI mediator driver
> > + *
> > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > + * Copyright (C) 2021, EPAM Systems.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <xen/errno.h>
> > +#include <xen/init.h>
> > +#include <xen/sched.h>
> > +#include <xen/types.h>
> > +
> > +#include <asm/sci/sci.h>
> > +
> > +extern const struct sci_mediator_desc _sscimediator[], _escimediator[]=
;
> > +static const struct sci_mediator_desc __read_mostly *cur_mediator;
> > +
> > +bool sci_handle_call(struct domain *d, void *args)
> > +{
> > +    if ( unlikely(!cur_mediator) )
> > +        return false;
> > +
> > +    return cur_mediator->ops->handle_call(d, args);
> > +}
> > +
> > +int sci_domain_init(struct domain *d, uint16_t sci_type)
> > +{
> > +    if ( sci_type =3D=3D XEN_DOMCTL_CONFIG_SCI_NONE )
> > +        return 0;
> > +
> > +    if ( unlikely(!cur_mediator) )
> > +        return -ENODEV;
> > +
> > +    if ( cur_mediator->sci_type !=3D sci_type )
> > +        return -EINVAL;
> > +
> > +    return cur_mediator->ops->domain_init(d);
> > +}
> > +
> > +void sci_domain_destroy(struct domain *d)
> > +{
> > +    if ( unlikely(!cur_mediator) )
> > +        return;
> > +
> > +    cur_mediator->ops->domain_destroy(d);
> > +}
> > +
> > +int sci_relinquish_resources(struct domain *d)
> > +{
> > +    if ( unlikely(!cur_mediator) )
> > +        return 0;
> > +
> > +    return cur_mediator->ops->relinquish_resources(d);
> > +}
> > +
> > +
> > +int sci_add_dt_device(struct domain *d, struct dt_device_node *dev)
> > +{
> > +    if ( unlikely(!cur_mediator) )
> > +        return 0;
> > +
> > +    return cur_mediator->ops->add_dt_device(d, dev);
> > +}
> > +
> > +int sci_get_channel_info(struct domain *d,
> > +                         struct xen_arch_domainconfig *config)
> > +{
> > +    if ( unlikely(!cur_mediator) )
> > +        return 0;
> > +
> > +    return cur_mediator->ops->get_channel_info(d->arch.sci, config);
> > +}
> > +
> > +uint16_t sci_get_type(void)
> > +{
> > +    if ( unlikely(!cur_mediator) )
> > +        return XEN_DOMCTL_CONFIG_SCI_NONE;
> > +
> > +    return cur_mediator->sci_type;
> > +}
> > +
> > +static int __init sci_init(void)
> > +{
> > +    const struct sci_mediator_desc *desc;
> > +    struct dt_device_node *dt =3D NULL;
> > +
> > +    for ( desc =3D _sscimediator; desc !=3D _escimediator; desc++ )
> > +    {
> > +        if ( likely(dt_host) )
>=20
> I think you can assume that dt_host is correctly set, right?
> Instead of this check, I would just add:
>=20
>     if ( !acpi_disabled )
>         return -ENODEV;
>=20
> at the beginning of sci_init
>=20

Good point! I will it in v2. Thanks.

>=20
> > +        {
> > +            dt =3D dt_find_matching_node(dt_host, desc->dt_match);
> > +            if ( !dt )
> > +                continue;
> > +        }
> > +
> > +        if ( desc->ops->probe(dt) )
> > +        {
> > +            printk(XENLOG_INFO "Using SCI mediator for %s\n", desc->na=
me);
> > +            cur_mediator =3D desc;
> > +            return 0;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +__initcall(sci_init);
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index d5d0792ed4..201de01411 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -50,6 +50,7 @@
> >  #include <asm/cpufeature.h>
> >  #include <asm/platform.h>
> >  #include <asm/procinfo.h>
> > +#include <asm/sci/sci.h>
> >  #include <asm/setup.h>
> >  #include <xsm/xsm.h>
> >  #include <asm/acpi.h>
> > diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> > index 08016948ab..3683f4821f 100644
> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -142,6 +142,13 @@ SECTIONS
> >        _eteemediator =3D .;
> >    } :text
> > =20
> > +  . =3D ALIGN(8);
> > +  .scimediator.info : {
> > +      _sscimediator =3D .;
> > +      *(.scimediator.info)
> > +      _escimediator =3D .;
> > +  } :text
> > +
> >    . =3D ALIGN(PAGE_SIZE);             /* Init code and data */
> >    __init_begin =3D .;
> >    .init.text : {
> > diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.=
h
> > index 9b3647587a..d9b164017f 100644
> > --- a/xen/include/asm-arm/domain.h
> > +++ b/xen/include/asm-arm/domain.h
> > @@ -89,6 +89,10 @@ struct arch_domain
> >  #ifdef CONFIG_TEE
> >      void *tee;
> >  #endif
> > +
> > +#ifdef CONFIG_SCI
> > +    void *sci;
> > +#endif
> >  }  __cacheline_aligned;
> > =20
> >  struct arch_vcpu
> > diff --git a/xen/include/asm-arm/sci/sci.h b/xen/include/asm-arm/sci/sc=
i.h
> > new file mode 100644
> > index 0000000000..aeff689c72
> > --- /dev/null
> > +++ b/xen/include/asm-arm/sci/sci.h
> > @@ -0,0 +1,162 @@
> > +/*
> > + * xen/include/asm-arm/sci/sci.h
> > + *
> > + * Generic part of the SCI (System Control Interface) subsystem.
> > + *
> > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > + * Copyright (C) 2021, EPAM Systems.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef __ASM_ARM_SCI_H
> > +#define __ASM_ARM_SCI_H
> > +
> > +#include <xen/lib.h>
> > +#include <xen/types.h>
> > +#include <xen/device_tree.h>
> > +
> > +#ifdef CONFIG_SCI
> > +
> > +struct sci_mediator_ops {
> > +
> > +    /*
> > +     * Probe for SCI. Should return true if SCI found and
> > +     * mediator is initialized.
> > +     */
> > +    bool (*probe)(struct dt_device_node *scmi_node);
> > +
> > +    /*
> > +     * Called during domain construction if toolstack requests to enab=
le
> > +     * SCI support so mediator can inform SCP-firmware about new
> > +     * guest and create own structures for the new domain.
> > +     */
> > +    int (*domain_init)(struct domain *d);
> > +
> > +    /*
> > +     * Called during domain destruction, releases all resources, that
> > +     * were allocated by the mediator.
> > +     */
> > +    void (*domain_destroy)(struct domain *d);
> > +
> > +    /*
> > +     * Called during parsing partial device-sci for the domain.
> > +     * Passing device_node so mediator could process the device and
> > +     * mark the device as related to the domain if needed.
> > +     */
> > +    int (*add_dt_device)(struct domain *d, struct dt_device_node *dev)=
;
> > +
> > +    /*
> > +     * Called during domain destruction to relinquish resources used
> > +     * by mediator itself. This function can return -ERESTART to indic=
ate
> > +     * that it does not finished work and should be called again.
> > +     */
> > +    int (*relinquish_resources)(struct domain *d);
> > +
> > +    /* Handle call for current domain */
> > +    bool (*handle_call)(struct domain *d, void *regs);
> > +
> > +    /* Gets channel configuration and store it in domainconfig */
> > +    int (*get_channel_info)(void *sci_ops,
> > +                            struct xen_arch_domainconfig *config);
>=20
> get_channel_info is the only function I don't understand among these...
> what is supposed to be stored in struct xen_arch_domainconfig, just
> sci_agent_paddr?
>=20
> Also, it seems to be only called right after sci_domain_init, so can't
> the "get_channel_info" operation just be done as part of domain_init?
>=20

We need sci_agent_paddr for Domains. It represents shmem address which
should be mapped to guest Domain. We also don't need paddr when we do
sci_domain_init for dom0. That's why I've made it as separate call.

Also I named it get_channel_info, not get_channel_paddr, because
potentially, the different information can be needed from different SCI
implementation, which doesn't need shared memory to pass data for
exapmle.

>=20
>=20
> > +};
> > +
> > +struct sci_mediator_desc {
> > +    /* Printable name of the SCI. */
> > +    const char *name;
> > +
> > +    /* Mediator callbacks as described above. */
> > +    const struct sci_mediator_ops *ops;
> > +
> > +    /*
> > +     * ID of SCI. Corresponds to xen_arch_domainconfig.sci_type.
> > +     * Should be one of XEN_DOMCTL_CONFIG_SCI_xxx
> > +     */
> > +    uint16_t sci_type;
> > +
> > +    /* Match structure to init mediator */
> > +    const struct dt_device_match *dt_match;
> > +
> > +};
> > +
> > +int sci_domain_init(struct domain *d, uint16_t sci_type);
> > +void sci_domain_destroy(struct domain *d);
> > +int sci_add_dt_device(struct domain *d, struct dt_device_node *dev);
> > +int sci_relinquish_resources(struct domain *d);
> > +bool sci_handle_call(struct domain *d, void *args);
> > +int sci_get_channel_info(struct domain *d,
> > +                         struct xen_arch_domainconfig *config);
> > +uint16_t sci_get_type(void);
> > +
> > +#define REGISTER_SCI_MEDIATOR(_name, _namestr, _type, _match, _ops) \
> > +static const struct sci_mediator_desc __sci_desc_##_name __used     \
> > +__section(".scimediator.info") =3D {                                  =
\
> > +    .name =3D _namestr,                                               =
\
> > +    .ops =3D _ops,                                                    =
\
> > +    .sci_type =3D _type,                                              =
\
> > +    .dt_match =3D _match                                              =
\
> > +}
> > +
> > +#else
> > +#include <public/errno.h>
> > +
> > +static inline int sci_domain_init(struct domain *d, uint16_t sci_type)
> > +{
> > +    if ( likely(sci_type =3D=3D XEN_DOMCTL_CONFIG_SCI_NONE) )
> > +        return 0;
> > +
> > +    return -XEN_ENODEV;
> > +}
> > +
> > +static inline void sci_domain_destroy(struct domain *d)
> > +{
> > +}
> > +
> > +static inline int sci_add_dt_device(struct domain *d,
> > +                                    struct dt_device_node *dev)
> > +{
> > +    return 0;
> > +}
> > +
> > +static inline int sci_relinquish_resources(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +
> > +static inline bool sci_handle_call(struct domain *d, void *args)
> > +{
> > +    return false;
> > +}
> > +
> > +static inline int sci_get_channel_info(struct domain *d,
> > +                                       struct xen_arch_domainconfig *c=
onfig)
> > +{
> > +    return 0;
> > +}
> > +
> > +static inline uint16_t sci_get_type(void)
> > +{
> > +    return XEN_DOMCTL_CONFIG_SCI_NONE;
> > +}
> > +
> > +#endif  /* CONFIG_SCI */
> > +
> > +#endif /* __ASM_ARM_SCI_H */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-ar=
m.h
> > index 94b31511dd..9180be5e86 100644
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -314,12 +314,16 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> >  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
> >  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> > =20
> > +#define XEN_DOMCTL_CONFIG_SCI_NONE      0
> > +
> >  struct xen_arch_domainconfig {
> >      /* IN/OUT */
> >      uint8_t gic_version;
> >      /* IN */
> >      uint16_t tee_type;
> >      /* IN */
> > +    uint8_t sci_type;
>=20
> sci_type is uint16_t everywhere else
>=20
>=20
> > +    /* IN */
> >      uint32_t nr_spis;
> >      /*
> >       * OUT
> > @@ -335,6 +339,12 @@ struct xen_arch_domainconfig {
> >       *
> >       */
> >      uint32_t clock_frequency;
> > +
> > +    /* Sets shared address to sw domains.
> > +     * This information is needed to set correct channel in Domain par=
tial
> > +     * device-tree
> > +     */
> > +    uint64_t sci_agent_paddr;
> >  };
> >  #endif /* __XEN__ || __XEN_TOOLS__ */
> =

