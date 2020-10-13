Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626FD28CFDC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6240.16610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKyo-0007y4-1a; Tue, 13 Oct 2020 14:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6240.16610; Tue, 13 Oct 2020 14:08:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKyn-0007xN-ST; Tue, 13 Oct 2020 14:08:41 +0000
Received: by outflank-mailman (input) for mailman id 6240;
 Tue, 13 Oct 2020 14:08:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKym-0007ui-1y
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:08:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 200bb103-3998-41cb-acfe-aa9ca0001b9a;
 Tue, 13 Oct 2020 14:08:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6479AB91;
 Tue, 13 Oct 2020 14:08:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKym-0007ui-1y
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:08:40 +0000
X-Inumbo-ID: 200bb103-3998-41cb-acfe-aa9ca0001b9a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 200bb103-3998-41cb-acfe-aa9ca0001b9a;
	Tue, 13 Oct 2020 14:08:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602598118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V2ewon66P2AXLDQsu1m/9tHwbMDilURFx1wdY+w44lo=;
	b=JDX1LPwFnA5ENuASYK1ZszjirCDSAzCWLQLCfq+Zwq2Z90FN/TRbgr+c3G+/oDE+8Bd93v
	J0yzTAr9RwNt8gnN5gg+PGV2Xag3FliLFI38NSkpxejPvozAar9lG98WMhpe/yjqbSiumT
	Llxg4noW+3QUSfTRs8uFSfclBPPF1hQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E6479AB91;
	Tue, 13 Oct 2020 14:08:37 +0000 (UTC)
Subject: Re: [PATCH] x86/ucode/intel: Improve description for gathering the
 microcode revision
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201012142523.17652-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88b98c29-e948-739c-230c-165019b1656f@suse.com>
Date: Tue, 13 Oct 2020 16:08:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012142523.17652-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.10.2020 16:25, Andrew Cooper wrote:
> Obtaining the microcode revision on Intel CPUs is complicated for backwards
> compatibility reasons.  Update apply_microcode() to use a slightly more
> efficient CPUID invocation, now that the documentation has been updated to
> confirm that any CPUID instruction is fine, not just CPUID.1
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


