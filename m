Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B977D7813
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 00:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623359.971166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmUf-0005wV-9l; Wed, 25 Oct 2023 22:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623359.971166; Wed, 25 Oct 2023 22:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmUf-0005uQ-6m; Wed, 25 Oct 2023 22:36:53 +0000
Received: by outflank-mailman (input) for mailman id 623359;
 Wed, 25 Oct 2023 22:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvmUe-0005uK-J8
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 22:36:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd2b4658-7386-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 00:36:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2E520B829A4;
 Wed, 25 Oct 2023 22:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E458BC433C7;
 Wed, 25 Oct 2023 22:36:47 +0000 (UTC)
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
X-Inumbo-ID: fd2b4658-7386-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698273409;
	bh=rsUDCadxjPCXqAeQhnAy6kBrif27IG+2xSJijqWeAqc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NWX+Afx2SeYoX/lG5Xo+GIlqPzQqhiNW7h44bMwB5yl9y5COTwXSYisO6UyGBomS0
	 p06CGLLn+kLTttbZsiXE1U6mX+qm8lCT0f85vJ2C8PYPoKvBy1GkLlXirQKoA3wwoJ
	 fSQ2184Sg9CXwfcXwtBH4k91zYgz9f/QLdXR+tH/HdUtp2MucAS8dEcCEwKw0E8Ol1
	 qrQeshC2kjC3IH9lUV6SdOXHhxM9TSqluee4e463hrckT1mjBS3IRVz7OUfKuja7oP
	 mmYL6G7ElZHzbQT9TsFvrLZluil0KSxyTN3rx0LacZG7Q4D+BxZGuH7A5zhXJFFu31
	 ZFa0rSC2j+mcA==
Date: Wed, 25 Oct 2023 15:36:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
    Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 3/8] x86: add deviation comments for
 asm-only functions
In-Reply-To: <d60e17379fbfdb1288288ee079113a17@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310251535320.271731@ubuntu-linux-20-04-desktop>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com> <36d24b3a3e264f0e0b265b4f68d6432a143d64cd.1698053876.git.nicola.vetrini@bugseng.com> <a8370e98-1cb6-8fde-9458-e579047dd607@suse.com> <2d92ef1f753165e2fa9cc7c04c219217@bugseng.com>
 <52422128-156d-5d6c-46b2-261b1c7e85c0@suse.com> <734cc13409b44f709649895d76d388e2@bugseng.com> <alpine.DEB.2.22.394.2310241249080.271731@ubuntu-linux-20-04-desktop> <d60e17379fbfdb1288288ee079113a17@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Nicola Vetrini wrote:
> On 24/10/2023 21:50, Stefano Stabellini wrote:
> > On Tue, 24 Oct 2023, Nicola Vetrini wrote:
> > > On 24/10/2023 10:14, Jan Beulich wrote:
> > > > On 24.10.2023 10:01, Nicola Vetrini wrote:
> > > > > On 24/10/2023 09:50, Jan Beulich wrote:
> > > > > > On 23.10.2023 11:56, Nicola Vetrini wrote:
> > > > > > > As stated in rules.rst, functions used only in asm code
> > > > > > > are allowed to have no prior declaration visible when being
> > > > > > > defined, hence these functions are deviated.
> > > > > > > This also fixes violations of MISRA C:2012 Rule 8.4.
> > > > > > >
> > > > > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > > > ---
> > > > > > > Changes in v3:
> > > > > > > - added SAF deviations for vmx counterparts to svm functions.
> > > > > >
> > > > > > Same comment regarding the R-b here as for patch 2.
> > > > > >
> > > > > > > --- a/xen/arch/x86/hvm/svm/intr.c
> > > > > > > +++ b/xen/arch/x86/hvm/svm/intr.c
> > > > > > > @@ -123,6 +123,7 @@ static void svm_enable_intr_window(struct vcpu
> > > *v,
> > > > > > > struct hvm_intack intack)
> > > > > > >          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
> > > > > > >  }
> > > > > > >
> > > > > > > +/* SAF-1-safe */
> > > > > > >  void svm_intr_assist(void)
> > > > > > >  {
> > > > > > >      struct vcpu *v = current;
> > > > > >
> > > > > > Linux has the concept of "asmlinkage" for functions interfacing C
> > > and
> > > > > > assembly. Was it considered to use that - even if expanding to
> > > nothing
> > > > > > for all present architectures - as a way to annotate affected
> > > > > > definitions
> > > > > > in place of the SAF-*-safe comments?
> > > > >
> > > > > It was proposed by Julien a while ago (I think it the thread on
> > > > > deviations.rst) to define
> > > > > a macro asmcall that expands to nothing, to mark all such functions.
> > > > > Right now, it's not
> > > > > strictly necessary (given that there are already some uses of SAF in
> > > > > Stefano's for-4.19 branch.
> > > >
> > > > Can this then be revisited please before any such reaches staging?
> > > >
> > > > Jan
> > > 
> > > I'll let Stefano answer this one.
> > 
> > Yes it can. If Nicola sends new patches I'll make sure to remove the
> > corresponding ones from for-4.19.
> > 
> > Nicola, you might want to send me privately the list of commits to take
> > out from for-4.19.
> 
> Actually I checked: the involved SAF comments are already in staging,
> specifically all
> were part of commit 5a415ef2b24d578d29479e38abda3d5285b9afed

OK. In that case we can still use the asmcall macro to deviate/fix new
violations. I suggest we do that. At some point anyone can go ahead and
replace those SAF comments with asmcall macros.

