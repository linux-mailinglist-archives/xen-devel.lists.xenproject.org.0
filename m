Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451356988E4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 00:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496280.766944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSRWu-0004Sw-Ax; Wed, 15 Feb 2023 23:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496280.766944; Wed, 15 Feb 2023 23:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSRWu-0004RA-7K; Wed, 15 Feb 2023 23:49:40 +0000
Received: by outflank-mailman (input) for mailman id 496280;
 Wed, 15 Feb 2023 23:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pSRWs-0004R3-Ig
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 23:49:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 676f3e47-ad8b-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 00:49:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4753EB8245D;
 Wed, 15 Feb 2023 23:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF49C433EF;
 Wed, 15 Feb 2023 23:49:33 +0000 (UTC)
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
X-Inumbo-ID: 676f3e47-ad8b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676504975;
	bh=XudEG24Kl9MJslGx6RhMm3q1j1xJ91xr0LW7EAVmQ84=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nHWiqOtuxc3dW14qKKtY6FljMdAYd8z6x4HtgLIfwwnbLXhSH0Dkdt4Ku+nQvSLoZ
	 bGtGVD/kmDvg2ARdlvteO78sQtRODCYsof9OHYBlzOSxkiIrIchAA4BX6cRr5PsOht
	 t6YM1KKi03PjEzIH8eS4+hPEAIPaXY3JDzEMeg48O/gACjUAzvZUie7VkqqA44JMb7
	 P/0D6nplT/pQOCCK8bnK4hGc9yMSOWOgnGz/ViYAExiAS/dQBMEdHf8luMPmAhT/4+
	 XiZkHo3Q6SFQ29ya+jQ5rNSmrhn9DHvO1kHvWYYheNo8QN0smjEfySc7e4uMK9MLui
	 bW+4CYQhSWzkg==
Date: Wed, 15 Feb 2023 15:49:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
    wei.chen@arm.com, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/misra: add entries to exclude-list.json
In-Reply-To: <cd1fc5e2-7af6-3945-2d64-8bf2f728f633@xen.org>
Message-ID: <alpine.DEB.2.22.394.2302151438040.2127160@ubuntu-linux-20-04-desktop>
References: <20230214085635.3170962-1-luca.fancellu@arm.com> <20230214085635.3170962-3-luca.fancellu@arm.com> <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com> <alpine.DEB.2.22.394.2302141415520.2025117@ubuntu-linux-20-04-desktop>
 <cd1fc5e2-7af6-3945-2d64-8bf2f728f633@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Julien and all,

Summarizing here on the list what I had with Julien and Bertrand this
morning.


On Wed, 15 Feb 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 14/02/2023 22:25, Stefano Stabellini wrote:
> > > Patch 1's example has a "comment" field, which no entry makes use of.
> > > Without that, how does it become clear _why_ a particular file is to
> > > be excluded? The patch description here also doesn't provide any
> > > justification ...
> > 
> > It would be good to have a couple of pre-canned justifications as the
> > reason for excluding one file could be different from the reason for
> > excluding another file. Some of the reasons:
> 
> I think the reasons should be ambiguous. This is ...
> 
> > - imported from Linux
> 
> ... the case here but...
> 
> This reason is pretty clear to me but...
> 
> > - too many false positives
> 
> ... not here. What is too many?
>
> > That said, we don't necessarily need to know the exact reason for
> > excluding one file to be able to start scanning xen with cppcheck
> > automatically. If someone wants to remove a file from the exclude list
> > in the future they just need to show that cppcheck does a good job at
> > scanning the file and we can handle the number of violations.
> 
> I disagree. A good reasoning from the start will be helpful to decide when we
> can remove a file from the list. Furthermore, we need to set good example for
> any new file we want to exclude.
> 
> Furthermore, if we exclude some files, then it will be difficult for the
> reviewers to know when they can be removed from the list. What if this is fine
> with CPPCheck but not EClair (or any other)?

Yes, the reason would help. In previous incarnations of this work, there
was a request for detailed information on external files, such as:
- where this file is coming from
- if coming from Linux, which version of Linux
- maintenance status
- coding style

But this is not what you are asking. You are only asking for a reason
and "imported from Linux" would be good enough. Please correct me if I
am wrong.

If that is the case, I think it is doable. Most of these files would end
up with "imported from Linux" as a reason. That would be fine.

 
> > I take that with this exclude list, not accounting for rule 20.7,
> > cppcheck reports zero violations overall?
> 
> So the goal right now is to have zero violations from the start? Shouldn't it
> instead be that we don't increase the number violations?
> 
> If so, we would want a baseline including the files that have "too many
> violation". The advantage is it will be easier to reduce the violations in
> small chunk and the reviewer can confirm that a patch help.

Yes, we want to be able to compared and see if a patch introduces new
violations, but that's not easy to do with cppcheck and it would help a
lot if we had a cleaner baseline with only few violations. Otherwise
there is too much noise.


To help make progress faster, I took a stab at writing an
exclude-list.json with plausible reasons that should drastically reduce
the number of violations reported by cppcheck, see below.

With the below:

- There are a total of only 18 violations on x86 (Once we ignore the
  unusedStructMember reports that look bogus. We should add
  unusedStructMember to the rules exclusion list.)

- There are a total of only 12 violations on ARM64.

- You can repro my findings, applying this series, updating
  docs/misra/exclude-list.json, and calling
  ./scripts/xen-analysis.py --cppcheck-bin=/local/repos/cppcheck/cppcheck --run-cppcheck -- CROSS_COMPILE="x86_64-linux-gnu-" XEN_TARGET_ARCH=x86_64



{
    "version": "1.0",
    "content": [
        {
            "rel_path": "common/bunzip2.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "common/libfdt/*",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "common/livepatch_elf.c",
            "comment" : "not in scope initially as it generates many violations and it is not enabled in safety configurations"
        },
        {
            "rel_path": "common/lzo.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "common/symbols-dummy.c",
            "comment" : "MISRA is not relevant to this file"
        },
        {
            "rel_path": "common/xz/*",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "common/zstd/*",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "common/unlz4.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "common/unlzma.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "common/unlzo.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "common/version.c",
            "comment" : "cppcheck cannot understand the tricks with linker symbols"
        },
        {
            "rel_path": "include/xen/lib.h",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "include/xen/sort.h",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "lib/list-sort.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "lib/rbtree.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "lib/xxhash32.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "lib/xxhash64.c",
            "comment" : "imported from Linux"
        },
        {
            "rel_path": "xsm/flask/*",
            "comment" : "not in scope initially as it generates many violations and it is not enabled in safety configurations"
        }
    ]
}

