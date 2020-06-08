Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4373E1F1C2F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 17:35:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiJn9-0000O6-Vs; Mon, 08 Jun 2020 15:34:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXsd=7V=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiJn9-0000O0-0I
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 15:34:27 +0000
X-Inumbo-ID: 88d8ba60-a99d-11ea-ba62-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88d8ba60-a99d-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 15:34:26 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OSOzI/S9SdHMMMoYJ/idIib469zGCXmjGriGi37nbNQRB/62RRlc4TwlRUNwS10SEZSre+1XIX
 1SEG2YMhpPkz/d8oasXt4EWfZOCjpdieXRXtFNICOnRWR8eP0lu5mJoM6aCTyVeyrJOzoSAqTt
 PCX9rJo6qzG8RnhP6lMRPAK74Pjqhihq4vYs0ybC1j1u1gcKVz8irWcHykT5ijKymNPF+rJfbG
 11X1c1pxDkQUPRq5+n6bHrjmQ1HfCrZDc8a8OIGwLebEwLOmMIxJu7ATAOhxzUHbwEVT1Z0WiB
 mW4=
X-SBRS: 2.7
X-MesageID: 20246350
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="20246350"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24286.23167.134656.772769@mariner.uk.xensource.com>
Date: Mon, 8 Jun 2020 16:34:23 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)
In-Reply-To: <24273.3201.443254.296963@mariner.uk.xensource.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
 <005401d635ac$90bf9510$b23ebf30$@xen.org>
 <24273.3201.443254.296963@mariner.uk.xensource.com>
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
 "committers@xenproject.org" <committers@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)"):
> Paul Durrant writes ("RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)"):
> > I assume we can revert if things go badly wrong and being able to commission more machines would seem to be quite beneficial at this
> > stage.
> 
> Thanks for your opinion.
> 
> It would be possible to revert the final switch, yes.  Most of the
> other changes are supposed to work with stretch too.
> 
> I haven't done a test run with the new code, but the old version of
> Debian.  I will do that.  That will give confidence that we could, in
> fact, revert things.

I have now done this and it resulted in one bugfix.

So if you are still content to go ahead I would like to push this
series to osstest's own self-push-gate now.

Ian.

