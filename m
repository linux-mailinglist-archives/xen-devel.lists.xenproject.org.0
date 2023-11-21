Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FDD7F38FB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 23:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638305.994755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5YxE-0007Qt-Ig; Tue, 21 Nov 2023 22:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638305.994755; Tue, 21 Nov 2023 22:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5YxE-0007Nx-ET; Tue, 21 Nov 2023 22:10:48 +0000
Received: by outflank-mailman (input) for mailman id 638305;
 Tue, 21 Nov 2023 22:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqD=HC=epam.com=prvs=5689374ac6=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5YxC-0005zW-Ul
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 22:10:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d092cf49-88ba-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 23:10:45 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALJcd1G031085; Tue, 21 Nov 2023 22:10:37 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uh0hhgrv3-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 22:10:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8836.eurprd03.prod.outlook.com (2603:10a6:10:40c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 22:10:29 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 22:10:29 +0000
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
X-Inumbo-ID: d092cf49-88ba-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX3ln/gaH4iCkGvOG3Hg7dTzsgvUZNFdBN/XvUSAjS7bGgptkeiYtrG7rERiKhogUfCDmuNVuuQvuFJOaVSO1BD+HIVZOWnkPF+6tPquXE9+i4ApOa7NE/h7R6lhJr2dWMoH1+4YQ0QJb7cZIJl8pgrfpYadjxTo5t0c1ruM2UZ6svq34+M47JQXZtXz8ZMhDCY02L2E02AjvxHfFGmMM8qEeu4MLCEsVRNf48bZnE1fkZiLEGimB7Y8By1bRnSMx4vJE48dP36sR/4AC14yXOt4ftyx5GpU8jUOUQJuTnZDPhgwKyDym773zoneYQHtaNcxgEyThSBjbum4Q6Tc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT/fLYQ9fFiiDzgzvoIB754+ETMkPOQmFAJYlsPG/PY=;
 b=UFKwSUgz5lO5DLcVMa8pfV2bkHDgozrRmTuqqrFdd813w6o0B9pIrlyAn7JIZo8A+Ajl7IXs85i9arj7ESXrLQuhN4foHT7q442kJlUtMMbV1dsqt43LwEGP1sHXcpseljbg8iE4Gzn2RJ3boZJSH6d9hMi0iLW36KqzKHajPzSjHQySLN1RKntM/7OoAXAxsDwMHKPY99NAobQFCSXQm9AiaQx3LwXl5zzgqLdu4NS1XRnVHzF204ji61VMg7mMqbq1Edr96YoVN1w4k7N3T/pDJlsewlW4Yr1CkCnTK4XHgWxAgV56XD7Kshh4VazTYjbrMpd+oQ+qpdv6h6aHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT/fLYQ9fFiiDzgzvoIB754+ETMkPOQmFAJYlsPG/PY=;
 b=amevb7n8hxqYpFi6UwB5P94xDa484amZPMdBw35ylSAo+9xqr/HfXvL/UGthOpDZsFjocPrBttuBIqB7lX//Sd9A6ASgC05DRrAI15zK6rzA+Deom0LzY//Mh+rbXI48Vfu/7pc6uwJtGgrT9/AmkG99gz0veZoDtdZOZR33tCMJbYd3t5yfGfhM7xe5jmkS1L28QIN6pNMuQzFC+pmjAxCZC9yifWl56hRQ0rUcG9S5K0U8PVQFjAqp1w1ylMzWJ/OZ40zH98OUXqdKgt3qFsi+qXlKCwCt3L5Po2V2CgP/Ser1bu71OgguAkjaP/eoB0ZlMxST8Z7LCqN9K8EWhQ==
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
Subject: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
Thread-Topic: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
Thread-Index: AQHaHMeJqHnam8LJkECFe490J2r1JA==
Date: Tue, 21 Nov 2023 22:10:28 +0000
Message-ID: <20231121221023.419901-7-volodymyr_babchuk@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8836:EE_
x-ms-office365-filtering-correlation-id: 48ecf155-e2c1-43b8-8a0d-08dbeadeac4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PZ11tRi6O1zWULc0iNQLn3CLjxUwlfvAzP6sJOyI9HsEjI/5mJ6zK4Q9UIVmE2TFCpUN4fRKZQV2WOSV6J3V3LJD6LlS/5yOwsEKe+K9cVJwUHDkUVRQ0A+5RbKYJz3TIpWwlAdevd2Vq5J6ZkymfoxCPcrTimWRus5+AOf4Kn7WhHhojz7W9YZFPf7X1L/Tb0+hXsIDQm/37DGxcxlr3h1QNv0vQXWfGO3EOvY4uaJgMn852zjWKzze7J5GX+MD3dD/qS9ULbWq7W3mcopxk44qgMWAUA8dPVXX4947RuDHyGSBv13Vp1z8vJ66wLFPlrQCwVSY1apgozSkFgte+i+jC+PLWoW1hJ0MGhKG5ci+V4G5wj5dHyzD3lFCooJWuzwKcSGW59IqQ8WQBIsKpGF8ckz+VABgRYjlZiGSVxkyvgc48fj9wB0bP7ZjSOUeGofKXHoWZkjoXyvlwE5WDFaFINUs85iWhlwZ0Q7+BINhQkPGy6TaZ9Rp0Sm2zic5Jrl/Hz7PuZNMexQod4cS9f0RdLCBskcPjFU8VaBdAG9sQTumC3mjiP7b4JQz3+7Br0Z7uPcu4Evs4nJYMxR6PB2B71q7JauimVwMsqgG4hK2JTHok0pSxebLu1j+YSYu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(86362001)(36756003)(5660300002)(2906002)(38070700009)(122000001)(6512007)(2616005)(6506007)(55236004)(6486002)(83380400001)(71200400001)(1076003)(478600001)(26005)(38100700002)(91956017)(66556008)(66446008)(316002)(66946007)(6916009)(64756008)(54906003)(4326008)(8676002)(66476007)(76116006)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4cjwrqnKrg8523Z5oL/N5GkkeLhyfkE9UbrwB+DEIVZaHKGUcUECobEtVa?=
 =?iso-8859-1?Q?xEZQZhebB85B3nuu4AUAwCQwcHTM7H8HCYOdetIq098rHbh3ApII26Yfko?=
 =?iso-8859-1?Q?rqpPc09rqYbElGB2Cc/7zPSrqXvb3hH7hxQNhFJrkNzDsyqp/d6vNgzHEd?=
 =?iso-8859-1?Q?4CSoTk04HEEYIglriXqoRHCNTng0ozLvwCZY+mp9CEJ8p8IIs8u3ZDqU+P?=
 =?iso-8859-1?Q?3hevZjj4B0MkFzBRxtX9eGRYnyJhYjATBFmhVfGCs+t+TZuzceP1pI6/M1?=
 =?iso-8859-1?Q?YzHs1nWe1szJx+CHhtq/XnGy4cLT5m/u7TM+Y5V+fbvjMimHmdfZZgstP2?=
 =?iso-8859-1?Q?e+0lZRgdpZ3NGvqNjhyz+2fkFxs/1krs16WHdBM1oDVzFvotegSnegth6h?=
 =?iso-8859-1?Q?RRS4afZJXWJRrWQ2pQoCVdvpGVbZ9pvd0eAks2pWVYUf73dhUX1+nsDjY6?=
 =?iso-8859-1?Q?cWnUl/isAz2G66YGhk0mIDiD667n4vrNyug/jLi5KHSSE8h9SBhhrITTp5?=
 =?iso-8859-1?Q?jmgI5b8LsIgi7qpcgpP9xo1o9E00cz73bnv1AjnhBeZgLkW0o/B4k8hlNW?=
 =?iso-8859-1?Q?oKiwXvj2mJcCf4/xiUJDx3giCvGvb4VcYVvhcckyyBtLRUkQB8EeDYQEzT?=
 =?iso-8859-1?Q?pa05VJ7d8Wp7MEVTo4gi/SaxWF9Agrs8g4A+h+LnYN7jh/zKcGFccALMOm?=
 =?iso-8859-1?Q?Vw4n8wmiI6YoG+cbXPDE1Ss9wNtLxXz9psgzflW0jGcsKKpYxI2BsPDX+e?=
 =?iso-8859-1?Q?/HHu5lrBhf0TwUxNYpFUtLFD/favdZbyeVc5TjT87wkRCZTE33UbeIRB3/?=
 =?iso-8859-1?Q?TQ6JedwxSueXdHUeh4GQU+D+vjE8lhy6cD1zl8Nx9N9dn9OQuN0RHXi6Y6?=
 =?iso-8859-1?Q?ezvGuEH0AuuUh/WIkUMWU/JnP6VuJ61yh/R/y0PqujcIw0P5+QnogoIOul?=
 =?iso-8859-1?Q?+Z4uiPviua+DUkwUds+dUR87ERad1+HUncSYjFPGIQ95tAj5oBmk67mxAA?=
 =?iso-8859-1?Q?c3lxDTC4VuM393zG8BBC6tHzPd1bA4QNAUq6ZPsA3pF6qLv2vBdShNIFup?=
 =?iso-8859-1?Q?ha4tAVkyFCMsnqDt4TK07F7WY27/yYP3WsSIWfrN8d+4vNsRLkTdNs2lPN?=
 =?iso-8859-1?Q?SNQuihIFIjCGYcb2x237DHF8ewdxjiaBhdCSwB1GbV9zNs5IvB8RWQOG7Z?=
 =?iso-8859-1?Q?EpEroAy96bIryj2RPjwu0VjmCPF8xUXkntJAJZSTWJ6VJsBAZPWhFZip3N?=
 =?iso-8859-1?Q?0Lh163mY5biJQfP6Qr65NJYGO9A9TUhnJvXbpgQlqkN0HrNYim9hwlKuqr?=
 =?iso-8859-1?Q?9tplYiKD0Bn24KNpuHxwMx63Vm4LQNrWamR2PsSl6GTiz7Fa1O//wzK1Pk?=
 =?iso-8859-1?Q?vN5kCHsOcfegRz7eDNebaJX9N4vwcgOBCzVpXaXG1KeMgUkUlMOJN7k5RX?=
 =?iso-8859-1?Q?fcxYhoZ8I/0Jub0KsEVbbDZZgktoykgB+rFd5jPKNOJytwVc/bG/uUbR37?=
 =?iso-8859-1?Q?DkPex4NTY1I89RTllZxDhSdaX4bJB+sxJm6Y2MiqIz1jSAsLr0YPiiNCB1?=
 =?iso-8859-1?Q?v9NMmBEkRKjGetijyFfeEI3R3QGOAfPhp66cBzaw1GivYQ4s75i8J6gGTN?=
 =?iso-8859-1?Q?jpMy3l4bJnfZx4TmJG+1YGQClBE+3ROILBKPdPZ9dAL+QnNYYrKM5kUA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ecf155-e2c1-43b8-8a0d-08dbeadeac4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 22:10:28.8471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fbYNrbwYkBiGBLZzwcq02Hjyn6GknN7vHEKK3b3Dh4tWRLZyyvvSUNfPyTNYKQhB+XPV6A23/zRBxWHzIDvyC5Dcc9hYaQtPGlEHjAJYRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8836
X-Proofpoint-GUID: 71kriaRaYKayEQ3I8ucEsnwH5hDVrM_V
X-Proofpoint-ORIG-GUID: 71kriaRaYKayEQ3I8ucEsnwH5hDVrM_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_12,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210173

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The bridge is needed for virtio-pci support, as QEMU can emulate the
whole bridge with any virtio-pci devices connected to it.

This patch provides a flexible way to configure PCIe brige resources
with xenstore. We made this for several reasons:

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

Changes from v1:

 - Renamed virtio_pci_host to pcie_host entries in XenStore, because
 there is nothing specific to virtio-pci: any PCI device can be
 emulated via this newly created bridge.
---
 hw/arm/xen_arm.c            | 186 ++++++++++++++++++++++++++++++++++++
 hw/xen/xen-hvm-common.c     |   9 +-
 include/hw/xen/xen_native.h |   8 +-
 3 files changed, 200 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index b9c3ae14b6..d506d55d0f 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -22,6 +22,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/visitor.h"
@@ -34,6 +35,9 @@
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
 #include "hw/xen/arch_hvm.h"
+#include "exec/address-spaces.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/virtio/virtio-pci.h"
=20
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
@@ -58,6 +62,11 @@ struct XenArmState {
     struct {
         uint64_t tpm_base_addr;
     } cfg;
+
+    MemMapEntry pcie_mmio;
+    MemMapEntry pcie_ecam;
+    MemMapEntry pcie_mmio_high;
+    int         pcie_irq;
 };
=20
 static MemoryRegion ram_lo, ram_hi;
@@ -73,6 +82,7 @@ static MemoryRegion ram_lo, ram_hi;
 #define NR_VIRTIO_MMIO_DEVICES   \
    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
=20
+/* TODO It should be xendevicemodel_set_pci_intx_level() for PCI interrupt=
s. */
 static void xen_set_irq(void *opaque, int irq, int level)
 {
     if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
@@ -129,6 +139,176 @@ static void xen_init_ram(MachineState *machine)
     }
 }
=20
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
+                             ecam_reg, 0, xam->pcie_ecam.size);
+    memory_region_add_subregion(get_system_memory(), xam->pcie_ecam.base,
+                                ecam_alias);
+
+    /* Map the MMIO space */
+    mmio_alias =3D g_new0(MemoryRegion, 1);
+    mmio_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
+                             mmio_reg,
+                             xam->pcie_mmio.base,
+                             xam->pcie_mmio.size);
+    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio.base,
+                                mmio_alias);
+
+    /* Map the MMIO_HIGH space */
+    mmio_alias_high =3D g_new0(MemoryRegion, 1);
+    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-high=
",
+                             mmio_reg,
+                             xam->pcie_mmio_high.base,
+                             xam->pcie_mmio_high.size);
+    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio_high.b=
ase,
+                                mmio_alias_high);
+
+    /* Legacy PCI interrupts (#INTA - #INTD) */
+    for (i =3D 0; i < GPEX_NUM_IRQS; i++) {
+        qemu_irq irq =3D qemu_allocate_irq(xen_set_irq, NULL,
+                                         xam->pcie_irq + i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, xam->pcie_irq + i);
+    }
+
+    DPRINTF("Created PCIe host bridge\n");
+}
+
+static bool xen_read_pcie_prop(XenArmState *xam, unsigned int xen_domid,
+                               const char *prop_name, unsigned long *data)
+{
+    char path[128], *value =3D NULL;
+    unsigned int len;
+    bool ret =3D true;
+
+    snprintf(path, sizeof(path), "device-model/%d/pcie_host/%s",
+             xen_domid, prop_name);
+    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
+
+    if (qemu_strtou64(value, NULL, 16, data)) {
+        error_report("xenpv: Failed to get 'pcie_host/%s' prop",
+                     prop_name);
+        ret =3D false;
+    }
+
+    free(value);
+
+    return ret;
+}
+
+static int xen_get_pcie_params(XenArmState *xam)
+{
+    char path[128], *value =3D NULL, **entries =3D NULL;
+    unsigned int len, tmp;
+    int rc =3D -1;
+
+    snprintf(path, sizeof(path), "device-model/%d/pcie_host",
+             xen_domid);
+    entries =3D xs_directory(xam->state->xenstore, XBT_NULL, path, &len);
+    if (entries =3D=3D NULL) {
+        error_report("xenpv: 'pcie_host' dir is not present");
+        return -1;
+    }
+    free(entries);
+    if (len !=3D 9) {
+        error_report("xenpv: Unexpected number of entries in 'pcie_host' d=
ir");
+        goto out;
+    }
+
+    snprintf(path, sizeof(path), "device-model/%d/pcie_host/id",
+             xen_domid);
+    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
+    if (qemu_strtoui(value, NULL, 10, &tmp)) {
+        error_report("xenpv: Failed to get 'pcie_host/id' prop");
+        goto out;
+    }
+    free(value);
+    value =3D NULL;
+    if (tmp > 0xffff) {
+        error_report("xenpv: Wrong 'pcie_host/id' value %u", tmp);
+        goto out;
+    }
+    xen_pci_segment =3D tmp;
+
+    if (!xen_read_pcie_prop(xam, xen_domid, "ecam_base",
+                            &xam->pcie_ecam.base)) {
+        goto out;
+    }
+
+    if (!xen_read_pcie_prop(xam, xen_domid, "ecam_size",
+                            &xam->pcie_ecam.size)) {
+        goto out;
+    }
+
+    if (!xen_read_pcie_prop(xam, xen_domid, "mem_base",
+                            &xam->pcie_mmio.base)) {
+        goto out;
+    }
+
+    if (!xen_read_pcie_prop(xam, xen_domid, "mem_size",
+                            &xam->pcie_mmio.base)) {
+        goto out;
+    }
+
+    if (!xen_read_pcie_prop(xam, xen_domid, "prefetch_mem_base",
+                            &xam->pcie_mmio_high.base)) {
+        goto out;
+    }
+
+    if (!xen_read_pcie_prop(xam, xen_domid, "prefetch_mem_size",
+                            &xam->pcie_mmio_high.size)) {
+        goto out;
+    }
+
+    snprintf(path, sizeof(path), "device-model/%d/pcie_host/irq_first",
+             xen_domid);
+    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
+    if (qemu_strtoi(value, NULL, 10, &xam->pcie_irq)) {
+        error_report("xenpv: Failed to get 'pcie_host/irq_first' prop");
+        goto out;
+    }
+    free(value);
+    value =3D NULL;
+    DPRINTF("PCIe host bridge: irq_first %u\n", xam->pcie_irq);
+
+    snprintf(path, sizeof(path), "device-model/%d/pcie_host/num_irqs",
+             xen_domid);
+    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
+    if (qemu_strtoui(value, NULL, 10, &tmp)) {
+        error_report("xenpv: Failed to get 'pcie_host/num_irqs' prop");
+        goto out;
+    }
+    free(value);
+    value =3D NULL;
+    if (tmp !=3D GPEX_NUM_IRQS) {
+        error_report("xenpv: Wrong 'pcie_host/num_irqs' value %u", tmp);
+        goto out;
+    }
+    DPRINTF("PCIe host bridge: num_irqs %u\n", tmp);
+
+    rc =3D 0;
+out:
+    if (value) {
+        free(value);
+    }
+
+    return rc;
+}
+
 void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     hw_error("Invalid ioreq type 0x%x\n", req->type);
@@ -189,6 +369,12 @@ static void xen_arm_init(MachineState *machine)
     xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener=
);
=20
     xen_create_virtio_mmio_devices(xam);
+    if (!xen_get_pcie_params(xam)) {
+        xen_create_pcie(xam);
+    } else {
+        DPRINTF("PCIe host bridge is not available,"
+                "only virtio-mmio can be used\n");
+    }
=20
 #ifdef CONFIG_TPM
     if (xam->cfg.tpm_base_addr) {
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 565dc39c8f..0f78f15057 100644
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

