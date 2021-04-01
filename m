Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA3351591
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104518.199981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy4X-0002WR-NH; Thu, 01 Apr 2021 14:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104518.199981; Thu, 01 Apr 2021 14:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy4X-0002W2-Jl; Thu, 01 Apr 2021 14:13:21 +0000
Received: by outflank-mailman (input) for mailman id 104518;
 Thu, 01 Apr 2021 14:13:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRy4V-0002Vx-U5
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:13:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da409f7a-6212-4446-9525-314178b2430f;
 Thu, 01 Apr 2021 14:13:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F09F8B21D;
 Thu,  1 Apr 2021 14:13:17 +0000 (UTC)
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
X-Inumbo-ID: da409f7a-6212-4446-9525-314178b2430f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617286398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5R1iFocCrCea+Q5CcekCM394fJXvvNmfhZ4ckV/HZw4=;
	b=peDM+GzJLIOurWE/aJeXyz5Jit3ZlwNVPChscDbWL9L0PtWNknTu2s3kBn0GuooNVretBQ
	Y85W8cprQk+U6clKIYpmE3zz/nkmCX2GuZpr3+aXBkZ8jyzEU7C6M5vspYINSoL8nkTjMZ
	+uiWilsKU9NQywT9ycbQLdvOLjDvQRo=
Subject: Re: [PATCH for-4.15 4/7] CHANGELOG.md: Mention various ARM errata
To: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-4-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <330feed2-d601-8b79-3c1f-bd8be167b8eb@suse.com>
Date: Thu, 1 Apr 2021 16:13:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401133827.362216-4-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 15:38, George Dunlap wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
>   - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
>   - Some additional affordances in various xl subcommands.
> + - Added the following ARM errata: Cortex A53 #843419, Cortex A55 #1530923, Cortex A72 #853709, Cortex A73 #858921, Cortex A76 #1286807, Neoverse-N1 #1165522

May I suggest "Added workarounds for ..."?

Jan

