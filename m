Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94319735C2E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 18:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551229.860654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHki-0006dd-Ns; Mon, 19 Jun 2023 16:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551229.860654; Mon, 19 Jun 2023 16:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHki-0006bI-J9; Mon, 19 Jun 2023 16:29:16 +0000
Received: by outflank-mailman (input) for mailman id 551229;
 Mon, 19 Jun 2023 16:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mm0T=CH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qBHkg-0006ar-Vq
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 16:29:14 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c5e15be-0ebe-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 18:29:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 721D882855B4;
 Mon, 19 Jun 2023 11:29:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id p8-IH9h3-sgS; Mon, 19 Jun 2023 11:29:10 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7717E82855C2;
 Mon, 19 Jun 2023 11:29:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0Vy12L1RsrKV; Mon, 19 Jun 2023 11:29:10 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D168182855B4;
 Mon, 19 Jun 2023 11:29:09 -0500 (CDT)
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
X-Inumbo-ID: 6c5e15be-0ebe-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7717E82855C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687192150; bh=IiFpyawJr6BDAn444Zd8fGRoKl+ePasSRhwBYIr22cc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=FgWaxq8aZEL9sx3DkdqcOIYz3Hbquumzr8kGYGzxjuFLnKfFbwitaa6YDQszCoHVy
	 u29AQhrZKveG6BTpaj/El/zdZ/A1q+faa4vJkGdjkrIVxfBazOxXqQl1tV6YNnI/yr
	 KhbmI0GX0EX6Lm3sgFNtqEqIG2zfiMZnHcFEGsuk=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <af192a6d-2ab8-6934-3770-6379ddb6381b@raptorengineering.com>
Date: Mon, 19 Jun 2023 11:29:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
 <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
 <07901266-4536-bcd5-70a4-5b5675a1ced4@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <07901266-4536-bcd5-70a4-5b5675a1ced4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/23 11:07 AM, Jan Beulich wrote:
>> It seems like the build system expects an `$(ARCH)_defconfig` present if
>> you don't manually specify a defconfig target. I see riscv64 has a
>> tiny64_defconfig and a riscv64_defconfig that are idential, probably for
>> this same reason. Would you like me to take the same approach of
>> duplicating openpower_defconfig to ppc64_defconfig?
> 
> It's a symlink for RISC-V iirc, so wants to be that same way for PPC
> then (for the time being, again like there).

Ah, you're right, riscv uses a symlink. I'll use that approach here as
well then.

>> Good point. Following the example in the Power ELFv2 ABI
>> specification [1] for function type annotation, I'll place
>>
>> .type start, @function
>>
>> in the ENTRY macro. It's not clear what the difference between %function
>> and @function are in this context (my toolchain seems to accept both and
>> produce the same ELF metadata), but the latter is more idiomatic in
>> Power assembly. The same goes for its placement before the entrypoint
>> vs. after the last instruction.
> 
> % and @ are entirely the same here, except for targets like arm-*,
> where @ starts a comment.

Okay, thanks for the confirmation. Is there a preference for which one
is used? I'd lean towards @ just for the sake of remaining idiomatic,
but since they're equivalent it doesn't really matter from my
perspective.

>> No plans on supporting dynamic relocation (for now), so I can go ahead
>> and add these assertions.
> 
> How would you ever use dynamic relocations? You have no loader to
> process them for you. (Yes, there can of course be relocation free
> head.S code which deals with relocations, but doing such in assembly
> is likely not the best idea. Yet as soon as you enter C code you're
> at risk of hitting a place requiring such a relocation, perhaps
> simply because of a "careless" function call on some infrequently
> used code path.)

Right, those concerns are definitely something we'd have to deal with if
we ever wanted to add support for relocations (and a large part of the
reason why I said I don't have plans to support it right now).

As an aside, I'll note that Linux uses the approach of doing the
relocation fixups entirely in assembly before the C entrypoint, but
that's obviously not a super desirable approach from a correctness or
maintainability standpoint.

> Jan

Thanks,
Shawn

