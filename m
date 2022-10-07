Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F885F76EA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417688.662462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfF-0006vi-Mi; Fri, 07 Oct 2022 10:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417688.662462; Fri, 07 Oct 2022 10:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfF-0006cb-4t; Fri, 07 Oct 2022 10:33:09 +0000
Received: by outflank-mailman (input) for mailman id 417688;
 Fri, 07 Oct 2022 10:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf8-0004P4-HE
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:02 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a2595cc-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:33:00 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2977q6Qa027397;
 Fri, 7 Oct 2022 10:32:57 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k208bupyb-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:57 +0000
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
X-Inumbo-ID: 6a2595cc-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dR0/TwJm+ndEpUka78218ts99GPs90BfwY3cSG1mIwqscDCXnhjqCvJDJ13aJJt2zn82vLRlQ+A7LKtsChlgAvrjIbprgRFUu/wG5zRzqi/K9H5cRcpwOczVTbHUlYyeRLW9+aZX5VP7JusYCB4KyG9yw77p5ZTytDMeU7OBpDVyD8fFfbuU9SNmh/YWPu84JFBSghsSiRR4RTqiE6uF/nfWJaaYARoyZ+1W50T+fFotHE3Ljj321d3ApeSJu746WktCi1K275R5H+FtKaU6/5Z67y+zlcSs8dyU+wNnU//EV4F7ePPNxcilA5fxN9lMynRwFn95Pj/6ZrS3a6F+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUPyVMiYcwnXeZDY3vZWTB0lut8ZUfKfufVeIsYI6/w=;
 b=dlibaf9YhA7eE1ZB9oSwTdZPxhytviaMFRPhQp7W0o2jHultqOnbiMi0T7ZeIiBSJ5zSJS+pr1RZJ3pQJ9bex95/+5rt4qaEt4OgS92kvg07a40i19sb4cIhEya7+Kis+7owS5T0ZMNdUfGMS9vVjgKw9sBuHlopB6ttakYIKFbrMCe83PCit5P4uxLi0AR0AO1illfJR3UlqeVQYSHHfF0GpDRTHOOggsmxfHyb/jZ8Td9WHDVpiXn/7umlF4seie/KpDGhuYfJcULX+WNEd2YqJCLOuJTlNBov+EiIzkl1W9hb4aSEUi83+g/+1GuuWehKZfF3W7Z7jd9QdFPZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUPyVMiYcwnXeZDY3vZWTB0lut8ZUfKfufVeIsYI6/w=;
 b=Fn0iDdX2TikXB3AyAi+pOR0+uLFccRM/CeJ9RnPNdxwHwICXrWMCE7pRhrM8+3bggmpQwHtkwRRDm3pGYh5Po0+vNBZe/61biYonN6Oqp/4JMQNwnIBYeoAWWbLaL//IHK6u8/HSOIS4ktJuZU6d/i2LsYCUkkocjgGv51Yrhv+hortWzI7DhQiHB7R3Ad+FKAr4Rf9KDGGOKgly33CRiex/L9g0ryW9J8u3XBgAMSvL41Md50B6ipus8hJbr2nj/Mp6Z+hAAlDu3yfm6urx7aiREWgfP+q1ctz3MPawpyrkP145TprDU+EDCS5UUzwLKLRROJha0eVdOs/PKi6XkA==
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
Subject: [PATCH 13/19] xen/arm: Resume memory management on Xen resume
Thread-Topic: [PATCH 13/19] xen/arm: Resume memory management on Xen resume
Thread-Index: AQHY2jgm3Yyy/xebRkCIsLQOXCUKiw==
Date: Fri, 7 Oct 2022 10:32:50 +0000
Message-ID: 
 <c4716207f7f269b8adf7ed1b1928558cfc1d3bc8.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: 122b4de9-69b9-4d93-3cf9-08daa84f4a41
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WzColpCRZPKvEoVnX4wlJHpV8gVO/0wzHsWCJkXRkeW2I93xyhNNpB4pof3E737pFY51B3aX7h4T2WSQ7xVMqMCB9pv65AmhYt1OgwYjpXymwi030z0pE7k/XMm0blZGO4e4x921vE2wrsWDusf/K3I+L+XYIwnERJZqKNIrEZ/N7adubURg1JESZQPPXUXz01XlMRvFzowkv8Q1uy8p3FNQ3KUBKa/04/B2BX6f+SLYZ8ZkFWElNDg6mNQoThmFd1p90vg9wBfLQn6KanB4JPLKxPN+lckk2mz9sWSA3bpJUuRgFpAYRSmnqzaVSmrsikrhlQU+Ak6Knsewo4LFNHiVUZRISyiV1W4dYhiF/4hAfJWJtUwUapfT3G2HZcUUm38zCC7M97/6xQWSyC/5s3N5N/7GCZgR6QKQHaRA+EozIqI44vGnNBSMK1ZjjU1QAWZstVk0aASptnqRJ/SQVPuEp10eFOhV0fNyPsgxzEpj1kFq8kKBSS8HLlAZyebwghgn5DEvXwuj+Vlew/hxOfyL+Fijxtg6Sbp3njuH7wL/6uJ0y+kAUAzzgcpZWj4NLVtqceK/O/90tQAoSMAJtC3hb240UHyxJ6SYu8pCNnjuCNvqFp/mtkH8LRmWm080U6e1SOpJ0PI8V96p3Fza6wnzJEKV8lHbPztJ3M4NxphfqKniDy0980J87/Km/IZuDmOhufnlhcsP6YvaNwZPd0nK2FQ70G3n0SSGxaIIKUq8i8JCrDPecSjR8/k2npSnLzdwKitHJITkD9h2inkcjA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(107886003)(38100700002)(38070700005)(122000001)(41300700001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Zjm/umPBq/YGOwxrp/GQ++meLKXym0CwDbwjsmcHeLLQizDXkC7pMTD6/X?=
 =?iso-8859-1?Q?0fPWwMgyW3ynRqnwP/ElHry3Wv2zqSomxFRJIhbsCqcdeX9j2d/n9U+WND?=
 =?iso-8859-1?Q?LbOuOX4UiBMy03Us1rZup8KnNhPadCU8JCcGKtnYT1GCi/PB/1bWGJKOg/?=
 =?iso-8859-1?Q?YFl+UPDgqpwckeNpTPy7Zd6lfWzenDY+NvcXrRP94HVLndLqJneR+ZeESC?=
 =?iso-8859-1?Q?bd4DUjCGhfWgBxi6MgxJh7gq73QZts/H8NUY6KAQ137XHhtu9ESFdBhUHr?=
 =?iso-8859-1?Q?8U5Fviq5m+wCVuy5nm3DOk9rqaF9mqnn2JnefMxMc8JmzpXc91j7vd6K+l?=
 =?iso-8859-1?Q?LhbIb+8vItbb3ZvVnb0EoHZq4rfOQ/uy3D3jVGqihxQRpL4xcFP+YwhUxR?=
 =?iso-8859-1?Q?TrFg19alzPKvmrbznMBRTgKY6RuiuOgmA/5q4OAoGH5IO9tS5B6EZh1kZ/?=
 =?iso-8859-1?Q?Extv/0XQDs9nA0Zd/dQet3mD+fmZjQXQoLQxbj0Dk9mbJbPe8buqDa8NFa?=
 =?iso-8859-1?Q?aoTc+chtLUdJyV+EsMnan5KwrN6zhOsHGAli+OgSuLrPB9uLj2gFv0M9v6?=
 =?iso-8859-1?Q?stdHvbrrVVk5AU3hFZ47GSw4VYLAOECWJxccc5+hBpjFGbC67rfnqqw582?=
 =?iso-8859-1?Q?biZOI9/zwj5hCCqXxCWvtyeTqAccDei8GjilwPm+5GygZOoxHy7dQeWtEv?=
 =?iso-8859-1?Q?ioJNoBiV9cwyquQbnf7FKpprd0KabNSkITKbug40+Gt3dPltANLHxxXfV1?=
 =?iso-8859-1?Q?59LWqOgkgNBDZA/mFphhz/ZUM5RL6uTCQaEQdw+/HXig5yPtO/wO1fMS/A?=
 =?iso-8859-1?Q?6gAHbDQPu94f0/EXHnT3gOUw55zHeKWyWkTarczp7lPA+AaadzVqbaIwV8?=
 =?iso-8859-1?Q?8D44BV1Y8InDYQfoDbrXMh40jCWOCbkmt7iwX9TEdx//xqiamkshYisF8i?=
 =?iso-8859-1?Q?vpKeMMw7uAAg5Ugs9baR2c2BmDYpDcj1YjUfWVUHdEXzPI0hvqoMNDa6ll?=
 =?iso-8859-1?Q?Uwx+WCfxRffCKlrUPLSVCyBYMekJDA066XGBlwDK1ckPsEUd81qZstYCZs?=
 =?iso-8859-1?Q?sD0RZ0vwI2f1KRHMI8Z6/rbfEIZk1w+ErjgXsxF9qzJ6cHH8EVjepyG/JK?=
 =?iso-8859-1?Q?0QjO3tgSIAr1wQd/yySZxhFCjBHe9PaWHJmM/leHSTiBKR9jnTPqvkGRPr?=
 =?iso-8859-1?Q?JqOKYoAmd2upkBtjl5drxiALu9rBtOt8eI5b7sBts8qpwdYN4zv2WdjLCV?=
 =?iso-8859-1?Q?fZFZFNM7R52uYPbQrRIqc2Md1WTPycn6QJBy/W6dMXdWdInt3HJoOXDGcZ?=
 =?iso-8859-1?Q?zYHNO74TblmPHnDn8KMWK15O6VekQS18JG3omkXC9NrkZzIEbvGb5MxCa6?=
 =?iso-8859-1?Q?15WPxM0W7sehpiAaJ19NogruGQKUG/1BmETGrBFTrWg58GgNXpGwkK4O2y?=
 =?iso-8859-1?Q?3uXSV73npl6L7XFAKinH5ZJIlBthg6TYVFE1lSJoOO8vJK6BgSBIs36hO4?=
 =?iso-8859-1?Q?DWm6LEGn3YWNOhZUfWKYptIVLXyQ6iOLXXMtAsJDZ6ZXF96p/AP6TSwZpg?=
 =?iso-8859-1?Q?ObQ9z+DA+kHBP52LcRrTp5G9Tv7kaG57dLkdBCw/rjxj9A89aataWSSX6g?=
 =?iso-8859-1?Q?wJp8tHay2MmOfhl8J7N2CNQUqUQya/K2JVzwrrQo1I4nvhxctp7j8IYw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122b4de9-69b9-4d93-3cf9-08daa84f4a41
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:50.0677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xYET/DSI/I6FVFtIM4AMvDy5Cd8hfmgqwNOJT8mCKQ/2M4x/8coZWwlX4bY0tODD7hYqGlbqVg7UASd2JwaJrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: 5tysNXNLOO9dVVVqJ4irDYcKjt4IIYyE
X-Proofpoint-ORIG-GUID: 5tysNXNLOO9dVVVqJ4irDYcKjt4IIYyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=418 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The MMU needs to be enabled in the resume flow before the context
can be restored (we need to be able to access the context data by
virtual address in order to restore it). The configuration of system
registers prior to branching to the routine that sets up the page
tables is copied from xen/arch/arm/arm64/head.S.
After the MMU is enabled, the content of TTBR0_EL2 is changed to
point to init_ttbr (page tables used at runtime).

At boot the init_ttbr variable is updated when a secondary CPU is
hotplugged. In the scenario where there is only one physical CPU in
the system, the init_ttbr would not be initialized for the use in
resume flow. To get the variable initialized in all scenarios in this
patch we add that the boot CPU updates init_ttbr after it sets the
page tables for runtime.

After the memory management is resumed, the SCTLR_WXN in SCTLR_EL2
has to be set in order to configure that a mapping cannot be both
writable and executable (this was configured prior to suspend).
This is done using an existing function (mmu_init_secondary_cpu).

Update: moved hyp_resume to head.S to place it near the rest of the
start code

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/arm64/entry.S      |  2 ++
 xen/arch/arm/arm64/head.S       | 30 ++++++++++++++++++++++++++++++
 xen/arch/arm/mm.c               |  1 +
 xen/arch/arm/suspend.c          |  6 ++++++
 xen/include/asm-arm/processor.h | 22 ++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index fc3811ad0a..f49f1daf46 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -1,4 +1,6 @@
 #include <asm/current.h>
+#include <asm/macros.h>
+#include <asm/page.h>
 #include <asm/regs.h>
 #include <asm/alternative.h>
 #include <asm/smccc.h>
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 8857955699..82d83214dc 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -958,6 +958,36 @@ ENTRY(efi_xen_start)
 ENDPROC(efi_xen_start)
=20
 ENTRY(hyp_resume)
+        msr   DAIFSet, 0xf           /* Disable all interrupts */
+
+        tlbi  alle2
+        dsb   sy                     /* Ensure completion of TLB flush */
+        isb
+
+        ldr   x0, =3Dstart
+        adr   x19, start             /* x19 :=3D paddr (start) */
+        sub   x20, x19, x0           /* x20 :=3D phys-offset */
+
+        mov   x22, #0                /* x22 :=3D is_secondary_cpu */
+
+        bl    check_cpu_mode
+        bl    cpu_init
+        bl    create_page_tables
+        bl    enable_mmu
+
+        ldr   x0, =3Dmmu_resumed      /* Explicit vaddr, not RIP-relative =
*/
+        br    x0                    /* Get a proper vaddr into PC */
+
+mmu_resumed:
+        ldr   x4, =3Dinit_ttbr         /* VA of TTBR0_EL2 stashed by CPU 0=
 */
+        ldr   x4, [x4]               /* Actual value */
+        dsb   sy
+        msr   TTBR0_EL2, x4
+        dsb   sy
+        isb
+        tlbi  alle2
+        dsb   sy                     /* Ensure completion of TLB flush */
+        isb
         b .
=20
 /*
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index eea926d823..29cdaff3bf 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -708,6 +708,7 @@ void __init setup_pagetables(unsigned long boot_phys_of=
fset)
     switch_ttbr(ttbr);
=20
     xen_pt_enforce_wnx();
+    init_secondary_pagetables(0);
=20
 #ifdef CONFIG_ARM_32
     per_cpu(xen_pgtable, 0) =3D cpu0_pgtable;
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index a0258befc9..aa5ee4714b 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -167,6 +167,12 @@ static long system_suspend(void *data)
=20
     system_state =3D SYS_STATE_resume;
=20
+    /*
+     * SCTLR_WXN needs to be set to configure that a mapping cannot be bot=
h
+     * writable and executable. This is done by mmu_init_secondary_cpu.
+     */
+    mmu_init_secondary_cpu();
+
     gic_resume();
=20
 resume_irqs:
diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processo=
r.h
index 8ab2940f68..ecf97f1ab4 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -133,6 +133,28 @@
 #define TTBCR_PD1       (_AC(1,U)<<5)
=20
 /* SCTLR System Control Register. */
+/* HSCTLR is a subset of this. */
+#define SCTLR_TE        (_AC(1,U)<<30)
+#define SCTLR_AFE       (_AC(1,U)<<29)
+#define SCTLR_TRE       (_AC(1,U)<<28)
+#define SCTLR_NMFI      (_AC(1,U)<<27)
+#define SCTLR_EE        (_AC(1,U)<<25)
+#define SCTLR_VE        (_AC(1,U)<<24)
+#define SCTLR_U         (_AC(1,U)<<22)
+#define SCTLR_FI        (_AC(1,U)<<21)
+#define SCTLR_WXN       (_AC(1,U)<<19)
+#define SCTLR_HA        (_AC(1,U)<<17)
+#define SCTLR_RR        (_AC(1,U)<<14)
+#define SCTLR_V         (_AC(1,U)<<13)
+#define SCTLR_I         (_AC(1,U)<<12)
+#define SCTLR_Z         (_AC(1,U)<<11)
+#define SCTLR_SW        (_AC(1,U)<<10)
+#define SCTLR_B         (_AC(1,U)<<7)
+#define SCTLR_C         (_AC(1,U)<<2)
+#define SCTLR_A         (_AC(1,U)<<1)
+#define SCTLR_M         (_AC(1,U)<<0)
+
+#define HSCTLR_BASE     _AC(0x30c51878,U)
=20
 /* Bits specific to SCTLR_EL1 for Arm32 */
=20
--=20
2.37.1

