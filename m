Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33791565015
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359980.589291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HqI-00014F-Hl; Mon, 04 Jul 2022 08:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359980.589291; Mon, 04 Jul 2022 08:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HqI-00011q-Ew; Mon, 04 Jul 2022 08:54:06 +0000
Received: by outflank-mailman (input) for mailman id 359980;
 Mon, 04 Jul 2022 08:54:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HqG-00011P-Jf; Mon, 04 Jul 2022 08:54:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HqC-0003Od-2k; Mon, 04 Jul 2022 08:54:00 +0000
Received: from [54.239.6.187] (helo=[192.168.26.128])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HqB-0005WQ-SH; Mon, 04 Jul 2022 08:54:00 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=eSHskeKFGbG1KZzjx+6Gf+BDAnyv6QWb9O0BzKpkEIo=; b=0c/xYyUl7ExTc3WmaIkA1LS4+X
	ncCv7HT7Y8+deV9yvuEAcV3F3msqnT8ctjHL0OFAUqeY4T+6ImLLUJY263PJ0QNyJ/U2WK5JXbsZc
	o82ON7svMxQQOL5k/TrHiuIjfs0/dtzRcjf2xEaF4J+hWEgijAyw1soTmKS2KgS9RznE=;
Message-ID: <93d24653-472c-c54f-3f69-e8f9ddd6e6a8@xen.org>
Date: Mon, 4 Jul 2022 09:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 0/8] mini-os: some cleanup patches
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220620073820.9336-1-jgross@suse.com>
 <10e6cfe8-2aaf-2340-a52e-bce0c3373706@suse.com>
 <7ce54a47-9795-310f-c5cb-55f1b6fcdd93@xen.org>
In-Reply-To: <7ce54a47-9795-310f-c5cb-55f1b6fcdd93@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/07/2022 09:39, Julien Grall wrote:
> Hi Juergen,
> 
> On 04/07/2022 09:37, Juergen Gross wrote:
>> On 20.06.22 09:38, Juergen Gross wrote:
>>> Do some cleanups.
>>>
>>> No functional change intended, apart from whitespace changes only
>>> minor modifications making code easier to read.
>>>
>>> Juergen Gross (8):
>>>    mini-os: drop xenbus directory
>>>    mini-os: apply coding style to xenbus.c
>>>    mini-os: eliminate console/console.h
>>>    mini-os: rename console/xenbus.c to consfront.c
>>>    mini-os: apply coding style to consfront.c
>>>    mini-os: eliminate console directory
>>>    mini-os: apply coding style to console.c
>>>    mini-os: add mini-os-debug[.gz] to .gitignore
>>>
>>>   .gitignore                      |   2 +
>>>   Makefile                        |   9 +-
>>>   console/xenbus.c => consfront.c |  99 ++++---
>>>   console.c                       | 415 ++++++++++++++++++++++++++
>>>   console/console.c               | 177 -----------
>>>   console/console.h               |   2 -
>>>   console/xencons_ring.c          | 238 ---------------
>>>   include/console.h               |   1 +
>>>   xenbus/xenbus.c => xenbus.c     | 510 +++++++++++++++++++-------------
>>>   9 files changed, 778 insertions(+), 675 deletions(-)
>>>   rename console/xenbus.c => consfront.c (78%)
>>>   create mode 100644 console.c
>>>   delete mode 100644 console/console.c
>>>   delete mode 100644 console/console.h
>>>   delete mode 100644 console/xencons_ring.c
>>>   rename xenbus/xenbus.c => xenbus.c (71%)
>>>
>>
>> Could someone please commit this series? Samuel gave his R-b nearly 2 
>> weeks
>> ago.
> 
> I will commit this series and the other you pointed out.

Done.

Cheers,

-- 
Julien Grall

