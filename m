Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784522260E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 16:44:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw57U-0005XX-NF; Thu, 16 Jul 2020 14:44:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw57T-0005XR-MO
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 14:44:19 +0000
X-Inumbo-ID: d3e3d5f6-c772-11ea-94c4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3e3d5f6-c772-11ea-94c4-12813bfff9fa;
 Thu, 16 Jul 2020 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594910658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qwTSYK560X0BNoFkVmqMazfkzBL6WpAx2P98JYb/EO4=;
 b=VDeqjvMkchkq3TlrwyPu4trVka2e2VxvtgwN8mqfN6Gb7c2oHhgTKREK
 eub2xSlyPKMbhOtwrVjzgqD7XjybOFdoWntPUogxLvqC7gr0KsMWrXbbA
 9oRPBkJzstYk59GqV3d9g4oOmIaoTE0EpgAWkUUSr6l3grONvrFgohQWh s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WjIjTeGoOehPh+ITlKQb35aLNU0DcABCMpNGUqW7T+gYa3gQCU1Gk2cNA9Tpn4TsgBMz7QVnSZ
 JAsvMs6UJGLRJc7++DAy1VP727Y2Gh0XYUCAKzemuGJ/a87P4z5F1IZq1cTgs4dI+PxpySexTi
 WFHI5GSN94vux7yH2BjmfyvhslxsUkpdHzB4Jir/+JXU/NT+NviORmAAsVR2RJj2YcW9tOhBqx
 Gvsm1ea8TMi0F8oC9jENzSKZxTbR1QiRPz7IuOmGxgw+VmmHlqBRxPFXqHnfi02MiR9/WRdNMW
 7a4=
X-SBRS: 2.7
X-MesageID: 22731835
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,359,1589256000"; d="scan'208";a="22731835"
Date: Thu, 16 Jul 2020 16:44:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] compat: add a little bit of description to xlat.lst
Message-ID: <20200716144404.GR7191@Air-de-Roger>
References: <d7d95acc-11b0-278b-373e-0115cfa99b51@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7d95acc-11b0-278b-373e-0115cfa99b51@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 16, 2020 at 02:21:33PM +0200, Jan Beulich wrote:
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for writing this up!

