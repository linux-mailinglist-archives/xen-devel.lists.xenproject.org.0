Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8DA2C6A29
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 17:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39657.72622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigyG-000745-Kc; Fri, 27 Nov 2020 16:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39657.72622; Fri, 27 Nov 2020 16:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigyG-00073g-HJ; Fri, 27 Nov 2020 16:51:44 +0000
Received: by outflank-mailman (input) for mailman id 39657;
 Fri, 27 Nov 2020 16:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kigyE-00073a-TI
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:51:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 197bf9d3-6d7b-4e8e-b26e-1c48b0ed76a8;
 Fri, 27 Nov 2020 16:51:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6057CAD0B;
 Fri, 27 Nov 2020 16:51:41 +0000 (UTC)
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
X-Inumbo-ID: 197bf9d3-6d7b-4e8e-b26e-1c48b0ed76a8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606495901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cu8lOUmCNVpGaa9ENLLh2dwSXaGH+rjyXb081TNyKoY=;
	b=Q0SLFWSg3Y3k4MgVsIU8kBjP0KuuJ1K+//A4spkHfstXNI84kvs9EPb62TCd5uj89VCssg
	JYz0LPjmTmvNVOwLt76YBL9gjL51kb0ngWjo89qS57QMwbRC9g57CHEvqkreIoHwPWaLW+
	rRZBslTCDo/IJZ7dx7/cYIYII99V+F4=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: is_pv*domain() adjustments
Message-ID: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
Date: Fri, 27 Nov 2020 17:51:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: correct is_pv_domain() when !CONFIG_PV
2: use is_pv_64bit_domain() to avoid double evaluate_nospec()

Jan

