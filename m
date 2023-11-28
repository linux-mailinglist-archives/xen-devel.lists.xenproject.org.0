Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D977FB945
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643064.1002944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7w69-0008TF-3p; Tue, 28 Nov 2023 11:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643064.1002944; Tue, 28 Nov 2023 11:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7w68-0008SM-VZ; Tue, 28 Nov 2023 11:17:48 +0000
Received: by outflank-mailman (input) for mailman id 643064;
 Tue, 28 Nov 2023 11:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3Bp=HJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r7w67-0008SF-NR
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:17:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c114c934-8ddf-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 12:17:45 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D43154EE0737;
 Tue, 28 Nov 2023 12:17:44 +0100 (CET)
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
X-Inumbo-ID: c114c934-8ddf-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 12:17:44 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper3
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Xen Devel
 <xen-devel@lists.xenproject.org>
Subject: Re: MISRA: Compatible declarations for sort and bsearch
In-Reply-To: <225661f6-fd30-4c28-84af-a6ff16def246@suse.com>
References: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
 <225661f6-fd30-4c28-84af-a6ff16def246@suse.com>
Message-ID: <51df0275d0988af618c22adb8d55138c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-28 09:56, Jan Beulich wrote:
> On 24.11.2023 10:40, Nicola Vetrini wrote:
>> in xen/lib.h and xen/sort.h there are definitions of the functions
>> bsearch and sort that have no prior declarations, and therefore are
>> subject to a violation of MISRA C Rule 8.4.
>> 
>> I'm wondering whether it would be preferred
>> 
>> 1. to put a declaration just before the definition, in lib.h and 
>> sort.h
>> 2. deviate these functions, as their signatures are well-known and
>> somewhat standardized
> 
> Seeing that so far no-one else has replied to this: My take is 
> "neither".
> It is the very nature of extern gnu_inline functions to work like this.
> 

This could well be a justification text: violations of required rules 
need either to be fixed or justified.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

