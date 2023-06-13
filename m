Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89072DF93
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548010.855817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Kb-0004yw-54; Tue, 13 Jun 2023 10:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548010.855817; Tue, 13 Jun 2023 10:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Ka-0004qw-Rh; Tue, 13 Jun 2023 10:32:56 +0000
Received: by outflank-mailman (input) for mailman id 548010;
 Tue, 13 Jun 2023 10:32:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KZ-0001im-2G
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:55 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a61e7bc9-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:32:52 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D6YVNm012776; Tue, 13 Jun 2023 10:32:41 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3r63wtu7t4-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:41 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6520.eurprd03.prod.outlook.com (2603:10a6:10:19d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 10:32:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:34 +0000
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
X-Inumbo-ID: a61e7bc9-09d5-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erYGgcVaq8sCLME4yLu0RupUF6ma//sPm7x8PVqzRxfuPqVJvYtqW3QS35jR2x1NVIr6UJdmjJZaMWwGB1Yxp5aVEvOC2jVInATHGnRbJ69S4pi9SMRjw2d66ksAJwXtduGzkj+KV9VHvfV8ECYNm/R9lSpX+i9GZzaupE99iqEr/4M2nmqFmIJJb9POOPelP3hCJ5WiQnRrRtw8iELVfGJLCKla1jni1yyuKM4Zu3bB5LxQxVOFusEeSYWttt/31cabcQmudpEocfT9qPSTwWqSvaYuyNCVdii5g+bDRGB6SLfhoVsrCqT4L9cyh/cxMxLB43qjdtyYYuo3u/5owQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu9nYGTzKNJyaJivkA/1i+SwTC+5h8xHonD698eXMgE=;
 b=YbKmgdO5I2dHVD4hSth8LVzTmyyXhOJoUdSyTWXlIzoQdjyu5sU/g9zPmbzhwdg+2I34gWzEFt6MM0ISFopI+Tv+Alo6mbiwZU52QEUtb7OUNEb1Y7hNRAUjuQUVJcpV0TaPQKR7Q6xrVcgjcIfKc+Sq2ChsD7LtTKwkNnyu98z8r7/k14FpA/qat6S3sXQ1pZMIafjBrscWlTKIjlPXi+7E7eGgwkiu/eQS1tkOktGSOT0mHQQt4BFmNKEzLQUyoCIuhRalif93atDS2kDvpQ4K5bAfpVN0bQ+/K8au8gfpbP2Ybr8NXpYyPGF1KQYDB/yYLnQO4qKCREO/8Zwyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu9nYGTzKNJyaJivkA/1i+SwTC+5h8xHonD698eXMgE=;
 b=fAgPH2+Qmosdlflm0jek7vKYBFFotrMhnB2PTdb1p6Qheh/59ub49VBrQj3kDVCgwnR45q1nor78jNy1JmEG0xN5Lk3r14lboP4d4gjU7GubXf4cT8vugi/0j9NwRbFGEkCEptrDqa0kCAWvBbDdlGKjNT283eVunVKvDLAWfLnVeihSzBnEvN6/qF53dE7Vxw1a6RmGfhKoFG9NIuFdeqA2zN/T6O8k31RKseReF+R+RT+YD0yl4Kq+bBXs0hKj4S7t+2tc8kCMMrRy0EDpdKvFJu7WIEEg3o3tKBq4fwlp2BdnBiTnChqPd4Fmhb2S/1BE9azTg/vR/oKWfXKiPQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v7 10/12] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v7 10/12] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHZneJaL+74dDpvwk6p5MTZEcUOhg==
Date: Tue, 13 Jun 2023 10:32:29 +0000
Message-ID: <20230613103159.524763-11-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6520:EE_
x-ms-office365-filtering-correlation-id: da98dc9c-ebf3-452e-a8a1-08db6bf98013
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g7SUrKsJ+EPYjtIadrZMznmzpgAjwFmC3Eh90FdW/XTHW2SlzoGI54q1LVk7Z48FBynbzyd44cZxod4B22dI7cQeeDwg+3fD0FEU0UuxIv1VEdETebFG59Br1FtUE6wV1bYqe0Idbr+XgWlwWDNZjd0UsjFcc6rgo3zSlbD5chRoc7F9zly0nx6NS86jaZvpk7H1ep1Y2f9kuHbhgqExjR4EqT+6qeUVN94a/rmrTvjDgx/Swnz87vGgF8ux78xI33JESbiGJDg2r4qFJUjthd0k9MX3Sp+Oh0Usj2uBa9SU1Q6WtGmPpvKS6BbxOZNTjja2rP4QABWLc/HPcSuSKeaMKLqiHzBvclnbojBaZtN0+XdSa76TeehkBAcOgz01cZI6bfRXCv7l8yD0CQu2pGrbkhIJgqf2ao6mKeQ74V0OIb6P5QWWbmPXSsQs5flOq/DyH/IdJsDQujoetvW5saQXHbXsCwcNbL7rmfUV2ns6Qgi34jEL43Z6iJ1lcqNaA6GEdgLviApiC1A9Zr5XN3VHZdzgiJvq89RIVao9E8d6f63iuuuuC2Y/WtdpUIHNrycUPR2HQgHisSfyA5S67HPQba8F01moyzTNBMZ94SjrITQ5aUplDzVggGmbN4tI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(6486002)(6666004)(6512007)(36756003)(83380400001)(2616005)(38100700002)(86362001)(38070700005)(122000001)(55236004)(1076003)(6506007)(26005)(186003)(2906002)(66446008)(66476007)(5660300002)(54906003)(8936002)(8676002)(316002)(41300700001)(6916009)(4326008)(66946007)(66556008)(76116006)(91956017)(71200400001)(64756008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tCTa99BURWbrfdkk5sk5LZOgz8y/YRvg/PB/q3A4GsSDF9ojTiY1Lonqgr?=
 =?iso-8859-1?Q?xj2bpToznNkHl4mEONXc6oMll2F6seUPKRpikXSMY20i/NNq/OnoabnbE8?=
 =?iso-8859-1?Q?Iy+n1WcA3UWdBbgNNWtCzyW35/LTVLj/Zcnzj3lvd81wJHA+5WIz2WlJ7U?=
 =?iso-8859-1?Q?LSKFL4UiinstbcFSw/M0RXXatr4yGA/WGIM/lVt1YrTDaFRmKp1PlC5z8U?=
 =?iso-8859-1?Q?Jhlq87q9oZdtCCoX5LNIRbTqaSeLdcE3G1tOQAz5q+yrh4WNnx3rftx+7c?=
 =?iso-8859-1?Q?y0ud+zVZf2/AaXneeaAvan1Hb+gWwdinNH/8zKgKVBjPekx/af9fW0icA7?=
 =?iso-8859-1?Q?7DhrIlmth6SRmPnZjoQBSxW6fk/ug0YlpLTkV0gMkK9n4QPmuJ7o/KdpWV?=
 =?iso-8859-1?Q?WllGD53g/JSAhY8lTMYobLI49y5xgJpT0BcZ+yCzUxbyIvI3hPFXz90HIg?=
 =?iso-8859-1?Q?/Yb2IC18hw0Sn91yqWbLIP/0bnGh6adWK3EvuCb6Wsujh3Wv341WpFVx0n?=
 =?iso-8859-1?Q?rFRp3MQs5XW/v5cGjPLNE5q0OiA5t6ifQ10u2ltWkgtyoJyfK1qFJxWdbr?=
 =?iso-8859-1?Q?8wxqZws9zfDtsegf43w30QRqn0SGDjmhSZjT6T0lN6rIz3ykxA7J6Ue07B?=
 =?iso-8859-1?Q?L2V+TPVD0fPn4mlkwszvuoGyUCBfRf8pKXic2LEb4fp9f5QdxViVjb+D2n?=
 =?iso-8859-1?Q?bNRwceO1OtCVg1Ou8FF3uHHFN1sDpUWY0KXadm3JlHtMbtBoa8pZRSlmL6?=
 =?iso-8859-1?Q?IGxw+fX+0e1LKfFgoWNgEVkUtGySNVcbMsYHALeJ05PjF1H+FF9p79f0t5?=
 =?iso-8859-1?Q?q86OmeXa2L2dg+A5fBNT+jUk5KgXzpw1DbfuZc5aqL2dp2eYa5l6KcTklE?=
 =?iso-8859-1?Q?mbl8mM/Manm6JpPb79WItaLKtoPJ0UNiyEZIJZMOisCcmZ3KI5E/1ZPKxz?=
 =?iso-8859-1?Q?15OmCilNg+/BkmFPr/mTyKNq0Td62WhGRJgMNHoO1wiIsw12zQ2Qgs1LV6?=
 =?iso-8859-1?Q?J6jf4CZDoTWtQFqQiSwtdf7fs5bkju6rqgaEW2urFYvNJNkGRnAWXVZ8ay?=
 =?iso-8859-1?Q?ZObkgE1Lzrr8GVXeSauKetEdxFmDxqDgoxor3+86zasvLKLisPt6zNWvlg?=
 =?iso-8859-1?Q?GI5U/aVrlAIZdx+5wWKuV5FZ00tMJ2tVngHm6ZmS8x7Bnu/4t0ly2xXKD0?=
 =?iso-8859-1?Q?Inyh/MGRR8Jqk9uNvRikmzC188yncqz2beezY9udLTinLbLx6+fDPh5dzd?=
 =?iso-8859-1?Q?kaZs5uTlIWQct6KZ1TFuD3JYKtwrbE6vhKi9L7uFWgJ+AlsVxBLGOnjYn5?=
 =?iso-8859-1?Q?9McmDRNHRA6o6p6BXg+PwWxBJH67oA0Jocsw+38ZaVxo2rrIcZn/Cz6204?=
 =?iso-8859-1?Q?9v7bDLBF6xEOOOikS4hT08oPWdLxNKX0lVyREhTzUy4tc6P6cgjV3horFz?=
 =?iso-8859-1?Q?2SSx4DsnL1+ieek9FavLzAzQBjdggC3mOlscE+av9LdtqbUMVAhiZI/uKb?=
 =?iso-8859-1?Q?GasHld0j6VdbOfITp2j9YEre6EO1MLlI105jGciS+RB/A9CKwgEdbsZwa/?=
 =?iso-8859-1?Q?PzzHFK9ZfLub190ymoRvkyBzCQjWMBZC5NboPukwcfgFg/FJEA87wbb4GJ?=
 =?iso-8859-1?Q?76FjZIx0au06fD+InXXnNv8P+JqVIby9JgVJgVdAHw5xoUXf3kDeHsvg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da98dc9c-ebf3-452e-a8a1-08db6bf98013
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:29.6922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hncphYA7eJcfvmPdHIs3M9ueIZ6XudQ356cKp3IoZxcvwAA7OhaVKsTGe4TRhWLRZWVU3YWAhvSm2eK8Q963dKKagKKvNRWejai4/4UKt3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6520
X-Proofpoint-GUID: uirJe6HoIbNriTB80PtcRSnsSMXvlJWS
X-Proofpoint-ORIG-GUID: uirJe6HoIbNriTB80PtcRSnsSMXvlJWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130093

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
Since v6:
- re-work wrt new locking scheme
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
 xen/drivers/vpci/vpci.c | 70 ++++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/sched.h |  8 +++++
 xen/include/xen/vpci.h  | 11 +++++++
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index b542ddaf7b..9dacb70bf3 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -98,6 +98,9 @@ int vpci_add_handlers(struct pci_dev *pdev)
=20
     INIT_LIST_HEAD(&vpci->handlers);
     spin_lock_init(&vpci->lock);
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    vpci->guest_sbdf.sbdf =3D ~0;
+#endif
=20
     write_lock(&pdev->domain->vpci_rwlock);
=20
@@ -121,6 +124,62 @@ int vpci_add_handlers(struct pci_dev *pdev)
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
+    new_dev_number =3D find_first_zero_bit(d->vpci_dev_assigned_map,
+                                         VPCI_MAX_VIRT_DEV);
+    if ( new_dev_number >=3D VPCI_MAX_VIRT_DEV )
+        return -ENOSPC;
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
+
+    return 0;
+
+}
+
+static void vpci_remove_virtual_device(const struct pci_dev *pdev)
+{
+    write_lock(&pdev->domain->vpci_rwlock);
+    if ( pdev->vpci )
+    {
+        __clear_bit(pdev->vpci->guest_sbdf.dev,
+                    &pdev->domain->vpci_dev_assigned_map);
+        pdev->vpci->guest_sbdf.sbdf =3D ~0;
+    }
+    write_unlock(&pdev->domain->vpci_rwlock);
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct pci_dev *pdev)
 {
@@ -131,8 +190,16 @@ int vpci_assign_device(struct pci_dev *pdev)
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
=20
@@ -142,6 +209,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
     if ( !has_vpci(pdev->domain) )
         return;
=20
+    vpci_remove_virtual_device(pdev);
     vpci_remove_device(pdev);
 }
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 78227b7a1d..312a692b31 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -463,6 +463,14 @@ struct domain
 #ifdef CONFIG_HAS_VPCI
     rwlock_t vpci_rwlock;
 #endif
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
index fe100a8cb7..3cb5d63e84 100644
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
@@ -160,6 +167,10 @@ struct vpci {
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
2.40.1

