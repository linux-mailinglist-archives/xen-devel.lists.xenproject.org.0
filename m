Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA00801996
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:41:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645876.1008414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0g-00074w-Tu; Sat, 02 Dec 2023 01:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645876.1008414; Sat, 02 Dec 2023 01:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0g-00072z-Qh; Sat, 02 Dec 2023 01:41:34 +0000
Received: by outflank-mailman (input) for mailman id 645876;
 Sat, 02 Dec 2023 01:41:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9F0f-00072l-0t
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:41:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaa68380-90b3-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:41:31 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3B21X1Qm015641;
 Sat, 2 Dec 2023 01:41:26 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqa3aucrx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:41:26 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7285.eurprd03.prod.outlook.com (2603:10a6:20b:2ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:41:21 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:41:21 +0000
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
X-Inumbo-ID: eaa68380-90b3-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al0hqmWcJ5SVYym2QD9l6trDde0nES0K+LUnxEcDfZ0dE+piyaYEJh6mMMezzU9cmSizQLheQIGWrte5zqc/4l3VU+9vhp60KS2DCgJr+wRoe1GulOc45J6h+4AgdwsGP44I2Nk2U/9Hs5nIvhg9J1HFu0G0kbKNGgaBuutF+6rVIZ0iUVstJqqVos3e91ytgMyuaB7paDtCcVKlYFhBRILsVv3EWUgofUwPc6h3hMcFWEoyzrIrx+XvtoXth+z5o8DJRP7NevNTRTq8Yp/8lDAKqCu9Exy6vkh7NGEHIlYswOKsIGnIkCoo+cCPJtHHlrWHesR9+c8lwJXDHjL0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHbTU4afcP4VPCt7c5t9HdrtExRFqhrJyZbbFA7antU=;
 b=LXYNTES626N6WVrrtUj8y2tH9yuJhV+u7CWfoXGN5SsTJ4zj0TK/70X/+HLFhBSbJFRARGXp5YClMKw8mYN90+lrjBOrzw+K58n9sO/gKUAgKldjLmhdc9u5gFQj7ccEg8dlj/rmLFuqHDR2i1JSLRxraAaYeDrB0CNFML2C6GnHf5jS9U1dhx0M3uBS3YAgkDY1a4gwJ4/kQtnqnn5KqlKJ9yLnqCGCvH6XC2SfAvswRvHcwtApAmRXxQWx649SZ8Z088t6gfve1V7FMjPHSZ+m0Uf24PCcyuO+5vk1lmTLizdFNl1jS0s56YSSFHelywo3G3TN9VMY7mAN3LJohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHbTU4afcP4VPCt7c5t9HdrtExRFqhrJyZbbFA7antU=;
 b=PtHfUbJaDc5STELSmfCJq0P8LXFjcTdBkb3y2rmA93rEaP9PJ4KF6Qac6dC3hcDP+cdlYqxN84cJzW06sVFdqSnpqMR9JA+dukqUFdMs4fBsOFK7QfXFNpyYIc7t7Zd1sQgp6TGBfG6044mgx5q8lGYtZMElEqBpZeVaMZIofr3M5l5sWS/Pj+41U1TvQU0y43bqFCWI27GrbglVUAYzhxENHcrgE7F747dhH5mxYUrrRkWe2GbUanEW+iIHSlZ3xQ3cvtwiXOIayiVpS5Gj7Vc0p4IjfbQ5U4A1T6xfK4H8XRG39FXJYM2PmIrTOFP1uZNrxIIqy3jDvF1GI//bdQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Kevin Wolf
	<kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
        =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
        Paolo
 Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
        "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
        "open list:Block layer
 core" <qemu-block@nongnu.org>
Subject: [PATCH v4 1/6] hw/xen: Set XenBackendInstance in the XenDevice before
 realizing it
Thread-Topic: [PATCH v4 1/6] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Thread-Index: AQHaJMCmNcy1jH3c30+hdicFpfwJ+Q==
Date: Sat, 2 Dec 2023 01:41:21 +0000
Message-ID: <20231202014108.2017803-2-volodymyr_babchuk@epam.com>
References: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7285:EE_
x-ms-office365-filtering-correlation-id: 55de17d1-f2c3-49db-c873-08dbf2d7c995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SEmRHbAvkOF1F+M92scRmJda/E2LKTScNWl3z+dwwicVp9uQcdr+2iVtygauYY69ujsvNQ8fDDLrg+hZfMy0hbGE2xC2ir/I8syyhAqBgzqxb0YCEFfHEtDWjxKregYsAm5ozxD8c/4L5H545pnKuXOH3PGF+eWJYkO272X6ZyIg5EoKkjsJCQ9QIYtUXq9vz/ZQJkTuqeu+lTc0Wsh073ytOdtVkKGbc+8mzzmECRDHBMk4vtvAhcs068WR74F4iZJ/tDThkH9letr9MyxUHxzgjXH3vYqzdYvmLZX3J7DA1LBXfvZswojXSVITZBpTyNPbHe3T1ts5YLk0Wk1Lwi77EQAJKEYb7lgdOfsgS6P3NvyCd8ZTmqBl4MRXmmlJnM5HZ3rxIAPfm0QnqrsNZgaLV0y8KJbCQ+/s3FIokXDQzVmNa85lLjjX7xqmYDf+WJvpY8mjxgnjVFfct7z+TfLYX5d0cxYhNaAfUoeKU3fcu5bMpeocUvU3ZvN0gGQV+iSHsZZ+mfB6mjZS15U50wfosfVbTXhjTv0FdJIP6AkvkzsMdSygxR0M6yrYjBn21/rTZP1uOjjOTH6JhfYGCk4fbzEnO7XGRwAXGEAtZdFKgFuBGS5g4tPJk2PDPOW8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(38070700009)(41300700001)(2906002)(7416002)(5660300002)(83380400001)(71200400001)(55236004)(38100700002)(6506007)(6512007)(1076003)(2616005)(26005)(66556008)(478600001)(91956017)(6486002)(36756003)(76116006)(66946007)(64756008)(66446008)(8936002)(6916009)(54906003)(86362001)(66476007)(4326008)(316002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?a7Qj4f9DRmURavv37ag2UMatMN5hyNgP8Z7r55nTOXOvP97FvNHsSE4rnd?=
 =?iso-8859-1?Q?8kWS7yXkUo6ngjiKMiuu4Xc7u9Ek3dWG9oz22Bld/rVcOQf2/z1CcX2ZKg?=
 =?iso-8859-1?Q?oRErpsyVYit/08RSKW5zrFC2XXaLb6+Rt8oP4AvjpnOusvvChMrw2+CpCV?=
 =?iso-8859-1?Q?ztscTZaLvYU4JTMvXUClaeSMWcCr1jo/0ftUvcQq+py4IJMw4j6XZ0eCRb?=
 =?iso-8859-1?Q?Ju8opI9MfTZQkO36v/MEEdA2vxyX/pyhOCqbzChz4emeKs0Zy7lTd5+TRa?=
 =?iso-8859-1?Q?xTZ6jaHeTqm8Jca9ZBO9KQZnBEfikqs51X5HwhzDJUwBD6tRZewSdiLKaj?=
 =?iso-8859-1?Q?xnIt+nRJ0TVmlTNIr4kRcO0LwkUmPKcUet86uarcAQPuC6egtszvMCIUDh?=
 =?iso-8859-1?Q?2RBb2CFE9LhzDtQDCX3VcmcZzuFrYcJltrtRz/qSySq4eHJ7YfXBw/J28Q?=
 =?iso-8859-1?Q?d9cw89STJk7wR7dMDmSQS3mKeq+Lh9oDI/jRljCOzXnl33VSFRbmxLYNDm?=
 =?iso-8859-1?Q?u5zBan9DGWNuqju1zNn3cp+caWkx0H5vD09MYK81dBWVwFnme6MGzQW7Bt?=
 =?iso-8859-1?Q?dSfqpwI49JsZ5QpgSFvm3s9PTYBBfdPc+3Z+kWa8hRwVtZOoX7KTc+BOdu?=
 =?iso-8859-1?Q?sw3NZ6NZnQ6V79afHbr8z/HZhn8f+cq/x2p4L7HP50rZmwBLzC1n4BKJ/0?=
 =?iso-8859-1?Q?TNLTvCFS+woyXbtwmW7ERZieFT57lUQIrfhfJdNZajITUkJY8DqOCKpwzk?=
 =?iso-8859-1?Q?eFfKSPyMW3N2xvGtXwoRG1Qdx6XJ79xeqBM01f0RvLeG8j9CpF6AUSZXDK?=
 =?iso-8859-1?Q?5MAv0mvogyK4Wc55/rhMmzuiw/CYdDF/ocasUEGiU78U+tu9oJvcNoTrr6?=
 =?iso-8859-1?Q?XWkrZYA8IfdLlqW3KHL4tLvd/1mDk4W5k5iP0Mo0Y8TilucpdGan/J+ct1?=
 =?iso-8859-1?Q?a6HNuJXx3j7zYjeUgQ+pDM+uMK08bD+CdJL1dGcGsE+GKHmJ6Lc6Z5cA5Q?=
 =?iso-8859-1?Q?uNgwB/cl9TPaHkKWbZ4eR5Hzi992wxMBqyhrZLgG0oBBTQ5pgAJpG0+cEu?=
 =?iso-8859-1?Q?nGCiOSspgqef70yEZhZLk6yKqKmJOKC//n+EXZeSN9G6evxLkhDXM4p8fl?=
 =?iso-8859-1?Q?t6hDhrisnOHFsqE872s3SWiLRvjRJiwtiofzCeljUGCmLvjusAxruCX5it?=
 =?iso-8859-1?Q?grZfP8badv/l+56Gtc/dAxL7Ghh/6E71Lx62aLMUf2vT5kOaf7MBM0DCD+?=
 =?iso-8859-1?Q?9rPQ2AZqzG8ytYzRgeWgQZg546nKUG96hTqeugm0uWBS+pUaI9qT7KSVd8?=
 =?iso-8859-1?Q?26Rp/yocBvWEPF5h9PSdUo/N0GRUWXA7QY4kqNeR7TP6yV6jYZ20xWSqRs?=
 =?iso-8859-1?Q?ToGtOQoJrYp++EXAMjrtH1PAsjYIwfJLr2dHQYEvTf1aJV7Aq/h++uJRm8?=
 =?iso-8859-1?Q?1GTatKPZcLP1B8kvq065kzAZ1uKKoguuyneolgBXulrpcl3IYVPHd0ZduL?=
 =?iso-8859-1?Q?DILV8nHaVs5AEak6MFaSjnHFW4M1bPIITB2qs8oepSjmj2+NVYvL/J6fZF?=
 =?iso-8859-1?Q?ra2nrHkFN/pARedFLTC6eCmNFuXMlfHxNSF3wTspQzafiAP6xKwVcTjxKI?=
 =?iso-8859-1?Q?tSjq/l/MQon7RjonEVWNN6FRp/noaZjHEeT5Gu+kW3YLfMNPrLNZjlCA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55de17d1-f2c3-49db-c873-08dbf2d7c995
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:41:21.4747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OlIU3njXmpGSqJXQCcZYXlAx7K8RNyQRla0IH1J9p5qpS3pMlSPmWdjKjFd0KoFuLc82GOF8QnZx85xzSAJckddQmurvz+W4CcJRzUILGik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7285
X-Proofpoint-ORIG-GUID: NY1ySJ2ni0D9wvujoIJInK0EAWdhitnJ
X-Proofpoint-GUID: NY1ySJ2ni0D9wvujoIJInK0EAWdhitnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=412
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020009

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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/block/xen-block.c         |  3 +--
 hw/char/xen_console.c        |  2 +-
 hw/net/xen_nic.c             |  2 +-
 hw/xen/xen-backend.c         | 15 +--------------
 hw/xen/xen-bus.c             |  4 ++++
 include/hw/xen/xen-backend.h |  2 --
 include/hw/xen/xen-bus.h     |  2 ++
 7 files changed, 10 insertions(+), 20 deletions(-)

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
diff --git a/hw/xen/xen-backend.c b/hw/xen/xen-backend.c
index b9bf70a9f5..b2e753ebc8 100644
--- a/hw/xen/xen-backend.c
+++ b/hw/xen/xen-backend.c
@@ -88,19 +88,6 @@ static void xen_backend_list_add(XenBackendInstance *bac=
kend)
     QLIST_INSERT_HEAD(&backend_list, backend, entry);
 }
=20
-static XenBackendInstance *xen_backend_list_find(XenDevice *xendev)
-{
-    XenBackendInstance *backend;
-
-    QLIST_FOREACH(backend, &backend_list, entry) {
-        if (backend->xendev =3D=3D xendev) {
-            return backend;
-        }
-    }
-
-    return NULL;
-}
-
 bool xen_backend_exists(const char *type, const char *name)
 {
     const XenBackendImpl *impl =3D xen_backend_table_lookup(type);
@@ -170,7 +157,7 @@ XenDevice *xen_backend_get_device(XenBackendInstance *b=
ackend)
=20
 bool xen_backend_try_device_destroy(XenDevice *xendev, Error **errp)
 {
-    XenBackendInstance *backend =3D xen_backend_list_find(xendev);
+    XenBackendInstance *backend =3D xendev->backend;
     const XenBackendImpl *impl;
=20
     if (!backend) {
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

