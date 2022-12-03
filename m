Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9CB641953
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 23:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452860.710669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1afN-00045c-DZ; Sat, 03 Dec 2022 22:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452860.710669; Sat, 03 Dec 2022 22:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1afN-00042s-A2; Sat, 03 Dec 2022 22:07:25 +0000
Received: by outflank-mailman (input) for mailman id 452860;
 Sat, 03 Dec 2022 22:07:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1afL-00042m-5U
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 22:07:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1afK-00050y-QD; Sat, 03 Dec 2022 22:07:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1afK-0006Ts-IY; Sat, 03 Dec 2022 22:07:22 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=Zaosgh8/6BsZMbj6bPPQOwY+pHUFlzWVCVcHwYDQKsk=; b=vOfcj3NQwBMWKOd+Yk5chk9xkZ
	qcfebwjnj4zIA3C9qLOU1gv/qlD8FquJk/dC/9eUTYgxWpnx4cz757HwYbAzs9JSeyJmNA4lUOtha
	MX/8fVvkJcAGj1CBY6+jkrMJ+B+n3X0Jk2PCZDWK43am5PtiP8QcDThw9HqF0g9zml3o=;
Message-ID: <849cf3a4-e7b2-f555-d759-978170088a54@xen.org>
Date: Sat, 3 Dec 2022 22:07:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 01/12/2022 16:02, Rahul Singh wrote:
> This patch series is sent as RFC to get the initial feedback from the
> community. This patch series consists of 21 patches which is a big number for
> the reviewer to review the patches but to understand the feature end-to-end we
> thought of sending this as a big series. Once we will get initial feedback, we
> will divide the series into a small number of patches for review.

 From the cover letter, it is not clear to me what sort of input you are 
expecting for the RFC. Is this about the design itself?

If so, I think it would be more helpful to write an high level document 
on how you plan to emulate the vIOMMU in Xen. So there is one place to 
read/agree/verify rather than trying to collate all the information from 
the 20+ patches.

Briefly skimming through I think the main things that need to be 
addressed in order of priority:
   - How to secure the vIOMMU
   - 1 vs multiple vIOMMU

The questions are very similar to the vITS because the SMMUv3 is based 
on a queue. And given you are selling this feature as a security one, I 
don't think we can go forward with the review without any 
understanding/agreement on what needs to be implemented in order to have 
a safe/secure vIOMMU.

Cheers,

-- 
Julien Grall

