Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152BB92AA3A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 21:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755598.1164016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQuUO-0004k0-8S; Mon, 08 Jul 2024 19:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755598.1164016; Mon, 08 Jul 2024 19:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQuUO-0004i0-5a; Mon, 08 Jul 2024 19:57:32 +0000
Received: by outflank-mailman (input) for mailman id 755598;
 Mon, 08 Jul 2024 19:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgpN=OI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sQuUM-0004ZL-Lg
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 19:57:30 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b491391-3d64-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 21:57:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 476D0CE0F08;
 Mon,  8 Jul 2024 19:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90549C116B1;
 Mon,  8 Jul 2024 19:57:19 +0000 (UTC)
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
X-Inumbo-ID: 4b491391-3d64-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468640;
	bh=vk8qUoPKpAVrK7exPxJCI1y8r71oNkMKkVp76PWQMx0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jV/AuaB9sTgRCAKIQsFGqYS9JR8M6uNgYI9Z2k8hB7gbmPG8dTSythUFXEkhvM1Qi
	 cNu/5dPe7B6cwh91IXo38J2f8dZtVoJWK3kOISRJyEg2Xv82ypXlKMZDHOSaKB44ow
	 OJR/pikdr2KmtheovIKJ+qjyYi5AnFTlNGZJ4QutdN46yDYebM2JjcaiR1XNap0Fea
	 QQuo1Op0xVLI5XraR1MBwPufYjqGRwC8qq8XJknKYDrLmdi88ZLLGb8ZvDhbuseut1
	 2cICXiWdzYAIh77GANBuikDo96rSTbljDdp/dm+vl3peKuKrRlClooMFAkUt2uHBRw
	 u5zoqJiVpN0Og==
Date: Mon, 8 Jul 2024 12:57:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Kelly Choi <kelly.choi@cloud.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>, 
    win-pv-devel@lists.xenproject.org, committers@xenproject.org, 
    minios-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org, 
    Roger Pau Monne <roger.pau@cloud.com>
Subject: Re: [Vote] Xen Project Code of Conduct Team Member
In-Reply-To: <CAO-mL=xEEdCjUWN3oqJEBjktH+dsJDXrQ2uHWD80bJJ32q3_pw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2407081257020.3635@ubuntu-linux-20-04-desktop>
References: <CAO-mL=xEEdCjUWN3oqJEBjktH+dsJDXrQ2uHWD80bJJ32q3_pw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1861991062-1720468640=:3635"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1861991062-1720468640=:3635
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 8 Jul 2024, Kelly Choi wrote:
> Hi all, 
> As you are aware, George Dunlap has recently stepped down from the Xen Project as a committer, but he was also a part of the Code of
> Conduct team.
> 
> As a result, Stefano will be the only member remaining on the CoC team. @Roger Pau Monne has volunteered to join the team, so that there
> are at least two members.
> 
> In accordance with https://xenproject.org/developers/governance/, I need the leadership teams of the three mature projects: the Hypervisor,
> the XAPI project, and the Windows PV Driver project to vote on this proposal.
> 
> The specific voting rules, in this case, are outlined in the section: https://www.xenproject.org/governance.html#project-decisions
> I propose to tally the votes after July 31st, 2024. You can reply via email in public or private:
> +1: for proposal
> -1: against proposal

+1
--8323329-1861991062-1720468640=:3635--

