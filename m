Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00347CF875
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 14:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619293.964123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRtZ-0000jP-6C; Thu, 19 Oct 2023 12:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619293.964123; Thu, 19 Oct 2023 12:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRtZ-0000hk-2n; Thu, 19 Oct 2023 12:12:57 +0000
Received: by outflank-mailman (input) for mailman id 619293;
 Thu, 19 Oct 2023 12:12:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtRtX-0000he-RY
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 12:12:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtRtW-000713-6q; Thu, 19 Oct 2023 12:12:54 +0000
Received: from [15.248.3.1] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtRtV-00039r-Sh; Thu, 19 Oct 2023 12:12:54 +0000
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
	bh=+DAshfwyuAWm4s/Xxw/yeFbYMvNl6pP8EA5X1K8S4vc=; b=IVbzbb0XXqd38DXAXIdwBQAauO
	YJuXQ5NhFwH3EEculzGcMVv0yJEH4Ah3Fkb/8A4HrJnUJE8sEVbcDahuYXBLoYXhiWixzn/hwiMaY
	vZoTEP+PnWryz2s/T+8oB6Mps/qLAt40I/wjN6oCS2C8Mvk1J6hGRqBtOT7GSzgAdDEA=;
Message-ID: <97eaa9e6-bc4b-4128-9563-cf3647a794c7@xen.org>
Date: Thu, 19 Oct 2023 13:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
 <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
 <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
 <5059771d-3842-4a7c-814d-69388179b246@xen.org>
 <61c20f5d-a324-9ece-2140-4d0c775e193c@suse.com>
 <54ac0161-7302-4190-9c6e-273caa652058@xen.org>
 <04fe316e-bc4f-0df8-7771-5be7ca878297@suse.com>
 <3ce85a73-96ab-41c8-8b90-f3899e771845@xen.org>
 <63392d67-f1af-a53b-59c2-ad4752159726@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <63392d67-f1af-a53b-59c2-ad4752159726@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/10/2023 12:41, Jan Beulich wrote:
> On 19.10.2023 13:27, Julien Grall wrote:
>> that doesn't involve one arch to symlink headers from another arch.
> 
> Whether to use symlinks or #include "../../arch/..." or yet something else is
> a matter of mechanics.

#include "../../arch/../" is pretty much in the same category. This is 
simply hiding the fact they could be in asm-generic.

Anyway, I have shared my view. Let see what the others thinks.

Cheers,

-- 
Julien Grall

