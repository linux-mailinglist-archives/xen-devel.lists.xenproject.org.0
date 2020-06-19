Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C765A200869
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:11:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmFrD-0001v5-Mz; Fri, 19 Jun 2020 12:10:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=318C=AA=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jmFrC-0001v0-6J
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:10:54 +0000
X-Inumbo-ID: ebc512f0-b225-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebc512f0-b225-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 12:10:53 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 693B1A3386;
 Fri, 19 Jun 2020 14:10:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5E29FA3370;
 Fri, 19 Jun 2020 14:10:51 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8AaQQhPXtcCk; Fri, 19 Jun 2020 14:10:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9ED5AA3386;
 Fri, 19 Jun 2020 14:10:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mseaQXxCB_C5; Fri, 19 Jun 2020 14:10:50 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7BECCA3370;
 Fri, 19 Jun 2020 14:10:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 65C60224D5;
 Fri, 19 Jun 2020 14:10:20 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FDYSmT8m_dfK; Fri, 19 Jun 2020 14:10:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id DD5F322521;
 Fri, 19 Jun 2020 14:10:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ovMWrDscSs9Z; Fri, 19 Jun 2020 14:10:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id BAD0F2189E;
 Fri, 19 Jun 2020 14:10:14 +0200 (CEST)
Date: Fri, 19 Jun 2020 14:10:14 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1417373854.10164826.1592568614663.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200619115823.22243-1-andrew.cooper3@citrix.com>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/msr: Disallow access to Processor Trace MSRs
Thread-Index: yk1CdCvPz6X6kk6c5uJDk+Ktx5/rpw==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 19 cze 2020 o 13:58, Andrew Cooper andrew.cooper3@citrix.com napisa=
=C5=82(a):

> We do not expose the feature to guests, so should disallow access to the
> respective MSRs.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
>=20
> Paul: For 4.14.  This needs backporting to older trees as well.
>=20
> Micha=C5=82: CC'ing, just to keep you in the loop.  Xen has some dubious =
default
> MSR semantics which we're still in the middle of untangling in a backward=
s
> compatible way.  Patches like this will eventually not be necessary, but =
they
> are for now.


As for external IPT monitoring, it would be best if the VM would think
that IPT is simply not supported at all by the underlying hypervisor.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

