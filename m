Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB976F5578
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529071.823060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9Ew-0003gb-AV; Wed, 03 May 2023 09:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529071.823060; Wed, 03 May 2023 09:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9Ew-0003ev-6w; Wed, 03 May 2023 09:57:38 +0000
Received: by outflank-mailman (input) for mailman id 529071;
 Wed, 03 May 2023 09:57:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pu9Ev-0003ep-58
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:57:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu9Eu-0006Xx-Ne; Wed, 03 May 2023 09:57:36 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu9Eu-0003nQ-GK; Wed, 03 May 2023 09:57:36 +0000
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
	bh=ul3QFpGjbwRlVg8hyIG/++WptfdF4QkYqxE1QSqeqkc=; b=rC3qS9xkoPH+d0b41Hsy+JIQnY
	hRsV3/ltomwLOWl8LLM0B3U6ojNwUElqJAlONBdCR8bNcEZcPu52tO6TWFImKzcFpjix4gJ9kvuSa
	cGdN83izIEI4rxAMyWqpuWl423RMJ3AuGmsYKHOrIJyZqYWIuPkvYbSNlGZGfsumisI0=;
Message-ID: <aae0daea-cfc4-166d-45b7-582bc2cebf71@xen.org>
Date: Wed, 3 May 2023 10:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 11/13] tools/xenstore: remember global and per domain
 max accounting values
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-12-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/04/2023 08:03, Juergen Gross wrote:
> Add saving the maximum values of the different accounting data seen
> per domain and (for unprivileged domains) globally, and print those
> values via the xenstore-control quota command. Add a sub-command for
> resetting the global maximum values seen.
> 
> This should help for a decision how to set the related quotas.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

