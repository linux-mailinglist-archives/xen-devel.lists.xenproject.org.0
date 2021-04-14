Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C933335F4CE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110620.211147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfYx-0002s7-IU; Wed, 14 Apr 2021 13:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110620.211147; Wed, 14 Apr 2021 13:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfYx-0002ri-FT; Wed, 14 Apr 2021 13:28:11 +0000
Received: by outflank-mailman (input) for mailman id 110620;
 Wed, 14 Apr 2021 13:28:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWfYw-0002rc-33
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:28:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23758cd2-c43a-403b-ac08-7390b9446401;
 Wed, 14 Apr 2021 13:28:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72089B090;
 Wed, 14 Apr 2021 13:28:08 +0000 (UTC)
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
X-Inumbo-ID: 23758cd2-c43a-403b-ac08-7390b9446401
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618406888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eswvml/h9CypC5NWorICAKrA1v1MHT8rqCegSLlllDg=;
	b=iQImrvLsnv0D+fNbfGm/B9Yv60Di5klOWI/yFQdZZARZzFZFhkhNMiZuOJtDaQcJHdKa2X
	GfpHZheQTBnvmTOc25zMaMLVXg7hGw+gwYw0OCa8YV8YDgbGgj47qjG1giP60fNkj/f2Ux
	6qwhbE9C1bkqkQbCHlvUFG3QhfzflKw=
Subject: Re: [PATCH v2 04/21] libs/guest: introduce helper to fetch a system
 cpu policy
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e630294-56e1-ab04-06db-5b942269a0c0@suse.com>
Date: Wed, 14 Apr 2021 15:28:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210413140140.73690-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.04.2021 16:01, Roger Pau Monne wrote:
> Such helper is based on the existing functions to fetch a CPUID and
> MSR policies, but uses the xc_cpu_policy_t type to return the data to
> the caller.
> 
> Note some helper functions are introduced, those are split from
> xc_cpu_policy_get_system because they will be used by other functions
> also.
> 
> No user of the interface introduced on the patch.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

