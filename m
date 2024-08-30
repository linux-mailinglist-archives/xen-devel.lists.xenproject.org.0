Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8F965A21
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 10:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786269.1195836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjwtg-00060P-7B; Fri, 30 Aug 2024 08:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786269.1195836; Fri, 30 Aug 2024 08:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjwtg-0005xg-3R; Fri, 30 Aug 2024 08:22:20 +0000
Received: by outflank-mailman (input) for mailman id 786269;
 Fri, 30 Aug 2024 08:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9l7=P5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sjwtf-0005xa-9d
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 08:22:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f89edaaa-66a8-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 10:22:18 +0200 (CEST)
Received: from [192.168.1.113] (93-36-216-241.ip62.fastwebnet.it
 [93.36.216.241])
 by support.bugseng.com (Postfix) with ESMTPSA id 8319F4EE0793;
 Fri, 30 Aug 2024 10:22:17 +0200 (CEST)
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
X-Inumbo-ID: f89edaaa-66a8-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725006137; bh=LV1XKfX2gBtEoHP2z/+y6FzvetF+AY30cg8xQrYI/2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XaCGi10eW3QPWCKAMNHIJ5L51r1+RJ3MTbVtuHe30zo5ZNMRbvdsyIjym2jG9Ht4O
	 744yXQD/HzzRq3aXoRYiqCG5cpUctdQSov7sQMhXZBQGI4MBgxwldjfM2FJdKXuHza
	 TLtmIaNbiTmiMidiaeOobpvzRFBpplfimxmKBTZ9D5YWBI7uIOBFa+kfVBnw8VJNM5
	 +gG8nP2hliZYwZ66dsyPxpX5sL4tl9RcSO80ACoCowqSMSPro5sVdar2Scjv4IRiOC
	 QsiL2a16Avj6W+VlN1MQUYehAqZkcnvlPsbKqrH3fsnfPV/CIIXGy7WHMEyqNnWAPL
	 lzx0yzCO0CEzg==
Message-ID: <1194cb27-b188-4f20-8906-b6b7e6b9f87f@bugseng.com>
Date: Fri, 30 Aug 2024 10:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/bitmap: remove comment-based deviations
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>
References: <4aa692a50a5d08d24560f02fdc36911965fc860b.1724850701.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2408281741550.53815@ubuntu-linux-20-04-desktop>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2408281741550.53815@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/24 02:42, Stefano Stabellini wrote:
> On Wed, 28 Aug 2024, Federico Serafini wrote:
>> Update ECLAIR configuration of MISRA C:2012 Rule 20.7 ("Expressions
>> resulting from the expansion of macro parameters shall be enclosed in
>> parentheses") to tag as 'safe' the expansions of arguments surrounded
>> by the following tokens: '{', '}' and ';'.
>>
>> Remove redundant comment-based deviations.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> I am missing some context: is this done to cover other cases similar to
> the one below (bitmap_allocate_region) or is this done only to get rid
> of the three SAF-7-safe in-code comments?

This is done to cover also other cases that may occur in the future.
More details here:
https://lists.xenproject.org/archives/html/xen-devel/2024-08/msg01392.html

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

