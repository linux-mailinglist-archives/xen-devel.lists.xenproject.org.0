Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD182A5CFD9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:49:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908956.1315981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5ap-0003iN-0V; Tue, 11 Mar 2025 19:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908956.1315981; Tue, 11 Mar 2025 19:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5ao-0003gS-T2; Tue, 11 Mar 2025 19:48:46 +0000
Received: by outflank-mailman (input) for mailman id 908956;
 Tue, 11 Mar 2025 19:48:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts5am-0003gM-PW
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:48:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts5am-00EhGJ-0T;
 Tue, 11 Mar 2025 19:48:43 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts5al-004faE-2L;
 Tue, 11 Mar 2025 19:48:43 +0000
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
	bh=TJlnoiYYq927Z7VW+GXTZR5cKDu3dweX8iy8nMx8GoA=; b=W2gY1oG+KxlwE83o9NX2eVTnbX
	t8C8Gy7PUJea0wCgXPEWFIjpe6XjJFx3MHqQJ+T3JxMUsUq9TLhhEaTy5R6nAYe5JtblY6ea96Waw
	8sb6POc+8G7oAkjgaInLep6UdUKMHaE5r+rH+Wnp84Alm9FyXDmowOLusaAxl4HTEWWs=;
Message-ID: <08bb0c67-f5c4-401d-be63-5c20d0297b59@xen.org>
Date: Tue, 11 Mar 2025 19:48:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MISRA: Rephrase the deviation for Directive 4.10
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250304235701.2770842-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2503041616560.1303386@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2503041616560.1303386@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/03/2025 00:17, Stefano Stabellini wrote:
> On Tue, 4 Mar 2025, Andrew Cooper wrote:
>> The use of "legitimately" mixes the concepts of "it was designed to do this"
>> and "it was correct to do this".
>>
>> The latter in particular can go stale.  "intended" is a better way of phrasing
>> this.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
 > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Going through my email, I noticed this patch was not committed. I wonder 
if there was any reason?

Cheers,

-- 
Julien Grall


