Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510264961B8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 16:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259383.447666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvWU-0000Tc-1G; Fri, 21 Jan 2022 15:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259383.447666; Fri, 21 Jan 2022 15:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvWT-0000RG-Sz; Fri, 21 Jan 2022 15:08:17 +0000
Received: by outflank-mailman (input) for mailman id 259383;
 Fri, 21 Jan 2022 15:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSCu=SF=epam.com=prvs=3020e7787c=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nAvWS-0000RA-Dd
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 15:08:16 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f28d5380-7acb-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 16:08:12 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LEvj4Z019703;
 Fri, 21 Jan 2022 15:08:01 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dqxj48696-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 15:08:00 +0000
Received: from AM9PR03MB7121.eurprd03.prod.outlook.com (2603:10a6:20b:2dc::22)
 by HE1PR0301MB2457.eurprd03.prod.outlook.com (2603:10a6:3:67::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 21 Jan
 2022 15:07:55 +0000
Received: from AM9PR03MB7121.eurprd03.prod.outlook.com
 ([fe80::6889:6c2f:a735:7d73]) by AM9PR03MB7121.eurprd03.prod.outlook.com
 ([fe80::6889:6c2f:a735:7d73%5]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 15:07:55 +0000
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
X-Inumbo-ID: f28d5380-7acb-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUrcYv3zJoGsD0bBpEFZ1L5HU9+Z9wseG8HH28jR0oTnijWhugB3oFetplMwUSjVIEI9y37vroQMwvllL+fwOT2O0rMlFxL05kIxxfwzzNWgqz+d4ad6DosfPrSIGhLR7NFSjOq2b2mPREbo6LNswMbHLr4UyHIv7kps3Uh1N9qIk+I1chH8T4AQUNcXHQndpGx9ycXIJ3VvFJLCPtgGOGx/BZt5CjU5UiAgyMDOm+EkoojMsDDoltce5fzahVJerjGXQAv7S+zuzsKpPj1jKSPT1RCCLT5QgM1xRVdbge61aAripugThHOGPHAIUFgofMq/swR6hD956B3tsWX+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EPg0/5JxiqsL8nNjqIBMtK0QYcxctJL6Q7JqSPa5oA=;
 b=PqzEQo1qbMXPiy66tjefAbBnO3XCIAAf8a5Vrmbbd4yr3tIAvimH44fQm3MufssvQcM556KD40mr/8T24yo0GEGQcQYoShrJVStubOrU0KZL98bk22HmSI+XrAZTHpgPI+JTEPqm3/Fb136yUnfaojpRwOs0RhRQXhGDaJokIkDhFA5IrlJKwCyZLWhonwie+ioMZVjTfM6pYwy2UWmSSsJnINbw5DQedVGbMGCbjRoD3RS+st1nQ5HZNffrhxWIaDO58BxPFFqDVc1KUAUIRJDY72XHWTLc2B9AZCAmYwdlbXAvHHG39ggd5Kjn0Guztvr6y80nyEiSXdnnkrU8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EPg0/5JxiqsL8nNjqIBMtK0QYcxctJL6Q7JqSPa5oA=;
 b=JWFc/iecLG61bAStqNf+5bkh3as5TLYgppCpw1GE1y8nFEpsQk16NJ9cdDYV8v6VEVi/0iV4lJ4p/j5y1BOShhawfiWT5f+NjrOltz9AMoemsS8vFv48xOCk6w2+NOWFKhiSRLBOySTlWD/3fvGN6P3t9a5Lw7+q5nQD+uFF9Kb5ofXkyTsosU7F9IYPjt4VrSWkuhs5XNTHJrBZzICvBiQMBlVLubQ21cekY0QcY1+DvwcJ+9F5fWG4g1rnQjfLCU574FU+b+9LpJyXctPDvXNBERbO1Z9H8vojOe7foAgBiifUx+JGOxf3V8ySxbvG59xKKkMZnJconw1ZF7Wpbg==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgCsRKgCAAOC8gIAAlQqAgADLX4CAARblgA==
Date: Fri, 21 Jan 2022 15:07:54 +0000
Message-ID: <20220121150753.GA898010@EPUAKYIW015D>
References: <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20220119120400.GA3779126@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop>
 <20220120102147.GA4153317@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce9601e9-e389-422d-1077-08d9dcefcd78
x-ms-traffictypediagnostic: HE1PR0301MB2457:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <HE1PR0301MB2457934D93F7AE3D0DD5B0A5E35B9@HE1PR0301MB2457.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 F2Mhosil8Ke7Wdh2g8AZV9POrnIIMW9t2E3aBguvTYV38yH0+7veR/E3+0arq3vOy5M90KutDdLJhT18DI6f1h9qe9dHP8FSwBSDQzWLDtpwdOey3OYizsEEAhNxL5fbo4hTXYoPVF8ob9vv3W9IVHU1Um3tUICSurgNHWPiNoR2Uc3ayzHcyupnNVw1+0MyzIBzx38OVEvNi3TGJMXMFeXrZtiQE0XnJxL1fsbngOdR+5zS6AN0208oOj5djbIk/uFHKdV41BEgASVqsVSMvhzTxqE6u8kBoNo4/uXSAJdXS7wlTzzhQMvGDJ5sVD1iE/uSLLkutvH20lx2db+pTxW+PAVZYhA8OxslfUEEHYAosm5ClIqa3lhcFHKyyZOHMDCNMZy92K6+3rgVYcQWRKzbWh8TXF7zdYJbcKJOzhfgVKdHAHy76n9CQzEOaUWpq8DLAuL4wNP0v1UQf0QDlzWtDbp3YrKH6rn8n7Ws/oCUuYR3ZPAjR5nOIsIuacxYj+cq9rWkMCrxild+IAwEtu1H8hGnzI9Np5+BqyJHye4takQmEhtVzwxYc2XPk6OE7jR2vB5pqk2qeAlJixMJo0OTGsof7wmLF380qjePKkiYIxIcKMOe5f9i/y49XHdlmUj3O0j9AFxwTNW1WiOhNnMJG63BHCNqob+fZK1WMvLGk16kB37oYnnJDxyFi3+voszMD43xjUDnI3Q5gDS+EijgwzPvi8y6AsSJVyFc6s2q/zALICqhkIqUmSbWHDxMiN+8gSqjQTPzmzEmsS4RDjZtlSOT/ps87/+D8WAHTclnHBLZNSGq8XUBnOfSxGiFagf/5tF9Vtru8cr0EWywqF/sxTtNo8k4wgXqvL3Z0b5UXRwCXgnJ6VDuqT7DYB7N
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7121.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(84040400005)(8936002)(4326008)(966005)(33716001)(2906002)(122000001)(71200400001)(86362001)(6506007)(5660300002)(6916009)(6486002)(8676002)(83380400001)(38070700005)(1076003)(9686003)(54906003)(33656002)(6512007)(30864003)(66946007)(76116006)(91956017)(64756008)(66556008)(508600001)(66476007)(26005)(66446008)(186003)(38100700002)(316002)(2004002)(21314003)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RY7PGkNkGEEfa1fJrV1LWwD/+m2gTDUsvnv1uNSwrWLvZh7MzXnvD30gFnxr?=
 =?us-ascii?Q?lUqzTUuSVyT9wT4sEqm8M/+vzXcSTcHbuPtTr2QqNIy2hLBmVnD4iMXU/xVS?=
 =?us-ascii?Q?tRXdgHIgCaS7CRA5gtelmVnTrmATpmt0XF7nzwj7MRLYfJyZ71TIX1H/QzcS?=
 =?us-ascii?Q?cJggNK5EfMvINw+ilKeFSUjKFmOKbTpxiDwfQN3Ijqz/Xs+kSTpvorP+Mg4p?=
 =?us-ascii?Q?LqmZXg+zvbSlQSSYYtN/U+CDkCv73av1CXv9Q1Eb5lyPleqGBqRRV5o6eWc1?=
 =?us-ascii?Q?HUYGZsDIkDeG/fEhIYgoNQFaUg+IP5bI/6Dqlm0TV8xm2uSNnEfT3FNfka4t?=
 =?us-ascii?Q?G1DCx2TVBdHTgDOVF7SedypwufYlQSGbVutSIEDGlvoO992XQz52xHKishZ8?=
 =?us-ascii?Q?gh/QIQr26EbJyrJPRyu0UmZdxrji554mt+8ioZKGX6iDdhfMGfMHJAhmB9tM?=
 =?us-ascii?Q?MX6D+0p7K/uhUFi5wLhy7QMHNx/In/6+dtygAWK8b4GXlZyl8QFdIbtAeRok?=
 =?us-ascii?Q?NuFoPWqCDTHuAr5yshj9d0Z9f1z9PrGWcPPHujtpu67sLhEkHTX89nJcUOT9?=
 =?us-ascii?Q?Mcv/lcNLxHiomJy+qu9u1X3p0Ogq824Wh3/9NlJ21eweVISJ0a8ZdHCLU8uK?=
 =?us-ascii?Q?jFlbLp1RgmB8hDGz4Om5//m5re2rIN/Hqe7B3HVT5EOBY9GfLOM7+B60b/Nx?=
 =?us-ascii?Q?EuK379hIEhkNltdmnHGvUbI/O1bwZuDuniqQ/kNDFtw/49biSkMSa8DachWQ?=
 =?us-ascii?Q?CPBbKIYVFiyslHO5a3gqrakq6TR2O+8nLvXnPLMU/vOYFrVkj4gwTVbQ9CR/?=
 =?us-ascii?Q?IMmvJ5uMmR2vsF9Pv8yoo+KcTtJaE2DLeOoY3uZNJFfBPVSyt7x5fMJZThrr?=
 =?us-ascii?Q?TPwyVst/ypBvhMed3Qd2W9iDSilniHaTbX+dbgcCR2r0WoPAApHUxm0v97lV?=
 =?us-ascii?Q?9EyjdH96aIj1tUPH5IBqhyQ4WBFT9PFcfuCmtaNK/t/2mt3LOI2sIa2SoOVj?=
 =?us-ascii?Q?HvcGqkmj+X7xW4WfOB7mI5E/oYn7tvNcu9acgzHSAvtMKrC+yykfgaoMqLcM?=
 =?us-ascii?Q?qH3FTDrhyMewQ/eljlDTQewRtQiWVU1x8bKixy4B9EKP4oZGOFODjdv+nZx+?=
 =?us-ascii?Q?6VTJAqqYJ0x/ZhWjyaP8SPdpA0GUi8jc2TtU1Efd6atL6CXT+XF37As4IhZX?=
 =?us-ascii?Q?pLd3pcioRYkvDB80T53hUNDI6VdHPBtEg12l4xTaMsFFtjEnXJ/NqAGrFHuL?=
 =?us-ascii?Q?WP2tzIGmWubGYozv220uVvq48k3uZFk4knGEyDybLuAXlngDMML5/IDR5TDq?=
 =?us-ascii?Q?B2ZaMZ9qn+eKm0yrLiUUn6XbZ154boV6i4663te991Yt3juW9wXz0NrGTcR0?=
 =?us-ascii?Q?1LBFdMUAjcDknf/7RDBv/5JcaSvEn8sY3abinAC/ivLwhcdBlMs1J5g5dZoe?=
 =?us-ascii?Q?q0IcGsr11XNNwLJ0pnUPrfchJCOOSNTyZZhwEtkruHLZqQkMbEe16vpZ0+i9?=
 =?us-ascii?Q?nuf+vJjc3dxfzeHZmXzubuUqDRTwsKs9OC5i18D13fpxsMzeO75wTZfIuCF1?=
 =?us-ascii?Q?/GU1hgU+tRwJ7f3pixfiEESBnsH4mWBMDxYX+q/S8iibZZIZYqxQhfdZcAhh?=
 =?us-ascii?Q?PJ5nI3eXhmwKPHvXfOjhcDlzBWCJNndN46v0zAQTTdHdi9I82nP2+BNjKraC?=
 =?us-ascii?Q?tNAYOUa5Xy3NzZ9Q3s2TSJeMvXA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1CCE10B67C6A08498B01ADDAE863DF64@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7121.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9601e9-e389-422d-1077-08d9dcefcd78
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 15:07:55.0722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f33gYt70UIJQ4W5zwjuh+UQHoVHS86jLT+egi8jDXiy1agS/4iCLmI4l7h0Ol0KV2ZPt8pmz7PfMvjSO5dyXel7Lj0VKrvUFqcjPXWi2Jtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2457
X-Proofpoint-ORIG-GUID: WZeGudu7K31zD5U5Y9-1PdDleraQaVFt
X-Proofpoint-GUID: WZeGudu7K31zD5U5Y9-1PdDleraQaVFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_06,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210102

Hi Stefano,

On Thu, Jan 20, 2022 at 02:29:41PM -0800, Stefano Stabellini wrote:
> On Thu, 20 Jan 2022, Oleksii Moisieiev wrote:
> > On Wed, Jan 19, 2022 at 05:28:21PM -0800, Stefano Stabellini wrote:
> > > On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> > > > On Wed, Dec 22, 2021 at 06:23:24PM -0800, Stefano Stabellini wrote:
> > > > > On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wr=
ote:
> > > > > > > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > Hi Stefano,
> > > > > > > >
> > > > > > > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellin=
i wrote:
> > > > > > > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > Hi Stefano,
> > > > > > > > > >
> > > > > > > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabe=
llini wrote:
> > > > > > > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > > > This is the implementation of SCI interface, called=
 SCMI-SMC driver,
> > > > > > > > > > > > which works as the mediator between XEN Domains and=
 Firmware (SCP, ATF etc).
> > > > > > > > > > > > This allows devices from the Domains to work with c=
locks, resets and
> > > > > > > > > > > > power-domains without access to CPG.
> > > > > > > > > > > >
> > > > > > > > > > > > The following features are implemented:
> > > > > > > > > > > > - request SCMI channels from ATF and pass channels =
to Domains;
> > > > > > > > > > > > - set device permissions for Domains based on the D=
omain partial
> > > > > > > > > > > > device-tree. Devices with permissions are able to w=
ork with clocks,
> > > > > > > > > > > > resets and power-domains via SCMI;
> > > > > > > > > > > > - redirect scmi messages from Domains to ATF.
> > > > > > > > > > > >
> > > > > > > > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev=
@epam.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > > > > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > > > > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > > > > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++=
++++++++++++++++++++
> > > > > > > > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > > > > > > > >  5 files changed, 809 insertions(+)
> > > > > > > > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > > > > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kc=
onfig
> > > > > > > > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > > > > > > > >  	  support. It allows guests to control system res=
ourcess via one of
> > > > > > > > > > > >  	  SCI mediators implemented in XEN.
> > > > > > > > > > > >
> > > > > > > > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > > > > > > > +
> > > > > > > > > > > >  endmenu
> > > > > > > > > > > >
> > > > > > > > > > > >  menu "ARM errata workaround via the alternative fr=
amework"
> > > > > > > > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/ar=
m/sci/Kconfig
> > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > index 0000000000..9563067ddc
> > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > > > > > > > @@ -0,0 +1,10 @@
> > > > > > > > > > > > +config SCMI_SMC
> > > > > > > > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > > > > > > > +	default n
> > > > > > > > > > > > +	depends on SCI
> > > > > > > > > > > > +	---help---
> > > > > > > > > > > > +
> > > > > > > > > > > > +	Enables mediator in XEN to pass SCMI requests fro=
m Domains to ATF.
> > > > > > > > > > > > +	This feature allows drivers from Domains to work =
with System
> > > > > > > > > > > > +	Controllers (such as power,resets,clock etc.). SC=
P is used as transport
> > > > > > > > > > > > +	for communication.
> > > > > > > > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/a=
rm/sci/Makefile
> > > > > > > > > > > > index 837dc7492b..67f2611872 100644
> > > > > > > > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > > > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > > > > > > > @@ -1 +1,2 @@
> > > > > > > > > > > >  obj-y +=3D sci.o
> > > > > > > > > > > > +obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
> > > > > > > > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch=
/arm/sci/scmi_smc.c
> > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > index 0000000000..2eb01ea82d
> > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > @@ -0,0 +1,795 @@
> > > > > > > > > > > > +/*
> > > > > > > > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > + *
> > > > > > > > > > > > + * SCMI mediator driver, using SCP as transport.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + * This program is free software; you can redistri=
bute it and/or modify
> > > > > > > > > > > > + * it under the terms of the GNU General Public Li=
cense as published by
> > > > > > > > > > > > + * the Free Software Foundation; either version 2 =
of the License, or
> > > > > > > > > > > > + * (at your option) any later version.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + * This program is distributed in the hope that it=
 will be useful,
> > > > > > > > > > > > + * but WITHOUT ANY WARRANTY; without even the impl=
ied warranty of
> > > > > > > > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR=
POSE.  See the
> > > > > > > > > > > > + * GNU General Public License for more details.
> > > > > > > > > > > > + */
> > > > > > > > > > > > +
> > > > > > > > > > > > +#include <asm/sci/sci.h>
> > > > > > > > > > > > +#include <asm/smccc.h>
> > > > > > > > > > > > +#include <asm/io.h>
> > > > > > > > > > > > +#include <xen/bitops.h>
> > > > > > > > > > > > +#include <xen/config.h>
> > > > > > > > > > > > +#include <xen/sched.h>
> > > > > > > > > > > > +#include <xen/device_tree.h>
> > > > > > > > > > > > +#include <xen/iocap.h>
> > > > > > > > > > > > +#include <xen/init.h>
> > > > > > > > > > > > +#include <xen/err.h>
> > > > > > > > > > > > +#include <xen/lib.h>
> > > > > > > > > > > > +#include <xen/list.h>
> > > > > > > > > > > > +#include <xen/mm.h>
> > > > > > > > > > > > +#include <xen/string.h>
> > > > > > > > > > > > +#include <xen/time.h>
> > > > > > > > > > > > +#include <xen/vmap.h>
> > > > > > > > > > > > +
> > > > > > > > > > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > > > > > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > > > > > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > > > > > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > > > > > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > > > > > > > > > +
> > > > > > > > > > > > +/* SCMI return codes. See section 4.1.4 of SCMI sp=
ec (DEN0056C) */
> > > > > > > > > > > > +#define SCMI_SUCCESS              0
> > > > > > > > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > > > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > > > > > > > +#define SCMI_DENIED             (-3)
> > > > > > > > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > > > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > > > > > > > +#define SCMI_BUSY               (-6)
> > > > > > > > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > > > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > > > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > > > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > > > > > > > +
> > > > > > > > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm=
,scmi-smc")
> > > > > > > > > > > > +
> > > > > > > > > > > > +#define SCMI_SMC_ID                        "arm,sm=
c-id"
> > > > > > > > > > > > +#define SCMI_SHARED_MEMORY                 "linux,=
scmi_mem"
> > > > > > > > > > >
> > > > > > > > > > > I could find the following SCMI binding in Linux, whi=
ch describes
> > > > > > > > > > > the arm,scmi-smc compatible and the arm,smc-id proper=
ty:
> > > > > > > > > > >
> > > > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.y=
aml
> > > > > > > > > > >
> > > > > > > > > > > However, linux,scmi_mem is not described. Aren't you =
supposed to read
> > > > > > > > > > > the "shmem" property instead? And the compatible stri=
ng used for this
> > > > > > > > > > > seems to be "arm,scmi-shmem".
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > We use linux,scmi_mem node to reserve memory, needed fo=
r all
> > > > > > > > > > channels:
> > > > > > > > > >
> > > > > > > > > > reserved-memory {
> > > > > > > > > >     /* reserved region for scmi channels*/
> > > > > > > > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > > > > > > > >         no-map;
> > > > > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > > > > > > > > >     };
> > > > > > > > > > };
> > > > > > > > > >
> > > > > > > > > > arm,scmi-shmem node used in shmem property defines only=
 1 page needed to
> > > > > > > > > > the current scmi channel:
> > > > > > > > > >
> > > > > > > > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > > > > > >     compatible =3D "arm,scmi-shmem";
> > > > > > > > > >     reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > > > };
> > > > > > > > > >
> > > > > > > > > > For each Domain reg points to unigue page from linux,sc=
mi_mem region,
> > > > > > > > > > assigned to this agent.
> > > > > > > > >
> > > > > > > > > If we were to use "linux,scmi_mem" we would have to intro=
duce it as a
> > > > > > > > > compatible string, not as a node name, and it would need =
to be described
> > > > > > > > > in Documentation/devicetree/bindings/firmware/arm,scmi.ya=
ml.
> > > > > > > > >
> > > > > > > > > But from your description I don't think it is necessary. =
We can just use
> > > > > > > > > "arm,scmi-shmem" to describe all the required regions:
> > > > > > > > >
> > > > > > > > > reserved-memory {
> > > > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > >     };
> > > > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > > > >     };
> > > > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > > > >     };
> > > > > > > > >     ...
> > > > > > > > >
> > > > > > > > > In other words, if all the individual channel pages are d=
escribed as
> > > > > > > > > "arm,scmi-shmem", why do we also need a single larger reg=
ion as
> > > > > > > > > "linux,scmi_mem"?
> > > > > > > > >
> > > > > > > >
> > > > > > > > That was my first implementation. But I've met a problem wi=
th
> > > > > > > > scmi driver in kernel. I don't remember the exact place, bu=
t I remember
> > > > > > > > there were some if, checking if memory weren't reserved.
> > > > > > > > That's why I ended up splitting nodes reserved memory regio=
n and actual
> > > > > > > > shmem page.
> > > > > > > > For linux,scmi_mem node I took format from /reserved-memory=
/linux,lossy_decompress@54000000,
> > > > > > > > which has no compatible string and provides no-map property=
.
> > > > > > > > linux,scmi_shmem node is needed to prevent xen from allocat=
ing this
> > > > > > > > space for the domain.
> > > > > > > >
> > > > > > > > Very interesting question about should I introduce linux,sc=
mi_mem node
> > > > > > > > and scmi_devid property to the
> > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
> > > > > > > > Those node and property are needed only for Xen and useless=
 for
> > > > > > > > non-virtualized systems. I can add this node and property d=
escription to
> > > > > > > > arm,scmi.yaml, but leave a note that this is Xen specific p=
arams.
> > > > > > > > What do you think about it?
> > > > > > >
> > > > > > > Reply below
> > > > > > >
> > > > > > > [...]
> > > > > > >
> > > > > > >
> > > > > > > > > In general we can't use properties that are not part of t=
he device tree
> > > > > > > > > spec, either https://urldefense.com/v3/__https://www.devi=
cetree.org/specifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxe=
e_ChowYQiQYC595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > > > > > > > https://urldefense.com/v3/__https://git.kernel.org/pub/sc=
m/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/binding=
s__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2=
zmk7BnhXloYUaj$ [git[.]kernel[.]org]
> > > > > > > > >
> > > > > > > > > "linux,scmi_mem" is currently absent. Are you aware of an=
y upstreaming
> > > > > > > > > activities to get "linux,scmi_mem" upstream under
> > > > > > > > > Documentation/devicetree/bindings in Linux?
> > > > > > > > >
> > > > > > > > > If "linux,scmi_mem" is going upstream in Linux, then we c=
ould use it.
> > > > > > > > > Otherwise, first "linux,scmi_mem" needs to be added somew=
here under
> > > > > > > > > Documentation/devicetree/bindings (probably
> > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml)=
, then we can
> > > > > > > > > work on the Xen code that makes use of it.
> > > > > > > > >
> > > > > > > > > Does it make sense?
> > > > > > > > >
> > > > > > > >
> > > > > > > > Yes I agree. I think linux,scmi_mem and scmi_devid should b=
e upstreamed.
> > > > > > > > I will add those properties to arm,scmi.yaml, mark them as =
related to XEN and send patch.
> > > > > > >
> > > > > > > I didn't realize that linux,scmi_mem and scmi_devid are suppo=
sed to be
> > > > > > > Xen specific. In general, it would be best not to introduce X=
en specific
> > > > > > > properties into generic bindings. It is a problem both from a
> > > > > > > specification perspective (because it has hard to handle Xen =
specific
> > > > > > > cases in fully generic bindings, especially as those bindings=
 are
> > > > > > > maintained as part of the Linux kernel) and from a user persp=
ective
> > > > > > > (because now the user has to deal with a Xen-specific dtb, or=
 has to
> > > > > > > modify the host dtb to add Xen-specific information by hand.)
> > > > > > >
> > > > > > >
> > > > > > > Let me start from scmi_devid.  Why would scmi_devid be Xen-sp=
ecific? It
> > > > > > > looks like a generic property that should be needed for the L=
inux SCMI
> > > > > > > driver too. Why the Linux driver doesn't need it?
> > > > > > >
> > > > > >
> > > > > > scmi_devid used during domain build. It passed as input paramet=
er for SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> > > > > > On non-virtualized systems - there is no need of this call, bec=
ause OS
> > > > > > is the only one entity, running on the system.
> > > > >
> > > > > OK. Even if it is only required for virtualized systems, I think =
that
> > > > > scmi_devid is important enough that should be part of the upstrea=
m
> > > > > binding. I think it is worth starting an email thread on the LKML=
 with
> > > > > Rob Herring and the SCMI maintainers to discuss the addition of
> > > > > scmi_devid to the binding.
> > > > >
> > > > >
> > > > > > I've chatted with Volodymyr_Babchuk and he gave a great idea to=
 add a
> > > > > > list of device_ids to dom.cfg, such as:
> > > > > > sci_devs =3D [ 0, 1, 15, 35 ];
> > > > > >
> > > > > > Using this approach, we can remove scmi_devid from the device t=
ree and
> > > > > > just pass a list of scmi_devids to XEN using additional hyperca=
ll.
> > > > > > We can probably make hypercall taking devid list as input param=
eter.
> > > > > > This will take only 1 hypercall to setup sci permissions.
> > > > >
> > > > > But how would a user know which are the right SCMI IDs to add to =
the
> > > > > sci_devs list? Would the user have to go and read the reference m=
anual
> > > > > of the platform to find the SCMI IDs and then write sci_devs by h=
and?
> > > > > If that is the case, then I think that it would be better to add
> > > > > scmi_devid to device tree.
> > > > >
> > > > > In general, I think this configuration should happen automaticall=
y
> > > > > without user intervention. The user should just specify "enable S=
CMI"
> > > > > and it should work.
> > > > >
> > > > >
> > > > > > > In regards to linux,scmi_mem, I think it would be best to do =
without it
> > > > > > > and fix the Linux SCMI driver if we need to do so. Xen should=
 be able to
> > > > > > > parse the native "arm,scmi-shmem" nodes and Linux (dom0 or do=
mU) should
> > > > > > > be able to parse the "arm,scmi-shmem" nodes generated by Xen.=
 Either
> > > > > > > way, I don't think we should need linux,scmi_mem.
> > > > > >
> > > > > > This requires further investigation. I will try to make impleme=
ntation
> > > > > > without linux,scmi_mem, using only arm,scmi-shmem nodes and sha=
re
> > > > > > reuslts with you.
> > > > >
> > > > > OK, thanks.
> > > >
> > > > Hi Stefano,
> > > >
> > > > As I did some investigation about using reserved-memory area
> > > > linux,scmi_mem and now I need your advice.
> > > >
> > > > I see 2 possible implementations for now:
> > > > 1) Add memory-region parameter to cpu_scp_shm node which points to =
the
> > > > reserved memory region.
> > > > So device-tree will look like this:
> > > >
> > > > 	reserved-memory {
> > > > 		/* reserved region for scmi channels*/
> > > > 		scmi_memory: region@53FF0000{
> > > > 			no-map;
> > > > 			reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > > > 		};
> > > > 	};
> > > > 	cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > 		compatible =3D "arm,scmi-shmem";
> > > > 		reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > 		memory-region =3D <&scmi_memory>;
> > > > 	};
> > > >
> > > > So cpu_scp_shm node has a reference to scmi_memory region. This mea=
n
> > > > that xen can find reserved memory region without adding additional =
names
> > > > to the device-tree bindings.
> > > > memory-region parameter as a reference to reserved memory and regio=
n
> > > > creation described in:
> > > > https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/=
v5.15/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt=
__;!!GF_29dbcQIUBPA!k6x19x1gYF1CPlgAZj7std3ifqhq-9DXvuF0nwonNPUwMzZpYHYbrRJ=
ziJrgdFIOjyan$ [github[.]com]
> > > >
> > > > This approach I've implemented already and it works.
> > >
> > > This approach would require a discussion with the upstream device tre=
e
> > > maintainers. Likely, we would need to add a note about the usage of t=
he
> > > "memory-region" property to arm,scmi.yaml.
> > >
> > > Also, I have the feeling that they would ask to add the "memory-regio=
n"
> > > property directly to the "arm,scmi-smc" node, as an alternative (or
> > > in addition) to the existing "shmem" property.
> > >
> > > That said, from my point of view this approach is also a viable optio=
n.
> > > I don't see any major problems.
> > >
> > > The main question (after reading everything else that you wrote below=
)
> > > is whether the "arm,scmi-smc" node in this case could be automaticall=
y
> > > generated.
> > >
> >=20
> > arm,scmi-smc node can be generated in both cases. I think I'd leave it
> > as backup in case if the second approach will not work.
> >=20
> > >
> > > > 2) The second approach is the format you suggested:
> > > > > > > > > reserved-memory {
> > > > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > >     };
> > > > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > > > >     };
> > > > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > > > >     };
> > > > > > > > >     ...
> > > >
> > > > This approach has an advantage that xen ARM_SCI driver do not know =
about
> > > > how channels are placed in the reserved memory, but introduces some
> > > > disadvantages:
> > > > a) We provide extra 14 (in our case) arm,scmi-shmem nodes which are=
 not used
> > > > in the device-tree. In current implementation I have separate scmi.=
dtsi
> > > > file which introduces scmi support for both XEN-based and
> > > > non-virtualized systems. Having 14 extra channels in the device-tre=
e may
> > > > be confusing.
> > >
> > > I can see that while it would be ideal for Xen to see all 14+1 channe=
ls
> > > in device tree (on the host device tree), we wouldn't want to expose =
all
> > > of them to the domains, not even to dom0.
> > >
> > > How many channels do we want dom0 to see by the way? For this
> > > discussion, I'll just assume for now that dom0 only sees 1 channel li=
ke
> > > the domUs.
> >=20
> > For dom0 we need only one channel.
> >=20
> > >
> > > Now we have a problem: how do we go about "filtering" the
> > > "arm,scmi-shmem" device tree nodes? Which is also what you are asking
> > > below in point b).
> > >
> >=20
> > Xen will not need to filter "arm,scmi-shmem" node. It will just
> > create shmem node in Domain device-tree. I don't see any problem for xe=
n
> > configuration here.
> > What bothers me here is that I set scmi configuration for platform dts,
> > not for xen or domu dts files.
> > So for example I have the following structure of the dts files for my
> > platform (r8a77961-salvator-xs):
> >  * r8a77961-scmi.dtsi - this file includes all scmi related nodes and s=
et
> > scmi_devid for the devices, that should use scmi.
> >  * r8a77961-salvator-xs.dts - dts file which generates dtb for the plat=
form.
> > It includes r8a77961-scmi.dtsi so I populate scmi to platform dtb, whic=
h
> > is used for system with no hypervisor.
> >  * r8a77961-salvator-xs-xen.dts - dts file for xen which includes
> > r8a77961-salvator-xs.dts and inherits scmi configuration from it.
> >  * r8a77961-salvator-xs-domu.dts - dts file for DomU which includes
> > r8a77961-salvator-xs.dts and inherits scmi configuration from it.
> >=20
> > In this case r8a77961-salvator-xs.dtb r8a77961-salvator-xs-xen.dtb
> > r8a77961-salvator-xs-domu.dtb files will inherit 14+1 channel.
> >=20
> > I can give you a link to Merge request with this changes if you need it=
.
> >=20
> > For xen and domu dtb it is not a problem because all "arm,scmi-shmem"
> > nodes will be omitted and new will be generated for the domains.
> >=20
> > What bothers me is that r8a77961-salvator-xs.dtb will have 14 unused ch=
annels.
> >=20
> > Just got an idea while writing this: I can create only one
> > "arm,scmi-shmem" node in r8a77961-scmi.dtsi and add 14 more nodes,
> > needed for xen explicitly in r8a77961-salvator-xs-xen.dts.
> >=20
> > Then we will have valid configurations for all cases.
> > This can be a solution. What do you think?
>=20
> It is good that you brought this up because it helps me explain what I
> mean. And of course it is up to you where you place the nodes in the
> various dts files at your disposal. Either way it would work but I think
> they should belong to r8a77961-salvator-xs.dts.
>=20
> Generally the platform vendor (e.g. Xilinx) provides a device tree
> description of the platform to use including all the available resources
> and firmware interfaces. In your case it would be r8a77961-scmi.dtsi +
> r8a77961-salvator-xs.dts. This is what I call the "host device tree"
> below. Users should be able to boot a fully functional system using the
> host device tree pretty much "as is" to run Xen, Linux or any other
> software.
>=20
> Certainly the SCMI device tree description should be part of the host
> device tree, so in your case it would be r8a77961-salvator-xs.dts. And
> the description should include all 14+1 channels because this is the
> generic platform description -- we cannot know for sure how the users
> are going to use the system.
>=20
> This is why r8a77961-salvator-xs-xen.dts should be as small as possible
> or ideally inexistent. There shouldn't be a need for a special device
> tree modification to allow Xen to run. In reality, even at Xilinx we
> have something like r8a77961-salvator-xs-xen.dts, although it is really
> small.
>=20
> But I see that r8a77961-salvator-xs-xen.dts could be viewed as the
> device tree additions to run hypervisors and from that point of view it
> is more acceptable to place the 14 channels there.
>=20
> The biggest problem is r8a77961-salvator-xs-domu.dts: who is going to
> write it? And how? It wouldn't be provided by the platform vendor, so it
> is the user the one that has to find a way to write it.
>=20
> I know the user already has to write a partial DTB for device
> assignment, but any time the process is more complex than "copy the host
> device tree node for device XXX to the partial DTB" it is a problem.
> Errors are made and the system doesn't work.
>=20
> I think we don't want to make it even more difficult by having to
> manually produce the SCMI domU description too. The SCMI description for
> domU could be automatically generated by Xen, or libxl/xl. If that's an
> issue, then the SCMI description could be automatically generated by an
> external tool but I think it would make things more complex and harder
> to maintain.
>=20
> In short my point of view is:
> - r8a77961-scmi.dtsi + r8a77961-salvator-xs.dts should be as generic as
>   possible so the SCMI nodes should have 14+1 channels
> - but putting the 14 channels in r8a77961-salvator-xs-xen.dts is still
>   OKish
> - it is important that r8a77961-salvator-xs-domu.dts is automatically
>   generated by Xen or libxl or another software tool
>=20

Thank you for the detailed response. I'll put all 14+1 channels to
r8a77961-salvator-xs.dts then.
I've described my thoughts about generation of the arm,scmi-smc node below.

>=20
> > > > b) In case if we have all 15 channels, described in partial device-=
tree,
> > >
> > > I think you meant "described in the host device tree", right?
> > >
> > Yeah that's what I've meant.
> > >
> > > > we should not copy any node to the domain device-tree. I think it w=
ill
> > > > be better to generate arm,scmi-shmem node in the Domain device-tree=
.
> > >
> > > Yes, I think it makes sense for Xen to generate the "arm,scmi-shmem"
> > > device tree description for the DomU/Dom0 based on the channels
> > > allocated to the domain.
> > >
> > >
> > > > The problem is that arm,scmi-smc node, which is using arm,scmi-shme=
m
> > > > node can't be generated. I prefer it to be copied from the partial
> > > > device-tree because it includes some platform specific configuratio=
n,
> > > > such as func-id and list of the protocols (for example different
> > > > platforms may require different list of the protocols). So in this
> > > > case we will have 1 node copied and 1 node generated.
> > > >
> > > > I think even for dom0less we should use arm,scmi-smc node from the
> > > > device-tree because protocol configuration and funcid is related to=
 the
> > > > platform.
> > >
> > > I am not sure I understood what you wrote. You are saying that the
> > > "arm,scmi-smc" node includes some platform specific configurations so
> > > it cannot be automatically generated by Xen (or by the tools) and
> > > instead it needs to be manually provided as part of the partial dtb f=
or
> > > the domU. Is that correct?
> > >
> > > If so, I would like to understand the reasons behind it. Manual
> > > device tree editing is problematic.
> > >
> > > I looked for "func-id" in
> > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml but couldn't
> > > find any results. Do you have an example of the platform specific
> > > configuration or protocol configuration that would make it difficult =
to
> > > automatically generate the "arm,scmi-smc" node for the domains?
> >=20
> > Sorry, I used wrong term (used term from the specification), arm,smc-id
> > of cause.
> >=20
> > >
> > > Also, is this a problem just for approach #2 or also for approach #1?
> > > If it is a problem only for approach #2, then let's just go with
> > > approach #1.
> > >
> >=20
> > We can't copy "arm,scmi-smc" in both approaches. The difference is that
> > in the first approach we can copy both "arm,scmi-smc" and
> > "arm,scmi-shmem" nodes while in the second approach we should copy
> > "arm,scmi-smc", but we have to generate "arm,scmi-shmem" node.
> >=20
> > arm,scmi-smc node can't be generated because it includes properties and
> > configurations that depends from platform and should be get from the
> > device tree.
> > Here is "arm,scmi-smc" node expample:
> > firmware {
> >     scmi {
> >         compatible =3D "arm,scmi-smc"
> >         arm,smc-id =3D <0x82000002>;
> >         shmem =3D <&cpu_scp_shm>;
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >         scmi_power: protocol@11 {
> >             reg =3D <0x11>;
> >             #power-domain-cells =3D <1>;
> >         };
> >=20
> >         scmi_clock: protocol@14 {
> >             ...
> >         };
> >=20
> >         scmi_reset: protocol@16 {
> >             ...
> >         };
> >         ...
> >     };
> > };
> >=20
> > It has 3 configurable options:
> >  * arm,smc-id parameter, setting func_id for scmi protocol. This id can=
 be
> > different for different platforms.
> > For example stm32mp1 architecture use different scm-id for different
> > agents:
> > https://urldefense.com/v3/__https://github.com/ARM-software/arm-trusted=
-firmware/blob/0586c41b3f2d52aae847b7212e7b0c7e19197ea2/plat/st/stm32mp1/in=
clude/stm32mp1_smc.h*L39__;Iw!!GF_29dbcQIUBPA!mTRUjtSg19iVaYo3Cgjop5ckPWqKs=
HVo1EZCEA1zCbod9KpNSXX291A8vAuNdTCr46MA$ [github[.]com]
> >=20
> >  * shmem which includes phandle to arm,scmi-shmem node. But this is not
> > a problem and can be updated.
> >=20
> >  * list of the protocol subnodes. This is also configurable parameter,
> > not regs or names, but the number of the protocols. For example onle
> > platform can use power-domains/clock/resets via scmi, when another will
> > require volage-control and sensor-management to be added.
> >=20
> > Xen should know this parameters to be able to generate "arm,scmi-smc" n=
ode.
> >=20
> > Also we're currently discussing new scmi protocol with ARM: Pinctrl ove=
r
> > SCMI.
> >=20
> > It should allow domains to access pinctrl subsystem, placed in Firmware
> > through SCMI protocol.
> > scmi_pinctrl node will look like this:
> >=20
> > 	firmware {
> > 		scmi {
> > 			...
> > 			scmi_pinctrl: protocol@18 {
> > 				reg =3D <0x18>;
> > 				#pinctrl-cells =3D <0>;
> >=20
> > 				i2c2_pins: i2c2 {
> > 					groups =3D <74>; /* i2c2_a */
> > 					function =3D <15>; /* i2c2 */
> > 				};
> >=20
> > 				irq0_pins: irq0 {
> > 					groups =3D <81>; /* intc_ex_irq0 */
> > 					function =3D <19>; /* intc_ex */
> > 				};
> >=20
> > 				avb_pins: avb {
> > 					mux {
> > 						/* avb_link, avb_mdio, avb_mii */
> > 						groups =3D <17>, <21>, <22>;
> > 						function =3D <1>; /* avb */
> > 					};
> >=20
> > 					pins_mdio {
> > 						groups =3D <21>; /* avb_mdio */
> > 						drive-strength =3D <24>;
> > 					};
> >=20
> > 					pins_mii_tx {
> > 						/* PIN_AVB_TX_CTL, PIN_AVB_TXC, PIN_AVB_TD0,
> > 						       PIN_AVB_TD1, PIN_AVB_TD2, PIN_AVB_TD3 */
> > 						pins =3D <242>, <240>, <236>, <237>, <238>, <239>;
> > 						drive-strength =3D <12>;
> > 					};
> > 				};
> > 				...
> > 			};
> > 		};
> > 	};
> >=20
> > So "arm,scmi-smc" node will have even more platform specific settings.
> >=20
> > >
> > > > I prefer the second approach and will try to make it if it's OK to =
copy
> > > > arm,scmi-smc node from partial Device-tree and generate arm,scmi-sh=
mem
> > > > node.
> > > >
> > > > What do you think about that?
> > >
> > > From a device tree specification perspective, I think both approaches
> > > are OK (with a minor comment on the first approach as I wrote above.)
> > >
> > > But from a Xen perspective I think it is important that we don't requ=
ire
> > > the user to manually provide the SCMI configuration in the partial DT=
B.
> > > It would be better if we could generate it automatically from Xen or =
the
> > > tools (or even an independent script). Or copy the "arm,scmi-smc" nod=
e
> > > from the host device tree to the domU device tree without modificatio=
ns.
> >=20
> > I think copy "arm,scmi-smc" node is the only option we have.
> > I'm not sure what do you mean under "host device tree" if you mean Xen
> > device-tree - then I think it will not cover the case with stm32mp1 I'v=
e
> > mentioned above. I think it will be better to copy "arm,scmi-smc" node
> > from Domu partial Device-tree to Domu device-tree.
> > So AGENT0 smc-id will be set in xen device-tree and copied to dom0 and
> > AGENT1 scm-is set in domu device-tree and copied to dom-u.
> >=20
> > Do you agree with my points?
>=20
> I think we are saying similar things, but we are getting mixed up with
> the terminology. Let's start from the basics :-)
>=20
> # Host device tree
> The device tree given to Xen at boot time. This is the device tree that
> Xen parses to discover what's available on the platform. In your case,
> it seems to include r8a77961-salvator-xs-xen.dts.
>=20
> # Partial DTB
> (Ignoring Dom0less) this is the small DTB that gets passed to xl with
> the "device_tree" option in the xl config file. It is copied verbatim
> to the domU device tree by xl/libxl.
>=20
> # Copy the "arm,scmi-smc" node from host device tree
> This means that the domU "arm,scmi-smc" node is an exact copy of the
> host device tree SCMI node. I don't think this is actually possible in
> most cases because the domU description is typically a bit different
> from the host description. For instance, the host description could
> include 14+1 channels while the domU description should only include 1
> channel.
>=20
> # Copy the "arm,scmi-smc" node from the partial DTB
> This implies that somebody or something create an "arm,scmi-smc" node
> for the domU and placed it into the partial DTB. Then, Xen and/or
> xl/libxl will copy the node from the partial DTB to the DomU device
> tree. The main question in this case is: who is going to write the
> partial DTB? We dont want the user (i.e. a person) to have to manually
> write the SCMI description for the domU. It should be an automated tools
> that does it. At that point, it is easier if it is Xen or xl/libxl.
> Alternativaly, we could think of an external tool but I think it would
> make things more difficult to maintain.
>=20
> # Generate the "arm,scmi-smc" node for domUs
> When I write "generate the arm,scmi-smc node", I mean that Xen and
> libxl/xl will generate the "arm,scmi-smc" node for the domU. Thus, the
> node will not be copied from the partial DTB or from the device tree,
> instead, it should be created directly by Xen and/or libxl/xl.
>=20
> However, the domU "arm,scmi-smc" node could still be derived from the
> host device tree "arm,scmi-smc" node. In other words, Xen or xl/libxl
> would look at the host device tree "arm,scmi-smc" node, copy it to the
> domU device tree while making as many changes as necessary.
>=20
> The DomU "arm,scmi-smc" node doesn't have to be entirely fake and
> static. It could be dynamically created to match the host device tree
> description. I think this is the best option.
>=20
>=20
> # Conclusion
> I am suggesting that Xen and/or libxl automatically produce the
> "arm,scmi-smc" node for domUs based on the host device tree description
> and based on the channel mapped to the domU. This way, the user (a
> person) doesn't have to go and manually edit the domU partial DTB.
>=20

That sounds reasonable. The problem is that arm,scmi-smc node can be
copmlicated and include a lot of configuration. Also for different
mediators this node can be different.
As I inderstand, there is no mechanism for xl to access host device-tree
right now. Correct me if I'm wrong.

I see the following way we can generate arm,scmi-smc node for DomU:
We say that if scmi-smc mediator is enabled - then Dom0 is configured to
use SCMI. This means that Dom0 device-tree will have arm,scmi-smc node
and it can be reached from the userspace.
In this case xl can use infromation from /proc/device-tree/firmware/scmi
to generate arm,scmi-smc node for DomU. But in this case xl should know
the exact path of scmi node.

Or we can generate some special node, called "shared" in Dom0 device-tree
which will include copy of the arm,scmi-smc node, which can be used for dom=
ains.
In this case xl can scan /proc/device-tree/shared node and find
arm,scmi-smc copatible node and use it to generate arm,scmi-smc node for
DomU.
Also this can be used for another features in future.

What do you think about this?

>=20
> > > So if using approach #1 allows us to automatically generate the
> > > "arm,scmi-smc" node for the guest, then I think it's best for sure.
> > >
> >=20
> > Summarizing all written above I would focus on the second approach
> > and put aside the first approach implementation. If you don't mind.
>=20
> Sure, that's fine by me
>=20
>=20
> > > > Also I wanted to mention that I'm not planning to make ARM_SCI supp=
ort for
> > > > dom0less in terms of this patch series bacause I can't test
> > > > dom0less configuration for now. So let me know if some of my
> > > > functionality breaks dom0less.
> > >
> > > That's fine. I don't mean to scope-creep your patch series, which is
> > > extremely valuable as is.
> > >
> > > That said, I would be happy to provide you with a very simple dom0les=
s
> > > configuration for your platform to enable you to test, or alternative=
ly
> > > I could write a patch to add dom0less domU support if you are happy t=
o
> > > help reviewing and testing it.
> >=20
> > I was thinking about making dom0less support in the different
> > patch-series because there are still questions to be discussed.
> >=20
> > For example, how arm,scmi-smc node will be generated for DomUs and how
> > the case, when scmi configuration is different for DomU1 and DomU2 (as
> > in case of stm32mp1 when smc-id is different) should be handled.
> >=20
> > What do you think about continue without dom0less support and discuss
> > dom0less once we done with the main part?
>=20
> That's OK, especially if you are happy to work on dom0less support
> later.

Sure I will be happy to work on dom0less support later.=

