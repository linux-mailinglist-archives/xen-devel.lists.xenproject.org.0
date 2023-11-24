Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC07F86A1
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 00:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640984.999800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6fXM-0001oG-O8; Fri, 24 Nov 2023 23:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640984.999800; Fri, 24 Nov 2023 23:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6fXM-0001hJ-JB; Fri, 24 Nov 2023 23:24:40 +0000
Received: by outflank-mailman (input) for mailman id 640984;
 Fri, 24 Nov 2023 23:24:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+4=HF=epam.com=prvs=569229df20=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r6fXL-0001Rw-AY
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 23:24:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ddba27-8b20-11ee-98e2-6d05b1d4d9a1;
 Sat, 25 Nov 2023 00:24:37 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AOMwAPN014042; Fri, 24 Nov 2023 23:24:31 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uk2wmr6b0-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Nov 2023 23:24:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8551.eurprd03.prod.outlook.com (2603:10a6:10:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 23:24:24 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.022; Fri, 24 Nov 2023
 23:24:24 +0000
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
X-Inumbo-ID: a1ddba27-8b20-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5VkXAhLS1mC99Iq0T0NI3IIk8YiTMTNW7pmF+nOP677+Dr2gVnQcvhDXr7Zq9YRVCl2RgEjbf32VdHVx0jdtLVfG6Ug74rEbooZT0AQckFeBJE/0dd6G5HpYTGjvdpNt44TtlORQufKPibOqUsXoZBkAT9yy0WLjy78ykkE1sHWKd1YnFskvseOBjra18N1b96gAjpeR8HneYXdxoUiA7blJu6tgKucY1v/4r9SQWdn+X3zbbu6OjAgplYN002KLbE2pQUev+s+8vOcs4b9/R3uet71yFX8zCvRjfUbbdVrORwy+2BXp3INyhzWxMDzMcN4zvMNCUn7VRWOMJl1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1sE3o7/1/WPykkUQrLgvygBnr35JJ7+xArB8a3+h6c=;
 b=huE7CyX2ZEIq5Kf7JISLh6KglMfgR/pe1o1vGP6D6Zjkhl0rCcPbXlnb84Ycr/Fp+9XzkyvTjkOc6jhyJ8kpQ/88xV6RDNpPjdxbreVsvAx2bZXSS7Q2qk09/XgBFjSDsTzBr4VVKs+C1MDKg0t1lTmBePcqQ6c4kukYJQkQC2+x0+7Vc8iZt3Id200m3Vc6futN8G4Y3zDOBj4C9Xov3rioJ1hchxUXeNDF0wM7OmLmcN9zD5qRoWBvpA9EFsi21EqPEtk6Tvz2jmTRy6MSOIr8xEg000JnRds7RgvDp5460N1/QKy7tYZ9t2JCrlKXy61CJ7CwKqxEHYz42ex7gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1sE3o7/1/WPykkUQrLgvygBnr35JJ7+xArB8a3+h6c=;
 b=rfFnJzc4Sh9CHT4pWcaokKQnKCfjoIl2rJY5c2gI9qRcKoiVDybsSsaW73GFlANfODsBiHuqf3zi2AusIuWknkFauxflpAqh2URsyApqDvwih8/X8r3w3ycXuOm5dordQib9NP+gJ7bqFlSJZOzO7qLIDggb3s4mRVxKAVMXcdCx7gyJRAmLeXjI8eQHQbjqPs5WF07fszMnZfqh6qK2J+K3Ltk+YgCjEj7LWMQrIXfuV5JsU0TGkoO2ApXZ+Lk31dXTElR39mFnPKh+OjwnUqFOJEGNYc2bNBbb5d69lLffgxpaRbs4uhslRUrKpitu4W3vjvsfZ55WEIuWhrMqdw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v3 5/5] xen_arm: Add virtual PCIe host bridge support
Thread-Topic: [PATCH v3 5/5] xen_arm: Add virtual PCIe host bridge support
Thread-Index: AQHaHy1b0mzAt+6ABEigm2G74/KugQ==
Date: Fri, 24 Nov 2023 23:24:23 +0000
Message-ID: <20231124232400.943580-6-volodymyr_babchuk@epam.com>
References: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8551:EE_
x-ms-office365-filtering-correlation-id: 2624485c-5b2f-4db5-647a-08dbed447eda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0dw3QvhJzIeRch7/T2ifhNUsO8E5XgmhR9UXKqTvfhi1rT9ValVr5Ja5GfKyMIS0t5w23MF2ZTABrjFAeP6nT7+SgZMx/Ya8hsNd6e2Wjz8iJe7TJyuiyRsdvgBRH8qLboX3NXg1QeTUxSrVARFsHWZvq30JV7DjFxEAIyO//EDBU+cOTkhpTx1lTTKnwpPZVxc8m0vYzf5O35zZqbWgEqtO/6uMCAER6/y5fm3vA+yLwhBg1h4ZQxve/p0ewUEF+eIxbuHXXxBNpLP7UA0gNznWN2gOHaoUJ+bBRum36B6Yx7varMPSOPlBB5wax988zGpKj1ULWsXFAMEHe4CUeTw7BEZQdlrthpipKanbEPM8n3VIo0/0Rgz/i9rOJeLv8xkFa50J3i8DV2DVY3Ddnw5LApRKPWvVO9aMQhCH0eAQo2Y2RsFk0aniPIQsOxLzkyWTLZs3QdWBTkrnXA01fK0EneOCrwYAT5dxENMcjOTlDat193Pe4Gs++RzHeCKH1SM5y9z4U3rV3J22tybOSPyRwEDp+2XaTa2eg1TnLC41yuL+Jrxo3z8YxRlVtDvZcetgAB5wILL51/ddRif2aXslJ7PCA9ew/aSdxhdbAHyiX7bu57HvZRdfpRj8ggI+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(1076003)(6512007)(83380400001)(2616005)(6506007)(55236004)(71200400001)(41300700001)(8676002)(4326008)(5660300002)(8936002)(26005)(478600001)(6486002)(30864003)(2906002)(6916009)(316002)(91956017)(66476007)(66446008)(54906003)(64756008)(76116006)(66946007)(66556008)(86362001)(122000001)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?nc651D1DQsrI1tXHu4/DrE5IVnTVih62bIweyETHOzZ+OKb6OpDiYQp5Zx?=
 =?iso-8859-1?Q?skHzHMx+0hGC95uOyVgZv1GquHewkfNKCQVov4qMckhD0W1yZraRj6OCjC?=
 =?iso-8859-1?Q?bDtS/RZrNsIqFxdxhQJaAoWZjODRCKMVJfYCP+iq5SSIshI0tgXfp8o5Ik?=
 =?iso-8859-1?Q?8WaQywi1Dli+xdMMYF4VoWfwPx4HbhwAhtbdacYBaS61bhvmeJHfoqjuiB?=
 =?iso-8859-1?Q?5IWAsVRwNJjLW9DihTy3sZjcg3XbHsOWxzQoFrkAynbfPnlmT0eA1XUSPY?=
 =?iso-8859-1?Q?ZB3b4hrQzbr3sh+H1V5W4BfUvFCe458oovQWBf0nGV9KWt2BuD0vpW24hZ?=
 =?iso-8859-1?Q?zuUg+tqeMwPlj3xaxj1W23Kedst0z5/up5iQJPmicBpDnXXM0rV3wrLkfX?=
 =?iso-8859-1?Q?loZutFWuQi9KtXum4MhVFmtTRRcC/Rql+Fo5lo+MYIQoOYnQ/gAx1vvX6c?=
 =?iso-8859-1?Q?ViK9uWc8fjhbDusV0HkwXIEEUT7yV/+bm2FnCBThqNSAdyKfqE140WZAfm?=
 =?iso-8859-1?Q?koNH86Zbf21GFRD8szn5U6jfUSNHifLBFH40pte+LeeUOEwA/aycEARd+S?=
 =?iso-8859-1?Q?HNnSd4y+xAEiFRf4H8vKcn3jogabV9hiGOyMQ+bPXsHzjaSkf6rRZuD9Dc?=
 =?iso-8859-1?Q?I37StdfCK1n9R35LbLcuQs8VByI/JhP1rzYdHUxzZ82XMrKNGR7qzEi3Rb?=
 =?iso-8859-1?Q?m6FxEMlShdMfR8vyoMlaxHnNUGSfRm2qE7orzmoS1N/gCeTsSZ8DpTJVCM?=
 =?iso-8859-1?Q?KLH+WDdqX+XqSLN7fbB9YNOF85foIKmOn5xai900IeKC0aUgN+xB28Steq?=
 =?iso-8859-1?Q?bsYg+pQS4hR1tEtjpQtvJfakvSJm0ukgfIAtJ2Tl2lFDPSj0KgqvKDSQAQ?=
 =?iso-8859-1?Q?3Lf2sLOQr1XN55v7TDdy4OJiOj3CHRldy3HDawPGsfsy7etsx/IhTd6OEn?=
 =?iso-8859-1?Q?xbdNoipbeNiQ7w7TCatXCRveptdkrN3sy+a/oyjuPOiS/g7A/bqFqNQavu?=
 =?iso-8859-1?Q?6BklwEkeehDFuc8USdxxeGI0RZnc01cLPZew/OImvc/n/TRQ6wuWMTmFg4?=
 =?iso-8859-1?Q?JX1+VMAcfDk1LN/vCRB7HiWL4j6iMnLXd1Rc6JGRnzYKfdfg17EocNurKJ?=
 =?iso-8859-1?Q?q2IVdWebmoewCh7flmE5PXDKX7Y+R4wqLzLjcKU1KPGvAWM+tV7VJ9w7N+?=
 =?iso-8859-1?Q?xRBGp3kYgAeYavgbd+9Gx87pU58J80UeeKlpz2unH0vRtJ1HloBMPlegxW?=
 =?iso-8859-1?Q?6mEiLPY3Byp+42cPUoFTJXl1qtJpBoHrxCPKeBvc/VTxNxUFUYb3Dd2tL9?=
 =?iso-8859-1?Q?ngNEXtLlD9fDecdcc/dHV+w+K+YjfL7LQbTdkIMoIAeseL5FsusoYWH28l?=
 =?iso-8859-1?Q?OOArVNvo0/HRayJfyho0ASNtur2Wb2R1xckfXD3CCHkyJ7JO6naOTCSpdq?=
 =?iso-8859-1?Q?ab1Iu8yTmHpugKdHnPLLuJ0hPVf2pOMX/AG0oaFvI2Jl6J9FM0c9ZZlQH6?=
 =?iso-8859-1?Q?Zkxn6hSOJmWOQmYa/0q2lpIevyKc985995HiSoB/uaWFJcsnrBTtF2yPKY?=
 =?iso-8859-1?Q?5X5pFUbJiKFg69lrEO1LRHY2c4UycokjI1BK7ol8vlvqxfv6nBJDYqi+m/?=
 =?iso-8859-1?Q?zGLGaTw3wzzxH85lHvYepCSWCTmL/4LiQkR0CfxFxG6GZbWuayei0GaA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2624485c-5b2f-4db5-647a-08dbed447eda
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 23:24:23.7566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3VCbrezFxuhWwkrIzUou/D+DEh5gK8wwvmULD316tIvxCmOdQ+BrReAnns9YNlDGUi5O2qIfHdMlpdWAJJoUGf9367lrJWV+CuKagPpg8fY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8551
X-Proofpoint-GUID: IuhptZD8j7yZJTKtZiqN36M2VDN9hsRh
X-Proofpoint-ORIG-GUID: IuhptZD8j7yZJTKtZiqN36M2VDN9hsRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311240182

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The bridge is needed for virtio-pci support, as QEMU can emulate the
whole bridge with any virtio-pci devices connected to it.

This patch provides a flexible way to configure PCIe bridge resources
using QEMU machine properties. We made this for several reasons:

- We don't want to clash with vPCI devices, so we need information
  from Xen toolstack on which PCI bus to use.
- The guest memory layout that describes these resources is not stable
  and may vary between guests, so we cannot rely on static resources
  to be always the same for both ends.
- Also the device-models which run in different domains and serve
  virtio-pci devices for the same guest should use different host
  bridge resources for Xen to distinguish. The rule for the guest
  device-tree generation is one PCI host bridge per backend domain.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v3:

 - Use QOM properties instead of reading from XenStore
 - Remove unneeded includes
 - Move pcie_* fields into "struct cfg"

Changes in v2:

 - Renamed virtio_pci_host to pcie_host entries in XenStore, because
 there is nothing specific to virtio-pci: any PCI device can be
 emulated via this newly created bridge.
---
 hw/arm/xen_arm.c            | 226 ++++++++++++++++++++++++++++++++++++
 hw/xen/xen-hvm-common.c     |   9 +-
 include/hw/xen/xen_native.h |   8 +-
 3 files changed, 240 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index b9c3ae14b6..dc6d3a1d82 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -34,6 +34,7 @@
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
 #include "hw/xen/arch_hvm.h"
+#include "hw/pci-host/gpex.h"
=20
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
@@ -57,6 +58,10 @@ struct XenArmState {
=20
     struct {
         uint64_t tpm_base_addr;
+        MemMapEntry pcie_mmio;
+        MemMapEntry pcie_ecam;
+        MemMapEntry pcie_mmio_high;
+        int         pcie_irq_base;
     } cfg;
 };
=20
@@ -73,6 +78,15 @@ static MemoryRegion ram_lo, ram_hi;
 #define NR_VIRTIO_MMIO_DEVICES   \
    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
=20
+#define XEN_ARM_PCIE_ECAM_BASE          "pcie-ecam-base"
+#define XEN_ARM_PCIE_ECAM_SIZE          "pcie-ecam-size"
+#define XEN_ARM_PCIE_MEM_BASE           "pcie-mem-base"
+#define XEN_ARM_PCIE_MEM_SIZE           "pcie-mem-size"
+#define XEN_ARM_PCIE_PREFETCH_BASE      "pcie-prefetch-mem-base"
+#define XEN_ARM_PCIE_PREFETCH_SIZE      "pcie-prefetch-mem-size"
+#define XEN_ARM_PCIE_IRQ_BASE           "pcie-irq-base"
+
+/* TODO It should be xendevicemodel_set_pci_intx_level() for PCI interrupt=
s. */
 static void xen_set_irq(void *opaque, int irq, int level)
 {
     if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
@@ -129,6 +143,89 @@ static void xen_init_ram(MachineState *machine)
     }
 }
=20
+static bool xen_validate_pcie_config(XenArmState *xam)
+{
+    if (xam->cfg.pcie_ecam.base =3D=3D 0 &&
+        xam->cfg.pcie_ecam.size =3D=3D 0 &&
+        xam->cfg.pcie_mmio.base =3D=3D 0 &&
+        xam->cfg.pcie_mmio.size =3D=3D 0 &&
+        xam->cfg.pcie_mmio_high.base =3D=3D 0 &&
+        xam->cfg.pcie_mmio_high.size =3D=3D 0 &&
+        xam->cfg.pcie_irq_base =3D=3D 0) {
+
+        /* It's okay, user just don't want PCIe brige */
+
+        return false;
+    }
+
+    if (xam->cfg.pcie_ecam.base =3D=3D 0 ||
+        xam->cfg.pcie_ecam.size =3D=3D 0 ||
+        xam->cfg.pcie_mmio.base =3D=3D 0 ||
+        xam->cfg.pcie_mmio.size =3D=3D 0 ||
+        xam->cfg.pcie_mmio_high.base =3D=3D 0 ||
+        xam->cfg.pcie_mmio_high.size =3D=3D 0 ||
+        xam->cfg.pcie_irq_base =3D=3D 0) {
+
+        /* User provided some PCIe options, but not all of them */
+
+        error_printf("Incomplete PCIe bridge configuration\n");
+
+        exit(1);
+    }
+
+    return true;
+}
+
+static void xen_create_pcie(XenArmState *xam)
+{
+    MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
+    MemoryRegion *ecam_alias, *ecam_reg;
+    DeviceState *dev;
+    int i;
+
+    dev =3D qdev_new(TYPE_GPEX_HOST);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    /* Map ECAM space */
+    ecam_alias =3D g_new0(MemoryRegion, 1);
+    ecam_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
+                             ecam_reg, 0, xam->cfg.pcie_ecam.size);
+    memory_region_add_subregion(get_system_memory(), xam->cfg.pcie_ecam.ba=
se,
+                                ecam_alias);
+
+    /* Map the MMIO space */
+    mmio_alias =3D g_new0(MemoryRegion, 1);
+    mmio_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
+                             mmio_reg,
+                             xam->cfg.pcie_mmio.base,
+                             xam->cfg.pcie_mmio.size);
+    memory_region_add_subregion(get_system_memory(), xam->cfg.pcie_mmio.ba=
se,
+                                mmio_alias);
+
+    /* Map the MMIO_HIGH space */
+    mmio_alias_high =3D g_new0(MemoryRegion, 1);
+    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-high=
",
+                             mmio_reg,
+                             xam->cfg.pcie_mmio_high.base,
+                             xam->cfg.pcie_mmio_high.size);
+    memory_region_add_subregion(get_system_memory(),
+                                xam->cfg.pcie_mmio_high.base,
+                                mmio_alias_high);
+
+    /* Legacy PCI interrupts (#INTA - #INTD) */
+    for (i =3D 0; i < GPEX_NUM_IRQS; i++) {
+        qemu_irq irq =3D qemu_allocate_irq(xen_set_irq, NULL,
+                                         xam->cfg.pcie_irq_base + i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, xam->cfg.pcie_irq_base + i);
+    }
+
+    DPRINTF("Created PCIe host bridge\n");
+}
+
 void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     hw_error("Invalid ioreq type 0x%x\n", req->type);
@@ -189,6 +286,12 @@ static void xen_arm_init(MachineState *machine)
     xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener=
);
=20
     xen_create_virtio_mmio_devices(xam);
+    if (xen_validate_pcie_config(xam)) {
+        xen_create_pcie(xam);
+    } else {
+        DPRINTF("PCIe host bridge is not configured,"
+                " only virtio-mmio can be used\n");
+    }
=20
 #ifdef CONFIG_TPM
     if (xam->cfg.tpm_base_addr) {
@@ -225,6 +328,90 @@ static void xen_arm_set_tpm_base_addr(Object *obj, Vis=
itor *v,
 }
 #endif
=20
+static void xen_arm_get_pcie_prop(Object *obj, Visitor *v,
+                                  const char *name, void *opaque,
+                                  Error **errp)
+{
+    XenArmState *xam =3D XEN_ARM(obj);
+    hwaddr *target;
+
+    if (!strcmp(name, XEN_ARM_PCIE_ECAM_BASE)) {
+        target =3D &xam->cfg.pcie_ecam.base;
+    } else if (!strcmp(name, XEN_ARM_PCIE_ECAM_SIZE)) {
+        target =3D &xam->cfg.pcie_ecam.size;
+    } else if (!strcmp(name, XEN_ARM_PCIE_MEM_BASE)) {
+        target =3D &xam->cfg.pcie_mmio.base;
+    } else if (!strcmp(name, XEN_ARM_PCIE_MEM_SIZE)) {
+        target =3D &xam->cfg.pcie_mmio.size;
+    } else if (!strcmp(name, XEN_ARM_PCIE_PREFETCH_BASE)) {
+        target =3D &xam->cfg.pcie_mmio_high.base;
+    } else if (!strcmp(name, XEN_ARM_PCIE_PREFETCH_SIZE)) {
+        target =3D &xam->cfg.pcie_mmio_high.size;
+    } else {
+        /* Unreachable */
+        assert(false);
+        return;
+    }
+
+    visit_type_uint64(v, name, target, errp);
+}
+
+static void xen_arm_set_pcie_prop(Object *obj, Visitor *v,
+                                  const char *name, void *opaque,
+                                  Error **errp)
+{
+    XenArmState *xam =3D XEN_ARM(obj);
+    uint64_t value;
+    hwaddr *target;
+
+    if (!strcmp(name, XEN_ARM_PCIE_ECAM_BASE)) {
+        target =3D &xam->cfg.pcie_ecam.base;
+    } else if (!strcmp(name, XEN_ARM_PCIE_ECAM_SIZE)) {
+        target =3D &xam->cfg.pcie_ecam.size;
+    } else if (!strcmp(name, XEN_ARM_PCIE_MEM_BASE)) {
+        target =3D &xam->cfg.pcie_mmio.base;
+    } else if (!strcmp(name, XEN_ARM_PCIE_MEM_SIZE)) {
+        target =3D &xam->cfg.pcie_mmio.size;
+    } else if (!strcmp(name, XEN_ARM_PCIE_PREFETCH_BASE)) {
+        target =3D &xam->cfg.pcie_mmio_high.base;
+    } else if (!strcmp(name, XEN_ARM_PCIE_PREFETCH_SIZE)) {
+        target =3D &xam->cfg.pcie_mmio_high.size;
+    } else {
+        /* Unreachable */
+        assert(false);
+        return;
+    }
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+    *target =3D value;
+}
+
+static void xen_arm_get_pcie_irq_base(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    XenArmState *xam =3D XEN_ARM(obj);
+    int64_t value =3D xam->cfg.pcie_irq_base;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void xen_arm_set_pcie_irq_base(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    XenArmState *xam =3D XEN_ARM(obj);
+    int64_t value;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    xam->cfg.pcie_irq_base =3D value;
+}
+
 static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
=20
@@ -246,6 +433,45 @@ static void xen_arm_machine_class_init(ObjectClass *oc=
, void *data)
=20
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
+
+    object_class_property_add(oc, XEN_ARM_PCIE_ECAM_BASE, "uint64_t",
+                              xen_arm_get_pcie_prop,
+                              xen_arm_set_pcie_prop, NULL, NULL);
+    object_class_property_set_description(oc, XEN_ARM_PCIE_ECAM_BASE,
+        "Base address for ECAM range of virtual PCIe host bridge");
+    object_class_property_add(oc, XEN_ARM_PCIE_ECAM_SIZE, "uint64_t",
+                              xen_arm_get_pcie_prop,
+                              xen_arm_set_pcie_prop, NULL, NULL);
+    object_class_property_set_description(oc, XEN_ARM_PCIE_ECAM_SIZE,
+        "Size of ECAM range of virtual PCIe host bridge");
+
+    object_class_property_add(oc, XEN_ARM_PCIE_MEM_BASE, "uint64_t",
+                              xen_arm_get_pcie_prop,
+                              xen_arm_set_pcie_prop, NULL, NULL);
+    object_class_property_set_description(oc, XEN_ARM_PCIE_MEM_BASE,
+        "Base address for non-prefetchable memory of virtual PCIe host bri=
dge");
+    object_class_property_add(oc, XEN_ARM_PCIE_MEM_SIZE, "uint64_t",
+                              xen_arm_get_pcie_prop,
+                              xen_arm_set_pcie_prop, NULL, NULL);
+    object_class_property_set_description(oc, XEN_ARM_PCIE_MEM_SIZE,
+        "Size of non-prefetchable memory of virtual PCIe host bridge");
+
+    object_class_property_add(oc, XEN_ARM_PCIE_PREFETCH_BASE, "uint64_t",
+                              xen_arm_get_pcie_prop,
+                              xen_arm_set_pcie_prop, NULL, NULL);
+    object_class_property_set_description(oc, XEN_ARM_PCIE_PREFETCH_BASE,
+        "Base address for prefetchable memory of virtual PCIe host bridge"=
);
+    object_class_property_add(oc, XEN_ARM_PCIE_PREFETCH_SIZE, "uint64_t",
+                              xen_arm_get_pcie_prop,
+                              xen_arm_set_pcie_prop, NULL, NULL);
+    object_class_property_set_description(oc, XEN_ARM_PCIE_PREFETCH_SIZE,
+        "Size of prefetchable memory of virtual PCIe host bridge");
+
+    object_class_property_add(oc, XEN_ARM_PCIE_IRQ_BASE, "int",
+                              xen_arm_get_pcie_irq_base,
+                              xen_arm_set_pcie_irq_base, NULL, NULL);
+    object_class_property_set_description(oc, XEN_ARM_PCIE_IRQ_BASE,
+        "Number of first PCI legacy interrupt for PCIe host bridge");
 }
=20
 static const TypeInfo xen_arm_machine_type =3D {
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 2e7897dbd2..19fcccdb16 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -47,6 +47,8 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, =
MemoryRegion *mr,
     g_free(pfn_list);
 }
=20
+uint16_t xen_pci_segment;
+
 static void xen_set_memory(struct MemoryListener *listener,
                            MemoryRegionSection *section,
                            bool add)
@@ -382,7 +384,12 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_=
t *req)
     }
=20
     QLIST_FOREACH(xendev, &state->dev_list, entry) {
-        if (xendev->sbdf !=3D sbdf) {
+        /*
+         * As we append xen_pci_segment just before forming dm_op in
+         * xen_map_pcidev() we need to check with appended xen_pci_segment
+         * here as well.
+         */
+        if ((xendev->sbdf | (xen_pci_segment << 16)) !=3D sbdf) {
             continue;
         }
=20
diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
index 6f09c48823..2b1debaff4 100644
--- a/include/hw/xen/xen_native.h
+++ b/include/hw/xen/xen_native.h
@@ -431,6 +431,8 @@ static inline void xen_unmap_io_section(domid_t dom,
                                                     0, start_addr, end_add=
r);
 }
=20
+extern uint16_t xen_pci_segment;
+
 static inline void xen_map_pcidev(domid_t dom,
                                   ioservid_t ioservid,
                                   PCIDevice *pci_dev)
@@ -441,7 +443,8 @@ static inline void xen_map_pcidev(domid_t dom,
=20
     trace_xen_map_pcidev(ioservid, pci_dev_bus_num(pci_dev),
                          PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn=
));
-    xendevicemodel_map_pcidev_to_ioreq_server(xen_dmod, dom, ioservid, 0,
+    xendevicemodel_map_pcidev_to_ioreq_server(xen_dmod, dom, ioservid,
+                                              xen_pci_segment,
                                               pci_dev_bus_num(pci_dev),
                                               PCI_SLOT(pci_dev->devfn),
                                               PCI_FUNC(pci_dev->devfn));
@@ -457,7 +460,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
=20
     trace_xen_unmap_pcidev(ioservid, pci_dev_bus_num(pci_dev),
                            PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->dev=
fn));
-    xendevicemodel_unmap_pcidev_from_ioreq_server(xen_dmod, dom, ioservid,=
 0,
+    xendevicemodel_unmap_pcidev_from_ioreq_server(xen_dmod, dom, ioservid,
+                                                  xen_pci_segment,
                                                   pci_dev_bus_num(pci_dev)=
,
                                                   PCI_SLOT(pci_dev->devfn)=
,
                                                   PCI_FUNC(pci_dev->devfn)=
);
--=20
2.42.0

