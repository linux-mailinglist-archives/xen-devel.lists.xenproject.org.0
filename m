Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D8A9B16E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 16:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966445.1356649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xrm-0002FR-Ke; Thu, 24 Apr 2025 14:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966445.1356649; Thu, 24 Apr 2025 14:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xrm-0002Cn-HK; Thu, 24 Apr 2025 14:47:54 +0000
Received: by outflank-mailman (input) for mailman id 966445;
 Thu, 24 Apr 2025 14:47:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u7xrl-0002Ch-9m
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 14:47:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7xrl-001hTA-0F;
 Thu, 24 Apr 2025 14:47:53 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7xrk-00HVPz-2f;
 Thu, 24 Apr 2025 14:47:53 +0000
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
	bh=Ddh6wJKe/o4cCy1ry10f1/+Xm0rK7AxGtWGhKrJEEj4=; b=w6AP2S/+LyAWMxDGLq9K/Kz3ph
	PKunV/d8ciNXX//80rqj39ozOjjC7UR/7oXCsmRPQlimYGCdEtF8JE3GegzC6IqxXvxRUxKT8FfAi
	BHUPzEQYC+5IHwUpWlEJ4tCE4Qf/VeMCUFa4ViDmD2ziKKpQvQ9JIm4+dO66unu04/+Y=;
Date: Thu, 24 Apr 2025 16:47:51 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v2 5/6] stubdom: remove ancient stubdom-dm script
Message-ID: <aApPF9A-6ZjM__st@l14>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408123526.14613-6-jgross@suse.com>

On Tue, Apr 08, 2025 at 02:35:23PM +0200, Juergen Gross wrote:
> The stubdom-dm script is still using "xm" instead of "xl", so it is
> probably unused since more than 10 years now.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

