Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB6776B42
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 23:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581389.910064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTr5n-0002Ur-Qc; Wed, 09 Aug 2023 21:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581389.910064; Wed, 09 Aug 2023 21:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTr5n-0002SM-NC; Wed, 09 Aug 2023 21:51:47 +0000
Received: by outflank-mailman (input) for mailman id 581389;
 Wed, 09 Aug 2023 21:51:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTr5m-0002SG-9v
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 21:51:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTr5i-0005CF-99; Wed, 09 Aug 2023 21:51:42 +0000
Received: from [54.239.6.185] (helo=[192.168.6.56])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTr5i-0000AL-12; Wed, 09 Aug 2023 21:51:42 +0000
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
	bh=5Rm0lE1tq8VCtXtig6KHKXIqLjZf2jl56CFbzjUNHN8=; b=qOv/KVjCb143/Xf8yvLA7kSo8T
	ATKPNXyLVWtrj7/7D6r6HqnKn1xBO+aUAgDbkle0xlRZToqFfS8iMD/NX3j9k5M0prcpJP0ih83vE
	lOMt93PBpkm1Mpcdy3v3lI7plcr5fqSVLipDEeDk/K3JkHTIaPlA57DSNNuyK5z/wlYI=;
Message-ID: <0d7cabca-e0d5-4ab6-a16d-11da35e45149@xen.org>
Date: Wed, 9 Aug 2023 22:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA violations in hypercall-defs
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>, jgross@suse.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Bertrand.Marquis@arm.com
References: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com>
 <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com>
 <alpine.DEB.2.22.394.2308081457530.2127516@ubuntu-linux-20-04-desktop>
 <456d6bb5-8fa2-d47a-5d1a-b3bda20e0a5b@suse.com>
 <alpine.DEB.2.22.394.2308091320540.2127516@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2308091320540.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/08/2023 21:35, Stefano Stabellini wrote:
> P.S.
> Julien, Bertrand, do you think we should unsupport (in SUPPORT.md, today
> it is not clarified) 32-bit guests on a 64-bit ARM hypervisor?

I read your explanation above and I don't really understand why you 
would want to de-support it. This works pretty well and I am not aware 
of any issue right now to run 32-bit guest on 64-bit HW.

Cheers,

-- 
Julien Grall

