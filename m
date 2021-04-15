Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D263608AB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 13:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111081.212355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0bl-0007VA-QW; Thu, 15 Apr 2021 11:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111081.212355; Thu, 15 Apr 2021 11:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0bl-0007Ul-NE; Thu, 15 Apr 2021 11:56:29 +0000
Received: by outflank-mailman (input) for mailman id 111081;
 Thu, 15 Apr 2021 11:56:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0bk-0007Ug-4B
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:56:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0bi-0007Hj-Ai; Thu, 15 Apr 2021 11:56:26 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0bi-0001u2-46; Thu, 15 Apr 2021 11:56:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=w3fgonEXH9ZOuMXV3DlyhlbO8TaCM4qIvMPXljsIut4=; b=iuanXKsTQlOgE79+F9p0TqkjD6
	wxikzkWe9EpfPtrPyCvWS6e+ydHnYmIGeYrSetEFSSeSP/SwElhmYEeeU5SypC8wX4p4Fzbg/ayH9
	hoTarh/AYfyPO6xnum+STYVEo0avTdV73Emuzam0eALsw+pBpdq8QE9yOKbAg3gTVprc=;
Subject: Re: [PATCH v3 11/15] unlz4: replace INIT
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <febeee3c-80f4-4568-9d27-4f243b11cce3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <853dd045-cb19-0ab5-18d0-62a048a2de5c@xen.org>
Date: Thu, 15 Apr 2021 12:56:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <febeee3c-80f4-4568-9d27-4f243b11cce3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2021 09:52, Jan Beulich wrote:
> There's no need for this abstraction.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

