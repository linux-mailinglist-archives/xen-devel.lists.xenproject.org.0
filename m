Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2787D322433
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88514.166410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXU-00047P-JD; Tue, 23 Feb 2021 02:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88514.166410; Tue, 23 Feb 2021 02:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXU-00046z-Et; Tue, 23 Feb 2021 02:35:04 +0000
Received: by outflank-mailman (input) for mailman id 88514;
 Tue, 23 Feb 2021 02:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXS-00046p-Bv
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:02 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3dbc9a8-3a03-4c02-b139-eb8fd8326a0b;
 Tue, 23 Feb 2021 02:35:01 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2PMaR026304; Tue, 23 Feb 2021 02:35:00 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 36vq3kr64x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:34:59 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB4082.eurprd03.prod.outlook.com (2603:10a6:208:70::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 02:34:55 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:55 +0000
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
X-Inumbo-ID: f3dbc9a8-3a03-4c02-b139-eb8fd8326a0b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILj3bBHfEiUMCREsS+BKq7fCjQJP3qdoZCtWoK1RvOke0nKZsj9S77E0THWkfH7X/rl8OAtEY0UtqaiuLZyJF6gFWqOg5U7w9Ta5vl4Fkq2B3uWsgJvq1XxEkHuOXladrGRvlvZB3+DTou36EuqCgkk8uy1Un9ceEsT42TYgw51vWUDJlQqYG2/Ke7J5Be24tQanuna8XhcDHk25geHyMTkCJwv2DhS51Yc0QCO9v3j+IaCnJXG4ob4C8Q9yf1t9O/+//HzPpRwxlPvs5IjDdbF98QiBjAsTv3gWoNHxo7LkJynfkc2TNLVYYLvyiTjr10FNnT7ib6Sxc5WFJZZqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpKHysdqPazW6fGzt3svNddiygNyG3avYaAeAhXrZRY=;
 b=lgf4la7IBw82a7bcvFzWNDtkjOTkd5BDBUGnCfEP8P0a5Mov8a1HfC+NiLd4yAQMqy+Ghvq9jzUobb450pwI35r2EfSUz5dJW0KvlLe72Tg+yfAkT+pZAT1xxnirQ7sKXfleocq3X3mmsG0r4MZHsCTVKVHYL7xgBNIQyj+FHjP0F1ke9Dd5HsA+CCemmrc9wEDVc50o0Ijqgp4c8k+H+3+lQ7SQIWYVcQCO63tOXtEsH7efNbFPA3XJAOZmRcYMjqO6fblYMGxwXAQP8OUU68hl1Qp6e6NX/FNUG+Vvpg5RSnu71hNB24TwvkXXeZ0Gmg5Tez+GeI0k3FAUt2kLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpKHysdqPazW6fGzt3svNddiygNyG3avYaAeAhXrZRY=;
 b=zUOwQBT3y4kV3dyNYL+NWdf5VDL3lvxv4B0e82dnHHq+5hNA+acXLBt8DaaQvhiNlYeTWaLzZ59zOBA5qx9ZkPl4aSksTCxneujqolLDDoqgH931PDwO0wmrfw+Cf2P0l1HZBYB/5B0N+rgTbWs7z/OuAMIzAPpHkjVol5raHaFartj4JJzQ/35JdpAwghmfsOVzigabqN//nthmzJ5ktsoipTInVe4e6+DugypuWvRYBPzJkHmJ9rl2jganMSU/n5BXRvYm2Fn01nncdmTcKL1gjY07wJuKfgtM3YmysDcImMvLfBqQMqIY1W3oXLqMN1VcvJ6OvlaB9Hc6nB2zSw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH 01/10] sched: core: save IRQ state during locking
Thread-Topic: [RFC PATCH 01/10] sched: core: save IRQ state during locking
Thread-Index: AQHXCYx4NBzFu5keaEOeI3LkFrTKiA==
Date: Tue, 23 Feb 2021 02:34:55 +0000
Message-ID: <20210223023428.757694-2-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: cc0fc91f-ed67-49c5-104e-08d8d7a39b41
x-ms-traffictypediagnostic: AM0PR03MB4082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB40823B23C82B5E01B0A73528E6809@AM0PR03MB4082.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:469;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lSyqVPhJG6ukJTGokHeu/8MBuWC6Stinw8mx64JPqDVitSHF07PuS5s/zi7WhQS7+w+Db2zGzX+Xofmqxa9l093vzejv/zzpse6f0axaGQABJ886ORbTMwrsrmHgMq6eJhAHu1RTdsXnEfrCSYOZhx0EVDRG+RySR0VAZ1OUbhemTolb6pY+JjSealz5kgOuk0MjqQGQFEl0v0oRF8QtwBJpMHkE8AV4tjTVmyjIp4iCagTvvdh2O8XClHzDUS5PKBL/0qxozpiFcVhN9EOBj3i6/5t3uakC7yHjgt3IE4dVwdnUM7hKaDOzcRWs+il8bnG6jT22qAUm9xVjW2u8HirTzZoCttPrY98k0xHq915yBV8QnvIUs0KtERvCbMuq/xfXIbbn+OL+GrskJZLuzDIfl+fdhnyeeWzmOfYJbMe4YCCzHuEXQ/eKuPuGqYVdH05q9lpoB57qM/GUwGJjNEHLxdeAgcRBIpYCjY2Z4q4jcuOHRay1rN/XZT/D/am63CqoKDzWuMa678YdYcmwlg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(1076003)(8676002)(186003)(66446008)(76116006)(2906002)(71200400001)(55236004)(4326008)(6486002)(478600001)(36756003)(26005)(66556008)(54906003)(64756008)(83380400001)(6916009)(2616005)(66476007)(86362001)(6512007)(316002)(6506007)(66946007)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?EiKN0SUDa3y6ujQT39WViKPNNZfmtApZorSxFbQ5MNCuMCHtS2iXXhp6NR?=
 =?iso-8859-1?Q?O+gqG6D2cMZd3rpR5hu6EJFt4XpD2VzkQW7K992WG1ri3ovHJ8gInXR+lQ?=
 =?iso-8859-1?Q?QYTb4H4Aqq7L1LRRGVJauwqK3i0UvgqvrCXZp92qF8qktq6JzrKZtiTD4D?=
 =?iso-8859-1?Q?YB2xZyzGWnIFBU1k+bo50UsyExij8ABzjJK/1/pd8WheNRDmji730rQLG6?=
 =?iso-8859-1?Q?WJcbKWWUS+hup4SJfVAjZDfzlGNLfc8k2y7NC3DQfErYmQG7EesVIFTtLa?=
 =?iso-8859-1?Q?vfVxFTUYvanTQdJTm63jhq58x2iNbvN2cuZDVtazjjqjFuBSpsG2MjxJQy?=
 =?iso-8859-1?Q?JMWwLPLoMp5fqRLRBKVE2EjUMl8kXVL+iPexVG/ZzlCYNZBsNnIiAoju8U?=
 =?iso-8859-1?Q?qHbchRfJ2gZltgwd1lJXIGSiG1k5fXFBQUngAchZV/PBO5HjbU+nnqCakD?=
 =?iso-8859-1?Q?WEpKf1LA5aJnLGDOo0hXttZ5BPQItYuBYIuREoUiRCy3UABlArw+qjY0CN?=
 =?iso-8859-1?Q?R69gh+FVesmsMBnuDFSapdViIyuNnm+1JWJYaT+qOfHZ0u7FoimN7Bm16V?=
 =?iso-8859-1?Q?eXsFr9zHWwkJDFbdEhjslLbieOrWzHxWfu1cCZL/9ZdJM2EerrTPZrPDdN?=
 =?iso-8859-1?Q?8deQepZjG2z2kHOml65GonMCo/1VnnoY2LPc+cwODRk9Aet1RoSCO0GEU9?=
 =?iso-8859-1?Q?p9TH3I91vXl/Zj6IqyKugCgPyOoSz2Y6VIW2IYmLMSFQ1fR/2PiTBDdVmP?=
 =?iso-8859-1?Q?rhHmJP+HCJYliBf1zEAm2JNtq0z9ZyATkwiPdqGBm51QpYnonJpyl1WTCc?=
 =?iso-8859-1?Q?dWNdhDoSLu5jzFO4zmdJCYjvbac1/mwdipfua3RUErI4pyXuNIDiPbMIXC?=
 =?iso-8859-1?Q?UmuB3lSoiUyshvhzYnS6E2Q0z/ofEgTUlzaepHmdXUKG7fK0e7+eMAWEm9?=
 =?iso-8859-1?Q?/w+pUkPJsGbjrHgYUELNW6t0f8Lo1oDYEjGbeSMhvWhBchMb+gpuageqA9?=
 =?iso-8859-1?Q?sHdq7NNBoYwz9AGSst583x9jP0LcNECiYfrcZSL5eFlisV24YrN2mqOIRL?=
 =?iso-8859-1?Q?0XAPw/daSeL9m/tHOmyT+BtARgkoS5tOV1RgFkyAOLNn2hF3/8yE81T5sv?=
 =?iso-8859-1?Q?tQ66PnMwABfEJz+qCGwS+HGy9cB98OMWLlUdsvJhRJ7HV0saDeD2qMedwc?=
 =?iso-8859-1?Q?zRYF1Oa8vtXUd9kkEPiwhOxQdxMGQds7TnyJ6C4xTmh6ODCGnpNLtkEVoJ?=
 =?iso-8859-1?Q?CizBjZNPzpCILXZgJz6FCM4Soxa/SqbTS4MsRwgndfBpswPv1xa31C/hh9?=
 =?iso-8859-1?Q?ACucZgG8XIGGi7RLn0KguCeqGBak6A1chQ+TBdn+Ur0r45oRihi9sbfbAN?=
 =?iso-8859-1?Q?W1CrFjYhxf?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0fc91f-ed67-49c5-104e-08d8d7a39b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:55.6839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQW1NGyCh4FDQzBPXQe46aJBBSs9pjiArjAypXldUPsocKb2tl+v9zw5GYlLgTqRMyNOqrqm0zeUFHc1d8YBhJHPb0+r6tcmHc/cYB9a5wY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4082
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=891 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

With XEN preemption enabled, scheduler functions can be called with
IRQs disabled (for example, at end of IRQ handler), so we should
save and restore IRQ state in schedulers code.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/sched/core.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9745a77eee..7e075613d5 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2470,7 +2470,8 @@ static struct vcpu *sched_force_context_switch(struct=
 vcpu *vprev,
  * sched_res_rculock has been dropped.
  */
 static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev=
,
-                                                   spinlock_t **lock, int =
cpu,
+                                                   spinlock_t **lock,
+                                                   unsigned long *flags, i=
nt cpu,
                                                    s_time_t now)
 {
     struct sched_unit *next;
@@ -2500,7 +2501,7 @@ static struct sched_unit *sched_wait_rendezvous_in(st=
ruct sched_unit *prev,
                 prev->rendezvous_in_cnt++;
                 atomic_set(&prev->rendezvous_out_cnt, 0);
=20
-                pcpu_schedule_unlock_irq(*lock, cpu);
+                pcpu_schedule_unlock_irqrestore(*lock, *flags, cpu);
=20
                 sched_context_switch(vprev, v, false, now);
=20
@@ -2530,7 +2531,7 @@ static struct sched_unit *sched_wait_rendezvous_in(st=
ruct sched_unit *prev,
             prev->rendezvous_in_cnt++;
             atomic_set(&prev->rendezvous_out_cnt, 0);
=20
-            pcpu_schedule_unlock_irq(*lock, cpu);
+            pcpu_schedule_unlock_irqrestore(*lock, *flags, cpu);
=20
             raise_softirq(SCHED_SLAVE_SOFTIRQ);
             sched_context_switch(vprev, vprev, false, now);
@@ -2538,11 +2539,11 @@ static struct sched_unit *sched_wait_rendezvous_in(=
struct sched_unit *prev,
             return NULL;         /* ARM only. */
         }
=20
-        pcpu_schedule_unlock_irq(*lock, cpu);
+        pcpu_schedule_unlock_irqrestore(*lock, *flags, cpu);
=20
         cpu_relax();
=20
-        *lock =3D pcpu_schedule_lock_irq(cpu);
+        *lock =3D pcpu_schedule_lock_irqsave(cpu, flags);
=20
         /*
          * Check for scheduling resource switched. This happens when we ar=
e
@@ -2557,7 +2558,7 @@ static struct sched_unit *sched_wait_rendezvous_in(st=
ruct sched_unit *prev,
             ASSERT(is_idle_unit(prev));
             atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
             prev->rendezvous_in_cnt =3D 0;
-            pcpu_schedule_unlock_irq(*lock, cpu);
+            pcpu_schedule_unlock_irqrestore(*lock, *flags, cpu);
             rcu_read_unlock(&sched_res_rculock);
             return NULL;
         }
@@ -2574,12 +2575,13 @@ static void sched_slave(void)
     spinlock_t           *lock;
     bool                  do_softirq =3D false;
     unsigned int          cpu =3D smp_processor_id();
+    unsigned long         flags;
=20
     ASSERT_NOT_IN_ATOMIC();
=20
     rcu_read_lock(&sched_res_rculock);
=20
-    lock =3D pcpu_schedule_lock_irq(cpu);
+    lock =3D pcpu_schedule_lock_irqsave(cpu, &flags);
=20
     now =3D NOW();
=20
@@ -2590,7 +2592,7 @@ static void sched_slave(void)
=20
         if ( v )
         {
-            pcpu_schedule_unlock_irq(lock, cpu);
+            pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
=20
             sched_context_switch(vprev, v, false, now);
=20
@@ -2602,7 +2604,7 @@ static void sched_slave(void)
=20
     if ( !prev->rendezvous_in_cnt )
     {
-        pcpu_schedule_unlock_irq(lock, cpu);
+        pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
=20
         rcu_read_unlock(&sched_res_rculock);
=20
@@ -2615,11 +2617,11 @@ static void sched_slave(void)
=20
     stop_timer(&get_sched_res(cpu)->s_timer);
=20
-    next =3D sched_wait_rendezvous_in(prev, &lock, cpu, now);
+    next =3D sched_wait_rendezvous_in(prev, &lock, &flags, cpu, now);
     if ( !next )
         return;
=20
-    pcpu_schedule_unlock_irq(lock, cpu);
+    pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
=20
     sched_context_switch(vprev, sched_unit2vcpu_cpu(next, cpu),
                          is_idle_unit(next) && !is_idle_unit(prev), now);
@@ -2637,6 +2639,7 @@ static void schedule(void)
     s_time_t              now;
     struct sched_resource *sr;
     spinlock_t           *lock;
+    unsigned long         flags;
     int cpu =3D smp_processor_id();
     unsigned int          gran;
=20
@@ -2646,7 +2649,7 @@ static void schedule(void)
=20
     rcu_read_lock(&sched_res_rculock);
=20
-    lock =3D pcpu_schedule_lock_irq(cpu);
+    lock =3D pcpu_schedule_lock_irqsave(cpu, &flags);
=20
     sr =3D get_sched_res(cpu);
     gran =3D sr->granularity;
@@ -2657,7 +2660,7 @@ static void schedule(void)
          * We have a race: sched_slave() should be called, so raise a soft=
irq
          * in order to re-enter schedule() later and call sched_slave() no=
w.
          */
-        pcpu_schedule_unlock_irq(lock, cpu);
+        pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
=20
         rcu_read_unlock(&sched_res_rculock);
=20
@@ -2676,7 +2679,7 @@ static void schedule(void)
         prev->rendezvous_in_cnt =3D gran;
         cpumask_andnot(mask, sr->cpus, cpumask_of(cpu));
         cpumask_raise_softirq(mask, SCHED_SLAVE_SOFTIRQ);
-        next =3D sched_wait_rendezvous_in(prev, &lock, cpu, now);
+        next =3D sched_wait_rendezvous_in(prev, &lock, &flags, cpu, now);
         if ( !next )
             return;
     }
@@ -2687,7 +2690,7 @@ static void schedule(void)
         atomic_set(&next->rendezvous_out_cnt, 0);
     }
=20
-    pcpu_schedule_unlock_irq(lock, cpu);
+    pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
=20
     vnext =3D sched_unit2vcpu_cpu(next, cpu);
     sched_context_switch(vprev, vnext,
--=20
2.29.2

