Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0A83DEB5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 17:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672217.1045973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTP5C-0003X0-Lb; Fri, 26 Jan 2024 16:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672217.1045973; Fri, 26 Jan 2024 16:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTP5C-0003Tl-Ix; Fri, 26 Jan 2024 16:29:34 +0000
Received: by outflank-mailman (input) for mailman id 672217;
 Fri, 26 Jan 2024 16:29:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTP5B-0003SS-4o
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 16:29:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTP5A-0008Fh-Bp; Fri, 26 Jan 2024 16:29:32 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTP5A-0003iY-4z; Fri, 26 Jan 2024 16:29:32 +0000
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
	bh=l7UxzzyRUDz2i/UTflD3SOAWZcn8xaa3PyWbeUz77J4=; b=FahF3L9Ff+ir3zgIxZC1q6tvK8
	dvIrmhooyZsd5mrQo8FHHHrktGMrKcKTvj5ZaanNfGLKh4BIeWdX+Cu+1Vu+kZpJt7cvlQ5Co9K9c
	a0n19FuvtqpbSROOZpSHc83dXc+Y0zZskdvPGQfsZ6pIruDDZ6dCxr15Q+B3RYa2BaoA=;
Message-ID: <7ab48395-e229-46dd-9603-4ba8a404a80d@xen.org>
Date: Fri, 26 Jan 2024 16:29:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/33] tools/xenstored: map stubdom interface
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-30-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-30-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> When running as stubdom, map the stubdom's Xenstore ring page in order
> to support using the 9pfs frontend.
> 
> Use the same pattern as in dom0_init() when running as daemon in dom0
> (introduce the own domain, then send an event to the client side to
> signal Xenstore is ready to communicate).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

