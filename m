Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2445676EF94
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 18:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576503.902714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbHe-0004Fs-1H; Thu, 03 Aug 2023 16:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576503.902714; Thu, 03 Aug 2023 16:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbHd-0004DP-Ue; Thu, 03 Aug 2023 16:34:41 +0000
Received: by outflank-mailman (input) for mailman id 576503;
 Thu, 03 Aug 2023 16:34:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRbHc-0004DH-Ry
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 16:34:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRbHV-0003rn-Iv; Thu, 03 Aug 2023 16:34:33 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.22.21]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRbHV-00074k-AZ; Thu, 03 Aug 2023 16:34:33 +0000
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
	bh=dvvBXxjniH/IlgE1ej5FHuyiI4F6RPdmj66rQM7XZek=; b=xd7pmytFP9/Dgy0tf8IZUqmY/g
	+jy1eMy/ld8p6q6ODKP4I8OX1RP5bUaVmWRYrndZ7gXvb10apbXICtqfuFXuhjc47Q1S7a3yMrPkQ
	C4E2vtom8ofGCyfdhaJCINuuTrfApqslh3+Mv98PHuz/Ys6y61ehhblCak92Mp04h15o=;
Message-ID: <8074634d-fd76-43fc-8e0f-4c3a70ea5360@xen.org>
Date: Thu, 3 Aug 2023 17:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] Cleanup and splitting of xl.cfg parsing
Content-Language: en-GB
To: Elliott Mitchell <ehem+xen@m5p.com>, Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1690990427.git.ehem+xen@m5p.com>
 <673c6ba4-6d1e-6e51-0da4-fb8996cde4a2@suse.com>
 <ZMvSHuEQzGYyVJ49@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZMvSHuEQzGYyVJ49@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 03/08/2023 17:13, Elliott Mitchell wrote:
> On Thu, Aug 03, 2023 at 10:35:53AM +0200, Jan Beulich wrote:
>>
>> Some of the patches looks to have been posted previously as a 7-patch
>> series. It would have been nice if therefore this one was marked as
>> v2, indicating in a revision log what the differences are. It appears
>> as if at least one out of those 7 earlier patches was dropped (or
>> maybe assimilated into another one).
> 
> Indeed.  Problem is several tags could potentially have been used.
> Should I have used all of them simultaneously?  Should I have used only
> some of them?  Which subset?
> 
> Several were mildly adjusted, so it could have been marked "v2".
> 
> No one responded at all to the previous round, so this could have been
> marked "RESEND".
> 
> Yet the refinements and general changes are large enough for the series
> to be pretty distinct.
> 
> I didn't know which way to go, so with no idea which option to choose the
> last one ended up winning out.  Perhaps that was wrong yet I've still no
> feedback on the actual patches.

Not sure if this is related to the lack of answer. But I didn't receive 
any of your patches via xen-devel (I received your replies). Skimming 
through the bounce for the xenproject mail server, I noticed a lot of 
the following:

     host gmail-smtp-in.l.google.com [142.250.123.26]
     SMTP error from remote mail server after pipelined end of data:
     550-5.7.1 This message is not RFC 5322 compliant. There are 
multiple Cc headers.
     550-5.7.1 To reduce the amount of spam sent to Gmail, this message 
has been
     550-5.7.1 blocked. Please visit
     550 5.7.1 
https://support.google.com/mail/?p=RfcMessageNonCompliant 
t7-20020a81e447000000b005839e8b595dsi12027284ywl.554 - gsmtp

It might be possible that other mail server are not happy with your e-mails.

Cheers,

-- 
Julien Grall

