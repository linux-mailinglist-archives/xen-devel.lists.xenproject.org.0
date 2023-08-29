Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA15378D047
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592518.925333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80E-00015N-VD; Tue, 29 Aug 2023 23:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592518.925333; Tue, 29 Aug 2023 23:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80E-0000yp-KA; Tue, 29 Aug 2023 23:20:06 +0000
Received: by outflank-mailman (input) for mailman id 592518;
 Tue, 29 Aug 2023 23:20:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb80C-0007EX-0X
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:20:04 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94564d5e-46c2-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 01:20:03 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKDecp030691; Tue, 29 Aug 2023 23:19:55 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3sshtetfcp-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:55 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:48 +0000
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
X-Inumbo-ID: 94564d5e-46c2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlAOaI2TKockDGVytM7PMphHd0wtYNZgqK38rsmUqoyh0IJtwb5WEPwML9CfBwjGbW3XimHjHpJCeOf1ECdcpbP28P7kKqvYYfc8YrAq6uqypi6rvMQrKAMFqzkoVZ8fDHw2scx5QrFIn88nAl2esMUhvdBfHPPjqcstMNHCOnDIL1qzU4FWzc7+S2M/b2G5v/m2vJWLfIp77gQ+JrQ0av/mS9VWNY5CNlZEmzP1769SwNaXAwFhyyLNNR7gFPCWhB3AcBMCEn8UkVO6AP6WLzhEKpJfqxA9pV2F7gqJNtRsXg6eCJ+7sOk62eaujIcEfExr08BT0Nd44Sxi8VD+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTPldD6+q4SM1yUJw2n6MueChQx31PeEONHRMx/GHEQ=;
 b=ns9wTHOEpWCTuKo7mx/SJ1d8NZS7aF2vHjxBZVQsOnN+Sll7V8kL7hxM2aJXpobdWlLvhpy+MZOdgc/3Ge7xWiqmTJtV5uXuKKBGzyKf+ZPW+CU/m8iY04+M4cgewOuWfGKqXhw/h7CZNxd5n5/V7BT5N0R9O1xsHZ1ubjDQAsY3Q76D8gLaM48GCqionVMEE9IvC/cUBzk9qzvqUBKoM9adl2E+fzPZe/dikwBTyCfi5MtEfaUgTepztBJow4ND3V++S/zQCLldUltdNtX2VvrPMke+Ul77SSKX5UyOKtI4xGN/cDzcqs3F932Q9YED8IsauTmvn9MGMGUNGwH/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTPldD6+q4SM1yUJw2n6MueChQx31PeEONHRMx/GHEQ=;
 b=niyaL3Mm9g02eJ93dAFOT0n7cMFgB1HEU6HsPb0Ovi+KiJmUtagKkeAknmz+i1Y1LoD414vhCSSA7hy7GZp5notBv6zqcuK31+9K3cDAxk2L4pHjJQtNY6rWUPRQqVnYrU68uPEot+CtF9dCQCIdtPqy9FW6JTTuWRGG4WsUW2PwEQIC53HVqjwP0zdtG9PHabwOUfIyIgac/ZARzmSinEP8216AXCD16rM/6vTJopR4GYWnp0KzvTAH0s3PA9LIu/p0FnYhYhz6h1x7x5AEkvAExiUcS5GR1oZuad1QL63aXuTwlf/MpBthSamPJo0fFWZfRQY/CFgKRFEmLoOe3Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Julien Grall <jgrall@amazon.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 14/16] xen/arm: account IO handlers for emulated PCI MSI-X
Thread-Topic: [PATCH v9 14/16] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHZ2s9M8h1s1RnmZka4sXTrGcJzww==
Date: Tue, 29 Aug 2023 23:19:46 +0000
Message-ID: <20230829231912.4091958-15-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: 2f46da6d-bf4b-43bd-3c25-08dba8e6701b
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vcrXzueR9fOn2HtPu0TeyLXrBJ1CVdpSJRw0S46uirXAsUrg5ToNthym6dxsqcwkt19UyPtQRIqSTn5H8LntgzRU+LPw2HLjXZ7aTbVdlNQh7+edaza4Ywab6sUr6263DWvNxtboGSwIcakp1P/u6InjA++I9785zhtd6OIEz4Y7sVkwFMy3uZhy5FMLnbrSM0Novj7LYoPG55WaJlg2gpcBI9hb8vfIT4azXE7DoHO6bPchBbD67RUvImymi8bQxjiUBiaXe/SOYxIH5df9T17oN4LykHGvxF9DwdOaUUlMmhUF1H5o74vijjHLPjhYH7SBWMm8/j2ZWdm8RgQotfHI0kk30OJrLbS72XwvguTL5IFsL0gOieP7TLH5cqYgPJNgz3gkhxsSyluAqa8N9CIqpK+ZyIkd/58dNmGHtrBVIgPJ6g+eIwNd/XpJIoE61nrJBQ888d3Hd77ujqHezyLScqWrWRMSnUuxGTuYpaMMvXICsEFFcUUHl7nc/SY/8wi6EwaTuJq1XR3LYMw88hKMlpySOA8eEHWTbvtu32btU/948BDnNPtDe6KKctCnnCsYKBucK43rB4/XMhHENNqjlyYnPm7KOb4/DUljSU866fS1ANau9HTjL4Y55JFU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(15650500001)(76116006)(1076003)(2616005)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001)(66899024);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RsL5X7O99kteXP6EECEDnlW60FL3SNm1mj6HNqYnF00Ww6isuVQV0LLW/J?=
 =?iso-8859-1?Q?GjupCT65AoodBPoqdGzIMZ8HZ/BQ8d01Ufxv0FYv8BNU0Q9kzzizGpaRTH?=
 =?iso-8859-1?Q?rEZGHgCWQCEdYLkxPnfEBiIC07qOvEzEc5tG/uH4IVT+Hj6KHu8W1SQOgy?=
 =?iso-8859-1?Q?W5hU3DREOYhlqjoQzaRJXtWYmnNSFq2uoq/sTk67GsDh+RDPNxvC6ul9N8?=
 =?iso-8859-1?Q?90K3WvDM16Ba6ROy/oQTzABVLhkj5KAItgF4PafaY5qUF6Vm24lfZ2VOZp?=
 =?iso-8859-1?Q?tMSjRIii1Cg+bcowDfZLpvW9J2bvsMbBhIfDHSeJRv1FM5C44N0KGQ50np?=
 =?iso-8859-1?Q?NUGS44dTMqBTlaqLkmjTF2XNZqbuwwcGxdchJk/B0olzkIGr+3TcfeCQBC?=
 =?iso-8859-1?Q?+JSH5Q9aUvIJ0wl7/Arwk9hlVoio/2y4N02bn12920lIq0wGoa88yk1p+y?=
 =?iso-8859-1?Q?IDVK0hrh6e0X7KWyLfPUPCm72c1F5yqJKUZ91GjLYRoe7z6ifIdbiB0UT/?=
 =?iso-8859-1?Q?UVreew+JYcKBdDoazQ8WfXSb6sX6h5dEMxFlyB2nVacksPEJV7MEFrkh9Q?=
 =?iso-8859-1?Q?FO3K/sTglkt9uud1ZmviaTr6EScM0ziqxFqhiRwl1gmcJFNpx66UWcEBhp?=
 =?iso-8859-1?Q?nfVVM4ERPHvfLlLh43GGw4nYN8PITPQN77VKJFQr2aKQ862K34yggVtfPa?=
 =?iso-8859-1?Q?uC1Sknyut/gH1mluNvioLG4zF5hEGTrHY1YeuVDg6VSJqCnx/YMApzljBY?=
 =?iso-8859-1?Q?rk+y0r7PoNwwMWVbBAzPF+wNPzDrsOu9keO6K4gZeAqWiQEG+/yEc+K4vS?=
 =?iso-8859-1?Q?8CCIcte2WiJdjTmTXUHKBKvPkUoppg5Vk9x+GZYVMiG9NnMcd5wDyBAXFd?=
 =?iso-8859-1?Q?2WCreSNWCsACff6+w3Yqeby8aLac28Wyp4xnV2qz5dWiJHnvPRtOD+t3O+?=
 =?iso-8859-1?Q?hXtXezxXCwmUARS7R+aO4IOVZZtx7AhbOd+v28fyE3Bu5l1UnOlO4lvuH7?=
 =?iso-8859-1?Q?wJ4PaTv9s/QKfmDg46ikQLRvZTEa+avjf9mwe6YXCmfHTj4a1IH13/KmMC?=
 =?iso-8859-1?Q?IpzpXpA832lFg0LxcxM67On7K6jrbUyptd2Wg15e9DB+8xBrAVGmpMpt3p?=
 =?iso-8859-1?Q?XnYfyHmaYxSKde62aLLHeaq2vnfAN48G3r8dn00Z0RX9CxiLORsYyaPr/t?=
 =?iso-8859-1?Q?T63eOloB/NigQSPYFuW4YgCuZ3oIYayKg/BvwWDKGkRwGmcMdhD88/3T1b?=
 =?iso-8859-1?Q?dBzZKWyO3/574ZGfG4A2Vh3FwZdlnfqQsCAzTy+ZB1rv638zVM2sAnu86b?=
 =?iso-8859-1?Q?ApHajLIt3NYeYeeYgVCE3ggd3RJOs4BwaK/EG01N8iNX4ZRsm4eGM54N5U?=
 =?iso-8859-1?Q?EQSzuX5P2VJtXYRr7BcvF1pwoapnpdUHEvcrguq6EaIiH2ZWFhGF8TPu8v?=
 =?iso-8859-1?Q?dmiCBh/WAoz+AiquEInftaqcQrJb/cKvRNiPcBbssPpSv8254xdfQnmZlK?=
 =?iso-8859-1?Q?NsAbIDiujjjfaBW5MsToyMg6eGc1EdI16RJMfMO434CI4C4aBSCN6RD5Qy?=
 =?iso-8859-1?Q?oBFs+amkEIL3eG155skkTmRdMrCHCmvYPdXEIi0b0pUJPcBRqmBQcpVZXn?=
 =?iso-8859-1?Q?b+LU1iFKOQhCUnBjy7FxI5/2eFV1LRx/soF5FudRORfii+fy2pV3EQrw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f46da6d-bf4b-43bd-3c25-08dba8e6701b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:46.8628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMG2FR4uIZERRiJySHDNJpikulw1DnF346PNfhvEzjFdHy5ze9RzgtzDAqBCbzatb4RsYazeggkoRPI0XaqfXG/MvUUgtrRymmpWT4+oTHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: uSonXfIrHQm1ofF3MJmApvPSbfwKS93t
X-Proofpoint-GUID: uSonXfIrHQm1ofF3MJmApvPSbfwKS93t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=449 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

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
index 58e2a20135..01b50d435e 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -134,6 +134,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
=20
@@ -154,7 +156,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct =
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

