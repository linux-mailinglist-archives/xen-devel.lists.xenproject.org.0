Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C424855F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 14:52:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k816K-0003CA-S7; Tue, 18 Aug 2020 12:52:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eNH=B4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k816J-0003C5-9z
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 12:52:27 +0000
X-Inumbo-ID: 55a3595d-3e85-4dc8-a101-7271f9f0d339
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55a3595d-3e85-4dc8-a101-7271f9f0d339;
 Tue, 18 Aug 2020 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597755145;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=JVD6TofIfPL6s02i2L1z/nJZS2UmGmzK8VfH7U2luvs=;
 b=JVPlOjKdcI0n/L+9Nwb9zHHdsh/4tNkaGCWM0DiU/aktcNpaD0dr0aTZ
 uyaiHjPCEo1/vVKXc5oPz4XRiAYKc2d6Xs6kkR9w7XXUfZMqhJTGCeLno
 g8DE8cAcXITCkiMZJdJ7BVIwgXxr2wrLiNd8RVUVT44+vssK0q8Y3Bodf s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6BsmeR5Sn133RrxxcQcVNrVxMgwltXwuXhIVD/o60QVZR+y1iF7mMqiRlhHOEX6wdu1GjAOezv
 8g7DMAFn+7zkXNq3AI/IPXjXWjZPuUqZ+yjAabjkcbzN+D4W2uai+xSqrDdNwKkgzHM7wSowrk
 UHFNjTpVih7hOVogmgVBNj4fsdgChV6RZkCDzPOVzQI4S6iAp29OjfY4iTDdR/ooeZvGOS/N/p
 rjTUqLNd0G8uYIkpRRB/ky1PzV20xy2B3IqDKJjYCjMN8CzWpcT9KrpDCR0lFggKdXyp81+Pol
 1jo=
X-SBRS: 2.7
X-MesageID: 24748123
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="24748123"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24379.52996.179242.596298@mariner.uk.xensource.com>
Date: Tue, 18 Aug 2020 13:52:20 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
 <George.Dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH 00/14] kernel-doc: public/arch-arm.h
In-Reply-To: <alpine.DEB.2.21.2008070953090.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2008070953090.16004@sstabellini-ThinkPad-T480s>
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

Stefano Stabellini writes ("Re: [PATCH 00/14] kernel-doc: public/arch-arm.h"):
> I am replying to this email as I have been told that the original was
> filtered as spam due to the tarball attachment. The tarball contains
> some example html output document files from sphinx.

Thanks.

Thanks for all your work.  This is definiteely going in the right
direection.  I skimread all the patches and have nothing further to
add to what others have said.

How soon can we arrange for this processing to be done automatically
(on xenbits, I guess) ?  Would you be prepared to set this up if I add
your ssh key to the "xendocs" account which builds the existing docs ?

Ian.

