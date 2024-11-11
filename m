Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D351E9C367D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 03:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833307.1248435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAK64-0002ys-Uw; Mon, 11 Nov 2024 02:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833307.1248435; Mon, 11 Nov 2024 02:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAK64-0002x6-S3; Mon, 11 Nov 2024 02:24:08 +0000
Received: by outflank-mailman (input) for mailman id 833307;
 Mon, 11 Nov 2024 02:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zp6W=SG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tAK63-0002x0-Ku
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 02:24:07 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04ce0feb-9fd4-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 03:24:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 722E9A41505;
 Mon, 11 Nov 2024 02:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAB1C4CECF;
 Mon, 11 Nov 2024 02:24:01 +0000 (UTC)
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
X-Inumbo-ID: 04ce0feb-9fd4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjA0Y2UwZmViLTlmZDQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMjkxODQ0LjEzNjEyOCwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731291842;
	bh=e++fqIDi03ECvYpkN8Km9QzhukQyi+B32gz3XIboN0o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H6pjJRrcO+oUCzWlZzerEfv+o0g3HTOjS2t0JIeN/aKkuDtEBA8Wr0t3sLmX3nEIR
	 erHCEfNj8QoVMmGN258v2+1KTNCh4heQJw1FvHCrVvXP/Yb4LGhvhMMcRJb2EolSSP
	 muFd9cFZIWXYg2jhT4IgWOxSjmfDiW6Hi3MY02/xeEU2NrYMXwBS/RtGMjeXUkkmwx
	 Yr7tR3E5aPxd30dCJza/clX760BnuQxT60ovcXRllJw1u7TzeBvpN+gpXMVtxf42gn
	 I5DxN0gdCUMExmISxtpDo+rSITJnNYY1ewFDlMwnIjqVb9P+oCbSoxONwSVZaCz8fe
	 pfZqaqh0nmi5w==
Date: Sun, 10 Nov 2024 18:24:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/3] x86/emul: define pseudo keyword fallthrough
In-Reply-To: <be21f3cf-e7a8-469a-99a6-4098032a4df4@suse.com>
Message-ID: <alpine.DEB.2.22.394.2411101820430.14721@ubuntu-linux-20-04-desktop>
References: <cover.1730880832.git.federico.serafini@bugseng.com> <a0341b50ece1ba1b5b346b54db7d2abdc150cb95.1730880832.git.federico.serafini@bugseng.com> <be21f3cf-e7a8-469a-99a6-4098032a4df4@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Nov 2024, Jan Beulich wrote:
> On 06.11.2024 10:04, Federico Serafini wrote:
> > The pseudo keyword fallthrough shall be used to make explicit the
> > fallthrough intention at the end of a case statement (doing this
> > through comments is deprecated).
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > ---
> >  xen/arch/x86/x86_emulate/x86_emulate.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> 
> When you had asked my privately on Matrix, I specifically said: "Adding
> the pseudo-keyword to x86-emulate.h (not x86_emulate.h) is probably best,
> unless problems with that approach turn up." Even if identical re-
> definitions are deemed fine, I for one consider such bad practice. Yet
> by playing with this file (and outside of any relevant #ifdef) means
> there will be such a re-definition when building Xen itself.
> 
> In fact the patch subject should also already clarify that the auxiliary
> definition is only needed for the test and fuzzing harnesses.

Hi Jan, I don't understand this comment.

You say "playing with this file (and outside of any relevant #ifdef)"
but actually the changes are within the #ifndef
__X86_EMULATE_H__/#endif. What do you mean?

You say "Adding the pseudo-keyword to x86-emulate.h (not x86_emulate.h)
is probably best". I am not very familiar with x86-isms but the only
x86-emulate.h I can find is ./tools/tests/x86_emulator/x86-emulate.h
which is not a header that would help define anything for the Xen build?

I am not understanding your suggestions. From what I can see this patch
looks OK?


> > --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> > +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> > @@ -23,6 +23,16 @@
> >  # error Unknown compilation width
> >  #endif
> >  
> > +/*
> > + * Pseudo keyword 'fallthrough' to make explicit the fallthrough intention at
> > + * the end of a case statement.
> > + */
> > +#if (!defined(__clang__) && (__GNUC__ >= 7))
> 
> I realize xen/compiler.h has it like that, but may I ask that you omit
> the meaningless outer pair of parentheses?
> 
> Jan
> 

