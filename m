Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5A357124
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 17:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106793.204204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAWf-0000C0-8C; Wed, 07 Apr 2021 15:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106793.204204; Wed, 07 Apr 2021 15:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAWf-0000BX-37; Wed, 07 Apr 2021 15:55:29 +0000
Received: by outflank-mailman (input) for mailman id 106793;
 Wed, 07 Apr 2021 15:55:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUAWe-0000BO-37
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:55:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUAWb-0008Un-BJ; Wed, 07 Apr 2021 15:55:25 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUAWb-0000aj-3r; Wed, 07 Apr 2021 15:55:25 +0000
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
	bh=v1EL2+3sU0wYwV63cEBljCYu2ynKJSEziF1oHO4zG94=; b=OuewV97H8KEWFCTPMSNATgpwZm
	FF3b21u+5sIycNwlulB0VdOki/45gSVmj3+BiUnNSGJuSiYjeB48xfI8mmbOD6rBrWLB/VkeLXafe
	W/qXsaptgtYqblwRiLwiLYop4fs0YubqbaJJDU2ytJXm/K+vVxV3JtV8pBmONYzicdPE=;
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
 <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
 <24685.52599.234444.705703@mariner.uk.xensource.com>
 <03084EF9-F130-41F7-9D8D-9AF86A87717F@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8b0fafe2-989e-5a5a-05ec-f55e096e4b54@xen.org>
Date: Wed, 7 Apr 2021 16:55:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <03084EF9-F130-41F7-9D8D-9AF86A87717F@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 07/04/2021 16:29, Bertrand Marquis wrote:
> Hi Ian,
> 
>> On 7 Apr 2021, at 16:19, Ian Jackson <iwj@xenproject.org> wrote:
>>
>> Luca Fancellu writes ("Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h"):
>>> The problem is that Doxygen can’t generate proper documentation for anonymous union/structure, it ends up with warning and/or producing wrong documentation like
>>> changing names or giving field description to the wrong field.
>>
>> This does not seem like it would be an impossibly hard feature to add
>> to doxygen.
> 
> Modifying doxygen is not really in our planned efforts and if someone does it that would put an hard constraint on the version of doxygen possible to use.

Are you saying that anyone who want to use doxygen has to waive off the 
use of anonymous union/struct? Is it the only thing doxygen can't deal with?

> But is adding names to anonymous elements really an issue here ?
> If we agree on names or on a convention for name the result will not impact the code or backward compatibility.

I think the naming is only the tip of the problem. One advantage of 
anymous union/struct is you make clear they are not meant to be used 
outside of the context. So they should mostly be seen as an easy way to 
access some part of the "parent" structure directly. Therefore, IMHO, 
they don't deserve to be documented separately.

In fact, this is the first thing I noticed when building the 
documentation because 'union a' was in global index.

Cheers,

-- 
Julien Grall

