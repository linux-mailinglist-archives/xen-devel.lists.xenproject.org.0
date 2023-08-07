Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04AE771B51
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 09:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577765.904774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSuTj-0004J1-I7; Mon, 07 Aug 2023 07:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577765.904774; Mon, 07 Aug 2023 07:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSuTj-0004GW-Ek; Mon, 07 Aug 2023 07:16:35 +0000
Received: by outflank-mailman (input) for mailman id 577765;
 Mon, 07 Aug 2023 07:16:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSuTi-0004Fe-5I
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 07:16:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56a51532-34f2-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 09:16:33 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 68DF74EE0737;
 Mon,  7 Aug 2023 09:16:33 +0200 (CEST)
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
X-Inumbo-ID: 56a51532-34f2-11ee-b27d-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 09:16:33 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 4/6] x86/include: address MISRA C:2012 Rule 5.3.
In-Reply-To: <alpine.DEB.2.22.394.2308041424240.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <40823fbaa9e0a9b026e5ff3b01af9d83583889fd.1691162261.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308041424240.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f9a30c4a5932b1432f4054384e26f9c9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2023 23:24, Stefano Stabellini wrote:
> On Fri, 4 Aug 2023, Nicola Vetrini wrote:
>> s/mpc_default_type/mpc_default in 'xen/arch/x86/include/asm/mpspec.h'
>> to avoid clashing with function parameter names in 'mpparse.c'.
>> 
>> No functional changes.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Even though the global variable does not seem to be used anywhere and 
>> is
>> perhaps better to remove it entirely.
> 
> Please remove it
> 

Noted.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

