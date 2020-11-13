Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E82B1D53
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26527.54953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda3F-0000r5-RO; Fri, 13 Nov 2020 14:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26527.54953; Fri, 13 Nov 2020 14:27:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda3F-0000qg-OB; Fri, 13 Nov 2020 14:27:45 +0000
Received: by outflank-mailman (input) for mailman id 26527;
 Fri, 13 Nov 2020 14:27:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kda3E-0000qW-3L
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:27:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb9543bd-ea17-4907-a2a2-5cf5329ff015;
 Fri, 13 Nov 2020 14:27:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79C8CABD9;
 Fri, 13 Nov 2020 14:27:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kda3E-0000qW-3L
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:27:44 +0000
X-Inumbo-ID: eb9543bd-ea17-4907-a2a2-5cf5329ff015
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb9543bd-ea17-4907-a2a2-5cf5329ff015;
	Fri, 13 Nov 2020 14:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605277662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rq5OrBfxWbxqS45SPstigq5O/6hrDrhLwKgYK9WwPqk=;
	b=o50MAOmKgYmjbmcMzsCJ67XK9F7X2ei6cZKK3VMIM0gtnLdm9bCkJp2prJeaJY2RCzK6Mm
	XSFDb+ZhwduQyVc9hlg/C1lzKYwZWEEGPOWqlmdzETMN99ff56VGUxtaI3PYjz2JpWQFum
	VCLdNd6Yt7MH4/P5zan9qqel4JrMM7A=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79C8CABD9;
	Fri, 13 Nov 2020 14:27:42 +0000 (UTC)
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
To: Bjoern Doebel <doebel@amazon.de>
Cc: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201113141823.58712-1-doebel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b61119da-b6e8-7746-9298-54bf60da88ea@suse.com>
Date: Fri, 13 Nov 2020 15:27:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201113141823.58712-1-doebel@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.11.2020 15:18, Bjoern Doebel wrote:
> --- a/tools/xenstore/Makefile
> +++ b/tools/xenstore/Makefile
> @@ -66,6 +66,10 @@ $(XENSTORED_OBJS): CFLAGS += $(SYSTEMD_CFLAGS)
>  xenstored: LDFLAGS += $(SYSTEMD_LIBS)
>  endif
>  
> +# xenstored: enforce creation of a buildID section and use a linker
> +# script to add additional symbols around that section
> +xenstored: LDFLAGS +=  -Wl,--build-id=sha1 -Wl,-T,buildid_symbols.ld

Since in the hypervisor build we're careful to not use --build-id
when the linker doesn't support it, I suppose the same care needs
applying here. See the setting of build_id_linker in ./Config.mk.

Jan

