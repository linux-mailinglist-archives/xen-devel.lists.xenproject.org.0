Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0547E8480
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 21:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630796.983915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKs-0005Uz-Sr; Fri, 10 Nov 2023 20:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630796.983915; Fri, 10 Nov 2023 20:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKs-0005Mt-Lp; Fri, 10 Nov 2023 20:42:38 +0000
Received: by outflank-mailman (input) for mailman id 630796;
 Fri, 10 Nov 2023 20:42:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vE0U=GX=epam.com=prvs=56783987ff=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r1YKq-0004yp-V4
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 20:42:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac2cad76-8009-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 21:42:33 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAKIjQw010025; Fri, 10 Nov 2023 20:42:29 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkysufj-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 20:42:29 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB3PR0302MB8991.eurprd03.prod.outlook.com (2603:10a6:10:437::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 20:42:24 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 20:42:24 +0000
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
X-Inumbo-ID: ac2cad76-8009-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7P7vS5qGnKmGuBUQrXZQz8y8GUn3VwSxrXtQW6EIfrO1OYgVCG3NI8LKeAU9n914lSb3/7RudL2L1zFPqgMsqKbf8lp3BAc1ur7NEyTMQLpbSzOqxgqPr0AyLVx1hHZwonqxLwdacXs/F/MIG0sNG+X0rtgtUKCs01g/JjWRnNsr0d4U1S3TMyL0x+ie5PoOjiwVTLv3NFgKGxstuy+HR9HSSv2NCrQiAtPLOmGSBXle5CHKgBYDtR/sy+vBTpgs8GNIucb5qGnoQVGF9+e+0vrQu/EBaLNDAO9ceHy4lt8NkNv5yys6gAUerrS7WVUzmBgUMu6bYh+3zOOjzdUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrOm9LNsn91tP/CeZzcWh0KSoCIqcM3e2ReDFqdpkMs=;
 b=MWJuumrsANCXTTfhbrqqArsfoSGQwtAwmOkSD/68Vu/CQrn32XKYlzt46IehEyGs76XNFOn8u0wRJgv0qEsp8JNas2oCSpOJHKeHEIo+UL77ONGpELLH96N41XB6vySXFVTreMTg/suptPTgpWyKt2HiUoYFp1BEcUKCWwlygfzTkWXpCuXXqxn7J2QuXaIyJeF5F9CUfUSGfY4o39mDtH841Z+drLBLblBQKgrIt1OJHahP6wMDL2HepsY132iMlyxHcOftAhwUSwma0rYiskBJJRxuAOGgt3iHUZXOaO6eg+/WRn4RYAnrbePEFgWGDPVuRjTn7VGErVHEE5rpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrOm9LNsn91tP/CeZzcWh0KSoCIqcM3e2ReDFqdpkMs=;
 b=Z7wiTcmSJVEYD+hzPUh9SND3rduTyjqI49Pzvlv3ttOvIbFD0ahOjQyJDKF1vNiBblW6tx9NnUfBTsEtWoinQ6jVCNnTWXseLDmoLPI00G+Z+in4UHSNLpZJwV/NXAPAadccu91FKjq01BD2rtLetUGYlxzqPm78OHH8ZRac+AJ46LDF4f75FT0KuZGOPOmNCiW2c8Qq/Pp90skmxd0kbJVfjZGkoMGrbYnHSJh1Tf4+tQxUWfh8psQdXYCeAfYXWxWHijhJvGPP2MAKhmk5/RmtLZmv/s3nw9LuE8l70Yjrr183wwxe39AKieiCcOhDA8H+c9xR6YX2GDElTWVvCA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 5/7] xen-bus: Set offline if backend's state is
 XenbusStateClosed
Thread-Topic: [PATCH v1 5/7] xen-bus: Set offline if backend's state is
 XenbusStateClosed
Thread-Index: AQHaFBZoiczA8QKKJkeUUC5gOc8rQg==
Date: Fri, 10 Nov 2023 20:42:23 +0000
Message-ID: <20231110204207.2927514-6-volodymyr_babchuk@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB3PR0302MB8991:EE_
x-ms-office365-filtering-correlation-id: 5703c808-08b1-42e3-7423-08dbe22d8b58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sOWUR49bPCHq2MDz4OKjUebc6vL1/adN+YxOBCawkCdh289XyABMU17ZIHdt3zae6BUL+oTOpbcJXoTxvHuFAlMMBdU4OpWAizWs9lMQK//lueKKf6qyLFESjY2jB3oeokSVEjy9RVENSfxXQxjE4gNQFUY2dWbXxGvEKzHLXTnTYLj7tZjkYO7Nyj8dPGDdjf8tt7Zs2DDwce5uwZhfo921VZgNjvITHh2ujworYJbsDOHgVtRVpeO7Z4LbZm/G0kUC/77WNeHe8mDV1I5Nc6Inb2RcglR/fWAByZaorDGtN+nv0ZD/lr96uHRwpeOux5bnQRu0YB2tvytlLCcTQ4STX5FUTsWcUL+cPlH+oT9dBgwa0cIF5hsWSRrakdZdq48q1zE7YPcMVAvqHZjOa9Cx7R30Xy1Ml2CFFN6ImtuWYeHvmm20BmBDCvOFZl83fnl9w/K0NzSV2C0+U9D9yVbo8GwIL0BmJaBDLSmrGnYmNePe0LEeGawADZG4zL3EHFBeMlU7qzPANauGyOtgGiL4l8566K1a6gAsi+EoMJRNu/DiDAUdjmvgpjPTTMADKfsW9jQyS6jd5e3DSegNUEFEz5xcXoWiw8AB9UlTONY+TWChdATiKpD5IE81hVov
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(2906002)(8936002)(4326008)(4744005)(86362001)(5660300002)(38070700009)(8676002)(316002)(36756003)(83380400001)(38100700002)(478600001)(2616005)(1076003)(6512007)(6486002)(71200400001)(122000001)(6506007)(55236004)(91956017)(76116006)(66556008)(66446008)(26005)(6916009)(64756008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/FSoOQPzYuRmlIFZl0HXXBfrupib9qLujN5V2UPKaGu12YeZkQV23hCfFk?=
 =?iso-8859-1?Q?IqFiACkHR/djiff0fcA4ZNhYaMK9IxiFtlSRDRsijprxBJBuQuuqSXDnqC?=
 =?iso-8859-1?Q?K+DyaoeqL2HYkiOeQ0+AUt7h9p4BT/gOzz07KEGNuHXeT5I2Fd0RcN15o3?=
 =?iso-8859-1?Q?yFJ2tJ0yjgkY3qIu06ctw7CTPejOjaV1smIyET0rJdS5oCA1UlyxOrWWqj?=
 =?iso-8859-1?Q?ZjJ4XaV7BJxfKthmVkR5OlQQk5+4v3fnm85NT/tC7hkoLyBDXbQfG+UuUF?=
 =?iso-8859-1?Q?CgsMGm+z+7I4IIu9w0rbH2NVKmrWIBaqy1QvHD++HmD0t6LYptgfOBVI3a?=
 =?iso-8859-1?Q?KAoHouX2F63KQ9uRBVpD4TEqWZudwcSpapvASL7Rw8vI9DIg3o0Glcg1a3?=
 =?iso-8859-1?Q?r5xdA1HLRzHZth3LrdlA0qxeAK7z9a66lAdtfFJNaicvUOvR/GFB8pCxx8?=
 =?iso-8859-1?Q?yz58LLUJooh/y65oIne7sUGBKwnWGSk2MEj5zse9xoab65QhVvlgSPDeEh?=
 =?iso-8859-1?Q?STW0+u+TxYhUvcAs4bqohYXZe40m4AtIy52afhka3e1L3jDhTGFSy/XAsh?=
 =?iso-8859-1?Q?d2zfT4yVFS9sygxLdztItiUfn6svZKNSC0s8mh7H0/pryfS8CK0ZrvWft/?=
 =?iso-8859-1?Q?Q7W3pEpUymKULw0A0IFLZ5pzXbrRryXUBSJdxZFzgNihg2yNH+cwLS1oc2?=
 =?iso-8859-1?Q?ClujJ8fspHqotmPzWqxe9jAMNJqXU5p9LPzYovKsjE2C1DZQXO6vdvXAFB?=
 =?iso-8859-1?Q?4yLSBdSBZTSFBna/JoGW8Nbic5Y0fLXC/6ZKBaSSsieBon96zcub2lpj7F?=
 =?iso-8859-1?Q?/7y5hMNKI3jIRC+HoXyBgdkPAgfIABBIO+Lgj55zzNWt1sduw24RTunpHh?=
 =?iso-8859-1?Q?u5PXc4mX9yAoglRNpxmfH/pKJq4xnjwShiV6bLT3zVnoSftaCRdeUJKTcu?=
 =?iso-8859-1?Q?V0iPwYE4pYwELXhcTTTkUaKXMXO7n7UXIh29ztnqT+3COt9vlYVbVQ7xNH?=
 =?iso-8859-1?Q?KTQRsr+kK71Cqv71NUAnipe6qUM+fHKlZPzhUk3tv+0tw66LPEm/YBW73+?=
 =?iso-8859-1?Q?rhCmo/EM/hQfpoc3e1QN3pwbalqIbugHmIK3Kya5+NslVuKAFqKxg0Kwhy?=
 =?iso-8859-1?Q?vj8eE3RwuZ57zC3CGe9LqgMe8MyZgtHaFn7DNRyjRY7yHxYnXGh1Y90Ohm?=
 =?iso-8859-1?Q?PqXX5k5BWTjOC9aDZK4kEsGBgORGgRQqUV59/KaAZ/lwMBiym4d3A8A/Ab?=
 =?iso-8859-1?Q?UWX6xHEmZZ/s7egmwdYJ/YBSxWLapFLDCb/Fn1cyhVJaKuu0Bkcvt+YAI4?=
 =?iso-8859-1?Q?eXgKTkQNQTa3VwlaxCYajiGtKcBl1wLqRRk79rgE+3PLlbsEZTPKJHNO93?=
 =?iso-8859-1?Q?3G4DV0i76V9iGXEOQKmb8Qu2iW5ZNsc2bas/w598Pbbe5YvfHw1G6gCtM/?=
 =?iso-8859-1?Q?Tfn3Eky3LvG8FOkLLRDYgDrEh4/vSeLKH//+1MsW+gT/ZMbj02oAASgtlW?=
 =?iso-8859-1?Q?4wzrinkl2g1/hNGbIaAj65ve4K/ilPvuL6hXVMs4m9X1GE5XtPNMSz3blA?=
 =?iso-8859-1?Q?Au4LA0VVtGD/GsorcoRHHpMEKuOrOZ1bAOzHipr2caAfcaAPmxWN6lAmfU?=
 =?iso-8859-1?Q?7Q1CN9s1v9NSJYOaU+B/wptAQpBLo5G+cNgFpG5rKnjIWD7K+T7FFSZA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5703c808-08b1-42e3-7423-08dbe22d8b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 20:42:23.5860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h4tOOluxqO/4qLsSZ71s/8uGodtx/tTK1A/oB/q+pw/PxM7PTNVc6xuXjWs7VmAOigTjSZvqrWFoM+hJ+tEiGM8NqVj0JTH0+SPYRQUxg3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8991
X-Proofpoint-GUID: CO5DezGelvZJUtJQjvaAJuNKkslVZEkG
X-Proofpoint-ORIG-GUID: CO5DezGelvZJUtJQjvaAJuNKkslVZEkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100172

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Both state (XenbusStateClosed) and online (0) are expected by
toolstack/xl devd to completely destroy the device. But "offline"
is never being set by the backend resulting in timeout during
domain destruction, garbage in Xestore and still running Qemu
instance.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 hw/xen/xen-bus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 75474d4b43..6e7ec3af64 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -519,6 +519,10 @@ static void xen_device_backend_changed(void *opaque, c=
onst char *path)
         xen_device_backend_set_state(xendev, XenbusStateClosed);
     }
=20
+    if (xen_device_backend_get_state(xendev) =3D=3D XenbusStateClosed) {
+        xen_device_backend_set_online(xendev, false);
+    }
+
     /*
      * If a backend is still 'online' then we should leave it alone but,
      * if a backend is not 'online', then the device is a candidate
--=20
2.42.0

