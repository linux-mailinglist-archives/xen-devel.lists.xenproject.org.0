Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03072E5EF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 16:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548184.855989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q959i-0008WN-5w; Tue, 13 Jun 2023 14:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548184.855989; Tue, 13 Jun 2023 14:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q959i-0008Tz-3A; Tue, 13 Jun 2023 14:37:58 +0000
Received: by outflank-mailman (input) for mailman id 548184;
 Tue, 13 Jun 2023 14:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IDdR=CB=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q959g-0008Tt-SZ
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 14:37:56 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e19ea2f2-09f7-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 16:37:55 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 423163F0E4;
 Tue, 13 Jun 2023 07:37:52 -0700 (PDT)
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
X-Inumbo-ID: e19ea2f2-09f7-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686667072; bh=kHWJ8ip6MnPNFr4FWAFBsRQOz0+V9Rb5mFKtz6oM4Dc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=dbIoEY9/V9cXN5KQ9B4jx11OWJONno6kRYwFfRaJbhMW9QFHcUjXmN717PFGe/Ytf
	 OBa2bHYcclHfTv9LJw5Ci3YELLcBnwsOP2geElpJWuKfaZmJNyxb9i5zMhG3zi2hV4
	 K1/469KZs++pDeACCRLjrIeGuuliIxo31K5Z6Xee+QS1rsUDHNQU2RoCKdD61VfXto
	 EButH2Oq1JZchyicFDmCsdJYVFdXM9xm+bYS9+mfqYrINy5WldxW0V/DO6qFhglNZN
	 tCdgHFA2TxXsx+A1B650eQ81dERDrZvCoNrVDsaDGKYThaqxXddWNseIfj9wfjDGyY
	 a2Qd7Qj0Ag+eQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jun 2023 09:37:50 -0500
Cc: <tpearson@raptorengineering.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] maintainers: Add ppc64 maintainer
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Jan Beulich" <jbeulich@suse.com>
Message-Id: <CTBLKBZM619S.267A9WSXOCGER@Shawns-Mac-mini.lan>
References: <cover.1686580752.git.shawn@anastas.io>
 <b15baf2dfa8f9f525305ad03c9d58cec4f7775ea.1686580752.git.shawn@anastas.io>
 <c646d172-1c4e-c8dd-789a-8c0cd16a89c5@suse.com>
In-Reply-To: <c646d172-1c4e-c8dd-789a-8c0cd16a89c5@suse.com>

On Mon Jun 12, 2023 at 10:03 AM CDT, Jan Beulich wrote:
> On 12.06.2023 16:51, Shawn Anastasio wrote:
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -460,6 +460,10 @@ X:	xen/arch/x86/acpi/lib.c
> >  F:	xen/drivers/cpufreq/
> >  F:	xen/include/acpi/cpufreq/
> > =20
> > +PPC64
> > +M:	Shawn Anastasio <sanastasio@raptorengineering.com>
> > +F:  xen/arch/ppc
>
> I'm sorry, but two nits again: This lack a trailing slash, and
> padding is done using spaces on the 2nd line instead of a tab.
>
> Jan

Oops, sorry about that. Will fix in v3.

Thanks,
Shawn

