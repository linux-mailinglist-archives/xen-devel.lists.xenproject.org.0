Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62BE20A0BF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 16:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joSii-000810-3y; Thu, 25 Jun 2020 14:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BrHH=AG=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1joSig-00080r-9y
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 14:19:14 +0000
X-Inumbo-ID: d8014360-b6ee-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8014360-b6ee-11ea-bb8b-bc764e2007e4;
 Thu, 25 Jun 2020 14:19:13 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XQR5bV0GV/uKdCPmhTSFGjnXxOyqYpcmr2Cdiqy7pdyLXETKlL2TPSQJvhrGtHuGiLblpvQqVP
 JCIlCZQI8Yu3be2QrJwoAhK0L8bJUlbxMTs+R+1dvw6SRh9SISgsERSV2GG9E0mVD9A1iWoJLG
 aXDCAKnkRKTwkekNVnoSk/4tSzFnrOEQBZDfrjEdTvL2DBVf8FAKV+hMWE4W0vRFV1h5iOOm5j
 n5RRpSaR4Y5XG2ZCcQTX8g5Se0WWSdsAGHDs+J8G2JUYQibxKCVdZy5pk/lu8yiQRfoyh2Wm0H
 grQ=
X-SBRS: 2.7
X-MesageID: 20923418
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,279,1589256000"; d="scan'208";a="20923418"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24308.45659.314018.214428@mariner.uk.xensource.com>
Date: Thu, 25 Jun 2020 15:19:07 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
In-Reply-To: <7abcae45-6a58-ea7a-be8b-64be50b080a6@suse.com>
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 Elliott Mitchell <ehem+xen@m5p.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jan Beulich writes ("Re: [XEN RFC for-4.14] Re: use of "stat -""):
> I'm about to test this then, but to be honest I have no idea what
> to do with the comment. I don't think I could properly justify its
> deletion in the description (beyond saying it's not really true),
> nor would I be certain whether to e.g. leave the test -ef part
> there.

You should delete the comment.  You could replace it with its
opposite.  Something like:

 # Although /dev/stdin (ie /proc/self/fd/0) looks like a symlink,
 # stat(2) bypasses the synthetic symlink and directly accesses the
 # underlying open-file.  So this works correctly even if the file
 # has been renamed or unlinked.

> Also is there any reason to go through two symlinks then, rather
> than using /proc/self/fd/$_lockfd directly?

/dev/stdin is clearer, to my mind.

(The tiny performence difference is not relevant here.  It's also
possible that at some point stat(1) might handle it specially.)

Thanks,
Ian.

