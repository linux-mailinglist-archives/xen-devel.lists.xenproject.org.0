Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65DB7FBB00
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643145.1003072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xrt-0005QT-32; Tue, 28 Nov 2023 13:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643145.1003072; Tue, 28 Nov 2023 13:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xrs-0005Oo-Vg; Tue, 28 Nov 2023 13:11:12 +0000
Received: by outflank-mailman (input) for mailman id 643145;
 Tue, 28 Nov 2023 13:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwP9=HJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r7xrr-0005Ob-Cl
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:11:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 970aa59a-8def-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 14:11:06 +0100 (CET)
Received: from [192.168.1.15] (host-82-59-158-146.retail.telecomitalia.it
 [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id E72CF4EE0737;
 Tue, 28 Nov 2023 14:11:05 +0100 (CET)
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
X-Inumbo-ID: 970aa59a-8def-11ee-9b0e-b553b5be7939
Message-ID: <20ad9ab3-1823-48b0-8642-75f8c81f1837@bugseng.com>
Date: Tue, 28 Nov 2023 14:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012
 Rule 8.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
 <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/23 14:00, Jan Beulich wrote:
> On 28.11.2023 10:46, Federico Serafini wrote:
>> Uniform declaration and definition of guest_walk_tables() using
>> parameter name "pfec_walk":
>> this name highlights the connection with PFEC_* constants and it is
>> consistent with the use of the parameter within function body.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> I'm curious what other x86 maintainers think. I for one don't like this,
> but not enough to object if others are happy. That said, there was earlier
> discussion (and perhaps even a patch), yet without a reference I don't
> think I can locate this among all the Misra bits and pieces.
> 

The last thread about guest_walk_tables():

https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02055.html

Do you have any suggestions on how to handle this?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

