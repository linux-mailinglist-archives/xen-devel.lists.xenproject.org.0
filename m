Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF39E81237A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 00:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654255.1020957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDYul-0003x5-Nn; Wed, 13 Dec 2023 23:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654255.1020957; Wed, 13 Dec 2023 23:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDYul-0003ti-I0; Wed, 13 Dec 2023 23:45:19 +0000
Received: by outflank-mailman (input) for mailman id 654255;
 Wed, 13 Dec 2023 23:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVP7=HY=epam.com=prvs=67111d5ab2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rDYuj-0003et-Sz
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 23:45:18 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a91fc728-9a11-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 00:45:15 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDJ2iKX012660; Wed, 13 Dec 2023 23:45:03 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uy0y4vams-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 23:45:02 +0000 (GMT)
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8666.eurprd03.prod.outlook.com (2603:10a6:20b:54c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 23:44:58 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 23:44:58 +0000
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
X-Inumbo-ID: a91fc728-9a11-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjcCE34Q8cYAXZKgD7kJW0DB45vnF8CZxwIVuvrVjiEb8RAIuCOuBtuEWzBMAVfJ8R0tjmgMD5TVZ+yVgJb23II1xkTsaKWcq+jxTAU8/g+MN7NZKQEgzLvzI227tLLOz3SULA7Re3RsvOn873lnTaSPKxI7Lp1xTMETjVYv+Yfl/IMP33zKbSCFM9qXEaCem5pFZuLRh/11Wa9aR45a96Eck6agHlkQuGaSc0yCivJvT4N2QgktlPrm3/A01oAEBqFrz8KZl02YvgrstBO5tE6iMLF7F7Dvi+jkT0VY2QRmmQLPknrL8CjEvgtGYTUmWYUMBssxwLGCHbpuiBqEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJERCSIdBtv8QPcVo8Rezsd1dZHzxbvjwYiJ7vM4OF8=;
 b=c4srFKbusB0BKFODJhzutgrmdCs8st8VDehNfBqoeDyWHZxBfq8ajhcKcdCNRP9mMP+pHwcSXdfTWD7kQ4pJok4bQaBA56gz8HNz/uo83zF6+h6L8OiEWIy9Kpm9ASrMKEUgbXADp8XHkFE5lWbM99vTcS0rStV4ZJSSz6+xyKHCfnVuAGg3IlzbgbMx85Cz4Vfb6cz4Y454ixnV4ywnDZtn7kLHcXgMLEvsXNN4BxPu8rQAhJJVYA/KPZRWWHWhH7NzjJzJOp0p72GwgCOJ7ap6IjgE/AJSyrvplF8FbBXfqGvgcac2OVrhrGQp4/cEg+8ikFbURfjxZNnlsT+8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJERCSIdBtv8QPcVo8Rezsd1dZHzxbvjwYiJ7vM4OF8=;
 b=qwwfMLE3VqcvX84HbGT3d+xGPHosMRrdv5RA50Mh5gTCkFUE9gEbcVXIgqxM3snls77g6Hi3+i+ZPkM/v6SH4czZ9TALJHkSrs2tX5/szu2tbqWSutPWKOJ40Y3D8DRIfeLJrlybkXAejXCf9aNR0z6FoABhR6gpYyDCVcuaoJG8Km0rP/TeNZQStjK0ulObhLnKPPTggzN0xN7xIsQOK+xz2iNvUVnUKGZMWUQtHBJ4JPamIrFNUHUUnozhf1sBcSBWD13ygOkcGW7n+jy5OVL5QDFbF9GSpSvE3SzwDM4MF+4oWui3fLMHKyk513qYuSd9vWHDh34bFZZBtpksng==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [RFC,FUTURE 1/3] domctl/pci: add ability to provide/request a virtual
 SBDF
Thread-Topic: [RFC,FUTURE 1/3] domctl/pci: add ability to provide/request a
 virtual SBDF
Thread-Index: AQHaLh5hbb+FwMFvSku5VoT+rvFZMg==
Date: Wed, 13 Dec 2023 23:44:57 +0000
Message-ID: <20231213234345.779722-2-volodymyr_babchuk@epam.com>
References: <20231213234345.779722-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231213234345.779722-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.43.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8666:EE_
x-ms-office365-filtering-correlation-id: 4066ccfc-1076-4190-f13d-08dbfc358420
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DxAP/ZOjUgYq/8JnPc2f2uWdw/bLsvAoCwnkqKbnfd35oGiEqC7fn9ijhwCBzJFxttbxuTxuGjM6FolM7v8y0CmzbbIVvjGAgBQfZpobkQQP2pIXXgs5SkaJ/qCiOCUn9rHJ9/ho0wpRPBZWPszptK5zEKVtT+EhM4diRXaBQbHRtPgia2RvamhjZolE5RfJZmtPXBkANrQOF4phVDyZ6zOL+vWOzKsbWSbc9Ojce6CmQu8xrpG/Iw93qOl/m6u3LeOytxv4GwrN5fLkPuhoaxdXIl9PmkHIdnmtQWTMtghIA104sURA1PeF2LrYJqPqVjJVNDaog73oKNn8eSQsGWajdomh6iEgWAIjeTidzb9cUfrsGi8iE0pbD1SsnADAskv1RJh56+0bY8roD5Mjp9IFBJ0pjzx6FEZFzBcJMGkrhr44WF4/FNkGcZUp9obU4m5eu+WnPYhQNHhJUSxqnOk+cMEwyu1JhMyXST+/mEPIya4tTKb7ni+5cF/URISWCJUN9q6CcVM+Ew5sVQm6O7KrbruO7/0pybflE5SPKhKjlBlr9jRlTYbgbftopZwyBsy8plZdu/Taj0mYvh54xPDTflshow5UaRaoCc1973M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(26005)(2616005)(71200400001)(6506007)(6512007)(55236004)(83380400001)(5660300002)(7416002)(8936002)(41300700001)(2906002)(4326008)(478600001)(6486002)(966005)(66556008)(8676002)(76116006)(66946007)(91956017)(316002)(6916009)(54906003)(64756008)(66446008)(66476007)(86362001)(122000001)(38100700002)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?P0AisEOffWOw8RyHmh8GlbY3gp6QLZMeGsD8tDoF7VQcVFv4dV/FOyXwsA?=
 =?iso-8859-1?Q?vsIWUYt0XSZoZFJopnOO1FEwd58SvSjMA7P5Urn1kLFmQOZUElT/gZjGnV?=
 =?iso-8859-1?Q?L+fiEi3prOZsKwqsqdf+cngx0hlv6nlN1jNwgZgT9B2WbcQebNFtyVoevJ?=
 =?iso-8859-1?Q?Zc1EYwMGwxJ3JOrZjeF4tInN51nalnO6h7Hcbad1CzqSvqNYNOgkWQA5K8?=
 =?iso-8859-1?Q?LzROyPDML53pghrcI8gFP1N6rdH9QNHiLRwGyH0ekkr4fWBN0Tn1ph/SWV?=
 =?iso-8859-1?Q?93ZfaD4vWccD1S0XJJqnAoVGk9RyzYey8R8BzE8EnWi3yYCHPlkbMFwr2E?=
 =?iso-8859-1?Q?mPKJWaFT0v+N2/KG88fmUUqy+W/5ayYTUt0E6R65PhryarRVs50L8UtvJI?=
 =?iso-8859-1?Q?iksgYjzE97YMddN9RBhWsvj4vA9CMxe55JQNo9CqqiQWEFY6ua9jh6OnUH?=
 =?iso-8859-1?Q?WKbxtcyK3L1zL2vwYKlzLeBiQh0splvf8xiBdHdZ6tR1Y7ZmKldYZSuQAi?=
 =?iso-8859-1?Q?Kq0pfwA78l9RAl7PW3HrW0lTKWNIo4dxfxlphYjhODndoZouSDzSeucXP8?=
 =?iso-8859-1?Q?LftcnlR7OQIfNNMOBYvv/2PlD7FBhJWe42qxNhxf85dbfvex8TRmBdIi3u?=
 =?iso-8859-1?Q?PlDYooBG6X/F78VaVf6YE3FER/0TaBV+6FQezSFJiCvo3PRi1BSRXQ3vvR?=
 =?iso-8859-1?Q?ePdQGi1GsHML1Xy61NXxFbcUgVfLZ3zCRtYXE7MgyWyhYjjUM2oA4t6LSA?=
 =?iso-8859-1?Q?z2pu4AKfgBWdoZX7a5PdQiG968qvYRlXL7cbKSaf318r1neUJlLCzh7AYP?=
 =?iso-8859-1?Q?RvsJ6QGJN7kd6zrOITssd9fnG3DNAZtPXcLVWMfG56xRUuNg+VjMmsOoTN?=
 =?iso-8859-1?Q?YHwHNlyaSBQTBZ8TbVVPXbczB99fInBrylexdTStMOuC7cG7Cqw34TejFk?=
 =?iso-8859-1?Q?/z4Wi4tXFpYNKWoZQ6pWo4w0uwcrmT6m+b/E/aKR5Bu2KGU8FVrQg/NHFe?=
 =?iso-8859-1?Q?eQJi2AzMVzftygbiK889MC1r4m8sSfKT+Nk07AuPRubj0QBaDy2cUG4C/R?=
 =?iso-8859-1?Q?0uMqU2agKgp7PAPyRAUQJWsN1o7BwXuHXTkIwrakM4yl/IbW4Tlg7gNISx?=
 =?iso-8859-1?Q?YUgZFQKgoWPB6M2qtUGKoDn0qrtaDCLiH/JoOnxtcONvK7bFb+6pGJIucB?=
 =?iso-8859-1?Q?XYWOiwxJkPun6r3PggXVRaazm02tTP2NZ3keQycxMZbAgbCWxm+j4iA5QI?=
 =?iso-8859-1?Q?twyWuPmFCeGVsazcR20q9dzTfkmf6GnSzvx8Y4CJGJIkVY+g5Q+n5MC8Bp?=
 =?iso-8859-1?Q?33TdXsKuPk7wr7XT/2FbvCg4GX+ng+oFCXqNoSePJv5XTo4v6A6lF1IRh1?=
 =?iso-8859-1?Q?SDXIe0HzlyheGYEa4RQGIyb5dTHJuJJJwoKu9kKUTJr6cc/p60jhtY7kNT?=
 =?iso-8859-1?Q?IgbYluU/3fikSFKqnMwqs/TkKeYZ+JF1cU2nJ+nBZsnJ0KMvaI6FsYGYkQ?=
 =?iso-8859-1?Q?O9FoL6fV3it5OSzfxL1tcB9ST7r/MknAuMwco2Su4D7vn1qEElHzvzVlQ4?=
 =?iso-8859-1?Q?G6KfXYnFHjI7VlBKHzXI801VuZYV1gANbKGhOrDy0PZqqKY52dUihKJLui?=
 =?iso-8859-1?Q?V8sKaX7vRkwsQDTR9v6rrd5LIMyFsIACjNMFr6sk5AZh8pytri0tBUlg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4066ccfc-1076-4190-f13d-08dbfc358420
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 23:44:57.9566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+SoYpuLw5Kt9ENP8djB6Tei82SR4pLyf+Pzj2HjountWUJkj6j1rek3Vkc+TeN2k4LJzL29odbgRjvZth2EeXX4H538D/Jqzka12EFz6kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8666
X-Proofpoint-GUID: AslKyKk_D3ly4HoVn7Drgv3B9ttsx1zY
X-Proofpoint-ORIG-GUID: AslKyKk_D3ly4HoVn7Drgv3B9ttsx1zY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312130168

With CONFIG_HAS_VPCI_GUEST_SUPPORT enabled, hypervisor will assign a
passed-through PCI device to a guest using virtual/guest SBDF
number. Right now hypervisor automatically allocates next free
SBDF. But there are cases mentioned in [1] when user should be able to
control SBDF assigned to the passed-through device.

To enable this, extend assign_device domctl call with optional
parameter virtual_sbdf. When this parameter is set to
XEN_DOMCTL_DEV_SDBF_ANY, hypervisor will act as previously, but it
will return allocated vSBDF back to the toolstack. Alternatively,
toolstack might provide desired vSBDF and hypervisor will try to use
it, if it is free and falls into permitted range.

[1] https://lore.kernel.org/all/d6a58e73-da51-40f1-a2f7-576274945585@xen.or=
g/

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/libs/ctrl/xc_domain.c   |  1 +
 xen/drivers/passthrough/pci.c | 17 ++++++++++------
 xen/drivers/vpci/vpci.c       | 38 +++++++++++++++++++++++++++--------
 xen/include/public/domctl.h   |  9 ++++++++-
 xen/include/xen/vpci.h        |  4 ++--
 5 files changed, 52 insertions(+), 17 deletions(-)

diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index f2d9d14b4d..2405e39517 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1505,6 +1505,7 @@ int xc_assign_device(
     domctl.domain =3D domid;
     domctl.u.assign_device.dev =3D XEN_DOMCTL_DEV_PCI;
     domctl.u.assign_device.u.pci.machine_sbdf =3D machine_sbdf;
+    domctl.u.assign_device.u.pci.virtual_sbdf =3D XEN_DOMCTL_DEV_SDBF_ANY;
     domctl.u.assign_device.flags =3D flags;
=20
     return do_domctl(xch, &domctl);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index a3312fdab2..9ea18c39f4 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -755,7 +755,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * For devices not discovered by Xen during boot, add vPCI handler=
s
          * when Dom0 first informs Xen about such devices.
          */
-        ret =3D vpci_assign_device(pdev);
+        ret =3D vpci_assign_device(pdev, NULL);
         if ( ret )
         {
             list_del(&pdev->domain_list);
@@ -891,7 +891,7 @@ static int deassign_device(struct domain *d, uint16_t s=
eg, uint8_t bus,
     pdev->fault.count =3D 0;
=20
     write_lock(&target->pci_lock);
-    ret =3D vpci_assign_device(pdev);
+    ret =3D vpci_assign_device(pdev, NULL);
     write_unlock(&target->pci_lock);
=20
  out:
@@ -1154,7 +1154,7 @@ static void __hwdom_init setup_one_hwdom_device(const=
 struct setup_hwdom *ctxt,
               PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn) );
=20
     write_lock(&ctxt->d->pci_lock);
-    err =3D vpci_assign_device(pdev);
+    err =3D vpci_assign_device(pdev, NULL);
     write_unlock(&ctxt->d->pci_lock);
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
@@ -1461,7 +1461,8 @@ static int device_assigned(u16 seg, u8 bus, u8 devfn)
 }
=20
 /* Caller should hold the pcidevs_lock */
-static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 =
flag)
+static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 =
flag,
+                         pci_sbdf_t *vsbdf)
 {
     const struct domain_iommu *hd =3D dom_iommu(d);
     struct pci_dev *pdev;
@@ -1515,7 +1516,7 @@ static int assign_device(struct domain *d, u16 seg, u=
8 bus, u8 devfn, u32 flag)
     }
=20
     write_lock(&d->pci_lock);
-    rc =3D vpci_assign_device(pdev);
+    rc =3D vpci_assign_device(pdev, vsbdf);
     write_unlock(&d->pci_lock);
=20
  done:
@@ -1616,6 +1617,7 @@ int iommu_do_pci_domctl(
     u8 bus, devfn;
     int ret =3D 0;
     uint32_t machine_sbdf;
+    pci_sbdf_t virtual_sbdf;
=20
     switch ( domctl->cmd )
     {
@@ -1675,6 +1677,7 @@ int iommu_do_pci_domctl(
             break;
=20
         machine_sbdf =3D domctl->u.assign_device.u.pci.machine_sbdf;
+        virtual_sbdf.sbdf =3D domctl->u.assign_device.u.pci.virtual_sbdf;
=20
         ret =3D xsm_assign_device(XSM_HOOK, d, machine_sbdf);
         if ( ret )
@@ -1696,11 +1699,13 @@ int iommu_do_pci_domctl(
             }
         }
         else if ( !ret )
-            ret =3D assign_device(d, seg, bus, devfn, flags);
+            ret =3D assign_device(d, seg, bus, devfn, flags, &virtual_sbdf=
);
         pcidevs_unlock();
         if ( ret =3D=3D -ERESTART )
             ret =3D hypercall_create_continuation(__HYPERVISOR_domctl,
                                                 "h", u_domctl);
+
+        domctl->u.assign_device.u.pci.virtual_sbdf =3D virtual_sbdf.sbdf;
         break;
=20
     case XEN_DOMCTL_deassign_device:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 7c0b610ccc..12963b77c3 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -37,7 +37,7 @@ extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
=20
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
-static int add_virtual_device(struct pci_dev *pdev)
+static int add_virtual_device(struct pci_dev *pdev, pci_sbdf_t *vsbdf)
 {
     struct domain *d =3D pdev->domain;
     unsigned int new_dev_number;
@@ -57,13 +57,35 @@ static int add_virtual_device(struct pci_dev *pdev)
                  &pdev->sbdf);
         return -EOPNOTSUPP;
     }
-    new_dev_number =3D find_first_zero_bit(d->vpci_dev_assigned_map,
-                                         VPCI_MAX_VIRT_DEV);
-    if ( new_dev_number =3D=3D VPCI_MAX_VIRT_DEV )
-        return -ENOSPC;
=20
-    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
+    if ( !vsbdf || vsbdf->sbdf =3D=3D XEN_DOMCTL_DEV_SDBF_ANY )
+    {
+        new_dev_number =3D find_first_zero_bit(d->vpci_dev_assigned_map,
+                                             VPCI_MAX_VIRT_DEV);
+        if ( new_dev_number =3D=3D VPCI_MAX_VIRT_DEV )
+            return -ENOSPC;
=20
+        if ( vsbdf )
+            *vsbdf =3D PCI_SBDF(0, 0, new_dev_number, 0);
+    }
+    else
+    {
+        if ( vsbdf->seg !=3D 0 || vsbdf->bus !=3D 0 || vsbdf->fn !=3D 0 )
+        {
+            gdprintk(XENLOG_ERR,
+                     "vSBDF %pp: segment, bus and function should be 0\n",
+                     vsbdf);
+            return -EOPNOTSUPP;
+        }
+        new_dev_number =3D vsbdf->dev;
+        if ( test_bit(new_dev_number, &d->vpci_dev_assigned_map) )
+        {
+            gdprintk(XENLOG_ERR, "vSBDF %pp already assigned\n", vsbdf);
+            return -EOPNOTSUPP;
+        }
+    }
+
+    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
     /*
      * Both segment and bus number are 0:
      *  - we emulate a single host bridge for the guest, e.g. segment 0
@@ -148,7 +170,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
     pdev->vpci =3D NULL;
 }
=20
-int vpci_assign_device(struct pci_dev *pdev)
+int vpci_assign_device(struct pci_dev *pdev, pci_sbdf_t *vsbdf)
 {
     unsigned int i;
     const unsigned long *ro_map;
@@ -176,7 +198,7 @@ int vpci_assign_device(struct pci_dev *pdev)
=20
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
     pdev->vpci->guest_sbdf.sbdf =3D ~0;
-    rc =3D add_virtual_device(pdev);
+    rc =3D add_virtual_device(pdev, vsbdf);
     if ( rc )
         goto out;
 #endif
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..60a59ce378 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -504,7 +504,12 @@ struct xen_domctl_sendtrigger {
=20
=20
 /* Assign a device to a guest. Sets up IOMMU structures. */
-/* XEN_DOMCTL_assign_device */
+/* XEN_DOMCTL_assign_device
+ * when assigning a PCI device, it is possible to either request
+ * or provide a virtual SBDF. When virtual_sbdf equals to
+ * XEN_DOMCTL_DEV_SDBF_ANY, hypervisor will return allocated
+ * vSBDF back.
+ */
 /*
  * XEN_DOMCTL_test_assign_device: Pass DOMID_INVALID to find out whether t=
he
  * given device is assigned to any DomU at all. Pass a specific domain ID =
to
@@ -528,6 +533,8 @@ struct xen_domctl_assign_device {
     union {
         struct {
             uint32_t machine_sbdf;   /* machine PCI ID of assigned device =
*/
+            uint32_t virtual_sbdf;   /* IN/OUT virtual SBDF of the device =
*/
+#define XEN_DOMCTL_DEV_SDBF_ANY     0xFFFFFFFF /* request a free SBDF */
         } pci;
         struct {
             uint32_t size; /* Length of the path */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index ec6598237b..f66a641e4f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -33,7 +33,7 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
                __used_section(".data.vpci." p) =3D x
=20
 /* Assign vPCI to device by adding handlers to device. */
-int __must_check vpci_assign_device(struct pci_dev *pdev);
+int __must_check vpci_assign_device(struct pci_dev *pdev, pci_sbdf_t *vsbd=
f);
=20
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
@@ -265,7 +265,7 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, =
unsigned int len,
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
=20
-static inline int vpci_assign_device(struct pci_dev *pdev)
+static inline int vpci_assign_device(struct pci_dev *pdev, pci_sbdf_t *vsb=
df)
 {
     return 0;
 }
--=20
2.43.0

