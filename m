Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7058209FF2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 15:32:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joRyq-0003ws-J3; Thu, 25 Jun 2020 13:31:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BrHH=AG=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1joRyp-0003wn-7S
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 13:31:51 +0000
X-Inumbo-ID: 388a4be9-b6e8-11ea-81bb-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 388a4be9-b6e8-11ea-81bb-12813bfff9fa;
 Thu, 25 Jun 2020 13:31:50 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2Sm0EvpiK5Tkj0AFgopW6war/Q4KNZHaSM2WvtL+W5jp5CFb77A/GvIT0TYvt2tCXaa6SjiNFd
 BgUuFgfP5841CDNB+WZiyYm0gJRpEwbL0tPlPcxvPXkzH/Fcxj+SiLjFunn3CPXdOO5c++C/5S
 PBtvKvtmKb7KkHjyf91klbrbdaWWVdKRaG1Eo/RcOPm2/ehII+AQYZpnRMRMDRVU+BJA/nvkmk
 bfA8Rw36KSnt5tHJzV4EuLb53G5vi9Oxb6lSTSMcb4qzfLCi1aNTppSTO+H3ZQUAKUgWExTksi
 mFI=
X-SBRS: 2.7
X-MesageID: 20932206
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,279,1589256000"; d="scan'208";a="20932206"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24308.42811.393047.88416@mariner.uk.xensource.com>
Date: Thu, 25 Jun 2020 14:31:39 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
In-Reply-To: <6cd9c568-84b9-8304-d56f-99d628d945a1@suse.com>
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
 <6cd9c568-84b9-8304-d56f-99d628d945a1@suse.com>
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
> Looking at vfs_statx() in the kernel, I can't see any provisions to
> get at the data without traversing the specified path.

The question is what "traversing the path" means.

How do you explain this ?

$ >t
$ exec 3>t
$ stat -L -c '%F %i' /dev/stdin <&3
regular empty file 421124
$ ll /dev/stdin <&3
lrwxrwxrwx 1 root root 15 Jun  7 02:01 /dev/stdin -> /proc/self/fd/0
$ ll /proc/self/fd/0 <&3
l-wx------ 1 ian ian 64 Jun 25 14:29 /proc/self/fd/0 -> /home/ian/t
$ mv t u
$ ll /proc/self/fd/0 <&3
l-wx------ 1 ian ian 64 Jun 25 14:29 /proc/self/fd/0 -> /home/ian/u
$ rm u
$ ll /proc/self/fd/0 <&3
l-wx------ 1 ian ian 64 Jun 25 14:29 /proc/self/fd/0 -> '/home/ian/u (deleted)'
$ stat -L -c '%F %i' /dev/stdin <&3
regular empty file 421124
$ ll -Li /dev/stdin <&3
421124 -rw-rw-r-- 0 ian ian 0 Jun 25 14:28 /dev/stdin
$

Clearly it isn't actually following this synthetic symlink to
"/home/ian/u (deleted)".

Ian.

