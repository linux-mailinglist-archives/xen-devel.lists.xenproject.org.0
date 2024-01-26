Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C515283E01A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672247.1046033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ1d-0002ig-7m; Fri, 26 Jan 2024 17:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672247.1046033; Fri, 26 Jan 2024 17:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ1d-0002gE-3V; Fri, 26 Jan 2024 17:29:57 +0000
Received: by outflank-mailman (input) for mailman id 672247;
 Fri, 26 Jan 2024 17:29:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTQ1b-0002g8-Lv
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:29:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTQ1b-0000rq-03; Fri, 26 Jan 2024 17:29:55 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTQ1a-0003gz-Pl; Fri, 26 Jan 2024 17:29:54 +0000
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
	bh=7ahY18Cv5X6/zZ1W7ig86GXDq0rpE+eb6HGeSbGoLPE=; b=zBzZKtADbbSxTpyENJ192nyWeJ
	4qM/RYkKtY426RQAQFY70/JzKImbJfJnrmMhks3Zk6r7jwUUxxX5uqM2kN4ysz51NLjIrWOtLYzHY
	deh8q4zTu8kEz4LOLBGY7pxOTwgXWZe1R1Us1WjQE3MazEFIOwI7eeuAxH6TqDsriC0c=;
Message-ID: <f8f46abc-6299-42ab-86a3-b5dd1f63cb98@xen.org>
Date: Fri, 26 Jan 2024 17:29:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/33] tools/xenstored: support complete log
 capabilities in stubdom
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-33-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-33-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> With 9pfs being fully available in Xenstore-stubdom now, there is no
> reason to not fully support all logging capabilities in stubdom.
> 
> Open the logfile on stubdom only after the 9pfs file system has been
> mounted.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

