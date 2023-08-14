Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF977B313
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583356.913560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSRR-0000vy-7J; Mon, 14 Aug 2023 07:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583356.913560; Mon, 14 Aug 2023 07:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSRR-0000tG-4l; Mon, 14 Aug 2023 07:56:45 +0000
Received: by outflank-mailman (input) for mailman id 583356;
 Mon, 14 Aug 2023 07:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DK7P=D7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qVSRQ-0000t7-12
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:56:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bc2a17c-3a78-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:56:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id F0F1A4EE0737;
 Mon, 14 Aug 2023 09:56:42 +0200 (CEST)
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
X-Inumbo-ID: 1bc2a17c-3a78-11ee-b288-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 14 Aug 2023 09:56:42 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 6/6] drivers/video: make declarations of defined
 functions available
In-Reply-To: <d021c6a0-6826-351b-1613-82ec9ad85868@suse.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <a50cc0f60c536554591834da660c540fcb77faf8.1691676251.git.nicola.vetrini@bugseng.com>
 <d021c6a0-6826-351b-1613-82ec9ad85868@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <fe1c5eeeb01cb2690d80acec2bfdf721@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2023 09:47, Jan Beulich wrote:
> On 11.08.2023 09:19, Nicola Vetrini wrote:
>> --- a/xen/drivers/video/vga.c
>> +++ b/xen/drivers/video/vga.c
>> @@ -9,6 +9,7 @@
>>  #include <xen/mm.h>
>>  #include <xen/param.h>
>>  #include <xen/vga.h>
>> +#include <xen/console.h>
> 
> xen/vga.h, which you move the declarations to, is already included 
> here.
> Why the need for xen/console.h?
> 
> Jan

vga.c needs a declaration for fill_console_start_info, which is declared 
in console.h, as
stated in the commit message (it could be clarified perhaps).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

