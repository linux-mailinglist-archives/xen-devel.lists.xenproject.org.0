Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF1899294
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 02:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701053.1095119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXOy-0005fv-RC; Fri, 05 Apr 2024 00:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701053.1095119; Fri, 05 Apr 2024 00:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXOy-0005dp-Of; Fri, 05 Apr 2024 00:25:52 +0000
Received: by outflank-mailman (input) for mailman id 701053;
 Fri, 05 Apr 2024 00:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsXOx-0005dh-SN
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 00:25:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ddf933c-f2e3-11ee-afe5-a90da7624cb6;
 Fri, 05 Apr 2024 02:25:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72D9461711;
 Fri,  5 Apr 2024 00:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023B4C433F1;
 Fri,  5 Apr 2024 00:25:47 +0000 (UTC)
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
X-Inumbo-ID: 0ddf933c-f2e3-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712276749;
	bh=q/HXQKLVN0ZS7V7G6GRbRG4JbadWW8TteYXBjpxmWdg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O0z80hziPyxT0JLvv/3oMz2SGANh8iA9pHilyPsD7qk1H9vyF7JSTVdZ2zVVbvGHt
	 bZRlLs5mlTzzyfHZF+HTDDYsHMUcHNlFmJv8oa1FuqzhcRAH9dElyZZe9+POUri+Tu
	 sVVlMgRoQNxrPczmTMsW7zW/7/JyPef3JrhottrAP696s8EzjhO84qVEtbdg0q1dsP
	 TDCweNAQDvonSCVAyvsHhBZbaQllGtfGCOj+Wmq7XBaXbrmBiZwZ70mKjXc9rHvyXr
	 r/KU7Mo1FeTvG4pgEG0SEtY46ye/M3t6d2U3RnWMdjROpAnOMM7hBI9vFyaPVpRrll
	 eMgCXBhWjj6lA==
Date: Thu, 4 Apr 2024 17:25:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v3 1/2] MISRA C:2012 Rule 17.1 states: The features
 of `<stdarg.h>' shall not be used
In-Reply-To: <b55dae384907d60d4524ab17a8135859ec0f5270.1711621080.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404041725240.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1711621080.git.simone.ballarin@bugseng.com> <b55dae384907d60d4524ab17a8135859ec0f5270.1711621080.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Mar 2024, Simone Ballarin wrote:
> The Xen community wants to avoid using variadic functions except for
> specific circumstances where it feels appropriate by strict code review.
> 
> Add deviation for printf()-like functions.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


