Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F6246DE9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 19:18:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7ikN-0006r5-Kt; Mon, 17 Aug 2020 17:16:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ScJ9=B3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k7ikM-0006r0-4q
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 17:16:34 +0000
X-Inumbo-ID: 8999bff0-92f5-4b33-93c2-271984938f8e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8999bff0-92f5-4b33-93c2-271984938f8e;
 Mon, 17 Aug 2020 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597684592;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=IAEm1nB9h5wcOknvmcwQEP+RVkNHPz7vevT1P+bAlqg=;
 b=SuR+ltEgzHt45i0QvaIjhdC3xvIM9WBU8KpncE3nVTeT4t56Chv5NHv2
 wd2teLaDG+BEY8uoBBgBtpD54NukAse3o/WeaBSGRSfukyCr2iXt704by
 64xzx/R7evwlS7Z78IEJLvIA6w0PR7aa78mAmnitqfz9F5x4pEKTtphDs U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UAwhTlMROWh5IHwuysJefkSjxrIsV922jteh+Luuzbie4c0C1ZldP2TwW76BcqQjwxKW5SNsWK
 EjMh5E/mfHKGhK8sLGJiWnUP7myUipXnR7r6MfIvVlDx2ZuvoH4F2RN6J3v9xcUYP9vmWbStav
 WNpdMwhfC4X5MxIxh8jT6XwjMcLTjL3x537zDmYFh8J0SsmmlfG69NBE5jp2ZrWPuDp1ErA6Aw
 sCZCp1ExHmNxpc+IdLBq7D2ceNA8zeqlbj+DJ/9Y31RgBX8hvlltSJbR9+P6XEh1SlckboOpjL
 c8k=
X-SBRS: 2.7
X-MesageID: 24860078
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24860078"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24378.47981.601974.542481@mariner.uk.xensource.com>
Date: Mon, 17 Aug 2020 18:16:29 +0100
To: "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Planned osstest outage, around 17th August
In-Reply-To: <24374.49647.650481.677464@mariner.uk.xensource.com>
References: <24371.64746.743317.606471@mariner.uk.xensource.com>
 <24374.49647.650481.677464@mariner.uk.xensource.com>
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

Some of the upgrades have encountered difficulties.  Nothing
insurmountable, but it is taking longer than expected.  We hope to be
done some time tomorrow.  In the meantime osstest is still offline.

Thanks,
Ian.

