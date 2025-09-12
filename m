Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C2B54117
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 05:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121311.1465703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwucv-0002l6-EM; Fri, 12 Sep 2025 03:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121311.1465703; Fri, 12 Sep 2025 03:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwucv-0002jH-BX; Fri, 12 Sep 2025 03:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1121311;
 Fri, 12 Sep 2025 03:39:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uwucu-0002jB-KH
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 03:39:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwuct-006IAz-2i;
 Fri, 12 Sep 2025 03:39:07 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwuct-0057xy-1N;
 Fri, 12 Sep 2025 03:39:07 +0000
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
	:Subject:Cc:To:Date:From; bh=sH5Gn8ooqsoB7E2IVqamcCixZIn8HYym1LTUM0WeTCs=; b=
	fj6RJ+3TaXoEXcqkLORtYO8ZHBriCNRlhDoiyFpTz+WcSrDKa6PKcHtmoTw9/5yALrWAyOZD+Vd1R
	WbFOefrTgyP2rjxEppESm5FcKL9LwcwEuf7eNaiZV0pD0nWdItYLGj6JQ4k7W2IUTB+8e5t/7K8GJ
	iNNfM+CtV7vAXpwb4=;
From: dmukhin@xen.org
Date: Thu, 11 Sep 2025 20:39:06 -0700
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
Subject: Re: [PATCH v3 2/5] CI: Update ppc64 to use Debian Trixie
Message-ID: <aMOV2kTcnUDDqsNS@kraken>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
 <20250911231216.1886818-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911231216.1886818-3-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 12:12:13AM +0100, Andrew Cooper wrote:
> Everything works fine with Debian 13.  Provide two new build jobs (for a total
> of 6), and update the test jobs.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

