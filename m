Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633AE801995
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645879.1008445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0k-0007t0-TI; Sat, 02 Dec 2023 01:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645879.1008445; Sat, 02 Dec 2023 01:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0k-0007qD-Px; Sat, 02 Dec 2023 01:41:38 +0000
Received: by outflank-mailman (input) for mailman id 645879;
 Sat, 02 Dec 2023 01:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9F0j-0007jp-Cq
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:41:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec9ee78c-90b3-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 02:41:34 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B21Xj1G026535; Sat, 2 Dec 2023 01:41:29 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqt8mg21a-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:41:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7285.eurprd03.prod.outlook.com (2603:10a6:20b:2ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:41:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:41:23 +0000
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
X-Inumbo-ID: ec9ee78c-90b3-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGCrxnIg0hx0I3TroprqXEzfV37pt5UBN3qgZ6sHOIaLco2UI05WeDf63axAmzWBd1/ijxxnXvwdweK6tu5lvhRh/RE+9pTP2G8+adDlbIglzwzWlrTAlXvLTdZlxluGQ6Y1HzLvDwnDhEB8ENNjyYSYxPvSOUkniY/a3CuaElP/XImGEWNw0iSULnK7yu/eBtZxzuVRHG/G5bmTujZrKe+OJUMebD51rhRpp84UM8e0B2xjpe2Fhud/cZHFe6Y1fkUB5U4ajOPBpH1CRtfn8WnhO2XXDt6pAmEm8SEW2xDdI+WpUZb9hS/MfkXt2A72Suhg93v+zVj28YGEBXjprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1sE3o7/1/WPykkUQrLgvygBnr35JJ7+xArB8a3+h6c=;
 b=Ga0bvfX1781S5oJ36DK+txA+SIru21JrwNvdbJA++aWoarOvheBw3/tnmIdU3JzvffKVBSpIia+uHH61hAwwglTylple+AMST8z7oAkwrzW2ibFejJznUTSYEN5FtcOq7I0/lMpJYLb9M/CPIYx/DZbJBRlhgPNE5DkCQxpPFoBxh7ea2kdd7SSl7eyTNIKnDT68F8tRAFQuccw+7QsZNEungjBazOEbRkq4ZJIMR/rrbzn+O+uTGdroywaErbZfvQhCCmzU8R4oDUe7C/Rr432dZZrVs5UqFN8M05jvU5CFuUBYzdlbIAdOvMjKhv3P2YRytKx9gF5pumb4nO8DPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1sE3o7/1/WPykkUQrLgvygBnr35JJ7+xArB8a3+h6c=;
 b=cjla2c6sIf2gY0Bk6CbEMrhNTKF/v206Un2TND/fDyd7GBqGM9BxXmgrjtap7b76z5p5VYirm4ZhY0wE4wZ4sLdXsK59MAizaW7YcDyO/+7wFvrWq7dWYQ+ChqVtKV2ONVmyrYpPVocNre63zSwgptZAe9iVX8HhLdRqaQKMOTggMCqfgUkQHp9cKzEfBOfJdWkGNjajtuSm9uRDMYpqVbbmPO7xM+ZcZGFWNuX7eTU0GU0CfH9tOgRPJuKvvqCVO4/XDZhNsshIicso3duyWw5XUa5F75C1xTOq/oG17RfziQxRg4nCcjGKaRKHg7/G6pnwDjsogErtABe/RCOJYg==
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
Subject: [PATCH v4 6/6] xen_arm: Add virtual PCIe host bridge support
Thread-Topic: [PATCH v4 6/6] xen_arm: Add virtual PCIe host bridge support
Thread-Index: AQHaJMCo0BornjVbl0aSaRGzaWWdGA==
Date: Sat, 2 Dec 2023 01:41:23 +0000
Message-ID: <20231202014108.2017803-7-volodymyr_babchuk@epam.com>
References: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7285:EE_
x-ms-office365-filtering-correlation-id: 949ee9dc-8a24-4199-2fba-08dbf2d7cad8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KjcoTtbcWIF5OI9JMph43mydcyPVte4s3LMDrNx5qdhvPSNe0/0WYy66kIGdvXPRsG1OII0xO4bQtscefMIdVX1GLtLX9HiNsE6VNylJ28AQEVf/qwoqky8TFmL7sFI4IjznsGXRT/Z31s3w7mFvDPTdiaDZoTIPaXP3PvF2hH9308KG+blQiApKyMSaUkaWxroEdgnkK0L3oWAwUuBBvH8SVOMbhrYs+3KWV4hM1P8eZZzxbbG/s5RVQXM6L8/1aKNEHxaCRhfIUxH2HNIKPnjqiPB0l3xror0VlAV31QJigvn6CsheyKvdMmPccdjCy9NDSoY3IxD1HTaaQZnW9wpkYb7GJYeEuFmqoY2CffJY+RjvBCnnsT8gXGloDrIn5fjk8OPtVu/6QzJsMXG9OdRG06CscvbvNfginu52f/g2u8tmgq3Nnq7okFaMEmYkjYx9OgF74oNmhl+VjUnFH2ciraxSmirBoAr3IHLPvVkwkT5VKizaXLIJ8+G/qUjOky2BX/tti/DDu0VgFutkR7eiYujXkLr1zad/X1Q4aJ+SK9ujG7CjYuQVFCB2Hmi8AaTQV15Y6lXTeEV+45w9UaDxv8Zl4KXDfPvJMeBKrraK2pxBuZtiZ6S2gEXFYYYr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(38070700009)(41300700001)(2906002)(30864003)(5660300002)(83380400001)(71200400001)(55236004)(38100700002)(6506007)(6512007)(1076003)(2616005)(26005)(66556008)(478600001)(91956017)(6486002)(36756003)(76116006)(66946007)(64756008)(66446008)(8936002)(6916009)(54906003)(86362001)(66476007)(4326008)(316002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VhgFjOw+sealzzey+FGUtYx94cTDA3Fwtvwmq16SmwvPTlWgX5H3ssFwFL?=
 =?iso-8859-1?Q?0Fosjv3h/vxxmJmoZXu9zVwy31vbYcKHiR5dQ08rEMxG7izt6aAlNsTG1k?=
 =?iso-8859-1?Q?Wp7NLi6lmjzElnlT1FH+1W7Bh8xcgqT7TXyV3Wq76j3GPSNwslqNI6ICMl?=
 =?iso-8859-1?Q?qYewA6FbZ+PbXTJw6nt98MtcsvsaAhuRFGxmfZ2KxEvjIAurslCK+tHa9X?=
 =?iso-8859-1?Q?AiBNsmGB47HQH36nDPL9pyNfUfXU7nZaM56c1OojZqxCmWuxqjaVBV52kP?=
 =?iso-8859-1?Q?KmGhZ0RCPCQwmbz7Xz0XyZpHoIQ3iZ+8beBJE3TwuMVqZ7NOJJnxBrcApO?=
 =?iso-8859-1?Q?8p3Ux6bwxtbXP5htXiqyWxeYkJ6Mfk+635xCpJIROSScArkQq+TAOLHxGk?=
 =?iso-8859-1?Q?zceKiRNevznDa9wLalBJYdQ2whq105PF/ddDJWm2c+k1pTf09p+Ya14eeO?=
 =?iso-8859-1?Q?4ICz7qvhdzlYlK750kqsNdzI08MkhhXYbwoZ9wIfVCpfbhOoRwTjYZptnG?=
 =?iso-8859-1?Q?cKx7YZbWVny7y/ftvuhcb+I/LGfNSPW+S9KFOQVzLvQ+UBlQvVbA6tMY4U?=
 =?iso-8859-1?Q?tkOTzdWRKecrUvNw9wBMN883xslrNE2Tnav1A7oGvcxOGuWVRp48NMYt1v?=
 =?iso-8859-1?Q?QEW9FSELaWS13fkGoJ7RfPfXT9DWcGDwaCtV7ORvjjFNtDUseseL67fv2S?=
 =?iso-8859-1?Q?FLYnQ2nUpSWRQg5pUdY6zZSdegViUWjxrnQz3x4fkniSozTynM8wQi2zMp?=
 =?iso-8859-1?Q?W1zLJi/Nj7/88/kin6ARaxEBjymdb11E3N4PnidqHP1TonsV6V44WaVyx3?=
 =?iso-8859-1?Q?R2LR6pDh58b+DDkMluWTaO9VpFVQsCQNp9JmbUly/azjNtK+GBoCUyoy0u?=
 =?iso-8859-1?Q?pLJTEF9D/V02rNYvpvfYVKi0m22cXrvQx+HRwvEjaxfo/T/w6UBuJqwkb8?=
 =?iso-8859-1?Q?fNA6C2fhZ9H/gcFCW1PqiOlKidG1CuYhAF+0CZkn+GY2RR9jlKT03YbeZf?=
 =?iso-8859-1?Q?qBrXSuBifypJswmMCgvcTY1RaWE3fz0I0xKY3kRV9E9EXcq+HcyoQBqmI/?=
 =?iso-8859-1?Q?aSYhrTr0c0fmMg9E53DHYYdC6kOet5T/UvahnLJrAIgxcoyOCzcSeIkm43?=
 =?iso-8859-1?Q?p6Pi47OMb9KNR71cqcoa16Wrwr9XtX/ib0dDmL9sM9vz9QzpyfIMQoZQ6p?=
 =?iso-8859-1?Q?K35griJGW7/Ct2S+wPhd4Z8ezmc3dqkQkiNBeruRoOlpGBE/1L/1TxNi4l?=
 =?iso-8859-1?Q?AWvLxMlcJdWDOR0tsGT3RtBjnK6knZfXiYm8frb5cqAG74njybQDIsAYP4?=
 =?iso-8859-1?Q?Hmx3TPX6pmHmzh1Grnu0uX7hUHhZ31PbUoj2UfVt8wNCqSr5LfphHVJ6uO?=
 =?iso-8859-1?Q?mdMq2fLw7nA3JjWLWe0J/jeV8Zz0r+Dxs+6fvDodPxdT08VWYRCezs5f5B?=
 =?iso-8859-1?Q?X0izHYqIxbhUcYsYRMSMgGxw5EzF4U8Z9VxBaOIkGNNwPXbua2HRWXm0mA?=
 =?iso-8859-1?Q?YPspzzGL2IlgKMuuBbyy3Tp63gvqZu/BMLL/uMP5T9lRq+Ohl+dsr7R4O/?=
 =?iso-8859-1?Q?XRwlG8s3yMhTUD3ScLcf+wvbzh5O+Ai7yxOOvxZNpEoeSM7/tQJY1YdvWS?=
 =?iso-8859-1?Q?2aazPX28x5hKi7u0r88hOWWSRgeAZeKlox4+osPF3zv6V29n0QFQ5pow?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949ee9dc-8a24-4199-2fba-08dbf2d7cad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:41:23.7697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K5v7ptYctR9rW7ZhsrwIHjfqXwoq44w6D1no8yvkruzTXjGGCP8BfZJENombVT6PWoRF/fHWT/9E7P7bBxmCDTJNraWf7drlA2uQX0A819I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7285
X-Proofpoint-ORIG-GUID: zPLSo3Bgabl3StRLPmaNAY-xl3gPbGSz
X-Proofpoint-GUID: zPLSo3Bgabl3StRLPmaNAY-xl3gPbGSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020009

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

