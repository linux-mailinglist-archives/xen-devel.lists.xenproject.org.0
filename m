Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C002AC00195
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148823.1480659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrHA-00022m-Q7; Thu, 23 Oct 2025 09:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148823.1480659; Thu, 23 Oct 2025 09:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrHA-00020T-NL; Thu, 23 Oct 2025 09:06:28 +0000
Received: by outflank-mailman (input) for mailman id 1148823;
 Thu, 23 Oct 2025 09:06:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBrH9-00020M-SE
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:06:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBrH9-00FoE2-0h;
 Thu, 23 Oct 2025 09:06:27 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBrH9-00B6fA-02;
 Thu, 23 Oct 2025 09:06:27 +0000
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
	bh=YnaJVaO1Spuw4SlTTtKsrj6tfNIiVezdEjkaRegrEFs=; b=P1tw0mPt0PpGBsYCzGdBHG+uM5
	wojvWS4ANgvygATCtk/C3GgvNOlWmFTksQ6207wQziZNzr2xQ30q42GxfPPT62czGAZT7i4s7EuXX
	gtYdlIzlSZOJoIdoMQRAXPmLcvu5qQbTMXkXoN6Dn3vbHi8Q52ESlo9e6eYgtG8d3VWk=;
Date: Thu, 23 Oct 2025 11:06:25 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v3 for-4.21 1/1] tools/libs/light: fix BAR memory address
 truncation
Message-ID: <aPnwEfKCFPe6ia9H@l14>
References: <20251023023128.11589-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023023128.11589-1-Jiqian.Chen@amd.com>

On Thu, Oct 23, 2025 at 10:31:28AM +0800, Jiqian Chen wrote:
> 64-bit BAR memory address is truncated when removing a passthrough
> pci device from guest since it uses "unsigned int".
> 
> So, change to use 64-bit type to fix this problem.
> 
> Fixes: b0a1af61678b ("libxenlight: implement pci passthrough")
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

