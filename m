Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF846FE7B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 11:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243734.421725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcoh-0001gF-Kn; Fri, 10 Dec 2021 10:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243734.421725; Fri, 10 Dec 2021 10:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcoh-0001eS-Hb; Fri, 10 Dec 2021 10:07:51 +0000
Received: by outflank-mailman (input) for mailman id 243734;
 Fri, 10 Dec 2021 10:07:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mvcog-0001eM-Au
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 10:07:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvcod-0002wF-FO; Fri, 10 Dec 2021 10:07:47 +0000
Received: from [54.239.6.184] (helo=[192.168.9.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvcod-00060C-8R; Fri, 10 Dec 2021 10:07:47 +0000
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
	bh=cHGnWzCEBD16LF+5G+GJ3sXkD8iCNz7H7h5y2GxZIEw=; b=sDY6S5yKOwEDAIdJF/sdyxbjLa
	h3p6/wDRLF53q73apGTuKmDWapBBdNxgB8M23vqGrGdXfwGiHyjUV7MWHMN2tXI3OyTcj27rT0z39
	QQKKowURe3sbNd1+9ymSV7XlgQcm57MKPpIOg+vdto/LiqG+mb+QzbfzByWjma2tPm+M=;
Message-ID: <60186223-3b10-7aba-751e-0a3aa2fc29a7@xen.org>
Date: Fri, 10 Dec 2021 10:07:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: Ping: [PATCH 2/3] EFI: constify EFI_LOADED_IMAGE * function
 parameters
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <d9664972-b0b8-605c-403d-4e2340442cae@suse.com>
 <850a3be8-0e84-3bb3-150b-42a6a3a0c7ef@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <850a3be8-0e84-3bb3-150b-42a6a3a0c7ef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/12/2021 09:44, Jan Beulich wrote:
> On 03.12.2021 11:57, Jan Beulich wrote:
>> Instead of altering Arm's forward declarations, drop them. Like
>> elsewhere we should limit such to cases where the first use lives ahead
>> of the definition.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> May I please ask for an Arm side ack (or otherwise) here?

Sorry I missed that patch. For the full patch:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

