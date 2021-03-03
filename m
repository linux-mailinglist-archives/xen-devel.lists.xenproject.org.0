Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A232B652
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92789.174895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHO7a-0008Ri-QF; Wed, 03 Mar 2021 09:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92789.174895; Wed, 03 Mar 2021 09:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHO7a-0008RJ-NF; Wed, 03 Mar 2021 09:48:46 +0000
Received: by outflank-mailman (input) for mailman id 92789;
 Wed, 03 Mar 2021 09:48:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHO7Y-0008RB-Tp
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:48:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHO7Y-0004uP-RX
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:48:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHO7Y-0004HR-Pz
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:48:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHO7V-0001i5-Gy; Wed, 03 Mar 2021 09:48:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=H2bZ7OlHlMOOf01rU4s4AbmOgMFAlrZyGw4FUyvdKgM=; b=grLLib3dt1jQ5HVd30EnYTm+pl
	jJksngJX8ol6YEqyEpD3EVvU6uboTZ/Xj3y78mFc/raOr4hmUK277rcXq0LhOuIIy7Hv3973UUb78
	bZ1WS1qvy2kou6Cyu3Hfp9CJEDmMmP3E7HXFkR+4Q17QQbBSnxpniz7EcWAZOxoQLgek=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.23417.324037.570116@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 09:48:41 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Doug Goldstein <cardoe@cardoe.com>,
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 for-4.15 2/2] automation: enable rombios build on Alpine
In-Reply-To: <20210303082514.8859-3-roger.pau@citrix.com>
References: <20210303082514.8859-1-roger.pau@citrix.com>
	<20210303082514.8859-3-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH v2 for-4.15 2/2] automation: enable rombios build on Alpine"):
> It's now safe to enable the build of rombios on Alpine systems, as
> hvmloader already builds fine there.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

