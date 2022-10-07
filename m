Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15A65F76E9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417687.662454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfE-0006eR-Mc; Fri, 07 Oct 2022 10:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417687.662454; Fri, 07 Oct 2022 10:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfE-0006LS-3L; Fri, 07 Oct 2022 10:33:08 +0000
Received: by outflank-mailman (input) for mailman id 417687;
 Fri, 07 Oct 2022 10:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf8-0004PE-BG
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:02 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68b94913-462b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 12:32:58 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2977q6QW027397;
 Fri, 7 Oct 2022 10:32:55 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k208bupyb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:55 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DBBPR03MB6716.eurprd03.prod.outlook.com (2603:10a6:10:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 10:32:51 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:50 +0000
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
X-Inumbo-ID: 68b94913-462b-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBzf5NC2lZI92DtwkCsZInhkjWY45tjbIfqEZ6I4vquP8pcO3rXf9cNS6YahHLjVWECTeO2n0Gg4tY8fQqoEa6M+Z0LmVJgizIBz+H3TYKwVzsNt6/BtFGXWR36DXdyM4FM2X4/NyGa9B7R30MCvQE+ImO8PrMHmPAuhxkU9mzigg7Olq+CAWq/D9Ogywo2rFrvKzDTT+rw7f+5K/wWmhpeaWn4MM40pbXHFR16wCDl9JTzeSkE2EJSWB/gqIPj3oL7/F8BZSGwOBzAub8nYKUpSshM5qzTdhqf7CLWbgnnRy5mYsGnIZzXAL7vp6z0Vha1PCAewulIjw3CMJuOPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxsl5gDF3/jSVy2BBSafg6Ww5MOd3+YkfDQ+9kQ0VuY=;
 b=XCNTFwrOA20JWVCexD6aEQgubr4JQ6Vq1N7SM9W9wR/LUNQmuX/pucmr9bFx9lgWjypoMHTVmm5uSBMLNAAdNtVnBgSTZW/iQHmiYf/6g3CbBeydNZzOVqbDSV6SDfzuQA7Mc1CZuFg6tcgc1AsmsvB6mOgdhFDqhNp1YXR5BrWvUtGbTfz0hQO5QN4GGZT2xDQh6ukZYJyoZq/IElFIAQUw/XQsnrcf1qHDnjK7km0rtQv4IwpYdz8aksShAN9GNHxwtTcWQUtkpcmXxRXgEPb9lsKuQBN6YXyav4eL2UPJGyC2+wPpJgjBHZatGrRxyOA0FouvkBZoUz9tn8A3DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxsl5gDF3/jSVy2BBSafg6Ww5MOd3+YkfDQ+9kQ0VuY=;
 b=D9GLVeBc5XEnG63BowEqyApqmjh1JZZG5d2xaGnL6IXwzp9p9zYO6SqnTQB4v/R2AInwz8ejjtt2nPkkg5P3C4APkphAGNXrGwRIbK7uTbS8ydvBGA36wXVhPoBjk8qVz7pb8Jtjf8Un5+mqpoBulmAwby9SX0i9e+KzTalZSOzFwtuYryd6v8pS3Yy2uY/b7PB8p1o2ZY2FljSRJvyz5+QSz5SVdFfn0upTU27IityhzypeahAIzLlNNUSkTwigw5eSjCfsk84Ez4NQNhdteAXaUFth1k+UhAc2Oc/w9NP9ZtxHNicW0fItvJt6uR3wtYcLIpAKBpWBccfJTDZs2Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH 11/19] xen/arm: Suspend/resume timer interrupt generation
Thread-Topic: [PATCH 11/19] xen/arm: Suspend/resume timer interrupt generation
Thread-Index: AQHY2jgl07ov6FowcUeH35VPDOse0g==
Date: Fri, 7 Oct 2022 10:32:49 +0000
Message-ID: 
 <63e5551cc906d8603abfbe9596403fdd8107c849.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: fa5c25a4-6eb7-43d2-1a0f-08daa84f48d2
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TFHN2zXtb+m98VGXMPTOah0qGzVgy9eFQpqujFSYIqMC/UC/zzk+KlUMp2vlPnspvhSARlYUgvb6DIHILGhA1K/WITnAbhGZimJbHH5eBoMdAey6i3Z0s3WPPGrFDqgtswyEVDRHS1t1KDHGf4jIJ6cWzU48onzRPYx8WuhS5xAz4TcW3Pxxme+rfZ8mnGHaEbCi2yVfC9BLW7GTxadzL0rTc62SBkR8lwo+FblCOfHIogEfWUuFALykgQOIu1rx0eO4kzcxYoPrrobVIKk/ScW6L8npm5k07JWjxDV4uLTW2c5uwGUEhUyVQMmtx1aNGxMfBCM42z1ylPBKbUAwyrsC/ALl4cdVpFRqYAeZ2ZaU/JISrZcsBq2Z6R73W2c1E/pzz9JqGGYBhOFhtWtmpqleF3s7L98gA8K2ASdiR3+aBZTstWfl8Ip86gqBCBoG1SZmURsOUp/gzYAvwTyEmyD//9gahUnFdNsmG5qnkiJaHHmJu4ct3V3Gg3w+qz/tvBPZLSmJznSVtbCznO04Juz6ckgq/gp3d+8ukQ65V3f97lX/Q4vnNVZjqPiJ8tUN9kHGXPW3i3whoxYLdyUrZ3SHdjzAcwOzfOPco+UBiumfSFm1tlH8+BTbUTy/Wk5gz6qNqj0MqvldQDSV4+lbbSuCAuA4OcVFyq1s5r88rwzL7uiV3Zq7aeqzJ8GZFnpvCCgtyDvtJME50MkEmmUj6HFrQSDTvpDtYv/EaDZ+vsKFbF588OY5+yForIdWLq/MFpZytyxM+DiYqhQyMVsXIQvsATBxR0p6bvRmxjF1Ub0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(38100700002)(38070700005)(122000001)(41300700001)(15650500001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?qxLuF9n+m4HFbcJI/uMHaqp0eBHnJ/pXL/riOKhmaJx0xiD6jciIY/sSXf?=
 =?iso-8859-1?Q?1H+YmleQiiLDUGbOEg+e93Iw5lrJOKHbYDpI+wE9rnnZIyYzsIus/aDO6K?=
 =?iso-8859-1?Q?zkWl2C0M4KUwkT7uCzMaVU3prmAwUgQ+FfeMR1sYTag6rHl9ihQIh+Luuf?=
 =?iso-8859-1?Q?yS/nZHtWI6vXtWiUcB0Pro+aj9JztwBhMjDFPjWdu0OZngZPO/j7DqWLDl?=
 =?iso-8859-1?Q?n5JUFKGjI1DDtwfPnkKyesHVgzVG0A2GTnD3gQ7Yv3igjrZioywwmmCGYj?=
 =?iso-8859-1?Q?bCnHJ1MM14wuInin+I6rBkmXZ/qdnJjCpZArNunU0DTpNc+rhgsjEVJFea?=
 =?iso-8859-1?Q?j1XD+GBMzGIMTEVIXGZ5nEA5uM2REs0lqjjohEp4T4z81BLX1YuQ3AKv+1?=
 =?iso-8859-1?Q?yLsGNydxT+ac6bVZX1p3372szPZduUVHWw6RIrvKks/Ay4KR9q9FzHigrC?=
 =?iso-8859-1?Q?7x6eNKdU4SQ5fpNSHer1D42xLayqaWi+yB/KIqP/jKRKVovo8w9fZEB107?=
 =?iso-8859-1?Q?0DoWtijNc8nBzjyI2tRiR9gmcKL0dzfExGweM+lTkUrXFdBShvgi/8aIJD?=
 =?iso-8859-1?Q?1Sy8AbIW4OFudc0yWvDsp/Mvm/QKp74AgHL0fXXgySuS5P4euTV0GRcwVf?=
 =?iso-8859-1?Q?WKCG+ATl2ErYrbmD8LVebDdIHlMlh3GY+poBHE/d9UcbEGFBrL91KXwXMc?=
 =?iso-8859-1?Q?xs7w7/FC+dPP/Ew3rn9NngL4JWSYvtvo8xlKEJ37gSt/VZQMxAw9t7oQ4a?=
 =?iso-8859-1?Q?F1qF7dfiiaDrfhiURQ3K0rVrTBI0/gpuKq8t2kZc76XQfqaZM4dni/ufrD?=
 =?iso-8859-1?Q?pheyhfRNfHYA7U4TfetIzor+CahhUnF+RmkYuq487mAL8/wiO9BX79E1nq?=
 =?iso-8859-1?Q?T8LQtVa7J1QZkzFFlaPcFP4pTVnu34anZtuAjsSEFmuL/NZzx1kHOmjdRH?=
 =?iso-8859-1?Q?8f9cOX0+t6zIfFhgMuuGUfonzoev/0Tm4twqsPR9pix2lsYcnrmxJm21kg?=
 =?iso-8859-1?Q?5JFLQSfXxJp4oIp9ei1fNc7tjRgtNxkjCFyTwNafFZzPAKqZ2UxgzI1cOR?=
 =?iso-8859-1?Q?npg+jHjwoGOa6Q40QGOYgQ2YYxOOX+RWbXZ9ch8ij607oyGT5XLhzfzoB9?=
 =?iso-8859-1?Q?dtrZUQVLZZrrisrRVPWx0aoDJydDmRmBv0pic+zmJnnRV8fALcHu3wm2vy?=
 =?iso-8859-1?Q?9aoAqLi6OIJJcd3Ib1Sna4dXs1Cf1wu494sK8d1wwynSlO8HYEmCujrDOS?=
 =?iso-8859-1?Q?YkRvCGFOwu0GOnbNxc2mntdpj3/BVQ+5fmQmbx1WyiuFci65F759IW7yGf?=
 =?iso-8859-1?Q?l95GAZYfMedAXPf0Z3QlaOEiGFLrVv28KMTp1cA8QcsJzRUfkFpXXvfyrK?=
 =?iso-8859-1?Q?BEeJBDo0bw9yUNe0pJ5ud9GGZSGWsqAwnwhppq0xbXBgUoD9bcAEh5xtqO?=
 =?iso-8859-1?Q?FtNZQpsxhsOLSNnyv7RNoWzEchLgk2QDq3TeZxDG9PdX49MWKuCHIlXov+?=
 =?iso-8859-1?Q?V6ukmWgW87hScQIy879ocPybb0IjQl5UosfsM5ftJQwaAGe6xlzMIA1T7h?=
 =?iso-8859-1?Q?8lMb7ODUaDbepHdnRY3WrWsysnex5exRWDcmlSJs8YFnLxuLLYUvFKJFD+?=
 =?iso-8859-1?Q?MnMz0A+6ZBik49tND9zwnP45khTylIH/zkN0CE/h+EOap8akWhNS4PkQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5c25a4-6eb7-43d2-1a0f-08daa84f48d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:49.4271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRO6Yn0Hru/urtffcRlZ32XXg93ORHvjXQSt0/91oJX0P2WAQZBNmV8QdUG1E10ckfaHV+foWxTh6NW4uS0HCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: ZPKhhP-P3GGVXecWUq-MSu4TrjNRB4zE
X-Proofpoint-ORIG-GUID: ZPKhhP-P3GGVXecWUq-MSu4TrjNRB4zE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=893 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Timer interrupts have to be disabled while the system is in suspend.
Otherwise, a timer interrupt would fire and wake-up the system.
Suspending the timer interrupts consists of disabling physical EL1
and EL2 timers. The resume consists only of raising timer softirq,
which will trigger the generic timer code to reprogram the EL2 timer
as needed. Enabling of EL1 physical timer will be triggered by an
entity which uses it.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/arch/arm/suspend.c     |  4 ++++
 xen/arch/arm/time.c        | 22 ++++++++++++++++++++++
 xen/include/asm-arm/time.h |  3 +++
 3 files changed, 29 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index b94a6df86d..05c43ce502 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -151,6 +151,8 @@ static long system_suspend(void *data)
         goto resume_nonboot_cpus;
     }
=20
+    time_suspend();
+
     local_irq_save(flags);
     status =3D gic_suspend();
     if ( status )
@@ -166,6 +168,8 @@ static long system_suspend(void *data)
 resume_irqs:
     local_irq_restore(flags);
=20
+    time_resume();
+
 resume_nonboot_cpus:
     rcu_barrier();
     enable_nonboot_cpus();
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index dec53b5f7d..ca54bcfe68 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -363,6 +363,28 @@ void domain_set_time_offset(struct domain *d, int64_t =
time_offset_seconds)
     /* XXX update guest visible wallclock time */
 }
=20
+void time_suspend(void)
+{
+    /* Disable physical EL1 timer */
+    WRITE_SYSREG(0, CNTP_CTL_EL0);
+
+    /* Disable hypervisor's timer */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);
+    isb();
+}
+
+void time_resume(void)
+{
+    /*
+     * Raising timer softirq will trigger generic timer code to reprogram_=
timer
+     * with the correct timeout value (which is not known here). There is =
no
+     * need to do anything else in order to recover the time keeping from =
power
+     * down, because the system counter is not affected by the power down =
(it
+     * resides out of the ARM's cluster in an always-on part of the SoC).
+     */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
                              void *hcpu)
diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
index 4b401c1110..ded93b490a 100644
--- a/xen/include/asm-arm/time.h
+++ b/xen/include/asm-arm/time.h
@@ -107,6 +107,9 @@ void preinit_xen_time(void);
=20
 void force_update_vcpu_system_time(struct vcpu *v);
=20
+void time_suspend(void);
+void time_resume(void);
+
 #endif /* __ARM_TIME_H__ */
 /*
  * Local variables:
--=20
2.37.1

