Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070157F38F8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 23:10:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638302.994726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Yx8-0006c1-G3; Tue, 21 Nov 2023 22:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638302.994726; Tue, 21 Nov 2023 22:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Yx8-0006YV-CP; Tue, 21 Nov 2023 22:10:42 +0000
Received: by outflank-mailman (input) for mailman id 638302;
 Tue, 21 Nov 2023 22:10:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqD=HC=epam.com=prvs=5689374ac6=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5Yx6-0006PS-PB
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 22:10:40 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd2f4c23-88ba-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 23:10:39 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALJcd1A031085; Tue, 21 Nov 2023 22:10:32 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uh0hhgrv3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 22:10:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8836.eurprd03.prod.outlook.com (2603:10a6:10:40c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 22:10:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 22:10:27 +0000
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
X-Inumbo-ID: cd2f4c23-88ba-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HByi4MtSScepWAnhzE8y+/4h0THflXulvTUFJqhAD+QSqN5zxAPOkl84Q/BkmjmQAKXN63K5LsYmfYlFqdCwSycK/QtRzTM8ZJV7/bUlXtiU87HNNJJ3dQUJy67rXh3KcxljQvmyVG0eWevis4xKDBysIC+W9Qamf1WvXkRnQnqiO5yAeaUht3AkASL64mNQWAfZgw5L9kVV6MvVVcRp6PdDM/Yp6La/Knmq5zbwJ7bu3iZhzgrGnzhMXV2QtHNoibRnh+c8uMCZnoyrNCqU0W3/GNakCREwPZ7rne6IR3DoNS/7ZfSyvH4Y2Dn0dhnEfwdb2JB3TG4W5FMraZ5PUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YErD+LGkHLSIfKpC2tq04iqgbrsR/yANlnnAZGoF1mU=;
 b=eN1PHoRE375H63c7Wsn8OtvDFl0XpEpT9ERhCx5Diohmcg2C6CmOwdRrjWBzfaP2GwOxx/ZDSgeMOaeeiFYxyrpMy+r7WsF4e/JdQ7WSS3tkuWsnLb2gQi0LrUorSYqFQOfgF+fNy6kOWfo9RcK2rGJ9uVSHfG6jzs6/96q+BLv1dMRj2TN9R8CWBFDcbAuBeZz4/3rU+I3MKI2aFNjedeaM4d6q58XtQhJ6o/TF8D2eEzDRcJ/M/hgmWnT248+AMmFlFmG4lYELSvGCwTL6CXefPVegIW/QnBThGz+dz/bdnOShPYswpzUgf8QHGM16lFLpCVWIMPIS6fnsR/1OGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YErD+LGkHLSIfKpC2tq04iqgbrsR/yANlnnAZGoF1mU=;
 b=VkyrI6wPK2QBU/CpfXJUHHX6hFOg8xP8DREfZHfPhW7d9y/u47oWr2er43qSCWqemmnPNfWDWn5X60ykBt7KuCXhD46Rvou6fSHdzXp88i1IlU7IRYUcgUGGH10nOmobycqR+KnMZ2Ox7SYbEfOzsKVnTPdyOf9Hcjqe/G6n9NNcZfkAs9tbiW7fQO0wEJbpmqmcKZJDha0RCW1AQZdZc4Tt+hUfXCPjjuaiZhJCX5vFwovZWKifLfve6AKjl4jGMq34n4bhuLK2EfFULwoYSCVpSNUoMJuaeFtzQ6pK5PwdgzveVDEoFco4FouOs5Qdzu9lFYfqQCyJYLUTFBMrTA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Anthony Perard
	<anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Kevin Wolf
	<kwolf@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>,
        =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
        Paolo
 Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
        "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
        "open list:Block layer
 core" <qemu-block@nongnu.org>
Subject: [PATCH v2 1/6] hw/xen: Set XenBackendInstance in the XenDevice before
 realizing it
Thread-Topic: [PATCH v2 1/6] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Thread-Index: AQHaHMeI32LlpkxN1EiN6kyRHznaJg==
Date: Tue, 21 Nov 2023 22:10:26 +0000
Message-ID: <20231121221023.419901-2-volodymyr_babchuk@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8836:EE_
x-ms-office365-filtering-correlation-id: 31116187-0174-41d9-844a-08dbeadeab25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1sL4Mkp3NnUFobtaE2EhfIOQQtT8YyOfGOTpmqFqIajGEeZSSlHpc2ItNIjyhri+WsNtmIRySM5SB1JfMdrLV6b5oWUq287YtEywmON8FurewElTrcv2RTjYTyW8cKl8erW4auG/YasfByrDpJqR3YdX82+6ZqCA0NnaHqYcgr/+HtoYGN0tvaVxvNPsIrQBi56CDbsLPtdcn4KS507nfDFZx5oDSQ3W0gda/s/Iwsx3YQFv9AS2lZDTci6hMdNeQBtpO2XwnwTMVT7vXOeh5OapnH1c0UIntcbcTjXMOm8D6W84SPCOqVqK1T8TwxskXQQu2HDgdcR47xeLijy0gzgmAR8P/+RORTj2h9pdoIpHMuDIn1LwmaL/dd/Rjjen81/4Rt5qv7CRgAJw8ri4P1JPtnqIg9NuBR5Fkug+YzZb+ZZyEDGFyrDh7qv8VNYAj6Zsovkw+nHOtI8Y586H/mTX47AT1WMSBQSK2GhoAci+2WtRpmLOBQeKkwr3WLeNOhR/BYgeA8CZJ8IFGL1gFHI8id5KVEpAP/ROZArRIA+DNLZeo48Tc/87bFARmUffMAbSTKA87VXZGzsMdj/t5T2Iyte1LxymabnyA95Tx5FHdDPjer2sbL+y1hfQAb1Z
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(86362001)(36756003)(7416002)(5660300002)(2906002)(38070700009)(122000001)(6512007)(2616005)(6506007)(55236004)(6486002)(83380400001)(71200400001)(1076003)(478600001)(26005)(38100700002)(91956017)(66556008)(66446008)(316002)(66946007)(6916009)(64756008)(54906003)(4326008)(8676002)(66476007)(76116006)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?JuLA2Hn7jFhlkk9wc7smzueOc0Lt4aKTk8KWY68kzpZxd80M60sEXISQWg?=
 =?iso-8859-1?Q?JfGVl7lqYO4mLVszCcZtOcEcbQD9B8NH0x7c+4it0sBWem9IKKmt7CqRMu?=
 =?iso-8859-1?Q?/RW8DZH9qhvnj3jC9zYEPk9mB6ni7P27EPVrnB0xvNTVZCLndh/J3WO0zV?=
 =?iso-8859-1?Q?S4Wt00oi5P7j7Wkj5huO/nmLi5JYEC7o5e8HWAyxv7bGtR6p/dHb2lK1+B?=
 =?iso-8859-1?Q?n0J2HlcmyOG0PiJ/xAVUupLObZUWM+KHJZz5DuMzUdskRNkWC1xRBo0N1v?=
 =?iso-8859-1?Q?BQ1EQCsrpq7uzgVMqd83mzfY1/1Hs1u91K6Mfal4gUhESrORThQUBDHdZS?=
 =?iso-8859-1?Q?g6HJbrJ2m3/m3Pq0vp6ptxJF2QZo3XB0+R/3/wVAyT2aDIBnDtGO8vnprB?=
 =?iso-8859-1?Q?3QWPCfipxEduxw9WVVd5sVrIbvirD33umYbVNe9YYD3NZuZwFyyr8/vTb5?=
 =?iso-8859-1?Q?5hsbuk9wSjehpFs5JyZ5DT7JdMTmnftPSUFFX8Qb+FdIsjqMNnsH4w9sEX?=
 =?iso-8859-1?Q?2FjQTywkvunjolMaPM3WYVXv8ZxB+rqnmMacO8zeKww18POYboDTYUa6xN?=
 =?iso-8859-1?Q?S6mULSRmIvJiggg6dWo2Nxd2pFNZMcsBn5JBpT/91wPhhJo4ErQZmmmCM2?=
 =?iso-8859-1?Q?J8pb2NLyoDfZk/Xk9NJhieYtkBIqppIFQ/ooVpykgVFKu+JfrDYwKuD6oI?=
 =?iso-8859-1?Q?5c7qFi2tzDWOBOQtQSUFcFxc4c+lKuz9Oear04gH5Ohp0Abt8rriibMlYz?=
 =?iso-8859-1?Q?n7xpOLHtqsWr9PAtsPxNy3g5W402AUnDQOrTh+99yjlCi8cQ/8gHhvxyLC?=
 =?iso-8859-1?Q?mjkv4cgrmb2419uVl/D4P7ctP1cjLx0w6L4r4xk6ofmjFbWOj4Vi987jiU?=
 =?iso-8859-1?Q?YMIs2M4BgCWh/EEgnmyPiUy4kSVnKh5xEy2L/DipE3fx5+/+uL5hNhiQfP?=
 =?iso-8859-1?Q?Ts3kqiykhnuczez8vnhSZMbFsAwtl/Eo0Z0Mfq3v3YFUDV8n2jDzEoFHuE?=
 =?iso-8859-1?Q?RFva/PrsgWUAz9l8Y60ojzOPACBm5bzPvwTAjzHqRKq8w5k38qfHiNL5Pa?=
 =?iso-8859-1?Q?RNPU1AbRgjUCMtTndJbOCO4lR2997Ai6n7XyCkBDqNuSTnVf1RRPPBnFzv?=
 =?iso-8859-1?Q?5CkOt1WI4bnxYGqy8XSHI7uXiLFh+i+eR/iaPbgZHYJVFOGO+EqJgpsF9A?=
 =?iso-8859-1?Q?xR4h9MmBYMo2KZomTZCwGQPtpgjvtPib+D0MRHU34ILllsab96SLGV0erV?=
 =?iso-8859-1?Q?zJBi0mfjrtJABQC9S4xFo3w23lYiNvJO8tnIZ3m5jRmHlbwRT1TG39AuR0?=
 =?iso-8859-1?Q?INqlQiakoROLbYmPqXBDj/15i5sYIXaN3V8hsu/f0JLyqSDMqjw6cQTMuk?=
 =?iso-8859-1?Q?ZAiZaulkjm2V6SD9vUMJYOYW30TFPGL2s/dW7BIlV9Sk/iU9YSqMGjv2sO?=
 =?iso-8859-1?Q?Kf6wZ05KCDSLGT5UE9ZTjk/arLaMiYYJtQXB0ZpRSR8WQcXTbrxMS1aSvQ?=
 =?iso-8859-1?Q?rLddiRDcoegewS4z79GUMx/UNHdo3ONpyTb3jbYWmwMpX9qXmcfOvYuooQ?=
 =?iso-8859-1?Q?ZsQb8YbWtbLUjPzaOwoaa0Fntc4DcCALn/HN4l9/acLUggsLOmkvE7gVIQ?=
 =?iso-8859-1?Q?+oxGdMaoXBAEq/Npm3ZV8UKx1TBtRsIsoXPni5XWyJPNoHbRR8VzvNYw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31116187-0174-41d9-844a-08dbeadeab25
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 22:10:26.9832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 41t4TtKmBF8iKvvhz9tiMEGlIQqpEffeS3v/4MLxJ/nqkDzkREgINQ1N3tHPBnvbomqNMOcA5N/Sa3h2rIxdCAjMRjK8X3j7kHedx/2AImQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8836
X-Proofpoint-GUID: PaMsyu57w84Zy9TsAHeKAC4aHDDWw3M6
X-Proofpoint-ORIG-GUID: PaMsyu57w84Zy9TsAHeKAC4aHDDWw3M6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_12,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=482 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210173

From: David Woodhouse <dwmw@amazon.co.uk>

This allows a XenDevice implementation to know whether it was created
by QEMU, or merely discovered in XenStore after the toolstack created
it. This will allow us to create frontend/backend nodes only when we
should, rather than unconditionally attempting to overwrite them from
a driver domain which doesn't have privileges to do so.

As an added benefit, it also means we no longer have to call the
xen_backend_set_device() function from the device models immediately
after calling qdev_realize_and_unref(). Even though we could make
the argument that it's safe to do so, and the pointer to the unreffed
device *will* actually still be valid, it still made my skin itch to
look at it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/block/xen-block.c         | 3 +--
 hw/char/xen_console.c        | 2 +-
 hw/net/xen_nic.c             | 2 +-
 hw/xen/xen-bus.c             | 4 ++++
 include/hw/xen/xen-backend.h | 2 --
 include/hw/xen/xen-bus.h     | 2 ++
 6 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 6d64ede94f..c2ac9db4a2 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -1081,13 +1081,12 @@ static void xen_block_device_create(XenBackendInsta=
nce *backend,
=20
     blockdev->iothread =3D iothread;
     blockdev->drive =3D drive;
+    xendev->backend =3D backend;
=20
     if (!qdev_realize_and_unref(DEVICE(xendev), BUS(xenbus), errp)) {
         error_prepend(errp, "realization of device %s failed: ", type);
         goto fail;
     }
-
-    xen_backend_set_device(backend, xendev);
     return;
=20
 fail:
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 5cbee2f184..bef8a3a621 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -600,8 +600,8 @@ static void xen_console_device_create(XenBackendInstanc=
e *backend,
         goto fail;
     }
=20
+    xendev->backend =3D backend;
     if (qdev_realize_and_unref(DEVICE(xendev), BUS(xenbus), errp)) {
-        xen_backend_set_device(backend, xendev);
         goto done;
     }
=20
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index af4ba3f1e6..afa10c96e8 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -627,8 +627,8 @@ static void xen_net_device_create(XenBackendInstance *b=
ackend,
     net->dev =3D number;
     memcpy(&net->conf.macaddr, &mac, sizeof(mac));
=20
+    xendev->backend =3D backend;
     if (qdev_realize_and_unref(DEVICE(xendev), BUS(xenbus), errp)) {
-        xen_backend_set_device(backend, xendev);
         return;
     }
=20
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 4973e7d9c9..dd0171ab98 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1079,6 +1079,10 @@ static void xen_device_realize(DeviceState *dev, Err=
or **errp)
         }
     }
=20
+    if (xendev->backend) {
+        xen_backend_set_device(xendev->backend, xendev);
+    }
+
     xendev->exit.notify =3D xen_device_exit;
     qemu_add_exit_notifier(&xendev->exit);
     return;
diff --git a/include/hw/xen/xen-backend.h b/include/hw/xen/xen-backend.h
index 0f01631ae7..ea080ba7c9 100644
--- a/include/hw/xen/xen-backend.h
+++ b/include/hw/xen/xen-backend.h
@@ -10,8 +10,6 @@
=20
 #include "hw/xen/xen-bus.h"
=20
-typedef struct XenBackendInstance XenBackendInstance;
-
 typedef void (*XenBackendDeviceCreate)(XenBackendInstance *backend,
                                        QDict *opts, Error **errp);
 typedef void (*XenBackendDeviceDestroy)(XenBackendInstance *backend,
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 334ddd1ff6..7647c4c38e 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -14,9 +14,11 @@
 #include "qom/object.h"
=20
 typedef struct XenEventChannel XenEventChannel;
+typedef struct XenBackendInstance XenBackendInstance;
=20
 struct XenDevice {
     DeviceState qdev;
+    XenBackendInstance *backend;
     domid_t frontend_id;
     char *name;
     struct qemu_xs_handle *xsh;
--=20
2.42.0

