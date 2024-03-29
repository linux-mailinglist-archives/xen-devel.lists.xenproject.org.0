Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06227890EEE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 01:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699209.1091914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpzo6-0002fA-GA; Fri, 29 Mar 2024 00:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699209.1091914; Fri, 29 Mar 2024 00:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpzo6-0002dF-CR; Fri, 29 Mar 2024 00:09:18 +0000
Received: by outflank-mailman (input) for mailman id 699209;
 Fri, 29 Mar 2024 00:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRsJ=LD=epam.com=prvs=0818e5feeb=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rpzo4-0002Ab-PI
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 00:09:16 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9315c516-ed60-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 01:09:14 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42SN0uE2024084; Fri, 29 Mar 2024 00:09:07 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3x5huq82q0-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 00:09:06 +0000 (GMT)
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
X-Inumbo-ID: 9315c516-ed60-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D97MIawLmQwsTLx66x1lIxjGCayzR1FGCIk9IFmaNQ48WCJfORvgC9p6h7SzJVFndTvsmzRkdnb8IqDZV4lZC2gfYyvQtB+V7SDtl75plLh1awRnNMWc/q/LNA4x+HzbjBtj8MJ7jwfZ+RHq6fc449wKnFJj0wkWwELIpqbBhCBkyxl4iT//typWK7AVwihIRV4uGA4lf0CuZvePk76YSJ32LUMKxUDsJYcCYl2l08Cq9hGF39YBt7Au9F/kjwsh9B4s0JjkrPAR58RZsDKQo/eA5V8OkWuethJZ0FOpNVCmfl9w6N09esHpdiImBD2W/YpvhDdzkT+RJzXUwoM1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH1butYk+sVQ3P+oDpW9nG8CNGBCKGfZjsvyXmRUE3A=;
 b=co+NxXayP95jU+gfpouspVixkc+2fQ9nHQ87swqs9PssV7+NK6bLhOtKevMtr63b+AyJRtX+2eDrK3l/8q+YzS01FNtARRZr0pF4kN+kxCTqQ9TOOxflitvARLb5kU56XtbFzilHZGyY9tU10E60VrTYVgKRaGB1YnpMklGaXlVPdr6jLHIapZrBiI0ehj1HVXmsfalUZji8sQTqOy7ym6/nQWqS5zTBTZGQ5p620PFkYftQStf5WASqA1zqA6tmtva0IUln/kOZYWkWJfA/Z3OE1+qzhwVRXn51PcRDTD190bcBnJtvAPcUTjwyEXUQJgPv+4GANetQYIWCFx3Xdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH1butYk+sVQ3P+oDpW9nG8CNGBCKGfZjsvyXmRUE3A=;
 b=kopJppY+vRvxMYGbii77qInqB6MqZA+gBrr8lXP4kFkyIKXuLXDj+bM7w9pd/GnYuHoaQUDAvZGstqiZEKFUKeBYNfEAaa+vaZcgEC9sXiCn7Qi98ro06Ohk0Mnp5stfsaYVNwASYDvaF7Iy9vf9YPBeD5PHv+o0ShzKjYB/gXzN6mmj+fO4/8KpSXXg+7JtjR7dwivnrdb33U0Ap2wU1tNp1Vj/gnhfWvuccY7GxLx4WvwEVJTGmDZU1m+hKTGShCQyYsBsp+VB8d7C33wkMfR7x8GvJD10yN0CogjYfDWmwi+fuZ/o21WC/y0W60ZBGjPdPmTDtZg6USF38JdFXg==
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
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] arm: platform: qcom: add basic support SA8155P SoC
Thread-Topic: [PATCH 3/3] arm: platform: qcom: add basic support SA8155P SoC
Thread-Index: AQHagW1LlGLM/ZuGTEiUoHPlQw1VXw==
Date: Fri, 29 Mar 2024 00:08:57 +0000
Message-ID: <20240329000822.3363568-4-volodymyr_babchuk@epam.com>
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
 AeNgULbtw740pLR3Jqn4qCH5llW28Ludng8RNxywu3mE/Da5cyA9TA0covI3wgOyRK3DkvZIN56Gv6Rn4Bc3Ds4zAU6+MxawMLpaz3nchCK8kVBBVYtWsvBTh0T2YEKF96FekfJFjjgm9EiYDuEhqrU5f9W6TWfqmlxtiGMDY3/1+R7Q8ch6MEns2jM9vGQRGzAlMoiPvhxlJIpECl1CnTB9u5C3oEyqrYFYGvOcEcaOj7CU5/zw0LHHVd1ZS1uvdaaoqZjzkDgw9v+akUaPh0/wqa5/hNMDuU9hWOgLDNH0RR/dvBRa+l7e7qyB2mthDV1lJlJYpupBN+r0po6HHL7qOSF5Gft9Unl0EK90ICVWgNVJSqfY+g88sQCRMVYDP7f78C+/uQ/zZBLonGhw4KmN7mnQNxETJXCmywfYeA3IEX1JExeRfBDG8AbR+HTSUXQKTZT5e9Q9YwfOL4W/oLqq6nq+tz3zA4iiCbvCZ5rd7uEGUYLuV07ofDtBgni4dgMeB3YgdfJ/BddU+K2zENz9Iy+0P7lNqxHZqNYpqiCd6CbC9b9EVzI2XV/nCOcHdUfRRDhW9VcBuJqZxGFTbVtTkbddqiZ7/n9rPg9si0zg/URlURugPkF/992Q/tmWmkcFRP8dWVR7IN/J61fIu+OXH7YI7JaVTYjEz5dLJxs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?vs+qj7UWal21jwjnarbSbPkggjT9XF3JFLo9hXp0MsHUkKUVRiqaZ+EjZi?=
 =?iso-8859-1?Q?TuBU9k2WH4HwlsYYXGkrch8D61lAT+/jj4UaoZDoLHeMUORJe2uLd9OhTQ?=
 =?iso-8859-1?Q?4KvNegL8Jmk7DPvi1AdL/1PZrXipL5C0a0U+egBwi0BSlyM+ABBHyVaP4R?=
 =?iso-8859-1?Q?9MQ+cAaN+YNlJXXQuzE5piuV35324jG6+idsFOTZIkcI3IEBQ03TqeJnsM?=
 =?iso-8859-1?Q?VZrasEZWkE7GgeO7xvVxuSROzUachJMLA/yNdYnarVTcLZgBM2DFbZjX+0?=
 =?iso-8859-1?Q?+nHi7t2z94mfdFCcuVysR2uImLXfAkaKov4wXwtPFZ2dFrDJjWr7z/LLbu?=
 =?iso-8859-1?Q?q/98itATlDgkivBRI4KnPEPKI8DgOUCRkZqVcBWZEfr21Kx39mmY/B+eRx?=
 =?iso-8859-1?Q?NRdGqLdCTXseKSUHqJGqQxt7ZC//MVO8YvyFWUuPjcy7hGEzh1X1NVafZL?=
 =?iso-8859-1?Q?GPC56OQ1cxhnmAwpdsiy168z2WRb8bZ8imHtMOLLOtOyWgXoA40mDTEdQR?=
 =?iso-8859-1?Q?GrGsiTi5i7GJhPviC2G5zxXs2DEgESmRVqX8o0+52pZol3C96PnCjv3i0B?=
 =?iso-8859-1?Q?dM+6JFTYeUs6EW1eO83S8v2bUbILCi31ad7YBASJd5hiy3pbWGQZOY22Rk?=
 =?iso-8859-1?Q?DXNExlzYcM3/ZnQrqIEZnMX9WwumfLs0d9Ia44nzR8tgo7XS9b6g+KjRqQ?=
 =?iso-8859-1?Q?hrOxepi+NfrRt/RQcQjNjm6goHZ/O1Le/bgw5NZNCPfFGEOzNOdIE1YG8S?=
 =?iso-8859-1?Q?9mF5hZ34Mp3fc5cZ8YWMVNHJrtco6qTkKJ+fIaHdZvmDBbTnrhqvSkWnio?=
 =?iso-8859-1?Q?IOBNKo4RgVcxj2ac65rV82B5EQZu4dMtJRYs38BD/zOgL07SzmcgVHFYxy?=
 =?iso-8859-1?Q?DTaAWVsc7p0S6ZLB4rwq2RGhIJTFBWH9lWmQdRmotgNaqu3KzYZxR4DI6N?=
 =?iso-8859-1?Q?vATTDdCTDBT2Hf++3DguNW3fCSuPvWdUcb+02+MauMoOkoblMkCtJxCzii?=
 =?iso-8859-1?Q?nz2yKixPE3S2OzjkuaQCRMmtLah11ejSyYGWGTJpj6kgh2SXntXas/kUM2?=
 =?iso-8859-1?Q?1ijGJBuyIYvMJyTVGMM1hRl8HsZaJikuVA5P13V0qOfkmueK8QdYZ5r4CM?=
 =?iso-8859-1?Q?GYvKj84MZBgkQFijObEKGR5BjqRZB/hCRcAyeD++wZxNJY6L+jP31Y4RF/?=
 =?iso-8859-1?Q?T0jAaPp4wTa2mkC4aL+JBVRTp/Xj1uessbU/zAxomhSuANgW69ahiAte3K?=
 =?iso-8859-1?Q?whj3Tl0b/9JQn7NpbFVMB50VZpWPQ2TFHhP3HssnKAUsSS9030dyzqdN65?=
 =?iso-8859-1?Q?mVz73hZuXxVwQE89zzYQcJlScC+bMRl9p+0X2oabqvdf/ZBbeDAVaGfxR3?=
 =?iso-8859-1?Q?plo6bcsFOA5AbF4BCNvO8PVxBKxvUjJ0GI2+D2hKQJMBok0An+4PPNUCPj?=
 =?iso-8859-1?Q?xnXQH4u5+PjEEFgKIEPJpbRxjnITZZvcakCyd3gYqefFn4KlZLn9hRAXE7?=
 =?iso-8859-1?Q?wnWiyTsmTFnFrbnraIhwq2bDlvr9Fkch6fELrORQ9zHeGJOhf8abQKA84T?=
 =?iso-8859-1?Q?w4VPKMrwgB+uJpj0LOBHr9MqhzHgy/1XCaMaxxnnhOZRu1HiKm7+m7hFZK?=
 =?iso-8859-1?Q?WZERDhbKTYPWz65v5NCuSVBr6V8rgyJL/COubC8m5glm+T1BGOEtumhw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ade332-51ff-4e28-7614-08dc4f8470a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 00:08:57.8670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46/wWUq9u3U3AY3/Led7oOhEkYiw9vQib9IIJtQXp0kjnpXrr9PUteyiux5DYYAD9uexlFZVnLQIBy/OVSbZ12pwB7Po+26rC2yZ+Cbo/qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10269
X-Proofpoint-ORIG-GUID: BlPPZwPXMa1lXMr60BeXXkkHGXwUdR_8
X-Proofpoint-GUID: BlPPZwPXMa1lXMr60BeXXkkHGXwUdR_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_18,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280176

Qualcomm SA8155P is the automotive variant of SM8150 aka Snapdragon
855.

This patch adds very basic support for the platform. We need to handle
Qualcomm-specific SMC to workaround quirk in the QCOM SCM driver in
the Linux kernel. Basically the driver tries multiple different SMCs
to determine which calling convention is supported by a SoC. If all
calls fail it decides that the SoC uses "legacy SMC" and tries to
communicate with SCM by issuing SMC with funcid =3D 1. Problem is that
Xen has own understanding on how such SMC should be handled. It
interprets this SMC as legacy PSCI_cpu_off and happily turns of Linux
boot CPU.

To workaround this, we pretend that we support
QCOM_SCM_INFO_IS_CALL_AVAIL, this will make the driver use the latest
calling convention. All subsequent calls will fail anyways and the
driver will terminate self gracefully. This is not a big deal, because
right now (with Linux 6.8) even on baremetal setup the driver fails
anyways, because it does not know how to work with this SoC.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/platforms/Makefile |  1 +
 xen/arch/arm/platforms/qcom.c   | 77 +++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 xen/arch/arm/platforms/qcom.c

diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makef=
ile
index 8632f4115f..6873735ef0 100644
--- a/xen/arch/arm/platforms/Makefile
+++ b/xen/arch/arm/platforms/Makefile
@@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   +=3D sunxi.o
 obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
 obj-$(CONFIG_ALL64_PLAT) +=3D xgene-storm.o
 obj-$(CONFIG_ALL64_PLAT) +=3D brcm-raspberry-pi.o
+obj-$(CONFIG_ALL64_PLAT) +=3D qcom.o
 obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp.o
 obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp-eemi.o
diff --git a/xen/arch/arm/platforms/qcom.c b/xen/arch/arm/platforms/qcom.c
new file mode 100644
index 0000000000..77e9c58649
--- /dev/null
+++ b/xen/arch/arm/platforms/qcom.c
@@ -0,0 +1,77 @@
+/*
+ * xen/arch/arm/platforms/qcom.c
+ *
+ * Qualcomm SoCs specific code
+ *
+ * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+ *
+ * Copyright (c) 2024 EPAM Systems.
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
+#include <asm/platform.h>
+#include <public/arch-arm/smccc.h>
+#include <asm/smccc.h>
+
+#define SCM_SMC_FNID(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
+#define QCOM_SCM_SVC_INFO		0x06
+#define QCOM_SCM_INFO_IS_CALL_AVAIL	0x01
+
+#define ARM_SMCCC_SIP_QCOM_SCM_IS_CALL_AVAIL                            \
+    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,                             \
+                       ARM_SMCCC_CONV_64,                               \
+                       ARM_SMCCC_OWNER_SIP,                             \
+                       SCM_SMC_FNID(QCOM_SCM_SVC_INFO,                  \
+                                    QCOM_SCM_INFO_IS_CALL_AVAIL))
+
+static const char * const sa8155p_dt_compat[] __initconst =3D
+{
+    "qcom,sa8155p",
+    NULL
+};
+
+static bool sa8155p_smc(struct cpu_user_regs *regs)
+{
+    uint32_t funcid =3D get_user_reg(regs, 0);
+
+    switch ( funcid ) {
+    case ARM_SMCCC_SIP_QCOM_SCM_IS_CALL_AVAIL:
+        /*
+         * We need to implement this specific call only to make Linux
+         * counterpart happy: QCOM SCM driver in Linux tries to
+         * determine calling convention by issuing this particular
+         * SMC. If it receives an error it assumes that platform uses
+         * legacy calling convention and tries to issue SMC with
+         * funcid =3D 1. Xen interprets this as PSCI_cpu_off and turns
+         * off Linux boot vCPU.
+         */
+        set_user_reg(regs, 0, ARM_SMCCC_SUCCESS);
+        set_user_reg(regs, 1, 1);
+        return true;
+    default:
+        return false;
+    }
+}
+
+PLATFORM_START(sa8155p, "Qualcomm SA8155P")
+    .compatible =3D sa8155p_dt_compat,
+    .smc =3D sa8155p_smc
+PLATFORM_END
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

