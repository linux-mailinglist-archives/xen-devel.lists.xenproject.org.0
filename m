Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB2575A377
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566265.884941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHbC-0004Hs-3o; Thu, 20 Jul 2023 00:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566265.884941; Thu, 20 Jul 2023 00:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHbB-00040Y-Tx; Thu, 20 Jul 2023 00:32:53 +0000
Received: by outflank-mailman (input) for mailman id 566265;
 Thu, 20 Jul 2023 00:32:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb5-0001JI-Nu
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f17084d7-2694-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:32:45 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JJCjt4031890
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:43 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgcw1sme-4
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
X-Inumbo-ID: f17084d7-2694-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq9NQ4T9GFEyCjOepuzmQUYB2AOapblkNLljB0ubBBmeeNcth9BzZqzzS8CqFlDtiuV+aoLebFeawm/kMNPPCJ6nxv2kFP1PiPegwGu9MO7GPL5FvBhkS2uQXE8j/O5UAe+7XuNwUQFmsXcQwc67WM+cLXs6QnF1ZpxwhpOfzE/A0UlkUxKI1CnUC/FER0UG9rCjp3zeEis+et37Lny+tFmZo/hrIw46kj2uUc/GCD7rljEO9Oqf94rXMOm/fv1S8vXPBCKzi2L2EdUr3JaTUM5W0DIv6oVvlGNfNnhnBlVH61i+5FrG480AeQ7J07i8XfT+qSFu10sEIzUo33NoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJF4BGYeq1qshKG9OZht+I75cGYA32L43+SEUEeNDk8=;
 b=MKLqHiqVUweJuEplcHL7CtXNA4Cu7CpARupbUdk3AhVrg30wQqi4mFPhmIwqtYC/66qEY6leSZAIiASxtR3TNgzE5yOyYSFXHuipk4dZkKlCTFVt0j8ykMDUV21yCfXVQYgwVvL6QCtYht50ctTtuocPy5xlwQr1SKRE/o01/UmG7kHEJ8P7QB1PhEBuhO35sCFFR3LO5rzwjaFK6PEmsB5KJCc3XHk63ssmillaFTs0LwF7vkyriSxaZZmHLtyEQRhl/tQrEW6Zz5XRT6ZMhC6NKTFiqaR1Dyo13iaQFlnf+U1YMRIRCqBJc2vM5PLCfwzfuh3fhE2FK7LGKtFk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJF4BGYeq1qshKG9OZht+I75cGYA32L43+SEUEeNDk8=;
 b=cAqDNUWcf9qr1dkrr+F5JTg8jqEPmB2+AvXdzepu66WHSTHzBzV6xNi116bDrkvw/QKoD38JGiFEdmiLwvIXXxMghcopUMEDE57zPfX/wY/Zy7+Qp2f+g5xFVdwL5uQY6p4oWfsDlAXifJ5tm52cpysSXQhMhjgt3jyhSCdqT3d+jzii78/KHOezI+Ifc4UML3wxTbPGKdWTVVeedjtRj70JrLgyl1IrVQ6bprYMqC/OZbcLHV3hkMhTzqr0+5YnsKuxx0KgS/uSNMup/XOSgTGJcglRcGX514Wg/EhemyLhav0w3WAlHkJba6mKaDfRJeIcUb93yWh7PG15CdYhsQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: [PATCH v8 12/13] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v8 12/13] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Index: AQHZuqGt3D08el+/O0KSh2o4KcGPqA==
Date: Thu, 20 Jul 2023 00:32:34 +0000
Message-ID: <20230720003205.1828537-13-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 77a64a71-2bb4-4a14-4390-08db88b8d10c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Oqgb7QyutVeqAbEUZpCtx0QVejZDeJmyBF1IbYrUlDQCIOWpAMflv84pXv4rHFStmWV+Wh/GXDhxHOtD9wjDBDtVU99/FP/M1ZTv+zIvHGJbvdgnXDuohaHg6pkPAKmEK3qUo1a9wW/Kpp0T4GLmDtix2CP6bO7siWZNywROmANIOVqYaB+EbIAMSwGYV31VfcxI7lh/GovBgmmnhiRSKQemcRDsMt+KL3PpjXu2DDW4Bulrm5vEHTdOVhQuvGZxeZ/xTm+UO9L97kN4IiJKiY3bhnH2bon67G+Xp7/EwxhwqsoYTpEl2exA4DIbjnMFQYHNkByBc8qudCcgIGPXbvDGfWMk4asHAl/eQFEbq6kItVGztcAbohN+u5eDlk1rTrFyDp0EVU8vpz7uDsGxV0JbzcA5EnoTTIDf3JOj9lRJS83Yb9nBJ8nvh45ayJ43yKCy5ajxaSFo0OoOQ52kiMcOMfQfujfHfqh8hvqLU4VJcwVl0wcf7l7Ph4PEvWuRFQRPHhaW5uVDpC6XM5C90xzXVm04V/9ntOSf1ZeXMaBGt8eSYJhhwUjF04lNInZ/JLCeLZP/u9o4eJ2KlIkmE4Uu5EFOdrNCxYKitEJ7I6RRY49UBvbQQ86bM3y0oKZt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?XUkEb/Bx0A+PVp0RtUNVkn53Sgv323b/A8GWV1gvBOLywzIwRhmA094H49?=
 =?iso-8859-1?Q?dEJD+jTw8tjpe6gSHKxdCfjtqblm+fBGR6w7BsCfsuczlXjHUAR5MVpLCH?=
 =?iso-8859-1?Q?SzzFK3MOUwcOo/HUi02izrS3ILUSi7OtkYmE44ZOGGzBwn32unb6LrqrQA?=
 =?iso-8859-1?Q?IR5UlP+YaYGIWI311kvmnAuSxu+faVQsMF42UIe5wf9pXxgc1jc3qkrD8g?=
 =?iso-8859-1?Q?fV37M79kRwIbxa0kWN+eTg77eJUclCJhqK2Xea64eJJ4bpkHMKawunnbWc?=
 =?iso-8859-1?Q?+alEziYR5sUcFstd0F/r0tEndRK4HaC7u3P6eHQRnyCnv8R0qm31gCaN34?=
 =?iso-8859-1?Q?PgiOnodTvRRnCY95cyN/Ca0j6LAiy5hKufxTdT/BmMShA1E886D0L1jnsh?=
 =?iso-8859-1?Q?nLNB4xwJgTr2vkcby4do3m1bXogafojUMIDIq01c3y8EY4MaoXm+Ui2Za8?=
 =?iso-8859-1?Q?Ymp/j5oXMt2kWAxp70/k0ZZmQWuQ/qZmE+wDgrHMX6JslH69IfcOjVtmjB?=
 =?iso-8859-1?Q?PfWD4/izuAueAnM/buIw6WJX04N8H9++1/R1BfxZpWBaFeyZ+LgbOeYkAK?=
 =?iso-8859-1?Q?s+S9h3tXO47YYGGaCKQfRgxBjM4IEdLAoWDRk/zx9Ff26HNsNP7Vk5kkoW?=
 =?iso-8859-1?Q?VDUT68gUAxA42LTsYvdZAqprRbR91uUrIP+Frltfv0KqhJCY10iQTkqXV8?=
 =?iso-8859-1?Q?CgQ9d1psMcj6db+GLgtGfc6Wrar1oaapyXPqgLu8VdYct940OPPyOJL2S1?=
 =?iso-8859-1?Q?pTQObzEQj08jMci3taLay5vk+JumBqKTvKJZTciVR8xqmX/CmnBiifxZYl?=
 =?iso-8859-1?Q?xeerhPqsPavHhhfEHkOg211DGM/5SNB2EEvA9vd3H9QgRtMPt7olRB3jV7?=
 =?iso-8859-1?Q?A4v6gIlKJu17+fU1ocEwzgp/z9iZxP+wi6RHSN2nNSZFjyMgCzXjhAWcjv?=
 =?iso-8859-1?Q?U4JXhCgYCRx1PokhrcF7qzuiBEY3TYbWK+ZRlXEvR0DQAd+ZIJJBGOt0FQ?=
 =?iso-8859-1?Q?GEev4O0AFe1f5ijqdi8oLqlRrdMUxw1KYM06eMabIopnXcXrWnGqwoC7Az?=
 =?iso-8859-1?Q?/mQhKvcmYQqKakfaY6y3CF4IMAz1cnUbchhqGLzvSAltE+1J5bunSOijkY?=
 =?iso-8859-1?Q?aRB6HLgNzDbPk7CidDwPRIQUZHEhlB3nqs8PRy+dFM+0KgsleUx5dsAxJy?=
 =?iso-8859-1?Q?yKwMrfEE5LhlCp+ryi4TDjz/a+EjkL/tWKTZZKn5T3Vi5ZBgNuUfHalX7p?=
 =?iso-8859-1?Q?jF9yM28exOGPsfLaLnIUu9UH5NLWtjb/2pxyyg+l6Pr8GBbJ8vdccvexry?=
 =?iso-8859-1?Q?VPeVqj1wx9fGev5hwdca1DIzUq+YyWCqiBR/lYvqJYnXhaJpZLzymULjz4?=
 =?iso-8859-1?Q?Ki8OiJkozSRgP7gokHJQd45zQJP7psx8W2zuyduWaibpCEFBsSP4hhd3vd?=
 =?iso-8859-1?Q?C6/YPkAib2hm2c7bwiJ8iBaglORC8L1hy1o9evmgX/DEeqWGVo/VQD2OG1?=
 =?iso-8859-1?Q?iTIbJ/4pbtSlS78Y+bVPEOYTFILzEtsk7ZMOo9i53S538J+zYZqk1MF2vN?=
 =?iso-8859-1?Q?AA/wHVoGxjqC7uuKW9Y7SVyn2P7klCXB0wLDbfQuWqtTOy/s1EDjbKow+5?=
 =?iso-8859-1?Q?Xx98kMzNTJFFiYbpDHkbcZ0Pm4ZRot6LtY9NejlZehxockna1wkJop3w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a64a71-2bb4-4a14-4390-08db88b8d10c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:34.8480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSMPc/r6SKKbIIxYjoKQ3VF4smbwheeA3VKxw9l5/4ep8qOJhZ7ShyhEpDEYYq7KimGzXYIrYhPcj7JBK/b8DEXDuj44/MoQUwhOnL+Oz38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: 99B5JOBEbaenm1Hfi0uSRfKSpYSUhGpZ
X-Proofpoint-GUID: 99B5JOBEbaenm1Hfi0uSRfKSpYSUhGpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v8:
- locks moved out of vpci_translate_virtual_device()
Since v6:
- add pcidevs locking to vpci_translate_virtual_device
- update wrt to the new locking scheme
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPO=
RT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/vpci.c     | 47 +++++++++++++++++++++++++++++++++++++++--
 xen/drivers/vpci/vpci.c | 24 +++++++++++++++++++++
 xen/include/xen/vpci.h  |  7 ++++++
 3 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb5508..66701465af 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -28,10 +28,33 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *=
info,
                           register_t *r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
=20
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge )
+    {
+        bool translated;
+
+        read_lock(&v->domain->pci_lock);
+        translated =3D vpci_translate_virtual_device(v->domain, &sbdf);
+        read_unlock(&v->domain->pci_lock);
+
+        if ( !translated )
+        {
+            *r =3D ~0ul;
+            return 1;
+        }
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -48,7 +71,27 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *=
info,
                            register_t r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
+
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge )
+    {
+        bool translated;
+
+        read_lock(&v->domain->pci_lock);
+        translated =3D vpci_translate_virtual_device(v->domain, &sbdf);
+        read_unlock(&v->domain->pci_lock);
+
+        if ( !translated )
+            return 1;
+    }
=20
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index baaafe4a2a..2ce36e811d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -177,6 +177,30 @@ static int add_virtual_device(struct pci_dev *pdev)
     return 0;
 }
=20
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ * This must hold domain's pci_lock in read mode.
+ */
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
+{
+    struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+
+    for_each_pdev( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf =3D=3D sbdf->sbdf)=
 )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf =3D pdev->sbdf;
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct pci_dev *pdev)
 {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index c55c45f7a1..7d30fbdd28 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -286,6 +286,7 @@ static inline bool __must_check vpci_process_pending(st=
ruct vcpu *v)
 /* Notify vPCI that device is assigned/de-assigned to/from guest. */
 int vpci_assign_device(struct pci_dev *pdev);
 #define vpci_deassign_device vpci_remove_device
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
 #else
 static inline int vpci_assign_device(struct pci_dev *pdev)
 {
@@ -295,6 +296,12 @@ static inline int vpci_assign_device(struct pci_dev *p=
dev)
 static inline void vpci_deassign_device(struct pci_dev *pdev)
 {
 };
+
+static inline bool vpci_translate_virtual_device(struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    return false;
+}
 #endif
=20
 #endif
--=20
2.41.0

