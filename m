Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6FD203F0C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 20:21:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnR3Y-0004dd-LC; Mon, 22 Jun 2020 18:20:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnR3X-0004dY-Il
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 18:20:31 +0000
X-Inumbo-ID: 0dea60d8-b4b5-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dea60d8-b4b5-11ea-b7bb-bc764e2007e4;
 Mon, 22 Jun 2020 18:20:30 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0A645A289F;
 Mon, 22 Jun 2020 20:20:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 003A7A2860;
 Mon, 22 Jun 2020 20:20:28 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bo3toW_T4XV9; Mon, 22 Jun 2020 20:20:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 22AA7A289F;
 Mon, 22 Jun 2020 20:20:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DFDwG06CTQ1j; Mon, 22 Jun 2020 20:20:27 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id EBCEBA2860;
 Mon, 22 Jun 2020 20:20:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D6FA821C91;
 Mon, 22 Jun 2020 20:19:56 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TxhTAidltDwQ; Mon, 22 Jun 2020 20:19:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8478121C93;
 Mon, 22 Jun 2020 20:19:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3N-Ukwlvsuc1; Mon, 22 Jun 2020 20:19:51 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6329721C91;
 Mon, 22 Jun 2020 20:19:51 +0200 (CEST)
Date: Mon, 22 Jun 2020 20:19:51 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <1731956046.11444288.1592849991363.JavaMail.zimbra@cert.pl>
In-Reply-To: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
Subject: Re: [PATCH v3 0/7] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: fAatEklvenYpYrSWj77J6AQD/dj+xC9WPo0B
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, "Kang,
 Luwei" <luwei.kang@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 22 cze 2020 o 20:06, Micha=C5=82 Leszczy=C5=84ski michal.leszczynski@=
cert.pl napisa=C5=82(a):

> This patch series implements an interface that Dom0 could use in order to
> enable IPT for particular vCPUs in DomU, allowing for external monitoring=
. Such
> a feature has numerous applications like malware monitoring, fuzzing, or
> performance testing.


There is also a git branch with these patches:
https://github.com/icedevml/xen/tree/ipt-patch-v3b

