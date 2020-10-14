Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90D28E0AA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 14:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6739.17716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSg7i-00009o-Ag; Wed, 14 Oct 2020 12:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6739.17716; Wed, 14 Oct 2020 12:43:18 +0000
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
	id 1kSg7i-00009P-7f; Wed, 14 Oct 2020 12:43:18 +0000
Received: by outflank-mailman (input) for mailman id 6739;
 Wed, 14 Oct 2020 12:43:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSg7g-00009K-MP
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 12:43:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0103dee8-2912-4e3f-b905-b41e1aff5e18;
 Wed, 14 Oct 2020 12:43:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3578AFF4;
 Wed, 14 Oct 2020 12:43:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSg7g-00009K-MP
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 12:43:16 +0000
X-Inumbo-ID: 0103dee8-2912-4e3f-b905-b41e1aff5e18
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0103dee8-2912-4e3f-b905-b41e1aff5e18;
	Wed, 14 Oct 2020 12:43:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602679395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a64Xv+F2mTfEjImcYxOkhYsx7ECDamiENYrjt0sYy6w=;
	b=m3zI6Lj7UbLLstO9sCdmorCMJpwBxzcpWfTuEXtIrJE83zewtKuH/N65ZS2M7pP8H46bMi
	Wq3dxlfTQShuGWbFYnsgEB1Kwy0aO2IMnj/f8vrM17dcfD6Uu5ZZh3Ja6TkAUfCIlYRNEw
	C66Zppab0Fcx8YGY9nU+9jqJg08K4g8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F3578AFF4;
	Wed, 14 Oct 2020 12:43:14 +0000 (UTC)
Subject: Re: [PATCH 0/2] maintainers: correct some entries
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200909115944.4181-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a7bf7af0-9847-a9e9-09e8-c22f451199bb@suse.com>
Date: Wed, 14 Oct 2020 14:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909115944.4181-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping?

On 09.09.20 13:59, Juergen Gross wrote:
> Fix some paths after reorg of library locations, and drop unreachable
> maintainer.
> 
> Juergen Gross (2):
>    maintainers: fix libxl paths
>    maintainers: remove unreachable remus maintainer
> 
>   MAINTAINERS | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 


