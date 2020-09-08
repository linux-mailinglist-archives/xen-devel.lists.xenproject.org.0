Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90E260EAD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 11:31:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFZxm-0001fz-S3; Tue, 08 Sep 2020 09:30:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YB8W=CR=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kFZxl-0001fu-01
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 09:30:53 +0000
X-Inumbo-ID: 299072ca-678d-4c60-aab9-272f425134ba
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 299072ca-678d-4c60-aab9-272f425134ba;
 Tue, 08 Sep 2020 09:30:51 +0000 (UTC)
Date: Tue, 08 Sep 2020 09:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599557450;
 bh=J/TYZoif5A5CC4iJqEJWYRM6iCHKStavHPkvFivGjM4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ctEbYuFFVMXG1nxgYWnfjQaQoXZN9O1EeZf44TrRMS37lMITgKkNbv3aoduvw4dUz
 7kQ1v8UJpVd05O9H9/A1pQ3GkdVT2x3oBg/4fp80Hfhwm4E9Y/ceKUjfgXtO8P09OJ
 0XpoAM6W+om3knlb0sR12PimddRxY3yHa9ilWg6o=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/4] x86/xen.lds.S: Work around binutils build id
 alignment bug
Message-ID: <6SnmUgvnHWozDhOcXRgAUuB_aEQdoXlOD5-uC6-t2LGRtadueg0vaUUmBISei_7NrT_9DCVBfNLUR12D6XTYoJNri7W2fw1_yeMUXULfwR0=@trmm.net>
In-Reply-To: <5b8f533d-c646-8a52-cf37-d21b182ccf9b@suse.com>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-2-hudson@trmm.net>
 <5b8f533d-c646-8a52-cf37-d21b182ccf9b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, September 8, 2020 11:04 AM, Jan Beulich <jbeulich@suse.com> wro=
te:
> [...]
> Personally I think this kind of a workaround patch is something
> distros ought to be fine to carry, if they care about the
> functionality and only until they get around to upgrade their
> binutils. But I'll be happy to hear differing opinions.

Y'all just merged something to support building with make 3.81, released in=
 *2006*, so why require a bleeding edge binutils to work with the executabl=
e image?

> I also don't see any mention anywhere of why it's 32 bytes, and not
> 16 or 64 or yet something else.

It is 32 because you said 32 was probably fine.

--
Trammell

