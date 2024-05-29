Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B12C8D3FC3
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 22:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732374.1138353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCQ98-0007zI-Aj; Wed, 29 May 2024 20:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732374.1138353; Wed, 29 May 2024 20:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCQ98-0007xj-7h; Wed, 29 May 2024 20:43:42 +0000
Received: by outflank-mailman (input) for mailman id 732374;
 Wed, 29 May 2024 20:43:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yx1n=NA=epam.com=prvs=28793c6931=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1sCQ96-0007xd-9q
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 20:43:40 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 201b8e73-1dfc-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 22:43:38 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TG8Nd6029630;
 Wed, 29 May 2024 20:43:31 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ydbacyqww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 20:43:31 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GV1PR03MB8688.eurprd03.prod.outlook.com
 (2603:10a6:150:90::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Wed, 29 May
 2024 20:43:24 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.7633.001; Wed, 29 May 2024
 20:43:23 +0000
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
X-Inumbo-ID: 201b8e73-1dfc-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+vT4JwdRlt+IgaCvEerKJs4RbHA4YLqGLdQcFWsI/D9ZrqAkOi1s2wnpWlLw25Bv7MDWeBj1Ha1zTDYCv5QHqe5sQp4oG0fnDTpqcjxa3EGg+kUyG+vXfF9TvTt11kAXiQEN08SYVrJ88BGe8CW4F/EmHtmlaTkPaIYl5zZttfyisVEUKA/XSjbWUnCPNSU/uNvepJYWRYAxpsA+498elSSTTchU8TDaYFpdoveaaJfjCfxVlXQ8/SmjbFuxT2dpNMIcwVOgDZhatMCrdW2yYC+A1s8jJ5ENduIQQX9AIiipJ1alpNnMkCHaql9OI6cJmBhr/EGm019oVft3gOFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poiSLI/4mVXatWy9jxBVhfK1NYsiz2gi7xQ01hdZmZs=;
 b=LcffK7QhsLyCT48rYoYFt2Hro2GB99upE8AflUK25u97/jz3vwvknDyzRQZhpVAjnccwXd6zArTit8Wiv7P05KtH+/jdIJMP5gClCSCGdJjGh2Gzf5M0EWEIb5nbSEX8AtNz4AImQH/cxm6Zu+Qrp5SM9efruqNU+wD91G0/3Oho7L0Pqh3gvQxWht911G9UpKirevPPpCWu+mNRfcZ7M4lIge6dGUD6+8Imw8s24mTgDTBqCqDAocnCZKjD/7mKuym19VCnrcwK3mN4xZz19kAx4otxL3mCcz8UNXuXe/dqY0YsyDuewjpKPQgKG8zO9rqCz/nqu/zfdbWMe6K4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poiSLI/4mVXatWy9jxBVhfK1NYsiz2gi7xQ01hdZmZs=;
 b=P3fjA+z177sX2zwnSoHbGAypEmqwTKJrUr1hTREOnRMBXnSGb0DDd+m2pMj4hW5qAj3A8XcLvANC+UC74D6j343ERvOqDTUb879WG51vxhputHM+9TjVl69TwbdlQJwAC9LjRClhuHp6LLYwJZW8w7LS2Y5MzAPbuZcNczxknYbfTfPOqQjWKXm+dkv/nGG5FD4R+WRpzY74+GlrJhVUfpkhNCdnfGf35RNCb0PvLIpRxbAPvclpdAMxnJX8kH5UqRwGqDxxG5GdOkQP7JbtkDsHXvQrVQSiL6cXCNDaDeHYwm6q4Z5n7grnvUWwqFh6SkNkfwZo73OAHvoHmsnU1w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm: dom0less: add TEE support
Thread-Topic: [PATCH] arm: dom0less: add TEE support
Thread-Index: AQHasgjZKwS4pdCyJUe9LewXYMLHeA==
Date: Wed, 29 May 2024 20:43:23 +0000
Message-ID: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.45.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GV1PR03MB8688:EE_
x-ms-office365-filtering-correlation-id: faa4e910-2f81-4403-6bb7-08dc801ffbe6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?7h/KCmUP12knRe+R1IdPyAKKDh8UCArIMj/Vo5H8p+FCk+7FOO3pPAf4kV?=
 =?iso-8859-1?Q?Gp9aomIcAK0E0UOSX1ld/6hMk6u3jKMeAQ3FR3hQEBmgQJgfua2yrItMVX?=
 =?iso-8859-1?Q?00CNoGQdX+WvV+7utMTyvVORTyyA2T0amiCuw6ynU72hzsUy9WLMIZSSrk?=
 =?iso-8859-1?Q?W577ECtCWG6xiPW79MYrC+5/+WzSDaIcD7Y+A19isF3Tr8P1d4m/ss64tY?=
 =?iso-8859-1?Q?i1CAZQNtKU8GFSNh/MJzHLB7yGyXRMHYtNV+9+3eER/B1m2gKvnzUG3A0a?=
 =?iso-8859-1?Q?NOzeaBoxcP+a4hn8F6NKRx8op3ePTFmEfatyqVBKHFE9MsHjoeOZWXpKct?=
 =?iso-8859-1?Q?72qIXP5ICEEhqwutKXxEe2lYJ+vLsXzJPnNwsI3ZEdDhsHqRhrRQQsGBTH?=
 =?iso-8859-1?Q?3GQ0x4xPQwCVd29DzjCzULqM8/oRPxPbuxPrf1WtK2hefUcJNVb6wswHm4?=
 =?iso-8859-1?Q?hdsEHE9MIuglWIRYzj+aA/yu4HDU8QFJzEU9U43DVbyqzgKdMS04LpN50X?=
 =?iso-8859-1?Q?xR0RiZHMrTtnjdX1jVHBwFvb1eO9kh0mdn/gE7TSCq1V9BPHWQgltPHnmG?=
 =?iso-8859-1?Q?tP+k6UzrX4gkSeB3d0dTxjqBjpVUlOSADAKykm5hAGN4iiSkuhvUTC2fGK?=
 =?iso-8859-1?Q?mQ2pJ9A7vSE2N1zJBjVLXCy+NVwsJlzPVb+OTK0jaQHhPVzwLE9+kTFBQn?=
 =?iso-8859-1?Q?HKHeLMLQBBXPBcayi9Xs5OIrBVIcRR+Hkv3z+Yg137ohwrBRCKMcfISI6H?=
 =?iso-8859-1?Q?6J0uXXfssB5vUb/7Lb2gXqvzLlFPQ3TuxZ8dUlbtTIcPbS5HAMqDCZjPnQ?=
 =?iso-8859-1?Q?J5T9hUosBM4uZUdfDjFT2vTrI3h6uSEoHsiTOXT7jTn62lBYA4T6ba3LLF?=
 =?iso-8859-1?Q?R9Ou4vpBpCu1Q8Q0N1cXcQmVtDduZJ8ClF+DJriYFxD046Mk62KVpOd073?=
 =?iso-8859-1?Q?X+J9A3D4Aij9dJkrMn1xJJOdiM6jJk0GugOeGNUrX4RxWSsQW0aQow51KT?=
 =?iso-8859-1?Q?shXy/PCC4sac2zRc62e4MT7Qb0ZQw6F8mvHytYbW+mQWmhx9O4tWPKt27G?=
 =?iso-8859-1?Q?uABtOcJSzpw+7rkYmdY4e0sYN/qZCqfl9LMX0Dg0YBEAhSyNVb2N6MTZDI?=
 =?iso-8859-1?Q?ZkjIspa62vYa7xBcCmK4cgglNts4GAIOOMEf79TlnlKAB12aXkz8uayj0L?=
 =?iso-8859-1?Q?iltj3gq7i5uGOuFd6ssyaKeOAakTqH1+fdEZcQBWACkNQwDbCBuK3cAwgS?=
 =?iso-8859-1?Q?TpMWA4MORbEufNkp13pkX67fcZmBOy2BLYHcz4qd+Reuh4OJiN/15+MXMi?=
 =?iso-8859-1?Q?TkzxJI44dxlkVxiJF15rfO3Gt++f+Azq5De/aGFYAluszrTHkItlCRM0pb?=
 =?iso-8859-1?Q?59okONbZhIAOlyYMBwWbixr7ydxsWMaA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?DHlJ864yJLphoECHgqn/ki2/AsdElq5aaZ9JiQKFdGpsjECfa5s/BQP8Dh?=
 =?iso-8859-1?Q?9lgdegKXlW+cL+SHBC0J2P7aYy41198BhagaSr9wllaS0/do0/bVlQVyQK?=
 =?iso-8859-1?Q?oVswbzH6Z7JBsAVL2Ra3Xh9U6iC7DXOBr5Vaoiw1MeE4OJ53QoMaKYcC1f?=
 =?iso-8859-1?Q?vrdkz35sCWkuIVMJWLzv0b85et+e7FK+tnMWFmLa0vWxq5PVHFVhkvgMFB?=
 =?iso-8859-1?Q?BzwNilJbJ7/FuNcm7WMRzWGni96wX8lzeO5Q7OBUUyEXJOEcqauWqZ1X1k?=
 =?iso-8859-1?Q?Sexjy/l9q3Z4djy3ELcyRusxcjuKDAtlXyLYnf6OwN/KxRlXaqaBKuJpPH?=
 =?iso-8859-1?Q?I+RbDaXFr7jXQt5fdPwG0W8zwP1+hFviDRaPcsmJH8EJEybuLf4WQw2ELF?=
 =?iso-8859-1?Q?xf4SDvUcs7/oPXTpnzZq1PwaiBjPAt9P4Do8rj8B8Ug2pvqlVs3ccQuGkR?=
 =?iso-8859-1?Q?wmQltzxblvfFJ/XiTS9HVfxxubPMns5dFrdfVq1ZXz0bWgNzKJKCgjWII5?=
 =?iso-8859-1?Q?4BviHflKM6zspEa/C50aAc/vCsy8BNtePPy8N3sj8rgLux8Kuuz5TIacNk?=
 =?iso-8859-1?Q?Cu2gyhyhfSISUQx1H0Xvtyc4aax2pm11zu9yaOZ5eRDNDJ0KfwYRbma+ko?=
 =?iso-8859-1?Q?fPIIJOKsmDWyUtIfFGRIAmUrloQCmHKhR4xjQ+HIiudafDvu+oK+rpVNRA?=
 =?iso-8859-1?Q?DUih44JlKAFvdY3k5LijlUm/qjoBO+D+dUsVPlJwRRhBKvBz1M31IyLEwF?=
 =?iso-8859-1?Q?RpJ6YuknIUqqRwTN3KLN8dvLwep3QGngtVEFSY3/aGDAXEgTCnFvlilGYA?=
 =?iso-8859-1?Q?KprdMNqAv7VzbbiML7IcR0CWBG/y3OM91AkXpn0V1irk+sC4++l6w35Jt/?=
 =?iso-8859-1?Q?O3EZjOqCa/ys3qAl7oiqqvo6j+hCXjRd9PQ81GNC17Ykf+CDN6nkSlN6Om?=
 =?iso-8859-1?Q?+7AYMtxm5GYTPROLTvXUzyMzNEV012sg3TY9pl50kwCxU14lwFbt+KMpzc?=
 =?iso-8859-1?Q?ncXnJpmxPYcE+YE76zwJoc5VTxcwaENyicGd1dzA5jy/VgLgX+fikGEEE0?=
 =?iso-8859-1?Q?SbBWDkctcPwRN6djnNuL/zAnWCYLddoOKRmYGVHAtC0xD09dqk12AtOdmd?=
 =?iso-8859-1?Q?2RqMzL8UlruTAM/htXs/pbPfkNUDagaPQWCBmEBz6OkcqSLGXA8XnFcu9H?=
 =?iso-8859-1?Q?Xv2TJ+0JkjB1tqR+XGJW1T1IQ8pqzINs+qvphenok4DT5b/xw+NEGOuyE5?=
 =?iso-8859-1?Q?79IQPSrtmIyNzWmwl0fa+qtUdc6xIVvBBr3Sk0DsDeR1WC0bVWJ/tSGYH/?=
 =?iso-8859-1?Q?dVpPZPTamRhUtfumEq7xV/ssfAIvHxiX4GXbxxY4h6aDyIHO8sQaiEtNpQ?=
 =?iso-8859-1?Q?mhdQNwjF7iChQ085U3Pbs/cKNmnwFTLm7yZlxzKbX3Qr+MUwyHnr/f/utZ?=
 =?iso-8859-1?Q?JyUpVuK6bvOUYZsiVC92rNPV6HmkZQTv18xk8PEC/Egn75E8LSQA2v2vPi?=
 =?iso-8859-1?Q?UyLOZUkNq3xG9ihMO4DxXxYbPeCZF8X1GAe7tpywTPOESNYVwBpaWruus7?=
 =?iso-8859-1?Q?D50gZTNf6Oychcx7o2nIl6ro9ZDBGmQwG0JGUwFDvMjzDy/AXC955+hFbx?=
 =?iso-8859-1?Q?qJuHapmbbrTNWtU2nAHWtplI5Mv2D2TW3hsCX5K3Hm/kOIITqL1RxiXg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa4e910-2f81-4403-6bb7-08dc801ffbe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 20:43:23.7975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySONSQcVqxDddaS4mSobLiHxW987QJwLOwKvTY+RT01MwypE6DIxjsPs6Ys8NxpFdnxQbeoHwO8Zt3dlfRkvlc4sBl7H8jvWbJDA7nhhI6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8688
X-Proofpoint-GUID: a6KU1NCBuiD7i22QR48HX3VEhhig8Eac
X-Proofpoint-ORIG-GUID: a6KU1NCBuiD7i22QR48HX3VEhhig8Eac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290146

Allow to provide TEE type for a Dom0less guest via "xen,tee"
property. Create appropriate nodes in the guests' device tree and
initialize tee subsystem for it.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/dom0less-build.c     | 69 +++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/kernel.h |  3 ++
 2 files changed, 72 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd1..1ea3ecc45c 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -15,6 +15,7 @@
 #include <asm/domain_build.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
+#include <asm/tee/tee.h>
=20
 bool __init is_dom0less_mode(void)
 {
@@ -277,6 +278,42 @@ static int __init make_vpl011_uart_node(struct kernel_=
info *kinfo)
 }
 #endif
=20
+#ifdef CONFIG_OPTEE
+static int __init make_optee_node(struct kernel_info *kinfo)
+{
+    void *fdt =3D kinfo->fdt;
+    int res;
+
+    res =3D fdt_begin_node(fdt, "firmware");
+    if ( res )
+        return res;
+
+    res =3D fdt_begin_node(fdt, "optee");
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "linaro,optee-tz");
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "method", "hvc");
+    if ( res )
+        return res;
+
+    /* end of "optee" */
+    res =3D fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    /* end of "firmware" */
+    res =3D fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    return 0;
+}
+#endif
+
 /*
  * Scan device tree properties for passthrough specific information.
  * Returns < 0 on error
@@ -650,6 +687,15 @@ static int __init prepare_dtb_domU(struct domain *d, s=
truct kernel_info *kinfo)
     if ( ret )
         goto err;
=20
+#ifdef CONFIG_OPTEE
+    if ( kinfo->tee_type =3D=3D XEN_DOMCTL_CONFIG_TEE_OPTEE)
+    {
+        ret =3D make_optee_node(kinfo);
+        if ( ret )
+            goto err;
+    }
+#endif
+
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
@@ -743,6 +789,9 @@ static int __init construct_domU(struct domain *d,
 {
     struct kernel_info kinfo =3D {};
     const char *dom0less_enhanced;
+#ifdef CONFIG_TEE
+    const char *tee;
+#endif
     int rc;
     u64 mem;
     u32 p2m_mem_mb;
@@ -786,6 +835,18 @@ static int __init construct_domU(struct domain *d,
     else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
         kinfo.dom0less_feature =3D DOM0LESS_ENHANCED_NO_XS;
=20
+#ifdef CONFIG_TEE
+    rc =3D dt_property_read_string(node, "xen,tee", &tee);
+    if ( rc =3D=3D -EILSEQ ||
+         rc =3D=3D -ENODATA ||
+         (rc =3D=3D 0 && !strcmp(tee, "none")) )
+    {
+        if ( !hardware_domain )
+            kinfo.tee_type =3D XEN_DOMCTL_CONFIG_TEE_NONE;
+    }
+    else if ( rc =3D=3D 0 && !strcmp(tee, "optee") )
+        kinfo.tee_type =3D XEN_DOMCTL_CONFIG_TEE_OPTEE;
+#endif
     if ( vcpu_create(d, 0) =3D=3D NULL )
         return -ENOMEM;
=20
@@ -824,6 +885,14 @@ static int __init construct_domU(struct domain *d,
             return rc;
     }
=20
+#ifdef CONFIG_TEE
+    if ( kinfo.tee_type )
+    {
+        rc =3D tee_domain_init(d, kinfo.tee_type);
+        if ( rc < 0 )
+            return rc;
+    }
+#endif
     rc =3D prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
         return rc;
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/k=
ernel.h
index 0a23e86c2d..7e7b3f4d56 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -57,6 +57,9 @@ struct kernel_info {
     /* Enable pl011 emulation */
     bool vpl011;
=20
+    /* TEE type */
+    uint16_t tee_type;
+
     /* Enable/Disable PV drivers interfaces */
     uint16_t dom0less_feature;
=20
--=20
2.45.1

