Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C202078EE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 18:20:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo87j-0005xs-Hw; Wed, 24 Jun 2020 16:19:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ja3c=AF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jo87i-0005xn-1C
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 16:19:42 +0000
X-Inumbo-ID: 818c1964-b636-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 818c1964-b636-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 16:19:41 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uas/xXVt+4AcmAKP1VNu1dvnjXMglspU4h6VpuY1tkC+ehM7mbzL4UeCZugdtid4QOath1VofJ
 w9SCIoKFek7dak6ftHRFg4Bu6QD9LsA2JY7O99MU2QGel9HHZ1AK5+ytq0CHosma1sQak2p+Oc
 aZb8gTwCHsAYIEpbT0bgX2Bgikf3hzpM85ofnLf34k6B1eboMOuKX2f69cIr9qLarGgqT6fxjl
 sletYTA23AHMQG4LEjurfsp/B9hQzoJYAoDanRnhf8cDvi3kvB/W2yX822lu2Q63xG6aJjSRie
 V7Q=
X-SBRS: 2.7
X-MesageID: 20841141
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,275,1589256000"; d="scan'208";a="20841141"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24307.32018.502303.817846@mariner.uk.xensource.com>
Date: Wed, 24 Jun 2020 17:19:30 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: [XEN RFC for-4.14] Re: use of "stat -"
In-Reply-To: <0b449d5a-9629-8e41-5354-b985a063eba4@suse.com>
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

Jan Beulich writes ("Re: use of "stat -""):
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> On 14.05.2020 13:02, Ian Jackson wrote:
> > I've read this thread.  Jan, I'm sorry that this causes you
> > inconvenience.  I'm hoping it won't come down to a choice between
> > supporting people who want to ship a dom0 without perl, and people who
> > want a dom0 using more-than-a-decade-old coreutils.
> > 
> > Jan, can you tell me what the output is of this on your ancient
> > system:
> > 
> >   $ rm -f t
> >   $ >t
> >   $ exec 3<t
> >   $ stat -L -c '%F %i' /dev/stdin <&3
> >   regular empty file 393549
> >   $ rm t
> >   $ stat -L -c '%F %i' /dev/stdin <&3
> >   regular empty file 393549
> >   $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> >   $
> 
> $ rm -f t
> $ >t
> $ exec 3<t
> $ stat -L -c '%F %i' /dev/stdin <&3
> regular empty file 3380369
> $ rm t
> $ stat -L -c '%F %i' /dev/stdin <&3
> regular empty file 3380369
> $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> regular empty file 3380369
> 
> > Also, the contents of the file "u" afterwards, please.
> 
> Attached.

Thanks.

I think this means that `stat -' can be replaced by `stat /dev/stdin'.

This script is only run on Linux where /dev/stdin has existed
basically forever.  The strace output shows
  stat("/dev/stdin", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
and the transcript shows that your stat(1) behaves as I hope.

Jan, will you send a patch ?  It is best if someone else but me writes
it and tests it because then I am a "clean" reviewer.

Paul, supposing I review such a patch and say it is low risk, and we
commit it by Friday, can it have a release-ack ?

Thanks,
Ian.

