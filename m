Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD78F494B8D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 11:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259014.446654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUa1-0003T5-Oy; Thu, 20 Jan 2022 10:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259014.446654; Thu, 20 Jan 2022 10:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUa1-0003RC-Kb; Thu, 20 Jan 2022 10:22:09 +0000
Received: by outflank-mailman (input) for mailman id 259014;
 Thu, 20 Jan 2022 10:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqpm=SE=epam.com=prvs=3019806f6f=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nAUZz-0003R6-Pr
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 10:22:08 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc36db1-79da-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 11:22:04 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20K9xnSB003574;
 Thu, 20 Jan 2022 10:21:54 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dprt69saq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 10:21:54 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by HE1PR0302MB2763.eurprd03.prod.outlook.com (2603:10a6:3:f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 10:21:49 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 10:21:49 +0000
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
X-Inumbo-ID: cfc36db1-79da-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuQu6P4yUnU4PeEzvhGov7N2acl9mkBVGztVsNtGkqZo3VdAQq1StIGYTQ6LcD1s+ji0ZEfPn6utD5YwjPv3Q8RPgjXFxbkN/Heoff9DOEziL4FZSeSXWz0piNabfANxmtrzvkgntwNmihhdkKnnUqJ5qQOl2aj72TNAzlETrNvPqTna/s+dVXGdZmdMfXM4UKaIqv88Hj86mPmqTCs5TiY/MrropTxBlhF+t7rUlSph/IhPlYw4JomQiB8CDQCy/XTIfi0MMlkYCtrUnVv4o34ZOuYtFNMGru2iV51D/B4hC0tj2g2fu8kvJ3OKQgRSS2LfLV9QVAY3zjQllHDhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qrIWTBxqkIMgjqrCeqrgMpf7m7XRUfQShLc/W6s+ls=;
 b=a068S5JNoGbxObTmb2S+eyN1EkVq/MYtrLTeAKeh6jKZdhUw7UQiZzQkSh/Gfp5hi6uvL3pELSdDx4Oj1UYYdFKdQCprP+wwEeYj9/zvMA2B4nymG3wpRs/dvdrNWpxtQppCKwJsXR8VMPT6wEDqtLi7W3HjmrOoLuTtbRIIsACtxf3WFt+txtf10bEtRG6FX75YUyGoN0Qvovt5HWxaE8x2M/5og77dIzkT7DDibfFYu+RqLvGAxghRQdFm7/iFCK4PsBPHqIqRzep+5VBT1eYii9nZ+KtuuXjLseeGZsanfStWQpeFasTQntQPLi4acc8G7J/WZE2DloHiwsT8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qrIWTBxqkIMgjqrCeqrgMpf7m7XRUfQShLc/W6s+ls=;
 b=Dm/NzJxL5faLDWQhAqW+x84JFhGTGAnrRSuMr7SJkCL6l3NrO8TqTCwHCJ3I1YHIgypS5LmuX0ERGPniuBSZkcYcjKucNx3RxWM5A9gbRkP3+4N6vzMZdjMqf7KAgXrqdgiVcimhRpF7ExSyYUWaTY/UfvoJ0XHjqvvVcVnqiYK8anLUJjS0XxpoLcd0EYWsUqawp0Vp1nRYtzqxazt0L2y+Si/MmaYLwMJUC5DQL1V84+DyVw5t6de5LBVJgePvomsxcv3pAAGjletgCwQqU6Kt0Ur4sqS+Ttce4iacrfZxIE6hj2dcX7UNEOdyStEHCqNGCYC006gdh5W+A+33Mw==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgCsRKgCAAOC8gIAAlQqA
Date: Thu, 20 Jan 2022 10:21:49 +0000
Message-ID: <20220120102147.GA4153317@EPUAKYIW015D>
References: 
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20220119120400.GA3779126@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45fcb455-7537-409a-da2a-08d9dbfeab43
x-ms-traffictypediagnostic: HE1PR0302MB2763:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <HE1PR0302MB276377087DFD2E0177629C5AE35A9@HE1PR0302MB2763.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dT+vltFizz1EyrtjXagI5h1y2BkIb/CaxwaU2Q0KXX/no1nsl9QxFQS13vbnRXgVZQZUD001bBI7gRofnP5vKfY4QwQeomeh8rptyu3hmiGwRS5ZmBhkddVIBPBBR3Wc3ZJyUU0lD0vPaPdU1JDxRneHWKZ2gMj1wTh612NOANO6/sfC7GszzSLcRsgM9zYczfxvV4OThIH3VTrfyTjp7fpHCci43FcHi/eXIU0OZhckEi2qb2RE3r8Tua+pb4WRXnduG5u/G11+kP2YEbY2JxaCE6fGaVQ/3t4ApPLSLbvKqrDschgcYv8nCciUTCYbCPx+dK65wHO7lORN7wnOJPIB6SEDU+A49pm/mnt6XakwcwYgxa09PBpuOIKbR6k+q2b4Vw+plcDEsFrN0PL/sQahplyoBXe8xp59WqNHb40ZxNw85GIZ5RizNZrTeGKMiNvvTwqEBKkMbQLRvsISdqBNQ/gKl7rA45emqmwt08ybn5e3WcdJdC+Uey7DjtTaPvEZesSvnQIqEX4oiXV+B3rPQvyAl/ltZMVHMbITtFQwP5JoazlKXGoUNUsQCIpSXAHMZ2D9VP65kKjmFoLrqhUMaXbQMJuvHfLBM6U/sKB9s8lKR6wkM9/3ax2LsILK7ztRkKchmRaM6oSMno75ps+a/ahkLw4av5ieb10ub42DyxOvIXTgIruLlGuCJEofPGfxHZDxukISSYobWrjbPbyASMSa0ZBOPMdDiERo56pwpohDahcuwDulBnO+HYkhDmOsrukw1KN2b26X5f6tmTlf2GcmdxeSUJS88pxB11HIgQtuq6wijyeujYAmekJuZNChNRtxQakInKrg898NJ9V35Jk4PWOkVbHDAhy5cbc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(84040400005)(66946007)(33656002)(30864003)(86362001)(38070700005)(6486002)(9686003)(8936002)(66446008)(66476007)(966005)(38100700002)(2906002)(122000001)(1076003)(66556008)(64756008)(186003)(8676002)(6512007)(26005)(508600001)(76116006)(91956017)(71200400001)(54906003)(6506007)(6916009)(4326008)(33716001)(316002)(83380400001)(5660300002)(2004002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yE2y9Y7vxrox0NayFtDXyFSTGGzfmXIOo358IDjJ5dXCEWp5jq2bPD3f7WQg?=
 =?us-ascii?Q?bVCK1euPW4IA/9+JgyGRYMZf/CX+oUeappPGHhsAp65sXUl56LB0a79a8pl/?=
 =?us-ascii?Q?am36EYbEhr4xtw5vnGhZ53/B0f1A10Zmc5iPvQFJgOALq2E2v8RZeiI9JXV9?=
 =?us-ascii?Q?c14ybAcaqQj+BR/JCWrxgR1nXKIY13G7bBUEg80oF1Uz2365ZSQZw/7LhWjJ?=
 =?us-ascii?Q?x7+KQ4WnAxREfIMg24neRZf051wK02mq5QM8TGcJhnxMC/2YfYjxNwwAr3LR?=
 =?us-ascii?Q?7aVZdseGeZug1XpeLRW17v0Ilxyz+lAgfVJDho/wWNCgCLiWlX82AiSPcdDF?=
 =?us-ascii?Q?5tb37U6kEKpuTpQ07BnXojdr62Qm4i0wV8sMHY62ssYjrS+Cj8mjaeuHz1Gr?=
 =?us-ascii?Q?G8x6A1D6q4Ux+7xpxXspzKLVauZ8FXAsBjBkZ+fWjtwD+u5h+MiOjXaVw8Db?=
 =?us-ascii?Q?h7/HJWebgZdBKU5KJxnzS8mqQfgTd5gUZhrYnDJG1muBuqrT2m/KSSoQjpOU?=
 =?us-ascii?Q?0YLbNZv80SeFRCCPwF5cBkzIlZii7kark+grYh8OJ9eEi8EXsN3/zjLAJOvE?=
 =?us-ascii?Q?/N2SMODBiQeKd26WqsHMqf5XaGnC0QJht+JcatXOJdOysby7ZcD2U35Atptj?=
 =?us-ascii?Q?akXNrCuhGTDq6DBFwXFZU/3o9TphebGxIrbaDEtydIlpPvV5Px1Ei+y4VZ1C?=
 =?us-ascii?Q?YyZUchvFU8wbVIViczrCBidC0x3YT223+fOotcaoA1FVJlamU+sdTUT9DTzO?=
 =?us-ascii?Q?2p04Cz704atp4U8DGXKngj2ZHwty2KGMycclz5g/DKYHI/ysJqW2sviHaKu/?=
 =?us-ascii?Q?ANRNYDgyzpIvG0/0qpoJHk4Kn7EGP5uBlAbf41NreaKVKJa1F0AeY5uncFAP?=
 =?us-ascii?Q?EBPvA/Vwldh6Y6lWL8zbMVyaC1MptGQHSZNYX5xNoL3CJivfcUUuIpONPxL2?=
 =?us-ascii?Q?ruG7QR82VVpBteZcA5Q+I8OWtxOsuIF27GMoaLv444F69v19NXKOOaCKG/Td?=
 =?us-ascii?Q?iwxRC2bBbzmtlIuAYzv+75JSR6EzqOKGWU+ZPcs+xIUlwJuUWtyF6I1ymXaM?=
 =?us-ascii?Q?r8R2sdinM6MfEsVO+nx73vg1k+9VE4dtrV8+yvTRHDGRx6tNlmtlQEnaGUAR?=
 =?us-ascii?Q?kLoVSciPJLcxJPdB4sQHeKASoxY/viyltCi0dXxyXqxmQi/hNZNw8B+SQyAj?=
 =?us-ascii?Q?fOQLEv2TIkocvHPOecFaWODrVypd/MsSajTaY++EHwQK1kuZsJiVhycRbkPS?=
 =?us-ascii?Q?NMULQ/hfOmOtOL3AQ89xd8cLSxyhvYpNGdHVkhQLuoS99Ll2s1ESLPZkIImX?=
 =?us-ascii?Q?jxnjXwqjeThqqI2h0Ogjv5PpHr2iaPVy9ytFJhTmWZ0vosQmke3VtYvNM0ik?=
 =?us-ascii?Q?emAbioBgvxjouZ1TWLgeHIKV2qGgKYh4FeiV0zl347Md+8S8QCyVEbhlYQy+?=
 =?us-ascii?Q?XTARBXuEJfyKICg5Gh1djbL4jIPVU1X3Ocq+j9tyu10g+MRbBo1YjiBVhFMz?=
 =?us-ascii?Q?esQ1okMEa9D+9q94qseU7wSt/orcqmzgduJJfocB12FOwsfvXIJF478ECJHu?=
 =?us-ascii?Q?0R6yk/T901CNDDTt/U98vdSdTwJrdh6slwmhtMTD5W1kevCmvrdo6dBzGpUi?=
 =?us-ascii?Q?tWHsy3jca9OSbwj60h0XkSNRV12xq8dvaa5ECEcmhwNaPXsWesnRUcN5q/IB?=
 =?us-ascii?Q?Qp49gzZrM3wZq2OtY4mlKbjfx78=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA8ECBE9683CDE45941C7823CDFB3125@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fcb455-7537-409a-da2a-08d9dbfeab43
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 10:21:49.0537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71dWUFzaSgEj0rWIfdQ24HAZCXc1DT5QlaTxOu34glPh6+EF9mP+rIEl+fBPMfY6hkbQYouptIGMTraYZAlBxoNaoR0vCrgfsOwiJtn4/GY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2763
X-Proofpoint-ORIG-GUID: FAdMEtLvd5L3PbF00aziilh6Pdcv4MaI
X-Proofpoint-GUID: FAdMEtLvd5L3PbF00aziilh6Pdcv4MaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_03,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200051

Hi Stefano,

On Wed, Jan 19, 2022 at 05:28:21PM -0800, Stefano Stabellini wrote:
> On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> > On Wed, Dec 22, 2021 at 06:23:24PM -0800, Stefano Stabellini wrote:
> > > On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> > > > On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wrote:
> > > > > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > Hi Stefano,
> > > > > >
> > > > > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wr=
ote:
> > > > > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > Hi Stefano,
> > > > > > > >
> > > > > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellin=
i wrote:
> > > > > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > This is the implementation of SCI interface, called SCM=
I-SMC driver,
> > > > > > > > > > which works as the mediator between XEN Domains and Fir=
mware (SCP, ATF etc).
> > > > > > > > > > This allows devices from the Domains to work with clock=
s, resets and
> > > > > > > > > > power-domains without access to CPG.
> > > > > > > > > >
> > > > > > > > > > The following features are implemented:
> > > > > > > > > > - request SCMI channels from ATF and pass channels to D=
omains;
> > > > > > > > > > - set device permissions for Domains based on the Domai=
n partial
> > > > > > > > > > device-tree. Devices with permissions are able to work =
with clocks,
> > > > > > > > > > resets and power-domains via SCMI;
> > > > > > > > > > - redirect scmi messages from Domains to ATF.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epa=
m.com>
> > > > > > > > > > ---
> > > > > > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++=
++++++++++++++++
> > > > > > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > > > > > >  5 files changed, 809 insertions(+)
> > > > > > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > >
> > > > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfi=
g
> > > > > > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > > > > > >  	  support. It allows guests to control system resourc=
ess via one of
> > > > > > > > > >  	  SCI mediators implemented in XEN.
> > > > > > > > > >
> > > > > > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > > > > > +
> > > > > > > > > >  endmenu
> > > > > > > > > >
> > > > > > > > > >  menu "ARM errata workaround via the alternative framew=
ork"
> > > > > > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sc=
i/Kconfig
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 0000000000..9563067ddc
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > > > > > @@ -0,0 +1,10 @@
> > > > > > > > > > +config SCMI_SMC
> > > > > > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > > > > > +	default n
> > > > > > > > > > +	depends on SCI
> > > > > > > > > > +	---help---
> > > > > > > > > > +
> > > > > > > > > > +	Enables mediator in XEN to pass SCMI requests from Do=
mains to ATF.
> > > > > > > > > > +	This feature allows drivers from Domains to work with=
 System
> > > > > > > > > > +	Controllers (such as power,resets,clock etc.). SCP is=
 used as transport
> > > > > > > > > > +	for communication.
> > > > > > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/s=
ci/Makefile
> > > > > > > > > > index 837dc7492b..67f2611872 100644
> > > > > > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > > > > > @@ -1 +1,2 @@
> > > > > > > > > >  obj-y +=3D sci.o
> > > > > > > > > > +obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
> > > > > > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm=
/sci/scmi_smc.c
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 0000000000..2eb01ea82d
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > @@ -0,0 +1,795 @@
> > > > > > > > > > +/*
> > > > > > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > + *
> > > > > > > > > > + * SCMI mediator driver, using SCP as transport.
> > > > > > > > > > + *
> > > > > > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > > > > > + *
> > > > > > > > > > + * This program is free software; you can redistribute=
 it and/or modify
> > > > > > > > > > + * it under the terms of the GNU General Public Licens=
e as published by
> > > > > > > > > > + * the Free Software Foundation; either version 2 of t=
he License, or
> > > > > > > > > > + * (at your option) any later version.
> > > > > > > > > > + *
> > > > > > > > > > + * This program is distributed in the hope that it wil=
l be useful,
> > > > > > > > > > + * but WITHOUT ANY WARRANTY; without even the implied =
warranty of
> > > > > > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.  See the
> > > > > > > > > > + * GNU General Public License for more details.
> > > > > > > > > > + */
> > > > > > > > > > +
> > > > > > > > > > +#include <asm/sci/sci.h>
> > > > > > > > > > +#include <asm/smccc.h>
> > > > > > > > > > +#include <asm/io.h>
> > > > > > > > > > +#include <xen/bitops.h>
> > > > > > > > > > +#include <xen/config.h>
> > > > > > > > > > +#include <xen/sched.h>
> > > > > > > > > > +#include <xen/device_tree.h>
> > > > > > > > > > +#include <xen/iocap.h>
> > > > > > > > > > +#include <xen/init.h>
> > > > > > > > > > +#include <xen/err.h>
> > > > > > > > > > +#include <xen/lib.h>
> > > > > > > > > > +#include <xen/list.h>
> > > > > > > > > > +#include <xen/mm.h>
> > > > > > > > > > +#include <xen/string.h>
> > > > > > > > > > +#include <xen/time.h>
> > > > > > > > > > +#include <xen/vmap.h>
> > > > > > > > > > +
> > > > > > > > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > > > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > > > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > > > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > > > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > > > > > > > +
> > > > > > > > > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (=
DEN0056C) */
> > > > > > > > > > +#define SCMI_SUCCESS              0
> > > > > > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > > > > > +#define SCMI_DENIED             (-3)
> > > > > > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > > > > > +#define SCMI_BUSY               (-6)
> > > > > > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > > > > > +
> > > > > > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scm=
i-smc")
> > > > > > > > > > +
> > > > > > > > > > +#define SCMI_SMC_ID                        "arm,smc-id=
"
> > > > > > > > > > +#define SCMI_SHARED_MEMORY                 "linux,scmi=
_mem"
> > > > > > > > >
> > > > > > > > > I could find the following SCMI binding in Linux, which d=
escribes
> > > > > > > > > the arm,scmi-smc compatible and the arm,smc-id property:
> > > > > > > > >
> > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > > > > > > >
> > > > > > > > > However, linux,scmi_mem is not described. Aren't you supp=
osed to read
> > > > > > > > > the "shmem" property instead? And the compatible string u=
sed for this
> > > > > > > > > seems to be "arm,scmi-shmem".
> > > > > > > > >
> > > > > > > >
> > > > > > > > We use linux,scmi_mem node to reserve memory, needed for al=
l
> > > > > > > > channels:
> > > > > > > >
> > > > > > > > reserved-memory {
> > > > > > > >     /* reserved region for scmi channels*/
> > > > > > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > > > > > >         no-map;
> > > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > > > > > > >     };
> > > > > > > > };
> > > > > > > >
> > > > > > > > arm,scmi-shmem node used in shmem property defines only 1 p=
age needed to
> > > > > > > > the current scmi channel:
> > > > > > > >
> > > > > > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > > > >     compatible =3D "arm,scmi-shmem";
> > > > > > > >     reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > };
> > > > > > > >
> > > > > > > > For each Domain reg points to unigue page from linux,scmi_m=
em region,
> > > > > > > > assigned to this agent.
> > > > > > >
> > > > > > > If we were to use "linux,scmi_mem" we would have to introduce=
 it as a
> > > > > > > compatible string, not as a node name, and it would need to b=
e described
> > > > > > > in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
> > > > > > >
> > > > > > > But from your description I don't think it is necessary. We c=
an just use
> > > > > > > "arm,scmi-shmem" to describe all the required regions:
> > > > > > >
> > > > > > > reserved-memory {
> > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     ...
> > > > > > >
> > > > > > > In other words, if all the individual channel pages are descr=
ibed as
> > > > > > > "arm,scmi-shmem", why do we also need a single larger region =
as
> > > > > > > "linux,scmi_mem"?
> > > > > > >
> > > > > >
> > > > > > That was my first implementation. But I've met a problem with
> > > > > > scmi driver in kernel. I don't remember the exact place, but I =
remember
> > > > > > there were some if, checking if memory weren't reserved.
> > > > > > That's why I ended up splitting nodes reserved memory region an=
d actual
> > > > > > shmem page.
> > > > > > For linux,scmi_mem node I took format from /reserved-memory/lin=
ux,lossy_decompress@54000000,
> > > > > > which has no compatible string and provides no-map property.
> > > > > > linux,scmi_shmem node is needed to prevent xen from allocating =
this
> > > > > > space for the domain.
> > > > > >
> > > > > > Very interesting question about should I introduce linux,scmi_m=
em node
> > > > > > and scmi_devid property to the
> > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
> > > > > > Those node and property are needed only for Xen and useless for
> > > > > > non-virtualized systems. I can add this node and property descr=
iption to
> > > > > > arm,scmi.yaml, but leave a note that this is Xen specific param=
s.
> > > > > > What do you think about it?
> > > > >
> > > > > Reply below
> > > > >
> > > > > [...]
> > > > >
> > > > >
> > > > > > > In general we can't use properties that are not part of the d=
evice tree
> > > > > > > spec, either https://urldefense.com/v3/__https://www.devicetr=
ee.org/specifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_Ch=
owYQiQYC595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > > > > > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/li=
nux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings__;=
!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7=
BnhXloYUaj$ [git[.]kernel[.]org]
> > > > > > >
> > > > > > > "linux,scmi_mem" is currently absent. Are you aware of any up=
streaming
> > > > > > > activities to get "linux,scmi_mem" upstream under
> > > > > > > Documentation/devicetree/bindings in Linux?
> > > > > > >
> > > > > > > If "linux,scmi_mem" is going upstream in Linux, then we could=
 use it.
> > > > > > > Otherwise, first "linux,scmi_mem" needs to be added somewhere=
 under
> > > > > > > Documentation/devicetree/bindings (probably
> > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml), th=
en we can
> > > > > > > work on the Xen code that makes use of it.
> > > > > > >
> > > > > > > Does it make sense?
> > > > > > >
> > > > > >
> > > > > > Yes I agree. I think linux,scmi_mem and scmi_devid should be up=
streamed.
> > > > > > I will add those properties to arm,scmi.yaml, mark them as rela=
ted to XEN and send patch.
> > > > >
> > > > > I didn't realize that linux,scmi_mem and scmi_devid are supposed =
to be
> > > > > Xen specific. In general, it would be best not to introduce Xen s=
pecific
> > > > > properties into generic bindings. It is a problem both from a
> > > > > specification perspective (because it has hard to handle Xen spec=
ific
> > > > > cases in fully generic bindings, especially as those bindings are
> > > > > maintained as part of the Linux kernel) and from a user perspecti=
ve
> > > > > (because now the user has to deal with a Xen-specific dtb, or has=
 to
> > > > > modify the host dtb to add Xen-specific information by hand.)
> > > > >
> > > > >
> > > > > Let me start from scmi_devid.  Why would scmi_devid be Xen-specif=
ic? It
> > > > > looks like a generic property that should be needed for the Linux=
 SCMI
> > > > > driver too. Why the Linux driver doesn't need it?
> > > > >
> > > >
> > > > scmi_devid used during domain build. It passed as input parameter f=
or SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> > > > On non-virtualized systems - there is no need of this call, because=
 OS
> > > > is the only one entity, running on the system.
> > >
> > > OK. Even if it is only required for virtualized systems, I think that
> > > scmi_devid is important enough that should be part of the upstream
> > > binding. I think it is worth starting an email thread on the LKML wit=
h
> > > Rob Herring and the SCMI maintainers to discuss the addition of
> > > scmi_devid to the binding.
> > >
> > >
> > > > I've chatted with Volodymyr_Babchuk and he gave a great idea to add=
 a
> > > > list of device_ids to dom.cfg, such as:
> > > > sci_devs =3D [ 0, 1, 15, 35 ];
> > > >
> > > > Using this approach, we can remove scmi_devid from the device tree =
and
> > > > just pass a list of scmi_devids to XEN using additional hypercall.
> > > > We can probably make hypercall taking devid list as input parameter=
.
> > > > This will take only 1 hypercall to setup sci permissions.
> > >
> > > But how would a user know which are the right SCMI IDs to add to the
> > > sci_devs list? Would the user have to go and read the reference manua=
l
> > > of the platform to find the SCMI IDs and then write sci_devs by hand?
> > > If that is the case, then I think that it would be better to add
> > > scmi_devid to device tree.
> > >
> > > In general, I think this configuration should happen automatically
> > > without user intervention. The user should just specify "enable SCMI"
> > > and it should work.
> > >
> > >
> > > > > In regards to linux,scmi_mem, I think it would be best to do with=
out it
> > > > > and fix the Linux SCMI driver if we need to do so. Xen should be =
able to
> > > > > parse the native "arm,scmi-shmem" nodes and Linux (dom0 or domU) =
should
> > > > > be able to parse the "arm,scmi-shmem" nodes generated by Xen. Eit=
her
> > > > > way, I don't think we should need linux,scmi_mem.
> > > >
> > > > This requires further investigation. I will try to make implementat=
ion
> > > > without linux,scmi_mem, using only arm,scmi-shmem nodes and share
> > > > reuslts with you.
> > >
> > > OK, thanks.
> >
> > Hi Stefano,
> >
> > As I did some investigation about using reserved-memory area
> > linux,scmi_mem and now I need your advice.
> >
> > I see 2 possible implementations for now:
> > 1) Add memory-region parameter to cpu_scp_shm node which points to the
> > reserved memory region.
> > So device-tree will look like this:
> >
> > 	reserved-memory {
> > 		/* reserved region for scmi channels*/
> > 		scmi_memory: region@53FF0000{
> > 			no-map;
> > 			reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > 		};
> > 	};
> > 	cpu_scp_shm: scp-shmem@0x53FF0000 {
> > 		compatible =3D "arm,scmi-shmem";
> > 		reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > 		memory-region =3D <&scmi_memory>;
> > 	};
> >
> > So cpu_scp_shm node has a reference to scmi_memory region. This mean
> > that xen can find reserved memory region without adding additional name=
s
> > to the device-tree bindings.
> > memory-region parameter as a reference to reserved memory and region
> > creation described in:
> > https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/v5.1=
5/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt__;!=
!GF_29dbcQIUBPA!k6x19x1gYF1CPlgAZj7std3ifqhq-9DXvuF0nwonNPUwMzZpYHYbrRJziJr=
gdFIOjyan$ [github[.]com]
> >
> > This approach I've implemented already and it works.
>
> This approach would require a discussion with the upstream device tree
> maintainers. Likely, we would need to add a note about the usage of the
> "memory-region" property to arm,scmi.yaml.
>
> Also, I have the feeling that they would ask to add the "memory-region"
> property directly to the "arm,scmi-smc" node, as an alternative (or
> in addition) to the existing "shmem" property.
>
> That said, from my point of view this approach is also a viable option.
> I don't see any major problems.
>
> The main question (after reading everything else that you wrote below)
> is whether the "arm,scmi-smc" node in this case could be automatically
> generated.
>

arm,scmi-smc node can be generated in both cases. I think I'd leave it
as backup in case if the second approach will not work.

>
> > 2) The second approach is the format you suggested:
> > > > > > > reserved-memory {
> > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     ...
> >
> > This approach has an advantage that xen ARM_SCI driver do not know abou=
t
> > how channels are placed in the reserved memory, but introduces some
> > disadvantages:
> > a) We provide extra 14 (in our case) arm,scmi-shmem nodes which are not=
 used
> > in the device-tree. In current implementation I have separate scmi.dtsi
> > file which introduces scmi support for both XEN-based and
> > non-virtualized systems. Having 14 extra channels in the device-tree ma=
y
> > be confusing.
>
> I can see that while it would be ideal for Xen to see all 14+1 channels
> in device tree (on the host device tree), we wouldn't want to expose all
> of them to the domains, not even to dom0.
>
> How many channels do we want dom0 to see by the way? For this
> discussion, I'll just assume for now that dom0 only sees 1 channel like
> the domUs.

For dom0 we need only one channel.

>
> Now we have a problem: how do we go about "filtering" the
> "arm,scmi-shmem" device tree nodes? Which is also what you are asking
> below in point b).
>

Xen will not need to filter "arm,scmi-shmem" node. It will just
create shmem node in Domain device-tree. I don't see any problem for xen
configuration here.
What bothers me here is that I set scmi configuration for platform dts,
not for xen or domu dts files.
So for example I have the following structure of the dts files for my
platform (r8a77961-salvator-xs):
 * r8a77961-scmi.dtsi - this file includes all scmi related nodes and set
scmi_devid for the devices, that should use scmi.
 * r8a77961-salvator-xs.dts - dts file which generates dtb for the platform=
.
It includes r8a77961-scmi.dtsi so I populate scmi to platform dtb, which
is used for system with no hypervisor.
 * r8a77961-salvator-xs-xen.dts - dts file for xen which includes
r8a77961-salvator-xs.dts and inherits scmi configuration from it.
 * r8a77961-salvator-xs-domu.dts - dts file for DomU which includes
r8a77961-salvator-xs.dts and inherits scmi configuration from it.

In this case r8a77961-salvator-xs.dtb r8a77961-salvator-xs-xen.dtb
r8a77961-salvator-xs-domu.dtb files will inherit 14+1 channel.

I can give you a link to Merge request with this changes if you need it.

For xen and domu dtb it is not a problem because all "arm,scmi-shmem"
nodes will be omitted and new will be generated for the domains.

What bothers me is that r8a77961-salvator-xs.dtb will have 14 unused channe=
ls.

Just got an idea while writing this: I can create only one
"arm,scmi-shmem" node in r8a77961-scmi.dtsi and add 14 more nodes,
needed for xen explicitly in r8a77961-salvator-xs-xen.dts.

Then we will have valid configurations for all cases.
This can be a solution. What do you think?

>
> > b) In case if we have all 15 channels, described in partial device-tree=
,
>
> I think you meant "described in the host device tree", right?
>
Yeah that's what I've meant.
>
> > we should not copy any node to the domain device-tree. I think it will
> > be better to generate arm,scmi-shmem node in the Domain device-tree.
>
> Yes, I think it makes sense for Xen to generate the "arm,scmi-shmem"
> device tree description for the DomU/Dom0 based on the channels
> allocated to the domain.
>
>
> > The problem is that arm,scmi-smc node, which is using arm,scmi-shmem
> > node can't be generated. I prefer it to be copied from the partial
> > device-tree because it includes some platform specific configuration,
> > such as func-id and list of the protocols (for example different
> > platforms may require different list of the protocols). So in this
> > case we will have 1 node copied and 1 node generated.
> >
> > I think even for dom0less we should use arm,scmi-smc node from the
> > device-tree because protocol configuration and funcid is related to the
> > platform.
>
> I am not sure I understood what you wrote. You are saying that the
> "arm,scmi-smc" node includes some platform specific configurations so
> it cannot be automatically generated by Xen (or by the tools) and
> instead it needs to be manually provided as part of the partial dtb for
> the domU. Is that correct?
>
> If so, I would like to understand the reasons behind it. Manual
> device tree editing is problematic.
>
> I looked for "func-id" in
> Documentation/devicetree/bindings/firmware/arm,scmi.yaml but couldn't
> find any results. Do you have an example of the platform specific
> configuration or protocol configuration that would make it difficult to
> automatically generate the "arm,scmi-smc" node for the domains?

Sorry, I used wrong term (used term from the specification), arm,smc-id
of cause.

>
> Also, is this a problem just for approach #2 or also for approach #1?
> If it is a problem only for approach #2, then let's just go with
> approach #1.
>

We can't copy "arm,scmi-smc" in both approaches. The difference is that
in the first approach we can copy both "arm,scmi-smc" and
"arm,scmi-shmem" nodes while in the second approach we should copy
"arm,scmi-smc", but we have to generate "arm,scmi-shmem" node.

arm,scmi-smc node can't be generated because it includes properties and
configurations that depends from platform and should be get from the
device tree.
Here is "arm,scmi-smc" node expample:
firmware {
    scmi {
        compatible =3D "arm,scmi-smc"
        arm,smc-id =3D <0x82000002>;
        shmem =3D <&cpu_scp_shm>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        scmi_power: protocol@11 {
            reg =3D <0x11>;
            #power-domain-cells =3D <1>;
        };

        scmi_clock: protocol@14 {
            ...
        };

        scmi_reset: protocol@16 {
            ...
        };
        ...
    };
};

It has 3 configurable options:
 * arm,smc-id parameter, setting func_id for scmi protocol. This id can be
different for different platforms.
For example stm32mp1 architecture use different scm-id for different
agents:
https://github.com/ARM-software/arm-trusted-firmware/blob/0586c41b3f2d52aae=
847b7212e7b0c7e19197ea2/plat/st/stm32mp1/include/stm32mp1_smc.h#L39

 * shmem which includes phandle to arm,scmi-shmem node. But this is not
a problem and can be updated.

 * list of the protocol subnodes. This is also configurable parameter,
not regs or names, but the number of the protocols. For example onle
platform can use power-domains/clock/resets via scmi, when another will
require volage-control and sensor-management to be added.

Xen should know this parameters to be able to generate "arm,scmi-smc" node.

Also we're currently discussing new scmi protocol with ARM: Pinctrl over
SCMI.

It should allow domains to access pinctrl subsystem, placed in Firmware
through SCMI protocol.
scmi_pinctrl node will look like this:

	firmware {
		scmi {
			...
			scmi_pinctrl: protocol@18 {
				reg =3D <0x18>;
				#pinctrl-cells =3D <0>;

				i2c2_pins: i2c2 {
					groups =3D <74>; /* i2c2_a */
					function =3D <15>; /* i2c2 */
				};

				irq0_pins: irq0 {
					groups =3D <81>; /* intc_ex_irq0 */
					function =3D <19>; /* intc_ex */
				};

				avb_pins: avb {
					mux {
						/* avb_link, avb_mdio, avb_mii */
						groups =3D <17>, <21>, <22>;
						function =3D <1>; /* avb */
					};

					pins_mdio {
						groups =3D <21>; /* avb_mdio */
						drive-strength =3D <24>;
					};

					pins_mii_tx {
						/* PIN_AVB_TX_CTL, PIN_AVB_TXC, PIN_AVB_TD0,
						       PIN_AVB_TD1, PIN_AVB_TD2, PIN_AVB_TD3 */
						pins =3D <242>, <240>, <236>, <237>, <238>, <239>;
						drive-strength =3D <12>;
					};
				};
				...
			};
		};
	};

So "arm,scmi-smc" node will have even more platform specific settings.

>
> > I prefer the second approach and will try to make it if it's OK to copy
> > arm,scmi-smc node from partial Device-tree and generate arm,scmi-shmem
> > node.
> >
> > What do you think about that?
>
> From a device tree specification perspective, I think both approaches
> are OK (with a minor comment on the first approach as I wrote above.)
>
> But from a Xen perspective I think it is important that we don't require
> the user to manually provide the SCMI configuration in the partial DTB.
> It would be better if we could generate it automatically from Xen or the
> tools (or even an independent script). Or copy the "arm,scmi-smc" node
> from the host device tree to the domU device tree without modifications.

I think copy "arm,scmi-smc" node is the only option we have.
I'm not sure what do you mean under "host device tree" if you mean Xen
device-tree - then I think it will not cover the case with stm32mp1 I've
mentioned above. I think it will be better to copy "arm,scmi-smc" node
from Domu partial Device-tree to Domu device-tree.
So AGENT0 smc-id will be set in xen device-tree and copied to dom0 and
AGENT1 scm-is set in domu device-tree and copied to dom-u.

Do you agree with my points?

>
> So if using approach #1 allows us to automatically generate the
> "arm,scmi-smc" node for the guest, then I think it's best for sure.
>

Summarizing all written above I would focus on the second approach
and put aside the first approach implementation. If you don't mind.

>
> > Also I wanted to mention that I'm not planning to make ARM_SCI support =
for
> > dom0less in terms of this patch series bacause I can't test
> > dom0less configuration for now. So let me know if some of my
> > functionality breaks dom0less.
>
> That's fine. I don't mean to scope-creep your patch series, which is
> extremely valuable as is.
>
> That said, I would be happy to provide you with a very simple dom0less
> configuration for your platform to enable you to test, or alternatively
> I could write a patch to add dom0less domU support if you are happy to
> help reviewing and testing it.

I was thinking about making dom0less support in the different
patch-series because there are still questions to be discussed.

For example, how arm,scmi-smc node will be generated for DomUs and how
the case, when scmi configuration is different for DomU1 and DomU2 (as
in case of stm32mp1 when smc-id is different) should be handled.

What do you think about continue without dom0less support and discuss
dom0less once we done with the main part?

Oleksii.=

