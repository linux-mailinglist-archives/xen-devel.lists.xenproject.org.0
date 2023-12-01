Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596278014F7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 22:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645766.1008089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AmP-0001My-24; Fri, 01 Dec 2023 21:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645766.1008089; Fri, 01 Dec 2023 21:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AmO-0001Kg-Uf; Fri, 01 Dec 2023 21:10:32 +0000
Received: by outflank-mailman (input) for mailman id 645766;
 Fri, 01 Dec 2023 21:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7my=HM=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1r9AmN-0001JK-EM
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 21:10:31 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c3bec5e-908e-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 22:10:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 783448285554;
 Fri,  1 Dec 2023 15:10:25 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Bk2M7rLww1-q; Fri,  1 Dec 2023 15:10:23 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9391B8285721;
 Fri,  1 Dec 2023 15:10:23 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XKxKmtOH0yH1; Fri,  1 Dec 2023 15:10:23 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2E6378285554;
 Fri,  1 Dec 2023 15:10:23 -0600 (CST)
Received: from 192.168.3.91 (proxying for 172.58.188.160)
 (SquirrelMail authenticated user tpearson@raptorengineering.com)
 by vali.starlink.edu with HTTP; Fri, 1 Dec 2023 15:10:23 -0600
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
X-Inumbo-ID: 0c3bec5e-908e-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 9391B8285721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701465023; bh=bxT2AZjZ2cRdzkzG2sHEsDpTCKjhUQftBvzpCjUGa00=;
	h=Message-ID:Date:From:To:MIME-Version;
	b=iWRoOZ8hpdTStrvDg/bzyiGNMR+SGnR5vSGW0f51htju3hq9WiZyDiU9epYrLUlSt
	 0qQ7Jd5+HuVBIvVDtrYaBh5OEarZNDX/DQ6mThoM+sbME/BPJ9rm4cspV2cvhls49t
	 zEdH2POQrxGCFElZ23S+4WopqdfB3SBtSE08vqx8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7e0ea8d9ca0a3a90550eb7b9e65fe86c.squirrel@vali.starlink.edu>
In-Reply-To: <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
    <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
    <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
Date: Fri, 1 Dec 2023 15:10:23 -0600
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
From: tpearson@raptorengineering.com
To: "Julien Grall" <julien@xen.org>
Cc: "Shawn Anastasio" <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org,
 "Jan Beulich" <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Bertrand Marquis" <bertrand.marquis@arm.com>,
 "Michal Orzel" <michal.orzel@amd.com>,
 "Oleksii" <oleksii.kurochko@gmail.com>
User-Agent: SquirrelMail/1.4.22
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
X-Priority: 3 (Normal)
Importance: Normal
Content-Transfer-Encoding: quoted-printable

> (+ Arm and RISC-V folks)
>
> Hi Shawn,
>
> On 01/12/2023 20:59, Shawn Anastasio wrote:
>> Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early boot
>> allocator. Routines for parsing arm-specific devicetree nodes (e.g.
>> multiboot) were excluded, reducing the overall footprint of code that
>> was copied.
>
> I expect RISC-V to want similar code. I am not really thrilled in the
> idea of having 3 similar copy of the parsing. So can we extract the
> common bits (or harmonize it) so it can be shared?
>
> Maybe Oleksii has already a version doing that.

Just my $0.02, but wouldn't it make more sense to have the RISC-V port
handle the deduplication, seeing as the POWER support came first here?  W=
e
don't know if/when the RISC-V port will be ready for submission, so I'm
not sure why we should be on the hook for this particular work.

Thanks!


