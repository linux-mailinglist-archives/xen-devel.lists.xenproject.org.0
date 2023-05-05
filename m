Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185F6F8C5B
	for <lists+xen-devel@lfdr.de>; Sat,  6 May 2023 00:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530681.826436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv3vc-0007UK-OC; Fri, 05 May 2023 22:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530681.826436; Fri, 05 May 2023 22:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv3vc-0007Rn-LP; Fri, 05 May 2023 22:29:28 +0000
Received: by outflank-mailman (input) for mailman id 530681;
 Fri, 05 May 2023 22:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSQs=A2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pv3vb-0007Rb-8c
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 22:29:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a0db73-eb94-11ed-8611-37d641c3527e;
 Sat, 06 May 2023 00:29:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BADCD64146;
 Fri,  5 May 2023 22:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3104EC433EF;
 Fri,  5 May 2023 22:29:22 +0000 (UTC)
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
X-Inumbo-ID: 49a0db73-eb94-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683325763;
	bh=4dYx1LJPZVLQb1DyajVpkYkYKikgBEG6wKEEOq6JRDg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rjIi2K6y9Ut6lOg/KzWnKSLDajpG0zFPHnWWbWbJIfSaJgmTHJiGSSrLkVx1djFJ3
	 soJ2msK2aNMWijGDvAQN+PYGueCOwtRmuUHOYkCGLLFV5s+h2lktuaqZAfwuWzDjh0
	 o2Qe2SXqg5pa9Yr9zFoGZiEK723uw+2hqX2kOwMdQjfhfibiOt0Xlc6pkUXvYjdVs0
	 qGZB9aJrqj6zUEkf7wZDl4XctCSMEo//yNsy3NRdbMsuiOiMtO1XkCtVoSO6sVGY/c
	 yhJUwWhW6KCL8RudA7kUeRK/AqOhJ60pHUrpybbxT6VVicbFhldEZeAT+haPvL6Eit
	 NIHNv/ABwHYQg==
Date: Fri, 5 May 2023 15:29:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] LICENSES: Improve the legibility of these files
In-Reply-To: <e8ec85b6-90bb-1df0-4f6b-d7e9c6ade25f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305051529140.974517@ubuntu-linux-20-04-desktop>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com> <20230505130533.3580545-2-andrew.cooper3@citrix.com> <e8ec85b6-90bb-1df0-4f6b-d7e9c6ade25f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 May 2023, Jan Beulich wrote:
> On 05.05.2023 15:05, Andrew Cooper wrote:
> > A few newlines go a very long way
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Although I don't mind either way it should be noted that the LICENSES
files came from Linux, and Linux doesn't have the extra spaces.

That said, these are licenses files not code, so we don't necessarily
need to keep them in sync over time I think.

So I am fine with this. I am also fine if you drop this patch.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

