Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0A801994
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645877.1008421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0h-0007Aw-8U; Sat, 02 Dec 2023 01:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645877.1008421; Sat, 02 Dec 2023 01:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0h-00075R-3H; Sat, 02 Dec 2023 01:41:35 +0000
Received: by outflank-mailman (input) for mailman id 645877;
 Sat, 02 Dec 2023 01:41:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9F0f-00072l-LF
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:41:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb1aacd0-90b3-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:41:32 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3B21X1Qn015641;
 Sat, 2 Dec 2023 01:41:27 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqa3aucrx-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:41:26 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7285.eurprd03.prod.outlook.com (2603:10a6:20b:2ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:41:22 +0000
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
X-Inumbo-ID: eb1aacd0-90b3-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGD0e7m4fHO7rrIi7b57NDXGrXsJOiVyUOQy6QMj+OD4PhtJTsbeq7/+d/zTjTRUPF7J3+tk9+sNb3ouWuBfhogPutkQ6w4rAXeGdyWfKymZFICKlvB3Tq3M4ZKHJeFE8s1mvFB2H+j7au+M/J3NbyuZiJzcl0U6U1Pli9m3kd7LFWF6aEOMf+EGOSSNJbvJAq+4DKFAppxDZAKy4mj/0tm6BXoD9EtTIVUNsN0uUKbErO5ibGLO5m+98HjcvW8hOipaEqt7xNy3IRq1Um0FJNVsZhsiN7hvZUr1bnX1FbAN4eegDQ3oDqrg2e+gKaCPfO1g5afqe/RSaV7cZmffvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ7QrNqUdBOnC13Grzj8pxJaSJ4ipHc7/EE49RhGldU=;
 b=cX1rfShD156QCdWssHvQjWQ7exwpWXv6TaVaMioyH5dszq/Q4n9GMbR2Iyi7+F2QJyTjBijmtwwrymT2/GOLtb2RryrEaXo6yeMydfeZNgyNgc9M5BZ/IgZ9p+0lPbAwQAkMgQ/RsZVZ3gpCcmKa6jmS0xz2dc7iEFncOqivbv0xpSEukmBuV6f2N3jgkuEuQkDFhNcN5sys1+Nje7ztQkbuJJDeQcX8TrIBeC4aOmITYofa3Ib40sIyivAS5NSfdNKyJ4zml15AGhii06+hrpXIYQC/g15cxUWgey41y+RGxjFeJqIiU4AbRMZVYHZjjQ1JJXgbQf35wzJibQC57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ7QrNqUdBOnC13Grzj8pxJaSJ4ipHc7/EE49RhGldU=;
 b=SZkF2URPDxzMOTe+isYiG4g0ofM5LAgNufi560Af0UXCpvs9tZdW5XLdSdyyGvAdY7FZwO0Y1nph6TUADDpbYt83VSRVmLUUw5lG6YV5tDlpGd0jZmseM/zWZHU9G7b6Jxuo/04uQVRJ/aqJSmEIWvBqSAUNFrfV7a9m4i7dSUiw/mUp47wB3YjTUqiSjTFsm8Szx3hWHf2IlyuB8qA8oLeJC0qNJXhbUJyfQylHjwij0rNMFSWjJAwTLvb5FWb5Gzw+7z/MKjFey1GhZnQq5rYZSiCAmKn2tPNV+0qikesvN4oPtWf4ppe3Z+dK54wffSiy93YiC6+LlKENP0IGuQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v4 3/6] xen: decouple generic xen code from legacy backends
 codebase
Thread-Topic: [PATCH v4 3/6] xen: decouple generic xen code from legacy
 backends codebase
Thread-Index: AQHaJMCnSKd/ZWVB1UiEphLKoDVW4A==
Date: Sat, 2 Dec 2023 01:41:22 +0000
Message-ID: <20231202014108.2017803-4-volodymyr_babchuk@epam.com>
References: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7285:EE_
x-ms-office365-filtering-correlation-id: 7c35c8ea-f2f4-4658-e979-08dbf2d7ca0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8E8Asu8bD+G16EADm3fUcQycwlOIrVhUcCRzC37BVbITNdVpHuLU+Y1/OhqQUTzMdWX+dE7tExnWIskackhmE8NBm99p50SZx8RQR6VgBq2apabHh5is15YC8lqFje/BzSDhablref1oErRtUQUGTnwtOonmhw0iYT6Sxmnm59pC7k81mwuybGzQE5oOmyIUE/NUrQ2Ea/ed9iIuzNcUrG0r9cBIPd3PYwx7ov/I2PY9vob4hSalcT5n/u6tDPGvD5tcJmqTJRWr7P0ITNg4Fr/PtKUf53pUI7A/ZUIglRiAQWBhoppMdq7lgSMDGfOTfC6J1jt+d5nWm2kPct8Hn4rDgGnTyaJZ8RqecIx/n2HWRfDp9UPtru2vRA9YNiqEHFsh6se9i3GDHU4la5szy74LBvwvsUzLBK3V8CC3B/LZzvuD0VRkT9xMr2Sj6jM8mrp5kdwdu4GWKsN/7GaOijgS5X5wmiqNSsQrMF87Z5PKpKwPjvmJN/iznnxzhZ7VKiRSJ+qirlKXTk+g8sU2tW6o5J9RVfwLgderNPKtPRQ0WV5f1LnKhDZXbUuaQRMeVVDpf7DC6CTHEC2i9CDXl/mC01s3DC1o90rU5DYfZZ8N3e03XyfxRI7PRx/hl6HSH4KohYopgiGLvFKHs3OCLg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(38070700009)(41300700001)(2906002)(5660300002)(83380400001)(71200400001)(55236004)(38100700002)(6506007)(6512007)(1076003)(2616005)(26005)(66556008)(478600001)(91956017)(6486002)(36756003)(76116006)(66946007)(64756008)(66446008)(8936002)(6916009)(54906003)(86362001)(66476007)(4326008)(316002)(8676002)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?w85TDjIJhgU03SEmx2jVb22I8cG9cEEElvfMr5gAeeyBTrb6jR9xlwXV4s?=
 =?iso-8859-1?Q?x/kArsPOEZXSGDKjieueNpchi7CDqwYN53vFzSVJKNvhYK3ylnar3zgzIJ?=
 =?iso-8859-1?Q?9Q4yJNcEcXe0g0qRS6QWNyOvYEudotb/TVzLWgh0/f/zrBjiHNc50CxdyK?=
 =?iso-8859-1?Q?zp7QihUKZvQsci/7IMfA29/C25mAZh5uyGACmvnhge4j64jXh847rjbbTq?=
 =?iso-8859-1?Q?C14ogDLdEH262Cu8QuRH+5tdKuk2oqvc/PKDdWgv6UIQV/23pvRcM4H8Kk?=
 =?iso-8859-1?Q?omt5UIuqVBrkBWf7LFXsXnfVUwpbXdfaFL9l4MJRorvDV8hz7UYlxEE19A?=
 =?iso-8859-1?Q?WMPhiCnUXVa9lrZ6BuudL8KHTXB7fHmmCKMyXNwIsU275ffj/x5Dyv4OpE?=
 =?iso-8859-1?Q?A+13Bn9Pm7jfJY1UwinlgUlqWQhES1g5jTj5X3dGm0t513KyN44sHLe8jt?=
 =?iso-8859-1?Q?aPbu/Fo1rONqvVonSAA9BlMUVaZ0gWyzZvXaHDUMyZlGmqkaG11RDKgOKE?=
 =?iso-8859-1?Q?0BX3fq0fh5jbuHDYsWEVOvvfs9/Hskwgzgyw04V0XdNADxWkrBZrT2EqCX?=
 =?iso-8859-1?Q?hAz1ZoLIGdKjuWJhuktJK0GcqwYmasgR8sK80eqvEahFmJoNxgRkubiktA?=
 =?iso-8859-1?Q?2qllMkYiU/7P6jKjKNwBAmELs28bz82otcAhuYj/lhgya3E5dM0jO2CNcd?=
 =?iso-8859-1?Q?M3Hs81vBHlugsWR8e1XiTNxu+JSPmbbKCTJhDRgMqgwsOBkgRCvIlHntKD?=
 =?iso-8859-1?Q?ykp/QjUmhDmS92Lux/Rjcc3vOKjCXm1mUHCqYixSqZBJpjOWzSC58vLL36?=
 =?iso-8859-1?Q?6s5Tz61D8CL90bgszowyi7KuwOk8zXDPqzNWggSBvL4r9vaZM2deEKf1rk?=
 =?iso-8859-1?Q?QFfgk2bubFUTL6dr/Z3Y1FnsjEBQNeGNWDuQUKHDkHG/iPAkrgHhDTijhe?=
 =?iso-8859-1?Q?+6uSVPH33Siz96IlObP2ji11m96TpMyphq0qhqeKkXLVzolySMBTG5NFf6?=
 =?iso-8859-1?Q?mPe6JtBzOO700ThldhBZKvtPMvY2DvhLRYkLBK4kS92CubQ5zUDiLtALKn?=
 =?iso-8859-1?Q?Z2vVzF/MlRW9bsGILRBFg2nuRbFxKCE79ZZlOBqYNM2vohgyZdemmUVSVQ?=
 =?iso-8859-1?Q?dd0dOWOF7tFHHs3BJk2SZnJK9R59u+m4YMnMka7k+giNBxf/LRllu4JfiJ?=
 =?iso-8859-1?Q?hyRJUTUCceFK5eOk5/2WLutx1jlAIE0jETgJKH/ucjfPdZjDqIkArjei04?=
 =?iso-8859-1?Q?mNmZwHoQwIEB1GmqyTsxzsGR72jN5lv3sHvDVreKP0JgT8yLIpG6BjixNj?=
 =?iso-8859-1?Q?6uR6yULBNK9POoc+1EMR/7rkxRlbrsnh2dC4seIJICCdbn9GoaK1irh2hN?=
 =?iso-8859-1?Q?CDLzId6XfsADZx0/VFmnSxlZDu1HHBBeVfcnEJuJHuy7rG6xOhgMSKd9Pb?=
 =?iso-8859-1?Q?uGlmgNeL0FNUl/zwhADltHda7vS8GLVoy2A9JhFoPT+E+05As9FnyjB8Zl?=
 =?iso-8859-1?Q?l7Ei9IUhGpzprxwODIrF/md5fziur2RMTngmLbGB5UzazltyduOdBMeNgo?=
 =?iso-8859-1?Q?pOWedCd/uFmzoqIgxtMtDoWcwwvKpo2mH8z9zdiS/1gQ2Eat2p4jUZW/XQ?=
 =?iso-8859-1?Q?BS5KgT+z46iFdfFn2aZZIojiRVJJUOeVjD8WPXwSk6MY7MqJMMBAKOow?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c35c8ea-f2f4-4658-e979-08dbf2d7ca0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:41:22.4783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRvAfL4Bfj9hEDUmG8q06hammh8xmttkHjqlkeXanvuPrlqCG2gm4xwfpUXyWQipmk0+E6qKtJ+FIu7I1Nn+HCAdepHfhvR+Uz2c5R6B7SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7285
X-Proofpoint-ORIG-GUID: kWKuNfjc1JuJ-6sL3MVA_lOQrCrkuJ_e
X-Proofpoint-GUID: kWKuNfjc1JuJ-6sL3MVA_lOQrCrkuJ_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=851
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020009

In xen-all.c there are unneeded dependencies on xen-legacy-backend.c:

 - xen_init() uses xen_pv_printf() to report errors, but it does not
 provide a pointer to the struct XenLegacyDevice, so it is kind of
 useless, we can use standard error_report() instead.

 - xen-all.c has function xenstore_record_dm_state() which uses global
 variable "xenstore" defined and initialized in xen-legacy-backend.c
 It is used exactly once, so we can just open a new connection to the
 xenstore, update DM state and close connection back.

Those two changes allows us to remove xen-legacy-backend.c at all,
what should be done in the future anyways. But right now this patch
moves us one step close to have QEMU build without legacy Xen
backends.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

In v4:

 - New in v4, previous was part of "xen: add option to disable legacy
 backends"
 - Do not move xenstore global variable from xen-legacy-backend.c,
   instead use a local variable.
---
 accel/xen/xen-all.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 5ff0cb8bd9..6c2342581f 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -33,12 +33,20 @@ xendevicemodel_handle *xen_dmod;
 static void xenstore_record_dm_state(const char *state)
 {
     char path[50];
+    struct qemu_xs_handle *xsh =3D qemu_xen_xs_open();
+
+    if (!xsh) {
+        error_report("error opening xenstore");
+        exit(1);
+    }
=20
     snprintf(path, sizeof (path), "device-model/%u/state", xen_domid);
-    if (!qemu_xen_xs_write(xenstore, XBT_NULL, path, state, strlen(state))=
) {
+    if (!qemu_xen_xs_write(xsh, XBT_NULL, path, state, strlen(state))) {
         error_report("error recording dm state");
         exit(1);
     }
+
+    qemu_xen_xs_close(xsh);
 }
=20
=20
@@ -80,18 +88,18 @@ static int xen_init(MachineState *ms)
=20
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
--=20
2.42.0

