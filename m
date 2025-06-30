Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E781AED80A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 10:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028961.1402680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWAMf-00042W-GN; Mon, 30 Jun 2025 08:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028961.1402680; Mon, 30 Jun 2025 08:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWAMf-00040g-DS; Mon, 30 Jun 2025 08:59:49 +0000
Received: by outflank-mailman (input) for mailman id 1028961;
 Mon, 30 Jun 2025 08:59:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uWAMe-00040W-5n
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 08:59:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uWAMd-00ADBE-00;
 Mon, 30 Jun 2025 08:59:47 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uWAMc-00CDcY-1Y;
 Mon, 30 Jun 2025 08:59:46 +0000
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
	bh=EOKb6eGI6FM3HEr963iQFcoGEwbAcwyKibpGSREKjgE=; b=tX93RUrviwdR1gTDvGq3Aszw9W
	W56Hp0kpe9uPwIUR0dC1uepeJgmr6qOkQwCMn1xHUFHuFMo2VYc7dNEAJdKVVhb5/pIi1iCdhGZG7
	qY+UkrxDZcewVP6zO5xeOIVCyN+y9PHcW/OZxX1lXzjwsVZvf9o0IT2o0Xy4ZkRBdWYE=;
Date: Mon, 30 Jun 2025 10:59:44 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] scripts/add_maintainers.pl: set double dashes for
 long options
Message-ID: <aGJSAODRuoRXwYtq@l14>
References: <7f66cbd47f45b2cc442c541cd264a208ea1f406c.1751269784.git.dmytro_prokopchuk1@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f66cbd47f45b2cc442c541cd264a208ea1f406c.1751269784.git.dmytro_prokopchuk1@epam.com>

On Mon, Jun 30, 2025 at 08:01:46AM +0000, Dmytro Prokopchuk1 wrote:
> Current script shows message:
>  Don't forget to add the subject and message to ...
>  Then perform:
>  git send-email -to xen-devel@lists.xenproject.org ...
> which has wrong option '-to'.
> It may be confused for user.

For some reason, the git send-email still works as expected with the use
of single dash instead of two even if this isn't documented.

> 
> Set double dashes for longer options to avoid that.
> 

I would add:
Fixes: e1f912cbf717 ("scripts/add_maintainers.pl: New script")

> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

