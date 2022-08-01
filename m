Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE7586A88
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 14:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378723.612075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIUMe-00020h-9U; Mon, 01 Aug 2022 12:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378723.612075; Mon, 01 Aug 2022 12:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIUMe-0001xq-5p; Mon, 01 Aug 2022 12:17:40 +0000
Received: by outflank-mailman (input) for mailman id 378723;
 Mon, 01 Aug 2022 12:17:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnBj=YF=amazon.de=prvs=205531b88=mheyne@srs-se1.protection.inumbo.net>)
 id 1oIUMb-0001xk-Qi
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 12:17:38 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb0d2107-1193-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 14:17:33 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-d9fba5dd.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 12:17:12 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-d9fba5dd.us-west-2.amazon.com (Postfix) with
 ESMTPS id E0BE24436F; Mon,  1 Aug 2022 12:17:11 +0000 (UTC)
Received: from EX13D41UWB001.ant.amazon.com (10.43.161.189) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Mon, 1 Aug 2022 12:17:11 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D41UWB001.ant.amazon.com (10.43.161.189) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Mon, 1 Aug 2022 12:17:11 +0000
Received: from dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (10.15.57.183)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1497.36 via Frontend Transport; Mon, 1 Aug 2022 12:17:10 +0000
Received: by dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id CEB4A2461; Mon,  1 Aug 2022 12:17:09 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: eb0d2107-1193-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1659356254; x=1690892254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ySOxho5n+e29wKv8kNSyg1yqXHN2bw+cAsG5rNSiT8k=;
  b=nUi2tegPNJR2YCoghocJn/DfrLbFuWPuZ+qDfkPnUWSWTS+2RBCwJzH/
   gY7JMcpj1C5ykDK4+DDeZXECWHn+JFWdMF0fOqsC9llZQKlcKcylIGBz2
   fJS59mfQXrL+b8lrJT8jWaS0EkWfKPm8BV3h4QpI1h9GI2q4f+fHMiLcA
   4=;
X-IronPort-AV: E=Sophos;i="5.93,206,1654560000"; 
   d="scan'208";a="114337904"
Date: Mon, 1 Aug 2022 12:17:09 +0000
From: Maximilian Heyne <mheyne@amazon.de>
To: SeongJae Park <sj@kernel.org>
CC: <roger.pau@citrix.com>, <axboe@kernel.dk>, <boris.ostrovsky@oracle.com>,
	<jgross@suse.com>, <olekstysh@gmail.com>, <andrii.chepurnyi82@gmail.com>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] xen-blk{back, front}: Fix two bugs in
 'feature_persistent'
Message-ID: <20220801121709.GA40940@dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com>
References: <20220715225108.193398-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220715225108.193398-1-sj@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk

On Fri, Jul 15, 2022 at 10:51:05PM +0000, SeongJae Park wrote:
> 
> Introduction of 'feature_persistent' made two bugs.  First one is wrong
> overwrite of 'vbd->feature_gnt_persistent' in 'blkback' due to wrong
> parameter value caching position, and the second one is unintended
> behavioral change that could break previous dynamic frontend/backend
> persistent feature support changes.  This patchset fixes the issues.
> 
> Changes from v3
> (https://lore.kernel.org/xen-devel/20220715175521.126649-1-sj@kernel.org/)
> - Split 'blkback' patch for each of the two issues
> - Add 'Reported-by: Andrii Chepurnyi <andrii.chepurnyi82@gmail.com>'
> 
> Changes from v2
> (https://lore.kernel.org/xen-devel/20220714224410.51147-1-sj@kernel.org/)
> - Keep the behavioral change of v1
> - Update blkfront's counterpart to follow the changed behavior
> - Update documents for the changed behavior
> 
> Changes from v1
> (https://lore.kernel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/)
> - Avoid the behavioral change
>   (https://lore.kernel.org/xen-devel/20220121102309.27802-1-sj@kernel.org/)
> - Rebase on latest xen/tip/linux-next
> - Re-work by SeongJae Park <sj@kernel.org>
> - Cc stable@
> 
> Maximilian Heyne (1):
>   xen-blkback: Apply 'feature_persistent' parameter when connect
> 
> SeongJae Park (2):
>   xen-blkback: fix persistent grants negotiation
>   xen-blkfront: Apply 'feature_persistent' parameter when connect
> 
>  .../ABI/testing/sysfs-driver-xen-blkback      |  2 +-
>  .../ABI/testing/sysfs-driver-xen-blkfront     |  2 +-
>  drivers/block/xen-blkback/xenbus.c            | 20 ++++++++-----------
>  drivers/block/xen-blkfront.c                  |  4 +---
>  4 files changed, 11 insertions(+), 17 deletions(-)
> 
> --
> 2.25.1
> 

Changes look good to me. Thank you for reworking my patch and also fixing the
blkfront driver.

Reviewed-by: Maximilian Heyne <mheyne@amazon.de>



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




