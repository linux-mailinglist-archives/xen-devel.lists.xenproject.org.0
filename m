Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3733B972C03
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795085.1204208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snw76-0002xK-Ot; Tue, 10 Sep 2024 08:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795085.1204208; Tue, 10 Sep 2024 08:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snw76-0002vU-M0; Tue, 10 Sep 2024 08:20:40 +0000
Received: by outflank-mailman (input) for mailman id 795085;
 Tue, 10 Sep 2024 08:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0jq=QI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1snw75-0002vO-M2
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:20:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fb8b6f5-6f4d-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 10:20:38 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8F7634EE079F;
 Tue, 10 Sep 2024 10:20:38 +0200 (CEST)
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
X-Inumbo-ID: 8fb8b6f5-6f4d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725956438; bh=4BK6rWzwBtY1iOs8nmvpj770Ml4kBbt8CL5HVoOy3hk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DMFwF3pVZ72yGh/33UNvpq72R6GtYoqhIeWctKailvfRx8ecFMhTpj6I3HUeTkR0F
	 hb0vLxlTIk2vIYD3HmEZjbUhDMg0fQQ/3e4BdlIi15UQEG4LVZHD2V4/oi8723Onsp
	 kPn6CvRryfQZVwf22qBr+FAVCnHFuOXSLgvSJlaV+KaxLBX63bkZyogMeygS/2/1rQ
	 hTQuHdxW9HU9tCM/2oc0dnPvEXPVywV+9y2EuTKpEgCyKIn8/B/pN+VkB6c2IBcXqL
	 a4lovQwHYchygmoPeJ2aZRj16K+4aYgoIGnr7Fnz3Ef2M/BKTJOo7ZUny1IFPTE2bH
	 cP2JZ8Yyc69vg==
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 10:20:38 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>, Doug Goldstein
 <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] automation/eclair_analysis: fix MISRA Rule 20.7
 regression in self-tests.h
In-Reply-To: <alpine.DEB.2.22.394.2409092138490.3672@ubuntu-linux-20-04-desktop>
References: <4e59a8b7d97f34a824922013ffe5e44f70e6abaf.1725801931.git.nicola.vetrini@bugseng.com>
 <7aba7d0b-54d4-43da-894c-367d2271c696@suse.com>
 <alpine.DEB.2.22.394.2409092138490.3672@ubuntu-linux-20-04-desktop>
Message-ID: <a1446d60e990346fad08ff69ae042bdc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-10 06:39, Stefano Stabellini wrote:
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> On Mon, 9 Sep 2024, Jan Beulich wrote:
>> On 08.09.2024 15:27, Nicola Vetrini wrote:
>> > --- a/docs/misra/deviations.rst
>> > +++ b/docs/misra/deviations.rst
>> > @@ -533,6 +533,14 @@ Deviations related to MISRA C:2012 Rules:
>> >         to incur in the risk of being misused or lead to developer confusion, and
>> >         refactoring it to add parentheses breaks its functionality.
>> >       - Tagged as `safe` for ECLAIR.
>> > +
>> > +   * - R20.7
>> > +     - The macros `{COMPILE,RUNTIME}_CHECK` defined in
>> > +       `xen/include/xen/self-tests.h` are allowed not to parenthesize their
>> > +       arguments, to allow function-like macros to be tested as well as
>> > +       functions. Given the specialized use of these macros and their limited
>> > +       usage scope, omitting parentheses is deemed unlikely to cause issues.
>> > +     - Tagged as `deliberate` for ECLAIR.
>> 
>> As on earlier occasions my take here again is that this is going too 
>> far:
>> Beside the "fn" parameter, all other parameter uses should be properly
>> parenthesized. I have no idea whether this can be expressed for 
>> Eclair,
>> but at least the verbal deviation description should imo be no more 
>> lax
>> than necessary.
> 
> I can add a mention to the "fn" parameter on commit

I am ok with that. Unfortunately configuring the tool to only require 
certain parameters to be non-parenthesized is not possible at the 
moment, but it's something that may be considered in the future.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

