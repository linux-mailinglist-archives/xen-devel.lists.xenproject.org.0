Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BEC9320F7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759341.1169031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcIh-0007uf-9H; Tue, 16 Jul 2024 07:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759341.1169031; Tue, 16 Jul 2024 07:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcIh-0007sz-4g; Tue, 16 Jul 2024 07:08:39 +0000
Received: by outflank-mailman (input) for mailman id 759341;
 Tue, 16 Jul 2024 07:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=liZX=OQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sTcIf-0007VG-TM
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:08:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3880ec71-4342-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 09:08:37 +0200 (CEST)
Received: from [10.176.133.251] (unknown [160.78.253.158])
 by support.bugseng.com (Postfix) with ESMTPSA id 9DB384EE073C;
 Tue, 16 Jul 2024 09:08:35 +0200 (CEST)
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
X-Inumbo-ID: 3880ec71-4342-11ef-bbfb-fd08da9f4363
Message-ID: <ced0578e-c4fb-4e2a-938b-b11dc41cba8e@bugseng.com>
Date: Tue, 16 Jul 2024 09:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Resend XEN PATCH v4 0/9] x86: address some violations of MISRA C
 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
 <704db9f3-e143-4a52-a0da-30443a128519@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <704db9f3-e143-4a52-a0da-30443a128519@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/24 08:59, Jan Beulich wrote:
> On 15.07.2024 18:48, Federico Serafini wrote:
>> This patch series fixes a missing escape in a deviation and addresses some
>> violations.
>>
>> Federico Serafini (9):
>>    automation/eclair: fix deviation of MISRA C Rule 16.3
>>    x86/cpuid: use fallthrough pseudo keyword
>>    x86/domctl: address a violation of MISRA C Rule 16.3
>>    x86/vpmu: address violations of MISRA C Rule 16.3
>>    x86/traps: address violations of MISRA C Rule 16.3
>>    x86/mce: address violations of MISRA C Rule 16.3
>>    x86/hvm: address violations of MISRA C Rule 16.3
>>    x86/mm: add defensive return
>>    x86/mpparse: address a violation of MISRA C Rule 16.3
> 
> And what exactly was this resend about? Even sent as reply to the original
> submission, rather than as a plain new thread, thus resulting in everything
> being mixed up into a single thread?

I'm sorry I forgot to add the maintainers in the first patch series,
so I resent it.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

