Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ECB7E8488
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 21:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630797.983931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKv-0005zq-7Y; Fri, 10 Nov 2023 20:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630797.983931; Fri, 10 Nov 2023 20:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKv-0005xY-1q; Fri, 10 Nov 2023 20:42:41 +0000
Received: by outflank-mailman (input) for mailman id 630797;
 Fri, 10 Nov 2023 20:42:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vE0U=GX=epam.com=prvs=56783987ff=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r1YKt-0004yp-VS
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 20:42:40 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aec3391b-8009-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 21:42:37 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3AAKI1MQ020361;
 Fri, 10 Nov 2023 20:42:32 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3u9jbx27f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 20:42:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB3PR0302MB8991.eurprd03.prod.outlook.com (2603:10a6:10:437::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 20:42:25 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 20:42:25 +0000
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
X-Inumbo-ID: aec3391b-8009-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8jo9DaTQHselkLEVbKvhgXbwpfsRdbiK+1l7/PCa8iR8Gk5YyIeT9HV6BkS9PAhaSJ8IFT79zRSUNwLLoXzwI/cQvkQtCO8Qc4iNhT1YxDH7OJprI/lU8C8OASE9P9/OCtGlW4WN8eJqS1Kfs1/CjwpXB4X5n80K6Ap+0Tf5U6wPZbeLxgkvuVZbuUgQQHeusSCbNDugaj/gyacPO+ky9oazzuK6Ft9jo4ekYvSnlIcAxN+mHUNNTbr+Vlv9aaAOr3YBLq+p/BxxdcQO3EVmZ2HCYC9zy7/CDl0n+hkyWHBYEdd1yPv3agC3sGeLRwg2Kd2L7jPuNJRlfrvqVbqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQr5NbNk/LsGXPtDi59H3/Vtk1SC+nBMV+Y5YtBMVTo=;
 b=b/f3xonK41fGxgUOG6XCVUT1y3oD0GxUckYAvmieiGqRLrSLTG8Ei+jDAlaYn5jzjEhfbvsdJTCw8f1OCPmF2/Lpqe/uFgsjI5eBXmimU2dVnuuJM0tAMH0M5mFVGZcVc2UzU+WOiwsvVA2JATMYIwNmxxcWbwzzESAYR3TXOfe1P9n8wSZ0+ADOaD5+4FlhKVcW84AK57DinBygcXDanKQbkzEsqrPzvMPcahUF5OSPU67VNRmZxlUZXbV6a6QGexWjbPfcU9UGxlLEIdssaT8w6AvKVzDu3Xqf6HYyxS38rR5SDzZCllhzMTzWkQnygR3OnkevSfYVQQSJA0xPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQr5NbNk/LsGXPtDi59H3/Vtk1SC+nBMV+Y5YtBMVTo=;
 b=S2u5aL+6ddDqU33BeXbGx+uFPhBonH0LPJv21LudYVehVh+b4jfF3QL+9TkYoenVVImWfGrU4seDd13IQ+0iEG9l2S1CDYAruFETWQB5LlYG84xbm10fxPOWHSNdoJt4vMk+w4Gg+dL7vB7VGNAklQJB97UKRvvdGE628R0s9QaUBmi7EgtBmUczGkBQQoW2L7KUSVsd9MrFv4Y3Nxl2KEs3LGH9XFnAvKoMM8qA/xlOvoxs+uf67qyZ369UHMF9hOZHBqfeK6jaVM9X1O3OirsrMwFmmdaqX7MUi4jLw4Fdp6Yl6zLfVvwndBFJE6qwJ4JQSIeKQiIAOO8PhjrH3g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard
	<anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:ARM TCG
 CPUs" <qemu-arm@nongnu.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v1 7/7] xen_arm: Add basic virtio-pci support
Thread-Topic: [PATCH v1 7/7] xen_arm: Add basic virtio-pci support
Thread-Index: AQHaFBZpa05Dc66DRUqpQfiy75awpQ==
Date: Fri, 10 Nov 2023 20:42:24 +0000
Message-ID: <20231110204207.2927514-8-volodymyr_babchuk@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB3PR0302MB8991:EE_
x-ms-office365-filtering-correlation-id: b652af3a-6098-4dfb-1f13-08dbe22d8be5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P1MjZH/ndxFdNGjLrLQjyodaCcCWHvZef0JEMD0iq414F9M9++NgC055vSsfzq4tn9yaJtNLsxWvIeLgoXryFIHBnLLMr456fayHsj79XCKeZzqLFrJGSn3yCcxy+2JQthI5/MkfNKfGHbIJFXxUzHta+RKb/tyE31RwaKu8zSIufwuuOXjhcmVZTOty6wx2suZHOwa6Av8VW8C+7CSuXu5hN3fENmyrhawagflAa5nVSZT/V2uQ4CMzgm5BUc7HfvzKxanSjLCFi8U/xGd+fSjaNV0Dnt+0CIDaZyk1SQOALxNN97Bb0u95yh2p8L33ThPSlYyU1TTRMro4Zpat3fh1X6cx1i0YkT14jsCgmfflFF7Qfi+pIAHLAIMMG0h2AvAvT8xqdPmkllcwnwqK9X/Mwf0Ae5jgqtZwpDpk+Kzqo0rt/IpLe+/msY4LJbx/x/GuX/9Z9YboWKVuUXCM6ODubBHSYR/ahGBSTd40RVQddx3k6KBn3zInqyh5JLrumeq9BlqxcIJzxKwYdTR//Fq6Dze431Mg/uvde2Es2jtSiYu60UiIY0NqutGgvDfITVkioF+AUyzCOajGdbci6evmbFezkkSmbF7fgCoeTR2CFdKuELoqO4iMjtMjlmN8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(2906002)(8936002)(4326008)(86362001)(5660300002)(38070700009)(8676002)(316002)(36756003)(83380400001)(38100700002)(478600001)(2616005)(1076003)(6512007)(6486002)(71200400001)(122000001)(6506007)(55236004)(91956017)(76116006)(66556008)(66446008)(26005)(6916009)(64756008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hZ8QAbO3H9AAWFxvJi4+qIfoTqamDgikWUCihisG4Ag6mkRkHL6HCruAvO?=
 =?iso-8859-1?Q?W+hqc0Y4xs8gFl5/PY4vJ7mrnKlI0imy4RNOdVTs30Aa8NxtbtgyS69wPq?=
 =?iso-8859-1?Q?aU8OM2FxrEEWLoMkZS6RX6m7EkFeUqYPr/n1qu00qW0FndUAzLXv3Hv4o4?=
 =?iso-8859-1?Q?/OaJu7V0bqsuYv/Y925QIFc+ZZVR3/JCDVO+7Zt1V8WA8k3Hqlw34iHrJO?=
 =?iso-8859-1?Q?TkBXPtUTpONSXvP0An4i+xws45jx/HiEqEhPpSOU2MGwRvBw6/b3S6ueCE?=
 =?iso-8859-1?Q?uNAcxgSatpZ9jVUadWBr5EA+V9ReFDOKeC7Kz1FJhKsvQvDuVpSiOBBH4R?=
 =?iso-8859-1?Q?RXce6JvA1MEtqrx6VApnCdv8IEhJ+gXGnyPIL+BZ84fKj6Uq57TdqmnjHh?=
 =?iso-8859-1?Q?Va6qzHMV+huoPBTMNErAx1cO+A/cnJjndcblHgXyjTkXVxlNDCZjnpPcV8?=
 =?iso-8859-1?Q?Wglj0+gIT6FxpwjgEG9VaWBjeuQKkSCn5U3VcrijGWw7yJMHBZnszmzg7N?=
 =?iso-8859-1?Q?M5fbw7wLFYYWkjXhd/A/l2PzNp2AfTYxzEPRkIk4M07Z5RGOTRRgYJItKM?=
 =?iso-8859-1?Q?VuybZiIdJunqgI5VNk2PhpRvI9FjuYO6vL6VmTM5CeqNkhNOOAD24RxLJs?=
 =?iso-8859-1?Q?XRCtsj6MBbIW5y0VXSYdsjrEsNQVo49tXyli1vtZofAIkKbwuNpw/7zQ3y?=
 =?iso-8859-1?Q?dsEru2UQd7AEg/Y4shbjrI6PjkFmYpY7g4N3uB4tTga7HgRYk3W6frN2Tp?=
 =?iso-8859-1?Q?ri1V8sLUHaSUj/c1zrm8JeaTuhgc230SqA6eCHflSOs5v9WpzZ0EoIAjxK?=
 =?iso-8859-1?Q?2sFqsi7QjURDY1I2e20NA0xwYjN/0R75JYXkN1j318BDn+ab2IpjZ8eCOx?=
 =?iso-8859-1?Q?RQKM8cyP4fO/me85exuWQ+CKQHo0BDeEJR/AM8plbKrblQ8NBdq9ctAPsO?=
 =?iso-8859-1?Q?vac2Fj37wn5TnuL4Atp4uoxxSJebzU9wXYh/kFFepc8lCzE1A7yRu3kK8Y?=
 =?iso-8859-1?Q?f5qKA2uINH9sEQUiIVeSMxmXjm5iQRAZo0vlW015BPPzgGl4521rhq0Uct?=
 =?iso-8859-1?Q?mDFjgL6rC60SXPcpMo8Pf0vwWqlPVStGwSgPJ03jv1RKNYqoR8jOOBZBIG?=
 =?iso-8859-1?Q?EFPIdu2GGXlHSvfSc82jboOU+iGZtLOQQYQq0oFNmdGtVJthfnsrukV0XW?=
 =?iso-8859-1?Q?Y3KasHz2Sf/hwjWfuseS+tL2TErANF2Gil71F7IG2b/T9V2bkzGDfG9I4t?=
 =?iso-8859-1?Q?cD7V2uF7GjdNMIdP5Rq93r9UeswhWFTqQJARANxgflqTFPPHnQ+GNcXfR6?=
 =?iso-8859-1?Q?x0/zsFD8fr37sbOLeIeQ8zGaqKPz1CCA4phMoXn5JaldGuinvgAH8l7ppZ?=
 =?iso-8859-1?Q?hFK7XIQl9wPYwEjIsxFTXX2zH5qLfFdUt1B+ycbj4f/w/q81AE5dFUqEla?=
 =?iso-8859-1?Q?Nzagz/n5HgKK/Ls3mAr0FJxEcXQB6NioK4vFVrlCwsfcovxjLDoiP9H8PQ?=
 =?iso-8859-1?Q?nT25ZYTn9XnDBe0NtlzqRha65HwTKMnJ0KBUgpIzGYhsk7NNDSRzIaRhut?=
 =?iso-8859-1?Q?rx35o/cXnYch4qMPrSupuQRvdmJv8IFh3+UA93lw2O7eQo49eEp04qOlIu?=
 =?iso-8859-1?Q?ra9KPEKQAU3zXjWugkOUfLtNul1p2NCIId6jgFzpVA24QshFfGrELthA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b652af3a-6098-4dfb-1f13-08dbe22d8be5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 20:42:24.6686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gxMo61Dihk/IxNaBZ/nZDzUwECoAne/6QWKbp9wyEubTH5ytiEI0Dz3UOdOJCX24rVm+4j2lbB3WEPSh7If4IWYfyuk8PpFLKpEAJhZ/VJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8991
X-Proofpoint-ORIG-GUID: LhxBLxz5CcYwugUNNU8YpKjHme2Csnma
X-Proofpoint-GUID: LhxBLxz5CcYwugUNNU8YpKjHme2Csnma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 mlxlogscore=908 malwarescore=0 suspectscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100172

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds basic virtio-pci support for xen_arm machine.

It provides a flexible way to configure virtio-pci resources with
xenstore. We made this for several reasons:

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
 hw/arm/xen_arm.c            | 186 ++++++++++++++++++++++++++++++++++++
 hw/xen/xen-hvm-common.c     |   9 +-
 include/hw/xen/xen_native.h |   8 +-
 3 files changed, 200 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index a2b41dc2de..4a0a6726a8 100644
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
     xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level);
@@ -127,6 +137,176 @@ static void xen_init_ram(MachineState *machine)
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
+    snprintf(path, sizeof(path), "device-model/%d/virtio_pci_host/%s",
+             xen_domid, prop_name);
+    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
+
+    if (qemu_strtou64(value, NULL, 16, data)) {
+        error_report("xenpv: Failed to get 'virtio_pci_host/%s' prop",
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
+    snprintf(path, sizeof(path), "device-model/%d/virtio_pci_host",
+             xen_domid);
+    entries =3D xs_directory(xam->state->xenstore, XBT_NULL, path, &len);
+    if (entries =3D=3D NULL) {
+        error_report("xenpv: 'virtio_pci_host' dir is not present");
+        return -1;
+    }
+    free(entries);
+    if (len !=3D 9) {
+        error_report("xenpv: Unexpected number of entries in 'virtio_pci_h=
ost' dir");
+        goto out;
+    }
+
+    snprintf(path, sizeof(path), "device-model/%d/virtio_pci_host/id",
+             xen_domid);
+    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
+    if (qemu_strtoui(value, NULL, 10, &tmp)) {
+        error_report("xenpv: Failed to get 'virtio_pci_host/id' prop");
+        goto out;
+    }
+    free(value);
+    value =3D NULL;
+    if (tmp > 0xffff) {
+        error_report("xenpv: Wrong 'virtio_pci_host/id' value %u", tmp);
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
+    snprintf(path, sizeof(path), "device-model/%d/virtio_pci_host/irq_firs=
t",
+             xen_domid);
+    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
+    if (qemu_strtoi(value, NULL, 10, &xam->pcie_irq)) {
+        error_report("xenpv: Failed to get 'virtio_pci_host/irq_first' pro=
p");
+        goto out;
+    }
+    free(value);
+    value =3D NULL;
+    DPRINTF("PCIe host bridge: irq_first %u\n", xam->pcie_irq);
+
+    snprintf(path, sizeof(path), "device-model/%d/virtio_pci_host/num_irqs=
",
+             xen_domid);
+    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
+    if (qemu_strtoui(value, NULL, 10, &tmp)) {
+        error_report("xenpv: Failed to get 'virtio_pci_host/num_irqs' prop=
");
+        goto out;
+    }
+    free(value);
+    value =3D NULL;
+    if (tmp !=3D GPEX_NUM_IRQS) {
+        error_report("xenpv: Wrong 'virtio_pci_host/num_irqs' value %u", t=
mp);
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
@@ -187,6 +367,12 @@ static void xen_arm_init(MachineState *machine)
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
index b7255977a5..b1eb2972d5 100644
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
index 5d2718261f..a8fac902f1 100644
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

