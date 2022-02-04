Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D84A9FFC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 20:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265778.459319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG4Ch-0003pA-MY; Fri, 04 Feb 2022 19:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265778.459319; Fri, 04 Feb 2022 19:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG4Ch-0003mB-Is; Fri, 04 Feb 2022 19:25:07 +0000
Received: by outflank-mailman (input) for mailman id 265778;
 Fri, 04 Feb 2022 19:25:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nG4Cg-0003m5-DS
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 19:25:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nG4Cg-000886-2C; Fri, 04 Feb 2022 19:25:06 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.2.73])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nG4Cf-0004a2-ST; Fri, 04 Feb 2022 19:25:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=UmYwFKjuZniQ5W8er5h6lo5XNwJ6ZaWyhLALG9Yakdo=; b=QfHyVAhIx8cF1FKh4Ytv/pnEJu
	yzNaAXgblGuwx1OG9pd59LiSU0xT+/A1hjQ4CElF9Svd8wIBXuBYPsxAVMibRLT+omDcOn7tlWOZ4
	7qHWliLMPaRFiZG59Paxts/wiVjrLUGmef4qdA7/kZkCSLSAEvNY7xSzj8fNyvRS/oro=;
Message-ID: <e91bde3e-dc45-c731-7df6-e0e45039d1b2@xen.org>
Date: Fri, 4 Feb 2022 19:25:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2] docs: document patch rules
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220203125438.21807-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220203125438.21807-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/02/2022 12:54, Juergen Gross wrote:
> +## The commit message
> +
> +The commit message is free text describing *why* the patch is done and
> +*how* the goal of the patch is achieved. A good commit message will describe
> +the current situation, the desired goal, and the way this goal is being
> +achieved. Parts of that can be omitted in obvious cases.
> +
> +In case additional changes are done in the patch (like e.g. cleanups), those
> +should be mentioned.
> +
> +When referencing other patches (e.g. `similar to patch xy ...`) those
> +patches should be referenced via their commit id (at least 12 digits)
> +and the patch subject, if the very same patch isn't referenced by the
> +`Fixes:` tag, too:
> +
> +    Similar to commit 67d01cdb5518 ("x86: infrastructure to allow converting
> +    certain indirect calls to direct ones") add ...
> +
> +The following ``git config`` settings can be used to add a pretty format for
> +outputting the above style in the ``git log`` or ``git show`` commands:
> +
> +        [core]
> +                abbrev = 12
> +        [pretty]
> +                fixes = Fixes: %h (\"%s\")
> +
> +Lines in the commit message should not exceed 75 characters, except when

I was under the impression that commit message should be wrap to 72 
characters. This is because tools like "git log" would indent the commit 
message by 8 characters.

> +copying error output directly into the commit message.
> +
> +## Tags
> +
> +Tags are entries in the form
> +
> +    Tag: something
> +
> +In general tags are added in chronological order. So a `Reviewed-by:` tag
> +should be added **after** the `Signed-off-by:` tag, as the review happened
> +after the patch was written.
> +
> +Do not split a tag across multiple lines, tags are exempt from the
> +"wrap at 75 columns" rule in order to simplify parsing scripts.

This would need to be adjusted depending on the answer above.

> +
> +### Origin:
> +
> +Xen has inherited some source files from other open source projects. In case
> +a patch modifying such an inherited file is taken from that project (maybe in
> +modified form), the `Origin:` tag specifies the source of the patch:
> +
> +    Origin: <repository-URL> <commit-id>

NIT: Likes you did for Fixes tags, can you make clear that the commit id 
should be the first 12 characters? So the line...

> +
> +E.g.:
> +
> +    Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f093b08c47b3

... doesn't get horribly long.

> +
> +All tags **above** the `Origin:` tag are from the original patch (which
> +should all be kept), while tags **after** `Origin:` are related to the
> +normal Xen patch process as described here.

Cheers,

-- 
Julien Grall

