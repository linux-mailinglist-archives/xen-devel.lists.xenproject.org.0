Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA557F38F9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 23:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638303.994735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5YxA-0006sA-T2; Tue, 21 Nov 2023 22:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638303.994735; Tue, 21 Nov 2023 22:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5YxA-0006q4-P3; Tue, 21 Nov 2023 22:10:44 +0000
Received: by outflank-mailman (input) for mailman id 638303;
 Tue, 21 Nov 2023 22:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqD=HC=epam.com=prvs=5689374ac6=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5Yx9-0005zW-C7
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 22:10:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce2e17ca-88ba-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 23:10:41 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALJcd1B031085; Tue, 21 Nov 2023 22:10:33 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uh0hhgrv3-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 22:10:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8836.eurprd03.prod.outlook.com (2603:10a6:10:40c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 22:10:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 22:10:28 +0000
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
X-Inumbo-ID: ce2e17ca-88ba-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqD8g3kmSLyK4d2zD3OC0nRgxxwpsegsYvelEwZQ8SUbOIeneYQMjNEms5kFvMgPzKHUB6zEo/gIBAZT6y92jXQknT9XgKNKX4ij9+mP4CuwK80BjIIs4hil03QW2ypPHeIhAEfm2ASe217yDnV0uriDxVNHlumzyQDKkMZQ8uxh+VHvdU5qXRxNJYXVhiCehJJ2T5Gd/B1D6+Pg3RAtzih3uiB9B/9DN9+Gri1b+5gfvEi/LFwLgvHr7lKTzLSrzr0qFEr0vu//qIilwN6LJ7GWJGbAmGP3Zb2pKdk7i/Rma+VF1zoLDQgn73dmoZqIekHOu15yieEY18YVP5SaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFvL92IcoplPsyb+IhBJ7P1+li1JaQbeI0VTPaCVCCg=;
 b=T8t1w/V3+5+ZsY/Bg+3y3y0egwy+wQxNLXxRlk9BfFMAIY/IAqHDxad4uksVLOi4G5dnT1bDy7DCHgoohxnNpOnDyMkcAqhRaynd2V6v2oNyexbw6QSG9cqfUpxGOnfKZs8qktnnXrVtTOxuaxQbS+ZEKju2yHqP4YSM0jJhu4V9x5M69YGtpahbTmAklpYj8U0f/fsGsy4ZM0Cxkc5L4jEwvHNaNJAG0WyFw+RD4ikrp/uIiwUGcHC3gLI1j8f7tiXLqAp8LwF3+EZyVSYx8+Hs2zBG8D3wqHf0al1flG/8drDJECDLBzdbdEA20FnUNKUtuTVgeoDemVetJ8Mi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFvL92IcoplPsyb+IhBJ7P1+li1JaQbeI0VTPaCVCCg=;
 b=dvIeoRvoq1fJOUt/D1jJuWqaDym/E7I8E2mrWqU1LhAtMPso3ueno5C8n1/akkVp2JBYHS93q3nAN6pv0Eg2V7Ns/224TteFmDSeIfQLB6NaCbftAR0J9AXMWdABlRqhcdQHQ5Y/+yWbyUjxkgyplN3ysAlN25rqtF/76I1wRgt6TZT50wb+3WLeo6QaxyY0h1iNyOFu6Zzxs5s2HauUgXCICyBdUizdEm5OMq4aOTXKiwI2AZvPLHgRSh0eve5W1YjgsngACn1xHcIbUjwaATLKnZtoV1LnD7BO+2EagwDmO15obJN2xf0SiOkKsryplOFOv6JpSK/rhmaBSA3orw==
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
Subject: [PATCH v2 2/6] xen: backends: touch some XenStore nodes only if
 device...
Thread-Topic: [PATCH v2 2/6] xen: backends: touch some XenStore nodes only if
 device...
Thread-Index: AQHaHMeI7KczK4z02kGE/beB6udNwg==
Date: Tue, 21 Nov 2023 22:10:27 +0000
Message-ID: <20231121221023.419901-3-volodymyr_babchuk@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8836:EE_
x-ms-office365-filtering-correlation-id: 5b371bf4-3d14-4840-959a-08dbeadeab57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MAFD4wOPot0LeQgz+Y+W/txTYvQtn0TdqM2DhHslmzoGnA+wo43LdBitlj2fqiAT50+thIFk4mCdF01pxyFyjX7ugskRFwyTR9k6c+n+E93hAEX4eRB8Gs8tIS+YAruSTz7AAMeb6l7ciILZvdq/6TMI3hMuPt4ppsO7CCqyO3ApyWNlYXsjDNbySk9B+RaiX/xiuzLhmOnT0WMNs2wTXMuF4rgCiajb/d4340YC7LOI4Pfut77nP0QICQW7SlfsBUq8J6tSbHJVWriniayKNmadc0l8nZjfwUd+jO+OW0PmLE2GZhb3toebep8hlC9kD5RojliPJmPjlzozi2VAoiUYxuJdxjBamPC7Sc64n3mPy430seXD8LmTSLRWbxzgj8/stA4dxgeFPaQNIjph1xVihUjDHrME5xlnqB/Vh/O2RYohE8hPmiEparCMgi2R6vSocYFglA8n35uvG7sXSISWNauKKhkXC8QWJO2Efa3m4cvlJjT//9NId5CtHM7c4tj+/Xly19HUw5NLCjpuwOz3yfZp/cb+E9zpld9e3boMesJYZdQbasHPRPRjwA4+py3fHLmXTkLI/NraM1oMC2kXjcTbL8w1jAo7pfRURs1tP7TV2F4jQ6EYPL1Y+uIN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(86362001)(36756003)(7416002)(5660300002)(2906002)(38070700009)(122000001)(6512007)(2616005)(6506007)(55236004)(6486002)(83380400001)(71200400001)(1076003)(478600001)(26005)(38100700002)(91956017)(66556008)(66446008)(316002)(66946007)(6916009)(64756008)(54906003)(4326008)(8676002)(66476007)(76116006)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?KWXIHuKvpmWQ2ZwtAt+v98nc4nReKWzxwVyg3uxPxddiID0KIy0etDTToV?=
 =?iso-8859-1?Q?p41Dv9wTHhFLX7bfJg+VQ56rvq+JgXmyXS7gn4cFtA6CXIwi/VeOAL/zSK?=
 =?iso-8859-1?Q?q8g+KOSY5Q9Bai0JgXX5l9K8+8vzPSk86l/klX6aSumnRl+QUjkQwkaTqJ?=
 =?iso-8859-1?Q?MSFV22QQdBvn4CRq+QCD2mQFd6O028TuOk0KpLq3mLhKmbL4HBUkA9JcrD?=
 =?iso-8859-1?Q?0ZcMJlQdZ708cibLPHEhWIq6jQk9nyDD90W4Rb/cmiC6sH9/dJq2190cLY?=
 =?iso-8859-1?Q?kGzjT401MaeZuHM/5aqmFlJMfemAvlSeTW828OlGwDvR7bfjq2wrtRR+5D?=
 =?iso-8859-1?Q?4xR/Cta33E6jLCVjJoLY+XYlgzw9+rIZjCMzVXXUxl97rE8eJnX8Jm6kVP?=
 =?iso-8859-1?Q?HmXLPhKPN7CEzgyWj6+N3PdWYiMwERfmnixJXAo9b35210BdMz4luFDYCQ?=
 =?iso-8859-1?Q?j0aC8wiyHEcoGkuY6vEaI6zu7mdvnkmntd86Dn8Kp4n3nQL+/aK58rEA6Z?=
 =?iso-8859-1?Q?YNGDKfDeO2/9zokQ+gkWdkYmZ3kiVsje/n1+Zx0rFyXK3HW7MYos91otKf?=
 =?iso-8859-1?Q?E/EuvKdLdzGsIsXdS9PLwn28n5Ki2Vy+K5NGofFMON0tk6uHYiVeGAhuG5?=
 =?iso-8859-1?Q?992gi4qcr+kpWQhAUmTJ08Tyz6SX1pa5rAYAWcdLVwV9KulnOag1p4rGn/?=
 =?iso-8859-1?Q?jInGabQWMlWyTcWHyUjPRINSdyYfVSVDYTcIEdAUYQNdkLaTPu3a5uSEDn?=
 =?iso-8859-1?Q?YZuS1aiu628FyCMH6ET5kJLUDY8K5dAH9kGGFFMadDUEe4WHniYlc7ouUW?=
 =?iso-8859-1?Q?0N24J3+yGfwv646UK6t1uDy4A1H+CpZZeOEWK68DPzDU3njZxKD7OFEG/f?=
 =?iso-8859-1?Q?kiPPKggVkG2IFVih63b71duNXsZ1DF52uR7gC1XOu891uCZVAIWnPgXL4r?=
 =?iso-8859-1?Q?NpWg936m9ekoBl3Z/riYPWwR0flBeoA7OPBt+Hd8ZJUghbK8Y1rcUIuPse?=
 =?iso-8859-1?Q?NCW1GIvsm4bi69uFlr40LMDoxa7UdwJaygFSCZHKOsq7Vv06k6zA2utO++?=
 =?iso-8859-1?Q?pKtgusjuweo3E1WOnehSSK+E7xozjPJxTlzWsso3ExcIp1eMuLD/FppJPv?=
 =?iso-8859-1?Q?K1GyfDMf8wpTmto59oSJg09hhai3GRGLKYKDdRnKXqJEfODHcGXUxJ25jj?=
 =?iso-8859-1?Q?wmDHE0lchAg/fIrUMjqpS+jF7vrF+o2ArELMWCZb5drk3eChJDs8orTIOe?=
 =?iso-8859-1?Q?g/iXW7bKiF9cfL3IAYvKg7kV/55UEBp/5huGDaWKYcBVCzNCGAgo+r/0vM?=
 =?iso-8859-1?Q?5AMpCZuq+5Qh1IHL8lJsRJUcgMiAmqPkzjzUu0LTxG76Xw6n5T05V5Blyw?=
 =?iso-8859-1?Q?ks2ph7VY11Bw0hBHwlkynW6eAV0oZPEguUVwAfgxw3XQKL5q3zRCkEhoSm?=
 =?iso-8859-1?Q?PPv/3up5O1XvUXLkmtlqsGTO9EXURkTM4TtEw7rgh1cF3vgO02AmJDngD4?=
 =?iso-8859-1?Q?5HA3lN+B98zSgSqUEQ3Q7E86d4dToZWICLQSaVZGQ3BzqULbLSR08x5lJm?=
 =?iso-8859-1?Q?9rd44Gm/c5sLyfrkCQyvEZKguOXulKkP0Y+/emGgaE9WmqrzNRrC5+30jU?=
 =?iso-8859-1?Q?EuoM/MA2E6gXij5aJPWEEWgIupn/IxGGLxSamFQZfoAQ+7HnQnihdBNA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b371bf4-3d14-4840-959a-08dbeadeab57
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 22:10:27.4220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ISod+EsVypTm/werNxj3/BT+ZxuKzwUDvtZGaeivXT3Ee7NHpGOY7GhmMLV/uzc9qsErugmMSdlakrxTDwCsaljqpV+lv8NI2sCpT8zCp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8836
X-Proofpoint-GUID: tFZ2s2ZHAOtMNhJXcFHDga0jlcMu7mQa
X-Proofpoint-ORIG-GUID: tFZ2s2ZHAOtMNhJXcFHDga0jlcMu7mQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_12,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210173

was created by QEMU

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
device is acting as a backend (i.e. it was configured by Xen
toolstack) to decide if it should touch frontend entries in XenStore.
Also, when we need to remove XenStore entries during device teardown
only if they weren't created by Xen toolstack. If they were created by
toolstack, then it is toolstack's job to do proper clean-up.

Suggested-by: Paul Durrant <xadimgnik@gmail.com>
Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Co-Authored-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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

