Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475EC80197E
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645837.1008321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En0-0004LY-Oo; Sat, 02 Dec 2023 01:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645837.1008321; Sat, 02 Dec 2023 01:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En0-0004Az-EO; Sat, 02 Dec 2023 01:27:26 +0000
Received: by outflank-mailman (input) for mailman id 645837;
 Sat, 02 Dec 2023 01:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Emy-000272-JS
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:24 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1555a11-90b1-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:27:23 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGv1008549; Sat, 2 Dec 2023 01:27:13 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:13 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:08 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:08 +0000
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
X-Inumbo-ID: f1555a11-90b1-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UznBWdFVrRl3jnC+ikULpAj8Vkr8LmSDh/3KmsehG7mQRgp4iv36SqjfMMQfadtw3m1sdsZk03o84JHjJKRIgVgZN7NCnIDSzsoNTtcvG9AAYz+6NzXnMxEG8oJw2ggYxKy//NA5wpDunPXwFt6vFEK6tUw8D/TJ/vAEUJrZ1GbgYOh+r6G4Fx5j/1Ylq8FwxQ9pLV6jH04vQl8Rl7SMlVkll20rVRhU3+pZGHEBKbJyMVAIFAds/d6/pbHy2u5i25qn5H4YVfAWCaENWeh6MHJt8oanlkcvSY9uLxCqGTnYp2zxY4GKa0wYdswEGzXwG7yyNq7YC0eaTrvsjih8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwB9N34h98HO0xQgLgRJxTUI/bKMCMF1l0/De+vjKko=;
 b=DF4Ln2xBkwLagblpkJzmUoDoLr/QftQXNYhmbIwY0E4zNk6hwZgv6KP+CLmMTVWygbKPdNPj6cP5vOvKJvdGgpc4Rza1FAqn16zPCZNH+MP6xY9QduKIFVe4lVGidPXtqwuzM3eXMj/2bhTeQ27XbVM2oIS3HNVChx07Hn9YQ9YpI5ZEDtHA/rrGEaFmvCf2/8YoLSHWYNFZRGjwh1XcdKocUiwnU5z9dKsvfCNbCHFxdIqPhztI/vY/gna6HKbIcCRxfqeszSCkhQEyWBO3s2XwmcbOue6ZmFH6zO4e07i/GvEFB413QYJv+xmNrv6b9bZ7+oo7n/8QlGQUfpkNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwB9N34h98HO0xQgLgRJxTUI/bKMCMF1l0/De+vjKko=;
 b=J98vTK6i3gAk9MzMQDm/TvOTrl5PG5bAqPAbeVzwGQzBdsKbeJ74kOXH1dxtUtaFAlJrAAIgIinbq4XB+ww1CvH05ogiSDa3F3vprysYuOMsaoMRmDQ7f2mfetfsfdQIiHDPHJgG2BKjpo0rbh7li+pXc2dfy983BVtcUqLMTJTpOsiTQqrIoAtc/FIVlv2mBEEpBbeCgGc0JYHP811E1FNgkNik5knHC2tuFJWC+msLMLU6kopvo17XJizrxRNEztlqqmIFG0R+ctrZiMB8fEy0+v09Acg6jyhX3InzQwPtZqoEb7VK4+V1wIAfyY7F7Vx6Sd3HYjPMDuYhp1jOZQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v11 09/17] rangeset: add rangeset_empty() function
Thread-Topic: [PATCH v11 09/17] rangeset: add rangeset_empty() function
Thread-Index: AQHaJL6oz4wJTetDeUydVFKkkhEQHg==
Date: Sat, 2 Dec 2023 01:27:04 +0000
Message-ID: <20231202012556.2012281-10-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: aadcf4ec-9550-43e7-ab63-08dbf2d5cceb
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nhlQ1WsmfK9OsXn13NI4hVSXNbVK25Vm2Tpy1/MRS4IsGSMe4BE8pVywbvj0zFWOMpjE7unxHsAj7xn6gWQn47+UREjxdWPnsIZwqVUfiv5TxT1uDhVlV3uaNzHbEvJFz1NCNxVUmlAJ/jJpXYP9XVBenoh7HsyKPJGm3pxSH2UhK4nfynDq45E5ja7VbIfu4z6P+YM0z0bLoJI8hzN16bRt816i3GnyTo66NjT6ADWLIero9pZBbzb5q/RlsW0LybaAO8Nk9qE60nAdDw4dVOhxx70CmYCC0AU5fyXVo8jojrOzVqIy85jFo9vBD/Z4xn4ZmfRhyzQVSimsDiaP6EYi+F/Xz4DPBEt1bK7TFYmnnLrY2GN4oJ/PYxMzZYlmNYBvE6VNLKtUhPhFxYPG5R2Vys9+V1/NKHdTh4g/vKREfXwRTbvNwSEMVbK0I46knYE5kwIt/9PrkZr0VkY9u7v0I8ufAhPBjUDw+NTDJAzQS7MCrJQ85S2OjQRyzPhjteVWYap+cECqu8fpC96bf5ExWVpnaoV7z2T+Z61Ni1p3wSqmlmPWi0uu8vc/9iZaeBFsVysx3FSWZrHHt2Xm0fMrSOSZPaDL5D2zh9pwn8yZXazUrFs9yOuOV24zjeME
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?WLvcgjsvBHsMqky0zQwQcM4XeuRjS0Qw095cQpfIaQUWwMAC028rmCOL2P?=
 =?iso-8859-1?Q?JA1O2zalPEpt4h+dtUMkiMy8BHaxo2t5Xie2uKqk9SDQAVvpa4hvXUkfSb?=
 =?iso-8859-1?Q?vbTOPc5hwvfg5DV29/MbumzOZWLWrLCDuxoKdDPfsMUPgyCe9ZZ/DMZNy+?=
 =?iso-8859-1?Q?MV3LxiUv+FKzJr5zCd2Cq4pD8PnATwYHrFAcxg5TPfT3WLVnsulkquqxXF?=
 =?iso-8859-1?Q?ghcsUmRqvS/r9OBAKWKm2xf4yZh4djKteP9nXxFXRR8srTrs3gngVAwI2e?=
 =?iso-8859-1?Q?ppTpyzB/wqqBI6oLqtPW2ucDr83UxtU+q8Tmb5Pa0MxoA8CUwqrMZ11kn9?=
 =?iso-8859-1?Q?52czd9Cs8AA/P2XIy/ab2pqQ/39C3g0bZxaEZzb6MQH2seVwzNvq/NaXjb?=
 =?iso-8859-1?Q?Kn70caFR4/2hiHd4vJKczP+7Z9QT86L5Q+tM1oDBDzqg/nrAybSEJLpmts?=
 =?iso-8859-1?Q?ek9EMOVlQaIv+ucPfkUSGK5VWeLOi/rcI//ZL3WPpCL5UNETWEkjQ2Q6nZ?=
 =?iso-8859-1?Q?dnC0LbUvkzd8DD5xLWjaGV9A1slttx3L+hHweu8sX40tRjaIpxgeDqgc58?=
 =?iso-8859-1?Q?nU1ZbvPLL0M9V4ev/sp86WGcBzjFIzAc7SWLomUoRhpBaN2EWYmy+Si4ia?=
 =?iso-8859-1?Q?EW8aE1UnaKiVGBQOYQdL7SUU1GTct52gy7r9uTU30giRXr9M9bX3nSVnHG?=
 =?iso-8859-1?Q?0fzhyq/MsUj0k7llUpfLic4chwzInHhQLYwr8R4tIzbZvmI9YmnEq2Un03?=
 =?iso-8859-1?Q?TX2dLRpXHZvhLYMMkE9byahXNcl5zPgG6ovjAJxqb8v/6+HOT93LKg9q2g?=
 =?iso-8859-1?Q?3qsSTDrmEtXD552hyH23lUZvnkw73QuS0ps/mairbP+NWYm5ojc2ICcTAn?=
 =?iso-8859-1?Q?IJBRdYlf8OnwmBtxwEmiod5seVupHZHJy/SUx6m6buQ7vDNBvRmI+onEoc?=
 =?iso-8859-1?Q?2qs1QUzntA1Bf3rDlLxh5hgxTBcPtMXyGweieCqZYhkJO000Q0lnlldPsH?=
 =?iso-8859-1?Q?1uzbZWIvLxX2DGuU66S8lq9f+op3/HKMkC/4fMfYjlgPZurkmh2ctVlJTR?=
 =?iso-8859-1?Q?a23MqGHyapXeL5XjVN9cxJO+I/GkUh/sgafXusBdpUGfjhZcbN7q78wDcs?=
 =?iso-8859-1?Q?cuBBTefuPyuPzlIpWAfQHg2ujOOVRKe4vFY7L8jD1ImjZXc93bGdWleE5y?=
 =?iso-8859-1?Q?NzGIB2X8PcpPeknsnbUdVGoykCgSkd5ceM7bxUJqM2FOReh3ykQCsrJkmw?=
 =?iso-8859-1?Q?cf7C4GlivH/Q+6JvfhFwcBbr4NQkllMxzljEWgGJD2Amc5MIlKDcoGCRe/?=
 =?iso-8859-1?Q?0vn1uf7c5jKl1YCMW+pAtExzTWEgtU99Dhg1ktcJ46A/CVCdh9TJXKSDNH?=
 =?iso-8859-1?Q?lKxEQDS7qcy4XRDv1NVznTAPjRZMeB/Uk16/KDTXxjQPEqWLLG3bK5F4n/?=
 =?iso-8859-1?Q?k30GSm99dgCNHOx+UuypfnCcjH9MyrqDfvEvzGq7Lwo/qXMRYxNtEVJddv?=
 =?iso-8859-1?Q?FoMJ/nRhH9YaOzyCuK2hRs/aiL3x/rQRrVa/ipilh3MKOtYOoZIgShJ+22?=
 =?iso-8859-1?Q?rUYumC6J6xGOvKBELHKPvm/IJ+bW2nnNNOvU0cF0zHQgaprUKIM53yqSMg?=
 =?iso-8859-1?Q?adOWajyr+2yxH9qLpI76YLUJuAHbi3kpFBoqKJzjv1yI/dFMjqUAXUpQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aadcf4ec-9550-43e7-ab63-08dbf2d5cceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:05.0030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUN888k2aiTDk+PrJARDtnLVfiwHu932wFOQ4QlOF/+aaKfJfDJFV1NxyME7ZQRi+nqt33fNx95kfE7Xj09WGeDTdteWAjEki1uxXStkk5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: EhZ-FRdFIeSCDyhSlkw-nvwWhrmdKWxX
X-Proofpoint-ORIG-GUID: EhZ-FRdFIeSCDyhSlkw-nvwWhrmdKWxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=706 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

This function can be used when user wants to remove all rangeset
entries but do not want to destroy rangeset itself.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in v11:
 - Now the function only empties rangeset, without removing it from
   domain's list

Changes in v10:
 - New in v10. The function is used in "vpci/header: handle p2m range sets =
per BAR"
---
 xen/common/rangeset.c      | 16 ++++++++++++----
 xen/include/xen/rangeset.h |  3 ++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 0ccd53caac..d0c525cb50 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -448,11 +448,20 @@ struct rangeset *rangeset_new(
     return r;
 }
=20
-void rangeset_destroy(
-    struct rangeset *r)
+void rangeset_empty(struct rangeset *r)
 {
     struct range *x;
=20
+    if ( r =3D=3D NULL )
+        return;
+
+    while ( (x =3D first_range(r)) !=3D NULL )
+        destroy_range(r, x);
+}
+
+void rangeset_destroy(
+    struct rangeset *r)
+{
     if ( r =3D=3D NULL )
         return;
=20
@@ -463,8 +472,7 @@ void rangeset_destroy(
         spin_unlock(&r->domain->rangesets_lock);
     }
=20
-    while ( (x =3D first_range(r)) !=3D NULL )
-        destroy_range(r, x);
+    rangeset_empty(r);
=20
     xfree(r);
 }
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 87bd956962..62cb67b49b 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -56,7 +56,7 @@ void rangeset_limit(
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
=20
-/* Add/claim/remove/query a numeric range. */
+/* Add/claim/remove/query/empty a numeric range. */
 int __must_check rangeset_add_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int __must_check rangeset_claim_range(struct rangeset *r, unsigned long si=
ze,
@@ -70,6 +70,7 @@ bool __must_check rangeset_overlaps_range(
 int rangeset_report_ranges(
     struct rangeset *r, unsigned long s, unsigned long e,
     int (*cb)(unsigned long s, unsigned long e, void *data), void *ctxt);
+void rangeset_empty(struct rangeset *r);
=20
 /*
  * Note that the consume function can return an error value apart from
--=20
2.42.0

