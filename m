Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOnnHpDAhGnG4wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:08:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1999EF4FBD
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222185.1530208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1tg-00019D-A3; Thu, 05 Feb 2026 16:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222185.1530208; Thu, 05 Feb 2026 16:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1tg-00016W-6h; Thu, 05 Feb 2026 16:08:00 +0000
Received: by outflank-mailman (input) for mailman id 1222185;
 Thu, 05 Feb 2026 16:07:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vo1te-00016Q-OP
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 16:07:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vo1te-004F9j-1c;
 Thu, 05 Feb 2026 16:07:58 +0000
Received: from [2a01:cb15:80df:da00:10d0:b82f:72a2:ac5] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vo1td-000giS-2O;
 Thu, 05 Feb 2026 16:07:57 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=L7AlrDhtoiZcfuy+jhhS8IOW+H9z6FpyimOCakWieZk=; b=RaZP1+cn+70lYc2JMr9kqqVAC4
	S4kHvMWOjr00afQJ5Y8TRpNmi8/KBPputVO5xX9pbWyi5Qs2TdA235iFunxvM8BhJ3/f98Y68UH0P
	74ajQ2RSaR5QKFy9g7v2D7cQikfMmbif8sNctH+/BdTQ0qBKCsuLe1zaCsIZxYi6q6gM=;
Date: Thu, 5 Feb 2026 17:07:55 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v9 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Message-ID: <aYTAW5My41py18b4@l14>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
 <3a5ff98b9c46c393e856c2e9a645b2cb1509d5c4.1769696107.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5ff98b9c46c393e856c2e9a645b2cb1509d5c4.1769696107.git.oleksii_moisieiev@epam.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[anthony@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xenproject.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1999EF4FBD
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:16:55PM +0000, Oleksii Moisieiev wrote:
>  docs/man/xl.cfg.5.pod.in                    |  13 +
>  tools/libs/light/libxl_arm.c                |   4 +
>  tools/libs/light/libxl_types.idl            |   4 +-
>  tools/xl/xl_parse.c                         |  12 +

Hi Oleksii,

Could you put the toolstack part of the patch in a separated patch?

Thank you.

-- 
Anthony PERARD

