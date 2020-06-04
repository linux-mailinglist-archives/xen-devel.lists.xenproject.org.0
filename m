Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF61EE4C8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:51:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgpKt-0006pv-Fu; Thu, 04 Jun 2020 12:51:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTSX=7R=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jgpKs-0006pq-0X
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:51:06 +0000
X-Inumbo-ID: 0c3e3f40-a662-11ea-ae76-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c3e3f40-a662-11ea-ae76-12813bfff9fa;
 Thu, 04 Jun 2020 12:51:04 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: puB0HrZYKQcJ/e6j5iky5ms+gFHd3m9ro5GG+Zfs4IvWBR9ap5dfGMcja46rRfWZhIigt/yWfK
 bbRsZujuRBk/8FLJ16O4tRdUzy/1xPbj10d7YsX/l4DTN8vsN3k+By5SftsRDMfNuV9lmSc5Fx
 ZGgXDk3qB6Yvrs+oTAXIwxgwQLKCv+nVi34lNdaprxzd37JLjLfXdL0xVx4cZnO54ZyhxJrPVd
 m771OMwHqAmVPT+EfcX3BqLrwY+eOi1vRoQMFuprHfnhuTr+7jDwp3r7k9VLESl3yqHtCKFSN2
 ZTw=
X-SBRS: 2.7
X-MesageID: 19971885
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19971885"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24280.60980.488961.267238@mariner.uk.xensource.com>
Date: Thu, 4 Jun 2020 13:51:00 +0100
To: Jim Fehlig <jfehlig@suse.com>
Subject: Re: [libvirt test] 149773: regressions - FAIL
In-Reply-To: <7c47a937-551f-2c7a-edd3-8b172155a506@suse.com>
References: <osstest-149773-mainreport@xen.org>
 <7c47a937-551f-2c7a-edd3-8b172155a506@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jim Fehlig writes ("Re: [libvirt test] 149773: regressions - FAIL"):
> On 4/24/20 3:53 AM, osstest service owner wrote:
> > flight 149773 libvirt real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/149773/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >   build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 146182
> >   build-i386-libvirt            6 libvirt-build            fail REGR. vs. 146182
> >   build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 146182
> >   build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 146182
> 
> Probably best to disable these tests to avoid all the spam.

I have fixed the build bug now...

Ian.

