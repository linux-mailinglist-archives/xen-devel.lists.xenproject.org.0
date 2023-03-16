Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A522D6BD060
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510581.788494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnG8-0000X1-Ty; Thu, 16 Mar 2023 13:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510581.788494; Thu, 16 Mar 2023 13:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnG8-0000Tj-Qt; Thu, 16 Mar 2023 13:03:08 +0000
Received: by outflank-mailman (input) for mailman id 510581;
 Thu, 16 Mar 2023 13:03:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F7HK=7I=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1pcnG7-0000T2-DY
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:03:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2c9620d-c3fa-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 14:03:04 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-97jO7ZR6NzerANANhGO_zA-1; Thu, 16 Mar 2023 09:02:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22625101A553;
 Thu, 16 Mar 2023 13:02:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DADAE40C6E68;
 Thu, 16 Mar 2023 13:02:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 384031801CF6; Thu, 16 Mar 2023 14:02:33 +0100 (CET)
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
X-Inumbo-ID: e2c9620d-c3fa-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678971783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rv/7weyITGIgh9XHuzq9wGpH0QjJJjSvb5kXrWfqWHo=;
	b=BOiVvKUewQ8jXy+9/BaCUL5bbLmx64MegRHnVZxnNppG8xiI5Nkmxkx90V3XRNmhPRhcWJ
	kj4FsQbmll8xdgPAOO1pYWmEvwbdoM9TkEsqpa7fYyIevv1s5xE14dyf9+IWdRNR24AXjB
	0U2vPnMekr0Oc/viWF20PbvQIR4IFow=
X-MC-Unique: 97jO7ZR6NzerANANhGO_zA-1
Date: Thu, 16 Mar 2023 14:02:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: seabios <seabios@seabios.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: seabios 1.16.2 release tagged (was: Re: [SeaBIOS] Re: [SeaBIOS
 PATCH] xen: require Xen info structure at). 0x1000 to detect Xen
Message-ID: <20230316130233.shp5i6mto4gvvvqc@sirius.home.kraxel.org>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
 <Y9scWQ/ASMCrY/uM@morn>
 <fd3259a2765d4b33ccf7baea320ac798bab63159.camel@infradead.org>
 <20230202091031.xmnao56wziptjak2@sirius.home.kraxel.org>
 <0f25af10f21de2a36f4748f20d457dca5bce1f64.camel@infradead.org>
 <20230309112703.dht7yisk7on3sfwg@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309112703.dht7yisk7on3sfwg@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

  Hi,

> Ok, we have as of today two changes:
> 
>   kraxel@sirius ~/projects/seabios (master)# git log --oneline rel-1.16.1..
>   ea1b7a073390 xen: require Xen info structure at 0x1000 to detect Xen
>   645a64b4911d usb: fix wrong init of keyboard/mouse's if first interface is not boot protocol
> 
> With no changes since January and no known issues.
> I think we can safely tag the current state as 1.16.2.
> 
> I'll do that next monday (plus qemu pull request) unless
> there are objections until then.

Oops, totally forgot it.  Three days after the deadline, still no
objections raised, so I tagged the release today and uploaded the
source tarball.  qemu pull request for the update is out of the
door too.

take care,
  Gerd


