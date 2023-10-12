Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29207C794B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616067.957797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s3-0001Wr-9t; Thu, 12 Oct 2023 22:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616067.957797; Thu, 12 Oct 2023 22:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s3-0001Nj-2b; Thu, 12 Oct 2023 22:09:31 +0000
Received: by outflank-mailman (input) for mailman id 616067;
 Thu, 12 Oct 2023 22:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s0-00016s-O7
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:28 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00298d58-694c-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 00:09:24 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqml8008371; Thu, 12 Oct 2023 22:09:21 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8dp-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:21 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6376.eurprd03.prod.outlook.com (2603:10a6:10:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:09:16 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:16 +0000
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
X-Inumbo-ID: 00298d58-694c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCUez6HIdfcr1Yr7xZFa4YnP3Ck7kWtx5ZCufd0F5z3GXbzU6+Q1IwHRPPkYhzGc1lpaSBnKITIkZc5vV5eiEv3rnZddrCf+9IS0n7/bxs5CfozBM9+TXfd+BHTUnaoBqmfC8phIs1dsn2eMgOJ8DcARhaH+vCJE64ESfJaHfOHdfUk4XpZmn5ovfxg8Q0FRR9nHbxfo08EiFhCHlu+CY/TKhWE2wwvoEebj+lCUXJHj4vDfTjc1wFjkVXYX5+Cq9Ox0gjaXwbKhwSFhd5Lm6Z454e7DzgffXlD/y30wRVB6WL9KsDtKubpkt7pZsCCH///eirgb071Ej1t1WxUfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qmsepwPT5LEYBRF5H3XVtxBcmvh8BkH9lW5MHLqJWE=;
 b=N8Nw+usgSJRHJVFyRTs4mfN5DxrFxBpFMGeMcWVhpbFMXdXP31sOFzVz0g6xUqdlsMw/urL2vPOXa3L3eqgg/XwZrdhzW7EH9VLuE9JkgBYAH3SxG+mCx8JVxJ9OovZWhUV9lt88ZRt89o54KSEgamCHaytB3vr7M41Ctje3aQa8CSkWmHClYYaeXn2KYCA+VOq0h648DAAFTlzdDQrEkpKxmwBcXuXtnEr1HqxbxpHJrLq/MwJSkzh/SnOOOawLGVLzS3ub1w9cwf65MkkChtASC2qWgs7yrK+RLbQXQbq3eXXIQ71h5zoHIFu78wsaaVdrV/ySRd4zwnDyN7BMjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qmsepwPT5LEYBRF5H3XVtxBcmvh8BkH9lW5MHLqJWE=;
 b=bsJ+IMRouNrG9vZQ3Pub+bkrb1CdKlZG3BpzrbYNXBnDBjdRU73CSCb0XrAw6WqiTF+lARHviht/CfdrrxPTLMPg2hzddStp8Y0RgE+1nZgPqPfqrHDrAvL8F1dnVPUXn+aQAmOJO6PncvGSK1T8ikr42lFtLQaWclGx/89TDU2aGzCoJBYfAAyj2ouDg7mG+5vIO6sWRHJ/Bxf3loEoQai6M+zDa5S0ztp5TCPrGyxVwycgMcKVywpwyGh5tVJBuYXvgCQQ/rCO8clkS5kLR+E/Nlo8Wj+H8ErL5qCguRuT3j8VGruz2vC2KILE3doQNaRsV9+0K3YgdFwzoE+ZKg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 05/17] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v10 05/17] vpci: add hooks for PCI device
 assign/de-assign
Thread-Index: AQHZ/Vi9fq+uOYreoU2R3lof3/0hww==
Date: Thu, 12 Oct 2023 22:09:15 +0000
Message-ID: <20231012220854.2736994-6-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6376:EE_
x-ms-office365-filtering-correlation-id: cf61ec12-f889-4405-110e-08dbcb6fe03c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qu9pTc5w0Ntn2RomDq8KEVzcM+p2XK18Gtxpt76OEIK4kbpUgS8Y3srZBY95pZuNCVVH6RaZRQHtredepyPK5sOR1Rs74CB/IMzl+cx6g7fRW2yIg51qpyAYoTyx33RGbgFm+X1AbuZbd4m48ZXaD6oLt5GLTDXWf+5nreJSKhe+AaUwzNTwo0+wXFLekeLo5KhtWJm2QOuN9ozVBTEmfh7GycuNgG42OCf/5DGqhf+hsp4TA5Nwf1ZkhenPU1dIr3zqW0kq5mmPbk/Arw0dx3vmhrRXft71uf2G0erjUJBb7akEBdoYEfozPWhC9CV1E8NL3FvRhjjO+U9X/0oEy3dLQUv3hlX8UC0CSfUeRPvLVCNy5PZIA89yUClx2cogJlw8+yuDZ6C6rWJ4S77Tw5fH+8X++oTAOSIZlD+noLWgBOE5CfzrQP0XNr5JzA7546fKuzQtGnxGOSp6e2Ak4OqoKfXBicxh5JpGBpZz+BnruS9GzyuloxKv0QByBGH7id0idxhSx53ZMkoE7MrxT2k095nnj8TngUmm7CCUAzLjtiSTyk0GHCmicci3QtKxQsgGI6Zjc8B74uaOCZYL08UxllNmjcuUMT2u7jjKGZpv4gSzEa9DxtzxKPb10xAq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(107886003)(2616005)(71200400001)(26005)(6512007)(6506007)(55236004)(36756003)(86362001)(38100700002)(38070700005)(122000001)(1076003)(83380400001)(91956017)(41300700001)(64756008)(316002)(76116006)(54906003)(66946007)(66446008)(6916009)(66556008)(66476007)(2906002)(8936002)(5660300002)(8676002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3Pj47ZPJX0bsHYz6M+r4sGBWeJE4qa0wCHPbthmG6vHAwYWyhWBNBKXp41?=
 =?iso-8859-1?Q?aH7jDcOVfFoIt1sV1Hj5qNCkRIt8vJkHQ8Jcg0PF36PfnNts2gAzwa8Van?=
 =?iso-8859-1?Q?dEpimYJpD68A7IhtioyKIoI1wTTU4nydak6NM+JTaReiCbQIEXrkkUMbCb?=
 =?iso-8859-1?Q?B34OFgW9PNPX+iB05ppNoNfeTi3uwE7GnncQ3/GTydD1I0D7ZlBt+AbD9O?=
 =?iso-8859-1?Q?pSQ3FZbhT3rRlaKBmBF5hGDbEXoNUi/Ck3B4Z6a0pat2HcTrNUVhxlg35O?=
 =?iso-8859-1?Q?rUQqpHn8ofmhOm0yXR21GmLho8EkARzQMNvBhciaQFUUsNhYaYBDxZf/Bd?=
 =?iso-8859-1?Q?2Uxb8idF8I0uZjrCR88zUzQ1q2rBCG7gtNrOPzA/CSq2f7hpmU/1jxbtr6?=
 =?iso-8859-1?Q?5IIp3UMwefIe93+nqqD1HfACTvc8c3zhkIcZHPDiTBydDL/5WVIo3x4DfA?=
 =?iso-8859-1?Q?Y1Upo3+46Xg0Akx7YmDSEl7mYnNV1bvZv3lvD84wa2LKzNR09/i2NtA2sO?=
 =?iso-8859-1?Q?uiHynWGZlovP8R9Z/zxS+MNXlonPrzdooLMwNmdvqbdeGgy2YyWKS/S/YX?=
 =?iso-8859-1?Q?VjNG6PwACLdoOwTVX9Z+El6j/quQJXfCpnw9xodwItMbu45o06N7WdRHr/?=
 =?iso-8859-1?Q?tS1KLWmnHetKZls7csdO0nJNrArZ3N1S1vAOe+M+/U84TmT7Q7mbRZXzph?=
 =?iso-8859-1?Q?V7FWIY+8uZP1qjidwXaNINWQooF4tm13Ho5W0C4aZ2PnotppurJZMPhusL?=
 =?iso-8859-1?Q?F9a/E1nSUdRIInZfNn5vhF1YWO+wDH9UI5VUSjn/UlCrsXRp6czTvFO0aC?=
 =?iso-8859-1?Q?4GSf6IoHmL2TDcDMDwdKfN2ZG/LmniahpmVNBufE7p84ggnJEPu5FqjSo+?=
 =?iso-8859-1?Q?Osf0KyTeKtrNS4fgGC8AmTy4cUXA7lIMRUUh0AbpsD5qQmyBIzS9ju8NxU?=
 =?iso-8859-1?Q?NjzXd7xd6etc7oXhEwrpYF3qUknRWzK41TNOmBDEyUv6i9UMe5elkiJIkL?=
 =?iso-8859-1?Q?j6wSRm0MiBZ8iz5fxg86oEHVTHxlp2W0HunugkZqQa+dxFCPBIpKOkyGY9?=
 =?iso-8859-1?Q?ry1B3pfjjz0epHyWE55RC6CkHPjl2u1qjCCZSdluwahBPwCkbTWkzGtKq0?=
 =?iso-8859-1?Q?thUyTq0QozUmeOjRPRlHix0EzEOrHxWi4BUfsPQa3NKhxJfaYS2F3FKyQl?=
 =?iso-8859-1?Q?ojXlldBIFK6MP7ixShyLXt6g+u/YW4F93yttQphA5iu9A6x5o9zCuJT/c/?=
 =?iso-8859-1?Q?qGEV9LAIT6cQ63AJ1dTs+/swMHCnUprXL3feh+LIh69S+lL4PUipm2i5c8?=
 =?iso-8859-1?Q?e2X9FNPQ0nM2Cn43tRFCKvQt+LB+0jTYJ+oGunRMuLI8loEwIBLyhjUMGw?=
 =?iso-8859-1?Q?yYRwShfvS7PxAwYU1HhYQVkMX7RlH2wXPz8/TC3kMevuk3IfsyuldXBsAF?=
 =?iso-8859-1?Q?QzILH+7W0vR7cahW8WoK/ilPmYlmIRHQce8QUObH8YFeTJZzQxJo00GYrd?=
 =?iso-8859-1?Q?83lXcY54s3mnp1xbCQ7hzfqoDQSqoazrM8+bsgvzVp1jW1IsO/ORd3GrjH?=
 =?iso-8859-1?Q?Zt3iAp3R3hteXx/nboBPuaIqfICryJRNrR5XRD3obkDJM5BI2TR0IB7AC7?=
 =?iso-8859-1?Q?pyPc8cmVYRAeYK9QkKDGWOkKP2rG5qEUJmlcGsumI1dJk5PPxnvA3GGg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf61ec12-f889-4405-110e-08dbcb6fe03c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:15.9960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIAFc4iL0q9YIslbonRlXVRU1pNguMnvCgzJ07rAgBenojzNTT7UcMvzPiUv2SPliGZ9/dXvhkLC7HdVgZKLal8iNfjKe2GtUGY/EJE+ZZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6376
X-Proofpoint-GUID: xPGnu4w1kRYsw0G2gEzggBmRHh7JGbMm
X-Proofpoint-ORIG-GUID: xPGnu4w1kRYsw0G2gEzggBmRHh7JGbMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=803
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned we need to
initialize/de-initialize vPCI state for the device.

Also, rename vpci_add_handlers() to vpci_assign_device() and
vpci_remove_device() to vpci_deassign_device() to better reflect role
of the functions.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---

In v10:
- removed HAS_VPCI_GUEST_SUPPORT checks
- HAS_VPCI_GUEST_SUPPORT config option (in Kconfig) as it is not used
  anywhere
In v9:
- removed previous  vpci_[de]assign_device function and renamed
  existing handlers
- dropped attempts to handle errors in assign_device() function
- do not call vpci_assign_device for dom_io
- use d instead of pdev->domain
- use IS_ENABLED macro
In v8:
- removed vpci_deassign_device
In v6:
- do not pass struct domain to vpci_{assign|deassign}_device as
  pdev->domain can be used
- do not leave the device assigned (pdev->domain =3D=3D new domain) in case
  vpci_assign_device fails: try to de-assign and if this also fails, then
  crash the domain
In v5:
- do not split code into run_vpci_init
- do not check for is_system_domain in vpci_{de}assign_device
- do not use vpci_remove_device_handlers_locked and re-allocate
  pdev->vpci completely
- make vpci_deassign_device void
In v4:
 - de-assign vPCI from the previous domain on device assignment
 - do not remove handlers in vpci_assign_device as those must not
   exist at that point
In v3:
 - remove toolstack roll-back description from the commit message
   as error are to be handled with proper cleanup in Xen itself
 - remove __must_check
 - remove redundant rc check while assigning devices
 - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
 - use REGISTER_VPCI_INIT machinery to run required steps on device
   init/assign: add run_vpci_init helper
In v2:
- define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
  for x86
In v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - extended the commit message
---
 xen/drivers/passthrough/pci.c | 20 ++++++++++++++++----
 xen/drivers/vpci/header.c     |  2 +-
 xen/drivers/vpci/vpci.c       |  6 +++---
 xen/include/xen/vpci.h        | 10 +++++-----
 4 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 182da45acb..b7926a291c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -755,7 +755,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * For devices not discovered by Xen during boot, add vPCI handler=
s
          * when Dom0 first informs Xen about such devices.
          */
-        ret =3D vpci_add_handlers(pdev);
+        ret =3D vpci_assign_device(pdev);
         if ( ret )
         {
             list_del(&pdev->domain_list);
@@ -769,7 +769,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             write_lock(&hardware_domain->pci_lock);
-            vpci_remove_device(pdev);
+            vpci_deassign_device(pdev);
             list_del(&pdev->domain_list);
             write_unlock(&hardware_domain->pci_lock);
             pdev->domain =3D NULL;
@@ -817,7 +817,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
         {
-            vpci_remove_device(pdev);
+            vpci_deassign_device(pdev);
             pci_cleanup_msi(pdev);
             ret =3D iommu_remove_device(pdev);
             if ( pdev->domain )
@@ -875,6 +875,10 @@ static int deassign_device(struct domain *d, uint16_t =
seg, uint8_t bus,
             goto out;
     }
=20
+    write_lock(&d->pci_lock);
+    vpci_deassign_device(pdev);
+    write_unlock(&d->pci_lock);
+
     devfn =3D pdev->devfn;
     ret =3D iommu_call(hd->platform_ops, reassign_device, d, target, devfn=
,
                      pci_to_dev(pdev));
@@ -1146,7 +1150,7 @@ static void __hwdom_init setup_one_hwdom_device(const=
 struct setup_hwdom *ctxt,
               PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn) );
=20
     write_lock(&ctxt->d->pci_lock);
-    err =3D vpci_add_handlers(pdev);
+    err =3D vpci_assign_device(pdev);
     write_unlock(&ctxt->d->pci_lock);
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
@@ -1476,6 +1480,10 @@ static int assign_device(struct domain *d, u16 seg, =
u8 bus, u8 devfn, u32 flag)
     if ( pdev->broken && d !=3D hardware_domain && d !=3D dom_io )
         goto done;
=20
+    write_lock(&pdev->domain->pci_lock);
+    vpci_deassign_device(pdev);
+    write_unlock(&pdev->domain->pci_lock);
+
     rc =3D pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1502,6 +1510,10 @@ static int assign_device(struct domain *d, u16 seg, =
u8 bus, u8 devfn, u32 flag)
                         pci_to_dev(pdev), flag);
     }
=20
+    write_lock(&d->pci_lock);
+    rc =3D vpci_assign_device(pdev);
+    write_unlock(&d->pci_lock);
+
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a52e52db96..176fe16b9f 100644
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
index 724987e981..b20bee2b0b 100644
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
index d743d96a10..75cfb532ee 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -25,11 +25,11 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) =3D x
=20
-/* Add vPCI handlers to device. */
-int __must_check vpci_add_handlers(struct pci_dev *pdev);
+/* Assign vPCI to device by adding handlers to device. */
+int __must_check vpci_assign_device(struct pci_dev *pdev);
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
2.42.0

