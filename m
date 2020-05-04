Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D230B1C35D0
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 11:31:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVXRG-00077k-AQ; Mon, 04 May 2020 09:31:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wWN=6S=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jVXRE-00077f-My
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 09:31:00 +0000
X-Inumbo-ID: f713ef24-8de9-11ea-9d08-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f713ef24-8de9-11ea-9d08-12813bfff9fa;
 Mon, 04 May 2020 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dVV/KySiOy8F9WzYMxS64Du6ppmq4y7ol7TvltUJI18=; b=Zfo+VtODjNAFquLlUz65ax6Edv
 lowhOGNSLf/OIWdh2/vvuYkEs3dMLssqVrVfbrqjfm1nacdbr0z3vKOOlhxvhpn2ESbKY+035Fi6P
 axxx1IGO2nMSqAIpqKY2vrMADhrFhQ6K525njV4nk7ooY+OAfKAcxwjo9ELFpZgLGkYA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jVXRB-0004gi-PF; Mon, 04 May 2020 09:30:57 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jVXRB-0004Nt-Hm; Mon, 04 May 2020 09:30:57 +0000
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Jan Beulich <jbeulich@suse.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <548a9fc5-c251-5d8b-d297-4788d60b801d@xen.org>
 <36944bda-14a8-0134-cd1d-1f08becb28b0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <898479ac-fd5c-48f4-28cb-8bbb2dc60d83@xen.org>
Date: Mon, 4 May 2020 10:30:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <36944bda-14a8-0134-cd1d-1f08becb28b0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 04/05/2020 10:18, Jan Beulich wrote:
> On 30.04.2020 17:35, Julien Grall wrote:
>> On 30/04/2020 15:50, Jan Beulich wrote:
>>> On 30.04.2020 16:25, Julien Grall wrote:
>>>> EXPERT mode is currently used to gate any options that are in technical
>>>> preview or not security supported At the moment, the only way to select
>>>> it is to use XEN_CONFIG_EXPERT=y on the make command line.
>>>>
>>>> However, if the user forget to add the option of one of the make
>>>> command (even a clean), then .config will get rewritten. This may lead
>>>> to a rather frustrating experience as it is difficult to diagnostic the
>>>> issue.
>>>
>>> Is / will this still be true after Anthony's rework of the build
>>> system? Right now we already have
>>>
>>> clean-targets := %clean
>>> no-dot-config-targets := $(clean-targets) \
>>>                            ...
>>
>> I haven't tried Anthony's rework yet. But I guess the problem would
>> be the same if you forget to add XEN_CONFIG_EXPERT=y on make.
> 
> Why? xen/.config would get re-written only if kconfig got run in
> the first place. It is my understanding that no-dot-config-targets
> exist to avoid including .config, and as a result make won't find
> a need anymore to cause it to re-made if out of date.

kconfig may be executed because you change one of the */Kconfig file. So 
if you happen to forget XEN_CONFIG_EXPERT=y on your build command line, 
then you will have your .config rewritten without expert options.

Cheers,

-- 
Julien Grall

