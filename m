Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900878D04F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592516.925308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80B-00004x-EX; Tue, 29 Aug 2023 23:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592516.925308; Tue, 29 Aug 2023 23:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80B-0008KK-3l; Tue, 29 Aug 2023 23:20:03 +0000
Received: by outflank-mailman (input) for mailman id 592516;
 Tue, 29 Aug 2023 23:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb808-0007EX-Qh
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:20:00 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90f7682f-46c2-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 01:19:57 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKDecn030691; Tue, 29 Aug 2023 23:19:53 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3sshtetfcp-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:53 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:46 +0000
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
X-Inumbo-ID: 90f7682f-46c2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSs1iU1bICm52I2iQaMAh65m6EkaSWqIcwr8PG0Arg+X2YXFnVui+h6WKIoJ2Yr2BSGtk6UA0ratFHotlG2DiK2W01yamuyx+cvtpU49qmq4mPpnyMRAeLIwsJa1V1lw3jfM7y6/uxOk/pEIk41J8U5143sg4bIusQP7gBIs3q6ipAc5+bwJ9u6z+wIhfD8xbqRpljh3kQsDWZe/wi5P3HOgtKeoAz62kaIAiz7nRhxwD8rWXgRDkwFvOGUHNNzZooDqQ2/euAVDQkpjL2vJyJnGSEHzbpSF8KqJPyAuIofz4schPikcuIfkX57lLqSGIgF+mKzXqHLL++dV40rWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+865b/wWNj0EWFhzOYa954eDivbVLOrScndgP/Dydu4=;
 b=khrAN9NxYaNMj+uPA2BLMfvKVIi+qmmJTw3vjcU9iXpvz7s/zzD0n5fjVkTiJGYn2YSI2jsNogTSp2p/XOyjHcRS5OJNJJXeNxMWU1xHwPc/hWcUj1ioJfGP4TD0kd5cuUTNmK3bvqSwl/XouD8syX4Ff59mH5a91LX5fkrcn9wK+cGZYfpPkhPOIBhmgK9Wqip6rIMYS5Ttb6numMcwL5vIBOJxUOHrs5xDW3W8iW8vEqPIQB0lX3IZqMuVJOkhjBhbQvkhehX4aNqCarAxt2RHlBDLv79vhdvMB0bSZPmOhuvcKiYoQ2bjrLU+vNkyuC+P84rzFTCVf8zbemNwJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+865b/wWNj0EWFhzOYa954eDivbVLOrScndgP/Dydu4=;
 b=czxCblDCsHIDI4y4BTYFyTU/I5zNmWYlDcJ57wEHfUVu4nTlX0d8eLEK9Es8a7/pyiUqaQYgu73ehxXYKZhhLEWB3mjpTyDbj9OiZPp/pnCvzQdklhgjCNmIa5PurcBgcnORVi6qYN2/4kYZT+ZrnS3dA/4wNZwNeLgcJ0FOfjdTtakRlHBnyi2e9B0Jq/imoHFddiK5GGtnHW1Yz9X22xqFH2atQmx5ddv13Gkz3AlosMTTr56MvP8xmvnkk/Gj3mo3YKr7pkt3Gh8Z8caFKPeZAMMvAS5UMsTqkZ7McFBk2pp8x23FPiVRT/FMBlDIXstua0yExWMnakpeS3+T4Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 09/16] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v9 09/16] vpci/header: program p2m with guest BAR view
Thread-Index: AQHZ2s9LsI9X1QGM2Uq0tBcOyguChw==
Date: Tue, 29 Aug 2023 23:19:44 +0000
Message-ID: <20230829231912.4091958-10-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: f4d9b8d0-52ee-471a-affc-08dba8e66f06
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YW4QNAEyqGD25G/0nRrSv3u7AlwWV1aerxJXyo4moO7ctf/IapAMmKXL+6UabMo3AcsVdeCU2GMraKGDPtmw7emclujwjTIOFLhz00Xodm+sqdknXRlYLLAm4kYwZs88U8yn7JQWNt16bEIHVph+lw9VjU2kD/3QSPvi7TF5Bq4p7Ak51+IOReKHoPJ114JwOyK/2CeGy93al/upfIIOVd1uIiCzSScVddVfqfXFoUJMvcA+ul+TE6SYavAmu2ZS8C9ZkQZYIupIRVtVkixERIBAFK/CMAj8N49UZI5ZPDQxHUMQwZWV7hSk/6ghaCRiEMyHeabfQcCuRXpoDo1rHNvjA9FJroRVseIGKnA9JLQW+mUoRUp+wmxEQUThQdXEMJGVgZh7nHTBQjTML3HasEWf9Hevy82d01SvazqrxQizHT2jqLS9KKTakslCh8+Xo6S58XDHV/hIchlYzVRdjUhDmsWHaqYAO4TrM1BNHM4tETSCdicOTyXHhro/uednz29VWwwjAR0j9ChK2YGZk5DW3Ur4dhjVEhHPcphoFUgIkcVbIcHN043qePC0S+WigOAcB16cb50PawnOs5BIKx+bT8LtxCFRu4/aPntaz9dcz2JMUmvW8x7CQkikVn1g
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(107886003)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?eY4JkfDnITWXPdQcsv+YiWNw8UwDVaYKE/wV1gGXFp+HMhVWF3BcMGscyo?=
 =?iso-8859-1?Q?KjE9wIK2oFVexxveX/Ln0jDwEVqpWZ4ibSv7s9PoXj+ZonS923IeDK5UCe?=
 =?iso-8859-1?Q?KrhILFeaxLEhCo9ldmDnnugHDjZ81xjBtHg+BRbnDyq+IRZ+nR/NTsMAdv?=
 =?iso-8859-1?Q?phj1OTKV3zXhIiUNb3dZlvTz+jGMxFukIM/h6WaSpe/EuF+TNQrk1Rc821?=
 =?iso-8859-1?Q?lKwvoOsu/rfZt8XLHEHHiHedOIkHwVHnMEvvWy3uyNr1M2zlmUL9AaVQSj?=
 =?iso-8859-1?Q?yTfFM2Au0kyvLDiicYI+qBuSBgBSb91jx9frhyN2UZOim42JUh8pwKjIGz?=
 =?iso-8859-1?Q?lqqFsdRR+GeBm2CQKKYFqyplUXMEzLEQMSKRxXHyvAjO+4YsWmFLJIPYWV?=
 =?iso-8859-1?Q?idbzx8YUuNuydh4qvJRpEqWY6b7PtIEdIxjEYibwCEQgRz7P1rJAnfLaCU?=
 =?iso-8859-1?Q?BPF9g03QLPswrHLXjJHIy7VGAaBmRRgfj7pUGiSIa6aVwFDjXupEFR4Vwq?=
 =?iso-8859-1?Q?GPrSDzNrMu/q/FQC5LZiu/6/3A+gdL9/qf4soxfsX4t2jUsBF18t6p7jQk?=
 =?iso-8859-1?Q?CGtFtTTVeLlr5BOJOfm38aEXwvIMoPFP/uTCfuRfv9EWxhl3XYk9+KdUd3?=
 =?iso-8859-1?Q?jj5IWa+2FoJe7pnp1gOUQIPbKFesflNxlXh/L5itJhDKJASaILTQvRzspe?=
 =?iso-8859-1?Q?wBLqGN+aVt8HEtjPjxnt8aDRr8lpWjY9PuAHMJ9Yrp4qpwznYNQIjpSNzy?=
 =?iso-8859-1?Q?CNqlyYffbjN+VYiaeD5nF4o4G+XskF5xKg3s+CCJH3cCJpnLYrNZMcjuOT?=
 =?iso-8859-1?Q?jll0xGpdcyDYT08fWY3UMoFByQFyJuytubcWl5cUv3Dj1JuyTl8IZGaczB?=
 =?iso-8859-1?Q?2/RKhHtt5Oi84o0Oi6e7Nkq1lGB0SW7bKzigh+KW/2iG14GZlPEUQhVOVp?=
 =?iso-8859-1?Q?VZdlVYPVBo94lxC16Pqcvb9hyd3decEKPjuVyVTQQjZiZYz99kzS4aWIrC?=
 =?iso-8859-1?Q?gP6vVr7aPvlLP/WNiPDP9eCbqv/D8iX8MQF+nAUDAOEYWXs0JSdB2+ISmv?=
 =?iso-8859-1?Q?WOP1BHANUOxa+FuNimVGAtK/YbYUOtISjE1bqjYuiTM35/opjhudPceii0?=
 =?iso-8859-1?Q?LFPrxPWaQmF144P9Jft9QL+zG2ej0gCwEtGemAEPl7Mff4L0Jzi6iSUb0k?=
 =?iso-8859-1?Q?hn4M/HbXkOy1alrcUFj1yKU8jm3eY+0hxMimhKZMOhagQi5cVeDnE4Tq4c?=
 =?iso-8859-1?Q?V1ESTe3jTbLjPelkmswFCiBm713OhDl1WwkSFe+Mw6+/kcJ3ulU06/EXlD?=
 =?iso-8859-1?Q?NiOtuSMQevOJo2h+A291GMqOqjdSCYLRzUlIQGHJ6dgacc5ZnJ5z6f2ESN?=
 =?iso-8859-1?Q?3Zt/sHy+i3MTlISlJLnsLEYOAj5AHEpcQYwAw0j2bi7Wia/TCGEq08etRn?=
 =?iso-8859-1?Q?BNaiGQ41tTiPnhBw6sP+NFKpM0Ay3l53VhWumF/qBfiolxGYw5/E4Yell5?=
 =?iso-8859-1?Q?yoIkAiDrpc43HhDYPAzd05AJV21U/jfGv5SH+PI5A4Ge5MnnHFuaDm9yTQ?=
 =?iso-8859-1?Q?zg57iegdP2p4/GAeH0usl7cliyb2vIlCscmNbiWoH3p8i5udHaQeaEl0AX?=
 =?iso-8859-1?Q?kkQoGV1ZCMomM2G6wTnD1cMX7/QpvgrMlxXI8Rv+dLx/1bnXZ/iplnoA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d9b8d0-52ee-471a-affc-08dba8e66f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:44.6371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHeXT79Li8+nP0oKS63u0m826gne51eMqkKhDEzOOgBd9ZKFSTi/UG2q2n6ZDw7H2jJknlD+9lgT7drUmRydVvZwKlag2BcPsooEsWiluNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: ceyT-8jLF7Qk1-FSkN6pMMDVOko9niTd
X-Proofpoint-GUID: ceyT-8jLF7Qk1-FSkN6pMMDVOko9niTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Take into account guest's BAR view and program its p2m accordingly:
gfn is guest's view of the BAR and mfn is the physical BAR value.
This way hardware domain sees physical BAR values and guest sees
emulated ones.

Hardware domain continues getting the BARs identity mapped, while for
domUs the BARs are mapped at the requested guest address without
modifying the BAR address in the device PCI config space.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
Since v9:
- Extended the commit message
- Use bar->guest_addr in modify_bars
- Extended printk error message in map_range
- Moved map_data initialization so .bar can be initialized during declarati=
on
Since v5:
- remove debug print in map_range callback
- remove "identity" from the debug print
Since v4:
- moved start_{gfn|mfn} calculation into map_range
- pass vpci_bar in the map_data instead of start_{gfn|mfn}
- s/guest_addr/guest_reg
Since v3:
- updated comment (Roger)
- removed gfn_add(map->start_gfn, rc); which is wrong
- use v->domain instead of v->vpci.pdev->domain
- removed odd e.g. in comment
- s/d%d/%pd in altered code
- use gdprintk for map/unmap logs
Since v2:
- improve readability for data.start_gfn and restructure ?: construct
Since v1:
 - s/MSI/MSI-X in comments
---
 xen/drivers/vpci/header.c | 52 ++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 3cc6a96849..1e82217200 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -33,6 +33,7 @@
=20
 struct map_data {
     struct domain *d;
+    const struct vpci_bar *bar;
     bool map;
 };
=20
@@ -44,6 +45,12 @@ static int cf_check map_range(
=20
     for ( ; ; )
     {
+        /* Start address of the BAR as seen by the guest. */
+        gfn_t start_gfn =3D _gfn(PFN_DOWN(is_hardware_domain(map->d)
+                                        ? map->bar->addr
+                                        : map->bar->guest_addr));
+        /* Physical start address of the BAR. */
+        mfn_t start_mfn =3D _mfn(PFN_DOWN(map->bar->addr));
         unsigned long size =3D e - s + 1;
=20
         if ( !iomem_access_permitted(map->d, s, e) )
@@ -63,6 +70,13 @@ static int cf_check map_range(
             return rc;
         }
=20
+        /*
+         * Ranges to be mapped don't always start at the BAR start address=
, as
+         * there can be holes or partially consumed ranges. Account for th=
e
+         * offset of the current address from the BAR start.
+         */
+        start_mfn =3D mfn_add(start_mfn, s - gfn_x(start_gfn));
+
         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be pa=
ssed
@@ -72,8 +86,8 @@ static int cf_check map_range(
          * - {un}map_mmio_regions doesn't support preemption.
          */
=20
-        rc =3D map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s))=
;
+        rc =3D map->map ? map_mmio_regions(map->d, _gfn(s), size, start_mf=
n)
+                      : unmap_mmio_regions(map->d, _gfn(s), size, start_mf=
n);
         if ( rc =3D=3D 0 )
         {
             *c +=3D size;
@@ -82,8 +96,9 @@ static int cf_check map_range(
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
-                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
-                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
+                   "Failed to %smap [%lx (%lx), %lx (%lx)] for %pd: %d\n",
+                   map->map ? "" : "un", s,  mfn_x(start_mfn), e,
+                   mfn_x(start_mfn) + size, map->d, rc);
             break;
         }
         ASSERT(rc < size);
@@ -162,10 +177,6 @@ static void modify_decoding(const struct pci_dev *pdev=
, uint16_t cmd,
 bool vpci_process_pending(struct vcpu *v)
 {
     struct pci_dev *pdev =3D v->vpci.pdev;
-    struct map_data data =3D {
-        .d =3D v->domain,
-        .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
-    };
     struct vpci_header *header =3D NULL;
     unsigned int i;
=20
@@ -177,6 +188,11 @@ bool vpci_process_pending(struct vcpu *v)
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct map_data data =3D {
+            .d =3D v->domain,
+            .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .bar =3D bar,
+        };
         int rc;
=20
         if ( rangeset_is_empty(bar->mem) )
@@ -229,7 +245,6 @@ bool vpci_process_pending(struct vcpu *v)
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
                             uint16_t cmd)
 {
-    struct map_data data =3D { .d =3D d, .map =3D true };
     struct vpci_header *header =3D &pdev->vpci->header;
     int rc =3D 0;
     unsigned int i;
@@ -239,6 +254,7 @@ static int __init apply_map(struct domain *d, const str=
uct pci_dev *pdev,
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct map_data data =3D { .d =3D d, .map =3D true, .bar =3D bar }=
;
=20
         if ( rangeset_is_empty(bar->mem) )
             continue;
@@ -306,12 +322,18 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
      * First fill the rangesets with the BAR of this device or with the RO=
M
      * BAR only, depending on whether the guest is toggling the memory dec=
ode
      * bit of the command register, or the enable bit of the ROM BAR regis=
ter.
+     *
+     * For non-hardware domain we use guest physical addresses.
      */
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
         unsigned long start =3D PFN_DOWN(bar->addr);
         unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
+        unsigned long start_guest =3D PFN_DOWN(is_hardware_domain(pdev->do=
main) ?
+                                             bar->addr : bar->guest_addr);
+        unsigned long end_guest =3D PFN_DOWN((is_hardware_domain(pdev->dom=
ain) ?
+                                  bar->addr : bar->guest_addr) + bar->size=
 - 1);
=20
         if ( !bar->mem )
             continue;
@@ -331,11 +353,11 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
             continue;
         }
=20
-        rc =3D rangeset_add_range(bar->mem, start, end);
+        rc =3D rangeset_add_range(bar->mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
-                   start, end, rc);
+                   start_guest, end_guest, rc);
             return rc;
         }
=20
@@ -352,7 +374,7 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
             {
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]=
: %d\n",
-                        &pdev->sbdf, start, end, rc);
+                        &pdev->sbdf, start_guest, end_guest, rc);
                 return rc;
             }
         }
@@ -420,8 +442,10 @@ static int modify_bars(const struct pci_dev *pdev, uin=
t16_t cmd, bool rom_only)
             for ( i =3D 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
             {
                 const struct vpci_bar *remote_bar =3D &tmp->vpci->header.b=
ars[i];
-                unsigned long start =3D PFN_DOWN(remote_bar->addr);
-                unsigned long end =3D PFN_DOWN(remote_bar->addr +
+                unsigned long start =3D PFN_DOWN(is_hardware_domain(pdev->=
domain) ?
+                                      remote_bar->addr : remote_bar->guest=
_addr);
+                unsigned long end =3D PFN_DOWN(is_hardware_domain(pdev->do=
main) ?
+                                    remote_bar->addr : remote_bar->guest_a=
ddr +
                                              remote_bar->size - 1);
=20
                 if ( !remote_bar->enabled )
--=20
2.41.0

