Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3376801977
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645831.1008254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emu-0002Vn-TS; Sat, 02 Dec 2023 01:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645831.1008254; Sat, 02 Dec 2023 01:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emu-0002NY-NO; Sat, 02 Dec 2023 01:27:20 +0000
Received: by outflank-mailman (input) for mailman id 645831;
 Sat, 02 Dec 2023 01:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Ems-000271-Uk
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:18 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec023917-90b1-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 02:27:15 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGux008549; Sat, 2 Dec 2023 01:27:12 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:11 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:06 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:06 +0000
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
X-Inumbo-ID: ec023917-90b1-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM8yHmad3IcII5Zqb2UQEHPu7SwkbZGTuQSS6nbF2dK0DMeoL2k4eZyKCBzD0auCTQguH9frS6HmZ6hJ+E8xr5Vfg2/fdRdISec5U+kgs9PxST0XX5q68aZSZx6bL9QscgkPf0sc0Zkb9K9xVlJrvCxjzEYGyB1eATQPxKoQaWD8NtGe2U7YN121SK13u4Jk5C03wQkFnHNPUZ6W4pNdkuxkrVpKLu3sPo36C6vfDMjFZalb9CCL+lMPfWw50dTWaPcOdIBS8/TL6BiuXmpUm5ffHsDbsq8WW3rk/Yj6i/9dM2OlMY+yuvXWw2ijPwccZ02fQ/0aICxWzNgBHgzsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ufRyLrmUQweuEkuIRkuhaAtvncGzXThnIHC9E3OfTc=;
 b=JriZjHaqC94pObkSE5KRdpBUtSpFtvGQkDTBybBwrsx1MzrOdpvD6MqsjHsGgPYooQLX1kYmHaU3ar4TjzxeAchdIFbsDbj8NU7bXr02NbdaFrthBZUWOFGWQjIp3DLpI8I4nybpI4gVxs0nM5yph/nphZZmspKKrnd43E7Y06rREshif5KkdBa1qv/oUs/BLH1RoPVA5sIWtMwNxeMg0gG+JQtslwhK/Es83WMG7S1WxHIAEs80TJodnh8msfIp40ygVO6NcuKW3vMqzZDuvrOPsO8O/aQYU+1+rRLqRGG86ZkKrvSgqRmb0t4mlkPJwEjNne+CGVuVU9Wu7wT0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ufRyLrmUQweuEkuIRkuhaAtvncGzXThnIHC9E3OfTc=;
 b=H0Gtq134SqUatHUkpFlx1/snqF5tK46UDPsq5CHvEqMkiMQFGAvtdcYhoBv+8uusXWv8lxWyDs8hzaEN4d6Guu4E1tycR3QOuxCOis5lo46U9qYl9xiW+sUPcr3eqsDKW/+Xwz0P3PW9MByfBsmVsKqd7D7uzKG61GPNoWarxQqMufsTyWuKtl6tAsqgAbsF2wzDREcbhudenY+A//jL3GkVBN+71Rk86lHQlqHTg76RwBcNBDs6jQzw+DYQ7pdO/tmKNANu1aKMupCu/S0Ku4rWXC3JaysZOglCgiU7YZ3CV5S32wWPnvV0K1eq/SijxriCPOECZ+FJ6rYXxXIQkQ==
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
Subject: [PATCH v11 05/17] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v11 05/17] vpci: add hooks for PCI device
 assign/de-assign
Thread-Index: AQHaJL6ni6LuV+9huE67e0lasEO6Tw==
Date: Sat, 2 Dec 2023 01:27:03 +0000
Message-ID: <20231202012556.2012281-6-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 4ac59772-3fe1-43cf-2a7f-08dbf2d5cbf5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T1NXKGGBLZ1YwzegKp3eCX/AU7B4El6e4EuVC5d0aVazkim0vi1AJqqzryZ7lT5glNUOBY9yCfLlL4ZeO8iISXlsT4CLbxw3lWM3dBXuNQ631bFW4zdOdsDE0k78URgpi7Ht0Io/g9nx9d0gRh8xWkf/Gb4uogR2tFP1L1shtQsHbNMx9d9HHA6FbFdJHV4BDk2NeAPFQSoaGakHInJj3k99ipvPBWR6C5CNN8XSEge0iJzl6ltuvrkiezbj/acUTt0JCM2yaAmnIiRVCT7nR+wJffKaTw7v0Jl0XwiV9cRf+zlGK95KyR2s/Jrk8hVR55CHoO65AQXcS6qAMe5/uW7H3QdZWdlwQth9BLkUC27Ve3ApnaeBdDFs6Dz0wYxsCtzJkV8x6m0rGycOKEaUuS6UzqdaxZocjlPp/4In5qX2lh2v3r46+TxTx6A9jM/gGjja43TUgmoL25SCuSdWlxLaXHrDLyq7J3ncvH/TWPfzJkarWVU47tlbROfN3AoEcLUgHNPsQ1VCu9S+0ZDAm4RM2UzcM3gkqwMNxXHoORsseLt7n6NFAxUql23muNbLT+X1nizrMguyJUKfFFg2PzYmv+2SnY4nyMQTA72SKBnhpex4i3xIXw04iyXDVqdyZufW56Rh3dThET7I48JwQ3SAOZTSpwaRTIDoJObTPPQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ukb3y7IMqtxe1PfIdSc2J0Wus/HZyRol4omHP+bsNBUOzAXbVQn0c6KuJL?=
 =?iso-8859-1?Q?td5vtGVrGHb6QWqMRYYTvEw7XAOZJTP5AN2Tys0KE82iOdk1ko3QLuZO99?=
 =?iso-8859-1?Q?hSdeFqgtNnk6BpUCvLpCD7Dn5xkktf2MJAjQo148V/md0pxcfj4yyAxudp?=
 =?iso-8859-1?Q?Zu6bKoEOC4fsgLKIhA3Ome9NmbHnRVyvs7tVl/rlMUkD2NEn5OV24daP9n?=
 =?iso-8859-1?Q?Ih3OiXFZOZ6r7CIZNjX4KSH7BDJR5B83oX6kMUZHZaDc4VvfxsbBYYprpl?=
 =?iso-8859-1?Q?udqxaVZD2l8DXaJ8HQGQsB9dJwgr706/SfuQf9A0wwdzBDFQmdFLmbA/GZ?=
 =?iso-8859-1?Q?KWRhcT/Z8C1S88+gzItMoJ64QIgWAOWA9uUKwv6KfgpUfMrvZcg/iPl8+K?=
 =?iso-8859-1?Q?NAM7IvFPVrP3oPUQs2hzxyF+k3m8Rxnm518h7CbddZqN06NkiCOAy5Y/y1?=
 =?iso-8859-1?Q?498iD2rku07ZgcVhYAwtAVGWqEeBPWm46bD28TWZ5NbMYx9lba3bf3wYlR?=
 =?iso-8859-1?Q?BfdpGdbYa3FLSn9o1dl4OpQ7d5nyvNphXl3iTyhX5bb+sgc/C1anF7VwCu?=
 =?iso-8859-1?Q?Y5d0zSEbjdkCsPovk6iQRroCd48d5QtO7ooQT7V2Zqkzpqf+HO2wf5QbXy?=
 =?iso-8859-1?Q?w1SdF22dhuXh40B0OGIkxcYVGP1+5FkmK7SIKR+vgyHkpYZ5NEtaFi0j5P?=
 =?iso-8859-1?Q?pLhkZ7VrF1Wn2we9y8syEvw6uTB9EEWWnef3ZB6lrqYrUW3Q0ijVqA0U5Q?=
 =?iso-8859-1?Q?iSjPcfcwbwOoZwRBFGpJFztxiYNc2k5SYuTkHN0W+mRzSfVvUHOC7iJsRz?=
 =?iso-8859-1?Q?sr2/Vseqz6Aeo/skIYJJgPcGpIZdIKS9bYhblJnHiEVTdS9K4OIPfGPSbc?=
 =?iso-8859-1?Q?iNmTMIrIhTHHzcsEZW4ZfUp70V9kSCHxBqIseiVUQJrXvd1jH/M2dtKoO+?=
 =?iso-8859-1?Q?m/kf0GO6K+7Cv7R2FZGoAWG5iah+C47/uwKQMrOQHehLOnE7PlQYxW9tq+?=
 =?iso-8859-1?Q?ceoonTFzbsgm7oTf5QKpmfZJq13veMzRLfI6zyN8iKR/bdtGjweDHaXcPM?=
 =?iso-8859-1?Q?nP28MYeutTxmu+qCsKnC/ETMsTWQTtnxmaB+gv8YM34dhG7vbzQaSaH+zg?=
 =?iso-8859-1?Q?Y1UkRFKKa9hYr0n5ZDINIYLsOAEXR3Gl5eexMD6egSnIRoZhNp8pLNUuhl?=
 =?iso-8859-1?Q?tTuSCVeDUQQJsObprfM9DCFmPGs7jrhCXfN5nJV0Z+kgOemlH13aLCMMlg?=
 =?iso-8859-1?Q?mR8HLlmFxvDOnugieD54y9RMBesrecu5gFKE/74zp8aHyhQtcSQLZPu5LK?=
 =?iso-8859-1?Q?47ocPI13H2rXMwxDmVN2hJXDWnv4vIghbPWffdTmjsdaAbLA8D7inhPabD?=
 =?iso-8859-1?Q?pwZTPZAz/C7g/pT01IZjJxKF97/Gn1dTmwJa/z2rxTj7YV0ulc5m+OHnCR?=
 =?iso-8859-1?Q?beG3zOGoYNbR0aD4g2Aeas2AbIf0CvP577TBm1Z8diULAgq60PZ0QMR3T2?=
 =?iso-8859-1?Q?4Fha2olcM+IEKNebMBfVfh8VXJRR888VXQD7H30aLW0NIX7ySlKVPf54NA?=
 =?iso-8859-1?Q?ajcDQaekiqqViyWCOqPoEIl9VRnP1n4IcU6rG2zICrffciSdYBPEFxf34A?=
 =?iso-8859-1?Q?mvt3ppBphBrhahKJehgW6HWB33JV3Rho0dqM24jxe3Ti1GWSXEpNl9pg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac59772-3fe1-43cf-2a7f-08dbf2d5cbf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:03.8312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: apciIFBOVQw2VZTUe+CQTqJ59dVXwGcHVhf1gl8IkNeTxC4PA+dnxBidAuoS5UBSkZwfMKnmtcVerRJdbzoZjLlmJYteEO7sTTY8zha1v00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: w0xi6zycblUHWwVUxpM0FEYZ4N3Kodon
X-Proofpoint-ORIG-GUID: w0xi6zycblUHWwVUxpM0FEYZ4N3Kodon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=753 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned we need to
initialize/de-initialize vPCI state for the device.

Also, rename vpci_add_handlers() to vpci_assign_device() and
vpci_remove_device() to vpci_deassign_device() to better reflect role
of the functions.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
In v11:
- Call vpci_assign_device() in "deassign_device" if IOMMU call
"reassign_device" was successful.
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
 xen/drivers/passthrough/pci.c | 24 ++++++++++++++++++++----
 xen/drivers/vpci/header.c     |  2 +-
 xen/drivers/vpci/vpci.c       |  6 +++---
 xen/include/xen/vpci.h        | 10 +++++-----
 4 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 182da45acb..a3312fdab2 100644
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
@@ -886,6 +890,10 @@ static int deassign_device(struct domain *d, uint16_t =
seg, uint8_t bus,
=20
     pdev->fault.count =3D 0;
=20
+    write_lock(&target->pci_lock);
+    ret =3D vpci_assign_device(pdev);
+    write_unlock(&target->pci_lock);
+
  out:
     if ( ret )
         printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
@@ -1146,7 +1154,7 @@ static void __hwdom_init setup_one_hwdom_device(const=
 struct setup_hwdom *ctxt,
               PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn) );
=20
     write_lock(&ctxt->d->pci_lock);
-    err =3D vpci_add_handlers(pdev);
+    err =3D vpci_assign_device(pdev);
     write_unlock(&ctxt->d->pci_lock);
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
@@ -1476,6 +1484,10 @@ static int assign_device(struct domain *d, u16 seg, =
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
@@ -1502,6 +1514,10 @@ static int assign_device(struct domain *d, u16 seg, =
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
index c86d33d0cd..ec6c93eef6 100644
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
index 4fec4b26d9..9dacbcf958 100644
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

