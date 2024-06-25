Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE4915B0B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747013.1154263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuCs-0005Bh-LL; Tue, 25 Jun 2024 00:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747013.1154263; Tue, 25 Jun 2024 00:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuCs-00059m-Iq; Tue, 25 Jun 2024 00:38:46 +0000
Received: by outflank-mailman (input) for mailman id 747013;
 Tue, 25 Jun 2024 00:38:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuCq-00059g-HP
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:38:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45d65b69-328b-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:38:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCD9560AAF;
 Tue, 25 Jun 2024 00:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8E1C2BBFC;
 Tue, 25 Jun 2024 00:38:40 +0000 (UTC)
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
X-Inumbo-ID: 45d65b69-328b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719275921;
	bh=ktQo16y2Vhka7KTqan+9+Ol8CWV6EDfxWQkNMc43LzQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sYyQcPQi3rTewaJBDUo7c75IOwfbY89SrGatVDjp0XPDdj5LjDlu5BN2xTUJ6XTOo
	 Bnq0ToNJjX0WIG7/fTlS+esyG7f9jds7BpYYqo52Tdszu7KNgGo30zL3QM2ZOs9bCQ
	 6CNiP7H/RiDZJcGMhqpyebPPi4Qu7GW3JWpsrd9bAXFW+el2PbXv3sXlqOdiwb9u6e
	 +9wlEAr9Jk5Mhf4+Pqt/sx8coxU19rHRRQV61rpNCd0F10V1qga0ViCtpzNbuKXiA3
	 zCAg7FnUcdgC92BtY8SkJZroLCV/zIfWJjqV0H9OfxqU2yxBawlu0k1L46mU8g4bcb
	 BeQq4DXZSXExw==
Date: Mon, 24 Jun 2024 17:38:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, oleksii.kurochko@gmail.com
Subject: Re: [XEN PATCH v3] automation/eclair: extend existing deviations of
 MISRA C Rule 16.3
In-Reply-To: <alpine.DEB.2.22.394.2406191821310.2572888@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2406241736560.3870429@ubuntu-linux-20-04-desktop>
References: <71a69d25e7889ed6e8546b5cd18d423006d69ceb.1718356683.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406191821310.2572888@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Jun 2024, Stefano Stabellini wrote:
> On Fri, 14 Jun 2024, Federico Serafini wrote:
> > Update ECLAIR configuration to deviate more cases where an
> > unintentional fallthrough cannot happen.
> > 
> > Add Rule 16.3 to the monitored set and tag it as clean for arm.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Hi Oleksii,

I would like to ask for a release-ack as this patch only increases
deviations, hence only affecting the static analysis jobs, for a rule
that is non-blocking

