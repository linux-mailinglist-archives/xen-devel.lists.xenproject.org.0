Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5FC1BEAA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 17:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152951.1483448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8ff-0002Co-L5; Wed, 29 Oct 2025 16:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152951.1483448; Wed, 29 Oct 2025 16:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8ff-0002BC-IF; Wed, 29 Oct 2025 16:05:11 +0000
Received: by outflank-mailman (input) for mailman id 1152951;
 Wed, 29 Oct 2025 16:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U31q=5G=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vE8fe-0002B6-6F
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 16:05:10 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a3edf17-b4e1-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 17:05:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C6A98779070E;
 Wed, 29 Oct 2025 11:05:07 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Yx97adz-WRUd; Wed, 29 Oct 2025 11:05:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1BC817790717;
 Wed, 29 Oct 2025 11:05:07 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U55PUZrAEqGH; Wed, 29 Oct 2025 11:05:07 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F19EB779070E;
 Wed, 29 Oct 2025 11:05:06 -0500 (CDT)
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
X-Inumbo-ID: 0a3edf17-b4e1-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1BC817790717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761753907; bh=hIuuevtjoRG6683Bb6Uibcw6e08U4IN2Bg6m1N/XZ00=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Dh6J4ZnasTMHYy50lSkECIErKyptK0EnN4wtNdNeIoRGU9aOh8G2T8k0qlFubkqo1
	 bVa3dw/64EM1ArZvBAzEgzwVAHZi7KuI9WUGzcvjLEuWR6LBIdV8fKxoeP4nZKSicq
	 7HL2iYU59/IIhEmhpi61S/pnOx9npsd3NkEMpvI0=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 29 Oct 2025 11:05:03 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1606518270.4741.1761753903655.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <45cb7914-5875-4bdc-a5ee-80c2093dff84@suse.com>
References: <1094743618.4119.1761694133918.JavaMail.zimbra@raptorengineeringinc.com> <45cb7914-5875-4bdc-a5ee-80c2093dff84@suse.com>
Subject: Re: [PATCH] xen/ppc: Fix tooling FTBFS due to missing definitions
 in public header
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: xen/ppc: Fix tooling FTBFS due to missing definitions in public header
Thread-Index: NMmV+mSK9hUa1L/097StWJNj4y6iFA==



----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>
> Sent: Wednesday, October 29, 2025 2:59:11 AM
> Subject: Re: [PATCH] xen/ppc: Fix tooling FTBFS due to missing definitions in public header

> On 29.10.2025 00:28, Timothy Pearson wrote:
>> int64_aligned_t and uint64_aligned_t need to be exposed when the GNU C compiler
>> is in use.
>> ---
>>  xen/include/public/arch-ppc.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> However, first of all this needs your own S-o-b.
> 
> Jan

My apologies for that.  Was getting a new development box set up for Xen and somehow missed that on the first two patches.

