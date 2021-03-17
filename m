Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E69433EFDD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:55:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98669.187271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUlF-0005bI-4T; Wed, 17 Mar 2021 11:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98669.187271; Wed, 17 Mar 2021 11:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUlF-0005aw-1Q; Wed, 17 Mar 2021 11:54:49 +0000
Received: by outflank-mailman (input) for mailman id 98669;
 Wed, 17 Mar 2021 11:54:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMUlD-0005ar-H5
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:54:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUlA-0005Fd-Gb; Wed, 17 Mar 2021 11:54:44 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUlA-0001FR-7W; Wed, 17 Mar 2021 11:54:44 +0000
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
	bh=c//ys24c5UYVm+BYnE/A+cLez1A+IVc+8GG/DkQMbts=; b=NawzYYqF4vgOM1IH2srIO3xg0u
	ec+rFkImZO8CxIBike4XoE8+rpseyVhD+OOrwzCR9o/1zuZPW7yEcJ68dy8gS4i4+nprPTvQcw6WL
	LGWVbVA3h6fTEqN4C3bHfLf1ZJxYJzPkzaupiEyoQqrZS9tQ2GcAVyZsbDJCPC51h0Xo=;
Subject: Re: [PATCH for-4.15 v2] SUPPORT.MD: Mark LiveUpdate of C XenStored
 daemon as Tech Preview
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20210317112745.15207-1-julien@xen.org>
 <cc98f580-9d92-79d4-49e7-342dc8d6a803@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <87fff120-5ed8-4775-2340-3852ee7475e8@xen.org>
Date: Wed, 17 Mar 2021 11:54:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cc98f580-9d92-79d4-49e7-342dc8d6a803@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 17/03/2021 11:49, Andrew Cooper wrote:
> On 17/03/2021 11:27, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Support to liveupdate C XenStored daemon was added during the 4.15
>> development cycle. Add a section in SUPPORT.MD to explain what is the
>> support state.
>>
>> For now, it is a tech preview.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> What about oxenstored ?

Oh, I read your answer as there is no support. I can resend a patch with 
the following title:

"LiveUpdate of C/Ocaml XenStored daemon"

Cheers,

-- 
Julien Grall

