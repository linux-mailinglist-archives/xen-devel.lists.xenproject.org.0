Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537C257B39
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 16:24:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCkiz-0007id-U7; Mon, 31 Aug 2020 14:23:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWhU=CJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kCkiy-0007iV-SQ
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 14:23:56 +0000
X-Inumbo-ID: 99304a7a-5d55-4385-af6b-5a2782465161
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99304a7a-5d55-4385-af6b-5a2782465161;
 Mon, 31 Aug 2020 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598883836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ph/MOUL8wfqcpwFg9xi4jyDk+ncsS0Jmt7sH/r2qOX4=;
 b=Zc4omDAAUYuSIgPal07OpWXN8KI0rek22p9Z7sW4irucdRR4nk8TzeoQ
 sgarwmWvLbMJN3Hp5u99yaIq8P0jJCGv4etc7qOJneV1ru0eZtZVOqfxs
 AtNtiaBlEOpKbXTahbFfNDRAa8tPPgaYYIvxead4KdtyXNtdIUpHUWZ+a 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: MfpN2KpszgdyivwJawpSo7Ocffwtdwz9qIaR2iB49tBqfQlPdEB3f1xZPJVH5Cfz2Jn4SQTocj
 cTptWWJFuSoV2XpR/V3zBdJgw1qRRXPIO0MduZ1WNSbPjHDbhxWW3glYw/X/fQylMd5mFbhGxi
 lzCJkAx4YIv10N6ioq6mHHffhZ8c2rrxjZxBeZCDbG6QVnyVGM1LyscaIWF1JCDCh0kJDThiFw
 uiJTkMWFiy7Iq7lyd0pJs7VW3UaqrHcT/gDvYsNBYXOssVO+xNaVrcYj8+WGOhQg4Zq7xjOwqz
 4HQ=
X-SBRS: 2.7
X-MesageID: 25667158
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,375,1592884800"; d="scan'208";a="25667158"
Date: Mon, 31 Aug 2020 16:23:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: osstest service owner <osstest-admin@xenproject.org>,
 <xen-devel@lists.xenproject.org>, "Durrant, Paul" <pdurrant@amazon.com>
Subject: Re: [xen-unstable test] 153154: regressions - trouble:
 broken/fail/pass
Message-ID: <20200831142347.GC753@Air-de-Roger>
References: <osstest-153154-mainreport@xen.org>
 <97b0ec7e-6b74-88f1-ccb0-cc22ea2817c9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97b0ec7e-6b74-88f1-ccb0-cc22ea2817c9@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 31, 2020 at 06:40:56AM +0200, Jürgen Groß wrote:
> On 30.08.20 18:11, osstest service owner wrote:
> > flight 153154 xen-unstable real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/153154/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >   test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
> >   test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
> >   test-amd64-i386-xl-qemut-win7-amd64    <job status>                 broken
> >   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
> >   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
> 
> Paul, I suspect some fallout from your hotplug/mtu series?
> 
> The failure in
> 
> http://logs.test-lab.xenproject.org/osstest/logs/153154/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm/10.ts-debian-hvm-install.log
> 
> is pointing in this direction IMO.

There's a stubdom panic at:

http://logs.test-lab.xenproject.org/osstest/logs/153154/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm/godello0---var-log-xen-qemu-dm-debianhvm.guest.osstest.log

No idea if it's related to the MTU stuff or not. Seems to happen during
netfront initialization, so might be related.

Roger.

