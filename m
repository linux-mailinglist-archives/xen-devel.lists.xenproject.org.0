Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945555384A8
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 17:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338616.563410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhCh-0000tQ-Kj; Mon, 30 May 2022 15:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338616.563410; Mon, 30 May 2022 15:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhCh-0000r9-HQ; Mon, 30 May 2022 15:21:11 +0000
Received: by outflank-mailman (input) for mailman id 338616;
 Mon, 30 May 2022 15:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6ET=WG=epam.com=prvs=81496cf07e=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nvhCg-0000r0-2R
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 15:21:10 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20617a68-e02c-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 17:21:08 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24UEFH2I029805;
 Mon, 30 May 2022 15:21:06 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3gct621q5d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 15:21:06 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DBAPR03MB6389.eurprd03.prod.outlook.com (2603:10a6:10:195::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 15:21:03 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::31b5:dfd5:2d38:c0b2]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::31b5:dfd5:2d38:c0b2%9]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 15:21:03 +0000
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
X-Inumbo-ID: 20617a68-e02c-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2CltKxWZkCNhVnxjNdqtO7Pz9X9fo1tq75UJ9Nd8PCmkPFFTVo+zKdHfuzDePkE9XtP9xfLQuXwSr6x8WuLjR6mUtdkgji3FT3RpJy741EyfVKM9Yow15OG5KVi5t7VTy8q6btfz4wxaciPTp+HQ4m6MJypTr1jZIk44gH/m0/ut2GSEBD35YDrLm2984rDWML3QafYJxmKALdWd0ZRRAQy5OlBMOFc8wREQEMUZQSlncguPJaU/DJE2LMVOxXoCI4ZFbgQgBPH7dZd8CqVdDMgQ7FMlrduixqQqAgIzGPttHjpr/YoJlJxvE0dCIJD94amqjw9IGoJSZs9rP1/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eK9WCHv2vArtOO0GW0SO/fwPV4IVBTjAHIutp6+unPo=;
 b=a5xxtfWJwWhZHUgNIZOgEY6NUleduD7iTnVchWfbQbKa2ahmbtuN1Niro/vRPWsRCP+MxMbJbGt2bXdZfTZ+UXk6pyhGU0zFtQttRJJD7kVqjmOoN4Uw7TjC4k58isSeOGepqjBFKl2W8khXgJfoY6Zq3Xtc4zmDLrIxbuTNjR5mks5V1csDqz7sgulI8mrWmqlCKYEC99EPSt2F3GODkj+F0dDpCYhv1Po4USPE8yKu4MnuPc2WK48cglKYj8Vwu0/tEIE4yDAVfCogmQX4jzzij2ZFnK4OTAs9TY8s2+pPMkfki9IqkgYez07bmOfXuanwjfXJf9xOBLWWLOlXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eK9WCHv2vArtOO0GW0SO/fwPV4IVBTjAHIutp6+unPo=;
 b=I1kCmX3+u3sqMyv60e9IvIOz/+ZbB47O/bYQIdZMeWrWTqAeBlO1l7FX1dFL4SvlRifPJh5ROX+pPlqlysj1CMJULGwvob0PaDI9/OFq7okJcwy4+Iiet7bhYC5Xtrw5+W1HYu0DlooPGAOMRdA6Lop1F6JSNIuB8hcP9MXItiMbYaHG2wTBll6RQp26Fnvv8ajzUgcusDMAbe2jRE8ADoOZ7lVLvEsodT9NQB1N8pT/xlO+R4fdk86XFRxUHNeehS+juNK1gZ3nkbXIduGHgWQXBIBjMu6AMPqSlCs+fbq+VdZSymLf1TxpVmtLbVM0UNFp12hmyLwTGnveNpsQYQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Peng Fan <peng.fan@nxp.com>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>
Subject: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Topic: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Index: AQHYdDjfc3Z/1SeAUE+eDUzXC1OEPQ==
Date: Mon, 30 May 2022 15:21:03 +0000
Message-ID: <20220530152102.GA883104@EPUAKYIW015D>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f4172b5-a17f-420a-b2fe-08da42500266
x-ms-traffictypediagnostic: DBAPR03MB6389:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DBAPR03MB6389070DC474305B53AF4D12E3DD9@DBAPR03MB6389.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 evJqUCON4+N8dWbtcXDtyThAzei7QJWZLURW5oXjB7aFWOPpq1QtsemeMdxYkBa8ZAzh8I//N0BSzfJuOI/vHtNbxCF3c9LOpIcNenKiq6KUQpxmxwebHE7ucTOA3RvxBKVPQkFvtYM2XBXtBSzrN9AjoOC9qMvBMFab8AZPWk11lS3qFALwqOC9NqjGpwed1Jt19WwRKu413zFUeTJ3ISDXSRzzUGK3eEZXWScUsvoW+TU915fZ4Zqng6zczr1WPtv1yDCLnne+T967h8K1E7NGap61VsoyOyYeOk6F+Wmw7O9EMSAjXSXqmCrGixGEGx1II8h4eWFzIw2RiEGzHKFm5rREjlYykNbXRs1Jg7pPC1ymDQfdsgRpuTTKgRtqONlY/l7NMjjlIl82FQFwLEB2qYJVGP6sMB1QebFmBY9JwqnAmmmnNSjDGWJkX76Vqgt9PMB+GinqMHRF0EN7QThEDA/psvi/5B8j/qHNKWUsYHpcWRPHy3svp9dYRceG/NUgK85RHhWAz+Peq1dXXfjsUVJU/DaHpWtevLWZOqqlLOr86khyCvy/FurQ2LZ7mxtthFzUCdWt//NL8L2P0YiE3KU3TgjeFAn5Uh6Uri57Ut5dtNgwbYSCd6yIWQ0L08frcgVKewykVHIRGzV3OxGUsPtiO7EAntO5CCEN97pzhGgCMPlB95MLBUBK/Jmrtl0szO0ytA+bhdDrBVQ9bWKKw47GhWrYaYLuMSNOcQMZURo2u2f1IQiDVBkmXN8rsOZcrlNgOaFjoRPPezTD9d66zWMlAcH7DRIk9gZIgas=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(186003)(1076003)(107886003)(8676002)(316002)(4326008)(54906003)(6916009)(66476007)(91956017)(76116006)(66446008)(38070700005)(71200400001)(66946007)(64756008)(8936002)(6486002)(86362001)(966005)(6506007)(508600001)(33656002)(5660300002)(33716001)(122000001)(9686003)(6512007)(26005)(66556008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aP/lH3G2zp/pKTv+5shiqVOPkPIfSGooajfZvUyATFtW65r0Y77Ckgu57iCl?=
 =?us-ascii?Q?V3AjHrdv74lV5qMzlysI+rtqu1GUakfiGFT7CaJUfQ8tRgfP0ARkn2iW1FBA?=
 =?us-ascii?Q?nW70Rf42tqKqfw8M9lAvvDNm+4p+Ur/swNRgkN/YMxWiilHH0A63l2ruP/Db?=
 =?us-ascii?Q?ML6Tz2Mr9C9AV+Co72hXpvimTUcaGacCEUVOaJADCqxprjBf0yVsXr+QYkmQ?=
 =?us-ascii?Q?T/gWckphJS7qv9nLgQS79LVwloj4ESWsgUhU02MKluVU5+zCgnaCWscHnfEe?=
 =?us-ascii?Q?qum43PTLcRxguc3Mw/EkSaTriwqeEY4dr6+rOu71vRscSSUNI1p2cIAlJtrG?=
 =?us-ascii?Q?fHzbTIEr/TYS/iJsci7h2DAdylethrN6ZYJjWANFXU5oC6vtNUr8QK3/zRB7?=
 =?us-ascii?Q?iQuT5e44FYYFNuaBChHFhUMO+NtNF7umb0k2o8wSnIpEyHxIfKvzpdat1zze?=
 =?us-ascii?Q?01NJSzkvUG5qAhw3ToASkFzrW+W7cdcd3kFf6c20kLqjfb+/ABj+H38s9eIy?=
 =?us-ascii?Q?UB/IELqxJli9v0L9JjkY8RGI+bJJ/uSXzqeOk5UNaaz44tlpTCJ+AcK2jRPA?=
 =?us-ascii?Q?cbEOvJpO9uAJapDeGz2ykLx4/k6Nr8Dj8FHsc13DNNDJcu2RQg6OpBmEXBfL?=
 =?us-ascii?Q?NXl7kbb6QWAYSlscyd398CNySLTXbDzixabqZV1O4AvMhkWRJR9jEl80rQMR?=
 =?us-ascii?Q?qxbFCvgB8Bs0szPV/UcYItpONfk25lM7GaK/UXNPgBZ+l2EO/sQscwr7rzxj?=
 =?us-ascii?Q?F4IQr6IjYW3QKnbRQTDFmrF0FqoxYHdKqO47TpYf7gdGNFa2TCOF9tGV3FQD?=
 =?us-ascii?Q?X/Z8/8xQ4c+zvP4irhBJ088Ich+NoQ4fjCQ8ut3LdRtrx/BrQlK1rlDIWO2S?=
 =?us-ascii?Q?a9F7oop80RNcfYtr4z9fSm58hQ6HsJVOf4qn+qU4mTRxOBSNgSGFIUJo6Buf?=
 =?us-ascii?Q?XJqFY8GdryKaG1I5bwghhwd55GkHAwIONs9YZ29f9LnCsMQAvHZeBOKgByKQ?=
 =?us-ascii?Q?PiTRcg/UGfjwJIRLa3ejjJiRAspGToic09/eDz06nTrRvpLPMaRpHrD7mLyz?=
 =?us-ascii?Q?Q56z+E0M5js8mVUCjpY950hhBxEl+1gq+ho1tR5Phe2kKn1Oyq9zulcisXdi?=
 =?us-ascii?Q?ix/M2xKH/uX9HTpsYjPTQVmKdOUAzu8k1GCCP4wNpdYcag9zEOiOZHMdldv7?=
 =?us-ascii?Q?p3tMO+AGulWXNtQLCWc8qTZKoGwfIEwAFpoyOHoTLdbVLTyd+hC/OgY3Xp2p?=
 =?us-ascii?Q?5dMh8Xd0t+Re8Z6djEyYoTEkdLtjho1N5/VwoxkEzePas4+5FTxFKT2xT4Cj?=
 =?us-ascii?Q?IkhQ+vrgVt9Jluj0CMGRhl+RyEVbK0M6/VxYwEKfwF9/ibigjXukzBZLOopa?=
 =?us-ascii?Q?68GHBJKWBSFaAOu8gjUUKJZ4UkT65hVeYTTghtrPRKcBlE1ZOLYvYW3oAxuk?=
 =?us-ascii?Q?Oe246ltAs9F/Ufp3TNxCk6ZeqgHyQewD/kZCS4/YK/IlJqAmtgzkCbYPSXwl?=
 =?us-ascii?Q?kdQz+T6y0HIO4K8/PXOMx+Lyr0cOneT3XkrJUWTHWs0KR8Ngxjw3oaLdoCxH?=
 =?us-ascii?Q?GF1qgrFYqpACqM9CReAaeZybkNymbceWZbnh3XpSlTsQ20W3VhsFkvWSTh5c?=
 =?us-ascii?Q?/DlsdMAVfesH7x4YFO9vHbxIhw3gjBYrZEA2hNEa51oq3WIeJdt6b9dULLnM?=
 =?us-ascii?Q?EOSpYqMAauJN8/4JgbdUV4ZUfU3kbQMnYZJu8kvyb9X/G+bvbNpK8/qah+DK?=
 =?us-ascii?Q?5oEwfbvxG+V04kIn9IvCNuY3p4VkKdnkfChDuzERNcUZvRQVGk/0?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <74D2542000AD5C4F8A93073705CB4B9D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4172b5-a17f-420a-b2fe-08da42500266
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 15:21:03.0979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2y9A0cCUyl+nL0rl2eHo2eduWwK2hEkUeSbv4qPx661eG+QMBVNVPqiq76g3dxY+2Lncj4Rb9Fj198b19O6tKgWTAJWL3GJ1FoWU1RJKN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6389
X-Proofpoint-GUID: sGrL-VupN3GqprkXGjatCGiXWarH4bys
X-Proofpoint-ORIG-GUID: sGrL-VupN3GqprkXGjatCGiXWarH4bys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-30_06,2022-05-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205300080

Hello,

I'm getting permission fault from SMMU when trying to init VPU_Encoder/Deco=
der
in Dom0 on IMX8QM board:
(XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=3D0x408, iova=3D0=
x86000a60, fsynr=3D0x1c0062, cb=3D0
This error appears when vpu_encoder/decoder tries to memcpy firmware image =
to
0x86000000 address, which is defined in reserved-memory node in xen device-=
tree
as encoder_boot/decoder_boot region.

I'm using xen from branch xen-project/staging-4.16 + imx related patches, w=
hich were
taken from https://source.codeaurora.org/external/imx/imx-xen.

After some investigation I found that this issue was fixed by Peng Fan in
commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from codeaurora), bu=
t only for
the Guest domains.
It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
p2m_mmio_direct_nc by XN =3D 0. This type is set to the reserved memory reg=
ion in
map_mmio_regions function.

I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x type for th=
e
reserved memory in map_regions_p2mt, which is used to map memory during Dom=
0 creation.
Patch can be found below.

Based on initial discussions on IRC channel - XN bit did the trick because =
looks
like vpu decoder is executing some code from this memory.

The purpose of this email is to discuss this issue and probably produce gen=
eric
solution for it.

Best regards,
Oleksii.

---
arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory
regions

This is the enhancement of the 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
e->p2m.xn =3D 0 for the reserved-memory, such as vpu encoder/decoder.

Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
same way it does in map_mmio_regions. This change is for the case
when vpu encoder/decoder works in DomO and not passed-through to the
Guest Domains.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 xen/arch/arm/p2m.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index e9568dab88..bb1f681b71 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
                      mfn_t mfn,
                      p2m_type_t p2mt)
 {
+    if (((long)gfn_x(gfn) >=3D (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
+        (((long)gfn_x(gfn) + nr) <=3D
+        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
+    {
+        p2m_remove_mapping(d, gfn, nr, mfn);
+        return p2m_insert_mapping(d, gfn, nr, mfn, p2m_mmio_direct_nc_x);
+    }
     return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
 }
=20
--=20
2.27.0

