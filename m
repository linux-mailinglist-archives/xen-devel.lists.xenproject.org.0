Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B07FC910
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 23:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643570.1003912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r86Ee-00038k-RO; Tue, 28 Nov 2023 22:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643570.1003912; Tue, 28 Nov 2023 22:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r86Ee-00036p-OV; Tue, 28 Nov 2023 22:07:16 +0000
Received: by outflank-mailman (input) for mailman id 643570;
 Tue, 28 Nov 2023 22:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r86Ed-0002z7-OI
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 22:07:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c99b6b5-8e3a-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 23:07:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E68D182857FE;
 Tue, 28 Nov 2023 16:07:13 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1jsdbtL7mJsg; Tue, 28 Nov 2023 16:07:13 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2EA7C8285803;
 Tue, 28 Nov 2023 16:07:13 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TQm_Y3AktP88; Tue, 28 Nov 2023 16:07:12 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 7623882857FE;
 Tue, 28 Nov 2023 16:07:12 -0600 (CST)
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
X-Inumbo-ID: 7c99b6b5-8e3a-11ee-98e3-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2EA7C8285803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701209233; bh=B71guaLwFWYA8HCV6pT3CKzlhpTZehOZGb6yicRkDa4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=jqFot0PuLCqYXk9uDeTu6ya4Q6QBvracgJjBx1bjlOJxuGIijkuzsq3Lri37rbyvf
	 hUL+XUIhm7FIsMmrJhuL1Mon/4nSbWidL3U1UO2Fwmfv//E//AwZPai8MXAb73Dn94
	 6D+0MSnyRg6yH3sYRJSPk7X11rS9I189oTe3xfwA=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <83084425-8972-44dc-b4e7-543ad1cd7343@raptorengineering.com>
Date: Tue, 28 Nov 2023 16:07:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/14] xen/asm-generic: introduce generic div64.h
 header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <adc8456bd3c5574491f78ac7f8ce7934d359d005.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <adc8456bd3c5574491f78ac7f8ce7934d359d005.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> All archs have the do_div implementation for BITS_PER_LONG == 64
> so do_div64.h is moved to asm-generic.
> 
> x86 and PPC were switched to asm-generic version of div64.h.
>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

