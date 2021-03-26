Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF6234A94F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 15:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101852.195081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnAw-0004Cj-Hc; Fri, 26 Mar 2021 14:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101852.195081; Fri, 26 Mar 2021 14:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnAw-0004CK-EJ; Fri, 26 Mar 2021 14:10:58 +0000
Received: by outflank-mailman (input) for mailman id 101852;
 Fri, 26 Mar 2021 14:10:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnAu-0004CF-8w
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:10:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnAt-0008NT-QY
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:10:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnAt-0002cE-PO
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:10:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPnAq-0002mQ-9a; Fri, 26 Mar 2021 14:10:52 +0000
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
	bh=1R3ySF5CbH94c9fx9B2ycerhqIEhh+lWWSAV80xKuts=; b=NBz4z4Lc2Uf4Uhbza+c3fKmS1a
	ftI5mPbD+RS83XcUacgGo1dnsrPkJUQre16sv7q4lFbHH5+WzhyWAOAq/hJxmzZ8IkDYFMH+WGBlg
	pG8cWszo46C12OND/eKgxshc1jgkSKc6ixSVAj/z3WdWus1YhfiFZMSGH/67SkMSXBV0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.60267.962692.954979@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 14:10:51 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] CI: Add zstd/etc libraries to build environments
In-Reply-To: <20210326134558.7751-3-andrew.cooper3@citrix.com>
References: <20210326134558.7751-1-andrew.cooper3@citrix.com>
	<20210326134558.7751-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 2/2] CI: Add zstd/etc libraries to build environments"):
> zstd compression support is new in 4.15, but isn't currently tested anywhere
> in CI.
> 
> bzip2/zlib was missing in some cases, so add those as well.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

