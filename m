Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC074ABBFF9
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989868.1373834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0xP-0002yn-0k; Mon, 19 May 2025 13:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989868.1373834; Mon, 19 May 2025 13:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0xO-0002w5-TZ; Mon, 19 May 2025 13:55:06 +0000
Received: by outflank-mailman (input) for mailman id 989868;
 Mon, 19 May 2025 13:55:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uH0xN-0002vz-3T
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:55:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uH0xL-001O5D-36;
 Mon, 19 May 2025 13:55:03 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uH0xL-00FCsN-15;
 Mon, 19 May 2025 13:55:03 +0000
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
	bh=YXlEcEhzXUTW5ZgKvke4UWEYUlomDtLto/jSxmmNKYs=; b=p2GspbfAniWqoomm0zCqUVFOws
	cdaWRxJvdC1gPJ2zjxuspWQ3wlTK/2HXUXxc/f3ztn92yxI7I1uTMOprAntmt8t4Id7ExJ1NRf+1A
	4tl9igQd9luhN+ROMTodoS5jWX19UakO8rAgvMFaOclIVb/+EKf6+PEtLf4q+a5J9C9Y=;
Date: Mon, 19 May 2025 15:55:00 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v3 3/4] tools: remove qemu-traditional
Message-ID: <aCs4NEm3lkd2TS9O@l14>
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429110636.30518-4-jgross@suse.com>

On Tue, Apr 29, 2025 at 01:06:33PM +0200, Juergen Gross wrote:
> Remove qemu traditional from the tree.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # CHANGELOG.md

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

