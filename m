Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA145A7F9D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395688.635553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR8-0004U7-FM; Wed, 31 Aug 2022 14:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395688.635553; Wed, 31 Aug 2022 14:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR8-0004L5-59; Wed, 31 Aug 2022 14:11:22 +0000
Received: by outflank-mailman (input) for mailman id 395688;
 Wed, 31 Aug 2022 14:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOR5-0002bv-Vb
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:20 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7fdaa66-2936-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 16:11:18 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBo4GA032537;
 Wed, 31 Aug 2022 14:11:05 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ja427h4rd-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:05 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:10:59 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:10:59 +0000
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
X-Inumbo-ID: c7fdaa66-2936-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJGXXIDHoHiJtLrVaEAuqTYW+gejAS7XKvxe4xb4XAqEVKvEji2TnqMCChDZ9CtjME+d7JYJd92U1Jj/RMvPnNgwwrNbYVFVXmGZMZtUPFBwTsuP1BN5DDMHHf3X18kU/5mkl7BINV31ycs+ZJp5Hq3LnTb28aMLi8ZO88R2Yoywa17in5+ik3FEJjM/h2iztgfnAWhMc8Yo/RypRVqreccNz02NwyYeB7aJHDREo5Kwvm/1ggYizVwRxLtLjd2zhjEhmAhnXjX8zrLbqFNUye9G1+YyshAsiMebw18Oa9cKXoaYK0diX9mIoWm/5hov2K7tRJ8lHCkkVrg2a35+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pxAUO1JX4YrzbhZ2dXAYA6LnDaQYu3aeZFrK4TB2Vg=;
 b=TICh7n6uPBfXv7fpBpV0XOmjOyeUtb78AvszL1B7DMr/jo2bKQ1hYUOIvOxn6MiCuBze9IvERmjual8fcP7EdAouF7emC8XeN2KWaxI9HF+57UxQi4nJiOICTDoiGyM3Bj6AaabikYVwSyT97wnIvFuibXxRJ8FZV6CMoVC0THpX+V5JL3A8qztM83NAPdQd2B5KcZpJPzCcMDUMDlvoxmU9Md5wQgwVKOyKLiTaMz4X5uNtDZKju8LJCWWkckvieYbR+gpVvqMCpc0fqfXS9BJw7SobfkMWq2UH+7waD5KZ6Il/OktsjyLvZkjbRXbG0NaO9i3zPdN/uzspxAMGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pxAUO1JX4YrzbhZ2dXAYA6LnDaQYu3aeZFrK4TB2Vg=;
 b=qN9ThUOfAA+oiD/3+m1wXl9T8rEXWVcrzJ37eMsQ/7E0G1xA2/MwlRaqOCWlo38nbHqz+LGDdx6FQFTM3CtHKyhVYUh/5zWzWdqRfY0Fnw82fCVcKxiG/Ux67xIqYBL1gLDwBafvL4kpA3SdaE2dur9miCGh0NpgzG/ke3615RyjVORi5DKzlvE1eIdoFj81p0QDPpmUK058YpQ4YAkgXf/MMHhxrN/+IPvrVvlNxodh6xO2ccjmaLAqNJAK0xiPBpJboI7bI9lJbz3789W+Nj7TNe9sqGTaeJwaSRxetb8pWoDKzsc0AEPomc3gprAutI4gdb9O3ry0DbubY4a3Rw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [RFC PATCH 04/10] xen: add reference counter support
Thread-Topic: [RFC PATCH 04/10] xen: add reference counter support
Thread-Index: AQHYvUN+XE3jlJIvEkq5uMVpvnNlQg==
Date: Wed, 31 Aug 2022 14:10:59 +0000
Message-ID: <20220831141040.13231-5-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 207dc193-9511-4eee-7f4f-08da8b5aa174
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lZNtxyrqOPkLQ8r7eYqum6dQcE3DuT6ECw//MIdMjJj0uN3zDNicZbEBcQatX4xk4prXXRsYwbq3iwgigB9X4imYllMYCCON6aFUHKxzk25CViqO+aYSFJwW9AFih/eSIr6dy/aeAeZv4htd39pLEHQsGrap4g2NuNoycWO5sIfZPvCHyyoGhoxtXvuveeF87ccM2adKSk9o/67t7N4TsL3tSFZPqeWZwG0sLsycpl4VAi8R2B6nEuMIFyOxuawQYMoTZxTLF+CDKzSoHJPPC3M4VhVjekbI0uvBzW+jj7wviAq9VnuSExbPHoAq/Sh+jrt6+LtaiQ5FdwQMUwC94IP3tid8eJfmqzyDPsmv6Mn8L30Go7xEFlXQQR0cHWCh/O1AI7yDrAWP3RM1HFObtYo6r9zHvAgvv7kAfoRL/iDon8BOhMsGXnsMWBaJ8+IC1zqBQpxwBVqBmE/hcpTvPji/0vVUHc10KRxv0NClgXzw3AwrGLUo2nrkEbfpDP2W/JTAL8+2pNjEdlJFAwy6lISpNbiBzGRqKQMUr4t5NteDy83UogzZQ6DbShfzvl+FOJWsICnXIBLRZGe7X4OnVgUCzBAm9sfN8iDjzHwE0Rv5SLegcEytgtBmIpBtOmRvMGFfGj3XuQSsJ5tOePpnpwlR/o/TB3mViHaXeSTbtFH498gyenAiNrDaUVO30fUW32+RYcoQ/Y8IO3J2LQMj0vqCxpq9jHDp1UPJfDA2BBxfFbI//G227he46hWluez2s4ubTrQHTWAs0lteS3QKEA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(8936002)(316002)(36756003)(6916009)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?PZ8FHTdjg5HkxzBbuxp7GUTZPF5vCVSgmE9ue9TGO+ePw2diWX5hG6Wzvs?=
 =?iso-8859-1?Q?SxNt71Ey5EZZOINxnwyo6EeXNwu2LMvQ+OBjhCpfIvfUQ5tG4+5g7y6bco?=
 =?iso-8859-1?Q?ToF/VdtBHjMXqxRAJhs26YtqSlsizK0iy32t7zNsiO0bsQPZMPwJWYpldt?=
 =?iso-8859-1?Q?DvNOQpPQoXr2tP0nTWFlPiz10hq7d7NvwAOU6JYTwajwq67xdHcY49cShp?=
 =?iso-8859-1?Q?+ErhWf0Bm8ful0hLw+MHJjzketLZkfZrS6DM+p5E/rGO6whELz6PKhaYMD?=
 =?iso-8859-1?Q?GyRXuPmXj+pZDX5dYXGmZ5NRod2ZxGQqWxyK0l3tVGWuB07kDMNd6e9U8/?=
 =?iso-8859-1?Q?X7V3SeVbO404pyA1EsvGzm8/IkAxnB/iQYzJEQuT7xFEMbgu8NmKkruHyn?=
 =?iso-8859-1?Q?ON8fI61yyKKRn9QSsNFL33Hsf37We/vp/A8Qojp4pw6z/ZgiMi1ad4E4Wr?=
 =?iso-8859-1?Q?cADAJZ72PacQUSqMPt09sSRUUwa7HDxnMWhloYWuTgn2YvEDej7zymjQg6?=
 =?iso-8859-1?Q?wMmlpIjRfk4l6EFXNcRfZALz/cLxB8R1IBj3Dzi13iFHkFjoAgNIy8oiAN?=
 =?iso-8859-1?Q?PW0RPrP+lIL1Srs9cvFP+Fr+2mf1Yr2K7UdiIOM3blUVBIkG0ad+WL5I6d?=
 =?iso-8859-1?Q?kI3H/ya1PFwhRUNd8w8rE0cPbd6s57z3l0EbCv//057l9+4ns819RL1KE9?=
 =?iso-8859-1?Q?ga2aZ8yv7hFRAdLY8WnSX5CEON4gh+XSWqfKp0XjiuANahH1NQHf+nhkq4?=
 =?iso-8859-1?Q?2hOKGbqG2xr46b+0KnSCPtku2Y6fJ94WB+6th4CsuINiQSzEfZtuNNuKVD?=
 =?iso-8859-1?Q?k9/4d0EEUjGWtSF/FP5E1PrIs6tCB27USO5VxKSvsmzhkPuI/gqisjobpo?=
 =?iso-8859-1?Q?sxst/1AxSrdCGN4fh/syaWjSW8pslcF0BlRW+OL9s5Lkht767f0bq3lQBf?=
 =?iso-8859-1?Q?a/H6APwFnOlOfrqS9lPspreFM4BQ0vF9mG0P0i/daQxjISlSW8dALSn84t?=
 =?iso-8859-1?Q?K7ZW4+An2elfHhbQ7ULNoIZrKVzFL8FkJXF/zyfBIB45FM6PuD+7WXn+Nm?=
 =?iso-8859-1?Q?oy4lYkmj7y6z2dIFpBbzbM17F1Ep48ESGTaauQt4EIEvawmsOdSpdFVB37?=
 =?iso-8859-1?Q?PFWq3E25afkvjPQcgLQtkQo4frkwd25fDqQpjs2kiJautwGldt2y4rz0L6?=
 =?iso-8859-1?Q?HW152KCR5DxK+RcMpR1E6selkkXorbbao2suloCOFlqjC5hPOaCZjlkRFo?=
 =?iso-8859-1?Q?iSuRPRqThXAdeyHfKJD/wcekmgokTRPzKT/k6iv4Eitl1fdTptERcaeioh?=
 =?iso-8859-1?Q?Dh6zkH7YDnsU18y3k8h6UkEkx4C2DdnyoBNL6QSBgFpAgAhVGmA1Heuj4I?=
 =?iso-8859-1?Q?gfE0SGGwykMlvPPHMupxQ+itx5z3bW0psub+cAly4qQnJd4MvnFusC0VI3?=
 =?iso-8859-1?Q?2csqfwUjXOEarO6PiaI3zOFKmh7kuJDAhX35JWDt5bjlTh8O5P78RT0d+a?=
 =?iso-8859-1?Q?SnpDKT42uaGedDyXDHmhiUjIR9/j27i9galf3Ee7O+GB45da8xZx7w138B?=
 =?iso-8859-1?Q?WBFKkvirYIWDZBG5wms5o2DBZTF25tH3NX4z0n/A0fGAZ2+JoxDXKwC5Wf?=
 =?iso-8859-1?Q?aIsQhEzp+c8HIMQ77xgRUtFM2VBc+j8k2noXHEPcWk0ccZAIhxBicRhg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207dc193-9511-4eee-7f4f-08da8b5aa174
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:10:59.7649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7H9tmwfTR/LVzvAnNCcTXa10GGBEDZEBW7CR3cj6pH1oJ+2LxVocBgJBiolrmb7Ef7YMOBwHVTvRTTT2XDb1vDIAIgZWnBv5Q735iXX/cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: MH5kAkVFCaQRAHFgGeDEACgEtjou0-EB
X-Proofpoint-ORIG-GUID: MH5kAkVFCaQRAHFgGeDEACgEtjou0-EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=813 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310070

We can use reference counter to ease up object lifetime management.
This patch adds very basic support for reference counters. refcnt
should be used in the following way:

1. Protected structure should have refcnt_t field

2. This field should be initialized with refcnt_init() during object
construction.

3. If code holds a valid pointer to a structure/object it can increase
refcount with refcnt_get(). No additional locking is required.

4. Code should call refcnt_put() before dropping pointer to a
protected structure. `destructor` is a call back function that should
destruct object and free all resources, including structure protected
itself. Destructor will be called if reference counter reaches zero.

5. If code does not hold a valid pointer to a protected structure it
should use other locking mechanism to obtain a pointer. For example,
it should lock a list that hold protected objects.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/include/xen/refcnt.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 xen/include/xen/refcnt.h

diff --git a/xen/include/xen/refcnt.h b/xen/include/xen/refcnt.h
new file mode 100644
index 0000000000..7f5395a21c
--- /dev/null
+++ b/xen/include/xen/refcnt.h
@@ -0,0 +1,28 @@
+#ifndef __XEN_REFCNT_H__
+#define __XEN_REFCNT_H__
+
+#include <asm/atomic.h>
+
+typedef atomic_t refcnt_t;
+
+static inline void refcnt_init(refcnt_t *refcnt)
+{
+	atomic_set(refcnt, 1);
+}
+
+static inline void refcnt_get(refcnt_t *refcnt)
+{
+#ifndef NDEBUG
+	ASSERT(atomic_add_unless(refcnt, 1, 0) > 0);
+#else
+	atomic_add_unless(refcnt, 1, 0);
+#endif
+}
+
+static inline void refcnt_put(refcnt_t *refcnt, void (*destructor)(refcnt_=
t *refcnt))
+{
+	if ( atomic_dec_and_test(refcnt) )
+		destructor(refcnt);
+}
+
+#endif
--=20
2.36.1

