Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EFB7C7965
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616115.957936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr43P-00055L-Pr; Thu, 12 Oct 2023 22:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616115.957936; Thu, 12 Oct 2023 22:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr43P-00052H-My; Thu, 12 Oct 2023 22:21:15 +0000
Received: by outflank-mailman (input) for mailman id 616115;
 Thu, 12 Oct 2023 22:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3sL-00016s-9T
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:49 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d93cdf7-694c-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 00:09:47 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CG29eQ021659; Thu, 12 Oct 2023 22:09:34 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tpcc6c048-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8758.eurprd03.prod.outlook.com (2603:10a6:20b:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Thu, 12 Oct
 2023 22:09:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:28 +0000
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
X-Inumbo-ID: 0d93cdf7-694c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgnX5BmG6ny5bXSPcSa+e79ivWFctQhzJWGHb9pU0sDniaWje5fMJ6HbzyDiYngv0IZrBn46Cai1q+dWf57D1TgeXwBPBFkIdlYiY/dNkrFzsdK+BneTgTpT7ldG+s319XZjL0huhiXaXmK9tOdLozFpyBVUhHlcTjX801oqN5VHVjXtwz0PGMbEHbSaGH0mvc/zVGObRdvtfMXlQg9TDwry4Tj1aPZQYKRBx+8kpAmas3kO+8VYvRnSWem0nNnOnQcjiAQ6Nz1sYeKHl8Ilv0XTTj6g9TNHup9Q6M6A7hKNJZBz84cIFoFLRWwPk4+R0kKBNDMS8qFdIlxjrhWxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fCPCQQkuoUbzHvgCuLMRvBKFHMr2721/yam2GyvN+o=;
 b=fbSqGUHZD3PeiYHjYDp4zyYD8kiGNSpR0iUdjs0wppF+JfcaCYCDXaVINKViqsnTU3W37qzXc1MBIipW7CeUEBiq/koorWp8Pc1zWN+dcYdIWCkoG4v/R1vq0uH1XuOddn75sJAFMMk1jdest1su+KAU+cKoOIC2RqJuc1g49CxV65T2gGqnrSwq+/swLfug+IHjBrEAF4bf447zV7kdyx7NKdHMMa6JgS16NIIy4UNIqbAeiUvxPn0a2258OMhBH2Ib8prcktU+3wZMwdb9PbuWVcpr8Kw5WLICgHbB51yHb1Vx8DA5rUfk5BH7/tdmqMvi4pdWOwBU5XVMb/UiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fCPCQQkuoUbzHvgCuLMRvBKFHMr2721/yam2GyvN+o=;
 b=P1ipP9kAqSHZfGH8c8XlxfNwP/oP6GQ88E13pubS5y7PdRPEuY5FF4A15BBhTiXOKxItkqqcU9HlxVCkglr5DAZUaUFewwTYqLYJSZlmRE+ruby7EKh5ayfaMR393NjEBppSWy30r2vQZIoOJnp4gwxdL1qFe/DnEgIfYKApEd3d03Iu7rpt6ZCXYvmrhYl2ESt2s1q4KTlnuAylAQGdECFdUXKp3v0GjAoNrThpqnkrd1uLSPj2DFkwjSGNYUIbF2o5V8dwGUXt/6gFNLWLCrQaObskfMsnNYRulZNA6f3EBYNS/W7vyR5G7Zqc0z0nsknbealo1YV1Gwkl2xbUZQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 17/17] arm/vpci: honor access size when returning an error
Thread-Topic: [PATCH v10 17/17] arm/vpci: honor access size when returning an
 error
Thread-Index: AQHZ/Vi/FcbNdUf5hUOov/su5MD7Xg==
Date: Thu, 12 Oct 2023 22:09:19 +0000
Message-ID: <20231012220854.2736994-18-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8758:EE_
x-ms-office365-filtering-correlation-id: e1dbf20e-1f04-4d70-a031-08dbcb6fe741
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fLgTqDYSB6qOd8P8sAT/xDozmDn39xYYs4M61Lwv570Q9xEzuW9XmTBNkPYBelFKO2d5B6BWdnQXcQ4fYRpJQLNf6Mcj+uiY53nG16xIdH+7Mz2gYZMHT1PTIglHjCq0ZMlNL7CMdgrj6S+huiRUnNapCtvgO5b/RxfpI93mpeZerIfmCHKz/80dw1Ez0y7s+Hl6quaZZJPvlXcapnfLrXxAxSqvrhb4WwIZBC7wGgQlrZB32hUITCdm2zaZf2PuLtc/swnVJosyrhdervY+HS8KWBn1Y17HDCfNpU+Kh9RhVHSMdHniOcxOFKyLGrIvHQY+mtTmDanLQRisT0iJEFWPvcEL5wDQdsZE78smD2QgWyMsD+bhZEpgUvf2i6IWAdlEyyDF8pZpl6epamOZvTkxZskRm8IiBLzQML8MEMvs7tAxqOdjXW4pzADZ0Hb8RO5UuK0Cff4Q36fg8LQVetg1nr8Kjn62ZY6wP9tjD9LYfyzH8OnhJSAVQzLBiBmTf1Am0Dpd1UZhwiMfKLt9sAPc50XXPWvZAv/HvyOlo+aKyEFQwGmUGyy/U4hlGvbs4/s0ffuKY3ZGkUkrBo0RpkSTPq4HSfCHEZpFInQbM+OMQJNXrmz/UdOOxjVDezX+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700005)(6916009)(5660300002)(41300700001)(316002)(83380400001)(86362001)(122000001)(38100700002)(66446008)(71200400001)(6486002)(26005)(1076003)(2616005)(107886003)(54906003)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(91956017)(2906002)(8936002)(8676002)(36756003)(6512007)(6666004)(55236004)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0QWRMrx15lgJPaYn+1mV174FJ9sYrdunJ/iQYJ1MN3EdUrR9Hq24ZtcSBQ?=
 =?iso-8859-1?Q?ekvh3dw4qxN3gWNKRoGRV5RCaiT4yPgjyl0PTpBHQ2z7s0SmcOdehl1Thv?=
 =?iso-8859-1?Q?LbTLhOIChmHByqgpraU1au//vt4MOug4+ZFcCpDWGLsZK/cDiscdI2pcf2?=
 =?iso-8859-1?Q?tJAnJT3ATULGNBDyafHb7Mdljp6/U3uACiADBXz+t/z2gnDRCAhH/RFqt7?=
 =?iso-8859-1?Q?V7b+QWiiNsktAus4WIobnAhv0w8/MV3yXV1sFq/LbgQwFY3HUFHneOMYdo?=
 =?iso-8859-1?Q?BYfxl+++jrHUO1sVXGTP8y3W2Esjb9NVljzLGeXv+aH1vaRCqYDlsgBnVv?=
 =?iso-8859-1?Q?foxqO6i3jNo5lUbuKTo/9r9u4wJq5BugdKhgp8tDZLj7VPA8yR8BFJ8S8n?=
 =?iso-8859-1?Q?K2A2G3f0O9mQioUE4oTmr34Iy4Hp3iQ6WLAWl/ewaHcuMihkNmHtxXO8CG?=
 =?iso-8859-1?Q?gecbdARneINJT90e2keTu2o2SZYhWPKqSlOgwA5/Hev3TuWvtwrTWDJymu?=
 =?iso-8859-1?Q?AtcPaNfVXJI9cKoLlAIqrvfeogHF4YJDJ49JRiQdoeZZmM6dJq6xXSSjWx?=
 =?iso-8859-1?Q?sV5L45zxA4kD8BbOGMpTL2EEl4Cy4Gij8ktZnnfgulo1M2Knr+tvLA4DAa?=
 =?iso-8859-1?Q?46o3kXwHfG6K0za8wnDwkobFwoKjkuPx8X7OuMiqpinWdfnwS6Q9XzJoRe?=
 =?iso-8859-1?Q?Aj7le25HJNQPj3Jnvun88MQJItXlq8g8cnP9/KoTZ4RsBKosbz87isFyn1?=
 =?iso-8859-1?Q?Sk51PXw8IsSEb4D0MyIPa+1K1XcxD0OKGrhCV5xRf6hD1vcZU5r83yEr8/?=
 =?iso-8859-1?Q?4qJ/NqYvNB3V0j6+DZ/IFaBhio1SA95pHwOpeUq6inkmpiK3TT6KfDBmDq?=
 =?iso-8859-1?Q?RK5HxSE+jD3aJbaJTZyWZq3SDsyAyeFMXBjYFMiHQiaRq5SGYIVFKeqC42?=
 =?iso-8859-1?Q?1bpJi3YQjkbdKqztxRkdwVx+9b2bawl/sRSsj8CyZY8JUsdQvZtNiEKx23?=
 =?iso-8859-1?Q?9GdLWW1Rk3IoabjFGAJALIyd4rOaN9gdV48WgfMCRB9/ofjGhV4BQsaoiy?=
 =?iso-8859-1?Q?57ABDK7bRHNPiWyOyUCqy2213Q66SfmeSWBXfAk5BezbcZPbckfxEmfq+f?=
 =?iso-8859-1?Q?UXBiwN09QrnTfPtohex9WaBK0obzH0hwwTgGpnYzHSO5Jw8ShRa62z9hzz?=
 =?iso-8859-1?Q?exWNDOgWY3QN32ekaGB4JEDMoeUgMRBTAbdlmMv4INcg+qUnwBcFGL1PIm?=
 =?iso-8859-1?Q?ch6yBtacWZEJOxsVTekBDPF4XNwC2Me27nH5qfywk39bojtTVrg9O9SSTq?=
 =?iso-8859-1?Q?kNBTGdhkb+tQljkQaQ1ZNQn7oU7UsIND303uo38jyUEusZEWK8Ludk6O2V?=
 =?iso-8859-1?Q?wIwhWPskSMUfmOzhJFK2tIw5uBLZM9+Rib+fEU2Cgr9y0Nb7n6fIrmdh9Q?=
 =?iso-8859-1?Q?Q5m4AKxxcsJEbbYcVjnfgkQ6qUdnAwlTFQ1FXJXL/xkfMM1C+7Mc6lI63z?=
 =?iso-8859-1?Q?ugQaHD9+2IjdmnwUFGYKhlUuNQsHYJELkC7R5nhqjGQsgo0JitMHQ0aeRD?=
 =?iso-8859-1?Q?Ke0kqO2PDiJROIWhg2Hc0dDO1oPT1cmc2bvb14avhU6mTOI4gBc01zz481?=
 =?iso-8859-1?Q?6plZPvWoVW5bOk/mCh+JqHfdTZeAVTJqOU0prhr2rjVgUXF2d5upLYvg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dbf20e-1f04-4d70-a031-08dbcb6fe741
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:19.6132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkhAIBvNH+jIsm8oCYBHUqB6wco71O5s0xn+DABaLJDGqZoupVvqzORXJ9j12MS3gg+WwXnvLeXtGxB3pzZ8gkGDPXTSxGwgSUTX0zespvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8758
X-Proofpoint-GUID: YBVKK9rlz3ToRA9CiDZ51KkeBGw_J4Uo
X-Proofpoint-ORIG-GUID: YBVKK9rlz3ToRA9CiDZ51KkeBGw_J4Uo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 mlxlogscore=911 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310120186

Guest can try to read config space using different access sizes: 8,
16, 32, 64 bits. We need to take this into account when we are
returning an error back to MMIO handler, otherwise it is possible to
provide more data than requested: i.e. guest issues LDRB instruction
to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
register.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/vpci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3521d5bc2f..f1e434a5db 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -46,6 +46,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *in=
fo,
 {
     struct pci_host_bridge *bridge =3D p;
     pci_sbdf_t sbdf;
+    const uint8_t access_size =3D (1 << info->dabt.size) * 8;
+    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
=20
@@ -53,7 +55,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *in=
fo,
=20
     if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
     {
-        *r =3D ~0ul;
+        *r =3D access_mask;
         return 1;
     }
=20
@@ -64,7 +66,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *in=
fo,
         return 1;
     }
=20
-    *r =3D ~0ul;
+    *r =3D access_mask;
=20
     return 0;
 }
--=20
2.42.0

