Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132484DD6E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 10:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678061.1055113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY19M-0006JY-Is; Thu, 08 Feb 2024 09:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678061.1055113; Thu, 08 Feb 2024 09:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY19M-0006H1-FG; Thu, 08 Feb 2024 09:56:56 +0000
Received: by outflank-mailman (input) for mailman id 678061;
 Thu, 08 Feb 2024 09:56:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z5WF=JR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rY19K-0006Gr-V8
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 09:56:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6287b7d9-c668-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 10:56:53 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3939F4EE0739;
 Thu,  8 Feb 2024 10:56:52 +0100 (CET)
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
X-Inumbo-ID: 6287b7d9-c668-11ee-8a4a-1f161083a0e0
MIME-Version: 1.0
Date: Thu, 08 Feb 2024 10:56:52 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] docs/misra: add x86_64 and arm64 asm-offset.c to
 exclude-list
In-Reply-To: <9b9c128f-f143-4c2c-9ee2-67a240d216d5@suse.com>
References: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
 <9b9c128f-f143-4c2c-9ee2-67a240d216d5@suse.com>
Message-ID: <2b30967d547330ed5d1b521733d19d82@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 2024-02-08 09:05, Jan Beulich wrote:
> On 08.02.2024 08:55, Nicola Vetrini wrote:
>> These two files contain several deliberate violations of MISRA C rules 
>> and
>> they are not linked in the final Xen binary, therefore they can be 
>> exempted
>> from MISRA compliance.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Since the exclude list only contains arm64 and x86 files I reasoned 
>> that
>> introducing an entry that would match all architectures would not be 
>> desirable
>> (e.g., arm32). I'm happy to change that, though.
> 
> Just wanted to ask - if globs are permitted, I'd favor covering all 
> possible
> architectures. It is certainly expected that they all follow suit. Just 
> that
> in the absence of sub-architectures the path would be 
> xen/arch/*/asm-offsets.c
> (and it's quite possible that we may, over time, morph x86 to a 
> sub-arch-less
> form).
> 
> Jan
> 

Ok, I'll modify it. Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

