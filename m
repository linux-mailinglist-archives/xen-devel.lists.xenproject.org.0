Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95540244D2D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 18:56:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6cz8-0007yg-AC; Fri, 14 Aug 2020 16:55:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6cz6-0007yb-SX
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 16:55:16 +0000
X-Inumbo-ID: 6b07fecd-dba9-4a01-b5a0-36f4ea2c7962
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b07fecd-dba9-4a01-b5a0-36f4ea2c7962;
 Fri, 14 Aug 2020 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597424115;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=fPlJ9+aKoFusmKdB1ZVmmkGMFH2I0gczxz3s3mNbj+U=;
 b=b0ouzRvOOWhlIv3UojlNa8uPzI8vmAE6XXLtng5vg4Msz0MQvOx9+PGV
 cH8qV5pNdKCwpTqBAmmq74FY0cgmM0f/wtmOiCoRDlEOu4zhByWSgcALG
 ZXzhso7rbGxWs6RAN5177PHZoT6RgCwiPLqUrdxal7eQiVyfTBVEF9K5l 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4NG30KvVOXdApYEiq8xVOQ83F6dSfdOKqm8Ca2qImadeTUqbUpIh+Rg0ClPlmLUdm9+h5Ud9ty
 qh8CRruKL+y5AIPsIeel59pWKyVC5C9Uy2iv+RGWd7wb6jPEWZkT39s4ixq0/aPbPWbRfi2xJm
 rjXO7gDNFwEWm1CB5kanFR+f5mAVi41YiQlkZNJdBEInjT41NHUIEO7rfLb0z7477sI6HmLjaF
 tALKeDx6nDUqC1Es+0MnymDB+SRN0/NS7a9QzXobYZjwTUc8WuClWCmMJ9GyI2gmMIRwokV0wE
 oks=
X-SBRS: 2.7
X-MesageID: 24543199
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24543199"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24374.49647.650481.677464@mariner.uk.xensource.com>
Date: Fri, 14 Aug 2020 17:55:11 +0100
To: "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Planned osstest outage, around 17th August
In-Reply-To: <24371.64746.743317.606471@mariner.uk.xensource.com>
References: <24371.64746.743317.606471@mariner.uk.xensource.com>
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

Ian Jackson writes ("Planned osstest outage, around 17th August"):
> osstest's infrastructure hosts need upgrading to Debian "buster" (aka
> Debian "stable").  We are planning to do this on Monday the 17th of
> August.
> 
> This will involve telling osstest to start draining its queues some
> time around the 15th of August.  If all goes well, it will be back in
> operation late on the 17th.  But it is possible that difficulties will
> arise, in which case it might be out of operation, or operating in a
> degraded way, for perhaps the rest of that week.
> 
> Please let me know if you think this is a bad time.

I have dropped stop files which means that osstest will not pick up
new work until service is (hopefully!) restored on Monday.

Ian.

