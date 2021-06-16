Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EFD3A9EB3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143382.264281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXDh-0000CH-38; Wed, 16 Jun 2021 15:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143382.264281; Wed, 16 Jun 2021 15:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXDg-0000AB-Vw; Wed, 16 Jun 2021 15:12:44 +0000
Received: by outflank-mailman (input) for mailman id 143382;
 Wed, 16 Jun 2021 15:12:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QzdS=LK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ltXDf-00009y-Dw
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:12:43 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe398a16-51bf-4ce6-9f81-1df8f429cb86;
 Wed, 16 Jun 2021 15:12:42 +0000 (UTC)
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
X-Inumbo-ID: fe398a16-51bf-4ce6-9f81-1df8f429cb86
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623856362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4OHMNBsyC4VgF/ZEWfsxw0GmwEl9ZlrkDb/L+SKMo1g=;
  b=EnJ4wuxMFuzVYumkYi/OaL8nVChfvekb+NtU/8ml+XWBw92smrASC5cS
   2F6VHFA1fdtFSYp3Prq4HJxPNrHD1kZTJROdvpR2gJrEJuz4Gu08ux79k
   +1b3BKB9lZH7EwZoXLvK4oToabwKifaoDMXOtnDC6hEr6JDBgPdkoSHjh
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0MKoFemF0jnFkhsTgYcSxVl1bRzQJnsJFOXZ3ol5k5f4f0/b5ysRQ1ueN8/OoWuciJHgIcRg2R
 SrpOja0H81mSuohxwGnM6aOyKJTjOYepR3R2pfuGs4kTkqthGhWVq6yiF9Ovrvr+I9ddMqrNme
 Bi5rWvXIkkLS81QBKIgaSzCrMPhBkUtca416D/OYXaNZcFETolgF4PgAv7dvV5VjseGpOsCpUj
 lwl/tqlHQQEO2uAVxbdaHxxPRWcrUSCOKGo+WsDljl5z8adWTorPThNc0TRIFpL1CQAmSJ6GG3
 Qak=
X-SBRS: 5.1
X-MesageID: 47855158
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9Ylkga0CLrFmu14Wv338sAqjBL4kLtp133Aq2lEZdPUCSL39qy
 ncppUmPH7P5wr5N0tNpTntAsO9qDbnhP1ICOoqVotKPjOHhILAFugL0WKh+UyDJ8SUzJ856U
 4PScVD4JSbNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="47855158"
Date: Wed, 16 Jun 2021 16:12:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>,
	osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable test] 162845: regressions - FAIL
Message-ID: <YMoU5gLQEVBkmnLC@perard>
References: <osstest-162845-mainreport@xen.org>
 <8e39ca8f-3202-7d3a-d65d-7087634bd49e@suse.com> <YMoI8YZfOvogwOMY@perard>
 <f8c4151a-6dac-d87c-ef46-eb35ada07bd9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8c4151a-6dac-d87c-ef46-eb35ada07bd9@suse.com>

On Wed, Jun 16, 2021 at 04:49:33PM +0200, Jan Beulich wrote:
> I don't think it should. But I now notice I should have looked at the
> logs of these tests:
> 
> xc: info: Saving domain 2, type x86 HVM
> xc: error: Unable to obtain the guest p2m size (1 = Operation not permitted): Internal error
> xc: error: Save failed (1 = Operation not permitted): Internal error
> 
> which looks suspiciously similar to the issue Jürgen's d21121685fac
> ("tools/libs/guest: fix save and restore of pv domains after 32-bit
> de-support") took care of, just that here we're dealing with a HVM
> guest. I'll have to go inspect what exactly the library is doing there,
> and hence where in Xen the -EPERM may be coming from all of the
> sudden (and only for OVMF).
> 
> Of course the behavior you describe above may play into this, since
> aiui this might lead to an excessively large p2m (depending what
> exactly you mean with "as high as possible").

The maximum physical address size as reported by cpuid 0x80000008
(or 1<<48 if above that) minus 1 page, or 1<<36 - 1 page.

-- 
Anthony PERARD

