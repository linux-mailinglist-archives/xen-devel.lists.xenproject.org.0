Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64C57983BC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 10:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597851.932237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeWZV-00065u-JB; Fri, 08 Sep 2023 08:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597851.932237; Fri, 08 Sep 2023 08:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeWZV-00063L-G1; Fri, 08 Sep 2023 08:10:33 +0000
Received: by outflank-mailman (input) for mailman id 597851;
 Fri, 08 Sep 2023 08:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCyG=EY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qeWZU-00063C-Jv
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 08:10:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cd81037-4e1f-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 10:10:30 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id AB3B74EE0738;
 Fri,  8 Sep 2023 10:10:29 +0200 (CEST)
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
X-Inumbo-ID: 2cd81037-4e1f-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Fri, 08 Sep 2023 10:10:29 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 1/3] docs/misra: add documentation skeleton for MISRA
 C:2012 Dir 4.1
In-Reply-To: <f83504f2-c12c-c359-a1d5-8c20ce3de334@suse.com>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com>
 <e74433904abe30e2e9e030f663a7a87813dabd24.1693558913.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2309071659440.6458@ubuntu-linux-20-04-desktop>
 <f83504f2-c12c-c359-a1d5-8c20ce3de334@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a3800b3fc779cdfb861b148ebf3c3c26@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2023 08:33, Jan Beulich wrote:
> On 08.09.2023 02:20, Stefano Stabellini wrote:
>> On Fri, 1 Sep 2023, Nicola Vetrini wrote:
>>> +Documentation for MISRA C:2012 Dir 4.1: read from uninitialized 
>>> allocated object
>>> +________________________________________________________________________________
>>> +
>>> +To be written.
>>> +Example:
>>> +The code does not use dynamically allocated storage.
>> 
>> We do use dynamically allocated storage with xzalloc but xzalloc
>> initializes the object to zero
> 
> Just at the example of this: I'm not sure in how far the examples given
> were actually meant to (remotely) apply to our code base. As to your
> reply - there's also xmalloc() which doesn't, and the page allocator,
> and other more specialized ones.
> 

You're right in saying that these examples are not tied to Xen 
specifically, these categories
of runtime failures are just the default ones present in ECLAIR. Both 
the matched text and
the categories can be amended, if the community deems it valuable.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

