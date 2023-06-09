Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD922729ECA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546183.852858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eE0-0005v3-Bf; Fri, 09 Jun 2023 15:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546183.852858; Fri, 09 Jun 2023 15:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eE0-0005sj-8z; Fri, 09 Jun 2023 15:40:28 +0000
Received: by outflank-mailman (input) for mailman id 546183;
 Fri, 09 Jun 2023 15:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NPzv=B5=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q7eDz-0005sd-B9
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:40:27 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f331dca6-06db-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 17:40:25 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 53E753F08F;
 Fri,  9 Jun 2023 08:40:22 -0700 (PDT)
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
X-Inumbo-ID: f331dca6-06db-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686325223; bh=PmDTbrFAlYgMzho7kmfgxm0REPuKfcmaPhPLnXSa7dA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GJX9WjR+TGtpcI0sjfS7FbZys96lYwbTU4SuUcShFpCpwAvQZLsuufPF5A2Cv8kll
	 thsZTSslUKAYrhqZacH6Vc5Z9yXAw8n05M9fSPmn/dgm1UsWyViWwKEZIZlAbvj2er
	 Ndp0oSR8dr6oyKjyCq21bk6lxtefSwIcv6i1pp8le3aGeqa2FELuudmPpdebCPkRVg
	 qkYLwVRLtgdjkR9ObI/rzMET0o2aksHE/4XfsE2elKRQADPS7xmyrIfcTzjHuueGdQ
	 JiMpuN3Da40i54sd+ihu8x7f0mPy58gPSDtzBDECezVSP98Z+CMplNw61KTPSy/Uj0
	 UWs29EWXAO9mw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jun 2023 10:40:21 -0500
Message-Id: <CT88EG4XDT68.AC4JJK5VPUQO@Shawns-Mac-mini.lan>
Cc: <tpearson@raptorengineering.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>, "Shawn Anastasio"
 <shawnanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] maintainers: Add PPC64 maintainer
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Jan Beulich" <jbeulich@suse.com>
References: <cover.1686148363.git.shawn@anastas.io>
 <2ec38b52d944919934b2326a1924200aa954008d.1686148363.git.shawn@anastas.io>
 <3ad44f3b-587f-07e6-4601-59b961954c9d@suse.com>
In-Reply-To: <3ad44f3b-587f-07e6-4601-59b961954c9d@suse.com>

On Fri Jun 9, 2023 at 4:04 AM CDT, Jan Beulich wrote:
> On 07.06.2023 17:06, Shawn Anastasio wrote:
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -451,6 +451,9 @@ M:	Wei Liu <wl@xen.org>
> >  S:	Supported
> >  T:	git https://xenbits.xenproject.org/git-http/ovmf.git
> > =20
> > +PPC64
> > +M:	Shawn Anastasio <sanastasio@raptorengineering.com>
> > +
> >  POWER MANAGEMENT
> >  M:	Jan Beulich <jbeulich@suse.com>
> >  S:	Supported
>
> Nit: You want to move your insertion further down, to maintain alphabetic
> sorting. You further want at least one F: line; see e.g. RISC-V's entry.

Will fix in v2.

> Jan

Thanks,
Shawn


