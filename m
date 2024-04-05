Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526138995BD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701108.1095249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdKp-0005Zm-7W; Fri, 05 Apr 2024 06:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701108.1095249; Fri, 05 Apr 2024 06:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdKp-0005XR-4H; Fri, 05 Apr 2024 06:45:59 +0000
Received: by outflank-mailman (input) for mailman id 701108;
 Fri, 05 Apr 2024 06:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M48I=LK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rsdKn-000548-TX
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 06:45:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2759104c-f318-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 08:45:56 +0200 (CEST)
Received: from [192.168.1.18] (host-82-59-164-46.retail.telecomitalia.it
 [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 91B6F4EE073E;
 Fri,  5 Apr 2024 08:45:55 +0200 (CEST)
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
X-Inumbo-ID: 2759104c-f318-11ee-a1ef-f123f15fe8a2
Message-ID: <27b5c849-5a53-4346-a914-7a251a664cf5@bugseng.com>
Date: Fri, 5 Apr 2024 08:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automaton/eclair: add deviations for MISRA C:2012
 Rule 13.6
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cca71f954bec4efc14b98e3ad991581441d593d7.1712238975.git.federico.serafini@bugseng.com>
 <4c008f38-2618-4e17-8cb5-c226660edf37@suse.com>
 <alpine.DEB.2.22.394.2404041701530.2245130@ubuntu-linux-20-04-desktop>
 <f4a9f196-1cc0-46fd-8655-5230bade1a8b@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <f4a9f196-1cc0-46fd-8655-5230bade1a8b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/24 08:06, Jan Beulich wrote:
> On 05.04.2024 02:04, Stefano Stabellini wrote:
>> On Thu, 4 Apr 2024, Jan Beulich wrote:
>>> Further, according to the discussion on the matter: alternative_call() is
>>> quite similar in this regard, just that it uses typeof(). Imo it should be
>>> deviated here as well right away, no matter whether Eclair can actually be
>>> configured to also check typeof() and alignof().
>>
>> On this specific point regarding typeof, I agree but it should be done
>> as a separate rule (not 13.6), to make sure it matches the scanner
>> results. It looks like the new rule will be called B.MISLEFF.
> 
> Fine with me, as long as things stay together (i.e. in a single commit).

Noted.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

