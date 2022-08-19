Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13064599717
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390131.627380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxLt-0002P5-Ip; Fri, 19 Aug 2022 08:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390131.627380; Fri, 19 Aug 2022 08:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxLt-0002Ml-FT; Fri, 19 Aug 2022 08:27:37 +0000
Received: by outflank-mailman (input) for mailman id 390131;
 Fri, 19 Aug 2022 08:27:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wa9Z=YX=citrix.com=prvs=223f339b3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oOxLs-0002Mf-1f
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:27:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5602112-1f98-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 10:27:34 +0200 (CEST)
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
X-Inumbo-ID: c5602112-1f98-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660897654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vbLNEDBddnSMh0BLDSY+nEmsJhF/tinWER1wLXptJw=;
  b=gM9bV9nRLP50A5CjpL/sUnHUAN/3qjOaJ9Qzz0Tbvyu+66CXeQLSeTKU
   zmqXLQznryu90FLuh/MMo+96iITU8/xZ/jqUpwKnNBrap2O2qVIXdEuqe
   dfuyC9FAWrK8+/RRZ9klxhEeeOxrBbabCOQzWbQXJhk2IVMZfLtQGwXZV
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78194798
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Czyd96kSxmpaXjult/z/sJ7o5gzvJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfUT+Fb/7cYjagLdh0YIi+804GuZbdnYVnGlFk+Sg0RCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K2i4GhwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kRI7wow9dqOF1n9
 M4UaxQfaEiMmOGPlefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oe9aYuJJY3aLSlTtkqU+
 U/B+WD7OU9ZOeCWzAiro2D2vMaayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy10amlnQqDJBEpBG4waWwgXw1d7MbgmdRm5v7QdeqPAJJZn/WsR2+ok
 2/W9Xhg71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuscDYCT1PPMpM9nZ5yEWIU/IRLzYug38NIISMvCdiifclM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4nNEiT9xLvHr91+eJ6mUgDKZb7H8+TI+KPjeXDPxZ4iN4tbDOzUwzOxPrU/l2Io
 4gEa5DiJtc2eLSWXxQ7OLU7dTgiRUXXz7ivwyCLXoZv+jZbJVw=
IronPort-HdrOrdr: A9a23:H2liK6s88TSIN3Q4ivxUGtUk7skDdNV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVcqKRUdcL+7VJVoLUmyyXcx2/h2AV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyIMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.93,247,1654574400"; 
   d="scan'208";a="78194798"
Date: Fri, 19 Aug 2022 09:27:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2] xenbaked: properly use time_t in dump_stats()
Message-ID: <Yv9JZtKzr69Osxbr@perard.uk.xensource.com>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
 <c3b8c742-928f-80af-3cf4-4962b96721e1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c3b8c742-928f-80af-3cf4-4962b96721e1@suse.com>

On Fri, Aug 19, 2022 at 09:59:26AM +0200, Jan Beulich wrote:
> "int" is not a suitable type to convert time()'s return value to. Avoid
> casts and other extra fiddling by using difftime(), on the assumption
> that the overhead of using "double" doesn't matter here.
> 
> Coverity ID: 1509374
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Properly use %.0f everywhere.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

