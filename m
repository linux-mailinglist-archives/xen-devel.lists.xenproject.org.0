Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384262484E8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 14:41:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k80va-0001zM-84; Tue, 18 Aug 2020 12:41:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eNH=B4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k80vY-0001zB-Hn
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 12:41:20 +0000
X-Inumbo-ID: a80f5621-b10c-4eb7-ac24-c5abdac4e2af
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a80f5621-b10c-4eb7-ac24-c5abdac4e2af;
 Tue, 18 Aug 2020 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597754479;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=oofhXn9k0ApJrCQovwGejsZYSJvApngYqEVySnA58lw=;
 b=hHQNrOVqb/cqC//kxf2fogrt3sLIWhb0QgjaDUAlXxRPJJSFNAX9TDgY
 bNB5IvOK4FA+/TeDJlfseapidsGkLHr42gADSpOqdxpZ98JcIJ4otORQS
 nYrB9oL3Fz0zwGlSUt5PZxiLa8phMcqH2Ne8s2BcRZDyakpp76UtnHZK8 E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lNmyf6T/LBZMdPPGXuc951HRLvHaWwERP1+P6NPBSobwDZ1Nhb5u24Rwpj9QPZKTZGkadZN0Xq
 CG0gOEuev+2sVaFe6MIClgB9OGKheLhCZH611I0InIH9HDEzBnAAA1tOdyQMcvCi+itS00BLNB
 zg7hVdo+4cQTWt2t6i3t8C1QVKJAXhoU+6E2FzaXA63BycJlZaB0vYR7/5OOT+UmTk8I/GT3n0
 P41xuT+RjZOO/XnjDGiPeT1CvDAbiC9FM+C/5GKLEreUMHjVU4mfOnLK36onrDf16QQHnxoy8x
 vBk=
X-SBRS: 2.7
X-MesageID: 25078715
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25078715"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24379.52330.543736.599878@mariner.uk.xensource.com>
Date: Tue, 18 Aug 2020 13:41:14 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
 <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH 1/1] docs/process/branching-checklist: Get osstest branch
 right
In-Reply-To: <20200715162511.5941-2-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <20200715162511.5941-2-ian.jackson@eu.citrix.com>
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

Ian Jackson writes ("[PATCH 1/1] docs/process/branching-checklist: Get osstest branch right"):
> The runes for this manual osstest were wrong.  It needs to run as
> osstest, and cr-for-branches should be run from testing.git.
> 
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

Not sure if I need an ack for this but one hasn't been forthcoming and
there have been no naks, so I have pushed it.

Ian.

