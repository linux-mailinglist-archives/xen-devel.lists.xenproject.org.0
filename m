Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AAE845DE5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 17:57:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674560.1049592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaNC-00040u-DK; Thu, 01 Feb 2024 16:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674560.1049592; Thu, 01 Feb 2024 16:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaNC-0003yP-Ai; Thu, 01 Feb 2024 16:57:10 +0000
Received: by outflank-mailman (input) for mailman id 674560;
 Thu, 01 Feb 2024 16:57:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rVaNA-0003yH-Qi
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 16:57:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVaN8-0005Gl-Px; Thu, 01 Feb 2024 16:57:06 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVaN8-0003uN-HP; Thu, 01 Feb 2024 16:57:06 +0000
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
	bh=qgZJCfdLDu8JYR0LsPiclE/eQBuhsWgYjnA8lKA8aOc=; b=Zg5EhqUmnKmEqg2nTWgRTCi6UC
	wTGtaWHah0fwFn+1OvePB8NU//0FkGY37MzQ+VOaDMe8Mc+eZfwssbG6LaqALzzpPesRvc44gKYgV
	T/S2Je17Ry9N4/e3LpE19WyVFrQmAR1EqD0++8rRVao7eQLHH1tWKwl5+9KjFDyBYMeg=;
Message-ID: <9e01b86e-e3d2-4eec-93ed-e8828375bb30@xen.org>
Date: Thu, 1 Feb 2024 16:57:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Next steps for Rust guest agent
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>,
 Yann Dirson <yann.dirson@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Lunfan Zhang <Lunfan.Zhang@citrix.com>, Xihuan Yang
 <xihuan.yang@citrix.com>, dpsmith@apertussolutions.com,
 marmarek@invisiblethingslab.com
References: <aea51d2e-5da8-4da8-954f-2ee2a43be73e@vates.tech>
 <1be8f6f1-f977-4743-bd26-362ada960dc6@vates.tech>
 <CA+zSX=Yu_Epi6fge71iQNkecYOn92XO4KzwRtQNfrchtMaCxzw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=Yu_Epi6fge71iQNkecYOn92XO4KzwRtQNfrchtMaCxzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi George,

On 01/02/2024 16:55, George Dunlap wrote:
> On Thu, Jan 11, 2024 at 12:27 PM Yann Dirson <yann.dirson@vates.tech> wrote:
>>> - what should be the criteria to advertise it as official Xenproject
>>> guest agent ?
>>
>> What do people think here?
> 
> As we discussed at the community call, I think that we should
> basically set a date at which we consider this the official Xen
> Project guest agent.  Anyone who wants to have input can give it
> before then.  Then once you guys think it's ready, we can start to
> "market" it to the distros.

+1

> 
> Shall we say 29 February, 8 weeks from now?

This is 4 weeks away. I am fine with that, but checking this is the date 
you intended to set.

Cheers,

-- 
Julien Grall

