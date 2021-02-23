Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B280322435
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88521.166495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXk-0004T9-Sd; Tue, 23 Feb 2021 02:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88521.166495; Tue, 23 Feb 2021 02:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXk-0004Rr-Kh; Tue, 23 Feb 2021 02:35:20 +0000
Received: by outflank-mailman (input) for mailman id 88521;
 Tue, 23 Feb 2021 02:35:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXi-00046u-VJ
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:18 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ea283e0-94ff-4ea6-bb64-eeaed80d9b46;
 Tue, 23 Feb 2021 02:35:05 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2QQxm004083; Tue, 23 Feb 2021 02:35:02 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 36vqte83qr-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:02 +0000
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
X-Inumbo-ID: 6ea283e0-94ff-4ea6-bb64-eeaed80d9b46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ/RULMdgalRbvZotrK5nfc7rXQK1j/F446yQM56m7iTrFl7wQDqOqnUfVP4cRNqd6CU9f6OQ4ueYtxBXEgHYA03VueY2wPKHHQ2Mqlz7Z4rvD01DUgmy0sAtPGKFIs4pPS1ABJSWwWo1YKi96vTuDT8s1eRFELE8IQ0V36Owz9PdFHpFCAvs5Bl4Ra07pvMw54phxWQz94k7oQhY9EMy0TBUE41Pxvjt9GZbR4XGrF6a1QCF7T4CYI1/zm6Ks+rPrelTZSJY3IBFo7H3NsmTP/Kk1qFppfY4HjuAaRjYZEXCL5+i43R3BTN5Dw4lFUvEVsHaUEQ410RC/Pl/lGd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ3Oo6oW3QM/2RenEoHxu7guFzqOYawmzOzsPjipV9A=;
 b=CRQMvXLU9l5QR74h3fPdBG7DkRd7VfhVo271EAwyVa/yOlqv3n8uGjPDf1JqKXmYs/PxCbj6D+Khigar0oE80/K2ZuGDg7iz0ur4NdE48tJQU6NM0d+rbusjKQQ/DJlzPp42VwMyTuRN8roeOlXCqJasIzwFuMdvr4i29DaZ5F7dW90R3/rKKWUXZy5PhXGjbFGPor1EDdgyogyuDszaYALhLHX/paM6ZOxOXAJ7O4VyJgxvt4ye9btYGO6wjFuDfZCINKKc6/4zCi9Mt9XQbOfLd92pIjJawHiLP2RZjymZVzs5ntmuoiY1YiIGp2l8bAXdU/iadoLaARxV3Bqzpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ3Oo6oW3QM/2RenEoHxu7guFzqOYawmzOzsPjipV9A=;
 b=PA/NgIOnELMKF1eicJyP4XIVSkYfMYol+d1JCZBpxdzRl5SPwCuq6Wm/o+hio/FKiZDzGD+0e33m0oQ+jks5R5eEdfv/DPUJ9YuxqYugXehSLxBc/pmpdvnaJ0sh+zU/jG7h0Z+KGTeDpLxEK6xx6wIG8f6Cop+niXl5CDC2nq9ETn6SXceO8S2FdPEv37AeUdibcQmDt8KUbn+372+4RU3JGULaOQE58GU5vdw0iei+ko/FbIkt3LJ7NXIydEMExr89Ep1Q/NVtkg94bXYIAbrBtMCxCSDAaWty250QO1MTGm+HuqOUsh6mGtdKpCklDuYbth/4tsV8PNHY8GxGkg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Dario
 Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH 07/10] sched: core: remove ASSERT_NOT_IN_ATOMIC and
 disable preemption[!]
Thread-Topic: [RFC PATCH 07/10] sched: core: remove ASSERT_NOT_IN_ATOMIC and
 disable preemption[!]
Thread-Index: AQHXCYx5ZDmFTcXHSEWdjEjbMIYFyA==
Date: Tue, 23 Feb 2021 02:34:57 +0000
Message-ID: <20210223023428.757694-8-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: d6422711-5b25-4811-b388-08d8d7a39c92
x-ms-traffictypediagnostic: AM0PR0302MB3235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3235DB80597FBA5B44215105E6809@AM0PR0302MB3235.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a+1bqIrVGzfSkrkhvCp/EBx4rw4UYEFp2oFrCpBgOfRdi3eA5DxBXJz4pt6InB7WTvDyWIwcTn+vfkK8ZupqvtooNii1+G2GMmpGCSEcZ5qSkzvFPUmATauxtUAZrCV27KRJxK4M2VHxw5ZnQJO0qC5shS6J42V3m5yTy0jCoIUBA8PNPJSXBuTj27ve7bnFjTXQLsXbR4uRg0KptKd/AX3tmpKJU9LY3LVl5XRY2ekgQTklDqSnsw9LVhD4UnkCoNoEWr6h7cs1PX5NecOpwDz0Q+dIxNE2ib/jMmC1A+JNwQwwSdnzTkzVjxXUonkpg6JI+LF+8V3tVyVZQwW+VhuEO2Ar+PCIgq3cwfb2TRMFpUxCzuxSiZnO05lJfLLHzymeQ7KDLU7SD0iG3B9rqPkpMgFRJg7zGWIVtfC5lmI3m6NqDuC8CV5HXbhbIpmksooHkCcC7hK1/LhvaYg3r0gAIls3aA9AsCFQdK9+f5HOBwYX4Xxdesrw1zXq3yujeHwpNHBUX/NxvDAdzORZ5muDIQtoXC6No+yZg0SvfUUIkcOqElNlKLF0wNBSL0Sc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(316002)(6512007)(8936002)(8676002)(86362001)(2906002)(4326008)(478600001)(6486002)(186003)(54906003)(66556008)(55236004)(83380400001)(66446008)(66946007)(66476007)(64756008)(71200400001)(1076003)(2616005)(26005)(76116006)(6916009)(36756003)(5660300002)(6506007)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?LyL77pT6OA7J4vHWTKqlSDgwKjVqk7XTV4KAB10ixS6OyDeB+/zRELBkhD?=
 =?iso-8859-1?Q?ul1zKCzUpfL8ctBQ9VTV+gMT1cELsFmBTYS7haQax1gwJypSUwXLo5s8sf?=
 =?iso-8859-1?Q?djn5nbWUQEeRiQ87lgJ24m8QiMye0y3Zi/EHWnF8dIoEWkeQpC9GnZu2uj?=
 =?iso-8859-1?Q?S/bJnwkJqmk+LGp0Lv7s0XSEYJqsrqfE7NO4SW69oBhk7suwfJ36qEOiVf?=
 =?iso-8859-1?Q?2MD8FMjuxUBA03DcUYgyB3ju3bVVILHvLP1yJK/XApQlpy1emHm0sCCzJy?=
 =?iso-8859-1?Q?z7XHXtBCG2h+Rzvpyt1E+irql4T52gMtPtXhb4Ui1uPLTRfOV2eRFBzd4m?=
 =?iso-8859-1?Q?ILoszlHFAf8LPQvWGSuNnn8uncUFuhuqah27xWHeeh4W8pD+HnPcH18dgC?=
 =?iso-8859-1?Q?gUfLu2slE+G2PCgr6IEmz4NZdz9FLPZKFvhhWLG5samGTDUSK1lL8LQTSr?=
 =?iso-8859-1?Q?yVsbKEL+mTkjQKvxaMiGsSAfbu3uEWmxg5NYZiCSCjbSpDizMcfpRVc2zs?=
 =?iso-8859-1?Q?w0zC3UB3eczDUxb2chAM9KpxmV0/Sk2n4e0DWCaSz+AESKJBAMbrdSTsB8?=
 =?iso-8859-1?Q?+GQFzZQXaJLeM64g5Y1jCvaHi5PqR08TB++gzNJ53m9aQ9bp0EUHKZ6tar?=
 =?iso-8859-1?Q?CRIfbcgmoZsNBrILp7CkUj3ytBD9XNrdpLwPQ3yczv4NWPFtcWz/N8HDYQ?=
 =?iso-8859-1?Q?oLt56N9MSfYknJQUWdh3hg3EOUFnNrkVuA7pZ7wL5CCio56VbhGHXh9ETA?=
 =?iso-8859-1?Q?9zeObfjvi3BP28INpJwveVhd02yjDnixWFDh4TROIWXNBEfjGRtv00NwMG?=
 =?iso-8859-1?Q?Tl9XN2bkOkJesd4KkCRIGG4iYNZ4jtJ3Dae3ckUpDIEHYHcu4J08r/dp7N?=
 =?iso-8859-1?Q?Oj1Rmc0eb+UnoYZSOct8ZmbATE5R+w3Djbqvn+tJ9tWc3Vw9iueGT8HLQ8?=
 =?iso-8859-1?Q?ZvuOrQW6MiqYOVSAeE25bHmm5Xd29q7fgY3VYCTQXxbgZoa+KFl8qd/WtM?=
 =?iso-8859-1?Q?IGwDBNnXiMYSq9/2IkszYv2R3Q6DZtnLkLPHYOVC7RkuL9IDBxqY6nZqdL?=
 =?iso-8859-1?Q?dxXdB15DV2EeryUjPTwkoWdyukS6sfuKa4RHhG0ZmLgqhAyJTEUE1DdMuR?=
 =?iso-8859-1?Q?6ydVNObkHJr7/gbYMkbyROwvbfycNOjxBwPDtLxqt20tAaFWemusAfHGrF?=
 =?iso-8859-1?Q?WqdmRDkLIhK83o7BPfJyhp3mz6MEp1rORLpnZJx2GJxv+HNUyTmcFAnpas?=
 =?iso-8859-1?Q?tZ0nHXaNyZS+8As2AIeq1qFyNqc/PM2HJe78pDK20yjmmWQxl0yNda60N+?=
 =?iso-8859-1?Q?uxJD4+SZnsNFFiPM06KzbsW850sWaKMLvJc6aDvVQg29hZN5BPMPkcuRuX?=
 =?iso-8859-1?Q?cLZ+3qhpy6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6422711-5b25-4811-b388-08d8d7a39c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:57.6927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9QhMp75F3EOHtlT/s8/uzUSCd6VqiDIiNrIDY6FOKZKMWYdtpA3VhLKl7zjCkGrG8GqJ1hqUC9r8mrbAfT3ztaXBputB9GiqfXZr+XgzdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3235
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

ASSERT_NOT_IN_ATOMIC() is very strict, because it checks that
local IRQs are disabled. But there is a case when this is okay:
when we finished handling IRQ in hypervisor mode we might want
to preempt current vCPU. In this case scheduler will be called
with local IRQs disabled.

On other hand, we want to ensure that scheduler code is not preempted
itself. So we need to disable preemption while doing scheduling.

WARNING! This patch works only for ARM code, because ARM code returns
after call to sched_context_switch() and it is able to enable
preemption back. In case of x86 further investigation required.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/domain.c   |  3 +++
 xen/common/sched/core.c | 13 ++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index bdd3d3e5b5..2ccf4449ea 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -335,6 +335,9 @@ static void continue_new_vcpu(struct vcpu *prev)
=20
     schedule_tail(prev);
=20
+    /* This matches preempt_disable() in schedule() */
+    preempt_enable_no_sched();
+
     if ( is_idle_vcpu(current) )
         reset_stack_and_jump(idle_loop);
     else if ( is_32bit_domain(current->domain) )
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 7e075613d5..057b558367 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2577,8 +2577,6 @@ static void sched_slave(void)
     unsigned int          cpu =3D smp_processor_id();
     unsigned long         flags;
=20
-    ASSERT_NOT_IN_ATOMIC();
-
     rcu_read_lock(&sched_res_rculock);
=20
     lock =3D pcpu_schedule_lock_irqsave(cpu, &flags);
@@ -2643,7 +2641,7 @@ static void schedule(void)
     int cpu =3D smp_processor_id();
     unsigned int          gran;
=20
-    ASSERT_NOT_IN_ATOMIC();
+    preempt_disable();
=20
     SCHED_STAT_CRANK(sched_run);
=20
@@ -2665,6 +2663,9 @@ static void schedule(void)
         rcu_read_unlock(&sched_res_rculock);
=20
         raise_softirq(SCHEDULE_SOFTIRQ);
+
+        preempt_enable_no_sched();
+
         return sched_slave();
     }
=20
@@ -2681,7 +2682,10 @@ static void schedule(void)
         cpumask_raise_softirq(mask, SCHED_SLAVE_SOFTIRQ);
         next =3D sched_wait_rendezvous_in(prev, &lock, &flags, cpu, now);
         if ( !next )
+        {
+            preempt_enable_no_sched();
             return;
+        }
     }
     else
     {
@@ -2695,6 +2699,9 @@ static void schedule(void)
     vnext =3D sched_unit2vcpu_cpu(next, cpu);
     sched_context_switch(vprev, vnext,
                          !is_idle_unit(prev) && is_idle_unit(next), now);
+
+    /* XXX: Move me */
+    preempt_enable_no_sched();
 }
=20
 /* The scheduler timer: force a run through the scheduler */
--=20
2.29.2

