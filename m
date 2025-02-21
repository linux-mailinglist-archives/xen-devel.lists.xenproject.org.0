Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59137A3EA0F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 02:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894217.1302992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlHsy-0007Qm-0c; Fri, 21 Feb 2025 01:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894217.1302992; Fri, 21 Feb 2025 01:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlHsx-0007P4-TU; Fri, 21 Feb 2025 01:31:23 +0000
Received: by outflank-mailman (input) for mailman id 894217;
 Fri, 21 Feb 2025 01:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rf0=VM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tlHsw-0007Ot-Iw
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 01:31:22 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d8479f5-eff3-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 02:31:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E2045683A3;
 Fri, 21 Feb 2025 01:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937E6C4CEE2;
 Fri, 21 Feb 2025 01:31:18 +0000 (UTC)
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
X-Inumbo-ID: 8d8479f5-eff3-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740101479;
	bh=TFuT4EwURcnEVNTZjv31TNPmQ8pbCssrUVGvsoG9RMg=;
	h=Date:From:To:cc:Subject:From;
	b=SwpHRlfA7bUtkLjmQp+NLvM/ElvMe49QJnRVe0DowQz1QijKdLkG/++6NPmGCz3mV
	 zOHogB8ZHF3BxJbx2fsWg5jj+gHu0tk9JfqGeiEdyOc3Mx5IQBz7sdH7zVH0C3sIws
	 +0Ls++/MC+L1wNlyvStMq3fqaK3CuXBwSVoB05bNz/y5et/f5Yfpeoe2Ur8Z4K97xz
	 ZuBoxWUrIte9ORvfzfssYfxmP382nXXoo0mIguvXAbgx+jG2/G4fDWWed1S+2S2fG8
	 vvev0MyETfGbljzl5O0q9AFbJchbop+vEQXlACVl5xJCjMhHJ4lpt76I49j1js0M7q
	 qhLee6PyOd9cg==
Date: Thu, 20 Feb 2025 17:31:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
    xen-announce@lists.xenproject.org
cc: sstabellini@kernel.org, committers@xenproject.org
Subject: [ANNOUNCE] Save the Date! Xen Summit 2025 Hosted by AMD in San Jose,
 California
Message-ID: <alpine.DEB.2.22.394.2502201727520.1791669@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I am very happy to announce that AMD will host the upcoming Xen Summit
conference in San Jose, California, Sep 15-17. Save the date and join us
to explore the latest developments, share insights, and connect with the
Xen community! Learn more at the Xen Summit website:
https://xenproject.org/resources/xen-summit/

Cheers,

Stefano

