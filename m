Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C497D2FE9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621277.967597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusD6-000499-Dr; Mon, 23 Oct 2023 10:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621277.967597; Mon, 23 Oct 2023 10:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusD6-00047A-B4; Mon, 23 Oct 2023 10:31:00 +0000
Received: by outflank-mailman (input) for mailman id 621277;
 Mon, 23 Oct 2023 10:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qusD4-000472-Ns
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:30:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4033a3fe-718f-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:30:56 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 992534EE0740;
 Mon, 23 Oct 2023 12:30:56 +0200 (CEST)
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
X-Inumbo-ID: 4033a3fe-718f-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 12:30:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 8/8] docs/misra: exclude three more files
In-Reply-To: <29ff2917-3828-710d-01b4-67941ec16ae3@suse.com>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <741b3eee4c25296bc114cfcc0f38d7e7c2bef667.1698053876.git.nicola.vetrini@bugseng.com>
 <29ff2917-3828-710d-01b4-67941ec16ae3@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <0b696abc3fb31e533c25b06fd63a07e3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2023 12:23, Jan Beulich wrote:
> On 23.10.2023 11:56, Nicola Vetrini wrote:
>> These files should not conform to MISRA guidelines at the moment,
>> therefore they are added to the exclusion list.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> These exclusions are automatically picked up by ECLAIR's automation
>> to hide reports originating from these files.
>> 
>> Changes in v4:
>> - Fixed typo
> 
> While there was an adjustment here, I don't think it invalidated
> Stefano's R-b?
> 
> Jan

Yes

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

