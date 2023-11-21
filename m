Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5D7F316B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 15:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637880.993943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5S0t-0002j3-R3; Tue, 21 Nov 2023 14:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637880.993943; Tue, 21 Nov 2023 14:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5S0t-0002h9-OC; Tue, 21 Nov 2023 14:46:07 +0000
Received: by outflank-mailman (input) for mailman id 637880;
 Tue, 21 Nov 2023 14:46:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f+q9=HC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r5S0s-0002IR-Cm
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 14:46:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b28be2a8-887c-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 15:46:04 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9E8CB4EE073A;
 Tue, 21 Nov 2023 15:46:04 +0100 (CET)
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
X-Inumbo-ID: b28be2a8-887c-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 15:46:04 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC PATCH] x86/vlapic: address a violation of MISRA C:2012 Rule
 16.2
In-Reply-To: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
References: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
Message-ID: <0d67fdc30190bc8f3dfbf13b2d7e818b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-25 15:22, Nicola Vetrini wrote:
> The clauses of a switch should be enclosed directly by a switch
> statement to make the code more easily understandable and less
> prone to errors.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This patch is mainly indended to probe how the community, especially 
> the
> maintainers, would receive such modifications to the code, and whether 
> there
> would be consensus on the rule's adoption. Anyone is welcome to
> give feedback on this, especially on the x86 side, where this pattern
> is used more frequently.
> ---
>  xen/arch/x86/hvm/vlapic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Cc: all the relevant maintainers (mostly x86)

An update on the status of this rule's adoption. It has been deemed not 
beneficial to go after violations in xen/arch/x86/x86_emulate/.* , 
therefore the only patches to be expected for this rule will be about 
the few remaining violations in both arm, x86 and common code.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

