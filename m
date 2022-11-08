Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD0621902
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440249.694370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osR4m-0007lx-A6; Tue, 08 Nov 2022 16:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440249.694370; Tue, 08 Nov 2022 16:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osR4m-0007jj-6v; Tue, 08 Nov 2022 16:03:48 +0000
Received: by outflank-mailman (input) for mailman id 440249;
 Tue, 08 Nov 2022 16:03:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1osR4k-0007jd-RI
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:03:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osR4j-0002Ml-Pw; Tue, 08 Nov 2022 16:03:45 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[192.168.3.98])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osR4j-0004Ep-3p; Tue, 08 Nov 2022 16:03:45 +0000
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
	bh=P2tQQCRvFEdY5Q/mLZhIiLMSq4xMhalYoAwQJ/gB4yc=; b=gbFzR8WRF6jSIDrSDY2kGXKI2y
	GUkKwDQ4G0GfNdjksgv3LNMHkzeKSGLXKc3QD5n8Z2ZY1pX8/C3ro9BJQ6rj5F0XPNTzajbUopvjz
	LX+RVMng6582HPJ37LBP8IOikNj/NAfgSpIPdarGtsL715Z8X752CFo3+OgbhHgD0RD0=;
Message-ID: <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
Date: Tue, 8 Nov 2022 16:03:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/11/2022 15:33, Edwin Török wrote:
> See CODING_STYLE: Xen uses spaces, not tabs.
> 
> * OCaml code:
> 
> Using `ocp-indent` for now to just make minimal modifications in
> tabs vs spaces and get the right indentation.
> We can introduce `ocamlformat` later.
> 
> * C stubs:
> 
> just replace tabs with spaces now, using `indent` or `clang-format`
> would change code too much for 4.17.
> 
> This avoids perpetuating a formatting style that is inconsistent with
> the rest of Xen, and that makes preparing and submitting patches more
> difficult (OCaml indentation tools usually only support spaces, not tabs).
> 
> Contains a bugfix for `abi-check` script to handle the change in the
> amount of whitespace.
> 
> No functional change.
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> 
> --
> Reason for inclusion in 4.17:
> - makes it easier to backport changes from master to 4.17

Right, but you will have the problem when backporting to 4.16 and older. 
So the overhead will always be there for a couple of years.

> - avoid perpetuating a different coding style (I thought tabs were
>    mandated by Xen, and was about to fix up my editor config to match
>    when I realized Xen already mandates the use of spaces)
> - should make submitting patches for OCaml easier (OCaml indentation
>    tools know only about spaces, so I either can't use them, or have to
>    manually adjust indentation every time I submit a patch)
> - it can be verified that the only change here is the Makefile change
>    for the new rule, 'git log -p -1 -w' should be otherwise empty

While I understand the goal and support, this seems to be a bit too late 
to do it in Xen 4.17 (we are only a couple of weeks away). At this stage 
of the release we should only do bug fix.

This is clearly only a comesmetic change and there I would argue this 
should be deferred to 4.18. That said the last call is from the RM.

Cheers,

-- 
Julien Grall

