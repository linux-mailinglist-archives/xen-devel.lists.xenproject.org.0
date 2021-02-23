Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298F32242F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88518.166459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXd-0004FH-2p; Tue, 23 Feb 2021 02:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88518.166459; Tue, 23 Feb 2021 02:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXc-0004ER-V9; Tue, 23 Feb 2021 02:35:12 +0000
Received: by outflank-mailman (input) for mailman id 88518;
 Tue, 23 Feb 2021 02:35:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXc-00046p-7F
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:12 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25fbc6db-e3bc-4661-b022-f6e721c1303b;
 Tue, 23 Feb 2021 02:35:03 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2PMaS026304; Tue, 23 Feb 2021 02:35:01 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 36vq3kr64x-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:00 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB4082.eurprd03.prod.outlook.com (2603:10a6:208:70::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
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
X-Inumbo-ID: 25fbc6db-e3bc-4661-b022-f6e721c1303b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvtP5KMBplTBWpgA6/CvU5jOwv9Af/k5Xbh57TfCHRdCgHI8E0UbUmr9CrnxaK3Vm5zPJUhSzf1WsRdp5+x+Q/8M56T5KO1hUVjrHzYbFSdruSevpde4Z8SbZEQhFh4NE7xA4UDKfVIQvaC84rfpzRDdEUJE++lJ3MP5Sm7L7HfNvz2H5b3npX7v/yXz58XloyfWeQsWiGHQzkjSBnmJINcWo8S8g4m6uBjKrjpV7yaSpReKYWRZ1uvkgmcJlMQY3YPRVGdc9dNpRjMhxDUPr80sKDWnbHfiDtfwvokcRAvakJILu+lx5PKt00tNNGu+okwqHbOE9/EQ5DW5QGfJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJTEpv4AaTo8JBp7LsUk0AWc8Ja4nv4Eo3TfeWXSlUU=;
 b=T5AYYPqAqrpYKj8JVdeZoHb3cgrDqP0j6dtnaxW0pM6j81cpXvL9vKEM531IeaQoQVQaPGFG83wunAZKoDbQEI0mAR/2xOkr1FIiK3BrmS+v0NtvUsvl1RwMRUMr6HNd/kSGwwmRgShpAHx7U3Cbib84liEb51d7qhe6nfgdktyT2XwQVkDwfut5qClAgtFl3IVVGzB71FFQX4QKO+Nx6kkFNoDqk2hT5UmAAvJmiXLaT/PORgHwWQVjvxMUMHGSyiaWNa4nVwhq9m04Jopnu4vADva4Lts2oomT8QaEpFjup238DNMwvMKFVNtGzpeDxD71YEYfkXSsC+DIAgoAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJTEpv4AaTo8JBp7LsUk0AWc8Ja4nv4Eo3TfeWXSlUU=;
 b=JyVQxcrqLsMJ6BVmrwNGH+0zeVQtsEOWxM4y6sYfk++saiBG4DU4sBFgZWubhtjum/ay8gNIoOyqMCunfkswUdsHDbm5HrMtqzKiZX0yyuCEfMnzF163u+D1bC5NBb3l/BwwPJ6L1yhngPN5Pm5kJC1nfrfS0S0Yss7NMlNk5DvctbQxo9s+5MVSanbVNEeNovHq7WBtBbHnfn2tHVTmvjIVRg2Eqc+ORpg+9j5fUokiaILF6UUheh0fF6PRxcW0SvY7KJQL7bKK0krYVOghHRY9ppV3gXYgOStaVv8e3Qzdf/Xt9Da13XskLf1gqrGDNxsA9rSQla4ZAqQyxPvXGQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Dario Faggioli
	<dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
        George Dunlap
	<george.dunlap@citrix.com>
Subject: [RFC PATCH 02/10] sched: rt: save IRQ state during locking
Thread-Topic: [RFC PATCH 02/10] sched: rt: save IRQ state during locking
Thread-Index: AQHXCYx4gKfh+6izfkCEXHj4/bqk4w==
Date: Tue, 23 Feb 2021 02:34:56 +0000
Message-ID: <20210223023428.757694-3-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 530c420b-0734-458a-0fc7-08d8d7a39b87
x-ms-traffictypediagnostic: AM0PR03MB4082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB40820D1F26543180D4DC6AF7E6809@AM0PR03MB4082.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gOjGmr3nTs3YIiyXWb754h5mEeOBl9QERsthwQ9+b/CeNCkWiN0Az3U2dOwI2jFUqnGy2p23O31FYOR4HMemPafc5QTpnSGDNn4WuouxwPLxQI0i1goNfaAdxAstiHM/0Snvp+kGUwYTHS495sRPZORFp5JrUvynbAz/IZ0s02+2spivclvBsMOvyDZUcrUuGHGkKrFg5K9Sf94/7K5qXhEmBKO3BqkEs2JqTYCjzCjDZVx8dq+YZ2Y1hHLbyUQMkHGJOfikaX5VBLbSDzmCRF0WmDw7yJGuxB9qTuts47jzElrumMIRkybK6d9qyMP2eJDgRRA+SqbuWYQ1/kPq/SjJkmGM9SeCIqYJOU5Od/KDmJ6gT8jV+RjH1ZHnrHYBAbVFnYMDSDthEOED5+UfNeXErP8TuW3XUPdMCbccWItp/74XX/jpJMRZrDrl8oulhYmOTPZw6Yt/la3HGJUPPZZcflyUexZKCkgSFtmoMSxEM0s29WEkzwZHWxvbZxo8jAeXY9kyn+6yDEJZSh6hSg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(1076003)(8676002)(186003)(66446008)(76116006)(2906002)(71200400001)(55236004)(4326008)(6486002)(478600001)(36756003)(26005)(66556008)(54906003)(64756008)(83380400001)(6916009)(2616005)(66476007)(86362001)(6512007)(316002)(6506007)(66946007)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?137VOklkTfRbwkSDaRFMcM7Jy10u0SeDZeEbCAqkKFzvaTTjQZGJjdTpNL?=
 =?iso-8859-1?Q?SR4VPTxgbHXPRiWnTE3vjrbR5gR3YfAv2gpPzkbLNb9CqaqDrQ2FBT9N5U?=
 =?iso-8859-1?Q?0aUe0PK/flvfFwk+bNz/9q6k7yC3vNVPraj790eYZznARsuBLiyfN8wTCS?=
 =?iso-8859-1?Q?tSk3yPzLLjo+tIVCtoTMJEYPk1iscYtRxjNjFDsPPfS3Ai2oXf85AazYem?=
 =?iso-8859-1?Q?17FrZ1SORbMWGOsjHk4aRKQguPWokAaT91fh3cHde5hBwTFS3CBtfog8AU?=
 =?iso-8859-1?Q?4HNDWpmd/Ha/qRETvayu8w6FLTy6Rcif+b4zpK0QTVdjptrgXePzbDJnTx?=
 =?iso-8859-1?Q?/aLYTnaC7YmcGOocBHv3XxkFMzKXv15SXbYndca4QIUvIGGi2HYnzCr3UH?=
 =?iso-8859-1?Q?IXhcEz3HzWyG7w9Y/+OKJyE06T1bFZNmv6ApLnwgW9ADsa0tWNUvJh1Lds?=
 =?iso-8859-1?Q?KmCyFkeg2aYsLLAFQsnWg+Y/0ymjr2B9W1J5K/dWq6bJt1RTZZav8Vbo4s?=
 =?iso-8859-1?Q?9qYXb4rrwwSl3XzxaDfZp0FsBPgWPDBKq8j0TJM0s/P2Q9uVG2KFZrB8LX?=
 =?iso-8859-1?Q?m09HRIyBjnhvA8mrR8WRKUvrK9Wdxh3+VsqCjurGJBCMGy5xlcLHcYKhoM?=
 =?iso-8859-1?Q?vDuhzu8r457UsmECIyjM0kHk/gWClFJUI9RFt3dFEjzV9M53EB/Fbc2w3J?=
 =?iso-8859-1?Q?BuE8bbPM3RFuIsgyNBPKVLnNRIqLzg/FAMKNGEqkM5aZF+giTRsfrgi21R?=
 =?iso-8859-1?Q?dEhfzeIM3zpmukwPAhCHCM1w/ypdIfVcv457ml6kfd/m5reitbAlVxr0NT?=
 =?iso-8859-1?Q?+pf0GtHCV06iEQhybFXibrSIro3sFVf9nSieeHUAV4d8fawoxwXukG1q15?=
 =?iso-8859-1?Q?rrByiNIDs06ELlMONXo2ELdfDsZ7Bu7Tt43nFnSnPgsjoFYU3DA+Dvj3YD?=
 =?iso-8859-1?Q?IA6Qir6fxvZLXbBcl2Vt419MPWOL4U4KIS412xZMp4qyPluThP8wjG+EIm?=
 =?iso-8859-1?Q?hQZIcxV6epiJuPndN1guf3OVpEj9f4LFcI4xv7robiET90hFlHBlPDKapG?=
 =?iso-8859-1?Q?iR11oy7sN96HAi3CDmMkuY5vmK2Xb246EHOiB4Sm96mI32YpGbcn8gNRx+?=
 =?iso-8859-1?Q?IgjYF/nVws+o7gDap2C/lB+eGLau/F6Y2/R5pLbK/SQZYAUrfY3aK9F6EF?=
 =?iso-8859-1?Q?OThla05YFYT3mWUe5ZpZZlilVCbNae22VaS1112dmPNVSD3Q9UTzvWXEbp?=
 =?iso-8859-1?Q?APs01IJif0nvMsp196pSc6eAMvrcCG00UoU1TB+Fl0aECgMal32DY6i3fI?=
 =?iso-8859-1?Q?Xy+QweQfugrOGdVFmzAHJtqMsdsGRoGtl4AJyeRnvnuiMNPZNsgeWy6Bmg?=
 =?iso-8859-1?Q?zZ1JyUWyyC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530c420b-0734-458a-0fc7-08d8d7a39b87
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:56.0786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6inaaIkdhXiQ3tVQfPw5qfIT4X4kMnQDQ3aLZFiFjYnD3Tjo0rj/VnJwOMAdf+xjoGSuaHxTenKyeYv1vSsC+fh0vlVWQD6KnJsbJKKMGLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4082
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=864 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

With XEN preemption enabled, scheduler functions can be called with
IRQs disabled (for example, at end of IRQ handler), so we should
save and restore IRQ state in schedulers code.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/sched/rt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index c24cd2ac32..e1711a8edc 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1318,7 +1318,8 @@ static void
 rt_context_saved(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct rt_unit *svc =3D rt_unit(unit);
-    spinlock_t *lock =3D unit_schedule_lock_irq(unit);
+    unsigned long flags;
+    spinlock_t *lock =3D unit_schedule_lock_irqsave(unit, &flags);
=20
     __clear_bit(__RTDS_scheduled, &svc->flags);
     /* not insert idle unit to runq */
@@ -1335,7 +1336,7 @@ rt_context_saved(const struct scheduler *ops, struct =
sched_unit *unit)
         replq_remove(ops, svc);
=20
 out:
-    unit_schedule_unlock_irq(lock, unit);
+    unit_schedule_unlock_irqrestore(lock, flags, unit);
 }
=20
 /*
@@ -1460,9 +1461,10 @@ static void repl_timer_handler(void *data){
     struct list_head *runq =3D rt_runq(ops);
     struct list_head *iter, *tmp;
     struct rt_unit *svc;
+    unsigned long flags;
     LIST_HEAD(tmp_replq);
=20
-    spin_lock_irq(&prv->lock);
+    spin_lock_irqsave(&prv->lock, flags);
=20
     now =3D NOW();
=20
@@ -1525,7 +1527,7 @@ static void repl_timer_handler(void *data){
     if ( !list_empty(replq) )
         set_timer(&prv->repl_timer, replq_elem(replq->next)->cur_deadline)=
;
=20
-    spin_unlock_irq(&prv->lock);
+    spin_unlock_irqrestore(&prv->lock, flags);
 }
=20
 static const struct scheduler sched_rtds_def =3D {
--=20
2.29.2

