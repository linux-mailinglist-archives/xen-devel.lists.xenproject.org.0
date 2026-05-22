Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBMYL4UgEGqjTwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 11:23:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725745B1153
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 11:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316504.1585905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQM5x-0007F3-Ao; Fri, 22 May 2026 09:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316504.1585905; Fri, 22 May 2026 09:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQM5x-0007CG-7e; Fri, 22 May 2026 09:23:05 +0000
Received: by outflank-mailman (input) for mailman id 1316504;
 Fri, 22 May 2026 09:23:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1wQM5v-0007CA-NP
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1wQM5q-000cnf-0T;
 Fri, 22 May 2026 09:22:58 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1wQM5p-0013S3-2X;
 Fri, 22 May 2026 09:22:57 +0000
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
	bh=H31lC0eOpJY3qpXcHt0ef1xE5sHfYgrP7GJ9jWjLaBM=; b=aIS3u1/YrQnynD3MWM5lo3Grvi
	njtBsTFVWlhv2GJbtcKW204PpT1cUkRi9bXpXPIxXu2Klsh/4FXgQpt13XWzdmOFDPMcHNDA9HDUx
	Us8NJzc/o5rUs69dvx/jLnVk4c8qiJhP8ZeWNGFEjvjOG7p6LsiPRdwbbzGj3Yxu5pL4=;
Date: Fri, 22 May 2026 11:22:55 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org,
	pierrick.bouvier@oss.qualcomm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 10/39] MAINTAINERS: Drop bad F: in "X86 Xen CPUs"
Message-ID: <ahAgb1shN3tLrK_h@l14>
References: <20260521080511.999266-1-armbru@redhat.com>
 <20260521080511.999266-11-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521080511.999266-11-armbru@redhat.com>
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[anthony@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[nongnu.org,linaro.org,oss.qualcomm.com,kernel.org,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:armbru@redhat.com,m:qemu-devel@nongnu.org,m:philmd@linaro.org,m:pierrick.bouvier@oss.qualcomm.com,m:sstabellini@kernel.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:email,xenproject.org:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[anthony@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xenproject.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 725745B1153
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:04:42AM +0200, Markus Armbruster wrote:
> include/hw/block/dataplane/xen* does not exist.
> hw/block/dataplane/xen* does, and is covered.  Drop the bad line.
> 
> Fixes: fcab2b464e (xen: add header and build dataplane/xen-block.c, 2019-01-08)
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony PERARD <anthony@xenproject.org>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Anthony PERARD <anthony@xenproject.org>

Thanks,

-- 
Anthony PERARD

