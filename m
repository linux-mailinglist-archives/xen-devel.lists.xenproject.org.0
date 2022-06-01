Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C361D53A01D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340365.565384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKPn-00033Q-M4; Wed, 01 Jun 2022 09:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340365.565384; Wed, 01 Jun 2022 09:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKPn-00030L-Ir; Wed, 01 Jun 2022 09:13:19 +0000
Received: by outflank-mailman (input) for mailman id 340365;
 Wed, 01 Jun 2022 09:13:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdo/=WI=epam.com=prvs=8151ed00d6=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nwKPm-00030F-V8
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:13:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12831bcd-e18b-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 11:13:17 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2517Vmv6008682;
 Wed, 1 Jun 2022 09:13:16 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ge3t88c3e-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jun 2022 09:13:16 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DBBPR03MB5302.eurprd03.prod.outlook.com (2603:10a6:10:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 09:13:12 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::31b5:dfd5:2d38:c0b2]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::31b5:dfd5:2d38:c0b2%9]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 09:13:12 +0000
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
X-Inumbo-ID: 12831bcd-e18b-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5Awx9AZjco4DNey7vFy6j9S+rNY38kqGvWH+Mqz32lERtpzMHp0y1fDxAFOGnnAup+6G83kHn198iqcjALd4jqSGa7Aw3LEpIxt8ZUmyt0thHPdKsru7PWwSeEiDEwC+ZXBLk3KhqvkXuXD1Yl+zP05xDNvBWzP5z/FjufRkLAaUWT1kpGMx3pPUkYzjD0Iew36PxB4iU6mxcce1ijG8kyUexlyiqSWzik57NBG68PfViRrVcHXxwri/LRYX/DI7BohDUQ8ZcYd0SBhb9XCqnsjaCJvBaYgcQN+MEHqteF4wyWkfPCueoeErGhlhaA6JoKneeOxFEcqUe23UoYpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM5znaz24psi/QNH8B9NFjCmzETA9Q7J4ovVk/VtDI4=;
 b=KU03Pdepq0jf6RzCCjnefUolHE5sqKX7x4KCH2qdj/BM39J74iSOGExI1MVkWeABtT5Bm9ampjuYnueGh0XVBeCyfPJiIRi1GVkObFiWL2J3QYlEs9XuV6DX6M6LxFrh/m0nVLzxyrZANeFH9Eci9mfAKU+5y95Q0Cnn2bnWwYWAa0P6Ym9dU/QMvXOd4FpMSgGKcJ+G6zhqaVz9f/18J9ngSZP/Vj9GEma9MWQgFfqSrQnNGp4SIFuqQpxMwGFx2ES+v/8nL+kGw9heoMxCS1bo6MqStwd8oOYOSrlM78uGNufpy3yu7TpwkYOmgbT1+Rg5/yL7NGt/8W+hHXh/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM5znaz24psi/QNH8B9NFjCmzETA9Q7J4ovVk/VtDI4=;
 b=Uj0exxxsA8fSNp9UqEHgCesis2/yJK9Dg9H4+9IGVn8gcVPDkUXdASr/8K6d+Git0NR+65lQ+R8O+cNM79cSCT1/mUK7y12Vp2dKOYco2k8MrpHbipnYTkiQakC1ZRny7EflQY+3xnq/DB8jLC0RZDKv/eeaAdSUlczezZgtUJOCnFwANLYYAxrFQNds/KEpDtE6GQXu0zcKktPCB45bccp716uAgyAwIFmqIg21HfBjcKGOYT8mjiJExr22oI8Yaj+6c6lNBeZE5VyplL7q5qnY7Yh+33rfq2dijrXsWjuju+bI+6mHWNUqMK7NbT52PQmO4Y86jN+oxiEjdd6bhw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Peng Fan <peng.fan@nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Topic: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Index: AQHYdDjfc3Z/1SeAUE+eDUzXC1OEPa06Mh/QgAAVEIA=
Date: Wed, 1 Jun 2022 09:13:12 +0000
Message-ID: <20220601091311.GA3658954@EPUAKYIW015D>
References: <20220530152102.GA883104@EPUAKYIW015D>
 <DU0PR04MB94175823AAA60802503F802588DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: 
 <DU0PR04MB94175823AAA60802503F802588DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46f14f39-9764-4b7e-264d-08da43aef435
x-ms-traffictypediagnostic: DBBPR03MB5302:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DBBPR03MB530238A6BED1C368C6ADBE83E3DF9@DBBPR03MB5302.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rmR8D9DanMMJjlxnvtVAHmaR67ko9NPSIAIcoJonY0nk2CnU2A0GBEr8I31uQZNXNUunV23CauZjZbqa7OhDKqB6omkHWrEf7TDC4e4OkUmrirF2xxjOa5zfkjUBR7z4U/uU3ry8SxSdgXdhBRXck+7jCzdxAtCEEEIREU0sVu9EmeUilRRqnMsKM9Sd+bkQ7cIH2UZ7i64q36uS0bfqRtTHSGOlaz9rsnQ4fXIJEbKF6r/OdEh9/sKLfti0bWqZOUMdz/dLtU+aUD6AHgWEKD1++3G35v4c5NgS0ji9TgyrV9Qy/3qW4BnrpJC9D9044QOpSZDndovODYODcCAkhYuLoKisOVgTrmgMHzmmz0svzktrfiKVNVoI36p8QtH8mHs9INMImTLL1y3+lty04C+vXMHaItvLp5qnzrjtU2k6OXCbWWD8thGThvJnbVVqFvk9smGjj2UuiriZdMPj4zx43A9fS+SPZVRtgbYTH1jfu559QZw16riNfnVamvbAl+pZVp3v8+3lDbJ7Ynt7Uaoc8CBQBhbnoqcs8t83WsXPdz28ysewux6KZkcpQ8E0gIPpmuZBrKwgBAwzGT+2Y76wpWYdgadgHiAkqcm16nxZzF0soYtLC2xVIpFcojJBD72jM3mr5eoP9u9/auDgfdcDjyK961gYW0WjhV0/x2AjvoqIEB11DG4bqAKVo4XvMUoV8g2NK2uHhXC645i1ropMYtbQ76PrpyXv6faDWvGzdj6qdgW8be3SfDIo5yR6NLumj1cgXSGCCBeKcLNgBl++4FJqVOxFdtOmIAW2oMk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(122000001)(5660300002)(71200400001)(508600001)(38100700002)(316002)(38070700005)(33656002)(6506007)(8936002)(91956017)(86362001)(9686003)(26005)(6512007)(33716001)(6916009)(54906003)(6486002)(966005)(45080400002)(2906002)(66556008)(8676002)(76116006)(1076003)(66946007)(66446008)(66476007)(64756008)(186003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7vvAkLZtZtFdLdf5LNyYwNVT4HD6k8NlHY6SZYsv7LGY4YFF5iQ4FHzawb/V?=
 =?us-ascii?Q?3FjxY6htCyrdeDQsPCek0b8Wjj8Pu8RQnAHfCxnwOYRqhHWgp3c/cKgS7e6L?=
 =?us-ascii?Q?M4ozhyPSW59QDvTvz1g86KcHLiWu/TWqgd66QIvxKg5KV7v0W9cFHqEp9h8p?=
 =?us-ascii?Q?8fA7erGL5ntZqryFtUpDUtkwHTVLpxDXUzhRkSe0phzIcK9IgogNIb/+9G3n?=
 =?us-ascii?Q?IRS6+EoUkV8egf80POVdx781kEPLBxYyN8+f+/3hUqjMO7T6bzZFhWlQeSMi?=
 =?us-ascii?Q?sDZhqPIZZwxjOwSx8kxJGzpai9Q9miCPfz7c2FHWpHBL4Uex5bq8WEqp6vNw?=
 =?us-ascii?Q?dm3spUwFrMyV0YC+vFhXibSiQvuIPiglC5d00jTkAcAwO6EtMmpRDWrskdQn?=
 =?us-ascii?Q?763HfMGx5rfz2Akfo1xXQ8y9uBecbSWzFsdhLrC4+W0CHV66cyHONRremGwX?=
 =?us-ascii?Q?NHsnzro4vAiBY+QLxhOpywK+ZZ47AG3XUSscVeKEeKrBpHpQKtmGtmZUxjaR?=
 =?us-ascii?Q?t+cPwLAp1Hu0EnvwBhfDCY+716CJyK1wJMugzfPuT/YZ4NwEnemOWEQ36vgf?=
 =?us-ascii?Q?F7vX2Phy/LIo+T9Ym2jy4gr+CLR6dGX+z0ucG1mEPPNcy1bOU08Fjziid4PD?=
 =?us-ascii?Q?qV0/ZMPvJIwEwWSUkLn4Nfv6v+7ddhAOQb+iiQ/mLAF6zSgvQ4wcNjnFts5q?=
 =?us-ascii?Q?RaV1djs1apcvLGIFrfdfuFgRty0W9StlVcAKurmzZvBSmFW/CgSioKdlVvUx?=
 =?us-ascii?Q?zvt7WQCYXc1pyqmtzPjGOjDK+H1mOfXSupIKS9+gPTqGDGp8doo1Iwx/sOoU?=
 =?us-ascii?Q?0YZA0m83vxqVIOtGJ+AVdUnc1t28gZBoZBjeuqOaN+Cc9WDItXRQualnqbCK?=
 =?us-ascii?Q?GqbCxDIUx0iWQUQByLIwq4LIVGW5Qo2kObbUHN0o9d1JQbTerviDIP7ly9zh?=
 =?us-ascii?Q?gUwN1BgoslQbfRyEctz+m6sNLC+jjMObWG1tlYIfewOxTVa+4uC+y/VHVSZI?=
 =?us-ascii?Q?f1Q9P0QXqC+svtuJVOvYBUSrq8YUNCz8N8XiUdWl4tEbMjcqnsJQ5NFBZlZz?=
 =?us-ascii?Q?3DNmD68X+EmHtwYZF7fikKsk0wfh+fVD5V6pAbEBsnLQS3P1Gq+ROyA1Zbbd?=
 =?us-ascii?Q?hQQ9TIIAGrZ8Mx7v+Q59kIID/m+8Q9x8ohB83fqnE/AhVU60nWYY82nj1H39?=
 =?us-ascii?Q?VIEufwTajJGERzeBpC+xDMnxzvDon7kNue91kVr/L0gyf1rwMjgR3dTHpcQq?=
 =?us-ascii?Q?DMlbncbpcaY+f4yQ/CUQGYF1nZZDNGMksCjjejkGuflIcJikI09nDOpqtFo+?=
 =?us-ascii?Q?lJVSRAJE465MevT5HklNVJMwzDN1+YnRNd/1RmcKq2sF7wPLw7WA+mzJEjEs?=
 =?us-ascii?Q?KM5zdi3xDVMz4sd8/sauxSv75HXuWBMns8GpEEuimy1MRLQoFgw0NfOqOq0p?=
 =?us-ascii?Q?SqUJkEuG5C3l1Kp9di1zamkrD3sviUzhU3L5HnJhddtaSgRR52BGiHqww64b?=
 =?us-ascii?Q?ciDU4fUQ3cLIqo5gGALUX0nXkdK08mu8BuqM9so+Vy7SBOKmlPk4c1ZeC15k?=
 =?us-ascii?Q?sCbieeIwCLlyrLD2mxm4/EQ9lc0BPrBMpK6+e/InBU4tpXjo/HKdHBofLplQ?=
 =?us-ascii?Q?2DwTzLp4tC8jLW7FDql7OeOcb8g3hOZuJSljsBuhqlZ4aKILfmkWhbUBV8Yj?=
 =?us-ascii?Q?K46HjU/AnpsQa8kFpzqK/gUEgcqf7J0tuk/uwA4zOM22pJMz72EyfYxD0W5n?=
 =?us-ascii?Q?340kJ3n/Se7yuM2ZqqHv8TUoGLHHOSZ0j2wfK++Jb0WgJxvQdsdW?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78295EC09488B94EBF7C5D5A190555F3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f14f39-9764-4b7e-264d-08da43aef435
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:13:12.6372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnlXsypGzC+LXi5LbOcqqaqe9Psfadkex2bqQcJ0e7qpTufNvnszML5cQlDJyxs+jhMBPij8qTX7nGKM7s2egn0/cKd6MADDdE4L+z9IqhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5302
X-Proofpoint-GUID: KODjtbc5QwVXgu2kx2h_42XUBJiLTKFM
X-Proofpoint-ORIG-GUID: KODjtbc5QwVXgu2kx2h_42XUBJiLTKFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_03,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010042

On Wed, Jun 01, 2022 at 07:59:23AM +0000, Peng Fan wrote:
> > Subject: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decode=
r
> >=20
> > Hello,
> >=20
> > I'm getting permission fault from SMMU when trying to init
> > VPU_Encoder/Decoder in Dom0 on IMX8QM board:
> > (XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=3D0x408,
> > iova=3D0x86000a60, fsynr=3D0x1c0062, cb=3D0 This error appears when
> > vpu_encoder/decoder tries to memcpy firmware image to
> > 0x86000000 address, which is defined in reserved-memory node in xen
> > device-tree as encoder_boot/decoder_boot region.
> >=20
> > I'm using xen from branch xen-project/staging-4.16 + imx related patche=
s,
> > which were taken from
> > https://urldefense.com/v3/__https://eur01.safelinks.protection.outlook.=
com/?url=3Dhttps*3A*2F*2Fsource.c__;JSUl!!GF_29dbcQIUBPA!wzoDdJsuf4bjXMe85t=
A46E0tLpFG5gqHoo-OeY6o_ARroNBmX7JByHW67qEUik7bNow0STgvAjR4rBkRu2Ux$ [eur01[=
.]safelinks[.]protection[.]outlook[.]com]
> > odeaurora.org%2Fexternal%2Fimx%2Fimx-xen&amp;data=3D05%7C01%7Cpeng.f
> > an%40nxp.com%7C91e3a953942d414dcc6208da425006e7%7C686ea1d3bc2b
> > 4c6fa92cd99c5c301635%7C0%7C0%7C637895208732114203%7CUnknown%
> > 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> > CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dno%2BV2ubjGmrsm96NP
> > ybeeug4a3BXx3oX7xmylzZCU8E%3D&amp;reserved=3D0.
> >=20
> > After some investigation I found that this issue was fixed by Peng Fan =
in
> > commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from
> > codeaurora), but only for the Guest domains.
> > It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
> > p2m_mmio_direct_nc by XN =3D 0. This type is set to the reserved memory=
 region
> > in map_mmio_regions function.
> >=20
> > I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x type fo=
r the
> > reserved memory in map_regions_p2mt, which is used to map memory during
> > Dom0 creation.
> > Patch can be found below.
> >=20
> > Based on initial discussions on IRC channel - XN bit did the trick beca=
use looks
> > like vpu decoder is executing some code from this memory.
> >=20
> > The purpose of this email is to discuss this issue and probably produce=
 generic
> > solution for it.
> >=20
> > Best regards,
> > Oleksii.
> >=20
> > ---
> > arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory regions
> >=20
> > This is the enhancement of the
> > 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
> > Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
> > e->p2m.xn =3D 0 for the reserved-memory, such as vpu encoder/decoder.
> >=20
> > Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
> > same way it does in map_mmio_regions. This change is for the case when =
vpu
> > encoder/decoder works in DomO and not passed-through to the Guest
> > Domains.
>=20
> For Dom0, there is no SMMU, so no need x. Just nc is enough.
>=20
> Regards,
> Peng.

I would say that SMMU is not neccessary for Dom0 because it's mapped
1:1. But using device under SMMU in Dom0 is still valid case. For
example to protect device from reaching address, assigned to another
domain, since Dom0 is trusted.

>=20
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >  xen/arch/arm/p2m.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c index
> > e9568dab88..bb1f681b71 100644
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
> >                       mfn_t mfn,
> >                       p2m_type_t p2mt)
> >  {
> > +    if (((long)gfn_x(gfn) >=3D (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
> > +        (((long)gfn_x(gfn) + nr) <=3D
> > +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
> > +    {
> > +        p2m_remove_mapping(d, gfn, nr, mfn);
> > +        return p2m_insert_mapping(d, gfn, nr, mfn,
> > p2m_mmio_direct_nc_x);
> > +    }
> >      return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);  }
> >=20
> > --
> > 2.27.0=

