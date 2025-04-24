Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CBA9B189
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 16:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966455.1356658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xuN-0003jv-0c; Thu, 24 Apr 2025 14:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966455.1356658; Thu, 24 Apr 2025 14:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xuM-0003hr-UC; Thu, 24 Apr 2025 14:50:34 +0000
Received: by outflank-mailman (input) for mailman id 966455;
 Thu, 24 Apr 2025 14:50:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u7xuL-0003hA-9z
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 14:50:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7xuK-001hZa-2d;
 Thu, 24 Apr 2025 14:50:32 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7xuK-0001S3-1M;
 Thu, 24 Apr 2025 14:50:32 +0000
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
	bh=/2leqnixMz8bcci6giaiurg5UqIOpwbp0yvzE/Ox9X0=; b=48CqHOamPaE+1Nm+XBgEM4/m9H
	yNwT4+4WNO5/CblEiW4G26iwEy0fEBIWJ9x0kWL5YKKQxfDjXQTyOFGK6RvzLqF0iieMF7vDtF3L8
	9imgT3FDmFa62bxeFKGaxQvlZQfHptUz0aoMoe8f75uiAQPHDPZ6VSox/DPayKdxdJQU=;
Date: Thu, 24 Apr 2025 16:50:30 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 6/6] build: don't require full tools build for
 building stubdoms
Message-ID: <aApPtoqyNOjj7A-1@l14>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408123526.14613-7-jgross@suse.com>

On Tue, Apr 08, 2025 at 02:35:24PM +0200, Juergen Gross wrote:
> With the drop of qemu-traditional "make stubdom" no longer requires
> "make tools" to have finished.
> 
> It is enough to add "install-tools-public-headers" as a prereq of
> "install-stubdom".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Once the rest of the patch series
is committed: Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

