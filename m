Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0F771B62
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 09:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577770.904783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSuVt-0004xU-T7; Mon, 07 Aug 2023 07:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577770.904783; Mon, 07 Aug 2023 07:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSuVt-0004v7-QH; Mon, 07 Aug 2023 07:18:49 +0000
Received: by outflank-mailman (input) for mailman id 577770;
 Mon, 07 Aug 2023 07:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSuVs-0004uz-H4
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 07:18:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a68b9b2f-34f2-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 09:18:47 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7565F4EE0737;
 Mon,  7 Aug 2023 09:18:47 +0200 (CEST)
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
X-Inumbo-ID: a68b9b2f-34f2-11ee-b27d-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 09:18:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
 <julien@xen.org>
Subject: Re: [XEN PATCH v2 3/4] x86/irq: rename variable to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <alpine.DEB.2.22.394.2308041346560.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <987ebd142ebd69ed062d74f7eb69c23759c51636.1691135862.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308041346560.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <bcf6d6e08db95df59ef98b90df295700@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2023 22:47, Stefano Stabellini wrote:
> On Fri, 4 Aug 2023, Nicola Vetrini wrote:
>> The extern variable 'irq_desc' defined in 'irq.h' is shadowed by
>> local variables in the changed file. To avoid this, the variable is
>> renamed to 'irq_description'.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> You missed me reviewed tag from the previous version:
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

You're right, sorry.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

