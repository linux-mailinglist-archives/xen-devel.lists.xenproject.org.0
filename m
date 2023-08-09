Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E377608E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581087.909620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjBi-0001zL-99; Wed, 09 Aug 2023 13:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581087.909620; Wed, 09 Aug 2023 13:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjBi-0001xj-6V; Wed, 09 Aug 2023 13:25:22 +0000
Received: by outflank-mailman (input) for mailman id 581087;
 Wed, 09 Aug 2023 13:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTjBh-0001xd-5Q
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:25:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f37517c-36b8-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 15:25:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8D2A84EE073F;
 Wed,  9 Aug 2023 15:25:18 +0200 (CEST)
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
X-Inumbo-ID: 2f37517c-36b8-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 15:25:18 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 4/8] xen/arm: address MISRA C:2012 Rule 8.4
In-Reply-To: <906F3F94-49E4-46A7-8CC7-DCB44FDF494C@arm.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <c2b0bb92a246e5cf149b1ec81c6ed635a275f9df.1691575243.git.nicola.vetrini@bugseng.com>
 <cfbc7569-3714-2200-054c-49ba593d6903@suse.com>
 <906F3F94-49E4-46A7-8CC7-DCB44FDF494C@arm.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <bf5b01a337989a0b2a2feebcb32922ff@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> To prevent back and forth I would suggest also to have a look in
> sending-patches.pandoc,
> ### Fixes section, on the expected syntax for the tag
> 

Thanks

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

