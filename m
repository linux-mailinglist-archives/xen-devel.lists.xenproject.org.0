Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8477239A536
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 18:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136500.253043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lopmT-0002TX-U7; Thu, 03 Jun 2021 16:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136500.253043; Thu, 03 Jun 2021 16:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lopmT-0002Rf-Pj; Thu, 03 Jun 2021 16:01:13 +0000
Received: by outflank-mailman (input) for mailman id 136500;
 Thu, 03 Jun 2021 16:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=inOg=K5=rmail.be=alien@srs-us1.protection.inumbo.net>)
 id 1lopmS-0002RZ-92
 for xen-devel@lists.xen.org; Thu, 03 Jun 2021 16:01:12 +0000
Received: from mail.rmail.be (unknown [85.234.218.189])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8f0bdedf-8f13-4457-9848-3fca0a8d5009;
 Thu, 03 Jun 2021 16:01:10 +0000 (UTC)
Received: from mail.rmail.be (localhost [127.0.0.1])
 by mail.rmail.be (Postfix) with ESMTP id 9CE5BB14F5A;
 Thu,  3 Jun 2021 18:01:09 +0200 (CEST)
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
X-Inumbo-ID: 8f0bdedf-8f13-4457-9848-3fca0a8d5009
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 03 Jun 2021 18:01:09 +0200
From: AL13N <alien@rmail.be>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
In-Reply-To: <552b4348-1c52-ce6b-9001-a144c7147a7c@suse.com>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
 <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
 <175befe0e853565761e51f07b79c49cf@mail.rmail.be>
 <552b4348-1c52-ce6b-9001-a144c7147a7c@suse.com>
Message-ID: <0100caba62175123c63f0df4749a8c88@mail.rmail.be>
X-Sender: alien@rmail.be
User-Agent: Roundcube Webmail/1.0.9-1.2.mga5

Jan Beulich schreef op 2021-06-01 16:53:
> On 01.06.2021 16:44, AL13N wrote:
>> This mailing list is the correct place for the toolstack too? right?
> 
> Yes.

So, what's the plan to fix this? is the plan to fix the toolstack? or 
put your patch in kernel to kinda workaround it?

Is there a way to make a regression test or unit test or something?

Does anyone have an idea on what patch would cause the regression? that 
patch that I pointed out, could it be that one, or should i look at a 
specific file/line? I can't really just test all of the patches and/or 
combinations. I'm not really at home with the xen code; and my single 
xen server is production, so i can really only test in weekends...

AL13N

