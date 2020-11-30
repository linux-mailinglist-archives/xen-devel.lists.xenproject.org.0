Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B9F2C8A02
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 17:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41351.74497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjmTF-0001kO-GD; Mon, 30 Nov 2020 16:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41351.74497; Mon, 30 Nov 2020 16:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjmTF-0001jy-CZ; Mon, 30 Nov 2020 16:56:13 +0000
Received: by outflank-mailman (input) for mailman id 41351;
 Mon, 30 Nov 2020 16:56:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kjmTD-0001jt-Bq
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 16:56:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kjmT5-0001Vf-NJ; Mon, 30 Nov 2020 16:56:03 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kjmT5-0002Oq-HJ; Mon, 30 Nov 2020 16:56:03 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=/GuFncgBZL1ILEdm4G2ODWEnlFhcl0st1I6ubsiFQHA=; b=OA5u39nXo4nDOZg/pRt+k4SZRB
	Xk5u9yfypa5jtWFAxaf6d9g9OKFi0Iu0x4ipBoZWnv4HaptrWvla5K9W6JqE+5oxGoZKwOdvQk5D8
	h/ZsoVJPVpXuFvoLdZC381v39EBrA/Y53k9uowtte0CWmvs7hUCHGjX0BM9OF+sTR18Y=;
Subject: Re: Xen 4.15: Proposed release schedule
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, George Dunlap <George.Dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Paul Durrant <xadimgnik@gmail.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <24510.24778.433048.477008@mariner.uk.xensource.com>
 <24510.25252.447028.364012@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a0648b20-54df-850b-2992-35dfbb86b7ca@xen.org>
Date: Mon, 30 Nov 2020 16:56:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <24510.25252.447028.364012@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 25/11/2020 13:56, Ian Jackson wrote:
>    Friday 8th January    Last posting date
> 
>      Patches adding new features should be posted to the mailing list
>      by this cate, although perhaps not in their final version.
> 
>    Friday 22nd January   Feature freeze
>   
>      Patches adding new features should be committed by this date.
>      Straightforward bugfixes may continue to be accepted by
>      maintainers.
We have a quite a good features line-up on Arm for this release. 
Unfortunately, some of the Arm reviewers (including myself) will be 
unavailable until mid-January. I think this will likely impair what we 
can get in Xen 4.15.

I was going to suggest a different feature freeze date for Arm (IIRC we 
did that in 2018), but the implementation of IOREQ for Arm will touch 
also x86 (in order to make the existing code common).

Therefore, would it be possible to push the "Feature Freeze" by week?

Note that I am not suggesting to push the "Last posting date" as to 
avoid increasing pressure on the number of series to review.

Cheers,

-- 
Julien Grall

