Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADF1D9AC8
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:10:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb3sm-0007KW-S7; Tue, 19 May 2020 15:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpDv=7B=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jb3sl-0007KR-To
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:10:15 +0000
X-Inumbo-ID: d7b92018-99e2-11ea-9887-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7b92018-99e2-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 15:10:15 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UjjAFFzsPSwk/KYosV2Pe+2/hXCaV4VzkjbANRIO1h0850cizeihSQN+kdf3bixJaJ4XpsCTKL
 fUCVoLQ+cJQHHY6xPMYe3cKblKhVzn4WOQDovWQ1H+E86w4FKKPa6n1mo5IVcJ8a595fwV5rxu
 rcpGvFOdro9EFaoPZLugrHrVacZH1NmLykvZ83pBAO5TxMGOf2Gq5MtWzlR12H1a2H4SZoR+Gd
 6MhctZ6N7t3A0w/oO089GrJ+yrmxdKdw5s/NXEXdJbS/IYBBDG1KmxDSNycn1jVOMFCVQtCUXI
 BRw=
X-SBRS: 2.7
X-MesageID: 18172747
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18172747"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24259.63185.474995.498745@mariner.uk.xensource.com>
Date: Tue, 19 May 2020 16:10:09 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v7 07/19] libxl: write qemu arguments into separate
 xenstore keys
In-Reply-To: <20200519015503.115236-8-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <20200519015503.115236-8-jandryuk@gmail.com>
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
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v7 07/19] libxl: write qemu arguments into separate xenstore keys"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> This allows using arguments with spaces, like -append, without
> nominating any special "separator" character.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Write arguments in dm-argv directory instead of overloading mini-os's
> dmargs string.
> 
> Make libxl__write_stub_dmargs vary behaviour based on the
> is_linux_stubdom flag.

Thank you, I like this.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

