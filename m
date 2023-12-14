Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2728126A4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 05:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654293.1021041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDdWB-0003wK-En; Thu, 14 Dec 2023 04:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654293.1021041; Thu, 14 Dec 2023 04:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDdWB-0003tK-Au; Thu, 14 Dec 2023 04:40:15 +0000
Received: by outflank-mailman (input) for mailman id 654293;
 Thu, 14 Dec 2023 04:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDdW9-0003tE-7V
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 04:40:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbf16f13-9a3a-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 05:40:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5E4DECE22AD;
 Thu, 14 Dec 2023 04:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5272C433C8;
 Thu, 14 Dec 2023 04:40:02 +0000 (UTC)
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
X-Inumbo-ID: dbf16f13-9a3a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702528803;
	bh=PNBbQxoKFeD1S8tPQhuZzSMFlj7D46Y240hC5tR3Oto=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oF2nl/wn/XPfH3CJCgULcCom686I+sG4FqTURKIODlMbJqSNTPqrWyOS5uofEz5ig
	 biTko6xl19KI/xBZmmfIDYFX+cIPPdiFjXS7Acb3B7do/tGgG1u9/ZMrIbagP6De4Z
	 GPZi1d6MPWY2cPZukUF4HxeSJR3J7Tp8UbrMZHvfa6NWXo0qoAOsJVXWuyXKvSQ+Yc
	 YxFSfGLseNvB7sqEFlJuBIA0oYTh/U4hzgilEmWukHqg+cPSYjkrtS9F1PDlDdCpon
	 F9Lvov8ZG1/qZs7LCERqYsiexgA3OL+suUS72azSBmQbFqETz/vxjsZzPl32QF4YAM
	 REvbfEakeTpBg==
Date: Wed, 13 Dec 2023 20:40:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "dpsmith.dev" <dpsmith.dev@gmail.com>
cc: George Dunlap <george.dunlap@cloud.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org, 
    committers@xenproject.org
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
In-Reply-To: <41179178-a1cd-4b9f-8955-f9f2acdb4967@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2312132039320.3175268@ubuntu-linux-20-04-desktop>
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com> <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop> <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
 <41179178-a1cd-4b9f-8955-f9f2acdb4967@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Dec 2023, dpsmith.dev wrote:
> While this survey may have been released with the best of intentions, I can't
> help but to find it poorly conceived. Banning words, whether in general or for
> a specific instance, is not something to be taken lightly via "informal vote",
> and in my humble opinion is not addressing the underlying issue at hand. In
> fact, and not to be overly dire, the result is that it has put the project at
> the verge of a fork and/or collapse of the project as a whole. This survey
> must be immediately recalled, all results destroyed and anyone that has
> reviewed said results, should not discuss them, either publicly or privately.

I agree, it was sent with the best intentions but I would not have sent
the survey in the first place. Now it is best to close this thread.


> I do not feel that a rush to form a Technical Advisory Board would address the
> larger issue at hand either. I would instead call for a bounded-duration
> working group to be convened, with an explicit charter to collect and vet
> community issues.

This is a good suggestion. Let me discuss the details of an initial
proposal with Kelly and the committers and get back to the community for
further discussion (in a new different thread). This is an opportunity
for process improvement driven by people that care very much about the
project and are committed to its success.

