Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2FA295971
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 09:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10197.27026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVEz-0006KS-EG; Thu, 22 Oct 2020 07:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10197.27026; Thu, 22 Oct 2020 07:42:29 +0000
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
	id 1kVVEz-0006Jv-AV; Thu, 22 Oct 2020 07:42:29 +0000
Received: by outflank-mailman (input) for mailman id 10197;
 Thu, 22 Oct 2020 07:42:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVVEx-0006JP-9I
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0acf22e-8065-4816-b469-dc09b6d636cf;
 Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC1DCB19E;
 Thu, 22 Oct 2020 07:42:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVVEx-0006JP-9I
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:27 +0000
X-Inumbo-ID: f0acf22e-8065-4816-b469-dc09b6d636cf
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f0acf22e-8065-4816-b469-dc09b6d636cf;
	Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603352545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+gXPSZ4YK0mj6VX7zgMh/c3+7HoLEk5WluQT9Z0yeU=;
	b=WUkn4x9r0qlY9xTRnQ8DIhORZkjrTb516b1OQh3oXGCkHDoEK3O35H4KKsTIbKvF0ysIp7
	8PWXisHXPbb1IzERtCyrFPHmdmq7qQs5zbXO6stE4UHq13ZKspWu1Okwvlc+eT5RG12i72
	XabaRzfVA7Um6FUlRe41BIpTyRf6tvY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AC1DCB19E;
	Thu, 22 Oct 2020 07:42:25 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 1/5] xen: remove no longer used functions
Date: Thu, 22 Oct 2020 09:42:10 +0200
Message-Id: <20201022074214.21693-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022074214.21693-1-jgross@suse.com>
References: <20201022074214.21693-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the switch to the lateeoi model for interdomain event channels
some functions are no longer in use. Remove them.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_base.c | 21 ---------------------
 include/xen/events.h             |  8 --------
 2 files changed, 29 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index cc317739e786..436682db41c5 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1145,14 +1145,6 @@ static int bind_interdomain_evtchn_to_irq_chip(unsigned int remote_domain,
 					       chip);
 }
 
-int bind_interdomain_evtchn_to_irq(unsigned int remote_domain,
-				   evtchn_port_t remote_port)
-{
-	return bind_interdomain_evtchn_to_irq_chip(remote_domain, remote_port,
-						   &xen_dynamic_chip);
-}
-EXPORT_SYMBOL_GPL(bind_interdomain_evtchn_to_irq);
-
 int bind_interdomain_evtchn_to_irq_lateeoi(unsigned int remote_domain,
 					   evtchn_port_t remote_port)
 {
@@ -1320,19 +1312,6 @@ static int bind_interdomain_evtchn_to_irqhandler_chip(
 	return irq;
 }
 
-int bind_interdomain_evtchn_to_irqhandler(unsigned int remote_domain,
-					  evtchn_port_t remote_port,
-					  irq_handler_t handler,
-					  unsigned long irqflags,
-					  const char *devname,
-					  void *dev_id)
-{
-	return bind_interdomain_evtchn_to_irqhandler_chip(remote_domain,
-				remote_port, handler, irqflags, devname,
-				dev_id, &xen_dynamic_chip);
-}
-EXPORT_SYMBOL_GPL(bind_interdomain_evtchn_to_irqhandler);
-
 int bind_interdomain_evtchn_to_irqhandler_lateeoi(unsigned int remote_domain,
 						  evtchn_port_t remote_port,
 						  irq_handler_t handler,
diff --git a/include/xen/events.h b/include/xen/events.h
index 3b8155c2ea03..8ec418e30c7f 100644
--- a/include/xen/events.h
+++ b/include/xen/events.h
@@ -35,16 +35,8 @@ int bind_ipi_to_irqhandler(enum ipi_vector ipi,
 			   unsigned long irqflags,
 			   const char *devname,
 			   void *dev_id);
-int bind_interdomain_evtchn_to_irq(unsigned int remote_domain,
-				   evtchn_port_t remote_port);
 int bind_interdomain_evtchn_to_irq_lateeoi(unsigned int remote_domain,
 					   evtchn_port_t remote_port);
-int bind_interdomain_evtchn_to_irqhandler(unsigned int remote_domain,
-					  evtchn_port_t remote_port,
-					  irq_handler_t handler,
-					  unsigned long irqflags,
-					  const char *devname,
-					  void *dev_id);
 int bind_interdomain_evtchn_to_irqhandler_lateeoi(unsigned int remote_domain,
 						  evtchn_port_t remote_port,
 						  irq_handler_t handler,
-- 
2.26.2


