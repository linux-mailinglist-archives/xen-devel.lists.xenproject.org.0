Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619C63804A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 21:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448045.704849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyJ4R-0003pM-HI; Thu, 24 Nov 2022 20:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448045.704849; Thu, 24 Nov 2022 20:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyJ4R-0003n8-EA; Thu, 24 Nov 2022 20:43:43 +0000
Received: by outflank-mailman (input) for mailman id 448045;
 Thu, 24 Nov 2022 20:43:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oyJ4P-0003n1-SJ
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 20:43:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyJ4O-0005wx-SG; Thu, 24 Nov 2022 20:43:40 +0000
Received: from [54.239.6.186] (helo=[192.168.1.238])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyJ4O-0002Hx-Df; Thu, 24 Nov 2022 20:43:40 +0000
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
	bh=2Ser2/vS9I1VzfOjq65CZnNQn7qaITtgLJHyw1zNUwM=; b=zFZVwFykNJaFxWYD8wZRds/dyF
	hqu1NNrnFf0VGRkV63sznnhQIaXdOQpcRU73GpLK/dPYAWPkOnf0PcOLaTJxO7s6vx6GxyfVdjksY
	KuhcMJ65j99n+FGX/cHP3fXFdKkRbssKO+uSMpJpcBvsuzQVJy3FZchUqLUzGDlSHhXo=;
Message-ID: <0bb8ed7b-df73-48c1-350a-f067cd928d36@xen.org>
Date: Thu, 24 Nov 2022 21:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 01/10] unify update_runstate_area()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <de5c29dd-7827-10e7-9d12-bd8a9a048fed@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <de5c29dd-7827-10e7-9d12-bd8a9a048fed@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/10/2022 09:38, Jan Beulich wrote:
> x86'es variant is a superset of Arm's, with CONFIG_COMPAT parts already
> properly marked. The only other missing piece is
> update_guest_memory_policy(): For the time being Arm simply gains an
> empty struct and inline function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

