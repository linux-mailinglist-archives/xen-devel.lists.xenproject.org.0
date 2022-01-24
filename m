Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653649883D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 19:23:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259956.448810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC3zk-0002AC-DD; Mon, 24 Jan 2022 18:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259956.448810; Mon, 24 Jan 2022 18:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC3zk-00027G-97; Mon, 24 Jan 2022 18:23:12 +0000
Received: by outflank-mailman (input) for mailman id 259956;
 Mon, 24 Jan 2022 18:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GIw=SI=epam.com=prvs=3023887433=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nC3zj-00027A-0Y
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 18:23:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac7e3981-7d42-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 19:23:07 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20OI8qBo023857;
 Mon, 24 Jan 2022 18:22:56 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dt14q026m-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:22:55 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB9PR03MB7387.eurprd03.prod.outlook.com (2603:10a6:10:221::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 18:22:51 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::711f:a15e:91c1:6d43]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::711f:a15e:91c1:6d43%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 18:22:50 +0000
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
X-Inumbo-ID: ac7e3981-7d42-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uf5v/pg8n22ClHXDoeyOsHhm1u59vLmt/2Vd92g+sKYU6GJQUny9D/5OsP8JYLbmkDVhQ54K0uvgvpPRsh+wxAPjpKKZSECr60C4bJIGS7xipehhCimPdEj+GEr3tpWXjbLBvVBjEHP7Qy6SSQNXfLwKm3FD44ICwfjE1vbj4Q4gdc/mt1yWc0S25Shk9Ml+WhaqxyTNoMFH5qg7pVHSjCYhcimmuw7w3rMx24BXEk9W6e+MKeEG8THcxUifueMy/tMNnQ/ixkHFLj8ayAUz2wLMhZpmvKMLqJ+eNue6irTVFqnt7GkYIUqbfqgaAXoi5+PiG6tMW0PThPpzzU0G0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PyF+bw4I7YzYJDGc0xgtMjzGKwHmkSNCfIzw1bTcMo=;
 b=TbsH/ZIXYAGqSswN7npOCMnAzUESMz6/GbJCIxJmjOGB6cpI+pXxbxYzpQbjX3ujF5EDL7iDca/zgICCNoikGN5nBBYqH78MMUDUr9g74Q2fUNMj0eZZ1BwZKqBtLGR0fKej2nSK9x7VqF+LGju7ZGWFoq5ZIGaXHEbWmI2ySQ1FBFugaJsGxVYt5vrU6+/Yl/3KZd6IQbouL4qxkJnsSRGTT+ASLHsipNbSokeQMD+0nULFBdJGhrj8J4QazjIxsKK19Kphk0QWS4V113Ed/HfjtNtWBxoaGBKV6Ys4xM8slJlsAWocgi6VdlDIRHkDPabw79yXns4nb6HP48DKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PyF+bw4I7YzYJDGc0xgtMjzGKwHmkSNCfIzw1bTcMo=;
 b=nosiOnv6bNqRe81tVVJDY+Vew9jkAqkunzTTbjoPswwKIAcbd3e71ch6Kw3AXQCheyXHWQ+6NHcIKXTFvT8FYRy/UEq1dXpuxgeeSY8smt2KyBlFMgOwJfYDM6HZuQ+oWKCWH4lRk80ysIDmx/x+HIBEG1D3fUJsIHjbCcMgvl1S+2RNB+G5jYu4YFaPgafawLktNI5i3LqC3TLhJqvyXd8jvVeamgncKpdzqomjOEPtRrmQJ7cur8LG5FiyY9yUv+AwsKCQJ6lIW9MT3nOFnW2BKR65D72UJIxWIwFCNIQQTFrwtErrnZpP14tAMJ4oO/mSzFfkRnTHG6N8bOiWsw==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgCsRKgCAAOC8gIAAlQqAgADLX4CAARblgIAAX5CAgASN5YA=
Date: Mon, 24 Jan 2022 18:22:50 +0000
Message-ID: <20220124182249.GA2485483@EPUAKYIW015D>
References: <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20220119120400.GA3779126@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop>
 <20220120102147.GA4153317@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop>
 <20220121150753.GA898010@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201211236060.27308@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2201211236060.27308@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c287590-8120-4a11-9e57-08d9df6687e4
x-ms-traffictypediagnostic: DB9PR03MB7387:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB9PR03MB7387F3489FAEC63A9AD1528BE35E9@DB9PR03MB7387.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 W7Acj7ljVizmf8+ZWXxp9q6nykl7gLmWS2OCMTWz6mTnArT9Lmy7u3+J5DCRYfeFvyZC3b09R0zn17zrVeujRRrTcPTDgA1GWMoU9XT4ExjvdZ6dqhUO5+ucme/NJFC82R3JnUS686lFJWKUy2ByrGCEBOAqYeCVU4Oab39lh6OL09hy6GjvsU8PJhlJYN+EaAXobr3qB+ASLRPR3SViUa1sLlzPowDseYsmYhIsuHXCYYAFce6mMKoXPsvKPHDj1z62gY/H2AGcYdZvnplQCvp90AkKTU3U0hZRBg4XQwsHDPxNkXuBQCAjVnUlEkH0ioauC636Wx71a485wCj4BppBFyOeUaqYbKmLSINjsJvp+MuKhb9ctnZw/N3/Odir/K96xxOcK/hS7zLNXabpdOL2YLvh28jNkFxg1hDDJHbB7JO4b3qumgHM3SHT3wQ22SzgJHQfsSg4IuyXRkh/CGHIBAnPdUEHtBvIqOzYsb6i1xvPNmDZBsDXl3xgQOveoH6Fp/yOt3BqRSwrdkIavL15ApmueA3RQEsmRWaOAyvqOVBQd/cJA1RBkJ9TSJHj4+09MS8QZO2noxYcjc6UehNUu7P95ZGu4yV3VhckNrxyvj3Q7xNawQEae1YkG/2sda6s1mvnRL0IEpAHRj9Y5/SFgo3R9XzuDRNii4Z2QbT4O6/lX9064cyEuHsy6P2ubBr/3IpM8iibba2JWrgN0jgMN4mc/WRP1HpCc/OT8xJAzjXxX0wHMzexCFxHeVfI9+qBC0Zcp1JBYqgtNKa6u4QEt5cTVFwV8MQ13m1otZ8Qa9Uk10hnPJ2qTLAtOSmMST5J7KqtvkUIeil5dyji0h/V5WAId3+wTDyNVAFuwCvBE9cenBR3z8y3b4PvalDe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(84040400005)(186003)(33716001)(71200400001)(508600001)(9686003)(26005)(54906003)(30864003)(6512007)(38070700005)(6506007)(966005)(8676002)(2906002)(91956017)(76116006)(5660300002)(4326008)(66446008)(66946007)(66476007)(66556008)(64756008)(33656002)(6916009)(38100700002)(316002)(86362001)(6486002)(8936002)(122000001)(83380400001)(1076003)(2004002)(21314003)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lK8zy4zoA36Ly7yU86QZDoCeoGVag3BCcrBzY4PuOnfQQ5n1FJA/XfRj3OnZ?=
 =?us-ascii?Q?UEaASbT3Fa/ZM9d9ON4tRtm8W4VkNc2glXuLYZUaQ6vLsd3H8zqaUe9vYmVt?=
 =?us-ascii?Q?i7X/ybWyCF57P2YMdK8BI+yfOEU3IokUNDTgzTiHmGewq/CTN0vFCjRZ0p43?=
 =?us-ascii?Q?N/bcTjacr4v+vsxpnyCDCAEoxD1XpI2YkRNr4vSNQ1W/p89K3OZFRf3rgCYZ?=
 =?us-ascii?Q?ugd/L+z0wCzX1BIAvEbmVXXHikmWvDYYffMOlnXvjGdi4tWm8IqaadP9224D?=
 =?us-ascii?Q?rLSPH9AFi7NrxWFI43MVz3JkdEEiK0rLDWKHQpfTQ3htQ/GspHYUqmtDrVi8?=
 =?us-ascii?Q?6KF7uDUSqd+5uOkQ3UCFO8hL3Yyr3x7oUzVi5+lN8aCsu/1ieAZSgZcsmOWW?=
 =?us-ascii?Q?IlU/ta+XSD+FNaAfuwrrllE6E3VudVE9KD4M7KE2uxVl5dip5ZMX5Pu5EqLa?=
 =?us-ascii?Q?GozJXoSLKtUQi4cVx4Aq4OBB8BbzHdYc/YQw1ilg2ZQyfQUI820I2W0pdXfh?=
 =?us-ascii?Q?7SeC/vEXnzkXidLm0WvTj14Q4DmPDd93bgv3pPhSAee4d6e83m11BOr25JVd?=
 =?us-ascii?Q?XdPxEemSWGEPrOTTcOoO0QJKr1DWB8mItjqmPVirFrCKPIIIJ4CvIrGpNWp+?=
 =?us-ascii?Q?nl+T+0jTy72qtjtseb3Tl50JjVmPMQOOORhTY1Qnsx9aR8WQjItobq8RfjEY?=
 =?us-ascii?Q?4gqbcFBKk2Mv/qYQbBojD9gL2Mv9yRb5tacVTjyrnQTMsurK29w5niwi3BZy?=
 =?us-ascii?Q?bt6VJS9SiDrTBUrOJrKi/dKdpz/dtletzChhiO2Nzf9fiyDaxGT4pkufEfbk?=
 =?us-ascii?Q?gIS15wvdTSg0wlT9HsedQfn1TUaY1NvVa9k2LXZsGU3eQ9snX8ozs+PJR7Ss?=
 =?us-ascii?Q?XKNGEEKHaaPNUDdJTDwmxfzi7o/rqvr9cLkTy1XGKJjJ9soTVuWzMc55whK9?=
 =?us-ascii?Q?E4xd5OpUx4rySCj7eo3lEYC8+MOUcO6Dw00CWgNXaav2Ib/t0AP2drqQIZyu?=
 =?us-ascii?Q?clb/Sa9mPqvIRCms0tjJHf8mD+9+YGELcGQeqMSoTMUDhvzF4swuPjK8TaIw?=
 =?us-ascii?Q?Xmt6Vndj+tz9S/NdMjcsBkY0RkbWGMYpIynaX9xoPzFH/VfCqlP/6SkXwxEY?=
 =?us-ascii?Q?u8SN3kTt2tPoyJJFb+upFm8qwPusJ7F0c/8hYzamCYJuU5179Q+woposuluT?=
 =?us-ascii?Q?fCR+7wBwVuASv4FY6fDGqHXDVjpd43dYPSGx1Gp2VA2gFedRsmZnEYIyGMqZ?=
 =?us-ascii?Q?N3K536EUA2i3+SmSKlOS9F63RL3Skj0EmblHL2dNxnBtOWZ3CMLK/R7nybnK?=
 =?us-ascii?Q?bc/UPcDIud2Y4y+sx9xCkyZXIWG1ODo43VIMfopkxDnji7koR1iUdEiLIbRP?=
 =?us-ascii?Q?MvQiI01TvecOyUJJjjDrPeB4vsNBe099GIAWX7BN8SXwY6QJ9YPC7wWelwqT?=
 =?us-ascii?Q?CFwsoGzQTYBu9I+sYM5S61xaeJRUYh80ontK10THHLZxWIdWfAEMGfawxM2C?=
 =?us-ascii?Q?5uQG5zeN6E9bqOHNSFBiLR555IfwxfwEW7b53OkBvuE8ZovhPRTwTRmbW7+x?=
 =?us-ascii?Q?YNTMIeVvcnw1J6AKZVi+Ip336TXHxG8sf3aaJ5DasRglMgqipxksxAEMzFo0?=
 =?us-ascii?Q?N+oo9cReLQkzEPn2fdDfSmCmpuqMW1CzRdmavxV3ptlC4PJ+SBxL4mbsHu4i?=
 =?us-ascii?Q?OVPxtXpUJ/LEKOk08uYEbzZZ1m0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <766BD1BFAACF63408721028DE7E3EB48@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c287590-8120-4a11-9e57-08d9df6687e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 18:22:50.8263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hruIemu9BRmXXfWd4ICOTAtTgWm8sAb4Kx/fTn/UGsNzoXXxs4+vID/jwTPgjegHufYkA6QvJuz+4K9Lx2Cr2Sn94rDfdvI9fVa/nmRDEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7387
X-Proofpoint-ORIG-GUID: _v-pQdUo7pf331yi8V-WOGk72GpYnVsj
X-Proofpoint-GUID: _v-pQdUo7pf331yi8V-WOGk72GpYnVsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240121

On Fri, Jan 21, 2022 at 12:49:55PM -0800, Stefano Stabellini wrote:
> On Fri, 21 Jan 2022, Oleksii Moisieiev wrote:
> > On Thu, Jan 20, 2022 at 02:29:41PM -0800, Stefano Stabellini wrote:
> > > On Thu, 20 Jan 2022, Oleksii Moisieiev wrote:
> > > > On Wed, Jan 19, 2022 at 05:28:21PM -0800, Stefano Stabellini wrote:
> > > > > On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> > > > > > On Wed, Dec 22, 2021 at 06:23:24PM -0800, Stefano Stabellini wr=
ote:
> > > > > > > On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellin=
i wrote:
> > > > > > > > > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > Hi Stefano,
> > > > > > > > > >
> > > > > > > > > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabe=
llini wrote:
> > > > > > > > > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > > > Hi Stefano,
> > > > > > > > > > > >
> > > > > > > > > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano S=
tabellini wrote:
> > > > > > > > > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > > > > > This is the implementation of SCI interface, ca=
lled SCMI-SMC driver,
> > > > > > > > > > > > > > which works as the mediator between XEN Domains=
 and Firmware (SCP, ATF etc).
> > > > > > > > > > > > > > This allows devices from the Domains to work wi=
th clocks, resets and
> > > > > > > > > > > > > > power-domains without access to CPG.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The following features are implemented:
> > > > > > > > > > > > > > - request SCMI channels from ATF and pass chann=
els to Domains;
> > > > > > > > > > > > > > - set device permissions for Domains based on t=
he Domain partial
> > > > > > > > > > > > > > device-tree. Devices with permissions are able =
to work with clocks,
> > > > > > > > > > > > > > resets and power-domains via SCMI;
> > > > > > > > > > > > > > - redirect scmi messages from Domains to ATF.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisi=
eiev@epam.com>
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > > > > > > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > > > > > > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > > > > > > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++=
++++++++++++++++++++++++
> > > > > > > > > > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > > > > > > > > > >  5 files changed, 809 insertions(+)
> > > > > > > > > > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > > > > > > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/ar=
m/Kconfig
> > > > > > > > > > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > > > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > > > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > > > > > > > > > >  	  support. It allows guests to control system=
 resourcess via one of
> > > > > > > > > > > > > >  	  SCI mediators implemented in XEN.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > >  endmenu
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >  menu "ARM errata workaround via the alternativ=
e framework"
> > > > > > > > > > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arc=
h/arm/sci/Kconfig
> > > > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > > > index 0000000000..9563067ddc
> > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > > > > > > > > > @@ -0,0 +1,10 @@
> > > > > > > > > > > > > > +config SCMI_SMC
> > > > > > > > > > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > > > > > > > > > +	default n
> > > > > > > > > > > > > > +	depends on SCI
> > > > > > > > > > > > > > +	---help---
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +	Enables mediator in XEN to pass SCMI requests=
 from Domains to ATF.
> > > > > > > > > > > > > > +	This feature allows drivers from Domains to w=
ork with System
> > > > > > > > > > > > > > +	Controllers (such as power,resets,clock etc.)=
. SCP is used as transport
> > > > > > > > > > > > > > +	for communication.
> > > > > > > > > > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/ar=
ch/arm/sci/Makefile
> > > > > > > > > > > > > > index 837dc7492b..67f2611872 100644
> > > > > > > > > > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > > > > > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > > > > > > > > > @@ -1 +1,2 @@
> > > > > > > > > > > > > >  obj-y +=3D sci.o
> > > > > > > > > > > > > > +obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
> > > > > > > > > > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/=
arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > > > index 0000000000..2eb01ea82d
> > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > > > @@ -0,0 +1,795 @@
> > > > > > > > > > > > > > +/*
> > > > > > > > > > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + * SCMI mediator driver, using SCP as transpor=
t.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.c=
om>
> > > > > > > > > > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + * This program is free software; you can redi=
stribute it and/or modify
> > > > > > > > > > > > > > + * it under the terms of the GNU General Publi=
c License as published by
> > > > > > > > > > > > > > + * the Free Software Foundation; either versio=
n 2 of the License, or
> > > > > > > > > > > > > > + * (at your option) any later version.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + * This program is distributed in the hope tha=
t it will be useful,
> > > > > > > > > > > > > > + * but WITHOUT ANY WARRANTY; without even the =
implied warranty of
> > > > > > > > > > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR=
 PURPOSE.  See the
> > > > > > > > > > > > > > + * GNU General Public License for more details=
.
> > > > > > > > > > > > > > + */
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +#include <asm/sci/sci.h>
> > > > > > > > > > > > > > +#include <asm/smccc.h>
> > > > > > > > > > > > > > +#include <asm/io.h>
> > > > > > > > > > > > > > +#include <xen/bitops.h>
> > > > > > > > > > > > > > +#include <xen/config.h>
> > > > > > > > > > > > > > +#include <xen/sched.h>
> > > > > > > > > > > > > > +#include <xen/device_tree.h>
> > > > > > > > > > > > > > +#include <xen/iocap.h>
> > > > > > > > > > > > > > +#include <xen/init.h>
> > > > > > > > > > > > > > +#include <xen/err.h>
> > > > > > > > > > > > > > +#include <xen/lib.h>
> > > > > > > > > > > > > > +#include <xen/list.h>
> > > > > > > > > > > > > > +#include <xen/mm.h>
> > > > > > > > > > > > > > +#include <xen/string.h>
> > > > > > > > > > > > > > +#include <xen/time.h>
> > > > > > > > > > > > > > +#include <xen/vmap.h>
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +#define SCMI_BASE_PROTOCOL                  0x=
10
> > > > > > > > > > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x=
1
> > > > > > > > > > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x=
9
> > > > > > > > > > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0x=
B
> > > > > > > > > > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x=
7
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +/* SCMI return codes. See section 4.1.4 of SCM=
I spec (DEN0056C) */
> > > > > > > > > > > > > > +#define SCMI_SUCCESS              0
> > > > > > > > > > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > > > > > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > > > > > > > > > +#define SCMI_DENIED             (-3)
> > > > > > > > > > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > > > > > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > > > > > > > > > +#define SCMI_BUSY               (-6)
> > > > > > > > > > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > > > > > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > > > > > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > > > > > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE(=
"arm,scmi-smc")
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +#define SCMI_SMC_ID                        "ar=
m,smc-id"
> > > > > > > > > > > > > > +#define SCMI_SHARED_MEMORY                 "li=
nux,scmi_mem"
> > > > > > > > > > > > >
> > > > > > > > > > > > > I could find the following SCMI binding in Linux,=
 which describes
> > > > > > > > > > > > > the arm,scmi-smc compatible and the arm,smc-id pr=
operty:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Documentation/devicetree/bindings/firmware/arm,sc=
mi.yaml
> > > > > > > > > > > > >
> > > > > > > > > > > > > However, linux,scmi_mem is not described. Aren't =
you supposed to read
> > > > > > > > > > > > > the "shmem" property instead? And the compatible =
string used for this
> > > > > > > > > > > > > seems to be "arm,scmi-shmem".
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > We use linux,scmi_mem node to reserve memory, neede=
d for all
> > > > > > > > > > > > channels:
> > > > > > > > > > > >
> > > > > > > > > > > > reserved-memory {
> > > > > > > > > > > >     /* reserved region for scmi channels*/
> > > > > > > > > > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > > > > > > > > > >         no-map;
> > > > > > > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > > > > > > > > > > >     };
> > > > > > > > > > > > };
> > > > > > > > > > > >
> > > > > > > > > > > > arm,scmi-shmem node used in shmem property defines =
only 1 page needed to
> > > > > > > > > > > > the current scmi channel:
> > > > > > > > > > > >
> > > > > > > > > > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > > > > > > > >     compatible =3D "arm,scmi-shmem";
> > > > > > > > > > > >     reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > > > > > };
> > > > > > > > > > > >
> > > > > > > > > > > > For each Domain reg points to unigue page from linu=
x,scmi_mem region,
> > > > > > > > > > > > assigned to this agent.
> > > > > > > > > > >
> > > > > > > > > > > If we were to use "linux,scmi_mem" we would have to i=
ntroduce it as a
> > > > > > > > > > > compatible string, not as a node name, and it would n=
eed to be described
> > > > > > > > > > > in Documentation/devicetree/bindings/firmware/arm,scm=
i.yaml.
> > > > > > > > > > >
> > > > > > > > > > > But from your description I don't think it is necessa=
ry. We can just use
> > > > > > > > > > > "arm,scmi-shmem" to describe all the required regions=
:
> > > > > > > > > > >
> > > > > > > > > > > reserved-memory {
> > > > > > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > > > >     };
> > > > > > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > > > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > > > > > >     };
> > > > > > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > > > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > > > > > >     };
> > > > > > > > > > >     ...
> > > > > > > > > > >
> > > > > > > > > > > In other words, if all the individual channel pages a=
re described as
> > > > > > > > > > > "arm,scmi-shmem", why do we also need a single larger=
 region as
> > > > > > > > > > > "linux,scmi_mem"?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > That was my first implementation. But I've met a proble=
m with
> > > > > > > > > > scmi driver in kernel. I don't remember the exact place=
, but I remember
> > > > > > > > > > there were some if, checking if memory weren't reserved=
.
> > > > > > > > > > That's why I ended up splitting nodes reserved memory r=
egion and actual
> > > > > > > > > > shmem page.
> > > > > > > > > > For linux,scmi_mem node I took format from /reserved-me=
mory/linux,lossy_decompress@54000000,
> > > > > > > > > > which has no compatible string and provides no-map prop=
erty.
> > > > > > > > > > linux,scmi_shmem node is needed to prevent xen from all=
ocating this
> > > > > > > > > > space for the domain.
> > > > > > > > > >
> > > > > > > > > > Very interesting question about should I introduce linu=
x,scmi_mem node
> > > > > > > > > > and scmi_devid property to the
> > > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yam=
l?
> > > > > > > > > > Those node and property are needed only for Xen and use=
less for
> > > > > > > > > > non-virtualized systems. I can add this node and proper=
ty description to
> > > > > > > > > > arm,scmi.yaml, but leave a note that this is Xen specif=
ic params.
> > > > > > > > > > What do you think about it?
> > > > > > > > >
> > > > > > > > > Reply below
> > > > > > > > >
> > > > > > > > > [...]
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > > In general we can't use properties that are not part =
of the device tree
> > > > > > > > > > > spec, either https://urldefense.com/v3/__https://www.=
devicetree.org/specifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1S=
oLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > > > > > > > > > https://urldefense.com/v3/__https://git.kernel.org/pu=
b/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bin=
dings__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrn=
mof2zmk7BnhXloYUaj$ [git[.]kernel[.]org]
> > > > > > > > > > >
> > > > > > > > > > > "linux,scmi_mem" is currently absent. Are you aware o=
f any upstreaming
> > > > > > > > > > > activities to get "linux,scmi_mem" upstream under
> > > > > > > > > > > Documentation/devicetree/bindings in Linux?
> > > > > > > > > > >
> > > > > > > > > > > If "linux,scmi_mem" is going upstream in Linux, then =
we could use it.
> > > > > > > > > > > Otherwise, first "linux,scmi_mem" needs to be added s=
omewhere under
> > > > > > > > > > > Documentation/devicetree/bindings (probably
> > > > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.y=
aml), then we can
> > > > > > > > > > > work on the Xen code that makes use of it.
> > > > > > > > > > >
> > > > > > > > > > > Does it make sense?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Yes I agree. I think linux,scmi_mem and scmi_devid shou=
ld be upstreamed.
> > > > > > > > > > I will add those properties to arm,scmi.yaml, mark them=
 as related to XEN and send patch.
> > > > > > > > >
> > > > > > > > > I didn't realize that linux,scmi_mem and scmi_devid are s=
upposed to be
> > > > > > > > > Xen specific. In general, it would be best not to introdu=
ce Xen specific
> > > > > > > > > properties into generic bindings. It is a problem both fr=
om a
> > > > > > > > > specification perspective (because it has hard to handle =
Xen specific
> > > > > > > > > cases in fully generic bindings, especially as those bind=
ings are
> > > > > > > > > maintained as part of the Linux kernel) and from a user p=
erspective
> > > > > > > > > (because now the user has to deal with a Xen-specific dtb=
, or has to
> > > > > > > > > modify the host dtb to add Xen-specific information by ha=
nd.)
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Let me start from scmi_devid.  Why would scmi_devid be Xe=
n-specific? It
> > > > > > > > > looks like a generic property that should be needed for t=
he Linux SCMI
> > > > > > > > > driver too. Why the Linux driver doesn't need it?
> > > > > > > > >
> > > > > > > >
> > > > > > > > scmi_devid used during domain build. It passed as input par=
ameter for SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> > > > > > > > On non-virtualized systems - there is no need of this call,=
 because OS
> > > > > > > > is the only one entity, running on the system.
> > > > > > >
> > > > > > > OK. Even if it is only required for virtualized systems, I th=
ink that
> > > > > > > scmi_devid is important enough that should be part of the ups=
tream
> > > > > > > binding. I think it is worth starting an email thread on the =
LKML with
> > > > > > > Rob Herring and the SCMI maintainers to discuss the addition =
of
> > > > > > > scmi_devid to the binding.
> > > > > > >
> > > > > > >
> > > > > > > > I've chatted with Volodymyr_Babchuk and he gave a great ide=
a to add a
> > > > > > > > list of device_ids to dom.cfg, such as:
> > > > > > > > sci_devs =3D [ 0, 1, 15, 35 ];
> > > > > > > >
> > > > > > > > Using this approach, we can remove scmi_devid from the devi=
ce tree and
> > > > > > > > just pass a list of scmi_devids to XEN using additional hyp=
ercall.
> > > > > > > > We can probably make hypercall taking devid list as input p=
arameter.
> > > > > > > > This will take only 1 hypercall to setup sci permissions.
> > > > > > >
> > > > > > > But how would a user know which are the right SCMI IDs to add=
 to the
> > > > > > > sci_devs list? Would the user have to go and read the referen=
ce manual
> > > > > > > of the platform to find the SCMI IDs and then write sci_devs =
by hand?
> > > > > > > If that is the case, then I think that it would be better to =
add
> > > > > > > scmi_devid to device tree.
> > > > > > >
> > > > > > > In general, I think this configuration should happen automati=
cally
> > > > > > > without user intervention. The user should just specify "enab=
le SCMI"
> > > > > > > and it should work.
> > > > > > >
> > > > > > >
> > > > > > > > > In regards to linux,scmi_mem, I think it would be best to=
 do without it
> > > > > > > > > and fix the Linux SCMI driver if we need to do so. Xen sh=
ould be able to
> > > > > > > > > parse the native "arm,scmi-shmem" nodes and Linux (dom0 o=
r domU) should
> > > > > > > > > be able to parse the "arm,scmi-shmem" nodes generated by =
Xen. Either
> > > > > > > > > way, I don't think we should need linux,scmi_mem.
> > > > > > > >
> > > > > > > > This requires further investigation. I will try to make imp=
lementation
> > > > > > > > without linux,scmi_mem, using only arm,scmi-shmem nodes and=
 share
> > > > > > > > reuslts with you.
> > > > > > >
> > > > > > > OK, thanks.
> > > > > >
> > > > > > Hi Stefano,
> > > > > >
> > > > > > As I did some investigation about using reserved-memory area
> > > > > > linux,scmi_mem and now I need your advice.
> > > > > >
> > > > > > I see 2 possible implementations for now:
> > > > > > 1) Add memory-region parameter to cpu_scp_shm node which points=
 to the
> > > > > > reserved memory region.
> > > > > > So device-tree will look like this:
> > > > > >
> > > > > > 	reserved-memory {
> > > > > > 		/* reserved region for scmi channels*/
> > > > > > 		scmi_memory: region@53FF0000{
> > > > > > 			no-map;
> > > > > > 			reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > > > > > 		};
> > > > > > 	};
> > > > > > 	cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > > 		compatible =3D "arm,scmi-shmem";
> > > > > > 		reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > 		memory-region =3D <&scmi_memory>;
> > > > > > 	};
> > > > > >
> > > > > > So cpu_scp_shm node has a reference to scmi_memory region. This=
 mean
> > > > > > that xen can find reserved memory region without adding additio=
nal names
> > > > > > to the device-tree bindings.
> > > > > > memory-region parameter as a reference to reserved memory and r=
egion
> > > > > > creation described in:
> > > > > > https://urldefense.com/v3/__https://github.com/torvalds/linux/b=
lob/v5.15/Documentation/devicetree/bindings/reserved-memory/reserved-memory=
.txt__;!!GF_29dbcQIUBPA!k6x19x1gYF1CPlgAZj7std3ifqhq-9DXvuF0nwonNPUwMzZpYHY=
brRJziJrgdFIOjyan$ [github[.]com]
> > > > > >
> > > > > > This approach I've implemented already and it works.
> > > > >
> > > > > This approach would require a discussion with the upstream device=
 tree
> > > > > maintainers. Likely, we would need to add a note about the usage =
of the
> > > > > "memory-region" property to arm,scmi.yaml.
> > > > >
> > > > > Also, I have the feeling that they would ask to add the "memory-r=
egion"
> > > > > property directly to the "arm,scmi-smc" node, as an alternative (=
or
> > > > > in addition) to the existing "shmem" property.
> > > > >
> > > > > That said, from my point of view this approach is also a viable o=
ption.
> > > > > I don't see any major problems.
> > > > >
> > > > > The main question (after reading everything else that you wrote b=
elow)
> > > > > is whether the "arm,scmi-smc" node in this case could be automati=
cally
> > > > > generated.
> > > > >
> > > >=20
> > > > arm,scmi-smc node can be generated in both cases. I think I'd leave=
 it
> > > > as backup in case if the second approach will not work.
> > > >=20
> > > > >
> > > > > > 2) The second approach is the format you suggested:
> > > > > > > > > > > reserved-memory {
> > > > > > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > > > >     };
> > > > > > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > > > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > > > > > >     };
> > > > > > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > > > > > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > > > > > >     };
> > > > > > > > > > >     ...
> > > > > >
> > > > > > This approach has an advantage that xen ARM_SCI driver do not k=
now about
> > > > > > how channels are placed in the reserved memory, but introduces =
some
> > > > > > disadvantages:
> > > > > > a) We provide extra 14 (in our case) arm,scmi-shmem nodes which=
 are not used
> > > > > > in the device-tree. In current implementation I have separate s=
cmi.dtsi
> > > > > > file which introduces scmi support for both XEN-based and
> > > > > > non-virtualized systems. Having 14 extra channels in the device=
-tree may
> > > > > > be confusing.
> > > > >
> > > > > I can see that while it would be ideal for Xen to see all 14+1 ch=
annels
> > > > > in device tree (on the host device tree), we wouldn't want to exp=
ose all
> > > > > of them to the domains, not even to dom0.
> > > > >
> > > > > How many channels do we want dom0 to see by the way? For this
> > > > > discussion, I'll just assume for now that dom0 only sees 1 channe=
l like
> > > > > the domUs.
> > > >=20
> > > > For dom0 we need only one channel.
> > > >=20
> > > > >
> > > > > Now we have a problem: how do we go about "filtering" the
> > > > > "arm,scmi-shmem" device tree nodes? Which is also what you are as=
king
> > > > > below in point b).
> > > > >
> > > >=20
> > > > Xen will not need to filter "arm,scmi-shmem" node. It will just
> > > > create shmem node in Domain device-tree. I don't see any problem fo=
r xen
> > > > configuration here.
> > > > What bothers me here is that I set scmi configuration for platform =
dts,
> > > > not for xen or domu dts files.
> > > > So for example I have the following structure of the dts files for =
my
> > > > platform (r8a77961-salvator-xs):
> > > >  * r8a77961-scmi.dtsi - this file includes all scmi related nodes a=
nd set
> > > > scmi_devid for the devices, that should use scmi.
> > > >  * r8a77961-salvator-xs.dts - dts file which generates dtb for the =
platform.
> > > > It includes r8a77961-scmi.dtsi so I populate scmi to platform dtb, =
which
> > > > is used for system with no hypervisor.
> > > >  * r8a77961-salvator-xs-xen.dts - dts file for xen which includes
> > > > r8a77961-salvator-xs.dts and inherits scmi configuration from it.
> > > >  * r8a77961-salvator-xs-domu.dts - dts file for DomU which includes
> > > > r8a77961-salvator-xs.dts and inherits scmi configuration from it.
> > > >=20
> > > > In this case r8a77961-salvator-xs.dtb r8a77961-salvator-xs-xen.dtb
> > > > r8a77961-salvator-xs-domu.dtb files will inherit 14+1 channel.
> > > >=20
> > > > I can give you a link to Merge request with this changes if you nee=
d it.
> > > >=20
> > > > For xen and domu dtb it is not a problem because all "arm,scmi-shme=
m"
> > > > nodes will be omitted and new will be generated for the domains.
> > > >=20
> > > > What bothers me is that r8a77961-salvator-xs.dtb will have 14 unuse=
d channels.
> > > >=20
> > > > Just got an idea while writing this: I can create only one
> > > > "arm,scmi-shmem" node in r8a77961-scmi.dtsi and add 14 more nodes,
> > > > needed for xen explicitly in r8a77961-salvator-xs-xen.dts.
> > > >=20
> > > > Then we will have valid configurations for all cases.
> > > > This can be a solution. What do you think?
> > >=20
> > > It is good that you brought this up because it helps me explain what =
I
> > > mean. And of course it is up to you where you place the nodes in the
> > > various dts files at your disposal. Either way it would work but I th=
ink
> > > they should belong to r8a77961-salvator-xs.dts.
> > >=20
> > > Generally the platform vendor (e.g. Xilinx) provides a device tree
> > > description of the platform to use including all the available resour=
ces
> > > and firmware interfaces. In your case it would be r8a77961-scmi.dtsi =
+
> > > r8a77961-salvator-xs.dts. This is what I call the "host device tree"
> > > below. Users should be able to boot a fully functional system using t=
he
> > > host device tree pretty much "as is" to run Xen, Linux or any other
> > > software.
> > >=20
> > > Certainly the SCMI device tree description should be part of the host
> > > device tree, so in your case it would be r8a77961-salvator-xs.dts. An=
d
> > > the description should include all 14+1 channels because this is the
> > > generic platform description -- we cannot know for sure how the users
> > > are going to use the system.
> > >=20
> > > This is why r8a77961-salvator-xs-xen.dts should be as small as possib=
le
> > > or ideally inexistent. There shouldn't be a need for a special device
> > > tree modification to allow Xen to run. In reality, even at Xilinx we
> > > have something like r8a77961-salvator-xs-xen.dts, although it is real=
ly
> > > small.
> > >=20
> > > But I see that r8a77961-salvator-xs-xen.dts could be viewed as the
> > > device tree additions to run hypervisors and from that point of view =
it
> > > is more acceptable to place the 14 channels there.
> > >=20
> > > The biggest problem is r8a77961-salvator-xs-domu.dts: who is going to
> > > write it? And how? It wouldn't be provided by the platform vendor, so=
 it
> > > is the user the one that has to find a way to write it.
> > >=20
> > > I know the user already has to write a partial DTB for device
> > > assignment, but any time the process is more complex than "copy the h=
ost
> > > device tree node for device XXX to the partial DTB" it is a problem.
> > > Errors are made and the system doesn't work.
> > >=20
> > > I think we don't want to make it even more difficult by having to
> > > manually produce the SCMI domU description too. The SCMI description =
for
> > > domU could be automatically generated by Xen, or libxl/xl. If that's =
an
> > > issue, then the SCMI description could be automatically generated by =
an
> > > external tool but I think it would make things more complex and harde=
r
> > > to maintain.
> > >=20
> > > In short my point of view is:
> > > - r8a77961-scmi.dtsi + r8a77961-salvator-xs.dts should be as generic =
as
> > >   possible so the SCMI nodes should have 14+1 channels
> > > - but putting the 14 channels in r8a77961-salvator-xs-xen.dts is stil=
l
> > >   OKish
> > > - it is important that r8a77961-salvator-xs-domu.dts is automatically
> > >   generated by Xen or libxl or another software tool
> > >=20
> >=20
> > Thank you for the detailed response. I'll put all 14+1 channels to
> > r8a77961-salvator-xs.dts then.
> > I've described my thoughts about generation of the arm,scmi-smc node be=
low.
> >=20
> > >=20
> > > > > > b) In case if we have all 15 channels, described in partial dev=
ice-tree,
> > > > >
> > > > > I think you meant "described in the host device tree", right?
> > > > >
> > > > Yeah that's what I've meant.
> > > > >
> > > > > > we should not copy any node to the domain device-tree. I think =
it will
> > > > > > be better to generate arm,scmi-shmem node in the Domain device-=
tree.
> > > > >
> > > > > Yes, I think it makes sense for Xen to generate the "arm,scmi-shm=
em"
> > > > > device tree description for the DomU/Dom0 based on the channels
> > > > > allocated to the domain.
> > > > >
> > > > >
> > > > > > The problem is that arm,scmi-smc node, which is using arm,scmi-=
shmem
> > > > > > node can't be generated. I prefer it to be copied from the part=
ial
> > > > > > device-tree because it includes some platform specific configur=
ation,
> > > > > > such as func-id and list of the protocols (for example differen=
t
> > > > > > platforms may require different list of the protocols). So in t=
his
> > > > > > case we will have 1 node copied and 1 node generated.
> > > > > >
> > > > > > I think even for dom0less we should use arm,scmi-smc node from =
the
> > > > > > device-tree because protocol configuration and funcid is relate=
d to the
> > > > > > platform.
> > > > >
> > > > > I am not sure I understood what you wrote. You are saying that th=
e
> > > > > "arm,scmi-smc" node includes some platform specific configuration=
s so
> > > > > it cannot be automatically generated by Xen (or by the tools) and
> > > > > instead it needs to be manually provided as part of the partial d=
tb for
> > > > > the domU. Is that correct?
> > > > >
> > > > > If so, I would like to understand the reasons behind it. Manual
> > > > > device tree editing is problematic.
> > > > >
> > > > > I looked for "func-id" in
> > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml but coul=
dn't
> > > > > find any results. Do you have an example of the platform specific
> > > > > configuration or protocol configuration that would make it diffic=
ult to
> > > > > automatically generate the "arm,scmi-smc" node for the domains?
> > > >=20
> > > > Sorry, I used wrong term (used term from the specification), arm,sm=
c-id
> > > > of cause.
> > > >=20
> > > > >
> > > > > Also, is this a problem just for approach #2 or also for approach=
 #1?
> > > > > If it is a problem only for approach #2, then let's just go with
> > > > > approach #1.
> > > > >
> > > >=20
> > > > We can't copy "arm,scmi-smc" in both approaches. The difference is =
that
> > > > in the first approach we can copy both "arm,scmi-smc" and
> > > > "arm,scmi-shmem" nodes while in the second approach we should copy
> > > > "arm,scmi-smc", but we have to generate "arm,scmi-shmem" node.
> > > >=20
> > > > arm,scmi-smc node can't be generated because it includes properties=
 and
> > > > configurations that depends from platform and should be get from th=
e
> > > > device tree.
> > > > Here is "arm,scmi-smc" node expample:
> > > > firmware {
> > > >     scmi {
> > > >         compatible =3D "arm,scmi-smc"
> > > >         arm,smc-id =3D <0x82000002>;
> > > >         shmem =3D <&cpu_scp_shm>;
> > > >         #address-cells =3D <1>;
> > > >         #size-cells =3D <0>;
> > > >         scmi_power: protocol@11 {
> > > >             reg =3D <0x11>;
> > > >             #power-domain-cells =3D <1>;
> > > >         };
> > > >=20
> > > >         scmi_clock: protocol@14 {
> > > >             ...
> > > >         };
> > > >=20
> > > >         scmi_reset: protocol@16 {
> > > >             ...
> > > >         };
> > > >         ...
> > > >     };
> > > > };
> > > >=20
> > > > It has 3 configurable options:
> > > >  * arm,smc-id parameter, setting func_id for scmi protocol. This id=
 can be
> > > > different for different platforms.
> > > > For example stm32mp1 architecture use different scm-id for differen=
t
> > > > agents:
> > > > https://urldefense.com/v3/__https://github.com/ARM-software/arm-tru=
sted-firmware/blob/0586c41b3f2d52aae847b7212e7b0c7e19197ea2/plat/st/stm32mp=
1/include/stm32mp1_smc.h*L39__;Iw!!GF_29dbcQIUBPA!mTRUjtSg19iVaYo3Cgjop5ckP=
WqKsHVo1EZCEA1zCbod9KpNSXX291A8vAuNdTCr46MA$ [github[.]com]
> > > >=20
> > > >  * shmem which includes phandle to arm,scmi-shmem node. But this is=
 not
> > > > a problem and can be updated.
> > > >=20
> > > >  * list of the protocol subnodes. This is also configurable paramet=
er,
> > > > not regs or names, but the number of the protocols. For example onl=
e
> > > > platform can use power-domains/clock/resets via scmi, when another =
will
> > > > require volage-control and sensor-management to be added.
> > > >=20
> > > > Xen should know this parameters to be able to generate "arm,scmi-sm=
c" node.
> > > >=20
> > > > Also we're currently discussing new scmi protocol with ARM: Pinctrl=
 over
> > > > SCMI.
> > > >=20
> > > > It should allow domains to access pinctrl subsystem, placed in Firm=
ware
> > > > through SCMI protocol.
> > > > scmi_pinctrl node will look like this:
> > > >=20
> > > > 	firmware {
> > > > 		scmi {
> > > > 			...
> > > > 			scmi_pinctrl: protocol@18 {
> > > > 				reg =3D <0x18>;
> > > > 				#pinctrl-cells =3D <0>;
> > > >=20
> > > > 				i2c2_pins: i2c2 {
> > > > 					groups =3D <74>; /* i2c2_a */
> > > > 					function =3D <15>; /* i2c2 */
> > > > 				};
> > > >=20
> > > > 				irq0_pins: irq0 {
> > > > 					groups =3D <81>; /* intc_ex_irq0 */
> > > > 					function =3D <19>; /* intc_ex */
> > > > 				};
> > > >=20
> > > > 				avb_pins: avb {
> > > > 					mux {
> > > > 						/* avb_link, avb_mdio, avb_mii */
> > > > 						groups =3D <17>, <21>, <22>;
> > > > 						function =3D <1>; /* avb */
> > > > 					};
> > > >=20
> > > > 					pins_mdio {
> > > > 						groups =3D <21>; /* avb_mdio */
> > > > 						drive-strength =3D <24>;
> > > > 					};
> > > >=20
> > > > 					pins_mii_tx {
> > > > 						/* PIN_AVB_TX_CTL, PIN_AVB_TXC, PIN_AVB_TD0,
> > > > 						       PIN_AVB_TD1, PIN_AVB_TD2, PIN_AVB_TD3 */
> > > > 						pins =3D <242>, <240>, <236>, <237>, <238>, <239>;
> > > > 						drive-strength =3D <12>;
> > > > 					};
> > > > 				};
> > > > 				...
> > > > 			};
> > > > 		};
> > > > 	};
> > > >=20
> > > > So "arm,scmi-smc" node will have even more platform specific settin=
gs.
> > > >=20
> > > > >
> > > > > > I prefer the second approach and will try to make it if it's OK=
 to copy
> > > > > > arm,scmi-smc node from partial Device-tree and generate arm,scm=
i-shmem
> > > > > > node.
> > > > > >
> > > > > > What do you think about that?
> > > > >
> > > > > From a device tree specification perspective, I think both approa=
ches
> > > > > are OK (with a minor comment on the first approach as I wrote abo=
ve.)
> > > > >
> > > > > But from a Xen perspective I think it is important that we don't =
require
> > > > > the user to manually provide the SCMI configuration in the partia=
l DTB.
> > > > > It would be better if we could generate it automatically from Xen=
 or the
> > > > > tools (or even an independent script). Or copy the "arm,scmi-smc"=
 node
> > > > > from the host device tree to the domU device tree without modific=
ations.
> > > >=20
> > > > I think copy "arm,scmi-smc" node is the only option we have.
> > > > I'm not sure what do you mean under "host device tree" if you mean =
Xen
> > > > device-tree - then I think it will not cover the case with stm32mp1=
 I've
> > > > mentioned above. I think it will be better to copy "arm,scmi-smc" n=
ode
> > > > from Domu partial Device-tree to Domu device-tree.
> > > > So AGENT0 smc-id will be set in xen device-tree and copied to dom0 =
and
> > > > AGENT1 scm-is set in domu device-tree and copied to dom-u.
> > > >=20
> > > > Do you agree with my points?
> > >=20
> > > I think we are saying similar things, but we are getting mixed up wit=
h
> > > the terminology. Let's start from the basics :-)
> > >=20
> > > # Host device tree
> > > The device tree given to Xen at boot time. This is the device tree th=
at
> > > Xen parses to discover what's available on the platform. In your case=
,
> > > it seems to include r8a77961-salvator-xs-xen.dts.
> > >=20
> > > # Partial DTB
> > > (Ignoring Dom0less) this is the small DTB that gets passed to xl with
> > > the "device_tree" option in the xl config file. It is copied verbatim
> > > to the domU device tree by xl/libxl.
> > >=20
> > > # Copy the "arm,scmi-smc" node from host device tree
> > > This means that the domU "arm,scmi-smc" node is an exact copy of the
> > > host device tree SCMI node. I don't think this is actually possible i=
n
> > > most cases because the domU description is typically a bit different
> > > from the host description. For instance, the host description could
> > > include 14+1 channels while the domU description should only include =
1
> > > channel.
> > >=20
> > > # Copy the "arm,scmi-smc" node from the partial DTB
> > > This implies that somebody or something create an "arm,scmi-smc" node
> > > for the domU and placed it into the partial DTB. Then, Xen and/or
> > > xl/libxl will copy the node from the partial DTB to the DomU device
> > > tree. The main question in this case is: who is going to write the
> > > partial DTB? We dont want the user (i.e. a person) to have to manuall=
y
> > > write the SCMI description for the domU. It should be an automated to=
ols
> > > that does it. At that point, it is easier if it is Xen or xl/libxl.
> > > Alternativaly, we could think of an external tool but I think it woul=
d
> > > make things more difficult to maintain.
> > >=20
> > > # Generate the "arm,scmi-smc" node for domUs
> > > When I write "generate the arm,scmi-smc node", I mean that Xen and
> > > libxl/xl will generate the "arm,scmi-smc" node for the domU. Thus, th=
e
> > > node will not be copied from the partial DTB or from the device tree,
> > > instead, it should be created directly by Xen and/or libxl/xl.
> > >=20
> > > However, the domU "arm,scmi-smc" node could still be derived from the
> > > host device tree "arm,scmi-smc" node. In other words, Xen or xl/libxl
> > > would look at the host device tree "arm,scmi-smc" node, copy it to th=
e
> > > domU device tree while making as many changes as necessary.
> > >=20
> > > The DomU "arm,scmi-smc" node doesn't have to be entirely fake and
> > > static. It could be dynamically created to match the host device tree
> > > description. I think this is the best option.
> > >=20
> > >=20
> > > # Conclusion
> > > I am suggesting that Xen and/or libxl automatically produce the
> > > "arm,scmi-smc" node for domUs based on the host device tree descripti=
on
> > > and based on the channel mapped to the domU. This way, the user (a
> > > person) doesn't have to go and manually edit the domU partial DTB.
> > >=20
> >=20
> > That sounds reasonable. The problem is that arm,scmi-smc node can be
> > copmlicated and include a lot of configuration. Also for different
> > mediators this node can be different.
> > As I inderstand, there is no mechanism for xl to access host device-tre=
e
> > right now. Correct me if I'm wrong.
>=20
> Yes, you are right. And the lack of a mechanism for xl to access the
> host device tree is a problem.
>=20
>=20
> > I see the following way we can generate arm,scmi-smc node for DomU:
> > We say that if scmi-smc mediator is enabled - then Dom0 is configured t=
o
> > use SCMI. This means that Dom0 device-tree will have arm,scmi-smc node
> > and it can be reached from the userspace.
>=20
> So far so good
>=20
>=20
> > In this case xl can use infromation from /proc/device-tree/firmware/scm=
i
> > to generate arm,scmi-smc node for DomU. But in this case xl should know
> > the exact path of scmi node.
> >=20
> > Or we can generate some special node, called "shared" in Dom0 device-tr=
ee
> > which will include copy of the arm,scmi-smc node, which can be used for=
 domains.
> > In this case xl can scan /proc/device-tree/shared node and find
> > arm,scmi-smc copatible node and use it to generate arm,scmi-smc node fo=
r
> > DomU.
> > Also this can be used for another features in future.
> >=20
> > What do you think about this?
>=20
> Basing the domU SCMI node generation on the dom0 SCMI node is not great,
> because it should be based on the host device tree rather than dom0 and
> the dom0 SCMI description will be different.
>=20
> Instead of copying just the host SCMI node somewhere in the dom0 device
> tree so that xl/libxl can access it via /proc/device-tree, I think it
> would be better to make the full host DTB available to xl/libxl.
>=20
> There are probably many ways to do this, but there are a couple I can
> think of on top of my head:
>=20
> - introduce a new hypercall to get the full host dtb from Xen
> The hypercall would pass an address and a size in guest physical memory
> and Xen would copy the host DTB to it.
>=20
> - introduce something like /proc/device-tree to hypfs
> See xen/common/hypfs.c


Hi Stefano,

I've found the discussion, indirectly related to our topic [1], in which
hypervisor <-> toolchain interface topic was raised.

Where Andrii Anisov proposed to introduce another libxl type (f.e. File) wh=
ich
will read device tree file and operate with a binary blob.

His idea is to introduce new Domctl hypecall, which is able to send device-=
tree
blob from toolstack to the hypervisor.
I was thinking about using his approach, but in opposite direction.
Such as introduce a set of DOMCTL, which gives ability for xl user to reque=
st
Host Device-tree nodes.
I see something like that:
XEN_DOMCTL_host_node_by_path - gets node path as input and returns blob wit=
h node;
XEN_DOMCTL_find_host_compatible_node - gets compatible string and "skip" nu=
mber
for the case if there is more than 1 compatible node and returns blob with =
node.

Advandages for my sight are:
- I hope Andrii still has some code, which can be reused during the impleme=
ntation;
- Xen can determine if the requesting node can be exposed to the guest, whi=
ch
is additional layer of validation;
- no need to transfer all device-tree to the toolstack.

As for the hypfs this sounds like a separate feature to me. I'm not sure if=
 we
need to provide the entire copy of the device-tree. Also there could be som=
e
problems with this solution.
For example, xl tool have to scan whole hypfs tree to find node by phandle =
or
by compatible string.

Looking forward for your thoughts about that. Also I would be happy if Juli=
en
could share his vision.

[1] https://xen.markmail.org/search/?q=3Dfrom%3AAndrii+Anisov+device-tree#q=
uery:from%3AAndrii%20Anisov%20device-tree+page:2+mid:tvgyp7fzpiyyso3j+state=
:results

Oleksii


