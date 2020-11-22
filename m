Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D881D2BFC32
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 23:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33526.64594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgxvm-00087C-Cy; Sun, 22 Nov 2020 22:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33526.64594; Sun, 22 Nov 2020 22:34:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgxvm-00086o-9c; Sun, 22 Nov 2020 22:34:02 +0000
Received: by outflank-mailman (input) for mailman id 33526;
 Sun, 22 Nov 2020 22:34:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TnN1=E4=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
 id 1kgxvl-00086j-4Y
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 22:34:01 +0000
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 23bfc369-788e-4889-a1cb-fdcf3babc460;
 Sun, 22 Nov 2020 22:33:59 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id A588721F21;
 Sun, 22 Nov 2020 17:33:55 -0500 (EST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TnN1=E4=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
	id 1kgxvl-00086j-4Y
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 22:34:01 +0000
X-Inumbo-ID: 23bfc369-788e-4889-a1cb-fdcf3babc460
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 23bfc369-788e-4889-a1cb-fdcf3babc460;
	Sun, 22 Nov 2020 22:33:59 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id A588721F21;
	Sun, 22 Nov 2020 17:33:55 -0500 (EST)
Date: Mon, 23 Nov 2020 09:33:55 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Joe Perches <joe@perches.com>
cc: James Bottomley <James.Bottomley@HansenPartnership.com>, 
    Tom Rix <trix@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
    clang-built-linux@googlegroups.com, linux-hyperv@vger.kernel.org, 
    linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
    tboot-devel@lists.sourceforge.net, kvm@vger.kernel.org, 
    linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org, 
    amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
    intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org, 
    linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, 
    linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
    linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, 
    linux-fbdev@vger.kernel.org, ecryptfs@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com, 
    linux-mtd@lists.infradead.org, keyrings@vger.kernel.org, 
    netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
    alsa-devel@alsa-project.org, bpf@vger.kernel.org, 
    linux-bluetooth@vger.kernel.org, linux-nfs@vger.kernel.org, 
    patches@opensource.cirrus.com
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
In-Reply-To: <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
Message-ID: <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
References: <20201121165058.1644182-1-trix@redhat.com>         <20201122032304.GE4327@casper.infradead.org>         <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>         <20201122145635.GG4327@casper.infradead.org>         <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
         <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com> <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sun, 22 Nov 2020, Joe Perches wrote:

> On Sun, 2020-11-22 at 08:49 -0800, James Bottomley wrote:
> > We can enforce sysfs_emit going forwards
> > using tools like checkpatch
> 
> It's not really possible for checkpatch to find or warn about
> sysfs uses of sprintf. checkpatch is really just a trivial
> line-by-line parser and it has no concept of code intent.
> 

Checkpatch does suffer from the limitations of regular expressions. But 
that doesn't stop people from using it. Besides, Coccinelle can do 
analyses that can't be done with regular expressions, so it's moot.

> It just can't warn on every use of the sprintf family.
> There are just too many perfectly valid uses.
> 
> > but there's no benefit and a lot of harm to
> > be done by trying to churn the entire tree
> 
> Single uses of sprintf for sysfs is not really any problem.
> 
> But likely there are still several possible overrun sprintf/snprintf
> paths in sysfs.  Some of them are very obscure and unlikely to be
> found by a robot as the logic for sysfs buf uses can be fairly twisty.
> 

Logic errors of this kind are susceptible to fuzzing, formal methods, 
symbolic execution etc. No doubt there are other techniques that I don't 
know about.

> But provably correct conversions IMO _should_ be done and IMO churn 
> considerations should generally have less importance.
> 

Provably equivalent conversions are provably churn. So apparently you're 
advocating changes that are not provably equivalent.

These are patches for code not that's not been shown to be buggy. Code 
which, after patching, can be shown to be free of a specific kind of 
theoretical bug. Hardly "provably correct".

The problem is, the class of theoretical bugs that can be avoided in this 
way is probably limitless, as is the review cost and the risk of 
accidental regressions. And the payoff is entirely theoretical.

Moreover, the patch review workload for skilled humans is being generated 
by the automation, which is completely backwards: the machine is supposed 
to be helping.

