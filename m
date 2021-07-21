Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EC33D11A6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 16:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159421.293253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Da8-00047v-OS; Wed, 21 Jul 2021 14:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159421.293253; Wed, 21 Jul 2021 14:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Da8-000457-LJ; Wed, 21 Jul 2021 14:52:20 +0000
Received: by outflank-mailman (input) for mailman id 159421;
 Wed, 21 Jul 2021 14:52:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6Da7-00044z-3v
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:52:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6Da6-0004Fr-So; Wed, 21 Jul 2021 14:52:18 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6Da6-0002MD-My; Wed, 21 Jul 2021 14:52:18 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=AznePrvq1wt9psdqNXzZagun1f44uMbzKeaE/aLPVm0=; b=2ZD3+z1b3C/3gtn5sQj3sRktwq
	KLcdg02zm8r2/QOBxduaKux9NbOoVqN1nT13nFuUNwdy0nF/MNoKrafUnVMDAYh97Cc3H5vYAr9jx
	AfiAhiRe80UfHklr4TiYxlmdHWNkU6QN+oKpzA2pw593L9v1zLWCtzqD20txNjkUR9f8=;
Subject: Re: [PATCH RESEND 0/2] gitlab-ci: add a qemu-based arm32 test
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: cardoe@cardoe.com, wl@xen.org, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2107131747070.23286@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2107201248360.3916@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <64aa4aa6-0c6e-76c9-5d9b-5e2c81cc4120@xen.org>
Date: Wed, 21 Jul 2021 15:52:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2107201248360.3916@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 20/07/2021 20:48, Stefano Stabellini wrote:
> Re-ping?

Interestingly the patches were not threaded (in-reply-to seems to be 
missing in the headers), so I had to look them up by subject to find them.

Anyway, I have looked at patch #2 and provided some feebdack. The first 
patch #1 looks fine.

Cheers,

-- 
Julien Grall

