Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851BA1FF866
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 18:00:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwxW-0003RX-Sh; Thu, 18 Jun 2020 16:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/Oj=77=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jlwxV-0003RJ-5z
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 16:00:09 +0000
X-Inumbo-ID: c7f818c6-b17c-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7f818c6-b17c-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 16:00:08 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NDAXoFPalvBpS5wXQFuB417IHjeB67cSo9X8ad1CfoZTJniq0JiGeYFHdr9dkQhV+g+v4SdrTj
 ApJtq9Eh9AmfJXdbOwbg45h6ZslONaOUT3RZB0Xwcbndi5mRQ5YF//s9CJmG1RnsgZIWs3V0aS
 QstuC8mCw4kA8U98tWUgECeh67dvqtuNim/vSh0H+D1nZx31toerLCcDSvaGkDjaeCPEZsufKO
 mabEmw8NPGahbINssD0JnEH85U3L/re0gT4ELYRN/QMflWlfCEw4KOwHQqvDcs2s4HeeA7qDMe
 +v0=
X-SBRS: 2.7
X-MesageID: 20689301
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20689301"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24299.36738.827663.937330@mariner.uk.xensource.com>
Date: Thu, 18 Jun 2020 17:00:02 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH for-4.14] xl: Allow shutdown wait for domain death
In-Reply-To: <006701d64588$768bf1c0$63a3d540$@xen.org>
References: <20200617023642.80594-1-jandryuk@gmail.com>
 <24299.35750.218855.454255@mariner.uk.xensource.com>
 <006701d64588$768bf1c0$63a3d540$@xen.org>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Paul Durrant' <xadimgnik@gmail.com>,
 'Jason Andryuk' <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH for-4.14] xl: Allow shutdown wait for domain death"):
> > -----Original Message-----
> > From: Ian Jackson <ian.jackson@citrix.com>
...
> > I have reviewed this patch particularly carefully with a view to
> > understanding what happens if you pass just one `-w' as before.
> > I have convinced myself that there is definitely no change, so I don't
> > think this patch can introduce a regression.
> 
> Ok, I'll trust your judgement.

Thanks :-).  Pushed.

Ian.

