Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC92BB2AA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 19:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32550.63606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgB9b-0005bo-BT; Fri, 20 Nov 2020 18:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32550.63606; Fri, 20 Nov 2020 18:29:03 +0000
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
	id 1kgB9b-0005bP-82; Fri, 20 Nov 2020 18:29:03 +0000
Received: by outflank-mailman (input) for mailman id 32550;
 Fri, 20 Nov 2020 18:29:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ma5r=E2=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1kgB9Z-0005bK-PB
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 18:29:01 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.204])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9e69301-f83a-4884-8f65-f462eae4b1a1;
 Fri, 20 Nov 2020 18:29:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 2DC80180A7FF1;
 Fri, 20 Nov 2020 18:29:00 +0000 (UTC)
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Fri, 20 Nov 2020 18:28:49 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ma5r=E2=perches.com=joe@srs-us1.protection.inumbo.net>)
	id 1kgB9Z-0005bK-PB
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 18:29:01 +0000
X-Inumbo-ID: e9e69301-f83a-4884-8f65-f462eae4b1a1
Received: from smtprelay.hostedemail.com (unknown [216.40.44.204])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e9e69301-f83a-4884-8f65-f462eae4b1a1;
	Fri, 20 Nov 2020 18:29:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay04.hostedemail.com (Postfix) with ESMTP id 2DC80180A7FF1;
	Fri, 20 Nov 2020 18:29:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2731:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3874:4321:4362:5007:6742:6743:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14180:14659:14721:21060:21067:21080:21627:21990:30012:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: woman67_620d0012734d
X-Filterd-Recvd-Size: 3843
Received: from XPS-9350.home (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf05.hostedemail.com (Postfix) with ESMTPA;
	Fri, 20 Nov 2020 18:28:49 +0000 (UTC)
Message-ID: <3e0bbb1644fe53d79322c2feb28ccaf3e20c0e94.camel@perches.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kernel@vger.kernel.org
Cc: alsa-devel@alsa-project.org, amd-gfx@lists.freedesktop.org, 
 bridge@lists.linux-foundation.org, ceph-devel@vger.kernel.org, 
 cluster-devel@redhat.com, coreteam@netfilter.org,
 devel@driverdev.osuosl.org,  dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, dri-devel@lists.freedesktop.org, 
 GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com, 
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org, 
 keyrings@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
 linux-acpi@vger.kernel.org, linux-afs@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, linux-block@vger.kernel.org, 
 linux-can@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-decnet-user@lists.sourceforge.net, 
 linux-ext4@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-geode@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-hams@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i3c@lists.infradead.org, linux-ide@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
  linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, op-tee@lists.trustedfirmware.org, 
 oss-drivers@netronome.com, patches@opensource.cirrus.com, 
 rds-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, 
 samba-technical@lists.samba.org, selinux@vger.kernel.org, 
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
 usb-storage@lists.one-eyed-alien.net, 
 virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
 x86@kernel.org, xen-devel@lists.xenproject.org,
 linux-hardening@vger.kernel.org,  Nick Desaulniers
 <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>
Date: Fri, 20 Nov 2020 10:28:48 -0800
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-20 at 12:21 -0600, Gustavo A. R. Silva wrote:
> Hi all,
> 
> This series aims to fix almost all remaining fall-through warnings in
> order to enable -Wimplicit-fallthrough for Clang.
> 
> In preparation to enable -Wimplicit-fallthrough for Clang, explicitly
> add multiple break/goto/return/fallthrough statements instead of just
> letting the code fall through to the next case.
> 
> Notice that in order to enable -Wimplicit-fallthrough for Clang, this
> change[1] is meant to be reverted at some point. So, this patch helps
> to move in that direction.

This was a bit hard to parse for a second or three.

Thanks Gustavo.

How was this change done?



