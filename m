Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D51801997
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:41:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645878.1008434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0i-0007Zw-He; Sat, 02 Dec 2023 01:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645878.1008434; Sat, 02 Dec 2023 01:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9F0i-0007Wl-EG; Sat, 02 Dec 2023 01:41:36 +0000
Received: by outflank-mailman (input) for mailman id 645878;
 Sat, 02 Dec 2023 01:41:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9F0g-00072l-LZ
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:41:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebe81143-90b3-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:41:33 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B21Xj1F026535; Sat, 2 Dec 2023 01:41:28 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqt8mg21a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:41:28 +0000
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
X-Inumbo-ID: ebe81143-90b3-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEAmJw/RfgQlQetNGPXo4byxBirZelVMJD5WPeHgSFmJUwbhNzYy5i9cdd7y333i6TR7fB5xFPJPAvkM1jPqYR5YHa2iyNNTd9mcoDbs8QBO9lcV/O0TxMnt+THk7htiA+aJRr12XbdlOROacR4Qhjrf6wZoEAPrsdWuJ8o9XowXuc9YNI/mv3q8PP411fM0tl3fv207rGUJAW6CtjPBLNjmi5+jsqqis9wwX+TVvOFRwgOaz8gSVhdYYV/NCwqseqEYTmmp1ozhtWkxysdnsi+TeICxVJo8sCKXblgvp74/4DCzvXWRnaqlMm/PseJbNx6q+Xsap42b7UvG9J+A/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1n55VDPs3q/qzv0KviJW7OAskEpl6y9Jb0QmGMv7BY=;
 b=H14uBLZ9SV8COi0sLNJoH9JCpr2imtKK7egkdqVmpFf35Rxh+r5LlHDoQbfM61YSB2pOrEnhOZUKyc4kGWEIkvap2ImddRXuXfPjy2d/e2rZs2ccuoHFBnKxWe0a3FW5tEMgPhj+WDScFR1E0Ibr4n62c7WubZBkxGFlb3GNfS6rfPRIZIlznjdpNODp+KkvK4WYpG7orhpeONQZ+72QeY1oV4n2v+Ip4q6NBj8dzfm9qUosI9IcRQpq/4u7SFhKgQICxMN2tMZkMUdLQQ4rm2SdOTEmjLLB/sHhASvcF984IPEKl/cVMCMn+0jhPodBNMdcXXX11c3oSuO4eKLnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1n55VDPs3q/qzv0KviJW7OAskEpl6y9Jb0QmGMv7BY=;
 b=cCkpiFp+kXiGriRoI8mV6kMEJOnSJtDNVWy2iCabs7WeOdbpPOd2/mAAG2Q5U1dD+Ta9bTEQcj53B0ijvxqCNzn3PviFqluGOAdV/z2KTrJ9zDURaIEdOk/Q1+xP2XZG/uoR1MJ0T5pzKOdidB5+t8oyzwQny7kt0L57fGpVUh4Be/N9j0C/EBCZeBTLnazDXzQyid3SvNh7DPp9iCzepSdpI70tQPqFiMPZHbGmzEzu3wWTtNLMeh9+bLT/6S0yJ8efWxy2A8Zb5P2kkFnp+YJ1ySLYmFvIEvV2VPH9R0xCQdf7gg0t96VJcTvm/9YRUG/kMJIPkNmb2OLVJ1lCEA==
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
        Hanna Reitz <hreitz@redhat.com>, Jason Wang
	<jasowang@redhat.com>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>,
        "open list:Block layer core"
	<qemu-block@nongnu.org>
Subject: [PATCH v4 2/6] xen: backends: don't overwrite XenStore nodes created
 by toolstack
Thread-Topic: [PATCH v4 2/6] xen: backends: don't overwrite XenStore nodes
 created by toolstack
Thread-Index: AQHaJMCnWt9mOmaDRU+ewbw5BkugTg==
Date: Sat, 2 Dec 2023 01:41:21 +0000
Message-ID: <20231202014108.2017803-3-volodymyr_babchuk@epam.com>
References: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7285:EE_
x-ms-office365-filtering-correlation-id: 2d1ede76-dd9d-4e19-7f6d-08dbf2d7c9c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MMThguZxYyc2qA1XGKMz68EIW9kBjMLwXgX1YRmjswg5MpXuBZMFqz4530j4qTmvGfEzf4QpvDgn/ZGqW2ETHypnn2BcQho5f1rD3ECd795v8+XuB7jrOAmJxPkooUBrMKz7qHqpk8g0N5x+cAZJz0+BmnFMg2y+/kbMU8AR/IqKs34JbBTlCZ0McssgU2gp10rCPLkn6EehBP9CjJKxXwde8qG22pBVtINOaTOi+WaaRY71TYSs5O0Fhf4iWbWRCw7dPk00VHowuHpQv+3ax1C8lpSAZ/2ejsn/iv+RKYuip/Nn3rTqT9Zwp44W8fJXH2Q1lvxcBjJ1feEQtENMU7i506AbhuIxBqV4s6Sw2bfLNg0YUwF1WLQK9+4GHrE/bp8/AzonGKIy8ymzvoFP71cAQorIg2P3MueX5DaMWeiUiYlBBesRcDCzfOLBIAC/TynUCvHuc20pw69qwkEd3u7RD2lzskg1zaP1YnMCKkgnrZUqOceiJnOCYcIqUc17xJDvtGLD2TQLB/FsjdqeVb/EXJHXw5ZHmj5pvzniU6sKsg0p/R6kXA0HffwGtitOX40aPKkAGWMZNfUuSD9+45NWMDCfTIyjRGTKLXffsTU3bqhPFSeLuXr1mduZOgma
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(38070700009)(41300700001)(2906002)(7416002)(5660300002)(83380400001)(71200400001)(55236004)(38100700002)(6506007)(6512007)(1076003)(2616005)(26005)(66556008)(478600001)(91956017)(6486002)(36756003)(76116006)(66946007)(64756008)(66446008)(8936002)(6916009)(54906003)(86362001)(66476007)(4326008)(316002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?51HpuABsT+tbpDbgqyY9AbOxSV3pOA+yo7ZIgcKPxX3+Yl3xlM+Vbh+7BR?=
 =?iso-8859-1?Q?XYv4jUYUkebgveC2lO21EB41Jr5YTve61LB+pxcCCSlhdMzGf0aQsoEhDF?=
 =?iso-8859-1?Q?FvJOxUkVM4EsfgSN2fMJPybvwzn2GsQtC8E8uyDiR/lHutVXVqDrAMQSfe?=
 =?iso-8859-1?Q?xQ6WzSOv5NUj7lOtIX6cr5JEkkzXHYyOnpjQ92ux7FEYPBvNXmBR6cBAMF?=
 =?iso-8859-1?Q?nnfV5wBs4jLtyahgH8ko1lx1oXHMxyPDd4Q5FxwqrU3MkzlxkhN8jU6htt?=
 =?iso-8859-1?Q?cF4GlEdWrRiEr41xMrYETpOC3MQnnx+ikNPlTKTDOU2tU3HQZihVIJOLSD?=
 =?iso-8859-1?Q?6nXP0FoNwiYu7KxOlR+Lik4T4bbnbPWrOrOCrCQl4VQp+76Y0bjO5maDB6?=
 =?iso-8859-1?Q?vNFd2ypi4InVFYGWifRbN3gwvh0JzhlUsbRIewwvVqFmAtKaDjhsHu8E8Y?=
 =?iso-8859-1?Q?839dLGyN4unOoUouWTUVFiwX8q1l5nCcyF6PdQ3lW8tbV3WUgVwWCDyR+f?=
 =?iso-8859-1?Q?rVmPzX9cPBop8WyTrH32xdcPnfTodRDQDt06Thpl9S3WV3sO20J83XhRNU?=
 =?iso-8859-1?Q?QKVLwujHjgxg2aNQ2cy2fB7vzVRkLIqBOahgE8r/AC/CTHI4aYFMcY5302?=
 =?iso-8859-1?Q?EGxV0F4AsBKz08TKx/NQXmEWS59XgX6QhJAAO+dD8x8MaV7g2vZ53JvSbX?=
 =?iso-8859-1?Q?X4xtl/j8W0mAm8RkmUJACAAJHT04dQEGNtE1b6NGZCnpST6oAfz1Y5DUU7?=
 =?iso-8859-1?Q?L8SpGkOpH3RXieHaLIdSF1rTeBeo4VlGNaUGFad9GfReksU4P4JkBrFPxT?=
 =?iso-8859-1?Q?2Le1rzzGswcfJNsOblU4GNuwa3f9RMQ5ztY3zGp33xfBTQQ0KiTA6PCELu?=
 =?iso-8859-1?Q?OJDn7a3QfEg90voMtLBRCy7fAvcUpCuVoBu3OuqAHVoqFYHd6kw0htoH3W?=
 =?iso-8859-1?Q?cziwFFfg2Bg07YlqkX6oaeiA/jbH0ism9ogZpHAxQeaeorK9OnE32CXUsB?=
 =?iso-8859-1?Q?WAh6dcgySAahJ3ujvVhQybOQk6iW4Fa7Or0uhIT3QJAxOKyM6N9/jEl9dO?=
 =?iso-8859-1?Q?YyQ03bLk1pqACIgT2hMA+547J22FgmGpC2850M4guwbP30lXN1vcPgRagH?=
 =?iso-8859-1?Q?cgmsEwuc1L8GY+vzkGHkOpf9fb5XI2+RHoZkjJFKZlvqZ+b9OgoeAby4K0?=
 =?iso-8859-1?Q?iSRqWyCRfNwh9lyypwXwYPlrlCgYj3UGiWr9grCTXgkUqCrPVn6PI/aNBI?=
 =?iso-8859-1?Q?oq1Qr+29RfYBqfbGw52YqTcSrisxnbTHA0GC+dcm43bXVQHX9XsYjF9GLY?=
 =?iso-8859-1?Q?9NIJR1LWsiWZ/D7O733mnUp9qnPf7kAI7acAK/adUOXXdZw6mBQvV+mqjg?=
 =?iso-8859-1?Q?qzZDdYAVujc4yoyHUDacRewipRBz9hblr8xMtH9nFYmxQ6TKLd7YvfjBHv?=
 =?iso-8859-1?Q?wVTqXVVgCTH+KIlFa8dxkourpkmKKQqKVjFwk/8AAysb2uMFyOe7VrpyHk?=
 =?iso-8859-1?Q?bCIpSg8dCkcA9vsk3URnSn0wxZUee/zfXd7ZzLur08dAkA4+Qh9MUNB1IL?=
 =?iso-8859-1?Q?Zydfq0x1+ubuKDbWQwEir4+KU6Iqn8TfrkdnaJNUkgFcngs8RbnkvuzvUs?=
 =?iso-8859-1?Q?1yfrMF32EWwJ1zCgl8cFKuCRt6o7rbYfq1HT/UCYDEQnyqvAlYBq3aCg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1ede76-dd9d-4e19-7f6d-08dbf2d7c9c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:41:21.8562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMQRk7WlMAfSNsVqy3636sGywGbOhKOh16PGYpKJeoRjC0y1+tJpdgxeO5Gr7PVYuecS2oLks5jbrBk0WCeJBQlTiBHDGHyfDKTPiZzLWgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7285
X-Proofpoint-ORIG-GUID: vAFYO3NAXhPymQwhKxackEVEJwcDayWJ
X-Proofpoint-GUID: vAFYO3NAXhPymQwhKxackEVEJwcDayWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020009

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
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

---

Changes in v4:
  - don't touch "tty" entry in the console backend

Changes in v3:
 - Rephrased the commit message
---
 hw/block/xen-block.c | 16 +++++++++-------
 hw/net/xen_nic.c     | 18 ++++++++++--------
 hw/xen/xen-bus.c     | 14 +++++++++-----
 3 files changed, 28 insertions(+), 20 deletions(-)

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

