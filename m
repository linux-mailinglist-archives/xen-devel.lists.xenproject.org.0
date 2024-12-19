Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0329F7AC6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861206.1273185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOF5t-0001Jd-9V; Thu, 19 Dec 2024 11:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861206.1273185; Thu, 19 Dec 2024 11:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOF5t-0001H7-6j; Thu, 19 Dec 2024 11:53:29 +0000
Received: by outflank-mailman (input) for mailman id 861206;
 Thu, 19 Dec 2024 11:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBvy=TM=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1tOF5r-0001GF-G9
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:53:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id dab86579-bdff-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:53:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C3EC1477;
 Thu, 19 Dec 2024 03:53:53 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4C173F720;
 Thu, 19 Dec 2024 03:53:19 -0800 (PST)
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
X-Inumbo-ID: dab86579-bdff-11ef-a0d7-8be0dac302b0
Date: Thu, 19 Dec 2024 11:53:13 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC PATCH 02/28] Documentation: Bump minimum GCC version to 8.1
Message-ID: <Z2QJKZBsgvPMgRo_@J2N7QTR9R3>
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-32-ardb+git@google.com>
 <c4868f63-b688-4489-a112-05bf04280bde@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4868f63-b688-4489-a112-05bf04280bde@app.fastmail.com>

Hi Arnd,

On Wed, Sep 25, 2024 at 03:58:38PM +0000, Arnd Bergmann wrote:
> On Wed, Sep 25, 2024, at 15:01, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Bump the minimum GCC version to 8.1 to gain unconditional support for
> > referring to the per-task stack cookie using a symbol rather than
> > relying on the fixed offset of 40 bytes from %GS, which requires
> > elaborate hacks to support.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  Documentation/admin-guide/README.rst | 2 +-
> >  Documentation/process/changes.rst    | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> As we discussed during plumbers, I think this is reasonable,
> both the gcc-8.1 version and the timing after the 6.12-LTS
> kernel.
> 
> We obviously need to go through all the other version checks
> to see what else can be cleaned up. I would suggest we also
> raise the binutils version to 2.30+, which is what RHEL8
> shipped alongside gcc-8. I have not found other distros that
> use older binutils in combination with gcc-8 or higher,
> Debian 10 uses binutils-2.31.
> I don't think we want to combine the additional cleanup with
> your series, but if we can agree on the version, we can do that
> in parallel.

Were you planning to send patches to that effect, or did you want
someone else to do that? I think we were largely agreed on making those
changes, but it wasn't clear to me who was actually going to send
patches, and I couldn't spot a subsequent thread on LKML.

Mark.

