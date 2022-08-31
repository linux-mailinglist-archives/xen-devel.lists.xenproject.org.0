Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731C15A7F98
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395684.635514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR2-0003P0-Hm; Wed, 31 Aug 2022 14:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395684.635514; Wed, 31 Aug 2022 14:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR2-0003Ls-Cm; Wed, 31 Aug 2022 14:11:16 +0000
Received: by outflank-mailman (input) for mailman id 395684;
 Wed, 31 Aug 2022 14:11:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOR0-0002bv-22
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:14 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c45f90ea-2936-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 16:11:12 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBpHD9027047;
 Wed, 31 Aug 2022 14:11:06 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3j9huk4eny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:06 +0000
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
X-Inumbo-ID: c45f90ea-2936-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdBMyeS2bf4dH2whMLT+e6ha5bob7QDdy73srMvsV96EzFJY7BPQu3nmJHxRlu/KbyfMn0usSNSG5J0labn/nn1QvZiRLi1ZtaQCQvGE2ra7A0ASI+uoWiH90Fpz3D3lB0TTzxXbQlYBHSH2bq4z4WoEB3YslP9/SANgUB/U2i8xZh18g7PYX9o3VNIRFBbidYUeR2BZHrLcmhsYhvAU2GGahmMNCS+Nkd6QiPS1VhzfuKBYu7Vso+ga1reWlYaX00wJ6B9dXBbGv8nwmULaO6ulEhGYil02K1uCnmD+ISm1+CwUtjlQoHJbY9aTLWGHpLgO34eKr/tShh29m8FLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNHHS4bFB++CGi9rIFiohdrogbiukdzlPrd3LW3sk80=;
 b=nJaFxHWaZKU7a6IZsKviC84uLMAx8hm5IHwF8IKuoTDBpMYn2+43eqmtJtQ1KzHzqGrNt6DoP7FndkTS3brv4GlvH94Csbj0qH9O7QQ1cfauVuAvJrzMtqGZhnCmkZ2ZvjyXiwTmUD4Txtyudp2snEibnLmO65QupJ1g0avu2mHvHICEsNzVzNvx4SbzC2kx+0WB9eMc2i0u0a3+CEFxCho17qOBWul7eZNFbDVx0j4UX8LaD8eUodr4nxXUEce7wdE2eZv+NdvMcc/5qpswt3tuoh6DnmAuId1KhqvNZ2327woPgG/5b3Trl7TSRTKOUdpTsB6Z0Y3jGamNTlI3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNHHS4bFB++CGi9rIFiohdrogbiukdzlPrd3LW3sk80=;
 b=l465qaLkIisF9FEXx3dQZMv8eaar7UBwty0sr4KZKF0Ldab0x0/J9l2qGqLRxjPJIu1CUNA3Xum+HmOdfHb7gsPoonZ35vMO9dcKARf0Np74xnfdGShwQSwbMl0XJ0slFhGxDyyQLiIJLge/c9V/BbISUjmReTORMNOa4XgTqZSLP10dTs/oCqFc16xWTnVAm6J8gDGwLJcAEC0uC6HIne9v5/h9Ne3GNS047mrTHLcC6nI2UwrfxCEo9OuK3zoSrNOfAFrUJpJ5KnqXd9+kdD0QsOk8WfjfBo9S+LvTELkvUDU4C9PMpmQiecJs0C69yGSaOOZi6o5Yj7ZHq+wZ0A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Kevin Tian
	<kevin.tian@intel.com>
Subject: [RFC PATCH 03/10] xen: pci: introduce ats_list_lock
Thread-Topic: [RFC PATCH 03/10] xen: pci: introduce ats_list_lock
Thread-Index: AQHYvUN+A/bxwqt+90CvUR3e9vnmcA==
Date: Wed, 31 Aug 2022 14:10:59 +0000
Message-ID: <20220831141040.13231-4-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4470ba1a-1e34-4fc9-d11d-08da8b5aa144
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QrEARB3ZrAuRvKT4Hde50oCdoWy9MwJlcb2SEbvL/yTmub1XIoSCNkYC0jgibufZQlVgbHqei+cL+VWCOeJEmrsIJFqv21+HCrtWODfMEz8bFZWPmwLb8OHrOeFMLhNDPPq14wZMRiJ2PKGxHdwd10NmTS0kTRn0DZ584Po9hM1XHp+nqOrYmGQNghG5qgAZf+Q2WX6bUR6E+/k14RTwcJxsuH2pdylCadYDMXszVrc79IJAdSlgoGeqdFkormGl0rX30/fyxKulMkjsA2Aam6dgdSHMms4iKynb+mdZJXt/vKcqaerueg+8RvC2GYUKpTFzOv1Cce+YEk+aKp/hYp3JUF2PR1dfuIYUu8bXmfW7+t1/zCRBQs7bBeg+hRDNuYfcvzBimO2IkT8SIPvIP3jPw0s2BKSF4FyVCXmAZqjgry33JKIeGhzPN0dacrlJSvT8fNWCiTAuoUM6PGiEWi7qFXqzRZx/HCEq9ogPTnbGxH0IVdSTpBraQjiE+x5s8oeXY+onBrZsx+4rvhSTFfex9UigqbGvoiEFi8uVuZ9levsESpsnRPn2tBJkwtit0qP4ZOy1OVlEFJmfD58BQzr+Bc/1GEI7dVCHcDoXRAUjJUtc8AQjH0nrvc/E2apL8YVfVhPwbIZYdNZ8UuOF5HaYQnVp55zANexEmrcoF9jMlKtFPfKwPrQ9z972nCXF991txtcZWLDkW/wDo+fl8SWvjpGH+bv0bu+EdUJuTB8oznQggeRKAQ3ZKWAQEwR7Hfxz0phQMcMdGF8fUcOpng==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(8936002)(316002)(36756003)(6916009)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0o33FUy0zVvgwCVvxJmkpR6rD/i4n0Tc5fXmR3kTQE/H7adxHwzTuifnca?=
 =?iso-8859-1?Q?KJ8f0YLDTNNEhrc4J7TT6IbHzPwCURRoNVqyJfJwhqvp1+RtG6sZGbtM0j?=
 =?iso-8859-1?Q?u6a+636G2eTiWNtWZOfjVURmp2go/gAjsGfD/b7yg41g4dME6ZvTGEwjSN?=
 =?iso-8859-1?Q?LPS2mHhPYUvNP6FQhKHyEp9rzMZFsYli6a9VMZM2jjG+GSV62eWpAbbhq0?=
 =?iso-8859-1?Q?EtV7gtxgde22yBHtjIuXXml2OimGzz3Fz59s+5h0+leSlOcx1CJWgt8IiR?=
 =?iso-8859-1?Q?yMg39Zjz6IFvcyy9lnEiTBQGQcVLMdN3gr9xiU0fe7vnl1SC4ol/yj32oG?=
 =?iso-8859-1?Q?suN97ThSyMq5FrHV9gZh5MSQnSeHOUAPiXlZQgH/et7BIUi8eikTJLMw8x?=
 =?iso-8859-1?Q?OkA8E2r3RmDcXLJOSvK/6iiL5eVCXGmOqNJokz/iqrtV1GZVHqXhJFtxL9?=
 =?iso-8859-1?Q?dRSd3ZMcHvaywyOvzUvjV34uG+FBt4jhx4vFWwQhw6NWuptEyPdHpNtHfO?=
 =?iso-8859-1?Q?VnV+AOcxmd63VAXeF9wQcJvCOg8vp4GPATRDDagbhkMNNZVlem8x2btp+m?=
 =?iso-8859-1?Q?mJEcfxjk050fnnV5woBfjM71czPjkW4mzbmx9P/nJ3IJzj3VagI9/X1lsK?=
 =?iso-8859-1?Q?zLnM6Yjx7BuCc9rgAw+nuuZh17CVALLfgMMPKV79hLzA3we9Ty2OHjjHaP?=
 =?iso-8859-1?Q?b5oZzTw/wiUEIRcHBkDhgp4UgwAPF6OslVzHbAmcb7yaEwYmRvZhmsEXdS?=
 =?iso-8859-1?Q?MglIOA5ONwrIHj5t6aeDEP/bdrzjt+mk6N5Cdp6DmooRXuoxtLQ8fi3Hc3?=
 =?iso-8859-1?Q?cwNY35MR4fKeAll4M7HnMlNF90aYmEXyxZe4AXgM3WImatspJCzQm4gaZJ?=
 =?iso-8859-1?Q?t6xIUKxY5jcAjmejuvdB0Y85yJrFpnu6/zFFDILGsEBJzNlpbbyKwBrhad?=
 =?iso-8859-1?Q?RdWBfs/dZW/ikQZbZNiYlmZ6O3BYeqBh/FRRCBwWfhSfElRvwU+mRnZ2MI?=
 =?iso-8859-1?Q?e8kjzTMmayi8IR2YSDmPLG7azjHj4/Hnj20mKWumRF70g490Wv36OSoIgC?=
 =?iso-8859-1?Q?Eb+Xy9DHiG93X4wgj4RVoePSrcFuEXEyx38hzz+O8vb68Y/v8qG+/W48sg?=
 =?iso-8859-1?Q?805IR8PruIKHnUkzu4BT7LXhiJfZY7vR7Yx8qXXM+AulLEo+YL8OuHn3c/?=
 =?iso-8859-1?Q?Cg7QbpUONMJ5L5ClJ9SAK3tRoH0o0/e6H659k+XHFbsDkIX53Cz5dilj95?=
 =?iso-8859-1?Q?TenN2kDrVn4YZOmyatq0W4Dstrhp+2Faxqt7EfB/n4dhR7mo7+tWyNu2Dy?=
 =?iso-8859-1?Q?qHfy7mfizZQvhaS5e8ZJTKIaNDcgbjKP8rTk0xNe5Dim3DI/cN9EHDOc+f?=
 =?iso-8859-1?Q?dvoQ5USByT8O/hYuGbeF0UJkrn6vPxcHgG28jEyKPhEuk9RxmmOTgN21oR?=
 =?iso-8859-1?Q?rgogStYsYwJAauahy82a4s0Sx+HuoyoBHsD2z4QSThbUL9Sg3erSbot758?=
 =?iso-8859-1?Q?o8oY0fMu6LFxlwGiw/9iMekSlJ2M44vjDP4CKZ94z7F33QGCbWDLsMjFGW?=
 =?iso-8859-1?Q?bjC1YH0DNi81ab6SQOE+HzH61oXQcndqIOsPN7WVDgxM3RgrLw2wjw9GXP?=
 =?iso-8859-1?Q?BWAYwQQKZ1HS1D2iGSfLU3Nax35Fh+5zQlPqm60HbIFMQUPJVnMsUOBg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4470ba1a-1e34-4fc9-d11d-08da8b5aa144
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:10:59.4680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SQbDnJXzFcC+TGh7MPXAff3MbCA/JAYHRg/5PKRriJyNQJFTCo6aaFQH56wvOIWAkCZu+RQUCT/PskOy67qgW9xl/HloThi/qeWGt7Ti8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: upecQ0VtuA7okT37Z-I5QTk2lr0btmTN
X-Proofpoint-ORIG-GUID: upecQ0VtuA7okT37Z-I5QTk2lr0btmTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310070

ATS subsystem has own list of PCI devices. As we are going to remove
global pcidevs_lock() in favor to more granular locking, we need to
ensure that this list is protected somehow. To do this, we need to add
additional lock for each IOMMU, as list to be protected is also part
of IOMMU.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/drivers/passthrough/amd/iommu.h         |  1 +
 xen/drivers/passthrough/amd/iommu_detect.c  |  1 +
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  8 ++++++++
 xen/drivers/passthrough/pci.c               |  1 +
 xen/drivers/passthrough/vtd/iommu.c         | 11 +++++++++++
 xen/drivers/passthrough/vtd/iommu.h         |  1 +
 xen/drivers/passthrough/vtd/qinval.c        |  3 +++
 xen/drivers/passthrough/vtd/x86/ats.c       |  3 +++
 8 files changed, 29 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/=
amd/iommu.h
index 8bc3c35b1b..edd6eb52b3 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -106,6 +106,7 @@ struct amd_iommu {
     int enabled;
=20
     struct list_head ats_devices;
+    spinlock_t ats_list_lock;
 };
=20
 struct ivrs_unity_map {
diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passt=
hrough/amd/iommu_detect.c
index 2317fa6a7d..1d6f4f2168 100644
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -160,6 +160,7 @@ int __init amd_iommu_detect_one_acpi(
     }
=20
     spin_lock_init(&iommu->lock);
+    spin_lock_init(&iommu->ats_list_lock);
     INIT_LIST_HEAD(&iommu->ats_devices);
=20
     iommu->seg =3D ivhd_block->pci_segment_group;
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/pass=
through/amd/pci_amd_iommu.c
index 64c016491d..955f3af57a 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -276,7 +276,11 @@ static int __must_check amd_iommu_setup_domain_device(
          !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
     {
         if ( devfn =3D=3D pdev->devfn )
+	{
+	    spin_lock(&iommu->ats_list_lock);
             enable_ats_device(pdev, &iommu->ats_devices);
+	    spin_unlock(&iommu->ats_list_lock);
+	}
=20
         amd_iommu_flush_iotlb(devfn, pdev, INV_IOMMU_ALL_PAGES_ADDRESS, 0)=
;
     }
@@ -416,7 +420,11 @@ static void amd_iommu_disable_domain_device(const stru=
ct domain *domain,
=20
     if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
          pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
+    {
+	spin_lock(&iommu->ats_list_lock);
         disable_ats_device(pdev);
+	spin_unlock(&iommu->ats_list_lock);
+    }
=20
     BUG_ON ( iommu->dev_table.buffer =3D=3D NULL );
     req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 2dfa1c2875..b5db5498a1 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1641,6 +1641,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, =
struct pci_dev *pdev)
 {
     pcidevs_lock();
=20
+    /* iommu->ats_list_lock is taken by the caller of this function */
     disable_ats_device(pdev);
=20
     ASSERT(pdev->domain);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/=
vtd/iommu.c
index fff1442265..42661f22f4 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1281,6 +1281,7 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
     spin_lock_init(&iommu->lock);
     spin_lock_init(&iommu->register_lock);
     spin_lock_init(&iommu->intremap.lock);
+    spin_lock_init(&iommu->ats_list_lock);
=20
     iommu->drhd =3D drhd;
     drhd->iommu =3D iommu;
@@ -1769,7 +1770,11 @@ static int domain_context_mapping(struct domain *dom=
ain, u8 devfn,
         if ( ret > 0 )
             ret =3D 0;
         if ( !ret && devfn =3D=3D pdev->devfn && ats_device(pdev, drhd) > =
0 )
+        {
+            spin_lock(&drhd->iommu->ats_list_lock);
             enable_ats_device(pdev, &drhd->iommu->ats_devices);
+            spin_unlock(&drhd->iommu->ats_list_lock);
+        }
=20
         break;
=20
@@ -1977,7 +1982,11 @@ static const struct acpi_drhd_unit *domain_context_u=
nmap(
                    domain, &PCI_SBDF(seg, bus, devfn));
         ret =3D domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( !ret && devfn =3D=3D pdev->devfn && ats_device(pdev, drhd) > =
0 )
+        {
+            spin_lock(&iommu->ats_list_lock);
             disable_ats_device(pdev);
+            spin_unlock(&iommu->ats_list_lock);
+        }
=20
         break;
=20
@@ -2374,7 +2383,9 @@ static int cf_check intel_iommu_enable_device(struct =
pci_dev *pdev)
     if ( ret <=3D 0 )
         return ret;
=20
+    spin_lock(&drhd->iommu->ats_list_lock);
     ret =3D enable_ats_device(pdev, &drhd->iommu->ats_devices);
+    spin_unlock(&drhd->iommu->ats_list_lock);
=20
     return ret >=3D 0 ? 0 : ret;
 }
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/=
vtd/iommu.h
index 78aa8a96f5..2a7a4c1b58 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -506,6 +506,7 @@ struct vtd_iommu {
     } flush;
=20
     struct list_head ats_devices;
+    spinlock_t ats_list_lock;
     unsigned long *pseudo_domid_map; /* "pseudo" domain id bitmap */
     unsigned long *domid_bitmap;  /* domain id bitmap */
     domid_t *domid_map;           /* domain id mapping array */
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough=
/vtd/qinval.c
index 4f9ad136b9..6e876348db 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -238,7 +238,10 @@ static int __must_check dev_invalidate_sync(struct vtd=
_iommu *iommu,
         if ( d =3D=3D NULL )
             return rc;
=20
+	spin_lock(&iommu->ats_list_lock);
         iommu_dev_iotlb_flush_timeout(d, pdev);
+	spin_unlock(&iommu->ats_list_lock);
+
         rcu_unlock_domain(d);
     }
     else if ( rc =3D=3D -ETIMEDOUT )
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthroug=
h/vtd/x86/ats.c
index 04d702b1d6..55e991183b 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -117,6 +117,7 @@ int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 d=
id,
     if ( !ecap_dev_iotlb(iommu->ecap) )
         return ret;
=20
+    spin_lock(&iommu->ats_list_lock);
     list_for_each_entry_safe( pdev, temp, &iommu->ats_devices, ats.list )
     {
         bool_t sbit;
@@ -155,12 +156,14 @@ int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16=
 did,
             break;
         default:
             dprintk(XENLOG_WARNING VTDPREFIX, "invalid vt-d flush type\n")=
;
+	    spin_unlock(&iommu->ats_list_lock);
             return -EOPNOTSUPP;
         }
=20
         if ( !ret )
             ret =3D rc;
     }
+    spin_unlock(&iommu->ats_list_lock);
=20
     return ret;
 }
--=20
2.36.1

