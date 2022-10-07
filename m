Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAB45F76F0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417691.662499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfL-0007z5-4k; Fri, 07 Oct 2022 10:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417691.662499; Fri, 07 Oct 2022 10:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfJ-0007hE-LB; Fri, 07 Oct 2022 10:33:13 +0000
Received: by outflank-mailman (input) for mailman id 417691;
 Fri, 07 Oct 2022 10:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkfA-0004PE-Bo
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:04 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b0945b6-462b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 12:33:02 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297AP2K0008629;
 Fri, 7 Oct 2022 10:32:59 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k208bupyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:58 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DBBPR03MB6716.eurprd03.prod.outlook.com (2603:10a6:10:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 10:32:53 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:53 +0000
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
X-Inumbo-ID: 6b0945b6-462b-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibfhsYYdwntXZQnBsEEZH07IVCGQutu+fulxcY03bRKtWq2k3/V5MhCMOCBJYuNF12P+8shynttQKmQC/CrR6Tv9l9IhLntQPJI0uw9cAb2TKEXyYnMQ2Ujd+BySNVUP2smaIVIQsZU2JTy71NyqE+wnHKuOQjnXkGA2RZSAk8lpuKmf13KUspRlxYY+nf/49x1alWp9JCGtXV7g60259flrbiEPA+Pu5i+UkBiviGXn8oQR9aCRePdJMoHW7IHs/0qW6dw+pPrxRdnYWS+4kjeLgpfcVPBoW6JB9d0l4yF4vMYS4wqdsL3Ra7zbpgynK4KgSia05q2HMOVN8jwqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtlCpwNec1h3byQgM+ugllxAri/F4tEk+BYv+hXGX2s=;
 b=TpH8Xi2K8ZBH52IqpYWiiK7mQo96o44SnTEm2dJr5lLzWAF9E50cL5BqPb08VWQm92eUpqrm8qlyyB9teer0aFniK9eCuABMsq7PqJyuB+t9loWGG4uOv+6sPtWVoE3lacUXcOmlZuT2FkkayV7fXPYpSjg5c4FIMTtrkbmKvzjjJ+/G2xdfpSkQbI42tQgdQRqGXTXhuto16eApBCfd0gBElx4hS6wnSxW29T7kOYqEqWhzJF5fJZR8PKEwHjka8mO55x220lIdd0YWQ7Iy4YNwHio0uPliympcAWaHXFQsMcyzgQhrkX0BQTvLrll2lZo7I0GCREBEJRIlPRVCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtlCpwNec1h3byQgM+ugllxAri/F4tEk+BYv+hXGX2s=;
 b=ViHIOe5xUhnvm4UpUy+0zWkpDhc1VIdhwklb75v/cb3pZ46NBw/FRIC00pKVRsg9JCCjsNNW2+/N0jGzLAMIjK19l3gJ6SUqGntQH/L0rJmfIM0XiPFHa/oE/Sx+A2UR7lwA/2fWR9sW0qJixqjINCDZqdwxZtATTX+6jzRgRYo3q9aJfqAdhVe439fLGEROVQ1HyPvXwYUa5EN3he8ghl7Uc+8gxhY8Czfj5lp5V3R+HC5n9+VE8hjVZnAPv7vhMI/CKg/Upv2XFUrEXsYZsw6L0L2zObFMmeoPr4P4iOwN22a7OAm6Amk8+1qTdSq4jKSJrKN/XHFhyOBOhmj1Fg==
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
Subject: [PATCH 14/19] xen/arm: Save/restore context on suspend/resume
Thread-Topic: [PATCH 14/19] xen/arm: Save/restore context on suspend/resume
Thread-Index: AQHY2jgmlOzu00YIlECkxJuKgOBIPA==
Date: Fri, 7 Oct 2022 10:32:50 +0000
Message-ID: 
 <dcd3e1ae475a478cd6f639c528565492b10e0f22.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: 862e9cc4-9561-4990-c20f-08daa84f4a88
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0x502QPj0hMyDLvr1yo5DwQpWc7Q+PYgxW2WJ4Z5iKTZQSt8E+MoQvZS+Vp784cOTvowMl85DG6z48jD8iC4FVTTxZUFSgtwaeoiPs49uN9j1mvDdIYdtxBOjIOV6wxqg0PfOH6enHpGU2OaoWgxxUae3GahJeOMRPUFuG35Qr4Fto8eMJiruOgM2JRe0Qsgp9Zd120zFM4V7q2PaO9Bg26G2PZPEKA3u4qlt9prYZBv+xjoj0gVPHaIEwJUmBNkbeHcN2brF4wwOni8vDBlAaTkmmyMezbRPsUBkMsTiYMXBrmvUlfZrMXIgnJUasmLbbtIVEZwhaR7kNdV0FLx742z7yR1Tn7rlmAcU64qfPkcjy+mjjamnoLJEL/KAf+yCrP4HcELhErG5w59NzWI2jmUO7cFI+xAU1kj7cEafGIoeBz8UECuKkhezCa+fjIXsObESwo2hJy09+bqR2pCHEYPnH3x9Lo0v7+t7MRUw6jrh3xsJoGA9ZZqdIsT0Wgk+F6scwwo6BSUH9okfp/LcA8wnY9SoUcLAWAawYAM9JrcdIdk1zQjgautWBUECLkOJwHG2dJM+wHlMDQYxLxmKTwm7I/FRPauIYCJ6FOv97o1Gr/GjnRRrrc71oDdxzEq3Jn+KXxvLXKcUX0SrAAhxRHobWxsQxtjJ5+ItSs6Zh6eiwnx/D+RLhY5T74VkjxjJG2Tmmbi7gtZPHJMc2El496Vn1d0HvQQbsOEhhbv41FM/BoS78YqVPBxEh+eNrXRkuChuM5NhRPaT1FVF0f5Xw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(107886003)(38100700002)(38070700005)(122000001)(41300700001)(15650500001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?TUJJFM8iulQjEAxS1oZ8P/GTaPPO2SmGCysMVxPjsPDRjM8VAipjSzjr7f?=
 =?iso-8859-1?Q?/rCuWR+J7rP89No7prIojxJrKHjIBj+gC1pipStLtVYgTBUPQtbxpmTe8p?=
 =?iso-8859-1?Q?eBGTWmgn+l6mmfTfQkIhW6I15bzG6KcgSZdfv/hIYrAIBVp/1b5ZTy0q6G?=
 =?iso-8859-1?Q?Yh1vrkl1tcfCVQT0rNhZxyVziuAlX5pz16tDI4QZrFXbz6ACE29It3fYfM?=
 =?iso-8859-1?Q?gNBECvkveKXmsfWvBLPYENs3tu4PCqlXrb/e6mAt/VtSviQzU8a/KNip6w?=
 =?iso-8859-1?Q?G7Wovn4CoDbzT/RTtz4Y3dPJRrIAseU12TdmVNt7RGkVG3QDOpXdiudc0l?=
 =?iso-8859-1?Q?2so1d/Cpt0LWSY378SU1pNWuDAhpqoEcbWqlkpDX5sIXeeCW5BnSIT0NAE?=
 =?iso-8859-1?Q?qy/H2tOKmQhE2seiYi/5VudVUe6wNUNw7X8GBzzpCkqaCbyVspe1smew1m?=
 =?iso-8859-1?Q?txeMugSt7AxJ+ClnUvICgCVUAJtcdGc8OCaTbmuE0t8KUjcv+VHME0PnyT?=
 =?iso-8859-1?Q?5HnRtb1lQr+HY4JFRj2yg5mYOCSsxRGZ9l/zH/mzS2A/m/+gkKc+nt4haB?=
 =?iso-8859-1?Q?1RLg3PtNfvSvKGDiEh/wDYfkVdNp2AWJRtjahz4zw2i9VfbAggUBDrk/2C?=
 =?iso-8859-1?Q?VU+zpjltZJsO962IjNk0Zu74/KCr1QaaatgE0N/hZQzB3htYHo0fp+QMBo?=
 =?iso-8859-1?Q?bjTZMFMCkkZdeh9eQTkW2mcoG3lT/lATRGQsqEm3UG5Ynysc3g+tzNIBeF?=
 =?iso-8859-1?Q?aoV4u2hhac6mk+pGNF2Q9fuzEaQ7dV0VBbzos1OLO0+EA0S4TSO2f28s+F?=
 =?iso-8859-1?Q?goPv0sOS2E4ph+XXiJMMLJH50dqmRqleQGph2DX1oVHxyWz2Baf5NUs0ku?=
 =?iso-8859-1?Q?6k+iXjDJDDUbe/ZWUJyORctZN/ECtOWW/CBSjzItl9V8PGMfOw4bzC22QP?=
 =?iso-8859-1?Q?6aBnSPckBMylAXmcEJ4Vs8N4djCFAAj4mi4SVzn0VOLfMfEuf37OCI1o+p?=
 =?iso-8859-1?Q?2CcxhgAixxXV6sf4xUsvAGPS0uVLpQsPad04t0mwwsvTlyZJOGEBNzgAKy?=
 =?iso-8859-1?Q?+bCkJPpfjkIdaOrwG0YSEkCjO7AW+94ZwhvC0e8VnOl+miAVof5kN1WcFl?=
 =?iso-8859-1?Q?Rpou05xBzTo2EH8rtBLDHTtcbSRlGwvlhGqGIvkJRcCZzUQnXQgEY8Bzdq?=
 =?iso-8859-1?Q?KOkgntmi0PKFzc+Es4JU7u3B56B0gIzTetwhb4ZVVl9rlo0W0rKuwArBbb?=
 =?iso-8859-1?Q?+0ICGhAgbpPqjUHAED5bIVJrMEv5CYXVcroW0jgUhUSSmmJqBfZ/hH9j1q?=
 =?iso-8859-1?Q?PQ40MevpHCyq0K+yHpuamMtAh4nL35Zdn8Yb2V8gNYjaLxFAsFqUALT7ly?=
 =?iso-8859-1?Q?30/Hq5kuHllPx08EvW7sFGEVoM7Vqizh2sZagTxwUt4Wcjnl9wfWcCCHts?=
 =?iso-8859-1?Q?Pz5QmSKCiLpVI9NZS9VVzFIpJBkZX+Vw8uqo1u+K14EENGv/G7/gSrpt3E?=
 =?iso-8859-1?Q?NFuvSmtbtt9XfEvQKImU2zzL07adeh76qxPV+Dkz920b0s9otQQ45WG5FK?=
 =?iso-8859-1?Q?S8+IBHg0e9kNlwibcr65f1vGZXnj7g5PzOPzMUkOo0RVUByC4lUeXBkUcI?=
 =?iso-8859-1?Q?ONMJwZ5zuRoPlEO1m7oDsbnKHeAACR8jvrBVuFcW/KnYmNSnwC1co62Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862e9cc4-9561-4990-c20f-08daa84f4a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:50.3176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ChvD9ncS7t5VfK6E2svzSxDtxWU7d6voFF6fSLxCIJZwYg1wVjUks+dtXZL0Ulrw+zybJ04N4BEScUmKOmDhoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: E6J9nHyzx4eMTdd_FuS4TnqQ8wPF960w
X-Proofpoint-ORIG-GUID: E6J9nHyzx4eMTdd_FuS4TnqQ8wPF960w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=641 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The context of CPU general purpose and system control registers
has to be saved on suspend and restored on resume. This is
implemented in hyp_suspend and before the return from hyp_resume
function. The hyp_suspend is invoked just before the PSCI system
suspend call is issued to the ATF. The hyp_suspend has to return a
non-zero value so that the calling 'if' statement evaluates to true,
causing the system suspend to be invoked. Upon the resume, context
saved on suspend will be restored, including the link register.
Therefore, after restoring the context the control flow will
return to the address pointed by the saved link register, which
is the place from which the hyp_suspend was called. To ensure
that the calling 'if' statement doesn't again evaluate to true
and initiate system suspend, hyp_resume has to return a zero value
after restoring the context.
Note that the order of saving register context into cpu_context
structure has to match the order of restoring.
Since the suspend/resume is supported only for arm64, we define
a null cpu_context structure so arm32 could compile.

Update: moved hyp_resume to head.S to place it near the rest of the
start code

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/arm64/head.S     | 90 ++++++++++++++++++++++++++++++++++-
 xen/arch/arm/suspend.c        | 25 ++++++++--
 xen/include/asm-arm/suspend.h | 22 +++++++++
 3 files changed, 133 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 82d83214dc..e2c46a864c 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -957,6 +957,53 @@ ENTRY(efi_xen_start)
         b     real_start_efi
 ENDPROC(efi_xen_start)
=20
+/*
+ * void hyp_suspend(struct cpu_context *ptr)
+ *
+ * x0 - pointer to the storage where callee's context will be saved
+ *
+ * CPU context saved here will be restored on resume in hyp_resume functio=
n.
+ * hyp_suspend shall return a non-zero value. Upon restoring context
+ * hyp_resume shall return value zero instead. From C code that invokes
+ * hyp_suspend, the return value is interpreted to determine whether the c=
ontext
+ * is saved (hyp_suspend) or restored (hyp_resume).
+ */
+ENTRY(hyp_suspend)
+        /* Store callee-saved registers */
+        stp     x19, x20, [x0], #16
+        stp     x21, x22, [x0], #16
+        stp     x23, x24, [x0], #16
+        stp     x25, x26, [x0], #16
+        stp     x27, x28, [x0], #16
+        stp     x29, lr, [x0], #16
+
+        /* Store stack-pointer */
+        mov     x2, sp
+        str     x2, [x0], #8
+
+        /* Store system control registers */
+        mrs     x2, VBAR_EL2
+        str     x2, [x0], #8
+        mrs     x2, VTCR_EL2
+        str     x2, [x0], #8
+        mrs     x2, VTTBR_EL2
+        str     x2, [x0], #8
+        mrs     x2, TPIDR_EL2
+        str     x2, [x0], #8
+        mrs     x2, MDCR_EL2
+        str     x2, [x0], #8
+        mrs     x2, HSTR_EL2
+        str     x2, [x0], #8
+        mrs     x2, CPTR_EL2
+        str     x2, [x0], #8
+        mrs     x2, HCR_EL2
+        str     x2, [x0], #8
+
+        /* hyp_suspend must return a non-zero value */
+        mov     x0, #1
+        ret
+
+
 ENTRY(hyp_resume)
         msr   DAIFSet, 0xf           /* Disable all interrupts */
=20
@@ -988,7 +1035,48 @@ mmu_resumed:
         tlbi  alle2
         dsb   sy                     /* Ensure completion of TLB flush */
         isb
-        b .
+
+        /* Now we can access the cpu_context, so restore the context here =
*/
+        ldr     x0, =3Dcpu_context
+
+        /* Restore callee-saved registers */
+        ldp     x19, x20, [x0], #16
+        ldp     x21, x22, [x0], #16
+        ldp     x23, x24, [x0], #16
+        ldp     x25, x26, [x0], #16
+        ldp     x27, x28, [x0], #16
+        ldp     x29, lr, [x0], #16
+
+        /* Restore stack pointer */
+        ldr     x2, [x0], #8
+        mov     sp, x2
+
+        /* Restore system control registers */
+        ldr     x2, [x0], #8
+        msr     VBAR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     VTCR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     VTTBR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     TPIDR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     MDCR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     HSTR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     CPTR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     HCR_EL2, x2
+        isb
+
+        /* Since context is restored return from this function will appear=
 as
+         * return from hyp_suspend. To distinguish a return from hyp_suspe=
nd
+         * which is called upon finalizing the suspend, as opposed to retu=
rn
+         * from this function which executes on resume, we need to return =
zero
+         * value here. */
+        mov x0, #0
+        ret
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index aa5ee4714b..13d1aba658 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -133,6 +133,11 @@ void vcpu_resume(struct vcpu *v)
     clear_bit(_VPF_suspended, &v->pause_flags);
 }
=20
+#ifndef CONFIG_ARM_64
+/* not supported on ARM_32 */
+int32_t hyp_suspend(struct cpu_context *ptr) { return 1; }
+#endif
+
 /* Xen suspend. Note: data is not used (suspend is the suspend to RAM) */
 static long system_suspend(void *data)
 {
@@ -161,9 +166,23 @@ static long system_suspend(void *data)
         goto resume_irqs;
     }
=20
-    status =3D call_psci_system_suspend();
-    if ( status )
-        dprintk(XENLOG_ERR, "PSCI system suspend failed, err=3D%d\n", stat=
us);
+    if ( hyp_suspend(&cpu_context) )
+    {
+        status =3D call_psci_system_suspend();
+        /*
+         * If suspend is finalized properly by above system suspend PSCI c=
all,
+         * the code below in this 'if' branch will never execute. Executio=
n
+         * will continue from hyp_resume which is the hypervisor's resume =
point.
+         * In hyp_resume CPU context will be restored and since link-regis=
ter is
+         * restored as well, it will appear to return from hyp_suspend. Th=
e
+         * difference in returning from hyp_suspend on system suspend vers=
us
+         * resume is in function's return value: on suspend, the return va=
lue is
+         * a non-zero value, on resume it is zero. That is why the control=
 flow
+         * will not re-enter this 'if' branch on resume.
+         */
+        if ( status )
+            dprintk(XENLOG_ERR, "PSCI system suspend failed, err=3D%d\n", =
status);
+    }
=20
     system_state =3D SYS_STATE_resume;
=20
diff --git a/xen/include/asm-arm/suspend.h b/xen/include/asm-arm/suspend.h
index 29420e27fa..70dbf4e208 100644
--- a/xen/include/asm-arm/suspend.h
+++ b/xen/include/asm-arm/suspend.h
@@ -1,9 +1,31 @@
 #ifndef __ASM_ARM_SUSPEND_H__
 #define __ASM_ARM_SUSPEND_H__
=20
+#ifdef CONFIG_ARM_64
+struct cpu_context {
+    uint64_t callee_regs[12];
+    uint64_t sp;
+    uint64_t vbar_el2;
+    uint64_t vtcr_el2;
+    uint64_t vttbr_el2;
+    uint64_t tpidr_el2;
+    uint64_t mdcr_el2;
+    uint64_t hstr_el2;
+    uint64_t cptr_el2;
+    uint64_t hcr_el2;
+} __aligned(16);
+#else
+struct cpu_context {
+    uint8_t pad;
+};
+#endif
+
+extern struct cpu_context cpu_context;
+
 int32_t domain_suspend(register_t epoint, register_t cid);
 void vcpu_resume(struct vcpu *v);
 void hyp_resume(void);
+int32_t hyp_suspend(struct cpu_context *ptr);
=20
 #endif
=20
--=20
2.37.1

