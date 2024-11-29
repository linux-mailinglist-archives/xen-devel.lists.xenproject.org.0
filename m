Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518629DE64A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 13:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845989.1261287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGzz8-0002Xx-Ab; Fri, 29 Nov 2024 12:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845989.1261287; Fri, 29 Nov 2024 12:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGzz8-0002Vy-85; Fri, 29 Nov 2024 12:20:34 +0000
Received: by outflank-mailman (input) for mailman id 845989;
 Fri, 29 Nov 2024 12:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QuyF=SY=bounce.vates.tech=bounce-md_30504962.6749b186.v1-730560fe07774db3ac20cc971d9ba914@srs-se1.protection.inumbo.net>)
 id 1tGzz7-0002Vs-3X
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 12:20:33 +0000
Received: from mail136-20.atl41.mandrillapp.com
 (mail136-20.atl41.mandrillapp.com [198.2.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 501cb8ad-ae4c-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 13:20:29 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-20.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Y0C1f59TRzCf9NCw
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 12:20:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 730560fe07774db3ac20cc971d9ba914; Fri, 29 Nov 2024 12:20:22 +0000
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
X-Inumbo-ID: 501cb8ad-ae4c-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yMCIsImhlbG8iOiJtYWlsMTM2LTIwLmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjUwMWNiOGFkLWFlNGMtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODgyODI5LjczNDYsInNlbmRlciI6ImJvdW5jZS1tZF8zMDUwNDk2Mi42NzQ5YjE4Ni52MS03MzA1NjBmZTA3Nzc0ZGIzYWMyMGNjOTcxZDliYTkxNEBib3VuY2UudmF0ZXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732882822; x=1733143322;
	bh=rmfpfsbDFbwHYuQ7LN2IP6uZaYbO5umTu7qi+Rk74XI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NigjY8FDzJUdxKRhTdrdYF6lv/v5IfbZTxHtH60uwOjQ/tOaAOBNKNuUo33vgfKC3
	 2pXk4I6QYXIke7xDpWi8mTkEeGum1pcDjlDCngtVJFXo9eqLkm9Vv3P5aSzfNFzhOP
	 v4QrXp5EP+5AxYyIg3sQgwk+jPqv2cZuBPXwgkA3AhZALQ1VYwaKifodsLXaQbzePi
	 COBDloc1ZSW0jcqNpYWhyuOg2+pqVAN/rF4lJMY4TX0vcp7CXIFydD6+3yobreiX5Z
	 PtbxMrRi/2MrziW7IsYjVwxMFxd96Mfka4f9S1WmuhpopSP+wobytd5oQQc3a8t4t/
	 Yzn/3v66GpjDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732882822; x=1733143322; i=anthony.perard@vates.tech;
	bh=rmfpfsbDFbwHYuQ7LN2IP6uZaYbO5umTu7qi+Rk74XI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aqJO0sZ/gsuJ07pID9iqRHn5MB9TooSYbJmyFoQo4yMrVXwGOqQfawymycEMTaVSK
	 kH9q5JzndgyB8Ln3Jo0RAN8Wr3PfMfr+MgaAWeM0etv2bS4n1oPXfTA6SrQmwkWADX
	 P6i71s9hgHSlDdXycpE4wXEsHwLqTGBbONQmt6nE0hb+oZaIJ3mnyH2QxKmXHfnMgZ
	 zWxFxDx0Q88cVOOjwluILmTYucY2mR5I3b5SU82fC5FzLBI5Qzsl6xUVIpXt5elJBS
	 +HDHmL58yyU3Pv2xJihWr0Xd0oVRweGbYAb5XDJ+lS3otLIXvkWffEu+EiOSks7056
	 cJROM9BBvxo+A==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20libxl:=20extend=20IGD=20check?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732882821825
To: =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z0mxhWjXR9ex1y8v@l14>
References: <20241129010026.2869818-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20241129010026.2869818-1-marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.730560fe07774db3ac20cc971d9ba914?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241129:md
Date: Fri, 29 Nov 2024 12:20:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 02:00:10AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> Consider also "Display controller" an IGD, not only "VGA compatible
> controller". Specifically, IGD on Raptor Lake has 0x038000 class, not
> 0x030000.
> 
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


