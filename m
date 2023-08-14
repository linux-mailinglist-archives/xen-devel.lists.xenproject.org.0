Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9EE77B30E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583350.913550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSPQ-0000M9-UC; Mon, 14 Aug 2023 07:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583350.913550; Mon, 14 Aug 2023 07:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSPQ-0000Jb-R9; Mon, 14 Aug 2023 07:54:40 +0000
Received: by outflank-mailman (input) for mailman id 583350;
 Mon, 14 Aug 2023 07:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DK7P=D7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qVSPP-0000JT-Qn
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:54:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d11f4249-3a77-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:54:38 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A97274EE0737;
 Mon, 14 Aug 2023 09:54:37 +0200 (CEST)
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
X-Inumbo-ID: d11f4249-3a77-11ee-b288-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 14 Aug 2023 09:54:37 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 5/6] vpic/msix: make 'get_slot' static
In-Reply-To: <fde117b3-f9e2-f98d-4301-04683d99635e@suse.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <6ff95436f704c852e6397a584eef65f9d1713999.1691676251.git.nicola.vetrini@bugseng.com>
 <fde117b3-f9e2-f98d-4301-04683d99635e@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <2c0f387f1a4f875f844e497f61f9fcc4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2023 09:44, Jan Beulich wrote:
> On 11.08.2023 09:19, Nicola Vetrini wrote:
>> The function can become static since it's used only within this file.
>> This also resolves a violation of MISRA C:2012 Rule 8.4 due to the 
>> absence
>> of a declaration before the function definition.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Fixes: b177892d2d0e ("vpci/msix: handle accesses adjacent to the MSI-X 
>> table")
> 
> Nit (typo): In the title you mean "vpci/msix", just like this quoted
> commit has it. This is important-ish because we also have "vpic"
> elsewhere in the tree. (Can certainly be adjusted while committing.)
> 
> Jan

Yes, I meant to write 'vpci/msix'.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

