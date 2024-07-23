Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287993A971
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 00:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763629.1173912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWOFM-0005rt-SH; Tue, 23 Jul 2024 22:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763629.1173912; Tue, 23 Jul 2024 22:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWOFM-0005px-PU; Tue, 23 Jul 2024 22:44:40 +0000
Received: by outflank-mailman (input) for mailman id 763629;
 Tue, 23 Jul 2024 22:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFMf=OX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWOFL-0005pr-N9
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 22:44:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24233b0a-4945-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 00:44:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9CF0960DC1;
 Tue, 23 Jul 2024 22:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B786C4AF09;
 Tue, 23 Jul 2024 22:44:35 +0000 (UTC)
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
X-Inumbo-ID: 24233b0a-4945-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721774677;
	bh=F5t+aW4/cz27tMUH2xtHVhEUlJFfdAox9w4UQHwArEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WO80UGrIAukZwaGKORhTjMjIS7y2jXq9DTEiKOm+gs8QB4wRkmn+Zkj2MsLXGfzzB
	 UNY6iDnsdRNgDSYwv5Vm85B038mW6KNzezSDu8OZx6KAmfT7qUgAEzkNpDnudhpRN8
	 fcrfaE06lPDWbY3xs6TOjNsYr7Iv0KJJN7Y4kL17sC/i7F9X344879DsXW8URXAv4F
	 Uj4Fc40TSKiw9A2pluXdUX5Q8nfk/xhFMMTCwOa8gDU8Wfh7FNkVlXYZGQ7yPi9kFZ
	 RfIW/bQSv6t2X8HXRu88ZNFny4ylruzH065053fVnFvAqe0KC2m9XqteyuOC+XxxeZ
	 790pRsKv7Btxg==
Date: Tue, 23 Jul 2024 15:44:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [XEN PATCH v5 17/17] include/asm-generic: rename inclusion guards
 for consistency
In-Reply-To: <79c020c608d59c1c5d4156e307acba046b1ad17e.1721720583.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407231544270.4857@ubuntu-linux-20-04-desktop>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com> <79c020c608d59c1c5d4156e307acba046b1ad17e.1721720583.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Alessandro Zucchelli wrote:
> Edit inclusion guards in asm-generic header files in order to make them
> consistent with the estabilished naming convention.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


