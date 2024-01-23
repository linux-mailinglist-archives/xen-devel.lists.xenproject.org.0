Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6F8385E0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 04:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670254.1042886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS71U-00060H-EF; Tue, 23 Jan 2024 03:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670254.1042886; Tue, 23 Jan 2024 03:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS71U-0005yi-B6; Tue, 23 Jan 2024 03:00:24 +0000
Received: by outflank-mailman (input) for mailman id 670254;
 Tue, 23 Jan 2024 03:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RKfG=JB=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rS71S-0005yc-ON
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 03:00:22 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89ed8bcf-b99b-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 04:00:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2B05382852F8;
 Mon, 22 Jan 2024 21:00:17 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0nZtAI5wcERK; Mon, 22 Jan 2024 21:00:14 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 71EF98286A0A;
 Mon, 22 Jan 2024 21:00:14 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1yMEF42124QB; Mon, 22 Jan 2024 21:00:14 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 11DC082852F8;
 Mon, 22 Jan 2024 21:00:13 -0600 (CST)
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
X-Inumbo-ID: 89ed8bcf-b99b-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 71EF98286A0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1705978814; bh=6nBjbY/a28HF116novgwbG1DqcXdYEgIhwiDScwEHLY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=MfgzuVG9yw6m8leGAZw4MtoIcskyjmFU/IoJ+Hl7pUuFilgQHL4F2trLlbKKUyxnd
	 ZXrHOFBYG61RgtBJyBkACoBKos4is8aLoAuZJbgG7uBQ+61LBGLlQJZJ9k8pJYp6jf
	 Oaj/Z3NG/6xX/dStHDwZmjOONwrF5OY6WR7fhjOo=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <4378a444-a4dc-4904-9cd9-1e555542ad42@raptorengineering.com>
Date: Mon, 22 Jan 2024 21:00:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH v5 6/8] PPC: switch entry point annotations to
 common model
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <36004375-1398-4f94-b455-8bfdafe0c9d7@suse.com>
 <49798d43-00c8-40e0-bb65-4f5e699c4d76@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <49798d43-00c8-40e0-bb65-4f5e699c4d76@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 1/22/24 7:20 AM, Jan Beulich wrote:
> On 15.01.2024 15:38, Jan Beulich wrote:
>> Use the generic framework in xen/linkage.h. No change in generated code
>> except of course the converted symbols change to be hidden ones.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The other architectures have been at least partly switched; would be nice
> for PPC to follow suit. May I ask for an ack (or otherwise here), please?
>

Sorry for the delay.

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

> Thanks, Jan

Thanks,
Shawn

