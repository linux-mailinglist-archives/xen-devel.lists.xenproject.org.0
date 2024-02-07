Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC63584C1AA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 02:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677224.1053692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWPG-00070R-Ip; Wed, 07 Feb 2024 01:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677224.1053692; Wed, 07 Feb 2024 01:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWPG-0006xo-FX; Wed, 07 Feb 2024 01:07:18 +0000
Received: by outflank-mailman (input) for mailman id 677224;
 Wed, 07 Feb 2024 01:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rXWPF-0006xi-JL
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 01:07:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ae9746f-c555-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 02:07:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAE9461762;
 Wed,  7 Feb 2024 01:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F57C433C7;
 Wed,  7 Feb 2024 01:07:10 +0000 (UTC)
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
X-Inumbo-ID: 3ae9746f-c555-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707268032;
	bh=ZNQbpnGpa2RA6YePIehVv3cgCYtIzTCaOTSI1UhwnU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kC5QPaTOoohRtw0qMH1ubZeUPtf8UfP0tNBMh5G6NZB2tmAAcNpYm3XoHfzKf9J38
	 Hm2aNi0TULw13BjDWBzGaaptqcMc+OYFGl7va33gybxuikp+KyDZ4jrMc/IggV1s+f
	 yD0p41qOltNrYwvjIzKagR/kjXohCq3coqNPE3gSC0bRFIgaH5JavD6TAxqotfAFt0
	 58d2TXD8Q+NujR/r2ytj94ujIqsGUlNETZ9evnAylKzbUQdAaEOS7E85anxhSqQhwV
	 ElO9R7rfO38pAhN+nLyiyAxDbO2a+85AtxMKsCbDMlMoWGGg1p4jOcfxq7hBx6ovud
	 S7eV4rj4rblAQ==
Date: Tue, 6 Feb 2024 17:07:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 3/3] automation/eclair: add deviation for MISRA
 C:2012 Rule 16.3
In-Reply-To: <5a9ac027852dc661faac65de2caee6a7260c204c.1706259490.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402061707020.1925432@ubuntu-linux-20-04-desktop>
References: <cover.1706259490.git.federico.serafini@bugseng.com> <5a9ac027852dc661faac65de2caee6a7260c204c.1706259490.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Jan 2024, Federico Serafini wrote:
> Update ECLAIR configuration to consider safe switch clauses ending
> with STATIC_ASSERT_UNREACHABLE().
> 
> Update docs/misra/deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


