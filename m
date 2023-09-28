Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037BD7B28B9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 01:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610088.949368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0Il-0005kz-Lz; Thu, 28 Sep 2023 23:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610088.949368; Thu, 28 Sep 2023 23:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0Il-0005fu-HB; Thu, 28 Sep 2023 23:20:11 +0000
Received: by outflank-mailman (input) for mailman id 610088;
 Thu, 28 Sep 2023 23:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qm0Ik-0003MQ-Az
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 23:20:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ff880c7-5e55-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 01:20:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4C843B81E16;
 Thu, 28 Sep 2023 23:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441C6C433C7;
 Thu, 28 Sep 2023 23:20:05 +0000 (UTC)
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
X-Inumbo-ID: 8ff880c7-5e55-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695943206;
	bh=P9oQEpp660p+W181qm5R/e3m+TprZ/k4G/1Ywu6oqu4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EMhWPWUc71GnJCG8/NXr0RSXB2IvYoFMrBw+hxLIhHzJ5fzDiAOQ6MinO0NfQfQpL
	 vJU1mcojHkaH4Km+AByXxGSg0828TJcNQ22nxFsN0MwH9Y/veLmieq/UCCmHSlOb3O
	 tqoYelSv+E2FIKeHM9dGiW/0tysUYPW8v80DbfbU0Yzx1mGrEKMPcyU8FwSj+4McLQ
	 ZWMhj6gEiJZafc6U3WkHofJpF+H4EWP5kljjxQwwYpiZ1CoE58TuSxb/Y+Yhad8OC3
	 Ml3mDKaninu2pqG7+IUs/ilxv4eVsh1TAkrPi9kfB2XrV91z3IUyXYTeBesEHRoJ42
	 pqr0nxoinP67A==
Date: Thu, 28 Sep 2023 16:20:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    nicola.vetrini@bugseng.com, simone.ballarin@bugseng.com, 
    federico.serafini@bugseng.com
Subject: Re: Misra rule 10.3 violations report script
In-Reply-To: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309281609360.1996340@ubuntu-linux-20-04-desktop>
References: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-963039786-1695942939=:1996340"
Content-ID: <alpine.DEB.2.22.394.2309281615450.1996340@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-963039786-1695942939=:1996340
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309281615451.1996340@ubuntu-linux-20-04-desktop>

On Thu, 28 Sep 2023, Luca Fancellu wrote:
> Hi all,
> 
> In the last MISRA meeting Stefano told me about the Rule 10.3 and that we have a lot of violations,
> but GCC has a way to list them as written in rules.rst.
> 
> So the issue was just that we have a lot of violations, most of them coming from headers and the
> Developer might feel a bit lost since the number is very high, so I’ve developed this script to take
> the GCC build log and create a list of unique occurrences of the violations sorted in descending
> order, so that who has a bit of time can try to fix some of those and maybe can start from the top
> of the list to fix as many as possible occurrences.
> 
> I attach the script as patch file.

Thanks Luca! Actually I think this is great! The script makes it much
easier to use the GCC output to address 10.3 violations. I think we
should have it in the xen.git tree.

Thanks to the script I was able to quickly address the top violation in
bitmap.h.
--8323329-963039786-1695942939=:1996340--

