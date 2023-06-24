Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9773C73C
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 09:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554501.865765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCxQi-00047r-2S; Sat, 24 Jun 2023 07:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554501.865765; Sat, 24 Jun 2023 07:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCxQh-00045H-Vr; Sat, 24 Jun 2023 07:11:31 +0000
Received: by outflank-mailman (input) for mailman id 554501;
 Sat, 24 Jun 2023 07:11:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qCxQg-00045A-E0
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 07:11:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCxQY-0000BV-JL; Sat, 24 Jun 2023 07:11:22 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCxQY-0008Ae-CX; Sat, 24 Jun 2023 07:11:22 +0000
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
	bh=E8FuhcThO2Xy/jOeFW0iTVTriPZbuxy46MOWnnYcb8Y=; b=q7fho2uOkghBbT85LlU8exfuvv
	stvt5WOG+l9vRvfhkGi97P8iSxyfORow96jn3XuLbzXvy3kK1ViQFjk80tFyYxWa9vfCvl/+FbER1
	/ZMM3/7a8mka5peJ8gbp/MGj4ik8aNyZIRNyK7OTKJNaN4P+DPfkFzv8jx2gy5rXCHRE=;
Message-ID: <63d48b43-8ce9-3df6-1407-17c2af734828@xen.org>
Date: Sat, 24 Jun 2023 08:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v4] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <4ab190bd0d80898311aa9f1e912f18e7cdef2762.1687510380.git.nicola.vetrini@bugseng.com>
 <f099efe2-e318-a40d-5254-e9c1e87578e6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f099efe2-e318-a40d-5254-e9c1e87578e6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

First, one remark about the title. We don't usually add full stop in the 
title. I am happy to fix it on commit.

On 23/06/2023 18:16, Jan Beulich wrote:
> I'm not happy to, with the continued use of the
> two U suffixes. It may seem minor, but to me it feels like setting a
> bad precedent.

I wasn't able to find the reasoning behind your objections in the 
archive. I would like to understand your concern before providing any 
ack. Would you be able to give a pointer?

Cheers,

-- 
Julien Grall

