Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819A14AE2F0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 22:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268707.462656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHXid-0001Wo-71; Tue, 08 Feb 2022 21:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268707.462656; Tue, 08 Feb 2022 21:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHXid-0001Uv-2j; Tue, 08 Feb 2022 21:08:11 +0000
Received: by outflank-mailman (input) for mailman id 268707;
 Tue, 08 Feb 2022 21:08:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHXib-0001Up-AS
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 21:08:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHXia-0000nr-Mu; Tue, 08 Feb 2022 21:08:08 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHXia-0000eE-GY; Tue, 08 Feb 2022 21:08:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ZA0Yumw2p88tKW3QSl0D0zi8Lgr8pGY9euujCfeNgN4=; b=D2OxKqufv7XqzvuN8b8W1B++Mw
	Aaje47CsFOoDVnOXKVG3ZjfqaT5SWrAqhz5KSxKGZ58RG2WOV2gt7KWqKU9GfbgTeht0EFKDjDFMm
	fzyZIDJ5Vi9iQblYwia+kFiDqnkpT428i/e+ztPCQm985nn5ws9A3k6scRUdyen3juL8=;
Message-ID: <fd95273c-d3cd-2b1a-6683-78ade82dd14c@xen.org>
Date: Tue, 8 Feb 2022 21:08:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN PATCH v9 24/30] build: grab common EFI source files in arch
 specific dir
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-25-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220125110103.3527686-25-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/01/2022 11:00, Anthony PERARD wrote:
> Rather than preparing the efi source file, we will make the symbolic
> link as needed from the build location.

It is not a request for this series. I have started to look a bit more 
how the EFI code work on Arm and I was wondering why we are using 
symbolic here?

IOW, why wouldn't it be fine to build the "common" and "arch" specific 
bit (if any) separately and then assemble them?

Cheers,


-- 
Julien Grall

