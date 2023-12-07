Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD6808F1B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 18:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650095.1015327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBIZJ-00060b-3Q; Thu, 07 Dec 2023 17:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650095.1015327; Thu, 07 Dec 2023 17:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBIZJ-0005yv-0j; Thu, 07 Dec 2023 17:53:49 +0000
Received: by outflank-mailman (input) for mailman id 650095;
 Thu, 07 Dec 2023 17:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fZpn=HS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rBIZI-0005yp-5T
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 17:53:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91215c4c-9529-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 18:53:46 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 23FC54EE073A;
 Thu,  7 Dec 2023 18:53:45 +0100 (CET)
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
X-Inumbo-ID: 91215c4c-9529-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Thu, 07 Dec 2023 18:53:45 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: file exclusion automation
In-Reply-To: <74abb34c-f253-4b4e-a3bb-3feb01fcc902@xen.org>
References: <e17fba6f45a03f7acb0af342ed8aea97130dba4a.1701949157.git.nicola.vetrini@bugseng.com>
 <74abb34c-f253-4b4e-a3bb-3feb01fcc902@xen.org>
Message-ID: <03d8668e6f8e9046eb784385a4585c28@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-07 18:08, Julien Grall wrote:
> On 07/12/2023 11:39, Nicola Vetrini wrote:
>> +-doc_begin="libfdt is out of scope."
>> +-file_tag+={out_of_scope,"^xen/include/xen/libfdt/.*$"}
> 
> AFAICT, before this was marked as "adopted". But this is now moved to 
> "out_of_scope". Can you explain why?
> 
> It also feels somewhat unrelated to the rest of the patch.
> 
> Cheers,

I mistakenly changed the tag. It is not unrelated, as it't not part of 
exclude-list.json (perhaps unintentionally). The manual exclusions that 
remain in out_of_scope.ecl are there for this reason, since I wanted to 
keep the set of excluded files as it was before.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

