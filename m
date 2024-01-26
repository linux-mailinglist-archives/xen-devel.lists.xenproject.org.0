Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E2083E002
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672242.1046021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTPzM-0001Z2-R8; Fri, 26 Jan 2024 17:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672242.1046021; Fri, 26 Jan 2024 17:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTPzM-0001WO-OQ; Fri, 26 Jan 2024 17:27:36 +0000
Received: by outflank-mailman (input) for mailman id 672242;
 Fri, 26 Jan 2024 17:27:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTPzL-0001WI-6G
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:27:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTPzK-0000oX-I6; Fri, 26 Jan 2024 17:27:34 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTPzK-0003ce-CD; Fri, 26 Jan 2024 17:27:34 +0000
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
	bh=OwN7RGnr8OsxBw4CkZCx/y4DmP7rdEVvaWHQ46G8HRM=; b=uC9omOaTilTylGGRS/TKiklzXW
	LfmfqlgXJ7xSdKnNY8ZGo3KqoTkwc/WIG+kxFYj1B67GpOOy5OZ5TnXYNMT/MO3SrBNrPrYTfiGWs
	gRcVpbpjQz3YnOMkrcIv2DDcSKRgrg3c+OZ1EPAtUpkomXLRaMHdWwkJVR4NneRtr/vo=;
Message-ID: <d5dcc4a1-580f-4d14-8ad0-4b0ce07822c6@xen.org>
Date: Fri, 26 Jan 2024 17:27:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/33] tools/xenstored: add helpers for filename
 handling
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-32-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-32-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> Add some helpers for handling filenames which might need different
> implementations between stubdom and daemon environments:
> 
> - expansion of relative filenames (those are not really defined today,
>    just expand them to be relative to /var/lib/xen/xenstore)
> - expansion of xenstore_daemon_rundir() (used e.g. for saving the state
>    file in case of live update - needs to be unchanged in the daemon
>    case, but should result in /var/lib/xen/xenstore for stubdom)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

