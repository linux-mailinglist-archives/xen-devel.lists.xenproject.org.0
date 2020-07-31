Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0288D234728
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:48:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VOJ-00081i-OH; Fri, 31 Jul 2020 13:48:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1VOI-00081Y-Po
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:48:06 +0000
X-Inumbo-ID: 75bbd4f6-d334-11ea-abb4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75bbd4f6-d334-11ea-abb4-12813bfff9fa;
 Fri, 31 Jul 2020 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596203285;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=URgNCkP+53pvhFNRR73gpEOWSMa9QiN9+jmEOCsKjls=;
 b=XIU4M/Zy8spUtALYuuQpitGKpjvvgg2r34Z9KXtaZQdNHrEjhl8U7HSR
 K/KOCsX85Eh9WDt8vYEJXt3INdZAZd4crVqNmSt1eudSPx8DpfSBFQP92
 S1OJiZIJhfGgBMIYkZWDg06tD8tfcnHVFq2M0dkGVuqDkUuqWtqd3MKOA 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: B4VCpL1nl5fLFGWGF+qWWrkzKoVZcwuZWTaproI+PoJHVgW5YOwIlixCMGDhttGBpqHQe4SZ2N
 Irg3RRmoHT5zhEJr/UruS8okjmFIzIPB38Hyoxce7d6q8LL+xqxamzK9xKnFlHlauLMOgi3llB
 5/YVDa1mdisgpdmWC1wXNse/Aj7DVvbD+gYcmQ+ofWJqf4koiA68Wdl2NUr0nw82fAYv0weosh
 miHPyZ0fdpwoSCTu7tEPKLUkXx6p4VRibQYMt3EohcKv3++chSJWZxzxRFPuMTUTZn6js/qREs
 668=
X-SBRS: 3.7
X-MesageID: 24505596
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="24505596"
Subject: Re: kernel-doc and xen.git
To: Stefano Stabellini <sstabellini@kernel.org>, <committers@xenproject.org>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dc42ea91-a876-0f85-3d99-739d4990d3eb@citrix.com>
Date: Fri, 31 Jul 2020 14:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/07/2020 02:27, Stefano Stabellini wrote:
> Hi all,
>
> I would like to ask for your feedback on the adoption of the kernel-doc
> format for in-code comments.
>
> In the FuSa SIG we have started looking into FuSa documents for Xen. One
> of the things we are investigating are ways to link these documents to
> in-code comments in xen.git and vice versa.
>
> In this context, Andrew Cooper suggested to have a look at "kernel-doc"
> [1] during one of the virtual beer sessions at the last Xen Summit.
>
> I did give a look at kernel-doc and it is very promising. kernel-doc is
> a script that can generate nice rst text documents from in-code
> comments. (The generated rst files can then be used as input for sphinx
> to generate html docs.) The comment syntax [2] is simple and similar to
> Doxygen:
>
>     /**
>      * function_name() - Brief description of function.
>      * @arg1: Describe the first argument.
>      * @arg2: Describe the second argument.
>      *        One can provide multiple line descriptions
>      *        for arguments.
>      */
>
> kernel-doc is actually better than Doxygen because it is a much simpler
> tool, one we could customize to our needs and with predictable output.
> Specifically, we could add the tagging, numbering, and referencing
> required by FuSa requirement documents.
>
> I would like your feedback on whether it would be good to start
> converting xen.git in-code comments to the kernel-doc format so that
> proper documents can be generated out of them. One day we could import
> kernel-doc into xen.git/scripts and use it to generate a set of html
> documents via sphinx.
>
> At a minimum we'll need to start the in-code comment blocks with two
> stars:
>
>     /**
>
> There could be also other small changes required to make sure the output
> is appropriate.
>
>
> Feedback is welcome!

I think it goes without saying that I'm +1 to this in principle.

We definitely have some /** comments already, but I have no idea if they
are valid kernel-doc or not.  It seems that the kernel-doc has some
ability to report warnings, so it would be interesting to see what that
spits out.

I also think getting rid of our home-grown syntax for the public headers
will be major improvement.  We actually have a reasonable amount of
ancillary documentation

As with everything else in the Sphinx docs, I'd request that we don't
just blindly throw this in and call it done.  We need to curate
additions properly to avoid the docs turning into a mess.  I'm happy to
help out in my copious free time.

~Andrew

