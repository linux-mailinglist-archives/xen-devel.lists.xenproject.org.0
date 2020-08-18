Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00A248CAF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 19:16:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k85Cy-000457-Bz; Tue, 18 Aug 2020 17:15:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eNH=B4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k85Cx-000452-0k
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 17:15:35 +0000
X-Inumbo-ID: e145d00f-7e4f-471b-aa15-6e5e1c0e06d5
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e145d00f-7e4f-471b-aa15-6e5e1c0e06d5;
 Tue, 18 Aug 2020 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597770934;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=/A9/35aXi2WrUe09YhYjNzyeAZIGO+EuCKY95pOwk5Q=;
 b=MfHwgV+oGz3AuWpYxaBBTQVhXLP4L8+H0FWqTzVmf0GhyuJ5SkKF7wtH
 v0NznyY2Lv/Oi0piJGS193LbFfdwi0HZ1Vy0hLI4+zfDIxIcrTb8u0R6a
 dxeHFR8I6z72HUK730QKqkYFZkUJODsjC62VURVyphQL/BBn3l1emEvO5 Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: moJaectVjpzkIHtkNWL0kDw4Mni1O3MICqgO5f0L3WkOLecmkPUPrifAVBfV1Vqo1woEr30OYf
 1FxmTT3LmE3oJKOcAlXE8CcvvGnwDxnnREaw09jG0Wl9BpIoozL0T7at17/wX4WXaRjsQ8Pk11
 K1GtYVE393ui+SoAoNDOQf9yfYnMigHoqWbfTfa0o5g3CoBbwkTULWM3hc3WepHwb5BxTwjTtQ
 QDLV81W6JeHnsgr5D9vT5hffAUjdzZEKciaHXH6eptPf/IDywrRZ3OGVwuR2vUJIHOxH1LCdd/
 deo=
X-SBRS: 2.7
X-MesageID: 24777416
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,328,1592884800"; d="scan'208";a="24777416"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24380.3250.48843.989049@mariner.uk.xensource.com>
Date: Tue, 18 Aug 2020 18:15:30 +0100
To: "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Planned osstest outage, around 17th August
In-Reply-To: <24378.47981.601974.542481@mariner.uk.xensource.com>
References: <24371.64746.743317.606471@mariner.uk.xensource.com>
 <24374.49647.650481.677464@mariner.uk.xensource.com>
 <24378.47981.601974.542481@mariner.uk.xensource.com>
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

Ian Jackson writes ("Re: Planned osstest outage, around 17th August"):
> Some of the upgrades have encountered difficulties.  Nothing
> insurmountable, but it is taking longer than expected.  We hope to be
> done some time tomorrow.  In the meantime osstest is still offline.

Unfortunately we are still having slight difficulties and I can't put
it all properly back into service just yet.

Ian.

