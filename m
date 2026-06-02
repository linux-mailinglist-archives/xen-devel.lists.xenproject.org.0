Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /+x1Oz8iHmoEhgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 02:22:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB2626884
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 02:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324318.1589942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCtZ-0001Q2-45; Tue, 02 Jun 2026 00:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324318.1589942; Tue, 02 Jun 2026 00:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCtZ-0001Ns-12; Tue, 02 Jun 2026 00:22:13 +0000
Received: by outflank-mailman (input) for mailman id 1324318;
 Tue, 02 Jun 2026 00:22:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUCtY-0001N0-C7
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 00:22:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUCtX-00F48a-ES
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 02:22:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e2216-5cb7-0a2a0a5109dd-0a2a4509b95a-26
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:22:11 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e21ba-2497-0a2a45090019-ac6904fee97e-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:20:10 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E7E76001A;
 Tue,  2 Jun 2026 00:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85DE1F00899;
 Tue,  2 Jun 2026 00:20:08 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780359609;
	bh=zFWWWdg8mapYQ9CM6egymitihblA04rJ/04j1DIBtpo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FBo+BWgWzc9Js/Pc9au5yBRAMI2JYYxjOpe9pHrxujcQhU6hgmoDCvEFEwP36gaRN
	 Jo0zPuyZray/sYJM+B9bFEtx6i/Z2SynfUrQ3Ti5ra7Fc3a8nnT0bT9Bn9vTrGkWei
	 vlnIBe6hfuskKOGe/NLoZ57KgQprKu2Oa21Tqqix9QHSygZYsIVCM/GwTDJvci5vI4
	 1Bxs7DmdzI1OvSGwdqAoKYCmn40fxcg3ScaDLOqryknbTHxX2BI2Yz5Fkkk5/YsctS
	 YJz6dAa0Py5hVipQoe5KUAPT7mJUjIZfIisTIVS6GgrPXZgrOl0SUF0QeRq+R1ppXe
	 j5arDdcJWdm/g==
Date: Mon, 1 Jun 2026 17:20:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Subject: Re: [PATCH v3 6/6] automation: enable Argo debugging in CI
In-Reply-To: <20260526215823.1452619-7-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2606011720021.550703@ubuntu-linux-20-04-desktop>
References: <20260526215823.1452619-1-dmukhin@ford.com> <20260526215823.1452619-7-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1780359611-8B392A53-39A91C01/0/0
X-purgate-type: clean
X-purgate-size: 283
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7CEB2626884
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Enable extra Argo traces in CI to help analyze any potential Argo issues.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

