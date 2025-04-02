Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A3A79743
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 23:10:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936066.1337387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u05Kz-0000FC-FB; Wed, 02 Apr 2025 21:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936066.1337387; Wed, 02 Apr 2025 21:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u05Kz-0000Do-Bn; Wed, 02 Apr 2025 21:09:29 +0000
Received: by outflank-mailman (input) for mailman id 936066;
 Wed, 02 Apr 2025 21:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u05Kx-0000Di-8d
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 21:09:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1132ec0-1006-11f0-9eaa-5ba50f476ded;
 Wed, 02 Apr 2025 23:09:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E94A5443FF;
 Wed,  2 Apr 2025 21:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A165DC4CEDD;
 Wed,  2 Apr 2025 21:09:22 +0000 (UTC)
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
X-Inumbo-ID: c1132ec0-1006-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743628163;
	bh=LeuFIcu9sOgRcgqhLY+HpJHhnhovo3qkAvw7E1i2XAk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WjSSlkJZfxjQ03ROkOAtZD5h+C/AQA1TI/41929IRrcNEzpSpy2tsMn5tYQU7WM4G
	 G2kzLbRUO2Ho98kSbPpmwjtleCA5hARLJlM2v6ppBKySfr5Prir3sAhKdfTwj4oKG6
	 2YTUQni92cXYerAZUSuI8bX56K1Nb2l12Z6f9Bo9XaFASe1Wwb8oidAGwcwX9GlTQQ
	 GVusvqdwp/FEM6pR3H2E6iL6RxWD6DcG9csCKBwoKLI7lr6fCKyJ554VKiV3X+Adct
	 FuuMOc5mBsp1FnwrhWw46cTKV5RhP3u7dwPf/X3CDthntmmaDuOi50JQImCAJZVTHz
	 AZKJos4oQBoBg==
Date: Wed, 2 Apr 2025 14:09:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: "Kwon, Gihwan" <gihwan.kwon@boeing.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, stewart.hildebrand@amd.com
Subject: Re: [QUESTION] Minimal Xen Configuration
In-Reply-To: <f4803fc17047a9d74928c66d39bf9632@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2504021409170.3098208@ubuntu-linux-20-04-desktop>
References: <PH3P110MB2246A9D7AFA0A73000781B0390A0A@PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM> <f4803fc17047a9d74928c66d39bf9632@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Apr 2025, Nicola Vetrini wrote:
> On 2025-03-28 07:43, Kwon, Gihwan wrote:
> > Dear Xen Community,
> > 
> > I hope this message finds you well.
> > 
> > I have heard that there exists a minimal Xen configuration optimized for
> > safety-critical products, particularly in automotive applications, with the
> > code size reduced to approximately 50k SLOC.
> > 
> > Could anyone provide guidance or point me to relevant resources regarding
> > this minimal Xen configuration? Any insights or references would be greatly
> > appreciated.
> > 
> > Thank you in advance for your assistance.
> > 
> > Best regards,
> > Gihwan Kwon
> 
> Hello,
> 
> I am part of the team that provides static analysis for Xen, mainly towards
> the objective to make Xen compliant with MISRA C guidelines. As part of that
> effort, a minimal Xen configuration has been defined (for Arm and x86_64) at
> [1], which is the one currently analyzed for static analysis for each commit
> [2]. It starts from the default configuration for the architecture (i.e., make
> defconfig) and then turns on or off various Kconfig options, as specified by
> EXTRA_XEN_CONFIG.
> 
> @Stefano Stabellini (Cc'ed) is the main driving force behind the Xen
> certification effort for automotive, therefore he's probably the best person
> to approach to get more information on this matter.

Thanks Nicola. In addition to what Nicola wrote, there is an outstanding
activity to further reduce the code size by adding more kconfig options.
There are a couple of patch series on the list right now to that effect.

https://marc.info/?l=xen-devel&m=173745442831026

Last year we ran some experiments and for ARM we should be able to go below
35K LOC. The tools measuring LOC are very imprecise as they do not
account for #ifdefs and kconfig options. So we switched to text binary
size for measurements as it is more accurate.
do not account for kconfig options and #ifdefs. Hence, we switch to
using text size as size measurement for Xen. One of the figure was XXX.

