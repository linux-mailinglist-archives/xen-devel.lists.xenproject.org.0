Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF8510055
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313934.531749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njM62-0006WU-E9; Tue, 26 Apr 2022 14:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313934.531749; Tue, 26 Apr 2022 14:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njM62-0006Ud-B9; Tue, 26 Apr 2022 14:23:18 +0000
Received: by outflank-mailman (input) for mailman id 313934;
 Tue, 26 Apr 2022 14:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8dr=VE=citrix.com=prvs=1083bc031=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1njM60-0006UX-KV
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:23:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 676409bc-c56c-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 16:23:14 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 676409bc-c56c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650982994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D4biCrex0PAqtimq9XcrlTuJ8+JgxJ9q9HH6bGP6ayQ=;
  b=EyP42WRK4hE+n0LdWju6L/LxtCHjmBb3MGfBMgaRIdpX4VsKiyj8xuRW
   zjMG+RcGcDEZ8uwUhQH2yUPblhYSl/r6ood8DLPQ8bmXEi1yaD/vtV7YN
   3Bp+NC/h4q2mWWIWePuZUrzppz4rDBKPkKXdOeVAv7tVIR8gvwjtkMlXy
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69354459
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5jJiGaO/TK0V/1DvrR2Gl8FynXyQoLVcMsEvi/4bfWQNrUor0zUDn
 TQZDD2OafqKN2vwLtxzaNix/R9T6MeBzdI1HAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 vZAkK3zVykSYYrliu8CCglSTSFjIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQTK2DO
 5ZEOFKDajyQaQ1kIVkmUKgYhdv0g0HifDhyqUi88P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12b2GBYBL/SE1CGItHmrg4fnmCrhXYsIGb6Q9/h0gUaSzGgeFB0XU1SgpfCzzEW5Xrp3K
 UUS9jA/sKsa+0miT927VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sETo2IEozJjEqdlQiysvov9gjhEzPU8k2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRzwoxZPnqgKuVmSwXuF1e5eJFfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMUpJVTbpnkxPhXKt4wIrKTLufthU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTm313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/kLxrqQo
 iHhCye1CjPX3BX6FOlDUVg7AJuHYHq1hShT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:cArWzK8qvkjJih6u9u9uk+DaI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jztCWE7Ar5N0tNpTntAsa9qDbnhPhICOoqTNKftWvdyQiVxehZhOOIqVDd8m/Fh4xgPM
 9bAtFD4bbLbWSS4/yV3DWF
X-IronPort-AV: E=Sophos;i="5.90,291,1643691600"; 
   d="scan'208";a="69354459"
Date: Tue, 26 Apr 2022 15:23:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libxl: Retry QMP PCI device_add
Message-ID: <YmgAS9jZ/at06PIU@perard.uk.xensource.com>
References: <20220422140703.13614-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220422140703.13614-1-jandryuk@gmail.com>

On Fri, Apr 22, 2022 at 10:07:03AM -0400, Jason Andryuk wrote:
> PCI device assignment to an HVM with stubdom is potentially racy.  First
> the PCI device is assigned to the stubdom via the PV PCI protocol.  Then
> QEMU is sent a QMP command to attach the PCI device to QEMU running
> within the stubdom.  However, the sysfs entries within the stubdom may
> not have appeared by the time QEMU receives the device_add command
> resulting in errors like:
> 
> libxl_qmp.c:1838:qmp_ev_parse_error_messages:Domain 10:Could not open '/sys/bus/pci/devices/0000:00:1f.3/config': No such file or directory
> 
> This patch retries the device assignment up to 10 times with a 1 second
> delay between.  That roughly matches the overall hotplug timeout for
> pci_add_timeout.  pci_add_timeout's initialization is moved to
> do_pci_add since retries call into pci_add_qmp_device_add again.
> 
> The qmp_ev_parse_error_messages error is still printed since it happens
> at a lower level than the pci code controlling the retries.  With that,
> the "Retrying PCI add %d" message is also printed at ERROR level to
> clarify what is happening.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> v2:
> Only retry when a stubdom is present.
> Move pci_add_timeout initialization.
> Use pas->aodev->ao directly.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

