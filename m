Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E80405A85
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183360.331489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOMbh-0005U8-Gf; Thu, 09 Sep 2021 16:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183360.331489; Thu, 09 Sep 2021 16:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOMbh-0005RU-Cs; Thu, 09 Sep 2021 16:08:57 +0000
Received: by outflank-mailman (input) for mailman id 183360;
 Thu, 09 Sep 2021 16:08:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOMbf-0005RO-NT
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:08:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOMbf-0001ee-Kb
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:08:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOMbf-0006kJ-JK
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:08:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mOMbc-0006oV-9z; Thu, 09 Sep 2021 17:08:52 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=E76sYHJv5LOBDBqfWN5W/QfSk1uHSHyU+LukfShWK4E=; b=g9MddJbm8Q5F6hfwL2V4rw0aDv
	E0Wz2HmNIiFJtknytnBO8DIBGGlfoX1VNj/m8ng5k/F/DV/tumugC78URUYo2WYB8LGEQbr7BR7+3
	Uz7eR2eiraaiYTQLYNZS7LBNV+9GJerDKw3bt+H6M1a47DT2HrVeaQrlbj6iSq+YeIoM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24890.12692.44064.995392@mariner.uk.xensource.com>
Date: Thu, 9 Sep 2021 17:08:52 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper  <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub
In-Reply-To: <7e635caa-0956-332c-bd17-0bec61e58ef0@suse.com>
References: <20210909124924.1698-1-jgross@suse.com>
	<20210909124924.1698-2-jgross@suse.com>
	<24890.2778.780247.724651@mariner.uk.xensource.com>
	<7e635caa-0956-332c-bd17-0bec61e58ef0@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub"):
> On 09.09.21 15:23, Ian Jackson wrote:
> > How about "pv-grub-maybe" ?  Or something.
> 
> What about "pv-grub-if-enabled"?

Fine by me.

> And could that be done when committing, or should I send another round?

Please do send another round (sorry).

Thanks,
Ian.

