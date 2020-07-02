Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE84C212EF3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 23:38:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr6u1-0005MU-KG; Thu, 02 Jul 2020 21:37:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVFs=AN=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1jr6u0-0005MP-M0
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 21:37:52 +0000
X-Inumbo-ID: 4652d91a-bcac-11ea-bca7-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4652d91a-bcac-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 21:37:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id E685B12845373;
 Thu,  2 Jul 2020 14:37:47 -0700 (PDT)
Date: Thu, 02 Jul 2020 14:37:47 -0700 (PDT)
Message-Id: <20200702.143747.827041018046186172.davem@davemloft.net>
To: colin.king@canonical.com
Subject: Re: [PATCH][next] xen-netfront: remove redundant assignment to
 variable 'act'
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200702142223.48178-1-colin.king@canonical.com>
References: <20200702142223.48178-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 02 Jul 2020 14:37:48 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, sstabellini@kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kuba@kernel.org, boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Colin King <colin.king@canonical.com>
Date: Thu,  2 Jul 2020 15:22:23 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable act is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

