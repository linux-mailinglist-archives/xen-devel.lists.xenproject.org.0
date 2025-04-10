Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D63A846D9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945826.1343942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tF2-0004bw-SF; Thu, 10 Apr 2025 14:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945826.1343942; Thu, 10 Apr 2025 14:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tF2-0004Zy-PK; Thu, 10 Apr 2025 14:50:56 +0000
Received: by outflank-mailman (input) for mailman id 945826;
 Thu, 10 Apr 2025 14:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kj+o=W4=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1u2tF1-0004Z1-Fl
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:50:55 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3104c2cc-161b-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 16:50:49 +0200 (CEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AEQ4q4003967;
 Thu, 10 Apr 2025 14:50:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x0405aj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 14:50:37 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53AEfDgF001462;
 Thu, 10 Apr 2025 14:50:37 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x0405aj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 14:50:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53AC31SV024610;
 Thu, 10 Apr 2025 14:50:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ueutpp0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 14:50:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 53AEoYcK56623564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Apr 2025 14:50:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFFC920043;
 Thu, 10 Apr 2025 14:50:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 772A620040;
 Thu, 10 Apr 2025 14:50:34 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.155.204.135])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Apr 2025 14:50:34 +0000 (GMT)
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
X-Inumbo-ID: 3104c2cc-161b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=BYsGu8041TJKDiTwC4nSOTLKvk5gUh
	74iryFT/a8d94=; b=GHSeuzsUYd5nnNQMYil5RelPGATOvgyAywzOxJ8ecP/SWP
	pn/mbmYaHdwCwUMAiJchyY30pmPlbSCMFFwBLGsMlSs39dXVX8wR1GWOY61y+0I9
	P0fVUW4aYmRCJt2TXf7GxdcbhCjv+LYQ2vBPvnBpnFU0t6CE38HS29clGo+4f/nj
	DIStYZ76sdRxSSc36EKkGsYDNAaysM2Veay/8iLlowkE4hGgnio8RuAPMxt6K8FW
	8xXMFJKzHph+Prt3GToaVI/MY56YzACT+pxcQ5p8770ENhkmVA/kVzvtqNT9aV+e
	oRgC3ZC/6bo4KGJ+lkxpw9SfI/8xtksuUdeq23UQ==
Date: Thu, 10 Apr 2025 16:50:33 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm: Protect kernel pgtables in
 apply_to_pte_range()
Message-ID: <Z/fauW5hDSt+ciwr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <ef8f6538b83b7fc3372602f90375348f9b4f3596.1744128123.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef8f6538b83b7fc3372602f90375348f9b4f3596.1744128123.git.agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qOyZ_qtfAnXBqjGgzKrxZe6XNJEPhu2V
X-Proofpoint-GUID: IFxT-UrSu4Mf43qBHxm909ZShflClWgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=557
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100105

On Tue, Apr 08, 2025 at 06:07:32PM +0200, Alexander Gordeev wrote:

Hi Andrew,

> The lazy MMU mode can only be entered and left under the protection
> of the page table locks for all page tables which may be modified.

Heiko Carstens noticed that the above claim is not valid, since
v6.15-rc1 commit 691ee97e1a9d ("mm: fix lazy mmu docs and usage"),
which restates it to:

"In the general case, no lock is guaranteed to be held between entry and exit
of the lazy mode. So the implementation must assume preemption may be enabled"

That effectively invalidates this patch, so it needs to be dropped.

Patch 2 still could be fine, except -stable and Fixes tags and it does
not need to aim 6.15-rcX. Do you want me to repost it?

Thanks!

