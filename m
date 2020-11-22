Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35172BC896
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 20:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33459.64498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kguww-00011P-MY; Sun, 22 Nov 2020 19:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33459.64498; Sun, 22 Nov 2020 19:23:02 +0000
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
	id 1kguww-000113-JC; Sun, 22 Nov 2020 19:23:02 +0000
Received: by outflank-mailman (input) for mailman id 33459;
 Sun, 22 Nov 2020 19:23:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D2VG=E4=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1kguwv-00010y-9o
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 19:23:01 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.148])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4276b92a-1366-4c74-959d-5e426de671e6;
 Sun, 22 Nov 2020 19:23:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 8A2DD18221869;
 Sun, 22 Nov 2020 19:22:59 +0000 (UTC)
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Sun, 22 Nov 2020 19:22:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=D2VG=E4=perches.com=joe@srs-us1.protection.inumbo.net>)
	id 1kguwv-00010y-9o
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 19:23:01 +0000
X-Inumbo-ID: 4276b92a-1366-4c74-959d-5e426de671e6
Received: from smtprelay.hostedemail.com (unknown [216.40.44.148])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4276b92a-1366-4c74-959d-5e426de671e6;
	Sun, 22 Nov 2020 19:23:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay06.hostedemail.com (Postfix) with ESMTP id 8A2DD18221869;
	Sun, 22 Nov 2020 19:22:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3871:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6742:6743:7903:8985:9025:9108:10004:10400:10848:11232:11658:11914:12043:12297:12555:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21450:21499:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: curve68_4013d692735f
X-Filterd-Recvd-Size: 4350
Received: from XPS-9350.home (unknown [47.151.128.180])
	(Authenticated sender: joe@perches.com)
	by omf17.hostedemail.com (Postfix) with ESMTPA;
	Sun, 22 Nov 2020 19:22:48 +0000 (UTC)
Message-ID: <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From: Joe Perches <joe@perches.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Kees Cook
	 <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 amd-gfx@lists.freedesktop.org, bridge@lists.linux-foundation.org, 
 ceph-devel@vger.kernel.org, cluster-devel@redhat.com,
 coreteam@netfilter.org,  devel@driverdev.osuosl.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com,  dri-devel@lists.freedesktop.org,
 GR-everest-linux-l2@marvell.com,  GR-Linux-NIC-Dev@marvell.com,
 intel-gfx@lists.freedesktop.org,  intel-wired-lan@lists.osuosl.org,
 keyrings@vger.kernel.org,  linux1394-devel@lists.sourceforge.net,
 linux-acpi@vger.kernel.org,  linux-afs@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net,  linux-block@vger.kernel.org,
 linux-can@vger.kernel.org,  linux-cifs@vger.kernel.org,
 linux-crypto@vger.kernel.org,  linux-decnet-user@lists.sourceforge.net,
 linux-ext4@vger.kernel.org,  linux-fbdev@vger.kernel.org,
 linux-geode@lists.infradead.org,  linux-gpio@vger.kernel.org,
 linux-hams@vger.kernel.org,  linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org,  linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org,  linux-mmc@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-sctp@vger.kernel.org, linux-security-module@vger.kernel.org, 
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
 Miguel Ojeda <ojeda@kernel.org>
Date: Sun, 22 Nov 2020 11:22:47 -0800
In-Reply-To: <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	 <202011201129.B13FDB3C@keescook>
	 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	 <202011220816.8B6591A@keescook>
	 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
	 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2020-11-22 at 11:12 -0800, James Bottomley wrote:
> On Sun, 2020-11-22 at 10:25 -0800, Joe Perches wrote:
> > On Sun, 2020-11-22 at 10:21 -0800, James Bottomley wrote:
> > > Please tell me our reward for all this effort isn't a single
> > > missing error print.
> > 
> > There were quite literally dozens of logical defects found
> > by the fallthrough additions.  Very few were logging only.
> 
> So can you give us the best examples (or indeed all of them if someone
> is keeping score)?  hopefully this isn't a US election situation ...

Gustavo?  Are you running for congress now?

https://lwn.net/Articles/794944/



