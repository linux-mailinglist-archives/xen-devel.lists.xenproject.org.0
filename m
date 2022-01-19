Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3B493A07
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 13:04:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258814.446167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA9hJ-0000wO-4u; Wed, 19 Jan 2022 12:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258814.446167; Wed, 19 Jan 2022 12:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA9hI-0000uT-VM; Wed, 19 Jan 2022 12:04:16 +0000
Received: by outflank-mailman (input) for mailman id 258814;
 Wed, 19 Jan 2022 12:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAwr=SD=epam.com=prvs=30181e5aeb=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nA9hH-0000uF-4P
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 12:04:15 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8f08e9c-791f-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 13:04:11 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20JBrLdN029653;
 Wed, 19 Jan 2022 12:04:06 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dpe4grxwb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 12:04:06 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7200.eurprd03.prod.outlook.com (2603:10a6:102:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 12:04:02 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 12:04:02 +0000
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
X-Inumbo-ID: e8f08e9c-791f-11ec-9bbc-9dff3e4ee8c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOFVdQlbA5vwQBc06qLhD4oNlX3VYmw9EDp+VpykRVtoqEGfaLL/X6wHQryBchaUhTTO49CMCUrfhFjpyA4++887JexGaYA8tkDttKgSYqgcTKl8mIWJW81OiMXSaFRPjLF5QL/s1hI3s9Mqt4JH5Gqo7Qkxxf8NVsEXRWVmjWLKQS0Z4WYtlRw2u9LY1FuFpXfvPlsCwS3l4w2E1iEYFTUZixCjpx3oX43gUFPzcC0WKS+sxi8xLHqKtrCdy7eZJUqW5s4XKrOIrG6rHav1tzDEbf4Vweu8UvF5yUNWHJHsJQogOqSNHB3/pK0pnY4eVJS8fOI+L8FsKbMclGdG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XuaHi1boNJTDz8+F86As4AaBFPlt73xVG1JuUX7TdE=;
 b=nayS+0o2/eOObcDPtCHF37pZQ/TUe39+rerSZxPFKapP0sN+YNnIkwKoKV9NjFyKjYHRJ2WaeKihPOyYvzC9YuOwHD8Uo4I8kshHXJ+ISvfpR3fiWYXBT77Uoq0ZmFlmR8DoYWvXVT89CXjwrb77zC+iDQCvjG3lBucwlS4HA816VPwPt0tRfQLIW0PzfErhCvbOHDnYEoaqXtfICBszznd2QI3tihDCMq9LzhHUj1Cea7zMD/0OAY6ppqiQ7U5s01b5rOwyWMnQ06CRU06zssFEJhM2KUyrJoGFaoFB8IsXKBUAMInlbKC6tti1+vVlWrdF22wxCIaJLCOxgFIIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XuaHi1boNJTDz8+F86As4AaBFPlt73xVG1JuUX7TdE=;
 b=I+ImqF3g8f/Isc3Jsstb380Hyt/TygZkjjg25eLeIJCpniz/nMTZ+hid9VHPvLkpBWckr5MUvrmYabFvcflawTIval4c44cyC6R8G3E6DwBK/Fp4RGXpJpZiSLxthsjNJWxbHFs5CGksUVhzW2dvuT+YmeWt3dMTRmgtfxnH2CISjNhWnpIFtv8KjLNeO/+BFZKCjK54EO6GtFH76p5gnQdmXE8Rwp1IFR3XmD1LeHtxef0JwsaS5yDPwTHkzeew49fxjQn4AP+gbWsQ0MAbtgg3BmuQxQOgiuEh71QKWV/4Cenre6MRIZFc05QKJqWmWidba6UKRDKs6hE1c2gXdQ==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgCsRKgA=
Date: Wed, 19 Jan 2022 12:04:01 +0000
Message-ID: <20220119120400.GA3779126@EPUAKYIW015D>
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
x-ms-office365-filtering-correlation-id: b3a59415-1162-4e3b-b784-08d9db43c871
x-ms-traffictypediagnostic: PA4PR03MB7200:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB72009BA9D5E1B71F438A69D5E3599@PA4PR03MB7200.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Lw5s6wEPUub/G7B5FHO7t/CCw8jl6q/Dgua+82/q5jgDrEA8zHubveOEuGmNnl7ywnU5Ar4aButZiXyW92r2m+kYT2m3Kwg/oyOy5Jo+vQJoEE+IKU/72z4r2iTl+O95O7nXhds4+uW4imvav6pMIHUT5BJgU7n+dL9GgHpJqF2udKl4MCzkjmrkaD96L+R5FmFWgWdLKDe5dpJ38pILC5EBrJyeMvCyUs6ahZlGP4qxFXu102Nhbh7f/z6PimIiKSipS7JsKxoZtIVaWoyGMY5dOqQy3WmFFFfiAFPiXkDaQ0Em45Y7XLlTBve5GiLTCs4b86zTXDKPt5WI9OPet8cW4e2O3Gms/OyUaGmRHk9PLaO5WrynDnDDbXsv4fnNIuYz2mQ2v8Zz3ffa5b4ykHULRjVzx8BQlnL6OIdatfqNHrnJHsSK7wIsDAWe+C7OKbWF86oGWqTlRM1Xxg+smaAVWqIGzHe8NZUK95rxIjV6Z/VAWRXYCF1eCUyKReXBjiJcnfYSEeO4i2jyLohMrN64E0zKhXfaakjxsdys7a9dUCkytkYqhO/nIyyVJdmpXFySilI7XoAUo5uQaamEtzEg3+1qf6BWYUbvDtXmpUB73xbDZhi4Y1fxN7sf2j2dVPXYyDmum8MC+jwiZo/vRpMjZvzB4QMOhdkodjCdGSTDxw3JY5bG3Xd+5oDop9Cc9S9WRsZ4t/sxVijQ15z532Sf7A+zM6Jtu+/GP3nqVwWHyq0hRv+MyQRVrRwMUdLgnhYvGfr6mIRydW8kEWP/XT+qwje4Erw9dC+/OKHgEyHV0IJpWj09bxl1PNqEDf00
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(84040400005)(8676002)(6486002)(66946007)(71200400001)(64756008)(66446008)(66476007)(66556008)(8936002)(91956017)(76116006)(1076003)(2906002)(5660300002)(4326008)(33656002)(186003)(316002)(6512007)(9686003)(30864003)(54906003)(33716001)(86362001)(26005)(38070700005)(122000001)(508600001)(6916009)(966005)(38100700002)(6506007)(83380400001)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AvQhS9BkyzFF2rjSSg5AHfWSzpp5Ue/yTagC+UFPf+lpXg95ek7HfE7YYYxl?=
 =?us-ascii?Q?C5JeZkm0BenvfWTg2kvvp5YutzB8XuZNltR7SQ6Wq//bMs6mBs5z/4A1mQ1F?=
 =?us-ascii?Q?vPSPBVGWj8jnO7HzQoDNq588NulNJUPdzh+Qs6OhrC0tQuvIi63JS/t8w7wN?=
 =?us-ascii?Q?jQfR63hBN+JcQI4u7pQuq/mC9nGIpKtGltNLIijJWz5LlB2iXoc5XggDsJco?=
 =?us-ascii?Q?E5hkhJcckmHYh6jLZmJq+0BDdA26gjj/TwwObRSnlKiPHi9XlSGUAPyBjbZq?=
 =?us-ascii?Q?Xsd9actPr7GAOgJUS5SVdGMMpoG++zbyr2+d1QlTwBONUDc5JFacrI0E0VOn?=
 =?us-ascii?Q?lbGIYWCstbw5TYMnTrEKhTeIG7oZxkeJd+5AUcCelFmIkHYOx454k5c6YjCf?=
 =?us-ascii?Q?+Fz54uMYO/aytRlQVGZ2wUiogPKuRyIG4hkRjCd8ceMmB73L1zN9YN5jceDY?=
 =?us-ascii?Q?6MNBqssnw0HsHUiOURcnhbmOZrF8M8g0GwKwSBF2IO+IUP0Wrnu5xouFrSo9?=
 =?us-ascii?Q?I64+siEkJbtEUXF6SgeqCHnaNI87C5AAbQhe/GJdW6fHrSObQWRDkZ6d1uak?=
 =?us-ascii?Q?EZ28GIbdDmbaw57gbQuBib0sFKZ2Fip2TlCVUdRbLGjQtO+GbbG3BUKicwDz?=
 =?us-ascii?Q?CuioQWNVVJCvyv1cLhneZvfxMz5YPGaUk+qCNhoX5xZVFKpt23mImMke+my+?=
 =?us-ascii?Q?bLYpkIZC1OlFHF67P9izbUOo50uD2Z7mUUSfg5N0/QCdYhLSR5lhkpknMvzT?=
 =?us-ascii?Q?QwzQua7mn11G+31mOcVuLPikYfTENuVW8B/Cuza0S/8PgFI3ecpQMAc/Mrlm?=
 =?us-ascii?Q?54AeE8bHzWjBXf9+ZZdyXhHuu/oJET4DrOxtPLSmbMHlTl81k5GF8mXSCSnd?=
 =?us-ascii?Q?rY29YEeKG1SJ5DznZTgVLEvAK0CZLrpxpQ1w3TmVYXj02pmYcX3BVC/tShnf?=
 =?us-ascii?Q?DoVkcqBc53W1fmvFygqxPQ6B7wKEpAdSdgzKfgkfZsZWTG3vkOAtrORwHjSW?=
 =?us-ascii?Q?FzO7Fz/U5WsBSXEi0pBzDCnPv4Jm+l8bfnUMKl7pf1PMh8tsKfGGTrkVzNTM?=
 =?us-ascii?Q?LVP14al1NfIs0LdoUyw2bP/AGaEepd+1UJaCbiH6lkv8EWxVZBeJE9+/9Ihs?=
 =?us-ascii?Q?6MBCfHAIDBZNqUv+9z72/kEj21z66YngEZLGF5WT5IcHTFp0SoCYUZ5qc+vk?=
 =?us-ascii?Q?WVjEXoXcbL33V+GpONXjKT/G+RYafmnPz/vU6gN/7vTZtbpOWfL22KvT5FJ7?=
 =?us-ascii?Q?OsUV193f9YcJGPSdYhsb4ko3aksw0A1ego39Eblt9TloGKW5+5AMS/jfGST5?=
 =?us-ascii?Q?VKwbuvS/PENmlU/a5tr8MdMuH00fzveM7nNBKIq9JfrfKa1aZiOdzg1XkjOq?=
 =?us-ascii?Q?u+jmqbc1p7CYkm7YBeL/SriXD6gl7AV+OEPVA50b+78icE10DtQ8vwCbwYNA?=
 =?us-ascii?Q?3ddcZ7QX1/xuxlcosWA9KSWSTTLE46qo7HpP381TWIWPiB+KNw0k9lqgfHPe?=
 =?us-ascii?Q?v+OQ+UVavmJ7+tbPW+TJO7k2fwCpUQVyF/nuZNQuHacabHFd9MRzsB7oPod0?=
 =?us-ascii?Q?cxm0z2Ksl6yX5F3D0cwS2T+x/ElX3a4Rx/fMhuFMeO0otlTHc3pO7K4yEmui?=
 =?us-ascii?Q?xFZUJSG4NObPfjCXlCEYkGRsQ62y/JfYUGN+FlwvF7N6oco8FWo6h40+isJk?=
 =?us-ascii?Q?6uzr+7YR5z0wUKah2lJvaxDPuAM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60116B4AD751DB4FB934386D5C544C7F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a59415-1162-4e3b-b784-08d9db43c871
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 12:04:02.0886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5By454Kdp9jBBudbXUODm5/5Ve5vQj6fUD+mOTOp9T0gmeqSRMILw3YLdgMqoTdUGhiynos6/IIB2T20RQYqvrLdn4DmAEc5YhQIHHalDTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7200
X-Proofpoint-GUID: t2vGQbv43QaPcbF-24VTDr45RM6NctK4
X-Proofpoint-ORIG-GUID: t2vGQbv43QaPcbF-24VTDr45RM6NctK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_07,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190070

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

Hi Stefano,

As I did some investigation about using reserved-memory area
linux,scmi_mem and now I need your advice.

I see 2 possible implementations for now:
1) Add memory-region parameter to cpu_scp_shm node which points to the
reserved memory region.
So device-tree will look like this:

	reserved-memory {
		/* reserved region for scmi channels*/
		scmi_memory: region@53FF0000{
			no-map;
			reg =3D <0x0 0x53FF0000 0x0 0x10000>;
		};
	};
	cpu_scp_shm: scp-shmem@0x53FF0000 {
		compatible =3D "arm,scmi-shmem";
		reg =3D <0x0 0x53FF0000 0x0 0x1000>;
		memory-region =3D <&scmi_memory>;
	};

So cpu_scp_shm node has a reference to scmi_memory region. This mean
that xen can find reserved memory region without adding additional names
to the device-tree bindings.
memory-region parameter as a reference to reserved memory and region
creation described in:
https://github.com/torvalds/linux/blob/v5.15/Documentation/devicetree/bindi=
ngs/reserved-memory/reserved-memory.txt

This approach I've implemented already and it works.

2) The second approach is the format you suggested:
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

This approach has an advantage that xen ARM_SCI driver do not know about
how channels are placed in the reserved memory, but introduces some
disadvantages:
a) We provide extra 14 (in our case) arm,scmi-shmem nodes which are not use=
d
in the device-tree. In current implementation I have separate scmi.dtsi
file which introduces scmi support for both XEN-based and
non-virtualized systems. Having 14 extra channels in the device-tree may
be confusing.
b) In case if we have all 15 channels, described in partial device-tree,
we should not copy any node to the domain device-tree. I think it will
be better to generate arm,scmi-shmem node in the Domain device-tree. The
problem is that arm,scmi-smc node, which is using arm,scmi-shmem node
can't be generated. I prefer it to be copied from the partial
device-tree because it includes some platform specific configuration,
such as func-id and list of the protocols (for example different
platforms may require different list of the protocols). So in this case
we will have 1 node copied and 1 node generated.

I think even for dom0less we should use arm,scmi-smc node from the
device-tree because protocol configuration and funcid is related to the
platform.

I prefer the second approach and will try to make it if it's OK to copy
arm,scmi-smc node from partial Device-tree and generate arm,scmi-shmem
node.

What do you think about that?

Also I wanted to mention that I'm not planning to make ARM_SCI support for
dom0less in terms of this patch series bacause I can't test
dom0less configuration for now. So let me know if some of my
functionality breaks dom0less.
--
Best regards
Oleksii.

