Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE83C219E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153513.283621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mrY-0001Sk-EW; Fri, 09 Jul 2021 09:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153513.283621; Fri, 09 Jul 2021 09:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mrY-0001QP-Ap; Fri, 09 Jul 2021 09:32:00 +0000
Received: by outflank-mailman (input) for mailman id 153513;
 Fri, 09 Jul 2021 09:31:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1mrW-0001QJ-IU
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:31:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mrT-0005TG-QF; Fri, 09 Jul 2021 09:31:55 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mrT-0005pj-JM; Fri, 09 Jul 2021 09:31:55 +0000
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
	bh=Cmo8WwFlhuDtDaHoGVbUwDuA69hII1OEqHXWY1b8kxU=; b=vDwA8bh8g0Pj/YIdBQ5SoJJkud
	XXPPkmmnUg+0nI55STdx1e7kvAIO4hPZhXZ0qcLpMzdOnLr4/nLF8B8fbFcG+4Xx4peKydSPBGqz4
	Axy6dVzfi0FdUJ/9M/7RFfp9F6qXbYBWfPHpF9Q3jGcISH4YBmebBQPRP6zua7mOo6Jk=;
Subject: Re: [PATCH v20210701 07/40] tools: create libxensaverestore
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-8-olaf@aepfle.de>
 <20210709112040.2dd4ec8d.olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <cb473d34-7022-74d2-e679-087bf84c26b8@xen.org>
Date: Fri, 9 Jul 2021 10:31:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709112040.2dd4ec8d.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Olaf,

On 09/07/2021 10:20, Olaf Hering wrote:
> Am Thu,  1 Jul 2021 11:56:02 +0200
> schrieb Olaf Hering <olaf@aepfle.de>:
> 
>> Move all save/restore related code
> 
> This is now 6 months old.
> 
> What is blocking approval?

There is already an ack from Wei which should be sufficient for the 
tools part.


But looking at the history of the patch, there seem to have been concern 
from Andrew. Were they resolved?

Cheers,

-- 
Julien Grall

