Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EBE7A612F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 13:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604613.942109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYur-0001Mj-7b; Tue, 19 Sep 2023 11:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604613.942109; Tue, 19 Sep 2023 11:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYur-0001J4-49; Tue, 19 Sep 2023 11:29:17 +0000
Received: by outflank-mailman (input) for mailman id 604613;
 Tue, 19 Sep 2023 11:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kB+/=FD=epam.com=prvs=36266dbb07=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qiYuq-0000lK-2p
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 11:29:16 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c23e9537-56df-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 13:29:14 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38J96Sw3020876; Tue, 19 Sep 2023 11:29:01 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3t6svwkjpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 11:29:00 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB10084.eurprd03.prod.outlook.com (2603:10a6:20b:628::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Tue, 19 Sep
 2023 11:28:54 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:28:54 +0000
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
X-Inumbo-ID: c23e9537-56df-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLilNPs08Rt5sVq9NO42OZoTSwkgK5uDt4fZnKYKm4+7qnyRZxDQJXhC80Z9mhl28gLZMO4E8e3E1HsWwr/BEPQsfh2c/pIEHfmTxBg6RyzpLBtAw4g4Cwl38pSyLhTqiSq4D2RZ1qyRpmEaRl8ExoEAp/zEoeVSRWTLKMHobhGZCFogCYdJr1PoYDfDhrNU0WKMY05q15qk62jAydi/1kfbnpjBe7MrzHeXgKCkRec31Sf70U3mjMDFzQUdgcvk2rN8P1qWL/49I+ep59rylOhbC3rENMqVSlhB+EuUyn9n9L+vChMkV+wUeocc3Ol3puwbDtRs0ADindPj0ESZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vycq55yyF/QobazNLsdJUrh48/zGTDw3M4nyqu5b+3Q=;
 b=feTZZ5s8ZlVbO54lbEIHuEKZM/jSyJVpM75Xx/6T75iNFuQq9SiBdFv5+abn9oYA9OgT29PO3MpP/SRcjhQHCbB2GMTuFOvQlW70f7r+J4AR0szwhVwlbciyANKioa/6KjbfrPiTkKYdv/w51hulTuIFcu1uoct0m0FmJ9ZAJ4U7E9xAKSzhejAdHlID8warX+SX6ydoZg0EwjMhBdRHDK3vCbatyNieEUdpTN/4r1QiCSa80KhqWdSEnNfib1V0au/6q2N5mZAW7yrk+vC8Wh+YkDXr6CsBRAfNF+N8eA+q2lkygwW2CfpSurApO6qvs/iYFStaHFSBulGYHZpA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vycq55yyF/QobazNLsdJUrh48/zGTDw3M4nyqu5b+3Q=;
 b=ajSvkxzqSqY85FRBIZEt35GfPuHRtlfLTaOCYCvhmiuVvOyV8PYw7IYjBKcce+R3pCtu07Dnh/wM9tvgXAd3fF4KaO3xqXiAkssSUgWelWs2AeIXzEtXsgKv90AzLosX7Ir8MF2Lx9iODJC0n+s5J1b5d6YdfaM+NBYGeDkCjlFVGazcBjTbUMqmcwwlHF8K63PHZf4P08sU8iF8ivmSJKP3ejQWkSZyaa+MCdTgMfvUBZ2fKVMpAcHWAeElwcZ15CeGrVSXYwgcRXFIiIaHvibq+I6onaYN11jBTanyHCfpHkUy/37K4FQxv680iXk5UgGta114bbruoNTTDuANIA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 3/3] ARM: GICv3 ITS: flush all buffers, not just command
 queue
Thread-Topic: [PATCH v1 3/3] ARM: GICv3 ITS: flush all buffers, not just
 command queue
Thread-Index: AQHZ6ux4dm5WVFL9oEWSe/DtwdZNSQ==
Date: Tue, 19 Sep 2023 11:28:54 +0000
Message-ID: <20230919112827.1001484-4-volodymyr_babchuk@epam.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB10084:EE_
x-ms-office365-filtering-correlation-id: e2be28a8-fdb2-49e0-6b84-08dbb9039b5d
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OmDpnRZajfAXFSPnKAUaHQe3riayWjcqt9ur1ZkjxHkqUmguwhwDg+kDhdM4KqXvg5CNglMwjePy0NGOQVa07CRukoGwM8ceVe4J6BnjYx7wfKv52lRF9WvZlSyvdi/LGF/WbqydXUgf89kGCsjQ6rf4ZpO0E2YJ8a/U99pdZo6f30T7txmBfa6N4EJgoWNTcV7jecGRUAZRWz8/XzNuaha5mEkyzXiAlywX6XCx29pM98eptt2eJ+q15DnfI3yuCUYHQdB+nRJ3CXH4PM7irXdyoG8GwoaVvSrA+arIppU7fzc+m4OaHVwalfM35XR2YqugT0XW1YYP/dbq6p8yJIc8YTiPoreGmtKX5453zxC+0h+kedFAm0KA8F7qh/+SiXRMVGPwEdygrzmK79vkIQOl6Qpy425zrc/YAfBxGPAQYtGB4ZZAM1eoMvzY+2Wj/ob2PD19W5rR8C3oAbeuOvNxjl2PBlGWITblMk07/wUCSOkh1F8/8G49pjdHgmbRx9BBOSaHMGj6AoSuKHLWspNxCJDq2jvcDt0bI3mMaecLysqS2ZgZaqaa/6XpLaJO0ZOV/rUfz8PYLMud4qMN+1nA6Z+zHe80FYJK7n2DQnpUzkJ9NbYfOC//CbUlbVmS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(186009)(451199024)(1800799009)(66946007)(6486002)(66476007)(6916009)(71200400001)(26005)(107886003)(316002)(2616005)(1076003)(83380400001)(54906003)(41300700001)(76116006)(64756008)(66556008)(91956017)(8936002)(5660300002)(2906002)(55236004)(4326008)(6512007)(8676002)(66446008)(6506007)(478600001)(86362001)(122000001)(38070700005)(36756003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Fa37Lm0MCmMb/EikYOj/ESEnnK8kwLQ0zEkowfQM4myGFfHHGgXlRNh+Lx?=
 =?iso-8859-1?Q?I6YEs+hRWgdCytSkOlMJBGAaMaE2ZPX9IVSznKDK2HurH6PJ8w1rgbpY4q?=
 =?iso-8859-1?Q?d9nh9YDYhJVDf4CIL4AVTykgA69aqJUQfcv4DL4ifSHVb/NTgR297KBu+Y?=
 =?iso-8859-1?Q?LJ6S7GvJRK66cb+hVBKo/FVnX+vb/6m7W0cNp7797KRpxalVuh1tucj5eN?=
 =?iso-8859-1?Q?1XZNY2hRx4Qvt5yDosvwvHeWCV6rTrR+16hywv85H89qM2S3F2AP5XctLF?=
 =?iso-8859-1?Q?BYs30RXaGgPjB9mZwt/Dvz0FLWRhT3W+ufOEyjRzDNdjHZVRs9mjSW8Jcv?=
 =?iso-8859-1?Q?Fo5iwLtERHIO8qKXz+5p0ymnCZY1mlC05o1vnIYVyvOHHAragXQj+F8a6s?=
 =?iso-8859-1?Q?hE4o1zPbweV+at5hmDTg7gN+4/2RxIaiLSN1qEXE7oaRrjP0IZZSdPvhu0?=
 =?iso-8859-1?Q?EqcqHjpr6msOZEuy4VF97PNOUq8RzGyISrctppo21aEcKf2s6g2zSKr+0U?=
 =?iso-8859-1?Q?kgynwKffmc56b87rKUpJMopgkFow8FHKtBOhKaZVb8Vz9De+G7vy5BVPmq?=
 =?iso-8859-1?Q?EJrkr3i1u49gZbennnSwI4T7/W9EcDxAOBPNCujQJrusZ8BHnwvS5wwrZQ?=
 =?iso-8859-1?Q?gjx5qJWQg0gfw/6J4jiCIjAf++KrtKg6zS1F8vDEvn6KJw1Q+W46KXRL7t?=
 =?iso-8859-1?Q?SwcW51ackjt+XdKdEKFVebkRpDNj6jz94c20lFXg//oeJXqGlF0jMkZSm0?=
 =?iso-8859-1?Q?Obspkj+vAJXeDtqqovsR7Hu5eR8s1C67ctL9jCjghZwiSy2K7WMMl74XYM?=
 =?iso-8859-1?Q?VksKUZnh4ywGMjq3AymEi+TTvaVQ54vfP8VNuQ1ESTWIgAr4OX62V5UNih?=
 =?iso-8859-1?Q?bBzWe3tdYusc20BzOcA2lRcVYJ3bk9dKEmcVkFj1WE/cUf8/IbhJUv5tYv?=
 =?iso-8859-1?Q?vo1sZVCrnmmlSzNGZ3o0LJT+CGIOmd18S8U0Xw7tsSJ72IzE8y7IGuesKI?=
 =?iso-8859-1?Q?Rxro99nYDXW1FcbBwXpS+ALwnKd6K1djNRkmZQGhPlQuknCDWCn6SOENLt?=
 =?iso-8859-1?Q?gLUnfgnaKoBYuHHUkh0+QW8H3CsvUj2CSdnnXG/k7ZI9NBR4Ny/5cdGeuP?=
 =?iso-8859-1?Q?oJ9f7eCCRh+VEG7xzUnIz8gr1ZNzSRfrM6D6d5GCHT25u1Zx/+0MmmLls5?=
 =?iso-8859-1?Q?B2W+KiAQ666Ehye+mpWlgbW8ODnSjQ2YwqOzfCAEZk1P+082J0dLlOkbCC?=
 =?iso-8859-1?Q?FfUcpqYHk9wMeU3c6tw0UUQkQYT7Hc0mZeJIpUbf5/Ss1jVsVLb2E8N/eC?=
 =?iso-8859-1?Q?bRxfXw/7oZsjGtQFLut0l0TMSh7bYZ1UgGPkq7Yu+P4kyhPaMbc9SwG1qC?=
 =?iso-8859-1?Q?8nCgErEaiwTZqh2o+G1n+opB+LQ93zMzX4E5xKT3BKaaapjhnbWgLSRP2U?=
 =?iso-8859-1?Q?HBcjarFlbuv+jE585Ro2FTYOA+A1b7mnIl43roVBABRfRrYkWpiCwKJ3yE?=
 =?iso-8859-1?Q?jEda6PYwUQbbQhexe82Kv2fb7QmVCvBEQo4qvXzCn4chuKJFmWnfXPFV+O?=
 =?iso-8859-1?Q?lwnfx1ce4na75L3x0mJaaYT7LPndHfJZ9xjdkbwzyaBnnOXuW7rO983ubM?=
 =?iso-8859-1?Q?NzRs+Y0+Iate3hZeX0pbyXr0aB29Z8nkJSDyqss++b+x26qxczXdTllg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2be28a8-fdb2-49e0-6b84-08dbb9039b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 11:28:54.5092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QdavZeij+eUIVipIDoku9YFA8ussAVa7n1jH5Nl9lx7xaatsh6C92uxqwZ1HyKHRBVFA2mLkklRhkE4T6SljDmxXxIHX3z+U4kkHDZDQ7bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10084
X-Proofpoint-GUID: Ve8vldBqljse1F1dPvwJX1gPRQji5fHG
X-Proofpoint-ORIG-GUID: Ve8vldBqljse1F1dPvwJX1gPRQji5fHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190097

ITS manages Device Tables and Interrupt Translation Tables on its own,
so generally we are not interested which shareability and cacheability
attributes it uses. But there is one exception: ITS requires that DT
and ITT must be initialized with zeroes. If ITS belongs to the Inner
Cacheability domain there is no problem at all.

But in all other cases we need to do clean CPU caches manually, or
otherwise CPU can overwrite DT and ITT entries. From user perspective
this looks like interrupts are not delivered from a device.

Also, we will rename HOST_ITS_FLUSH_CMD_QUEUE flag to
HOST_ITS_FLUSH_BUFFERS because now this flag controls not only command
queue.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/gic-v3-its.c             | 7 +++++--
 xen/arch/arm/include/asm/gic_v3_its.h | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 72cf318810..63e28a7706 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -107,7 +107,7 @@ static int its_send_command(struct host_its *hw_its, co=
nst void *its_cmd)
     }
=20
     memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
-    if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
+    if ( hw_its->flags & HOST_ITS_FLUSH_BUFFERS )
         clean_dcache_va_range(hw_its->cmd_buf + writep, ITS_CMD_SIZE);
     else
         dsb(ishst);
@@ -335,7 +335,7 @@ static void *its_map_cbaser(struct host_its *its)
      */
     if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
     {
-        its->flags |=3D HOST_ITS_FLUSH_CMD_QUEUE;
+        its->flags |=3D HOST_ITS_FLUSH_BUFFERS;
         printk(XENLOG_WARNING "using non-cacheable ITS command queue\n");
     }
=20
@@ -699,6 +699,9 @@ int gicv3_its_map_guest_device(struct domain *d,
     if ( !itt_addr )
         goto out_unlock;
=20
+    if ( hw_its->flags & HOST_ITS_FLUSH_BUFFERS )
+        clean_dcache_va_range(itt_addr, nr_events * hw_its->itte_size);
+
     dev =3D xzalloc(struct its_device);
     if ( !dev )
         goto out_unlock;
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index c24d4752d0..460b008db5 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -107,7 +107,7 @@
 #include <xen/device_tree.h>
 #include <xen/rbtree.h>
=20
-#define HOST_ITS_FLUSH_CMD_QUEUE        (1U << 0)
+#define HOST_ITS_FLUSH_BUFFERS          (1U << 0)
 #define HOST_ITS_USES_PTA               (1U << 1)
=20
 /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhe=
ad. */
--=20
2.42.0

