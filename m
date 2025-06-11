Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3BAD5822
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 16:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011794.1390319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPM9i-0003tl-1o; Wed, 11 Jun 2025 14:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011794.1390319; Wed, 11 Jun 2025 14:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPM9h-0003rM-UK; Wed, 11 Jun 2025 14:10:17 +0000
Received: by outflank-mailman (input) for mailman id 1011794;
 Wed, 11 Jun 2025 14:10:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uPM9g-0003rD-2R
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 14:10:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uPM9f-00DoSS-0U;
 Wed, 11 Jun 2025 14:10:15 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uPM9e-002i7t-2l;
 Wed, 11 Jun 2025 14:10:15 +0000
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
	bh=aRVxHnIoORT4t1BZRJh7GplGMdL05IknANQPk/Da1YI=; b=kTUFQBn/3E03zQL+XEwvKmb/aG
	47/eiiVYUNE0MzX9M9oxuF5xUqJst0SyjKauQMwJUThQ6DddZV0kRecUG0QBoV9bvyRHabWJ6sJVc
	yq+zoMQc/PgeSEFkVUHRODudCjRqWugO9XPp3cPPs79qUjBXsvmePAfFeNsMWVbL1ogQ=;
Date: Wed, 11 Jun 2025 16:10:12 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/2] tools/arm: exclude iomem from domU extended
 regions
Message-ID: <aEmORMJoGbJGKZqP@l14>
References: <20250609183438.178214-1-stewart.hildebrand@amd.com>
 <20250609183438.178214-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609183438.178214-3-stewart.hildebrand@amd.com>

On Mon, Jun 09, 2025 at 02:34:33PM -0400, Stewart Hildebrand wrote:
> When a device is passed through to a xl domU, the iomem ranges may
> overlap with the extended regions. Remove iomem from extended regions.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

