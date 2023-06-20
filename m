Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B7736C00
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551778.861483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaZP-0002ic-Ek; Tue, 20 Jun 2023 12:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551778.861483; Tue, 20 Jun 2023 12:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaZP-0002fu-Be; Tue, 20 Jun 2023 12:34:51 +0000
Received: by outflank-mailman (input) for mailman id 551778;
 Tue, 20 Jun 2023 12:34:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBaZO-0002fo-DF
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:34:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBaZN-0005Yj-K5; Tue, 20 Jun 2023 12:34:49 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBaZN-0006dG-ET; Tue, 20 Jun 2023 12:34:49 +0000
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
	bh=eIC+KweW/TgCPmrXXBF5CcsG4GqAbwFBRvqeuOCpQII=; b=wC3g7o55yAlACHFckMkUGbQGc0
	bzBSTM1DaPccdlWbW0Su+CkTYNqqAGGALIJf6s/Eu6w2aAk9mN3kpga1y+nyDPMgnNJ9e1PNppTLk
	BZDbAQJyiF0AZDGbM2E2xKesU4rAB08ETTViqqDksDj0TRX30NdZLPZRBjfGtwtITAR8=;
Message-ID: <65376576-df42-1388-b8f8-3c575a756a0e@xen.org>
Date: Tue, 20 Jun 2023 13:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 08/11] tools/xenstore: make hashtable key and value
 parameters const
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> The key is never modified by hashtable code, so it should be marked
> as const.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

