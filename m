Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC027AF76F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 02:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608611.947219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlISn-0007Vi-8M; Wed, 27 Sep 2023 00:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608611.947219; Wed, 27 Sep 2023 00:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlISn-0007T4-5T; Wed, 27 Sep 2023 00:31:37 +0000
Received: by outflank-mailman (input) for mailman id 608611;
 Wed, 27 Sep 2023 00:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hjpc=FL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlISm-0007Su-5G
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 00:31:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 361ea0d3-5ccd-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 02:31:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DA306B8119B;
 Wed, 27 Sep 2023 00:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD10C433C7;
 Wed, 27 Sep 2023 00:31:31 +0000 (UTC)
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
X-Inumbo-ID: 361ea0d3-5ccd-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695774692;
	bh=eUDwni8Yx0x0N65uuADMr87IfihBny68wpyT/2Iy5c8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HTXE/AAG1y3qyzdqBPRzFFBWij1tgE2BxB0RDiNIZZVcOUvGZhBmIkSYMR6LGBivu
	 rvJA/zbaHuXyoNTax3aCo5DeYqykUq/C3B0DtE5L7EPfTzeIyKncSJqfPfFbBJJVs+
	 wmW0nQylcnNOhhNNweKoeNa3hA5r8Q5xyCuqrxNH51Z0dnAjjYGHrv3EL1I9rq7jlo
	 c3iy3xrXsatOvtvHqbOUetgxEgbEeqH3n/DigWT8E8UQvztend4d/qOzv7DNTz20RI
	 KFPvV5AW+u63uYvFXY63gWSmbvbbVkYJb3vVOYBJwqx9A5XbgkkuY9hHWaKLtGWoz5
	 G4Y37cAMIZxgw==
Date: Tue, 26 Sep 2023 17:31:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "jgross@suse.com" <jgross@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
In-Reply-To: <338CEC44-2393-4A62-975B-40F5716CEE18@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309261729500.1403502@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com> <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com> <0be1e32f-5600-7b3a-8d72-84297a1ebee0@suse.com> <DE6F0412-BF5A-4242-9D08-521034F509FE@arm.com>
 <729d4ed8-f33d-f7f4-ddd9-3d8e91671474@suse.com> <338CEC44-2393-4A62-975B-40F5716CEE18@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-241593601-1695774601=:1403502"
Content-ID: <alpine.DEB.2.22.394.2309261731260.1403502@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-241593601-1695774601=:1403502
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309261731261.1403502@ubuntu-linux-20-04-desktop>

On Tue, 26 Sep 2023, Henry Wang wrote:
> Hi Jan,
> 
> > On Sep 26, 2023, at 16:01, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 26.09.2023 09:58, Henry Wang wrote:
> >>> On Sep 26, 2023, at 15:46, Jan Beulich <jbeulich@suse.com> wrote:
> >>> Furthermore may I ask that you keep an eye on the physical CPU hotplug
> >>> situation? It continues to be documented as fully supported, and as long as
> >>> that's the case 47342d8f490c (" x86/ACPI: Ignore entries with invalid APIC IDs
> >>> when parsing MADT") would imo need reverting. While I had indicated that I
> >>> would do the revert, a patch to SUPPORT.md was meanwhile proposed (which
> >>> would of course further need accompanying by a CHANGELOG.md entry), but didn't
> >>> really make progress since then. Yet I also didn't want to "needlessly" do the
> >>> revert ...
> >> 
> >> I think you are referring to [1]
> > 
> > Yes, that's the one.
> > 
> >> (and a proper CHANGELOG), I added this to my list
> >> if all people involved is fine with this patch from Stefano,
> > 
> > Iirc there were comments on the wording already, but no update to the patch.
> 
> As this is simply a doc change, I think we still have time for the author (Stefano) to respin
> the patch. I am replying with his email address set to “To:” to catch his attention. Also,
> I think if Stefano is happy, probably any x86 maintainer or probably myself can pick
> this patch up as the follow up.

It's out:
https://marc.info/?l=xen-devel&m=169577443417860
--8323329-241593601-1695774601=:1403502--

