Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2D947C90
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 16:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772189.1182621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sayQB-0007fz-P6; Mon, 05 Aug 2024 14:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772189.1182621; Mon, 05 Aug 2024 14:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sayQB-0007dH-MU; Mon, 05 Aug 2024 14:10:47 +0000
Received: by outflank-mailman (input) for mailman id 772189;
 Mon, 05 Aug 2024 14:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyDJ=PE=decay.netherworld.org=mag@srs-se1.protection.inumbo.net>)
 id 1sayQA-0007dB-K6
 for xen-devel@lists.xen.org; Mon, 05 Aug 2024 14:10:46 +0000
Received: from sinister.netherworld.org (sinister.netherworld.org
 [38.100.53.3]) by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 80ad457b-5334-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 16:10:44 +0200 (CEST)
Received: from decay.netherworld.org (decay.netherworld.org [192.168.6.20])
 by sinister.netherworld.org (8.17.1/8.17.1) with ESMTP id 475EAggB020711;
 Mon, 5 Aug 2024 10:10:42 -0400
Received: from decay.netherworld.org (localhost [127.0.0.1])
 by decay.netherworld.org (8.17.1/8.17.1) with ESMTP id 475EAgQt021863;
 Mon, 5 Aug 2024 10:10:42 -0400
Received: (from mag@localhost)
 by decay.netherworld.org (8.17.1/8.17.1/Submit) id 475EAguK021862;
 Mon, 5 Aug 2024 10:10:42 -0400
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
X-Inumbo-ID: 80ad457b-5334-11ef-8776-851b0ebba9a2
Date: Mon, 5 Aug 2024 10:10:42 -0400 (EDT)
From: "John E. Krokes" <mag@netherworld.org>
To: Jan Beulich <jbeulich@suse.com>
cc: xen-devel@lists.xen.org
Subject: Re: [BUG] incorrect "help" output
In-Reply-To: <8e25bb26-2356-43a3-a479-6a679c6577c5@suse.com>
Message-ID: <7c7499df-b87f-7c77-e534-ac713b50f9ef@decay.netherworld.org>
References: <c79f8028-6c34-0e25-1445-79e5bcb93890@decay.netherworld.org> <8e25bb26-2356-43a3-a479-6a679c6577c5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 5 Aug 2024, Jan Beulich wrote:

> On 04.08.2024 15:18, John E. Krokes wrote:
>> Here's a simple and obvious mistake:
>>
>>
>> ~> xl help | grep vsnd
>>   vsnd-attach         Create a new virtual sound device
>>   vsnd-list           List virtual display devices for a domain
>>   vsnd-detach         Destroy a domain's virtual sound device
>>   ~>
>>
>>
>> I'm pretty sure vsnd-list should say "sound devices" instead of
>> "display devices". The problem is in tools/xl/xl_cmdtable.c.
>
> Would you mind sending a patch (against the current staging tree)?
>
> Jan
>
>

I am preparing to send it now.

This is my first time actually using git for anything. I believe I have
complied with all of the requirements and used all of the right tools.
I apologize if I am wrong about that.

-Mag

