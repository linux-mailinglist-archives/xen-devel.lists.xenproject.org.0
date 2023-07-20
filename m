Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7675A376
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566264.884931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHbB-0003vZ-57; Thu, 20 Jul 2023 00:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566264.884931; Thu, 20 Jul 2023 00:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHbA-0003gc-Il; Thu, 20 Jul 2023 00:32:52 +0000
Received: by outflank-mailman (input) for mailman id 566264;
 Thu, 20 Jul 2023 00:32:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb5-0001JN-1B
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f145304a-2694-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:32:45 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JMeiBB017190
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:43 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgyx9k43-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:43 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:36 +0000
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
X-Inumbo-ID: f145304a-2694-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbmXx/22LKfQRQwLVu7oAp+Y09LuzEaKSN1INqGdI2J44hndpKNfevWbKi3DuHAyyQkXeBGvpJpY4RFOhEiEk55p3yVgwvUJZmeToiIrooS9HVYHQQIKcwiLbmZyclS4ihQgo22PAv3DbpNSajymtQvPEkHVzl7MnIyPafKzuiNEAzIV2/2+NxHUhem1AQfllvSVxfMLORxXsRiQMBqeF9ATu+ywKVJ//t383zISHbBIGshlxc3zlxuW0I+hIeHqzJfL+jbuCRBP8x2R6wZxL/OZKolihWYXmZLev2RwZJpEW8v2wvXdl51KUweKpLou3/Dvt0TShb6Uhetl9MvizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKI7dy86L8X5wiqLrmIlzaIxxL726p8ahnVAZh89ZZg=;
 b=WRll1E6h0KeiUgyUnJmi0g8d2h+oEznsETceUb6RfVNZjRrQQxKdXO/7z2PTfX7BxSLo3YZC48vPq5tKyeox5BIoiCuiAm3zSQnh1VDsxSl6BHhb5bmtK48Fx4dMAtmrTpP4dln1zUgXaCm9oysT9HF8lsLSwqYkCZBc3F/3KMj+AwpaR/C7seM1JmKDs0CwpT2R7tacW1PuWICA6L1g2IBTSFFHn5Dy5NykmAMGV9beiADuxwsr2IRdIV5EyLCXYVEJ13OpJXdX0e9yiuGbZMtp8HG0yi0B7yaAF85b2X9Qfxtc05cs4ua8t5meVdvEWCkTrEhbXJmH7gOxk1ciUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKI7dy86L8X5wiqLrmIlzaIxxL726p8ahnVAZh89ZZg=;
 b=P0D1qmX0OevASwK/CWkJ+A2BOFfgJpF6nIO5lrhNFxUdy3k0xoLilE+33Fe13qcP8IJA66dUktDFkd8enhonXJGWr0GzbgyzU/PZrMNSZcNkorGOo0nkgVAoLCEcBHxmweATXAj9oa8fOX+Uib1HgQdQ5hmAbnFyBerJzos6PsZPhB923WMTJyA0yWG3l8kO3tvX7Yo2uu+YRaQ2QIQQ1aGH5EVnQwxGL0LSJ181mbQmlFdRPCaXpZ48nvzvCUp1rahivn9cOvBychIamG4hLDTx2wCC0ZxqdWg6pJD7GDMOLQYetyjZY+gqx/CPA9hP4pC/dgDAPIosxuk4U3QP0A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: [PATCH v8 11/13] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v8 11/13] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHZuqGtdYewPbeaYUqE4k9SPFwhog==
Date: Thu, 20 Jul 2023 00:32:33 +0000
Message-ID: <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 40e488b3-4a91-452a-6e5e-08db88b8d0d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6PGJdDLYhXwsyvAPjswMBSvoufFZdqvQxN87xdbKiF+H5LDXpZbdP5fY8GoTtRLUNzDtbPLS1DCUz+BnAXeEjGsFhmm3xzYtO7IaqZ5cfeQYTZx3I9UroLTLwwPBgz2l9IV6P5tXXDUWN7FTRE0BvPYCWlER22Xs4RBdUmCjI/ubivr8ioEd+AN04giOXfEojChV9Z1VvumOQokyTAi3vh7eZfwxYni9ltpimeXM5tBQ9o0gPhw578Ewf+4VqSRNsEQ5j9dToaM1XYhx9EoUmmpIiMB9vzBtw2XXjeAcePCVoahs6LEXlTGp54CucpRO8k8LE0vUbjpMua0ItaqmVPvMszCLImpJh12pvSuJBFig601Pxfu6/EI1/ob3eYxYU/mj1Fo46ckbZgzLZuiAEGSgbqOo8RWsF4fY5Ss7Zh99K5tGW1cjb5uqpNrlDQN4NwGlMQj6apGtJj3eTWCT4q/v9G3a3C003taXWpZx0wrF5COKFvJrIiiN1rQzHbqdixEA345GiI1XGTYheWjPm0IZuVO9yKbIrX23pkEhVrkeoQh4E95PCp8vl1qdphKeeukQrXAfxkrNnZgb+tHL9lfOiEUEuUmNPGGFkCAbk9Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(6666004)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?36oUKNGtNs106p3sGC1Mt3qchr1vTDTf914cJKzkCaXH3M8CoDnK2k/yx3?=
 =?iso-8859-1?Q?eIQW+41w8IVJ45wQXB9ANB6MYV4t29rU18cz36BKytQR5G9SjKz+5BgHpX?=
 =?iso-8859-1?Q?3ZeyT2JPq4JkZfw6EyfZdVpDZnacJXhY5xcCZVBt9VjP8wrlL8FyDk0Ycw?=
 =?iso-8859-1?Q?cRL5vqcTOe/vM9TNLzLa981GdKd7K21twFV4ywFprFKMNMZajMqfvXOfvh?=
 =?iso-8859-1?Q?4xyR2p0msktZVnYJTrg83f6f9Z+IUqvyrTB0/hIhRxDVZ1p46VdIuFI/Lg?=
 =?iso-8859-1?Q?awwg0ADh8fspP6leo74Yybq4bEnqseAXAWWU6JPNt1qFmuTOUoC3z7ouZn?=
 =?iso-8859-1?Q?YcUVoU+R+zy/k6gfFqZUu2KDPQZtGOFo4dD/MvxEcie1HeOOvrbmpc2Tmp?=
 =?iso-8859-1?Q?zKDVajTqhpBoGE2w3VOL6soo7mNZxmsiytYslpLwAjl5Sq3rP0/wOPf9s6?=
 =?iso-8859-1?Q?FAUw47CPBfNnI4O14NH6KAomaourvgmIDN2+2wZpphN9soNKtRHe5rXlce?=
 =?iso-8859-1?Q?+/YJ5fHF5XexcmAAALo9vCoUOGesnPEHRFcqXoco9UqeNdq1erxNoe+k/x?=
 =?iso-8859-1?Q?5o63sjtzVMpxfRrJbfBBEj/DMD18MbPhilM/HZPrpcGUxCFbUsle+JLfFF?=
 =?iso-8859-1?Q?QLTN6botHSDlM4TK8f3ziiqiCihknqeB2xvN1bDfxnxz6vZl+HD+0TAkLo?=
 =?iso-8859-1?Q?o8gdQ0GR8bG1MbIbpz1qttfCY1VgGizEO6MUSg2QUQGN8p9QRfpqECWDJK?=
 =?iso-8859-1?Q?0MyTsUXwSbpLPvjqe9ZHrop1z2w8LrN1oO046PrJLJShJyprOYa4maLlUy?=
 =?iso-8859-1?Q?8f6mCp4upjV6L/rBppqJ4OcvGaTKISGC825gIpwHElnM69PF3CeAexJRQU?=
 =?iso-8859-1?Q?meF1q+YL/wNyOxQT+csUmN2iFTUErkr1DUj8ojRdQ0bDgjeTd27y4o4l/F?=
 =?iso-8859-1?Q?zhrKT+vBjaRS5O5MPYwnelaOzGMTvOtmfgtbwsEFNuFAiLtEeoupcopmaH?=
 =?iso-8859-1?Q?VOFi5RvM+zGM0D+gaV95MZeOSzh5cVXAKhF4vRDBLvraJ+OtsTfobFkrUN?=
 =?iso-8859-1?Q?5fpe0Ty4RGXXqutfLveH86xRCmJinHwIld+ACbSWw+ZjtBCsxH5uz0IjfT?=
 =?iso-8859-1?Q?otMBLWRMG/Fr8vVlV11bVosHZq7skcysJ4ifcRWw9RZXrCQmffLWrrPNus?=
 =?iso-8859-1?Q?Yd6TgpN2/lYuHNJPirFjN1tDKv3p4neNTSCMTSY4ELP1IFNQnNVPXDOq9N?=
 =?iso-8859-1?Q?IA3LneR7H2lq4RXAG9QpVTN9bIqFbdEa0whHVkXEugSYmz8N/5H32GuZDv?=
 =?iso-8859-1?Q?cxOE5Sk9MflUbK4y8Km2JgYs8VuVtWxV/rz08RuXa/Jf42jL2SZ5cWdY8s?=
 =?iso-8859-1?Q?DagDvGuK9rpWw9bHFqHQNyv0Wg9pCKv2fgGmw1Hv3iE0NekMdDd0XLjhWy?=
 =?iso-8859-1?Q?BZpRaulHSssEPHwkfp2KweMt24kXXHBChKZCOq/IoetmFv+3z9FlbbeoH/?=
 =?iso-8859-1?Q?AZvn0vJsjL9RBHPjMsVghWjiOAKwluC7krf5LmOBFLlv8MQ4KcyBLo2GRV?=
 =?iso-8859-1?Q?l46q6301n22XkIqLuXp/Nw01SZx2fwGT41t5FuXWbpzmkbiLyKwJbJAq+V?=
 =?iso-8859-1?Q?KZh4FgqlcpdBZBRbkPU6AjPHlavlRwlqAB7fJzM+t/SbUYQMmDZZP/mA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e488b3-4a91-452a-6e5e-08db88b8d0d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:34.0150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k84+8ahfRZfxLDIqeXyM/qpkacYmv3X1KEXBSPF3Lj8xewp0T4Uc/22arBwdoywXsURyeQsYFBDdpPIl3aI0NbjIFv/0HB4nAACfIZtVxH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: q9JJ6ULmBvRj2LdFzvGmWJYkebN7q3t-
X-Proofpoint-GUID: q9JJ6ULmBvRj2LdFzvGmWJYkebN7q3t-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Assign SBDF to the PCI devices being passed through with bus 0.
The resulting topology is where PCIe devices reside on the bus 0 of the
root complex itself (embedded endpoints).
This implementation is limited to 32 devices which are allowed on
a single PCI bus.

Please note, that at the moment only function 0 of a multifunction
device can be passed through.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v8:
- Added write lock in add_virtual_device
Since v6:
- re-work wrt new locking scheme
- OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
Since v5:
- s/vpci_add_virtual_device/add_virtual_device and make it static
- call add_virtual_device from vpci_assign_device and do not use
  REGISTER_VPCI_INIT machinery
- add pcidevs_locked ASSERT
- use DECLARE_BITMAP for vpci_dev_assigned_map
Since v4:
- moved and re-worked guest sbdf initializers
- s/set_bit/__set_bit
- s/clear_bit/__clear_bit
- minor comment fix s/Virtual/Guest/
- added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
  later for counting the number of MMIO handlers required for a guest
  (Julien)
Since v3:
 - make use of VPCI_INIT
 - moved all new code to vpci.c which belongs to it
 - changed open-coded 31 to PCI_SLOT(~0)
 - added comments and code to reject multifunction devices with
   functions other than 0
 - updated comment about vpci_dev_next and made it unsigned int
 - implement roll back in case of error while assigning/deassigning devices
 - s/dom%pd/%pd
Since v2:
 - remove casts that are (a) malformed and (b) unnecessary
 - add new line for better readability
 - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
    functions are now completely gated with this config
 - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/drivers/vpci/vpci.c | 72 ++++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/sched.h |  8 +++++
 xen/include/xen/vpci.h  | 11 +++++++
 3 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index ca3505ecb7..baaafe4a2a 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -46,6 +46,16 @@ void vpci_remove_device(struct pci_dev *pdev)
         return;
=20
     spin_lock(&pdev->vpci->lock);
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    if ( pdev->vpci->guest_sbdf.sbdf !=3D ~0 )
+    {
+        __clear_bit(pdev->vpci->guest_sbdf.dev,
+                    &pdev->domain->vpci_dev_assigned_map);
+        pdev->vpci->guest_sbdf.sbdf =3D ~0;
+    }
+#endif
+
     while ( !list_empty(&pdev->vpci->handlers) )
     {
         struct vpci_register *r =3D list_first_entry(&pdev->vpci->handlers=
,
@@ -101,6 +111,10 @@ int vpci_add_handlers(struct pci_dev *pdev)
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    pdev->vpci->guest_sbdf.sbdf =3D ~0;
+#endif
+
     for ( i =3D 0; i < NUM_VPCI_INIT; i++ )
     {
         rc =3D __start_vpci_array[i](pdev);
@@ -115,6 +129,54 @@ int vpci_add_handlers(struct pci_dev *pdev)
 }
=20
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static int add_virtual_device(struct pci_dev *pdev)
+{
+    struct domain *d =3D pdev->domain;
+    pci_sbdf_t sbdf =3D { 0 };
+    unsigned long new_dev_number;
+
+    if ( is_hardware_domain(d) )
+        return 0;
+
+    ASSERT(pcidevs_locked());
+
+    /*
+     * Each PCI bus supports 32 devices/slots at max or up to 256 when
+     * there are multi-function ones which are not yet supported.
+     */
+    if ( pdev->info.is_extfn )
+    {
+        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n=
",
+                 &pdev->sbdf);
+        return -EOPNOTSUPP;
+    }
+
+    write_lock(&pdev->domain->pci_lock);
+    new_dev_number =3D find_first_zero_bit(d->vpci_dev_assigned_map,
+                                         VPCI_MAX_VIRT_DEV);
+    if ( new_dev_number >=3D VPCI_MAX_VIRT_DEV )
+    {
+        write_unlock(&pdev->domain->pci_lock);
+        return -ENOSPC;
+    }
+
+    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
+
+    /*
+     * Both segment and bus number are 0:
+     *  - we emulate a single host bridge for the guest, e.g. segment 0
+     *  - with bus 0 the virtual devices are seen as embedded
+     *    endpoints behind the root complex
+     *
+     * TODO: add support for multi-function devices.
+     */
+    sbdf.devfn =3D PCI_DEVFN(new_dev_number, 0);
+    pdev->vpci->guest_sbdf =3D sbdf;
+    write_unlock(&pdev->domain->pci_lock);
+
+    return 0;
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct pci_dev *pdev)
 {
@@ -125,8 +187,16 @@ int vpci_assign_device(struct pci_dev *pdev)
=20
     rc =3D vpci_add_handlers(pdev);
     if ( rc )
-        vpci_deassign_device(pdev);
+        goto fail;
+
+    rc =3D add_virtual_device(pdev);
+    if ( rc )
+        goto fail;
+
+    return 0;
=20
+ fail:
+    vpci_deassign_device(pdev);
     return rc;
 }
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 80dd150bbf..478bd21f3e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -461,6 +461,14 @@ struct domain
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
     rwlock_t pci_lock;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * The bitmap which shows which device numbers are already used by the
+     * virtual PCI bus topology and is used to assign a unique SBDF to the
+     * next passed through virtual PCI device.
+     */
+    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
+#endif
 #endif
=20
 #ifdef CONFIG_HAS_PASSTHROUGH
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6099d2141d..c55c45f7a1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
=20
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
=20
+/*
+ * Maximum number of devices supported by the virtual bus topology:
+ * each PCI bus supports 32 devices/slots at max or up to 256 when
+ * there are multi-function ones which are not yet supported.
+ */
+#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
+
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) =3D x
@@ -155,6 +162,10 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /* Guest SBDF of the device. */
+    pci_sbdf_t guest_sbdf;
+#endif
 #endif
 };
=20
--=20
2.41.0

