Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F414BC82C
	for <lists+xen-devel@lfdr.de>; Sat, 19 Feb 2022 12:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275757.471771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLNr1-0006ci-2k; Sat, 19 Feb 2022 11:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275757.471771; Sat, 19 Feb 2022 11:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLNr0-0006aR-Vv; Sat, 19 Feb 2022 11:24:42 +0000
Received: by outflank-mailman (input) for mailman id 275757;
 Sat, 19 Feb 2022 11:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=teU/=TC=twosheds.srs.infradead.org=BATV+40acfcbe1360a33f4347+6754+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1nLNqz-0006aL-IV
 for xen-devel@lists.xenproject.org; Sat, 19 Feb 2022 11:24:42 +0000
Received: from twosheds.infradead.org (unknown
 [2001:8b0:10b:1:aaa1:59ff:fe2f:55f7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82f2eb40-9176-11ec-8eb8-a37418f5ba1a;
 Sat, 19 Feb 2022 12:24:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=twosheds.infradead.org)
 by twosheds.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLNqi-00HAKw-T8; Sat, 19 Feb 2022 11:24:25 +0000
Received: from 213.205.198.58 (SquirrelMail authenticated user dwmw2)
 by twosheds.infradead.org with HTTP; Sat, 19 Feb 2022 11:24:25 -0000
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
X-Inumbo-ID: 82f2eb40-9176-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=twosheds.20170209; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=18M5bAzaOzMosPRkCjGj+3xBT8/uvub9kNysc83iM8o=; b=ZuH+djneu3h7V2MmraMAnDAeI0
	nsLuJYDVJKGMVvLmZeu2VtcPo+Q8KvoRZC46eSPbnSKTTNJZ54RpMVlOeEUzHg2/H7Nc6v2dan6iN
	lIRkhVgUnig+VeJ13OTD0PyyWMEquX+aY0F25oJ+1Bfe+7ysrw9aaB0viaeTMlCpe37/lXecP7AV1
	9+JEnch8P79JE+vqsn9COUKmSEz1tma5TdVkyVGSvFKX5hAohDwjHzMtTCzxMM5Ggod7EsGSjSaDw
	xpcd2l1JKrkeLpurH46/nuy0ltS2w9Wt2kDVXNFq53r5N2TrmbF/gdOq/s5U3WDN4klvNqNg99yVE
	HlLFqpcg==;
Message-ID: <4d89ffe13d2579096c955edf800b5c86.squirrel@twosheds.infradead.org>
In-Reply-To: <Yg4UPzFk15tJGo0B@Air-de-Roger>
References: <20220216103026.11533-1-roger.pau@citrix.com>
    <20220216103026.11533-2-roger.pau@citrix.com>
    <979fbc26-925c-f58f-9c1a-9ccd72275c9b@suse.com>
    <fd22f7e19590b0e8679e5a3a15992bd1f8a92126.camel@infradead.org>
    <9b5a8474-0be2-b4e6-8919-7e22dde1570a@suse.com>
    <Yg4UPzFk15tJGo0B@Air-de-Roger>
Date: Sat, 19 Feb 2022 11:24:25 -0000
Subject: Re: [PATCH v2 1/5] x86/cpuid: add CPUID flag for Extended
 Destination ID support
From: "David Woodhouse" <dwmw2@infradead.org>
To: =?utf-8?B?IlJvZ2VyIFBhdSBNb25uw6ki?= <roger.pau@citrix.com>
Cc: "Jan Beulich" <jbeulich@suse.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Wei Liu" <wl@xen.org>,
 xen-devel@lists.xenproject.org
User-Agent: SquirrelMail/1.4.23 [SVN]-7.fc34.20220108
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by twosheds.infradead.org. See http://www.infradead.org/rpr.html



> /*
>  * With interrupt format set to 0 (non-remappable) bits 55:49 from the
>  * IO-APIC RTE and bits 11:5 from the MSI address can be used to store
>  * high bits for the Destination ID. This expands the Destination ID
>  * field from 8 to 15 bits, allowing to target APIC IDs up 32768.
>  */

I am not keen on that wording because it doesn't seem to fully reflect the
fact that the I/OAPIC is just a device to turn line interrupts into MSIs.
The values in bits 55:49 of the RTE *are* what go into bits 11:5 of the
resulting MSI address. Perhaps make it more parenthetical to make it
clearer that they are not independent... "bits 11:5 of the MSI address
(which come from bits 55:49 of the I/OAPIC RTE)..."


-- 
dwmw2


