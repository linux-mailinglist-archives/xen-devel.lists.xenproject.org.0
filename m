Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BDB322434
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88517.166447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXa-0004CO-Nu; Tue, 23 Feb 2021 02:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88517.166447; Tue, 23 Feb 2021 02:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXa-0004Bi-Ie; Tue, 23 Feb 2021 02:35:10 +0000
Received: by outflank-mailman (input) for mailman id 88517;
 Tue, 23 Feb 2021 02:35:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXY-00046u-V5
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:08 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a683b22-87a2-4aba-b212-f23bca93a2d3;
 Tue, 23 Feb 2021 02:35:04 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2QQxj004083; Tue, 23 Feb 2021 02:35:01 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 36vqte83qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:01 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR0302MB3235.eurprd03.prod.outlook.com (2603:10a6:208:a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 02:34:56 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:56 +0000
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
X-Inumbo-ID: 8a683b22-87a2-4aba-b212-f23bca93a2d3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVd+3NStcB6wNxCQ0IH0EwlhcAgzILiv20hUtyCk2+R9ofOqYwZrGr9SU8d4fQhVSnZS3Kz3xuQfa2b7cgQEGWZmioNsBkW3ZXT0g3Alk+FO+yO3FB+2+jfcAoZZ/KPv8mC4zIx4dL0rCzUjqiQ2WinKheKOHzlQIeEX/8NDCobTBL+RT0juOXHHdD3AKr9N011+WWyXX3Y987QJHTMZxnNWwERliYQjk0NOCDmYuwdLEmz38mw3kVEB0ixl5hkXHvopXvkyXcnRlShMIamFVmOsVYDZUVpfEi0zjmP4LFN5/cDT/V/jwKqwICvx8toVQvPcznKi4WwrkR3Fd6iUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kphJiUy2kLhF2NKPvP/qP8YU2nqCVKOjptsGkk/vL84=;
 b=XW+boCnlFJzSuQpKzcrNOYYLys/jCIuqGUgaZy4WW+zx1AdojBFEenV5kiYsP0N5RbBbbWKWL40inH5ycgSMLVE/k/lnj+rLC5Y8BzBj1cOsj/a7zPkmG8mAATOX/bvN0LpRT1h2f03R167ZBcNns29KTzCUWJLh7p1So4KmqAfsq/Uu6euJcWU2Mzw5NHYPs9vEztkf6pKpM6LJuXjbv2lTKtMQ0VqvwidW917BRbCb3K7aQ5jCvbYv58525gh8JKvG4rQsAepjfDwRtkjGDfNyOh3//VMaX6h1QnwKumH3dEoJtGuVgNoTrJDO0L5+7b8U5y94OL3+daqFzpvjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kphJiUy2kLhF2NKPvP/qP8YU2nqCVKOjptsGkk/vL84=;
 b=cS7iAANsZBsM5KfGWi9tBf0WaghKY1l69+bd9AwzqOFZC8/mjxI4eLb6qAAlCAtQOl9cUDqtXcK/jIHSlAEyOraBA4CTdD9UY3dUqOgTaZkvojaI5luFl5Fu8XAN0q8EaHbVSPNyffQbNe1++j5pz9pwNoxFKNWxqItigtbgbMOwpTdPRiESHL1KZCd3joBGe9BuhlDhKfXCdm/NS9vfyxqKZrVsN/2o4ECqj7y8cJu0nkN0ifqLbfaBPS26VmZbBjoX/f/R19/aWso1tqXTLncU826Vj+cjjC3E1ni92f0LLHL5533RzJAa7s3twZ1ttLvNx+R7ErhL8k/SrJOvUA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [RFC PATCH 04/10] preempt: use atomic_t to for preempt_count
Thread-Topic: [RFC PATCH 04/10] preempt: use atomic_t to for preempt_count
Thread-Index: AQHXCYx5c7ga2XxajUiE7SdBv/dfFA==
Date: Tue, 23 Feb 2021 02:34:56 +0000
Message-ID: <20210223023428.757694-5-volodymyr_babchuk@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.1
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf007190-437a-4c26-e6ff-08d8d7a39bde
x-ms-traffictypediagnostic: AM0PR0302MB3235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3235E87F167ECCF1FBB4A6C4E6809@AM0PR0302MB3235.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 i97tdpblv3xqToaxF4CiMxMl92IE6SDpDlUbnNlP0+3TClGIpkZHgucRTZzzvsp5q9WVvCSxyQg1TH3CFNnmLDi7H/CdQttVLj8yCG5kHnQeYF5YIMK8Ci+6DNdUQu48PCALYMKpx2q4Qx/rX2nFh8bmv6SxLc4+7dLAy5ju8163nDqDsZSsW/riLPEQdp1Xet24SdKUBweSWFZsBVtSl1GyQh0eqd6/AUDPbusq9lxXiQaKSglgMUO3VkbekY5jT9UM5TrhqjcP9jV/2+dd2ndzKpz+bZDol+ShSHvmX8sh6b5pRfS/wI4hbbBbFeO62iSkAg/8gwm13SMPXHmXtAB0S2CysseMuOYt55WA8rMQLhP1rg7wb8BPEXJlhpW98d+CyJt8bEmRPiZ3/eTGcQSeC7GGfqF/wJI7gRX+Y7ADe3lgy5mjjYPpBipiZQeZRT25Mb/N4ai/GJdAXBHD28gMDUJafqVu4JUrkIJIZujiztnq9J1lFkEwPZ744yRQs5uTdnXxz/KkmyLQX9L1Cg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(316002)(6512007)(8936002)(8676002)(86362001)(2906002)(4326008)(478600001)(6486002)(186003)(54906003)(66556008)(55236004)(83380400001)(66446008)(66946007)(66476007)(64756008)(71200400001)(1076003)(2616005)(26005)(76116006)(6916009)(36756003)(5660300002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?mXs0iPRk3o5ZuDGxCOtGxNS0OtlKJFdIKJUWPc9YMSuW+tmXP3Gd6T8ht+?=
 =?iso-8859-1?Q?Xi1aKvFLC4JwL/Ay6GSMtH3GT+hCVamxgXhL2oKhkOey5akZZqoQQlBq7/?=
 =?iso-8859-1?Q?oQQU2rUKNsPYKFZWoku0WFEFDQ3P4YUDrU2fQhRubw5Vt5MWNARIknrNjP?=
 =?iso-8859-1?Q?kjcrzPd8Kd/5kd4PUfJv7LXlEuFMW3HsACRTv4NETei3DPbtH42WTapidp?=
 =?iso-8859-1?Q?v/7hGxbq5fNkd9cMdHlPChcEacrdd1SYF+QM5lk5mhpAhXdJSTyOzZrr3N?=
 =?iso-8859-1?Q?eR/8gHnfvR5aA6+/RZE+TKkEszOyeefZEkk1mpo9rYN4yLLh2ZdFVIFZ2O?=
 =?iso-8859-1?Q?sSsXgvDai6jEWBkfAsAKMo2s3RSya1443g4GDUl0xecB9tq4ShrQ2u/QER?=
 =?iso-8859-1?Q?XKGVs2qilD74/ADumANBKytIyQMRonhPrNfHqDyQb/lkFrMZCJN5RH7ldL?=
 =?iso-8859-1?Q?37H7cgLCe09zcFL6mHbQXH+F/bfxJOJFTXcR3E54gP2GLxY++fnMInCrUo?=
 =?iso-8859-1?Q?6LYrEvlJGNK25nfeQKPI9LY1cLUCg0aJddX7U9K0B6a+BS5ip+hoEzEqsh?=
 =?iso-8859-1?Q?WygqS3mr7uodOvWLHo4b2b86BkSn6hXu+Rw3fvh6X2hv2B3bt7BMOSh/iK?=
 =?iso-8859-1?Q?0KY/vO4ujQbYyU/J8icywAhdzPK3U6t3I1K2d2sgs/p6gUxOPXRTshyxPD?=
 =?iso-8859-1?Q?1/yh04YtmX4MiXJhRH7fRlC/ZhjDt5tmq5I99CbsAYoQpYGe5FStgB/3Kd?=
 =?iso-8859-1?Q?+DpZq0T5DsrZFiG8NFUjGCq51HpweKa7HWXGotVpQ7QUAg1FHyVdjyl3Vu?=
 =?iso-8859-1?Q?hTyonkDlAsgINfOiVastHvrpBHaxQeGBdcPgijVc9pVtHsoaIUeFriBrtv?=
 =?iso-8859-1?Q?7d3TnKR+EuVmHG1BzhXyPZNmr9Wkz5ZsAgUr2Oq/9NeqY9IpaZk5h/pRf7?=
 =?iso-8859-1?Q?SoLiIsBQKqbMb0L8q5gJOlxDObc3uJiM4g8+7sVdWHMD9NwC9f2QahCvOz?=
 =?iso-8859-1?Q?kA277mrqI+zQafvI6Vz6yl0hUeEOOnHKdywH9JEeJOzz2RPxwUBa3ETpI1?=
 =?iso-8859-1?Q?8oNJ4DVy2T86hbnjwKB60qEqCcztDXZq7djeBzE3JNZ44UlxyPfLo6wMBZ?=
 =?iso-8859-1?Q?HggWRe4oK3ao48ddRzA/1SB7hw0kDHwgzkH66Y3BNSdDkOlnqv3TSXd6mp?=
 =?iso-8859-1?Q?OU9pGiZ3hrZDtilIw0hXRzRh0+JRY42q2urNYwK5C+roeRjxMx+Pwo/QTJ?=
 =?iso-8859-1?Q?Q5RwAc2AxYhgjCigw6Qv3LtF/8jxNPlmSd4iPdrApxPK7BV2Vu3RRc3L/i?=
 =?iso-8859-1?Q?F2fDb+BIPdgaSCYaeahkTVmRmTHY86b0fG+jbkQWlqJ+/ko61FwZRzOyK9?=
 =?iso-8859-1?Q?qKFImEG0Uf?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf007190-437a-4c26-e6ff-08d8d7a39bde
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:56.6783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EorqOHZR/msedpiNMbRu3jdJd0YOAMW6NjB1dbgqrSDqWRJrnlgzFlxdRSh3FmOslK1Tozvs/KQsQaiuoyv3X8Cz6RMih9HsSVZpVvMyk3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3235
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=775 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

This ensures that preempt_count will be accounted correctly
during in-hypevisor context switches.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/preempt.c      | 6 +++---
 xen/include/xen/preempt.h | 9 ++++-----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/common/preempt.c b/xen/common/preempt.c
index 3b4178fd44..ad61c8419a 100644
--- a/xen/common/preempt.c
+++ b/xen/common/preempt.c
@@ -23,17 +23,17 @@
 #include <xen/irq.h>
 #include <asm/system.h>
=20
-DEFINE_PER_CPU(unsigned int, __preempt_count);
+DEFINE_PER_CPU(atomic_t, __preempt_count);
=20
 bool_t in_atomic(void)
 {
-    return preempt_count() || in_irq() || !local_irq_is_enabled();
+    return atomic_read(&preempt_count()) || in_irq() || local_irq_is_enabl=
ed();
 }
=20
 #ifndef NDEBUG
 void ASSERT_NOT_IN_ATOMIC(void)
 {
-    ASSERT(!preempt_count());
+    ASSERT(!atomic_read(&preempt_count()));
     ASSERT(!in_irq());
     ASSERT(local_irq_is_enabled());
 }
diff --git a/xen/include/xen/preempt.h b/xen/include/xen/preempt.h
index bef83135a1..e217900d6e 100644
--- a/xen/include/xen/preempt.h
+++ b/xen/include/xen/preempt.h
@@ -9,21 +9,20 @@
 #ifndef __XEN_PREEMPT_H__
 #define __XEN_PREEMPT_H__
=20
+#include <asm/atomic.h>
 #include <xen/types.h>
 #include <xen/percpu.h>
=20
-DECLARE_PER_CPU(unsigned int, __preempt_count);
+DECLARE_PER_CPU(atomic_t, __preempt_count);
=20
 #define preempt_count() (this_cpu(__preempt_count))
=20
 #define preempt_disable() do {                  \
-    preempt_count()++;                          \
-    barrier();                                  \
+    atomic_inc(&preempt_count());               \
 } while (0)
=20
 #define preempt_enable() do {                   \
-    barrier();                                  \
-    preempt_count()--;                          \
+    atomic_dec(&preempt_count());               \
 } while (0)
=20
 bool_t in_atomic(void);
--=20
2.29.2

