Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B278D045
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592519.925338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80F-0001HE-HG; Tue, 29 Aug 2023 23:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592519.925338; Tue, 29 Aug 2023 23:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80F-00016J-8Z; Tue, 29 Aug 2023 23:20:07 +0000
Received: by outflank-mailman (input) for mailman id 592519;
 Tue, 29 Aug 2023 23:20:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb80C-0006kQ-T5
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:20:05 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 939c97f0-46c2-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 01:20:02 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKDecl030691; Tue, 29 Aug 2023 23:19:51 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3sshtetfcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:51 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:44 +0000
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
X-Inumbo-ID: 939c97f0-46c2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ5wXgSC1jc1h74EM/5aGLLfDLosKF0g/GeKmNf6VJv6a0VWOCtBOsk9Gcdc/daJIqGKTkpPSjAbhBbyAE2/E1cLGkOx7OkqDKp3ExYOm0co8BWl8IDx3Ztp1Ujs1dl2OAOX+msO7mI3URHMKUxL0DDpyptiq0nZ8KddStUm0xwQ78ToFXhVoeYE0vSvVZUjq90dVORw4PQpwow8MNp9RJle9PrCPSs+Tip84Q8hOel3iE8S5UE86DEfAs2qFrfvwLLEAgHv/t6HGzj7i2BJ9nMe4G4f4DeeGlEzl4CJ3na+H3hosR56EvqPoTal4BZHoT37Zh4gUaP1UVA97iY9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqo0lIpyoeqKdrOeyKISSpFZaUk68QMHC1iBCANdCXU=;
 b=ZDGwcHy3wWuCx2U02CGAsS1IGHxgUMtgEaRSfxtoowRKIsJoeSgdpdBLbpUNxLogGRtkHg2I2SYAO1px9uxTW7j3SMW3e2yO/Pi2VXXrKoTVTTm6OTAnttvGhfXt+2d77DEgv/EIKoZTOM+CzkDiXboNqp88Mvg8U6d8kEPL0pdwcS+honJot9r6bAIF+FRnednt6qrjg4ZCnHCs1mHnqNUsfDwVY1v2ydmXbkv55mpiarfVWV8njMtD/K2Tr8rbvTjc905s1DeDxeJnPx0D9l8onss+AXnewTUGGJzlkKVhajkzNAfcDIOgMkm+57ywtPHo+XTIrPbZb44ZZgpRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqo0lIpyoeqKdrOeyKISSpFZaUk68QMHC1iBCANdCXU=;
 b=shg+Na9RPMWawWNUvPfvqTOZIIf02DwYdHjtquPDHxHbSW4HGfSRb2qeOuGfMARcYC4uSSWFigTYH4ZVRjhepBKKHRq0Dk4P1l+1GZrTk+gGl1FeL3A70r055600FSwXR5V8iPjx+epHOKD0OdsS/TD9Pw9zINnkamMYrcxrw4daE3psMvhVITOq8jCFA28VQvx7gLKjcVVMLnZ7WUhKB7Qq2CMCDorhzYCuaez4xF1Mj2Om3UGLyxyNDFVXqHu12y2E1hnilr9Ajte870deG0mO9D02qRyshLqq+f7Iycicg+d9tY5yoayI01aJjMgNCTrAz2JggT7cwQi8GucNFA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHZ2s9Kc9kNunOnfUurMYypVVbdQw==
Date: Tue, 29 Aug 2023 23:19:43 +0000
Message-ID: <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: 81ba55c1-be66-41dd-3a21-08dba8e66dc7
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 El8avuJZNZmNg3xcD1dBgxgN5MFuNoMAfPBWQdGbypZvCKNgmaBFyLJAIcgH/bQZzqg+paXKyKhyDF3PI1Nmx6HeWS98k/Lc8HJEM1g9V+aQtcfWl2pY027b4HdUTgP4r+rL9ZaPtGB8cWgxKCUqn5TNNfpkJFoZNbbX/Nw97ACqvEgZt4IY5gB2hLrqZXiSND1eruG54HWqS48cD7TnOH8CnX6GrojEbpmRLK6SfjkklgS7lu9ZLpc+J5cvJuy+ONV0ZHYVOJo0PP6mbN1Dga0idOd80xV4vKJGnS8JmgyNxIfpnFhQKbVp1iFwezF7z4reYkjrkmSJZkg6h+88qzyRNR/B/y0nG/A5ZCbKb41H4uQjbbXyEsqbLHDEQgNFgY4b3QYz9kP4jL5pnKb2EeufDsEJSkrGYDvg64BomIYk3slE8aLc5DsT3zvXRmEOSjml5GB4jjdOQv4Yx7U4a1XMbWVIhmWKXDb5kKF4vuuBnh/6v9EC+qVJD+0GjGl2mxRrRt1u0AnKislMjAhLFN0qypKCSRpk++m5fhUcK76mfcHTaNUkj2Yi0TieuUAZoaWQj/Iy3T5i1lAXq+bfM1lIDgD5xqXoT42wl0NXAVzXeClZV1ON5CyKQwEw15bF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(107886003)(26005)(2906002)(6916009)(64756008)(7416002)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?36grGadin6qj2+yeifNDUNPlqt7KRPx6oAFjqqp8dIbqkGX+w4O5N4lBqP?=
 =?iso-8859-1?Q?d34XcWbjMFwsUUR+6bf58fnzQxpWgMyErPicYbA+eywZfYuqItUzVGkSb/?=
 =?iso-8859-1?Q?dKoGrBOgR8G5Yxk7WrMz2oyvaed0xGFase4mbnj6V2JMN1Zvk1aUgf7cVC?=
 =?iso-8859-1?Q?M7RXJOoqrMSvUfdrMse6beRXI1m8jaezMY6S6lzNEHLEI/6fKu3MBy7fw0?=
 =?iso-8859-1?Q?bfhS7DjH6inDAvO8EDEzTsaxuaNH6gaEGZ55Om43i/xw1W4xuLVqwEWNxD?=
 =?iso-8859-1?Q?84RQQ8E22VoqrnzuXnbW49V3XMNQoq/aJ898X+ukPRFS/vpSg5KxVLPMNi?=
 =?iso-8859-1?Q?4cQS+z0jYYRUrzdcWfEh/VlIP3m5kOFBiCtiUl4Ui0ebE8BR6a6Kb1r/o8?=
 =?iso-8859-1?Q?e9tlTpJDQyL56VljSvWvy27J8hFdmFapk2RiYHPYaAUnOohxlY/ITmJeed?=
 =?iso-8859-1?Q?KEZLmxmjGWHTrisUJtRbb/6KET0khlrFiZBEtR+vqMFMXKEFrICXeQoz+b?=
 =?iso-8859-1?Q?U9knEBDkUd1eztVtl+Jt4dHZmU5MWpQIhRk242EPAQWQKSsTuNOoDQ3oqV?=
 =?iso-8859-1?Q?Fzgf6JiYU8+xK7NxNVY/c68okFZ4gtdWDLVOS64f9EMj0W+MfFGKgCxlXQ?=
 =?iso-8859-1?Q?WGK1dADr40mEodgGsCwm8rxJA8JMBcE5R570tT1LJ2Af4XPNc4zpPqtYf1?=
 =?iso-8859-1?Q?shJ/Idu2B5ezTbBgRX0s+1bL9lDeVVBQqRrRw7uz9SKxnG02l7hjxIkNpX?=
 =?iso-8859-1?Q?JFSxq86USPciX0JJ2sRWxxx4GULxXOcVi9gb0j6ajBlfCd55yEY/YrKZdq?=
 =?iso-8859-1?Q?KjbmzxUpQP1Xm/VwA7d2k6xe9itzI3E3peb39eDgxTOV1mxp3zGDwN7Utv?=
 =?iso-8859-1?Q?SQVtU/A85kjWqUDCJkCH56NWcb+FxflN9hWU1UZ9y8aTkn9XcyqKAyDCND?=
 =?iso-8859-1?Q?KIIytFpTIGzVLj8MEMK1rPpCm3/+j1aKf5DWzPLvrurSNVpDi8gZok+QSo?=
 =?iso-8859-1?Q?zd2LXJm8SlTeKWguruUnV1R/tj8Pdw7bMHXv0mcuuC/jsmuJxpAmQbIEqk?=
 =?iso-8859-1?Q?X/fWrR1MDS0m9jZ+tNTcw8U/nE1iQotTYeDALHriZbELgpfvQzco6DamAk?=
 =?iso-8859-1?Q?Z08Svd0lcvwVbqxgRBZKxA/1DU45JZqGBmN1G2OADaykGQq2S0Z1gj3Qko?=
 =?iso-8859-1?Q?DSl5k5WDpPY6XZeEzLnzi6bnJlIUXLZRNRvo16ABiA+wV8AnZ0vGU7m68Z?=
 =?iso-8859-1?Q?yZZBNX2Simvkk3f6BbYnt3vatYO8QGNy01dxRyFuBVr5b2oEBQieIXopBy?=
 =?iso-8859-1?Q?S7iuHsulwK/FlmBNo/YR884/BC8UlxP3lyS73889PejASVODG73zyspaa1?=
 =?iso-8859-1?Q?dnUehFmeKvs6Me2SesY/PRQGXA0QGWM00i/OpbNvlGFd3K2pqRsUUgajxL?=
 =?iso-8859-1?Q?tLFca5dj4xki/EyBG+N4wNzwu5VPkhfBScVNim2AA+wvUwTX+lq+frRI0D?=
 =?iso-8859-1?Q?aG1Yr8HjL32jXUxX27H1+rxt4LsteKZY7EBvzVDvzXNqSa9QhZQYBnZW3D?=
 =?iso-8859-1?Q?vfTQv139e3c1gPigLTKGad+61kWxo05Vt86hsixiof4PrNDDtsyqsC/lYb?=
 =?iso-8859-1?Q?5k1AIL607R3ra5yl3EYoaK3TFlBJaVszFrd62Q1HQCpUhQ9nNx6aeB0A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ba55c1-be66-41dd-3a21-08dba8e66dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:43.1413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ecf9w9tlXYTNeCIHHZGeQ4LnsaJezbdJtoWgvGLedK45HgRTIrMwaW4HIi0VlLaCpg7r64AN0vMiq7Sbhihbi/7Y/ENPO4va51BdY1GUxDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: coPqyw37LHHegyecz7JU3l-gbNxPbmBI
X-Proofpoint-GUID: coPqyw37LHHegyecz7JU3l-gbNxPbmBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=735 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned we need to
initialize/de-initialize vPCI state for the device.

Also, rename vpci_add_handlers() to vpci_assign_device() and
vpci_remove_device() to vpci_deassign_device() to better reflect role
of the functions.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
Since v9:
- removed previous  vpci_[de]assign_device function and renamed
  existing handlers
- dropped attempts to handle errors in assign_device() function
- do not call vpci_assign_device for dom_io
- use d instead of pdev->domain
- use IS_ENABLED macro
Since v8:
- removed vpci_deassign_device
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
 xen/drivers/passthrough/pci.c | 31 +++++++++++++++++++++++++++----
 xen/drivers/vpci/header.c     |  2 +-
 xen/drivers/vpci/vpci.c       |  6 +++---
 xen/include/xen/vpci.h        | 10 +++++-----
 5 files changed, 40 insertions(+), 13 deletions(-)

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
index 4f18293900..64281f2d5e 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -757,7 +757,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * For devices not discovered by Xen during boot, add vPCI handler=
s
          * when Dom0 first informs Xen about such devices.
          */
-        ret =3D vpci_add_handlers(pdev);
+        ret =3D vpci_assign_device(pdev);
         if ( ret )
         {
             printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
@@ -771,7 +771,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             write_lock(&hardware_domain->pci_lock);
-            vpci_remove_device(pdev);
+            vpci_deassign_device(pdev);
             list_del(&pdev->domain_list);
             write_unlock(&hardware_domain->pci_lock);
             pdev->domain =3D NULL;
@@ -819,7 +819,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
         {
-            vpci_remove_device(pdev);
+            vpci_deassign_device(pdev);
             pci_cleanup_msi(pdev);
             ret =3D iommu_remove_device(pdev);
             if ( pdev->domain )
@@ -877,6 +877,13 @@ static int deassign_device(struct domain *d, uint16_t =
seg, uint8_t bus,
             goto out;
     }
=20
+    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
+    {
+        write_lock(&d->pci_lock);
+        vpci_deassign_device(pdev);
+        write_unlock(&d->pci_lock);
+    }
+
     devfn =3D pdev->devfn;
     ret =3D iommu_call(hd->platform_ops, reassign_device, d, target, devfn=
,
                      pci_to_dev(pdev));
@@ -1147,7 +1154,7 @@ static void __hwdom_init setup_one_hwdom_device(const=
 struct setup_hwdom *ctxt,
               PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn) );
=20
     write_lock(&ctxt->d->pci_lock);
-    err =3D vpci_add_handlers(pdev);
+    err =3D vpci_assign_device(pdev);
     write_unlock(&ctxt->d->pci_lock);
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
@@ -1481,6 +1488,13 @@ static int assign_device(struct domain *d, u16 seg, =
u8 bus, u8 devfn, u32 flag)
     if ( pdev->broken && d !=3D hardware_domain && d !=3D dom_io )
         goto done;
=20
+    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
+    {
+        write_lock(&pdev->domain->pci_lock);
+        vpci_deassign_device(pdev);
+        write_unlock(&pdev->domain->pci_lock);
+    }
+
     rc =3D pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1506,6 +1520,15 @@ static int assign_device(struct domain *d, u16 seg, =
u8 bus, u8 devfn, u32 flag)
         rc =3D iommu_call(hd->platform_ops, assign_device, d, devfn,
                         pci_to_dev(pdev), flag);
     }
+    if ( rc )
+        goto done;
+
+    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) && d !=3D dom_io)
+    {
+        write_lock(&d->pci_lock);
+        rc =3D vpci_assign_device(pdev);
+        write_unlock(&d->pci_lock);
+    }
=20
  done:
     if ( rc )
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 177a6b57a5..3b797df82f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -190,7 +190,7 @@ bool vpci_process_pending(struct vcpu *v)
              * killed in order to avoid leaking stale p2m mappings on
              * failure.
              */
-            vpci_remove_device(v->vpci.pdev);
+            vpci_deassign_device(v->vpci.pdev);
         write_unlock(&v->domain->pci_lock);
     }
=20
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cb45904114..135d390218 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,7 +36,7 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
=20
-void vpci_remove_device(struct pci_dev *pdev)
+void vpci_deassign_device(struct pci_dev *pdev)
 {
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
@@ -69,7 +69,7 @@ void vpci_remove_device(struct pci_dev *pdev)
     pdev->vpci =3D NULL;
 }
=20
-int vpci_add_handlers(struct pci_dev *pdev)
+int vpci_assign_device(struct pci_dev *pdev)
 {
     unsigned int i;
     const unsigned long *ro_map;
@@ -103,7 +103,7 @@ int vpci_add_handlers(struct pci_dev *pdev)
     }
=20
     if ( rc )
-        vpci_remove_device(pdev);
+        vpci_deassign_device(pdev);
=20
     return rc;
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c74..2a0ae34500 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -25,11 +25,11 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) =3D x
=20
-/* Add vPCI handlers to device. */
-int __must_check vpci_add_handlers(struct pci_dev *dev);
+/* Assign vPCI to device by adding handlers to device. */
+int __must_check vpci_assign_device(struct pci_dev *dev);
=20
 /* Remove all handlers and free vpci related structures. */
-void vpci_remove_device(struct pci_dev *pdev);
+void vpci_deassign_device(struct pci_dev *pdev);
=20
 /* Add/remove a register handler. */
 int __must_check vpci_add_register(struct vpci *vpci,
@@ -235,12 +235,12 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg=
, unsigned int len,
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
=20
-static inline int vpci_add_handlers(struct pci_dev *pdev)
+static inline int vpci_assign_device(struct pci_dev *pdev)
 {
     return 0;
 }
=20
-static inline void vpci_remove_device(struct pci_dev *pdev) { }
+static inline void vpci_deassign_device(struct pci_dev *pdev) { }
=20
 static inline void vpci_dump_msi(void) { }
=20
--=20
2.41.0

