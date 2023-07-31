Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7476A2BD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 23:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573469.898205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaTF-0001mh-24; Mon, 31 Jul 2023 21:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573469.898205; Mon, 31 Jul 2023 21:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaTE-0001l3-V4; Mon, 31 Jul 2023 21:30:28 +0000
Received: by outflank-mailman (input) for mailman id 573469;
 Mon, 31 Jul 2023 21:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bj4f=DR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQaTD-0001ku-93
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 21:30:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76174728-2fe9-11ee-b257-6b7b168915f2;
 Mon, 31 Jul 2023 23:30:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8583861306;
 Mon, 31 Jul 2023 21:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B74CC433C8;
 Mon, 31 Jul 2023 21:30:22 +0000 (UTC)
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
X-Inumbo-ID: 76174728-2fe9-11ee-b257-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690839023;
	bh=LxxxS7CRd/+UGGccMda26GXk/tECTmVLpk8MpWNB/6s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dNYPB+XIBwv3bSy7vN7IJdS4yEjrXVEFkfbHt79xL+U1X4geURBcCu+Gj5CoJPa7f
	 s1UjD8vNOKQp1huYlwmy+Ix19GBsflmCUARY04TS3j9GrFZUYyaqwur6KnaC7ZS0iR
	 hQZ/SOv9M/SHxj3RhIBSUKQFutRj6+EeyUNAxnxq/D1c6Cb/ZlEQB2grUe72EU6wiC
	 /SGqre21Fu0PeLe0IeXIkdk9jVPOd4kR7cOaumsy6if31fSZ6xKyrQRYxv2fsA5nF0
	 9eXG8RfyGC7ADUdlp4Nyw2RLwYEmAAFzXiXUvEjDKHuvFVWoSESxyxUXQvC7tR4Iz8
	 5etoC5T3UFowA==
Date: Mon, 31 Jul 2023 14:30:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/4] xen/pci: rename local variable to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <a2c9bc7d87e8c1fe78571d74e10e35d2@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307311429150.1972086@ubuntu-linux-20-04-desktop>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com> <c9c6dd21ec6e88895ebc15ee6fe96090168afb51.1690810346.git.nicola.vetrini@bugseng.com> <dce3d16f-7bc5-a22d-3872-36d3a617c120@suse.com> <a2c9bc7d87e8c1fe78571d74e10e35d2@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Jul 2023, Nicola Vetrini wrote:
> On 31/07/2023 16:16, Jan Beulich wrote:
> > On 31.07.2023 15:34, Nicola Vetrini wrote:
> > > --- a/xen/drivers/passthrough/pci.c
> > > +++ b/xen/drivers/passthrough/pci.c
> > > @@ -650,12 +650,12 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> > >      struct pci_seg *pseg;
> > >      struct pci_dev *pdev;
> > >      unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
> > > -    const char *pdev_type;
> > > +    const char *pci_dev_type;
> > 
> > I've always been wondering what purpose the pdev_ prefix served here.
> > There's no other "type" variable in the function, so why make the name
> > longer? (I'm okay to adjust on commit, provided you agree.)
> > 
> > Jan
> 
> No objections.

I reviewed the patch and it is correct:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Jan, feel free to pick any name you prefer on commit, e.g. "type".


