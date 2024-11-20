Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE89D4086
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 17:50:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841160.1256670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDnt2-0001eg-GI; Wed, 20 Nov 2024 16:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841160.1256670; Wed, 20 Nov 2024 16:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDnt2-0001cC-De; Wed, 20 Nov 2024 16:49:04 +0000
Received: by outflank-mailman (input) for mailman id 841160;
 Wed, 20 Nov 2024 16:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSsS=SP=bounce.vates.tech=bounce-md_30504962.673e12fa.v1-52ba16cc775d4f4c914961779348c020@srs-se1.protection.inumbo.net>)
 id 1tDnt1-0001c6-Bo
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 16:49:03 +0000
Received: from mail136-26.atl41.mandrillapp.com
 (mail136-26.atl41.mandrillapp.com [198.2.136.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56c12424-a75f-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 17:48:59 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-26.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XtnPk1h9kzJKF3Nk
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 16:48:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 52ba16cc775d4f4c914961779348c020; Wed, 20 Nov 2024 16:48:58 +0000
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
X-Inumbo-ID: 56c12424-a75f-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yNiIsImhlbG8iOiJtYWlsMTM2LTI2LmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU2YzEyNDI0LWE3NWYtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTIxMzM5Ljk4ODAxLCJzZW5kZXIiOiJib3VuY2UtbWRfMzA1MDQ5NjIuNjczZTEyZmEudjEtNTJiYTE2Y2M3NzVkNGY0YzkxNDk2MTc3OTM0OGMwMjBAYm91bmNlLnZhdGVzLnRlY2giLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732121338; x=1732381838;
	bh=n383fJwjjwDmkzpGwEHPWPXyzKzhg8Lb4s4ITp10An0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uHIHWR4hgjNM+GsmQIgOvK2XHlZfHYhYr32sF5k8vfGWK1X1hCQytu1PXGGiL7r2G
	 DuAzHXNLSO/hqndH7/rjWXzss09fXpPGXwJyYBpPT9o8o0lHH/M60KPr5zTKlaAG2L
	 FUCyDWpj4fhcnJhghNxR0L1+sZ1Vnh33QzivJYQCOnBp9TOA5U1QuiKTXVzd1qiLON
	 21hIYYxjyQWeRQTBcH4HTA2y1hq+YZsVsxOyIb2u5HFChXgnhOe0KGDcwSi+HsoWv+
	 fn7atmdQUvKniR5AvPdkwAkNbYaAWq1F6SwpfHpGzeOUwYvISRgDJ35wBfHFPEnfO1
	 x29eCyZHuthhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732121338; x=1732381838; i=anthony.perard@vates.tech;
	bh=n383fJwjjwDmkzpGwEHPWPXyzKzhg8Lb4s4ITp10An0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lvufldy8jR2U1kEna6rPPztzdeLqjEepXZZc6jCm2/NnJYzTIbiBxAioxNdQF3KNI
	 +VKpwBP3bsz5XICckYp7n2hIKhEgVPgiiGaQPgXWYZUbrWKeyZGj3t7qqw439ucttf
	 KPGtSkKiRdLiHiuyJDSo3mwrTHvMmqBgzFICmBKZv0YLug2Xg//9HyRqM5Sp2x0bgo
	 qjTtkSll3PBBo5iG65EQmR8dBlU69iVS5WAjcEtsTErOGIdwH3F3h1HR824A5bXqQM
	 R52BDtANcUdkEgRVwNi/nupsvSCloYCyK+pm1jqJI7VrKhsuiJ6shMWm6cImozEYMF
	 zg6fz3yp+iMHg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v10=2006/12]=20tools:=20add=20support=20for=20cache=20coloring=20configuration?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732121337618
To: "Carlo Nonato" <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, "Juergen Gross" <jgross@suse.com>
Message-Id: <Zz4S-AQO66YVK6i2@l14>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech> <20241119141329.44221-7-carlo.nonato@minervasys.tech>
In-Reply-To: <20241119141329.44221-7-carlo.nonato@minervasys.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.52ba16cc775d4f4c914961779348c020?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241120:md
Date: Wed, 20 Nov 2024 16:48:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Nov 19, 2024 at 03:13:23PM +0100, Carlo Nonato wrote:
>  tools/libs/light/libxl_types.idl |  1 +

An other thing I've completely forgot, with this IDL changed there will
be a need to regen some other files in the repo, namely:
    tools/golang/xenlight/helpers.gen.go
    tools/golang/xenlight/types.gen.go

Running this following command should be enough, even if you don't have
golang installed.

    make -C tools/golang/xenlight helpers.gen.go types.gen.go

If you send an update of the patch series, it would be nice to include
the regenerated files.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

