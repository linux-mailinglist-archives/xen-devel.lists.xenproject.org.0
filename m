Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8002D6FCE7A
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 21:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532477.828721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSuT-0002g5-N7; Tue, 09 May 2023 19:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532477.828721; Tue, 09 May 2023 19:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSuT-0002cz-K7; Tue, 09 May 2023 19:22:05 +0000
Received: by outflank-mailman (input) for mailman id 532477;
 Tue, 09 May 2023 19:22:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwSuS-0002ct-7k
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 19:22:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSuR-0001Yj-Jp; Tue, 09 May 2023 19:22:03 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.0.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSuR-0007HH-E0; Tue, 09 May 2023 19:22:03 +0000
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
	bh=gENtAu0xcMiHrwsyqO5fY15RBn0iF+ALNYrU7xr6PBU=; b=fVv+XBgVuLjtaT2xBR8cG/1ucJ
	M+HZ1Fts8EeqadtQAi2LuBnT9mgKjy7gbqmtzMErB5m1075IUFoGmkJNnmAfb6T5ROgr/tUsBiVgg
	b0EZrpV/nC8wRAyjlmjD1Ad+YxFwuqMEEHuUITEIW+IVHu3o7uJF3/y9MZJHH0oJ/WvU=;
Message-ID: <216773a4-0b23-6af3-90a6-050af2d8cb7b@xen.org>
Date: Tue, 9 May 2023 20:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 13/14] tools/xenstore: switch get_optval_int() to
 get_optval_uint()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-14-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230508114754.31514-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/05/2023 12:47, Juergen Gross wrote:
> Let get_optval_int() return an unsigned value and rename it
> accordingly.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

