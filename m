Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932B4A8479A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945983.1344033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tfp-0008O9-PW; Thu, 10 Apr 2025 15:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945983.1344033; Thu, 10 Apr 2025 15:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tfp-0008MQ-Mc; Thu, 10 Apr 2025 15:18:37 +0000
Received: by outflank-mailman (input) for mailman id 945983;
 Thu, 10 Apr 2025 15:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kj+o=W4=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1u2tfo-0008MK-1x
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:18:36 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 114f33bf-161f-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 17:18:34 +0200 (CEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AEK7vi022679;
 Thu, 10 Apr 2025 15:18:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x02qdg47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 15:18:25 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53AF8TYT001916;
 Thu, 10 Apr 2025 15:18:24 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x02qdg44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 15:18:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD96gI025537;
 Thu, 10 Apr 2025 15:18:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbm6hc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 15:18:23 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 53AFIMnK41025908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Apr 2025 15:18:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E809920043;
 Thu, 10 Apr 2025 15:18:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95A3620040;
 Thu, 10 Apr 2025 15:18:21 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.155.204.135])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Apr 2025 15:18:21 +0000 (GMT)
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
X-Inumbo-ID: 114f33bf-161f-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=8yZK2G8CEMH6GwaqesHa1lpHB+Zat5
	CGXDOr1+EXSC4=; b=XFA2NdY/+9mY/FXZshAh96j80DyvTbKTueTNVZhU0+yxab
	LQAS6lEJM05MHO0qcxITWU3AUuUwWhbR+rH5gkM+i5KY2ZDS+KKPgm1w0TTco7lI
	1ejRJgDisSwZgBF3F7/68V/hVDGKZc5EEq9Xbxm5cvuOYh4E30FthuwpbSU11IR+
	iDHdgVm8V9yC0zoCKXcaGa8GjQj57F15LDzr//DrGKBhJwZitM11zufCoRjeljn7
	kao0b+0vHjeDd5MF+VPhYDC+2gDDWrc+hl5DxvXUunM3PNAcgrnztpsj+jwiIr5G
	heQFmmMTR5ltMcYN1TVWdpLd/G4AaU/rogD2SyZg==
Date: Thu, 10 Apr 2025 17:18:20 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] kasan: Avoid sleepable page allocation from
 atomic context
Message-ID: <Z/fhPL5bH2A2Cs97@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
 <3e245617-81a5-4ea3-843f-b86261cf8599@gmail.com>
 <Z/aDckdBFPfg2h/P@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <02d570de-001b-4622-b4c4-cfedf1b599a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02d570de-001b-4622-b4c4-cfedf1b599a1@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jHtw6lgVB7srP7G4ujZD7xCcxXdTfHSC
X-Proofpoint-ORIG-GUID: fFGj102REu_S4ew0_ixvtgn6rzege4GH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=961 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100109

On Wed, Apr 09, 2025 at 04:56:29PM +0200, Andrey Ryabinin wrote:

Hi Andrey,

...
> >>> -	page = __get_free_page(GFP_KERNEL);
> >>> +	page = __get_free_page(GFP_ATOMIC);
> >>>  	if (!page)
> >> I think a better way to fix this would be moving out allocation from atomic context. Allocate page prior
> >> to apply_to_page_range() call and pass it down to kasan_populate_vmalloc_pte().
> > I think the page address could be passed as the parameter to kasan_populate_vmalloc_pte().
> 
> We'll need to pass it as 'struct page **page' or maybe as pointer to some struct, e.g.:
> struct page_data {
>  struct page *page;
> };
...

Thanks for the hint! I will try to implement that, but will likely start
in two weeks, after I am back from vacation.

Not sure wether this version needs to be dropped.

Thanks!

