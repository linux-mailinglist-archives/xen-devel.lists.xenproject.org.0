Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78FB733B44
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 23:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550503.859613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGYF-0002ez-Of; Fri, 16 Jun 2023 21:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550503.859613; Fri, 16 Jun 2023 21:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGYF-0002cf-Lx; Fri, 16 Jun 2023 21:00:11 +0000
Received: by outflank-mailman (input) for mailman id 550503;
 Fri, 16 Jun 2023 21:00:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r/i=CE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qAGYE-0002cX-M8
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 21:00:10 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c701471a-0c88-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 23:00:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C9B568285C05;
 Fri, 16 Jun 2023 16:00:07 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1utSEkyUjJ_I; Fri, 16 Jun 2023 16:00:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2C80D8285C06;
 Fri, 16 Jun 2023 16:00:07 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id pGhnUdfLgj3o; Fri, 16 Jun 2023 16:00:07 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9F3088285C05;
 Fri, 16 Jun 2023 16:00:06 -0500 (CDT)
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
X-Inumbo-ID: c701471a-0c88-11ee-b232-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2C80D8285C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1686949207; bh=WFizKFAV1in+JqdRWVC3E2rzpnR0lUPm3su5qyNdtUc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=d7DxUlP6wBciRwkj/9ZJ+lwfpGJAwviPv29Hdf336bLzcbL8Uyj/0sjNNtZanLrWX
	 y+x3P8A/7gG7gMlb4ThrhTnIifbQzydEgTsqO90s9u0jSXseS8yR4JG6QH2rL1uQZO
	 NU4X413CJlxQvwlwG8mukHRTCol/3avX8kyPRSno=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <40546404-5b24-297b-4892-59b7ec731375@raptorengineering.com>
Date: Fri, 16 Jun 2023 16:00:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <33c8e11f-c561-3dcf-e08f-0ea19b34f89e@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <33c8e11f-c561-3dcf-e08f-0ea19b34f89e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6/16/23 3:27 PM, Andrew Cooper wrote:
> Sorry, I also meant to ask.=C2=A0 How prevalent is Big Endian in practi=
ce in
> the Power world?

Modern systems support operating in either endianness, but historically
most operating systems targeted Big Endian-only, and some older systems
didn't support Little Endian at all.

These days Little Endian is more prevalent (at least in the Open Source
world), and many Linux distributions only target LE. Despite this though,
most firmware on Power systems still operates in Big Endian mode
exclusively,
so it's the responsibility of the kernel to handle the switch to LE at
its entrypoint.

The FW being BE also needs to be considered whenever the kernel calls
into firmware, since it's the responsibility of the kernel to switch to B=
E
before making the call, and also to switch itself back to LE after the FW
routine returns. Typically it's just handled by sprinkling this trampolin=
e
(via a macro) at all of the entry/return points.

> It's another area (like 4k pages) where I expect there to be plenty of
> fun to be had with the codebase.

Hopefully the choice to run in Little Endian mode will reduce the number
of pain points encountered.

Also it's worth mentioning that both 4k and 64k pages are supported,
though 64k is probably the more common choice.

> ~Andrew

Thanks,
Shawn





