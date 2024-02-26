Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006E86811E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 20:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685788.1067082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1regli-0000cl-Q9; Mon, 26 Feb 2024 19:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685788.1067082; Mon, 26 Feb 2024 19:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1regli-0000bF-NT; Mon, 26 Feb 2024 19:36:06 +0000
Received: by outflank-mailman (input) for mailman id 685788;
 Mon, 26 Feb 2024 19:36:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdE/=KD=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1reglg-0000b8-TF
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 19:36:04 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 466f51ae-d4de-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 20:36:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0FA3B8285AB2;
 Mon, 26 Feb 2024 13:36:02 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PhloNTDn7NEj; Mon, 26 Feb 2024 13:36:00 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D14AE82856C2;
 Mon, 26 Feb 2024 13:36:00 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zPYB3xai3P0j; Mon, 26 Feb 2024 13:36:00 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C72098285534;
 Mon, 26 Feb 2024 13:35:59 -0600 (CST)
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
X-Inumbo-ID: 466f51ae-d4de-11ee-98f5-efadbce2ee36
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D14AE82856C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1708976160; bh=bqCP0ZUNmVGkR+SUgOYwxxRk4p0Tqhhp0n0FaC8rdWo=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=PYKRlDqwMUyvKSxn9w01LOJMfPXBtnSDADdVncQ1Znjy/JejgDBH+Fpo1oaRgYkeh
	 is6JB20TdzALh34YzE2nna4ZwSwinkyfXCVhs1vlmohK3XuYfw+pnqHnp4mfKObNDz
	 gmk8fV9zMUmW0SqwfbC1P20xzLP1Y2uFjcxm/BHo=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <3f3c350a-0cc5-4899-aadb-fa3c9f3ef1dd@raptorengineering.com>
Date: Mon, 26 Feb 2024 13:35:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen: introduce Kconfig function alignment option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-2-roger.pau@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240207145547.89689-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Roger,

On 2/7/24 8:55 AM, Roger Pau Monne wrote:
> And use it to replace CODE_ALIGN in assembly.  This allows to generaliz=
e the
> way the code alignment gets set across all architectures.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

