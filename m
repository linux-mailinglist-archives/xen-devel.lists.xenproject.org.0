Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F81797F98
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 02:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597670.931915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qePEz-0008WC-J2; Fri, 08 Sep 2023 00:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597670.931915; Fri, 08 Sep 2023 00:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qePEz-0008Tg-F0; Fri, 08 Sep 2023 00:20:53 +0000
Received: by outflank-mailman (input) for mailman id 597670;
 Fri, 08 Sep 2023 00:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qePEx-0008TZ-FC
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 00:20:51 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dfbb1aa-4ddd-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 02:20:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BB284CE1AFD;
 Fri,  8 Sep 2023 00:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88321C433C9;
 Fri,  8 Sep 2023 00:20:41 +0000 (UTC)
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
X-Inumbo-ID: 8dfbb1aa-4ddd-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694132443;
	bh=mzeFucBnOl/LPbkdZc2Z2dr7TPSRTCHhQ+NI/ZgULVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YU0ALD3bytPHvsb230gsnXp/qPCCQMFCpVvasD1N0fg7bZPYBhIMmFXivro5hNt9u
	 4B1hTdX+Vyxe+kwJHial+fNZW/NA8YawK8s3HdZ6a5ycLrM6KnEyoZj/x+kRTrp5Wm
	 s2aQv3imZlsVWnVH7rlVPoaIN6F2qsCIEh4+NNuU3xdHiuqfhWz9+MZk7xmCOqwgdQ
	 glADMQ6L16d1KowLQTamelrkfM9tqj8aT6AHDN2mqjlL8P1NObd5KwCjO/e7VsgswZ
	 v2uZjWlHV/iDVuq1ors84WlpAiNK+elTEvLPUl89gbjp+5Q8a52zq2unne/86FUh50
	 2lsCYmdAXSVdw==
Date: Thu, 7 Sep 2023 17:20:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/3] docs/misra: add documentation skeleton for MISRA
 C:2012 Dir 4.1
In-Reply-To: <e74433904abe30e2e9e030f663a7a87813dabd24.1693558913.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309071659440.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com> <e74433904abe30e2e9e030f663a7a87813dabd24.1693558913.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Sep 2023, Nicola Vetrini wrote:
> The aforementioned directive requires the project to supply documentation
> on the measures taken towards the minimization of run-time failures.
> 
> The actual content of the documentation is yet to be written.
> 
> The 'rules.rst' file is updated accordingly to mention the newly
> added documentation.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  docs/misra/C-runtime-failures.rst | 239 ++++++++++++++++++++++++++++++
>  docs/misra/rules.rst              |   7 +-
>  2 files changed, 245 insertions(+), 1 deletion(-)
>  create mode 100644 docs/misra/C-runtime-failures.rst
> 
> diff --git a/docs/misra/C-runtime-failures.rst b/docs/misra/C-runtime-failures.rst
> new file mode 100644
> index 000000000000..0d8d5adce231
> --- /dev/null
> +++ b/docs/misra/C-runtime-failures.rst
> @@ -0,0 +1,239 @@
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
> +To be written.
> +Example: Pervasive use of assertions and extensive test suite.

Can we just say:
Pervasive use of assertions and extensive test suite.

Without "Example:" and without "To be written". It is clear that more
information is needed but we don't need to repeat it every time.



> +Documentation for MISRA C:2012 Dir 4.1: unexpected wrapping
> +___________________________________________________________
> +
> +To be written.
> +Example: The only wrapping the is present in the code concerns
> +unsigned integers and they are all expected.

Same here, and also below (I won't repeat it every time)


> +Documentation for MISRA C:2012 Dir 4.1: invalid shift
> +_____________________________________________________
> +
> +To be written.
> +Example: Pervasive use of assertions and extensive test suite.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: division/remainder by zero
> +__________________________________________________________________
> +
> +To be written.
> +Example:
> +There division or remainder operations in the project code ensure that
> +their second argument is never zero.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: unsequenced side effects
> +________________________________________________________________
> +
> +To be written.
> +Example:
> +No function in this project is meant to be executed from interrupt handlers
> +or in multi-threading environments.

This would not be true. We have code that is executed in interrupt
handlers, but we take care to use spinlocks and/or disable interrupts at
the right locations to avoid unsequenced side effects



> +Documentation for MISRA C:2012 Dir 4.1: read from uninitialized automatic object
> +________________________________________________________________________________
> +
> +To be written.
> +Example:
> +Automatic variables are used to store temporary parameters and they
> +are always initialized to either a default value or a proper value
> +before usage.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: read from uninitialized allocated object
> +________________________________________________________________________________
> +
> +To be written.
> +Example:
> +The code does not use dynamically allocated storage.

We do use dynamically allocated storage with xzalloc but xzalloc
initializes the object to zero


> +Documentation for MISRA C:2012 Dir 4.1: write to string literal or const object
> +_______________________________________________________________________________
> +
> +To be written.
> +Example:
> +The toolchain puts every string literal and const object into a read-only
> +section of memory.  The hardware exception raised when a write is attempted
> +on such a memory section is correctly handled.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: non-volatile access to volatile object
> +______________________________________________________________________________
> +
> +To be written.
> +Example:
> +Volatile access is limited to registers that are always accessed
> +through macros or inline functions.

Or very specific limited code chucks that are only used to access a
register


> +Documentation for MISRA C:2012 Dir 4.1: access to dead allocated object
> +_______________________________________________________________________
> +
> +To be written.
> +Example:
> +The code does not use dynamically allocated storage.

We do use dynamically allocated storage, but in a safety configuration
is used only in very limited ways at runtime (it is "almost" only used
at boot time). We use Coverity regularly to scan the code which I
believe can detect non-freed allocated objects.


> +Documentation for MISRA C:2012 Dir 4.1: access to dead automatic object
> +_______________________________________________________________________
> +
> +To be written.
> +Example:
> +Pointers to automatic variables are never returned, nor stored in
> +wider-scoped objects.  No function does the same on any pointer
> +received as a parameter.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access to dead thread object
> +____________________________________________________________________
> +
> +To be written.
> +Example:
> +The program does not use per-thread variables.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access using null pointer
> +_________________________________________________________________
> +
> +To be written.
> +Example:
> +All possibly null pointers are checked before access.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access using invalid pointer
> +____________________________________________________________________
> +
> +To be written.
> +Example:
> +Usage of pointers is limited.  Pointers passed as parameters are
> +always checked for validity.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: access using out-of-bounds pointer
> +__________________________________________________________________________
> +
> +To be written.
> +Example:
> +Pointers are never uses to access arrays: indices are always used
> +instead.

I am not certain this is true. I would say instead "Pointers are never
used to access arrays without checking for the array size first"


> +Documentation for MISRA C:2012 Dir 4.1: access using unaligned pointer
> +______________________________________________________________________
> +
> +To be written.
> +Example:
> +Pointer conversion that may result in unaligned pointers are never used.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: mistyped access to object
> +_________________________________________________________________
> +
> +To be written.
> +Example:
> +Pointer conversions that may result in mistyped accesses to objects
> +are never used.
> +
> +
> +Documentation for MISRA C:2012 Dir 4.1: mistyped access to function
> +___________________________________________________________________
> +
> +To be written.
> +Example:
> +The code never uses function pointers.

We do use function pointers. What does it mean "mistyped access to
function"? Also wouldn't this class of type error be detected by
gcc/eclair/cppcheck/coverity?


> +Documentation for MISRA C:2012 Dir 4.1: invalid pointer arithmetic
> +__________________________________________________________________
> +
> +To be written.
> +Example:
> +Pointer arithmetic is never used.

I think it might be used sometimes. I would say: "Pointer arithmetic is
never used without checking object boundaries"


> +Documentation for MISRA C:2012 Dir 4.1: invalid pointer comparison
> +__________________________________________________________________
> +
> +To be written.
> +Example:
> +Arrays are always accessed using indices instead of pointers.  Pointers
> +are only compared to NULL.

I would say instead that pointers to different objects are never
compared (expect for pointers that are not really pointers but actually
linker symbols but they are deviated)


> +Documentation for MISRA C:2012 Dir 4.1: overlapping copy
> +________________________________________________________
> +
> +To be written.
> +Example:
> +The code never uses memcpy() and does not perform assignment of
> +overlapping objects (which is doable only via pointers).

We do use memcpy but we never use it to copy overlapping objects.


> +Documentation for MISRA C:2012 Dir 4.1: invalid arguments to function
> +_____________________________________________________________________
> +
> +To be written.
> +Example:
> +All parameters to functions are checked for validity.

this..

> +Documentation for MISRA C:2012 Dir 4.1: returned function error
> +_______________________________________________________________
> +
> +To be written.
> +Example:
> +All functions that may produce an error, do returns a suitable status code
> +that is checked at each call site.

.. and this are aspirational, in the sense that we wish they were true
in all cases but they are not today. Is that OK to write it anyway as an
explanation?


> +
> +Documentation for MISRA C:2012 Dir 4.1: tainted input
> +_____________________________________________________
> +
> +To be written.
> +Example:
> +All parameters of all functions in the API are checked before being used.

I would clarify saying "external ABI" instead of API


> +Documentation for MISRA C:2012 Dir 4.1: data race
> +_________________________________________________
> +
> +To be written.
> +Example:
> +No function in this code is meant to be executed from interrupt handlers or
> +in a multi-threading environment.

We do have multiple "threads" and code executed from interrupt handlers.
I would say instead that we protect data using spinlocks and other forms
of locks appropriately.


> +Documentation for MISRA C:2012 Dir 4.1: invariant violation
> +___________________________________________________________
> +
> +To be written.

What's an invariant violation?


> +Documentation for MISRA C:2012 Dir 4.1: communication error
> +___________________________________________________________
> +
> +To be written.
> +Example:
> +This project does not involve any external communication.
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 34916e266aa5..84bb57c8e908 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -47,7 +47,12 @@ maintainers if you want to suggest a change.
>     * - `Dir 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c>`_
>       - Required
>       - All source files shall compile without any compilation errors
> -     -
> +
> +   * - `Dir 4.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_01.c>`_
> +     - Required
> +     - Run-time failures shall be minimized
> +     - The strategies adopted by Xen to prevent certain classes of runtime
> +       failures will be documented by `C-runtime-failures.rst <docs/misra/C-runtime-failures.rst>`_

I would say "is documented" because we don't want to go back and change
rules.rst if/when we update C-runtime-failures.rst

Also (nit) you can wrap around at 80 chars to make it easier to read as
it will still be displayed the same way by gitlab and other RST
renderers



>     * - `Dir 4.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c>`_
>       - Required

