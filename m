Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359BC940E5D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 11:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767425.1178033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjZA-0004cZ-QA; Tue, 30 Jul 2024 09:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767425.1178033; Tue, 30 Jul 2024 09:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjZA-0004Zw-NR; Tue, 30 Jul 2024 09:54:48 +0000
Received: by outflank-mailman (input) for mailman id 767425;
 Tue, 30 Jul 2024 09:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhKs=O6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sYjZ9-0004Zq-KY
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 09:54:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be9bcc9a-4e59-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 11:54:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3932E4EE075E;
 Tue, 30 Jul 2024 11:54:42 +0200 (CEST)
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
X-Inumbo-ID: be9bcc9a-4e59-11ef-8776-851b0ebba9a2
MIME-Version: 1.0
Date: Tue, 30 Jul 2024 11:54:42 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v5 13/17] xen: add deviations for MISRA C 2012 Dir
 D4.10
In-Reply-To: <7116e5dd-ad7b-4d2d-bb72-739320208dc1@suse.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
 <1a47750ebed47a3429269112fad6da58bfb6ee96.1721720583.git.alessandro.zucchelli@bugseng.com>
 <7116e5dd-ad7b-4d2d-bb72-739320208dc1@suse.com>
Message-ID: <eb14ffb915e10b22ab9a32ded6961337@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-30 11:45, Jan Beulich wrote:
> On 23.07.2024 10:15, Alessandro Zucchelli wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> Add safe deviation for *.c files, as estabilished in past discussion.
>> 
>> Signed-off-by: Maria Celeste Cesario  
>> <maria.celeste.cesario@bugseng.com>
>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Hmm, I was about to commit this when I noticed the mismatch between 
> From:
> and the sequence of S-o-b: Who's properly the original author of this
> patch (whose S-o-b ought to be first)?
> 
> Jan

Hi,

the original authors are Maria Celeste Cesario and Simone Ballarin, then 
me and Alessandro picked this up.
Perhaps some git configuration made it so that my From is there, but the 
S-o-b order reflects the ordering of events.

Thanks,
  Nicola

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

