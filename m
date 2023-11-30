Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C4D7FFE74
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 23:28:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645173.1007126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8pVp-00016e-KV; Thu, 30 Nov 2023 22:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645173.1007126; Thu, 30 Nov 2023 22:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8pVp-00013n-Hj; Thu, 30 Nov 2023 22:28:01 +0000
Received: by outflank-mailman (input) for mailman id 645173;
 Thu, 30 Nov 2023 22:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8pVp-00013C-1Y
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 22:28:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6f0ddd9-8fcf-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 23:27:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 13D7BB84621;
 Thu, 30 Nov 2023 22:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B39C433C7;
 Thu, 30 Nov 2023 22:27:56 +0000 (UTC)
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
X-Inumbo-ID: b6f0ddd9-8fcf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701383277;
	bh=F281DB7xOndLaMDb9Xw74K249E/jyyggnnpA28gdFdo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FKMslYmSlVFcQ+5MAEBNtNPWi/1VlTTvEH2L77mNH+qzUYTpaRdAgZmswtvqYfFka
	 bQAaG9FdrtWosERJk+izOHt4qI9WtWpqAqD1CqzNGA5ZfOoKfCTq5kwQZbwfMOPfQN
	 O+5VTtgBpCTYOdNlwRp2c2muCQ99vMWtIqDOqLbfpkO2sx0u4c6UgF6Casah6KsqK+
	 lp8avOBryjaHnDP4xx8Fii2jf/xbgvPuT2YVDG5rztln2ZJBAkM89KyRTIlATrx7JJ
	 B2evxgmMz2a1FyzwwzMIfePH1mMmjjGJgalIgKL/QarMrcxWijFoJdRaxabAqyho/K
	 oQhgOpbmQrWLg==
Date: Thu, 30 Nov 2023 14:27:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Kelly Choi <kelly.choi@cloud.com>
cc: xen-devel@lists.xenproject.org, committers@xenproject.org
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
In-Reply-To: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1646724806-1701383194=:110490"
Content-ID: <alpine.DEB.2.22.394.2311301427010.110490@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1646724806-1701383194=:110490
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311301427011.110490@ubuntu-linux-20-04-desktop>

Hi all,

This vote is in the context of this thread:
https://marc.info/?l=xen-devel&m=169213351810075


On Thu, 30 Nov 2023, Kelly Choi wrote:
> Hi all, 
> There have been a few discussions about how we use documentation wording within the community. Whilst there are differences in opinions and
> perceptions of the definition, it would be helpful to see a wider consensus of how we feel. 
> 
> Discussion: Should we use the term 'broken' in our documentation, or do you think an alternative wording would be better? If you agree or
> disagree, please vote as this will impact future discussions. 
> 
> I have purposely made the vote between two options to help us move in a forward direction.
> 
> PLEASE VOTE HERE. Deadline 15th December 2023.
> Your name will be required but will be private. If you answer anonymously, your vote will not count. This is to ensure it is fair and each
> person gets one vote. 
> 
> As an open-source project, we need to come to a common ground, which sometimes means we may not personally agree. To make this fair, please
> note the final results will be used to determine our future actions within the community. 
> 
> If the majority votes for/against, we will respect the majority and implement this accordingly. 
> 
> Many thanks,
> Kelly Choi
> 
> Xen Project Community Manager
> XenServer, Cloud Software Group
> 
> 
--8323329-1646724806-1701383194=:110490--

