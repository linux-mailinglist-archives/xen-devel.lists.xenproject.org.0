Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BD772DF91
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548005.855779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KV-0003hi-Ji; Tue, 13 Jun 2023 10:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548005.855779; Tue, 13 Jun 2023 10:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KV-0003dp-E1; Tue, 13 Jun 2023 10:32:51 +0000
Received: by outflank-mailman (input) for mailman id 548005;
 Tue, 13 Jun 2023 10:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KS-0001im-Ve
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:49 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2ff8b91-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:32:47 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 35DAO5Ka019280;
 Tue, 13 Jun 2023 10:32:35 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r5yahmgn9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9706.eurprd03.prod.outlook.com (2603:10a6:10:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 10:32:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:30 +0000
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
X-Inumbo-ID: a2ff8b91-09d5-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXcPM430Y0AzK7Lbi6uqAI4PDwVMUU7Tokq6AYARaL9rGoumjn2gomfl9UusCOz0RGla1DIlnw47GjZpOzmqDpSN+DgKKHtDfrgZkuo+E/hD0XNddBFRPZ5bAeK1Hu96uclL+/HcfFvyEoFetofd32UZa+U4AcxR8ei6MauoKUJjk/6eG8LmeQjP2ruF79RbzVAJ7iz7M3xeUHhf4IOz3aTX1wmZKdh1YRSUYPthy5W16jYo1hUKL/ox8MpO+kRXbyb9XiGM8X47NB5OjU/0EOWh/WQ/Pr38iu0MpB5g6lTxbisK2ueNMe1Nw2XvDggMt0y9XIeYMhkipuS7jCrPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4ds1N6Vp7dUlaANy/wSVy9nlYUhCmnAHHk12HItlTU=;
 b=G+zkOZimS+oX3WytR4+2P9J7WPYXWdyCzl5eC12uCGs9Fbw/qN3/9yCiQGKllTAWxaX2WLRsp4sCcjVFTEhPELeqIULzbM7PYZ0UP5u1qVk2wCU6t8S1v87Mcd5Dgn0CeKOLcrj2GpLwaoHRX9A/aXWqb6z+j4WtNkANO02ISgBA7eDbPpqs7Mwl3I3/COlkPzzhOHujQuZqseRKR475h54JTqezQZs4zJBZ9gmCu61vgYDRAvKy19AHf6/i+hqQ+ZxdccWWXUc5AhJVhxbeSbml5RotVq8N/TcjdbdmUAXF3pijO4EptZ5aC0cZZ2bmkkiW5FfcpervrjL0ZJCjqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4ds1N6Vp7dUlaANy/wSVy9nlYUhCmnAHHk12HItlTU=;
 b=OeDZ52hx11DmqMCIWM52DxOlMpEIKJdI60C6194DaETT6neSaReIAbXRkOjuwatux09If6aihNcOAnHuW6SwIv4m1zdrR1UU8j3yRMhfXXxp5gxkuyhAhv89gtpuqrRo+7L96R0G0QGb2oLmPA24XHtiUMhNgd+vyeraVuAmEjrD6fFyROLhBS0merGRsPG7AFPtN497VGD+nxKlgPY2jt7JBH2ofoo30daQGx3Ix0F5U+G1v5Q8k4lunhp7ErLrT4L1RGOCR2+IKFXKOP9lBCQQ6heVpkYxmLexKXm/0Wmq8EHyvev8fAc3CTFlEBXyeqCcRvDfYX6tOuhYRy6niQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v7 03/12] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v7 03/12] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHZneJZP53w2XmssEurF7oAFnlHXQ==
Date: Tue, 13 Jun 2023 10:32:27 +0000
Message-ID: <20230613103159.524763-4-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9706:EE_
x-ms-office365-filtering-correlation-id: fa9bfe89-2f24-46d1-cbb8-08db6bf97de5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3H1r/kDYrmXXsIAEvrwDum+66PlVVU1yPfkh5tC6IExSlwR6/4jV4ba+8YMg33ZSlmPpZDMQxfRur03dUgRotZyx5YcXtC4cm/xpgs1JX3q51m6MdJOKbEAYnuFqdToOOOmwvxB5iDBUWBmJ2AuYykrtXuRh4zPrwcVctGGeK6LjGboMemjm+vtkwc9cKKagyPT4BIxMdLOqkmTNlnacfFgK09crqD0GTwkzoWZWWkxzGbdWG6IJ6ueYq+ss+PrTFERLAXjnO8GWMtVgpZxTKyFXnL4ExGi/fu9mYAopP8w8pltOLwO8lhqZeIgLB0x0cJerWeCi4jztEGXlAVprPNagqzPHoeO84yVcukpk8Tsv+4tzAC6mtzrGwpFhBIB8PlBSbawsYe5lRAXWM1x99tWdqRB6ehg5VaMLKEn+D8dSRRa7VXXQg7Xg458rBHQtHUDre3UmQKm4fHM07juOvsLsVYtvfzekC7No1hmQhYwbLlyBmLI++2nsEk7kuOtjyRM04vIqLSlGLhjP6ITZVZs8ntqplAGokEG0JZAWMw9FgrArmbd58fpFA5yGGw9QWzo7bBRBhhXG8/zuHGUekdKPYUDW62B7uBBkj9am7/2Ok699Tkie2I6H2sO7YYR4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(91956017)(64756008)(76116006)(66556008)(66446008)(4326008)(6916009)(66476007)(71200400001)(5660300002)(66946007)(41300700001)(8936002)(8676002)(316002)(36756003)(54906003)(83380400001)(478600001)(2906002)(6486002)(38100700002)(6666004)(186003)(6506007)(26005)(1076003)(6512007)(86362001)(55236004)(38070700005)(2616005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kiGhCGnv88Uc4hL9cBf37oVHBsGXlo6sKm3vZJE7Tq7yfr2X0EdQ93Qn1Q?=
 =?iso-8859-1?Q?h2OOrwsK/tJMTbpBYVwX/JFDjBZhKs6xxNNi2GXxvupfR8RZ1Hogo8usg3?=
 =?iso-8859-1?Q?/OjEYtDCN6M9t9jaIu7JxZCDoLfFSM8uqFifAA3ZDhUDeUB/r2RB6Vanw/?=
 =?iso-8859-1?Q?83eD7KjcTabh51hVrnX0dEpPUUv4nxJiBGbLlYGwFDFiLRzfXkii5w9D6F?=
 =?iso-8859-1?Q?cSb4lbxeUFu1JL4o43TYhW2f7pGbkCpUpdaAT9fWYwa6Mdtd8P99yUI5CP?=
 =?iso-8859-1?Q?RRDySECrPr3w3a+ICO1b2YveSwEuQ0bX2CW3GCDkC9yq/Hvn5QnyIFTHrN?=
 =?iso-8859-1?Q?6GhdHJpKRnaYE73xEYinVIBcIB0JEH0aduQQcnqw6UmmYLlOD9T/o3XRDp?=
 =?iso-8859-1?Q?KSdIQaXPLk5O/5VhSvvjNcOtzEotZdbEkoRAKLEex3S4m7ZASPPnwuIZl5?=
 =?iso-8859-1?Q?FxZjysHOOcxdphyooFMz073+PQUkHYS09bs7iLZMzapgKA0WjKPvNvRW9S?=
 =?iso-8859-1?Q?7TAckBKEzMfkwmdBweJ24aqWEFysKPz0Qn76NOATEVEPh+QaXQ4peOf2vX?=
 =?iso-8859-1?Q?uGJ7IckvbFv6OU4CXcOoBQHgR5SnB3Tx+b87VDV2IVTO0CbCNzqPftgvQa?=
 =?iso-8859-1?Q?RL6KSTMautnxbIr07DnIPF/MZp73pE8E7bKHlThvFQ607IxSTrvapv4kgF?=
 =?iso-8859-1?Q?gZwkGgtth5/6zhyIeH6br83pKYnb9PAZ8LLnwlhPyX8hMRfgeY6ZZDXz7X?=
 =?iso-8859-1?Q?r+vWVBlihqvfwrd0aazjb/ae5TXZaDg/T6KX+z+V5vy1Fm6Gvmf4D06wVa?=
 =?iso-8859-1?Q?V0nSbiHohVHySndFPjSxo85T2jAlGNQRWdWK9y6WpyNxL+jpVSqWDlYnDr?=
 =?iso-8859-1?Q?FzkmcnCm6OASJP68kxKuDKJKPVhqNMfVyFna5pHFOzsoej9zMucT2jbXeu?=
 =?iso-8859-1?Q?tckcg4uVou+REZoIIl9/OpSoEULqzwyX3QQ2IiZUn3CJrZsdZoPwRyLDYw?=
 =?iso-8859-1?Q?Z/Ww9tMClKoPzqcKajWbMNTdyUg314+kl/Peoxh/sJSHdWAF8o70fFqreo?=
 =?iso-8859-1?Q?MNKKa9nDUVIcWO6JUX+SMAWqGN/FHdS471pBURlyIRiXjAruhQO4aftbyv?=
 =?iso-8859-1?Q?CQomMVNEOQ2wpgsj/Uth3Sv/v2l27NJau114YxFLVxlHXItE0E8V0M9sgc?=
 =?iso-8859-1?Q?Ue7jOljT4JcvBKpO/4Y0OizN99LeDH6pxmdIma65L+XekLHpMqDJnoLDDy?=
 =?iso-8859-1?Q?sCx6A+8DQVglHCJxUreJ44JcBuWvVtKpyEu3hcUeED8dVTpIpsxac1Q0O0?=
 =?iso-8859-1?Q?i9IFq4u1RImz8zzi2RzRDdHXaPQj1k1QGe56N3PPhmzJIzVPu3lObJqePJ?=
 =?iso-8859-1?Q?xVYv4xEryVUrqFoaVNBqZunA6vq02r+IL0EtKqOd0HCJYp2P2BsLVdAVAv?=
 =?iso-8859-1?Q?fvoV17N8nVBun6bdpe3i1zBcRLr7p00vj0xZGLmxNNuLSjgnnBtq4kvEV3?=
 =?iso-8859-1?Q?CnVy1fIbQsNuXhIp7JiuuxK8dkV2wByBNSdbMgWcucvOgLjYCOzi9Igvnl?=
 =?iso-8859-1?Q?Cn8yVpW2i27Fpxmjt5ixilYYbpJ72rxYQdpJ13odwkcMa5hIcYR0NeuzlB?=
 =?iso-8859-1?Q?nxXG5Ty0ao4XqL2r87OznoRz+DFHrbEoVT0oS7RJiFm/lbQeXJv62o/Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9bfe89-2f24-46d1-cbb8-08db6bf97de5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:27.5060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RN+bhgKNKmjVpGUpks2R0tF9bwlP4Wj11u2dJJ1l9MCNCcIN0+EUOcj0FTHfdG/s6m/EfD6zT0XlI6SixwQta/qyhAdkt8D4sd1kIe19HcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9706
X-Proofpoint-GUID: hZrBNS6L2x-zXTuYiJGvJeB00Ny7B0ii
X-Proofpoint-ORIG-GUID: hZrBNS6L2x-zXTuYiJGvJeB00Ny7B0ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130093

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned some work on vPCI side needs
to be done for that device. Introduce a pair of hooks so vPCI can handle
that.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- do not pass struct domain to vpci_{assign|deassign}_device as
  pdev->domain can be used
- do not leave the device assigned (pdev->domain =3D=3D new domain) in case
  vpci_assign_device fails: try to de-assign and if this also fails, then
  crash the domain
Since v5:
- do not split code into run_vpci_init
- do not check for is_system_domain in vpci_{de}assign_device
- do not use vpci_remove_device_handlers_locked and re-allocate
  pdev->vpci completely
- make vpci_deassign_device void
Since v4:
 - de-assign vPCI from the previous domain on device assignment
 - do not remove handlers in vpci_assign_device as those must not
   exist at that point
Since v3:
 - remove toolstack roll-back description from the commit message
   as error are to be handled with proper cleanup in Xen itself
 - remove __must_check
 - remove redundant rc check while assigning devices
 - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
 - use REGISTER_VPCI_INIT machinery to run required steps on device
   init/assign: add run_vpci_init helper
Since v2:
- define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
  for x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - extended the commit message
---
 xen/drivers/Kconfig           |  4 ++++
 xen/drivers/passthrough/pci.c | 11 +++++++++++
 xen/drivers/vpci/vpci.c       | 27 +++++++++++++++++++++++++++
 xen/include/xen/vpci.h        | 15 +++++++++++++++
 4 files changed, 57 insertions(+)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47..780490cf8e 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
=20
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	depends on HAS_VPCI
+
 endmenu
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 0afcb59af0..f43b40508a 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -877,6 +877,8 @@ static int deassign_device(struct domain *d, uint16_t s=
eg, uint8_t bus,
     if ( ret )
         goto out;
=20
+    vpci_deassign_device(pdev);
+
     if ( pdev->domain =3D=3D hardware_domain  )
         pdev->quarantine =3D false;
=20
@@ -1417,6 +1419,7 @@ static int assign_device(struct domain *d, u16 seg, u=
8 bus, u8 devfn, u32 flag)
 {
     const struct domain_iommu *hd =3D dom_iommu(d);
     struct pci_dev *pdev;
+    uint8_t old_devfn;
     int rc =3D 0;
=20
     if ( !is_iommu_enabled(d) )
@@ -1436,6 +1439,8 @@ static int assign_device(struct domain *d, u16 seg, u=
8 bus, u8 devfn, u32 flag)
     if ( pdev->broken && d !=3D hardware_domain && d !=3D dom_io )
         goto done;
=20
+    vpci_deassign_device(pdev);
+
     rc =3D pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1453,6 +1458,8 @@ static int assign_device(struct domain *d, u16 seg, u=
8 bus, u8 devfn, u32 flag)
                           pci_to_dev(pdev), flag)) )
         goto done;
=20
+    old_devfn =3D devfn;
+
     for ( ; pdev->phantom_stride; rc =3D 0 )
     {
         devfn +=3D pdev->phantom_stride;
@@ -1462,6 +1469,10 @@ static int assign_device(struct domain *d, u16 seg, =
u8 bus, u8 devfn, u32 flag)
                         pci_to_dev(pdev), flag);
     }
=20
+    rc =3D vpci_assign_device(pdev);
+    if ( rc && deassign_device(d, seg, bus, old_devfn) )
+        domain_crash(d);
+
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 0b11d9c3f8..4182c65eaa 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -114,6 +114,33 @@ int vpci_add_handlers(struct pci_dev *pdev)
=20
     return rc;
 }
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned to guest. */
+int vpci_assign_device(struct pci_dev *pdev)
+{
+    int rc;
+
+    if ( !has_vpci(pdev->domain) )
+        return 0;
+
+    rc =3D vpci_add_handlers(pdev);
+    if ( rc )
+        vpci_deassign_device(pdev);
+
+    return rc;
+}
+
+/* Notify vPCI that device is de-assigned from guest. */
+void vpci_deassign_device(struct pci_dev *pdev)
+{
+    if ( !has_vpci(pdev->domain) )
+        return;
+
+    vpci_remove_device(pdev);
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 #endif /* __XEN__ */
=20
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 3a7fcc4463..5383ede556 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -270,6 +270,21 @@ static inline bool __must_check vpci_process_pending(s=
truct vcpu *v)
 }
 #endif
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned/de-assigned to/from guest. */
+int vpci_assign_device(struct pci_dev *pdev);
+void vpci_deassign_device(struct pci_dev *pdev);
+#else
+static inline int vpci_assign_device(struct pci_dev *pdev)
+{
+    return 0;
+};
+
+static inline void vpci_deassign_device(struct pci_dev *pdev)
+{
+};
+#endif
+
 #endif
=20
 /*
--=20
2.40.1

