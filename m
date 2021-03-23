Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD52345FB2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 14:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100688.191988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOh84-0006kA-EM; Tue, 23 Mar 2021 13:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100688.191988; Tue, 23 Mar 2021 13:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOh84-0006jj-B9; Tue, 23 Mar 2021 13:31:28 +0000
Received: by outflank-mailman (input) for mailman id 100688;
 Tue, 23 Mar 2021 13:31:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOh83-0006jc-9M
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:31:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOh83-00079J-8Z
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:31:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOh83-0001S3-79
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:31:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOh80-00026f-1r; Tue, 23 Mar 2021 13:31:24 +0000
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
	bh=NX8sINXuOHROK+sUS3FJjWlQlzn29XUVu+eJEvGTJ/Q=; b=y9DsEQaOoHNXQqgIpfZmv0jEgT
	gT/o8lEUOa1bkeVaSDCS4cBJUXpC+ZNTQWtkRghHu39Thdo+VoBxmVeyfyBysrTxojGMdZ4TmzyeI
	3Iw6AnGgMhujhy70S62K7OYHO2p1HgurvpsF62kpiuObexNgEkinqI1fh4ZkWX7BQgGY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24665.60843.867312.686295@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 13:31:23 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 1/4][4.15?] VT-d: correct off-by-1 in number-of-IOMMUs check
In-Reply-To: <68084b4f-bcd2-59dd-bea7-781b8aa75ef7@suse.com>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
	<68084b4f-bcd2-59dd-bea7-781b8aa75ef7@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 1/4][4.15?] VT-d: correct off-by-1 in number-of-IOMMUs check"):
> Otherwise, if we really run on a system with this many IOMMUs,
> entering/leaving S3 would overrun iommu_state[].

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

