Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05811F35F5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 10:13:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiZMf-0002jZ-2H; Tue, 09 Jun 2020 08:12:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzqH=7W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jiZMe-0002jJ-ES
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 08:12:08 +0000
X-Inumbo-ID: e561be0e-aa28-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e561be0e-aa28-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 08:12:01 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9o2m9yRlwNErWhobeR4vIO5XV2GkjnT1VHr/Gh0BSZdp8EAKXa9geF5i5Iz+mEMCDbLMd1pwyr
 eQOBc44qAZ9OviaCLVC5DI0vdu4aChs6dVt9/N1B1OgbcYpU7zhD2JMtVehhe7V/J7AsRQ9jod
 bhzRnFhhQMxk+TmVGSYxpQqLRG1CL3eR9doASGH62fj6TGN1eeq2GPW3FsrZz4mCGBLRNsslI1
 mhoM8O7t3zQjx9juSDtwq6YsnAB/yvsgTZSLC6Ory2FuKYEXsdeOAcH7zQIYfVluCMoM/lFxWi
 WQA=
X-SBRS: 2.7
X-MesageID: 19899490
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,491,1583211600"; d="scan'208";a="19899490"
Date: Tue, 9 Jun 2020 10:11:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: Xen 4.14 RC1
Message-ID: <20200609081039.GA1635@Air-de-Roger>
References: <20200608163934.313-1-paul@xen.org>
 <CABfawhn3HJCHonYKnMFPgUEN125SDBSXKcMFMWd2hG5SGKF8YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CABfawhn3HJCHonYKnMFPgUEN125SDBSXKcMFMWd2hG5SGKF8YQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-users@lists.xenproject.org, Xen-devel <xen-devel@lists.xenproject.org>,
 xen-announce@lists.xenproject.org, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 08, 2020 at 02:02:31PM -0600, Tamas K Lengyel wrote:
> On Mon, Jun 8, 2020 at 10:41 AM Paul Durrant <paul@xen.org> wrote:
> >
> > Hi all,
> >
> > Xen 4.14 RC1 is tagged. You can check that out from xen.git:
> >
> > git://xenbits.xen.org/xen.git 4.14.0-rc1
> >
> > For your convenience there is also a tarball at:
> > https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz
> >
> > And the signature is at:
> > https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz.sig
> >
> > Please send bug reports and test reports to xen-devel@lists.xenproject.org.
> > When sending bug reports, please CC relevant maintainers and me (paul@xen.org).
> >
> > As a reminder, there will be a Xen Test Day. Please see the test day schedule at
> > https://wiki.xenproject.org/wiki/Xen_Project_Test_Days and test instructions at
> > https://wiki.xenproject.org/wiki/Xen_4.14_RC_test_instructions.
> 
> Hi Paul,
> I'm sad to see this RC1 still missing patch:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00179.html
> 
> The following even have the release-ack and yet are also missing:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00025.html

Ideally this one requires an Ack from the VMX maintainers, which
hasn't happened AFAICT. Might be worth trying to ping them on the patch
by putting them on the To field.

Alternatively we can consider pushing it without such Ack if the x86
maintainers agree.

Roger.

