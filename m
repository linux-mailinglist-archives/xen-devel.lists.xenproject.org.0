Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4A1E7AF8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:51:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecbq-0002Hc-MP; Fri, 29 May 2020 10:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jecbo-0002HR-Va
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:51:29 +0000
X-Inumbo-ID: 58def19a-a19a-11ea-8993-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58def19a-a19a-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 10:51:28 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jSbxCWYuGHUarZwQ0b9uNEHE68IVcRWKLLyJwsud8zSrwqa+EKO5VdEQXgRqA4/RSi/D7n9jEd
 EpSPaB4KT5dcKYx8DK31uUxZ8Ud/aKhhbdBx2s+utNY3ofmjr7jHRcjVfsv92epPc7xHe5JM57
 jvARv9qaKa1G5jIOqbXsiAZxwDwMz3tb6MwHZqGy5BjKKWBfS04otayPDH13emOWfqathegUAP
 A/8RHVWf4qUTtp2H7MOeENNcuujg7hlapgqqUCk8lg/Ad8u8WHUWU5HM6YQj1itMlAxa/Vs3un
 2eI=
X-SBRS: 2.7
X-MesageID: 19041143
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,448,1583211600"; d="scan'208";a="19041143"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24272.59689.495738.841808@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 11:51:21 +0100
To: George Dunlap <George.Dunlap@citrix.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
In-Reply-To: <24272.59646.746545.343358@mariner.uk.xensource.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
> George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
> > > On May 27, 2020, at 4:41 PM, Ian Jackson <ian.jackson@citrix.com> wrote:
> > > 3. Failing that, Xen should provide some other mechanism which would
> > > enable something like update-grub to determine whether a particular
> > > hypervisor can sensibly be run with a policy file and flask=enforcing.
> > 
> > So you want update-grub to check whether *the Xen binary it’s creating entries for* has FLASK enabled.  We generally include the Xen config used to build the hypervisor — could we have it check for CONFIG_XSM_FLASK?
> 
> That would be a possibility.  Including kernel configs has gone out of
> fashion but I think most distros ship them.

I mean most distros ship *Xen* configs even if they don't ship *Linux*
ones.

Ian.

