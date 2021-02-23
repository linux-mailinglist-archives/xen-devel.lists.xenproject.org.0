Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED0322432
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88520.166483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXj-0004Pr-Fa; Tue, 23 Feb 2021 02:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88520.166483; Tue, 23 Feb 2021 02:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXj-0004OL-7Q; Tue, 23 Feb 2021 02:35:19 +0000
Received: by outflank-mailman (input) for mailman id 88520;
 Tue, 23 Feb 2021 02:35:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXh-00046p-7O
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:17 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d276e0e6-dacc-4b09-8b8b-b647f20e8e58;
 Tue, 23 Feb 2021 02:35:04 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2QQxn004083; Tue, 23 Feb 2021 02:35:03 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 36vqte83qr-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:03 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR0302MB3235.eurprd03.prod.outlook.com (2603:10a6:208:a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 02:34:58 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:58 +0000
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
X-Inumbo-ID: d276e0e6-dacc-4b09-8b8b-b647f20e8e58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnsoOYeaZ5ap723wZNcX5IBljYGd+jOoU5tg7D29IJwkoifiWlQ29yEkQiI8det8eYG/walXrTRJaZunRIUKKe0Bd/7fH4yHvsMgJRkL3DVPW4If/ciKu5l60yOozxyg+BzaePt+nhASfCNSynePIhSdxXXvBLDPisGHfiJDx8+suA9ZzYWcFnnfm3zXx+Sp9PDGjHlN+NHGp5XEQgO6kPFwoJm1dQVDmYOCCjNLce5cPG6JgsgzJQpctQtr6pBOEGHJw5erGcc0FG6H2pOg9qq1UPpFjaRZSMbky0z4E+zjtkT4Bw8DZ1rDLvfoeucJr7QBhzqTvjzJR/baKYaxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLZbFCdGG+G9vwfGEiWEMpY27lBaZZM8a/Rntb3OeZ8=;
 b=XqiDlF5qgZCsTMuVSdUW8Hdg2NKXBhCKIyUORsD7cXbl6M67tEHTLL3zeCHiRTppAhFCAZFM8R1VWgAmlo5Q6hMX8CQt9HdGAoucy6LOaa9+z7XShl2z2tmWdLOiQxSjtjvNRM73OxJYmH2Q3DMf5q6ae2hcakNiU+Mud+4mRFAAvCbNWaA7q/CHzIF/ExtnMKATPuE6OLH2kEM8BDXWjF9TY+wZ1zDiuXntkBQ4rOTVEZ2TASIaxObDlVSMkdm/rLqoTnfd82Pl5CjoE/LIkl5LkdYz0xyIxcWOWqL5BzMTxEfVKtwTD/0xVKW2QPjgKBU8ThTfFwYHoVGQmmb5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLZbFCdGG+G9vwfGEiWEMpY27lBaZZM8a/Rntb3OeZ8=;
 b=Do3kY2ktfT4pYTe7de5Zbtc88uic2L7hP81FVFySkF7qxPtAh29/ZPU1KdwcDTJjFKwnztvJgCyqK5oD+3eAXyEOsN5OQBGmQgTYOtsTqF8nPwf/D8ZyBJefnzLDFZ3rU94UjLooLPg544Dc+mFWifGqzo0gaSSX6AZmdImWfIIPbcePrIRmIybL7qKzSCmF0La6Y8+b2k3ABye/a/3uRetkNl0t67+4T3mryyXPzcwh1G3e84qDSTTZ84uGBfv1/RFngz0JvfKe0ewOT/R5ATI8sqwy8A2W0Te9TdxSKneqwaUG0DwMPnfkgVWaLHiuDveKZeXbP14J24hPlgzJoQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 08/10] arm: context_switch: allow to run with IRQs already
 disabled
Thread-Topic: [RFC PATCH 08/10] arm: context_switch: allow to run with IRQs
 already disabled
Thread-Index: AQHXCYx6+wvu0Xd3nESKdamktRGE6w==
Date: Tue, 23 Feb 2021 02:34:58 +0000
Message-ID: <20210223023428.757694-9-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: b928eb8a-9ac4-4d70-8ac4-08d8d7a39cea
x-ms-traffictypediagnostic: AM0PR0302MB3235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3235B18F52228B33ECCA2B66E6809@AM0PR0302MB3235.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2mKXp8dQBrHgSaT64CcaGyXnuiyAm1iqTb/jAO/x28VCqUJabnDfdicEbaIGm2yAYr+wMt4rQ/mUWFGfpmXUVgl6n+hqDssf7RGZD5fgWGK2CmY2UCT4HkDtJSZfcZq05z2cB/suy9ZVqOAYa2t9viH1mWMUEGBdECs/DlZOWCK2m8CZsVuQBkZRptSclPjeAyOt9cC6c4+FqBKbROSIv9gtwQ6DWlHr0eXYjiSYeVWtKpLghbjchuEuOQcFcYa/5UXwow9Tfd6EMYqo7s7tQlOhD1IY0BM3/Wlut1j4IjH6FNP/Dl91ZVLhC/3IaJUva45zbBY917I5rWbCquAkWMZBZEGHykZfcIkXSih5NWlh/LsQBW5bn1x5PM+qseBj4N+V+9pvWo430m8SxvpqQPAblNEEZNjDlAqerBOIL8IUHCBbcRdrjHEkuWzh8wQcAOiXfWo0TEfaai018P545DAzg66y2ng/FIGtGJvfYSuJBvllXMmtojLAKtTuBhxpxef86+1X0QCKCCgLJV2g7A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(316002)(6512007)(8936002)(8676002)(86362001)(2906002)(4326008)(478600001)(6486002)(186003)(107886003)(54906003)(66556008)(55236004)(83380400001)(66446008)(66946007)(66476007)(64756008)(71200400001)(1076003)(2616005)(26005)(76116006)(6916009)(36756003)(5660300002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?XIwzGB8T8dRu9iJXV/cfOciAGeAWAE9JZvdCkymrYp8/zX4ustw16rwWAL?=
 =?iso-8859-1?Q?VHu2XSFShArGlMJuDaAtQImueOJke+l94pzfJGmwLEC3pFde+0oPrv0uZ/?=
 =?iso-8859-1?Q?4F4WKg169Y4vVz/PhxQ0zYRvVj6jerCKQ3GUCaGweU5HbxDQGYxNDiBAZw?=
 =?iso-8859-1?Q?djP2pzlROgcEcIImZur4XKVWCUsc+MK7atMXi7TrgR488XlXyke5FIyb6x?=
 =?iso-8859-1?Q?iUTQSx29yZSiBljFmvUUMrHsxJDq0z6AyiL3Lc41ooAiFOSPoVOZSUo/nk?=
 =?iso-8859-1?Q?05Iug5NXiJLfrM5Fz8hRLS0fh7XYbHNYg1SGTHvWkHNyz1EUSfPuLm3Y9D?=
 =?iso-8859-1?Q?Y4LoJtfhGxl+wJKQS7upuLVvCjzEg8vN1aU97Hjkh5p9w8JuA7bpRjXvOC?=
 =?iso-8859-1?Q?CQy+rr4ln8nsgGTgRDVvaL5hrcEuAq9kVgsglnBDOdZVgQxom5NThpQ3Bz?=
 =?iso-8859-1?Q?ufCKwFIOxxDw2rQQk0/Wn7gVrk1Kw1o7eSKRdKdIp4Hiv9q0pkuPrBHo0i?=
 =?iso-8859-1?Q?bcKIS+O0f8QlNJ/PxurHKXTgaVp07Jez3ZEWOJ+qBdy00NZGcXeLpXMhpu?=
 =?iso-8859-1?Q?H/lbxMQeiMo0mdEefTfNXYwQs8xVFmAZ7dWoqjnV2ZkJLosRKxRG3AIPYI?=
 =?iso-8859-1?Q?dRC+Gwt7J5ylEPJDQWfdYB4FbSgsRupRlNkBlUBKopLVYPS8QePIuj0G8n?=
 =?iso-8859-1?Q?o5mRaAlr+ho78ruuyldDsvGRUxcZNSh/tvhBshC5fm/YEBqQmq7BtzSUvI?=
 =?iso-8859-1?Q?0IGMF0oUwD/x2GXxNH5gdQ5OrgulHjMjUzsFdR1wFFo51000WSGuR4vWQX?=
 =?iso-8859-1?Q?t4nSRG6CzsnxSbaWDXgchzqV5tF5ObiadspAUzpU7eaSsCtfpCyYr83YJo?=
 =?iso-8859-1?Q?yvGRiSzkFQmyFT+erJhCs0CgL+1ASB2txyR9SOGZICoXcC0xfqXPFTb/HQ?=
 =?iso-8859-1?Q?wLt/PrtfXGPmnqxcEtx8YolRS2t8mBaT3lCoV8wP9rcv0dF9pRIjkc/264?=
 =?iso-8859-1?Q?f9AjWSbszdVOPeO60YVlpG/Vu9f1od85fO2H4oFDpVTpnDccVqfyRdH3ig?=
 =?iso-8859-1?Q?nsUmWAYHP3mopCCS1f8Xm4KNv0ovAySU3TmM7QjUYbLsZV1BoYOjRIwCob?=
 =?iso-8859-1?Q?49U8HThF5VdWVORMZzD5A7uPC8Nl4N+fIuFkmESwKg+huZD5P07q5WeMIQ?=
 =?iso-8859-1?Q?ePlJ1FT01eQQAUCvowAJdf+zLQs8wPpk2+nLd8QsO1vYPftQn0UYVvgT1P?=
 =?iso-8859-1?Q?aN7k+WtMRLCVubJvqXgebnks1dXWb6op3hynDdtEMfEl75Fwxpu+XO9G7i?=
 =?iso-8859-1?Q?+aAb9uMarawMXkYNRZqnmFLLx3WG3Hpl5RpKir/EhQOn8yUBWA/0AIG0LC?=
 =?iso-8859-1?Q?zT2CNOVJLC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b928eb8a-9ac4-4d70-8ac4-08d8d7a39cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:58.1025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6FQv6X463hVt9hhQ8WuBquVF9RFWSVcl0plmS2r0D1U37EcJ7elOmoegGYxCNV11Ah3X16KLsT6ujYxzD+cFgO4AV+FRRMka6PkmkDty2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3235
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

With upcoming full hypervisor preemption it is possible that context
switching code will be called with IRQs already disabled. In this case
we don't want to enable them back. So we need to add logic that tracks
if IRQs are already disabled.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/domain.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2ccf4449ea..3d4a1df4a4 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -310,7 +310,7 @@ static void update_runstate_area(struct vcpu *v)
     }
 }
=20
-static void schedule_tail(struct vcpu *prev)
+static void schedule_tail(struct vcpu *prev, bool enable_irqs)
 {
     ASSERT(prev !=3D current);
=20
@@ -318,7 +318,8 @@ static void schedule_tail(struct vcpu *prev)
=20
     ctxt_switch_to(current);
=20
-    local_irq_enable();
+    if (enable_irqs)
+        local_irq_enable();
=20
     sched_context_switched(prev, current);
=20
@@ -333,7 +334,7 @@ static void continue_new_vcpu(struct vcpu *prev)
     current->arch.actlr =3D READ_SYSREG32(ACTLR_EL1);
     processor_vcpu_initialise(current);
=20
-    schedule_tail(prev);
+    schedule_tail(prev, true);
=20
     /* This matches preempt_disable() in schedule() */
     preempt_enable_no_sched();
@@ -350,19 +351,21 @@ static void continue_new_vcpu(struct vcpu *prev)
=20
 void context_switch(struct vcpu *prev, struct vcpu *next)
 {
-    ASSERT(local_irq_is_enabled());
+    bool need_to_disable_irqs =3D local_irq_is_enabled();
+
     ASSERT(prev !=3D next);
     ASSERT(!vcpu_cpu_dirty(next));
=20
     update_runstate_area(prev);
=20
-    local_irq_disable();
+    if (need_to_disable_irqs)
+        local_irq_disable();
=20
     set_current(next);
=20
     prev =3D __context_switch(prev, next);
=20
-    schedule_tail(prev);
+    schedule_tail(prev, need_to_disable_irqs);
 }
=20
 void continue_running(struct vcpu *same)
--=20
2.29.2

