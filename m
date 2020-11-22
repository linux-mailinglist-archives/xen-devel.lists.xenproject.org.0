Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4E2BC7E1
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 19:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33426.64451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgu0d-0002rF-8F; Sun, 22 Nov 2020 18:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33426.64451; Sun, 22 Nov 2020 18:22:47 +0000
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
	id 1kgu0d-0002qq-4k; Sun, 22 Nov 2020 18:22:47 +0000
Received: by outflank-mailman (input) for mailman id 33426;
 Sun, 22 Nov 2020 18:22:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D2VG=E4=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1kgu0c-0002qk-5O
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 18:22:46 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.233])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4067301f-669f-469b-95df-740ab119a442;
 Sun, 22 Nov 2020 18:22:42 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 5998D18029124;
 Sun, 22 Nov 2020 18:22:42 +0000 (UTC)
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sun, 22 Nov 2020 18:22:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=D2VG=E4=perches.com=joe@srs-us1.protection.inumbo.net>)
	id 1kgu0c-0002qk-5O
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 18:22:46 +0000
X-Inumbo-ID: 4067301f-669f-469b-95df-740ab119a442
Received: from smtprelay.hostedemail.com (unknown [216.40.44.233])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4067301f-669f-469b-95df-740ab119a442;
	Sun, 22 Nov 2020 18:22:42 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 5998D18029124;
	Sun, 22 Nov 2020 18:22:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1543:1593:1594:1605:1711:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4043:4321:5007:6119:6742:6743:7809:7903:8660:9025:10004:10400:10848:11026:11232:11473:11658:11914:12043:12295:12296:12297:12555:12663:12740:12760:12895:12986:13095:13148:13161:13229:13230:13439:14181:14659:14721:14822:21080:21324:21394:21433:21451:21627:21740:21811:21939:21987:30041:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: base07_180d0122735e
X-Filterd-Recvd-Size: 5347
Received: from XPS-9350.home (unknown [47.151.128.180])
	(Authenticated sender: joe@perches.com)
	by omf13.hostedemail.com (Postfix) with ESMTPA;
	Sun, 22 Nov 2020 18:22:37 +0000 (UTC)
Message-ID: <859bae8ddae3238116824192f6ddf1c91a381913.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: Tom Rix <trix@redhat.com>, clang-built-linux@googlegroups.com
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, tboot-devel@lists.sourceforge.net, 
 kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org,  devel@acpica.org,
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
Date: Sun, 22 Nov 2020 10:22:36 -0800
In-Reply-To: <6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
	 <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
	 <6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2020-11-22 at 08:33 -0800, Tom Rix wrote:
> On 11/21/20 9:10 AM, Joe Perches wrote:
> > On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> > > A difficult part of automating commits is composing the subsystem
> > > preamble in the commit log.  For the ongoing effort of a fixer producing
> > > one or two fixes a release the use of 'treewide:' does not seem appropriate.
> > > 
> > > It would be better if the normal prefix was used.  Unfortunately normal is
> > > not consistent across the tree.
> > > 
> > > So I am looking for comments for adding a new tag to the MAINTAINERS file
> > > 
> > > 	D: Commit subsystem prefix
> > > 
> > > ex/ for FPGA DFL DRIVERS
> > > 
> > > 	D: fpga: dfl:
> > I'm all for it.  Good luck with the effort.  It's not completely trivial.
> > 
> > From a decade ago:
> > 
> > https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/
> > 
> > (and that thread started with extra semicolon patches too)
> 
> Reading the history, how about this.
> 
> get_maintainer.pl outputs a single prefix, if multiple files have the
> same prefix it works, if they don't its an error.
> 
> Another script 'commit_one_file.sh' does the call to get_mainainter.pl
> to get the prefix and be called by run-clang-tools.py to get the fixer
> specific message.

It's not whether the script used is get_maintainer or any other script,
the question is really if the MAINTAINERS file is the appropriate place
to store per-subsystem patch specific prefixes.

It is.

Then the question should be how are the forms described and what is the
inheritance priority.  My preference would be to have a default of
inherit the parent base and add basename(subsystem dirname).

Commit history seems to have standardized on using colons as the separator
between the commit prefix and the subject.

A good mechanism to explore how various subsystems have uses prefixes in
the past might be something like:

$ git log --no-merges --pretty='%s' -<commit_count> <subsystem_path> | \
  perl -n -e 'print substr($_, 0, rindex($_, ":") + 1) . "\n";' | \
  sort | uniq -c | sort -rn

Using 10000 for commit_count and drivers/scsi for subsystem_path, the
top 40 entries are below:

About 1% don't have a colon, and there is no real consistency even
within individual drivers below scsi.  For instance, qla2xxx:

     1	    814 scsi: qla2xxx:
     2	    691 scsi: lpfc:
     3	    389 scsi: hisi_sas:
     4	    354 scsi: ufs:
     5	    339 scsi:
     6	    291 qla2xxx:
     7	    256 scsi: megaraid_sas:
     8	    249 scsi: mpt3sas:
     9	    200 hpsa:
    10	    190 scsi: aacraid:
    11	    174 lpfc:
    12	    153 scsi: qedf:
    13	    144 scsi: smartpqi:
    14	    139 scsi: cxlflash:
    15	    122 scsi: core:
    16	    110 [SCSI] qla2xxx:
    17	    108 ncr5380:
    18	     98 scsi: hpsa:
    19	     97 
    20	     89 treewide:
    21	     88 mpt3sas:
    22	     86 scsi: libfc:
    23	     85 scsi: qedi:
    24	     84 scsi: be2iscsi:
    25	     81 [SCSI] qla4xxx:
    26	     81 hisi_sas:
    27	     81 block:
    28	     75 megaraid_sas:
    29	     71 scsi: sd:
    30	     69 [SCSI] hpsa:
    31	     68 cxlflash:
    32	     65 scsi: libsas:
    33	     65 scsi: fnic:
    34	     61 scsi: scsi_debug:
    35	     60 scsi: arcmsr:
    36	     57 be2iscsi:
    37	     53 atp870u:
    38	     51 scsi: bfa:
    39	     50 scsi: storvsc:
    40	     48 sd:



