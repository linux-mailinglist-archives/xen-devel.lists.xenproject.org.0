Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560917E7C81
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 14:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630398.983263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RTr-0005g9-BA; Fri, 10 Nov 2023 13:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630398.983263; Fri, 10 Nov 2023 13:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RTr-0005dK-76; Fri, 10 Nov 2023 13:23:27 +0000
Received: by outflank-mailman (input) for mailman id 630398;
 Fri, 10 Nov 2023 13:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R44-0001y1-D5
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973431d7-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:41 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvi025691; Fri, 10 Nov 2023 12:56:32 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:24 +0000
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
X-Inumbo-ID: 973431d7-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA5yWrwIQdQ7rZA2ELa5iHU3nEdzr4NqRh4qGSDnYCl1MJZwuCXsAk0uUz8xoDoe2TkD+S6SEI7JeZj4rXy1FTIBUCNFkjfSALMEsYBNv2kfHAb5DmTiYcp8K+Yryr2k6GTp4RkusrgXPOz5YdwGvs4ZtYVNpXsK6LL6RhknW6FV1WiXQw3w9jxvhb4CNeyJjEeVbedlr7ntALYlc2/Dv+UyqIJhfIOFDcYMckt0+xbV38H/a4M1pmn8NZh8IMBSn4UYQd45kjxOX3wmxY1ydvdNW7Or1MDRomuy3qpgg2MsnVTRLNt+VDtr00jLjgfbJq7IAt0bQSRB64+QbKILaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaBtTU3W3JWhecnePRAnENvtSLN9jZOi52Wa9GjunN0=;
 b=Z02oLteWHaf9lQq3uILkKuaQ1Gaa4yGVuHOPNPZljPmq2zaLz4F6MT8gJSFwtnimXA1KWwYNgnQ/UTJF8rUQsNdPt1aOY0C6KpxEBXI+Hn2gjebn+zwoffK9aUCyvIK7jdFGF5/PW0BwclKyPkiUe42zbA//9w7HfWbW22YERP0myYs6ZX3Axdsnq6E2Ypjxt1Efr2x1pUhslOfHHPobgBLbpRDiYSpOm9N0hMEnvjewYPNDrphtrvVsxh53/Ohg3c66B+KELElv+KzwJ80zTsucSYRiA3QO9ga9HFN5u/h8Vne10QJUuWTi1otARPZW+LWLDblR0WHOoAbMPu7N/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaBtTU3W3JWhecnePRAnENvtSLN9jZOi52Wa9GjunN0=;
 b=KLDblRrUbzY7F8lpjoj+bl2M0+kg3s1pLUZAGm1vZ8XM1JmMldJSNpOQNq1e68HBAwHPZw0HvZPq2is3sSGZRpc/5lmuDP5lEgk5nXipa5+OURTIm/FBL4HF8/71d59LCpbX0bXWD12xjJijrgu4vKvGuRrP0c7UUGwuQoAJYbxecoAwDTs4F6kvWgJIqgzu8mC+vmYZwyfwAiAQ5j4f9HwGe7YO/2bGBhIJgLbKvqqCAJlEdcz2Rx94vLPZ6vR7V0VUGWaPkOVUUbAxSppx6uyCFCyN5wsydSxO2HCRz8RfqdmXEzUunS4UDTDLjRrl6PCrb0cDIrVNkjvtbWvdbw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 20/25] arm: new VGIC: its: Implement ITS command queue
 command handlers
Thread-Topic: [XEN PATCH v2 20/25] arm: new VGIC: its: Implement ITS command
 queue command handlers
Thread-Index: AQHaE9VODE7u5hYjZ0CdkB0s1bN24A==
Date: Fri, 10 Nov 2023 12:56:22 +0000
Message-ID: 
 <b5e02bda5db445156776ba0c6abbf047eba4e75e.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: be8640a2-c066-4899-35d2-08dbe1ec7243
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iRlzz29Ki72rn4k9f88olgm2W4HjaXBb+hzcW0NUOK+TsimWG1c09CGtGT4Jlwho8eTc6kPpw+TceQoWTAKGJOKvfYgBy/BFL+20rImfyICSpP7Ybah9tKin0ObBN4PGO+/KtI0UGiz9wg9z2B1InIegMyWPcpmwBdavxIKFaAmE3M1Dc+6OH6KrCf/o2YO7vMHzXxxKbmwB4QNz5mRhpMg8URZmxsYyU+92jreRKdGg+ftMHpc/oop7nE4lhrGGdlWJVlltdWaDZK/X5LdzLjRca5uz8nffZxpV9h/s6hX9DmlLOX+m94F+Ast9jmCcVU35REp6jabmZgWxmKjV9GtgRLj5MBZ81MKOsAduaM3y/lidramxxMy3kAiExe2o5AAicphOKG+R1uSlFUm8l3FtazsNOxmGPHHmaIT0snLKZCCIi9Nb07Z0Wk5TyQwLquCjNOYvSIgyBMHtPanFxcW1k2ORhpF1B+jzH8rwxt5y9R57QD5F0F5+/TFgF6/v23CWtWq0byULrTaCIgULHemSdcJk3zbzbsdU4qz3bxIN10Bk2sNfvsnlJYXRano4c3fIWG7iFa1OlzqQ9Yk99B4ry8HwAIvD8sYaPIRC3O03XH/NOYgv2CmaCu9HvMJN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(30864003)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(66899024)(83380400001)(38070700009)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Fg7O0xiJySLy0R0PyFHqrEpcPLSNawgF3T8Eqe/NttaTkE3lIZSdZ016v6?=
 =?iso-8859-1?Q?fqNiZKaH8+wK8oWd/kfKrCfh8Ez3yfn0ZVjv/agBp4lUinkQhwWyFD2aZR?=
 =?iso-8859-1?Q?jRYDi+3Aklzp4exruHIYcqPHZZgr1c4uz/r7N/JLNhd3s7EjKXm6LZabdv?=
 =?iso-8859-1?Q?YKBcX63fCfjtrmZEgSEU26qAit5aX6WyzNdSNLvyTXHm6pBUJfnZA1sXe0?=
 =?iso-8859-1?Q?RKZXon0/wBuXSDSSkRnDVqnq2Ci+j3ypzCN1xZBJtJk4LOdDH5S9iP+b0V?=
 =?iso-8859-1?Q?jsemcjQmOZN3CpZ0+bxBVxL2hDDXCTaYLpHHzaamR/asXYJLnaeW/t+Uac?=
 =?iso-8859-1?Q?zBLPKHif8xF8Wmc3MMSbzUw5rZt9Y2jIpwbMPeLC6ZsYikU21ItXS5++Ie?=
 =?iso-8859-1?Q?GQuYQoO33HmsZEFC7KK8PreoYjS+YGltWkYXo5AIQQ2kSD98cIAwMYxFb9?=
 =?iso-8859-1?Q?x5HyInSUJRx15c+FOhty1mf9hDSonlLaHYHzdhFdJgeLYUHg8FruUWpAl6?=
 =?iso-8859-1?Q?dx1OLThfaLO9Iscz7FL8AeRz2HuvQh0Y6Ssk4JM4m1rX8gcBK12Z6PzC+p?=
 =?iso-8859-1?Q?igdycHiHq9CUZ6dK3kNqMIoREuZqjEG/k8bjtMulRffJRi8BUSfzsJcnV8?=
 =?iso-8859-1?Q?R9hfPVWyae8W5mLUJTg4UNZNsrKXB7B98uxMBmzRe586wARwzjCYwsSwK9?=
 =?iso-8859-1?Q?7btb4ZeHlxbfestlt7PI1eUAOcL9V0S6jbrzfWbJLqCI3Tr/brRB7YeMEK?=
 =?iso-8859-1?Q?W7f4mBRU1XBoB58pzQVQhud972JQbmLLpRDf1pavKLFfhn5z8DQSpbRPZY?=
 =?iso-8859-1?Q?rvaYbRrdA+TF9Sclffx2epskYnxGtmDZn0xkAItl7Cokv0VvBFjg01shYY?=
 =?iso-8859-1?Q?5Pfigx6D+EieWmI+sPlB1yWrP5qb65LJeiruLzMwaojMK7KtjkejE91KOT?=
 =?iso-8859-1?Q?VZ8I23slC0IZheW2ItuX6QVuqpr2MuCXDqWl7xHLpZRMQxbFOB/lIJeNfZ?=
 =?iso-8859-1?Q?z4uiUlGRc/1I9UgD+tVd5SLTTNtlQhcFSBRXqdF6SJcPCwK0FuUTCsthkY?=
 =?iso-8859-1?Q?XHjvWRyXLLUdiSAO4YrejOAA67o54gVhGuH28GySvm/uNxILfSGCzxJSgH?=
 =?iso-8859-1?Q?UNHCYUiwzLWN/7kEKAF+Qlk722oCq5JajqWw8Sx+1eQsBqsSF0nLhp0kj8?=
 =?iso-8859-1?Q?Dj2JXT7nOOu0FDrWVQOIaB0gm4CdkkYr5lc91LfFJ/rSMSfgv8eM60B63m?=
 =?iso-8859-1?Q?/9Mxv83YIWQXl5FsL+usFR1+uaPStgf9bvY1JNV6HYuqB7p0K1XDxrtivt?=
 =?iso-8859-1?Q?wFgg6Qsk4n6IAtMnaunedUWHhifID9m19BLJ6kLNT5P7LfvAD9Z/Go5UnL?=
 =?iso-8859-1?Q?wMjiUaCKrUAW+DoT03u5Yp+Zk9uT+nBzapH7b76nLXYkj8EnfGU2j1ztlS?=
 =?iso-8859-1?Q?jU99JImVdQqrveoYMoBkaOHHw+yY+VbHimzaNCvtfr4hA2lioEjoVGTUg4?=
 =?iso-8859-1?Q?7LU+CflmsA+GhRpdzRWQuRkZ6Y5mbpJR7sJVYCg24jsQ91tmNCyl75VbrK?=
 =?iso-8859-1?Q?kKhG1Zd07nUKHal25vfNWiGUTiFTfIR9daMOvb/TfK4wHCMjJ7SJQX6rb/?=
 =?iso-8859-1?Q?jcWfqFAiy5nC1ET+rtCZaBS9ockCCzTb8ClVVqtNLg4BZCmgHHcs4cDA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8640a2-c066-4899-35d2-08dbe1ec7243
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:22.9843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjgezbWcd7/mIJEc0mNuei3Epdo4FCCCQfL4O8TO6QTRnk+HuE2be879R1gRPnQdZs2J1FWR85yLir6kikq6Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: RiuyVqpxzrf-VlRFsunQQEO1ysKircOD
X-Proofpoint-GUID: RiuyVqpxzrf-VlRFsunQQEO1ysKircOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

The connection between a device, an event ID, the LPI number and the
associated CPU is stored in in-memory tables in a GICv3, but their
format is not specified by the spec. Instead software uses a command
queue in a ring buffer to let an ITS implementation use its own
format.
Implement handlers for the various ITS commands and let them store
the requested relation into our own data structures. Those data
structures are protected by the its_lock mutex.
Error handling is very basic at the moment, as we don't have a good
way of communicating errors to the guest (usually an SError).
The INT command handler is missing from this patch, as we gain the
capability of actually injecting MSIs into the guest only later on.

Based on Linux commit df9f58fbea9b by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/gic_v3_its.h |  19 +
 xen/arch/arm/vgic/vgic-its.c          | 888 +++++++++++++++++++++++++-
 xen/arch/arm/vgic/vgic.h              |   6 +
 3 files changed, 908 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index b408441c6e..cbfd854af6 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -160,6 +160,25 @@
 #define GITS_CMD_MOVALL                 0x0e
 #define GITS_CMD_DISCARD                0x0f
=20
+/*
+ * ITS error numbers
+ */
+#define E_ITS_MOVI_UNMAPPED_INTERRUPT       0x010107
+#define E_ITS_MOVI_UNMAPPED_COLLECTION      0x010109
+#define E_ITS_INT_UNMAPPED_INTERRUPT        0x010307
+#define E_ITS_CLEAR_UNMAPPED_INTERRUPT      0x010507
+#define E_ITS_MAPD_DEVICE_OOR               0x010801
+#define E_ITS_MAPD_ITTSIZE_OOR              0x010802
+#define E_ITS_MAPC_PROCNUM_OOR              0x010902
+#define E_ITS_MAPC_COLLECTION_OOR           0x010903
+#define E_ITS_MAPTI_UNMAPPED_DEVICE         0x010a04
+#define E_ITS_MAPTI_ID_OOR                  0x010a05
+#define E_ITS_MAPTI_PHYSICALID_OOR          0x010a06
+#define E_ITS_INV_UNMAPPED_INTERRUPT        0x010c07
+#define E_ITS_INVALL_UNMAPPED_COLLECTION    0x010d09
+#define E_ITS_MOVALL_PROCNUM_OOR            0x010e01
+#define E_ITS_DISCARD_UNMAPPED_INTERRUPT    0x010f07
+
 #define ITS_DOORBELL_OFFSET             0x10040
 #define GICV3_ITS_SIZE                  SZ_128K
 #define ITS_TRANSLATION_OFFSET          0x10000
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index 48dfa09115..9a30087d3d 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -52,6 +52,9 @@ struct vgic_translation_cache_entry {
     struct vgic_irq *irq;
 };
=20
+#define its_is_collection_mapped(coll)                                    =
     \
+    ((coll) && ((coll)->target_addr !=3D COLLECTION_NOT_MAPPED))
+
 /*
  * Find and returns a device in the device table for an ITS.
  * Must be called with the its_devices_lock mutex held.
@@ -71,8 +74,55 @@ static struct vgic_its_device *find_its_device(struct vg=
ic_its *its, u32 device_
 #define VGIC_ITS_TYPER_DEVBITS          16
 #define VGIC_ITS_TYPER_ITE_SIZE         8
=20
+/*
+ * Find and returns an interrupt translation table entry (ITTE) for a give=
n
+ * Device ID/Event ID pair on an ITS.
+ * Must be called with the its_lock mutex held.
+ */
+static struct its_ite *find_ite(struct vgic_its *its, u32 device_id,
+                                u32 event_id)
+{
+    struct vgic_its_device *device;
+    struct its_ite *ite;
+
+    spin_lock(&its->domain->arch.vgic.its_devices_lock);
+    device =3D find_its_device(its, device_id);
+    spin_unlock(&its->domain->arch.vgic.its_devices_lock);
+    if ( device =3D=3D NULL )
+        return NULL;
+
+    list_for_each_entry(ite, &device->itt_head, ite_list)
+        if ( ite->event_id =3D=3D event_id )
+            return ite;
+
+    return NULL;
+}
+
+/* To be used as an iterator this macro misses the enclosing parentheses *=
/
+#define for_each_lpi_its(dev, ite, its)                                   =
     \
+    list_for_each_entry(dev, &(its)->device_list, dev_list)               =
     \
+        list_for_each_entry(ite, &(dev)->itt_head, ite_list)
+
 #define GIC_LPI_OFFSET              8192
=20
+#define VITS_TYPER_IDBITS           16
+#define VITS_TYPER_DEVBITS          16
+#define VITS_DTE_MAX_DEVID_OFFSET   (BIT(14, UL) - 1)
+#define VITS_ITE_MAX_EVENTID_OFFSET (BIT(16, UL) - 1)
+
+static struct its_collection *find_collection(struct vgic_its *its, int co=
ll_id)
+{
+    struct its_collection *collection;
+
+    list_for_each_entry(collection, &its->collection_list, coll_list)
+    {
+        if ( coll_id =3D=3D collection->collection_id )
+            return collection;
+    }
+
+    return NULL;
+}
+
 #define LPI_PROP_ENABLE_BIT(p) ((p)&LPI_PROP_ENABLED)
 #define LPI_PROP_PRIORITY(p)   ((p)&0xfc)
=20
@@ -118,6 +168,156 @@ static int update_lpi_config(struct domain *d, struct=
 vgic_irq *irq,
     return 0;
 }
=20
+static int vgic_v3_lpi_sync_pending_status(struct domain *d, struct vgic_i=
rq *irq)
+{
+    struct vcpu *vcpu;
+    int byte_offset, bit_nr;
+    paddr_t pendbase, ptr;
+    bool status;
+    u8 val;
+    int ret;
+    unsigned long flags;
+
+retry:
+    vcpu =3D irq->target_vcpu;
+    if ( !vcpu )
+        return 0;
+
+    pendbase    =3D GICR_PENDBASER_ADDRESS(vcpu->arch.vgic.pendbaser);
+
+    byte_offset =3D irq->intid / BITS_PER_BYTE;
+    bit_nr      =3D irq->intid % BITS_PER_BYTE;
+    ptr         =3D pendbase + byte_offset;
+
+    ret         =3D access_guest_memory_by_gpa(d, ptr, &val, 1, false);
+    if ( ret )
+        return ret;
+
+    status =3D val & (1 << bit_nr);
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+    if ( irq->target_vcpu !=3D vcpu )
+    {
+        spin_unlock_irqrestore(&irq->irq_lock, flags);
+        goto retry;
+    }
+    irq->pending_latch =3D status;
+    vgic_queue_irq_unlock(vcpu->domain, irq, flags);
+
+    if ( status )
+    {
+        /* clear consumed data */
+        val &=3D ~(1 << bit_nr);
+        ret =3D access_guest_memory_by_gpa(d, ptr, &val, 1, true);
+        if ( ret )
+            return ret;
+    }
+    return 0;
+}
+
+/*
+ * Creates a new (reference to a) struct vgic_irq for a given LPI.
+ * If this LPI is already mapped on another ITS, we increase its refcount
+ * and return a pointer to the existing structure.
+ * If this is a "new" LPI, we allocate and initialize a new struct vgic_ir=
q.
+ * This function returns a pointer to the _unlocked_ structure.
+ */
+static struct vgic_irq *vgic_add_lpi(struct domain *d, struct vgic_its *it=
s,
+                                     u32 intid, u32 devid, u32 eventid,
+                                     struct vcpu *vcpu)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_irq *irq   =3D vgic_get_irq(d, NULL, intid), *oldirq;
+    uint32_t host_lpi;
+    unsigned long flags;
+    int ret;
+
+    /* In this case there is no put, since we keep the reference. */
+    if ( irq )
+        return irq;
+
+    host_lpi =3D gicv3_its_get_host_lpi(its->domain,
+                                      its->vgic_its_base + ITS_DOORBELL_OF=
FSET,
+                                      devid, eventid);
+
+    if ( host_lpi =3D=3D INVALID_LPI )
+        return ERR_PTR(-EINVAL);
+
+    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, intid);
+
+    irq =3D xzalloc(struct vgic_irq);
+
+    if ( !irq )
+        return ERR_PTR(-ENOMEM);
+
+    memset(irq, 0, sizeof(*irq));
+
+    INIT_LIST_HEAD(&irq->lpi_list);
+    INIT_LIST_HEAD(&irq->ap_list);
+    spin_lock_init(&irq->irq_lock);
+
+    irq->config =3D VGIC_CONFIG_EDGE;
+    atomic_set(&irq->refcount, 1);
+    irq->intid       =3D intid;
+    irq->target_vcpu =3D vcpu;
+
+    spin_lock_irqsave(&dist->lpi_list_lock, flags);
+
+    /*
+     * There could be a race with another vgic_add_lpi(), so we need to
+     * check that we don't add a second list entry with the same LPI.
+     */
+    list_for_each_entry(oldirq, &dist->lpi_list_head, lpi_list)
+    {
+        if ( oldirq->intid !=3D intid )
+            continue;
+
+        /* Someone was faster with adding this LPI, lets use that. */
+        gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
+        irq =3D oldirq;
+
+        /*
+         * This increases the refcount, the caller is expected to
+         * call vgic_put_irq() on the returned pointer once it's
+         * finished with the IRQ.
+         */
+        vgic_get_irq_kref(irq);
+
+        goto out_unlock;
+    }
+
+    list_add_tail(&irq->lpi_list, &dist->lpi_list_head);
+    dist->lpi_list_count++;
+
+out_unlock:
+    spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
+
+    /*
+     * We "cache" the configuration table entries in our struct vgic_irq's=
.
+     * However we only have those structs for mapped IRQs, so we read in
+     * the respective config data from memory here upon mapping the LPI.
+     *
+     * Should any of these fail, behave as if we couldn't create the LPI
+     * by dropping the refcount and returning the error.
+     */
+    ret =3D update_lpi_config(d, irq, NULL, false);
+    if ( ret )
+    {
+        vgic_put_irq(d, irq);
+        gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
+        return ERR_PTR(ret);
+    }
+
+    ret =3D vgic_v3_lpi_sync_pending_status(d, irq);
+    if ( ret )
+    {
+        vgic_put_irq(d, irq);
+        gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
+        return ERR_PTR(ret);
+    }
+
+    return irq;
+}
=20
 /*
  * Create a snapshot of the current LPIs targeting @vcpu, so that we can
@@ -160,6 +360,57 @@ int vgic_copy_lpi_list(struct domain *d, struct vcpu *=
vcpu, u32 **intid_ptr)
     return i;
 }
=20
+static int update_affinity(struct vgic_irq *irq, struct vcpu *vcpu)
+{
+    int ret =3D 0;
+    unsigned long flags;
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+    irq->target_vcpu =3D vcpu;
+    spin_unlock_irqrestore(&irq->irq_lock, flags);
+
+    /* GICv4 style VLPIS are not yet supported */
+    WARN_ON(irq->hw);
+
+    return ret;
+}
+
+/*
+ * Promotes the ITS view of affinity of an ITTE (which redistributor this =
LPI
+ * is targeting) to the VGIC's view, which deals with target VCPUs.
+ * Needs to be called whenever either the collection for a LPIs has
+ * changed or the collection itself got retargeted.
+ */
+static void update_affinity_ite(struct domain *d, struct its_ite *ite)
+{
+    struct vcpu *vcpu;
+
+    if ( !its_is_collection_mapped(ite->collection) )
+        return;
+
+    vcpu =3D d->vcpu[ite->collection->target_addr];
+    update_affinity(ite->irq, vcpu);
+}
+
+/*
+ * Updates the target VCPU for every LPI targeting this collection.
+ * Must be called with the its_lock mutex held.
+ */
+static void update_affinity_collection(struct domain *d, struct vgic_its *=
its,
+                                       struct its_collection *coll)
+{
+    struct vgic_its_device *device;
+    struct its_ite *ite;
+
+    for_each_lpi_its(device, ite, its)
+    {
+        if ( !ite->collection || coll !=3D ite->collection )
+            continue;
+
+        update_affinity_ite(d, ite);
+    }
+}
+
 void __vgic_put_lpi_locked(struct domain *d, struct vgic_irq *irq)
 {
     struct vgic_dist *dist =3D &d->arch.vgic;
@@ -175,6 +426,7 @@ void __vgic_put_lpi_locked(struct domain *d, struct vgi=
c_irq *irq)
     xfree(irq);
 }
=20
+
 static struct vgic_irq *__vgic_its_check_cache(struct vgic_dist *dist,
                                                paddr_t db, u32 devid,
                                                u32 eventid)
@@ -298,6 +550,18 @@ void vgic_its_invalidate_cache(struct domain *d)
     spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
 }
=20
+static u32 max_lpis_propbaser(u64 propbaser)
+{
+    int nr_idbits =3D (propbaser & 0x1f) + 1;
+
+    return 1U << min(nr_idbits, INTERRUPT_ID_BITS_ITS);
+}
+
+static u64 its_cmd_mask_field(u64 *its_cmd, int word, int shift, int size)
+{
+    return (le64_to_cpu(its_cmd[word]) >> shift) & (BIT(size, ULL) - 1);
+}
+
 /* Requires the its_lock to be held. */
 static void its_free_ite(struct domain *d, struct its_ite *ite)
 {
@@ -315,6 +579,194 @@ static void its_free_ite(struct domain *d, struct its=
_ite *ite)
     xfree(ite);
 }
=20
+/* Must be called with its_lock mutex held */
+static struct its_ite *vgic_its_alloc_ite(struct vgic_its_device *device,
+                                          struct its_collection *collectio=
n,
+                                          u32 event_id)
+{
+    struct its_ite *ite;
+
+    ite =3D xzalloc(struct its_ite);
+    if ( !ite )
+        return ERR_PTR(-ENOMEM);
+
+    ite->event_id   =3D event_id;
+    ite->collection =3D collection;
+
+    list_add_tail(&ite->ite_list, &device->itt_head);
+    return ite;
+}
+
+#define its_cmd_get_command(cmd)     its_cmd_mask_field(cmd, 0, 0, 8)
+#define its_cmd_get_deviceid(cmd)    its_cmd_mask_field(cmd, 0, 32, 32)
+#define its_cmd_get_size(cmd)        (its_cmd_mask_field(cmd, 1, 0, 5) + 1=
)
+#define its_cmd_get_id(cmd)          its_cmd_mask_field(cmd, 1, 0, 32)
+#define its_cmd_get_physical_id(cmd) its_cmd_mask_field(cmd, 1, 32, 32)
+#define its_cmd_get_collection(cmd)  its_cmd_mask_field(cmd, 2, 0, 16)
+#define its_cmd_get_ittaddr(cmd)     (its_cmd_mask_field(cmd, 2, 8, 44) <<=
 8)
+#define its_cmd_get_target_addr(cmd) its_cmd_mask_field(cmd, 2, 16, 32)
+#define its_cmd_get_validbit(cmd)    its_cmd_mask_field(cmd, 2, 63, 1)
+
+/*
+ * Check whether a guest physical address is owned by it
+*/
+static bool __is_visible_gfn_locked(struct vgic_its *its, paddr_t gpa)
+{
+    gfn_t gfn =3D gaddr_to_gfn(gpa);
+    volatile struct domain *d;
+    struct page_info *page;
+
+    page =3D mfn_to_page(gfn_to_mfn(its->domain, gfn));
+    if ( !page )
+        return false;
+
+    d =3D page_get_owner(page);
+    if ( !d )
+        return false;
+
+    return d =3D=3D its->domain;
+}
+
+/*
+ * Check whether an event ID can be stored in the corresponding Interrupt
+ * Translation Table, which starts at device->itt_addr.
+ */
+static bool vgic_its_check_event_id(struct vgic_its *its,
+                                    struct vgic_its_device *device, u32 ev=
ent_id)
+{
+    int ite_esz =3D VGIC_ITS_TYPER_ITE_SIZE;
+    paddr_t gpa;
+
+    /* max table size is: BIT_ULL(device->num_eventid_bits) * ite_esz */
+    if ( event_id >=3D BIT(device->num_eventid_bits, ULL) )
+        return false;
+
+    gpa =3D (paddr_t)device->itt_addr + event_id * ite_esz;
+    return __is_visible_gfn_locked(its, gpa);
+}
+
+/*
+ * Check whether an ID can be stored into the corresponding guest table.
+ * For a direct table this is pretty easy, but gets a bit nasty for
+ * indirect tables. We check whether the resulting guest physical address
+ * is actually valid (covered by a memslot and guest accessible).
+ * For this we have to read the respective first level entry.
+ */
+static bool vgic_its_check_id(struct vgic_its *its, u64 baser, u32 id,
+                              paddr_t *eaddr)
+{
+    int l1_tbl_size =3D GITS_BASER_NR_PAGES(baser) * SZ_64K;
+    u64 indirect_ptr, type =3D GITS_BASER_TYPE(baser);
+    paddr_t base =3D GITS_BASER_ADDR_48_to_52(baser);
+    int esz      =3D GITS_BASER_ENTRY_SIZE(baser);
+    int index;
+
+    switch ( type )
+    {
+    case GITS_BASER_TYPE_DEVICE:
+        if ( id >=3D BIT(VITS_TYPER_DEVBITS, ULL) )
+            return false;
+        break;
+    case GITS_BASER_TYPE_COLLECTION:
+        /* as GITS_TYPER.CIL =3D=3D 0, ITS supports 16-bit collection ID *=
/
+        if ( id >=3D BIT(16, ULL) )
+            return false;
+        break;
+    default:
+        return false;
+    }
+
+    if ( !(baser & GITS_BASER_INDIRECT) )
+    {
+        paddr_t addr;
+
+        if ( id >=3D (l1_tbl_size / esz) )
+            return false;
+
+        addr =3D base + id * esz;
+
+        if ( eaddr )
+            *eaddr =3D addr;
+
+        return __is_visible_gfn_locked(its, addr);
+    }
+
+    /* calculate and check the index into the 1st level */
+    index =3D id / (SZ_64K / esz);
+    if ( index >=3D (l1_tbl_size / sizeof(u64)) )
+        return false;
+
+    /* Each 1st level entry is represented by a 64-bit value. */
+    if ( access_guest_memory_by_gpa(its->domain,
+                                    base + index * sizeof(indirect_ptr),
+                                    &indirect_ptr, sizeof(indirect_ptr), 0=
) )
+        return false;
+
+    indirect_ptr =3D le64_to_cpu(indirect_ptr);
+
+    /* check the valid bit of the first level entry */
+    if ( !(indirect_ptr & BIT(63, ULL)) )
+        return false;
+
+    /* Mask the guest physical address and calculate the frame number. */
+    indirect_ptr &=3D GENMASK_ULL(51, 16);
+
+    /* Find the address of the actual entry */
+    index =3D id % (SZ_64K / esz);
+    indirect_ptr +=3D index * esz;
+
+    if ( eaddr )
+        *eaddr =3D indirect_ptr;
+
+    return __is_visible_gfn_locked(its, indirect_ptr);
+}
+
+/*
+ * Add a new collection into the ITS collection table.
+ * Returns 0 on success, and a negative error value for generic errors.
+ */
+static int vgic_its_alloc_collection(struct vgic_its *its,
+                                     struct its_collection **colp, u32 col=
l_id)
+{
+    struct its_collection *collection;
+
+    collection =3D xzalloc(struct its_collection);
+    if ( !collection )
+        return -ENOMEM;
+
+    collection->collection_id =3D coll_id;
+    collection->target_addr   =3D COLLECTION_NOT_MAPPED;
+
+    list_add_tail(&collection->coll_list, &its->collection_list);
+    *colp =3D collection;
+
+    return 0;
+}
+
+
+static void vgic_its_free_collection(struct vgic_its *its, u32 coll_id)
+{
+    struct its_collection *collection;
+    struct vgic_its_device *device;
+    struct its_ite *ite;
+
+    /*
+     * Clearing the mapping for that collection ID removes the
+     * entry from the list. If there wasn't any before, we can
+     * go home early.
+     */
+    collection =3D find_collection(its, coll_id);
+    if ( !collection )
+        return;
+
+    for_each_lpi_its( device, ite, its)
+        if ( ite->collection && ite->collection->collection_id =3D=3D coll=
_id )
+        ite->collection =3D NULL;
+
+    list_del(&collection->coll_list);
+    xfree(collection);
+}
+
 /* Requires the its_devices_lock to be held. */
 void vgic_its_free_device(struct vgic_its_device *device)
 {
@@ -352,10 +804,7 @@ static void vgic_its_free_collection_list(struct domai=
n *d,
     struct its_collection *cur, *temp;
=20
     list_for_each_entry_safe(cur, temp, &its->collection_list, coll_list)
-    {
-        list_del(&cur->coll_list);
-        xfree(cur);
-    }
+        vgic_its_free_collection(its, cur->collection_id);
 }
=20
 /* Must be called with its_devices_lock mutex held */
@@ -419,6 +868,390 @@ void vgic_its_delete_device(struct domain *d, struct =
vgic_its_device *its_dev)
     list_del(&its_dev->dev_list);
 }
=20
+/*
+ * MAPD maps or unmaps a device ID to Interrupt Translation Tables (ITTs).
+ * Must be called with the its_lock mutex held.
+ */
+
+static int vgic_its_cmd_handle_mapd(struct domain *d, struct vgic_its *its=
,
+                                    u64 *its_cmd)
+{
+    uint32_t guest_devid =3D its_cmd_get_deviceid(its_cmd);
+    bool valid           =3D its_cmd_get_validbit(its_cmd);
+    u8 num_eventid_bits  =3D its_cmd_get_size(its_cmd);
+    paddr_t itt_addr     =3D its_cmd_get_ittaddr(its_cmd);
+    int ret =3D 0;
+    struct vgic_its_device *device;
+
+    if ( !vgic_its_check_id(its, its->baser_device_table, guest_devid, NUL=
L) )
+        return E_ITS_MAPD_DEVICE_OOR;
+
+    if ( valid && num_eventid_bits > VITS_TYPER_IDBITS )
+        return E_ITS_MAPD_ITTSIZE_OOR;
+
+    /*
+     * There is no easy and clean way for Xen to know the ITS device ID of=
 a
+     * particular (PCI) device, so we have to rely on the guest telling
+     * us about it. For *now* we are just using the device ID *Dom0* uses,
+     * because the driver there has the actual knowledge.
+     * Eventually this will be replaced with a dedicated hypercall to
+     * announce pass-through of devices.
+     */
+    if ( is_hardware_domain(its->domain) )
+    {
+        ret =3D gicv3_its_map_guest_device(its->domain, its->doorbell_addr=
ess,
+                                        guest_devid,
+                                        its->vgic_its_base + ITS_DOORBELL_=
OFFSET,
+                                        guest_devid, BIT(num_eventid_bits,=
 UL),
+                                        valid);
+    }
+
+    if ( !ret && valid ) {
+        device =3D vgic_its_get_device(d, its->vgic_its_base + ITS_DOORBEL=
L_OFFSET, guest_devid);
+
+        device->itt_addr =3D (void *)itt_addr;
+        device->num_eventid_bits =3D num_eventid_bits;
+    }
+
+    return ret;
+}
+
+/*
+ * The MAPC command maps collection IDs to redistributors.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_mapc(struct domain *d, struct vgic_its *its=
,
+                                    u64 *its_cmd)
+{
+    u16 coll_id;
+    u32 target_addr;
+    struct its_collection *collection;
+    bool valid;
+
+    valid       =3D its_cmd_get_validbit(its_cmd);
+    coll_id     =3D its_cmd_get_collection(its_cmd);
+    target_addr =3D its_cmd_get_target_addr(its_cmd);
+
+    if ( target_addr >=3D d->max_vcpus )
+        return E_ITS_MAPC_PROCNUM_OOR;
+
+    if ( !valid )
+    {
+        vgic_its_free_collection(its, coll_id);
+        vgic_its_invalidate_cache(d);
+    }
+    else
+    {
+        collection =3D find_collection(its, coll_id);
+
+        if ( !collection )
+        {
+            int ret;
+
+            if ( !vgic_its_check_id(its, its->baser_coll_table, coll_id, N=
ULL) )
+                return E_ITS_MAPC_COLLECTION_OOR;
+
+            ret =3D vgic_its_alloc_collection(its, &collection, coll_id);
+            if ( ret )
+                return ret;
+            collection->target_addr =3D target_addr;
+        }
+        else
+        {
+            collection->target_addr =3D target_addr;
+            update_affinity_collection(d, its, collection);
+        }
+    }
+
+    return 0;
+}
+
+
+/*
+ * The MAPTI and MAPI commands map LPIs to ITTEs.
+ * Must be called with its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_mapi(struct domain *d, struct vgic_its *its=
,
+                                    u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    u32 coll_id   =3D its_cmd_get_collection(its_cmd);
+    struct its_ite *ite;
+    struct vcpu *vcpu =3D NULL;
+    struct vgic_its_device *device;
+    struct its_collection *collection, *new_coll =3D NULL;
+    struct vgic_irq *irq;
+    int lpi_nr;
+
+    spin_lock(&d->arch.vgic.its_devices_lock);
+    device =3D find_its_device(its, device_id);
+    spin_unlock(&d->arch.vgic.its_devices_lock);
+    if ( !device )
+        return E_ITS_MAPTI_UNMAPPED_DEVICE;
+
+    if ( !vgic_its_check_event_id(its, device, event_id) )
+        return E_ITS_MAPTI_ID_OOR;
+
+    if ( its_cmd_get_command(its_cmd) =3D=3D GITS_CMD_MAPTI )
+        lpi_nr =3D its_cmd_get_physical_id(its_cmd);
+    else
+        lpi_nr =3D event_id;
+    if ( lpi_nr < GIC_LPI_OFFSET ||
+         lpi_nr >=3D max_lpis_propbaser(d->arch.vgic.propbaser) )
+        return E_ITS_MAPTI_PHYSICALID_OOR;
+
+    /* If there is an existing mapping, behavior is UNPREDICTABLE. */
+    if ( find_ite(its, device_id, event_id) )
+        return 0;
+
+    collection =3D find_collection(its, coll_id);
+    if ( !collection )
+    {
+        int ret;
+
+        if ( !vgic_its_check_id(its, its->baser_coll_table, coll_id, NULL)=
 )
+            return E_ITS_MAPC_COLLECTION_OOR;
+
+        ret =3D vgic_its_alloc_collection(its, &collection, coll_id);
+        if ( ret )
+            return ret;
+        new_coll =3D collection;
+    }
+
+    ite =3D vgic_its_alloc_ite(device, collection, event_id);
+    if ( IS_ERR(ite) )
+    {
+        if ( new_coll )
+            vgic_its_free_collection(its, coll_id);
+        return PTR_ERR(ite);
+    }
+
+    if ( its_is_collection_mapped(collection) )
+        vcpu =3D d->vcpu[collection->target_addr];
+
+    irq =3D vgic_add_lpi(d, its, lpi_nr, device_id, event_id, vcpu);
+    if ( IS_ERR(irq) )
+    {
+        if ( new_coll )
+            vgic_its_free_collection(its, coll_id);
+        its_free_ite(d, ite);
+        return PTR_ERR(irq);
+    }
+    ite->irq =3D irq;
+
+    return 0;
+}
+
+/*
+ * The MOVI command moves an ITTE to a different collection.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_movi(struct domain *d, struct vgic_its *its=
,
+                                    u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    u32 coll_id   =3D its_cmd_get_collection(its_cmd);
+    struct vcpu *vcpu;
+    struct its_ite *ite;
+    struct its_collection *collection;
+
+    ite =3D find_ite(its, device_id, event_id);
+    if ( !ite )
+        return E_ITS_MOVI_UNMAPPED_INTERRUPT;
+
+    if ( !its_is_collection_mapped(ite->collection) )
+        return E_ITS_MOVI_UNMAPPED_COLLECTION;
+
+    collection =3D find_collection(its, coll_id);
+    if ( !its_is_collection_mapped(collection) )
+        return E_ITS_MOVI_UNMAPPED_COLLECTION;
+
+    ite->collection =3D collection;
+    vcpu            =3D d->vcpu[collection->target_addr];
+
+    vgic_its_invalidate_cache(d);
+
+    return update_affinity(ite->irq, vcpu);
+}
+
+/*
+ * The DISCARD command frees an Interrupt Translation Table Entry (ITTE).
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_discard(struct domain *d, struct vgic_its *=
its,
+                                       u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    struct its_ite *ite;
+
+    ite =3D find_ite(its, device_id, event_id);
+    if ( ite && its_is_collection_mapped(ite->collection) )
+    {
+        /*
+         * Though the spec talks about removing the pending state, we
+         * don't bother here since we clear the ITTE anyway and the
+         * pending state is a property of the ITTE struct.
+         */
+        vgic_its_invalidate_cache(d);
+
+        its_free_ite(d, ite);
+        return 0;
+    }
+
+    return E_ITS_DISCARD_UNMAPPED_INTERRUPT;
+}
+
+/*
+ * The CLEAR command removes the pending state for a particular LPI.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_clear(struct domain *d, struct vgic_its *it=
s,
+                                     u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    struct its_ite *ite;
+
+    ite =3D find_ite(its, device_id, event_id);
+    if ( !ite )
+        return E_ITS_CLEAR_UNMAPPED_INTERRUPT;
+
+    ite->irq->pending_latch =3D false;
+
+    /* GICv4 style VLPIS are not yet supported */
+    WARN_ON(ite->irq->hw);
+
+    return 0;
+}
+
+/*
+ * The MOVALL command moves the pending state of all IRQs targeting one
+ * redistributor to another. We don't hold the pending state in the VCPUs,
+ * but in the IRQs instead, so there is really not much to do for us here.
+ * However the spec says that no IRQ must target the old redistributor
+ * afterwards, so we make sure that no LPI is using the associated target_=
vcpu.
+ * This command affects all LPIs in the system that target that redistribu=
tor.
+ */
+static int vgic_its_cmd_handle_movall(struct domain *d, struct vgic_its *i=
ts,
+                                      u64 *its_cmd)
+{
+    u32 target1_addr =3D its_cmd_get_target_addr(its_cmd);
+    u32 target2_addr =3D its_cmd_mask_field(its_cmd, 3, 16, 32);
+    struct vcpu *vcpu1, *vcpu2;
+    struct vgic_irq *irq;
+    u32 *intids;
+    int irq_count, i;
+
+    if ( target1_addr >=3D d->max_vcpus || target2_addr >=3D d->max_vcpus =
)
+        return E_ITS_MOVALL_PROCNUM_OOR;
+
+    if ( target1_addr =3D=3D target2_addr )
+        return 0;
+
+    vcpu1     =3D d->vcpu[target1_addr];
+    vcpu2     =3D d->vcpu[target2_addr];
+
+    irq_count =3D vgic_copy_lpi_list(d, vcpu1, &intids);
+    if ( irq_count < 0 )
+        return irq_count;
+
+    for ( i =3D 0; i < irq_count; i++ )
+    {
+        irq =3D vgic_get_irq(d, NULL, intids[i]);
+
+        update_affinity(irq, vcpu2);
+
+        vgic_put_irq(d, irq);
+    }
+
+    vgic_its_invalidate_cache(d);
+
+    xfree(intids);
+    return 0;
+}
+
+int vgic_its_inv_lpi(struct domain *d, struct vgic_irq *irq)
+{
+    return update_lpi_config(d, irq, NULL, true);
+}
+
+/*
+ * The INV command syncs the configuration bits from the memory table.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_inv(struct domain *d, struct vgic_its *its,
+                                   u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    struct its_ite *ite;
+
+    ite =3D find_ite(its, device_id, event_id);
+    if ( !ite )
+        return E_ITS_INV_UNMAPPED_INTERRUPT;
+
+    return vgic_its_inv_lpi(d, ite->irq);
+}
+
+/**
+ * vgic_its_invall - invalidate all LPIs targetting a given vcpu
+ * @vcpu: the vcpu for which the RD is targetted by an invalidation
+ *
+ * Contrary to the INVALL command, this targets a RD instead of a
+ * collection, and we don't need to hold the its_lock, since no ITS is
+ * involved here.
+ */
+int vgic_its_invall(struct vcpu *vcpu)
+{
+    struct domain *d =3D vcpu->domain;
+    int irq_count, i =3D 0;
+    u32 *intids;
+
+    irq_count =3D vgic_copy_lpi_list(d, vcpu, &intids);
+    if ( irq_count < 0 )
+        return irq_count;
+
+    for ( i =3D 0; i < irq_count; i++ )
+    {
+        struct vgic_irq *irq =3D vgic_get_irq(d, NULL, intids[i]);
+        if ( !irq )
+            continue;
+        update_lpi_config(d, irq, vcpu, false);
+        vgic_put_irq(d, irq);
+    }
+
+    xfree(intids);
+    return 0;
+}
+
+/*
+ * The INVALL command requests flushing of all IRQ data in this collection=
.
+ * Find the VCPU mapped to that collection, then iterate over the VM's lis=
t
+ * of mapped LPIs and update the configuration for each IRQ which targets
+ * the specified vcpu. The configuration will be read from the in-memory
+ * configuration table.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_invall(struct domain *d, struct vgic_its *i=
ts,
+                                      u64 *its_cmd)
+{
+    u32 coll_id =3D its_cmd_get_collection(its_cmd);
+    struct its_collection *collection;
+    struct vcpu *vcpu;
+
+    collection =3D find_collection(its, coll_id);
+    if ( !its_is_collection_mapped(collection) )
+        return E_ITS_INVALL_UNMAPPED_COLLECTION;
+
+    vcpu =3D d->vcpu[collection->target_addr];
+    vgic_its_invall(vcpu);
+
+    return 0;
+}
+
 /*
  * This function is called with the its_cmd lock held, but the ITS data
  * structure lock dropped.
@@ -426,8 +1259,53 @@ void vgic_its_delete_device(struct domain *d, struct =
vgic_its_device *its_dev)
 static int vgic_its_handle_command(struct domain *d, struct vgic_its *its,
                                    u64 *its_cmd)
 {
+    int ret =3D -ENODEV;
+
+    spin_lock(&its->its_lock);
+    switch ( its_cmd_get_command(its_cmd) )
+    {
+    case GITS_CMD_MAPD:
+        ret =3D vgic_its_cmd_handle_mapd(d, its, its_cmd);
+        break;
+    case GITS_CMD_MAPC:
+        ret =3D vgic_its_cmd_handle_mapc(d, its, its_cmd);
+        break;
+    case GITS_CMD_MAPI:
+        ret =3D vgic_its_cmd_handle_mapi(d, its, its_cmd);
+        break;
+    case GITS_CMD_MAPTI:
+        ret =3D vgic_its_cmd_handle_mapi(d, its, its_cmd);
+        break;
+    case GITS_CMD_MOVI:
+        ret =3D vgic_its_cmd_handle_movi(d, its, its_cmd);
+        break;
+    case GITS_CMD_DISCARD:
+        ret =3D vgic_its_cmd_handle_discard(d, its, its_cmd);
+        break;
+    case GITS_CMD_CLEAR:
+        ret =3D vgic_its_cmd_handle_clear(d, its, its_cmd);
+        break;
+    case GITS_CMD_MOVALL:
+        ret =3D vgic_its_cmd_handle_movall(d, its, its_cmd);
+        break;
+    case GITS_CMD_INV:
+        ret =3D vgic_its_cmd_handle_inv(d, its, its_cmd);
+        break;
+    case GITS_CMD_INVALL:
+        ret =3D vgic_its_cmd_handle_invall(d, its, its_cmd);
+        break;
+    case GITS_CMD_SYNC:
+        /* we ignore this command: we are in sync all of the time */
+        ret =3D 0;
+        break;
+    default:
+        printk("Unknown GITS command\n");
+        ret =3D -EINVAL;
+        break;
+    }
+    spin_unlock(&its->its_lock);
=20
-    return -ENODEV;
+    return ret;
 }
=20
 #define ITS_CMD_BUFFER_SIZE(baser) ((((baser)&0xff) + 1) << 12)
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index a14b519f77..2bcc62432a 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -29,6 +29,7 @@
 #define IS_VGIC_ADDR_UNDEF(_x)  ((_x) =3D=3D VGIC_ADDR_UNDEF)
=20
 #define INTERRUPT_ID_BITS_SPIS  10
+#define INTERRUPT_ID_BITS_ITS   16
 #define VGIC_PRI_BITS       5
=20
 #define vgic_irq_is_sgi(intid) ((intid) < VGIC_NR_SGIS)
@@ -77,6 +78,7 @@ void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_i=
rq *irq, int lr);
 void vgic_v3_enable(struct vcpu *vcpu);
 int vgic_v3_map_resources(struct domain *d);
 bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr);
+bool vgic_lpis_enabled(struct vcpu *vcpu);
 unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
 int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 cou=
nt);
 int vgic_register_redist_iodev(struct vcpu *vcpu);
@@ -111,6 +113,10 @@ static inline int vgic_v3_set_redist_base(struct domai=
n *d, u32 index, u64 addr,
 {
     return 0;
 }
+static inline bool vgic_lpis_enabled(struct vcpu *vcpu)
+{
+    return false;
+}
 static inline int vgic_register_redist_iodev(struct vcpu *vcpu)
 {
     return 0;
--=20
2.34.1

