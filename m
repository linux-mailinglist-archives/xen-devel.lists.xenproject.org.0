Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED0A3008A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 02:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885057.1294830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thfDk-0005XP-8V; Tue, 11 Feb 2025 01:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885057.1294830; Tue, 11 Feb 2025 01:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thfDk-0005Vz-2X; Tue, 11 Feb 2025 01:37:52 +0000
Received: by outflank-mailman (input) for mailman id 885057;
 Tue, 11 Feb 2025 01:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqFZ=VC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1thfDi-0005Vt-LY
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 01:37:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cae3086c-e818-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 02:37:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C392C5C600B;
 Tue, 11 Feb 2025 01:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEB0C4CEE5;
 Tue, 11 Feb 2025 01:37:42 +0000 (UTC)
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
X-Inumbo-ID: cae3086c-e818-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739237864;
	bh=jvT05PXN9p4R2Oo1SmSG0EZHU+LC97C7U4VKDnAFZ+k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h/Mi4i0K6RWZnk5W9FrReH2eyJn0WhgkolPdjzDX2x2x0XFTjLzfJRYLibxX0pEVH
	 1lYOdd8QeVYrTwGYeNo7Mtdr9EpQBPzKoDa+2Tg+qXycZIkWP3oEJsvTks4rB1G2UD
	 Nz8kfQuNS0CxEJfX4WgB9OouMJ2AeoDtvfaYE75CipMRXq5V6pKvGk838dm4RZIK3x
	 IBk6/yL6cQw82bpvCj0TohnyGf4w+/e2eJFgGmlT+WVSHevSB2Tjk1v0V3JDQQb4MC
	 vAsJrllIZUyQH9XJ2x1Enb/BscD6/J6tazZzYCuzMvBezllaj4ZkOy/Mnnhr/PhM0Y
	 fnXBiABGSygsg==
Date: Mon, 10 Feb 2025 17:37:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, andr2000@gmail.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: Coding Style Review and Automation
In-Reply-To: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2502101736370.619090@ubuntu-linux-20-04-desktop>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Thanks Oleksandr for the summary. Adding a few maintainers in CC

On Mon, 10 Feb 2025, Oleksandr Andrushchenko wrote:
> Hello, everybody!
> 
> What is the rationale behind introducing a tool to help with coding style
> verification? I will partially quote Viktor Mitin here [2]:
> 
> "The Xen Project has a coding standard in place, but like many projects, the
> standard is only enforced through peer review. Such mistakes slip through and
> code is imported from other projects which may not follow the same standard.
> The
> goal would be to come up with a tool that can audit the code base as part of a
> CI loop for code style inconsistencies and potentially provide corrections.
> This
> tool is to embed as a part of the continuous integration loop."
> 
> I would add that it would better reflect reality to say that Xen's coding
> style
> is quite incomplete to become a standard and needs some improvement to achieve
> that.
> 
> Here, I would like to provide a bit of history and acknowledge those brave
> individuals who dared and tried to introduce to Xen coding style checking and
> formatting support with clang-format.
> 
> Year 2017, Ishani Chugh.
> ---------------------------------------------------------------------
> This journey began with a request from an Outreachy program member [1].
> Then came the first patches by Ishani Chugh [2]
> Status: *busted*.
> 
> Year 2019, Viktor Mitin
> ---------------------------------------------------------------------
> Then picked up by Viktor Mitin, EPAM's first attempt [3].
> Status: *busted*.
> 
> Year 2020, Anastasiia Lukianenko
> ---------------------------------------------------------------------
> Continued by Anastasiia Lukianenko, EPAM's second attempt [4], [5].
> Some contributions were made to LLVM to make clang-format a better fit for
> Xen [6].
> Xen-summit and presentation [7] and the summary document [8].
> Status: *busted*.
> 
> Year 2023, Luca Fancellu
> ---------------------------------------------------------------------
> Luca restarted it, first ARM attempt [9], [10], [11].
> Status: *busted*.
> 
> That's all for now, but it is still impressive as of 2025.
> 
> So, in my opinion, what were the main issues with all these attempts? There
> are
> many different views, but I would emphasize the following:
> 
> 1) clang-format doesn't perfectly fit Xen's code style as some rules it
> applies
> are not liked by the community or it applies rules that Xen's coding style
> doesn't define (those Luca described in his .clang-format for every clang
> option).
> 
> 2) clang-format doesn't work in a "one-option-at-a-time" mode [12]: clang
> maintainers strongly oppose requests to allow turning off all options except
> some. Believe it or not, other maintainers also have strong opinions on what
> is
> right and what is not for their projects, and this is one area where they will
> not compromise.
> 
> 3) The size of the patch after applying clang-format is huge. Really.
> Something
> like 9 MB. Even if everyone agrees that the approach is good and we can
> proceed
> with it, it is highly unlikely anyone will be able to review it. Considering
> that new patches are being added to the upstream during such a review, it may
> also lead to new code style violations or require a new review of that huge
> patch.
> 
> 4) Which clang-format version should we set as the one used by Xen, so it is
> easy for everyone to use it on their hosts?
> 
> 5) You name it. I think many people in the community can name their points for
> and against clang-format.
> 
> So, in this attempt, I would suggest the following approach:
> I think that I could start sending patches after the latest .clang-format 21
> for
> some part of Xen, ARM code base for example, using work already done by Luca.
> This way:
> 
> 1) Patches are formatted with clang-format, which is a strong plus.
> 2) The diff is well maintained and I can still alter it by hand if there are
> comments or dislikes.
> 3) Finally, when the patch is accepted, we can be more confident that
> clang-format will find far fewer inconsistencies than if it were just applied
> to
> the "raw" code. Thus, the next time clang-format runs, it will produce a much
> smaller patch than before.
> 4) Finally, introduce clang-format and run it on the leftovers: at this stage,
> it would be much easier to discuss every option clang has and the resulting
> output it produces.
> 5) Update existing/add new rules to the Xen coding style based on community
> agreements and the results of this activity.
> 
> We may define the subsystems to start this activity on and also define an
> acceptable size of the patch for review, say 100K. Considering that the longer
> the review, the more outdated the patch becomes and will require a new round
> as
> new code comes in.
> 
> I would love to hear from the community on this approach and finally get it
> done. Not busted.
> 
> Stay safe,
> Oleksandr Andrushchenko
> 
> [1]
> https://lore.kernel.org/xen-devel/1130763396.5603480.1492372859631.JavaMail.zimbra@research.iiit.ac.in/T/#m1db2521362edd286875acf10296873993226dcf2
> [2] https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg01739.html
> [3] https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg01862.html
> [4] https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg02157.html
> [5] https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg00022.html
> [6] https://reviews.llvm.org/D91950
> [7]
> https://xenproject.org/blog/clang-format-for-xen-coding-style-checking-scheduled/
> [8]
> https://docs.google.com/document/d/1MDzYkPgfVpI_UuO_3NRXsRLAXqIZ6pj2btF7vsMYj8o
> [9] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02294.html
> [10]
> https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00498.html
> [11]
> https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
> [12] https://github.com/llvm/llvm-project/issues/54137#issuecomment-1058564570
> 

