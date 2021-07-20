Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352AD3CFDC6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 17:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158849.292220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5rsL-0002Tm-Cg; Tue, 20 Jul 2021 15:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158849.292220; Tue, 20 Jul 2021 15:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5rsL-0002Qs-9S; Tue, 20 Jul 2021 15:41:41 +0000
Received: by outflank-mailman (input) for mailman id 158849;
 Tue, 20 Jul 2021 15:41:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=su81=MM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m5rsJ-0002Qg-PF
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 15:41:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e68aab4-7972-412c-a41f-4513ccb1b09c;
 Tue, 20 Jul 2021 15:41:39 +0000 (UTC)
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
X-Inumbo-ID: 3e68aab4-7972-412c-a41f-4513ccb1b09c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626795698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XRT8r4zIYDP4Cdz86GDAqjwFGkVAuVQ4Jckz7oNbJ+c=;
  b=WI9wFHO8/HZegzSfrsPTsmhQdAi4bQV6ohIXN67sRM0RJFrumbnwlhIO
   9dIhzzFKvD0EWq7eNjCqzB3uRvVOTGzS+lBUzwU40kZ2SLmXGPYLp/0bB
   wHu9Pa8LW1EL+pjr/2VkLbNIYkXhWJOoj6czP6H5N8/wu1sxvmgfT4PM5
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5TU6b+HNnVI51NCtTXPjrARvpAUD3Fv7dwsxjSLqC7lLhqwUeXpWaZHrwQ+NrBkQZtW6q6b+6E
 NmsjZ3RMVj2M5KL+SsMRsDQdY7H4h0wHQptM8IAjqFe68JWGS4mZ349D6Sksz3PddcAf9EyQQ5
 faBvEyabSx9nu7bG73BLqEjt54QC3JcQHCsPZyFkWwosYjy43YDscvI9J/ylx97ps6gzNOzN1Q
 sHmj3YC+7qK2+inzQDvtH8SSeg4yYJmU06ikpILjlBuZKwh7VcQ/6pXxaga/uoyRHQ829pzkk6
 Xv4LxmFCcTRjfnd16qCP03N8
X-SBRS: 5.1
X-MesageID: 48365403
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DitpcKh/0z+/2xqd/h7hmZxjWnBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.84,255,1620705600"; 
   d="scan'208";a="48365403"
Date: Tue, 20 Jul 2021 16:41:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: collect log files in subdirectories
Message-ID: <YPbuo/JfpPNGjq2p@perard>
References: <20210708065435.24515-1-olaf@aepfle.de>
 <e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
 <20210714093104.52f25e70.olaf@aepfle.de> <YPGXm9F3OHqLk/ml@perard>
 <20210716164131.56a7b539.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210716164131.56a7b539.olaf@aepfle.de>

On Fri, Jul 16, 2021 at 04:41:57PM +0200, Olaf Hering wrote:
> Am Fri, 16 Jul 2021 15:28:43 +0100
> schrieb Anthony PERARD <anthony.perard@citrix.com>:
> 
> > Actually, it's possible to delete the repo.
> > Navigate to the repo you want to delete ( https://gitlab.com/xen-project/people/olafhering )
> > then in the sidebar/menu (hopefully on the left) there is "Setting".
> 
> This entry exists elsewhere, but not in this repo.
> I guess a project admin has to wipe the repo.

BTW, I did that 4 days ago, but an MTA never managed to send the
email and told me only now ...

Anyway Olaf, I've deleted the repo, feel free to try again, or let me
now if you want me to set things up.

Cheers,

-- 
Anthony PERARD

