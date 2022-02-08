Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C434AE03F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268493.462357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmr-0006gN-Ag; Tue, 08 Feb 2022 18:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268493.462357; Tue, 08 Feb 2022 18:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmr-0006e0-74; Tue, 08 Feb 2022 18:00:21 +0000
Received: by outflank-mailman (input) for mailman id 268493;
 Tue, 08 Feb 2022 18:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUmp-00068L-6w
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:19 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8c5c876-8908-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:00:17 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EgrT5015757;
 Tue, 8 Feb 2022 18:00:14 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3t5xrs6q-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:14 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5613.eurprd03.prod.outlook.com (2603:10a6:803:12a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:08 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:08 +0000
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
X-Inumbo-ID: f8c5c876-8908-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJatYUoZ25ZGt2oDLyOR456gPcza8CxVxTUEUiLehTYZbReiV+7+miEDeDULVwEZOAhCkxspH4VHkkyofEon3fFNxoz/JQ+CSM/ltwK7pyFw0XIDv4sX5i+jPZSLPbBFaEfOOZH8MM6cLqm7JS+q8cJT1+a/ZcrhJOYsCmn6V0AmO5cfRrpf0HDDmLcfiGM8oONcmSePFjOd7iA1qLejHjl/CYHEtQ1rj1gcW+XqQM/Uym97m3RMew8wQ7uLoX8e41FtZH157VKtBX+zQStgIQe/yIrgIPfJEjMWGFwyJmH6/uE0u3dItdyuooa1HJ2SQDDt4vaJqQp4b0Mm7heIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBlPOd7AiAkwGUmUKcL/QkLE6uduuCKGhZ0NfYwPn7M=;
 b=LoKqjkgnR+M19b2SLCE6GoUtfurG989VOjPipe0G4qYNEGAp1D7f+F0OqZnSRVrtBGDHdnmxyzBdrOAzuNr3zLPZyBYDCfmBCqbGMQsddQKZvU5ccfXbbKvfeXSBE+gMmfV6HPVB7OdTCN3DRXmij27QTE01HqTZiWwYnZl6inLSNOAqxL5yx3/1pHHK5sK77brWPX8r28GME9A+QhQxCHX76VhvpcQ1U9VPc3uduczaWLvVD41razb7MMuBH+iNei//h/M/NRW3qegTB3QxqCSONoVuJ3P34CaF9TqVZD5N4gTER+TQB+aDQ7CFy0xwxJOQp0NanwvxQPb5Oufzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBlPOd7AiAkwGUmUKcL/QkLE6uduuCKGhZ0NfYwPn7M=;
 b=fqDyvnbU2oGQp07LJhzRLyhP8xpdrYoQ3GYBsASMp2ND34jB7f789eSbt68CP6WNWKujVCF6KaNzD/Enl1jCEBpEoxLdZal96rpK5z8ak02wb1HgyTLWeYTtPKhgUJRhKO5nVziaXyCv6Wxq7NCUXDhah7qQrZIs1ylA6rM+dIrwuGi7hy/EdcnE92xuJsuiZXQb7BerK+j13PbUPaYi3h3yKaywLIUkBI+BTd2dR710ICfnJTs0ryqniJrVjUltlEzs2T5v2Lun4SdcZVRBS5PaiRgx8xHX0KQitAi9KRHNd4zb4Tl6m4vbvTAJ2y4SecZRts99IU8W2S6jf+xYng==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
Thread-Topic: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
Thread-Index: AQHYHRW1S717SraA0Ui+K6wc2/TNAA==
Date: Tue, 8 Feb 2022 18:00:08 +0000
Message-ID: 
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fd82e46-c221-4ff7-f460-08d9eb2cd813
x-ms-traffictypediagnostic: VE1PR03MB5613:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB561364C1CB63478224FBE92CE32D9@VE1PR03MB5613.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eA0bzCYb7I/TEDiUeMjBIZ9YbX9Gnvap787CBuvVmndKbQC9Jyvjxhig/DUtnLgqoLSEzU0nApyueZUHwfI6UcfVLG3O6AA+g+qGVTg/H+idT0AhoQ6grg0f17Jp3iSS8ACcKnCDJyhrP3fozmJ7EAuxwgR//O9YG+NP1PFNlqQy0asIZYovdA8cEL+5vlszoDQhsXPXXEMqImZ9FB2vVp/4UMshkjNtYQ0vrr7hdN6G03FKCydow88FeptxJbNVLMiKT6JKUeh0tHrWIqSgPKiDktIcbGBD0qLyIYCZXFsM34zHVtvgp0aWK+NdsPEOi5iM9CGmf0XnspS341usE0u5J/Vl+v5qE+3eRh0pvkAa8bHOSAaB+A0ehQrboIRNJoLxOJLChd/t2e7+bxGJYLy/j6CWpQbWLFdhgXwnHUxgeWfEY7fNLe7An9+Xjv30svx8KYMTSFYmgvG9965h9ZIlgybZokx4pEEK4WaCYN0vFnz63XnceZ961H4V78SfnI3LaukL1gQsqjSO+RALABTgUnRjU4Suwv6UMEiz7muQG6J6lB1WK2UUMK8kSQs/cvPgtpqzmfOXd8v8lZWJYnm5gnB6fSQ4WqJYGPoT7CBQs9EkPi7dhowime74eXEyrrcCjjJEnqXioFdROtQa8Ii1G8DvIAF0BbuXSf+g3eNqt5j4Dy4nxpyfPhULh1H3+buGE6PPSwy9iK6PcVVpgkvYln78Gyx/UpbSEo/CSPc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66476007)(64756008)(86362001)(66556008)(316002)(122000001)(6916009)(6506007)(2616005)(5660300002)(6512007)(4326008)(83380400001)(54906003)(2906002)(26005)(186003)(8676002)(76116006)(38100700002)(66446008)(66946007)(8936002)(36756003)(91956017)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MGivsezwHpKlmbUPj+y2rFPN/epMygpIkmEZrDULehdMMH4VSwnZ4UABmx?=
 =?iso-8859-1?Q?B2IHFOGuCkTS4iuBv3yI1QJySnn+PHFJYKlKrClXeMwxSNRl1wOMvmL1/j?=
 =?iso-8859-1?Q?ogUYDk4mZYVQCcs8VeSjo2cB5VZNfjz4YhyDL0ldvn4NNrlUCLHx1ESF5u?=
 =?iso-8859-1?Q?BPDqQw91+qCy5+toRV2Q0/inPJWpPNJuugSyYQa6U/aEMlZS0lFJ64MJMp?=
 =?iso-8859-1?Q?DUBLR1VLYrCaT5mM8mnz1RYMKhci9TYHkcn7+nDGNLi1IbOo2K/AO20zvc?=
 =?iso-8859-1?Q?jADwbz51mtkh/k96TaJGoj2522tcGEcH941IEimuGlLZuehljgQ1OssHdc?=
 =?iso-8859-1?Q?BG3/mORWjVUKF7QXmhRA5th8UddVZH4CjEI/tW8+pcqlfzPZviwxv7HzKS?=
 =?iso-8859-1?Q?pVJ8AK6quBCRRH6xkcy91AKBiNf45sJcd5xp+JKTc2dw3xfpOFCYahFuqw?=
 =?iso-8859-1?Q?hKFgPtft4rKzhiJ/XmSHZgthnZWpNAw6Hz3/pW2Le6rXLaZprkt/eTsCLP?=
 =?iso-8859-1?Q?OFk7xB8ZLZyBkTl/lLLVOVdM1PaxNRxrYtX8mlOH8IkTngdhjWelzpqw/H?=
 =?iso-8859-1?Q?3zDHSht1tAVoevUVvj3BTpwj3pkIKTr0mzK2uOj2BtCrkQ6dYeUDBeCTff?=
 =?iso-8859-1?Q?QQvbp8GrM0FqCIY4IXbo8RfhB0RCq+ZJdivuKVRL5W81AqEXhkycZZVOdc?=
 =?iso-8859-1?Q?fDCW4HkexBFfDOtG55owKsZk/Xs5VrCFxgTaZu7lH4cmDpf09npiCUNtyS?=
 =?iso-8859-1?Q?8kGQX3rsXlEOHh60TG4F5Fl+nfwEvDKKQCRmwMmRoLkuS0H+Oo6af92WEq?=
 =?iso-8859-1?Q?Y34MITOET8U6k4h+wSjnUR+xirhoqwpnpX1FWwC9BeLtqAr7fkASlyOYnj?=
 =?iso-8859-1?Q?rCyns5hHmfiIvOIHvb297yez/VWhDSiV/qnONy+N+1Q2rgRZTdsD4HVUcU?=
 =?iso-8859-1?Q?X/9TzSQFR5zhFNW+MY7f1uKYqbmR12PHxJgSRA2zCBTrEUF54TteWU2/Z5?=
 =?iso-8859-1?Q?5gQB3nPX4RkQ45Crpiu2vyUE09v6t1fOF9Z5ct7FJsJpYuAsQHJlzYTA3Q?=
 =?iso-8859-1?Q?zVqvRtNFIgw7q4vhYMocwVwENKPwNoN0/Mkih2jsulWmieIfAhujwPzJFZ?=
 =?iso-8859-1?Q?dsWyocAcjp26OsJvRMJh0QFbox3xhtrn6RTPxTeggTg7EmAcePXUDI382T?=
 =?iso-8859-1?Q?Mlu8JeG+f6HGE9phQGYJvxBE0EbDpEMWMZ0j7bOIpBfveIUDxQyvsi6J9A?=
 =?iso-8859-1?Q?QmJ4UsFI5L+MfqWpt/jQ0jHvUT3zKqqPFd3NA+gO0RSkHUV01OK5WRayve?=
 =?iso-8859-1?Q?/t324Br0x2ot82AEsUiFskkKAtM2wRJ1c+N1yjpF+E9OTcT7qcML+EzXdE?=
 =?iso-8859-1?Q?HaeJ+wIJxOyF7w6yAX+BwvNEtXOMDCSG+OQGyRBkTfIv39w3m2MgGJQjkd?=
 =?iso-8859-1?Q?zGdyxiAjGGambWEEgtVXl4I7ednBhwD1fGA+MfhtOVfA9kw7108S0nGAUx?=
 =?iso-8859-1?Q?b2zyv1ublqpYrXGUqbnHIVur6uqgFhrfQCiddkrwohphfH4TloA5ey2t1S?=
 =?iso-8859-1?Q?z8O1brDtaLmQe1Lw0xEwuNMgw/5KHr21ZeVYd0KFknm43ROfnHVKDyevCn?=
 =?iso-8859-1?Q?1cyI1yeTJwc+b5VrYUQzeQ7yYirSNF9zZZTdxm2q6/ZiaBogqNtMmOYyY5?=
 =?iso-8859-1?Q?Vruy8MaFcp9Pjh3eq9NaCzcMBapmXlmY1ctRZz5YrYkTThWbVfhJqdFZWv?=
 =?iso-8859-1?Q?shNxhqUd/CRGwp2nHVTK+eBvE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd82e46-c221-4ff7-f460-08d9eb2cd813
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:08.4817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nR6P7OcxH3Ms+uUSS9wpHiky5/5XPGfj7C+riLQE1Xt0LxMxgbb8RIFIeFrUU4cNJTLV+4s7ng27vBTm3TvAfJiRfuf+dpNRGjgIea+dxTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5613
X-Proofpoint-GUID: 9x9RmyYBt--bIgC7LHnu8maOWqKwhB8o
X-Proofpoint-ORIG-GUID: 9x9RmyYBt--bIgC7LHnu8maOWqKwhB8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080106

If enabled, host device-tree will be exported to hypfs and can be
accessed through /devicetree path.
Exported device-tree has the same format, as the device-tree
exported to the sysfs by the Linux kernel.
This is useful when XEN toolstack needs an access to the host device-tree.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 xen/arch/arm/Kconfig           |   8 +
 xen/arch/arm/Makefile          |   1 +
 xen/arch/arm/host_dtb_export.c | 307 +++++++++++++++++++++++++++++++++
 3 files changed, 316 insertions(+)
 create mode 100644 xen/arch/arm/host_dtb_export.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..895016b21e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -33,6 +33,14 @@ config ACPI
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
=20
+config HOST_DTB_EXPORT
+	bool "Export host device tree to hypfs if enabled"
+	depends on ARM && HYPFS && !ACPI
+	---help---
+
+	  Export host device-tree to hypfs so toolstack can have an access for th=
e
+	  host device tree from Dom0. If you unsure say N.
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 07f634508e..0a41f68f8c 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ obj-y +=3D platforms/
 endif
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
+obj-$(CONFIG_HOST_DTB_EXPORT) +=3D host_dtb_export.o
=20
 obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
 obj-y +=3D bootfdt.init.o
diff --git a/xen/arch/arm/host_dtb_export.c b/xen/arch/arm/host_dtb_export.=
c
new file mode 100644
index 0000000000..794395683c
--- /dev/null
+++ b/xen/arch/arm/host_dtb_export.c
@@ -0,0 +1,307 @@
+/*
+ * xen/arch/arm/host_dtb_export.c
+ *
+ * Export host device-tree to the hypfs so toolstack can access
+ * host device-tree from Dom0
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (C) 2021, EPAM Systems.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/device_tree.h>
+#include <xen/err.h>
+#include <xen/guest_access.h>
+#include <xen/hypfs.h>
+#include <xen/init.h>
+
+#define HOST_DT_DIR "devicetree"
+
+static int host_dt_dir_read(const struct hypfs_entry *entry,
+                            XEN_GUEST_HANDLE_PARAM(void) uaddr);
+static unsigned int host_dt_dir_getsize(const struct hypfs_entry *entry);
+
+static const struct hypfs_entry *host_dt_dir_enter(
+    const struct hypfs_entry *entry);
+static void host_dt_dir_exit(const struct hypfs_entry *entry);
+
+static struct hypfs_entry *host_dt_dir_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name=
_len);
+
+static const struct hypfs_funcs host_dt_dir_funcs =3D {
+    .enter =3D host_dt_dir_enter,
+    .exit =3D host_dt_dir_exit,
+    .read =3D host_dt_dir_read,
+    .write =3D hypfs_write_deny,
+    .getsize =3D host_dt_dir_getsize,
+    .findentry =3D host_dt_dir_findentry,
+};
+
+static int host_dt_prop_read(const struct hypfs_entry *entry,
+                    XEN_GUEST_HANDLE_PARAM(void) uaddr);
+
+static unsigned int host_dt_prop_getsize(const struct hypfs_entry *entry);
+
+const struct hypfs_funcs host_dt_prop_ro_funcs =3D {
+    .enter =3D host_dt_dir_enter,
+    .exit =3D host_dt_dir_exit,
+    .read =3D host_dt_prop_read,
+    .write =3D hypfs_write_deny,
+    .getsize =3D host_dt_prop_getsize,
+    .findentry =3D hypfs_leaf_findentry,
+};
+
+static HYPFS_DIR_INIT_FUNC(dt_dir, "node_template", &host_dt_dir_funcs);
+
+#define HYPFS_PROPERTY_MAX_SIZE 256
+static HYPFS_VARSIZE_INIT(dt_prop, XEN_HYPFS_TYPE_BLOB, "prop_template",
+                            HYPFS_PROPERTY_MAX_SIZE, &host_dt_prop_ro_func=
s);
+
+static const char *get_name_from_path(const char *path)
+{
+    const char *name =3D strrchr(path, '/');
+    if ( !name )
+        name =3D path;
+    else
+    {
+        name++;
+        if ( !*name )
+            name--;
+    }
+
+    return name;
+}
+
+static char *get_root_from_path(const char *path, char *name)
+{
+    const char *nm =3D strchr(path, '/');
+    if ( !nm )
+        nm =3D path + strlen(path);
+    else
+    {
+        if ( !*nm )
+            nm--;
+    }
+
+    return memcpy(name, path, nm - path);
+}
+
+static int host_dt_dir_read(const struct hypfs_entry *entry,
+                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    int ret =3D 0;
+    struct dt_device_node *node;
+    struct dt_device_node *child;
+    const struct dt_property *prop;
+    struct hypfs_dyndir_id *data;
+
+    data =3D hypfs_get_dyndata();
+    if ( !data )
+        return -EINVAL;
+
+    node =3D data->data;
+    if ( !node )
+        return -EINVAL;
+
+    dt_for_each_property_node( node, prop )
+    {
+        ret =3D hypfs_read_dyndir_entry(&dt_prop.e, prop->name,
+                                      strlen(prop->name),
+                                      !prop->next && !node->child,
+                                      &uaddr);
+
+        if ( ret )
+            break;
+    }
+
+    for ( child =3D node->child; child !=3D NULL; child =3D child->sibling=
 )
+    {
+        const char *parsed_name =3D get_name_from_path(child->full_name);
+        data->data =3D child;
+
+        ret =3D hypfs_read_dyndir_entry(&dt_dir.e, parsed_name,
+                                         strlen(parsed_name),
+                                         child->sibling =3D=3D NULL,
+                                         &uaddr);
+
+        if ( ret )
+            break;
+    }
+
+    return ret;
+}
+
+static unsigned int host_dt_dir_getsize(const struct hypfs_entry *entry)
+{
+    struct dt_device_node *node;
+    struct dt_device_node *child;
+    struct hypfs_dyndir_id *data;
+    const struct dt_property *prop;
+    unsigned int size =3D 0;
+
+    data =3D hypfs_get_dyndata();
+    if ( !data )
+        return -EINVAL;
+
+    node =3D data->data;
+    if ( !node )
+        return -EINVAL;
+
+    dt_for_each_property_node( node, prop )
+    {
+        size +=3D hypfs_dyndir_entry_size(entry, prop->name);
+    }
+
+    for ( child =3D node->child; child !=3D NULL; child =3D child->sibling=
 )
+    {
+        const char *parsed_name =3D get_name_from_path(child->full_name);
+        size +=3D hypfs_dyndir_entry_size(entry, parsed_name);
+    }
+
+    return size;
+}
+
+static DEFINE_PER_CPU(bool, data_alloc);
+
+static inline bool data_is_alloc(void)
+{
+    unsigned int cpu =3D smp_processor_id();
+    return per_cpu(data_alloc, cpu);
+}
+
+static inline void set_data_alloc(void)
+{
+    unsigned int cpu =3D smp_processor_id();
+    ASSERT(!per_cpu(data_alloc, cpu));
+
+    this_cpu(data_alloc) =3D true;
+}
+
+static inline void unset_data_alloc(void)
+{
+    this_cpu(data_alloc) =3D false;
+}
+
+static const struct hypfs_entry *host_dt_dir_enter(
+    const struct hypfs_entry *entry)
+{
+    struct hypfs_dyndir_id *data;
+
+    if ( !data_is_alloc() )
+    {
+        data =3D hypfs_alloc_dyndata(struct hypfs_dyndir_id);
+        if ( !data )
+            return ERR_PTR(-ENOMEM);
+
+        set_data_alloc();
+    }
+
+    if ( strcmp(entry->name, HOST_DT_DIR) =3D=3D 0 )
+    {
+        data =3D hypfs_get_dyndata();
+        data->data =3D dt_host;
+    }
+
+    return entry;
+}
+
+static void host_dt_dir_exit(const struct hypfs_entry *entry)
+{
+    if ( !data_is_alloc() )
+        return;
+
+    hypfs_free_dyndata();
+    unset_data_alloc();
+}
+
+static struct hypfs_entry *host_dt_dir_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name=
_len)
+{
+    struct dt_device_node *node;
+    char root_name[HYPFS_DYNDIR_ID_NAMELEN];
+    struct dt_device_node *child;
+    struct hypfs_dyndir_id *data;
+    struct dt_property *prop;
+
+    data =3D hypfs_get_dyndata();
+    if ( !data )
+        return ERR_PTR(-EINVAL);
+
+    node =3D data->data;
+    if ( !node )
+        return ERR_PTR(-EINVAL);
+
+    memset(root_name, 0, sizeof(root_name));
+    get_root_from_path(name, root_name);
+
+    for ( child =3D node->child; child !=3D NULL; child =3D child->sibling=
 )
+    {
+        if ( strcmp(get_name_from_path(child->full_name), root_name) =3D=
=3D 0 )
+            return hypfs_gen_dyndir_entry(&dt_dir.e,
+                                  get_name_from_path(child->full_name), ch=
ild);
+    }
+
+    dt_for_each_property_node( node, prop )
+    {
+
+        if ( dt_property_name_is_equal(prop, root_name) )
+            return hypfs_gen_dyndir_entry(&dt_prop.e, prop->name, prop);
+    }
+
+    return ERR_PTR(-ENOENT);
+};
+
+static int host_dt_prop_read(const struct hypfs_entry *entry,
+                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct dt_property *prop;
+    struct hypfs_dyndir_id *data;
+
+    data =3D hypfs_get_dyndata();
+    if ( !data )
+        return -EINVAL;
+
+    prop =3D data->data;
+    if ( !prop )
+        return -EINVAL;
+
+    return copy_to_guest(uaddr, prop->value, prop->length) ?  -EFAULT : 0;
+}
+
+static unsigned int host_dt_prop_getsize(const struct hypfs_entry *entry)
+{
+    const struct hypfs_dyndir_id *data;
+    const struct dt_property *prop;
+
+    data =3D hypfs_get_dyndata();
+    if ( !data )
+        return -EINVAL;
+
+    prop =3D data->data;
+    if ( !prop )
+        return -EINVAL;
+
+    return prop->length;
+}
+
+static HYPFS_DIR_INIT_FUNC(host_dt_dir, HOST_DT_DIR, &host_dt_dir_funcs);
+
+static int __init host_dtb_export_init(void)
+{
+    ASSERT(dt_host && (dt_host->sibling =3D=3D NULL));
+    unset_data_alloc();
+
+    hypfs_add_dir(&hypfs_root, &host_dt_dir, true);
+    hypfs_add_dyndir(&hypfs_root, &dt_dir);
+    return 0;
+}
+__initcall(host_dtb_export_init);
--=20
2.27.0

