Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73278D051
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592521.925354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80H-0001il-Eq; Tue, 29 Aug 2023 23:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592521.925354; Tue, 29 Aug 2023 23:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80H-0001WU-2O; Tue, 29 Aug 2023 23:20:09 +0000
Received: by outflank-mailman (input) for mailman id 592521;
 Tue, 29 Aug 2023 23:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb80D-0006kQ-TF
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:20:05 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94825af5-46c2-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 01:20:03 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKDecq030691; Tue, 29 Aug 2023 23:19:56 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3sshtetfcp-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:56 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:48 +0000
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
X-Inumbo-ID: 94825af5-46c2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InF9Vra4KEmrtfxMliPMa31i+AhiWoPQUOQB2KkTpiqA9EotOZoN5+qO6ISjBPI1bkXHG3OKu3py6fix3C+ajg+JSsVJGpG1vH7xR7QyTZkxou/RZeDjdlsWh2YSKFW4F51zj5pyThKfG8Gq8IO3IdIDUFHTqDRa/DxjdDbHuRYdqLdUnDsK0Ram0TGBYnUxjW8uyyQyd+B8nsccUdqQa40z4QhLfo7e91b0DeW1LusbTSRsBSsAjiTHE+NrmsMSCPSb3suAl/MFcbzpj+ZQ2+/aFrrf+8Lz1OPv2VQmx7/FFjrvDHCiyZO7qgcLQEwf7HIoYqeQtQ4WBYhN/1XocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnW6xmOMSUh88tcDS5xktaqBw+mFQg2UICEpESoViDY=;
 b=g+3rxJAGjDtfGmIANR04W3wZOtgKciMD1je3u/NYIhyKQnfxL5snKYiD7tXMtSsLubQVaegJ29FZllrzu4W4YH4xoJvVdaqwSriY7+8ZXOgJr3ZMQIDG75b1vKDpXLnvpwRXHp8VDdYpkxb+532/t14WLG9tpoOsiWXV8tzSGz705kPUGiL3gi4Sknajh4nsegzQkRcsLcWOBFMgQPCjGit0DfT+E6BLCu0MOnJvD2JiiRnCkIPLfCuy7p7gmFONxHkmB8t2hUq5YjDV7iACbS0nR6ZGxtBlE0A/8mhtA7fBNHt0cNaAiX8B0qGvijXH6lt00j1AQPSkLGFK1j/1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnW6xmOMSUh88tcDS5xktaqBw+mFQg2UICEpESoViDY=;
 b=BZ7g1fCRysNlZV9OfTLAMXjMjxXm2nGMlkmePoodgE3lmp1gSAhmlWwzqFfxvOD545iqFJ2h0ysZGuXnLmFZm2Yruy+ncfSAGPbOYqBgBXq0b+EUAceG2R262olph70WKnj7aJOhULh32Os4QvqYOsGR5GvvERlk/xNyKIePnLdnZ+GnXVIvwkxhNqbBzkGdTSflpSvwhF2iWKG4NENVp3CXv18MZlgSvdZ86uhrYF4Nyakw7dr3gEO1Uytb72iMPiEJTkcWwtkPFpzt0Auk9o2ZBvZs4e4KmDV7QQb0j21D0gyNkEQUxAcGernHNdEubZG7zogo9dPh8aFurKY/Ew==
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
Subject: [PATCH v9 16/16] xen/arm: vpci: permit access to guest vpci space
Thread-Topic: [PATCH v9 16/16] xen/arm: vpci: permit access to guest vpci
 space
Thread-Index: AQHZ2s9N0IXatP2juE67AItmuC0joQ==
Date: Tue, 29 Aug 2023 23:19:47 +0000
Message-ID: <20230829231912.4091958-17-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: e1c6d29c-9dcc-4624-21e0-08dba8e67084
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pxusuRWnvPareZAG67Fu5l8gr/HBomI6/Uz6t/jywZN795YPMDjkTRBp+3xB5iFB9HC/Y30qB3gGkoyXjCNRovYPkqdKynZfODcQWTS+8NWdpOf37Y6n0657yEy6pU5y6Y7FLmY7wwvhOCCBwITU0uUktTjPCkEnF3xC1ZBu9qOQuLbeByPkubHp787yfoCxs4XvIewUE9AG7ryi18j3HBlVy3OYVkN4ltSPjLw0XDVunDD5WlbnB+MpwCZtrk+aNfbLUK3XxPlSu/OkGh7OtrGwmD8Jlu9Vqc0g1BOPCLwlRMgzivG3hD+aCRZP0aJ2ilVXluzn5ghXgykbQQJVA81PvqnybXWxd2LMKjX9yM6eU6RlMapJ7h9mqNUe8jG9neSGG8/hvPwIoQTm4pQ7TUZ3+sLrYMRL+0E/VIgAWAyxDCq+BlhKu7dL+LoXdJ6gmRdfnF4+JjUcHKU48bWj0p4tEF1GLodRV3ygrVcZ0xGi4PxUWy+JsdvgP2PttQpIonElwgEaRRleH30DuYvdj+l2I9cwcMxUxFnS/tk0J0bh63iwkIihQirQSRW0/4qbIHxeRfZO5/IO/0wlsgXGxfyPdimYmxviYAmXQ945jicZb0Wo1itLeeVh0nR/NvbI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?m+wU+ofam8Mx3Ygq2nb9XHye4pi8rzRXNk3KlqTwRk2XvJ23Ev0x3Dhs+n?=
 =?iso-8859-1?Q?Ds4DAzYobaPAudJH07lGRHeFzLT+uQJWN7nNRP46F+bKNz8QLOTmvIyTA2?=
 =?iso-8859-1?Q?wCPbboACWzlqDCKQ6VuNdAEJEPJigJ9Xm8pOa98hR7vNeM1ojUgRt43/q6?=
 =?iso-8859-1?Q?IxVILKEj4IQrwYXc5QHOLvC6tjc8pjKRWI92RWiRk36eiEgZYGsPbk1ri9?=
 =?iso-8859-1?Q?+eJu340+dK9PpP2JG5v+Vwul5OprrxNQOXyIPWfMpohhljQuow0kL7Qwtn?=
 =?iso-8859-1?Q?Kjb4tfmrN7QzgJkzejxwyYfJIZO+lmI8hTCQsx7DM1JWujNtnvqnuyfw+S?=
 =?iso-8859-1?Q?T8dJu0RKUsq/P1GIqPUPtWIrHEGjZqdQzOUT33n/6S4un315H6wRaj2A20?=
 =?iso-8859-1?Q?CD3vYNy9PC3djr3dZRkq8kTsg0YEjpbhtK8Z3vb7Ca9K2O0KzyCNMOnhU6?=
 =?iso-8859-1?Q?YNMlXxqK8rReveIDsBpkZCKPMEctP8NOTXnTy5mHJyW5jQMgp0/LUJrsbU?=
 =?iso-8859-1?Q?7ng03NLvN/EkPtgLgBZMmhEqM3ugf7ucB/rhst3v1qyhAXKtMWjz7/fB/p?=
 =?iso-8859-1?Q?ke+270dUK8MSz5ISeD3oyfEAu+/lrvc2107S2RbeIJoaR87GSKUUzIvBI9?=
 =?iso-8859-1?Q?lslIA0984V6WWNioIh0gyUTglm4EshJ8G6ElZ8on9ZOYbJ/26XnOipK03S?=
 =?iso-8859-1?Q?M3g6DktcEgMyeZHCkA9cnrz0G7LcZUekzcI/x6oEW25P/f/9BPCN1BvqiI?=
 =?iso-8859-1?Q?lFgMDeXeG+J0Yxl6fu33bFjH6Vwnha4BjSsT4jd3P9x7YJ3V0EdrRuFtgn?=
 =?iso-8859-1?Q?ODtK9XrW70A8DChmnnfJck1DBVmMVVpQFEj/oJRr44kA2Zv3QWpk7NsJq6?=
 =?iso-8859-1?Q?/FBg3FwOvl9QpQJat6CIK4EJzwc71ADJfin6vLjj6qkCXLfel7gqQfqX92?=
 =?iso-8859-1?Q?sUoaUiqlXD8gUD1oJo7WorO4DUcOakDnhzNml5Ahn5ES8PGq8LSZuN5fXj?=
 =?iso-8859-1?Q?aEwgCs65y38A/ORrPEiyZsnSsm6kN58e+mohOzlabSea3YNQgj3PW5PnR9?=
 =?iso-8859-1?Q?YUzTcIET9dGA/sO3ZlkIAXhg01nC+lM/qXecF7kxksjF1CFiNwyVRQtIFJ?=
 =?iso-8859-1?Q?7HAyGlpsIZDeVZ4ecTtpue0u5/vTsah0djH2LrwtO15GyxYEQ3WCTrixlj?=
 =?iso-8859-1?Q?9zX0Gyft5Y9VQ7VQTDD8lyTzCfYz/HGWfoT7ipchQT+utQpcdhP68lRVgj?=
 =?iso-8859-1?Q?BZ5H7vK/u8YuKlPEp/mMvZhCh1IoTFPxCponAy6IQcpKvE0HHudIMoWI61?=
 =?iso-8859-1?Q?utFjTMVV8X0OfVxCwXSfVD/khwTR3M/eeEkEELez+5m+YrrS4QOxOLtvcw?=
 =?iso-8859-1?Q?3VLtDo3OeQSiiguj7Q5tJAlVzaO5YrAD0q9pjzXRA4snNtqqccoJ9Ro8Sc?=
 =?iso-8859-1?Q?svjlfi8uf94qnNG6zT7neIMf8Ft6tYH1iYahMzENU9GKPLBVSxL8/DlMau?=
 =?iso-8859-1?Q?dCu7+NFvZjmipMqjJE5GVXjhZjobWiSMRAz2Qg4rc8G586aNRq0Cf9/hbf?=
 =?iso-8859-1?Q?u/IvTq1AcBUtGdL72nLb0P5T/1iNRJUj6a8kL0wmYPl3U3gW29Nkffa0Do?=
 =?iso-8859-1?Q?MvrMKKsSvSz0PPmi+gcLCBYn92Dnshfn8anfoYGZ9M4rpMUvi0Dll8FQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c6d29c-9dcc-4624-21e0-08dba8e67084
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:47.4844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0y5od2v5nnt/4cF8+ydKP0W2f4maeaYSljDZSkcWf/w8CeCfkzDtR4zw0/T2iKLgYb3h6URHUH4MlSbtwQU25iUwCHJKmhusowcENE8Ulq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: 5iZcSRwQWU66i7bMuleoEiMpKeMA3mIG
X-Proofpoint-GUID: 5iZcSRwQWU66i7bMuleoEiMpKeMA3mIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=686 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Move iomem_caps initialization earlier (before arch_domain_create()).

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This is sort of a follow-up to:

  baa6ea700386 ("vpci: add permission checks to map_range()")

I don't believe we need a fixes tag since this depends on the vPCI p2m BAR
patches.
---
 xen/arch/arm/vpci.c | 6 ++++++
 xen/common/domain.c | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 01b50d435e..fb5361276f 100644
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
@@ -119,8 +120,13 @@ int domain_vpci_init(struct domain *d)
             return ret;
     }
     else
+    {
         register_mmio_handler(d, &vpci_mmio_handler,
                               GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, =
NULL);
+        iomem_permit_access(d, paddr_to_pfn(GUEST_VPCI_MEM_ADDR),
+                            paddr_to_pfn(PAGE_ALIGN(GUEST_VPCI_MEM_ADDR +
+                                                    GUEST_VPCI_MEM_SIZE - =
1)));
+    }
=20
     return 0;
 }
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 9b04a20160..11a48ba7e4 100644
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
2.41.0

