Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDAB742F7D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 23:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557118.870203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzAg-0001E6-Vk; Thu, 29 Jun 2023 21:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557118.870203; Thu, 29 Jun 2023 21:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzAg-0001CQ-TC; Thu, 29 Jun 2023 21:27:22 +0000
Received: by outflank-mailman (input) for mailman id 557118;
 Thu, 29 Jun 2023 21:27:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEzAf-0001CK-0c
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 21:27:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzAd-0008O0-RV; Thu, 29 Jun 2023 21:27:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzAd-0003dS-M1; Thu, 29 Jun 2023 21:27:19 +0000
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
	bh=lOz2DXoVx74iS6W97tjp2Cx3UgunsQ60JTtDbhKsFXU=; b=zZ69MO9hXXXlPRHsZs1izkA0iV
	2/ajIh3nQZOJVUS24CH/VYbz9uwX2olX+uvYYomZj0IR+/v70j+V1TQ8bl49p/dSmRQ8EvDrznXK1
	4tsPNynRJ0jOz8jYPuyLqL9O39xyINPuTRMz0YHc1CDWN5B6O0la3dWUFSaxqyRsSw6E=;
Message-ID: <2b7301ea-e209-2dae-4669-d05cbc9d3f90@xen.org>
Date: Thu, 29 Jun 2023 22:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/5] tools/xenstore: split out environment specific
 live update code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230627122750.2007-1-jgross@suse.com>
 <20230627122750.2007-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230627122750.2007-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/06/2023 13:27, Juergen Gross wrote:
> Instead of using #ifdef in xenstored_control.c split out the code of
> environment specific functions (daemon or Mini-OS) to dedicated source
> files.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

