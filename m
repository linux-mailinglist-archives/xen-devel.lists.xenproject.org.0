Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9DB5377A9
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 11:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338426.563199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvbgB-0005f2-Nw; Mon, 30 May 2022 09:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338426.563199; Mon, 30 May 2022 09:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvbgB-0005bz-Kn; Mon, 30 May 2022 09:27:15 +0000
Received: by outflank-mailman (input) for mailman id 338426;
 Mon, 30 May 2022 09:27:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nvbgA-0005bt-Sj
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 09:27:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvbg6-00082K-KZ; Mon, 30 May 2022 09:27:10 +0000
Received: from [54.239.6.188] (helo=[192.168.9.131])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvbg6-0005b3-EU; Mon, 30 May 2022 09:27:10 +0000
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
	bh=2gB+KIYvt3AujpSFf2BHkK/P/Unch+Daz3wfH2Pd9ec=; b=D8ij9/zq+bKQBnT+uUdU2h9pxu
	d1KRUVfqP90jHs8MwX03eDtw+JvKnpZ+q6JamwWeizabW88Vde88WDtlJhNeULzZnjKoPiBc07ZSd
	YRWnC40yk5Y5rIa6RZ5HWkTtfBGe5fIUvP1j4nepGLPqUN6hKDxDjCWwkByflEukOgeI=;
Message-ID: <0cc9c342-f355-5816-09e9-a996624c6a79@xen.org>
Date: Mon, 30 May 2022 10:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
 <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
 <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
 <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
 <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
 <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org>
 <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/05/2022 10:16, Jan Beulich wrote:
> On 30.05.2022 11:12, Julien Grall wrote:
>> On 28/05/2022 00:16, Stefano Stabellini wrote:
>>> """
>>> It is possible that in specific circumstances it is best not to follow a
>>> rule because it is not possible or because the alternative leads to
>>> better code quality. Those cases are called "deviations". They are
>>> permissible as long as they are documented, either as an in-code comment
>>> or as part of the commit message. Other documentation mechanisms are
>>
>> I would drop the "as part of the commit message" because it is a lot
>> more difficult to associate the deviation with a rationale (the code may
>> have been moved and you would need to go through the history).
> 
> But this was added in response to me pointing out that code comments
> aren't standardized yet as to their format. The alternative, as said
> before, would be to come up with a scheme first, before starting to
> mandate playing by certain of the rules (and hence requiring deviations
> to be documented).

I don't think this is necessary short term. It is easy to rework a 
comment after the fact. It is a lot more difficult to go through the 
history and find the rationale.

Documenting the deviation in the commit message also makes a lot more 
difficult to triage issues reported by scanner. With a comment you could 
just read it from the same "page" (scanner will usually provide context).

So overall, I think allowing to document deviations in a commit message 
is a pretty bad move (the more if it is a short term solution).

Cheers,

-- 
Julien Grall

