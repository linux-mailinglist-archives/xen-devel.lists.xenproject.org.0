Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8C97CB69E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 00:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617941.961077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsWAZ-0006pW-AD; Mon, 16 Oct 2023 22:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617941.961077; Mon, 16 Oct 2023 22:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsWAZ-0006nW-7M; Mon, 16 Oct 2023 22:34:39 +0000
Received: by outflank-mailman (input) for mailman id 617941;
 Mon, 16 Oct 2023 22:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uuB=F6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qsWAX-0006nO-7f
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 22:34:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e8510df-6c74-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 00:34:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7C2DAB81AEE;
 Mon, 16 Oct 2023 22:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A83EC433C8;
 Mon, 16 Oct 2023 22:34:32 +0000 (UTC)
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
X-Inumbo-ID: 2e8510df-6c74-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697495673;
	bh=bImQRXh6hTgsqHnM/V6XBLHSVhduPUEOgfs4Oqyvprw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AaFjZYIh3Z5doAOWD82b7nhAbRDYY9Dw5r4ZETXeMb0h8xHT+p7Gwp2jypoV5GFKy
	 xKTaRN73owm4XzMtUfenEnhjJhkRqsgpHKHo+wSQwh6jgXiMQe/iSNOh52O/OYN6uY
	 x7zcni8gcPAJtbrUv0i2OLvL4bV3z0ssUZgH8uEJPt2KPpWyC5kdFONilfLGJhgnrf
	 lxcz15MU0NK0AFdlTcBHcyUdg6L6D2SUuNmL5osL7DNNHT/LYCafriuG4PSSpL8I+l
	 BuLQ7oei+t9tHCMNs9liNMMmG/eX3j5woR4xOPHAYyx5PalwtqC6n0ov5VHSceCegb
	 arFWLXsxMvW2g==
Date: Mon, 16 Oct 2023 15:34:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/7] x86: add deviation comments for asm-only
 functions
In-Reply-To: <741e81bc-050c-a773-e622-997b6c0b8335@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com> <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com> <741e81bc-050c-a773-e622-997b6c0b8335@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Oct 2023, Jan Beulich wrote:
> On 09.10.2023 08:54, Nicola Vetrini wrote:
> > As stated in rules.rst, functions used only in asm code
> > are allowed to have no prior declaration visible when being
> > defined, hence these functions are deviated.
> > This also fixes violations of MISRA C:2012 Rule 8.4.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> >  xen/arch/x86/hvm/svm/intr.c      | 1 +
> >  xen/arch/x86/hvm/svm/nestedsvm.c | 1 +
> >  xen/arch/x86/hvm/svm/svm.c       | 2 ++
> 
> Once again - why are you not also adjusting the respective VMX code?
> Iirc it was agreed long ago that scans should be extended to cover as
> much of the code base as possible.


Let me summarize here our past discussions on the subject to make sure 
we are all aligned.

With my AMD hat on, of course we want to work with the upstream
community as much as possible and improve the overall codebase. But it
is not a goal for AMD to improve Intel-specific drivers (VMX and
others). Our safety configuration for Xen, including the public ECLAIR
instance currently sponsored by AMD, only includes SVM files, not VMX
files. MISRA compliance costs time and effort; this was done both
because of lack of interest in VMX and also as a cost saving measure.

Upon maintainer's request we can expand the scope of individual patches.
For example, AMD is not interested in ARM32 either, but in the past we
did address certain MISRA C issues on ARM32 too, if nothing else for
consistency of the code base. It comes down to a compromise what we
should do for consistency of the codebase versus addressing things that
makes sense for AMD business. For sure we could work on a few violations
affecting Intel drivers, but overall I don't think AMD could be asked to
make Intel drivers MISRA compliant.


In addition to the above, we also discussed during one of the past MISRA
C working group meetings to have larger-than-usual ECLAIR scans. ECLAIR
takes a couple of hours to run, so it is a good idea to restrict its
configuration in the usual runs. However, at least once a week maybe on
a Sunday, it would be good to run a comprehensive scan including
components that are not currently targeted for safety. This would help
us detect regressions and in general spot potential bugs.

As part of this larger-than-usual ECLAIR scan we could certainly
include Intel drivers as well as other things currently unsupported.


Now, concrete action items. Nicola, I think we should look into having a
larger-than-usual ECLAIR scan every week which includes all of Intel
files and in general as much as possible of the codebase.

Jan, for this specific patch, I don't think we have the scan including
Intel vmx files yet. Nicola please correct me if I am wrong. So Nicola
wouldn't be able to easily expand this patch to also cover Intel vmx
violations of this rule because we don't have the list of violations
affecting those files. 

