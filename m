Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0911773F89
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 18:49:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580116.908418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTPtP-0004Rj-Ua; Tue, 08 Aug 2023 16:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580116.908418; Tue, 08 Aug 2023 16:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTPtP-0004PG-Rz; Tue, 08 Aug 2023 16:49:11 +0000
Received: by outflank-mailman (input) for mailman id 580116;
 Tue, 08 Aug 2023 16:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7Oi=DZ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTPtN-0004PA-LP
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 16:49:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cb120c0-360b-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 18:49:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6204A8285619;
 Tue,  8 Aug 2023 11:49:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vzE_jrHoXU42; Tue,  8 Aug 2023 11:49:04 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A916982856A2;
 Tue,  8 Aug 2023 11:49:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7jmK_WrnR538; Tue,  8 Aug 2023 11:49:04 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 03AD28285619;
 Tue,  8 Aug 2023 11:49:03 -0500 (CDT)
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
X-Inumbo-ID: 7cb120c0-360b-11ee-b280-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A916982856A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691513344; bh=p6+9yv2csDBijRpJzkd92jEcGbqUYM/6By887NKnwKc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=IU1HUA0t8um28VpddkG/oEySeGen62eAG2SyFwDZ30R0c5AVWEFFllY1ccnxuBo11
	 4mKJyRMMNfg0UIfXlApXSwAFef8T/70FgbWQae2uCRy+lZ/u1Z8PdEH3vd2bvaAR5b
	 c0SY4uuIPCVv0LwGkA3QspwJJgtX+Vj7YAHUvFI4=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7e77b8ed-2c0e-b814-6ce2-c6b2cf47bec9@raptorengineering.com>
Date: Tue, 8 Aug 2023 11:49:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/9] xen/common: Add missing #includes treewide
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <2c9eb4fc175a1bdd21293f2e2611d8e21991636d.1691016993.git.sanastasio@raptorengineering.com>
 <af751f31-5e8d-2b1d-e878-148e08d9264b@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <af751f31-5e8d-2b1d-e878-148e08d9264b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/23 10:39 AM, Jan Beulich wrote:
> On 03.08.2023 01:02, Shawn Anastasio wrote:
>> A few files treewide depend on defininitions in headers that they
>> don't include. This works when arch headers end up including the
>> required headers by chance, but broke on ppc64 with only minimal/stub
>> arch headers.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> I'm okay with the changes in principle, but I'd like to ask a question
> nevertheless, perhaps also for other REST maintainers (whom you should
> have Cc-ed, btw) to chime in.
> 
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -28,6 +28,7 @@
>>  #include <asm/current.h>
>>  #include <asm/hardirq.h>
>>  #include <asm/p2m.h>
>> +#include <asm/page.h>
>>  #include <public/memory.h>
>>  #include <xsm/xsm.h>
> 
> I realize there are several asm/*.h being included here already. Yet
> generally I think common .c files would better not include any of
> them directly; only xen/*.h ones should (and even there one might see
> possible restrictions on what's "legitimate"). Do you recall what it
> was that's needed from asm/page.h here ...

The references to invalidate_icache (memory.c:310), clear_page
(memory.c:1867), and copy_page (memory.c:1876) all need asm/page.h to be
included somehow. I'm not sure which file ends up including asm/page.h
for build to work on x86/arm, but with my minimal PPC headers it wasn't
getting incidentally included and build was failing.

> 
>> --- a/xen/common/xmalloc_tlsf.c
>> +++ b/xen/common/xmalloc_tlsf.c
>> @@ -27,6 +27,7 @@
>>  #include <xen/mm.h>
>>  #include <xen/pfn.h>
>>  #include <asm/time.h>
>> +#include <asm/page.h>
> 
> ... and here?

Here it's the PAGE_ALIGN used at xmalloc_tlsf.c:549

> 
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -4,6 +4,7 @@
>>  
>>  #include <xen/types.h>
>>  
>> +#include <public/domctl.h>
>>  #include <public/xen.h>
> 
> While following our sorting guidelines, this still looks a little odd.
> We typically would include public/xen.h first, but then almost all other
> public headers include it anyway. So I'm inclined to suggest to replace
> (rather than amend) the existing #include here.

To be clear, you're suggesting replacing the include of <public/xen.h>
to <public/domctl.h>? I've tested this and it works fine, as expected.

> 
> Then again I wonder why this include is needed. xen/domain.h is
> effectively included everywhere, yet I would have hoped public/domctl.h
> isn't.

domctl.h is required because of the reference to `struct
xen_domctl_createdomain` on domain.h:84. Alternatively, we could get
away with a forward declaration of the struct.

> Jan

Thanks,
Shawn

