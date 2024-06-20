Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A53F90FAD7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 03:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744090.1151103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK6Un-0005dh-CZ; Thu, 20 Jun 2024 01:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744090.1151103; Thu, 20 Jun 2024 01:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK6Un-0005cC-9n; Thu, 20 Jun 2024 01:21:49 +0000
Received: by outflank-mailman (input) for mailman id 744090;
 Thu, 20 Jun 2024 01:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sK6Ul-0005bM-Vf
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 01:21:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a9fb6f-2ea3-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 03:21:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DFF361F6C;
 Thu, 20 Jun 2024 01:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF30C2BBFC;
 Thu, 20 Jun 2024 01:21:43 +0000 (UTC)
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
X-Inumbo-ID: 75a9fb6f-2ea3-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718846505;
	bh=kE4el7/ZjYG+ytPzfW9NHzPa61t4FYQ0j7jmDYRgeW4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J0Q2Na73Ej3VEPX/8RaH1gl9KbJRdJ9wawnD5KgWIIEVtGiZDMibHrB5cerjWYArD
	 nN2BWfTmX4qMYNDLqhRsY3ppqwfJJTDfYOTSPr8mpf5ZHfWntEoyoNjGNqYn0qHP+x
	 /KrrzOIAi1ZGBNQf9E+VdJHcuCvManG4Urpmf3xQU8DZ5290oOoFCJ8yPkgn2GsmkC
	 N3owY6dRF0zeFsWZZuCLuDDo3bFDzFJWxAQ7huIGIV57oCPpjA/ZNJIeFLJxOQVDq9
	 IBpN1s37Sii0D0y9H81cl5yS/wsBBD7x5ZXztIHDb7v/oqtOUxnyn+qgo7mByXQB03
	 G42hu6hXW/2QA==
Date: Wed, 19 Jun 2024 18:21:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v3] automation/eclair: extend existing deviations of
 MISRA C Rule 16.3
In-Reply-To: <71a69d25e7889ed6e8546b5cd18d423006d69ceb.1718356683.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406191821310.2572888@ubuntu-linux-20-04-desktop>
References: <71a69d25e7889ed6e8546b5cd18d423006d69ceb.1718356683.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Jun 2024, Federico Serafini wrote:
> Update ECLAIR configuration to deviate more cases where an
> unintentional fallthrough cannot happen.
> 
> Add Rule 16.3 to the monitored set and tag it as clean for arm.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

