Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403BC1FBC0E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 18:48:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEkC-0000wa-O7; Tue, 16 Jun 2020 16:47:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWw4=75=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jlEkB-0000wV-7L
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 16:47:27 +0000
X-Inumbo-ID: 0ecd2486-aff1-11ea-b90f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ecd2486-aff1-11ea-b90f-12813bfff9fa;
 Tue, 16 Jun 2020 16:47:26 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fSdtVnm6JJHdsgczPmagCN9PT3HkelCEfL3NgqETTrT+3N/7ePfXnC/KOzCDjEJp1wWLEHwJMX
 1o/PpmsnHJQo2B9UL0ex/15T68j7DbvhCU9B6OmcHfsPaI7JsGMjun7Ff0RXvA0Uw7jWjb3jcC
 zrSmqDlTUCFq6yGUX6t2LZ9PJhkgAmuALYtoCQPo5zWaQVgDmNRzIk1GF5173/6x3OWWgDYu4b
 TrkeHlb88aqWBQS6WJIaksc0OeMHNcIJUy6oxi53VHDatfCeoNZjlDWjm7RvSuB7r21u30oy/X
 VUE=
X-SBRS: 2.7
X-MesageID: 20202571
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20202571"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24296.63385.85216.194083@mariner.uk.xensource.com>
Date: Tue, 16 Jun 2020 17:47:21 +0100
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Subject: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved)
In-Reply-To: <24295.32330.508237.225844@mariner.uk.xensource.com>
References: <osstest-151033-mainreport@xen.org>
 <24291.43673.301735.439410@mariner.uk.xensource.com>
 <24295.32330.508237.225844@mariner.uk.xensource.com>
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

Ian Jackson writes ("Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved)"):
> I propose to update in
>   http://xenbits.xen.org/gitweb/?p=libvirt.git;a=summary
> the refs
>   refs/heads/osstest/frozen/xen-4.10-testing
>   refs/heads/osstest/frozen/xen-4.9-testing
> from
>   681bc423e823ab86b20748db311721bdef20defe
>   981e2c70973454cad360f7c9eec2d6ded0a86747
> respectively to
>   076a2b409667dd9f716a2a2085e1ffea9d58fe8b
> which is current value of
>   refs/heads/osstest/frozen/xen-4.11-testing
> 
> Both of those will be fast-forward updates.

I have now done this.  There will be a further osstest change which I
think will then sort all of this out.

Ian.

