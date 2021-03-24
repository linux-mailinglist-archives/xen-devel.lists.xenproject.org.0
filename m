Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD42347E52
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101123.193185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6os-0002mg-BT; Wed, 24 Mar 2021 16:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101123.193185; Wed, 24 Mar 2021 16:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6os-0002mH-85; Wed, 24 Mar 2021 16:57:22 +0000
Received: by outflank-mailman (input) for mailman id 101123;
 Wed, 24 Mar 2021 16:57:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehbw=IW=intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1lP6oq-0002mC-Jg
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:57:20 +0000
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4406143f-128b-430e-bab2-55b5dc8b9dc3;
 Wed, 24 Mar 2021 16:57:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 09:57:16 -0700
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 09:57:15 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1lP6oi-00FkMQ-KG; Wed, 24 Mar 2021 18:57:12 +0200
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
X-Inumbo-ID: 4406143f-128b-430e-bab2-55b5dc8b9dc3
IronPort-SDR: OdRKHOYoz3d3rDGX1Fim9ZfMg9EeG5Dz6Xi6VBfsoRSWoLn3ZshDD30h1UikM7mJIqOzowEbrE
 9UnKITulCQtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="170093428"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="170093428"
IronPort-SDR: QKHVSokjMFkLoV94H026lGKVi1Fl0S26xj/UiQdOE2PzfOoA4B0gBo9rxridMTsB28m0wXFHZm
 i4mYWeorV4kw==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="442319110"
Date: Wed, 24 Mar 2021 18:57:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFtvaBmnu0GF/7il@smile.fi.intel.com>
References: <20210324123118.58865-1-roger.pau@citrix.com>
 <YFs3XwOBRGAFyASY@smile.fi.intel.com>
 <YFtEw7qHQKE/4p8t@Air-de-Roger>
 <YFtLNLTrR9wTO41W@smile.fi.intel.com>
 <YFtXNw8ZKkp82EIH@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFtXNw8ZKkp82EIH@Air-de-Roger>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 24, 2021 at 04:13:59PM +0100, Roger Pau Monné wrote:
> On Wed, Mar 24, 2021 at 04:22:44PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 24, 2021 at 02:55:15PM +0100, Roger Pau Monné wrote:
> > > On Wed, Mar 24, 2021 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Mar 24, 2021 at 01:31:18PM +0100, Roger Pau Monne wrote:
> > > > Moreover, it seems you are bailing out and basically denying driver to load.
> > > > This does look that capability is simply the first register that blows the setup.
> > > > I think you have to fix something into Xen to avoid loading these drivers or
> > > > check with something like pci_device_is_present() approach.
> > > 
> > > Is there a backing PCI device BAR for those MMIO regions that the
> > > pinctrl driver is trying to access? AFAICT those regions are only
> > > reported in the ACPI DSDT table on the _CRS method of the object (at
> > > least on my system).
> > 
> > Unfortunately it does not expose PCI configuration space.
> 
> Are those regions supposed to be marked as reserved in the memory map,
> or that's left to the discretion of the hardware vendor?

I didn't get. The OS doesn't see them and an internal backbone simply drops any
IO access to that region.

> > > Doing something like pci_device_is_present would require a register
> > > that we know will never return ~0 unless the device is not present. As
> > > said above, maybe we could use REVID to that end?
> > 
> > Yes, that's good, see above.
> > 
> > WRT capabilities, if we crash we will see the report immediately on the
> > hardware which has such an issue. (It's quite unlikely we will ever have one,
> > that's why I consider it's not critical)
> 
> I would rather prefer to not crash, because I think the kernel should
> only resort to crashing when there's no alternative, and here it's
> perfectly fine to just print an error message and don't load the
> driver.

Are we speaking about real hardware that has an issue? I eagerly want to know
what is that beast.

> IMO I would rather boot without pinctrl than get a panic if
> it turns out pinctrl capabilities list is somehow corrupted.

Again, do you have a hardware that does this?

> It's a
> long shot, but the check added in order to prevent this scenario is
> minimal.

> In any case I will send a new version with the REVID check and this
> current patch.

Okay, let's continue there, but I'm pessimistic about accepting this patch.

-- 
With Best Regards,
Andy Shevchenko



