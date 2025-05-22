Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373FAC06B6
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993158.1376602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI11U-0004gE-48; Thu, 22 May 2025 08:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993158.1376602; Thu, 22 May 2025 08:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI11U-0004dk-1P; Thu, 22 May 2025 08:11:28 +0000
Received: by outflank-mailman (input) for mailman id 993158;
 Thu, 22 May 2025 08:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Qw0=YG=antarean.org=joost@srs-se1.protection.inumbo.net>)
 id 1uI11R-0004cJ-4C
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:11:26 +0000
Received: from gw3.antarean.org (gw3.antarean.org [84.247.13.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 59eb6b71-36e4-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 10:11:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by gw3.antarean.org (Postfix) with ESMTP id 4b31GW5k4HzNlQR
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 10:11:47 +0200 (CEST)
Received: from gw3.antarean.org ([127.0.0.1])
 by localhost (gw3.antarean.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovcKAOQtRooR for <xen-devel@lists.xenproject.org>;
 Thu, 22 May 2025 10:11:47 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw3.antarean.org (Postfix) with ESMTP id 4b31GW527vzNkFp
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 10:11:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4b31G321P6z1G
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:11:23 +0000 (UTC)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavis, port 10024)
 with ESMTP id rdsdahx-dfrs for <xen-devel@lists.xenproject.org>;
 Thu, 22 May 2025 08:11:22 +0000 (UTC)
Received: from f2b978515ea2 (web2.adm.antarean.org [10.55.16.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPSA id 4b31G23YDDz17
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:11:22 +0000 (UTC)
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
X-Inumbo-ID: 59eb6b71-36e4-11f0-a2fb-13f23c93f187
X-Virus-Scanned: amavis at antarean.org
X-Virus-Scanned: amavis at antarean.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1747901482;
	bh=wWHwIbSNvrwUct4+MsbF+SOreN5QqKjn7jqnbTORdbk=;
	h=From:To:Subject:Date;
	b=AauUUEKicYbNWsdTAwJu8xrMSsW6e5/zpecAQ733Pql5Rrewf++ef/XuimwYxqvH6
	 dIeutIrUx8EhRRyhm7jJBRfqPY3mfqGDp5y+xwpo1ixO+FmF9UH5RWh0DwZT6VplML
	 YvAzM36hoJsyv1sMZ+DKEEAKOf55OqpgHb3vQQLU=
User-Agent: EGroupware API 23.1.011
From: Joost Roeleveld <joost@antarean.org>
X-Priority: 3
X-Mailer: EGroupware-Mail
To: xen-devel@lists.xenproject.org
Subject: xen-users mailing list? (Apologies for sending this here)
Message-ID: <20250522081122.EGroupware.g0gOPwanFzfUtefaocj94UN@egw.antarean.nl>
Date: Thu, 22 May 2025 08:11:22 +0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0

Hi all,

I am not sure where to send this, but as this list seems to still  
work, I'll try here.
I am not receiving any emails from the xen-users mailing list since  
the 13th and my email I sent yesterday doesn't even show up in the  
archive.
I tried re-subscribing, but according to the mail I received, I am  
still subscribed.

Can someone look into this and/or tell me where to reach out for this? :)

Many thanks,

Joost




