Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C83311163
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 20:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81918.151506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l86xj-0002Ca-RP; Fri, 05 Feb 2021 19:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81918.151506; Fri, 05 Feb 2021 19:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l86xj-0002CB-N9; Fri, 05 Feb 2021 19:40:15 +0000
Received: by outflank-mailman (input) for mailman id 81918;
 Fri, 05 Feb 2021 19:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kT56=HH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l86xi-0002C6-2m
 for xen-devel@lists.xen.org; Fri, 05 Feb 2021 19:40:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c40160d-5cd6-4a46-9a83-cfe66fb38413;
 Fri, 05 Feb 2021 19:40:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E971464FB7;
 Fri,  5 Feb 2021 19:40:11 +0000 (UTC)
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
X-Inumbo-ID: 2c40160d-5cd6-4a46-9a83-cfe66fb38413
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612554012;
	bh=S00fFEx8CJmuybUec97Mzjk57cdf8FqtKK0aWEm5DF4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qpXKjpqMwO+2mr6OZtUMq6uNB8Xfj/O7AQZh+OTEL0oA/JyRYlknerLjTiaSmek73
	 0zHogtxETtK7ZyGS2YNrvnTxOmzGOejLqlYViVrhGwuBAesvKvtETXLamYm13BZTw4
	 QWcuo+0NGIcg9auVtwYIhsuC3/2aNrZ/G/mYCeY5beJVxaSSald4pN9GB4QOgzNAcZ
	 XvW03AtoAtdI5t6ceL15NXUbUCREwrIFBM1j8/MNOlHKDdi4irHsGyI6AOq/UcczE7
	 KOH+CBZvB1uoEszsl/J/mmMEYEF6n10Ag5oPZtMwYIk0xdLt92iIRIMxYtETECcPCQ
	 MKEgp+Q0FN6UQ==
Date: Fri, 5 Feb 2021 11:40:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Xen-devel <xen-devel@lists.xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    bertrand.marquis@arm.com, roger.pau@citrix.com, julien@xen.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    Rich Persaud <persaur@gmail.com>, adam.schwalm@starlab.io
Subject: Re: DomB Working Group
In-Reply-To: <d0b1a7d1-2260-567b-fd8d-04e32a3504f2@apertussolutions.com>
Message-ID: <alpine.DEB.2.21.2102051139460.29047@sstabellini-ThinkPad-T480s>
References: <d0b1a7d1-2260-567b-fd8d-04e32a3504f2@apertussolutions.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Daniel,

The time works for me. I am looking forward to it.

Cheers,

Stefano


On Fri, 5 Feb 2021, Daniel P. Smith wrote:

> Greetings,
> 
> Per the community call on Feb. 4 I would like to get the working group
> started that will be reviewing the major design decisions for the DomB
> implementation. A summary of the discussion around the two primary
> decisions we are seeking to get resolved are as follows,
> 
> 
> Topic: DomB: Adoption of Device Tree as the format for the Launch
> Control Module
> * Consensus approval from x86 and Arm maintainers and members of the Xen
> community on the call to proceed with Device Tree as the format for the
> DomB LCM (described in the previous mailing list posts).
> 
> - a working group will follow up on the work for handling migration of
> device tree handling code within the hypervisor, previously imported
> from outside the project, from the Arm hypervisor code into Common.
> 
> Topic: DomB: Surfacing configuration data to guests: ACPI tables, Device
> Tree
> * Recommendation was that both will be needed, and OK to proceed with
> just implementing one but plan and design for the second to be added.
> First is likely to be ACPI; to be determined as development progress is
> made.
> 
> 
> To continue the discussion from there, I would like to propose a call on
> Thursday February 11th at 1700UTC, 0900PST/1200EST/1800CEST. I have
> provided call details below for those who are able to attend. The agenda
> is available on CryptPad. If you are not able to attend, please reach
> out directly. Thanks and hope to see everyone on the call!
> 
> 
> Agenda
> ======
> https://cryptpad.fr/pad/#/2/pad/edit/iVEku8zImQg320a3D4IBAKQh/
> 
> 
> Meeting Invite
> ==============
> Daniel Smith's Meeting
> 
> Please join my meeting from your computer, tablet or smartphone.
> https://www.gotomeet.me/apertussolutions
> 
> You can also dial in using your phone.
> United States (Toll Free): 1 877 568 4106
> 
> Access Code: 691-818-141
> 
> More phone numbers:
> Austria (Toll Free): 0 800 202148
> Belarus (Toll Free): 8 820 0011 0400
> Belgium (Toll Free): 0 800 78884
> Bulgaria (Toll Free): 00800 120 4417
> Canada (Toll Free): 1 888 455 1389
> China (Toll Free): 4000 762962
> Czech Republic (Toll Free): 800 500448
> Denmark (Toll Free): 8025 3126
> Finland (Toll Free): 0 800 917656
> France (Toll Free): 0 805 541 047
> Germany (Toll Free): 0 800 184 4222
> Greece (Toll Free): 00 800 4414 3838
> Hungary (Toll Free): (06) 80 986 255
> Iceland (Toll Free): 800 7204
> India (Toll Free): 18002669254
> Ireland (Toll Free): 1 800 901 610
> Italy (Toll Free): 800 793887
> Netherlands (Toll Free): 0 800 020 0182
> Norway (Toll Free): 800 69 046
> Poland (Toll Free): 00 800 1124759
> Portugal (Toll Free): 800 819 575
> Romania (Toll Free): 0 800 400 819
> Slovakia (Toll Free): 0 800 105 748
> Spain (Toll Free): 800 900 582
> Sweden (Toll Free): 0 200 330 905
> Switzerland (Toll Free): 0 800 002 348
> Ukraine (Toll Free): 0 800 60 9135
> United Kingdom (Toll Free): 0 800 169 0432
> 
> 
> New to GoToMeeting? Get the app now and be ready when your first meeting
> starts: https://global.gotomeeting.com/install/691818141
> 
> 
> V/r,
> 
> Daniel P. Smith
> 
> Apertus Solutions, LLC
> 
> 
> 

