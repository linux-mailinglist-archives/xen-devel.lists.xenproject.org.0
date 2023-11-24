Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130557F86A0
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 00:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640983.999790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6fXM-0001a7-8F; Fri, 24 Nov 2023 23:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640983.999790; Fri, 24 Nov 2023 23:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6fXM-0001Ui-3G; Fri, 24 Nov 2023 23:24:40 +0000
Received: by outflank-mailman (input) for mailman id 640983;
 Fri, 24 Nov 2023 23:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+4=HF=epam.com=prvs=569229df20=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r6fXK-0001Rw-AD
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 23:24:38 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a140b6be-8b20-11ee-98e2-6d05b1d4d9a1;
 Sat, 25 Nov 2023 00:24:36 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AOMwAPH014042; Fri, 24 Nov 2023 23:24:28 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uk2wmr6b0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Nov 2023 23:24:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8551.eurprd03.prod.outlook.com (2603:10a6:10:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 23:24:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.022; Fri, 24 Nov 2023
 23:24:22 +0000
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
X-Inumbo-ID: a140b6be-8b20-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpeisnCGNsoilk3cGYa8Caj4IaklwZcUNyC+n2wWKAw5yc6wRmwJZIAx9c56FZk5q+6Ys7poOsY8pUVyuWYP3t6Ses1qAq5AVP0GAYl0kVb+nQb0HNcEuq8km5sYnMs/zh3LmbxAz9Tq8QtTzBEXPlu3RYAGTvVsTttS6QOscV3KVv19oyXpChmjEkdq6MHbWC6pnz7oZ0OcGt0WXIO/z5Je4XLoR9G//xLTrD5+xq40n+uMs4Cahdx+ebXJ3uxbXxoUCKbkGMHU/Q7u2NcC6HQg5ksIKhis9V0QEQi3bw3v3/u2TokBFm0sklLn6FqcyL2TBvZPSDQRSmPBFcGxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHbTU4afcP4VPCt7c5t9HdrtExRFqhrJyZbbFA7antU=;
 b=LKXOE4DBlEF+TWDHvKwomLlm2YVZyokt2Q93LX+x5hAkSnc5IxB7edN3umaJC568ZDOWmFLXoWzBO8lQznHcXYGZJ1D8FT2mCeDQ7OxbihVNgpnra7I7hestaewlqVkC9B2Q24dp9p3pic8bGUPEOp5Vo1bvG+hL3STVbwFxjyGEzq5vebchzv1IBcJce7CdvzmGw232r3pwaGOgtZNcewYVIuKec8ANeaTCttEDiwI/WrlPigQkR7cRTo/zzIUVDbysEXzgtT3HZkB7pwksQXvax0iZ8+YqEbcJe2fUwUZuCg2/KL3VlEt6KjtWaZ1yimON2U4rDF3K92g6FRZZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHbTU4afcP4VPCt7c5t9HdrtExRFqhrJyZbbFA7antU=;
 b=f+L2mrMr2hKxvijMNlwg4y5oWE8Vlq/mikkbY+CAoTipigJu/3sK2TgZxSoY4fRTI/pl1lH8lEM8vyFK81OiO4qmDnpgDeLHrmmiE74fYDzbC1xBQIX9L9xuikpYNVyjdVxUehQeiRtYTcQht9gQFjB1CUYbmD+3LxJ2G1ilD5e0zukFsdmqXDiW0Woqa8TXgMHWBt0dyGRFqPZI2CP/kig75JXfx0I2UsfOCae62t8Uxj5EFdPvT0LnEas6qbZgR36vIkLPDaZEymzwO4c7YD28gfNIw7KMAi7PeiRTTpYv/IMZn6CLiI4tKCgLUAZIfeMZnWdJ8MR7pAjI8ajblA==
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
Subject: [PATCH v3 1/5] hw/xen: Set XenBackendInstance in the XenDevice before
 realizing it
Thread-Topic: [PATCH v3 1/5] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Thread-Index: AQHaHy1a8CXoLlgE4EukDzzCfLk4pQ==
Date: Fri, 24 Nov 2023 23:24:22 +0000
Message-ID: <20231124232400.943580-2-volodymyr_babchuk@epam.com>
References: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8551:EE_
x-ms-office365-filtering-correlation-id: 69fa1008-ed93-496a-f94d-08dbed447deb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qK1f2fq4OS3pPkJfbqDAW93jxVfQuUwbPUok1NGHYsKfXviBJ0BbB+wNuQ2N2Rvbsp0SWNW1wRYj9bSV5KXPlS1Pd/odZKmnE1C2uCQ9xqT3GN0+fEJIHXTTCpg9g4FeeySn06rkRU1aJQHN8V99b2L/jMHPkznJI6A5i5wDxY9TRzmBkjL8f0yDhKj+GnjOQAX2e2ckMRJk5/vVNAVHNtFAwJeVT4wsiNaPowkU25P+Ct8sdTqYm00jgiMvoaVDSmouE3FomHuAQy121AgyH8E7SS2YbMwGTIxHtwUqLezr0r4wffDT17i09HSDxdjsh7YLrnSV7j4Fu45YQ2cnf8llJSKsV5SLAVVWrWrit3Ye3ZXHEN/ErzhJN6yUa58EAR+znQac/ZLhcyEMx2ZyaUUC1+Hz1gr6CoSdadJ3RQO8e1lmwza60zCz0QhGRSD9gUewYgW+rLvLH5wyOdHrAQ4tb+4tttUh+TUKA7W4bvHfxHZ6MV0+SRxcLDGXd/6ohmIqHycDSGFAR1A46+tsneCKEZL1JdLnFQ1NpVrIWZf55/cXiShSsipVg+x4ILDqpQIGV0Y9CrkijAa8xOrb6QQz9oS/Hohmwq9jpeEi0hLKE1fAMuk1UnMnNhiYuCpL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(1076003)(6512007)(83380400001)(2616005)(6506007)(55236004)(71200400001)(41300700001)(8676002)(4326008)(5660300002)(8936002)(26005)(7416002)(478600001)(6486002)(2906002)(6916009)(316002)(91956017)(66476007)(66446008)(54906003)(64756008)(76116006)(66946007)(66556008)(86362001)(122000001)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?CPvPHzxVoOOq6y3wA8LNBb+Kj/VUQx3X4aicVAeBC+Y+/wIriMwsz8Xy0P?=
 =?iso-8859-1?Q?3kdl24+1ibjZmifHuw0eV8c1BIIcqsnweBlHUVwJE1CZsn1zWx0t8m9W6/?=
 =?iso-8859-1?Q?IudXcE5l0hV43cvfxN3rm6itbaxbBPuXHXZ242fV+/1wLhUfmj1x+TTfSh?=
 =?iso-8859-1?Q?3nCZT7tjHsSXltSVbXh0UwB9gXxOIACvML3spqksfCQxGIAg44dbZAJ4kO?=
 =?iso-8859-1?Q?F+0EtIPvT2Oo0NZv1iZ+92zAmiAKFwcIADQdMHDVae64wRs7MK4SR/pVgx?=
 =?iso-8859-1?Q?x2k/VX0HUy0w9Q8u/djFYAoAmMJPH5Oc1joKTaDnbSKnslqiB2UWRJFVV4?=
 =?iso-8859-1?Q?r0LlzoAUC2TVMNAAvpqeEP9MmmypfTDU/xuRn0rlPN5Qioo3fdGjliRUCe?=
 =?iso-8859-1?Q?kdWbTqWDZckIfLxhfrYqg5tKbPNfb546KTvzYT1Esv3IboIn617ooDZ2sZ?=
 =?iso-8859-1?Q?WMLkbvspjy3mKvjEJS5vZdT/h6+DFQANlLffdLlTwrei8j0s0tIBQLWZ3B?=
 =?iso-8859-1?Q?LIl3ndSnvjgScRJFf/rSlzwLVyTxiiXKBcTXkzUypSQn7Q38CNyhpjsDbo?=
 =?iso-8859-1?Q?S/Fc4D4esTy1lQmDnB6umJ/0fcCvyN3lEZdlPhl8gefLcQsJvVr+fEvJIz?=
 =?iso-8859-1?Q?wHvoGC5HTcgjgf+Ej80RelmTEP3RXN+7FexI7Vw0in0ZwgaknAt8/Y5k6D?=
 =?iso-8859-1?Q?XVXe+cc1J+q0bqA7HWnZinSdCJ0Vys+X9ecEOOOMMxOsk92s+Yo+GOjKpt?=
 =?iso-8859-1?Q?iKAikwfB5hXXkWhtlPViHIohuPBCVfbLB0Wgwsm62KEKmegTtOjtvJDHiX?=
 =?iso-8859-1?Q?lnotSm0uUuRUi4WT2UFDb2XFv3cA1ZIRH0SSGmPvRoqc7MAjSOQ02oHgcW?=
 =?iso-8859-1?Q?O52NnaxQ95ETpBFLBYI8naP1Ps82/ql/Jcn9mVvITmTgsN5HlP1ECo8nc5?=
 =?iso-8859-1?Q?8t5F5yza4Fi/cAcQZxlrh2aIejq0cJgaSkEGHUMBw4wNmBq+KOgVkuNgNa?=
 =?iso-8859-1?Q?JJUhHC5ZRzs/GSrugkJDtBw+fLOdBpjI+0BGx39ejNFTG02fyg5vwViUzF?=
 =?iso-8859-1?Q?9Z3d/9dj0WC1Joo2b0iWKL2lzJUOGs1Or6RFGlEogdVdMiowOzRKtU+cN7?=
 =?iso-8859-1?Q?gnK9hR1E5Z0CQVppeSJhZdsATa2BfiTypqZMpxVfrKE3H//O9+9I4jaORj?=
 =?iso-8859-1?Q?BizT4xzXxyHPZkuCywxM828WDYU9Ivld8QUw1sWVFnhKUJeSBuyWmgnUCB?=
 =?iso-8859-1?Q?hK4snQAnGaS7HIOV7v2Lo9yZ0dU05J9HgcHCc4TswQjmnvUSZywad9XZ7f?=
 =?iso-8859-1?Q?mOvbJ4RexqJPQxsb0zJpaFm0xaYfcL1HxeBGrQLukeKW1Or0p1F3UzpxqK?=
 =?iso-8859-1?Q?SMStcfj91KPNtRn/xTj3D149qjJc9EUOXLvSqjl/Ji4nymzLJMfwn+oSy4?=
 =?iso-8859-1?Q?+bWVRS/siq6sqUdrRoxD3iayeI+vEiobJF0ke+E/2qbuFjopxNLv8phwMd?=
 =?iso-8859-1?Q?4xJBaaTyGGJdg7Q9uVkWiCVTIUYADNaull7vskyV09rGCSRLB0m3aUewBe?=
 =?iso-8859-1?Q?+SByiucRHu1Cdij4ZmeRUf9K16L5bA+X8J0wrrX6onzrEfw9O1ChIq9OnP?=
 =?iso-8859-1?Q?v4gZTGnGsZu5VtEWlnmxP7+S8hoW180+Gg1ZoTjWHr5sC3Ho27aLOVeg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fa1008-ed93-496a-f94d-08dbed447deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 23:24:22.1479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqFn8c1v7QgxnmQsmu10+gzfcesFpT6DPX0SzaFgzoE2ENmkQiWy6CPH4u8XqXyBfar2p4HQ7lImIiou1gUh/CK0SthqkFQzGK5ew52I+lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8551
X-Proofpoint-GUID: 9fDivZI2WYkH1c0SNc8NmrePuBQxUhPq
X-Proofpoint-ORIG-GUID: 9fDivZI2WYkH1c0SNc8NmrePuBQxUhPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 mlxlogscore=413 adultscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311240182

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

