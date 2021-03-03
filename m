Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C832B9FF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92979.175456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHWUr-0008W7-G4; Wed, 03 Mar 2021 18:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92979.175456; Wed, 03 Mar 2021 18:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHWUr-0008Vi-Cp; Wed, 03 Mar 2021 18:45:21 +0000
Received: by outflank-mailman (input) for mailman id 92979;
 Wed, 03 Mar 2021 18:45:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lHWUq-0008Vd-AM
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 18:45:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHWUo-0006gi-8a; Wed, 03 Mar 2021 18:45:18 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHWUn-0007Xc-UD; Wed, 03 Mar 2021 18:45:18 +0000
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
	bh=aoDhiAAJ9xQuzM22SyJNcyS6Wir5HYSXnKHllgaD5fs=; b=0ChI2jp9Prlz9AtiG6ObhWFAz4
	q0z244vak/VIy/x8S/4w4mgdF608R9dZKuCTDV673DJjuKuZ3juzjfR1LX4nu69bUn4bDRHKqmGgI
	yq48Vr+4fC5F8bPZx7biIGoNbCKx9PKKS/KKHfrBF1pDUp0oY40k8TUT0Fy4F9NJLCxo=;
Subject: Re: [PATCH XENSTORE v1 00/10] Code analysis fixes
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>,
 Michael Kurth <mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
From: Julien Grall <julien@xen.org>
Message-ID: <5ec05aca-9ba5-74b3-154a-603b06d307cf@xen.org>
Date: Wed, 3 Mar 2021 18:45:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Norbert,

Thank you for the patches. Please find below a state for each patches.

On 26/02/2021 14:41, Norbert Manthey wrote:

For the following patches:

>    xenstore: add missing NULL check
>    xenstore: fix print format string
 >    xenstore: check formats of trace
 >    xenstore: handle do_mkdir and do_rm failure
 >    xenstore: add missing NULL check
 >    xs: add error handling

They are fully reviewed and Ian provided a release-acked-by. So I have 
merged them to staging.

Note that last one was merged with the commit message/title tweaked.

For the following patches:

>    xenstore_client: handle memory on error
>    xenstore: handle daemon creation errors

They are fully reviewed but so far Ian didn't provided a 
release-acked-by. If you (or someone else) think they should be merged, 
then please reply on each patch.

For now, I have merged them to my for-next/4.16 branch [1]. The patches 
will be folded in staging when the tree is re-opened.

For the following patch:

>    xenstored: handle port reads correctly

IIUC, this was dropped.

For the following patch:

>    xs: handle daemon socket error

Ian had one question about it. I haven't committed it in any branch for now.

Cheers,

[1] 
https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.16

-- 
Julien Grall

