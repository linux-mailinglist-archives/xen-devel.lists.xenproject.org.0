Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA544F600E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 15:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299886.511177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5pl-0003d8-Ne; Wed, 06 Apr 2022 13:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299886.511177; Wed, 06 Apr 2022 13:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5pl-0003a1-Jq; Wed, 06 Apr 2022 13:36:29 +0000
Received: by outflank-mailman (input) for mailman id 299886;
 Wed, 06 Apr 2022 13:36:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nc5pk-0003Zv-C3
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 13:36:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc5pj-0004yu-Kh; Wed, 06 Apr 2022 13:36:27 +0000
Received: from [54.239.6.190] (helo=[192.168.16.200])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc5pj-0001mT-EY; Wed, 06 Apr 2022 13:36:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=aPPqWtGwWZmo50/WjeGVcaZQhnmUgVzChHQsjATChhA=; b=aJH8C3aCST0G+Gbq9g4WOIHNY6
	TFLWeHTDU8l1ONuFPReRA4XkrIry0/VXIcONR27CwRkGVAkdpzHEx64L6nvlUb0eLGHyLhmwFKjdC
	Z0Hg8Oj2fvGVylvVbVF9nnrPAO2tb25WF8C5ot1uEBDGTsda88mKsdMFt3KQQ6/pRFuY=;
Message-ID: <52abc898-fc74-5d3a-debd-118569744459@xen.org>
Date: Wed, 6 Apr 2022 14:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] EFI: correct indentation in efi_tables()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <ab79f62f-45e8-7cb5-bf3b-a8c003db63b9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ab79f62f-45e8-7cb5-bf3b-a8c003db63b9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/04/2022 14:32, Jan Beulich wrote:
> Eliminate hard tabs. While there also cast to the intended type.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

