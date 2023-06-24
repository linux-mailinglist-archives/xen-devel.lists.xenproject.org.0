Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCFF73CB34
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 15:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554582.865854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD3lj-0006D9-Mh; Sat, 24 Jun 2023 13:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554582.865854; Sat, 24 Jun 2023 13:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD3lj-0006Aq-IN; Sat, 24 Jun 2023 13:57:39 +0000
Received: by outflank-mailman (input) for mailman id 554582;
 Sat, 24 Jun 2023 13:57:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qD3li-0006Ak-P7
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 13:57:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qD3lh-00016q-If; Sat, 24 Jun 2023 13:57:37 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qD3lh-0008EQ-Ck; Sat, 24 Jun 2023 13:57:37 +0000
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
	bh=ZBZPGR4tYSdosuoSesTRIQqw/a6ISShZ15Z6DYLzDCc=; b=rmUnUxrXUVnhq4Jx1FgG4qN90G
	Xou8OqK5d+RZffQWLelhchl4YmijNflnU5y4kUECH3R7nA6GqSKZy6ZajFY+fv1BBxh03GtaPTk8N
	jkuY9jASpKswy2Dis0yORMl7noegpqEWJKkgAwY67ZanE7fztScmVdGBscr+I/XZfqvs=;
Message-ID: <e12d775e-eeec-455e-7746-e2ea615827ad@xen.org>
Date: Sat, 24 Jun 2023 14:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] libelf: make L1_MFN_VALID note known
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f444ccc1-51be-e526-e8e2-7759a68a743d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f444ccc1-51be-e526-e8e2-7759a68a743d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/05/2023 15:19, Jan Beulich wrote:
> We still don't use it (in the tool stack), and its values (plural) also
> aren't fetched correctly, but it is odd to continue to see the
> hypervisor log "ELF: note: unknown (0xd)" when loading a Linux Dom0.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

