Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FAF63FA4F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 23:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451283.708963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rjB-0002Qr-3j; Thu, 01 Dec 2022 22:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451283.708963; Thu, 01 Dec 2022 22:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rjB-0002OS-0x; Thu, 01 Dec 2022 22:08:21 +0000
Received: by outflank-mailman (input) for mailman id 451283;
 Thu, 01 Dec 2022 22:08:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0rj9-0002OK-AU
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 22:08:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0rj8-0005E9-Q2; Thu, 01 Dec 2022 22:08:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0rj8-0002zE-Kc; Thu, 01 Dec 2022 22:08:18 +0000
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
	bh=FeAd2bEO6nliE1shaBxOPmnk4d8P1mCHRWApzpsDGzs=; b=O/JIjpXvWDApjV1UL9WApaM666
	lY/YBs6BbT2FUdMd04Plxpvd9cKk+9FbtPP2JI9hpeZnFP/X5gCP0+nj7Gubg9HbiJ9We/5xIzAXb
	9kk1GxtQUwQpBbNAodNj1XvGvAbtW+B7MEVzbulSk2jxQ9PlhYI0EYyZ9f0J0AICpRvM=;
Message-ID: <cb23c467-f878-7c3d-1ac6-9d56b11ff8f6@xen.org>
Date: Thu, 1 Dec 2022 22:08:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 18/20] tools/xenstore: make log macro globally available
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-19-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221101152842.4257-19-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> Move the definition of the log() macro to xenstored_core.h in order
> to make it usable from other source files, too.
> 
> While at it preserve errno from being modified.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

