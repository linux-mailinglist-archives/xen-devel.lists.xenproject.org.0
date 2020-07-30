Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA16B23329F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 15:08:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k18Hb-0006uZ-F0; Thu, 30 Jul 2020 13:07:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OTA=BJ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k18Ha-0006uU-Iy
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 13:07:38 +0000
X-Inumbo-ID: a3c25854-d265-11ea-aac4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3c25854-d265-11ea-aac4-12813bfff9fa;
 Thu, 30 Jul 2020 13:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596114457;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=c62y2mGmmssXZL5kAsZahXphYgzKh4QuUrTBqYWdLO0=;
 b=U9bi8fyCr4WlmRgQLkyslq59ZcexrDoyF/AXxioYjN6NZNom2YzK0wm2
 tNd6wU/2fX6KlO+1mS5jyKtmQghDqpI83Sl09i9dz7JSYudlQL2WeiIwR
 gbkIEPwSQhr+460peQuCRPpL1QMNHa420qN8lH25h5HWUgZXF2w3dE10k A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uHTK7L7xVqQB6dYXFK0znwuYwCF5c/3Bl8Q32n0svYWRKvaJTB2EnB+n56biw/AMwcVSAt/Vcc
 ooAf10nVCJ7TX6On9HSjFl2DJK/x3+EOHly0W9OTdGkpTiAoi1xkmt44aYyV6AINjWluk6qDWc
 f/z5MBINW2MegbcOtj1e5MHtj65qzoMu6ejIv3HX98DDggCwpjMtSoujhgUvgNSQ7fzL8OrGwg
 RzYOfLKVYdl0HC8n4id/EVwtuGx1BUtvU6kF1D/7/9GDRhxYupYdzBV3TrmZ9/AKE6UgB9k/kJ
 IFo=
X-SBRS: 2.7
X-MesageID: 24408021
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,414,1589256000"; d="scan'208";a="24408021"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24354.50708.138178.815210@mariner.uk.xensource.com>
Date: Thu, 30 Jul 2020 14:07:32 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: kernel-doc and xen.git
In-Reply-To: <785FBD2D-A67C-4740-9C5B-2ECCD0AEBFFC@citrix.com>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
 <785FBD2D-A67C-4740-9C5B-2ECCD0AEBFFC@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Committers <committers@xenproject.org>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: kernel-doc and xen.git"):
> > On Jul 30, 2020, at 2:27 AM, Stefano Stabellini <sstabellini@kernel.org> wrote:
...
> > I did give a look at kernel-doc and it is very promising. kernel-doc is
> > a script that can generate nice rst text documents from in-code
> > comments. (The generated rst files can then be used as input for sphinx
> > to generate html docs.) The comment syntax [2] is simple and similar to
> > Doxygen:
> > 
> >    /**
> >     * function_name() - Brief description of function.
> >     * @arg1: Describe the first argument.
> >     * @arg2: Describe the second argument.
> >     *        One can provide multiple line descriptions
> >     *        for arguments.
> >     */
> > 
> > kernel-doc is actually better than Doxygen because it is a much simpler
> > tool, one we could customize to our needs and with predictable output.
> > Specifically, we could add the tagging, numbering, and referencing
> > required by FuSa requirement documents.
> > 
> > I would like your feedback on whether it would be good to start
> > converting xen.git in-code comments to the kernel-doc format so that
> > proper documents can be generated out of them. One day we could import
> > kernel-doc into xen.git/scripts and use it to generate a set of html
> > documents via sphinx.
> 
> `git-grep ‘^/\*\*$’ ` turns up loads of instances of kernel-doc-style comments in the tree already.  I think it makes complete sense to:
> 
> 1. Start using tools to pull the existing ones into sphinx docs
> 2. Skim through the existing ones to make sure they’re accurate / useful
> 3. Add such comments for elements of key importance to the FUSA SIG
> 4. Encourage people include documentation for new features, &c

I have no objection to this.  Indeed switching to something the kernel
folks find useable is likely to be a good idea.

We should ideally convert the existing hypercall documentation, which
is parsed from a bespoke magic comment format by a script in xen.git.

Ian.

