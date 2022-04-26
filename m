Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7669250EED1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 04:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313403.530913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njB2C-0004vs-6z; Tue, 26 Apr 2022 02:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313403.530913; Tue, 26 Apr 2022 02:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njB2C-0004so-3q; Tue, 26 Apr 2022 02:34:36 +0000
Received: by outflank-mailman (input) for mailman id 313403;
 Tue, 26 Apr 2022 02:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njB2A-0004si-DJ
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 02:34:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 678b061a-c509-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 04:34:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EBEFB81BA9;
 Tue, 26 Apr 2022 02:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AFCC385A7;
 Tue, 26 Apr 2022 02:34:30 +0000 (UTC)
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
X-Inumbo-ID: 678b061a-c509-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650940470;
	bh=A7Fx2dBy23978ttmxnVbfI3IAfe7cU81rx3fd4TQUDY=;
	h=Date:From:To:cc:Subject:From;
	b=NQO40yBLGnJTyl3Liu+N5J5XfU26shXgGlFlpKVYTk4qYiZ3AE19fTvcYR9iogHOY
	 0YWCKbhp0fJQPhygwRfZkA8Y7VYpCA4rZeW8/Zh0//kCFs/8uJe+819Tf8LgpRmoF9
	 WyiRpWkir99hYjRRYLzxkylvsNXiT/cqqXkVSWY0zTdawgVEPf6HJcyTHTqmO+gKf/
	 xFfH1C9L+hV2SIprvrrXQ2GVY2at9g6yuRo9vyt6TM2xmK5pTo1rRz63o0JeSffjTg
	 yvn7HyiqM+MHOf7vqsvcQLf6+onHxTJhMj5wXsKedodDiETPVakD0RAr9ddwhlhUH5
	 9oJomjRJMkxRw==
Date: Mon, 25 Apr 2022 19:34:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com, andrew.cooper3@citrix.com, julien@xen.org, 
    Bertrand.Marquis@arm.com, roger.pau@citrix.com
cc: sstabellini@kernel.org, george.dunlap@citrix.com, 
    xen-devel@lists.xenproject.org, Artem_Mygaiev@epam.com
Subject: Xen MISRA C meeting
Message-ID: <alpine.DEB.2.22.394.2204251730000.915916@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I would like to schedule a meeting to discuss Xen and MISRA C with the
Xen community. I have a proposal on how to make progress in terms of
MISRA C adoption in Xen and I would like to get your feedback on it.

The meeting is open to anybody. The Xen x86 and ARM maintainers' input
is required to make progress, please fill the Doodle poll by the end of
Wed Apr 27 if possible.

https://doodle.com/meeting/participate/id/elY67vja

If no slots work in the Doodle poll for everyone we could consider
re-using the Xen Community call slot (it is one of the Doodle poll
slots).

Cheers,

Stefano

