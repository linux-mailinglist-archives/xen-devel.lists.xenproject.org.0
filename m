Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9852B377
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 09:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331701.555263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrEFy-0001qU-SZ; Wed, 18 May 2022 07:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331701.555263; Wed, 18 May 2022 07:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrEFy-0001nc-Oc; Wed, 18 May 2022 07:38:06 +0000
Received: by outflank-mailman (input) for mailman id 331701;
 Wed, 18 May 2022 07:38:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nrEFx-0001nU-GL
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 07:38:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrEFx-00073y-9W; Wed, 18 May 2022 07:38:05 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrEFx-0002xc-3W; Wed, 18 May 2022 07:38:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=ZbxWDhfGztVxsCqINZPoROVpBMzUzF+YX3ntdkvMdks=; b=Y7Bb5H9jXNxK4KQzo+Nb9W8uYX
	yptvhkdKzL1CUmiy8yE5kGqTVvwPcpvUDvAjgPrPIfvrCgYtkWMMgBOAO+k2IIsR3iGSSmlwaigg0
	PQyvZYkj5P09+vnhV+K4NfAZSbAxhz/LFfARnYqI/u5stFsV9B80AB+YixdIpDm9J5IY=;
Message-ID: <9bb6855e-ee93-691b-877e-b187db91dbd7@xen.org>
Date: Wed, 18 May 2022 08:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
 <5e4d505c-a02c-eb54-8299-b1078943a8a5@suse.com>
 <alpine.DEB.2.22.394.2205172012100.1905099@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: Process for cherry-picking patches from other projects
In-Reply-To: <alpine.DEB.2.22.394.2205172012100.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 18/05/2022 04:12, Stefano Stabellini wrote:
> On Tue, 17 May 2022, Jan Beulich wrote:
>> Hmm. The present rules written down in docs/process/sending-patches.pandoc
>> are a result of me having been accused of unduly stripping S-o-b (and maybe
>> a few other) tags. If that was for a real reason (and not just because of
>> someone's taste), how could it ever be okay to remove S-o-b? (Personally I
>> agree with what you propose, it just doesn't line up with that discussion
>> we had not all that long ago.)
> 
> This is the meaning of the DCO: https://developercertificate.org
> 
> The relevant case is:
> 
> (b) The contribution is based upon previous work that, to the best
>      of my knowledge, is covered under an appropriate open source
>      license and I have the right under that license to submit that
>      work with modifications, whether created in whole or in part
>      by me, under the same open source license (unless I am
>      permitted to submit under a different license), as indicated
>      in the file; or
> 
> IANAL but I read this as to mean that only the submitter Signed-off-by
> is required. Also consider that the code could come from a place where
> Signed-off-by is not used. As long as the copyright checks out, then we
> are OK.

I don't think I can write better than what Ian wrote back then:

"
Please can we keep the Linux S-o-b.

Note that S-o-b is not a chain of *approval* (whose relevance to us is
debateable) but but a chain of *custody and transmission* for
copyright/licence/gdpr purposes.  That latter chain is hightly
relevant to us.

All such S-o-b should be retained.

Of course if you got the patch somewhere other than the Linux commit,
then the chain of custody doesn't pass through the Linux commit.  But
in that case I expect you to be able to say where you got it.
"

Cheers,

-- 
Julien Grall

