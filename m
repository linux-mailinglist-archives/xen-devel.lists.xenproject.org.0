Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B142322437
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88519.166469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXf-0004Iy-GT; Tue, 23 Feb 2021 02:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88519.166469; Tue, 23 Feb 2021 02:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXf-0004I4-CT; Tue, 23 Feb 2021 02:35:15 +0000
Received: by outflank-mailman (input) for mailman id 88519;
 Tue, 23 Feb 2021 02:35:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXd-00046u-V9
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:13 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 721913e0-99e5-4f4c-9933-dbdb10ca54f0;
 Tue, 23 Feb 2021 02:35:04 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2QQxk004083; Tue, 23 Feb 2021 02:35:01 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 36vqte83qr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:01 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR0302MB3235.eurprd03.prod.outlook.com (2603:10a6:208:a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 02:34:57 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:57 +0000
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
X-Inumbo-ID: 721913e0-99e5-4f4c-9933-dbdb10ca54f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8UsQ/zNRlGvj/CMCAtMQlV8xoeGe/qY82ASPb8bsv1EJdfCD5A166Brx+0DHQCkbAvOD1j0OJ7Rury/pO+pMG69Q/YnB0J4EimaaZTI77s1IgEpb5JMteMdHZxmAd3/fcXj8hcFvvZRcIGP8pKEw691wnOqPbCHPzi1y+rFYFCe7dafaFJOy1ewuh04VM4e5PmlkjjRuWqsmOCYtuXQ7XdgDKEKawldJ28zOD/M2QkCa4xC9uFKERuBr1193ecVyrBJ36iqOouoStzvs5ZUhysNObYjnBrSzNwAQx6pXyFMnQxtpn8PsAXILqS3kEDPb/L3LGD3JgM9JKJMgVl+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7bkZJeAVBuSp9Gyc797wEvVdAIwSUhCtPUTvuKcVEE=;
 b=CYpIuVSxRvIsnDd2YCEd7pN6Q2wWhZkEbUaFx1JQjeRvPZMICDtYtdkrltjVN2DVPhhiVnZIi8XIZgD66iqoAQxRa0OIevf6+98UwhOkgJnMKEcR4M0DeP8JqnTaBJ5ZCCmRqtj7aWvozqUrzlFzy2/jHz7mLGdtotJE8iDlNmSL6lVsTVrotp7CO7IYSlocaAJGuXH+DDRX35mzl3tWxTPICziYo273iHLH94nocdeZE6XarCAN/VlClsVDF3kMAN/ej0AsGgp/xrtN4z1WIo3pC7vcR7KsBLcap9yYpc/UwOpHxpm4ZkcPflDVVejpyNHP4hlAZArV8Zs+Jr8xZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7bkZJeAVBuSp9Gyc797wEvVdAIwSUhCtPUTvuKcVEE=;
 b=fugEaoUmhgNcWbKy3Jbn87JBECOIM+DBEd6OK4KY7VQk/TriVRWxJk6qYa7HtezQvBznJSNn+ZTLSAgIcJnaIkFaLpNavDiz0NF1XaIVdryoRNv9EQ5AY0OVPVLQB+eEQOR6BuZR6rf6aTnoNr7qVFa3c5HON/7uS1hZ2Ymc57BwP1WOwD7rRZur3oh/ld2uDMH6fYdLCuQv+7p+3am8SWVwVLfv1D/gcWzaN77wVi5MYadAMGYDzavi2Wn74YFXwUmiGvt52nM2qpcWuE7snspokLwC5qfXGGxIg06VXhiJJkmXXSLjw8pMS05qZtKGrs8nqu1JhtoSUKdjhjYPgQ==
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
Subject: [RFC PATCH 05/10] preempt: add try_preempt() function
Thread-Topic: [RFC PATCH 05/10] preempt: add try_preempt() function
Thread-Index: AQHXCYx5ySuVthNLHUKZmgWg9dU+LA==
Date: Tue, 23 Feb 2021 02:34:57 +0000
Message-ID: <20210223023428.757694-6-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: cd8759b3-5f5f-4e1d-6730-08d8d7a39c3a
x-ms-traffictypediagnostic: AM0PR0302MB3235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB323587FF7499713894A2505EE6809@AM0PR0302MB3235.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MhrIJOptljGFO3p3aYiupiRFD8WDZIGxT2LOroitiU2FYLsNLy7sqcVLaps+dEwnuLF3/B0VeWLSmp9kMqOwUNMUwxNGBmFGb3bfU+ayslZjWk5NTxo/vcsyCSNuq4VuSrqDxh9hCoolxbKYuHdT4VhAisIJZLEKLHFN3bIx5LW6B3zD8trTDrXqaoT8LB0RmRjrgzrEYL3cD2HFGtyouUKWbcckqSHPiukVbyphSDHHzPoO5S5crIdGmq3HZ4+vHEGmFJ+yiC7tjm9b8vu+4hDdX47/oEqsshLksylKgiNtQQiqG8AVpodCEPnbbWgYfXAtpjpLG2k1ubpiV6fHK8RvywkJbj9i+jvPBqAgKDVISDp5V4yygJMAxuWGdwDdmoIfPHO3gd4y8eiZEvjGnDiI1EoLbDOr9rzOJZd7UBBtvTwhPILjAFygF4GvV2YVZLquqy56zcDiiAm/mVXdusTU1Pbeze/qvRrjh/XX5CojxnnGTc2GFcFDJ4Eg4jaZYmFdnDDZ/hNkh9X4zE/VKfxnig3dcOdwDVQSi2tCo2gTrJ1PkZY0Z3pRE9EXtYU2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(316002)(6512007)(8936002)(8676002)(86362001)(2906002)(4326008)(478600001)(6486002)(186003)(54906003)(66556008)(55236004)(83380400001)(66446008)(66946007)(66476007)(64756008)(71200400001)(1076003)(2616005)(26005)(76116006)(6916009)(36756003)(5660300002)(6506007)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?C1Exbo5RCcolDWAgr5FgqW9T4dHuKN7wXk1WlE6QoaYMt3/QR1CBY5yMyg?=
 =?iso-8859-1?Q?+2D24BJ3NSotM7zkk2mZMWCAmhnbLt/wWPdLJ7Y9FXTRsfHk3wp5MW2fVw?=
 =?iso-8859-1?Q?AIzDfTNT1dP09xdNj8K1yimvDhXuI/Wt/qFAzGjIFFhH8sK2sm/Mzy+tD8?=
 =?iso-8859-1?Q?+o1wi/WFMoPwDe1kdTl+Fx+AUvOEJOcXelS1/IFBqKNhw5SsvyAsiDu5Hi?=
 =?iso-8859-1?Q?0oCObvbQxjZVj6uSBFaRzVCHwHc2Hts/atlvdpkrKFRNaMGzIxnXySxacj?=
 =?iso-8859-1?Q?El/2Xbtd0LW6pOBtD7D+k2QiD+AbMnbO8HgzRGhXfReETtTyRX+8DBTGKH?=
 =?iso-8859-1?Q?OTGGZUgk4gD4UHMjL82XaDidijtKV/kL82bFGiCOrG3Oa6vQYh0hgNzN3E?=
 =?iso-8859-1?Q?9LZgCKdF3J2JqPfZsQbtDooM62A8HvfntxEEsF8i7KBgsvFbL0s3vPx9oT?=
 =?iso-8859-1?Q?IGaWcIfYH2OlXjHOgZEXq4pf0MlVwOt3+PP5dykDL/YjAQ6hibiTraP6BU?=
 =?iso-8859-1?Q?taRzPycX4oh0khilItJFU0RjafR5CN+pufeBKBBtNC5is2ebEZPKF5cW+5?=
 =?iso-8859-1?Q?8GNmC2Ei4XyMh5fOlQtqZVwhIIegbiniPPM2tbqv/IxLyVTvvJu4ruzA2M?=
 =?iso-8859-1?Q?FRIQkudW9ml837l+lipmZ2oq3vUuagg3uTKgJynF4tHjnEiUwIhfLfoL/i?=
 =?iso-8859-1?Q?jxZ37CYHejZ6hqLrbxriYWVzNoy1f3YoEJxCuBFQ9bHXGc9lKd6pTct07F?=
 =?iso-8859-1?Q?MbRkAI0ujDIqIVpW8zNFpdJzD+uIBNmkrpogCnhmCeQDaF2N18xZ6a1MeG?=
 =?iso-8859-1?Q?vEJgX8eCSpwoyTznVHZnZ3T4AycK1yXN93jcShE3QNY22aHpshMt9xss1y?=
 =?iso-8859-1?Q?BFbmArwxBXGampv6cCzKeq8EqMbVztDjdyGK8o3asYWAGNXcFbQFDTtRf8?=
 =?iso-8859-1?Q?JLqN5ImzLEq120yznvmt8PARzJmWbPvZ0EkVKrEB1D2ymyvNFy4t1BZaS0?=
 =?iso-8859-1?Q?araHVAEuGIAY6lsNOHGILwlrHAXM5q4+8rfpAv/XyYCy4QOZxPfo/xeZuq?=
 =?iso-8859-1?Q?jgZf2ZfPBcFAbf01NbtfQ8rcUwAMELEAHqwdSt4+GfUIlCjR2VIGt4I581?=
 =?iso-8859-1?Q?ILEy0VOMh9H4EK5abNhUj9saOQ7DN7KUXsOov0MAVN5Ul1lO69jWSlTr9T?=
 =?iso-8859-1?Q?kjaTwT+V+1h5yudbJB1ovkxGDLGQQWoFs4dt2/R3DKQsW84qrNyrYShvI+?=
 =?iso-8859-1?Q?NzG6FRcfLp9CJ2RxX2oABKj8zZvp43q96J28zlUNGEIQtZKlbNTHclhzkQ?=
 =?iso-8859-1?Q?Im6Ydko9vpXeFc4rCkvIY07ZzE9BWGnog9LwTVSU3MLdDXy/1DqfysZpf1?=
 =?iso-8859-1?Q?nMMKs8dnfu?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8759b3-5f5f-4e1d-6730-08d8d7a39c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:57.0931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcl/SXjF/ndaYdz1kJRPCFAz+NiQgEIuok3cm7vSoPoHTV2w2VNmvDV06qtTrEUkCfmcB2esxfpMFdKF46OwRDcnBE1H6bpwUqNf/cj+3bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3235
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

This function can be used to preempt code running in hypervisor mode.
Generally, there are two reasons to preempt while in HYP mode:

1. IRQ arrived. This may woke vCPU with higher scheduling priority.
2. Exit from atomic context. While we were in atomic context, state
   of the system may changed and we need to reschedule.

It is very inefficient to call scheduler each time we leave atomic
context, so very simple optimists is used. There are cases when
we *know* that there might be reasons for preemption. One example - is
IRQ. In this case we call try_preempt(true). This will force
rescheduling if we are outside atomic context or it will ensure that
scheduler will be called right after leaving atomic context. This is
done by calling try_preempt(false) when we are leaving atomic
context. try_preempt(false) will check if there was call to
try_preempt(true) in atomic context and call scheduler only in this
case.

Also macro preempt_enable_no_sched() is introduced. It is meant to
be used by scheduler itself, because we don't want to initiate
rescheduling inside scheduler code.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/preempt.c      | 32 +++++++++++++++++++++++++++++++-
 xen/include/xen/preempt.h |  8 ++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/xen/common/preempt.c b/xen/common/preempt.c
index ad61c8419a..98699aaa1f 100644
--- a/xen/common/preempt.c
+++ b/xen/common/preempt.c
@@ -4,6 +4,7 @@
  * Track atomic regions in the hypervisor which disallow sleeping.
  *=20
  * Copyright (c) 2010, Keir Fraser <keir@xen.org>
+ * Copyright (c) 2021, EPAM Systems
  *=20
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -21,13 +22,42 @@
=20
 #include <xen/preempt.h>
 #include <xen/irq.h>
+#include <xen/sched.h>
+#include <xen/wait.h>
 #include <asm/system.h>
=20
 DEFINE_PER_CPU(atomic_t, __preempt_count);
+DEFINE_PER_CPU(unsigned int, need_reschedule);
=20
 bool_t in_atomic(void)
 {
-    return atomic_read(&preempt_count()) || in_irq() || local_irq_is_enabl=
ed();
+    return atomic_read(&preempt_count()) || in_irq();
+}
+
+void try_preempt(bool force)
+{
+    /*
+     * If caller wants us to call the scheduler, but we are in atomic
+     * context - update the flag. We will try preemption upon exit
+     * from atomic context.
+     */
+    if ( force && in_atomic() )
+    {
+        this_cpu(need_reschedule) =3D 1;
+        return;
+    }
+
+    /* idle vCPU schedules via soft IRQs */
+    if ( unlikely(system_state !=3D SYS_STATE_active) ||
+         in_atomic() ||
+         is_idle_vcpu(current) )
+        return;
+
+    if ( force || this_cpu(need_reschedule) )
+    {
+        this_cpu(need_reschedule) =3D 0;
+        wait();
+    }
 }
=20
 #ifndef NDEBUG
diff --git a/xen/include/xen/preempt.h b/xen/include/xen/preempt.h
index e217900d6e..df7352a75e 100644
--- a/xen/include/xen/preempt.h
+++ b/xen/include/xen/preempt.h
@@ -4,6 +4,7 @@
  * Track atomic regions in the hypervisor which disallow sleeping.
  *=20
  * Copyright (c) 2010, Keir Fraser <keir@xen.org>
+ * Copyright (c) 2021, EPAM Systems
  */
=20
 #ifndef __XEN_PREEMPT_H__
@@ -15,6 +16,8 @@
=20
 DECLARE_PER_CPU(atomic_t, __preempt_count);
=20
+void try_preempt(bool force);
+
 #define preempt_count() (this_cpu(__preempt_count))
=20
 #define preempt_disable() do {                  \
@@ -23,6 +26,11 @@ DECLARE_PER_CPU(atomic_t, __preempt_count);
=20
 #define preempt_enable() do {                   \
     atomic_dec(&preempt_count());               \
+    try_preempt(false);                         \
+} while (0)
+
+#define preempt_enable_no_sched() do {          \
+    atomic_dec(&preempt_count());               \
 } while (0)
=20
 bool_t in_atomic(void);
--=20
2.29.2

