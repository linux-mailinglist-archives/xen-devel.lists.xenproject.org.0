Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2289E3DE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 21:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702802.1098340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHPB-0001IW-SQ; Tue, 09 Apr 2024 19:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702802.1098340; Tue, 09 Apr 2024 19:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHPB-0001FO-PQ; Tue, 09 Apr 2024 19:45:17 +0000
Received: by outflank-mailman (input) for mailman id 702802;
 Tue, 09 Apr 2024 19:45:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xQG8=LO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ruHPA-0001FI-CR
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 19:45:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae6a3879-f6a9-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 21:45:13 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BABB64EE0739;
 Tue,  9 Apr 2024 21:45:12 +0200 (CEST)
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
X-Inumbo-ID: ae6a3879-f6a9-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Tue, 09 Apr 2024 21:45:12 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/9] x86/vlapic: tidy switch statement and address
 MISRA violation
In-Reply-To: <36e84201-b31f-4204-8cff-ed50a01a47ed@suse.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <81ecc35d04456771b1e48cb25155b0151e2225b8.1712305581.git.nicola.vetrini@bugseng.com>
 <36e84201-b31f-4204-8cff-ed50a01a47ed@suse.com>
Message-ID: <e847ee06b76b816a62a555dfa6d52a4a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-08 09:32, Jan Beulich wrote:
> On 05.04.2024 11:14, Nicola Vetrini wrote:
>> Remove unneded blank lines between switch clauses.
> 
> "Unneeded" based on what? We're carefully trying to improve readability 
> of
> large switch() statements by adding such blank lines (at least) between 
> non-
> fall-through case blocks, and you go and remove them?
> 
> Jan

I wrote that based on this earlier suggestion [1]. If I misunderstood 
the suggestion, then I apologize and feel free to strip them if you 
want.

[1] 
https://lore.kernel.org/xen-devel/e40579ba-acae-4c11-bea1-a5b83208db10@suse.com/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

