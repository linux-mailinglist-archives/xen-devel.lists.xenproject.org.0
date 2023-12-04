Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3518042E4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 00:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647354.1010403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAIio-0006dP-UP; Mon, 04 Dec 2023 23:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647354.1010403; Mon, 04 Dec 2023 23:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAIio-0006b6-RN; Mon, 04 Dec 2023 23:51:30 +0000
Received: by outflank-mailman (input) for mailman id 647354;
 Mon, 04 Dec 2023 23:51:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A84=HP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAIin-0006b0-6F
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 23:51:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07b46616-9300-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 00:51:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A30A661254;
 Mon,  4 Dec 2023 23:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798A2C433C8;
 Mon,  4 Dec 2023 23:51:21 +0000 (UTC)
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
X-Inumbo-ID: 07b46616-9300-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701733882;
	bh=yIW68xJUrwAvtznLJmo18RWVROlHx/acwzfA1j1B+qo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qy48tNEB0H9qZaO5+YfV6rXOJhaXUllOcProD3h2kBHKE92BZcm3Z4eCZMuslEjLp
	 /nNsBijcyxp47+0SUpBO9cPCLMltZE0Cq0QI0Ge6+0EAUeDiiS5mqBAQiwT6Hp0BM2
	 NDibPYzV4J1qE+Gacy1fC6kH3rf0CRVtpyUNlJFoGenatJdeMcwsCWYelZwKIAyaLi
	 1OCf4ScimH16E0+cJPLEoaR551R2v6xpsYVg+5TUWVsnKDmpEqlPxCnC2I1f0HtS+X
	 v3W+XeOBPoCECA405dtWMQE+CiB9ckZqHrKVC+3UbdKPnb2lhHoMzJOKVzOy9r0QP0
	 xFY9uzmeD6ErQ==
Date: Mon, 4 Dec 2023 15:51:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org, 
    committers@xenproject.org
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
In-Reply-To: <CA+zSX=YNcjDZHF-gx8C8owEpyyjSEtj-MKDAqRwp9woHzEFtUg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2312041524180.110490@ubuntu-linux-20-04-desktop>
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com> <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop> <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com> <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop>
 <1978d259-1531-4dcc-a106-d87f6f26885d@suse.com> <CA+zSX=YNcjDZHF-gx8C8owEpyyjSEtj-MKDAqRwp9woHzEFtUg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Dec 2023, George Dunlap wrote:
> And how do we give people practical options to respond to a maintainer
> who they think is being "picky"

If a maintainer is too picky the contributor and the other maintainers
should say that the patch is good enough in their view. If the
maintainers disagree (on that topic or another) the new informal voting
rule should help us move forward faster.

The informal voting would have helped us move forward faster in the
original thread.


On Mon, 4 Dec 2023, George Dunlap wrote:
> the chance of a vote of the committers being out of sync with the
> community is fairly small. But of course, small is not impossible.
> [...] Hence the community-wide survey.

Yes. If someone cares about the outcome, and they are not happy with the
informal vote, then they need to call for a formal vote.

But maintainers/committers might not always be the right people to
escalate the voting to.

Yes committers' opinions should count, but certain things have more to
do with our users and the way they understand our documentation than
implementation correctness. For these things, our users' opinions should
count as much as ours.

So I can see that in those cases, if someone is not happy with the
informal vote, the best next step would be a community-wide survey like
Kelly did here. That's a good idea. 

I don't think that's written anywhere in our governance specifically,
but I think it would be a good addition.

