Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UdR6HBTRKWovdwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 23:03:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677E66CF18
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 23:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b3p8UBPB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1334775.1597582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXQ4j-0002AP-AK; Wed, 10 Jun 2026 21:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334775.1597582; Wed, 10 Jun 2026 21:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXQ4j-00028k-6F; Wed, 10 Jun 2026 21:03:01 +0000
Received: by outflank-mailman (input) for mailman id 1334775;
 Wed, 10 Jun 2026 21:03:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wXQ4i-00028e-2N
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 21:03:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXQ4g-00AOOu-Bj
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 23:02:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a29d0d1-bab6-0a2a0a5309dd-0a2a450a9d0a-36
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 23:02:58 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a29d101-56b3-0a2a450a0019-ac6904fedd9c-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 23:02:58 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DE226601FC;
 Wed, 10 Jun 2026 21:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1461F00893;
 Wed, 10 Jun 2026 21:02:55 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781125376;
	bh=V7haqysB2nWTKSvDDoglm6Kew8K63EbVCD2eg/vs0XY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=b3p8UBPB5INx8HaioP2sSYCVaaeugI1wtl+5wWCktyCK/ylSsRLuvy4SUeZtQc+ws
	 4JuoN6ekE9uWpcqgs3PXmz59RfQMF6QNLB8ZvpAL4pmHPd3U5AmBgUEb7I3QJo3XEv
	 /4BWwrUkrhLLaPodlYrzmGkypcm7I2VPdvi3oq4cGS7y1zWyOcBDz0xgZRAa3DP3q+
	 ZQ5vBRfJNJ0WpOtrgrpC3AeJUsLc5EVT4GHLz/0nxhL/+NDW+AHRZkLgDvTqX/Gwyg
	 nL/INuw8A0X9m4IsHDIwli9gx6JWuShoAet2E9NMCajrjtHgL5dDM6YZo44gJZCfNU
	 Dst7JBEjZsKxQ==
Date: Wed, 10 Jun 2026 14:02:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/4] CI: Rename xenial-xilinx to xilinx-hw-runner
In-Reply-To: <1781083934.8631fc262581453bbf619ec5b2062170.19eb0e00eac000701b@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2606101402340.368315@ubuntu-linux-20-04-desktop>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com> <20260609173102.2908514-3-andrew.cooper3@citrix.com> <1781083934.8631fc262581453bbf619ec5b2062170.19eb0e00eac000701b@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1781125378-727758B7-64078140/0/0
X-purgate-type: clean
X-purgate-size: 758
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5677E66CF18

On Wed, 10 Jun 2026, Anthony PERARD wrote:
> On Tue, Jun 09, 2026 at 06:31:00PM +0100, Andrew Cooper wrote:
> > The container is tied to the runner, not a version of Ubuntu.  Intentionally
> > give it a generic name so it need not change in the future.
> > 
> > Apply standard cleanup to the dockerfile, except that it must continue to be a
> > root container to drive real hardware.  Explicitly install ca-certificates to
> > compensate for --no-install-recommends.
> > 
> > No practical change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

I don't have an opinion on the best name for this container

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

