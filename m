Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A62DC276
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 15:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55283.96334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpY9P-0003lS-Rk; Wed, 16 Dec 2020 14:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55283.96334; Wed, 16 Dec 2020 14:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpY9P-0003l3-Oo; Wed, 16 Dec 2020 14:51:35 +0000
Received: by outflank-mailman (input) for mailman id 55283;
 Wed, 16 Dec 2020 14:51:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cg29=FU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpY9N-0003ky-Ul
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 14:51:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 726ce51f-154c-4ffe-b429-16d3be5518d3;
 Wed, 16 Dec 2020 14:51:32 +0000 (UTC)
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
X-Inumbo-ID: 726ce51f-154c-4ffe-b429-16d3be5518d3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608130292;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=dQA0xUECaBfK1yRNFSy0wTT3mTIf7fofy8eoq1aXgp0=;
  b=IdYgSz7VirUNq3yOD7Rv/dVTuIcH+UpgBpilT5DfHkBUMD+X+CYoYK07
   GGPsSBFsLxc9p/MOIPvZ+bt7zGMCd5J60FNsk3jjtvza8nFbbmxP//1R2
   uE2uiBpjdJa7brCBLNSKGVXcH40kwmHQNwXujUM+fDadr1Sfoz1dqKOrK
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HRCDMPqf9GWVs7mwFgcdBvtFV8PGjqRwuH6pgkeUus2kqbzzXlXAHd8QrcmYbTi1y28pDPlcKS
 pDo6BdE4OMT5RZ4T+GtfqJjw72jx/OnqD4vPZSDFzV7S1Jr1jhTLUJe6Elnr59VQoIftjIP2N+
 myNyJgMVOTyIKzAt2ry/nbqJTGd1pgpn2Ao8NnPvny6UgMBvSsZVbQH8qHmUyXXqY7qjjS6Xc8
 PFbRG2HOg8aqdOYMya8BpMzjCLmyb+bbGBHDTm8LK6M8mA22iz0jqzmhsxQ4bFcpxyrwSEWYZX
 L5Y=
X-SBRS: 5.2
X-MesageID: 33375625
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,424,1599537600"; 
   d="scan'208";a="33375625"
Subject: Re: [openxt-dev] Re: Follow up on libxl-fix-reboot.patch
To: Jason Andryuk <jandryuk@gmail.com>, Chris Rogers <crogers122@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Rich Persaud
	<persaur@gmail.com>, openxt <openxt@googlegroups.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Olivier Lambert
	<olivier.lambert@vates.fr>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <CAKf6xps-nM13E19SVS3NJwq6LwOJLUwN+FC6k_Sp9-_YaRt-EA@mail.gmail.com>
 <3ACCFEC6-A8B7-48E6-AA3F-48D4CDE75FA4@gmail.com>
 <alpine.DEB.2.21.2012141632020.4040@sstabellini-ThinkPad-T480s>
 <CAC4Yorgk89vaDsbygvebiBOan-3OWE=D9xKiri_JwQAVWZ19GQ@mail.gmail.com>
 <CAKf6xpvpyA6E6gC6cmZ-Ewayyue-C5WcnGtatsxf_Cefg1CxaA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c7b345aa-604a-b2f3-0800-1ed445ebc213@citrix.com>
Date: Wed, 16 Dec 2020 14:51:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpvpyA6E6gC6cmZ-Ewayyue-C5WcnGtatsxf_Cefg1CxaA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 16/12/2020 14:14, Jason Andryuk wrote:
> On Tue, Dec 15, 2020 at 5:22 PM Chris Rogers <crogers122@gmail.com> wrote:
>> Hopefully I can provide a little more context.  Here is a link to the patch:
>>
>> https://github.com/OpenXT/xenclient-oe/blob/master/recipes-extended/xen/files/libxl-fix-reboot.patch
>>
>> The patch is a bit mis-named.  It does not implement XEN_DOMCTL_SENDTRIGGER_RESET.  It's just a workaround to handle the missing RESET implementation.
>>
>> Its purpose is to make an HVM guest "reboot" regardless of whether PV tools have been installed and the xenstore interface is listening or not.  From the client perspective that OpenXT is concerned with, this is for ease-of-use for working with HVM guests before PV tools are installed.  To summarize the flow of the patch:
>>
>> - User input causes high level toolstack, xenmgr, to do xl reboot <domid>
>> - libxl hits "PV interface not available", so it tries the fallback ACPI reset trigger (but that's not implemented in domctl)
>> - therefore, the patch changes the RESET trigger to POWER trigger, and sets a 'reboot' flag
>> - when the xl create process handles the domain_death event for LIBXL_SHUTDOWN_REASON_POWEROFF, we check for our 'reboot' flag.
>> - It's set, so we set "action" as if we came from a real restart, which makes the xl create process take the 'goto start' codepath to rebuild the domain.
>>
>> I think we'd like to get rid of this patch, but at the moment I don't have any code or a design to propose that would implement the XEN_DOMCTL_SENDTRIGGER_RESET.
> I'm not sure it's possible to implement one.  Does an ACPI
> reset/reboot button exist?  And then you'd have the problem that the
> guest needs to be configured to react to the button.

The ACPI spec has two signals as far as this goes. "the user pressed the
power button" and "the user {pressed the suspend button, closed the
laptop lid}".  Neither are useful for VMs typically, because default OS
settings do the wrong thing.

The mystery to unravel here is why xl is issuing an erroneous hypercall.

It is very unlikely that we will have dropped
XEN_DOMCTL_SENDTRIGGER_RESET from Xen, but I suppose its possible.  It's
definitely weird that we have it in the interface and unimplemented.

It's also possible it was a copy&paste mistake when trying to implement
an interface consistent with `xm trigger`.

It is definitely concerning that we've got a piece of functionality like
this which clearly hasn't seen any testing upstream.

~Andrew

