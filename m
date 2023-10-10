Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261ED7BF02B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614546.955709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1Pu-0001HF-05; Tue, 10 Oct 2023 01:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614546.955709; Tue, 10 Oct 2023 01:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1Pt-0001EX-SX; Tue, 10 Oct 2023 01:20:09 +0000
Received: by outflank-mailman (input) for mailman id 614546;
 Tue, 10 Oct 2023 01:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq1Pt-0001B4-2x
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:20:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2637e0dc-670b-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 03:20:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 85CEDB80B55;
 Tue, 10 Oct 2023 01:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EFAC433C8;
 Tue, 10 Oct 2023 01:20:04 +0000 (UTC)
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
X-Inumbo-ID: 2637e0dc-670b-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696900806;
	bh=E1LNVoizITBUV1v6sbEcvby/Pba3S/QQztxr6p7I0xg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RE+/o+ZpKTuk0dSTC2kBNOs7FA9qepsxJkV2zooh7JGavys3isc76A6q2v0wnS2NC
	 tAAnrUZzzRE1CsGbr55zcMySGJIy5T99Oh3qi/UtD9XPAUtH7Ub5sbIHaWnJgD+2XN
	 XuLFFlG9BWw+Fp7c5nA6jiCMNA9ahXz8Qd6FcCnUeJd56NiJ35fQRfJFjgC3lUd6aJ
	 MuWdfe3vOQl1OIdVSxVJXCgUn+1kZ4U8SREnZVKGXKQT+WPJtLQ2SMgHlf9LYLS9Tj
	 rnGlMg109c0T1WbvOcb8R5IQ2bR6A/Q9dpCs0SLjthftfWkIt3R60pLRga6cK/PGjj
	 pL6/6ueRhiTqQ==
Date: Mon, 9 Oct 2023 18:20:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH][for-4.19 v2 1/2] automation/eclair: update deviations
 and accepted guidelines
In-Reply-To: <c67293c3351287a218d4e3df3cc3ef2cf937fc2a.1696865051.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310091811100.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696865051.git.nicola.vetrini@bugseng.com> <c67293c3351287a218d4e3df3cc3ef2cf937fc2a.1696865051.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Oct 2023, Nicola Vetrini wrote:
> From: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Remove deviations for ERROR_EXIT, ERROR_EXIT_DOM and PIN_FAIL:
> the aforementioned macros have been removed.
> Add deviation for Rule 2.1 for pure declarations.
> Remove legacy text-based deviations: these are now implemented
> with SAF comments.
> Add deviations for Rules 8.4, 10.1, 13.5, 14.2, 14.3.
> Remove deviations for guidelines not yet accepted or rejected.
> 
> Add MC3R1.R11.7, MC3R1.R11.8, MC3R1.R11.9, MC3R1.R15.3 and MC3R1.R14.2
> to the accepted guidelines selector.
> 
> Update clean guidelines selector.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


