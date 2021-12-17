Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D1478E5C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248703.428992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEVe-0006id-JU; Fri, 17 Dec 2021 14:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248703.428992; Fri, 17 Dec 2021 14:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEVe-0006fu-Fq; Fri, 17 Dec 2021 14:46:58 +0000
Received: by outflank-mailman (input) for mailman id 248703;
 Fri, 17 Dec 2021 14:46:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myEVc-0006fo-8y
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:46:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myEVb-00057P-OM; Fri, 17 Dec 2021 14:46:55 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myEVb-00085O-Hk; Fri, 17 Dec 2021 14:46:55 +0000
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
	bh=mBIQsXzTBAEeE8FPJ7ujCFjv5Sg6MjFfq6mR8MsqQDc=; b=So3qbaWT0EY/SA9rZ68SpcAYea
	EYYJd5iJXhc8xfadiKWg1CBmMWEUtRY3FTu5keRd7O2p4srrgSUTbDTbCB2Ar+iGxsq5zEsStYcKb
	sh6G+fCecoBrCY4d4FrDRc+kZnax4PVKZuz+64t7nJy6UOtZIuqAtYkR6bi7MPKngJPc=;
Message-ID: <0ab6d208-c290-72d9-4e0c-2c86d1280d44@xen.org>
Date: Fri, 17 Dec 2021 14:46:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] mm: introduce INVALID_{G,M}FN_RAW
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
 <6d2d29ca-0495-5029-afc8-7248f462db06@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6d2d29ca-0495-5029-afc8-7248f462db06@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/12/2021 09:39, Jan Beulich wrote:
> This allows properly tying together INVALID_{G,M}FN and
> INVALID_{G,M}FN_INITIALIZER as well as using the actual values in
> compile time constant expressions (or even preprocessor dirctives).
> 
> Since INVALID_PFN is unused, and with x86'es paging_mark_pfn_dirty()
> being the only user of pfn_t it also doesn't seem likely that new uses
> would appear, remove that one at this same occasion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

