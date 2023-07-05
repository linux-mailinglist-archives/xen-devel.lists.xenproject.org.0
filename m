Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48008748782
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559295.874168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH48x-0007pO-9p; Wed, 05 Jul 2023 15:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559295.874168; Wed, 05 Jul 2023 15:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH48x-0007mx-6I; Wed, 05 Jul 2023 15:10:11 +0000
Received: by outflank-mailman (input) for mailman id 559295;
 Wed, 05 Jul 2023 15:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yom7=CX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qH48w-0007mr-A1
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:10:10 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0600d908-1b46-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 17:10:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 32B438285804;
 Wed,  5 Jul 2023 10:10:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RYmcS1xxnvJl; Wed,  5 Jul 2023 10:10:03 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D9DA18285880;
 Wed,  5 Jul 2023 10:10:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kT4MQj9Us6Z8; Wed,  5 Jul 2023 10:10:03 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9686A8285804;
 Wed,  5 Jul 2023 10:10:03 -0500 (CDT)
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
X-Inumbo-ID: 0600d908-1b46-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D9DA18285880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1688569803; bh=y3GXWOyjTGt1PcKeTkzWiswVTfpkERibBOjx7VBKEx8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=V5igoIOukjWAaC+jBVy8Agzp5Z/nZNTh0q1kqwEKe1Fsa7zszktYcc8vHQZSsKTIE
	 AvKPKhJ20A27FbvfoiRvcMvplo5R+ypkYK7hxXXoTJ+n+kyOuGzhn67MNqpToCjk3Q
	 oVlC0m69UaLQCsrRSpKqpIGena6NG6rEvOjrmfPw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <4725795c-3f0e-af91-5683-1059ba6163c9@raptorengineering.com>
Date: Wed, 5 Jul 2023 10:10:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ppc: make also linking work with big-endian tool chain
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f56a208f-97d1-b7ec-afad-3b7bc180cf87@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <f56a208f-97d1-b7ec-afad-3b7bc180cf87@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/5/23 9:44 AM, Jan Beulich wrote:
> Telling just the compiler to produce little-endian objects isn't enough.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/ppc/arch.mk
> +++ b/xen/arch/ppc/arch.mk
> @@ -7,6 +7,8 @@ ppc-march-$(CONFIG_POWER_ISA_3_00) := po
>  CFLAGS += -m64 -mlittle-endian -mcpu=$(ppc-march-y)
>  CFLAGS += -mstrict-align -mcmodel=large -mabi=elfv2 -mno-altivec -mno-vsx
>  
> +LDFLAGS += -m elf64lppc

Looking around, it seems GNU ld also has a -EL flag:

  -EL Link little-endian objects.  This affects the default output format.

Linux's build system passes both -EL and -m elf64lppc, though I'm
wondering if -EL alone would be enough.

In any case, this doesn't break the build with my ppc64le toolchain, so
if this fixes issues you're seeing with BE toolchains then it's fine
with me.

>  # TODO: Drop override when more of the build is working
>  override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
>  override ALL_LIBS-y =

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>


