Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C075A37A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566266.884960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHbH-0005KB-S0; Thu, 20 Jul 2023 00:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566266.884960; Thu, 20 Jul 2023 00:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHbH-0005E7-Gy; Thu, 20 Jul 2023 00:32:59 +0000
Received: by outflank-mailman (input) for mailman id 566266;
 Thu, 20 Jul 2023 00:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHbF-0001JN-7d
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:57 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f775df9f-2694-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:32:55 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JMeiBC017190; Thu, 20 Jul 2023 00:32:44 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgyx9k43-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jul 2023 00:32:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:37 +0000
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
X-Inumbo-ID: f775df9f-2694-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuNNQsPzZyGbm3cQ4i6q7pkUtW05fdJNEW4n3hl5Q1Bz3DAtWbLTjHUXtfPm6yigIm0GrMDcDbyv0FFn/AZu6eHTRaso/eAReMLGAD7RcqfeoSs2VEwRKwdza5PP5S2pVCJkKnezPXLXzVV3jhTlWMdqflnZBG71g5fZYdHCq/7iY0rbXa9SVWVI83HwQdOTSuGELGqS7nmYaxCObSGJ3KM9wtrX3NDXaRQmZyeJ8s2tXQYTZpfE8AJHPpV1LzgsKoTbZiepLbO8mdjrI5p7Nlh15ELwZZD9Wy5dqg5StRneCh8bNFE+e21Mvz2MnI8mCryCTFcGQIMO6tfeRFCQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOeSMPEmX5pm3X2mdny5gRhNwdhBLZKMFqHNsWU7Urc=;
 b=Zy5UCkwd1PL+YvSbZoS9AprGbpEYwmnF5X48sWWe4KttoPrAcpp2v9UDDUqfOeF7B2O33Eygf/tmSRzWwBmywlOZ/1qJjPUPLcnIm1LtrCa6fEj24Ga8ddra4grxxAalhp0RzchLyxrJksbGOlt0nX8aecwRseCvPI8qiplH6Qg9LJIwieupzDAs9fQljEiDESmWOGFS6wGmukEimw2s9FsmFr81/WkpO+9QcwQUaEoRnE984F1oNitEHUziwXKGANBxhwhUY4GVNAUQAjIxuCnYao64IaKeJAsceaiy8mTbvbWougJahYrJbDMaPGSePywGPOGnWcsRgm3Xp04EKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOeSMPEmX5pm3X2mdny5gRhNwdhBLZKMFqHNsWU7Urc=;
 b=izNF63YXVb0+slPPZDorbJg1hNAt0cHS2Cv5dBZxIXhuEjNmqJ4694OMETo0ixqmMc9+2MVtGPhgpUeQfk7H6VSkI2dzdsVBQlrj2SlZBOr+eQa02TWkxNGWBztZDae/mR88YZDp9HOZSaQYpcjXFr8/fP36x3oJJwpGHfu5YUdEwZsm1+3wHDMOAzujENz/SNTV6JTT2rqjUP1ahornRaRWjHcVJfLLv7DBZWCf8lcycKXhxKL7NkmgsA7/X/k43IaHHKsH6FJyLt7H085GHa+02+G72tkh2cu/kOqmEoBNFXkdNL1uzWI5mXrMRt18gIzSVZFU+c2fnc37AIo/fQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Julien Grall
	<jgrall@amazon.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v8 13/13] xen/arm: account IO handlers for emulated PCI MSI-X
Thread-Topic: [PATCH v8 13/13] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHZuqGuy4TImO+CVUmVm6UGc30HEQ==
Date: Thu, 20 Jul 2023 00:32:35 +0000
Message-ID: <20230720003205.1828537-14-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 6ac755eb-59f8-4879-2b37-08db88b8d156
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oelM7Z1bEuOVBBZ3IYujx3sAcD7DroaJvScaCRnLkjNCsnB0uk2KRPuKFsHcRktevtdSdkEhp9SNUTZbwjRt9IZsbOOHRUkdnO/15J0bvm2AKRtkzlMsOiICScjUQpkFHDbCjWRw/BygXxttNCGbdbMvBLhR2c7G4sTRtS3WwjB0/B2Y/7ygQJC3VnGNCE+l2ZbiJX7Wjt6gffyyVOVmTiJcBC3mugvttRmmqWKuqrTEc3i9DuseRnpZdreqYIv21SETcqtgznjhrQJ/yJvilTJLHBVLoEUG3aUydlRjfLMZxgQTqw/K7ApS6YAkdvO7Z6UcGM1IMRWWVihEB+v1ESHZj2YG59fWFmKjYPDHgsoE1qXqC6m/Fc5gBCAlt8/4bNOJcH705Jt97DGmw5UQsFk3tWuTnj/Qty/OXdJyZ7Dc9S2ktZEaIchsZ9E/VIvXhcBoXB50HORsiBOODPQGeSS/FaPCHipSUMwS6WPwNqFuRDAoUpW9rUfRn1cZv7t6nd3DEcbfcZygYQv/EOe+N3MvIDE4P+wbB7+NJWt3zpfMqc8IDa41nRSk81tAkLTTSSDK/ij1Vhqkr09MP5peASV9Cn7sDNRMnSVpOafJiRPUjNrEQQT4u7qsRZBf792q
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(186003)(6512007)(6486002)(66899021)(122000001)(478600001)(66946007)(54906003)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(15650500001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?t+zdmAPD7M+3QdUvGvlMfXmE6GDWI09QK8YTLmkWKKP99bQ9QdfMmSygN2?=
 =?iso-8859-1?Q?cCUT9Sd9/CWkwf1yVwpJdPUyBj4dFmwrQ+NZ1hVMdSZe04C0o4shwXmvUx?=
 =?iso-8859-1?Q?WRGR5slUbKMr8UpkKlWw51uJn84dAXDuH58OBWkSVO6YR66KddJLfGAlSJ?=
 =?iso-8859-1?Q?+fvopaf7eoDEh7P1rlP+E0nZDq0MWbaZzZ0Swik/qv93eP6Shc801/5ZP+?=
 =?iso-8859-1?Q?O+WP8Th1le8qiGPYHJt3o84FmZaEeI47rYfsSQu0hI7QOZSPhn5KkAKaJl?=
 =?iso-8859-1?Q?EcbChHgkDEK/sHIQkG1yUPmQQ+Wzdei6WXFuY3shTFezlkzZhJl+6VE7Sb?=
 =?iso-8859-1?Q?G29PTDwh5xAzChNW3C7DBdPB9MVuEPn95RSxnPKMoYlfR/m0+nu9xpqKfh?=
 =?iso-8859-1?Q?ppow95kQ39jpCI1/baGmSwvqf3EUrF0KQJCq8BluO6wAQWCh+jGIUwHi9P?=
 =?iso-8859-1?Q?dDl3AYJXKjfpFo98UNMAQP3h240QhGPJExLL30nzg9pRVdu6nC3WmYHYkz?=
 =?iso-8859-1?Q?Pxbatzsf7G1Y17W02Y9j6BeV6LWLVdhvEumr1H+PyxZsp/PpvxOold1jw/?=
 =?iso-8859-1?Q?gPOahBP093SuErXKA5GXhf92VGGH7SykdkSjnD9vbDFkcrTDIK4bFJIWUw?=
 =?iso-8859-1?Q?H+j13RWkl0MCs8dIns5frAhjmd5ONxxS+LhkCYuY1Qank5tAmQ40BHx1lu?=
 =?iso-8859-1?Q?xZlJmdthcTNMB1L+Q66XYYTYydrh4eQ8sWIe3gfBLdexqmjkNq1KP7YAZ3?=
 =?iso-8859-1?Q?Vewb6yYxGb5+vMd48PIqWo8P6rUCYy7HCFSeQEZSRi/GYK843rQvkV6jCT?=
 =?iso-8859-1?Q?1q63Ttc30sk6r9xt5JdmF97ORlwHTIhVQSobLmcAAhw5OMhSrDsVag3j+l?=
 =?iso-8859-1?Q?ibG09lqeLKS6U3XUYfIQsl9EBKI2tpJCPCXG0tSHRKYwvBvyyGqAC0uQpV?=
 =?iso-8859-1?Q?mzVOGFuzN6vwB/GUT/wAbdpW7CQH6MDE5VoEKfDTrQPO5p5vsvpQSSkaoc?=
 =?iso-8859-1?Q?iDGE3fDGw0HsXXsvGIH/vBedOyV8UEcuQLizFRZcasZBH1Msu9XjFhUpih?=
 =?iso-8859-1?Q?+R1wT7Oq8k8juvCZMC3ePCH5AW/WySvYKsM/n8my/cpLekFkEOPOD1YgF5?=
 =?iso-8859-1?Q?A3tV+4CFDQJNdUXzC4nSko76WfyW7vaHEB1zEM28H9by4o8AaY8/CmO3bM?=
 =?iso-8859-1?Q?0BXNvk8cyqoOQeludQXso7wg+p08ltYqqPDt1totypZfNelB5wSqfDlW2n?=
 =?iso-8859-1?Q?wJQeQZsmIesXVn0s14LoO7WgwvAY6Vb0d+fkFiBaIguTUOwZ+vUShqyjkQ?=
 =?iso-8859-1?Q?jZMnJmj9d6+6uq1kz6m8d0GeMp+yzWE4FkQCzc1aArYrx4qhKGAY3HM8RM?=
 =?iso-8859-1?Q?Oaom71dx2XlwNSbSX6oyu2VcepO0FFtiGAvQGN2jER8Pd9FpAa81VAWMMy?=
 =?iso-8859-1?Q?LLvEk1CYiUMJ8G361wPhRFZMPF30cNc7X4czsnzlsZfAfQq/itf/5g/Jvv?=
 =?iso-8859-1?Q?SB3nTmuQXQbffCFtaWZoigtTy9KZbW8mTNro2POYwNiyDw8T9TYIXiog2b?=
 =?iso-8859-1?Q?yZkk6Qz1lAbCPen65t2W/HA+5EL4K0izg58od+niESNmml39PvdDLt4CHN?=
 =?iso-8859-1?Q?1ns6gkkEy7AjbWHgV4iP69/qW8D8jX0ZwiFrjoiby0P11ElTAEy+IP8g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac755eb-59f8-4879-2b37-08db88b8d156
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:35.8123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUbo/Bc74a1N2QfKguoHLKPITtpKvZDZiD5pvtJdbGXHOzLxfZnsuGGCzQiTiPXbP4rbYqwlHcOVqWtPO4xWGnwjs9Vs7WMp0918AaTT1pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: dy_s8m5gAloB9sJl1xY2va40dAXzmnBl
X-Proofpoint-GUID: dy_s8m5gAloB9sJl1xY2va40dAXzmnBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011
 suspectscore=0 phishscore=0 mlxlogscore=659 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 66701465af..cd9f5d0757 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -148,6 +148,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
=20
@@ -168,7 +170,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct =
domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host br=
idge.
      */
-    return 1;
+    count =3D 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count +=3D VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
=20
 /*
--=20
2.41.0

