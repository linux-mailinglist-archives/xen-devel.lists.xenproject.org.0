Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C372F7E7C4E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630296.983030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3w-00029R-05; Fri, 10 Nov 2023 12:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630296.983030; Fri, 10 Nov 2023 12:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3v-00022z-Sh; Fri, 10 Nov 2023 12:56:39 +0000
Received: by outflank-mailman (input) for mailman id 630296;
 Fri, 10 Nov 2023 12:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3t-0001y1-MW
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93cf96c8-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:35 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACHnNa029602; Fri, 10 Nov 2023 12:56:21 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3u93ptjrx7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8783.eurprd03.prod.outlook.com
 (2603:10a6:20b:53c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:16 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:16 +0000
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
X-Inumbo-ID: 93cf96c8-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdtsONKBPTAQF/pR2X/ZJtWkq4brKn3cvUmnuwV8F13iZA4kgn+TpEVZ70ucl8dSRSbkcWfIcYHdE+0XKI7xh7BeTyncl8Ea+oJworOf/j/SEJ6UKgVfRf3nXVoliIeX2O+zf3yUsrMYJ9MmJXO2uwaaiaqMfn1++eFsc0STD7L+q11qje2g7HIorpq9rtzXaGcy0S0nQ9SCY63lnXzO2w+2r5vgA2A+yOU1/oyxBqTS0OIm5dtQCdasikgWHy/68UBgAY4BcOIS9bSUE0EGx3l43E2McPqHFJ1bIP63suAGU05ZXmuH2SnzI7ON42697xzSSwu7JO36ASZs+3RQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pZ3SAQZXGyPa2UCSbq4AipLK56hM+8f7efoATgbaI8=;
 b=h4Uw5UKssbQ0zIhWU8q/ffdt42EwRN37Hd5kVArHwFl/Is6MpzoSlJ5T1O5hV5d1zMHRnWXajfQxZwAnI4I3dQHcYXnKkRQ2e+wsXE9ufruUloKYmhL5e2uZD2aWRNcMomrlld++OBkL5E1fgy7Ncn5fmEp+7hCRhxR0hNHFV5UAIMSNQS1Vx2eBab3JaTcmzONBqEzIdCnp8nZt9z0vPStUgHAskIyUJ9nStMPql9eJ8NMr9ecXi9WxwftiTd6hkzSH+Zts8pkxjh9SAX0CJxkhwJRlIGi+7RXzpy7VWFIBGeqSU2Xgp3dKi1OrWXdLGAZ9gYNB3G6E67SNCumLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pZ3SAQZXGyPa2UCSbq4AipLK56hM+8f7efoATgbaI8=;
 b=WUXKhtEjJpwaD6kGyn/oIIiETCOQX3/xGHNXOrNnVU4novnNBPA6BkJXcrvMEfMtSKYwRnDJCOBfjr37XGSdrw9qmnBKNKfGPt+mGtl0JWOZxS/3NmdnqtcTu4v4BZ36oEaYg547QT3l+JcvdNoIyL2eE6wWaaK+sC5tdUvZ2VHt22lIeOwX+PFnxhdphqhiJQ0lb0pD9e1qEaMgEsfo7IRSR4z2YMsnrAsdABEjuepJxF07uXfilTg7jtMvxGbO0qvk8W7kJRDr1TfhNUWevOanqPmukduauDn+G2x0cxJOVHqdsNtTVIJgC0cs9JZXuXmaeTJ24tELoWBm6tiDyQ==
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
Subject: [XEN PATCH v2 01/25] arm: vgic: its: Decouple HW and virtual ITS
Thread-Topic: [XEN PATCH v2 01/25] arm: vgic: its: Decouple HW and virtual ITS
Thread-Index: AQHaE9VKJzT3WLMhY0WmBXZ4tHLu5w==
Date: Fri, 10 Nov 2023 12:56:16 +0000
Message-ID: 
 <8907b54a03f07bb1f7d4563839aefefe8f5041e3.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8783:EE_
x-ms-office365-filtering-correlation-id: bb7614e5-ee24-4b9d-5a03-08dbe1ec6d1a
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 d4FOnl8jG6yn3bqdYOqiNWXIC+rcmKc/szbtyzXhLuE75ZMvw/aCp+0NSANa3Wg0BK2UITKvWnJwpxJ2abwBPd6qBeqkE53sbvnLndD8R6d5OtqzXG+BRJYOvif1PseVZlhw/Hp1J6qFrBrNb051Tp0wmg0qn5VGkuziu58OtGyaai94UN3UCu8u+sjZtpOdv5VjSYJ594BMdNfuk9Qfs4Nl93oJDnujmae+O4WyBt9teRLJazPt6HNzRWnEe+rCHYfEbOhOvhG52nVcv96RkqIJcnTzqAoz3MIzaC9Hje2qREyaVJAoS5JVAiODqcSnZmKhYslGEoD+Qpj2HERybagen2qlEBQoPx/9wTznZ+RZ9VB4AwjaxkTt1RuJxoTkLCD/qHVktIAMfjuoWNcjRetuk95Cq4W9Zccy5StLjUO6VC40vHpdHLF+e4ggh6+MM6h6f1LlQPsF+GbMw/RJSJtasY323echsr+deyJhqNLBEau86f5UR2JpxuxRz0LUiUYfmobqpknjWuqPjmTiS6hUmAiptSsnq5YlT22nV9clnWfz6FdaPYU72yPIpurRuZgAKexsj3nbpS5oWGk6gUCipzSkSFzFdBjQr5bgLuFiuWZd7blR8pfA3jrFuif9XHMFOdMYQQnlhoJNAEw6xA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(5660300002)(64756008)(66446008)(66556008)(316002)(66476007)(54906003)(91956017)(76116006)(66946007)(2616005)(6916009)(26005)(4326008)(83380400001)(38070700009)(8676002)(8936002)(122000001)(6512007)(2906002)(6506007)(38100700002)(6486002)(478600001)(41300700001)(966005)(71200400001)(36756003)(86362001)(30864003)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?YIRLGMRYlNJCY8ej/xACHM7Vsql1Tm80CC0lUTZKND3GL2WiAsjuFTadyM?=
 =?iso-8859-1?Q?RZioTF5wLnupZPbOe0qnVoYeWv5UBjjArrOXbK10HWtyWtImwFhI+1R6E0?=
 =?iso-8859-1?Q?c4g0vXdTa9IKpTwgMKCWZoQl48gES32HTX1EDIZFokVZFvZCRXs5XjPN/9?=
 =?iso-8859-1?Q?0tzGj60ZDeEZhh6L0tDF4e9seJp419MYC/XZy/3lf4b2jf+ozLJHzQ9qct?=
 =?iso-8859-1?Q?pD/7XZDgxQmAB3lirvu2biJI8nOSolki/kES5rqGDLPOwwOY8bfbQSeHA+?=
 =?iso-8859-1?Q?0/UWvHXXPEjEvQRnfZzFzOQ1aLuoAbYaboGBTQp9gLrTc5AmN+jSEUJIRD?=
 =?iso-8859-1?Q?GLAGVqxQ/MXMZqnCFl/8DlRMnYBFqJza00FvFF97w1hHPDImtwcifBP6LX?=
 =?iso-8859-1?Q?EvrCvY0ysNEz0Js6k2/bgYeqNywxKN/1N+XV4RVO7+M7uynVgs3aU+0EEt?=
 =?iso-8859-1?Q?3Y2EeWmuhixPcpkLO8z8yDFSbmEC8X/Z57Cla4dt7jsmCTe06HFjWx87JC?=
 =?iso-8859-1?Q?q+/JURsvxKMJ63Js7DtA1bkli/yZ6uEdBO/8NyNLnNKunTadWpPrligoia?=
 =?iso-8859-1?Q?94ncu5Skh5NAiPtXtyGo0A2sc++vm0iSIO3a0EaKL1B2DWe55tQK1NxCJz?=
 =?iso-8859-1?Q?BF8IHNMuwZCqIfcGmndjA7ThlDBN1d0QvwSKQVCT9YodrAESeSke4YwMLv?=
 =?iso-8859-1?Q?7z+5eSob+tv1dqd9hQ+3de3fwTzIpjxH76Ip5+TiXFl8UFAXvg43kpCEff?=
 =?iso-8859-1?Q?ZFJNw/xC0wPa6LWFK3RjQ+kXFZ/FUEL/VbQMqZSYJ9g9RuNFKdq2INTcKI?=
 =?iso-8859-1?Q?QBOQEaHQLnXtFhvsHfK6JVDjLea9DejfTGtv8pBKWo3OPA+nujcmi3Y5Um?=
 =?iso-8859-1?Q?e5sddQRahin4TR1XrxykpJG5yXZ6F6v6+YArk2hpZMRu6JHW3A70W1qBAk?=
 =?iso-8859-1?Q?/B2lojtaKWmLVm5UPiIy6VFJlGBGvgnaADf4bx+V/XqJT5wrNr7+I0ADqS?=
 =?iso-8859-1?Q?zkpNONmRoRsLGxJNYBB2d7fCbF6UhYvwx6QpdpnaJwnlf3PXSXI2eROs42?=
 =?iso-8859-1?Q?BLV645bcH93D3c7NgxGHLFB0mhvIKqAZh4Hg090bNn6+O3lhRBYqVQb5UL?=
 =?iso-8859-1?Q?r4o5BJdHU4D/IoY6Ra4Fwp9zw9CVO502gKwvcih1+ls+zr4uNgzCHwHLWn?=
 =?iso-8859-1?Q?ZEasJk4vwiXoFDT5OLZujanyfxfubs7sHzR5+GNdOaDFN1NiK8OQIC9W5z?=
 =?iso-8859-1?Q?oi0YhyD6XINBHPex9Bq1aHAX6vkPYmEf8EGMIWCHoh4WGnbTu2XiUww6XQ?=
 =?iso-8859-1?Q?ZuRtVmJNFO+2kYfI1evOST1yjwEluYXuvuSOMPdszB+x0gSizyN0QxhDHC?=
 =?iso-8859-1?Q?FHL4Ko5zGv2w4LrIC0SLffnlHOeaeOPY/zv8GmIA3j0T4aO9yFrBGCUQFM?=
 =?iso-8859-1?Q?Ebir9CWv8wFaWqZ/jH/uKJJnBaSp9wC+0YttI6hvolM4WY3roDuxCK4Zr7?=
 =?iso-8859-1?Q?Xtr5rs6Etd8Haew+21bjmY7/hbIFt39V1sdA4XcHSxcppaJ8oG9d+jYxXH?=
 =?iso-8859-1?Q?6d+U/B0CzA8po7fTaCy1b6p2wWv8SshoeXtH4HqPdLhAAs5cc7r/8j3AhQ?=
 =?iso-8859-1?Q?8cHRAQ+EgSOEuc3Dpt0wrPD8uqoD10Uh+eqrB0rQKPFW39DY6sygDdNQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7614e5-ee24-4b9d-5a03-08dbe1ec6d1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:16.1645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8E1uBP2ke6boTsKsMms6w0rNULhHWuZvwbx9AcT8wnvQ/wVRID9TXXM6HJwJ5hND4ZlndvkfFYB6phQmVXf5kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8783
X-Proofpoint-ORIG-GUID: DG_Zy7cMUP2PRH1GvgU_jqcS1RNgOdtS
X-Proofpoint-GUID: DG_Zy7cMUP2PRH1GvgU_jqcS1RNgOdtS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 mlxlogscore=604
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

HW its directly uses struct pending_irq which makes it hard to swich to
a different VITS implementation if it doesn't use the same structure.

Rename struct its_device to struct vgic_its_device and move it to vgic.h,
so it can be defined by the VITS implementation. Add helper functions to
allow HW ITS to allocate/free and manage the instances this struct. This
seems like a sane approach, since the instances are already stored in the
struct vgic. Also move vgic_vcpu_inject_lpi to the vgic files for the same
reasons.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c             | 208 ++++----------------------
 xen/arch/arm/gic-v3-lpi.c             |  20 ---
 xen/arch/arm/include/asm/gic_v3_its.h |   2 +
 xen/arch/arm/include/asm/vgic.h       |  29 ++++
 xen/arch/arm/vgic-v3-its.c            | 206 ++++++++++++++++++++++++-
 5 files changed, 258 insertions(+), 207 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 8afcd9783b..cc3d82cde1 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -13,7 +13,6 @@
 #include <xen/iocap.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
-#include <xen/rbtree.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
 #include <asm/gic.h>
@@ -30,25 +29,6 @@
  */
 LIST_HEAD(host_its_list);
=20
-/*
- * Describes a device which is using the ITS and is used by a guest.
- * Since device IDs are per ITS (in contrast to vLPIs, which are per
- * guest), we have to differentiate between different virtual ITSes.
- * We use the doorbell address here, since this is a nice architectural
- * property of MSIs in general and we can easily get to the base address
- * of the ITS and look that up.
- */
-struct its_device {
-    struct rb_node rbnode;
-    struct host_its *hw_its;
-    void *itt_addr;
-    paddr_t guest_doorbell;             /* Identifies the virtual ITS */
-    uint32_t host_devid;
-    uint32_t guest_devid;
-    uint32_t eventids;                  /* Number of event IDs (MSIs) */
-    uint32_t *host_lpi_blocks;          /* Which LPIs are used on the host=
 */
-    struct pending_irq *pend_irqs;      /* One struct per event */
-};
=20
 bool gicv3_its_host_has_its(void)
 {
@@ -509,7 +489,7 @@ static int gicv3_its_init_single_its(struct host_its *h=
w_its)
  * TODO: Investigate the interaction when a guest removes a device while
  * some LPIs are still in flight.
  */
-static int remove_mapped_guest_device(struct its_device *dev)
+static int remove_mapped_guest_device(struct vgic_its_device *dev)
 {
     int ret =3D 0;
     unsigned int i;
@@ -530,10 +510,7 @@ static int remove_mapped_guest_device(struct its_devic=
e *dev)
         printk(XENLOG_WARNING "Can't unmap host ITS device 0x%x\n",
                dev->host_devid);
=20
-    xfree(dev->itt_addr);
-    xfree(dev->pend_irqs);
-    xfree(dev->host_lpi_blocks);
-    xfree(dev);
+    vgic_its_free_device(dev);
=20
     return 0;
 }
@@ -551,24 +528,6 @@ static struct host_its *gicv3_its_find_by_doorbell(pad=
dr_t doorbell_address)
     return NULL;
 }
=20
-static int compare_its_guest_devices(struct its_device *dev,
-                                     paddr_t vdoorbell, uint32_t vdevid)
-{
-    if ( dev->guest_doorbell < vdoorbell )
-        return -1;
-
-    if ( dev->guest_doorbell > vdoorbell )
-        return 1;
-
-    if ( dev->guest_devid < vdevid )
-        return -1;
-
-    if ( dev->guest_devid > vdevid )
-        return 1;
-
-    return 0;
-}
-
 /*
  * On the host ITS @its, map @nr_events consecutive LPIs.
  * The mapping connects a device @devid and event @eventid pair to LPI @lp=
i,
@@ -616,8 +575,7 @@ int gicv3_its_map_guest_device(struct domain *d,
 {
     void *itt_addr =3D NULL;
     struct host_its *hw_its;
-    struct its_device *dev =3D NULL;
-    struct rb_node **new =3D &d->arch.vgic.its_devices.rb_node, *parent =
=3D NULL;
+    struct vgic_its_device *temp, *dev =3D NULL;
     int i, ret =3D -ENOENT;      /* "i" must be signed to check for >=3D 0=
 below. */
=20
     hw_its =3D gicv3_its_find_by_doorbell(host_doorbell);
@@ -643,36 +601,22 @@ int gicv3_its_map_guest_device(struct domain *d,
=20
     /* check for already existing mappings */
     spin_lock(&d->arch.vgic.its_devices_lock);
-    while ( *new )
+    temp =3D vgic_its_get_device(d, guest_doorbell, guest_devid);
+    if ( temp )
     {
-        struct its_device *temp;
-        int cmp;
+        if ( !valid )
+            vgic_its_delete_device(d, temp);
=20
-        temp =3D rb_entry(*new, struct its_device, rbnode);
+        spin_unlock(&d->arch.vgic.its_devices_lock);
=20
-        parent =3D *new;
-        cmp =3D compare_its_guest_devices(temp, guest_doorbell, guest_devi=
d);
-        if ( !cmp )
+        if ( valid )
         {
-            if ( !valid )
-                rb_erase(&temp->rbnode, &d->arch.vgic.its_devices);
-
-            spin_unlock(&d->arch.vgic.its_devices_lock);
-
-            if ( valid )
-            {
-                printk(XENLOG_G_WARNING "d%d tried to remap guest ITS devi=
ce 0x%x to host device 0x%x\n",
-                        d->domain_id, guest_devid, host_devid);
-                return -EBUSY;
-            }
-
-            return remove_mapped_guest_device(temp);
+            printk(XENLOG_G_WARNING "d%d tried to remap guest ITS device 0=
x%x to host device 0x%x\n",
+                    d->domain_id, guest_devid, host_devid);
+            return -EBUSY;
         }
=20
-        if ( cmp > 0 )
-            new =3D &((*new)->rb_left);
-        else
-            new =3D &((*new)->rb_right);
+        return remove_mapped_guest_device(temp);
     }
=20
     if ( !valid )
@@ -688,7 +632,7 @@ int gicv3_its_map_guest_device(struct domain *d,
     clean_and_invalidate_dcache_va_range(itt_addr,
                                          nr_events * hw_its->itte_size);
=20
-    dev =3D xzalloc(struct its_device);
+    dev =3D vgic_its_alloc_device(nr_events);
     if ( !dev )
         goto out_unlock;
=20
@@ -704,13 +648,6 @@ int gicv3_its_map_guest_device(struct domain *d,
      * See the mailing list discussion for some background:
      * https://lists.xen.org/archives/html/xen-devel/2017-03/msg03645.html
      */
-    dev->pend_irqs =3D xzalloc_array(struct pending_irq, nr_events);
-    if ( !dev->pend_irqs )
-        goto out_unlock;
-
-    dev->host_lpi_blocks =3D xzalloc_array(uint32_t, nr_events);
-    if ( !dev->host_lpi_blocks )
-        goto out_unlock;
=20
     ret =3D its_send_cmd_mapd(hw_its, host_devid, fls(nr_events - 1),
                             virt_to_maddr(itt_addr), true);
@@ -724,8 +661,7 @@ int gicv3_its_map_guest_device(struct domain *d,
     dev->host_devid =3D host_devid;
     dev->eventids =3D nr_events;
=20
-    rb_link_node(&dev->rbnode, parent, new);
-    rb_insert_color(&dev->rbnode, &d->arch.vgic.its_devices);
+    vgic_its_add_device(d, dev);
=20
     spin_unlock(&d->arch.vgic.its_devices_lock);
=20
@@ -771,117 +707,27 @@ out_unlock:
=20
 out:
     if ( dev )
-    {
-        xfree(dev->pend_irqs);
-        xfree(dev->host_lpi_blocks);
-    }
+        vgic_its_free_device(dev);
+
     xfree(itt_addr);
-    xfree(dev);
=20
     return ret;
 }
=20
-/* Must be called with the its_device_lock held. */
-static struct its_device *get_its_device(struct domain *d, paddr_t vdoorbe=
ll,
-                                         uint32_t vdevid)
-{
-    struct rb_node *node =3D d->arch.vgic.its_devices.rb_node;
-    struct its_device *dev;
-
-    ASSERT(spin_is_locked(&d->arch.vgic.its_devices_lock));
-
-    while (node)
-    {
-        int cmp;
-
-        dev =3D rb_entry(node, struct its_device, rbnode);
-        cmp =3D compare_its_guest_devices(dev, vdoorbell, vdevid);
-
-        if ( !cmp )
-            return dev;
-
-        if ( cmp > 0 )
-            node =3D node->rb_left;
-        else
-            node =3D node->rb_right;
-    }
-
-    return NULL;
-}
-
-static struct pending_irq *get_event_pending_irq(struct domain *d,
-                                                 paddr_t vdoorbell_address=
,
-                                                 uint32_t vdevid,
-                                                 uint32_t eventid,
-                                                 uint32_t *host_lpi)
-{
-    struct its_device *dev;
-    struct pending_irq *pirq =3D NULL;
-
-    spin_lock(&d->arch.vgic.its_devices_lock);
-    dev =3D get_its_device(d, vdoorbell_address, vdevid);
-    if ( dev && eventid < dev->eventids )
-    {
-        pirq =3D &dev->pend_irqs[eventid];
-        if ( host_lpi )
-            *host_lpi =3D dev->host_lpi_blocks[eventid / LPI_BLOCK] +
-                        (eventid % LPI_BLOCK);
-    }
-    spin_unlock(&d->arch.vgic.its_devices_lock);
-
-    return pirq;
-}
-
-struct pending_irq *gicv3_its_get_event_pending_irq(struct domain *d,
-                                                    paddr_t vdoorbell_addr=
ess,
-                                                    uint32_t vdevid,
-                                                    uint32_t eventid)
-{
-    return get_event_pending_irq(d, vdoorbell_address, vdevid, eventid, NU=
LL);
-}
-
-int gicv3_remove_guest_event(struct domain *d, paddr_t vdoorbell_address,
-                             uint32_t vdevid, uint32_t eventid)
+uint32_t gicv3_its_get_host_lpi(struct domain *d, paddr_t vdoorbell_addres=
s,
+                                     uint32_t vdevid, uint32_t eventid)
 {
+    struct vgic_its_device *dev;
     uint32_t host_lpi =3D INVALID_LPI;
=20
-    if ( !get_event_pending_irq(d, vdoorbell_address, vdevid, eventid,
-                                &host_lpi) )
-        return -EINVAL;
-
-    if ( host_lpi =3D=3D INVALID_LPI )
-        return -EINVAL;
-
-    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
-
-    return 0;
-}
-
-/*
- * Connects the event ID for an already assigned device to the given VCPU/=
vLPI
- * pair. The corresponding physical LPI is already mapped on the host side
- * (when assigning the physical device to the guest), so we just connect t=
he
- * target VCPU/vLPI pair to that interrupt to inject it properly if it fir=
es.
- * Returns a pointer to the already allocated struct pending_irq that is
- * meant to be used by that event.
- */
-struct pending_irq *gicv3_assign_guest_event(struct domain *d,
-                                             paddr_t vdoorbell_address,
-                                             uint32_t vdevid, uint32_t eve=
ntid,
-                                             uint32_t virt_lpi)
-{
-    struct pending_irq *pirq;
-    uint32_t host_lpi =3D INVALID_LPI;
-
-    pirq =3D get_event_pending_irq(d, vdoorbell_address, vdevid, eventid,
-                                 &host_lpi);
-
-    if ( !pirq )
-        return NULL;
-
-    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, virt_lpi);
+    spin_lock(&d->arch.vgic.its_devices_lock);
+    dev =3D vgic_its_get_device(d, vdoorbell_address, vdevid);
+    if ( dev )
+        host_lpi =3D dev->host_lpi_blocks[eventid / LPI_BLOCK] +
+                   (eventid % LPI_BLOCK);
=20
-    return pirq;
+    spin_unlock(&d->arch.vgic.its_devices_lock);
+    return host_lpi;
 }
=20
 int gicv3_its_deny_access(struct domain *d)
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index eb0a5535e4..5f73b2b9f2 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -128,26 +128,6 @@ uint64_t gicv3_get_redist_address(unsigned int cpu, bo=
ol use_pta)
         return per_cpu(lpi_redist, cpu).redist_id << 16;
 }
=20
-void vgic_vcpu_inject_lpi(struct domain *d, unsigned int virq)
-{
-    /*
-     * TODO: this assumes that the struct pending_irq stays valid all of
-     * the time. We cannot properly protect this with the current locking
-     * scheme, but the future per-IRQ lock will solve this problem.
-     */
-    struct pending_irq *p =3D irq_to_pending(d->vcpu[0], virq);
-    unsigned int vcpu_id;
-
-    if ( !p )
-        return;
-
-    vcpu_id =3D ACCESS_ONCE(p->lpi_vcpu_id);
-    if ( vcpu_id >=3D d->max_vcpus )
-          return;
-
-    vgic_inject_irq(d, d->vcpu[vcpu_id], virq, true);
-}
-
 /*
  * Handle incoming LPIs, which are a bit special, because they are potenti=
ally
  * numerous and also only get injected into guests. Treat them specially h=
ere,
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index c24d4752d0..f61a37a8fa 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -196,6 +196,8 @@ struct pending_irq *gicv3_assign_guest_event(struct dom=
ain *d,
                                              uint32_t virt_lpi);
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
+uint32_t gicv3_its_get_host_lpi(struct domain *d, paddr_t vdoorbell_addres=
s,
+                                     uint32_t vdevid, uint32_t eventid);
=20
 #else
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 922779ce14..56a3b6f828 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -317,6 +317,35 @@ extern bool vgic_migrate_irq(struct vcpu *old, struct =
vcpu *new, unsigned int ir
 extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu=
 *v,
                                              unsigned int rank, uint32_t r=
);
=20
+#ifdef CONFIG_HAS_ITS
+/*
+ * Describes a device which is using the ITS and is used by a guest.
+ * Since device IDs are per ITS (in contrast to vLPIs, which are per
+ * guest), we have to differentiate between different virtual ITSes.
+ * We use the doorbell address here, since this is a nice architectural
+ * property of MSIs in general and we can easily get to the base address
+ * of the ITS and look that up.
+ */
+struct vgic_its_device {
+    struct rb_node rbnode;
+    struct host_its *hw_its;
+    void *itt_addr;
+    paddr_t guest_doorbell;             /* Identifies the virtual ITS */
+    uint32_t host_devid;
+    uint32_t guest_devid;
+    uint32_t eventids;                  /* Number of event IDs (MSIs) */
+    uint32_t *host_lpi_blocks;          /* Which LPIs are used on the host=
 */
+    struct pending_irq *pend_irqs;      /* One struct per event */
+};
+
+struct vgic_its_device *vgic_its_alloc_device(int nr_events);
+void vgic_its_free_device(struct vgic_its_device *its_dev);
+int vgic_its_add_device(struct domain *d, struct vgic_its_device *its_dev)=
;
+void vgic_its_delete_device(struct domain *d, struct vgic_its_device *its_=
dev);
+struct vgic_its_device* vgic_its_get_device(struct domain *d, paddr_t vdoo=
rbell,
+                                         uint32_t vdevid);
+#endif /* CONFIG_HAS_ITS */
+
 #endif /* !CONFIG_NEW_VGIC */
=20
 /*** Common VGIC functions used by Xen arch code ****/
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 05429030b5..0d839f3fa4 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -266,6 +266,200 @@ static bool write_itte(struct virt_its *its, uint32_t=
 devid,
     return true;
 }
=20
+static struct pending_irq *get_event_pending_irq(struct domain *d,
+                                                 paddr_t vdoorbell_address=
,
+                                                 uint32_t vdevid,
+                                                 uint32_t eventid)
+{
+    struct vgic_its_device *dev;
+    struct pending_irq *pirq =3D NULL;
+
+    spin_lock(&d->arch.vgic.its_devices_lock);
+    dev =3D vgic_its_get_device(d, vdoorbell_address, vdevid);
+    if ( dev && eventid < dev->eventids )
+        pirq =3D &dev->pend_irqs[eventid];
+
+    spin_unlock(&d->arch.vgic.its_devices_lock);
+
+    return pirq;
+}
+
+static int remove_guest_event(struct domain *d, paddr_t vdoorbell_address,
+                             uint32_t vdevid, uint32_t eventid)
+{
+    uint32_t host_lpi =3D INVALID_LPI;
+
+    host_lpi =3D gicv3_its_get_host_lpi(d, vdoorbell_address, vdevid, even=
tid);
+    if ( host_lpi =3D=3D INVALID_LPI )
+        return -EINVAL;
+
+    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
+
+    return 0;
+}
+
+/*
+ * Connects the event ID for an already assigned device to the given VCPU/=
vLPI
+ * pair. The corresponding physical LPI is already mapped on the host side
+ * (when assigning the physical device to the guest), so we just connect t=
he
+ * target VCPU/vLPI pair to that interrupt to inject it properly if it fir=
es.
+ * Returns a pointer to the already allocated struct pending_irq that is
+ * meant to be used by that event.
+ */
+static struct pending_irq *assign_guest_event(struct domain *d,
+                                             paddr_t vdoorbell_address,
+                                             uint32_t vdevid, uint32_t eve=
ntid,
+                                             uint32_t virt_lpi)
+{
+    struct pending_irq *pirq;
+    uint32_t host_lpi =3D INVALID_LPI;
+
+    host_lpi =3D gicv3_its_get_host_lpi(d, vdoorbell_address, vdevid, even=
tid);
+    if ( host_lpi =3D=3D INVALID_LPI )
+        return NULL;
+    pirq =3D get_event_pending_irq(d, vdoorbell_address, vdevid, eventid);
+    if ( !pirq )
+        return NULL;
+
+    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, virt_lpi);
+
+    return pirq;
+}
+
+static int compare_its_guest_devices(struct vgic_its_device *dev,
+                                     paddr_t vdoorbell, uint32_t vdevid)
+{
+    if ( dev->guest_doorbell < vdoorbell )
+        return -1;
+
+    if ( dev->guest_doorbell > vdoorbell )
+        return 1;
+
+    if ( dev->guest_devid < vdevid )
+        return -1;
+
+    if ( dev->guest_devid > vdevid )
+        return 1;
+
+    return 0;
+}
+
+/* Must be called with the its_device_lock held. */
+struct vgic_its_device *vgic_its_get_device(struct domain *d, paddr_t vdoo=
rbell,
+                                         uint32_t vdevid)
+{
+    struct rb_node *node =3D d->arch.vgic.its_devices.rb_node;
+    struct vgic_its_device *dev;
+
+    ASSERT(spin_is_locked(&d->arch.vgic.its_devices_lock));
+
+    while (node)
+    {
+        int cmp;
+
+        dev =3D rb_entry(node, struct vgic_its_device, rbnode);
+        cmp =3D compare_its_guest_devices(dev, vdoorbell, vdevid);
+
+        if ( !cmp )
+            return dev;
+
+        if ( cmp > 0 )
+            node =3D node->rb_left;
+        else
+            node =3D node->rb_right;
+    }
+
+    return NULL;
+}
+
+struct vgic_its_device *vgic_its_alloc_device(int nr_events)
+{
+    struct vgic_its_device *dev;
+
+    dev =3D xzalloc(struct vgic_its_device);
+    if ( !dev )
+        goto fail;
+
+    dev->pend_irqs =3D xzalloc_array(struct pending_irq, nr_events);
+    if ( !dev->pend_irqs )
+        goto fail_pend;
+
+    dev->host_lpi_blocks =3D xzalloc_array(uint32_t, nr_events);
+    if ( !dev->host_lpi_blocks )
+        goto fail_host_lpi;
+   =20
+    return dev;
+fail_host_lpi:
+    xfree(dev->pend_irqs);
+fail_pend:
+    xfree(dev);
+fail:
+    return NULL;
+}
+
+void vgic_its_free_device(struct vgic_its_device *its_dev)
+{
+    xfree(its_dev->pend_irqs);
+    xfree(its_dev->host_lpi_blocks);
+    xfree(its_dev);
+}
+
+int vgic_its_add_device(struct domain *d, struct vgic_its_device *its_dev)
+{
+    struct rb_node **new =3D &d->arch.vgic.its_devices.rb_node, *parent =
=3D NULL;
+    while ( *new )
+    {
+        struct vgic_its_device *temp;
+        int cmp;
+
+        temp =3D rb_entry(*new, struct vgic_its_device, rbnode);
+
+        parent =3D *new;
+        cmp =3D compare_its_guest_devices(temp, its_dev->guest_doorbell,
+                                        its_dev->guest_devid);
+        if ( !cmp )
+        {
+            printk(XENLOG_ERR "Trying to add an already existing ITS devic=
e vdoorbell %lx vdevid %d\n",=20
+                its_dev->guest_doorbell, its_dev->guest_devid);
+            return -EINVAL;
+        }
+
+        if ( cmp > 0 )
+            new =3D &((*new)->rb_left);
+        else
+            new =3D &((*new)->rb_right);
+    }
+
+    rb_link_node(&its_dev->rbnode, parent, new);
+    rb_insert_color(&its_dev->rbnode, &d->arch.vgic.its_devices);
+    return 0;
+}
+
+void vgic_its_delete_device(struct domain *d, struct vgic_its_device *its_=
dev)
+{
+    rb_erase(&its_dev->rbnode, &d->arch.vgic.its_devices);
+}
+
+void vgic_vcpu_inject_lpi(struct domain *d, unsigned int virq)
+{
+    /*
+     * TODO: this assumes that the struct pending_irq stays valid all of
+     * the time. We cannot properly protect this with the current locking
+     * scheme, but the future per-IRQ lock will solve this problem.
+     */
+    struct pending_irq *p =3D irq_to_pending(d->vcpu[0], virq);
+    unsigned int vcpu_id;
+
+    if ( !p )
+        return;
+
+    vcpu_id =3D ACCESS_ONCE(p->lpi_vcpu_id);
+    if ( vcpu_id >=3D d->max_vcpus )
+          return;
+
+    vgic_inject_irq(d, d->vcpu[vcpu_id], virq, true);
+}
+
 /**************************************
  * Functions that handle ITS commands *
  **************************************/
@@ -349,7 +543,7 @@ static int its_handle_clear(struct virt_its *its, uint6=
4_t *cmdptr)
     if ( !read_itte(its, devid, eventid, &vcpu, &vlpi) )
         goto out_unlock;
=20
-    p =3D gicv3_its_get_event_pending_irq(its->d, its->doorbell_address,
+    p =3D get_event_pending_irq(its->d, its->doorbell_address,
                                         devid, eventid);
     /* Protect against an invalid LPI number. */
     if ( unlikely(!p) )
@@ -471,7 +665,7 @@ static int its_handle_inv(struct virt_its *its, uint64_=
t *cmdptr)
     if ( vlpi =3D=3D INVALID_LPI )
         goto out_unlock_its;
=20
-    p =3D gicv3_its_get_event_pending_irq(d, its->doorbell_address,
+    p =3D get_event_pending_irq(d, its->doorbell_address,
                                         devid, eventid);
     if ( unlikely(!p) )
         goto out_unlock_its;
@@ -615,7 +809,7 @@ static int its_discard_event(struct virt_its *its,
     spin_unlock_irqrestore(&vcpu->arch.vgic.lock, flags);
=20
     /* Remove the corresponding host LPI entry */
-    return gicv3_remove_guest_event(its->d, its->doorbell_address,
+    return remove_guest_event(its->d, its->doorbell_address,
                                     vdevid, vevid);
 }
=20
@@ -744,7 +938,7 @@ static int its_handle_mapti(struct virt_its *its, uint6=
4_t *cmdptr)
      * determined by the same device ID and event ID on the host side.
      * This returns us the corresponding, still unused pending_irq.
      */
-    pirq =3D gicv3_assign_guest_event(its->d, its->doorbell_address,
+    pirq =3D assign_guest_event(its->d, its->doorbell_address,
                                     devid, eventid, intid);
     if ( !pirq )
         goto out_remove_mapping;
@@ -785,7 +979,7 @@ static int its_handle_mapti(struct virt_its *its, uint6=
4_t *cmdptr)
      * cleanup and return an error here in any case.
      */
 out_remove_host_entry:
-    gicv3_remove_guest_event(its->d, its->doorbell_address, devid, eventid=
);
+    remove_guest_event(its->d, its->doorbell_address, devid, eventid);
=20
 out_remove_mapping:
     spin_lock(&its->its_lock);
@@ -819,7 +1013,7 @@ static int its_handle_movi(struct virt_its *its, uint6=
4_t *cmdptr)
     if ( !nvcpu )
         goto out_unlock;
=20
-    p =3D gicv3_its_get_event_pending_irq(its->d, its->doorbell_address,
+    p =3D get_event_pending_irq(its->d, its->doorbell_address,
                                         devid, eventid);
     if ( unlikely(!p) )
         goto out_unlock;
--=20
2.34.1

