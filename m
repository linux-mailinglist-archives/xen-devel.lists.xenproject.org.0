Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1418C5DF7
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 00:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721821.1125500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s715i-0004PF-8j; Tue, 14 May 2024 22:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721821.1125500; Tue, 14 May 2024 22:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s715i-0004Me-4J; Tue, 14 May 2024 22:57:50 +0000
Received: by outflank-mailman (input) for mailman id 721821;
 Tue, 14 May 2024 22:57:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5lq=MR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s715g-0004MF-TB
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 22:57:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60bada91-1245-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 00:57:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4621A61354;
 Tue, 14 May 2024 22:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80A1C2BD10;
 Tue, 14 May 2024 22:57:43 +0000 (UTC)
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
X-Inumbo-ID: 60bada91-1245-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715727465;
	bh=Fa3PKxp/yI/ts4ijVfHaICrW2Uv9/Hm2uNufvNgEoEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RJpnlHULu92YKrhsJOrJKyWevHewDb9RvIovQgLCSVPVGAiNxtt/Mm2YIwcO+QR8N
	 vlBJna9CZcJrHL6lTh2votwHM6uuxtd5+I5BL1GVCrg/8xXrF+zpREjUlOGsijJNlA
	 gTqUoxgV0rvkE3IW04julBa+DU8eBEePGX0cIADqQ5Qbs6UIO5GStfnmQ+RDYJJXgg
	 69jZMs/m8veKJPieomNAWzAynu9Szlod5nkRo0igYrr7wL899uLjjdwExLufT6Neew
	 UE5nqmhVd0fMLqwgjYowB3q0WMNs8+w0oKlizrWCB4wVjRtb5nIA6uV9M/3EzhS7Ti
	 Rt5vj7OuvNF1g==
Date: Tue, 14 May 2024 15:57:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com, 
    bertrand.marquis@arm.com, roger.pau@citrix.com, 
    xen-devel@lists.xenproject.org, roberto.bagnara@bugseng.com
Subject: Re: [PATCH] docs/misra: replace R13.1 with R13.2
In-Reply-To: <369a3c75-2e71-4fb8-8373-aae737099e3b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405141556050.2544314@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405101625470.2544314@ubuntu-linux-20-04-desktop> <369a3c75-2e71-4fb8-8373-aae737099e3b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 May 2024, Jan Beulich wrote:
> On 11.05.2024 01:32, Stefano Stabellini wrote:
> > After looking closely at the R13.1 violations and potential fixes or
> > deviations, upon further reflection and discussions, we realized that it
> > is R13.2, limited to initializers list, that we want to comply with.
> > 
> > Link: https://marc.info/?l=xen-devel&m=170751643325805
> 
> The mail you point at is a reply to one where I raised an aspect that was
> never really addressed: 'I'm afraid I don't understand the "eventually
> limiting" part.' Therefore I also don't follow why we'd want to limit
> applicability of this rule to just initializer lists.

I was trying to make a 1:1 replacement, but I see your point and I
agree. We'll have to discuss at the next MISRA C meeting whether to
accept R13.2 in full or partially.

