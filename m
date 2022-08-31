Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433D5A7F97
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395686.635535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR5-0003zy-94; Wed, 31 Aug 2022 14:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395686.635535; Wed, 31 Aug 2022 14:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR5-0003uZ-4u; Wed, 31 Aug 2022 14:11:19 +0000
Received: by outflank-mailman (input) for mailman id 395686;
 Wed, 31 Aug 2022 14:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOR3-0002bw-LK
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:17 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6347058-2936-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 16:11:15 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBpHDA027047;
 Wed, 31 Aug 2022 14:11:07 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3j9huk4eny-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:07 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:11:01 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:11:01 +0000
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
X-Inumbo-ID: c6347058-2936-11ed-82f2-63bd783d45fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4KV915eBKmPv6X9qhSpCZKtA7uIzlw5te+xYV8nGdVQB2hOLb9O36P43Bzr6P1xMn/os2hkQkVeFdtbvuWJmMvjeFQWh20gBKWZxPM1aiCc2VJe09OS2dqxjtk5SG7omJC3JWb37eIWR9qL+lwk2on+Ek1MhS+hgPSXFXplL7NUqra9E9GQNojd/zFuJnC7V6iWIK1B7WCZoE1Zskl2AtNfFcezUa22w2RPrCcXFXnFP0krbQ6EojsKgujDAKmgZBgIUIPR8736+ByAdxnHozmtGiRgKqkcBsfmBChPsFdVHUWWcJOHLewHDHNTB4wjOBd33M00oF+bQRQnItSGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrA6DJoAo0xAR2GhIIjbwMHD+Xks+V3rsePQNzQTzjY=;
 b=mI9Cdiz4OPqEhyMisWELZYRfBGE1HbNL4dYo1RK2heqyZkWwGhSupCxMYbkLs0tC50yvzpC1hfWg0wc5doOAZaIPhi/uuf7R9qktQrbSLWfFdqfnY9czIEkZL/MEbVd0qs/JBoFPegdgaxAxp3PLv7xI8Jq6Snf8siALI6Ck0YiuttRXZoMfXOPqLZiTqmMYTTX7NaEYVplBgdYookjTnF4lOklL5+2GMZND9KKKTipiuhxlQ0xj4mlvRdJKAbKmq5HnMJa2iZdo0RP7CLfVvuR4Vu9KWVEd6w4uVox+FnPXn5UkOC7/9Vm1jsQKbvH11UBDTQ6oChVPqai2LGMqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrA6DJoAo0xAR2GhIIjbwMHD+Xks+V3rsePQNzQTzjY=;
 b=KEzOEEs/eB4HJf5mOcA6dF4hDdzacwbh4cA/8+EtU3Y1E+gHT5jViiwB+9BAaNxBfBI7KdDodhrH6ygpGzmSqWrYr1vA4qXDv7I6nuJZFrIjtvnPd1tReAKlLWY6bDoi+i7BVQkpvLg1HmqkUMiyr1HD5afO13tXFQQnew7HYBkJgL/Y6ZexLdcCy88hQSB6GFkBRd7KwK4DG9dip4m93EhoVL1OQB9cDFukKKHyFUa5xEfZ7q1t1yK6cWPHcz2AChqtXOu3z0cow9Cc08s/ULEmamY4Zdz/Zw4oR4IJpuu117J6biEz52IXAUmJL8DG5C4DrKQQGy5ECMNX4VXGSQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>
Subject: [RFC PATCH 07/10] xen: pci: add per-device locking
Thread-Topic: [RFC PATCH 07/10] xen: pci: add per-device locking
Thread-Index: AQHYvUN/+u7dK30KdkO8lqgvo0jPyQ==
Date: Wed, 31 Aug 2022 14:11:01 +0000
Message-ID: <20220831141040.13231-8-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43a02f0f-3cb0-494a-9a8c-08da8b5aa235
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ypmqomZ9oE1BH1RluJkJFv9w9ikf4j1BR/1mbksiztkZak2o2tlEtGtO//s2Rx3CNEgzgTEsGxBfHKP0D5noRZ/QjS2VybdxFMgsk0ViSQkx6Pc4B0thlTyq79gYMvObmvW6di3/CvMMd5d9hK3WLHAoXYDeboM/TTArKk5vmL+py++pJjSSGdtLIbFkK2UZS4TqIqPLStbpDjDsVYsoqd73v7N6p+PykaITyWrxMMH30eXe1fvkcVU1Zzz4SErSfwht9e2C8hBPR0yrgADrclu+zKIwBGttmELAJdwWlL+lBbuOZDU2sLd2IEDPsKHuE1opLwBIjwh4ArUqA0MtRerRug6Vq5WypgMk3C3tLTb37BG2y1Evv84ZwbyShySkpSVOQTrfc3czpEInP2SeFgjLJl5gCcd2/FlqiqIKFO2h8h5Gb75K2BLPv6G173qATPC/mNzd3XP6t5JeihAhqZPSNg5Y1h2wky831Pardk/aezyQO6pK2Lw9c3ehw+tIiS93LzNyqu+hiEesh4PEAS6qYE8G8piQHq1cNf0N75bi57gv1ElsgDGLmLBPRcqI+3/tjSaycvTvH77yqjp2+GYYqCmbsNXxubgDMSHK24pnHZXI49/KPdXNqeEhafHsZ0wjJI0eTNXKnz85DkytIOOQ0Jel9VQk9pR2JBKNF7/43J+vZbOVA4fFm2+bF7YvHTm2zT2VGUIBmlUxH8sOYBopmEOuUvcGtNRKPvRtOIrt4GeRYILlrewls4G6mo8Cej85PGtzuoi5/HQiFhlvkQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(8936002)(316002)(36756003)(6916009)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?LFDZxt1POjjo7aKVoH+jtGNIfduiQp1kN0XIqFKnBQQGCgfnuzwoMjoaVR?=
 =?iso-8859-1?Q?sxtiPcmz/qHENmdoQnPV4Fsh9JXfhBrwobtZ9WqX/HCNEjw+4wM0L1p/Gf?=
 =?iso-8859-1?Q?/UCpX+6UmbJxRcZgKRT59/ga4ofyUWAPJzEdQf+Ldl8d83obNyOWtfPaRA?=
 =?iso-8859-1?Q?/gvNXo9VgAmrUWsap0+iMVC9NHkIovrCbW9sAlcjbjhOZGaz1WhE62FH9S?=
 =?iso-8859-1?Q?PK61ZRlD8eIhaAI0l+AWJ8fq4wjpYAlsXYD/qBJUfzp/bUdRc8h6wp6VYU?=
 =?iso-8859-1?Q?GU5nN/qC8MowlupQuH0SRemmiWOZlYxQgVAaSlxxDT6lSQVVGMcm6/pD9K?=
 =?iso-8859-1?Q?yFPD99L/+p7T5aK3rqIF2nUsnU51BgipLzffwzzZscE3MWYcH2khvNGMfH?=
 =?iso-8859-1?Q?O9HfZCUO6oj6JnMpIy5afsCvXg2QgsabMMfS0/XisrgE+NX7ee8g1I97Cd?=
 =?iso-8859-1?Q?PDEVnfpWbMGDuwVtPqHVnM6ssfrZeSWYQfNR7YYCnk9ek3zKKPaSceCB/j?=
 =?iso-8859-1?Q?bTmGvvpKVqsU3ic9etlX+3WCUBzsCqcwG81PUmxlVvkHMuUHqFS/p8aQ1q?=
 =?iso-8859-1?Q?QIEqC7jwqRoSJ/fOV3qNv3/7W+oe5z74W2zjq/C4imtnny7AyuJLgaDMWd?=
 =?iso-8859-1?Q?hui5gh5zPTU6O6nTYdq8hI8s92yK/4YgJVQR1jj4gi0DDkOTplJxH92cao?=
 =?iso-8859-1?Q?gWECwN9X32VvC+A/LGECdtE8hUsr8qBshBMNBeiJ0c7i5M4OBhpoIOxd5G?=
 =?iso-8859-1?Q?lBJMwbzaUhpKODFAuDW63N0+tilu8KK+Wxnl0soETncKIswyZd29ezj03X?=
 =?iso-8859-1?Q?/eSon9K1D9OGC4I9eNntl7GXyQTUhqpokC6wQ8rOaY31AvxxTGrTJfN6Tx?=
 =?iso-8859-1?Q?uis+SK3KkPuHbgRFg6W+RasVgLhjm5FcH4umFxRJE3kHvgl4MMarqyEIE1?=
 =?iso-8859-1?Q?mtm+EZHZJdij37bbnYo98ppV8iwcQ9nAITQvhYovWFbh9gbx8PDDvw99qe?=
 =?iso-8859-1?Q?HOPCShKxP8nDiDZr6Ncj/CixDHRehl78V6SPhzzLDh89YuBNPqfN2asirN?=
 =?iso-8859-1?Q?Lu7qc84wbg4ciAesMq9Hx+DyaCkYzJOGPFr0/nXpGHGsRMU2I+XHkFhejA?=
 =?iso-8859-1?Q?KvacB7GAYkKXTiW9lDIcZdYNfRUssEBpGyLLpm3unIU1RFWQZOr3kDRocf?=
 =?iso-8859-1?Q?xYlXVbkYfDCRa7H7eRPSyxzntS1S8q5iF3nR+NHeXEWyv9JIk7JHAfMWK1?=
 =?iso-8859-1?Q?QMYgS4mNFPvWEPbFhXwG0PJ4jvwu0V6e7CFu2sIob7llUGOEvTQf0/mNra?=
 =?iso-8859-1?Q?roswj9P/NtgwnvyLnYLhM0HQ9mkVQitZBVBJwInsqfL1z3b7WkWyE33fW1?=
 =?iso-8859-1?Q?J/dGxAqCXH0Ape70mqZ1HeeJfto9JHAcgr7IIduPmKjsD4la4wyolCuToH?=
 =?iso-8859-1?Q?MS1MGvymTQ3BKYptdRIwXy44KQm90+HiAo0s3B5hMxDrdIUQ5affsXsdPr?=
 =?iso-8859-1?Q?VKRpNakqNCv5q0Kj8b8xzUW+lblysrYu/vJ/qHV0Ou7wyGZIaUjwyaJS/i?=
 =?iso-8859-1?Q?k0qdxT3ipkW2pxWIzMYOL4Y0YWFBExoYu0tQDSGfwuswcdOGZRi30A7Yo3?=
 =?iso-8859-1?Q?QrFj3ic6wR7uJ1lroins9vayrKv921deaGmO+Jc58VjrhBolq8wbCspg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a02f0f-3cb0-494a-9a8c-08da8b5aa235
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:11:01.0617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jr7+mXjxvCEO/VS+k98EWxW3W7Ab3qMbYSNjvNx1RcVM4f3pRKQHXMnJ4ykeEhSuLrApGLQ3ZORm6ApcbjTdAX2W393FW2RK5u8MhjL7AoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: TOWzXLhJLb6IVSkGjodKjVQZGU-iHdEN
X-Proofpoint-ORIG-GUID: TOWzXLhJLb6IVSkGjodKjVQZGU-iHdEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=727 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310070

Spinlock in struct pci_device will be used to protect access to device
itself. Right now it is used mostly by MSI code.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/x86/hvm/vmsi.c       |  6 +++++-
 xen/arch/x86/msi.c            | 16 ++++++++++++++++
 xen/drivers/passthrough/msi.c |  8 +++++++-
 xen/drivers/passthrough/pci.c |  2 ++
 xen/include/xen/pci.h         | 12 ++++++++++++
 5 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 7fb1075673..c9e5f279c5 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -203,10 +203,14 @@ static struct msi_desc *msixtbl_addr_to_desc(
=20
     nr_entry =3D (addr - entry->gtable) / PCI_MSIX_ENTRY_SIZE;
=20
+    pcidev_lock(entry->pdev);
     list_for_each_entry( desc, &entry->pdev->msi_list, list )
         if ( desc->msi_attrib.type =3D=3D PCI_CAP_ID_MSIX &&
-             desc->msi_attrib.entry_nr =3D=3D nr_entry )
+             desc->msi_attrib.entry_nr =3D=3D nr_entry ) {
+	    pcidev_unlock(entry->pdev);
             return desc;
+	}
+    pcidev_unlock(entry->pdev);
=20
     return NULL;
 }
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index bccaccb98b..6b62c4f452 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -389,6 +389,7 @@ static bool msi_set_mask_bit(struct irq_desc *desc, boo=
l host, bool guest)
     default:
         return 0;
     }
+
     entry->msi_attrib.host_masked =3D host;
     entry->msi_attrib.guest_masked =3D guest;
=20
@@ -585,12 +586,17 @@ static struct msi_desc *find_msi_entry(struct pci_dev=
 *dev,
 {
     struct msi_desc *entry;
=20
+    pcidev_lock(dev);
     list_for_each_entry( entry, &dev->msi_list, list )
     {
         if ( entry->msi_attrib.type =3D=3D cap_id &&
              (irq =3D=3D -1 || entry->irq =3D=3D irq) )
+	{
+	    pcidev_unlock(dev);
             return entry;
+	}
     }
+    pcidev_unlock(dev);
=20
     return NULL;
 }
@@ -661,7 +667,9 @@ static int msi_capability_init(struct pci_dev *dev,
         maskbits |=3D ~(uint32_t)0 >> (32 - dev->msi_maxvec);
         pci_conf_write32(dev->sbdf, mpos, maskbits);
     }
+    pcidev_lock(dev);
     list_add_tail(&entry->list, &dev->msi_list);
+    pcidev_unlock(dev);
=20
     *desc =3D entry;
     /* Restore the original MSI enabled bits  */
@@ -946,7 +954,9 @@ static int msix_capability_init(struct pci_dev *dev,
=20
 	pcidev_get(dev);
=20
+	pcidev_lock(dev);
         list_add_tail(&entry->list, &dev->msi_list);
+	pcidev_unlock(dev);
         *desc =3D entry;
     }
=20
@@ -1231,11 +1241,13 @@ static void msi_free_irqs(struct pci_dev* dev)
 {
     struct msi_desc *entry, *tmp;
=20
+    pcidev_lock(dev);
     list_for_each_entry_safe( entry, tmp, &dev->msi_list, list )
     {
         pci_disable_msi(entry);
         msi_free_irq(entry);
     }
+    pcidev_unlock(dev);
 }
=20
 void pci_cleanup_msi(struct pci_dev *pdev)
@@ -1354,6 +1366,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     if ( ret )
         return ret;
=20
+    pcidev_lock(pdev);
     list_for_each_entry_safe( entry, tmp, &pdev->msi_list, list )
     {
         unsigned int i =3D 0, nr =3D 1;
@@ -1371,6 +1384,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
             dprintk(XENLOG_ERR, "Restore MSI for %pp entry %u not set?\n",
                     &pdev->sbdf, i);
             spin_unlock_irqrestore(&desc->lock, flags);
+	    pcidev_unlock(pdev);
             if ( type =3D=3D PCI_CAP_ID_MSIX )
                 pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
                                  control & ~PCI_MSIX_FLAGS_ENABLE);
@@ -1393,6 +1407,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
             if ( unlikely(!memory_decoded(pdev)) )
             {
                 spin_unlock_irqrestore(&desc->lock, flags);
+		pcidev_unlock(pdev);
                 pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
                                  control & ~PCI_MSIX_FLAGS_ENABLE);
                 return -ENXIO;
@@ -1438,6 +1453,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
         pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
                          control | PCI_MSIX_FLAGS_ENABLE);
=20
+    pcidev_unlock(pdev);
     return 0;
 }
=20
diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
index ce1a450f6f..98f4d2721a 100644
--- a/xen/drivers/passthrough/msi.c
+++ b/xen/drivers/passthrough/msi.c
@@ -22,6 +22,7 @@ int pdev_msi_init(struct pci_dev *pdev)
 {
     unsigned int pos;
=20
+    pcidev_lock(pdev);
     INIT_LIST_HEAD(&pdev->msi_list);
=20
     pos =3D pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn=
),
@@ -41,7 +42,10 @@ int pdev_msi_init(struct pci_dev *pdev)
         uint16_t ctrl;
=20
         if ( !msix )
-            return -ENOMEM;
+        {
+             pcidev_unlock(pdev);
+             return -ENOMEM;
+        }
=20
         spin_lock_init(&msix->table_lock);
=20
@@ -51,6 +55,8 @@ int pdev_msi_init(struct pci_dev *pdev)
         pdev->msix =3D msix;
     }
=20
+    pcidev_unlock(pdev);
+
     return 0;
 }
=20
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index c8da80b981..c83397211b 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1383,7 +1383,9 @@ static int cf_check _dump_pci_devices(struct pci_seg =
*pseg, void *arg)
             printk("%pd", pdev->domain);
         printk(" - node %-3d refcnt %d", (pdev->node !=3D NUMA_NO_NODE) ? =
pdev->node : -1,
                atomic_read(&pdev->refcnt));
+        pcidev_lock(pdev);
         pdev_dump_msi(pdev);
+        pcidev_unlock(pdev);
         printk("\n");
     }
     spin_unlock(&pseg->alldevs_lock);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index e71a180ef3..d0a7339d84 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -106,6 +106,8 @@ struct pci_dev {
     uint8_t msi_maxvec;
     uint8_t phantom_stride;
=20
+    /* Device lock */
+    spinlock_t lock;
     nodeid_t node; /* NUMA node */
=20
     /* Device to be quarantined, don't automatically re-assign to dom0 */
@@ -235,6 +237,16 @@ int msixtbl_pt_register(struct domain *, struct pirq *=
, uint64_t gtable);
 void msixtbl_pt_unregister(struct domain *, struct pirq *);
 void msixtbl_pt_cleanup(struct domain *d);
=20
+static inline void pcidev_lock(struct pci_dev *pdev)
+{
+    spin_lock(&pdev->lock);
+}
+
+static inline void pcidev_unlock(struct pci_dev *pdev)
+{
+    spin_unlock(&pdev->lock);
+}
+
 #ifdef CONFIG_HVM
 int arch_pci_clean_pirqs(struct domain *d);
 #else
--=20
2.36.1

