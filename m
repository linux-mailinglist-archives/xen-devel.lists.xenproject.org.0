Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8E7D0A7D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 10:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619698.965211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtkpb-00087D-7j; Fri, 20 Oct 2023 08:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619698.965211; Fri, 20 Oct 2023 08:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtkpb-00084N-3s; Fri, 20 Oct 2023 08:26:07 +0000
Received: by outflank-mailman (input) for mailman id 619698;
 Fri, 20 Oct 2023 08:26:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYNS=GC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtkpa-00083y-3h
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 08:26:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4de428fe-6f22-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 10:26:02 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CB1694EE073A;
 Fri, 20 Oct 2023 10:26:01 +0200 (CEST)
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
X-Inumbo-ID: 4de428fe-6f22-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Fri, 20 Oct 2023 10:26:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen: add declarations for variables
 where needed
In-Reply-To: <de0dd96d-0416-44bc-944b-c08d955ef44d@xen.org>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com>
 <4d419cbffc84e0f9934794d105705ac64094a54a.1697722648.git.nicola.vetrini@bugseng.com>
 <de0dd96d-0416-44bc-944b-c08d955ef44d@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <493856724312ef1da0ef26045f0951da@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2023 09:59, Julien Grall wrote:
> Hi,
> 
> On 19/10/2023 14:39, Nicola Vetrini wrote:
>> Some variables with external linkage used in C code do not have
>> a visible declaration where they are defined. Providing such
>> declaration also resolves violations of MISRA C:2012 Rule 8.4.
> 
> The commit message doesn't match the code in several places.
> 

That's true; I'll do a more detailed summary of the changes.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

