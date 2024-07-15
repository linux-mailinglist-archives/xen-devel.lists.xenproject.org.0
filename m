Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FE39310DF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 11:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758768.1168237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHhU-0007nF-D4; Mon, 15 Jul 2024 09:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758768.1168237; Mon, 15 Jul 2024 09:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHhU-0007lk-9s; Mon, 15 Jul 2024 09:08:52 +0000
Received: by outflank-mailman (input) for mailman id 758768;
 Mon, 15 Jul 2024 09:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6tg=OP=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sTHhS-0007ld-As
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 09:08:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8ce8abf-4289-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 11:08:49 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2B9484EE0737;
 Mon, 15 Jul 2024 11:08:48 +0200 (CEST)
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
X-Inumbo-ID: d8ce8abf-4289-11ef-bbfb-fd08da9f4363
MIME-Version: 1.0
Date: Mon, 15 Jul 2024 11:08:48 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com>
 <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com>
 <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
 <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com>
Message-ID: <c5f1f9e574ec34bc082e7c91c20cad01@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-15 09:23, Jan Beulich wrote:
> On 13.07.2024 00:38, Stefano Stabellini wrote:
>> On Wed, 3 Jul 2024, Jan Beulich wrote:
>>> I further have to note that, as indicated during the earlier 
>>> discussion,
>>> I still cannot see how occasional ambiguity is going to be dealt 
>>> with.
>>> IOW from the rules above two different headers could still end up 
>>> with
>>> the same guard identifier.
>> 
>> Maybe something like this?
>> 
>> "In the event of naming collisions, exceptions to the coding style may
>> be made at the discretion of the contributor and maintainers."
> 
> Hmm, maybe I wasn't clear enough then. My take is that the scheme 
> should
> simply not allow for possible collisions. Neither the contributor nor 
> the
> reviewer may spot such a collision, and it may therefore take until the
> first full scan that one is actually noticed. Which I consider too late
> in the process, even if we already were at the point where commits were
> checked pre-push.
> 

If we could come to an agreement, I will make the new version of the 
patch
series with all the needed changes.
-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

