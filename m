Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C7A2C0F4B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34739.65944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khE8u-0002IH-TV; Mon, 23 Nov 2020 15:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34739.65944; Mon, 23 Nov 2020 15:52:40 +0000
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
	id 1khE8u-0002Hs-Q8; Mon, 23 Nov 2020 15:52:40 +0000
Received: by outflank-mailman (input) for mailman id 34739;
 Mon, 23 Nov 2020 15:52:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IF/R=E5=intel.com=jani.nikula@srs-us1.protection.inumbo.net>)
 id 1khE8t-0002Hn-HG
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:52:39 +0000
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c815b950-555c-40b8-afe9-08ffb359d729;
 Mon, 23 Nov 2020 15:52:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 07:52:35 -0800
Received: from suygunge-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.40.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 07:52:23 -0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IF/R=E5=intel.com=jani.nikula@srs-us1.protection.inumbo.net>)
	id 1khE8t-0002Hn-HG
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:52:39 +0000
X-Inumbo-ID: c815b950-555c-40b8-afe9-08ffb359d729
Received: from mga12.intel.com (unknown [192.55.52.136])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c815b950-555c-40b8-afe9-08ffb359d729;
	Mon, 23 Nov 2020 15:52:36 +0000 (UTC)
IronPort-SDR: nWTYa8g0rWcbxhpszlWq+vd69NOYVvmzmokM+9CYLSZ1l9yziEjZJoG+FRqiTknlvuVS6VPCEy
 kGUiTNsx2QGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="151049419"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="151049419"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:52:35 -0800
IronPort-SDR: o6LRPZSLFHblJ72nLIxI7QtuEJsSPQd11jVZTPC9b01xjBsR6V5ML2IOh4GsWUUm1pKbyVJ0KQ
 V9qBxJqg/0zw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="546463497"
Received: from suygunge-mobl.ger.corp.intel.com (HELO localhost) ([10.249.40.108])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:52:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, trix@redhat.com, joe@perches.com, clang-built-linux@googlegroups.com
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com, linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net, coreteam@netfilter.org, xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org, alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org, linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org, patches@opensource.cirrus.com, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
In-Reply-To: <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201121165058.1644182-1-trix@redhat.com> <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Date: Mon, 23 Nov 2020 17:52:20 +0200
Message-ID: <87y2ism5or.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, 21 Nov 2020, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
>> A difficult part of automating commits is composing the subsystem
>> preamble in the commit log.  For the ongoing effort of a fixer
>> producing
>> one or two fixes a release the use of 'treewide:' does not seem
>> appropriate.
>> 
>> It would be better if the normal prefix was used.  Unfortunately
>> normal is
>> not consistent across the tree.
>> 
>> 
>> 	D: Commit subsystem prefix
>> 
>> ex/ for FPGA DFL DRIVERS
>> 
>> 	D: fpga: dfl:
>> 
>
> I've got to bet this is going to cause more issues than it solves.

Agreed.

> SCSI uses scsi: <driver>: for drivers but not every driver has a
> MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> things, but we're not consistent.  Block uses blk-<something>: for all
> of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> the next thing you're going to cause is an explosion of suggested
> MAINTAINERs entries.

On the one hand, adoption of new MAINTAINERS entries has been really
slow. Look at B, C, or P, for instance. On the other hand, if this were
to get adopted, you'll potentially get conflicting prefixes for patches
touching multiple files. Then what?

I'm guessing a script looking at git log could come up with better
suggestions for prefixes via popularity contest than manually maintained
MAINTAINERS entries. It might not always get it right, but then human
outsiders aren't going to always get it right either.

Now you'll only need Someone(tm) to write the script. ;)

Something quick like this:

git log --since={1year} --pretty=format:%s -- <FILES> |\
	grep -v "^\(Merge\|Revert\)" |\
        sed 's/:[^:]*$//' |\
        sort | uniq -c | sort -rn | head -5

already gives me results that really aren't worse than some of the
prefixes invented by drive-by contributors.

> Has anyone actually complained about treewide:?

As Joe said, I'd feel silly applying patches to drivers with that
prefix. If it gets applied by someone else higher up, literally
treewide, then no complaints.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

