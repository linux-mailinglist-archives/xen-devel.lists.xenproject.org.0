Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D304AD9E0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 14:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268316.462119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQZ4-0004TS-AB; Tue, 08 Feb 2022 13:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268316.462119; Tue, 08 Feb 2022 13:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQZ4-0004R7-6m; Tue, 08 Feb 2022 13:29:50 +0000
Received: by outflank-mailman (input) for mailman id 268316;
 Tue, 08 Feb 2022 13:29:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4202=SX=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nHQZ2-0004R0-Kl
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 13:29:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2ef59a1c-88e3-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 14:29:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64BD02B;
 Tue,  8 Feb 2022 05:29:46 -0800 (PST)
Received: from [10.57.2.83] (unknown [10.57.2.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DB293F70D;
 Tue,  8 Feb 2022 05:29:45 -0800 (PST)
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
X-Inumbo-ID: 2ef59a1c-88e3-11ec-8eb8-a37418f5ba1a
Subject: Re: [PATCH] tools/configure.ac: Replace macro AC_HELP_STRING
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20220201170321.32510-1-michal.orzel@arm.com>
 <Yflwk30RLgUWECFF@perard>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <15a04228-1355-bf76-eb51-cf7124d7a2f9@arm.com>
Date: Tue, 8 Feb 2022 14:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Yflwk30RLgUWECFF@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Anthony.

On 01.02.2022 18:40, Anthony PERARD wrote:
> On Tue, Feb 01, 2022 at 06:03:21PM +0100, Michal Orzel wrote:
>> ... with AS_HELP_STRING as the former is obsolete according
>> to GNU autoconf 2.67 documentation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Thanks,
> 

I can see that this patch has not been yet merged. Can you do it?

Thanks,
Michal

