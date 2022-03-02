Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35894CAAB2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 17:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282483.481207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPS34-0006y3-7e; Wed, 02 Mar 2022 16:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282483.481207; Wed, 02 Mar 2022 16:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPS34-0006v9-4N; Wed, 02 Mar 2022 16:41:58 +0000
Received: by outflank-mailman (input) for mailman id 282483;
 Wed, 02 Mar 2022 16:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4+D=TN=oracle.com=dongli.zhang@srs-se1.protection.inumbo.net>)
 id 1nPS31-0006uy-SM
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 16:41:56 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a94a1cd7-9a47-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 17:41:53 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222EqN0j005345; 
 Wed, 2 Mar 2022 16:41:38 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh14bxe2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Mar 2022 16:41:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 222GM3eO163335;
 Wed, 2 Mar 2022 16:41:37 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3030.oracle.com with ESMTP id 3ef9b18d4v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Mar 2022 16:41:37 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by MWHPR1001MB2144.namprd10.prod.outlook.com (2603:10b6:301:2b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 2 Mar
 2022 16:41:34 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::a0d5:610d:bcf:9b47]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::a0d5:610d:bcf:9b47%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 16:41:33 +0000
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
X-Inumbo-ID: a94a1cd7-9a47-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=NLQhFdDbco3Q7cD64mKoFgRLbwwsjMsi9EPxf+xOeIU=;
 b=I3SFkg9PLeyuuNe0xp5w7RO5vlTDIbeoeYTrn+gPlNCByBEOBEktUrbAbV/WKSjShAum
 1Uc62fXb8x8H0EJeSaHi7Jjj0nfYqkhTl0nzJLajIygaWkGB5Sq0g09TxG9A/5kq3res
 li/VJSBpPlsQYrPcMFFT7mLnotEOeUhXQ0u/pz0CyPRQYX1qxLVlv5Sx1S8CbbIRVmmf
 nNGDRiEz7jbnpw34Pon7MQ2tq1wcQyDxSy9ULb0vTnc+XIbpBMUvu4nRMB/BB8erf1rl
 Uy/j+6BSpLub7XzZjirfVNoTKgksyxOdr3EtcWdwIpTZWFmzCHR+56rh5KQJcIbw68KC Aw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D//FRXBpoeZGoDH7GlMR2v+ZnbKbfRnVvleWRNeGTUdg/RKmpqSrhrDlCvQaNKyZKzUNzwL0ZnrARIBRumkSWIoBTXP7nJ6/htvKRsv4ke3I5jN8uHVtUts8njQJ4UbbitOwiP097oSaDHDwEu8vHHnQtPYl1lFvUochaQk2HcuNxv5P2G94HqjeYs88GrdKtIaHPfu3cZTaAHU6K3Ljv7eVfWooui/AQayCA4Y1SbFUMKn+HT2zaC4ldotszHa+OWyFQt1bSZwJuz1Tt4RsfhsI6kvGEh3/wzEjbEnKgdLVSbC9HZ5k05TXHhbhXolo/pkPokoUSTtq7ny3u/ZLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLQhFdDbco3Q7cD64mKoFgRLbwwsjMsi9EPxf+xOeIU=;
 b=ZLejBnI3k8TcrSOOqG6QrkWmlpFQU6qtCRsDk0Jz11fwgXC0nuYWYow4ryvVhi4zKtORShkKO3OWTvt4+l8z+ZWIB++GMOcihhLfQyWp98j30DvgFM/+JbkURcc+8d1t2sijH2XbHLcwK4uX61KrVGwoiKi5PaWlNGIKEFm/MqM9Js288lM+K/bcYY+HmTX2DOBkZm+TXFXalIdfO23BEEDQmxwSfXNypyqfQc1ocPSXOHQCsA7TASfHlcEPxMj7Lm+PDJBv2/r7xPnsYqtQfrcXi6cNXXg8Du1Fu8g3obtKCEfHM0q6gviEo5YsFtUjK9DsWxYuKiv2coLk7i/dEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLQhFdDbco3Q7cD64mKoFgRLbwwsjMsi9EPxf+xOeIU=;
 b=B4ahnZvHX78AknjNaklHE9TJT0Rpfr90yKbe/0vkDcedGZu3n8LrRc1KpcnyI+TyX2JFZFl5iYLclg2Bu9EOHMgXEB5UbNYSUn3ex/7dhL8sv+7t0lFNLgl20Y/gliNXNx6S1hIxm6D1deaTNwJxhvLDEH3Fw+9HbtoVlD5pO/8=
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
        sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, joe.jin@oracle.com
Subject: [PATCH v4 1/2] x86/xen/time: fix indentation issue
Date: Wed,  2 Mar 2022 08:40:31 -0800
Message-Id: <20220302164032.14569-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302164032.14569-1-dongli.zhang@oracle.com>
References: <20220302164032.14569-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b9d917c-880d-4ecc-8cf0-08d9fc6b82a0
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2144:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1001MB2144B071033710CA6D6BF8B2F0039@MWHPR1001MB2144.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BOAOOwEnXtxf/3GBye9xL1e1O08uocpcqxFhwv0M4vQjWVskdHzqqhcVJkAJ4g4G5eech8HlXL0wiKvtZVeCg/c7dA5LtR5kkWXiMKyu04VgbP7/U+HDZADt7ow4bwdggzF6v6MGhZSwEpsunz/qmAd4rPEtk5C2DL9r/EwWDfgVhWyWAuQ92BLVImIDCwDDHPgEDYkLLxeNuD4ME48jNQpwKSXRDlLLsXai3v4ewWqTYW3INB3wKoQBdyoqdmxJ1wdyEhBu3hnPayYWoifvUGK5vwSTP+gAsw+4itD8XpC7jzP2MG9I/tBO1OoJuObIQGEhvcKkNXRI4AndSmJjm2zqDh3oMYIP7i6g5LcsZjlTfXlk6VOX7WR4i0UQmGVcGT//zOr6AlH1xwLC7wCrJ5FwurGUYgkC61UYnD/XoMTOf6UTMhx18+IKJn4FLIr5N3KY2RmRbWlvJktEm404gni7eYW6fc3xdgVePUAng7+YPMHz0Zzkl4S6RbYsnYlqU61RgzwX0k1v39u9udJgLHO1qk6Z9eeKrlVH0pSjBRrkbGT//ojwkTo6DNuTt+HnAtTAyuznavDKOCccAs0rpIE4M3Zjv8nzqQ6BmvN2KvoDVT/RsAcTsUslGCMkg/ZFRZ4utrBHPgGUeDyaieeWJ+bt80u4THW2QSByZKi6J9oVtBGDjo2RZ/ItgImz9ECwb6pvRSCm7LLtrGCEY/g08A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(66556008)(36756003)(4744005)(2906002)(44832011)(5660300002)(38100700002)(107886003)(6486002)(38350700002)(86362001)(508600001)(8936002)(1076003)(186003)(316002)(26005)(6512007)(6506007)(66946007)(8676002)(52116002)(66476007)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vKJCryAhZW3FKQFev2LQFqrIPC+QtMGFsOWVlSPJUXBAP7O+m95iX76HZ4aE?=
 =?us-ascii?Q?c4OlSNA6mim5h0L44N+CCSHX4SvY+urV7xmsaQOhkZVy9zijuhESdgMfRsXl?=
 =?us-ascii?Q?Mdxf6idSZTG6NO+ujf7Ca8GcSMbHUI74QnxPyLXPfWHFTpTNEoV8e43DKV70?=
 =?us-ascii?Q?xPm8APAH9Qm51No8zBtP/VBibNnr2Ec1TMHWzCmEtawUqrIvFWmuV84EVVjk?=
 =?us-ascii?Q?PIj7F50M1r+LuKx9ydUoG3AuKFqgqzYRQz3BdFFRnHgCZF683DrzwPEdZ1pq?=
 =?us-ascii?Q?ZgZjfgeQHpDlRr+3LfTb2JZNUZ2IITSlCCo2tVYyI3pSuapnD4jyFvo20Q2S?=
 =?us-ascii?Q?oSq2iscBKnDV8o4Poe7XQUzOEgYaPQr1yAuj71jee8sFBmSYaxPVEKrFaMn+?=
 =?us-ascii?Q?qJYyCLBFZ8WmnjmnCWuQ2jfcXF0NNjn+51AjiV19ghBcwz9mIXaoStAIMi3C?=
 =?us-ascii?Q?+YhvuqlurEzExMoatda1qG8Df5GtvbYvgaoTQnx4v13snuh7wZNmuH5qcwPh?=
 =?us-ascii?Q?43+SjjAbB+fnnjQDTB8FLiHcobx9tgrILQN6SfMwocm0SSxv7nvNSaA1ogf8?=
 =?us-ascii?Q?IBgTwqakggICggsSWkUK/4fs1KatSRPIXS2rkcTMDUlFbWlZ8Q46ZG9eF3kl?=
 =?us-ascii?Q?69ecuxOSxb+DXGNzQUPtQBj1TqcU9mO92i8DRrReiKlMwu8tXlDpxIYMdJhQ?=
 =?us-ascii?Q?qYsg51TTeYJoexLeHJIPJTlB4WE19Sl1wzwAqenIAFBMP7pag/ySSMge18z3?=
 =?us-ascii?Q?BnUlUoXT4Vi98l11GTw1rKNKONMykpixMssadvUUIJLzh0jLq0Jqs+mw9Wry?=
 =?us-ascii?Q?rtEMQPI+DIcuKd++JCAjZF6xohjlNqO0STJT17VneGiNyLvdeeptvXrTfqC7?=
 =?us-ascii?Q?a6pkY2ftwin7sfemDhNbAsNKfB6254kPv2CHLfKLCb7X+9NOgTewwxwKVGiQ?=
 =?us-ascii?Q?2RAwtESY9OgeXS1K4UWx5OI6C2agYY+gFzq81DxEz2bCm7OaLY4WD46oi0su?=
 =?us-ascii?Q?k2Q9DE22EzZ/kotTa9hm/igtPQtvcGrbDhShOkoZzd1PzMqrhmywikhiDUeQ?=
 =?us-ascii?Q?FCBnl6N/OL96VKTR7snImx7iooMMk0qEqLar7sN24FPKlPNz05wxWvFvdRS/?=
 =?us-ascii?Q?OeXVTdoqmBjmNlCTWUp26MH1iwrHk5PuW9aNR3vOKz/H7WxbH4L6QPQeSe+v?=
 =?us-ascii?Q?ZcxUYTPV81dcX/0msyIhKxN+H8y3y/N45ymYCNgoXMLPLtttA72baGOI95gw?=
 =?us-ascii?Q?Iv3jw/+Cl5Gb9Wbx9ziDhWmwPPlSq4rH6R2rzvbftdBC2dwOTKcHpoHdQOLv?=
 =?us-ascii?Q?vHJzrqumlA8vRdFmFsCJHx1HQuiQiHBGn8ztMOObWsK2N3rTVIsRctKeOFTu?=
 =?us-ascii?Q?t1aSuQOLdoGlgMbmIqToFiw9gOKvrCLunEAOieBeF6tFEBow0tdr9GApUL12?=
 =?us-ascii?Q?G4bFHRXbjNBNvgQgkvZwaE2z1qgzGQwWzukj8Tx5HS99EXjc32ePlVU3efIP?=
 =?us-ascii?Q?Ya8zC6IIOYcWb5BZEWAJKT2lL+ORhL3VvRa2NXSyo3YC7c1aoBXwVxr4uYNH?=
 =?us-ascii?Q?eqmkey9vuSy2sJcnI+NqgvHGiLuf/Qg4MqMwonWc94Rr02mZ9Q3vztxTetd/?=
 =?us-ascii?Q?b/bOoxExoMTaACZRBblJ76M=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9d917c-880d-4ecc-8cf0-08d9fc6b82a0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:41:33.3989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7tealzHKi2/Y4MUQ6jZSpoZBmB2kqqrTwCwXcX8MgfQpHBReBLJlAyfYrSQnPkRWlifeiHXD2sb2wnxJegnpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2144
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10274 signatures=686787
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203020073
X-Proofpoint-GUID: xPsxU6gPkrmz3Wlg0gwV9WTg5hs2wqHP
X-Proofpoint-ORIG-GUID: xPsxU6gPkrmz3Wlg0gwV9WTg5hs2wqHP

No functional change.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 arch/x86/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index d9c945ee1100..55b3407358a9 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -45,7 +45,7 @@ static unsigned long xen_tsc_khz(void)
 
 static u64 xen_clocksource_read(void)
 {
-        struct pvclock_vcpu_time_info *src;
+	struct pvclock_vcpu_time_info *src;
 	u64 ret;
 
 	preempt_disable_notrace();
-- 
2.17.1


