Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCC62A9096
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 08:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20444.46370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kawO2-0006aF-UH; Fri, 06 Nov 2020 07:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20444.46370; Fri, 06 Nov 2020 07:42:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kawO2-0006Zq-Qo; Fri, 06 Nov 2020 07:42:18 +0000
Received: by outflank-mailman (input) for mailman id 20444;
 Fri, 06 Nov 2020 07:42:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kawO0-0006Zl-NB
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:42:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edbca07d-9012-4a84-9594-82a8bc47a241;
 Fri, 06 Nov 2020 07:42:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 067F0AB8F;
 Fri,  6 Nov 2020 07:42:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kawO0-0006Zl-NB
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:42:16 +0000
X-Inumbo-ID: edbca07d-9012-4a84-9594-82a8bc47a241
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id edbca07d-9012-4a84-9594-82a8bc47a241;
	Fri, 06 Nov 2020 07:42:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604648535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=js1AsC3mAsEOOvyOOoSwTqfwIz5Rff+os2gtk4rgxSs=;
	b=I5BpRiTGt1rQBqY1Is4Ru9lKtuBguYuonOzqmf0k0kR+nGa3XAcbXv3FZFtKnV02QM1stD
	kSkGgszywXbNPxDcJ+8IBfzSkbM09pgDqFSUBbIlLSqFzMYa0/RFsKmKFKVyK+HOnDl0D4
	RLuGD+9nDUVqDbTEQP7jlgfwdeJBPtU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 067F0AB8F;
	Fri,  6 Nov 2020 07:42:15 +0000 (UTC)
Subject: Re: preparations for 4.14.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
References: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
 <alpine.DEB.2.21.2011051753580.2323@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e12e32ca-8d2e-7314-e942-4de77d72ba4a@suse.com>
Date: Fri, 6 Nov 2020 08:42:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011051753580.2323@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.11.2020 02:58, Stefano Stabellini wrote:
> On Wed, 4 Nov 2020, Jan Beulich wrote:
>> the release is due in a couple of weeks time. Please point out
>> backports you find missing from the respective staging branch,
>> but which you consider relevant. (Ian: Please double check
>> there are indeed no tools side backports needed here.)
>>
>> Julien, Stefano, on the Arm side I'd like to ask for
>>
>> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers
>>
>> just like I did when sending the respective 4.13.2 / 4.12.4
>> mail. Is there a particular reason it wasn't put in?
> 
> No, I have just backported 5d45ecabe3c0 and a couple of other fixes.

Thanks.

> Jan, do you think we should backport the following also?
> 
> 8856a914b build: also check for empty .bss.* in .o -> .init.o conversion

Not having it wasn't causing active problems afaict, so it
was more to prevent future issues to put it in place. Did
we gain dependencies on this change which want backporting?

Jan

