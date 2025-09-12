Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F295BB5408A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 04:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121258.1465673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwthu-0003Y8-0L; Fri, 12 Sep 2025 02:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121258.1465673; Fri, 12 Sep 2025 02:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtht-0003WX-U0; Fri, 12 Sep 2025 02:40:13 +0000
Received: by outflank-mailman (input) for mailman id 1121258;
 Fri, 12 Sep 2025 02:40:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uwths-0003WG-07
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 02:40:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwthr-006Gxi-1J;
 Fri, 12 Sep 2025 02:40:11 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwthr-0054vT-1D;
 Fri, 12 Sep 2025 02:40:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=B3Ua5zvzVHSBNvwnmIN1U4E9wHiXXsPFNfjwrPHrMFo=; b=
	DAwE/sh0D8TjB0M0tOnLonhr0rex3ncY5hshKvyMUe0/6Xb9WP9128IxQY2Kqio37OLN+OS0EeLPz
	pPXQqUncIaSb/6C2SZk7MXN3Vc9xi1Qf+eum9ZVyqSdJOiNQVc5ICEJbO9RDOkztseKxoaagcACHP
	JOleR9HIcpBJPA2cU=;
From: dmukhin@xen.org
Date: Thu, 11 Sep 2025 19:40:10 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v3 3/5] CI: Merge categories in
 debian/12-x86_64.dockerfile
Message-ID: <aMOIChMN/H6RG0gu@kraken>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
 <20250911231216.1886818-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911231216.1886818-4-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 12:12:14AM +0100, Andrew Cooper wrote:
> cpio needs to be in Tools (general) now that it's used by the general build
> script.  Merge the rest of the test phase jobs into one group, to avoid being
> overly fine-grain.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

