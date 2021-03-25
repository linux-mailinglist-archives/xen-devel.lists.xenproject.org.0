Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4013C349601
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 16:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101439.194105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSD8-00089X-F3; Thu, 25 Mar 2021 15:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101439.194105; Thu, 25 Mar 2021 15:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSD8-00088l-Bv; Thu, 25 Mar 2021 15:47:50 +0000
Received: by outflank-mailman (input) for mailman id 101439;
 Thu, 25 Mar 2021 15:47:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPSD6-0007aB-Fj
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 15:47:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6b6b779-42ee-43d8-b147-97f408e94207;
 Thu, 25 Mar 2021 15:47:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AAFAAA55;
 Thu, 25 Mar 2021 15:47:35 +0000 (UTC)
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
X-Inumbo-ID: a6b6b779-42ee-43d8-b147-97f408e94207
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616687255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfrDyWtRkvt7SP9dXjXX5Oxi8t/Y+WDKK79HHfKzu14=;
	b=uD7jPqTjOd2ce4VsMXSOqUSdoPINa9f0OlGaaJYvxgNm3mN9g/2TNFAiac8nNb33iinjRj
	O9KZtwV1Ry5zmz4+7jsSDDI381h+aZSjGZI+J+a5+saIcCM6GCHHHsh53fizkqdOIefV6y
	zXe/t8pJ18vtkGUgTvJXmYjQaCbR/x4=
Subject: Re: [PATCH] xen: Drop "-rc" suffix from XEN_EXTRAVERSION
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210325150702.7582-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fabc8f83-e534-4615-cd14-17876be29273@suse.com>
Date: Thu, 25 Mar 2021 16:47:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325150702.7582-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.03.2021 16:07, Andrew Cooper wrote:
> Fixes: a04509d34d ("Branching: Update version files etc. for newly unstable")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


