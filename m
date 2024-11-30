Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7969DEDF5
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 02:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846084.1261340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0B-00046r-4W; Sat, 30 Nov 2024 01:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846084.1261340; Sat, 30 Nov 2024 01:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0B-00044b-1H; Sat, 30 Nov 2024 01:10:27 +0000
Received: by outflank-mailman (input) for mailman id 846084;
 Sat, 30 Nov 2024 01:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1+J=SZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tHC08-00044C-L7
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 01:10:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2613::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd7de69-aeb7-11ef-a0cf-8be0dac302b0;
 Sat, 30 Nov 2024 02:10:20 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7694.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Sat, 30 Nov
 2024 01:10:16 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Sat, 30 Nov 2024
 01:10:16 +0000
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
X-Inumbo-ID: ddd7de69-aeb7-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjJkIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRkZDdkZTY5LWFlYjctMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyOTI5MDIwLjE2NjI2NCwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YD6G+C/NAtQfb76QIil7fgi1+OeLZ2dFPNIeK8s/qjVKpwlDEJ+z59GTFBbwk70/qOtjpMJpxYBq9IqzxU0iozZwEjdxIt+uiscNjOYq/TmAq3xc9b3Zma+q0MsFie7IMKde2LrJHtl69YRSXGsH6S6ioWHwnM/aC+0zZFqz5LvGvCNYvJG3hRtNIlNElBaYiEKiCCy8lKccEt2YaDygqGd93vFN5inleyTng96BpIByWR5uqLuAsLoQRUGBvrrGHkeTLlVZEebzWRvIa7um6h6CxOaD+jy1FphN5TaNhpcHPmg1vXhYAHiCLUrik3EmsBtvOjGVxM0PE9305rEVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pw3TVcYG2GcL6D1CgReR7ofWSiP1ku/xjJnw0Bx6q3Y=;
 b=yKm80CawYha+Q03if7wH3BGEIMHNSk0+y3j7RWXELF31T5p9WhhoPFFPJnlC+Jp5iQSZsmgEgKvt7+3qzziJUu+hyCpv9JmFrIT7KaI4BHfG/Tsg8KaQJxOLVcFB1+R/v4DFTLkDHiSZXmiXGZtfU8G6d0dkDMkYKYiQ2OzkBHShlPXJsBN8N7WoBbZeAcXojeS+R5jZk47GA+R0GGUPqIrcEooovZsIbf4ltx6k8SHzGFdBUWiYZ66ALtKneiTwQkAexLqYfYGEGSzzxxjF4YKvj75HSZfr9eDETfh/Uey4LmF1u3XrAaACw/NYJw6oMPXu6VJ5dUuUmP+LDotT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pw3TVcYG2GcL6D1CgReR7ofWSiP1ku/xjJnw0Bx6q3Y=;
 b=CU72Nx7odxJenceCY73QrfDYf2dCXoR4bauUQWnvOtNKe0KDdzME86NZ8Os4bnZKpz3VU8ZP8M+6FfXXp2ngrWwoclp9cXVM3fRWovGunaM8ko9qXhmufJkT+Sz8soFIMY4ojLsGCK96zypZU+pbZTP7AQmUNr+S9JdEgW40Lmrc9TjIZ5CEoAHRg6lHQsQBAZSfxGqaXVU/yaFuOLTaHmJJaIja/QZmQdFzt7uCgCVBhw6uTeM7YIffhT/FrVudSVgy5lJjLaKXgW1uhZ4iUn9RqobrgMKdsPGDFl11vzbhCQCVvu2898FAh2NyHBNbuGQMH3KCvrXviaHtjQ/lxA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Topic: [PATCH v2 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Index: AQHbQsSdhsEy1dPVQEOcqGdxy6Xe0A==
Date: Sat, 30 Nov 2024 01:10:15 +0000
Message-ID: <20241130010954.36057-2-volodymyr_babchuk@epam.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7694:EE_
x-ms-office365-filtering-correlation-id: 51db0109-5a26-494f-f614-08dd10dbc00e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lmqJT3QWeZaE3+mnJwgGFCwW3Ll1zDnaf/AAGeXYiR79PUuNkaoKILBICr?=
 =?iso-8859-1?Q?NKsHk6LJv/unBQ2b+e7LCMTXBOYpDU75YnPBxSv9FpjIugcHp/3mQuMjl1?=
 =?iso-8859-1?Q?IQtpUcP871eKmxksYPERVKhhLY1Ma/7v3G+Vph768PSOULQ7FRAPbednxA?=
 =?iso-8859-1?Q?WqTcroCea9829YAeIQG4FP+HZ0g4rYWFB1EMpt9lu+jeoEwNcAVJRu+jxT?=
 =?iso-8859-1?Q?Am6jKBVq7vZA8jYZ7FK9vBLswO0zdBhqi4+NL7oxk6GzBmHtZRmkQIL8oE?=
 =?iso-8859-1?Q?qjAuNdqfIxdWLShlnLG7l8ztorcJg/bze2BriIFi5QkS3LvN79pB1wG7Ic?=
 =?iso-8859-1?Q?gDrt3tsCucgi7FPq5AOUY7WQ4PNxTCMmtDZjTHl8vX3ijg8qRhaZBObfRo?=
 =?iso-8859-1?Q?mXWAPfQj5P4krt4V5fwPE3q59/fkIcQk/X2b6rqzhzDeZe84FLpiO+WSHG?=
 =?iso-8859-1?Q?zhqTPY6lYSZ9LElPlA1BPRWln3myBDhxaQrnZYbL7AftvwbvgKE8rHAOaJ?=
 =?iso-8859-1?Q?aj7N9QRId47vTCZ8fxmhjekmCbiyg5UyDWmilwJNiEavCEAPDuABd8aehn?=
 =?iso-8859-1?Q?GZTAokldLeKvkt1Xq8MZ/QZYbEmwq1xv5gCTQlmsFBhFWvDp+Dlc5UeakR?=
 =?iso-8859-1?Q?/CD8o6bVpsB87POrW+WCosF274GgxCv/I7jgljzqkvLKcz/+maXhgzXHLq?=
 =?iso-8859-1?Q?I5HLRWFuZvyE7sa7igiSWMSyDwIOMRQqLV/M1wWQPknZtZxaAWpRxQvJIh?=
 =?iso-8859-1?Q?nj5SC1fJ5wQmONJoH7oS0PRcytiJ0jhNPWHGPcnmb8ITT6FQNIY4wLhpOJ?=
 =?iso-8859-1?Q?evUHKcINywEUNbHthxtVV6+aD97XzIX/021rZgdMe5bdqCP6IHwIOc0vIJ?=
 =?iso-8859-1?Q?3fRT+MRfGJr1eWz9iEAt2KwCn094vc4mP9Xg9Gbh0mk0iKbcGOJcevs+bb?=
 =?iso-8859-1?Q?ebypVlZOvsxWja4kL7AzRZshIaqdA6ZNHGoNH7iC5w2atJR71K4KLwRdgU?=
 =?iso-8859-1?Q?z/4oJHMgs9Y83SxUNj/ABup7aEUPG+bQhULcB/OQ8kHNwXkMx8cSvEomML?=
 =?iso-8859-1?Q?WT5QB7v82k4Jxx5iW84gl/aGeMMvwTTcmAenYLUzWHUW2v2wevbNIZDf3M?=
 =?iso-8859-1?Q?WAEqJ0y8XI5pneMkrzHXuS/tzfRdoAUVSStkvZX0Dxu4zw4SwxtNOQ608L?=
 =?iso-8859-1?Q?4N9tWK5Pky/SyHWCfhrFoVN9IeQ6dMEHAMAIBe9mGafRofSCWZM63gDCrT?=
 =?iso-8859-1?Q?ztzP/c9R+txqUQjIeuf9wYa7mTyiH7suVsG2v/B9eouJidDHIlhloLXlL4?=
 =?iso-8859-1?Q?IoIdY5AXkqpZB3O84cf3xjOmDrkee+HkCi0g1eofKeXphZteQ0RJ3BCV9Q?=
 =?iso-8859-1?Q?e63p2j9LpMQRuFbw6WluVq8vk9Vy+F+rZWbEq7sWY0lec5INozVfk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?enqKTeIn8BbI8MWRMxjxuSvVk4hnW9URqH8eNqB0yMqojgjfAxrFW6QWyP?=
 =?iso-8859-1?Q?rDxXZr50zHnY8xzPv0yWnSoBS0u2gr1QVuYNp5hNjOEPAsvbushiXy7w5J?=
 =?iso-8859-1?Q?WC4CBF/pcyvgGri0280f8xz/GgL4GrV28lzoZOCaRVo4NNijzbEm/0iTPn?=
 =?iso-8859-1?Q?1h7mQzr8T31MUYV4LWlZEefH5vRwFHRk28be0/vtRFXWwoE2r62/3b26vY?=
 =?iso-8859-1?Q?3cD5FxR3RK6dGIFJ6AHtMmS44aLgEzcECCPzAQGRRMNr7/NEnJctA0ETKK?=
 =?iso-8859-1?Q?pK2qRr6JJPULr7Dn/SpgfKk84HeONsqHOX6S+T0Gw2DbaOcUsplSFHyhN8?=
 =?iso-8859-1?Q?TQBW46dO8o2IXv60IpM5nl4NXI2gLCYG/ZL98eSZpgek4Ka7fCVriZSz0H?=
 =?iso-8859-1?Q?xQWEmQXR45tE+FHWjo2iBKv/pPKcVK/T5dAWSSN35E4f4NY2Au1rZLAWnz?=
 =?iso-8859-1?Q?yUUe7psgRbO9VyM5uySdVwIJ2GwYq6QV3OmnuYDP6KCjatae9AqaEU7C89?=
 =?iso-8859-1?Q?xJ5Yo/mLy/e7QyDvfsdre2UNRbh4n3UveF/7tWUgUTY4buQrVpgeuRcbSA?=
 =?iso-8859-1?Q?6DtQ9vWZ0WHvIZ/90A7BElCbR945h9yhqj7gjg2iB3kVIJVJcCpNPqFLJl?=
 =?iso-8859-1?Q?a4LbEJOOdmJjWhy95jfC8hSuATL6KXvtTyBFP+6sl5EJuTdd1pmhk1vl8D?=
 =?iso-8859-1?Q?dD2N8oc3mQTW2jLtwT3b490HziPgZ52Lg41wvDfcV//K+ibffgW//Lifaq?=
 =?iso-8859-1?Q?BrOOLMvoDHYgBLYJGqxHIykYK+K3J9NFB8MA6r3pZppsJFLuYEvN/Fp3WB?=
 =?iso-8859-1?Q?r+hDiQ7ZnioC7celv1GsWcf94BJOJfa3Gzf1mfFVdWeT+Oj9PBFgm/fUSh?=
 =?iso-8859-1?Q?E6ZEk3nBJn20XeDnljkSP/h1nfABdl2v22MYRXhHXOJO9nwnC8fn2VhQ2Q?=
 =?iso-8859-1?Q?rVIdE6li1OiTd+cPua+JNNzbs9U+ZkFiduRgNsJ1ZA3mfcJ01PHWqp+4bF?=
 =?iso-8859-1?Q?BHobtarGNV/lQ5/DEjISOyWZKd2oJQREYT7WnvzT8+3b3HCivf6zakH8c9?=
 =?iso-8859-1?Q?7GxmrSlCjLQYgPDPSl287p5GQzdKFAw+72z/gvYGZAelKBfv+kclZ88gLX?=
 =?iso-8859-1?Q?rlYITUEqXVKpZIliOr4purIWkbiqrklKASeMOKwAnrUTOyJ9CpWtxZ7INt?=
 =?iso-8859-1?Q?vk/QmxlpFqszs78xtcWNGMle7c3cYvcX1Ytl28XLg5AhAJqQuPmpLfbntk?=
 =?iso-8859-1?Q?DBdcYTpeXN44HCxr4rJiLXcgvMWXQuyNi+a+dPdL2NQDUCXMUfC4ZxzfLU?=
 =?iso-8859-1?Q?QYtSW6+xs2dhC+7Sj9MohcMtAbAvAWkT6weMuv+fUQ4k/uwQyEUh1vH7Q2?=
 =?iso-8859-1?Q?xvhb+/o6MbFNLj4YIw+4H9OjXUhK9BM/fjHEQnQWQtrcFnlN5gr8SRyzWa?=
 =?iso-8859-1?Q?cg1W1U3xry69hZq9Gg3mtgYDHMu54rxvd63mlJkqORRgAJ35U6fBQfdfuN?=
 =?iso-8859-1?Q?FFAJMUsonQs8zW1mxIbUp+1Zugycko3eziBSNloxEFn8ekmPNUGr+9YHJi?=
 =?iso-8859-1?Q?LIL1Ed/bpyRLTEGI6DkaPo/RWQ+Vd0+38MW+LE33sA7upce+aUgaoL5dWA?=
 =?iso-8859-1?Q?5fHOtrDdr8Jha24okz2ZFdxGcvEHH0BsfUS8LqdK+KR3hdstFt2tXq6A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51db0109-5a26-494f-f614-08dd10dbc00e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2024 01:10:15.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2ZsS24ljqzCiqJlCABDUIPp02lkpOw7RuTvaCIdLGmvs1HHMoDfHhsbZvgrygiCPTBgnvavylWX7dUaRmI745llHOo5mkOfBm2WcX9dPsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7694

This patch is preparation for making stack protector
configurable. First step is to remove -fno-stack-protector flag from
EMBEDDED_EXTRA_CFLAGS so separate projects (Hypervisor in this case)
can enable/disable this feature by themselves.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v2:
 - New in v2
---
 Config.mk                            | 2 +-
 stubdom/Makefile                     | 2 ++
 tools/firmware/Rules.mk              | 2 ++
 tools/tests/x86_emulator/testcase.mk | 2 ++
 xen/Makefile                         | 2 ++
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index fa0414055b..c9fef4659f 100644
--- a/Config.mk
+++ b/Config.mk
@@ -190,7 +190,7 @@ endif
 APPEND_LDFLAGS +=3D $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES), -I$(i))
=20
-EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector
+EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie
 EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-tables
=20
 XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2a81af28a1..41424f6aca 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -54,6 +54,8 @@ TARGET_CFLAGS +=3D $(CFLAGS)
 TARGET_CPPFLAGS +=3D $(CPPFLAGS)
 $(call cc-options-add,TARGET_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
+$(call cc-option-add,TARGET_CFLAGS,CC,-fno-stack-protector)
+
 # Do not use host headers and libs
 GCC_INSTALL =3D $(shell LANG=3DC gcc -print-search-dirs | sed -n -e 's/ins=
tall: \(.*\)/\1/p')
 TARGET_CPPFLAGS +=3D -U __linux__ -U __FreeBSD__ -U __sun__
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index d3482c9ec4..b3f29556b7 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -15,6 +15,8 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=3Dnone)
=20
+$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
+
 # Do not add the .note.gnu.property section to any of the firmware objects=
: it
 # breaks the rombios binary and is not useful for firmware anyway.
 $(call cc-option-add,CFLAGS,CC,-Wa$$(comma)-mx86-used-note=3Dno)
diff --git a/tools/tests/x86_emulator/testcase.mk b/tools/tests/x86_emulato=
r/testcase.mk
index fc95e24589..49a7a8dee9 100644
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -4,6 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
+$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
+
 CFLAGS +=3D -fno-builtin -g0 $($(TESTCASE)-cflags)
=20
 LDFLAGS_DIRECT +=3D $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2=
>&1 && echo --no-warn-rwx-segments)
diff --git a/xen/Makefile b/xen/Makefile
index 2e1a925c84..34ed8c0fc7 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -432,6 +432,8 @@ else
 CFLAGS_UBSAN :=3D
 endif
=20
+CFLAGS +=3D -fno-stack-protector
+
 ifeq ($(CONFIG_LTO),y)
 CFLAGS +=3D -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) +=3D -plugin LLVMgold.so
--=20
2.47.1

