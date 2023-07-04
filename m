Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D5747851
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 20:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558628.872906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkpE-0001FA-Vu; Tue, 04 Jul 2023 18:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558628.872906; Tue, 04 Jul 2023 18:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkpE-0001D1-TF; Tue, 04 Jul 2023 18:32:32 +0000
Received: by outflank-mailman (input) for mailman id 558628;
 Tue, 04 Jul 2023 18:32:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGkpD-0001Cv-Rp
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 18:32:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkpD-0007iE-Nc; Tue, 04 Jul 2023 18:32:31 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkpD-0007wH-I3; Tue, 04 Jul 2023 18:32:31 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=pNT2RR9wvp4PdfgVu6RKzM4M4/4i0emwdv4EEw+O2U4=; b=q/llBv5OcNNJowFdvFnbExX3CH
	jya9a0xptF1wlPkI1MpAIKmWG+lYw8dgyN42w1rhB4CYF9FKwGe2rPZrue6q8pGqozlSaRCSPW10Q
	ETZqI5nzSvyFt3xilM5ItL4HnAOQY2ZuoSaf8ukgLvb5AsFb2AHWCdsMB88GpD8CiESY=;
Message-ID: <8de632d2-405c-22b7-91b7-62294c399401@xen.org>
Date: Tue, 4 Jul 2023 19:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [v2 0/4] xen/arm: Enable USBAN support
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>
References: <20230629201129.12934-1-julien@xen.org>
In-Reply-To: <20230629201129.12934-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 29/06/2023 21:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> At the moment, we are not able to enable UBSAN on Arm because the
> final binary will be over the maximum size of Xen we currently support
> (i.e. 2MB).
> 
> This patch series aim to lift the restrictions and also
> enable UBSAN.
> 
> Cheers,
> 
> Julien Grall (4):
>    xen/arm64: head: Don't map too much in boot_third
>    xen/arm32: head: Don't map too much in boot_third
>    xen/arm: Rework the code mapping Xen to avoid relying on the size of
>      Xen
>    xen/arm: Allow the user to build Xen with UBSAN

This is now committed.

Cheers,

-- 
Julien Grall

