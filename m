Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B687A4ECDB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 20:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901454.1309409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpXe0-0007XJ-E4; Tue, 04 Mar 2025 19:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901454.1309409; Tue, 04 Mar 2025 19:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpXe0-0007Vt-BM; Tue, 04 Mar 2025 19:09:32 +0000
Received: by outflank-mailman (input) for mailman id 901454;
 Tue, 04 Mar 2025 19:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBJn=VX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpXdz-0007Vl-2V
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 19:09:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f1dccbb-f92c-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 20:09:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22F3BA45C72;
 Tue,  4 Mar 2025 19:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D918C4CEE5;
 Tue,  4 Mar 2025 19:09:21 +0000 (UTC)
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
X-Inumbo-ID: 2f1dccbb-f92c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741115362;
	bh=FR4pwLReWGnkxv8J+Lnfrgkv2pcuahFC0Q/UVMZZguI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RYG1kAiJyX1rhaWPZ53NGL2HcelBZbm8mlRBTO6KzOqBmCdELL76dWKbYg/xmliOP
	 RcWHXOvJq/BYi/S4aq8jCeimbnsO0MumZIGkV08xHrhLmjyHEXX+JPFHjLEHbMMetm
	 ACj1Pk0RWrNL8VFsCeSYYRwIW35S/QEgectouvPQZEs/nanuZMCtc/wQcP3MYmyQ/X
	 lvxO5xDg00SMGhsNO740QczlWsjwbntUIGLqTsdPgU+ctPD1qt9GtwobGkEvHWBVOQ
	 GoVp6vwQGA6o53jmg9Y+W9/YB10HAFKPcLEPNZPECRCMqaYISa5tLzVUQRHNXDVlcP
	 81ohMbEpFwChg==
Date: Tue, 4 Mar 2025 11:09:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    Artem_Mygaiev@epam.com, jbeulich@suse.com, Luca.Fancellu@arm.com, 
    roger.pau@citrix.com, marmarek@invisiblethingslab.com, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech
Subject: Re: [PATCH 0/4] clang-format with examples
In-Reply-To: <20250301114242.93650-1-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2503041109140.1303386@ubuntu-linux-20-04-desktop>
References: <20250301114242.93650-1-andr2000@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksandr,

I really appreciate the examples you provided; they were very
enlightening regarding the way forward.

Today we discussed the topic with the maintainers again, and I believe
we have identified the best approach to take.

Since it is not feasible to use clang-format to make changes to an
entire file at once, and even applying clang-format patch by patch, as
demonstrated in this series, poses challenges, we think that
clang-format is not a suitable solution. Many of the suggested changes
are unwelcome, making its use impractical.

We believe the best approach is to start small and use a tool like
checkpatch.pl to enforce a limited set of coding style rules that we all
agree on. A simple starting point could be enforcing basic rules such as
indentation must be four spaces.

The key idea is that it is better to have a tool that enforces a few
rules correctly rather than one that enforces many rules but some of
them wrong. 

With this in mind, a tool similar to checkpatch.pl that verifies only
the coding style rules explicitly defined in CODING_STYLE would be an
excellent starting point. If we identify inconsistencies within Xen
source files, the maintainers have agreed to review each issue
individually and establish a consensus-based resolution, similar to how
we handled MISRA rules.

It is important to note that we will need to make exceptions for files
imported from Linux, many of which are already listed under
docs/misra/exclude-list.json. We can reuse this exclusion list for
coding style checks, ensuring that it does not interfere with how
exclude-list.json is currently used by ECLAIR for MISRA scans.  

Does this approach make sense? In summary, if we had a version of
checkpatch.pl that enforced the coding style defined in CODING_STYLE
instead of Linux-specific style rules, we would be happy to adopt it and
integrate it into the CI loop. The tool does not necessarily have to be
written in Perl; it could be implemented in another language, such as
Python, if that is more convenient.  

One final note: Please disregard the section "Header inclusion guards"
in CODING_STYLE, as we are aware that it needs updating.  

Cheers,

Stefano


On Sat, 1 Mar 2025, Oleksandr Andrushchenko wrote:
> Hello, everybody!
> 
> In order to continue activity started at [1] I am sending this series
> which allows to manually run coding style checks and does not provide
> any automation yet.
> 
> Only the first patch is the goal of this series and patches 2-4 are for
> example only.
> 
> This proposal disables coding style checks for the project, but xen/
> folder: this is done by providing a global .clang-format at the project
> top level which disables clang-format and only providing .clang-format
> for xen/ folder.
> 
> clang-format version expected to be >15 and the latest tool can be
> installed with:
> python3 -m pip install clang-format
> This allows having the tool without the need to compile or install
> anything else.
> 
> As no automatic code style checks are performed, so all those can be
> run manually:
> 
> - to see changes proposed to the patch being worked on (not committed yet):
> git-clang-format --diff --style=file --verbose
> 
> - to run code formatting on the HEAD patch:
> git-clang-format --style=file --verbose HEAD~1
> 
> Provided xen/.clang-format still has a lot of comments gathered from the
> previous discussions. This is for purpose of better seeing why some of
> the options have their values. Once option values are accepted all those
> comments can be removed.
> 
> Stay safe,
> Oleksandr Andrushchenko
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2025-02/msg00800.html
> 
> Oleksandr Andrushchenko (4):
>   Add .clang-format files to enable manual coding style checks
>   [EXAMPLE] Provide an example of a malformed patch
>   [EXAMPLE] Changes done by clang-format to the previous commit
>   [EXAMPLE] Whole file code style formatting
> 
>  .clang-format              |    5 +
>  tools/xl/xl_info.c         |    6 +-
>  xen/.clang-format          | 1380 ++++++++++++++++++++++++++++++++++++
>  xen/drivers/char/ns16550.c |   13 +-
>  xen/drivers/pci/pci.c      |    8 +-
>  5 files changed, 1397 insertions(+), 15 deletions(-)
>  create mode 100644 .clang-format
>  create mode 100644 xen/.clang-format
> 
> -- 
> 2.25.1
> 

