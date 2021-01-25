Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54954302D6A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 22:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74497.133932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l49Fl-0006ww-F3; Mon, 25 Jan 2021 21:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74497.133932; Mon, 25 Jan 2021 21:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l49Fl-0006wV-BN; Mon, 25 Jan 2021 21:18:29 +0000
Received: by outflank-mailman (input) for mailman id 74497;
 Mon, 25 Jan 2021 21:18:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9fV7=G4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l49Fk-0006wG-K0
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 21:18:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2538e7f-68f8-495a-bad0-5c37a0e330a5;
 Mon, 25 Jan 2021 21:18:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1F0920679;
 Mon, 25 Jan 2021 21:18:26 +0000 (UTC)
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
X-Inumbo-ID: c2538e7f-68f8-495a-bad0-5c37a0e330a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611609507;
	bh=TmbihCf7qWSJSUWFFJd3wTSE1IyHGGOr9w5cF0cHXRg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SrmZuWQu2DTpxohC9Aw6o7sM8KffJo35qsy9pb0v43RzkE+tpfwULwVCA4MfTZU1X
	 BJoVdkQbIQp9NFlADTPyC8DM+HFGdPJl7JNMV8Js6uVm70bscavkUIPNvAN/cDPOUc
	 0hQaejX2Pgw3HuCceuuzt4du8CXKPYwW4y/DCCN3ZXsyzCLKBMTfIVubwGpb32bMQw
	 3Xv0lUXMj1K2UL06mDIZ/tMdWGiVntKLu+08796HWhWe7Za/oTr4ZxUkPzG6m+F3wa
	 WpUzevuRrew3rSm9vzH22CsVk2VBckrmxRAAxlStZAkGpOZUYPR9lPhQ73BrlBeDC6
	 MxWvDIhCExiZA==
Date: Mon, 25 Jan 2021 13:18:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "iwj@xenproject.org" <iwj@xenproject.org>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>, 
    "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v3] xen: EXPERT clean-up and introduce UNSUPPORTED
In-Reply-To: <E52EF1AE-3CBE-4E21-A81A-1BE5E19D6E62@arm.com>
Message-ID: <alpine.DEB.2.21.2101251253320.20638@sstabellini-ThinkPad-T480s>
References: <20210123021950.1270-1-sstabellini@kernel.org> <E52EF1AE-3CBE-4E21-A81A-1BE5E19D6E62@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-99557625-1611608094=:20638"
Content-ID: <alpine.DEB.2.21.2101251308310.20638@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-99557625-1611608094=:20638
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2101251308311.20638@sstabellini-ThinkPad-T480s>

On Mon, 25 Jan 2021, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 23 Jan 2021, at 02:19, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > A recent thread [1] has exposed a couple of issues with our current way
> > of handling EXPERT.
> > 
> > 1) It is not obvious that "Configure standard Xen features (expert
> > users)" is actually the famous EXPERT we keep talking about on xen-devel
> > 
> > 2) It is not obvious when we need to enable EXPERT to get a specific
> > feature
> > 
> > In particular if you want to enable ACPI support so that you can boot
> > Xen on an ACPI platform, you have to enable EXPERT first. But searching
> > through the kconfig menu it is really not clear (type '/' and "ACPI"):
> > nothing in the description tells you that you need to enable EXPERT to
> > get the option.
> > 
> > So this patch makes things easier by doing two things:
> > 
> > - introduce a new kconfig option UNSUPPORTED which is clearly to enable
> >  UNSUPPORTED features as defined by SUPPORT.md
> 
> That’s a great change which will improve user experience.

Thank you!


> > - change EXPERT options to UNSUPPORTED where it makes sense: keep
> >  depending on EXPERT for features made for experts
> > 
> > - tag unsupported features by adding (UNSUPPORTED) to the one-line
> >  description
> > 
> 
> Shouldn’t we add  (EXPERT) for expert options in the same way for coherency ?

I take you mean add "(EXPERT)" to the one-line description in kconfig. I
am OK with that, probably better as a second separate patch. I'll add
it.
--8323329-99557625-1611608094=:20638--

