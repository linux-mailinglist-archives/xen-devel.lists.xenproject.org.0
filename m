Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526EE793095
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 23:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595832.929456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qddBb-0008FS-1r; Tue, 05 Sep 2023 21:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595832.929456; Tue, 05 Sep 2023 21:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qddBa-0008Ct-Ut; Tue, 05 Sep 2023 21:02:10 +0000
Received: by outflank-mailman (input) for mailman id 595832;
 Tue, 05 Sep 2023 21:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZRj=EV=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qddBZ-0008Cn-1R
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 21:02:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 780d212b-4c2f-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 23:02:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1F06D8285BDC;
 Tue,  5 Sep 2023 16:02:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8W3hj5_Mi9xr; Tue,  5 Sep 2023 16:02:04 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D12D88285BE0;
 Tue,  5 Sep 2023 16:02:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id V-cdS7kxvMfX; Tue,  5 Sep 2023 16:02:03 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 88D098285BDC;
 Tue,  5 Sep 2023 16:02:03 -0500 (CDT)
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
X-Inumbo-ID: 780d212b-4c2f-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D12D88285BE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693947723; bh=Lmp8MHSPykR1AvCjAK+dRBjgHG6gxgp1d+Fhh3mBe2E=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=eoMy3laRiAXJKGS2Mumcs9ydos1V4t53iXQfYQe1C/isAjRhatAkuFvfAD15vFVgc
	 4zUoi1Y87wlURpm1dUgxu9cH/ciuGi2a0Oz0PGDjHoFwuGxoo353ZaxtTYhxPFeBJY
	 jxZQ9+K3AXkokVp/O2PxyhhY63RhsnY/pg41fNFQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7f0582cf-e78b-a62d-3f1e-b446acc82cf6@raptorengineering.com>
Date: Tue, 5 Sep 2023 16:02:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/5] ppc: Enable full Xen build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <332a7462-d0cb-154e-415b-e7f40b9b1421@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <332a7462-d0cb-154e-415b-e7f40b9b1421@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/23 11:07 AM, Jan Beulich wrote:
> On 01.09.2023 20:25, Shawn Anastasio wrote:
>> Hello all,
>>
>> This patch series performs all of the additions necessary to drop the
>> build overrides for PPC and enable the full Xen build. Except in cases
>> where compatibile implementations already exist (e.g. atomic.h and
>> bitops.h), the newly added definitions are simple, unimplemented stubs
>> that just call BUG_ON("unimplemented").
>>
>> A few miscellaneous changes were also made to non-ppc code as well,
>> specifically a few missing header fixes in common.
> 
> Nit: This is stale now, isn't it?

Yes, I'll drop that sentence.

> But what I really wanted to mention here: Something's odd with how you
> sent this series. I received 0, 1, and 3 as one thread, 2 and 5 as
> another one, and 4 entirely standalone. The list archive [1] has all of
> 2, 4, and 5 as standalone mails.
>

I'm also seeing this in my own inbox -- I'm not sure what happened here
since I used the same exact git send-email invocation that I used last
time.

> Another thing I wanted to ask: Would it be possible to configure
> whatever mail client you use for sending patches to send plain ASCII or
> UTF-8 text, not quoted-printable ones? At least for me, so far having
> shoveled in most of your patches, that encoding gets in the way of
> running a pre-apply-test with plain "patch --dry-run -F0" on all
> patches (from a script I use for committing). I can help myself with
> plain "git am", but sooner or later some patch will end up having a
> collision with something else having gone in, and then I'll need to
> manually clean up after the failed / incomplete command.
>

If I'm understanding correctly, it looks like git send-email's
--transfer-encoding=8bit [1] should do what you're asking. I'll do this
for future submissions.

[1] https://git-scm.com/docs/git-send-email

> Jan

Thanks,
Shawn


