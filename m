Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5A7F869F
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 00:25:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640985.999814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6fXZ-0002MT-1F; Fri, 24 Nov 2023 23:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640985.999814; Fri, 24 Nov 2023 23:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6fXY-0002JP-SX; Fri, 24 Nov 2023 23:24:52 +0000
Received: by outflank-mailman (input) for mailman id 640985;
 Fri, 24 Nov 2023 23:24:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+4=HF=epam.com=prvs=569229df20=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r6fXX-0002IJ-8Q
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 23:24:51 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8bd7e5d-8b20-11ee-9b0e-b553b5be7939;
 Sat, 25 Nov 2023 00:24:48 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AOMwAPM014042; Fri, 24 Nov 2023 23:24:30 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uk2wmr6b0-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Nov 2023 23:24:30 +0000
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
X-Inumbo-ID: a8bd7e5d-8b20-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXrjT/OSbqCjCpOs+hua40bK0JiB+R5QMjusa1WIU7HUUjmQDPLh0jyQ1jAY64p8WxHtRciXlA0aKAR2MQmtXg7k2//V+f/d3WrOy+KxOY8tyAYoHPNyBRTFMY3JxtP5Hb7ONFiyEOUepuv6ew2W5e/OPL+apKVUYXw5oU6KPh78A3JVgHKc1es0wj6os+5Y9HM65cW9vD8N2FayfCK77KBag4678+qfJoeQ2WMBIe9PN8+3kZwDVA2Ii5lj0DHcir5uxTClOrYKHYkSL21SGp2VN+MbvQafErec+N7HxKluByhg5v4EE/t8tkHewcJhmeccAZtvUn6tFy3KEl3mJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6piVTLnT/ePWflf79oGCnWyoOwmQ+YDU+WgRfEz16g=;
 b=Equg6HOhNI7IS3F1ZmTcXV5CbT94DgymC+zi3P8mlBD9dGp9akTnJ0uGPTTAqnXW9IwGoxrSwPYrjN9gHpQJhN9DtbPEOqz3uB3FMVV7cCw21E0MSUnc9wR3sVaWCQAzFH+s6SsCA9cyPJL9e/ZQsOWCYVHvfWUlBGq5jz6Y1KScuhlVQdmMdtrYDQLCZ9Vqj0q9xSfa641PUPZh3TduIRnlPC1uPdtjFfj7Xz6AsEDA7BdhFbBMuqrqbyYRL6Nocj0nMe5Kg7iltfQjpcS3ouwgfGf+uK/4u2Q2+PwjfDCjfwqMMxTqdu7ztWesfoqUbaJfWrvoh2ylO/2BHZRuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6piVTLnT/ePWflf79oGCnWyoOwmQ+YDU+WgRfEz16g=;
 b=FJOtKXMsJT+sDYZgZLPCgVA40qKATrAf7BkHyT5zbOLrPKqXPgWzaYAhJtSDduMhb5Q6rfhZG7x4EGD0kamHH5CpxYFJRqNbQBCK7qS6MI6b0LQFzC/SYZssicAjjM2kzcQPUm2wmGPmn/gihdkmX/gCDoz28ZVRox8+8ljxcYXZpq52xCm5nC314xk3KQXuUFHcvGPq0Up9PtGHW3rZIBqgdCtokMjRbbZ+ZxTufisa3WeX4paD2ZHCJfPZkoHtUJ+mbffJVn3twck+f0/2XsJ0HQW8A+WSGL7DFxUKxgPMQMEvDwu6Slzt8NwzEdUiJHKKeDqswuQNdTRheh6Wtg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Greg Kurz <groug@kaod.org>,
        Christian
 Schoenebeck <qemu_oss@crudebyte.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Paolo Bonzini
	<pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Eduardo Habkost <eduardo@habkost.net>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
        =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
        Thomas Huth
	<thuth@redhat.com>,
        =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
	<philmd@linaro.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [RFC PATCH v3 3/5] xen: add option to disable legacy backends
Thread-Topic: [RFC PATCH v3 3/5] xen: add option to disable legacy backends
Thread-Index: AQHaHy1b1vaaoDkYtEa69hkezixH/A==
Date: Fri, 24 Nov 2023 23:24:22 +0000
Message-ID: <20231124232400.943580-4-volodymyr_babchuk@epam.com>
References: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8551:EE_
x-ms-office365-filtering-correlation-id: a26c1ac4-9949-4445-914b-08dbed447e65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BS9SMTgN7qWvPu4x/QLjqGjpfS0uZc1mAeFoJPD7arR0WqyJkyDSJrNE74udiMp5HYr5Sz/gt+aHmNHnaAfICV6ieso20mTIiHZ4ciiacccZV5S9Hp9rKgSmINtpSUsARY/bQMv9GyT51Czn7dpl4PR3QTAYZ4xWOofCrHRAvgdw3Jy2+u4q0jLQQ+uz33q0PBRzRD51sRs/sKFDKjHlG9NzRe+UkAfaLHVvBOpsfJvlwYTI0KWOKNiZJ6iSiYzJsWrMT3VEUwuaICv97n4otId+p+x4+VoPAtl5Qyo/MFi41ZvBgxDIoWRA+zpJCP63/Gggu4NUZ2Uk6Hmjc1/cQPiEn91POJ6YMDRStIAnfKy5o+GlKMZunEPu0KGSq9cYpbl0PDuUlVKn6mRgw5koq62PEz3KDPtzHegJst4h5heOqyrNqBQ/OXD0RL7HgqjmJrBvOd7vPK7FcCuO7Mx6xMmBsX+J6R+K13rGmbHoaeb45KLlApJskhDLhnPppZVa45potgH6YIELa9Z3GnQ3nVJtc7dTrTvo5WKwMaPzZofJumTP696KMyR4rOqjgQ2Jwe+lLrHxkiWMycKwSxp3r7Uog8YCC2Y3KkOJsjmIhCdWnOXJGbTqAzOLe7hAKnkvOj6HJ0s44lqOldlHI6wS3w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(1076003)(6512007)(83380400001)(2616005)(6506007)(55236004)(71200400001)(41300700001)(8676002)(4326008)(5660300002)(8936002)(26005)(7416002)(478600001)(966005)(6486002)(2906002)(6916009)(316002)(91956017)(66476007)(66446008)(54906003)(64756008)(76116006)(66946007)(66556008)(86362001)(122000001)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?w+NFI1LLHpWcCY/2EDoaqaSIeAiQLjXogpLtFnvqsBIpDAIhiLXyHwA2Jk?=
 =?iso-8859-1?Q?5+kQOBOdViWuWv/TsfH2fB5g2Rz4mfkyV4mzU8dubGfD9R4NCl4X97Yz0e?=
 =?iso-8859-1?Q?hs/g01w6GUlJ1UBmDRvR+tGFnCtL0bfeJflB4h/gVaeDq8nHhbm+1rdOPl?=
 =?iso-8859-1?Q?w+LB7RtApnMxTVKCnhinOCZak3eErKzMhy5V0ySxMOhfEmxpkbffrk0399?=
 =?iso-8859-1?Q?VDUAXMwJSpdyiSeG32U4tEu138U1mixoTqUk3KJcFD/XzgVcd55dt62MnO?=
 =?iso-8859-1?Q?ZBBuovWU8gXfGF2/MPFe/bnrJxcVBN+/GdVN1JYaj7xX8Oln7rmgcqvu+B?=
 =?iso-8859-1?Q?SR3tyOivr9qXSGESEZSdrDKJhuSW895MuLZdTC2lj7XWfMB8h81DdD2bBY?=
 =?iso-8859-1?Q?ijnaiNnRzrRtPQEKiS3widQ8coPtcJCIUOUxVhCNXVo6chB6YPQyiSr4/v?=
 =?iso-8859-1?Q?ivJkqiDliYtBjk+HcPIJIPeJs4jyTMiviD3CyVsishcqsPF9CdDA7Jm0TW?=
 =?iso-8859-1?Q?ZG2oHnw2ZGw0i+TXdwI7Tp0hpuH5kTxKwFmDdInM1xq7jNrwRIc+Yv5vch?=
 =?iso-8859-1?Q?kDtskKdY+IdHCzUrJPdZNdrKXGPSigcr5h2A7HBEaUiJk4aMIS6NYRbr84?=
 =?iso-8859-1?Q?c/Iq6du/bRQJts53HuzQBYqApL0X2kRVMZkY00fY4hzltZUV5UD0lUOrnT?=
 =?iso-8859-1?Q?Kbl/xIUv6nKhIZrKiSLGfkiovqzczW6P+R6v+SJRjw1k5hzK1/SB8ZrwqQ?=
 =?iso-8859-1?Q?HcFyj/hx5zg40Sp2Lhq0is3cSr80WNi8P82mrS4VJcJenMmUq6LQO/pr7J?=
 =?iso-8859-1?Q?oZA7I11zF8v0YTaQ13McShUZLhrpZLtfTgdoTXUX1Mo9b17dUA/gOMGD3H?=
 =?iso-8859-1?Q?rIO41saRbExsH6rtYvHhsbyXu5Pnhg4nOPMHyW97cCnRtQD7URCdxpnIha?=
 =?iso-8859-1?Q?IYno0GjWV4obAn1SUrr0sRijn2VOuUL8eLDzvNTCbL+s7Oj6itugXnZnxI?=
 =?iso-8859-1?Q?jlazoHdaK+lKYLdykpgCd8GTKiN7qJrzKjsBRxrEPY1mmxXwVHh5CfN9Ao?=
 =?iso-8859-1?Q?mx+QRjEv9DFUseX3drXXASt0Syy6sBE38DCGrNDvdbJlB1axW8O0cV1I5h?=
 =?iso-8859-1?Q?wWX5xZb6JA1UOZs9TT12ctw/rvdA6hXzRIpyVEoy8yQxXj4JWZWD3DL73B?=
 =?iso-8859-1?Q?uafximKjLUf5xf2uXK70TPH7/m+LMGz/FBCE/ubEpZ/bWfLprxeR4FUTFD?=
 =?iso-8859-1?Q?hLkgN8H77C4+z64qTaU1JWKHuUmBZkVDWtCNMC0iTcUwwVJuBRCN2a8nmq?=
 =?iso-8859-1?Q?Om3wgzvCVmmnHzZaS4t4Qgo4O1ncPiMLolX+aLL0KGRqb+HnsrNRB4CxWW?=
 =?iso-8859-1?Q?HxJ8C952hbht3UW4IxRaI0v3LG4xa95jFORlB3xyU5B/zU3MUs/17P7HQt?=
 =?iso-8859-1?Q?r9SiGQTH+Wp2Lg6cHaALZ8rq404vzwM1jWCVRy5inOwJhlzvGb8Xm7zxLJ?=
 =?iso-8859-1?Q?N/XiUJHY7UeAu6qXU64WSCUWQQlnTw4N8ZZiJxC60fhBQkt+Kv6IlF3T9A?=
 =?iso-8859-1?Q?dwNGx8AVL1ODbjelz9QcqduXWyeil6ivo4frNtyenX4VEYAx/Jc/kqI5Wd?=
 =?iso-8859-1?Q?I3MAiAXkCVdXwqAoAw7z09f8BJZKsEsX8x2r1mdoIWtAhGH/iw2t4FDA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26c1ac4-9949-4445-914b-08dbed447e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 23:24:22.9990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bp4r+fFxW0tQiM20XqIGK26wOvHcgYGA99OqOszjpaMRhpXUd1bSRvrtgJHdAZAe3IWDhFDu72EVPwFmLwOSKOToWVuKL/ZehwBqYuh0NrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8551
X-Proofpoint-GUID: 7SIitNEDAyqQ4I0uP2sdQqI9RpRxPv6u
X-Proofpoint-ORIG-GUID: 7SIitNEDAyqQ4I0uP2sdQqI9RpRxPv6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311240182

This patch makes legacy backends optional. As was discussed at [1]
this is a solution to a problem when we can't run QEMU as a device
model in a non-privileged domain. This is because legacy backends
assume that they are always running in domain with ID =3D 0. Actually,
this may prevent running QEMU in a privileged domain with ID not equal
to zero.

To be able to disable legacy backends we need to alter couple of
source files that unintentionally depend on them. For example
xen-all.c used xen_pv_printf to report errors, while not providing any
additional like xendev pointer. Also, we need to move xenstore
structure from xen-legacy-backend.c, because it is apparently used in
xen-all.c.

With this patch it is possible to provide
"--disable-xen-legacy-backends" configure option to get QEMU binary
that can run in a driver domain. With price of not be able to use
legacy backends of course.

[1]
https://lists.gnu.org/archive/html/qemu-devel/2023-11/msg05022.html

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

I am not sure if I made correct changes to the build system, thus this
patch is tagged as RFC.

Changes in v3:
 - New patch in v3
---
 accel/xen/xen-all.c           | 13 ++++++++++---
 hw/9pfs/meson.build           |  4 +++-
 hw/display/meson.build        |  4 +++-
 hw/i386/pc.c                  |  2 ++
 hw/usb/meson.build            |  5 ++++-
 hw/xen/meson.build            | 11 ++++++++---
 hw/xen/xen-hvm-common.c       |  2 ++
 hw/xen/xen-legacy-backend.c   |  7 -------
 hw/xenpv/xen_machine_pv.c     |  2 ++
 meson.build                   |  5 +++++
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  4 ++++
 12 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 5ff0cb8bd9..188b29597f 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -29,6 +29,7 @@ bool xen_allowed;
 xc_interface *xen_xc;
 xenforeignmemory_handle *xen_fmem;
 xendevicemodel_handle *xen_dmod;
+struct qemu_xs_handle *xenstore;
=20
 static void xenstore_record_dm_state(const char *state)
 {
@@ -78,20 +79,26 @@ static int xen_init(MachineState *ms)
 {
     MachineClass *mc =3D MACHINE_GET_CLASS(ms);
=20
+    xenstore =3D qemu_xen_xs_open();
+    if (!xenstore) {
+        error_report("can't connect to xenstored\n");
+        exit(1);
+    }
+
     xen_xc =3D xc_interface_open(0, 0, 0);
     if (xen_xc =3D=3D NULL) {
-        xen_pv_printf(NULL, 0, "can't open xen interface\n");
+        error_report("can't open xen interface\n");
         return -1;
     }
     xen_fmem =3D xenforeignmemory_open(0, 0);
     if (xen_fmem =3D=3D NULL) {
-        xen_pv_printf(NULL, 0, "can't open xen fmem interface\n");
+        error_report("can't open xen fmem interface\n");
         xc_interface_close(xen_xc);
         return -1;
     }
     xen_dmod =3D xendevicemodel_open(0, 0);
     if (xen_dmod =3D=3D NULL) {
-        xen_pv_printf(NULL, 0, "can't open xen devicemodel interface\n");
+        error_report("can't open xen devicemodel interface\n");
         xenforeignmemory_close(xen_fmem);
         xc_interface_close(xen_xc);
         return -1;
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 2944ea63c3..e8306ba8d2 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -15,7 +15,9 @@ fs_ss.add(files(
 ))
 fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
-fs_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-9p-backend.c'))
+if have_xen_legacy_backends
+  fs_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-9p-backend.c'))
+endif
 system_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
=20
 specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device=
.c'))
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 344dfe3d8c..18d657f6b3 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -14,7 +14,9 @@ system_ss.add(when: 'CONFIG_PL110', if_true: files('pl110=
.c'))
 system_ss.add(when: 'CONFIG_SII9022', if_true: files('sii9022.c'))
 system_ss.add(when: 'CONFIG_SSD0303', if_true: files('ssd0303.c'))
 system_ss.add(when: 'CONFIG_SSD0323', if_true: files('ssd0323.c'))
-system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
+if have_xen_legacy_backends
+  system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
+endif
=20
 system_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
 system_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 29b9964733..91857af428 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1263,7 +1263,9 @@ void pc_basic_device_init(struct PCMachineState *pcms=
,
             pci_create_simple(pcms->bus, -1, "xen-platform");
         }
         pcms->xenbus =3D xen_bus_init();
+#ifdef CONFIG_XEN_LEGACY_BACKENDS
         xen_be_init();
+#endif
     }
 #endif
=20
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index e94149ebde..8d395745b2 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -84,6 +84,9 @@ if libusb.found()
   hw_usb_modules +=3D {'host': usbhost_ss}
 endif
=20
-system_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN_BUS', libusb], if_true: fil=
es('xen-usb.c'))
+if have_xen_legacy_backends
+  system_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN_BUS', libusb],
+                if_true: files('xen-usb.c'))
+endif
=20
 modules +=3D { 'hw-usb': hw_usb_modules }
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index d887fa9ba4..964c3364f2 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -2,11 +2,16 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
   'xen-backend.c',
   'xen-bus-helper.c',
   'xen-bus.c',
-  'xen-legacy-backend.c',
-  'xen_devconfig.c',
-  'xen_pvdev.c',
 ))
=20
+if have_xen_legacy_backends
+  system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
+    'xen_pvdev.c',
+    'xen-legacy-backend.c',
+    'xen_devconfig.c',
+  ))
+endif
+
 system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-operations.c',
 ))
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 565dc39c8f..2e7897dbd2 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -869,7 +869,9 @@ void xen_register_ioreq(XenIOState *state, unsigned int=
 max_cpus,
=20
     xen_bus_init();
=20
+#ifdef CONFIG_XEN_LEGACY_BACKENDS
     xen_be_init();
+#endif
=20
     return;
=20
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 124dd5f3d6..717d5efc06 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -39,7 +39,6 @@ BusState *xen_sysbus;
 /* ------------------------------------------------------------- */
=20
 /* public */
-struct qemu_xs_handle *xenstore;
 const char *xen_protocol;
=20
 /* private */
@@ -605,12 +604,6 @@ static void xen_set_dynamic_sysbus(void)
=20
 void xen_be_init(void)
 {
-    xenstore =3D qemu_xen_xs_open();
-    if (!xenstore) {
-        xen_pv_printf(NULL, 0, "can't connect to xenstored\n");
-        exit(1);
-    }
-
     if (xen_evtchn_ops =3D=3D NULL || xen_gnttab_ops =3D=3D NULL) {
         xen_pv_printf(NULL, 0, "Xen operations not set up\n");
         exit(1);
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 9f9f137f99..03a55f345c 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -37,7 +37,9 @@ static void xen_init_pv(MachineState *machine)
     setup_xen_backend_ops();
=20
     /* Initialize backend core & drivers */
+#ifdef CONFIG_XEN_LEGACY_BACKENDS
     xen_be_init();
+#endif
=20
     switch (xen_mode) {
     case XEN_ATTACH:
diff --git a/meson.build b/meson.build
index ec01f8b138..c8a43dd97d 100644
--- a/meson.build
+++ b/meson.build
@@ -1749,6 +1749,9 @@ have_xen_pci_passthrough =3D get_option('xen_pci_pass=
through') \
            error_message: 'Xen PCI passthrough not available on this platf=
orm') \
   .allowed()
=20
+have_xen_legacy_backends =3D get_option('xen-legacy-backends').require(xen=
.found(),
+           error_message: 'Xen legacy backends requested but Xen not enabl=
ed').allowed()
+
=20
 cacard =3D not_found
 if not get_option('smartcard').auto() or have_system
@@ -2219,6 +2222,7 @@ config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_disp=
lay)
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('CONFIG_SELINUX', selinux.found())
 config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
+config_host_data.set('CONFIG_XEN_LEGACY_BACKENDS', have_xen_legacy_backend=
s)
 config_host_data.set('CONFIG_LIBDW', libdw.found())
 if xen.found()
   # protect from xen.version() having less than three components
@@ -3049,6 +3053,7 @@ config_all +=3D config_targetos
 config_all +=3D config_all_disas
 config_all +=3D {
   'CONFIG_XEN': xen.found(),
+  'CONFIG_XEN_LEGACY_BACKENDS': have_xen_legacy_backends,
   'CONFIG_SYSTEM_ONLY': have_system,
   'CONFIG_USER_ONLY': have_user,
   'CONFIG_ALL': true,
diff --git a/meson_options.txt b/meson_options.txt
index c9baeda639..91dd677257 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -77,6 +77,8 @@ option('nvmm', type: 'feature', value: 'auto',
        description: 'NVMM acceleration support')
 option('xen', type: 'feature', value: 'auto',
        description: 'Xen backend support')
+option('xen-legacy-backends', type: 'feature', value: 'auto',
+       description: 'Xen legacy backends (9pfs, fb, qusb) support')
 option('xen_pci_passthrough', type: 'feature', value: 'auto',
        description: 'Xen PCI passthrough support')
 option('tcg', type: 'feature', value: 'enabled',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 680fa3f581..b5acef008f 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -218,6 +218,8 @@ meson_options_help() {
   printf "%s\n" '  werror          Treat warnings as errors'
   printf "%s\n" '  whpx            WHPX acceleration support'
   printf "%s\n" '  xen             Xen backend support'
+  printf "%s\n" '  xen-legacy-backends'
+  printf "%s\n" '                  Xen legacy backends (9pfs, fb, qusb) su=
pport'
   printf "%s\n" '  xen-pci-passthrough'
   printf "%s\n" '                  Xen PCI passthrough support'
   printf "%s\n" '  xkbcommon       xkbcommon support'
@@ -556,6 +558,8 @@ _meson_option_parse() {
     --disable-whpx) printf "%s" -Dwhpx=3Ddisabled ;;
     --enable-xen) printf "%s" -Dxen=3Denabled ;;
     --disable-xen) printf "%s" -Dxen=3Ddisabled ;;
+    --enable-xen-legacy-backends) printf "%s" -Dxen-legacy-backends=3Denab=
led ;;
+    --disable-xen-legacy-backends) printf "%s" -Dxen-legacy-backends=3Ddis=
abled ;;
     --enable-xen-pci-passthrough) printf "%s" -Dxen_pci_passthrough=3Denab=
led ;;
     --disable-xen-pci-passthrough) printf "%s" -Dxen_pci_passthrough=3Ddis=
abled ;;
     --enable-xkbcommon) printf "%s" -Dxkbcommon=3Denabled ;;
--=20
2.42.0

