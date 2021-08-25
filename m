Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6483F778C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 16:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172441.314682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIu3Z-0007vb-Pj; Wed, 25 Aug 2021 14:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172441.314682; Wed, 25 Aug 2021 14:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIu3Z-0007so-M6; Wed, 25 Aug 2021 14:39:09 +0000
Received: by outflank-mailman (input) for mailman id 172441;
 Wed, 25 Aug 2021 14:39:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIu3Z-0007sg-0A
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 14:39:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIu3V-0007K2-4R; Wed, 25 Aug 2021 14:39:05 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIu3U-0003gt-Uf; Wed, 25 Aug 2021 14:39:05 +0000
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
	bh=PA2fRQ2Akgk4hrNxuyp/mNBSQ5qglafZ8LQm7Td+U0s=; b=txLUWm3sZq6R8oV01fOm6RBCV1
	kXmOUBHsAP2GZMWgU1NdsN2cgbT3swFZWAYU5VVFNTSajOW4b9EbbU/aKbTMbtbuM+juEucWwnDSV
	kUcrBHZFWTL4wN39f/SkX5BvLNipPzTDDnF15eF6pEL8oX/gzZFmj1sFMSrFbwqbSb8I=;
Subject: Re: Xen 4.16: Proposed release manager and schedule
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <George.Dunlap@citrix.com>, committers@xenproject.org
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
 <5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
 <24862.31351.137596.242803@mariner.uk.xensource.com>
 <db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
 <24868.63053.121473.979573@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <10ab2ac0-0f38-aeb3-405d-85d4056f8698@xen.org>
Date: Wed, 25 Aug 2021 15:39:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <24868.63053.121473.979573@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 24/08/2021 14:38, Ian Jackson wrote:
> Julien Grall writes ("Re: Xen 4.16: Proposed release manager and schedule"):
>> On 19/08/2021 16:36, Ian Jackson wrote:
> Can I at least get a +1 from someone for appointing me as RM
> for 4.16 ? :-)

+1. Sorry I forgot to mention it in the previous e-mail.

Cheers,

-- 
Julien Grall

