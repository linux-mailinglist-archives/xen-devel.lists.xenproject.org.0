Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592FBA40006
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 20:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894556.1303271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZ1i-0001NV-PJ; Fri, 21 Feb 2025 19:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894556.1303271; Fri, 21 Feb 2025 19:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZ1i-0001Ll-Ml; Fri, 21 Feb 2025 19:49:34 +0000
Received: by outflank-mailman (input) for mailman id 894556;
 Fri, 21 Feb 2025 19:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJx0=VM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tlZ1h-0001Lf-3Y
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 19:49:33 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f60f284d-f08c-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 20:49:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0EFD78286F3D;
 Fri, 21 Feb 2025 13:49:28 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5UWPqfgAmz6P; Fri, 21 Feb 2025 13:49:26 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C0005828730B;
 Fri, 21 Feb 2025 13:49:26 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id W0RVlvDtYPfT; Fri, 21 Feb 2025 13:49:26 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 425168286F3D;
 Fri, 21 Feb 2025 13:49:26 -0600 (CST)
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
X-Inumbo-ID: f60f284d-f08c-11ef-9aa9-95dc52dad729
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C0005828730B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1740167366; bh=VUArGeclCLVk4pSDwM9nqJbEGsokynjq+ZOdNKxce4s=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=P5uq0JV4KwnDnp+3aD9hyMggVbnCRA6HcyEkLChVi+6KN1qXe8cETkRxwLueVxFJA
	 5eh50VBVWF8FW3qzioOQpxd/DIg8p9FGBI4NroWT0JhfK6VWLeJknLS4d4oKkYxWts
	 INCvhUhOk6CtyJx+Ruzjx/pyFWWvUqmEaXosgwwE=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <a6b4533a-b879-4af1-926c-6e8a48ade4b0@raptorengineering.com>
Date: Fri, 21 Feb 2025 13:49:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] [BROKEN] PPC: Activate UBSAN in testing
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>
In-Reply-To: <20250208000256.431883-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 2/7/25 6:02 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> This compiles, but something is up with the console and nothing useful comes
> out.

I tracked this down to ubsan tripping due to an unaligned access in
opal.c, before the serial console is set up. I'll be sending a patch set
soon to the ML with the fix for this to enable ubsan on PPC.

Thanks,
Shawn

