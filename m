Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034188A1FF5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 22:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704207.1100452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0ou-0005KC-Gi; Thu, 11 Apr 2024 20:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704207.1100452; Thu, 11 Apr 2024 20:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0ou-0005IQ-D7; Thu, 11 Apr 2024 20:14:52 +0000
Received: by outflank-mailman (input) for mailman id 704207;
 Thu, 11 Apr 2024 20:14:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llhl=LQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rv0os-0005IK-Sk
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 20:14:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 247910b7-f840-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 22:14:47 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 882754EE0739;
 Thu, 11 Apr 2024 22:14:46 +0200 (CEST)
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
X-Inumbo-ID: 247910b7-f840-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Thu, 11 Apr 2024 22:14:46 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/9] x86/vlapic: tidy switch statement and address
 MISRA violation
In-Reply-To: <dd6ad7c5-bf99-42d4-9082-9ff87185705c@citrix.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <81ecc35d04456771b1e48cb25155b0151e2225b8.1712305581.git.nicola.vetrini@bugseng.com>
 <36e84201-b31f-4204-8cff-ed50a01a47ed@suse.com>
 <e847ee06b76b816a62a555dfa6d52a4a@bugseng.com>
 <dd6ad7c5-bf99-42d4-9082-9ff87185705c@citrix.com>
Message-ID: <3c216cddfe9151ab27aadc3ece6b12dc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-04-11 14:03, Andrew Cooper wrote:
> On 09/04/2024 8:45 pm, Nicola Vetrini wrote:
>> On 2024-04-08 09:32, Jan Beulich wrote:
>>> On 05.04.2024 11:14, Nicola Vetrini wrote:
>>>> Remove unneded blank lines between switch clauses.
>>> 
>>> "Unneeded" based on what? We're carefully trying to improve
>>> readability of
>>> large switch() statements by adding such blank lines (at least)
>>> between non-
>>> fall-through case blocks, and you go and remove them?
>>> 
>>> Jan
>> 
>> I wrote that based on this earlier suggestion [1]. If I misunderstood
>> the suggestion, then I apologize and feel free to strip them if you 
>> want.
>> 
>> [1]
>> https://lore.kernel.org/xen-devel/e40579ba-acae-4c11-bea1-a5b83208db10@suse.com/
> 
> I'm afraid I also can't figure out what that suggestion was supposed to
> be, but we definitely do want to keep blank lines.  They're 
> specifically
> for improved legibility.
> 

I interpreted that message as being a suggestion to eliminate blank 
lines, which was obviously incorrect. Anyways, thanks for the effort on 
adjusting and committing the earlier patches.

> But fighting over spacing like this is a waste of everyone's time.  
> I've
> taken patches 1 thru 7, accounting for the suggestions made so far, and
> adjusted to retain the blank lines.
> 
> Please double check carefully.
> 
> Patch 8 didn't apply because SAF-4-safe has been used for something 
> else
> now.  You'll need to rebase and resubmit patches 8 and 9.
> 

I'll certainly do so when I'm fully back to work next week.

> ~Andrew


-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

