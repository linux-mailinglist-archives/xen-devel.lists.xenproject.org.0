Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C0D1EA587
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfl4G-0003Yr-Ax; Mon, 01 Jun 2020 14:05:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O25q=7O=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jfl4E-0003Ym-2C
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:05:30 +0000
X-Inumbo-ID: f292ef3a-a410-11ea-ab1e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f292ef3a-a410-11ea-ab1e-12813bfff9fa;
 Mon, 01 Jun 2020 14:05:29 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vKrbtZoTEaGsAp+FDXIM5zE2w1ao9mmNZbEahv6IwLPK08ItENm+RpnF9+7U8IV1wH+gDTON+L
 Xv7CAeoBpgzY45phJsx1CfsLeSKuzxRuKiKVOvW0EumEYl8TAxFjo0H8zEEOHQwPURRr7gobpt
 OcHrRl0QAjHGIemis3Gd3dlxe+BVNHjFYprrOs6Zsz7ZvNiok/5egN0E1mN7oG9Lu9qHG39wA6
 hxEWVRPhoetS8lRusDNW+RcHCf/Aau0E8aYAY4qT5BAuxISpAGEbEmmLvOXUr1L7Nt6SAA8IMJ
 M6o=
X-SBRS: 2.7
X-MesageID: 18943836
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,461,1583211600"; d="scan'208";a="18943836"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24277.2850.827651.585185@mariner.uk.xensource.com>
Date: Mon, 1 Jun 2020 15:05:22 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
In-Reply-To: <EEFCB4D0-9C2F-4527-8445-0FA78DE7285E@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
 <24273.8332.662607.125522@mariner.uk.xensource.com>
 <7eaa7541-f698-b29b-b4b3-1f40fc37c5d7@xen.org>
 <63838ce9-8dbf-aacf-521d-97540758a945@suse.com>
 <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
 <EEFCB4D0-9C2F-4527-8445-0FA78DE7285E@citrix.com>
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
> The options proposed have included:

Thanks for summarising!

> 1. Making the tools not generate a FLASK policy unless FLASK is enabled in the hypervisor being built.  This is flaky because there’s no necessary connection between the two builds.
...
> Ultimately, I have the feeling that #1, although somewhat awkward, is going to be the best solution: packagers can arrange that FLASK policies only be installed when FLASK policies are created.  People doing self-builds based on distro packages will be covered; people doing home-grown self-builds with non-default FLASK settings will need to take extra care to make sure the tools do the right thing.

For these home-grown self-builds, making `flask=enforcing' the default
boot entry will make the resulting entry not boot.  So ISTM that
`flask=enforcing' cannot be in the default boot entry unless it's
*known* that FLASK is enabled in the hypervisor.

(Right now update-grub does not make the XSM entries the default, but
clearly it would be better for it to do so if FLASK is enabled.)

Adding the /boot/<xen>.config fallback to update-grub now risks
accidentally going back to non-FLASK booting at some future point when
the xen packager decides not to ship the .config any more...

Ian.

