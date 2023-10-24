Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE57D55EF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622109.969320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJEM-0007nk-Tz; Tue, 24 Oct 2023 15:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622109.969320; Tue, 24 Oct 2023 15:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJEM-0007m5-RH; Tue, 24 Oct 2023 15:22:06 +0000
Received: by outflank-mailman (input) for mailman id 622109;
 Tue, 24 Oct 2023 15:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urDo=GG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qvJEL-0007lz-SQ
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:22:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15da5a4d-7281-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 17:22:03 +0200 (CEST)
Received: from [192.168.1.15] (host-95-247-204-25.retail.telecomitalia.it
 [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 1CE7F4EE0742;
 Tue, 24 Oct 2023 17:22:03 +0200 (CEST)
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
X-Inumbo-ID: 15da5a4d-7281-11ee-9b0e-b553b5be7939
Message-ID: <91821158-66ff-4c4e-b117-9b7f0f17eb10@bugseng.com>
Date: Tue, 24 Oct 2023 17:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] xen/automation: add deviations for MISRA C:2012 Rule
 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <565552f9e7cfff56fb1d1037cfa9662a1818c5d3.1698153310.git.federico.serafini@bugseng.com>
 <4019825c-3307-8e0d-63f2-22d651a7ca32@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <4019825c-3307-8e0d-63f2-22d651a7ca32@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/23 16:32, Jan Beulich wrote:
> On 24.10.2023 15:22, Federico Serafini wrote:
>> Update ECLAIR configuration to deviate Rule 8.3 ("All declarations of
>> an object or function shall use the same names and type qualifiers")
>> for the following functions:
>> - set_px_pminfo();
>> - guest_walk_tables_[0-9]+_levels().
>>
>> Update file docs/misra/deviations.rst accordingly.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> I had a discussion with Jan about the reasons behind the choice of parameter
>> name 'walk' for the definitions of functions guest_walk_tables_[0-9]+_levels()
>> and the parameter name 'pfec' for the corresponding declarations.
>> Also for the function set_px_pminfo(), it seems that the parameter names are
>> different on purpose.
> 
> In this latter case I wonder why you think so. Did I end up making a
> misleading comment anywhere? It looks to me as if naming the parameter
> in question "perf" uniformly would be quite okay.
> 
> Jan

No, it was just my impression.
What about the mismatch on the first parameter "acpi_id" vs "cpu"?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

