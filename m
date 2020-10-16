Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1F2907F5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 17:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8151.21670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTRIH-00080v-V0; Fri, 16 Oct 2020 15:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8151.21670; Fri, 16 Oct 2020 15:05:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTRIH-00080W-Rk; Fri, 16 Oct 2020 15:05:21 +0000
Received: by outflank-mailman (input) for mailman id 8151;
 Fri, 16 Oct 2020 15:05:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q1u=DX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kTRIG-00080R-K3
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:05:20 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 592bf120-8a6b-4b6f-a002-3f45eb8d469d;
 Fri, 16 Oct 2020 15:05:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0Q1u=DX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kTRIG-00080R-K3
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:05:20 +0000
X-Inumbo-ID: 592bf120-8a6b-4b6f-a002-3f45eb8d469d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 592bf120-8a6b-4b6f-a002-3f45eb8d469d;
	Fri, 16 Oct 2020 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602860718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lzQYHByc9rCyTSqeD2dVH4ACwWaigXIrDdagCmA+pJc=;
  b=VvDUQaqrdy5Rt+lplW1nfyapeLFLkmfoHuLYoDY4hS0BpGtMWrMs3Fae
   8rHlEG1oDSl4kwYp0htMm4GKtjXk0zwrs+fUXEc0FAiPkktG8x76DfLO4
   KBkqGdSUE08svWBZuUDLvWYPnT0bRXATEMzbo8EcoIvU0H4YwUtYymV7l
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8xrsJXClWkgNoBBsL3od8vw5BuwDctmtaWKaLGuyACzzj+7cYljg5NTteI5HRnhC7FxKWPDppG
 pflLdsXdkaofdbUt2IAxnH75q6vBTJ85FLlv3LNCoJUFupdHYhKBseZ0wtaTLEbajzXDSOFbns
 WUysT5hhQDlpfO7t1WvSOlWBxu6ZDxWPKa0DUDKeSWlX51e6mPJnbWsC32WpOPBvhTteZprxM0
 QHgJOMzsHmxmyZdhenrk5Z4cIMllKL8Z73PyJQpHTd7t+KtXL0k+noEOBxuhJmhhSGf9TQYVwH
 YGU=
X-SBRS: 2.5
X-MesageID: 30227108
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,383,1596513600"; 
   d="scan'208";a="30227108"
Date: Fri, 16 Oct 2020 16:05:14 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] accel: Add xen CpusAccel using dummy-cpus
Message-ID: <20201016150514.GA3105841@perard.uk.xensource.com>
References: <20201013140511.5681-1-jandryuk@gmail.com>
 <20201013140511.5681-4-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201013140511.5681-4-jandryuk@gmail.com>

On Tue, Oct 13, 2020 at 10:05:11AM -0400, Jason Andryuk wrote:
> Xen was broken by commit 1583a3898853 ("cpus: extract out qtest-specific
> code to accel/qtest").  Xen relied on qemu_init_vcpu() calling
> qemu_dummy_start_vcpu() in the default case, but that was replaced by
> g_assert_not_reached().
> 
> Add a minimal "CpusAccel" for Xen using the dummy-cpus implementation
> used by qtest.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

