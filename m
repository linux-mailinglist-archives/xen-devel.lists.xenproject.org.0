Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34351F9C0C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:34:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkr7F-00005D-T5; Mon, 15 Jun 2020 15:33:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkr7E-000057-D5
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:33:40 +0000
X-Inumbo-ID: 950b0c7d-af1d-11ea-b80e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 950b0c7d-af1d-11ea-b80e-12813bfff9fa;
 Mon, 15 Jun 2020 15:33:39 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7QT1MsNHvao7+56qherYyjnDUwjmRMJyADuszo0B1FsRffN16rSslb3luoG4+947Gkee50EOks
 kNCrfj3kJVnCQBbfvRdL5+KU3sd366mAMi6VAtr88hAum3HtAPmm125Kp8HsAsRg4QAwsGU6FR
 v3BgveZu1BtggJ+antYiwbzrCKaWN+od2KT71OruL4zd9pC6EH/5NPW8yzwT7JiS+bd2WKAQ2y
 V+lRcsvMIjm0LyGiS16qN91hrdustsNHpLS4Rrh2Yypii31S+MgdLLOlYvuqOvrFakr2OzjNqN
 rCg=
X-SBRS: 2.7
X-MesageID: 20419838
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20419838"
Subject: Re: [PATCH for-4.14 8/8] x86/hvm: enable emulated PIT for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-9-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b68cede9-360e-cc4f-d88b-737ee83e654e@citrix.com>
Date: Mon, 15 Jun 2020 16:33:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612155640.4101-9-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/06/2020 16:56, Roger Pau Monne wrote:
> Some video BIOS require a PIT in order to work properly, hence classic
> PV dom0 gets partial access to the physical PIT as long as it's not in
> use by Xen.

Is this actually true today?

I can believe that it may have been necessary on old hardware, but the
structure of systems has changed massively over the past 20 years, and
the PIT is very legacy these days.

We shouldn't be blindly propagating bodges like this forward.

~Andrew

