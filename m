Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E477175A379
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566258.884866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb4-00022O-QN; Thu, 20 Jul 2023 00:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566258.884866; Thu, 20 Jul 2023 00:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb4-0001xR-J7; Thu, 20 Jul 2023 00:32:46 +0000
Received: by outflank-mailman (input) for mailman id 566258;
 Thu, 20 Jul 2023 00:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb1-0001JN-CE
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef07d056-2694-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:32:41 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JMeiB7017190
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:39 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgyx9k43-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:39 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:33 +0000
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
X-Inumbo-ID: ef07d056-2694-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4IAAEfkzQsbvRlDDa17C5fdwQkIDR8WAyiLrE65raG1Vt67H8W/ArPD72U+7YVRq0vc9FOb3Z8IwXJJdtD5sWxdIzntPVCr/h7PhZq+yxmVeCyZ7qa4IxCipj70HJTsRUNYNfxAz3Dr3ovAVemxPk47AS3XRbxNcyKxoZReQBe6CTTLcN11O/j7FoILajeKJAf/PV6n0MY0vc1ASGoN/EZ32COFCB86FzC6xgcSe413Yg+YqFGSfbmlkFHTnwnuSdn8aHPp4wOIkkTe72xoOP54xSyc56TGV4pWDgKp5Xr32m8AEeJQYvApfn2nnci2HcPSIeONX3fjD78vuRZflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47oYdY92/xdhz0lVCilDwn1lYzCxtQyRzltahBREZd4=;
 b=LtCfVutNjdvZIKZOEP4ydcqXJvrobo0WcZfED8ssJCDkpj9yTTTwwrJt512udvDqNCf8TT3YGqj/bW0u25VMF70PyhHYhV/h5xjuXaUSI+naKrjaYG/m/3rsLp9okzXuUp4T2SkoNvdBymsOG6WmC5GLSmdm/YVaRwB4quvg7Jx55EzTLWlf9PLByeE1nhACABjQPnckK1Q8bmDv9bS3FvHS5fS7r3oh5qD3E5EFBv9GcK3WSfCI/cAziEwH0I3lLSKvONiTp/Z/eLyV2HFAKE/rcnZllUV+KMgT2PLsOh7VRbz+lhlr57qZpA1YSYEpCjkx74ZYQ+v1sflo9ylQvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47oYdY92/xdhz0lVCilDwn1lYzCxtQyRzltahBREZd4=;
 b=Avez4eDF3dpAmhUCNnbHldRA9tNFpHgdsFjvLvuZqKih3Y2WPKBlG5Xf/AhIPAB/D3GyVgBZU/nP0OgfrQ+UyCrOAhDQYSns0+aTBKLKYW2GoWAEQkDE5tWUI2C8QtvrA4AGWE4swCuZsAcTKphZdDQ3Q/pWzRsAknkz1buTigAE7kHulJrss0cR51wnZX0kApTeNRnl+YFZJ6Y4LWQa2virAMDwOYC0oFMxF4Rfs+iZFMU/Nc7ZDFOEIn0YJinnjjW+4PXWeTbA2GTyBxCQkIEjgOqA3KB/lmKnhLooUjHkaDcVHmaAIg+qBB2CxHxTvN87snyESeX+R6UMvty9vw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: [PATCH v8 05/13] vpci/header: implement guest BAR register handlers
Thread-Topic: [PATCH v8 05/13] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHZuqGsyq2xz4eSA0OJuZWqMM1tiQ==
Date: Thu, 20 Jul 2023 00:32:32 +0000
Message-ID: <20230720003205.1828537-6-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 14347ab2-45a8-4005-b09b-08db88b8cf2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Nf5JftkPigHZ3pofGPDnsayT2K7vwxoRLIA7KiuSWTOoi2nMxKEnmJ6SuZrVQgjYHi09Vbz2aocIS4r6bViEZPlCUkbAv+jASBRjGGFS8CMmxSKhGVvN40SPSiAJ9Auuajt9GOCWFMO+L95JVjpX55dBGiA+t+lsZgM/2R4B+5micq0P6ho+tEEXutNBFZtWHVOCXYImCORi0cE7EtqOK8o1KlgruEO/puV5vbig+S7ypVBAORKChyIlOKa35n8NqDjg8G90LIV2LhQnskXgBv7OCbjYajXccNsrvLISACGI2mk+HapHU4a6Y3ZEMa9y2Khaxmx1K8crdB6BV7dFVxwm+yIJXf5Q6j15ISON0t1CQIPVaS+wMUv2Trm+zITVqTrs2eHvshbRIWI81M30qLa3KnVSR/ksagK7dHeyFexG+jFR7+AsU/EW3bZxV/yNS1p3B9CnoF9rvV4ACPxHJYxPNWvgUw9VFLuk1E3w1j3WrTrfv1m1dKsrrj7HEF77Bc7mChzQFdWrTNAslJGeLzlWKAgX7DY/Nx7LVd5e7Dw4lkpVttt1qq8gUi+dBsfb8erJkMgs+AGSV4y22f5LYhEqhE1tlqH/xU14OobKSeTEwOzud2TJ1VsT4XZJTsVQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?fwnCYpu+qHtMGGkhWcbpZkbGH7mufrjWPqgc7GzAYpzYazsvyZ5LaseZhu?=
 =?iso-8859-1?Q?GPo6NRCFyQYCJ8toHfuJVvmiTxiEeOugLsNTeYMjxyaPbiB6tn6n58DmKF?=
 =?iso-8859-1?Q?yq9Gf+dRMKNqGV46DimWYC4jLZwSHwRjqCQP9zVHMkOM5UdkKSurbbDgkx?=
 =?iso-8859-1?Q?U9NydCuWtUMRru0j0EJFNuJTSuFnz+jH2FLb+dA+NiBNgb5FIfMxgPGhsp?=
 =?iso-8859-1?Q?BwM/KmpzDtmawzC5JEYNjo28aFUVdWll63D0RY6u1CzizBwK9iTdGiRP4j?=
 =?iso-8859-1?Q?Rto/W9zgaGFu+gbnqH+PJFh8Y/xlg+Q7QjhOZF6ekBiDeqk7ppRftsk84i?=
 =?iso-8859-1?Q?VzK22bnnDlH+KIUWRnb/DVvU/ucQwoYteeCEgVdAHtFpLJOdcxmzigqyKQ?=
 =?iso-8859-1?Q?s8A77GuLksarUsAh31vcOzFUV5x/84u4azmoqn6OLFE5OvSIb1CthPTNph?=
 =?iso-8859-1?Q?6AE6HXLxODXuq9MU8L4wl+dYPsmYfZKSo8Yz8gpBfFKAK8QcQdPySdwoJ3?=
 =?iso-8859-1?Q?beKcLZ5I4KM1k81p6nhEYssoHNUl0xX7EDLSdFm2EFX3sDXLlmFt3oboIa?=
 =?iso-8859-1?Q?49M5nLIjSVCOeDT2zS8XILPvWIGFmoTPQhbt1T/fqiR8x1Nj5aum0M65Hj?=
 =?iso-8859-1?Q?xsoi/3jCe0QPepATf0/GRzagMM6YxjLvExP5OSQ0Tfn2JqaNNJHpBM56ei?=
 =?iso-8859-1?Q?iCFdEBurT4AAoG2kvp9GqHKrNBytmbo96Kb7GknTpFJVD1/+NQ7sUmLqA9?=
 =?iso-8859-1?Q?HexP/gKG0pCa1vbLHZJwrfcPlRB+2RiaH5CNoQkwT0LvP7pT4PHux0hRAA?=
 =?iso-8859-1?Q?n9q/F7gOLgVcCz08MwRi8BvRX4gmLj2j2/HHGYVaTZM2yjWQHOwmRK/3oD?=
 =?iso-8859-1?Q?sPXTXAEaQ22s07C2+Afu72NdYT4KFrP+wm9wspHVZ0/otxjnI7khF/NdPe?=
 =?iso-8859-1?Q?cJfe0MmwRQqrn3F6Srdw+OHfZrAEnrIq8n4B6FX9/KXRadOEW5MY8+Ubzn?=
 =?iso-8859-1?Q?0xhMHqQty1H/yFKYYRrHNM+NkXuq1BGK3F2coqT+oFmPDrpxcWCjeFY2pw?=
 =?iso-8859-1?Q?TmAJlnSML1k2XsZT0tCVQt3Yb3CYr7as/Qmyp01oXTp2YR3OR7pBDtx86d?=
 =?iso-8859-1?Q?pjNNiWWDu80XKc2HUMsjro0ovuJZlT3oT0U0hwVmaRirkTcUkRVCD/JX43?=
 =?iso-8859-1?Q?+sBGFruNThNS6NJSX0m227eEmg+sg1FQel4+fhYe9DWqbzQQsJgWM8QYsS?=
 =?iso-8859-1?Q?F/TfAIDzmocRUPBY7AaOvUAy1z6F4IiaVUM4Zavk5G8gzaMx0/tbjfz2gb?=
 =?iso-8859-1?Q?CoDpIdHOXYON7cGJ2gL+rDY721+RP9bywz4OMURYFFkTTP6DoRKeuhbLtx?=
 =?iso-8859-1?Q?0hDoD86mHLXj2RvwCwTDQbBmzVNX7BzY/pEsMcQF1/235uyS6x46LjQZZw?=
 =?iso-8859-1?Q?owfG/8Wl7V/8es5/6KpQh6hZHVTcTbMdYhW5wgfOeaX4m4hxVLaNLzvfJV?=
 =?iso-8859-1?Q?nWVdjU7qayZS7e12A4z8IArH71/gWmOcuGsxeC2GD1hqjt8WFwWUxu4mVO?=
 =?iso-8859-1?Q?4AtsPl3tNgOBZnUUQcGaZpnCeukzoyTfmWjQdtJNZNGZbGPdQBYtNMshEL?=
 =?iso-8859-1?Q?uBJ8DgDbhBsfCLmSMxwSOep9mLA3Ie4o0K7Gbain+O3fI8k5mP3164Ig?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14347ab2-45a8-4005-b09b-08db88b8cf2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:32.3931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8RWG2bOpi2oQU4HCv4RrlKof3RxWcLf98L+G+4Qk3EGlOHuK81EY1P876O7V8Wb8sbWWlKyZS11XTzRxZy8dpaEkdYMlCnxU5fMX/jBRMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: KmXizPNq9VrH_mBgkg5SXfcwwxWWp4S5
X-Proofpoint-GUID: KmXizPNq9VrH_mBgkg5SXfcwwxWWp4S5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

All empty, IO and ROM BARs for guests are emulated by returning 0 on
reads and ignoring writes: this BARs are special with this respect as
their lower bits have special meaning, so returning default ~0 on read
may confuse guest OS.

Memory decoding is initially disabled when used by guests in order to
prevent the BAR being placed on top of a RAM region.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---

Since v6:
- unify the writing of the PCI_COMMAND register on the
  error path into a label
- do not introduce bar_ignore_access helper and open code
- s/guest_bar_ignore_read/empty_bar_read
- update error message in guest_bar_write
- only setup empty_bar_read for IO if !x86
Since v5:
- make sure that the guest set address has the same page offset
  as the physical address on the host
- remove guest_rom_{read|write} as those just implement the default
  behaviour of the registers not being handled
- adjusted comment for struct vpci.addr field
- add guest handlers for BARs which are not handled and will otherwise
  return ~0 on read and ignore writes. The BARs are special with this
  respect as their lower bits have special meaning, so returning ~0
  doesn't seem to be right
Since v4:
- updated commit message
- s/guest_addr/guest_reg
Since v3:
- squashed two patches: dynamic add/remove handlers and guest BAR
  handler implementation
- fix guest BAR read of the high part of a 64bit BAR (Roger)
- add error handling to vpci_assign_device
- s/dom%pd/%pd
- blank line before return
Since v2:
- remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
  has been eliminated from being built on x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - simplify some code3. simplify
 - use gdprintk + error code instead of gprintk
 - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
   so these do not get compiled for x86
 - removed unneeded is_system_domain check
 - re-work guest read/write to be much simpler and do more work on write
   than read which is expected to be called more frequently
 - removed one too obvious comment
---
 xen/drivers/vpci/header.c | 156 +++++++++++++++++++++++++++++++-------
 xen/include/xen/vpci.h    |   3 +
 2 files changed, 130 insertions(+), 29 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 2780fcae72..5dc9b5338b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -457,6 +457,71 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
=20
+static void cf_check guest_bar_write(const struct pci_dev *pdev,
+                                     unsigned int reg, uint32_t val, void =
*data)
+{
+    struct vpci_bar *bar =3D data;
+    bool hi =3D false;
+    uint64_t guest_reg =3D bar->guest_reg;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi =3D true;
+    }
+    else
+    {
+        val &=3D PCI_BASE_ADDRESS_MEM_MASK;
+        val |=3D bar->type =3D=3D VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TY=
PE_32
+                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
+        val |=3D bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+    }
+
+    guest_reg &=3D ~(0xffffffffull << (hi ? 32 : 0));
+    guest_reg |=3D (uint64_t)val << (hi ? 32 : 0);
+
+    guest_reg &=3D ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
+
+    /*
+     * Make sure that the guest set address has the same page offset
+     * as the physical address on the host or otherwise things won't work =
as
+     * expected.
+     */
+    if ( (guest_reg & (~PAGE_MASK & PCI_BASE_ADDRESS_MEM_MASK)) !=3D
+         (bar->addr & ~PAGE_MASK) )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pp: ignored BAR %zu write attempting to change page offs=
et\n",
+                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        return;
+    }
+
+    bar->guest_reg =3D guest_reg;
+}
+
+static uint32_t cf_check guest_bar_read(const struct pci_dev *pdev,
+                                        unsigned int reg, void *data)
+{
+    const struct vpci_bar *bar =3D data;
+    bool hi =3D false;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi =3D true;
+    }
+
+    return bar->guest_reg >> (hi ? 32 : 0);
+}
+
+static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
+                                        unsigned int reg, void *data)
+{
+    return 0;
+}
+
 static void cf_check rom_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data=
)
 {
@@ -517,6 +582,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header =3D &pdev->vpci->header;
     struct vpci_bar *bars =3D header->bars;
     int rc;
+    bool is_hwdom =3D is_hardware_domain(pdev->domain);
=20
     ASSERT(rw_is_locked(&pdev->domain->pci_lock));
=20
@@ -558,13 +624,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( i && bars[i - 1].type =3D=3D VPCI_BAR_MEM64_LO )
         {
             bars[i].type =3D VPCI_BAR_MEM64_HI;
-            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write=
, reg,
-                                   4, &bars[i]);
+            rc =3D vpci_add_register(pdev->vpci,
+                                   is_hwdom ? vpci_hw_read32 : guest_bar_r=
ead,
+                                   is_hwdom ? bar_write : guest_bar_write,
+                                   reg, 4, &bars[i]);
             if ( rc )
-            {
-                pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-                return rc;
-            }
+                goto fail;
=20
             continue;
         }
@@ -573,6 +638,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( (val & PCI_BASE_ADDRESS_SPACE) =3D=3D PCI_BASE_ADDRESS_SPACE_=
IO )
         {
             bars[i].type =3D VPCI_BAR_IO;
+
+#ifndef CONFIG_X86
+            if ( !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, &bars[i]);
+                if ( rc )
+                    goto fail;
+            }
+#endif
+
             continue;
         }
         if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) =3D=3D
@@ -584,14 +660,20 @@ static int cf_check init_bars(struct pci_dev *pdev)
         rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i =3D=3D num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
+            goto fail;
=20
         if ( size =3D=3D 0 )
         {
             bars[i].type =3D VPCI_BAR_EMPTY;
+
+            if ( !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, &bars[i]);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
=20
@@ -599,34 +681,50 @@ static int cf_check init_bars(struct pci_dev *pdev)
         bars[i].size =3D size;
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
-        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, re=
g, 4,
-                               &bars[i]);
+        rc =3D vpci_add_register(pdev->vpci,
+                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
+                               is_hwdom ? bar_write : guest_bar_write,
+                               reg, 4, &bars[i]);
         if ( rc )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
+            goto fail;
     }
=20
-    /* Check expansion ROM. */
-    rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM=
);
-    if ( rc > 0 && size )
+    /* Check expansion ROM: we do not handle ROM for guests. */
+    if ( is_hwdom )
     {
-        struct vpci_bar *rom =3D &header->bars[num_bars];
+        rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR=
_ROM);
+        if ( rc > 0 && size )
+        {
+            struct vpci_bar *rom =3D &header->bars[num_bars];
=20
-        rom->type =3D VPCI_BAR_ROM;
-        rom->size =3D size;
-        rom->addr =3D addr;
-        header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
-                              PCI_ROM_ADDRESS_ENABLE;
+            rom->type =3D VPCI_BAR_ROM;
+            rom->size =3D size;
+            rom->addr =3D addr;
+            header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
+                                  PCI_ROM_ADDRESS_ENABLE;
=20
-        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, ro=
m_reg,
-                               4, rom);
-        if ( rc )
-            rom->type =3D VPCI_BAR_EMPTY;
+            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write=
,
+                                   rom_reg, 4, rom);
+            if ( rc )
+                rom->type =3D VPCI_BAR_EMPTY;
+        }
+    }
+    else
+    {
+        if ( !is_hwdom )
+        {
+            rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                   rom_reg, 4, &header->bars[num_bars]);
+            if ( rc )
+                goto fail;
+        }
     }
=20
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+
+ fail:
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    return rc;
 }
 REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
=20
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 44296623e1..486a655e8d 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -67,7 +67,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical (host) address. */
             uint64_t addr;
+            /* Guest view of the BAR: address and lower bits. */
+            uint64_t guest_reg;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
--=20
2.41.0

