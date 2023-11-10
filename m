Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36337E8484
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 21:43:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630793.983890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKp-00050y-Ud; Fri, 10 Nov 2023 20:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630793.983890; Fri, 10 Nov 2023 20:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKp-0004yq-Ro; Fri, 10 Nov 2023 20:42:35 +0000
Received: by outflank-mailman (input) for mailman id 630793;
 Fri, 10 Nov 2023 20:42:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vE0U=GX=epam.com=prvs=56783987ff=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r1YKo-0004yj-0X
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 20:42:34 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aac58679-8009-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 21:42:31 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAKIjQs010025; Fri, 10 Nov 2023 20:42:26 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkysufj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 20:42:26 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB3PR0302MB8991.eurprd03.prod.outlook.com (2603:10a6:10:437::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 20:42:22 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 20:42:22 +0000
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
X-Inumbo-ID: aac58679-8009-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFlv+cRUfIHOzTpuKPONH2keS/ngQwhpsNVDHbQKm7s6VSU3RbMGtweQs4XUVtS+C9skJ+dLnQN57wvl86H0tYteb+blj4AFQZLE0hcsfi7Fxfpx8COMBF4w83UIrDwreI28/Nimn91VGqXY+srZ9oYyWa2/oU/WhdeCkkwUuL7BNtqQCm7NXHfonEovFn6yL6H/CwOMh01IvGBMlL/IUFpswTx6W7UUEGCYYWlr0xi8TfNneZphar3VEAIlwOLD1rbYsYNFyM6pNPReGuQilA4vkeRsW/PVCpIkbcVdg/ZSL94r7O09zgOaafEPq0v52mrpMTUXeTH0qh6tNKY4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnRtHURNzIPLY0JeVnzQOo2dxqvod8upLt3UTqjtXyc=;
 b=mjJR8ebmXmodBIyS8X0qHXslXnTMoAiIuwmYjGWd34FJzp7k7RMPezZktIEW64tBSWgdMPdjRQ1krwbkulaBMnMdXXfExFsC5CZ3InxA6cRdZF3yIgxOksa1w/intCg5RarVChex26QbuIlVw4LJOyiDWNOwF5smvWB8q6YHjhUqzJIMVl/14UyMvNsTW5HeDvWTmcSCSuOHKz8ERX6osqlRU01hgfMqOiEPS3pwSIfWEdgrIc8h/mbbAIvSMHERn0JDCbeMuefER7VDtSJ+FBY+zvNLtTQ6htx+F/Oy9dnvbMdfN7wfRzKZgtEBOo81uCKZOiu0MIdgL/ZYA9rysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnRtHURNzIPLY0JeVnzQOo2dxqvod8upLt3UTqjtXyc=;
 b=jnOZv8V5g+HU5vED9+PeS0uHs1PXt+mkG/5kGwVmvONgXmh8mSGyPz7JKtPvz0wVVCzp7PkAvQMmcaBkArKD+EsbkPnMl6Iy7cffwix3csNGHKKnQdkq6OZQ18xMqJOl1YDPvtf7z9ZrWpg9+nyidCthrkm0Hd5wXzerxcV8sfB09t45iig8oFDMjK4h2N7hHMsx0IJ7tgbxi9NTblQOe7RQET9mCm6J7uk2vCur3jVBxK+80yjsxMWBA+VzkcO7ag+rjx8SvVWzRvq7Gshbdj0NlA8o+FKp+sBrY0UxOt+b8OcbsXBkasozyg9Tpy8AApeGFBrhyegEvwHhIJncoA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>,
        "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
        "open list:Block layer
 core" <qemu-block@nongnu.org>
Subject: [PATCH v1 1/7] xen-block: Do not write frontend nodes
Thread-Topic: [PATCH v1 1/7] xen-block: Do not write frontend nodes
Thread-Index: AQHaFBZngjGHt2Wnc0CJ36bDt34c6A==
Date: Fri, 10 Nov 2023 20:42:21 +0000
Message-ID: <20231110204207.2927514-2-volodymyr_babchuk@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB3PR0302MB8991:EE_
x-ms-office365-filtering-correlation-id: 7e7ff430-02f3-4bbb-08d3-08dbe22d8a6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +t2p/y7ZRDtOXl8MyGRMsxJ1lL4x70IflYG65zjO2x4DwsKjW5PmLEcCZc+NfYLkWNvsZqzO3lbY3TQ+KU6gXpPeJBafAmt4r+FDGI6CA8/oaAsqVAIgylmWcnUQnuFmYJvlYXPOe890SrfvH7peKyqoWoiz68xpYZaDyGRZV7UvKjoT0HZW6rUgFE0/G3/chNUGhh4eo6O6P5dFOLdUcM88cCFhA4Afm0xC4xHi9OwWFkflYMr7AeBf02Y2C+Pb/BOurklrNBMWBAs+UOmrhWAy6MOT9IpF6M+Uyd/FA2C4DSzwNXykCq9cGeeFwYjAm/c/Cr2ushefM4DSt0Vvi+bJYc4jTiQH42qP/Bo5HVx6iEBCTX7EK190OyhrVA47IeCgUbRMMtysccl75D58qIJrqU5URirl6T13lRIRIYIuaQ6aqLpTc7UsVgb5SQz6Yenib6rhjVDT1qzwoVPF9PmZfXPX912O3L214YEvYimCn3FH1wmyzvyPNiZk0uA5LRDaR/FQMVV/RFsgPCOITHy3nhV2Xz4jd28cfQZVhia3oHCzfYL3RQtjufEYs1D95dmD6YmavaPmjDzUjnJniaX/fAtDecTLUjkbqYh+uXptzf3yLa9QUFg4r6fU+qFI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(2906002)(8936002)(4326008)(86362001)(5660300002)(38070700009)(8676002)(316002)(36756003)(83380400001)(38100700002)(478600001)(2616005)(1076003)(6512007)(6486002)(71200400001)(122000001)(6506007)(55236004)(91956017)(76116006)(66556008)(66446008)(26005)(6916009)(64756008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?341y8SHaRk1EQ0QaPLM8F6h8YKA7bwcqC1Cb1MoLd0PR9LJDK3ktkrV/3l?=
 =?iso-8859-1?Q?81niSqoAyrtuG42GUe/4maa1jrq054Iv/SaQK2PnGEgTDpyYHxFOFUIF9R?=
 =?iso-8859-1?Q?IsGksnxofRFII/7zQ8v08d0XMSWLFJGslmnj/xqYcj3GW9LzOx9Kisw1kZ?=
 =?iso-8859-1?Q?dTETuwYPTrmr0CICo93TAhzHOQ352mBUFaNv770/3drh+NlokAt31+Fm7Z?=
 =?iso-8859-1?Q?c+jVIgKsvli/rVHB/mr4R+UhZ34XIV/7IPKdvLRh43ZxuE7DhTEh93rVYD?=
 =?iso-8859-1?Q?3IBNdf/kKT31b071snFOGNIsG0ZPMp3t+Yn9M9vHdisZfLLLiQJRV9wxUg?=
 =?iso-8859-1?Q?C3FWxdB8RcoDtjAysCguctFzI8Tlhqgn3CkNwjP0dml+i4NZdf9NhME9Qg?=
 =?iso-8859-1?Q?vCs0mZo9BFcOH88eb3PuWNLihFOY22vO/RBhJbFuW/tv9WL7mQObEJCNA2?=
 =?iso-8859-1?Q?tmaGwKbx+BW/CONPGIVjeHnSZRt11QKMyOKaswlEJwCAfCF4Cnv/FaYYoo?=
 =?iso-8859-1?Q?ghKRxP3UTYqmieGiplpMCEza3L34R9JI8I9SNiMub/Ly0Ga3T8DFzzTQOC?=
 =?iso-8859-1?Q?mEjWcp93PkicE7B/y1DKNFDZa1T1kTK31RwjHdUnZyQPl1nxOxcCPKr1Wx?=
 =?iso-8859-1?Q?0zQJOkSxUhOc7GK25aBbeltwguN/gbOzS0+UTfJQqQZ8qwXg1k90BTKVWh?=
 =?iso-8859-1?Q?N6SHWHmskolaKyozsCXclWaUzch1RVR+8acjZW0BY/Ar7KHx4lKfTidxWz?=
 =?iso-8859-1?Q?d6XSdu9MdIoSc6dFtnCHYTF7nLtOEmWDyRZHWMw+po9Th1yiJAKxHzKzkV?=
 =?iso-8859-1?Q?eGW30XO+apCYZi+CTCQDSR6g8pt631opoiJpT/iMdP1hNFcTtzHjWHMxAY?=
 =?iso-8859-1?Q?Kgn2rcChaaFXH1kkZj2RcTTCqxHLE+zzcg+G5Q5Bvjs928qBJ95CqgQ+iO?=
 =?iso-8859-1?Q?v6D1D9xpll4lNgCXbgzzrOFwcQd+oLy4OtFHo+4lR10A53RZv2ItoUASaz?=
 =?iso-8859-1?Q?XOXbvt1qtY1XZW9O1atqUrEPXdDNY1k3sMOH8Xtn9jesPNpRUO8wVyIg8W?=
 =?iso-8859-1?Q?URNEWn9B6kqZM355ALVO4vp8yLarQwE3uQ+RgaoFPSHJ6bLBN46r0Ts5To?=
 =?iso-8859-1?Q?x/YQ22U8/ImfNwSD/s27d7w++qEsMBGqIu5XHHyTJ1Cyt21j7qKM7hsUPr?=
 =?iso-8859-1?Q?2GjW5jHJRNjhWySpT87GAlU3NIfR15F3K1PuOcopdLLwMxcME5Mm2AqWh5?=
 =?iso-8859-1?Q?wiaGN9p86ZELI6/sH4qnCX03X5Sk68KwHCs2VQJzuQN4ATS0dA5w93moUO?=
 =?iso-8859-1?Q?jwSHKF+saZtzd0nxWkHxlb2nxGbnUrOgTAq92UG5Z/ZnxAdihzNuQEm7cm?=
 =?iso-8859-1?Q?3YiC+2p3c2d2s7AkLgpMTvjrMK1+8TK/129xGqf0ASlOruk907ZWgP2hRd?=
 =?iso-8859-1?Q?smftjNsQqJ5dAwpJ7+YkfzeRO4rX7RJrTxBvwEh78Gsyr1Oz55yMWAYPFl?=
 =?iso-8859-1?Q?vIhV0jpfItHMFw9cN5Lb3JjLfs/uRL9jTaoa9pLAnxwoKgJKyCENkEJewS?=
 =?iso-8859-1?Q?7H9toJx6ax62l578HZe293GNyP1Scz3LjkAI++Th1lulJ1/K4XCEeB3SSN?=
 =?iso-8859-1?Q?AjT1BDfbVs06gqY3A14UH8C23OOT57dHiAVP4CkWehiMg7uUf9NbHusw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7ff430-02f3-4bbb-08d3-08dbe22d8a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 20:42:21.5521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zFXmpaAZ3YQ9XZADoakCzmb4xIBYWzFCDwrR6dpMEUJ5PCMtm8OKNtjm6z39PMVQPmBWXLEQPstNyD6CcvCV4Dnp65tEutR2CLXBwg5ic0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8991
X-Proofpoint-GUID: ZHeeUMuC7l0RDea5kDJ6Zrl-9h5z9xBi
X-Proofpoint-ORIG-GUID: ZHeeUMuC7l0RDea5kDJ6Zrl-9h5z9xBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 mlxlogscore=691 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100172

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The PV backend running in other than Dom0 domain (non toolstack domain)
is not allowed to write frontend nodes. The more, the backend does not
need to do that at all, this is purely toolstack/xl devd business.

I do not know for what reason the backend does that here, this is not reall=
y
needed, probably it is just a leftover and all xen_device_frontend_printf()
instances should go away completely.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 hw/block/xen-block.c | 11 +++++++----
 hw/xen/xen-bus.c     |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index a07cd7eb5d..dc4d477c22 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -221,6 +221,7 @@ static void xen_block_realize(XenDevice *xendev, Error =
**errp)
     XenBlockVdev *vdev =3D &blockdev->props.vdev;
     BlockConf *conf =3D &blockdev->props.conf;
     BlockBackend *blk =3D conf->blk;
+    XenBus *xenbus =3D XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
=20
     if (vdev->type =3D=3D XEN_BLOCK_VDEV_TYPE_INVALID) {
         error_setg(errp, "vdev property not set");
@@ -280,10 +281,12 @@ static void xen_block_realize(XenDevice *xendev, Erro=
r **errp)
=20
     xen_device_backend_printf(xendev, "info", "%u", blockdev->info);
=20
-    xen_device_frontend_printf(xendev, "virtual-device", "%lu",
-                               vdev->number);
-    xen_device_frontend_printf(xendev, "device-type", "%s",
-                               blockdev->device_type);
+    if (xenbus->backend_id =3D=3D 0) {
+        xen_device_frontend_printf(xendev, "virtual-device", "%lu",
+                                   vdev->number);
+        xen_device_frontend_printf(xendev, "device-type", "%s",
+                                   blockdev->device_type);
+    }
=20
     xen_device_backend_printf(xendev, "sector-size", "%u",
                               conf->logical_block_size);
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index ece8ec40cd..06d5192aca 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1048,7 +1048,7 @@ static void xen_device_realize(DeviceState *dev, Erro=
r **errp)
     xen_device_backend_set_online(xendev, true);
     xen_device_backend_set_state(xendev, XenbusStateInitWait);
=20
-    if (!xen_device_frontend_exists(xendev)) {
+    if (!xen_device_frontend_exists(xendev) && xenbus->backend_id =3D=3D 0=
) {
         xen_device_frontend_printf(xendev, "backend", "%s",
                                    xendev->backend_path);
         xen_device_frontend_printf(xendev, "backend-id", "%u",
--=20
2.42.0

