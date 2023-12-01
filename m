Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B8C8015A4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 22:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645776.1008109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9BJC-0003MR-RS; Fri, 01 Dec 2023 21:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645776.1008109; Fri, 01 Dec 2023 21:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9BJC-0003Jj-Nx; Fri, 01 Dec 2023 21:44:26 +0000
Received: by outflank-mailman (input) for mailman id 645776;
 Fri, 01 Dec 2023 21:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r9BJB-0003Jd-Fd
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 21:44:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cacfbd1d-9092-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 22:44:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 78BB1B8496B;
 Fri,  1 Dec 2023 21:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C182C433D9;
 Fri,  1 Dec 2023 21:44:21 +0000 (UTC)
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
X-Inumbo-ID: cacfbd1d-9092-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701467061;
	bh=anh8td+sCO7BNAZ0CEzGJOncT8BnY0Mwtm/M6vry5Sc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TUiofiOSwSgRP6pknRcgaUUSlCpOsXV93yMJ33oqCqWqNQ6FMtRTYSgZSx+XnAge4
	 hWidMj+K7/nGx0fHjqz/SRGxGv5y976Z2SoaiDUi8+dRhohq5W44YNBprJvpYjkZsO
	 Jw7jfnD+WRabbQr8XQMvGHZ8zFEVKDih2jRB5+esTuBQDa/jaMHVK67hXJSp4Zwpck
	 NNn66nsIZ9VQ6PS8K3/cLNexf8Bjg/hDcX/Z/SSyHT4kZimFCTSKvYORGuPUU5EtBG
	 PcRQJIlq4ZPpPcdoVPJWNeCXtRiDpJqrVx38b74aBj5vQS8AesQY4rJwv9dNY3qeud
	 B/1sBMVFM/Wsw==
Date: Fri, 1 Dec 2023 13:44:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org, 
    committers@xenproject.org
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
In-Reply-To: <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop>
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com> <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop> <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Replying here on a couple of different people on this thread.


On Thu, 30 Nov 2023, Tamas K Lengyel wrote:
> I think this form is bad and is not helpful. 

I agree with Tamas and (also Jan) that this form is not helpful.


On Fri, 1 Dec 2023, George Dunlap wrote:
> If most people in the community really do think that "broken" is
> suitable for the documentation in our project, then of course the
> maintainers should stop objecting to that kind of language.  If most
> of the people in the community think that "broken" is *not* suitable
> for technical documentation, then of course this isn't an example of
> unreasonable review (although other instances may be).

I think there was a misconception when Kelly created this form that the
push back was on the usage of the word "broken" globally in Xen Project.
It is not the case.

I for example agree that "broken" can be used in Xen Project, but I
don't think that it is a good idea to use it in that specific instance.


On Fri, 1 Dec 2023, George Dunlap wrote:
> [Andy] removing "broken" is a completely unreasonable request

I am in favor on moving faster and nitpicking less. Also, Andy put the
effort to produce the patch so he should have the default choice in the
wording. If the choice is taking the patch as is or rejecting it, I
would take it as is.

I might have a preference on a different wording and I voiced that
preference. We could say that my request should have been optional, not
mandatory. But when the majority of reviewers request the same thing,
which wording choice should apply?

If we decide to ignore the feedback as unresonable or because it should
have been all optional and commit the patch, what would stop anyone from
sending a patch to "fix" the wording in the comments to use "deprecated"
instead? And if someone pushes back on the second patch, would that be
nitpicking? If we commit the second patch, what if someone send a third
patch changing the wording back to "broken"? We risk getting into
"commit wars".

To avoid this, I think we should go with the majority, whatever that is,
and the decision has to stick. We have just introduced informal votes.
We should have just used that in the original thread. By the informal
voting, we have 3 against "broken" and 2 in favor (not 1 as George wrote
as Andrew's vote counts too). 

The easiest would have been to go with the majority, resend the patch,
get it committed. If Andrew feels strongly that the "broken" is the best
wording, then a proper voting form is a good idea, like Kelly did (which
I think is a full formal vote, not an informal vote). Except that the
form Kelly created is too generic and has too few options.

In conclusion, I don't care about the wording. I do care that we reach
alignment and move forward quicker. I think the informal voting
mechanism is the best way to do it.

