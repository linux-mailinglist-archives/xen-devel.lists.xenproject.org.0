Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9EF1FCDC9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:53:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXZd-0001tH-8V; Wed, 17 Jun 2020 12:53:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIsh=76=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlXZc-0001tB-11
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:53:48 +0000
X-Inumbo-ID: 9542b9f6-b099-11ea-bb8b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9542b9f6-b099-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 12:53:47 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hFbQ4rmH6qBHHMliPvv+BVE5yCWgnHfKKS/Tpff7AFdUQbh5OcnX19iN/TFhP3Un6irs+K3dsX
 nVpcWjz0GwpMCH0syRTI21OTlAxJPjzph3YfiwoaUuZmhoNNt/RzF4UBJe11WpaguFYyJ9cofB
 q+zEIVhIA2yuTUCeoZyGGZeWQUWo4hOn3UOTHT76s9bk54EPS6feDMMii68pbS6S7f4WiWQhrB
 CYgKZ1oe28o+wBgNcyIcSwoKDleFBXxpfZEFLESogC6kjZ6z4S/RVv9aACfY7UH32xW+lahws+
 MUg=
X-SBRS: 2.7
X-MesageID: 20567749
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,522,1583211600"; d="scan'208";a="20567749"
Date: Wed, 17 Jun 2020 14:53:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
Message-ID: <20200617125339.GB735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
 <DM5PR1101MB22669C0DD0A5AA455681A08D809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <20200617092103.GZ735@Air-de-Roger>
 <DM5PR1101MB22669E5CB0C4384B1005A58E809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <DM5PR1101MB22669E5CB0C4384B1005A58E809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 12:37:13PM +0000, Kang, Luwei wrote:
> > How does KVM deal with this, do they insert/modify trace packets on trapped
> > and emulated instructions by the VMM?
> 
> The KVM includes instruction decoder and emulator(arch/x86/kvm/emulate.c), and the guest's memory can be set to write-protect as well. But it doesn't support Intel PT packets software emulator. For KVM, the Intel PT feature will be exposed to KVM guest and KVM guest can use Intel PT feature like native.

But if such feature is exposed to the guest for it's own usage, won't
it be missing packets for instructions emulated by the VMM?

Thanks, Roger.

