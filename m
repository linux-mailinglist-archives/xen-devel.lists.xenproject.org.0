Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167505A7FA1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395683.635493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR1-0002oh-5w; Wed, 31 Aug 2022 14:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395683.635493; Wed, 31 Aug 2022 14:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR0-0002j4-Tv; Wed, 31 Aug 2022 14:11:14 +0000
Received: by outflank-mailman (input) for mailman id 395683;
 Wed, 31 Aug 2022 14:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOQz-0002bw-Hi
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:13 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3b13193-2936-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 16:11:11 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBo4G9032537;
 Wed, 31 Aug 2022 14:11:04 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ja427h4rd-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:04 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:10:59 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:10:59 +0000
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
X-Inumbo-ID: c3b13193-2936-11ed-82f2-63bd783d45fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMYw3IIznt/gx2OITmQtAtPWVRAdhO0eSyiP3+uOfdNpk+/mHKGDQ/uXBH8uOn0sYl8urTCnyteFeszqzy2XW4prhRgWADebOThU57JnInEmTKUvMJnN9ptyaGt9lSS4moxisIombYJ1hMsF4gD30W1ZvO2PvW9XRGV+Bh9jL5G7lNp5rCA6TuXy0mPzTbxt+8CBhjm/m2NEV9PjV0PTFOjWnFBk3JErEVnEmzMo7bXSO6wF+uoy2fFu8xojSNEiTFc1d1CAx/Lpnt3xKSg/7/X7+UEIOGMQX4Wodh8MAVxqiGOjsineioHUrxWipADP2P2garJpODiUJ+ZsnXXvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlEJMtsRyS/9QiiQY8Z+TlGkWcyZ8F0YLDRgonTMQAk=;
 b=c81phSZI+3ZTniIBwxkEJIBQV8VTrFyqHLvRElANZhcCg8Tcj3ulnFyyXqzebRMBY+9RQWPrsA2CcVajaAfjYJe6grFPF/s+a1JcLvSIpyq8Lt7WF5nl/oYPb7OGQJ+EwnexPENPHfBP+f7Rnonnd49JJpkCLsS+aPsGv4ebFjfbZRiwhxDfmBhjCsbY/65nWfBsYKLHf8oVgo0VEYlI6IVnKKQ5J4ByTGu93XQZVLpxBsxvfqhs09NoXTnmlVfKNHce/S1nThJ/IBu8ce3vCNb5Sj2qwaosleWKsmCkDHs9Sl1189L+6HKSlhTk5uRG8RG9SLVNJU1z0N+RhRbfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlEJMtsRyS/9QiiQY8Z+TlGkWcyZ8F0YLDRgonTMQAk=;
 b=MGe/X604Ln4dwQKTc0y31FjSv/L5dOOIBq8/YXZUYNROiYke+RGtKYV458BsJ0FEfvEsKHwZTo5QW7vHXl9JhHEHAMVkSfsauxfRHHNH4BU1EM/8G10w77eSkVjHNPqz1JXSpRioVm2FRID8Wpy0quCYOnMhDJ0M66DGHggjA/B017+760RJct754rkZElrjr0kMx5dU9PcX0p49nkYE79tfMID+5LEGN/RIthGRmOh3LHz9p6OPGFcDEEHj8IV8cApqWOFz6knmw2uqJFpkRX6J+ozj/01MbKTu3i8/Ex45aeE2uP5I0hDA74U/5G2UL2k71Hj6VsmQ/czKYCrCLQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [RFC PATCH 02/10] xen: pci: add pci_seg->alldevs_lock
Thread-Topic: [RFC PATCH 02/10] xen: pci: add pci_seg->alldevs_lock
Thread-Index: AQHYvUN+nWaGteAQq0y+sD+4Hw5CPQ==
Date: Wed, 31 Aug 2022 14:10:59 +0000
Message-ID: <20220831141040.13231-3-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c1a3ce0-2dfb-4acd-22e3-08da8b5aa115
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wQE/F5Zthkaam/Hk//iqdxkAUlZ34owr0ijOV276cWROiKEqHjHsdxJCEC4QQLeFJVnPUPS1SOk4+llxKXucH76Rn2vWXkxDVlabDfnW0SkBgAOFGd1K3g2ogjxMMfTkUIw0xnG9RcyvN+gtgNvl8fTozXVYjAzk05spzzxN/HGkqC50b3AZ/5cvqdtedvk2W4OAMjrCo+cPVJU2HW1b7K70PfMW6eaRxAnc0lVV4j5Cu+t+PITrRhsl0KgTx2B449weg5Gjq0QkzBmsmh6+7YgE575uVYRbVBfe4HscS0zxDwKdw8Myfi6IEyhz0hACTbFICeqh4Dwn63GhsbSvq0ntw4xxWHYeV3r6rmMjbSJxwI5LCUyWA3TWlflHaeW8IEDLb+QW3lW64SzFmXbkzAORJFz3ICH7JzXQpgLXbo4Qb1E86Ki0nSrIb5yZHImI1Q/fgzRDho5mx2tp259L+ZfI/iFw/w4fecPlQPZRWf7ktWTBXjxyigLEVwnJUPq81P8knfOmwb1SaxylZKd+Bjr4jx9n/ifHWXT4SHdqdeqX08cCC032tMTZACGKXFYxIGF2LMrzixED31zJR+thgWTZLF0FvyQ+JGpIMJsvBYgn5HKMs6EG0MIGGTdHeXL8PjEUQwxbN+B4YGkpEDn9wzFca4vFmBn9Ii7qddfjEjKuCnNjSHRbU0ygQn6hF1XSaabGKtzDcjFXQjlyEbpQX/tT85DLOfEtvPErC5iTdA8Go1YHx3vX+bFH75FCAkew+zeNYe2HRNON/r6NfBVy3g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(8936002)(316002)(36756003)(6916009)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?L0PxtJCO8By9b+awW+CDmH0pH+KUd8cce+QZDSHXqFLk2lqg0lXU5hXi22?=
 =?iso-8859-1?Q?AimbTpTvHF0gRhheD1U4jHpkeAo8zf2uqKYJBryf8lrvqyi30Izi5dGDv0?=
 =?iso-8859-1?Q?4QtuHzDfkk5pSSx5lxbVmEbF3OVQrkHjDpq+VZKSmb9eKbpS571S/VVd0p?=
 =?iso-8859-1?Q?DYeqcx2EPgQ3sibNQOb43/nnfNwmh36LJuSICWjKWH6hKbuxgz2usse859?=
 =?iso-8859-1?Q?y2MqDY3NssxEFDzDXkHLxK6kkvtHBY0twaRReFr6/b9gW3rkMEziX9YsqQ?=
 =?iso-8859-1?Q?MHBX+hwFXKoa3HO6sK1ne7ZMa8bpHPxtKPTkJ+jy8vfC9cBU6fNIXPGG8D?=
 =?iso-8859-1?Q?bfVzwE40/10Z8MuMeNI+pxN6r4vdiNU2uTs5XUdLFDIQaTIXHYYtH+AeiQ?=
 =?iso-8859-1?Q?f/aLD9/KVqTCmO5xP/RQFFjpFbcX4b0PoJM51ojpvacR3E6itg546bWO2G?=
 =?iso-8859-1?Q?BgaoR0UXDNZGcLTw15Ulv5ML0AXpbHMRlognmONVFwzt5DoDDk821eI3FE?=
 =?iso-8859-1?Q?nBv+7hM6/xnh0n1ICe+0SPet8jiR9DDAtXZlMoEFqba1ysc1tuQgJpKn/w?=
 =?iso-8859-1?Q?Bct4PAPFIPxnQjYsGIHGjf7tI+UTktzLVvEnOX/IV9CLjrwzz4oA/HOO+h?=
 =?iso-8859-1?Q?B6ZsaAlbMxw9wTPopV3nb5CJz+5Qbkq4A5Waz4L65wSKyiYaeSIEtV5MGD?=
 =?iso-8859-1?Q?grEXEYt+a85J40KeyYB9Gg9QaDvDoBAmpvUn+OZLTn7sb3LGrFJca39ij2?=
 =?iso-8859-1?Q?Iwn8cIErz+r1V8KJNl8W2eNqOwz+dsTb1K3gDA6OGu7JXypPzr+MuTEJdC?=
 =?iso-8859-1?Q?Ws88C+5AB9pf7twqSLwaS8LC/G6p9r7qjoK3U3Q1tOEbutMxrX6mE3gkae?=
 =?iso-8859-1?Q?Wj3nce2SU+D2ZDYe6tTgO9b39gc+w8tFAtWTTucLrjhvy8QpOgJpP5tGBe?=
 =?iso-8859-1?Q?sJh5eMoyGmt3wW1BL5WsO5iQxBR5+6sfVLKJFI7UpewAnx7xr3mMK3MrhC?=
 =?iso-8859-1?Q?nzxd0Il+qjoA9yKNMyjhwnhAkC5+FYYYxjYT008RtBiKCiWlhEPLeuXtKY?=
 =?iso-8859-1?Q?+eCcBPS1bpI9qG8FVKciFM9c5cbbGfW5s7LVQid4f9X54j7CFkNJeqAoGX?=
 =?iso-8859-1?Q?h+/+l8Mu14wMUG+8Ftv+fqNMLAn+YEfWLuhhMYpQSzBnuo7JGLQ6ULr175?=
 =?iso-8859-1?Q?+KMTyC+CdFF0qqdea+0GU2NrosFuKTnMvugITLpyHS2lDaulqFrP4n8r6z?=
 =?iso-8859-1?Q?/GHfQ1Fei+thxTceOu9HDMocUU8iwGc9IZEaIuX/q3I4Y9DlTnjrlcJSRf?=
 =?iso-8859-1?Q?3iEDwQ5aa4WWzzrhvbizTOsWws5MF32IMozu9fNDfC9wg2SjNEtKTuoLOA?=
 =?iso-8859-1?Q?X3dVmYVhVPXZd65Z7Hp5fkna3uFP1IBgjKTJKVbcYdtB2MUGxlLMjBCM4y?=
 =?iso-8859-1?Q?Fmuqtg0iXVehf59xTRMZWxN5MVJ8F0cJ0X64DLseggPSSZr3cUK8wXvc0N?=
 =?iso-8859-1?Q?9ZlIvs1HUcZx2P1ydyhRQtb8SPMLRu8cBBywNCnMDahh/onV90oUojtftk?=
 =?iso-8859-1?Q?/NChtQ1EICVU8ISVOla/onJJzzhe5uUXa+qeB2+76Y9Zq6I1dMmebd2WlV?=
 =?iso-8859-1?Q?HdGI0cQc41lBAJxTsNyHekEZxFsO0VZLQkB4gIEOg2NFi1XL5S80fsGw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1a3ce0-2dfb-4acd-22e3-08da8b5aa115
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:10:59.1712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3GxOaaNhxJ+5/TPxqV4erIKWpyv1ASaMGEMizrHv7YDgF4OvR2JVXiBBmnZFzCuKtstE8X9o83LnQy2liVyCeCs4Z4cToXuEz+V7K1c+Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: bptCeS2jufyr60FKTsavamPbe-yL51DF
X-Proofpoint-ORIG-GUID: bptCeS2jufyr60FKTsavamPbe-yL51DF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310070

This lock protects alldevs_list of struct pci_seg. As this, it should
be used when we are adding, removing on enumerating PCI devices
assigned to a PCI segment.

Radix tree that stores PCI segment has own locking mechanism, also
pci_seg structures are only allocated and newer freed, so we need no
additional locking to access pci_seg structures. But we need a lock
that protects alldevs_list field.

This enables more granular locking instead of one huge pcidevs_lock
that locks entire PCI subsystem.  Please note that pcidevs_lock() is
still used, we are going to remove it in subsequent patches.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/drivers/passthrough/pci.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 4366f8f965..2dfa1c2875 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -38,6 +38,7 @@
=20
 struct pci_seg {
     struct list_head alldevs_list;
+    spinlock_t alldevs_lock;
     u16 nr;
     unsigned long *ro_map;
     /* bus2bridge_lock protects bus2bridge array */
@@ -93,6 +94,7 @@ static struct pci_seg *alloc_pseg(u16 seg)
     pseg->nr =3D seg;
     INIT_LIST_HEAD(&pseg->alldevs_list);
     spin_lock_init(&pseg->bus2bridge_lock);
+    spin_lock_init(&pseg->alldevs_lock);
=20
     if ( radix_tree_insert(&pci_segments, seg, pseg) )
     {
@@ -385,9 +387,13 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg=
, u8 bus, u8 devfn)
     unsigned int pos;
     int rc;
=20
+    spin_lock(&pseg->alldevs_lock);
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
+        {
+            spin_unlock(&pseg->alldevs_lock);
             return pdev;
+        }
=20
     pdev =3D xzalloc(struct pci_dev);
     if ( !pdev )
@@ -404,10 +410,12 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pse=
g, u8 bus, u8 devfn)
     if ( rc )
     {
         xfree(pdev);
+        spin_unlock(&pseg->alldevs_lock);
         return NULL;
     }
=20
     list_add(&pdev->alldevs_list, &pseg->alldevs_list);
+    spin_unlock(&pseg->alldevs_lock);
=20
     /* update bus2bridge */
     switch ( pdev->type =3D pdev_type(pseg->nr, bus, devfn) )
@@ -611,15 +619,20 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_sb=
df_t sbdf)
      */
     if ( !d || is_hardware_domain(d) )
     {
-        const struct pci_seg *pseg =3D get_pseg(sbdf.seg);
+        struct pci_seg *pseg =3D get_pseg(sbdf.seg);
=20
         if ( !pseg )
             return NULL;
=20
+        spin_lock(&pseg->alldevs_lock);
         list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
             if ( pdev->sbdf.bdf =3D=3D sbdf.bdf &&
                  (!d || pdev->domain =3D=3D d) )
+            {
+                spin_unlock(&pseg->alldevs_lock);
                 return pdev;
+            }
+        spin_unlock(&pseg->alldevs_lock);
     }
     else
     {
@@ -893,6 +906,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
         return -ENODEV;
=20
     pcidevs_lock();
+    spin_lock(&pseg->alldevs_lock);
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
         {
@@ -907,10 +921,12 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
             }
             printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
             free_pdev(pseg, pdev);
+            list_del(&pdev->alldevs_list);
             break;
         }
=20
     pcidevs_unlock();
+    spin_unlock(&pseg->alldevs_lock);
     return ret;
 }
=20
@@ -1363,6 +1379,7 @@ static int cf_check _dump_pci_devices(struct pci_seg =
*pseg, void *arg)
=20
     printk("=3D=3D=3D=3D segment %04x =3D=3D=3D=3D\n", pseg->nr);
=20
+    spin_lock(&pseg->alldevs_lock);
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
     {
         printk("%pp - ", &pdev->sbdf);
@@ -1376,6 +1393,7 @@ static int cf_check _dump_pci_devices(struct pci_seg =
*pseg, void *arg)
         pdev_dump_msi(pdev);
         printk("\n");
     }
+    spin_unlock(&pseg->alldevs_lock);
=20
     return 0;
 }
--=20
2.36.1

