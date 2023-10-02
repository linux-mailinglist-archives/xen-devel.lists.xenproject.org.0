Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373777B5D31
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611802.951382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRVg-0004p2-AO; Mon, 02 Oct 2023 22:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611802.951382; Mon, 02 Oct 2023 22:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRVg-0004mI-7d; Mon, 02 Oct 2023 22:35:28 +0000
Received: by outflank-mailman (input) for mailman id 611802;
 Mon, 02 Oct 2023 22:35:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRVf-0004mC-9N
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:35:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae0bf28-6173-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 00:35:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B35160F3A;
 Mon,  2 Oct 2023 22:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E32DC433C8;
 Mon,  2 Oct 2023 22:35:22 +0000 (UTC)
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
X-Inumbo-ID: fae0bf28-6173-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696286124;
	bh=GVt7hssc+WSjZK8GxtU+jvnTsICnF9+SSkazN7Z1zbs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ehg9c8GAhyGus2G7BCbbTRnltzSvnotB56s83L/EdrIDuq27XUprndDkPyh2vdonM
	 aGNZXBsA/dm8I0bxc2+QIl7HsprZx0zEoNbDKoL/DDGJG8YaDEe7t9qTwUrM3RDPhM
	 jgG55ohPDgy0tQ3udWKgjLGpskxip4tYEaMfsIcG04v6UB+kZfGQ9b9w1vl+MOr+kF
	 kG1fTE+5z0CgaqUJhl8AVk9F58K7+7gZYnLrRVw7smsip5mHq/qHJdPLVAS9DqhsSN
	 Hf9I28zOKjr0Kc8wXOaInBPnAPYk8aRKWShDblXUpQYwJ8Ga85m8+iW4x75102dXWA
	 SMSmZfx99JkNA==
Date: Mon, 2 Oct 2023 15:35:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v3 0/3] docs/misra: add documentation skeleton to
 address MISRA C:2012 Dir 4.1
In-Reply-To: <cover.1696231870.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021534230.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> The headline of Directive 4.1 states: "Run-time failures shall be minimized".
> Thus, it requires the project to supply documentation that pertains the measures
> and techinques used to prevent run-time failures from happening. For ease of
> reading, the documentation is in RST format, but since ECLAIR needs a source file
> to check that the needed subsections and their format is the one expected, the
> Makefiles for the docs/ are amended to generate such a file.
> 
> The format and categories of the subsections in the .rst file can be
> customized based on feedback from the community: the one provided is just a
> basic skeleton that should be tailored to the project.
> 
> Note: The previous version of this series already had a release ack from Henry,
> which I didn't add in each commit message since I see in the commit history that
> tag being the last.
> 
> Nicola Vetrini (3):
>   docs/misra: add documentation skeleton for MISRA C:2012 Dir 4.1
>   docs: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
>   automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1
> 
>  automation/eclair_analysis/build.sh   |   6 +-
>  automation/eclair_analysis/prepare.sh |   7 +-
>  docs/Makefile                         |   7 +-
>  docs/misra/C-runtime-failures.rst     | 210 ++++++++++++++++++++++++++
>  docs/misra/Makefile                   |  22 +++
>  docs/misra/rules.rst                  |   7 +
>  6 files changed, 252 insertions(+), 7 deletions(-)
>  create mode 100644 docs/misra/C-runtime-failures.rst
>  create mode 100644 docs/misra/Makefile


Due to the code freeze, I committed these patches temporarily to:

https://gitlab.com/xen-project/people/sstabellini/xen.git for-4.19

