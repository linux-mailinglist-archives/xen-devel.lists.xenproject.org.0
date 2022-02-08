Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309AD4AE03D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268491.462334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmo-0006Az-Ij; Tue, 08 Feb 2022 18:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268491.462334; Tue, 08 Feb 2022 18:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmo-00068W-FN; Tue, 08 Feb 2022 18:00:18 +0000
Received: by outflank-mailman (input) for mailman id 268491;
 Tue, 08 Feb 2022 18:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUmn-00068K-3w
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:17 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f67cc8ae-8908-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 19:00:14 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EgrT2015757;
 Tue, 8 Feb 2022 18:00:12 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3t5xrs6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:11 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5613.eurprd03.prod.outlook.com (2603:10a6:803:12a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:06 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:06 +0000
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
X-Inumbo-ID: f67cc8ae-8908-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiwDlP3vRAbBoMjwRE1DEMeNzuy/z4yOtYj+6mxRiCegonEQ01woy2anuIGi+cFAXjJMO4Pg4pF+S4t+6IdDlC3/lSAnJOqa7u9CnlJ61t3dYeNlmCxB8vYc+6kuBb6IsJgMh0QK3yL0moIsm0xypelXrtCZ4nrx0rk/rS1A4a0Uck07r/4VKwXSO398sTnvbTnFOCk4OIP7TGTvkfH70nms7uC8bqTyXhP0D/A6DChg8SETmd4WKiJ/YtyGlDmRKy6CiWRHqpChsceAFjjTuCB+9Ure1ZTkVZQbQjMaykuUralkABpHyWVj7V5qT9/6cx6XA8dEVYHu/wL2Peymaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zp886fdenazy8I4uy4JOrrugnDLYw+4E5d77d3IGdYU=;
 b=QUxMC3tOWqSmKH7p+bAsfGvJGbup8DmnObj4KIOwZIF2F+Mtdh0XLM6Zwx0w0RnBgk/1EQAsraDfij8WoGQzkfEH1i7uoNnZPkpWldyfLhcTyYilWdiQEd5c9fgmjP9GGYjpUFEbHiiR3o3jueECbmiLLp3wNorJciPK7AmufAesPXxOwDEiTIs4gSqhihxhCuDkL5cAZWZ7Kmb29WUZCFWrIrGM195PWV1pCu3lw9aLSjNpnG0J99die9vW6XgyoGLNRbFX5iwbN/yg3lY23W4683ctxUQPs5/ReapKsQyTzBtZeU6zsHD7QeuxiDcOW5fh6nlnEukpeFi7KSZkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zp886fdenazy8I4uy4JOrrugnDLYw+4E5d77d3IGdYU=;
 b=eC+n5fSTp8riCSmttv9a7mw1RZaur//zyuhK2meAE9XVyTLuXMkeQGGDBDpszNmcRA3f5M17PVhKNeYdIv1Zasz6TBKbsS9pcWAcNkxZU6Llx2xO39thw2aufY8hq1JB9j24XPvZ1vYqEQR2lHl3ZiSFardLrUImfQvFIoTpHY9LOHm6ZU8F99uX1kugrJqgy54JteK6JOhJyuYU7cW/Sk9x7IxCkCcdWi9Bz8dRkJPFlRR6bP4/ZQgW6do6ErVF1ov9puWknlEQd83cL01bZeBTEiZ1DRBaDtBfa667pcMKygoqfEwd/rLhAqDuZ3H9UwAzITSg5/Yq48sfSwuWjg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Juergen Gross
	<jgross@suse.com>
Subject: [RFC v2 1/8] xen/hypfs: support fo nested dynamic hypfs nodes
Thread-Topic: [RFC v2 1/8] xen/hypfs: support fo nested dynamic hypfs nodes
Thread-Index: AQHYHRW07SkrMxyT/k6/hhSCHW7Rmg==
Date: Tue, 8 Feb 2022 18:00:06 +0000
Message-ID: 
 <8ab7e9ffd5f041c2631f754c7c596874cf6a99c1.1644341635.git.oleksii_moisieiev@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec53d40c-2a59-49f2-c7b6-08d9eb2cd6e4
x-ms-traffictypediagnostic: VE1PR03MB5613:EE_
x-microsoft-antispam-prvs: 
 <VE1PR03MB56137297DA769971DFD61EAEE32D9@VE1PR03MB5613.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 M925godofpc/lzkYZpjCxO5Z3+hNdtDE0Aeme/XmzDf6pgAQe9GTjMproVG2AhJNtKXKbTwUK+92SQ54Xb9DXbpdd6+nkygZncTMbuzsLn8hBxnI2dXKggeIR6p+Oy9RpS8hX7RWFZo/d6zLJQI4mfAczAxRXzQqh/71a17jHCVRyVG6YP8L7ZEFXhMpupR1l4eTAgqDpg9TVeHgVcYU2RO6fhfrZDnVYn5AP0NHQ071H1UouXsxbCNmcuZ2E3JWi+4EL7vVf8CinOFEsqtpMbIDNCHHNWXDS0Ng/KOb4EagJdnzRvVwghATY/sFJAVm9xSBbm4qb+y2QynfQAbSh/TewpcGIXCCUjPc4kVNs+rPQgexC2g6FtExTpl89wfWLNS3hRezjt6sK7N6BottTQOm0MQ5qtbubqfh53lzsX369HQUEYkoH7U98VcP7iMMMdO6ZSkqM+3ebaTdTqIBTSOWTuxQ1WeuTOtgAhacY2kIU4YSMklFm5H2viWCmfXDcsNq6xVpIuJbbNHLCnc3OTzWczBgf7R2BLop+oNVQF+mfg5gBeK2W4qWiBnOFY75v9g6fcZhDFzNNd7G+6UQfWD4IMZI25KKjXUp1cQANZFS5Mf7MOBKz0n01/9Hj5nhAKcu9yFp5ZTgv8rZ9zBoJYAu6kV5gEkWmejTbd7UnO3AalCtplUcZTQiWjYnidUY4v6ei0AOC2OLMzf3QJCkiA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66476007)(64756008)(86362001)(66556008)(316002)(122000001)(6916009)(6506007)(2616005)(5660300002)(6512007)(4326008)(83380400001)(54906003)(2906002)(26005)(186003)(8676002)(76116006)(38100700002)(66446008)(66946007)(8936002)(36756003)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xKkU+ob0B1OPUwigD9emPoDS22D1O39Rrg3DSS1fWHxhAr7Y5bEU8WvzIY?=
 =?iso-8859-1?Q?6JV9Vu9BPWYuTzB58EqKnJdHFFeamOqTMBvHTw4gRaRptlonfOS07/fYBl?=
 =?iso-8859-1?Q?XduE9KQ43rx7C31uy42IlKFTopeIp9W4naazv4wlpMftuZuA1Ugb8nUpFU?=
 =?iso-8859-1?Q?nCgwrt3vWeSY1tGOPw4CoiL7Vxpl4wzT1sjZX0AC7p8P1GxJxRdMIZDgvB?=
 =?iso-8859-1?Q?5nJf1pw9zBlYUArzGRQ70kt4Ol1bUYmD12+hg7GseRojRfiDf3ixylX47e?=
 =?iso-8859-1?Q?96iRC5x1cNVgMI9W1bDovGT9QV4DjCFTmoww5tkAhWsrUTg7i32POmWDGe?=
 =?iso-8859-1?Q?Oy0+wX8WkrSUao6AFrQJZtWXrK+da+PwJckxk5M0rStf70sNoraF4Xiplb?=
 =?iso-8859-1?Q?3RWs8McyG5Pq0O6QWvBs7eUUS4Zg83Mdzs+5or5UXij1BRGg3o5lZi40u2?=
 =?iso-8859-1?Q?BWcDA9eYuyJP/DGb6gXn2zOnoJArqpHZiWmM1CIJP92tj60yncpK5bVh/f?=
 =?iso-8859-1?Q?V4QUzF+8ELuDrXvv0DT+hPW/77GzrTjyK/ox4EfbBhOvYDJil3vY9YSGTz?=
 =?iso-8859-1?Q?OUVHLVb2zb4M+DqlBSJhcotbmFz+F32LcJrGMJdEBL4LbKlAd9/WRnRHqA?=
 =?iso-8859-1?Q?C+h9r1RTqNIKjao8IDhyEfWu/7TVVNxdGFLvTWdcYLUiKrgsNKdXrsXz82?=
 =?iso-8859-1?Q?ZSzuOqXlmi6EMnT8ZHTCOiFA4k2bkHJKB4OTJLnOKw4YIj9LibBLZdjpou?=
 =?iso-8859-1?Q?xe25t8ybXI8AgmCr6Cbcf2KCmwwpDGHwyDHn//wtwXzQRLdQHi6QDASL4Y?=
 =?iso-8859-1?Q?dCY1iap4wGNMNES0hJT6v4f1PHk9qYVGkzBa6NqJRIj5qfahl+tgyzmTSr?=
 =?iso-8859-1?Q?kf7zbEsb9XdrieItx7hTDfnt0qhZz4eyjh3u0CyuqUdfHM3ZoQxZFqi4Pk?=
 =?iso-8859-1?Q?+u719DmVaWS6QDY0wzGZVIqzEVtZEh+xGW9v3Hqk6umg1txClUApWlZV/U?=
 =?iso-8859-1?Q?Jx7rk6oG9V3n9VoQoQ641Qxj4YIkfC2Rbo65s+uBn/BnxHYKunNeW7FQOT?=
 =?iso-8859-1?Q?ddoib8eAB7AQ/30VPf00pZ0Om5oCMPq9PGjKmrUzCxRonNjOUF57tjhxjn?=
 =?iso-8859-1?Q?yXaJumqLFI6b+ztYicmFxwzM5Dt2LvIQSaVqrU2OBDENTSvjin6eLW7K0o?=
 =?iso-8859-1?Q?C04qvWRzPvH0fRkSSQl9+LGsLx9ZzRmJ7B24SVPjVwv/A5NhCz8u4r5jxw?=
 =?iso-8859-1?Q?f4YSK9sO2pskpNvdHC+6hcSlaOvgnTgqMn1Jvz9lxS1CzUJxYLJLgJ/nLe?=
 =?iso-8859-1?Q?AlB1iWB0o5Xzp+2jfXyLVsRosZubEhg53+iC71Yo8rdgpll6+/awQtKsh6?=
 =?iso-8859-1?Q?04r+a4wzZBmTM75QaUl6vgelYYjsBOQ239Ov1I1x0/2dWnt0MgGaBAtaqk?=
 =?iso-8859-1?Q?dhNs4xAfyatIVHetWo/wrzlGMIzHKYvTY/AiKZrw/ilIOnxYpj7NSzGG8m?=
 =?iso-8859-1?Q?9PXtwhvZzLR34GD8ts3edyDzAyW1dUwqu6QDovxltcH0JUYuOr/L2QXUlD?=
 =?iso-8859-1?Q?1wxKCIRVxbs3/+ruDLDy4xHm8WrCpixfqS2G9SLFvtSHTt7kiQmIb+TV7J?=
 =?iso-8859-1?Q?DN7/RppWhHk/wxKQFd9d26T2zKRD3fx8bB/3VNcdFWUlZ3VOJOjziM5iAj?=
 =?iso-8859-1?Q?mZiNaooPznVGIVAPuiyJFZIcOvnHGZC9KGMMNKumBpwl/Q3QuG2oqdXv+s?=
 =?iso-8859-1?Q?8B+aYYPArPFJKrdmBRyJDP3hc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec53d40c-2a59-49f2-c7b6-08d9eb2cd6e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:06.5573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gM2gdTx06HrrtJ3eII21MiAK5rjeTo34Opxb3ACRe6fNYG4RBMTkmvsByH5gx1qItsN1kNDrWrxfPX40aUvAKSnxNWBbXhGIA2CfjSSszks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5613
X-Proofpoint-GUID: xlpRPLEwV6HuY1SOqqNURSozi-PfZpJB
X-Proofpoint-ORIG-GUID: xlpRPLEwV6HuY1SOqqNURSozi-PfZpJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080106

Add new api:
- hypfs_read_dyndir_entry
- hypfs_gen_dyndir_entry
which are the extension of the dynamic hypfs nodes support, presented in
0b3b53be8cf226d947a79c2535a9efbb2dd7bc38.
This allows nested dynamic nodes to be added. Also input parameter is
hypfs_entry, so properties can also be generated dynamically.

Generating mixed list of dirs and properties is also supported.
Same as to the dynamic hypfs nodes, this is anchored in percpu pointer,
which can be retriewed on any level of the dynamic entries.
This handle should be allocated on enter() callback and released on
exit() callback. When using nested dynamic dirs and properties handle
should be allocated on the first enter() call and released on the last
exit() call.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 xen/common/hypfs.c      | 83 +++++++++++++++++++++++++++++++++--------
 xen/include/xen/hypfs.h | 14 ++++++-
 2 files changed, 79 insertions(+), 18 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index e71f7df479..6901f5e311 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -367,28 +367,27 @@ unsigned int hypfs_getsize(const struct hypfs_entry *=
entry)
=20
 /*
  * Fill the direntry for a dynamically generated entry. Especially the
- * generated name needs to be kept in sync with hypfs_gen_dyndir_id_entry(=
).
+ * generated name needs to be kept in sync with hypfs_gen_dyndir_entry().
  */
-int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
-                               unsigned int id, bool is_last,
+int hypfs_read_dyndir_entry(const struct hypfs_entry *template,
+                               const char *name, unsigned int namelen,
+                               bool is_last,
                                XEN_GUEST_HANDLE_PARAM(void) *uaddr)
 {
     struct xen_hypfs_dirlistentry direntry;
-    char name[HYPFS_DYNDIR_ID_NAMELEN];
-    unsigned int e_namelen, e_len;
+    unsigned int e_len;
=20
-    e_namelen =3D snprintf(name, sizeof(name), template->e.name, id);
-    e_len =3D DIRENTRY_SIZE(e_namelen);
+    e_len =3D DIRENTRY_SIZE(namelen);
     direntry.e.pad =3D 0;
-    direntry.e.type =3D template->e.type;
-    direntry.e.encoding =3D template->e.encoding;
-    direntry.e.content_len =3D template->e.funcs->getsize(&template->e);
-    direntry.e.max_write_len =3D template->e.max_size;
+    direntry.e.type =3D template->type;
+    direntry.e.encoding =3D template->encoding;
+    direntry.e.content_len =3D template->funcs->getsize(template);
+    direntry.e.max_write_len =3D template->max_size;
     direntry.off_next =3D is_last ? 0 : e_len;
     if ( copy_to_guest(*uaddr, &direntry, 1) )
         return -EFAULT;
     if ( copy_to_guest_offset(*uaddr, DIRENTRY_NAME_OFF, name,
-                              e_namelen + 1) )
+                              namelen + 1) )
         return -EFAULT;
=20
     guest_handle_add_offset(*uaddr, e_len);
@@ -396,6 +395,22 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entr=
y_dir *template,
     return 0;
 }
=20
+/*
+ * Fill the direntry for a dynamically generated entry. Especially the
+ * generated name needs to be kept in sync with hypfs_gen_dyndir_id_entry(=
).
+ */
+int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
+                               unsigned int id, bool is_last,
+                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)
+{
+    char name[HYPFS_DYNDIR_ID_NAMELEN];
+    unsigned int e_namelen;
+
+    e_namelen =3D snprintf(name, sizeof(name), template->e.name, id);
+    return hypfs_read_dyndir_entry(&template->e, name, e_namelen, is_last,=
 uaddr);
+}
+
+
 static const struct hypfs_entry *hypfs_dyndir_enter(
     const struct hypfs_entry *entry)
 {
@@ -404,7 +419,7 @@ static const struct hypfs_entry *hypfs_dyndir_enter(
     data =3D hypfs_get_dyndata();
=20
     /* Use template with original enter function. */
-    return data->template->e.funcs->enter(&data->template->e);
+    return data->template->funcs->enter(data->template);
 }
=20
 static struct hypfs_entry *hypfs_dyndir_findentry(
@@ -415,7 +430,7 @@ static struct hypfs_entry *hypfs_dyndir_findentry(
     data =3D hypfs_get_dyndata();
=20
     /* Use template with original findentry function. */
-    return data->template->e.funcs->findentry(data->template, name, name_l=
en);
+    return data->template->funcs->findentry(&data->dir, name, name_len);
 }
=20
 static int hypfs_read_dyndir(const struct hypfs_entry *entry,
@@ -426,7 +441,36 @@ static int hypfs_read_dyndir(const struct hypfs_entry =
*entry,
     data =3D hypfs_get_dyndata();
=20
     /* Use template with original read function. */
-    return data->template->e.funcs->read(&data->template->e, uaddr);
+    return data->template->funcs->read(data->template, uaddr);
+}
+
+/*
+ * Fill dyndata with a dynamically generated entry based on a template
+ * and a name.
+ * Needs to be kept in sync with hypfs_read_dyndir_entry() regarding the
+ * name generated.
+ */
+struct hypfs_entry *hypfs_gen_dyndir_entry(
+    const struct hypfs_entry *template, const char *name,
+    void *data)
+{
+    struct hypfs_dyndir_id *dyndata;
+
+    dyndata =3D hypfs_get_dyndata();
+
+    dyndata->template =3D template;
+    dyndata->data =3D data;
+    memcpy(dyndata->name, name, strlen(name));
+    dyndata->dir.e =3D *template;
+    dyndata->dir.e.name =3D dyndata->name;
+
+    dyndata->dir.e.funcs =3D &dyndata->funcs;
+    dyndata->funcs =3D *template->funcs;
+    dyndata->funcs.enter =3D hypfs_dyndir_enter;
+    dyndata->funcs.findentry =3D hypfs_dyndir_findentry;
+    dyndata->funcs.read =3D hypfs_read_dyndir;
+
+    return &dyndata->dir.e;
 }
=20
 /*
@@ -442,12 +486,13 @@ struct hypfs_entry *hypfs_gen_dyndir_id_entry(
=20
     dyndata =3D hypfs_get_dyndata();
=20
-    dyndata->template =3D template;
+    dyndata->template =3D &template->e;
     dyndata->id =3D id;
     dyndata->data =3D data;
     snprintf(dyndata->name, sizeof(dyndata->name), template->e.name, id);
     dyndata->dir =3D *template;
     dyndata->dir.e.name =3D dyndata->name;
+
     dyndata->dir.e.funcs =3D &dyndata->funcs;
     dyndata->funcs =3D *template->e.funcs;
     dyndata->funcs.enter =3D hypfs_dyndir_enter;
@@ -457,6 +502,12 @@ struct hypfs_entry *hypfs_gen_dyndir_id_entry(
     return &dyndata->dir.e;
 }
=20
+unsigned int hypfs_dyndir_entry_size(const struct hypfs_entry *template,
+                                    const char *name)
+{
+    return DIRENTRY_SIZE(strlen(name));
+}
+
 unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *template,
                                     unsigned int id)
 {
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index e9d4c2555b..5d2728b963 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -79,8 +79,8 @@ struct hypfs_entry_dir {
 struct hypfs_dyndir_id {
     struct hypfs_entry_dir dir;             /* Modified copy of template. =
*/
     struct hypfs_funcs funcs;               /* Dynamic functions. */
-    const struct hypfs_entry_dir *template; /* Template used. */
-#define HYPFS_DYNDIR_ID_NAMELEN 12
+    const struct hypfs_entry *template; /* Template used. */
+#define HYPFS_DYNDIR_ID_NAMELEN 32
     char name[HYPFS_DYNDIR_ID_NAMELEN];     /* Name of hypfs entry. */
=20
     unsigned int id;                        /* Numerical id. */
@@ -197,13 +197,23 @@ void *hypfs_alloc_dyndata(unsigned long size);
 #define hypfs_alloc_dyndata(type) ((type *)hypfs_alloc_dyndata(sizeof(type=
)))
 void *hypfs_get_dyndata(void);
 void hypfs_free_dyndata(void);
+int hypfs_read_dyndir_entry(const struct hypfs_entry *template,
+                               const char *name, unsigned int namelen,
+                               bool is_last,
+                               XEN_GUEST_HANDLE_PARAM(void) *uaddr);
 int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
                                unsigned int id, bool is_last,
                                XEN_GUEST_HANDLE_PARAM(void) *uaddr);
+struct hypfs_entry *hypfs_gen_dyndir_entry(
+    const struct hypfs_entry *template, const char *name,
+    void *data);
 struct hypfs_entry *hypfs_gen_dyndir_id_entry(
     const struct hypfs_entry_dir *template, unsigned int id, void *data);
 unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *template,
                                     unsigned int id);
+unsigned int hypfs_dyndir_entry_size(const struct hypfs_entry *template,
+                                    const char *name);
+
 #endif
=20
 #endif /* __XEN_HYPFS_H__ */
--=20
2.27.0

