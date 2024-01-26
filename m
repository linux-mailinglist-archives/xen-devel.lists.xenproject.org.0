Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689B83DFFA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:26:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672239.1046011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTPxM-0000jS-Er; Fri, 26 Jan 2024 17:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672239.1046011; Fri, 26 Jan 2024 17:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTPxM-0000hw-C7; Fri, 26 Jan 2024 17:25:32 +0000
Received: by outflank-mailman (input) for mailman id 672239;
 Fri, 26 Jan 2024 17:25:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTPxK-0000hq-Cw
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:25:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTPxJ-0000mr-J4; Fri, 26 Jan 2024 17:25:29 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTPxJ-0003Zy-C5; Fri, 26 Jan 2024 17:25:29 +0000
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
	bh=kn9gTOEZFEUPElRcDF6QoHTZopizwRmVIH/ipGxRbgE=; b=X2GuFJFSWxYdXagzMxtrzdKeg2
	gbSjFc9cjqN6tPqq+CiD5okLdNPOmDEFXCKFToDK8aqZ38S8E8cfe/hDSaqGopihzjZS6q5jNIxVl
	KkVLWVsY/3oCFE/r6gwf5IP1HljsHSXLzb6uS9++cxPCnc87wbt5AR7xluJU1v9Y54T8=;
Message-ID: <7a7b61ef-a101-4ecc-8e10-01d02ac4f03f@xen.org>
Date: Fri, 26 Jan 2024 17:25:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/33] tools/xenstored: mount 9pfs device in stubdom
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-31-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-31-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> Mount the 9pfs device in stubdom enabling it to use files.
> 
> This has to happen in a worker thread in order to allow the main thread
> handling the required Xenstore accesses in parallel.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

