Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42AD25D70E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 13:16:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9hr-00073S-Cq; Fri, 04 Sep 2020 11:16:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/IBy=CN=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kE9hp-00073N-G2
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 11:16:33 +0000
X-Inumbo-ID: d6545135-dac6-45fd-bbf3-ce9292d83781
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6545135-dac6-45fd-bbf3-ce9292d83781;
 Fri, 04 Sep 2020 11:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=1a9MH3rGTVlt/FnCpoJV5IL6GDmUr/5j+DFHYhpOrhA=; b=Shrd0uzCf4inpPT9gQ2vYyMlTM
 CHIqxFz/H5/5W9N5Fh4os5o+BYTKVs4EzxFipj4QibNkBr+1jg6G5GIZOYpios6fr0C1XmRHrqjjt
 ECgbNV6nV6CANQ61+5F+SGuXhkWq5E2sDNQFBaIdX03w6rulbk1xgjWLk9iSdLNFJJ0k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kE9ho-0002bZ-Do
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 11:16:32 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kE9ho-00006h-Cj
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 11:16:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kE9hk-0007lT-VN; Fri, 04 Sep 2020 12:16:29 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24402.8716.660590.87840@mariner.uk.xensource.com>
Date: Fri, 4 Sep 2020 12:16:28 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] fix build with make 3.81
In-Reply-To: <20200901115816.16672-1-jgross@suse.com>
References: <20200901115816.16672-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross writes ("[PATCH] fix build with make 3.81"):
> make 3.81 doesn't support multiline variables defined with
> 
>  define var =
>  ...
>  endef

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

And commited, thanks.

Ian.

