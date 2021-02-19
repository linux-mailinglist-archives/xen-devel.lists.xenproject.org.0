Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3780431F61E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 09:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86816.163265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD1dB-0002gE-8V; Fri, 19 Feb 2021 08:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86816.163265; Fri, 19 Feb 2021 08:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD1dB-0002fp-3R; Fri, 19 Feb 2021 08:59:21 +0000
Received: by outflank-mailman (input) for mailman id 86816;
 Fri, 19 Feb 2021 08:59:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCn1=HV=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1lD1d9-0002fi-Tl
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 08:59:19 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 060d340e-b71c-4df6-b871-1de4ae3bc77f;
 Fri, 19 Feb 2021 08:59:19 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11J8oEwu089650;
 Fri, 19 Feb 2021 08:59:18 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 36p7dnrmq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 08:59:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11J8tluC182172;
 Fri, 19 Feb 2021 08:59:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 36prhvdt6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 08:59:16 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11J8xEaX004380;
 Fri, 19 Feb 2021 08:59:14 GMT
Received: from mwanda (/10.175.194.66) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 19 Feb 2021 00:59:14 -0800
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
X-Inumbo-ID: 060d340e-b71c-4df6-b871-1de4ae3bc77f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=hVrBwJZyZrcozmvRMSPGChZCnCSYVBUl6bBNcrGOdYw=;
 b=PvZe8gqiauPCdqpWnwOV8wL4kc3qPa31MxW2NhR56mviODnh5aRcHJX31jyVu4sjt/2u
 g+hE02V+KeooZPLftvwl56ZswAWq/6fTxbNWmsZ2KforuUUJl1bGSRh0E6w13Cd/WS1m
 Y9hG1/mYdAMH5Oe+i5mu/CAtl+/hqaenwL0/I7zLGoxoBsc5bqT9L43KascJEnn09Bl6
 o9ouSESqXurilKQ9QcQ2lUxaFP9B29BqgyZ7+GcV2Ejlus0CnAu+ookRU0BzTuqYdSZJ
 9FyZkgnw5I6eNE5r6EtAw/w7fs1Tjy0WaJGELQ/ROXH8l/4BlBd6dGtmfvA0ukHBmEB3 NA== 
Date: Fri, 19 Feb 2021 11:59:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jbeulich@suse.com
Cc: xen-devel@lists.xenproject.org
Subject: [bug report] xen-blkback: don't "handle" error by BUG()
Message-ID: <YC992dHyignVEe5R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=846 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190070
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=783
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190069

Hello Jan Beulich,

The patch 5a264285ed1c: "xen-blkback: don't "handle" error by BUG()"
from Feb 15, 2021, leads to the following static checker warning:

	drivers/block/xen-blkback/blkback.c:836 xen_blkbk_map()
	warn: should this be a bitwise negate mask?

drivers/block/xen-blkback/blkback.c
   823           * Now swizzle the MFN in our domain with the MFN from the other domain
   824           * so that when we access vaddr(pending_req,i) it has the contents of
   825           * the page from the other domain.
   826           */
   827          for (seg_idx = last_map, new_map_idx = 0; seg_idx < map_until; seg_idx++) {
   828                  if (!pages[seg_idx]->persistent_gnt) {
   829                          /* This is a newly mapped grant */
   830                          BUG_ON(new_map_idx >= segs_to_map);
   831                          if (unlikely(map[new_map_idx].status != 0)) {
   832                                  pr_debug("invalid buffer -- could not remap it\n");
   833                                  gnttab_page_cache_put(&ring->free_pages,
   834                                                        &pages[seg_idx]->page, 1);
   835                                  pages[seg_idx]->handle = BLKBACK_INVALID_HANDLE;
   836                                  ret |= !ret;

Originally this code was:

	ret |= 1;

Now it's equivalent to:

	if (!ret)
		ret = 1;

This is the second user of this idiom in the kernel.  Both were
introduced in the last month so maybe it's a new trend or something...
Anyway.  False positive warning.

But my main question isn't really related to this patch.  What does
the 1 mean in this context?  I always feel like there should be
documentation when functions return a mix of error codes, zero and one
but there isn't any here.

I have reviewed this and so far as I can see setting "ret = 1;" is
always treated exactly the same as an error code by everything.  Every
single place where this is checked just checks for ret is zero.  The
value is propagated two functions back and then it becomes -EIO.

???

   837                                  goto next;
   838                          }
   839                          pages[seg_idx]->handle = map[new_map_idx].handle;
   840                  } else {
   841                          continue;
   842                  }
   843                  if (use_persistent_gnts &&

regards,
dan carpenter

