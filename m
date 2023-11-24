Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E04A7F86A2
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 00:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640982.999784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6fXL-0001UQ-Ue; Fri, 24 Nov 2023 23:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640982.999784; Fri, 24 Nov 2023 23:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6fXL-0001SC-R8; Fri, 24 Nov 2023 23:24:39 +0000
Received: by outflank-mailman (input) for mailman id 640982;
 Fri, 24 Nov 2023 23:24:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+4=HF=epam.com=prvs=569229df20=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r6fXJ-0001Rw-Mj
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 23:24:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0c0b35b-8b20-11ee-98e2-6d05b1d4d9a1;
 Sat, 25 Nov 2023 00:24:35 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AOMwAPI014042; Fri, 24 Nov 2023 23:24:29 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uk2wmr6b0-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Nov 2023 23:24:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8551.eurprd03.prod.outlook.com (2603:10a6:10:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 23:24:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.022; Fri, 24 Nov 2023
 23:24:23 +0000
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
X-Inumbo-ID: a0c0b35b-8b20-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbVatzfST7Db17RlJcewQWIWs4r66OEQ9LAUFhZ+QOzyjbdVsLxBIl5jD8KxYy+3MPODmsV2JB3UMYOPurzihF8M6I8Whs7x6bKL8+s7G+sQI6Gy3UskpCTZPNZF98XyhGYRACWbehJ7ynXGxy/z6E5/zPHyCcO+jipcZU8vj8g5+N4bUdDASP0tCtWyDansmLdVPLTVy0evDF/E+yzaAFHahDh2xMhDvBY4V8CY74O9puukCi7+XxmprHsywdv8+AcR7eKQIxvcqHu4yWbXKP0jOtKl6xmauESnkLpyNK4at/kQNLPYA2zicBXL6GTvOL51Nlk0Lp0V34ECOxjIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5NInDPYzynXk4olgXY22V4iJ6pK1OKa9T7IrkYRcgc=;
 b=QsY1WR92DT6I0UlUrcyjvYf+oWUR1aWUn0BxMGRKFhjXYy28SoVoSKHnmSGc8kL9OiuQ8GgjYvG8PVyjgpTXEKPAlPZFAl7dhJb2KOX88v2pt9gnUKWhZ0xvjNc9aj9RZIJhXHLL8Ay+a0xtVwzs+FR/dMVbvHJwawBbDjB1MwOWqovetrKB6uQ4r8dx5EpJfLdzuFO8WhsxtNY8TGxA5iYUCj+VCWeZuOqE0ZO/evmsuGEU72hktzLQSR32dqrz8GBkAjGZXhCfZ/B3LQno7igh/8hFP78VR9dTu31eRw26b4579sVH7d531YuyfgMtWbBf7LxHjOBirPBiGJieCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5NInDPYzynXk4olgXY22V4iJ6pK1OKa9T7IrkYRcgc=;
 b=UNtw5F8wJ5FGYckK8d/sZr7L9+kItSpRlAWiK8+7Cr0g0fDdBfd/slCXyzbmeB5oUr/gy4UkxNCp9sgIZfQ6WPzKdJtse0DCvi6IDq2+gabQi1EhlKkABF7EhEXG8mp3ce9CBB9yB+HbVak0B11a0FIlLojTQfKgUyFLr7LXsNBASv2RaTfds9r/XnNibabRjRJl8dkS1bEy3/Ug/Frl8BiAZknkv65527jpbBArf1r9ddpONtG6NSyEEWOqT+AZL9NcV5eCNhJWhnGxjtjBFvS8Vf6lS084/Swz3F/x0fy/EtL9f+EzF2wb7gzCO2M+RMOMJ/XnY10JY5Cwx87sAQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Paul Durrant <xadimgnik@gmail.com>,
        Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
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
Subject: [PATCH v3 2/5] xen: backends: don't overwrite XenStore nodes created
 by toolstack
Thread-Topic: [PATCH v3 2/5] xen: backends: don't overwrite XenStore nodes
 created by toolstack
Thread-Index: AQHaHy1b3EzvbBTaE06mm4g67YDmDQ==
Date: Fri, 24 Nov 2023 23:24:22 +0000
Message-ID: <20231124232400.943580-3-volodymyr_babchuk@epam.com>
References: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8551:EE_
x-ms-office365-filtering-correlation-id: 79aa1d96-b998-457c-9410-08dbed447e27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PX5QxQ/3/kiqNtjA8aiYBrNGyfixFZag0Y2G457JCoSybbEJ2X/zNH+bRXrInOiMY9CqtB5PRb6kkfTdZIPB969ikRwsx1gPkeSw99BkvQ6n3mkWdMDzGj7yUPV1rRBjv9ph1CKMXKBaeG45vMVGyn0DCA3aGALcZwVti1oor6BiNnblLqTclufjCY2q0A/9eF566Ho0Ww17Kj96H0om+CRZ/Qka1/kTznYVkRf//p1eYljH0duKe5nFbPCG+bwmER0g1I/+6Jfooc1CsjQQsTuz3Hf0Ty1xcMF3xfhG3Wc6rGE9kXQPFsUCJzx+EZGb8DY2I0fiN7mWarOygunie+1egNWw058y6IH6OfKB51rc8+w3x07K5WYpuBamq9ySmjIEY14n4Pr5d94m285x+s7/RDkPXDF2maSgUNNnXUdu4vApYt//y3xN+lCk8j77FFeF3WAHgQh51Bj6GvQknsVBbRY/ayDsHyioYp7YL9Jxf4hm5BJ93g4vU1HfDcwfzhU7sVaTNk4yQc/WZsjV50hvbubfhBs2wGla44EWR6TMLwilNp/R1/bDQbXxjbG3KotGZBLUuNWuXX8Og0ibAuD7m6bAYxjTzag5ptxAL20wEkEe8YhAt0ffUFKsxQGM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(1076003)(6512007)(83380400001)(2616005)(6506007)(55236004)(71200400001)(41300700001)(8676002)(4326008)(5660300002)(8936002)(26005)(7416002)(478600001)(6486002)(2906002)(6916009)(316002)(91956017)(66476007)(66446008)(54906003)(64756008)(76116006)(66946007)(66556008)(86362001)(122000001)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?P5Zk/L9SG8UthSFzLsCkHbt/S6WyBm8+U7I/ORZv+rPdcD9abqEQfjbBwh?=
 =?iso-8859-1?Q?XbhynglhgNPobt6+GYHck+kzZAQPzUOSw1b7Jg+/MmMnF4ayNxuQOgxdW7?=
 =?iso-8859-1?Q?WRQA6MOaxj3pwk6d5VZZPwIiPx5HM4+k5t0L/Qa9/RcHclCOWMUMAPWBHq?=
 =?iso-8859-1?Q?7FyHiig5can1lhcXjRmSHOhJBKbAeFBUUcijbnJFiCBx0jiRKI6uluzKDU?=
 =?iso-8859-1?Q?8/aLvdWyTC2n6tQikY4kmsrW3nmK/cf50+TucX7oegxUZKhP97oiQezPQC?=
 =?iso-8859-1?Q?W4OyPpKNmX1nW+4GUtzkxH9qGrrtl1PzDHBdyCGw37UAIpMjzx0LJPGkrE?=
 =?iso-8859-1?Q?dN8HKpK45ZS8bg125CCaCSZh5fumZl4/RF23LCtga3KFGekJ8EuKWV50Cj?=
 =?iso-8859-1?Q?EMusd4kMALvYLyRO3km0lL+pFVxtImkO46dJtNMMfj8v5gjvcH0V4YYgsh?=
 =?iso-8859-1?Q?lBfLpcfqttovs60xpakvXemoHlPr3koRVlAr6bTIGNxw3IRjT3MIdI4VxL?=
 =?iso-8859-1?Q?wqqSH+Ut3yIjHtUMg/aR8oPdxrcSXUAVeGrx0iEeoyV9NJDKEq+wj4Xjda?=
 =?iso-8859-1?Q?inwLj5cmmvd0uupUl+e8QyibMzCb2VEOIyoPx393RTfx6DvLtHaXiMkrK7?=
 =?iso-8859-1?Q?RNx65IPfzWxUuMNY3/uKwqE0O3aI6dGCUUtaJefMSxTKnQds2FhOAOioUc?=
 =?iso-8859-1?Q?NTggrNswn6lpKt8WTPRpnQyM6Fa2rP1n8Btd2ZlOGYZESdxMbtkcnt0JM7?=
 =?iso-8859-1?Q?86HEyqdh7gpO4QgbKMvtvIE/fwOezfjb9F6tnKKpIfHW0FIu/APPLaJCs/?=
 =?iso-8859-1?Q?Fd6I59M0Vo2guRTT5Bb9iQKkVScXQE3z7Hk20D3Nh/va4U1VyfkovqEoHb?=
 =?iso-8859-1?Q?Vfas4/KBszV08b1eL89Or5tLYrxngbG0tqzC2O3iAKhZC+vdIhuNNd5aZE?=
 =?iso-8859-1?Q?+Ht+uhzdSyHhuBi3YdgYacZPzXO7WgutJ22tutN3Jq82qpVjVYrB9C57wx?=
 =?iso-8859-1?Q?4js+n06l0phNUKKK0JVb4ItaXleiYtJp3N78+LMuWrnB4uzqFs8HTHuRdi?=
 =?iso-8859-1?Q?jP2WerCmaN/f+S5C0g4UWItIuF6En7Rx93yJFIRNzhUV0z/QE+5kxM27uG?=
 =?iso-8859-1?Q?0xgS0lLti7lk7rwQo3jSA+X0VYm7fLYIwrDDczxGTy15rzre2glOxT8yRA?=
 =?iso-8859-1?Q?lcO1x5gSK1luKZCzvO1NeeDcK/RK6kp2wd6yA46GpT8ajO93Hjraua6ssG?=
 =?iso-8859-1?Q?OmFBO7Gx1otGgiCrOOMC06g+kOykXowHRXdUtgYeBb4SDb9pta6oYBjYcY?=
 =?iso-8859-1?Q?CT+KEgpAnY35U6C6Bm7+aU89Cjx3ExVtQIlQarisBR3XOFqXhbCjtPSNNL?=
 =?iso-8859-1?Q?aT5Y6q7H/5N8PIZguSJ+1udV/mPvjVSfd2kaGdtWxVnjMppEKDwZFr/cXw?=
 =?iso-8859-1?Q?Ox6chBtAZAl5/V5c0grVobCx/zeMJxSufQ+cHvtos9fAvBKk87sHBEgQUx?=
 =?iso-8859-1?Q?F5fYz0z8Fb68m88pidzR6LCZkSXEGB9T+2PUIaqMySXyQMVyCOLI+VWjW5?=
 =?iso-8859-1?Q?qm+TYCytMgcfnKpRz69aF8wERw5VXiXV7cfGh69FoskZO6CFyTdUl65D3r?=
 =?iso-8859-1?Q?O0Qckf41XxgkveMjOn8nJK+VsbkZbZeyUBvJfhPWKn6r8/gwi6ummsMQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79aa1d96-b998-457c-9410-08dbed447e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 23:24:22.5517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xNkyqKI4YT4IIdT+ljJO8sagcbRBqB2Fuv6M9yFz1v8iP/hdl/kWRESJTCJqW1KfiUgAMAUlMRepVUWpLavnOEXzKt9n2h9MOEmtMwUYtrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8551
X-Proofpoint-GUID: 79EPq4XasLgjwOuPBklnjbU3ybtvPQIo
X-Proofpoint-ORIG-GUID: 79EPq4XasLgjwOuPBklnjbU3ybtvPQIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 mlxlogscore=971 adultscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311240182

Xen PV devices in QEMU can be created in two ways: either by QEMU
itself, if they were passed via command line, or by Xen toolstack. In
the latter case, QEMU scans XenStore entries and configures devices
accordingly.

In the second case we don't want QEMU to write/delete front-end
entries for two reasons: it might have no access to those entries if
it is running in un-privileged domain and it is just incorrect to
overwrite entries already provided by Xen toolstack, because toolstack
manages those nodes. For example, it might read backend- or frontend-
state to be sure that they are both disconnected and it is safe to
destroy a domain.

This patch checks presence of xendev->backend to check if Xen PV
device was configured by Xen toolstack to decide if it should touch
frontend entries in XenStore. Also, when we need to remove XenStore
entries during device teardown only if they weren't created by Xen
toolstack. If they were created by toolstack, then it is toolstack's
job to do proper clean-up.

Suggested-by: Paul Durrant <xadimgnik@gmail.com>
Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Co-Authored-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v3:

 - Rephrased the commit message
---
 hw/block/xen-block.c  | 16 +++++++++-------
 hw/char/xen_console.c |  2 +-
 hw/net/xen_nic.c      | 18 ++++++++++--------
 hw/xen/xen-bus.c      | 14 +++++++++-----
 4 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index c2ac9db4a2..dac519a6d3 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -390,13 +390,15 @@ static void xen_block_realize(XenDevice *xendev, Erro=
r **errp)
=20
     xen_device_backend_printf(xendev, "info", "%u", blockdev->info);
=20
-    xen_device_frontend_printf(xendev, "virtual-device", "%lu",
-                               vdev->number);
-    xen_device_frontend_printf(xendev, "device-type", "%s",
-                               blockdev->device_type);
-
-    xen_device_backend_printf(xendev, "sector-size", "%u",
-                              conf->logical_block_size);
+    if (!xendev->backend) {
+        xen_device_frontend_printf(xendev, "virtual-device", "%lu",
+                                   vdev->number);
+        xen_device_frontend_printf(xendev, "device-type", "%s",
+                                   blockdev->device_type);
+
+        xen_device_backend_printf(xendev, "sector-size", "%u",
+                                  conf->logical_block_size);
+    }
=20
     xen_block_set_size(blockdev);
=20
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index bef8a3a621..b52ddddabf 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -450,7 +450,7 @@ static void xen_console_realize(XenDevice *xendev, Erro=
r **errp)
=20
     trace_xen_console_realize(con->dev, object_get_typename(OBJECT(cs)));
=20
-    if (CHARDEV_IS_PTY(cs)) {
+    if (CHARDEV_IS_PTY(cs) && !xendev->backend) {
         /* Strip the leading 'pty:' */
         xen_device_frontend_printf(xendev, "tty", "%s", cs->filename + 4);
     }
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index afa10c96e8..27442bef38 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -315,14 +315,16 @@ static void xen_netdev_realize(XenDevice *xendev, Err=
or **errp)
=20
     qemu_macaddr_default_if_unset(&netdev->conf.macaddr);
=20
-    xen_device_frontend_printf(xendev, "mac", "%02x:%02x:%02x:%02x:%02x:%0=
2x",
-                               netdev->conf.macaddr.a[0],
-                               netdev->conf.macaddr.a[1],
-                               netdev->conf.macaddr.a[2],
-                               netdev->conf.macaddr.a[3],
-                               netdev->conf.macaddr.a[4],
-                               netdev->conf.macaddr.a[5]);
-
+    if (!xendev->backend) {
+        xen_device_frontend_printf(xendev, "mac",
+                                   "%02x:%02x:%02x:%02x:%02x:%02x",
+                                   netdev->conf.macaddr.a[0],
+                                   netdev->conf.macaddr.a[1],
+                                   netdev->conf.macaddr.a[2],
+                                   netdev->conf.macaddr.a[3],
+                                   netdev->conf.macaddr.a[4],
+                                   netdev->conf.macaddr.a[5]);
+    }
     netdev->nic =3D qemu_new_nic(&net_xen_info, &netdev->conf,
                                object_get_typename(OBJECT(xendev)),
                                DEVICE(xendev)->id, netdev);
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index dd0171ab98..d0f17aeb27 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -599,8 +599,10 @@ static void xen_device_backend_destroy(XenDevice *xend=
ev)
=20
     g_assert(xenbus->xsh);
=20
-    xs_node_destroy(xenbus->xsh, XBT_NULL, xendev->backend_path,
-                    &local_err);
+    if (!xendev->backend) {
+        xs_node_destroy(xenbus->xsh, XBT_NULL, xendev->backend_path,
+                        &local_err);
+    }
     g_free(xendev->backend_path);
     xendev->backend_path =3D NULL;
=20
@@ -764,8 +766,10 @@ static void xen_device_frontend_destroy(XenDevice *xen=
dev)
=20
     g_assert(xenbus->xsh);
=20
-    xs_node_destroy(xenbus->xsh, XBT_NULL, xendev->frontend_path,
-                    &local_err);
+    if (!xendev->backend) {
+        xs_node_destroy(xenbus->xsh, XBT_NULL, xendev->frontend_path,
+                        &local_err);
+    }
     g_free(xendev->frontend_path);
     xendev->frontend_path =3D NULL;
=20
@@ -1063,7 +1067,7 @@ static void xen_device_realize(DeviceState *dev, Erro=
r **errp)
     xen_device_backend_set_online(xendev, true);
     xen_device_backend_set_state(xendev, XenbusStateInitWait);
=20
-    if (!xen_device_frontend_exists(xendev)) {
+    if (!xen_device_frontend_exists(xendev) && !xendev->backend) {
         xen_device_frontend_printf(xendev, "backend", "%s",
                                    xendev->backend_path);
         xen_device_frontend_printf(xendev, "backend-id", "%u",
--=20
2.42.0

