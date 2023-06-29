Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F71742F94
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 23:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557126.870223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzMD-0003K7-9W; Thu, 29 Jun 2023 21:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557126.870223; Thu, 29 Jun 2023 21:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzMD-0003Gs-6f; Thu, 29 Jun 2023 21:39:17 +0000
Received: by outflank-mailman (input) for mailman id 557126;
 Thu, 29 Jun 2023 21:39:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEzMB-0003Gm-WA
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 21:39:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzMB-00009c-Id; Thu, 29 Jun 2023 21:39:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzMB-0004CZ-DQ; Thu, 29 Jun 2023 21:39:15 +0000
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
	bh=RSO/O3LWeMKmlD4w+D7y+3Xw0B6lNOdrmS+nx5pa75M=; b=jopbTdvGGlXyUVX3gpi/ivpAtt
	1urPET+i8Ufy2Cz55cBl/5KFWZgLnobqxehTybnBUlB5nfw2xYv0NUjW8c2XTQw5q6i2I/aSX9/v2
	0CUqNfyfyaNn+7ILfeFstohGa9KAqjRzIUtM9AQwvshqxpgHYUjDvo2lfFVGUTz4vYSA=;
Message-ID: <50c389d5-da7a-15a6-e03f-e4d96e34a446@xen.org>
Date: Thu, 29 Jun 2023 22:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 0/5] tools/xenstore: more cleanups
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230627122750.2007-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230627122750.2007-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/06/2023 13:27, Juergen Gross wrote:
> Some more cleanups of Xenstore.
> 
> Changes in V2:
> - rebase
> - one small modification of patch 10
> - added patches 11-13
> 
> Changes in V3:
> - rebase
> - modified patch 4
> - added patches 10, 11 and 13
> 
> Changes in V4:
> - patches 1-11 already committed
> - modified patch 3
> - rebased patch 4 after modifying patch 3
> 
> Juergen Gross (5):
>    tools/xenstore: remove no longer needed functions from xs_lib.c
>    tools/xenstore: replace xs_lib.c with a header
>    tools/xenstore: split out environment specific live update code
>    tools/xenstore: split out rest of live update control code
>    tools/xenstore: remove unused stuff from list.h

I have committed the series.

Cheers,

-- 
Julien Grall

