Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D354D50E22E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312997.530445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niz1L-0008GY-IU; Mon, 25 Apr 2022 13:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312997.530445; Mon, 25 Apr 2022 13:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niz1L-0008ET-Fd; Mon, 25 Apr 2022 13:44:55 +0000
Received: by outflank-mailman (input) for mailman id 312997;
 Mon, 25 Apr 2022 13:44:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1niz1J-0008Di-RW
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:44:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1niz1J-0004HW-6X; Mon, 25 Apr 2022 13:44:53 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.15.211]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1niz1I-0008EI-W7; Mon, 25 Apr 2022 13:44:53 +0000
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
	bh=nfheuvvxeT/yA4RR2e89QWM+Rncu8jKMASmPZoOTpzw=; b=EilFge4DOlN4DTF71CMoxCiRGX
	uKfz0e2IM4VRGNly9PmmehcDzDrhTamXVTX162+1L+P+/kJU7saErtLA38m88OlCpb2CFtP5GuF8c
	H9gnSy10e+6ApiZv4LrulZIEKkh795ezR3qQg4ZsKXnwMHrCegdwdSuycgIqjzS9utDw=;
Message-ID: <645b2e0c-7ba3-03d0-7438-07cc432f6b11@xen.org>
Date: Mon, 25 Apr 2022 14:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
To: David Vrabel <dvrabel@cantab.net>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>
References: <20220425132801.1076759-1-dvrabel@cantab.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220425132801.1076759-1-dvrabel@cantab.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/04/2022 14:28, David Vrabel wrote:
> From: David Vrabel <dvrabel@amazon.co.uk>
> 
> Heap pages can only be safely allocated and freed with interuupts

The typo I pointed out in v3 has not been addressed. For reminder, this is:

s/interupts/interrupts/

Cheers,

-- 
Julien Grall

