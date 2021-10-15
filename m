Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA042F525
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210700.367667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO6X-0000ne-5Q; Fri, 15 Oct 2021 14:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210700.367667; Fri, 15 Oct 2021 14:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO6X-0000lH-1x; Fri, 15 Oct 2021 14:22:37 +0000
Received: by outflank-mailman (input) for mailman id 210700;
 Fri, 15 Oct 2021 14:22:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO6W-0000lB-Hv
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:22:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO6W-00062z-Eh
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:22:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO6W-0002Ao-DY
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:22:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbO6T-0005xv-27; Fri, 15 Oct 2021 15:22:33 +0100
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
	bh=CWNgjw5Kka2HzOU9Isjhws3LLFj6Br2+Ld/25dSW/7U=; b=RjLqLLKEIpWnNc666ULAucPZ/k
	fOmLBagOt7BrXchNF0YaU354l6iClI4a8V7RTxI53kUlE/8sIGs7xv78jYlVFVo0EvwepHVbYP/eY
	FIRg2wKcYgG4nadKGIBoqKAdSajzG+SssRcxNcdrnAaX2mLcQ9mPp40rswT6JiONC0mw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.36520.665618.208731@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 15:22:32 +0100
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org,
    iwj@xenproject.org,
    Michal Orzel <michal.orzel@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 4/5] tools/libxl_arm: Modify libxl__prepare_dtb...
In-Reply-To: <a016279b31ad0b0801bb8cd36c0b84c95db0bd09.1634305870.git.bertrand.marquis@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
	<a016279b31ad0b0801bb8cd36c0b84c95db0bd09.1634305870.git.bertrand.marquis@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("[PATCH v7 4/5] tools/libxl_arm: Modify libxl__prepare_dtb..."):
> From: Michal Orzel <michal.orzel@arm.com>
> 
> ... to take a second argument of type libxl_domain_config*
> rather than libxl_domain_build_info*.
> 
> This change will be needed to get access from
> libxl__prepare_dtb to "num_pcidevs" field of
> libxl_domain_config to check whether to create
> a vPCI DT node or not.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Suggested-by: Ian Jackson <iwj@xenproject.org>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

