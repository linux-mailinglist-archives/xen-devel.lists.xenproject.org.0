Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9168D7EB92F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 23:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633304.988024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31fO-00074m-9V; Tue, 14 Nov 2023 22:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633304.988024; Tue, 14 Nov 2023 22:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31fO-00071y-5i; Tue, 14 Nov 2023 22:13:54 +0000
Received: by outflank-mailman (input) for mailman id 633304;
 Tue, 14 Nov 2023 22:13:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r31fM-00071s-Ip
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 22:13:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r31fM-0000Qi-59; Tue, 14 Nov 2023 22:13:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r31fL-0007dp-Rx; Tue, 14 Nov 2023 22:13:52 +0000
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
	bh=M/4nKc+M+LXtLRIpeurrSTssxox1I3awedw0XjUfciU=; b=OI3vvx00ppoBqV/PJj8rsh+moE
	Arpj0fH+afffnpnMksj3pZEM0/0DOjGqDGBFLLqBGPy16pRYwdwVW9OUj5vl5LZSFRuZ196kJd6vn
	NZsUK9d4OK5Xy9eMyh3d5qQQhoh1eNYAHJWgcX+TiXsENKWFSwO8Pa5xLhLUedTfPVYc=;
Message-ID: <b0951c7a-dfff-479d-b33a-32b0f58cb00f@xen.org>
Date: Tue, 14 Nov 2023 22:13:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 2/2] docs/misra: add guidance on the format of Dir
 4.1 docs for ECLAIR
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com>
 <c2ca76c67bfeaf1fab106af4bda6d6107e722208.1699975581.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c2ca76c67bfeaf1fab106af4bda6d6107e722208.1699975581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 14/11/2023 15:36, Nicola Vetrini wrote:
> Additional guidance on the formatting of the document for ECLAIR
> is supplied.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

