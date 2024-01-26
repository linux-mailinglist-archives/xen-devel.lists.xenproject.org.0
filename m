Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16283E1AB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 19:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672472.1046538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTR6F-0006S2-Ja; Fri, 26 Jan 2024 18:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672472.1046538; Fri, 26 Jan 2024 18:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTR6F-0006Oq-Gg; Fri, 26 Jan 2024 18:38:47 +0000
Received: by outflank-mailman (input) for mailman id 672472;
 Fri, 26 Jan 2024 18:38:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTR6D-0006NS-Rg
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 18:38:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTR6C-0002Qn-29; Fri, 26 Jan 2024 18:38:44 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTR6B-0006uM-Ri; Fri, 26 Jan 2024 18:38:43 +0000
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
	bh=U8thbuNb7KsmRxvGNAnaDv6oaKsASpnP4kKPkdzg+qc=; b=Scs0/7OMbRuQIb1Aa2zOLPHrrR
	CTKvXk98/Ui9NUQGR0UNqscNhhCI/nOoLXA7jRpG66hXEeZXni/+pygqRfkOZV43+hiIDtCsD4zHD
	tEjYW1C/aqbR2C3AB6OiIRATXE6OwK4eCebgNDLJHGXNCPtmyBOc+7Gq2l1k/Ues7jLA=;
Message-ID: <b1138aaa-5bfc-4448-a89a-89ed5be686c7@xen.org>
Date: Fri, 26 Jan 2024 18:38:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/9] x86: don't access x86_cpu_to_apicid[] directly,
 use cpu_physical_id(cpu)
Content-Language: en-GB
To: Krystian Hebel <krystian.hebel@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <705574ddb7f18bae9ed3f60ddf2e4bda02c70388.1699982111.git.krystian.hebel@3mdeb.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <705574ddb7f18bae9ed3f60ddf2e4bda02c70388.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2023 17:49, Krystian Hebel wrote:
> This is done in preparation to move data from x86_cpu_to_apicid[]
> elsewhere.
NIT: I would add "No functional changes intended".

> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

