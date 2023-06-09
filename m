Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7C72A1C4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 20:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546272.853015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gRU-0003UR-T9; Fri, 09 Jun 2023 18:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546272.853015; Fri, 09 Jun 2023 18:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gRU-0003RV-PS; Fri, 09 Jun 2023 18:02:32 +0000
Received: by outflank-mailman (input) for mailman id 546272;
 Fri, 09 Jun 2023 18:02:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7gRT-0003RP-75
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 18:02:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gRS-00034m-L4; Fri, 09 Jun 2023 18:02:30 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gRS-00021h-Eg; Fri, 09 Jun 2023 18:02:30 +0000
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
	bh=v8jGlJU6GA7yrv1Ki2TfXSOvKWHXuuNhBUjZCNUr/bA=; b=WvIDE7d652ReIjx2O62PA7ae6r
	uyzl5/pIxZHqt9SpFsktw1L+rFzZcDknjAKX/m5ZTIjZKOP8jz632l7tTgM2+QXZDfHeRgypwuSPw
	Gixh9kFTWTR0MufOLG82HMZ6/PfnV8zcxMhy07zHZI9z1vv7kMScpGZcmT7YZcSqfWOw=;
Message-ID: <fa0bdf31-8b34-6e6f-8318-b168935dc1e6@xen.org>
Date: Fri, 9 Jun 2023 19:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 06/16] tools/xenstore: switch write limiting to use
 millisecond time base
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-7-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> There is no need to keep struct wrl_timestampt, as it serves the same
> purpose as the more simple time base provided by get_now().
> 
> Move some more stuff from xenstored_domain.h into xenstored_domain.c
> as it is being used nowhere else.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

