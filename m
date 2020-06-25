Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF17209FE1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 15:28:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joRus-00038o-Su; Thu, 25 Jun 2020 13:27:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BrHH=AG=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1joRur-00038d-Hs
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 13:27:45 +0000
X-Inumbo-ID: a6d72c52-b6e7-11ea-81b8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6d72c52-b6e7-11ea-81b8-12813bfff9fa;
 Thu, 25 Jun 2020 13:27:44 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SWtdBJRQAudwXIRNa0FPay5Mh7nIrZFc4DeCcEhl7mIaI1gZ6V/h1YGQ7y6UV71voheIS/lmrZ
 Zj6oJh6T5ACJq0NUWkAwNDb5yKCMn169xBZJTIt9f57nqU96LkKasmqvsYEVUJ1I6HNTlgbl4D
 dUc+d0NXRkLcnXv4qQ5T0u+wVhNbF+kWwZxz1YNS2H7Pr0HLH/Pe4zWBflT6zn7K5r7TQZH8kU
 E6wkuEhlj3cJQpavht/686f58pLSVqTnV2gnVZRF6LxTAEDbmt5IgDmBy7vNsiS04SFwaZjtR/
 ixc=
X-SBRS: 2.7
X-MesageID: 20917201
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,279,1589256000"; d="scan'208";a="20917201"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24308.42571.430322.191817@mariner.uk.xensource.com>
Date: Thu, 25 Jun 2020 14:27:39 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
In-Reply-To: <CAKf6xpvLrXkBR6okFQ9u=9GfN-h_XHeLtwQV9pBRRAFXmbwVsQ@mail.gmail.com>
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
> I was going to just write a patch to replace - with /dev/stdin and ask
> Jan to test it.  When I opened the script, this comment was staring at
> me:
>         # We can't just stat /dev/stdin or /proc/self/fd/$_lockfd or
>         # use bash's test -ef because those all go through what is
>         # actually a synthetic symlink in /proc and we aren't
>         # guaranteed that our stat(2) won't lose the race with an
>         # rm(1) between reading the synthetic link and traversing the
>         # file system to find the inum.
> 
> On my system:
> $ ls -l /dev/stdin
> lrwxrwxrwx 1 root root 15 Jun 24 21:13 /dev/stdin -> /proc/self/fd/0
> $ ls -l /proc/self/fd/0 0<lockfile
> lrwx------ 1 jason jason 64 Jun 24 21:26 /proc/self/fd/0 -> /home/jason/lockfile
> 
> stat /dev/stdin will work around the lack of `stat -` support, but it
> doesn't address the race in the comment.  Is the comment valid?

Thanks, but:

The tests in my transcript show that the comment (which I wrote) is
false.  It shows that stat /dev/stdin works on deleted files, and
stats the right file even if the name has been rused.

>  How would we prove there is no race for /dev/stdin?

It is easy to create the "bad" situation by hand, without racing.

The transcript shows that the output from readlink(2) is a fiction and
that stat works to stat the actual open-file.

> I've mentioned it before, but maybe we should just use the Qubes
> patch.  It leaves the lockfile even when no-one is holding the lock,
> but it simplifies the code and sidesteps the issues we are discussing
> here.
> https://github.com/QubesOS/qubes-vmm-xen/blob/xen-4.13/patch-tools-hotplug-drop-perl-usage-in-locking-mechanism.patch

I don't like that because this locking code might be reused (or maybe
already is used) in contexts with a varying lockfile filename, leaving
many lockfiles.  And because having lockfiles lying about might
confuse sysadmins who are used to programs which use (the broken)
LOCK_EX-style locking paradigm.

So tl;dr: yes, we need that patch to replace - with /dev/stdin.

Thanks,
Ian.

