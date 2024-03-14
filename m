Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578987C567
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693564.1081842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktzJ-00081X-72; Thu, 14 Mar 2024 22:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693564.1081842; Thu, 14 Mar 2024 22:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktzJ-0007zw-2o; Thu, 14 Mar 2024 22:55:49 +0000
Received: by outflank-mailman (input) for mailman id 693564;
 Thu, 14 Mar 2024 22:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rktzH-0007zo-4I
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:55:47 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb51890f-e255-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 23:55:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 10C6ACE1EC9;
 Thu, 14 Mar 2024 22:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEC5C433F1;
 Thu, 14 Mar 2024 22:55:37 +0000 (UTC)
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
X-Inumbo-ID: fb51890f-e255-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710456939;
	bh=WCC3C9KxuL3Vypvc5yL8wz2EW5JuzQWUG8taUiXqK/Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R3a2mHQGDyJ/Ceg6SjucLXadGJTm8Nqv4cWnV/jXgv3+q+KO1dOLQKWRILUH3qkY5
	 LfXYVV5WMBFzzeVVSNUsYnHTBPxBV0EEUheMnHdsQl8Q11lYymS2aC2ACMhQ4HLgRw
	 MQW0sFAXMGAFumn1rE66IwU/beeCNEM/6mzg41uXe09mSUamk4f/uSeECSY+ftNf7t
	 y/65jWtDVAEzyiFaeI7SncCKkTwN3DQ4u+eyY9U9FcWdw1+LDZeTKbSIGl4XjOwB3Q
	 jkenDdYH9HrYGTjY2WgCgc9OTyfkuiuo9qT+G7aY8AwKZA2UH7hr2XTyLo7GZbL6ON
	 3Kr05EuK0URFw==
Date: Thu, 14 Mar 2024 15:55:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 01/16] misra: add deviation for headers that
 explicitly avoid guards
In-Reply-To: <def59c84-13e6-4175-ae5d-e0ba7770f68e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403141554040.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <310fe4a0ccd0ad45bcf1cd9811ac56c9a560dd0b.1710145041.git.simone.ballarin@bugseng.com> <def59c84-13e6-4175-ae5d-e0ba7770f68e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Mar 2024, Jan Beulich wrote:
> On 11.03.2024 09:59, Simone Ballarin wrote:
> > Some headers, under specific circumstances (documented in a comment at
> > the beginning of the file), explicitly avoid inclusion guards: the caller
> > is responsible for including them correctly.
> > 
> > These files are not supposed to comply with Directive 4.10:
> > "Precautions shall be taken in order to prevent the contents of a header
> > file being included more than once"
> > 
> > This patch adds deviation cooments for headers that avoid guards.
> > 
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > 
> > ---
> > Changes in v3:
> > - fix inconsistent deviation ID
> > - change comment-based deviation text
> > Changes in v2:
> > - use the format introduced with doc/misra/safe.json instead of
> >   a generic text-based deviation
> > ---
> >  docs/misra/safe.json                        | 9 +++++++++
> >  xen/include/public/arch-x86/cpufeatureset.h | 1 +
> >  xen/include/public/errno.h                  | 1 +
> >  3 files changed, 11 insertions(+)
> 
> I understand something wants doing, but having such comments appear in public
> headers feels wrong to me. I'm afraid I have no good alternative suggestion.

Given that in both cases there is very nice explanation on how to use
the headers as an in-code comment just above, could we embed the
SAF-3-safe marker in the existing comment?

If not, I think we should go with this patch as is (I don't think it is
worth my, your, and Simone's time to look for alternatives).

