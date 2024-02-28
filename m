Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D386B092
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:41:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686626.1068857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKB4-0006hT-Aj; Wed, 28 Feb 2024 13:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686626.1068857; Wed, 28 Feb 2024 13:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKB4-0006fR-7l; Wed, 28 Feb 2024 13:40:54 +0000
Received: by outflank-mailman (input) for mailman id 686626;
 Wed, 28 Feb 2024 13:40:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfKB2-0006eF-IY
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:40:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfKAz-00039Y-UJ; Wed, 28 Feb 2024 13:40:49 +0000
Received: from [15.248.2.225] (helo=[10.45.19.69])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfKAz-0005Jn-MM; Wed, 28 Feb 2024 13:40:49 +0000
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
	bh=SVUINBDj6t3rhaNpNflDWIemUXsHKdOAr0yeyGKyma4=; b=nOgVCfS4SAJ8BQDGglm7YG8mVK
	sbUI4mhhl3I8QvhwwH6cKqK/tfTDOI/mdm7kFykVy0W9PUfGyochlfCT33aWoiT7cH5Gxj/2DCzrP
	HTNHDAOvscui+tulEa1Ln5V4v/wznt3vgH7WMR28R6v7SjiC3c338OvCKX87l5Ks46nw=;
Message-ID: <521a4d3b-8ef1-4449-97bd-1a3d3e0e35ec@xen.org>
Date: Wed, 28 Feb 2024 13:40:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.18.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7dc621a0-924c-499c-86c1-c35ec1f34ec2@suse.com>
 <1f251f2e-91de-4f81-a93c-dcb95746d2e5@xen.org>
 <5a4e8583-7747-4f24-94f0-d040dabb5b04@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5a4e8583-7747-4f24-94f0-d040dabb5b04@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/02/2024 12:58, Jan Beulich wrote:
> On 28.02.2024 12:50, Julien Grall wrote:
>> On 27/02/2024 13:19, Jan Beulich wrote:
>>> All,
>>>
>>> the release is due in two to three weeks. Please point out backports you find
>>> missing from the respective staging branch, but which you consider relevant.
>>
>> For Arm:
>>
>> e11f576650 ("xen/arm: Fix UBSAN failure in start_xen()")
> 
> Which I assume you or Stefano will take care of?

I was expecting Stefano would do it as he did the backports in the past.

Cheers,

-- 
Julien Grall

