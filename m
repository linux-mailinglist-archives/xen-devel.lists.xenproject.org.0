Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61279801998
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645880.1008456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0w-0008Pu-Eg; Sat, 02 Dec 2023 01:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645880.1008456; Sat, 02 Dec 2023 01:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0w-0008MD-9z; Sat, 02 Dec 2023 01:41:50 +0000
Received: by outflank-mailman (input) for mailman id 645880;
 Sat, 02 Dec 2023 01:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9F0u-00072l-4D
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:41:48 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f42cf6f0-90b3-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:41:47 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3B21X1Qp015641;
 Sat, 2 Dec 2023 01:41:28 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqa3aucrx-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:41:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7285.eurprd03.prod.outlook.com (2603:10a6:20b:2ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:41:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:41:22 +0000
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
X-Inumbo-ID: f42cf6f0-90b3-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evgsby7gz/Ac8GwTIfqoRFTRzPmH0hKPD7MXGciMQApj+h6bzr+qiBXDrqvdOeHSOTiAOCf2dDrxrwVXvoQH2IwR9hYCNEtrMDpbhs+TPIl9H8bPeGpytNIkv+Fm9myvomwhMI4W3O2Z35Po3s5jzalZqSjsgNFrvDLuBhNhLc2MFXD9daFmSvZ9OV4QLAl0AwZ9WJ4zE49kMCvnxG6f+qPb21O8K0pXLZW1pRnVBaCZW2ULZGqycTE77OZBnEoW+2cV6iKY4eD85YYh9eCBlbpnVTyzKRTttn/21GDgqQ4roTIW2cwVV1lVoDSyYUnJX1aVprKUchrIzYA6Wj4PoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd2GMMSSgW+cobh8ZFxigRxf9cE6MrLzy6vrJfU+U7k=;
 b=H8nppiCDopCEb4w4RFLyg5fnqD7n2zxU61EBUWHbI7dOQh95DbaHny/Xn1hZZNUwFC0mYifREFd4Iw5RFHXhyUVHFHxJ44akhw/vcxBpPynz5yrZSqdfpxXlaVdnDUxwqkuhrRabjGIOgGpfEJpEBBCnhI3qhOf+i55FriY0wLlvogGnlKshgNzpr3hExRwz+G0s0iEop5NBxNSOM5wY5fZMnV+KAc2QJ7x+Qr4lrJYK7AIhIMHXF6DDuqY+Vh7cH3Ix/+iuKp0UelppDyWDOGJYuhF0t6KYH06xbG5YCVL77dyJsp/OkLmEtdDDaV8hJXK7P0iRBeETrtmadSi+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd2GMMSSgW+cobh8ZFxigRxf9cE6MrLzy6vrJfU+U7k=;
 b=fhiCsy4UcIdXcJzerKHyeBvLKrFvEnwvUEo38J+B4dtHk+/M0ljwut9yWBYxVk6Jx5thkuLPhrNCj+uVumXUltzf0wyiv2bDAAmONj/xUVfLA6SHIohdh4Jo3ojqh6vgEXP4EYfes49mYNtWDb2oMDOhZ+K8q5gSL3yXyovbKPaAX7kgGrwth4C5Zre7fUmYyeiL4+rYcVXyW5VLE79psW3zhB0NlqOkdqYYCRFRTdXLvJkPCJ5RiU6qBvy6f5FuBL/adjNxjD9R0dublAjDDtZmL3TSHf7wmss6mU7w1wmgVbgPeotG+WbWQeDQpsIkBvI289drc5/Fh2CtdRPAbA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Greg Kurz <groug@kaod.org>,
        Christian
 Schoenebeck <qemu_oss@crudebyte.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Eduardo Habkost
	<eduardo@habkost.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
        =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
        Thomas Huth
	<thuth@redhat.com>,
        =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
	<philmd@linaro.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [RFC PATCH v4 4/6] xen: add option to disable legacy backends
Thread-Topic: [RFC PATCH v4 4/6] xen: add option to disable legacy backends
Thread-Index: AQHaJMCn9jPeta/9M0OenQld9P6brA==
Date: Sat, 2 Dec 2023 01:41:22 +0000
Message-ID: <20231202014108.2017803-5-volodymyr_babchuk@epam.com>
References: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7285:EE_
x-ms-office365-filtering-correlation-id: 5480e286-e83e-4782-b3d8-08dbf2d7ca52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CerkD+0MuaBOyAz3p6g74xYtIv9wM49imDVSzEdH3vDYnA3TKQ/rNAsW0LPMKG2ffUlv06Q57NdqD3EpzEKMz8vy3FIRgSoDx+DhZMgyFyoBG6TW6H0nM7cTgy62y6VMkZJ9ZajZcnR9PxjPt8PAz5jMfFSb405akum1WdBgRwO/YQIB9I4Op/hoxpX2y6JeoVlnOT3/yAQ20IfICBWtxzrBuVyHzXj40KVqrll+/M5y+dF44MJPbwoK6uL9SH3DMfSTearFMsNZK+cU1xxZApcKmJhn8fr12Of3W3ymCod57+SqXYdV+5yy9IIgk3onppc1a2VuUOa0NyCgPKHm/HqY7iD+ujZEMihs6ULLDYjjJUlanHg3feVXsHFFbvB9URV5LpF1k6C8wdYwET+c7vxVL6EUWuFpFsbPdDQDHaZBmN5zAO8mYfAYCFfxmWV2/YC3BH3+x/jOy+G0KcvnNI1me00rPnUj7yRGROwETs6zWApkW4d0xoxPkMaLZkj6bH2EMo+J65TN2YbQKyDw+pObl2U2wSh51xdBDYdwf1VqF6/VjKo/ZyECydhc5AQtw3bL0C174OpevwPOjB5QoWTbTnGrz2/4XsB4OBx3tHz7q84SohuyZcBZuUZg9m3lME+XxSEEs5Jf+l3O1d4e1Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(38070700009)(41300700001)(2906002)(7416002)(5660300002)(83380400001)(71200400001)(55236004)(38100700002)(6506007)(6512007)(1076003)(2616005)(26005)(66556008)(478600001)(91956017)(966005)(6486002)(36756003)(76116006)(66946007)(64756008)(66446008)(8936002)(6916009)(54906003)(86362001)(66476007)(4326008)(316002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VDaAzlQx3V58HmlzhgqPi4loXNjVAuABbd53jLxEG/sNIsj1WGzNiNpctK?=
 =?iso-8859-1?Q?FL4qcwfYU4+IhSAJIoibLF/26qGFCTR6P0y42LaVa+xFOTHVMqnHoEljHY?=
 =?iso-8859-1?Q?rSbjUGyHnuii5/9CSYRNybCv2OZvXAwIy7LQ0+BY3l/zK5ynrZ1ZMVPyw2?=
 =?iso-8859-1?Q?EwqBxFymhHzeyl73w11KcSTM4wWa8nlbn63FJt594XHO5bhlaz/AZUIB8u?=
 =?iso-8859-1?Q?cECmvxGZUmUkE/2fBnn1O1VMbl/l/VxXQtyzKqvNtudp4TW5BYwB7ZHPli?=
 =?iso-8859-1?Q?/hd3BtrdgAI/hsPNEBQQfSBqDmYyeLTRxHRguGQyesEUeOBoVQYISsdSkD?=
 =?iso-8859-1?Q?qlzuR32seLeic430mKHMbfu2J3DSkZyrPNt/2LnOmKSwSCYF2OtQpNtqxx?=
 =?iso-8859-1?Q?DsE5suCT/6HyQ96r4wLu4K45XuY56fK6lHPZTkQnFZdxioBojyqpN3pZGH?=
 =?iso-8859-1?Q?JfAzs6HFYBGhBGpNGt1qQ3R6ywKoekdZaZD5MOJpnMyE1cnDGyHhVEwzNs?=
 =?iso-8859-1?Q?wnDc0i5dRf9UAmhgbpPVxZ/kZjLx0Nl3E6JdtmLiQ2Zu38+AAgKKd19LVC?=
 =?iso-8859-1?Q?WjkLyHoEr2FA5iu6YJEHy577zVd8k2WPPlVPRhXpKWO4LOHNPh03fV9qCC?=
 =?iso-8859-1?Q?97tQexVsPoaRADIiXwIAMxNtbpKVbkNPCk1RHbbhFQqtCpi1fiKGuJaBFX?=
 =?iso-8859-1?Q?ovPBoQcu0/3uTY+giBx7oXKn5Q83yGPUooNUng7Jpa780DspH1nsfuPoA7?=
 =?iso-8859-1?Q?YkaMDtZx5QFslBoKPu+w5FxIgZqQBcCjVWW9LFSAq8ftEESM9xjRy+ehJs?=
 =?iso-8859-1?Q?mVVZCnrP5apO8SQNqIYONFXL0mf9r72aU+jyRxWp3aDhU+Jiyekp3HVEzN?=
 =?iso-8859-1?Q?RD2NGz/S5iHUjpRAIVdPEaQzEf8ACQ0CjfW+JkCArc0gUiEIpLlsu04S69?=
 =?iso-8859-1?Q?kr1xYdeUrlS25qTrI6GbSg+fWORhg77+Ec3b9xyMrkcBqPOgR0UPGdnF60?=
 =?iso-8859-1?Q?pZXvosrul2U1G0/woR5Mvw6PaXeHziDD7xtcKMblvCkDPyEFRXS1TuyTo6?=
 =?iso-8859-1?Q?HJGpcgUslb1mFGviemRbzgPUI/JiCgktF1DNqEoUUqLGNTLD2rXJ/FNuzJ?=
 =?iso-8859-1?Q?QGcouD1Tho6q/u2B2UuoIHlugSCbOSLoSqtIJ2OXSauxMoeK3gmD9aQbz6?=
 =?iso-8859-1?Q?uQiXLN+HBCn1BHhfHoKMuLtuEnf0AVEHoJ2dYaUGN2IKCXKtaEtZMDaVyr?=
 =?iso-8859-1?Q?ekNm20vVcEuc4NDMB1y4aMV+ZWhfukcj+oRYWD2talnCwBu7E7hq3meRF0?=
 =?iso-8859-1?Q?slRHEGsnUaoh9TkhKlnIq7W1JLa0RmL4WWeoKm8laDNUZleYgHu19250Kq?=
 =?iso-8859-1?Q?econ0iUM3gR+uGe+CAsudp4nvvIThbVpT9F0oWGmYHumKGVyOcADDAYmK9?=
 =?iso-8859-1?Q?GsT1e/XXAZJ7m7v4UEpUYp7T8dNKY602XQUzryzseRRKx8FkqJN+UpXeX/?=
 =?iso-8859-1?Q?T8TCrPQ7dDpKYs9og019SVfsrLF9kp+wxY1As0VPNwha1KloYAj0shqjhi?=
 =?iso-8859-1?Q?SyLLUF59TssiwtDgjUCmMuyH1FIVy/UWGNhWj9qP7sgOzAd3VmEWs0BUyd?=
 =?iso-8859-1?Q?Ht3yGMgc1SsgaAmsKYcjOK0s7Cdk5NAOWxaj81VEEUbMjVPLHQy3Udog?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5480e286-e83e-4782-b3d8-08dbf2d7ca52
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:41:22.9033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1qj5xIyQoXDsKFOo/VQUNU3VnUIgQn/vGUHu79TGShyRiwd+nswyBKKUDkz/0BPoZL9hhI5/tGNHz4LNnnRRAwhsgUl9SDAlUdoZwZBejE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7285
X-Proofpoint-ORIG-GUID: auP1DLL3KenOzM_fnUodKFyRiOKe1i-B
X-Proofpoint-GUID: auP1DLL3KenOzM_fnUodKFyRiOKe1i-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020009

This patch makes legacy backends optional. As was discussed at [1]
this is a solution to a problem when we can't run QEMU as a device
model in a non-privileged domain. This is because legacy backends
assume that they are always running in domain with ID =3D 0. Actually,
this may prevent running QEMU in a privileged domain with ID not equal
to zero.

With this patch it is possible to provide
"--disable-xen-legacy-backends" configure option to get QEMU binary
that can run in a driver domain. With price of not be able to use
legacy backends of course.

[1]
https://lists.gnu.org/archive/html/qemu-devel/2023-11/msg05022.html

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

I am not sure if I made correct changes to build system, so this patch
is tagged as RFC.

Changes in v3:
 - New patch in v3
---
 hw/9pfs/meson.build           |  4 +++-
 hw/display/meson.build        |  4 +++-
 hw/i386/pc.c                  |  2 ++
 hw/usb/meson.build            |  5 ++++-
 hw/xen/meson.build            | 11 ++++++++---
 hw/xen/xen-hvm-common.c       |  2 ++
 hw/xenpv/xen_machine_pv.c     |  2 ++
 meson.build                   |  5 +++++
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  4 ++++
 10 files changed, 35 insertions(+), 6 deletions(-)

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

