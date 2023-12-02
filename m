Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FE80197A
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645839.1008341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En3-0004z4-CF; Sat, 02 Dec 2023 01:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645839.1008341; Sat, 02 Dec 2023 01:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En2-0004s8-Vn; Sat, 02 Dec 2023 01:27:28 +0000
Received: by outflank-mailman (input) for mailman id 645839;
 Sat, 02 Dec 2023 01:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9En0-000271-FY
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:26 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d96726-90b1-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 02:27:24 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGv5008549; Sat, 2 Dec 2023 01:27:17 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:16 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:11 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:11 +0000
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
X-Inumbo-ID: f1d96726-90b1-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqwzjfVbpuSbADigDKB3q6s/+4Ysl4kv9K1b1mlW2jPLkPg+2IdgeCtSwFrGA788BBfs82E/2RoEUefWNFdczzKy+K42djELnHHrMAc8AOfalgfPhiH4dl0XvfxT8mGIHn32uQtdHNWcpAqp9ivhwu/jSyI+X+7UzNVsqjnseVWe9dPLAEr+yJA68ljINOnq4/prp80gAZbXt3LzyMQwEjkw7DKXHSXgN+7QabEu6khWfU1vOjHAJ208go4yg1ZfEnn7ughdCpYQcCqDOIo3lXYVsRSjzRI8q3OPPslOPOnHQ4vIjM/lDPs1pmae7EplKrPSnUBiprkIUCr8Juxncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdZ0jIGkzRKTDO0d37Jm8MydN5O2zv8obceLXDno5fI=;
 b=NkHMRIbbbIG/oXJff0ijwMmlAED6egLPtwuxyZGI9PYvf0zx9LzE3iLDOBfzF8njxAW1CJiOXSX25nbJX9eZd3/kjeV/Pfk7n77fe3Rz4/gaK1LOGyemDGq2UEoa4CdeGur/LcNbCd2ZdyQNfELfbnnEoz97wkPReLfNmPcTxIDT2OO9wQkrmUHB1/eGKycafJ6fRDp18bmyRD+YSEGRGCP4BHWmUEkph7KAjaZvZvkn91Oj1hNp5ohetTzPNnOqI36exYGZ0DcTAEgxTR3K8TsyErHbF0/HElwTm/pSxPjw00/PgitWs2hGgJm6yIl3xK9SMXOcCcopL9eIuHz4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdZ0jIGkzRKTDO0d37Jm8MydN5O2zv8obceLXDno5fI=;
 b=IYfK9x9TGxqAs0x86VS3DmPrsSwIYQOJZqDDAZTlLMexzplhUksPdYI1ANszeXdn4fgKvWxIMqm8w7B71emdWTIlxoic33WQuQ/ZABaP6tmD6u2MMJIf3RUsIQc9CYbqXUJnO0wq9rHarGF7abN12th4frc+8fWEYdPEQ5tNHvPhr8JbIS+WgRHSU6TgQKDpa4ikt8J34od1UTMnO7ZcAqWbZo1KsWRolj9z4+WblpBrp+4BfQw3Mqhc4O8azGzZPd2Pra+XdGWULjhn+1koE/OyNR8ICIYLGQ1m3kuITpFY6AeAbvSmdKFNDe+05hrUuv78GbgOnjYa3Ko3sLYZlQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 16/17] xen/arm: vpci: permit access to guest vpci space
Thread-Topic: [PATCH v11 16/17] xen/arm: vpci: permit access to guest vpci
 space
Thread-Index: AQHaJL6psXyo5g/AOESuTV51rbTuPw==
Date: Sat, 2 Dec 2023 01:27:07 +0000
Message-ID: <20231202012556.2012281-17-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: f88aa59d-d7ae-41e0-9770-08dbf2d5ced5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TFoblPe7cdkIG+CF31m0fHdzEKcUHB+nVJ4ql8yuHAwHWdKtng4Kg2gTA76H2qj3cEsLbbOGB/UW9Z3sRtwnoEUruR5AhrsDLe9+9SOvDvcheCCQW4IVcOdWB7WQPpRPCTbEgNf21/djYPe1i9bQ1Bg6xTJiewxQ/2OkG3GIqbY0souisgtiWE1Ng0V+Asn/GDuU8l3szdzJ/62YrfhViU2yA8vVdc2ySY2O9OKaAbzmR2hh3hnb83L5y6y6hNTSoFCvAbGkOjLAjf+B3SPJoj3ATLKFvU7vxOSHgWkQDlggiOkRT4bd6HZ4/i9eVWCB6/0iWuo9I6gt6aCgWPH6GjcqpovBNH+4tlMsq3Na0nz7MzcMtNkY2XaxC/rnntKechf1NPHqPAxLlqhWvyKOUUaA6HSwIGdkNuVm4GPHPX0MsKwjd7NnxCNhxG0EU0R+roc953jRjLG/vSZf2c9zI+ZJrOSEaQRCgnybRDyAnJ3m05wxeASEJEA6LH9tYdRPJnEGf8hqedy3OP4+pnTuTP2lcwA08J1kg8VMQ3fu0i391a0euXqQv3lk57dVFfJU4xdjniPmiwNwH9azBJfb0corzopa6lpmYf85LXQHILSksicvD1pp4/wDi95b2jZg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(7416002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Fwz1+ysKbbDmT8z+qXOD4TrkiQkMe6nSowDqR1CBUNB1L+DDZvhterRx7z?=
 =?iso-8859-1?Q?YuqMTQZmh0xf12dFrY3mtoAkY0X4ewf5yBtryKNjlrnqk7GV7d9NZ504X6?=
 =?iso-8859-1?Q?37NwU+/fZmbMEIwqAEh7NzHMGe3oCWuWlaHyULD72+axK4S7kliXVvGdrp?=
 =?iso-8859-1?Q?wogUT9KTQKLgWh2MhJTuggLEj+faBTxqN1q7mw1gC5bLSJ9AS7mDFgFg0c?=
 =?iso-8859-1?Q?P5yn+rfJ07+T5m7aaBkoabIdsDJn6ihqcLJ//28k34/OHI2eOQad7ra7vK?=
 =?iso-8859-1?Q?/FJRtFWKS/XRUTwczo1TdisijcDAmUcvd3PEK9V2iur7NJJeAG4VmeAFgu?=
 =?iso-8859-1?Q?Tbe1WDJ+Acab76ke3M5F/ODUdOnreDxkahuZEz5ekEzsv2GX+rncnlmwGD?=
 =?iso-8859-1?Q?9I+RgfmC+dGy3grbMOK5B15AjR2FjxLHDyNZdYeNfrMWo7g9b2jUn1IOUY?=
 =?iso-8859-1?Q?sVfpnkZ+dlRTVN/CSSS6Etlp7SKvAstJfumFBT4H7N9L/9QQDIJRhjE2vs?=
 =?iso-8859-1?Q?thOWQQxeRvhhfAoG9SFbQMfPnR+0sGfw6a9sxp9McOAjI+I8YX8SgyH6VL?=
 =?iso-8859-1?Q?hpHK0h7dg6+osooGGpyXWBQ7aLwQ/SIi+OHsz2LeTHjtEEtF4ddjhI19yQ?=
 =?iso-8859-1?Q?vjvG4rMw/qhXOW/tXUYtnG4sooz5aQyZz4ZNOf08gnBR5Qb8f3XzzVw1X9?=
 =?iso-8859-1?Q?wtGcR7z04YC+s66FkYV3myf4Rn1/zvb/1iMaTozIfEblR6vqfwdRN/Y5YN?=
 =?iso-8859-1?Q?hIaILCjepKzNfE0sTlOa2yC05A2hXAUzXu2NwRMf6sAyohZ4cXf8a3vAuC?=
 =?iso-8859-1?Q?hoeg1w4gPeiB8f77rYgIij6STtgonRCjF5QhLI4e3wMNQfGmyLQq+/uikJ?=
 =?iso-8859-1?Q?4jjCQYvtZIrp8vFM6yAG2J2RaFDOIrv39r9WyG6xzLQd6O5YT1v9Lo5s6y?=
 =?iso-8859-1?Q?Sq/Hj+ONlirl35IyjrQolHKuw4LucV0ZyBGvJzwvKXepRqgnnmyg4zI6UF?=
 =?iso-8859-1?Q?g4vdvuktU13u13TU8TGOWmC0AWsqqopqI8qQ1Yb70XiTq06W4qZE6jWDId?=
 =?iso-8859-1?Q?oKWIr+6ACaPu5aJy+bFow8O7gQ6vItr2xPMY3FltAR8K1Jsq+d4xhZo66W?=
 =?iso-8859-1?Q?RaKgBDaDmf3a1JzXU3KnMQBdyCt17Ov+XkD2813LMw3JfFC284B/UrGues?=
 =?iso-8859-1?Q?Jsj+UE2i1QrL4J9awiMpPGkNO6i2sNi5w2WJOK4fFK2B0HN62S2fklXNoS?=
 =?iso-8859-1?Q?+H2xh2Bt+IWQmMKFrfm5uvUe+w2fLZu+qIGpR6SbA7VEYi/ygU6nfIol5x?=
 =?iso-8859-1?Q?NwdR0KXA27OtCQqtne/T2LV+4xzttShbrDeGKTCh2PEzEwPDoKfUp1QjSF?=
 =?iso-8859-1?Q?hpZ3YelmNCb2tW5NH3JzsIbKFFsE0rsVDUL6wpKqdblmcNVWmBjcADjzee?=
 =?iso-8859-1?Q?ZhCJQitSf8AAKYmi0zYAt+3//PcZRM6ZAul7tieAQFRsJ8Mhk4/tEZet9r?=
 =?iso-8859-1?Q?uPd2C53fclkBYshV/ivF43r5q7t2YW2NNy96wETSpPCKHPcdS5SMpLlnj2?=
 =?iso-8859-1?Q?4efjxHdDcJS97nTrC4Lqc4eea9/9NNqqLRhELM/qgmwNDRnks/YIfxP2U6?=
 =?iso-8859-1?Q?hSJZmNpKWbitxSiZXg5es7uohUyF4RhspcHVsbw3ydcE1/llW1RHlr4Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88aa59d-d7ae-41e0-9770-08dbf2d5ced5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:07.4675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCsHc3wz1+dVzVYuVNuZ0AbUHPSC500soctpl6D42mEKaUB9cvY8P+fsB3XyrZL1ksJLz6jMJw9PLHQpi39doupGc6Nh6CNMGpTe24oo/Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: dGrDLNxqCYl5a5Kf7fTKg2uqQU53M4Ue
X-Proofpoint-ORIG-GUID: dGrDLNxqCYl5a5Kf7fTKg2uqQU53M4Ue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=720 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Move iomem_caps initialization earlier (before arch_domain_create()).

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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
index 348ba0fbc8..b6ef440f17 100644
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
@@ -115,8 +116,16 @@ int domain_vpci_init(struct domain *d)
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
index 9b8902daa3..dccd272533 100644
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
@@ -711,7 +714,6 @@ struct domain *domain_create(domid_t domid,
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

