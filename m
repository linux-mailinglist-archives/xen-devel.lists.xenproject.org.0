Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC259BCAAF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 11:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830166.1245082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Gzf-0008Ed-5x; Tue, 05 Nov 2024 10:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830166.1245082; Tue, 05 Nov 2024 10:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Gzf-0008CI-2Y; Tue, 05 Nov 2024 10:41:03 +0000
Received: by outflank-mailman (input) for mailman id 830166;
 Tue, 05 Nov 2024 10:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPTM=SA=bounce.vates.tech=bounce-md_30504962.6729f632.v1-308a478c9a7c4ac4b6883b7b32c33973@srs-se1.protection.inumbo.net>)
 id 1t8Gzd-0008CC-3h
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 10:41:01 +0000
Received: from mail133-1.atl131.mandrillapp.com
 (mail133-1.atl131.mandrillapp.com [198.2.133.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d886a49-9b62-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 11:40:52 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-1.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4XjPxt61JtzBsVJrw
 for <xen-devel@lists.xenproject.org>; Tue,  5 Nov 2024 10:40:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 308a478c9a7c4ac4b6883b7b32c33973; Tue, 05 Nov 2024 10:40:50 +0000
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
X-Inumbo-ID: 6d886a49-9b62-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzMy4xIiwiaGVsbyI6Im1haWwxMzMtMS5hdGwxMzEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZkODg2YTQ5LTliNjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODAzMjUyLjc3MjY1OCwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MjlmNjMyLnYxLTMwOGE0NzhjOWE3YzRhYzRiNjg4M2I3YjMyYzMzOTczQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730803250; x=1731063750;
	bh=icZhyJOk5ogtSZem3K1zdmOebqBx3hH/dP3pIqE+WLA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=t/C7M5nkm5C+PoRTQAzyt2eSBhbhbBg0Sl4sMx4UHpdFk8JyqZJZ1Hqzbq3ktI0iB
	 YSCl9+aPWjPbgBzF4AJF1ktQslLy/Ffii3HpaXXkraTrvPTip3/ATq0Yo91A5bY+Hs
	 ZJm/nbQeYhHUuLZj363hENrgJKabQGK5zOJIefoFckqB/Wns6LGGBWQXOENEaXdwBQ
	 oDx995hBODEuw5yjPj0ThNslh1kTzFWNJtLJ25dQBCd0LYT6s04HdGVNvvXWZ9rcNh
	 9XAumqkIBvaU6m5aZz5uTNBTYlxDiX4hl97gK5NBZCY+13swgQ1T+QEW/ch7wYZ6qt
	 tOeSDBKo+OwTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730803250; x=1731063750; i=teddy.astie@vates.tech;
	bh=icZhyJOk5ogtSZem3K1zdmOebqBx3hH/dP3pIqE+WLA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WflOhLLAc3fAYfvOuPZJBn0eVvBqWBVTX+Ls4jexOLRXEOUurLCWT1cxpytjbBtra
	 8TNOXcvu6up8dd1yjKawPI93Lq6QDRTpgmN2IAjavPiPh6sl4Q9T8kO8zKCNSPmKmn
	 LwfQJj5X9nvno9Nz5YxHD5NAvFExtHcq88KJEyMlKrd3EKNdVoZFxCJVex4l4J19Zq
	 EGTHT9T6X/fODWkgag34xDh84MqTNk1BvWn2Q35dmUiiUE2H9tmNsXPPSkg1ZPORgI
	 RYiYDanuzp0yq79ezm36bcciWeH4ubSwpEyS3zmgGIsvXaykXEMwvR9KWQrE0ykevp
	 Ut+xmNUT7+60g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20RFC=20PATCH=20v4=200/5]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730803249020
Message-Id: <554f2ff3-e0b4-49a2-86c8-1c7457f99ac1@vates.tech>
To: =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, =?utf-8?Q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
References: <cover.1730718102.git.teddy.astie@vates.tech> <ZylwdZjIeQ9qRdc_@mail-itl>
In-Reply-To: <ZylwdZjIeQ9qRdc_@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.308a478c9a7c4ac4b6883b7b32c33973?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241105:md
Date: Tue, 05 Nov 2024 10:40:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 05/11/2024 =C3=A0 02:10, Marek Marczykowski-G=C3=B3recki a =C3=A9crit=C2=
=A0:
> On Mon, Nov 04, 2024 at 02:28:38PM +0000, Teddy Astie wrote:
>> * introduce "dom0-iommu=3Dno-dma" to make default context block all DMA
>>    (disables HAP and sync-pt), enforcing usage of PV-IOMMU for DMA
>>    Can be used to expose properly "Pre-boot DMA protection"
> 
> This sounds like it disables HAP completely, but actually it looks like
> disabling sharing HAP page tables with IOMMU ones, right? That (HAP
> sharing) is relevant for PVH dom0 only, correct?
> 

Yes that's it

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


