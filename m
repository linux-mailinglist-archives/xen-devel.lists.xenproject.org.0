Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FB5F76ED
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417686.662443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfD-0006Lq-LR; Fri, 07 Oct 2022 10:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417686.662443; Fri, 07 Oct 2022 10:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfC-00066s-SX; Fri, 07 Oct 2022 10:33:06 +0000
Received: by outflank-mailman (input) for mailman id 417686;
 Fri, 07 Oct 2022 10:33:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf7-0004P4-HA
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:01 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68773500-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:32:57 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978PgUi009630;
 Fri, 7 Oct 2022 10:32:54 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2237.outbound.protection.outlook.com [104.47.51.237])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k20nb3gbm-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:54 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DU0PR03MB8622.eurprd03.prod.outlook.com (2603:10a6:10:3e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Fri, 7 Oct
 2022 10:32:49 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:49 +0000
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
X-Inumbo-ID: 68773500-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyYO3xNfKXtQyyQ1hvtNWy40UigXKe4W15LmWYbkYoX8gpY7QYsSLB62+jBKBcmeagqizavkwv/egBUcywxL1ofB537iZ1n5+skS1K/YG0g5nbO0RMuH9eoppdrAeZPzEFka3nhvfsI/TylULeukMmcfcJOwsgJX0Jy7FtQ0crAm12Pd7cCJjQkUU06wO6ZqeEpSaAy1gq63avk6tQ5QR8T1i0Khb1WWKxR5iCujfqGT9iQ/mPF4ijmJZY8avPgswLrwZUwZ41xHShav/zMC9w+2jFyg6jIwM9bX5T6hXAXH2AV9Er1ivWlUbOQ186bgv68pgDm7TlaRASVNaX0wuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7tfKwxlMC2rm0Z//gUzhgGJuWbgTzwYs5gBCllkoFo=;
 b=DA0qZW1wyE6ceESPJhferFrl+e2K/cKcLyDZaDqR4iHUhgIV9UnMl/b7HOV4iUTMJkntDVPIYkypqFxcHBHfqdgNMqQbSfZCmBCPonvKGvVNo7hpjnvT0v7DGE411gDuDYAr8EhzjIZZhTJ296KlkZFE7qOc3D5M3Unbk+IC66ILKICAtmCpobj/7IsYkfT9hMpb0JCgCa/GNAFfbV8Id+Kq+K27NDesHsOGIlcs+ttijFACGRROckS8m/DjP+tryaI8n6ZlMA49hwfJ/nSWs8Te4mTitbCvhUANK7nkPtVQtBZ4vptFjhnSNoAqMl5JDE/Z6JkqSqybUDN8/7sv7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7tfKwxlMC2rm0Z//gUzhgGJuWbgTzwYs5gBCllkoFo=;
 b=ksGb5nIxIfuPBfV7pqMqUgDCSJow0lGvOgYRXJKl0J4WtB323jUHL380kEjvFd6iUij0rdDxKdQnzcLECgdjVdsJ5rCYscLHpnSLYfX9ORhmyQCja7Lz0j/Ui0tZa19mVElHXTW+pPbDGlRrI+LKb4wkxXw/w0KYVf+4nlrHvHpaba1oMLMiRye6C5RBAjNw4aK0eZHTfiTX/qTxpB8jzkIyT5/S/zF8EDMgzh8oKKeoC9HgnDPzEsSTn//7LQqRFD6AFLRlG/ofrC3kByZ7DWsMGGaWpkxMkfeoIC4xajf90f/IOexZ2H9xil4n3PK7yNLT00BgXLOfgvPMQ9M+Qw==
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
Subject: [PATCH 10/19] xen/arm: Suspend/resume GIC on system suspend/resume
Thread-Topic: [PATCH 10/19] xen/arm: Suspend/resume GIC on system
 suspend/resume
Thread-Index: AQHY2jglc8rj8DiR5UCRaZVxNHMwnQ==
Date: Fri, 7 Oct 2022 10:32:49 +0000
Message-ID: 
 <99a4fc0ff6732482152389a0813769fcfbdb379c.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DU0PR03MB8622:EE_
x-ms-office365-filtering-correlation-id: 887a28b6-11c0-4962-e4cc-08daa84f4879
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +NAtR5+B+4guNA03ippobsx1z4XaBR2BLEumnwCJCLmBwLYhMu57zz8er8n/pJKtkCEz34zuB/SVd/v7a2D92JRoUpEGNtKjFzYkDfVAecPnBtGr1ndbms9h6CzQvG1RnuB6CgioruXN2K1ey7e3hFWM6rL26nAH0RQryw+TsM0xurRRcfeR3hqPy95t/F2ok9Spinqm2FO8cL+6KrjUKS99SEWmRwJJepHW6JRJPw+n7wsykvURdjL6MbD9qLa4Ow8wbALt9PRWcgyuYH1ed+hX+Ah7puLzsl8ej6Nh/pqmX1CyKJZC0hRJP5TEXwTQxJ3HBA8Bgp4SHgmCdWlN0crkUwQ14vQXXJaBji9wGMwR0cEq2VW50Asgu5cw/s/zMBP45fl8WRxfRU1JUPi5RAl+Bj2LUe5WD3Jqm2bYYK+eaaV1zQkiT/h7mGlKt2ViaA5Km2wzMjSdJjV3vJVMBIz+gGuZ3FC3yJSZ5TVeOryLDeUqQSJveUr7NHh7NtaNJX6l06RYQoT21SVb4xoqvOziYkOYzx9pVawCzXIZhPab5p3Ub5015fjMNk7rk6wks/I8gI6WYqmnNlene26wETcjSnegzB/7pIDUECgNTzUCnBB3eWlcK72Xln99k482cQzT0RflGm1xWPhzo6qY3mvAX5+lwUuXhDCPzI0bfyJy8G2v8R54QT16NyelRI0tT8a3cfZPZMyaq4Y/MwSznIOWstV9toXuFL1xSwLPf3oB1j8S1ZzZ1h8hoDsnGCwE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(36756003)(2616005)(6916009)(83380400001)(122000001)(38100700002)(86362001)(54906003)(8936002)(478600001)(8676002)(41300700001)(6486002)(66476007)(71200400001)(26005)(38070700005)(316002)(6506007)(186003)(55236004)(66946007)(76116006)(64756008)(91956017)(4326008)(5660300002)(2906002)(66446008)(66556008)(15650500001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MzDLeBRtzBph+JSKo1nYvOU28YE9Vk8UgxyX53A4AYwVp4QVB0sYCdVxEt?=
 =?iso-8859-1?Q?k11Mhm6kPCYbIHcfVgWdxYqipvu8aHV/YLYcK33iP0NgnrdDn1yiZtDeEI?=
 =?iso-8859-1?Q?FmejcyUNzc33Wu7/Va++UhCNYrbxK9eS4Mec6UbHWdTz9nadf+4ZkhoTV7?=
 =?iso-8859-1?Q?l3hi2Mv7W4A7/vlK8wHqqtmM16pE8Bb8iG3xsofJH7+MG0RleCzojz5fXj?=
 =?iso-8859-1?Q?mcz9sc/r5KRuFiF4775LICoeGeg57J1M8m1BtmMB+SrdSWYoClUrh7dBr+?=
 =?iso-8859-1?Q?IC7SgkZNTpiMe43WaE+8dqOEQNcJ+ulOkemBL92GwIy8XcCzX+E9lY/CHw?=
 =?iso-8859-1?Q?+r8dgqN7VPeEZaiw1Nh1R0Mns9+P4hqAwKOLZqvzmpEXgawIx+3eInTmRw?=
 =?iso-8859-1?Q?1EHLX+00mvUXHFwpP+wlCHlJF7nxZ9s55VxyKdfWf5NR2zFMpn2mO0fnvd?=
 =?iso-8859-1?Q?rfeuwzvYsl3BxBxKc33LfVhi632oKGY+HCzLcTNdDTABUsEakqp6LnxTN+?=
 =?iso-8859-1?Q?YNO6EmNl7u2AO85M2ewUbo8rpCIyQL/tWVOvgeuRQZ26c7IibJAGo65u9t?=
 =?iso-8859-1?Q?fjOp9rU+jjPPCu6ir5YuQqDKd12d2iXWjLILZqaDJ6zkWEkH9lGwD9FmVI?=
 =?iso-8859-1?Q?XNEmaqeGUA4nqIR4n3AgQ/Tl/yESeHqvL8iysbxRxnFQ6YGMi0CvJFV/IW?=
 =?iso-8859-1?Q?MxdteAbwTkt3Pb2QybcrtQrlRQnlUwdtqPLKu0oLc/f9WTSJDDcqnl45C/?=
 =?iso-8859-1?Q?c46ASHnMFtO+JubKBFpZ5DwcUJYcOG1YQa+BJEes/Az4W6coJrY/egkIpu?=
 =?iso-8859-1?Q?zwuupJkOizMpqHUqmv+FaTfl0TT9SDqrBQmvQ47hbsbZC2PmrzzdqN95hr?=
 =?iso-8859-1?Q?JvESQfboy+unPzwnazG39Xg4WiWBCmollR49lbCZBJw16t/P/59T/kDzoP?=
 =?iso-8859-1?Q?cY1AG+IGWyy3vtExXb3tZGBcewx/2tuP5xCHqB3m28uQz/FQcl7TPN2ozy?=
 =?iso-8859-1?Q?sb4To1Cnr06AXgTq1mxotRdHyJKGdYCn8O+NDB+ma+imfxJIdjjrJ1MjXy?=
 =?iso-8859-1?Q?1URujFl/p/Ubd8bHXx2E+akpQ7Jl/LHd4YkxJBY5lPQl3kTn3Xv+BxDhki?=
 =?iso-8859-1?Q?yD+CBXICFNfIdgTx1YAaJzocq566bBweI7ZgWMPbMuaDRxz5dOsSuieBcS?=
 =?iso-8859-1?Q?cx9u9bXB0DkRn4EEA7QIWqd78Nqit1lAG9Ya49++gip64g7dbpevfl5w32?=
 =?iso-8859-1?Q?RnGTiL1QG0H81FkEGIraePjOukeYslNmdDicjSWdBLiWkl5KyivVQtwG6O?=
 =?iso-8859-1?Q?CHZvDIMl8qDVdf/MApBgfvu5PxTKiz9lGaCvsp+gn+Xrvmgpf8jlFZyBp0?=
 =?iso-8859-1?Q?grlIndEP3O84gk6ixbcbfnR/B+iNezqokeYC9yWrSsg/4bQWjMkMrR8eRC?=
 =?iso-8859-1?Q?sJQwGiwIHHtwMP2HfaOW87pkBtZuTZvkZFbb+AAdQOp6duay3YZ+dxhSuv?=
 =?iso-8859-1?Q?tkl8fOfqi/PjxvVos7nnFS7ZTjj0t05ye9qqnVpb5Ezcc2Ty3B75ycXpu7?=
 =?iso-8859-1?Q?C0ynOa2o+ohB4e6M0/mHQGGt0z5LCxbV0qNrd+e8z3sdWjkBCzJ0J78VTI?=
 =?iso-8859-1?Q?RdBOR8LYfG9x3o4ZdTZjPvoOsovwv49otORApFthO77eWjl4JOuqTfYg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887a28b6-11c0-4962-e4cc-08daa84f4879
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:49.1927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozOEr3IB+VtwHjTBHm2ka0QEAT4Tsdt9fEZWRWbC6fQoVNPXRHcm3PSMTejktIrqZFe2R1sjMeEVMiqW0trsvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8622
X-Proofpoint-ORIG-GUID: OhB0aGHc_-LlbuFSSUKSGYHWE7X_EaVE
X-Proofpoint-GUID: OhB0aGHc_-LlbuFSSUKSGYHWE7X_EaVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=260 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

GIC state is saved on system suspend by calling gic_suspend
(this function does not change current state of the GIC but only
saves the values of configuration registers).
The state of GIC has to be restored by calling gic_resume, but only
if the gic_suspend has succeeded. If gic_suspend fails, we'll just
restore interrupts configuration and abort suspend.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/arch/arm/gic.c     |  4 +---
 xen/arch/arm/suspend.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e9feb1fd3b..ef90664929 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -476,9 +476,7 @@ int gic_suspend(void)
     if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
         return -ENOSYS;
=20
-    gic_hw_ops->suspend();
-
-    return 0;
+    return gic_hw_ops->suspend();
 }
=20
 void gic_resume(void)
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 0c16cfc750..b94a6df86d 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -137,6 +137,7 @@ void vcpu_resume(struct vcpu *v)
 static long system_suspend(void *data)
 {
     int status;
+    unsigned long flags;
=20
     BUG_ON(system_state !=3D SYS_STATE_active);
=20
@@ -150,8 +151,21 @@ static long system_suspend(void *data)
         goto resume_nonboot_cpus;
     }
=20
+    local_irq_save(flags);
+    status =3D gic_suspend();
+    if ( status )
+    {
+        system_state =3D SYS_STATE_resume;
+        goto resume_irqs;
+    }
+
     system_state =3D SYS_STATE_resume;
=20
+    gic_resume();
+
+resume_irqs:
+    local_irq_restore(flags);
+
 resume_nonboot_cpus:
     rcu_barrier();
     enable_nonboot_cpus();
--=20
2.37.1

