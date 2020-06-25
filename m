Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9020A0ED
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 16:37:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joT0J-0001NS-QD; Thu, 25 Jun 2020 14:37:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BrHH=AG=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1joT0I-0001NN-C8
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 14:37:26 +0000
X-Inumbo-ID: 629eaec1-b6f1-11ea-81dc-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 629eaec1-b6f1-11ea-81dc-12813bfff9fa;
 Thu, 25 Jun 2020 14:37:25 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HbuEhbJYFAXxxZSmJl9qBVoDdOXE1HTXeuH6bAy4P1kiA3E3nePJglTntCkGa95oxECF5dSQD2
 fakCXqtQJzLYiuhJAPlWrGZgFNxUQ1MFgV7RJkfAm3J8xbB6QhJT1hwaTYH9GYv//PU6d6Z2cB
 EYzqznh44f0PedVAPph1SI2kG2tkD7fRdEOVXlEd0DlakyuJbAL1jWQE68YP/MJk7dWnfmh07u
 qCwRedfPLAZkpMhW+xBsLtzkTJi09SCq5zSaYIOs2kcfLwu8Z/NNddgXPXPrudQWotLOd9oUtI
 3iE=
X-SBRS: 2.7
X-MesageID: 20939691
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,279,1589256000"; d="scan'208";a="20939691"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24308.46751.24955.702652@mariner.uk.xensource.com>
Date: Thu, 25 Jun 2020 15:37:19 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
In-Reply-To: <CAKf6xpsqXb0U79r08H-gxvGEaOLTrAgR29EMXomXow0SrNApLQ@mail.gmail.com>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
 <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
 <20200512195005.GA96154@mattapan.m5p.com>
 <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
 <20200512225458.GA1530@mattapan.m5p.com>
 <24253.9543.974853.499775@mariner.uk.xensource.com>
 <0b449d5a-9629-8e41-5354-b985a063eba4@suse.com>
 <24307.32018.502303.817846@mariner.uk.xensource.com>
 <CAKf6xpvLrXkBR6okFQ9u=9GfN-h_XHeLtwQV9pBRRAFXmbwVsQ@mail.gmail.com>
 <24308.42571.430322.191817@mariner.uk.xensource.com>
 <7abcae45-6a58-ea7a-be8b-64be50b080a6@suse.com>
 <CAKf6xpsqXb0U79r08H-gxvGEaOLTrAgR29EMXomXow0SrNApLQ@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Jan Beulich <jbeulich@suse.com>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Elliott Mitchell <ehem+xen@m5p.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("Re: [XEN RFC for-4.14] Re: use of "stat -""):
> On Thu, Jun 25, 2020 at 10:08 AM Jan Beulich <jbeulich@suse.com> wrote:
> > I'm about to test this then, but to be honest I have no idea what
> > to do with the comment. I don't think I could properly justify its
> > deletion in the description (beyond saying it's not really true),
> > nor would I be certain whether to e.g. leave the test -ef part
> > there.
> 
> Yes, this is what made me pause yesterday.  Also, I'm not sure how
> test -ef would be used to check the file & FD.

$ >t
$ exec 3>t
$ rm u
rm: cannot remove 'u': No such file or directory
$ ln t u
$ test t -ef u && echo y
y
$ test /dev/stdin <&3 -ef u && echo y
y
$ mv t v
$ test /dev/stdin <&3 -ef u && echo y
y
$ rm v
$ test /dev/stdin <&3 -ef u && echo y
y
$

This appears to work.  In principle we could switch to this, but (i)
we would want to check that all (recent?) versions of bash do the
sensible thing (ii) we are in a release freeze.

> > Also is there any reason to go through two symlinks then, rather
> > than using /proc/self/fd/$_lockfd directly?
> 
> I think /proc/self/fd/$_lockfd should just be used to avoid playing
> unnecessary FD games.

Xen is frozen at the moment.  Can we please make the minimal change,
rather than the change which cleans the code up the most ?

That does imply some technical debt, but has the lowest risk for the
release.

If you like, combine it with a second patch that changes things to use
test -ef, for post-4.14 ?

Thanks,
Ian.

