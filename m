Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D095514A80
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317312.536590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQep-00040U-CV; Fri, 29 Apr 2022 13:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317312.536590; Fri, 29 Apr 2022 13:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQep-0003ye-9X; Fri, 29 Apr 2022 13:27:39 +0000
Received: by outflank-mailman (input) for mailman id 317312;
 Fri, 29 Apr 2022 13:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxz=VH=citrix.com=prvs=111f028e5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nkQen-0003iw-34
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:27:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 210de3df-c7c0-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 15:27:36 +0200 (CEST)
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
X-Inumbo-ID: 210de3df-c7c0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651238855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=skkYtrnScwGLZ9ZnrOPk2R2LIXD+n3PS4wQvYmhXiak=;
  b=g0JT6WGQz2Mx5jLnl19pIg8bLlAVDGoioESPkOZZInaraltKKxhCaJ4l
   jE5eN0xblV1ULQ9py4ViCEbEStQTXuVAs9qYly174/yDkupmBRypzE65X
   MY1offh891GtBAY/kjyC3KL0NE1HaCN0jPKKtszgkwsF1jKbSOtxXkgut
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70254362
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:agy0sa5+NeQIozx5ECnrcQxRtOLHchMFZxGqfqrLsTDasY5as4F+v
 moWWmGHMvmINmamL98nYN+2/U0Hu5HQz9E2TAVp+3tkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YTjUlvW0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSzSCsreYjVyN0cECUAKiYgfvdY05/udC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VBM2czN0qaC/FJEmYHGogUpuSDv2HAXjxTgVipgfUNyFGGmWSd15CyaYGIK7RmX/59hV2Er
 2jL+2D4BBAyN9GFzzeBtHW2iYfnnz7/WY8UPK218LhtmlL77lIUDBoaRF6qu86Tg0S1W89cA
 0EM8y9opq83nGSnR8fwdwe1q3mFulgbQdU4O/I+wBGAzOzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8rzm/JCwUJm8qfjIfQE0O5NyLiIM8lBXUVf54DbW4yNbyHFnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhTQ8Z5ELyRzKc70BFPLeiOc/y93P7xKMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDB0xWvvobwMFd
 6M6Vel5wJZIdEWnYqZsC25aI5R7lPOwfTgJux29UzavXnSTXFLflM2NTRTJt4wIrKTLuftiU
 ap3ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOSfMEe1caQDUN71RAEa4TOP9q
 oc32yyikUg3bQEDSnOPrd57wa4icBDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/89qws8x
 VnkAhUw4AOm3RXvcFzaAlg+OOKHdcsu9hoTYH1zVWtELlB+OO5DGo9ELMBpFVTmncQ+pcNJo
 w4tJpvQX6wTGmiWk9nfBLGkxLFfmN2QrVrmF0KYjPIXJfaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:zIVIUqufc9P9oT/BPGUUDlj47skDTtV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVEqKRcdcLG7Sc29qBznmaKdjbN/AV7mZniehILKFvAG0WKB+UyCJ8SWzIc0vs
 0MT0E9MqyTMbETt7eD3ODSKbYdKbe8npyVuQ==
X-IronPort-AV: E=Sophos;i="5.91,185,1647316800"; 
   d="scan'208";a="70254362"
Date: Fri, 29 Apr 2022 14:27:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <Ymvnt0mVPSAXrppS@perard.uk.xensource.com>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
 <20220413112111.30675-3-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220413112111.30675-3-jane.malalane@citrix.com>

On Wed, Apr 13, 2022 at 12:21:11PM +0100, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted virtualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by decoding the
> APIC access and providing a VM exit with a more specific exit reason
> than a regular EPT fault or by altogether avoiding a VM exit.
> 
> On the other hand, being able to disable x{2}APIC hardware assisted
> virtualization can be useful for testing and debugging purposes.
> 
> Note:
> 
> - vmx_install_vlapic_mapping doesn't require modifications regardless
> of whether the guest has "Virtualize APIC accesses" enabled or not,
> i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long as
> virtualize_apic_accesses is supported by the CPU.
> 
> - Both per-domain and global assisted_x{2}apic options are not part of
> the migration stream, unless explicitly set in the respective
> configuration files. Default settings of assisted_x{2}apic done
> internally by the toolstack, based on host capabilities at create
> time, are not migrated.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Reviewed-by: "Roger Pau Monné" <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com> # tools

-- 
Anthony PERARD

