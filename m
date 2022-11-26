Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989F26393FD
	for <lists+xen-devel@lfdr.de>; Sat, 26 Nov 2022 06:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448354.705181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oynbu-0001Sn-5c; Sat, 26 Nov 2022 05:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448354.705181; Sat, 26 Nov 2022 05:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oynbu-0001QK-2z; Sat, 26 Nov 2022 05:20:18 +0000
Received: by outflank-mailman (input) for mailman id 448354;
 Sat, 26 Nov 2022 05:08:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYfa=32=oracle.com=harshit.m.mogalapalli@srs-se1.protection.inumbo.net>)
 id 1oynQ5-0007uV-3J
 for xen-devel@lists.xenproject.org; Sat, 26 Nov 2022 05:08:05 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d2a4e19-6d48-11ed-8fd2-01056ac49cbb;
 Sat, 26 Nov 2022 06:08:03 +0100 (CET)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AQ4uq8i011137; Sat, 26 Nov 2022 05:07:56 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m3c7dg07b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 26 Nov 2022 05:07:56 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2AQ4jExv023572; Sat, 26 Nov 2022 05:07:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3m3c1q8p74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 26 Nov 2022 05:07:54 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AQ52vF1011626;
 Sat, 26 Nov 2022 05:07:54 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3m3c1q8p61-1; Sat, 26 Nov 2022 05:07:54 +0000
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
X-Inumbo-ID: 4d2a4e19-6d48-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2022-7-12; bh=hEdmssi73mdZJZby6VH83OA2wc6mC+NgmIbVOzmV8+8=;
 b=YRv/MbqsKUL00lc46HNMmHbRZN5nRNTAQSZErCmQ2JKouYF8lTgHw57IJg+gbcbUbFqd
 j/TK0X5TvVm+D17WWxIbHD5sXRrb0EQDkYT7HLk+f4wMyOHpW0UMMKIdc+AGmnF94kXY
 pCo1Pr5LKwMXHqCEwUM9EthDW3yd7Sh7MsHRsSjOzX0BKlDzISo74jDFDZc4mTCMHiVu
 znFxsXqHM9Q5kTfP4XJqoiVdVTZuyKDNB8v2tUI5u2agBmzDcSSQLsld1MHGaIemOh1K
 g3xsbZodojcNStcjzFzSsRZLSw67l4LmbjP2+Cwy4O0qqFAahDmoBZ7vboDmM0cvvmc9 nw== 
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: 
Cc: harshit.m.mogalapalli@oracle.com, error27@gmail.com,
        harshit.m.mogalapalli@gmail.com, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Paul Durrant <paul.durrant@citrix.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: [PATCH] xen/privcmd: Fix a possible warning in privcmd_ioctl_mmap_resource()
Date: Fri, 25 Nov 2022 21:07:45 -0800
Message-Id: <20221126050745.778967-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-26_04,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211260040
X-Proofpoint-GUID: kO7OwKz7A5zcOQYmakxJLrTnzyx51z-5
X-Proofpoint-ORIG-GUID: kO7OwKz7A5zcOQYmakxJLrTnzyx51z-5

As 'kdata.num' is user-controlled data, if user tries to allocate
memory larger than(>=) MAX_ORDER, then kcalloc() will fail, it
creates a stack trace and messes up dmesg with a warning.

Call trace:
-> privcmd_ioctl
--> privcmd_ioctl_mmap_resource

Add __GFP_NOWARN in order to avoid too large allocation warning.
This is detected by static analysis using smatch.

Fixes: 3ad0876554ca ("xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESOURCE")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/xen/privcmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index fae50a24630b..1edf45ee9890 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -760,7 +760,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 		goto out;
 	}
 
-	pfns = kcalloc(kdata.num, sizeof(*pfns), GFP_KERNEL);
+	pfns = kcalloc(kdata.num, sizeof(*pfns), GFP_KERNEL | __GFP_NOWARN);
 	if (!pfns) {
 		rc = -ENOMEM;
 		goto out;
-- 
2.38.1


