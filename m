Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F2A4AE045
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268499.462419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmz-0008IF-Ku; Tue, 08 Feb 2022 18:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268499.462419; Tue, 08 Feb 2022 18:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmz-00089X-7r; Tue, 08 Feb 2022 18:00:29 +0000
Received: by outflank-mailman (input) for mailman id 268499;
 Tue, 08 Feb 2022 18:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUmw-00068L-7U
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:26 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fce3a86e-8908-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:00:24 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EgrTD015757;
 Tue, 8 Feb 2022 18:00:21 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3t5xrs6q-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:21 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5613.eurprd03.prod.outlook.com (2603:10a6:803:12a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:14 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:14 +0000
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
X-Inumbo-ID: fce3a86e-8908-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYO9MKfe3IgWmXp7lo+Bl4ljmMGi1ae0L+UWUR0qgoRpJaNT7rSRNjgXUvM+ryHMd0aUQ5tSg8M+jTHvnwuWWIdO2It7fMXrYmRMIp60U2nJlHsiruGdC70p2Z8E2WvYgA6iRhpk+gzdPuZsLvFZZTtF8nUiSn4cE54I5NCgH5VwzrmBCvca65BsMp+SuU5/j6Au3YrRv0JfynDFvxk/eh/WjsJ2dG/QvyLZIjsqG3YORnYoxNxDQUAFYEJ/t4R7Vu2RCqMdFNwBoRkmF9EyGRL/3/bItFEGhWiAL/zyWdbIG358Jp9ZozEeg/NuwdGVlse5suyRG581NEIC/f7t5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jayupWuWbjhOz7yWgZER6E30JTnHsZKWIQYO2oKaWWE=;
 b=bH+qApmhRzaaPMNJqomFxCloTOyKpsTwMCjgekox1CZpv83ogBXgTHBDGWtb0Ld1zZDCaTPZ4AbKW6C87DBxvi9bI84IiwzgZ53o5mit3cjQjYrm7LjQCiQ4Ogg1bp8ZqJi4PMgnEYcOErksjNFQ54I0i1vXbUS07dyxD7bfQBqs7kwOVzKLEj3V6qZq6aWjmBhmiA7YeMe8vkBXb4M4C8wleEWSUR5bi+qQMTHpfT1BZv8ek9fxIsBAWmU6gnwyNYEY50fTOJHS/Shg+Gh0tddW9rClAfJdIeCj1yOuDb5vz18xVIhNrHqXbFvuhrc9bCfBQs4UhBFTBxmPDb25pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jayupWuWbjhOz7yWgZER6E30JTnHsZKWIQYO2oKaWWE=;
 b=SQ1KDkkWJX3kuq861ElC+WSGwMK7a6K9OsAr9YIq2ojajYWjVRCCD6OTyt4zpGrBGV3pV1Un14Ui5RS6coscRW4zBBjBABw9ddEE/KDqvnt2l/xOOn8/8gpYAELttIHcDzzN03wRGYZ0pGNK6awLhz9BTgYAfRWA1FvUTlyRZBAbKkUOQ87Nf03QPBgipuokh+EmDJ27TKfnmAOLQEgMRsTAM5mp+VyhmGXixwyCJIXhN31Vk+Buke8qCkrNaf/jykHKkubicVgppXgivFKrBDyoZxuZTu5XIm84x3tss9LPewENFhkJT6e7y6/Ki6OQWsgo+fDbcfHAe1pqsOIveA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Wei Liu <wl@xen.org>,
        Juergen Gross <jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC v2 8/8] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v2 8/8] xen/arm: add SCI mediator support for DomUs
Thread-Index: AQHYHRW5DNy0UeL9wEisMLPQvzYWsg==
Date: Tue, 8 Feb 2022 18:00:14 +0000
Message-ID: 
 <8aaab52f54841ebcf31a8f5fc6f1f8fd0b778e49.1644341635.git.oleksii_moisieiev@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d8aa3d6-94a8-4c12-78de-08d9eb2cdbd2
x-ms-traffictypediagnostic: VE1PR03MB5613:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB561361DA9A2BF06711B1E0FDE32D9@VE1PR03MB5613.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:538;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rqxqne92tNVg0gXi1RQ1NO7eQOSv0cZvEyQLrHBW9kvSdYIC9sC5usBbMqoaUOMHYXnIChGrP+Z/YOGYqZSnIJTvlhoqtlp8r5QM+af1SG63r5aiCo1xGMTWOmreJsUj/+a/6RaEw8OCAqfhRCNRv2OQSdhrLux3S0K9365kjWktmT8ZbrVLNTfwnU3XGajHMFUV1BEID+Y2pxTRgl9OAmuGOHuBgJqhAJRqogQ7I2gHAmA3ptmhAD+5CgvGh88GWFno+tE7YlImDxEWah1hV0w0Omj3DaDC00JYTYpkDqn6HhzrvokzfwL2t8zrml7yy2DQXGwM3LwxNGe96NIntdifnsdDCCzJ4BERLjjouamm2idzO42yRcx90SPMETs9zFrhGBtMTQKtgoPyMVpCccYuBHPlJxg9ELJqsRcEGsHLG6K25aHXp9BOWDg5QuRzur+E5N5WA329PEpkWwJSo1ZoUJ3xY/uoC4MpCm+oeQDzbuPG3QzDOK0y3s3gdelU8V5tv7gDlptP39BQ4Rz57oQ+Kghg0j6K3q/z3y/5uQ5XPaEkSXz+HxoQz5yjONOt94jkZ3ajIcPAMn4EXfLVjMoSpX6+Sm3xfZRYlhT5QvpLa0Ha8Ag2wf84dDytbT+2DcdENjeTG5I1LZs7V54DDfN6zwY6N5Nq2kOO7cPtWY5kKUjyRZd2iwl5Paj38QmEVzgFliEhzHMHc9poEKV8/Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66476007)(64756008)(86362001)(66556008)(316002)(122000001)(6916009)(6506007)(2616005)(5660300002)(6512007)(7416002)(4326008)(83380400001)(54906003)(30864003)(2906002)(26005)(186003)(8676002)(76116006)(38100700002)(66446008)(66946007)(8936002)(36756003)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Bb/o0zHOWJ4lAaakLRPPxROrgldRXBN4eTiPjo7EFECHkHlUv7I2bquMf4?=
 =?iso-8859-1?Q?RHIj+oA3bvv7OVD6Z/eKzuHwTdmaOaLGdT+G8moFqV/zHH5SbSMr3oEoGP?=
 =?iso-8859-1?Q?a0qoq+kRYbA+mETGE/MScrGaX3V/KPraHR0cetjYVUQv8t/llDXuUs4hGw?=
 =?iso-8859-1?Q?JQR4J+ybvPDB/ayJkcONjs1sRRerHcxcdHCWoDrdufIAN5gdoqnovhhMFS?=
 =?iso-8859-1?Q?xiIAJ8NBu5U9p+zV3CDH9WZwSkt8uaoyNALUsgVTJ9kafXiSEoIveQV6EQ?=
 =?iso-8859-1?Q?5S3h7UvVC9UsUw1hYOtr71nLQbd1Ri1ZoIXiuxZujZvBDnBTy+z8mtrx7g?=
 =?iso-8859-1?Q?Vtbnqjvj8V2tZ3KWFpH56xuqxvyPqoK7YZQhCAv4uGLhjNWXebO16pEquZ?=
 =?iso-8859-1?Q?a/zhfOpYY5hFC3IQsQd2sYoYyiQ2XGSSMBtqRqUL4FTQ4XQy5yhRVZcWbV?=
 =?iso-8859-1?Q?lrGcaCagkE5GK7R+pDC7LuED6OSXde0xpVAfdKParxIgytJsXpTeL1SQgU?=
 =?iso-8859-1?Q?c67E+MDAPJRol0v2KU2bsH7vt6pjieS/XXVpvOSY2plf+yRi3H1wd983YB?=
 =?iso-8859-1?Q?IR1uAxAnIv/hN/AnIdIn1BauRERwnQYSuLCJU45+/ZYB2jvnca5XB4m7o4?=
 =?iso-8859-1?Q?jfRBTwt/98C14/u0tVZp3nH11fnqdCUZCrHWCfohvPD5NJ9JqDIF535T79?=
 =?iso-8859-1?Q?ycsAdV38Zu2NfmKxTCCWiT7q/EAQU7FeM2QR+QlBebNhdboXObypNi8X7L?=
 =?iso-8859-1?Q?d/GoLGXpgT5mdYxFjaQWRWW5WpnQgeHDmZWWooBZunk+beXWoXoSgoZ4qg?=
 =?iso-8859-1?Q?kwj8U4VKIbA45w5HDU67/v0utBaekfV4W5MkJqik8d7xXMpxw/a9WDxGPR?=
 =?iso-8859-1?Q?fwvt1cM2ETs7GuFIO0A+qyQQ+wdnzSNUtkQpXYY49ji6C9CGxPthTBXb3t?=
 =?iso-8859-1?Q?TEnu7UpMygcbyuXJWGdu9dJL5NZBXWZF5uXcpIJkrTSmnNyWWLFH0u/hBt?=
 =?iso-8859-1?Q?xFg2PFIAM0ftVJSpc2kfbv/y3K2jYZMZJRJitn7FDF8GOD2dWsVm0o9ovJ?=
 =?iso-8859-1?Q?7zUHjcMFbSf2Gc5pl+t+1dShYxUia4Ja84r3LlUljHx7LzAa1E2AiUEKxW?=
 =?iso-8859-1?Q?yfVtLj1etsCcD2YhVEuecIaRt0+Ao3aGt49APiSOyYCh8K5EIKJ+h8KO8y?=
 =?iso-8859-1?Q?tbq3TWy15iKGSO/Swt+z7D0U/ON5t5eCJYHDFkFi4X8BgcIhnYYJXgFNud?=
 =?iso-8859-1?Q?Wq1vnN9mdhdxFAXshIsZ0L7nrlpbiKn+x2iOnf3GgH3QMbdNdvANQtgnKl?=
 =?iso-8859-1?Q?+2BZMhiTiWNHfOcL1lod4Gcey1TUEt8EE41g2ORe+SQCEhB3ywL9+ml61Y?=
 =?iso-8859-1?Q?mfh3O5im86xH+J2DdyXgTMebsxlEyiNDuJYu+64iY9jr6CXVRnHoGeb+KF?=
 =?iso-8859-1?Q?GDdjBJiFSQJkmuxRnnCaWFEtykHY9Cyn2fbXtvih54jJ4wVWHuiELNIDfT?=
 =?iso-8859-1?Q?Yrw+4Jlik2wwZsEWR+13TZysjbbuiqSu+A5n4hTDqZtZdlyG+65WrpEEvR?=
 =?iso-8859-1?Q?GNr+71Rvlvi5m5WWXtDlKZydZip+goQB0EnMGm639cGxRoQJJjqzI0Eexc?=
 =?iso-8859-1?Q?G3yUkVJerzh5Q1m9UXC48/tuOKRq4uKCRMx89J5W95bx/DHy/coIGQ40+l?=
 =?iso-8859-1?Q?PZMnFGc3MEfInrpdP6FtmKRPkwS1wIyy62IGwJTP+KqhOSTm6SQ3vN7VvH?=
 =?iso-8859-1?Q?uLFoSlulh/JzWYEgreF8caZ5k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8aa3d6-94a8-4c12-78de-08d9eb2cdbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:14.7791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +r2E2QNZzlRK0MqL9DH03hTokkOFLMJtHCnQo2oVW6lsQyVQyOFTMrOHzsqjPm2whFJIbDef/fL2Md+FQIPYWX4VR8MFAYVVVaFZkR3WVyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5613
X-Proofpoint-GUID: rMgEuywUpIi_Qn8ShMUDtOToY64rSaIr
X-Proofpoint-ORIG-GUID: rMgEuywUpIi_Qn8ShMUDtOToY64rSaIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080106

Integration of the SCMI mediator with xen libs:
- add hypercalls to aquire SCI channel and set device permissions
for DomUs;
- add SCMI_SMC nodes to DomUs device-tree based on partial device-tree;
- SCI requests redirection from DomUs to Firmware.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 tools/include/xenctrl.h               |   3 +
 tools/libs/light/libxl_arm.c          | 214 ++++++++++++++++++++++++--
 tools/libs/light/libxl_create.c       |  44 +++++-
 tools/libs/light/libxl_internal.h     |   3 +
 xen/arch/arm/domctl.c                 |   7 +
 xen/include/public/device_tree_defs.h |   1 +
 6 files changed, 260 insertions(+), 12 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 07b96e6671..cdd14f465f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1238,6 +1238,9 @@ int xc_domain_getvnuma(xc_interface *xch,
 int xc_domain_soft_reset(xc_interface *xch,
                          uint32_t domid);
=20
+int xc_domain_add_sci_device(xc_interface *xch,
+                              uint32_t domid, char *path);
+
 #if defined(__i386__) || defined(__x86_64__)
 /*
  * PC BIOS standard E820 types and structure.
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index c5090e2b32..106ff33c84 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -7,6 +7,12 @@
 #include <libfdt.h>
 #include <assert.h>
 #include <xen/device_tree_defs.h>
+#include <xenhypfs.h>
+
+#define SCMI_NODE_PATH         "/firmware/scmi"
+#define SCMI_NODE_COMPATIBLE   "arm,scmi-smc"
+#define SCMI_SHMEM_COMPATIBLE  "arm,scmi-shmem"
+#define HYPFS_DEVICETREE_PATH  "/devicetree"
=20
 static const char *gicv_to_string(libxl_gic_version gic_version)
 {
@@ -101,6 +107,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
=20
+    switch (d_config->b_info.arm_sci) {
+    case LIBXL_ARM_SCI_TYPE_NONE:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+        break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+        break;
+    default:
+        LOG(ERROR, "Unknown ARM_SCI type %d",
+            d_config->b_info.arm_sci);
+        return ERROR_FAIL;
+    }
+
     if (libxl_defbool_val(d_config->b_info.force_assign_without_iommu))
         config->iommu_opts |=3D XEN_DOMCTL_IOMMU_force_iommu;
=20
@@ -125,6 +144,7 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
     }
=20
     state->clock_frequency =3D config->arch.clock_frequency;
+    state->arm_sci_agent_paddr =3D config->arch.arm_sci_agent_paddr;
=20
     return 0;
 }
@@ -505,9 +525,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
     int res;
     LOG(DEBUG, "Creating OP-TEE node in dtb");
=20
-    res =3D fdt_begin_node(fdt, "firmware");
-    if (res) return res;
-
     res =3D fdt_begin_node(fdt, "optee");
     if (res) return res;
=20
@@ -520,9 +537,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
-    res =3D fdt_end_node(fdt);
-    if (res) return res;
-
     return 0;
 }
=20
@@ -905,10 +919,9 @@ static int copy_node(libxl__gc *gc, void *fdt, void *p=
fdt,
     return 0;
 }
=20
-static int copy_node_by_path(libxl__gc *gc, const char *path,
-                             void *fdt, void *pfdt)
+static int get_path_nodeoff(const char *path, void *pfdt)
 {
-    int nodeoff, r;
+    int nodeoff;
     const char *name =3D strrchr(path, '/');
=20
     if (!name)
@@ -928,12 +941,189 @@ static int copy_node_by_path(libxl__gc *gc, const ch=
ar *path,
     if (strcmp(fdt_get_name(pfdt, nodeoff, NULL), name))
         return -FDT_ERR_NOTFOUND;
=20
+    return nodeoff;
+}
+
+static int copy_node_by_path(libxl__gc *gc, const char *path,
+                             void *fdt, void *pfdt)
+{
+    int nodeoff, r;
+
+    nodeoff =3D get_path_nodeoff(path, pfdt);
+    if (nodeoff < 0)
+        return nodeoff;
+
     r =3D copy_node(gc, fdt, pfdt, nodeoff, 0);
     if (r) return r;
=20
     return 0;
 }
=20
+static int make_scmi_shmem_node(libxl__gc *gc, void *fdt, void *pfdt)
+{
+    int res;
+    char buf[64];
+
+#ifdef CONFIG_ARM_32
+    snprintf(buf, sizeof(buf), "scp-shmem@%lx",
+             GUEST_SCI_SHMEM_BASE);
+#else
+    snprintf(buf, sizeof(buf), "scp-shmem@%llx",
+             GUEST_SCI_SHMEM_BASE);
+#endif
+
+    res =3D fdt_begin_node(fdt, buf);
+    if (res) return res;
+
+    res =3D fdt_property_compat(gc, fdt, 1, SCMI_SHMEM_COMPATIBLE);
+    if (res) return res;
+
+    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                    GUEST_ROOT_SIZE_CELLS, 1,
+                    GUEST_SCI_SHMEM_BASE, GUEST_SCI_SHMEM_SIZE);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_SCMI);
+    if (res) return res;
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
+static int create_hypfs_property(struct xenhypfs_handle *hdl, void *fdt,
+                                 char *path, char *name)
+{
+    char *p, *result;
+    int ret =3D 0;
+    struct xenhypfs_dirent *ent;
+
+    if (strcmp(name, "shmem") =3D=3D 0)
+        return fdt_property_cell(fdt, name, GUEST_PHANDLE_SCMI);
+
+    ret =3D asprintf(&p, "%s%s", HYPFS_DEVICETREE_PATH, path);
+    result =3D xenhypfs_read_raw(hdl, p, &ent);
+    free(p);
+    if (!result)
+        return -EINVAL;
+
+    ret =3D fdt_property(fdt, name, result, ent->size);
+    free(result);
+    free(ent);
+
+    return ret;
+}
+static int create_hypfs_subnode(struct xenhypfs_handle *hdl, void *fdt,
+                                const char *path, const char *name)
+{
+    struct xenhypfs_dirent *ent;
+    unsigned int n, i;
+    char *p, *p_sub;
+    int res =3D 0;
+
+    res =3D asprintf(&p, "%s%s", HYPFS_DEVICETREE_PATH, path);
+    if (res < 0)
+        return -ENOMEM;
+
+    ent =3D xenhypfs_readdir(hdl, p, &n);
+    free(p);
+    if (!ent)
+        return -EINVAL;
+
+    res =3D fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    for (i =3D 0; i < n; i++) {
+        res =3D asprintf(&p_sub,"%s/%s", path, ent[i].name);
+        if (res < 0)
+            break;
+
+        if (ent[i].type =3D=3D xenhypfs_type_dir)
+             res =3D create_hypfs_subnode(hdl, fdt, p_sub, ent[i].name);
+        else
+             res =3D create_hypfs_property(hdl, fdt, p_sub, ent[i].name);
+
+        free(p_sub);
+        if (res)
+            break;
+    }
+
+    res =3D fdt_end_node(fdt);
+    free(ent);
+    return res;
+}
+
+static int create_scmi_from_hypfs(void *fdt, const char *path)
+{
+    struct xenhypfs_handle *hdl;
+    int res;
+    hdl =3D xenhypfs_open(NULL, 0);
+    if (!hdl)
+        return -EINVAL;
+
+    res =3D create_hypfs_subnode(hdl, fdt, path, "scmi");
+    xenhypfs_close(hdl);
+
+    return res;
+}
+
+static int set_shmem_phandle(void *fdt, const char *scmi_node_copmat)
+{
+    uint32_t val;
+    int nodeoff =3D fdt_node_offset_by_compatible(fdt, 0, scmi_node_copmat=
);
+    if (nodeoff < 0)
+        return -EINVAL;
+
+    val =3D cpu_to_fdt32(GUEST_PHANDLE_SCMI);
+    return fdt_setprop_inplace(fdt, nodeoff, "shmem", &val, sizeof(val));
+}
+
+static int make_scmi_node(libxl__gc *gc, void *fdt, void *pfdt)
+{
+    int res =3D 0;
+    int nodeoff =3D
+        fdt_node_offset_by_compatible(pfdt, 0, SCMI_NODE_COMPATIBLE);
+    if (nodeoff > 0) {
+        res =3D copy_node(gc, fdt, pfdt, nodeoff, 0);
+        if (res) return res;
+
+        res =3D set_shmem_phandle(fdt, SCMI_NODE_COMPATIBLE);
+        if (res) return res;
+    }
+    else
+        res =3D create_scmi_from_hypfs(fdt, SCMI_NODE_PATH);
+
+    return res;
+}
+
+static int make_firmware_node(libxl__gc *gc, void *fdt, void *pfdt, int te=
e,
+                              int sci)
+{
+    int res;
+
+    if ((tee =3D=3D LIBXL_TEE_TYPE_NONE) && (sci =3D=3D LIBXL_ARM_SCI_TYPE=
_NONE))
+        return 0;
+
+    res =3D fdt_begin_node(fdt, "firmware");
+    if (res) return res;
+
+    if (tee =3D=3D LIBXL_TEE_TYPE_OPTEE) {
+       res =3D make_optee_node(gc, fdt);
+       if (res) return res;
+    }
+
+    if (sci =3D=3D LIBXL_ARM_SCI_TYPE_SCMI_SMC) {
+        res =3D make_scmi_node(gc, fdt, pfdt);
+        if (res) return res;
+    }
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 /*
  * The partial device tree is not copied entirely. Only the relevant bits =
are
  * copied to the guest device tree:
@@ -1091,8 +1281,10 @@ next_resize:
         if (info->arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART)
             FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
=20
-        if (info->tee =3D=3D LIBXL_TEE_TYPE_OPTEE)
-            FDT( make_optee_node(gc, fdt) );
+        if (info->arm_sci =3D=3D LIBXL_ARM_SCI_TYPE_SCMI_SMC)
+            FDT( make_scmi_shmem_node(gc, fdt, pfdt) );
+
+        FDT( make_firmware_node(gc, fdt, pfdt, info->tee, info->arm_sci) )=
;
=20
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_creat=
e.c
index dcd09d32ba..f1f1e66275 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -596,6 +596,38 @@ out:
     return ret;
 }
=20
+static int map_sci_page(libxl__gc *gc, uint32_t domid, uint64_t paddr,
+                         uint64_t guest_addr)
+{
+    int ret;
+    uint64_t _paddr_pfn =3D paddr >> XC_PAGE_SHIFT;
+    uint64_t _guest_pfn =3D guest_addr >> XC_PAGE_SHIFT;
+
+    assert(paddr && guest_addr);
+    LOG(DEBUG, "iomem %"PRIx64, _paddr_pfn);
+
+    ret =3D xc_domain_iomem_permission(CTX->xch, domid, _paddr_pfn, 1, 1);
+    if (ret < 0) {
+        LOG(ERROR,
+              "failed give domain access to iomem page %"PRIx64,
+             _paddr_pfn);
+        return ret;
+    }
+
+    ret =3D xc_domain_memory_mapping(CTX->xch, domid,
+                                   _guest_pfn, _paddr_pfn,
+                                   1, 1);
+    if (ret < 0) {
+        LOG(ERROR,
+              "failed to map to domain iomem page %"PRIx64
+              " to guest address %"PRIx64,
+              _paddr_pfn, _guest_pfn);
+        return ret;
+    }
+
+    return 0;
+}
+
 int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                        libxl__domain_build_state *state,
                        uint32_t *domid, bool soft_reset)
@@ -762,6 +794,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_con=
fig *d_config,
         goto out;
     }
=20
+    if (d_config->b_info.arm_sci =3D=3D LIBXL_ARM_SCI_TYPE_SCMI_SMC) {
+        ret =3D map_sci_page(gc, *domid, state->arm_sci_agent_paddr,
+                            GUEST_SCI_SHMEM_BASE);
+        if (ret < 0) {
+            LOGED(ERROR, *domid, "map scmi fail");
+            rc =3D ERROR_FAIL;
+            goto out;
+        }
+    }
+
     dom_path =3D libxl__xs_get_dompath(gc, *domid);
     if (!dom_path) {
         rc =3D ERROR_FAIL;
@@ -1825,7 +1867,7 @@ static void libxl__add_dtdevs(libxl__egc *egc, libxl_=
_ao *ao, uint32_t domid,
         LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->path);
         rc =3D xc_assign_dt_device(CTX->xch, domid, dtdev->path);
         if (rc < 0) {
-            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
+            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d", rc);
             goto out;
         }
     }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_int=
ernal.h
index 0b4671318c..79f38b60d4 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1407,6 +1407,9 @@ typedef struct {
     /* Whether this domain is being migrated/restored, or booting fresh.  =
Only
      * applicable to the primary domain, not support domains (e.g. stub QE=
MU). */
     bool restore;
+
+    /* arm_sci channel paddr to be set to device-tree node */
+    uint64_t arm_sci_agent_paddr;
 } libxl__domain_build_state;
=20
 _hidden void libxl__domain_build_state_init(libxl__domain_build_state *s);
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 6245af6d0b..23c44f3a13 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2012, Citrix Systems
  */
=20
+#include <asm/sci/sci.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
@@ -182,7 +183,13 @@ long arch_do_domctl(struct xen_domctl *domctl, struct =
domain *d,
         rc =3D subarch_do_domctl(domctl, d, u_domctl);
=20
         if ( rc =3D=3D -ENOSYS )
+        {
             rc =3D iommu_do_domctl(domctl, d, u_domctl);
+            if ( (rc) && (rc !=3D -ENOSYS) )
+                return rc;
+
+            rc =3D sci_do_domctl(domctl, d, u_domctl);
+        }
=20
         return rc;
     }
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/dev=
ice_tree_defs.h
index 209d43de3f..f57684547b 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -7,6 +7,7 @@
  * onwards. Reserve a high value for the GIC phandle.
  */
 #define GUEST_PHANDLE_GIC (65000)
+#define GUEST_PHANDLE_SCMI (67000)
=20
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
--=20
2.27.0

