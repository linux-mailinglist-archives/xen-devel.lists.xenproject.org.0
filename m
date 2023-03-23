Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA706C64AF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 11:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513735.795189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfI2Q-0002fG-Da; Thu, 23 Mar 2023 10:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513735.795189; Thu, 23 Mar 2023 10:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfI2Q-0002dS-AL; Thu, 23 Mar 2023 10:19:18 +0000
Received: by outflank-mailman (input) for mailman id 513735;
 Thu, 23 Mar 2023 10:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YvyI=7P=ilande.co.uk=mark.cave-ayland@srs-se1.protection.inumbo.net>)
 id 1pfI2O-0002dK-Ki
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 10:19:16 +0000
Received: from mail.ilande.co.uk (mail.ilande.co.uk [2001:41c9:1:41f::167])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272a0367-c964-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 11:19:11 +0100 (CET)
Received: from host86-163-239-161.range86-163.btcentralplus.com
 ([86.163.239.161] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pfI1N-0004eR-4l; Thu, 23 Mar 2023 10:18:17 +0000
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
X-Inumbo-ID: 272a0367-c964-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YYftXqcDBK/UTYD5UpwnfWzrAN8OUVEoUQ+WA+Q6dyw=; b=H5rDiEH21cqjEqZ+EDejQOQPaW
	2ztyA6rudlaiNu/5a/Se9yXcbXFAqsamo/mCw1EUxJCFA1mcDhMrp5fHBMyZ+jWLeQgjNW0egfR+d
	yTSbZ3IMs+r1mT9dvCEXkaDN9WpPTxYC0VzFKydPJMarNP39BYt7jODxm8UASn6sftk1RTDy/XbBR
	b4C9F4G5NHtrKaHlfT5eLBVYWjFRkrx5bwZxFn7Jd/wPOqkavBtK3hkMVBRlwAI0b8WKeIGrAp+2U
	RT2jbp4I7NgMhWV1Jk7dsFEpaIk1KMYszGMdCu2vd/23+0X0j3wcjfyGZtnK27XwbVEi55U1neK3K
	1AVKcGdq1PVNRXVpXwzj5ONuHWsu65DKFWDZuNjhQE7MCNADqWCjvqUed5mbzyqcMQPx57tuKGJWB
	/dth3xj92CEW6tvmzvuddOdb8F08iQh7wFYrbO1jZpkbm4wuVrddCLRoDq5zJ0+a7iwOhlFbJSd89
	0Op6MCHRGMFVJLXfpCnyH2sFMIykdfei/9b9WkY3s186ZBhTBoOLsQOPxRLBNeJYLYY1KT3INj7eW
	KgWTYfDVJ7U+P34cmo4rwoGDkDaYyhWftElNZiHhHwIzdG2CywBGRAMMjW7dlHha100whu4FiYsbn
	b3P55T+OgZ95LSF+w7Yoy7KBNePCUSZj5YEo9ZPo4=;
Message-ID: <7971a4c0-70b0-5dcd-4b0b-3fa41766ac41@ilande.co.uk>
Date: Thu, 23 Mar 2023 10:18:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678888385.git.brchuckz.ref@aol.com>
 <cover.1678888385.git.brchuckz@aol.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <cover.1678888385.git.brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.163.239.161
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v4 0/2] pci: slot_reserved_mask improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 15/03/2023 14:26, Chuck Zmudzinski wrote:

> This patch series consists of two patches. The first provides accessor
> functions in pci.h to avoid direct access of slot_reserved_mask
> according to the comment at the top of include/hw/pci/pci_bus.h. No
> functional change is intended with this patch.
> 
> The second patch replaces slot_reserved_mask with two new masks,
> slot_reserved_auto_mask and slot_reserved_manual_mask so the current
> behavior of reserving slot 2 for the Intel IGD for the xenfv machine
> will be ignored if an administrator manually configures a device to use
> the reserved slot.
> 
> The current behavior of always reserving slots in the sun4u machine is
> preserved by this patch series; the patch series only changes how
> slot_reserved_mask works in the xenfv machine. Although the patch
> series can affect xenfv machines configured for igd-passthru if an
> administrator assigns some of the pci slot addresses manually, it
> does not affect the libxl default configuration for igd-passthru because
> libxl uses automatic slot assignment by default.
> 
> Testing:
>     - Tested xenfv/igd with both manual and auto slot allocation - behaves as expected
>     - Verified that qemu-system-sparc64 still compiles with the patches to sun4u.c
>     - xen4u machine not tested -- Mark, can you do this?
> 
> Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> 
> Chuck Zmudzinski (2):
>    pci: avoid accessing slot_reserved_mask directly outside of pci.c
>    pci: introduce slot_reserved_auto_mask and slot_reserved_manual_mask
> 
> Changelog
> 
> v4: I forgot to check the patches in v3 for style corrections (sorry about
>      that), and the second patch had three lines that were too long. Other
>      than correcting the style problems, no changes since v3.
> 
> v3: Re-work second patch in response to comments/discussion of v2
> 
> v2: Add first patch and cover letter to make this a 2-patch series
>      Make changes to the second patch (see second patch for changelog)
> 
>   hw/pci/pci.c             | 33 ++++++++++++++++++++++++++++-----
>   hw/sparc64/sun4u.c       |  7 +++----
>   hw/xen/xen_pt.c          |  8 ++++----
>   include/hw/pci/pci.h     |  3 +++
>   include/hw/pci/pci_bus.h |  3 ++-
>   5 files changed, 40 insertions(+), 14 deletions(-)

The v4 series looks good to me: I've also confirmed that sun4u still works as before, 
so from my perspective:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [sun4u]

Michael, is this a candidate for 8.0 given that the existing patches for Xen making 
use of slot_reserved_mask have already been merged?


ATB,

Mark.

