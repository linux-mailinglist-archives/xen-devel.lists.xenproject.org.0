Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DC0349186
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 13:07:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101392.193903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPOlL-00016U-Qh; Thu, 25 Mar 2021 12:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101392.193903; Thu, 25 Mar 2021 12:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPOlL-00016C-Gd; Thu, 25 Mar 2021 12:06:55 +0000
Received: by outflank-mailman (input) for mailman id 101392;
 Thu, 25 Mar 2021 12:06:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TYnr=IX=intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1lPOlJ-000167-Rb
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 12:06:53 +0000
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ebd607b-5abd-4338-93b1-fd2f7fb09ebf;
 Thu, 25 Mar 2021 12:06:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 05:06:49 -0700
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 05:06:46 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1lPOl9-00G2C7-Nk; Thu, 25 Mar 2021 14:06:43 +0200
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
X-Inumbo-ID: 3ebd607b-5abd-4338-93b1-fd2f7fb09ebf
IronPort-SDR: g3InKXdDzu9WXIUYj8FVOJ9A2WAZqsOO2P4Yd6+1/lMb5f6kK4W3jGQ6KsSgWSJJZ4c366zd/I
 Gvg0N8awAXBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188616643"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="188616643"
IronPort-SDR: nXQRT8F2j/iOtbKgmkvi3bw9pPw6+AvGS9dShY8ox4/rl8Xhc1dwyVW2A5twvUdrvugohHK+tI
 GYJ6k1bpX1lw==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="436437388"
Date: Thu, 25 Mar 2021 14:06:43 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFx80wYt/KcHanC7@smile.fi.intel.com>
References: <20210324123118.58865-1-roger.pau@citrix.com>
 <YFs3XwOBRGAFyASY@smile.fi.intel.com>
 <YFtEw7qHQKE/4p8t@Air-de-Roger>
 <YFtLNLTrR9wTO41W@smile.fi.intel.com>
 <YFtXNw8ZKkp82EIH@Air-de-Roger>
 <YFtvaBmnu0GF/7il@smile.fi.intel.com>
 <YFxN9hlt0FbOVqML@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFxN9hlt0FbOVqML@Air-de-Roger>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 25, 2021 at 09:46:46AM +0100, Roger Pau Monné wrote:
> On Wed, Mar 24, 2021 at 06:57:12PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 24, 2021 at 04:13:59PM +0100, Roger Pau Monné wrote:
> > > On Wed, Mar 24, 2021 at 04:22:44PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Mar 24, 2021 at 02:55:15PM +0100, Roger Pau Monné wrote:
> > > > > On Wed, Mar 24, 2021 at 02:58:07PM +0200, Andy Shevchenko wrote:

...

> > > > Unfortunately it does not expose PCI configuration space.
> > > 
> > > Are those regions supposed to be marked as reserved in the memory map,
> > > or that's left to the discretion of the hardware vendor?
> > 
> > I didn't get. The OS doesn't see them and an internal backbone simply drops any
> > IO access to that region.
> 
> I'm not sure I understand the above reply. My question was whether the
> MMIO regions used by the pinctrl device (as fetched from the ACPI DSDT
> table) are supposed belong to regions marked as RESERVED in the
> firmware memory map (ie: either the e820 or the EFI one).

I don't actually know. I guess it should be done in order to have ACPI device
a possibility to claim the resource.

> > > > > Doing something like pci_device_is_present would require a register
> > > > > that we know will never return ~0 unless the device is not present. As
> > > > > said above, maybe we could use REVID to that end?
> > > > 
> > > > Yes, that's good, see above.
> > > > 
> > > > WRT capabilities, if we crash we will see the report immediately on the
> > > > hardware which has such an issue. (It's quite unlikely we will ever have one,
> > > > that's why I consider it's not critical)
> > > 
> > > I would rather prefer to not crash, because I think the kernel should
> > > only resort to crashing when there's no alternative, and here it's
> > > perfectly fine to just print an error message and don't load the
> > > driver.
> > 
> > Are we speaking about real hardware that has an issue? I eagerly want to know
> > what is that beast.
> 
> OK, I'm not going to resend this anymore. I'm happy with just getting
> the first patch in.
> 
> I think you trust the hardware more that I would do, and I also think
> the check added here is very minimal an unintrusive and serves as a
> way to sanitize the data fetched from the hardware in order to prevent
> a kernel page fault if such data turns out to be wrong.
> 
> Taking a reactive approach of requiring a broken piece of hardware to
> exist in order to sanitize a fetched value seems too risky. I could
> add a WARN_ON or similar if you want some kind of splat that's very
> noticeable when this goes wrong but that doesn't end up in a fatal
> kernel page fault.

You found the issue anyway as long as you had a crash, so current code already
proved that it does it work perfectly.

Since I know what hardware this driver is for, I can assure you, that it will
be quite unlikely to have wrong data in the capability register. The data sheet
is crystal clear about the register's contents: on real hardware it must be
present and be set to a sane value.

-- 
With Best Regards,
Andy Shevchenko



