Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C401E890EED
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 01:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699210.1091924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpzo7-0002vX-Sb; Fri, 29 Mar 2024 00:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699210.1091924; Fri, 29 Mar 2024 00:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpzo7-0002sK-PR; Fri, 29 Mar 2024 00:09:19 +0000
Received: by outflank-mailman (input) for mailman id 699210;
 Fri, 29 Mar 2024 00:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRsJ=LD=epam.com=prvs=0818e5feeb=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rpzo5-0002Ab-Pd
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 00:09:17 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 935585d9-ed60-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 01:09:14 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42SN0uE1024084; Fri, 29 Mar 2024 00:09:06 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3x5huq82q0-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 00:09:05 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DBBPR03MB10269.eurprd03.prod.outlook.com
 (2603:10a6:10:536::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 29 Mar
 2024 00:09:02 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::74c9:2488:1dd7:b976]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::74c9:2488:1dd7:b976%3]) with mapi id 15.20.7409.028; Fri, 29 Mar 2024
 00:09:02 +0000
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
X-Inumbo-ID: 935585d9-ed60-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np3SQsj2d+/ruyrD/CKSIbQIhqW9cd72UNQGcwY4efPfCB+fVfVumXDEEfDfsmiNKQ+cDGbD6sKXKcu54KVtgM0DRzOp+AVgeajsQ1tQYxFeOosPGYetjMnvKtr+9usm0eVAoGHkAW1ul+rbM9TXXKRj1XqxGCTqqPTRt8hAyetLjpIn7qAx9XgcdEyQeDwsbRflAZSuv7+Z+Wv5lWrC8XyGvUSYMSl+i81O32ob+CvsS1wWiNBJ1IrkeTn1migLVf7hbofbdYX8aDa+54eeRfmoxUPTU9Kcag0Uds9rUbS1POY/ZOC4xjthAnWqe31t1XASTV0uMN8KymJcrWys3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FENK0lL6QM9oXwz7y7lWBx5Y8WUk5Zaz3Nf7Qc0M+Gk=;
 b=kmHIVQ8cj3llW00z3Mx1zV+lc7FDvmeBzDmCskyTvYtPpX3L13Mau3y9YHZe1v/xJM6EfBfjDKjz6vkNgNf89FlfmizNYoCqGelOl6G4P+pogjatBZLYF4hyvR8T3wy+mRWNrsQ2KmnfPD74s3J01s8jr2m636sEUzoYG8ElwvD73VilCFPAsmqpycnhwwQo8DjIS/tnvk5vaxxT+WLzQ5sdXOuVNQSE7VOO13xWyDjzzRZx/QGYcG5m1xUX4mXULrqPAODOdw1KzEh8wXazmAVHG7QNjKgqPIw/5EIOdjHO4Wrg+fN/iEXXstdw+eUFvZ7lOY7Mr2hTeKyi/n3WQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FENK0lL6QM9oXwz7y7lWBx5Y8WUk5Zaz3Nf7Qc0M+Gk=;
 b=jNHeBCJ2saT2idY2tnz07J4dX1hXEwAPwZvHP/YFjiQdcb7jsbM/vNVqVIFReHdWPRmZ1KmsS7bct3RCUzdK1d5BhCUkzutC3ouZD2Vl7/S4lNDSgG4FlmLf10CVI97UwxmJBMYEV/Biq1Jwd5mG49ltW+FxzeVCt0QMmxmBbkvlrqkGLxcVuI4UgFoMqU8Rx5eaOEgFWOl+88hRJ1FAb12++k6J6SXmK9BQUh3WMx1WR4ML4hSpxZsw3qnnn4fMPxopR3p+xVZCgxTUa9U1xlx1E/OZUd9HDZ7/P5nK9EVTnH++v2/sg9lBv7lL9QB/e7jy7f8GkSp5HHaQ9QzxRQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
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
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial driver
Thread-Topic: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
Thread-Index: AQHagW1LewNbiHn0V0mBfSyHgZWL5Q==
Date: Fri, 29 Mar 2024 00:08:57 +0000
Message-ID: <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.43.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DBBPR03MB10269:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ffB77fAZj+gHQ+Mbcw3mpI4ATmuFYFQwoEoR5sGHCJ1qte+ig5tRscnoL/r2Y0Ane0AGwxjyvjuSOOOTC7zJQOH0GKsZJdNXUEhEaHXasBBndLSBekwkWlY9uOdr+3y26e1jfmtK5oNyb3uIWRHqNbo8z9ePblClGF065zAD/AGrzdMLx0tZDHalu4sKqZy4U4sAaf9bDOlmqB9NdiX1bxSDkl987DVhGKb6zC2opm9wiv3dNPbGGAdWoJQfiLxvHd7KWmLlgBtF/CkkCfCQbE9bVRmohQg+PZKzxIL2gt4XXIDlI8CqFCm7eZnqYD9vE7UEdit28XmO9E/3+qRbwzHzcqIOiyxto8wP699lVwUmpA9yShkup+adOlufzQ8Jh/8vrwcsNhuF4KWxxaGHYifd27V3Nv/+9gVfOftJ/HpSjluGr1mFIF6JOz+shph/ObI1jNhK10heZlD8xbIxPRSRsivxtaeYE7LkSzmcb0981Pnidstdoogb+QJ6kfssdoymCZbqJCu2PKEIReg3lLQu3ndHJUnV87SGp2Qg2zrcEMGN/tVgLkZoUYYlu8Pa/HIYIy+gSmU6D6FN+gB8RFE/z1OLrf/0AOuPZnYLrltXsYPONOQtE4K8uv1+shiiipOshio4/ANE7ozhCef36bfMGgJp7HGfF/tBpZiNnFw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bPGljbm3QjV1a3Xo+4IPN/Rb5aru8e48JGikPDzBPRPZcoG6URhVtqgph8?=
 =?iso-8859-1?Q?KcNulMDkrF56z+G5d9it2M/88eovMlYsqxlFhtH53VXjBkRdbTfTr5uyNf?=
 =?iso-8859-1?Q?02Jc2wBT+N7Nhlx8xUrtBw4WPCV1198KQ3rDX6fNStNK9Ej7Q1gBM1whbI?=
 =?iso-8859-1?Q?1T+26s9vkYNxEN/zrWooY8NTzHLVZo+Ew/1iWA7baG9BIIFoWTPBFCr8hS?=
 =?iso-8859-1?Q?5UuTFKy9089Ahu1kEMiO/cTylAYAqvZjE5EtvkAmuPh/wWwxT8OMLYOUST?=
 =?iso-8859-1?Q?B+VN3joXvfdGlx71XIrEm0PlWZOjqAhORYiRUs3Tzu4R80FEzRAqBB+6kl?=
 =?iso-8859-1?Q?wAwMENQclkJ3gYMWn65Vjs1lojxUSK2yF7W6ErH8WKk6RlonSJNtOOycD3?=
 =?iso-8859-1?Q?jh28+rsOxQgzOHJGnVT2SBHW5FZQv0pdGMSgxAccVVrcQEPaXPy3c5FbsS?=
 =?iso-8859-1?Q?9u8NB/gyK1QKE98kPt/O1YlwnoqfBogpY8yzewM2heb178JFcSAB3J0xTN?=
 =?iso-8859-1?Q?OO7yYovQ3qJHv0efBMIRS0ocbfx5JaC/YgDRQezjCkcpI95f/LG79Rgome?=
 =?iso-8859-1?Q?FFnc4VyIBj9MjejxnkHJFvA55n681bDAL8Z7UCYei2faK/JCaFLsJJDgU4?=
 =?iso-8859-1?Q?O7R71uJD3COTWMtpCdX3njQShWJpxbiCgHX7VbbHB1I7XQ2iWhL+UI19Ps?=
 =?iso-8859-1?Q?G8MuN7TCBUPAjEQUD6Bn8R0fdmYRzoiZaNPLAVLvKZ/Siicf5aEecBlBDw?=
 =?iso-8859-1?Q?lhMVYXdc29+TzwAsjQHcMD1fhQuwjC1sWuV8XXhZMgYGHsA9jW43795zHC?=
 =?iso-8859-1?Q?xtmYjjAvGjE8JT4PQScikbSdKBEq4xcv6dLK+WrKi1eGNDcejZ0ocQ5hhU?=
 =?iso-8859-1?Q?AlHQXxc+BMp2t79or9XRj693Lfw36wt5l4nwb5XZTsN2aKCnZWRQliH/1x?=
 =?iso-8859-1?Q?mNsxwUTq1Da1O2xxmynJN8OO5WR11NBbBzEXTT17ie9LHQY8HaAcfh9LfF?=
 =?iso-8859-1?Q?jac/jkg4ZznQ5/v+LZQSasBjNZcj01aIjhjoct5qHVXkZhPzUb2aOyD4LW?=
 =?iso-8859-1?Q?U9D9sjslNfp3smV0fxqasXsaBp+e4c0frQs5oKBfA/TVFMK2TT+NoFCjEP?=
 =?iso-8859-1?Q?p0QPGwqckAsHvKVCLNHHlEJnR9Nj1/+HpEPULXlhKf5F0e8f90C3QGg0iI?=
 =?iso-8859-1?Q?suIdxBoHDlD5QeGR7Q/5DEKmi2cFDUH8xNXbkyFTrrtsIkvUGiGldbhx9i?=
 =?iso-8859-1?Q?Oue9zTHZIbCvy632ZZL1QsKVktRd/ap6qCEgKS0b6IqKAZUo1PCOEqlQ7R?=
 =?iso-8859-1?Q?qOCfqYcH9GeKBgvub/abC8XXykCkSbHmqp0rte6YRyIrEPL53nZZwRUw0e?=
 =?iso-8859-1?Q?Hu7Igyt8WwbcZCgt+rkurBOhjIY4YJqCT/yQVT8EVvhmfos7C/0n3ocBkJ?=
 =?iso-8859-1?Q?iVgUyFhihe38ize/cVE+i1XlTRu5kY/T3HQ4azcgZ4p9rv36uDKgzFuD05?=
 =?iso-8859-1?Q?N7W7qkByHxBI9VjetiXeQLe02e4oAA4hpTg/RCltyw8eTfnhjZ/v+GFPSG?=
 =?iso-8859-1?Q?L6RPZoLY9tHuMPt2FjCgZQAOfrWqC8kSwHHG3VrRVQdROhRg92hu453Mb6?=
 =?iso-8859-1?Q?NEiE89KqktDOs53hhq1KUNNvUXWEZE6CG6rXz+h4/c6uH5CBkGo0hyMQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1421be19-1e18-499a-e698-08dc4f847068
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 00:08:57.6067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ew3iUbR34fOgaJyHxlYZ3m5GG+z8abJLbqZTdCcHTP1AFuyRua3e5FfcD/P9yGFz5kfaUSMPiL2ePe1+mwwNvR/1JqSxl9CgTDJ/435RZ1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10269
X-Proofpoint-ORIG-GUID: 66mp_c7MpvaZoTemczZkdSNP77_HTRty
X-Proofpoint-GUID: 66mp_c7MpvaZoTemczZkdSNP77_HTRty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_18,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280176

Generic Interface (GENI) is a newer interface for low speed interfaces
like UART, I2C or SPI. This patch adds the simple driver for the UART
instance of GENI. Code is based on similar drivers in U-Boot and Linux
kernel.

This driver implements only simple synchronous mode, because although
GENI supports FIFO mode, it needs to know number of
characters **before** starting TX transaction. This is a stark
contrast when compared to other UART peripherals, which allow adding
characters to a FIFO while TX operation is running.

The patch adds both normal UART driver and earlyprintk version.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/Kconfig.debug           |  19 +-
 xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
 xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
 xen/drivers/char/Kconfig             |   8 +
 xen/drivers/char/Makefile            |   1 +
 xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
 6 files changed, 439 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
 create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
 create mode 100644 xen/drivers/char/qcom-uart.c

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index eec860e88e..f6ab0bb30e 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -119,6 +119,19 @@ choice
 			selecting one of the platform specific options below if
 			you know the parameters for the port.
=20
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+	config EARLY_UART_CHOICE_QCOM
+		select EARLY_UART_QCOM
+		bool "Early printk via Qualcomm debug UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a Qualcomm debug UART. You can use this option to
+			provide the parameters for the debug UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
 			This option is preferred over the platform specific
 			options; the platform specific options are deprecated
 			and will soon be removed.
@@ -211,6 +224,9 @@ config EARLY_UART_PL011
 config EARLY_UART_SCIF
 	select EARLY_PRINTK
 	bool
+config EARLY_UART_QCOM
+	select EARLY_PRINTK
+	bool
=20
 config EARLY_PRINTK
 	bool
@@ -261,7 +277,7 @@ config EARLY_UART_PL011_MMIO32
 	  will be done using 32-bit only accessors.
=20
 config EARLY_UART_INIT
-	depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE !=3D 0
+	depends on (EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE !=3D 0) || EAR=
LY_UART_QCOM
 	def_bool y
=20
 config EARLY_UART_8250_REG_SHIFT
@@ -308,3 +324,4 @@ config EARLY_PRINTK_INC
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
 	default "debug-scif.inc" if EARLY_UART_SCIF
+	default "debug-qcom.inc" if EARLY_UART_QCOM
diff --git a/xen/arch/arm/arm64/debug-qcom.inc b/xen/arch/arm/arm64/debug-q=
com.inc
new file mode 100644
index 0000000000..130d08d6e9
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-qcom.inc
@@ -0,0 +1,76 @@
+/*
+ * xen/arch/arm/arm64/debug-qcom.inc
+ *
+ * Qualcomm debug UART specific debug code
+ *
+ * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+ * Copyright (C) 2024, EPAM Systems.
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
+#include <asm/qcom-uart.h>
+
+.macro early_uart_init xb c
+        mov   w\c, #M_GENI_CMD_ABORT
+        str   w\c, [\xb, #SE_GENI_M_CMD_CTRL_REG]
+1:
+        ldr   w\c, [\xb, #SE_GENI_M_IRQ_STATUS]   /* Load IRQ status */
+        tst   w\c, #M_CMD_ABORT_EN         /* Check TX_FIFI_WATERMARK_EN b=
it */
+        beq   1b                          /* Wait for the UART to be ready=
 */
+        mov   w\c, #M_CMD_ABORT_EN
+        orr   w\c, w\c, #M_CMD_DONE_EN
+        str   w\c, [\xb, #SE_GENI_M_IRQ_CLEAR]
+
+        mov   w\c, #1
+        str   w\c, [\xb, #SE_UART_TX_TRANS_LEN]         /* write len */
+
+        mov   w\c, #(UART_START_TX << M_OPCODE_SHFT)    /* Prepare cmd  */
+        str   w\c, [\xb, #SE_GENI_M_CMD0]               /* write cmd */
+.endm
+/*
+ * wait for UART to be ready to transmit
+ * xb: register which contains the UART base address
+ * c: scratch register
+ */
+.macro early_uart_ready xb c
+1:
+        ldr   w\c, [\xb, #SE_GENI_M_IRQ_STATUS] /* Load IRQ status */
+        tst   w\c, #M_TX_FIFO_WATERMARK_EN  /* Check TX_FIFI_WATERMARK_EN =
bit */
+        beq    1b                           /* Wait for the UART to be rea=
dy */
+.endm
+
+/*
+ * UART transmit character
+ * xb: register which contains the UART base address
+ * wt: register which contains the character to transmit
+ */
+.macro early_uart_transmit xb wt
+        str   \wt, [\xb, #SE_GENI_TX_FIFOn]             /* Put char to FIF=
O */
+        mov   \wt, #M_TX_FIFO_WATERMARK_EN              /* Prepare to FIFO=
 */
+        str   \wt, [\xb, #SE_GENI_M_IRQ_CLEAR]          /* Kick FIFO */
+95:
+        ldr   \wt, [\xb, #SE_GENI_M_IRQ_STATUS]         /* Load IRQ status=
 */
+        tst   \wt, #M_CMD_DONE_EN           /* Check TX_FIFO_WATERMARK_EN =
bit */
+        beq   95b                           /* Wait for the UART to be rea=
dy */
+        mov   \wt, #M_CMD_DONE_EN
+        str   \wt, [\xb, #SE_GENI_M_IRQ_CLEAR]
+
+        mov   \wt, #(UART_START_TX << M_OPCODE_SHFT)    /* Prepare next cm=
d */
+        str   \wt, [\xb, #SE_GENI_M_CMD0]               /* write cmd */
+.endm
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/qcom-uart.h b/xen/arch/arm/include/as=
m/qcom-uart.h
new file mode 100644
index 0000000000..dc9579374c
--- /dev/null
+++ b/xen/arch/arm/include/asm/qcom-uart.h
@@ -0,0 +1,48 @@
+/*
+ * xen/include/asm-arm/qcom-uart.h
+ *
+ * Common constant definition between early printk and the UART driver
+ * for the Qualcomm debug UART
+ *
+ * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+ * Copyright (C) 2024, EPAM Systems.
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
+#ifndef __ASM_ARM_QCOM_UART_H
+#define __ASM_ARM_QCOM_UART_H
+
+#define SE_UART_TX_TRANS_LEN            0x270
+#define SE_GENI_M_CMD0                  0x600
+#define   UART_START_TX                 0x1
+#define   M_OPCODE_SHFT                 27
+
+#define SE_GENI_M_CMD_CTRL_REG          0x604
+#define   M_GENI_CMD_ABORT              BIT(1, U)
+#define SE_GENI_M_IRQ_STATUS            0x610
+#define   M_CMD_DONE_EN                 BIT(0, U)
+#define   M_CMD_ABORT_EN                BIT(5, U)
+#define   M_TX_FIFO_WATERMARK_EN        BIT(30, U)
+#define SE_GENI_M_IRQ_CLEAR             0x618
+#define SE_GENI_TX_FIFOn                0x700
+#define SE_GENI_TX_WATERMARK_REG        0x80c
+
+#endif /* __ASM_ARM_QCOM_UART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e18ec3788c..52c3934d06 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -68,6 +68,14 @@ config HAS_SCIF
 	  This selects the SuperH SCI(F) UART. If you have a SuperH based board,
 	  or Renesas R-Car Gen 2/3 based board say Y.
=20
+config HAS_QCOM_UART
+	bool "Qualcomm GENI UART driver"
+	default y
+	depends on ARM
+	help
+	  This selects the Qualcomm GENI-based UART driver. If you
+	  have a Qualcomm-based board board say Y here.
+
 config HAS_EHCI
 	bool
 	depends on X86
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index e7e374775d..698ad0578c 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_HAS_MESON) +=3D meson-uart.o
 obj-$(CONFIG_HAS_MVEBU) +=3D mvebu-uart.o
 obj-$(CONFIG_HAS_OMAP) +=3D omap-uart.o
 obj-$(CONFIG_HAS_SCIF) +=3D scif-uart.o
+obj-$(CONFIG_HAS_QCOM_UART) +=3D qcom-uart.o
 obj-$(CONFIG_HAS_EHCI) +=3D ehci-dbgp.o
 obj-$(CONFIG_XHCI) +=3D xhci-dbc.o
 obj-$(CONFIG_HAS_IMX_LPUART) +=3D imx-lpuart.o
diff --git a/xen/drivers/char/qcom-uart.c b/xen/drivers/char/qcom-uart.c
new file mode 100644
index 0000000000..2614051ca0
--- /dev/null
+++ b/xen/drivers/char/qcom-uart.c
@@ -0,0 +1,288 @@
+/*
+ * xen/drivers/char/qcom-uart.c
+ *
+ * Driver for Qualcomm GENI-based UART interface
+ *
+ * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+ *
+ * Copyright (C) EPAM Systems 2024
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
+#include <xen/console.h>
+#include <xen/const.h>
+#include <xen/errno.h>
+#include <xen/serial.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/mm.h>
+#include <xen/delay.h>
+#include <asm/device.h>
+#include <asm/qcom-uart.h>
+#include <asm/io.h>
+
+#define GENI_FORCE_DEFAULT_REG          0x20
+#define   FORCE_DEFAULT                 BIT(0, U)
+#define   DEF_TX_WM                     2
+#define SE_GENI_TX_PACKING_CFG0         0x260
+#define SE_GENI_TX_PACKING_CFG1         0x264
+#define SE_GENI_RX_PACKING_CFG0         0x284
+#define SE_GENI_RX_PACKING_CFG1         0x288
+#define SE_GENI_M_IRQ_EN                0x614
+#define   M_SEC_IRQ_EN                  BIT(31, U)
+#define   M_RX_FIFO_WATERMARK_EN        BIT(26, U)
+#define   M_RX_FIFO_LAST_EN             BIT(27, U)
+#define SE_GENI_S_CMD0                  0x630
+#define   UART_START_READ               0x1
+#define   S_OPCODE_SHFT                 27
+#define SE_GENI_S_CMD_CTRL_REG          0x634
+#define   S_GENI_CMD_ABORT              BIT(1, U)
+#define SE_GENI_S_IRQ_STATUS            0x640
+#define SE_GENI_S_IRQ_EN                0x644
+#define   S_RX_FIFO_LAST_EN             BIT(27, U)
+#define   S_RX_FIFO_WATERMARK_EN        BIT(26, U)
+#define   S_CMD_ABORT_EN                BIT(5, U)
+#define   S_CMD_DONE_EN                 BIT(0, U)
+#define SE_GENI_S_IRQ_CLEAR             0x648
+#define SE_GENI_RX_FIFOn                0x780
+#define SE_GENI_TX_FIFO_STATUS          0x800
+#define   TX_FIFO_WC                    GENMASK(27, 0)
+#define SE_GENI_RX_FIFO_STATUS          0x804
+#define   RX_LAST                       BIT(31, U)
+#define   RX_LAST_BYTE_VALID_MSK        GENMASK(30, 28)
+#define   RX_LAST_BYTE_VALID_SHFT       28
+#define   RX_FIFO_WC_MSK                GENMASK(24, 0)
+#define SE_GENI_TX_WATERMARK_REG        0x80c
+
+static struct qcom_uart {
+    unsigned int irq;
+    char __iomem *regs;
+    struct irqaction irqaction;
+} qcom_com =3D {0};
+
+static bool qcom_uart_poll_bit(void *addr, uint32_t mask, bool set)
+{
+    unsigned long timeout_us =3D 20000;
+    uint32_t reg;
+
+    while ( timeout_us ) {
+        reg =3D readl(addr);
+        if ( (bool)(reg & mask) =3D=3D set )
+            return true;
+        udelay(10);
+        timeout_us -=3D 10;
+    }
+
+    return false;
+}
+
+static void __init qcom_uart_init_preirq(struct serial_port *port)
+{
+    struct qcom_uart *uart =3D port->uart;
+
+    /* Stop anything in TX that earlyprintk configured and clear all error=
s */
+    writel(M_GENI_CMD_ABORT, uart->regs + SE_GENI_M_CMD_CTRL_REG);
+    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CMD_ABORT_EN,
+                       true);
+    writel(M_CMD_ABORT_EN, uart->regs + SE_GENI_M_IRQ_CLEAR);
+
+    /*
+     * Configure FIFO length: 1 byte per FIFO entry. This is terribly
+     * ineffective, as it is possible to cram 4 bytes per FIFO word,
+     * like Linux does. But using one byte per FIFO entry makes this
+     * driver much simpler.
+     */
+    writel(0xf, uart->regs + SE_GENI_TX_PACKING_CFG0);
+    writel(0x0, uart->regs + SE_GENI_TX_PACKING_CFG1);
+    writel(0xf, uart->regs + SE_GENI_RX_PACKING_CFG0);
+    writel(0x0, uart->regs + SE_GENI_RX_PACKING_CFG1);
+
+    /* Reset RX state machine */
+    writel(S_GENI_CMD_ABORT, uart->regs + SE_GENI_S_CMD_CTRL_REG);
+    qcom_uart_poll_bit(uart->regs + SE_GENI_S_CMD_CTRL_REG,
+                       S_GENI_CMD_ABORT, false);
+    writel(S_CMD_DONE_EN | S_CMD_ABORT_EN, uart->regs + SE_GENI_S_IRQ_CLEA=
R);
+    writel(FORCE_DEFAULT, uart->regs + GENI_FORCE_DEFAULT_REG);
+}
+
+static void qcom_uart_interrupt(int irq, void *data, struct cpu_user_regs =
*regs)
+{
+    struct serial_port *port =3D data;
+    struct qcom_uart *uart =3D port->uart;
+    uint32_t m_irq_status, s_irq_status;
+
+    m_irq_status =3D readl(uart->regs + SE_GENI_M_IRQ_STATUS);
+    s_irq_status =3D readl(uart->regs + SE_GENI_S_IRQ_STATUS);
+    writel(m_irq_status, uart->regs + SE_GENI_M_IRQ_CLEAR);
+    writel(s_irq_status, uart->regs + SE_GENI_S_IRQ_CLEAR);
+
+    if ( s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN) )
+        serial_rx_interrupt(port, regs);
+}
+
+static void __init qcom_uart_init_postirq(struct serial_port *port)
+{
+    struct qcom_uart *uart =3D port->uart;
+    int rc;
+    uint32_t val;
+
+    uart->irqaction.handler =3D qcom_uart_interrupt;
+    uart->irqaction.name    =3D "qcom_uart";
+    uart->irqaction.dev_id  =3D port;
+
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
+        dprintk(XENLOG_ERR, "Failed to allocated qcom_uart IRQ %d\n",
+                uart->irq);
+
+    /* Enable TX/RX and Error Interrupts  */
+    writel(S_GENI_CMD_ABORT, uart->regs + SE_GENI_S_CMD_CTRL_REG);
+    qcom_uart_poll_bit(uart->regs + SE_GENI_S_CMD_CTRL_REG,
+                       S_GENI_CMD_ABORT, false);
+    writel(S_CMD_DONE_EN | S_CMD_ABORT_EN, uart->regs + SE_GENI_S_IRQ_CLEA=
R);
+    writel(FORCE_DEFAULT, uart->regs + GENI_FORCE_DEFAULT_REG);
+
+    val =3D readl(uart->regs + SE_GENI_S_IRQ_EN);
+    val =3D S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN;
+    writel(val, uart->regs + SE_GENI_S_IRQ_EN);
+
+    val =3D readl(uart->regs + SE_GENI_M_IRQ_EN);
+    val =3D M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
+    writel(val, uart->regs + SE_GENI_M_IRQ_EN);
+
+    /* Send RX command */
+    writel(UART_START_READ << S_OPCODE_SHFT, uart->regs + SE_GENI_S_CMD0);
+    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_SEC_IRQ_EN,
+                       true);
+}
+
+static void qcom_uart_putc(struct serial_port *port, char c)
+{
+    struct qcom_uart *uart =3D port->uart;
+    uint32_t irq_clear =3D M_CMD_DONE_EN;
+    uint32_t m_cmd;
+    bool done;
+
+    /* Setup TX */
+    writel(1, uart->regs + SE_UART_TX_TRANS_LEN);
+
+    writel(DEF_TX_WM, uart->regs + SE_GENI_TX_WATERMARK_REG);
+
+    m_cmd =3D UART_START_TX << M_OPCODE_SHFT;
+    writel(m_cmd, uart->regs + SE_GENI_M_CMD0);
+
+    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS,
+                       M_TX_FIFO_WATERMARK_EN, true);
+
+    writel(c, uart->regs + SE_GENI_TX_FIFOn);
+    writel(M_TX_FIFO_WATERMARK_EN, uart->regs + SE_GENI_M_IRQ_CLEAR);
+
+    /* Check for TX done */
+    done =3D qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CMD_D=
ONE_EN,
+                              true);
+    if ( !done )
+    {
+        writel(M_GENI_CMD_ABORT, uart->regs + SE_GENI_M_CMD_CTRL_REG);
+        irq_clear |=3D M_CMD_ABORT_EN;
+        qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CMD_ABORT_=
EN,
+                           true);
+
+    }
+    writel(irq_clear, uart->regs + SE_GENI_M_IRQ_CLEAR);
+}
+
+static int qcom_uart_getc(struct serial_port *port, char *pc)
+{
+    struct qcom_uart *uart =3D port->uart;
+
+    if ( !readl(uart->regs + SE_GENI_RX_FIFO_STATUS) )
+        return 0;
+
+    *pc =3D readl(uart->regs + SE_GENI_RX_FIFOn) & 0xFF;
+
+    writel(UART_START_READ << S_OPCODE_SHFT, uart->regs + SE_GENI_S_CMD0);
+    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_SEC_IRQ_EN,
+                       true);
+
+    return 1;
+
+}
+
+static struct uart_driver __read_mostly qcom_uart_driver =3D {
+    .init_preirq  =3D qcom_uart_init_preirq,
+    .init_postirq =3D qcom_uart_init_postirq,
+    .putc         =3D qcom_uart_putc,
+    .getc         =3D qcom_uart_getc,
+};
+
+static const struct dt_device_match qcom_uart_dt_match[] __initconst =3D
+{
+    { .compatible =3D "qcom,geni-debug-uart"},
+    { /* sentinel */ },
+};
+
+static int __init qcom_uart_init(struct dt_device_node *dev,
+                                 const void *data)
+{
+    const char *config =3D data;
+    struct qcom_uart *uart;
+    int res;
+    paddr_t addr, size;
+
+    if ( strcmp(config, "") )
+        printk("WARNING: UART configuration is not supported\n");
+
+    uart =3D &qcom_com;
+
+    res =3D dt_device_get_paddr(dev, 0, &addr, &size);
+    if ( res )
+    {
+        printk("qcom-uart: Unable to retrieve the base"
+               " address of the UART\n");
+        return res;
+    }
+
+    res =3D platform_get_irq(dev, 0);
+    if ( res < 0 )
+    {
+        printk("qcom-uart: Unable to retrieve the IRQ\n");
+        return res;
+    }
+    uart->irq =3D res;
+
+    uart->regs =3D ioremap_nocache(addr, size);
+    if ( !uart->regs )
+    {
+        printk("qcom-uart: Unable to map the UART memory\n");
+        return -ENOMEM;
+    }
+
+    /* Register with generic serial driver */
+    serial_register_uart(SERHND_DTUART, &qcom_uart_driver, uart);
+
+    dt_device_set_used_by(dev, DOMID_XEN);
+
+    return 0;
+}
+
+DT_DEVICE_START(qcom_uart, "QCOM UART", DEVICE_SERIAL)
+    .dt_match =3D qcom_uart_dt_match,
+    .init =3D qcom_uart_init,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.43.0

