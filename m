Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB671988906
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806388.1217741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDjY-00088F-S5; Fri, 27 Sep 2024 16:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806388.1217741; Fri, 27 Sep 2024 16:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDjY-00085A-Nh; Fri, 27 Sep 2024 16:22:20 +0000
Received: by outflank-mailman (input) for mailman id 806388;
 Fri, 27 Sep 2024 16:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o0pe=QZ=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1suDjX-000854-5G
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:22:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a8b33f84-7cec-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:22:16 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EDBA14BF;
 Fri, 27 Sep 2024 09:22:44 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B650E3F6A8;
 Fri, 27 Sep 2024 09:22:08 -0700 (PDT)
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
X-Inumbo-ID: a8b33f84-7cec-11ef-99a2-01e77a169b0f
Date: Fri, 27 Sep 2024 17:22:03 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Keith Packard <keithp@keithp.com>,
	Justin Stitt <justinstitt@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 02/28] Documentation: Bump minimum GCC version to 8.1
Message-ID: <ZvbbqzrfkgjM1VZ3@J2N7QTR9R3>
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-32-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925150059.3955569-32-ardb+git@google.com>

On Wed, Sep 25, 2024 at 05:01:02PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Bump the minimum GCC version to 8.1 to gain unconditional support for
> referring to the per-task stack cookie using a symbol rather than
> relying on the fixed offset of 40 bytes from %GS, which requires
> elaborate hacks to support.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  Documentation/admin-guide/README.rst | 2 +-
>  Documentation/process/changes.rst    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I'd like this for arm64 and others too (for unconditional support for
-fpatchable-function-entry), so FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I think you'll want to update scripts/min-tool-version.sh too; judging
by the diff in the cover letter that's not handled elsehere in the
series.

Mark.

> 
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index f2bebff6a733..3dda41923ed6 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -259,7 +259,7 @@ Configuring the kernel
>  Compiling the kernel
>  --------------------
>  
> - - Make sure you have at least gcc 5.1 available.
> + - Make sure you have at least gcc 8.1 available.
>     For more information, refer to :ref:`Documentation/process/changes.rst <changes>`.
>  
>   - Do a ``make`` to create a compressed kernel image. It is also possible to do
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 00f1ed7c59c3..59b7d3d8a577 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -29,7 +29,7 @@ you probably needn't concern yourself with pcmciautils.
>  ====================== ===============  ========================================
>          Program        Minimal version       Command to check the version
>  ====================== ===============  ========================================
> -GNU C                  5.1              gcc --version
> +GNU C                  8.1              gcc --version
>  Clang/LLVM (optional)  13.0.1           clang --version
>  Rust (optional)        1.78.0           rustc --version
>  bindgen (optional)     0.65.1           bindgen --version
> -- 
> 2.46.0.792.g87dc391469-goog
> 
> 

