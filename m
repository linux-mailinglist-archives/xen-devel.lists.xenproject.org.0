Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D015B7849E6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 21:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588669.920233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYWgs-0002Ms-JG; Tue, 22 Aug 2023 19:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588669.920233; Tue, 22 Aug 2023 19:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYWgs-0002KO-G7; Tue, 22 Aug 2023 19:05:22 +0000
Received: by outflank-mailman (input) for mailman id 588669;
 Tue, 22 Aug 2023 19:05:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYWgq-0002KI-RO
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 19:05:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYWgq-00043L-Er; Tue, 22 Aug 2023 19:05:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYWgq-0002mm-7v; Tue, 22 Aug 2023 19:05:20 +0000
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
	bh=58vE52QJ2EmlGKKcYp+KPAndaIMScQeRiP+D+lLE4Ag=; b=6ePgxSxZTKr0rjxfIffdtJHMaP
	LDFH0yJeVArQNmtSj+Gi12pijA3YW9bTW2eqytAleb/EfAjSGaGrw7bLioQULQguudCrHrBkIOvDb
	/zGnBqvla80pZxfjhmCrCfyPwtUJ7YTUbTAIskAacBT6fsngCEi2tuIVrJvgIDPD2byk=;
Message-ID: <90fcd05a-3b89-401d-8321-7f792b3fa52c@xen.org>
Date: Tue, 22 Aug 2023 20:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 04/19] common/device_tree: Export
 __unflatten_device_tree()
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-5-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-5-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Following changes are done to __unflatten_device_tree():
>      1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>      2. Remove __init and static function type.
> 
> The changes are done to make this function useable for dynamic node programming
> where new device tree overlay nodes are added to fdt and further unflattend to
> update xen device tree during runtime.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

It is not clear to me whether you saw my reply about using ERR_PTR() as 
I can't find an answer.

Anyway, I am not against this interface:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

