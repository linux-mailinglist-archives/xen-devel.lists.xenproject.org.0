Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05FDB54086
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 04:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121245.1465663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtgm-00027L-Oc; Fri, 12 Sep 2025 02:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121245.1465663; Fri, 12 Sep 2025 02:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtgm-00024n-LU; Fri, 12 Sep 2025 02:39:04 +0000
Received: by outflank-mailman (input) for mailman id 1121245;
 Fri, 12 Sep 2025 02:39:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uwtgl-00024h-61
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 02:39:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwtgk-006Gwm-0w;
 Fri, 12 Sep 2025 02:39:02 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwtgj-0054nR-2m;
 Fri, 12 Sep 2025 02:39:02 +0000
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
	:Subject:Cc:To:Date:From; bh=3OWwJLVIUalsdUjtKNKCYLLkIz6YThMLa6KQ83aeI2c=; b=
	uK8InW5N9tFpyWHhrbir0yrkZVaRk8Vh9Cs7MT0kfcyeQG0iFSh/qCgpe7ZWQMoIppzkxkI4aeIuZ
	rbrl14wppeg/EGtwhd41K3ZDcuSrrSbQCVd6b0/uK3rEobga0Eds9IDMJFt5AnAIC+luU1r7YXPOk
	zdjYryfZvlwBBR1JU=;
From: dmukhin@xen.org
Date: Thu, 11 Sep 2025 19:39:00 -0700
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
	Victor Lira <victorm.lira@amd.com>, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v3 3.5/5] CI: Make qemu-smoke-x86-64-gcc-efi compatible
 with Debian Trixie
Message-ID: <aMOHxLQd7y01e9FY@kraken>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
 <20250912011534.1889763-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912011534.1889763-1-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 02:15:34AM +0100, Andrew Cooper wrote:
> The OVMF package in Debian Trixie has _4M suffixes on the files.  Have
> scripts/include/xtf-x86-64-efi check for this before falling back to no
> suffix.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

