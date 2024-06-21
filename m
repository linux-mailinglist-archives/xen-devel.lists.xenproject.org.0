Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E29117E3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 03:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744981.1152111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKSn0-0005dr-N0; Fri, 21 Jun 2024 01:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744981.1152111; Fri, 21 Jun 2024 01:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKSn0-0005bn-KC; Fri, 21 Jun 2024 01:10:06 +0000
Received: by outflank-mailman (input) for mailman id 744981;
 Fri, 21 Jun 2024 01:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKSmz-0005VR-6J
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 01:10:05 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbf96f0b-2f6a-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 03:10:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 49FC2CE0956;
 Fri, 21 Jun 2024 01:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBB2C2BD10;
 Fri, 21 Jun 2024 01:09:55 +0000 (UTC)
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
X-Inumbo-ID: fbf96f0b-2f6a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718932197;
	bh=fvLedT6Y/NaMWeO/6E8toVexe19/hwyphiFEwY6kirk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rsvWMrT99N7r5at3p2rVIpNS7EFJd2i5Nt6AIeml/9ml3HJwM+wn0kVszVeeXb47N
	 oUj0O3zPUZlTtQ6II68zjSEZv/gs3fC2sbfC/TiLFgOBofc7CWobOsyzYIh6D5iweM
	 5mYNSJsojHf0PyOVtGaLTUVNCpHRbAp9yxwwx1z9DWYuknRuY6qeVk7AaXEWkYSGvz
	 S560xQXhADy1j9ZJlG3Ox6RrAiofSg0Fus7izbgNvp7gnK/gf+W8QCJIFIuUA2CSbx
	 j+MnbTkAAJiC2nT75iJ3IWlCt3U2j/so8dkxgQIXflcK1XIsQdD6Fh/sRZ60lTVdZO
	 +LQKvmqXchwkg==
Date: Thu, 20 Jun 2024 18:09:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen: add explicit comment to identify notifier
 patterns
In-Reply-To: <058a6cc6-bf84-4140-a3fb-12ec648536b0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406201808190.2572888@ubuntu-linux-20-04-desktop>
References: <96a1b98d7831154c58d39b85071b9670de94aed0.1718617636.git.federico.serafini@bugseng.com> <058a6cc6-bf84-4140-a3fb-12ec648536b0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Jun 2024, Jan Beulich wrote:
> On 17.06.2024 11:49, Federico Serafini wrote:
> > MISRA C Rule 16.4 states that every `switch' statement shall have a
> > `default' label" and a statement or a comment prior to the
> > terminating break statement.
> > 
> > This patch addresses some violations of the rule related to the
> > "notifier pattern": a frequently-used pattern whereby only a few values
> > are handled by the switch statement and nothing should be done for
> > others (nothing to do in the default case).
> > 
> > No functional change.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> I guess I shouldn't outright NAK this, but I certainly won't ack it. This
> is precisely the purely mechanical change that in earlier discussions some
> (including me) have indicated isn't going to help safety. However, if
> others want to ack something purely mechanical like this, then my minimal
> requirement would be that somewhere it is spelled out what falls under

I know there is a new version of this patch on xen-devel but I just
wanted to add that although it is true that this patch taken on its own
it does not improve safety, it does improve safety because it enables us
to go down to zero violations on rule 16.4 and then make the rule 16.4
blocking in the gitlab-ci ECLAIR job.

