Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC907C7949
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616077.957906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3sF-0004o3-Qs; Thu, 12 Oct 2023 22:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616077.957906; Thu, 12 Oct 2023 22:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3sF-0004jH-M5; Thu, 12 Oct 2023 22:09:43 +0000
Received: by outflank-mailman (input) for mailman id 616077;
 Thu, 12 Oct 2023 22:09:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3sD-00016v-D2
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09e25b93-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:40 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqPBi007501; Thu, 12 Oct 2023 22:09:34 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8ed-4
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
X-Inumbo-ID: 09e25b93-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJbruyxws4nBodWCnx+vIYgRU/g843StHlFKRppiGuJDvOkZhw02lDdntYLZ1uVSFyJOZOgdiV2N/Vqiy2cW0ugW6Lke6Vc4TmokRLhRwoC6esEwD+uemb50BIoAn5xuJEDuT3oPkOrdfhoDgJzb+obXa+QC0CVdL4CXhotzDcscRQ3swNZ0wc3QJDZX/OTC6VtScc3bUM7cWjyBOUBVZnhTi9cF7jzJglXfWXTUXis/GgLKeGhRnFkIQWEfD1KvHn7JnNuS/AiIneUf1t91cvvmhPjEDZ0cXsYEGlXwbvxJJv0YwyShjcN2PBBfYvXezxzTNyZUA8D1pfNaYBFpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jemp8AXG4G7kZd1vekfyMfuZ4tvRJAgtq1QGyeWPS1Q=;
 b=f6sh31/FA41mqMk7gaME+9n30WHMj5fEHmoLU7l6A9t5brplpnA0Fr024IupBRf1jEgLPED5AlB/eCQcex4yUzqOBflt3ZInjAdD6Cz3kh8d0o+fsAR3ZuFREb0AkeofS+hShhIMEHHyRXPQUBH/n8UDaiAj1TnHHUQ4/XtVUcnUY/VdF6ISZdpYaNxJdM8A5cWVyc7mVpCF1j7+43OyxXRmTvnmcxzWZ235gHWKOb0d+BKq2QN6zeii8F0SojIjQnqTy+ug7dhtzzDV67q+9OzTBGg7qtossLKB3Qp4uyBF8kDv7ejAhmqQBIv9zFqPUjpr1dO1zlgatjS8OBTyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jemp8AXG4G7kZd1vekfyMfuZ4tvRJAgtq1QGyeWPS1Q=;
 b=nGyd0Caq3i1wXCUzPcZaeLXjsR1tzwwTzmrHzO5TG4yvMOxZ/xVBEWUtn+MG9xBKKTWy00bYY/NBR/so2cpVWeerMd2mcctUseR8NDQZUFhRSRU9BABQPh+8KuMVnbm/6XDlUpikrIezSe4oa7vHaEKFeeha4wlTXd3zaid+a/R6Hx1R0tm0NyTG4lzIE/4+00raeqrpQkzAOyEKH2vMSeSqvStBPpi5hOX91BzwkPYS+q+1baecTLVrF5YXsB+Q63oeVLcovxzXhmfMzIKl0mLNhkrLGqEPEz4IDtAd4Tlui48j9hzcuYjB+CWp5GJuzDX42IoYjtuheKeMmbGtaA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v10 16/17] xen/arm: vpci: permit access to guest vpci space
Thread-Topic: [PATCH v10 16/17] xen/arm: vpci: permit access to guest vpci
 space
Thread-Index: AQHZ/Vi/DuQgj4K7kE6rd+kBlTBFxQ==
Date: Thu, 12 Oct 2023 22:09:19 +0000
Message-ID: <20231012220854.2736994-17-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8758:EE_
x-ms-office365-filtering-correlation-id: 8fd38337-2e9f-4761-543a-08dbcb6fe714
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ffTSLedFRd+w0V6Xbn8EPtE56dozfnHAnzDpshiPlmBIbUdIm/Y9rXQPe4T7VRE5oU2pxIUsgLN/cWCAu+DBh9yy0WOhwgHgtjV1l53yMhgg7X+6WflhxNOwKaP8nHIow5eYXy1luo6oI9yKp0fQ7oMP2Xf6lKmWRCtq8mxexP8j40POLYv1YFQozPX4ihOmA3/Juhc128xR1lyZcr2PXLUhJqXflRVAQzOxYCGfFvmUoV4mhR6CdMnfz/xTBHm9gquQ/3PqCLmkD1r8/L+WSfX/Lrm/J4YRxKzIKwMrJlzvwrcwsf7GlrCgiAH+SzzNt2roxav86ujpopnYNtic1Xv+n5epNPmLqEtGY9FGjLIVxr59k2h4ITKwWfjDit6wP/FaFjJkF/6moNSXRcE0sCzjmI0AwgElTvlrped/hSS/wuYkBmR3sRspwDPTdtKxlITh0Q2vmAdpMwvh5wBlwpVIoNdmLuGoHasOaoUiDx22DKRscDC+/BZFngYCTJVZZm+aXFzcLffbzBaLpth4yogX698YXxjaPS7imW3Jk369eG972ZvNCG5EgAf2uNGWnXv+54WUsa34kEu1B1ILQGEF2k0ijhcsbzyhznE4c22mj+WUUJpSUGf18iMySJG0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700005)(6916009)(5660300002)(41300700001)(316002)(83380400001)(86362001)(122000001)(38100700002)(66446008)(71200400001)(6486002)(26005)(1076003)(2616005)(54906003)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(91956017)(2906002)(8936002)(8676002)(36756003)(6512007)(6666004)(55236004)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?b8Qx6VCj8Xs+59yBENAfIVEpGTXhLV6G8QBXuEL37IfFBDeCm51cQDf7K5?=
 =?iso-8859-1?Q?TGPou4NYYKKpmkvobPdObrA7bn8wxTpsELEAYjRe10Bjs2y5x9isloYsnu?=
 =?iso-8859-1?Q?4/lRmQtDw8vLVN/6RxmsVmRsu76+H70HcobHHuanK7z6offCzEDCKtBv2/?=
 =?iso-8859-1?Q?T/HQiwjOXP4kPrENiQK704+bUxzehqKVoJtx8cUED6Q7GJnk0IbPSxv8u0?=
 =?iso-8859-1?Q?ut3FvCBMqZ/nMDJUGg5SdV/f4SVp5XoWJsNZej/xE/oMsbejhHAPv8x+fm?=
 =?iso-8859-1?Q?j9gss4rbd6b1KP/HijwuRAiRE2nCjNTyCNYr9o14hC+QcKGuXhc7L/EvlU?=
 =?iso-8859-1?Q?YbOf348gP6WNbNeY4823gL/Sa2/ljgJ0+fbkJro4sjUnDswfmOgOj1H6dZ?=
 =?iso-8859-1?Q?MGGd+crwHXa7Zfc46uRTlPvCA90f7AiqZROJVWCX2pQSq4pMbbKs9K0Eg3?=
 =?iso-8859-1?Q?nq3iJOBp/rO5cHBMVu0zANppZbkwkJ1grSlSBCuu792Vuq11cTAoCetLTy?=
 =?iso-8859-1?Q?nGSx0mt4+99EypAWuI9JZjfdIK/P0waWXEng1kKjcqfwhk5HmssCWpqSfV?=
 =?iso-8859-1?Q?ORdGVAgpgV3GBxGzZjaAzlZwuBqLXyPafHMGDlFwGqjVPhn5LgLmzhtMJL?=
 =?iso-8859-1?Q?PDLtXpilqYDnt05i89PIWNWY54nkitggfErkuBqpmwH8XC6v2IR3WpFVyG?=
 =?iso-8859-1?Q?oZLKFanA7XpqTsX56hD8lzS9qEkNxZLO5Pn3XVpsO36MKbduv+S2UUZNuJ?=
 =?iso-8859-1?Q?eQAkKxiZCzULyrFpaqxigRUfoSZj3fY525SURogCqm56UuIu+J+ssKawfd?=
 =?iso-8859-1?Q?HOj8kvTyeoeNbhABpdrY2aMSikNyvSYBZDpZxNmTCPx/yJrv0339H3Ol8/?=
 =?iso-8859-1?Q?Xplgkp/cUGLmWe75BccASu6UgT7Hygq5pn94vL9P9JS+esXfuxv8auCQ/a?=
 =?iso-8859-1?Q?CXN2j3JT5tSqoTPN9stiBBly3atcLxrBfcidjDDvGlQ+aD05Plh80/z1k8?=
 =?iso-8859-1?Q?oad0Njj1M9va7iQot2im3645kZmjHMoE0FdjgLA9wgSMCrkd7NHzzsLtaK?=
 =?iso-8859-1?Q?WB2xsZ7H7zaYrUTeD5fWHa7iqb9rwiDfcHWEsJTx39GmPlYBRbNdFWXuS8?=
 =?iso-8859-1?Q?gK92u40+tUvNEJYpDo4vT0EFm/ro+y5FYpEsaKIMcpp/EjmTS0FtltJOKM?=
 =?iso-8859-1?Q?FtYPM342TRMSMP0yDyKx1MlDN6BvyVQsPLwiq+UN2/S2GsMsH4HjX3K7eG?=
 =?iso-8859-1?Q?1hAerI81KGZQdHpWnje46IZpvDofT3Zx4pSgEvkO+MIfSW+sdbbTb95rQe?=
 =?iso-8859-1?Q?6QnseCisuELEBi2QjY4nq1IL07TJ1e0jlENRpxtHCfRqd4bXfUyaUXcud9?=
 =?iso-8859-1?Q?of0MDTQAT9D1WjyGItoOPFGCLcGR2rfMhj6UcBE69UnpqLvE1sV4DQUhhm?=
 =?iso-8859-1?Q?XbN1ZfAUyc5sNzAJv9XySErBZ/8OS7X8hcQsZYvwk9v+JKzfwIVxJ2asfq?=
 =?iso-8859-1?Q?nL0c0jm9n0PEKr6dpabMyQvZ1hw1K17eWB9JojPjSyUjOWbDToQrpWLrgS?=
 =?iso-8859-1?Q?tmKrkjf0PJULTvUIF6LXpirWGQCJK5JvwVoSfqnCOd9PVT3o4LFm4jZTJ9?=
 =?iso-8859-1?Q?GxM+8p0V/a3bYbDu7FxsqOH1ZQ0cZOClV6nQGCFcluq31qJ1kjs8lcyQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd38337-2e9f-4761-543a-08dbcb6fe714
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:19.3499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhO6AQkeX5sOBVAq6w1qOegLr0061bO8HhnllXNCpdN2dnYsAXEh8de3XZlRXeOfuOixwCsuNbTiXUztC4rexrHHC1kAxKG3FfT1l2xcDEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8758
X-Proofpoint-GUID: x3E5hzTw5cNs-lSgq5IEbQebQwK4hAb2
X-Proofpoint-ORIG-GUID: x3E5hzTw5cNs-lSgq5IEbQebQwK4hAb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=689
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Move iomem_caps initialization earlier (before arch_domain_create()).

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Changes in v10:
* fix off-by-one
* also permit access to GUEST_VPCI_PREFETCH_MEM_ADDR

Changes in v9:
* new patch

This is sort of a follow-up to:

  baa6ea700386 ("vpci: add permission checks to map_range()")

I don't believe we need a fixes tag since this depends on the vPCI p2m BAR
patches.
---
 xen/arch/arm/vpci.c | 9 +++++++++
 xen/common/domain.c | 4 +++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 01b50d435e..3521d5bc2f 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -2,6 +2,7 @@
 /*
  * xen/arch/arm/vpci.c
  */
+#include <xen/iocap.h>
 #include <xen/sched.h>
 #include <xen/vpci.h>
=20
@@ -119,8 +120,16 @@ int domain_vpci_init(struct domain *d)
             return ret;
     }
     else
+    {
         register_mmio_handler(d, &vpci_mmio_handler,
                               GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, =
NULL);
+        iomem_permit_access(d, paddr_to_pfn(GUEST_VPCI_MEM_ADDR),
+                            paddr_to_pfn(GUEST_VPCI_MEM_ADDR +
+                                         GUEST_VPCI_MEM_SIZE - 1));
+        iomem_permit_access(d, paddr_to_pfn(GUEST_VPCI_PREFETCH_MEM_ADDR),
+                            paddr_to_pfn(GUEST_VPCI_PREFETCH_MEM_ADDR +
+                                         GUEST_VPCI_PREFETCH_MEM_SIZE - 1)=
);
+    }
=20
     return 0;
 }
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 785c69e48b..bf63fab29b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -695,6 +695,9 @@ struct domain *domain_create(domid_t domid,
         radix_tree_init(&d->pirq_tree);
     }
=20
+    if ( !is_idle_domain(d) )
+        d->iomem_caps =3D rangeset_new(d, "I/O Memory", RANGESETF_prettypr=
int_hex);
+
     if ( (err =3D arch_domain_create(d, config, flags)) !=3D 0 )
         goto fail;
     init_status |=3D INIT_arch;
@@ -704,7 +707,6 @@ struct domain *domain_create(domid_t domid,
         watchdog_domain_init(d);
         init_status |=3D INIT_watchdog;
=20
-        d->iomem_caps =3D rangeset_new(d, "I/O Memory", RANGESETF_prettypr=
int_hex);
         d->irq_caps   =3D rangeset_new(d, "Interrupts", 0);
         if ( !d->iomem_caps || !d->irq_caps )
             goto fail;
--=20
2.42.0

