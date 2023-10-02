Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADEB7B5D27
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611789.951353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRRh-0002D3-4g; Mon, 02 Oct 2023 22:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611789.951353; Mon, 02 Oct 2023 22:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRRh-00029T-1i; Mon, 02 Oct 2023 22:31:21 +0000
Received: by outflank-mailman (input) for mailman id 611789;
 Mon, 02 Oct 2023 22:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRRf-00027t-N4
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:31:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 678bf585-6173-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 00:31:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A6744B81696;
 Mon,  2 Oct 2023 22:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F634C433C7;
 Mon,  2 Oct 2023 22:31:15 +0000 (UTC)
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
X-Inumbo-ID: 678bf585-6173-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696285877;
	bh=RvziqnROSEBM/H6Hty6jzxfFQitQc5t+zSATJFMg4YU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WXqp7Hxga1eburs/FlYjT5p+IXJt1mARYZejUhda9Ji7fXZv4FLIaf3RrGknSK7bX
	 ilwsfdh4/ERujpcTBHzk4WWIif20h4pynlLmeLzGdqC0a76DRh4Gu9jiyTZtCepo5Y
	 FkeM2NkB2iI9d+flt76Ujq4pAw/fUXBHbCoLY6BPIB15SZ/yfPGiTGdwKxMFY1gM65
	 AEeIShbIS27XTw8I0KmOqc2idUR4/7LAC3hA9ZCDdVSgvcTDTuagHYsC0Umig2LMiZ
	 bqeZzzS3vtdGD1WV7YS2ETVk853Zmu9U+MccE0InHDUKtsF4rCYjwTDUfgHZ0vJBh7
	 oND852OvB0kEA==
Date: Mon, 2 Oct 2023 15:31:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v3 1/3] docs/misra: add documentation skeleton for
 MISRA C:2012 Dir 4.1
In-Reply-To: <14df7c8c667f3852bcc1ffab3a3ce862284a8a0c.1696231870.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021531030.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com> <14df7c8c667f3852bcc1ffab3a3ce862284a8a0c.1696231870.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> The aforementioned directive requires the project to supply documentation
> on the measures taken towards the minimization of run-time failures.
> 
> The actual content of the documentation still needs feedback from the
> community.
> 
> The 'rules.rst' file is updated accordingly to mention the newly
> added documentation.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Incorporated suggestions from Stefano.
> Changes in v3:
> - Replaced two leftover entries.
> ---
>  docs/misra/C-runtime-failures.rst | 210 ++++++++++++++++++++++++++++++
>  docs/misra/rules.rst              |   7 +
>  2 files changed, 217 insertions(+)
>  create mode 100644 docs/misra/C-runtime-failures.rst
> 
> diff --git a/docs/misra/C-runtime-failures.rst b/docs/misra/C-runtime-failures.rst
> new file mode 100644
> index 000000000000..77e04a2562b8
> --- /dev/null
> +++ b/docs/misra/C-runtime-failures.rst
> @@ -0,0 +1,210 @@
> +===================================================================
> +Measures taken towards the minimization of Run-time failures in Xen
> +===================================================================
> +
> +This document specifies which procedures and techinques are used troughout the
> +Xen codebase to prevent or minimize the impact of certain classes of run-time
> +errors that can occurr in the execution of a C program, due to the very minimal
> +built-in checks that are present in the language.
> +
> +The presence of such documentation is requested by MISRA C:2012 Directive 4.1,
> +whose headline states: "Run-time failures shall be minimized".
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: overflow
> +________________________________________________
> +
> +Pervasive use of assertions and extensive test suite.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: unexpected wrapping
> +___________________________________________________________
> +
> +The only wrapping that is present in the code concerns
> +unsigned integers and they are all expected.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: invalid shift
> +_____________________________________________________
> +
> +Pervasive use of assertions and extensive test suite.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: division/remainder by zero
> +__________________________________________________________________
> +
> +The division or remainder operations in the project code ensure that
> +their second argument is never zero.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: unsequenced side effects
> +________________________________________________________________
> +
> +Code executed in interrupt handlers uses spinlocks or disables interrupts
> +at the right locations to avoid unsequenced side effects.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: read from uninitialized automatic object
> +________________________________________________________________________________
> +
> +The amount of dynamically allocated objects is limited at runtime in
> +static configurations. We make sure to initialize dynamically allocated
> +objects before reading them, and we utilize static analysis tools to
> +help check for that.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: read from uninitialized allocated object
> +________________________________________________________________________________
> +
> +Dynamically allocated storage is used in a controlled manner, to prevent the
> +access to uninitialized allocated storage.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: write to string literal or const object
> +_______________________________________________________________________________
> +
> +The toolchain puts every string literal and const object into a read-only
> +section of memory.  The hardware exception raised when a write is attempted
> +on such a memory section is correctly handled.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: non-volatile access to volatile object
> +______________________________________________________________________________
> +
> +Volatile access is limited to registers that are always accessed
> +through macros or inline functions, or by limited code chunks that are only used
> +to access a register.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access to dead allocated object
> +_______________________________________________________________________
> +
> +Although dynamically allocated storage is used in the project, in safety
> +configurations its usage is very limited at runtime (it is "almost" only used
> +at boot time). Coverity is regularly used to scan the code to detect non-freed
> +allocated objects.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access to dead automatic object
> +_______________________________________________________________________
> +
> +Pointers to automatic variables are never returned, nor stored in
> +wider-scoped objects.  No function does the same on any pointer
> +received as a parameter.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access to dead thread object
> +____________________________________________________________________
> +
> +The program does not use per-thread variables.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access using null pointer
> +_________________________________________________________________
> +
> +All possibly null pointers are checked before access.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access using invalid pointer
> +____________________________________________________________________
> +
> +Usage of pointers is limited.  Pointers passed as parameters are
> +always checked for validity.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access using out-of-bounds pointer
> +__________________________________________________________________________
> +
> +Pointers are never used to access arrays without checking for the array size
> +first.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access using unaligned pointer
> +______________________________________________________________________
> +
> +Pointer conversion that may result in unaligned pointers are never used.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: mistyped access to object
> +_________________________________________________________________
> +
> +Pointer conversions that may result in mistyped accesses to objects
> +are never used.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: mistyped access to function
> +___________________________________________________________________
> +
> +This behaviour can arise, for instance, from:
> +
> +- incongruent declarations;
> +- functions having no prototypes;
> +- casts on function pointers.
> +
> +The project has adopted various compiler flags and MISRA rules to lessen the
> +likelihood of this event.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: invalid pointer arithmetic
> +__________________________________________________________________
> +
> +Pointer arithmetic is never used without checking object boundaries.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: invalid pointer comparison
> +__________________________________________________________________
> +
> +Pointers to different objects are never compared (except for pointers that are
> +actually linker symbols, but those cases are deviated with a justification).
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: overlapping copy
> +________________________________________________________
> +
> +The code never uses memcpy() to copy overlapping objects. The instances of
> +assignments involving overlapping objects are very limited and motivated.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: invalid arguments to function
> +_____________________________________________________________________
> +
> +Many parameters to functions are checked for validity; there is ongoing work to
> +make this true for all parameters.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: returned function error
> +_______________________________________________________________
> +
> +Many functions that may produce an error, do return a suitable status code
> +that is checked at each call site. There is ongoing work to make this true for
> +all such functions.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: tainted input
> +_____________________________________________________
> +
> +All parameters of all functions in the extenal ABI are checked before being
> +used.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: data race
> +_________________________________________________
> +
> +Data that can be accessed concurrently from multiple threads and code executed
> +by interrupt handlers is protected using spinlocks and other forms of locking,
> +as appropriate.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: invariant violation
> +___________________________________________________________
> +
> +The extensive checks in the code ensure that any violation of a compile-time
> +invariant will be detected prior to release builds, and violation of run-time
> +invariants is extensively tested. In release builds the number of invariants
> +is greatly reduced.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: communication error
> +___________________________________________________________
> +
> +This project does not involve any external communication.
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index a2fe01464eec..3139ca7ae6dd 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -49,6 +49,13 @@ maintainers if you want to suggest a change.
>       - All source files shall compile without any compilation errors
>       -
>  
> +   * - `Dir 4.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_01.c>`_
> +     - Required
> +     - Run-time failures shall be minimized
> +     - The strategies adopted by Xen to prevent certain classes of runtime
> +       failures is documented by
> +       `C-runtime-failures.rst <docs/misra/C-runtime-failures.rst>`_
> +
>     * - `Dir 4.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c>`_
>       - Required
>       - If a function returns error information then that error
> -- 
> 2.34.1
> 

