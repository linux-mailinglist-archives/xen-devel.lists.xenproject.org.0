Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA6658A080
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 20:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380642.614955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJfZn-0004M7-6V; Thu, 04 Aug 2022 18:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380642.614955; Thu, 04 Aug 2022 18:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJfZn-0004Js-3o; Thu, 04 Aug 2022 18:28:07 +0000
Received: by outflank-mailman (input) for mailman id 380642;
 Thu, 04 Aug 2022 18:28:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJfZk-0004Jk-SY
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 18:28:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJfZk-0002fJ-It; Thu, 04 Aug 2022 18:28:04 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.117.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJfZk-00024C-Bm; Thu, 04 Aug 2022 18:28:04 +0000
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
	bh=xC6Mfr+xX3LxHQBhbvsVVsSJ/Ip8oZMvxvfF/GRtRX4=; b=pZeFemjEMP3CuGcpQB6wZ9R3DR
	pe51QhTmeSevYOzcs3WbV+NpYo/FC57LsC3h863QBus7EO8N9KJ1TAhvPUg1ZRJktlBzRtqgI+bwx
	dYy11no54Lwa0PQsoMFvHbWN5WbWoRFDDQLdNTvTpMhp6+Bzh3m1zdrMA4L3Xw58G8H0=;
Message-ID: <d4a00666-e083-8a96-6827-5520c67f3438@xen.org>
Date: Thu, 4 Aug 2022 19:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v3 1/5] tools/xenstore: minor fix of the migration stream
 doc
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220803115950.10904-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 03/08/2022 12:59, Juergen Gross wrote:
> Drop mentioning the non-existent read-only socket in the migration
> stream description document.

I would suggest to mention in the commit message (or possibly use Fixes 
tags) that this was dropped in 8868a0e3f674 ("docs: update the xenstore 
migration stream documentation).

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

