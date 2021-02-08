Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2195313BA8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 18:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83006.153672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Aky-0005kX-ID; Mon, 08 Feb 2021 17:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83006.153672; Mon, 08 Feb 2021 17:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Aky-0005kB-Em; Mon, 08 Feb 2021 17:55:28 +0000
Received: by outflank-mailman (input) for mailman id 83006;
 Mon, 08 Feb 2021 17:55:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Akw-0005k6-HI
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:55:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Akw-00014n-Ek
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:55:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Akw-000128-DQ
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:55:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9Akt-0003BF-5C; Mon, 08 Feb 2021 17:55:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=R4GG7JJ+EpnkksH0FqdML0mwaQM/AIZTKvFwe1uszLo=; b=BId9BYvKEegyE5vMK6Prc0rO4v
	mpz3GLook9HXFXofbMATQczjBtFxvgUt7RclOjKtxPe3XDBPT10y78oQJzg5Z5YPmPsZFCzRZgDme
	aTstFzl6VMoNa9+uIf7BZUDH09paQtkGsoZQnaUwL340Q3iZ9aWolJlcftNZoQkP67lE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.31498.932428.931134@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 17:55:22 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210111 05/39] tools: add with-xen-scriptdir configure
 option
In-Reply-To: <20210208185413.51acc99b.olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-6-olaf@aepfle.de>
	<24609.24785.791060.128298@mariner.uk.xensource.com>
	<20210208182311.53dac1a3.olaf@aepfle.de>
	<24609.31087.818313.780529@mariner.uk.xensource.com>
	<20210208185413.51acc99b.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("Re: [PATCH v20210111 05/39] tools: add with-xen-scriptdir configure option"):
> Am Mon, 8 Feb 2021 17:48:31 +0000
> schrieb Ian Jackson <iwj@xenproject.org>:
> > > It seems the assignments for CONFIG_DIR and XEN_CONFIG_DIR can be moved up, because $sysconfdir is expected to be set already. As a result the new AC_ARG_WITH= can continue to use "$XEN_CONFIG_DIR/scripts" for the default case.  
> > 
> > That would be best I think.
> 
> I will split this into individual changes and send a separate series.

OK, thanks, that will help with de-risking this from a release PoV.

Ian.

