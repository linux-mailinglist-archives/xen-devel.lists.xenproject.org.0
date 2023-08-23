Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6F78535D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 11:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589071.920795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjje-0006ml-1S; Wed, 23 Aug 2023 09:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589071.920795; Wed, 23 Aug 2023 09:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjjd-0006kj-V0; Wed, 23 Aug 2023 09:01:05 +0000
Received: by outflank-mailman (input) for mailman id 589071;
 Wed, 23 Aug 2023 09:01:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYjjc-0006kd-8V
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 09:01:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYjjb-0002kB-Bi; Wed, 23 Aug 2023 09:01:03 +0000
Received: from [15.248.3.2] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYjjb-0004iq-47; Wed, 23 Aug 2023 09:01:03 +0000
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
	bh=c8wHa6JANL2FiH/aVKCtcCVMUHoBM7HfCik9d/XFX5Y=; b=D7xxXKfZ7qigBVHPICV3atwq1n
	Fmzcf+EYfTgqUsNkg3yTu9Wfyoq9gaUU1q71DKeU6fMklfcUQEtnSBOrV8CpVI9N9gAiTLxdfrUo4
	LK/xXdvh93pV1nPWNz66fLqifBp06M8U7rN4taSz89+px1nejL+Y1nKhOc0SWgGm3TrU=;
Message-ID: <19addc0d-973f-4c3a-8db5-0531e065fdde@xen.org>
Date: Wed, 23 Aug 2023 10:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add rule 2.1 exceptions
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 nicola.vetrini@bugseng.com, Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230823002458.2738365-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230823002458.2738365-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/08/2023 01:24, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> During the discussions that led to the acceptable of Rule 2.1, we
> decided on a few exceptions that were not properly recorded in
> rules.rst. Add them now.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   docs/misra/rules.rst | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index b6d87e076b..8f38227994 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
>      * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
>        - Required
>        - A project shall not contain unreachable code
> -     -
> +     - The following are allowed:
> +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
> +         - Switch with a controlling value statically determined not to
> +           match one or more case statements
> +         - Functions that are intended to be never referenced from C
> +           code (e.g. 'do_trap_fiq')
> +         - Unreachability caused by the certain macros/functions is
> +           deliberate, e.g. BUG, assert_failed, panic, etc.

I find the wording quite ambiguous. How will an assessor be able to know 
this is deliberate? I think it would be better if this is based on a 
keyword in the code such as a function that has the attribute noreturn 
and/or there is an unreachable() statement.

Cheers,

-- 
Julien Grall

