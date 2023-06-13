Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF072DF98
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548014.855828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Kd-0005he-OB; Tue, 13 Jun 2023 10:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548014.855828; Tue, 13 Jun 2023 10:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Kd-0005dE-JO; Tue, 13 Jun 2023 10:32:59 +0000
Received: by outflank-mailman (input) for mailman id 548014;
 Tue, 13 Jun 2023 10:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91Kb-0001il-Ji
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:57 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a800e56b-09d5-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:32:55 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D6YVNk012776; Tue, 13 Jun 2023 10:32:40 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3r63wtu7t4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:39 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6520.eurprd03.prod.outlook.com (2603:10a6:10:19d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 10:32:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:35 +0000
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
X-Inumbo-ID: a800e56b-09d5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/VM4lVNFpm/Tqs7sjBfTG3jzLmU5+cv24ae6tVY/4db4N59sWbIpB9VZiO8g+JbJmaukUgSqSwAEVk4wRA5k0WIpJ8iYMcH+roe/Cqiq3xu8Dp2v9ym6/7fyfXIM5YLqbe7sXNeuYEYHmvMwKbIvj2cDVDigQpLEG/qBxgU/kSfeFY3stEScp9vhdHvzNTcZ5N7sVHRMEQWV56OWQcdHPNztxdNLngQrJsvsdiMZUtvAk41q5IT4EijciHAEgcvGYlbRDDHQRWA+L7ZIx9wQ6vjWzVW5nB9wfIhJMkygoow1M2eRGEYUhlDx2cyBXExpLszK5YajqFhZvVjjntSNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQTW0eUz8gWI49XTcH/ASQwLz+KUFxo+a0xrDbt/xqk=;
 b=Rtg5FF/ccuyTV7APOw9NTk90lyO337tT0E2rn+pXSIpun3TtiBKy10U8VRy23Wi5L+4nmbjkJoVuc7Rpn52P7bfmWbljbAWe79OkchyT2LKlgE+mhRUri4dWRK+VbgVqzA+FA7ehAre+j+BqTaFOG2Yad49QNHqU0p11Ql25uFmA4pZFlzIb9wyQIdEyvMsoecWyEEHK/vlw+B7RU1liE7yokGyOKBC1VlLCFYiJWYz4hjWGEL13MezA0ArpiR5+/TdnTr2/5h/slanBiyUHae9d//WZzOHM8R3o8HRNP+MujUman4MEQI/jL7p5DOIOMZB65wXhBSnZ+EJhjzP8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQTW0eUz8gWI49XTcH/ASQwLz+KUFxo+a0xrDbt/xqk=;
 b=JA2tSBKSG61ZnvGSUV4fZ/gWDBWxgI8izCJ6CRyQACRn0qeWXb1TekOHqow+TaaqOQFTHHhnXMGzy5vS1vHu3reQDTCTJDBqCN7ulpMF/2keKoAnXnWv9YfcLlo0CdYv8xFp8GHHyeBv52aXyFY4pk+JUOEbjpEX99xNgJGAPwRHLn/Wk6AXbHzx7TpiaKFsD7938Sl1Z2E2ylmbx/OToks5BYjWMy9pPpX3vwGjcH2qIUPGh+MCrS4l525rtSvi70TfwR7hT1Dv1mxeN7lJEIM4k/20FoqgOeFXwGQbN1rQUv+vcrzpn2SWEIsELn3fHrcNLxXt4Cj0WDFgRZ2+Mg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Julien Grall <jgrall@amazon.com>, Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 12/12] xen/arm: account IO handlers for emulated PCI MSI-X
Thread-Topic: [PATCH v7 12/12] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHZneJbvDOlnUhO1ESuNpaA9WRe9g==
Date: Tue, 13 Jun 2023 10:32:30 +0000
Message-ID: <20230613103159.524763-13-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6520:EE_
x-ms-office365-filtering-correlation-id: 93648c78-a2d1-42e6-a0da-08db6bf9808f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lWbsTwkfpB0lf+0cGsJwGc7vYQ3cNe4OvC0vYrkrIorxFut2noVaJYl3VrIiHkVwLb2oUgD25v6XTg2VU4m7nw3uKKAiknWtlwHeocH5VnEDl2Aec+r48W9vs9MGS6AdN6Hk/OgjjbxKyArtRha9snKPlAnM+fKBFe1Nv4/M69RC7yxjyqI8MTogppTOJi/qCuIEjbvjliWFSBBnkSOVRMXh4LUH9kgXnOM/12EnmB6NiIwnuO3PDMi8Jsin/6xlA7Sjw/SU0casuQ74ymnqYUbda39SVhBe4uVVMJX2Q+NoGvvV1fU7H5WXFbY+AsQqjGABO64lpmae0engs9ZvwP/jRUSOTtxiV37wklKmi6e31O/qDtN+QppLkp73Pw2A8dCwXNwFr1dVB9yWCXI5I/aKk4+c/9vZ1eWJibmVPGWgLM5VKY3Cp9crZmSewWQI7hWHOEgY8iChnGEQhv15C8s+2Tj5pzjN+SWZS1BwEJOTgz7VDpDPx9Mc7AsiI+nxJv97Z7LYjx4o2t3gRARjs1hw2Nv2P9R1dclD22/qVaUGdjmpd7DloQM2ShzVJRddXbOQfybq+bI1xXb71NUWO+4fEXhoZcrHrGV8SKuX4/rtNaOJG2VSvX7pXgv3656c
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(6486002)(6666004)(6512007)(36756003)(83380400001)(2616005)(38100700002)(86362001)(38070700005)(122000001)(55236004)(1076003)(6506007)(26005)(186003)(2906002)(15650500001)(66446008)(66476007)(5660300002)(54906003)(8936002)(8676002)(316002)(41300700001)(6916009)(4326008)(66946007)(66556008)(76116006)(91956017)(66899021)(71200400001)(64756008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?NyyV2/MHy1jlM7ZCIv7NPCj7eBD5RFlf/YEt80+6EFgSKnhtpZsiyhh31d?=
 =?iso-8859-1?Q?JFTPDLkgpkSmWXjXQnvxf9aEtfic5FmOBYEPQU2O/0vQmHWPZLqL5VHIaV?=
 =?iso-8859-1?Q?hgjy3L8K6Br1aGtsikDPk351aG54SmcgkXIkxgGDsRztlyE+IduWlcXRRe?=
 =?iso-8859-1?Q?cNllxdyAUIkwQmY3GiuOEVjgMC0BlyfCqM1A7eCe9lRKkbvfaxFoLVm7lk?=
 =?iso-8859-1?Q?Z69pn0GwTA5LgiktwTNpLVIOVLpggze8YNLHdFf4PkqIvlAU3IBfAjGwlj?=
 =?iso-8859-1?Q?I4wzfiWC8IoLN/8AwhvhNhPmuXJHGr0gksmYnJjyOMFPUrdwkgoOYTs8CB?=
 =?iso-8859-1?Q?ETNIWF9mdOUnQXE5uJ3uk65gj2xEE53Z4RjfzdrdW/dBvwY8DmFP9/eTBf?=
 =?iso-8859-1?Q?c7qMjXemIKSVkrm4/cWpZoSlz1gcYjcO3kWLkLrLD5YvE3Hd9xQkIn1h8G?=
 =?iso-8859-1?Q?1LbIhB0hO/+7dCLc+D0JNFl2d25RZbMj95cqHCKeUMQE+1dMxD2aDklB6H?=
 =?iso-8859-1?Q?s0mWhyrXzDE8It13hbIiCaTsxZX0ZnwBA5pleDW60CGHbY37ISD7upSilX?=
 =?iso-8859-1?Q?Q65pjH/5mtgQ8xA7a6c2Q4B55Few45y5xE0ANFAQJF4+SDQBKBaXtJvSVm?=
 =?iso-8859-1?Q?YbTLFwzLu4mkDMer8CjF/KBw7JFPuM9kLURP82QMXo3OYYlUriVo6iRDCo?=
 =?iso-8859-1?Q?I3jzQQESfiqmzSk3p5dz4xV1PG8qlhOYF3hmoYLSJ+ttbiNamHGCkWzKBg?=
 =?iso-8859-1?Q?ZDgoirgm+YUJJVIVzoRgOVufEhSWEnzgVgmJvcLhCOC4Dok+Xd4ZQK0g6S?=
 =?iso-8859-1?Q?d4AMq+Wy70/kcUFFkQGAt9fGBs5ZZaheAyBZmTUfRQ/+jRLAqf+v7HFbb5?=
 =?iso-8859-1?Q?MSGulHoNqmEO/5XOELo1qgmHNW3xUx4BDra5TSPKfDYcLtmoQL2gMJ8paq?=
 =?iso-8859-1?Q?f1IG3uTTPQ2rDL80P6F8MRNM3YhpJSL36io9rGRLLBswpgjcr/XgpkfahS?=
 =?iso-8859-1?Q?fqUYrnilRuqVdUCtSJeLEzGkOn2O+XjR7OVo7C+hAcLFVDJARPc/uc4nOc?=
 =?iso-8859-1?Q?LyFrZN+DuDBYFBmrNpfd6DximaVjrCl+GIrTRLjGCrl7NyjSPm04btJB8o?=
 =?iso-8859-1?Q?dGDVOZ87HI7PKuxo7V052CXvHun85aNiax5k7IuTEklJILTDeBjorCIdeN?=
 =?iso-8859-1?Q?of6WjLVio1zi5m4Adcs6Nx570zCZJSlfq7jxSvTfab3wxr8W6dcY9V2BJr?=
 =?iso-8859-1?Q?GQLCzfunFiZPxtj4QrmAMYw//QMY1piqE38StUxS2qDTGIURVdHZSepT2s?=
 =?iso-8859-1?Q?eSwWbQU6AkaEwMScL56HyUTVDoOC5+1YtK81rbiWVm2KJNZksS2AWA4uod?=
 =?iso-8859-1?Q?OTqTjpi+Is/Wu2RaWG502u5MMvN47yLBXqvIGCm2sYCuETtXDtIwP+4LLk?=
 =?iso-8859-1?Q?+QSZ2sxLAiOJVbPNfShWqrfbLRkFqQO3OlWmBGr02MIQo/vTI1ZAd+Qd/H?=
 =?iso-8859-1?Q?dD7Iv5V3IjG1arrc52XH5TBY3R3l92dojBz+O6ac7LtZmjNuv1D6HBx1bc?=
 =?iso-8859-1?Q?bQrlRA0Q96Zr5F8mIR6JQCOue8F7r/8W49kacmfk2ZJbBr0M3Uk4xDxmqY?=
 =?iso-8859-1?Q?ThAcJGUpJ3i46lRZN8mG9g5wvYGlqkkBu80erSKuSueNvbfHKuMRuFYQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93648c78-a2d1-42e6-a0da-08db6bf9808f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:30.1747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0gSiYoqumL0WDtvhm0SLwkKqpViEp8Ntc/xB58/1JxXunFu5UwCSgXri3oWOcDQ3dhohI2poeZEEv7Pa3fgvLwTT2aX5Y/IyRYF3eO2a+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6520
X-Proofpoint-GUID: F0yMd5SMzxh8siSmnZGICctVgUdT5aXe
X-Proofpoint-ORIG-GUID: F0yMd5SMzxh8siSmnZGICctVgUdT5aXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxscore=0 phishscore=0
 mlxlogscore=599 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130093

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
index d60913e532..7499a1c925 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -122,6 +122,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
=20
@@ -142,7 +144,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct =
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
2.40.1

