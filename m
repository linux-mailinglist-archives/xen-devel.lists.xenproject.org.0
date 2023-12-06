Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0506806532
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 03:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648783.1012742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAhri-0005LS-9D; Wed, 06 Dec 2023 02:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648783.1012742; Wed, 06 Dec 2023 02:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAhri-0005JV-6e; Wed, 06 Dec 2023 02:42:22 +0000
Received: by outflank-mailman (input) for mailman id 648783;
 Wed, 06 Dec 2023 02:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAhrg-0005JP-Du
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 02:42:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 124fe83b-93e1-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 03:42:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A311CB81D6E;
 Wed,  6 Dec 2023 02:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9958AC433C7;
 Wed,  6 Dec 2023 02:42:15 +0000 (UTC)
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
X-Inumbo-ID: 124fe83b-93e1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701830537;
	bh=AY1yRi7JSfZ4uP3aeY2SY1FsTdaB9hD411mR9a8chQo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fiGaUP+YqlAK0s0pmu79DBsF1zleHfU92JVK3N4aEk/bIJ0vpYdwiS5RGwX+XxaWi
	 R7RlROHIbyPOA4/E/bVTRgSn8/Z6B7kY4giG2REKMmbwGE2atqXYhyASKXh4vsUrO0
	 fQ+a3d7MLwRRGC+8UaTtA4H06qQ6Nh9W8jtKVpHjk2rp3uHbwvcQLtRM0JXOnVbOBo
	 io+U8lBNJr2kbEBag5sHM8Twi8wIEkzxdMYUndeWJJvIBLfdJQaZMsJsjyAoqzEJiY
	 VQAoHNPgfmKAvrOwBPig68MXqiSAJLXQmrnwDrzvfHq9O3/pH1KDDy3iLSrBdhkewu
	 WwDZedswTSnsg==
Date: Tue, 5 Dec 2023 18:42:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@amd.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: SAF-* comment at the end of the line
In-Reply-To: <27B32A01-F4D9-4A92-BA16-F43D0AF4F29E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312051840070.110490@ubuntu-linux-20-04-desktop>
References: <27B32A01-F4D9-4A92-BA16-F43D0AF4F29E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1871647676-1701830537=:110490"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1871647676-1701830537=:110490
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 5 Dec 2023, Luca Fancellu wrote:
> Hi all,
> 
> I’m writing this mail to collect thoughts about the need to improve the SAF-* comments.
> 
> I think we reached a point where we need to use deviations for some violation that we want
> to keep in the code with a proper justification and an issue was raised when the comment
> cannot be put on a line on its own.
> 
> e.g.
> 
> If ( condition-1 &&
>      condition-2 &&
>       [...] )
> {
>     ...
> }
> 
> For example in the code above, if the violation is in the second condition, breaking the conditions
> to have an empty line between them for the SAF-* comment is not ideal, so we could maybe
> improve the in-code comment to be used at the end of the line:
> 
> e.g.
> 
> If ( condition-1 &&
>      condition-2 && /* SAF-*-safe [...] */
>       [...] )
> {
>     ...
> }
> 
> This might require also a deviation on the coding style to allow the comment to overcome the line length.
> 
> Bertrand, from his experience with safety certifications, feels that adding this feature could be enough
> to cover the majority of the cases where we need to deviate a violation in the code.
> 
> Using it consistently in the code base as the only way to deviate a violation can also help the adoption
> of the project to people who might want to fix them instead of deviating them, the only thing they would need
> to do is to grep for SAF-* to have a rough idea of how many justified violation are in the code.
> 
> Please let me know your thoughts before I start to implement the feature.

I think we need this feature and in fact we have already been adding it
in an ad-hoc way with /* octal-ok */

It would like to remove octal-ok and use a generic way (SAF) to do the
same.
--8323329-1871647676-1701830537=:110490--

