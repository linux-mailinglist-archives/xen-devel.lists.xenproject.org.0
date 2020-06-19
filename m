Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C14200919
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:59:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGbU-0006Fy-0g; Fri, 19 Jun 2020 12:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=318C=AA=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jmGbR-0006Ft-Rb
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:58:41 +0000
X-Inumbo-ID: 9672a1f8-b22c-11ea-bb7c-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9672a1f8-b22c-11ea-bb7c-12813bfff9fa;
 Fri, 19 Jun 2020 12:58:36 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9C973A3285;
 Fri, 19 Jun 2020 14:58:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 90327A2EC5;
 Fri, 19 Jun 2020 14:58:34 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QE3FnZ5m0wSX; Fri, 19 Jun 2020 14:58:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D760CA3285;
 Fri, 19 Jun 2020 14:58:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id w1LIOBKjBj8d; Fri, 19 Jun 2020 14:58:33 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B1154A2EC5;
 Fri, 19 Jun 2020 14:58:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9FA7622599;
 Fri, 19 Jun 2020 14:58:03 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WVRasQth4Gm2; Fri, 19 Jun 2020 14:57:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 338EA22537;
 Fri, 19 Jun 2020 14:57:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HTVcf9ezIggt; Fri, 19 Jun 2020 14:57:58 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 16B152254F;
 Fri, 19 Jun 2020 14:57:58 +0200 (CEST)
Date: Fri, 19 Jun 2020 14:57:57 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <893375527.10199950.1592571477991.JavaMail.zimbra@cert.pl>
In-Reply-To: <d6c7f9f8-9c9e-9648-1c51-43db38cb0b00@suse.com>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
 <1417373854.10164826.1592568614663.JavaMail.zimbra@cert.pl>
 <d6c7f9f8-9c9e-9648-1c51-43db38cb0b00@suse.com>
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/msr: Disallow access to Processor Trace MSRs
Thread-Index: THc0AA/6//Z2X6lhwGGVbYcd5iRAcA==
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
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 19 cze 2020 o 14:49, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 19.06.2020 14:10, Micha=C5=82 Leszczy=C5=84ski wrote:
>> ----- 19 cze 2020 o 13:58, Andrew Cooper andrew.cooper3@citrix.com napis=
a=C5=82(a):
>>=20
>>> We do not expose the feature to guests, so should disallow access to th=
e
>>> respective MSRs.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> CC: Paul Durrant <paul@xen.org>
>>> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
>>>
>>> Paul: For 4.14.  This needs backporting to older trees as well.
>>>
>>> Micha=C5=82: CC'ing, just to keep you in the loop.  Xen has some dubiou=
s default
>>> MSR semantics which we're still in the middle of untangling in a backwa=
rds
>>> compatible way.  Patches like this will eventually not be necessary, bu=
t they
>>> are for now.
>>=20
>>=20
>> As for external IPT monitoring, it would be best if the VM would think
>> that IPT is simply not supported at all by the underlying hypervisor.
>=20
> This is already the case, isn't it? Yet not reporting a feature may
> not keep a guest from trying to access the respective MSRs.
>=20
> Jan


Okay, understood :)

ml

