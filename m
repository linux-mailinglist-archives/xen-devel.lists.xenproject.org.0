Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015AABC009
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989875.1373844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0ys-0003Um-8i; Mon, 19 May 2025 13:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989875.1373844; Mon, 19 May 2025 13:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0ys-0003St-68; Mon, 19 May 2025 13:56:38 +0000
Received: by outflank-mailman (input) for mailman id 989875;
 Mon, 19 May 2025 13:56:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uH0yq-0003Si-L6
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:56:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uH0yq-001O6b-1o;
 Mon, 19 May 2025 13:56:36 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uH0yq-00FEOP-03;
 Mon, 19 May 2025 13:56:36 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=6MS10jZqPYauidjKWX6F3N1C3atb24uqr7IIOmdt+1A=; b=zUdPuczIhKnT1JYM9aUVkoSMF8
	7Qp0K72yu2ZQodqvUZUvQXUfq3h2yw6hsMzGpHGmCEN+/ZUZWp661Zy4cGvzxTtEW9RVdGqhGlJDa
	Xvy/doCvkXefWGX073Xy+04RlF/f2zJiMY+koI0yvAMWL3HkkCsNVDYAjT4ntPdB3jHY=;
Date: Mon, 19 May 2025 15:56:33 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/4] build: don't require full tools build for
 building stubdoms
Message-ID: <aCs4kRxgjNKu-lv4@l14>
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429110636.30518-5-jgross@suse.com>

On Tue, Apr 29, 2025 at 01:06:34PM +0200, Juergen Gross wrote:
> With the drop of qemu-traditional "make stubdom" no longer requires
> "make tools" to have finished.
> 
> It is enough to add "install-tools-public-headers" as a prereq of
> "install-stubdom".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

