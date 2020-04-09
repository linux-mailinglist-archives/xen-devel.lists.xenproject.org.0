Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F81A35E0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYCk-0004rv-3F; Thu, 09 Apr 2020 14:30:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMYCi-0004rp-8j
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:30:52 +0000
X-Inumbo-ID: b690e030-7a6e-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b690e030-7a6e-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=TcXAQwYo1T1uzYbPEEq6FUW+WO1mQOQ5F8v24cUA3R4=; b=1XCpEbu8v1+nsFhte31j7Kc0Jo
 ysCkHQP88nlIPGQzW0EEZJp+lJQrQOis9qTq0cvTCzGIeZPsJkyuxtSBsnlqh/F7R92wMQmEkAUfQ
 4FkbxeTScV/A4E9F5tKUTHWKWp22ieR/VFu54yIkEXZ8qGQqd0VwS0Wj2yguYUgl1Vzc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYCg-0007Do-K7; Thu, 09 Apr 2020 14:30:50 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYCg-00049J-BT; Thu, 09 Apr 2020 14:30:50 +0000
Date: Thu, 9 Apr 2020 15:30:47 +0100
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/3] mini-os: fix several double frees and memory leaks
Message-ID: <20200409143047.o4ncbup7stcmjjh3@debian>
References: <20200409141240.28876-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141240.28876-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org, samuel.thibault@ens-lyon.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 09, 2020 at 04:12:37PM +0200, Juergen Gross wrote:
> This series fixes two double free() introduced by suspend/resume
> patches and several memory leaks.
> 
> Juergen Gross (3):
>   mini-os: fix double free() in netfront
>   mini-os: fix double free() in xenbus
>   mini-os: fix several memory leaks related to xenbus

Acked-by: Wei Liu <wl@xen.org>

Thanks for fixing these bugs.

