Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789B17D0398
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 23:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619580.964902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtaOp-0001Uf-Jr; Thu, 19 Oct 2023 21:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619580.964902; Thu, 19 Oct 2023 21:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtaOp-0001Sa-H4; Thu, 19 Oct 2023 21:17:47 +0000
Received: by outflank-mailman (input) for mailman id 619580;
 Thu, 19 Oct 2023 21:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtaOo-0000vd-1D
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 21:17:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f253a5c5-6ec4-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 23:17:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EFECDB82D40;
 Thu, 19 Oct 2023 21:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD24FC433C8;
 Thu, 19 Oct 2023 21:17:42 +0000 (UTC)
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
X-Inumbo-ID: f253a5c5-6ec4-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697750264;
	bh=s0o99sdDgvCQP1IDir9uPc/Yq0i7csubuJMrRIcNmcc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NrkYQi8napaHlDEihXG8HECAOcLm6Yl8WwLY24H4q3cHazbuRduckbT0FZoRrgZI1
	 hWrFmAhg+yIyKB6P+CfeE7Gyx0ckxL3TwW9yNIpcxRK0g4LedySI5ivUsMTYGbax2h
	 QAFbbTWJ4tzA8xrk4lz0hLLTG0SoUQgf6DH6cT/XX789wlIdQTl2+NiG3/3mVze35d
	 F/JJ6d9H/K4OCd8dMYsMbyt1jXZvP7yvO01592MXEQg472cZt1JSSs+cTxD0LRHnap
	 qENg00wgLCtUUhS6Yyj7QDaFpZhdM+tDhW3cXeYHzipouIhpMYc1hGrzt6j9uR7uZS
	 XpBjOBtLUR0MA==
Date: Thu, 19 Oct 2023 14:17:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3 8/8] docs/misra: exclude three more
 files
In-Reply-To: <0eae39cdc68e48932936e2c510a867ebe1f7c298.1697722648.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310191417300.2099202@ubuntu-linux-20-04-desktop>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com> <0eae39cdc68e48932936e2c510a867ebe1f7c298.1697722648.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Nicola Vetrini wrote:
> These files should not conform to MISRA guidelines at the moment,
> therefore they are added to the exclusion list.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

