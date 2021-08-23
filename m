Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836233F47A9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 11:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170264.311015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6Ki-0002W9-4G; Mon, 23 Aug 2021 09:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170264.311015; Mon, 23 Aug 2021 09:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6Ki-0002Tv-1E; Mon, 23 Aug 2021 09:33:32 +0000
Received: by outflank-mailman (input) for mailman id 170264;
 Mon, 23 Aug 2021 09:33:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkzG=NO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mI6Kg-0002To-Fq
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 09:33:30 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 825fd8e9-90e7-457d-ba38-58c349d04a25;
 Mon, 23 Aug 2021 09:33:28 +0000 (UTC)
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
X-Inumbo-ID: 825fd8e9-90e7-457d-ba38-58c349d04a25
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629711208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K+2dEHEQQZycdvhuyp9PYKX6j5tG3GT18k9oIBc13hs=;
  b=DHMzkAmV1ib1FgjiEsWdOQAuEz1I1FQJcuzTzPraKJ1+ihiueYo+JuYu
   bpHK8AaycXq6ARzzz7yjphFHYfRL4WJfeE84wJlFfOAyc0qCuWW2Kne7R
   756GlIT9y+WeBuiLfS+o8wVhPWnzkFlmZIlZbFdFEkGxZg/9eWmeTXraV
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yyLdlr/SNROMQXTYXTS5rlSNSroHXNPEzbFLlBcBzUgQxKiK9+oRo5sZrhhctEHECs2GwcBVw6
 +Bln1IMCWOWpQA11h4Pi5dWHqO0xuQr+NAeEqdgCIF1teXzumMtp4HGgwnIMq9l47Omv5Ye6iW
 FUYaHRtm1XCmbRXMWkpqQ7xREiRrUu+SfxfX1CowHk5v/pECrO2Y5MVQi9SRsoyUe7z87tfa6u
 NEn4CGdJoHhvk3ARQyeBwdLbtrqOyJcIHmbJLCrWz4SS+wWn5p8EETAy49pURUxGSavmsyoe0R
 ZjI0ol2biqVABrfiAT2F/E3z
X-SBRS: 5.1
X-MesageID: 51069041
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mPruz6MTPMiHOsBcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.84,344,1620705600"; 
   d="scan'208";a="51069041"
Date: Mon, 23 Aug 2021 10:33:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, osstest service owner
	<osstest-admin@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [xen-4.12-testing bisection] complete
 test-amd64-i386-xl-qemuu-ovmf-amd64
Message-ID: <YSNrZfjGJzdKUlvV@perard>
References: <E1mHy0c-00059n-HR@osstest.test-lab.xenproject.org>
 <9e009e5d-41cf-71de-fed4-88a962b4ab66@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9e009e5d-41cf-71de-fed4-88a962b4ab66@suse.com>

On Mon, Aug 23, 2021 at 09:07:32AM +0200, Jan Beulich wrote:
> On 23.08.2021 02:40, osstest service owner wrote:
> >   commit d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
> >   Author: Laszlo Ersek <lersek@redhat.com>
> >   Date:   Wed May 26 22:14:24 2021 +0200
> >   
> >       OvmfPkg/PlatformPei: remove Xen support
> 
> Uniformly from 4.15 through to 4.12 (the latter of which shouldn't have
> been affected by whatever has been pulled in in the first place, given
> it's a security-only branch, but with the OVMF commit to use being
> hardcoded in ./Config.mk I don't really understand how a possible
> change to the OVMF tree could have affected this version) tests are
> now failing, everywhere with the above bisection result. Given that we
> want to get out releases from the 4.15 and 4.13 branches right after
> the batch of XSAs going public on Wednesday, something needs to be
> done about this pretty soon.
> 
> Does osstest override ./Config.mk's choice? Albeit I guess even if it
> does that's not outright wrong, and instead it would be bad if the
> older versions wouldn't work anymore with an updated OVMF.

Yes, osstest uses "xen-tested-master" branch since c9d1e5896fe2
("cr-daily-branch: ovmf: "usually" use xen-tested-master") for stable
branches.

We are going to need to backport a commit from unstable. Either
    aad7b5c11d51 ("tools/firmware/ovmf: Use OvmfXen platform file is exist")
        (but has been reverted)
or
    81f291420238 ("tools/firmware/ovmf: Use OvmfXen platform file if exist and update OVMF")
        (but it also changes the version of ovmf pulled by default,
         which we probably don't want to change)

So I would suggest backporting aad7b5c11d51.

Cheers,

-- 
Anthony PERARD

