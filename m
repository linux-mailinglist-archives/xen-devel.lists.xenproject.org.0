Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6287477FB70
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 18:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585527.916697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfTx-0001kn-MD; Thu, 17 Aug 2023 16:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585527.916697; Thu, 17 Aug 2023 16:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfTx-0001i0-JZ; Thu, 17 Aug 2023 16:04:21 +0000
Received: by outflank-mailman (input) for mailman id 585527;
 Thu, 17 Aug 2023 16:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n1I=EC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWfTx-0001hu-5v
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 16:04:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b93440fb-3d17-11ee-877d-cb3800f73035;
 Thu, 17 Aug 2023 18:04:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3C91F4EE0737;
 Thu, 17 Aug 2023 18:04:19 +0200 (CEST)
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
X-Inumbo-ID: b93440fb-3d17-11ee-877d-cb3800f73035
MIME-Version: 1.0
Date: Thu, 17 Aug 2023 18:04:19 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/3] drivers/video: make declarations of defined
 functions available
In-Reply-To: <b6827156-70bb-c8b3-c4d0-a8906fd0e7a2@suse.com>
References: <cover.1692275359.git.nicola.vetrini@bugseng.com>
 <cc46049dbdf86cad33f6a9f7ae79851b54cecea1.1692275359.git.nicola.vetrini@bugseng.com>
 <111382a3-0845-99b5-1efa-dfc505084c66@suse.com>
 <b61b9659a790701ec0b20e6c92dfb701@bugseng.com>
 <b6827156-70bb-c8b3-c4d0-a8906fd0e7a2@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <58efe262cd21797df64ea62c1d6d711c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>> 
>> Are you saying that CONFIG_VGA implies CONFIG_VIDEO and therefore
>> "#ifdef CONFIG_VGA"
>> at line 14 of vga.h can be used instead of the #ifdefs inherited from
>> the original locations
>> to wrap all the declarations that are being moved?
> 
> Yes - see drivers/video/Kconfig.
> 
> Jan

Ok then. I guess I can make a standalone patch with this modification
if the other patches of this series go in as is.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

