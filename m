Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0155F76E5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417690.662485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfI-0007b4-M1; Fri, 07 Oct 2022 10:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417690.662485; Fri, 07 Oct 2022 10:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfH-0007FY-VM; Fri, 07 Oct 2022 10:33:11 +0000
Received: by outflank-mailman (input) for mailman id 417690;
 Fri, 07 Oct 2022 10:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf9-0004PE-BW
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:03 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 693c3526-462b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 12:32:59 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2977q6QY027397;
 Fri, 7 Oct 2022 10:32:56 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k208bupyb-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:56 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DBBPR03MB6716.eurprd03.prod.outlook.com (2603:10a6:10:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 10:32:52 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:52 +0000
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
X-Inumbo-ID: 693c3526-462b-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfPdjuuE9j3LU/YVeOAlGdAUaRqOVYY/GLDpNjS2NoBTHaQM0HaOCqhBmq6gKeF6/LivQxnnLO9asZXPuK6KX3vQMRRgX0+EKh/dWj9/FfKApm4jo0i+uRifQcyl8DbkrLWA70LeQaNwLxCHHVh4yH4fXRQEHNpXT63TQEStJcCpm7wuiLyKNvH+9ZD6ht1Zk72LQwQcoY+hITrQdemcYIaw90XngCAidHv8WeuX7YZS+VxIjb/aXTGCvLYRZjc8bNqP1gM5peeOtEPcmS9OMdg5PzUX67O46HgBFj7bv99f+ZOVPFGISINp4jGkgX02DSUPM8EMRr5gH3sWQiRfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unz+jrtnrI+CjltUTU38KqHD4hMG6m3HsyrrTQHSbvw=;
 b=HR9uyYUA+pcvzG/g3WEelzFgquVGiXRBMDaEfNVdJ/uQv3HsGyYq1jNL5RdSqN/YY+hy5L3QmbTdOm9+TfglKRUfUNX7WGditEwn/SQJMokuIuwXncNfQV/YObzD8on8bSxUOZZjcexF5Q1U3qMwUK+vZeu7vxpNKFWhDGg4GXCSM4vG3KpB/nB+FornvJsBs0Ov9zO2y3D+WpDpZFQCqiZJhLjaJiiIoGvDELKsG6OMXdbE7ynzmYi95swOF7qyq7jBR1C41B49hhpRHRH8YfeovJ4mRbqU+rSKEqnCKXUe+BkmURRE7qNr85wHg0Dxq1HfFTuiHnggsghVZ0Cm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unz+jrtnrI+CjltUTU38KqHD4hMG6m3HsyrrTQHSbvw=;
 b=M9msj1BE3qxjEupp/yZZTPoAkipuOoxSeZeJiRug7Ud1Cj+KH88y2uSHAUUYvB02akWLfVRjWpL74+wX5z0bklSk8+ZIZnZBYfy+zZ+KmlXnh30sQYDUBPCT25NNZTrOyTKLtgXwthc74IMKR9TjiJhNMnBuE2lerX+roWzRgtbXXrXeYVAiExBwtS420TrL/A+QxwZqTBzSyVUI+CtqciudUpOdJ8amyT7K4TW4EPsSaXsswSe0D2EDDS9U5h0ja0QChy2MfrTV8YcxVEw/VEUF8O+6xE6BwCQ6JlbA8tMcnxPiIGcSWxLRntf5u8ag2shqXDBwosRqlhhcRqz7TA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 12/19] xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical
 interface)
Thread-Topic: [PATCH 12/19] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (physical interface)
Thread-Index: AQHY2jglXt2WenDZ1Uub9jvAfdfdiQ==
Date: Fri, 7 Oct 2022 10:32:49 +0000
Message-ID: 
 <3c5ec1f22e9ae6bac7ee98f63a0a700d7c3ec11f.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: cadc161e-6439-4a3a-deb9-08daa84f4a00
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 W/RhVCMWheAiOuatjlYbhbK82rGRxdS4LnZPLGLf77Cr4X/PTh8XFVHGGHTFTcX95t3MaVaLU/BYQJurQ+0f8flhdHxrQlb45wWYoGSoWsiv7w1zFdUifoi8qjgIALMvyiC7zHM3HWwLTQpaUrzekyC452keDvQMBcpbEat8kFzsB/RdAl4hYF6tuzA4moRBqinkPykPO5gN1ju/wOUnqZSmn5QeQUBYr1ZEOcKIxLNZmy2JRAHmjS/Ed8LgMaHG+I3krY+PYpSc6dD7b8XFKADnxm3gImRX/aqHIiyssLS5uXw4kgT5VTwynQ8xvF2HUJua7TXEbqziQjcayJIL5ejZsq9XQsLoXqBPQfIyG/OkOnCZCZbyASZ4Zf0CsdLry7i4KDBiqVQFg9nre79Al86579DSx/AcN3Ym/XJVg3yQdhh/+ZCJh0ZTUnSWC2brBVKTAHxINTK97xFIShg2iy3RJHetWZahaMolxhlVU2mVtRMSC/1/LisG88iZ9a4cAyJX+2jTfT/Ql7hlCnGxCtm37QW1xHuALxxSwTNtsFi8eei8H16NX7s8osiRkjU4cn/xeOQIewKBHj8kEdOQ+64JJjvBEqrEXRfzWQOjaksCHWGTLNCU4lhQvXEYsWxHKvd6CFHkmQI57seJsjZukogGzjphfEVjB4rqq1RbuosFDyoKnnQr4eTWDImzuA2Lic9glkv3nYo4Wufqdc1b9gVcVDvLsHDewGO8Vfey+Zs6AmFVSKj0lnrjFZV3sInEKovCNIIaU0ExKt8rmC59pw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(107886003)(38100700002)(38070700005)(122000001)(41300700001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(6666004)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oLF5zdZIwQ61uoiGz9x9VeL95J0qey94TadFHNnfGDsAZczeTHwTpFRYa9?=
 =?iso-8859-1?Q?YTxEne2gOD8s0/nRrRW1/Y15Tx6boUIbWVLL51OWqKDAM69iW29T9R0qMX?=
 =?iso-8859-1?Q?0HaDM6YECEwFirA+9BNXRMT5puVhacEFsxVyD1EK0wmFzJM5KMRapBczi6?=
 =?iso-8859-1?Q?+BV0aRJorfMVNuXhwymeIlvOKDmQLuAS8UJpyV+Pxh6v0caZvu3p3+iUL1?=
 =?iso-8859-1?Q?CQAZG3DLBzz2L1/ZwyIvODWYj7ABCBeyu7Mm5szMhj5LmhC3n5gQ12K3Tb?=
 =?iso-8859-1?Q?sSsehr+mDBC9E0BN1E6+rpNI24ubG1Kzrs+duQdYJhEcP0OnM/Thh9oMen?=
 =?iso-8859-1?Q?vbJu63Mq6zTEK6Z1NhlgnsrWa7ove2fmPxZL0c2tA+BGkZX3feZlxnzloD?=
 =?iso-8859-1?Q?sCoTyEn2Yn1Rsi4VrKPMYFzqUrDu56GNKQj3RJeu//VdolKpMM9Tyfvfw3?=
 =?iso-8859-1?Q?YK3tZ9z54E1eWm3KBZKKEbIXnLYYHGabHJhabamnfWGhYnpijoiZ8nLEHD?=
 =?iso-8859-1?Q?9LPKqo6cA5mbkS/v2NU+ghgZxngyP90Idy7f159Ntn/sYTKmD61CTxLEa1?=
 =?iso-8859-1?Q?MDsoR6CKJ/7olmYXav++5FQ5uEnu6YBLmGSdvm2QQz5tYiSf9MIfWLvFMD?=
 =?iso-8859-1?Q?Vgwz711zrGChLNx/k2oJxEZuMnbLb4F9teMvpHLSC60U2c+ngPe9aSmnur?=
 =?iso-8859-1?Q?xXcqulX5YOPm0afpsOF7MoLr6iOH0rz80xYDG8s4uLKND7oZ+CejEPXh0K?=
 =?iso-8859-1?Q?OVta+jlEiM8PcdNqiOQn4vVe7+4TYPyq1ThihBZ3+aRZM8ZlQhij8iHgXg?=
 =?iso-8859-1?Q?zge2GDM4FYnccnOxBZlope19qqgfDo/V9w2KiV0GIc6q+OvHGrMLY+zrDT?=
 =?iso-8859-1?Q?UNnPfOvlhrqMqGqlwGZgWA5Sf2W0lh8e5M+2w5WlhnOK0a79nxaCvu0FkG?=
 =?iso-8859-1?Q?RMhOTTm9He1GjGdVPzGtOdYGcGtL+2ADYEOaNirkI3TcniB3QMf8F8Z3NM?=
 =?iso-8859-1?Q?fs6VfQ2TMyequ6wtTrWG7ZLdobrxDk09NESZJu3NQhHFhR8E4WHRKRCmu+?=
 =?iso-8859-1?Q?ToujN6idxRzB+iZBMnRcBrt+j4CzZULtYQjHQcLO/F+9pVaXGWDqXIKVIb?=
 =?iso-8859-1?Q?Z94SSc5KeIrvmH7GQixEBM6nScyRzXVMzPPicitBweoTzfw872P8j7zTks?=
 =?iso-8859-1?Q?Gk/Up1qL36kaiIWRlwNAmsXz9lXT/rWm4S8SUj9OiY8fLrLJ1kgR13JIy8?=
 =?iso-8859-1?Q?ZNlgOmAPsrCiovtTmNILZGRwYudSEQIPsMW0pkd8WOHjEQThNbERw24xhh?=
 =?iso-8859-1?Q?Q34vQbftIxFZqA2Hge2TYcs8Jr9B7EN0hp0MFoXqTCd5PtYk04MhGHAMUQ?=
 =?iso-8859-1?Q?pxadtO97XNEw2y524o2R/m+gsafWSw020RlDhEDbLb9E7VFxC4ygpzB2zU?=
 =?iso-8859-1?Q?S0AfkE2CR6m2Jng7AEaIRi8jSGXZl4Ey3lOZb02LiIHJG/5+SMuZYlhi9+?=
 =?iso-8859-1?Q?Ge5DErpNprBvWJRmYgFo+VD4I0Aby8Ztu+8RyW583Nn+Q1DbCDel8FaOIi?=
 =?iso-8859-1?Q?IKemUMU+TrbKYP80yOeHsH+Tqb5jJ7goEl2eMyIDaMoTE44eYzBKuLUtw2?=
 =?iso-8859-1?Q?ZkZX3ApYw5kV06+sBLV1MewB/bVniEALDFnHGUgXWeQ6MhLUetvyamxg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadc161e-6439-4a3a-deb9-08daa84f4a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:49.7083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: haPwk+HeC6NjZhQbbI1qXuUU6DfMM6vmanzcnUy5/Fg72CeJXTonsb8+Ur09uU7PWrfjmyb7u4jjBwQjfRYxCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: lv8on0Bzs9Gnx-_bIOHkvxt5fn3yGKU0
X-Proofpoint-ORIG-GUID: lv8on0Bzs9Gnx-_bIOHkvxt5fn3yGKU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=969 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

PSCI system suspend function shall be invoked to finalize Xen suspend
procedure. Resume entry point, which needs to be passed via 1st argument
of PSCI system suspend call to the EL3, is hyp_resume. For now, hyp_resume
is just a placeholder that will be implemented in assembly. Context ID,
which is 2nd argument of system suspend PSCI call, is unused, as in Linux.

Update: moved hyp_resume to head.S to place it near the rest of the
start code

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/arm64/head.S     |  3 +++
 xen/arch/arm/psci.c           | 16 ++++++++++++++++
 xen/arch/arm/suspend.c        |  4 ++++
 xen/include/asm-arm/psci.h    |  1 +
 xen/include/asm-arm/suspend.h |  1 +
 5 files changed, 25 insertions(+)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index aa1f88c764..8857955699 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -957,6 +957,9 @@ ENTRY(efi_xen_start)
         b     real_start_efi
 ENDPROC(efi_xen_start)
=20
+ENTRY(hyp_resume)
+        b .
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 0c90c2305c..43a67eb345 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -25,6 +25,7 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/suspend.h>
=20
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
@@ -68,6 +69,21 @@ void call_psci_cpu_off(void)
     }
 }
=20
+int call_psci_system_suspend(void)
+{
+#ifdef CONFIG_ARM_64
+    struct arm_smccc_res res;
+
+    /* 2nd argument (context ID) is not used */
+    arm_smccc_smc(PSCI_1_0_FN64_SYSTEM_SUSPEND, __pa(hyp_resume), &res);
+
+    return PSCI_RET(res);
+#else
+    /* not supported */
+    return 1;
+#endif
+}
+
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 05c43ce502..a0258befc9 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -161,6 +161,10 @@ static long system_suspend(void *data)
         goto resume_irqs;
     }
=20
+    status =3D call_psci_system_suspend();
+    if ( status )
+        dprintk(XENLOG_ERR, "PSCI system suspend failed, err=3D%d\n", stat=
us);
+
     system_state =3D SYS_STATE_resume;
=20
     gic_resume();
diff --git a/xen/include/asm-arm/psci.h b/xen/include/asm-arm/psci.h
index 26462d0c47..9f6116a224 100644
--- a/xen/include/asm-arm/psci.h
+++ b/xen/include/asm-arm/psci.h
@@ -20,6 +20,7 @@ extern uint32_t psci_ver;
=20
 int psci_init(void);
 int call_psci_cpu_on(int cpu);
+int call_psci_system_suspend(void);
 void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
diff --git a/xen/include/asm-arm/suspend.h b/xen/include/asm-arm/suspend.h
index fbaa414f0c..29420e27fa 100644
--- a/xen/include/asm-arm/suspend.h
+++ b/xen/include/asm-arm/suspend.h
@@ -3,6 +3,7 @@
=20
 int32_t domain_suspend(register_t epoint, register_t cid);
 void vcpu_resume(struct vcpu *v);
+void hyp_resume(void);
=20
 #endif
=20
--=20
2.37.1

