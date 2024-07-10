Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F352592DA55
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 22:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757066.1165803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRe9E-00024O-BJ; Wed, 10 Jul 2024 20:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757066.1165803; Wed, 10 Jul 2024 20:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRe9E-00021g-8C; Wed, 10 Jul 2024 20:42:44 +0000
Received: by outflank-mailman (input) for mailman id 757066;
 Wed, 10 Jul 2024 20:42:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4IA=OK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sRe9C-00021a-Do
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 20:42:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3140e0c-3efc-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 22:42:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8608F61B7F;
 Wed, 10 Jul 2024 20:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E28AC32781;
 Wed, 10 Jul 2024 20:42:38 +0000 (UTC)
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
X-Inumbo-ID: f3140e0c-3efc-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720644159;
	bh=MjSbbbHRCUsNfUWPTBBjGVSKYc/kETWAsAYExl+jHxs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J0l+f4kYBQfKeIgfnSe2X+39G+tepYDYPDefJhI37/7xBSJ/nHRt3JcC8SS05uvpA
	 AaNZifdJQtT/3ZVrPE7/rGS8T36u2HTMMvMrNKpoVYzo6WlktNiVe60oI8PeZfGACL
	 w6RvcFqblpwOVABO/A32k7LlqjRXhEhob9AXyPupbqCwefse+jwPDK/rYE5EPM0fRZ
	 k3KdB2VCOT6oXB+LaGFJD2e3YVrVsnZ7FMDl3Xz/orvaS0PeyNpXII5JEsq9ZMBRuT
	 6QYiuBJ+pQvLtKVQfWTk/nkHXw2z81qHjzAFTtLnXNMvD/UW1XQSNs033SWl05RoWN
	 JjiQ1XHOJPWLw==
Date: Wed, 10 Jul 2024 13:42:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20 v2] automation: Use a different ImageBuilder
 repository URL
In-Reply-To: <98fecf96-ab8e-4514-a3e9-a1f0b15519c1@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2407101342260.3635@ubuntu-linux-20-04-desktop>
References: <20240710093751.25154-1-michal.orzel@amd.com> <98fecf96-ab8e-4514-a3e9-a1f0b15519c1@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jul 2024, Andrew Cooper wrote:
> On 10/07/2024 10:37 am, Michal Orzel wrote:
> > Switch to using https://gitlab.com/xen-project/imagebuilder.git which
> > should be considered official ImageBuilder repo.
> >
> > Take the opportunity to truncate the git history when cloning using
> > --depth 1.
> >
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Given the current overhaul I'm (still) doing for CI in 4.19, I'd suggest
> taking this.
> 
> It will mean an 8-month improvement in switching over fully.

Agreed

