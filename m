Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B82E9D1336
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 15:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839390.1255192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD2sI-0003KM-Kg; Mon, 18 Nov 2024 14:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839390.1255192; Mon, 18 Nov 2024 14:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD2sI-0003Ii-Hv; Mon, 18 Nov 2024 14:37:10 +0000
Received: by outflank-mailman (input) for mailman id 839390;
 Mon, 18 Nov 2024 14:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDp/=SN=bounce.vates.tech=bounce-md_30504962.673b5110.v1-298c3482636a455ca76c8f77db73fb96@srs-se1.protection.inumbo.net>)
 id 1tD2sH-0003Ic-8H
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 14:37:09 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 948e41cb-a5ba-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 15:37:05 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4XsVZS0mwxz3sPCf0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 14:37:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 298c3482636a455ca76c8f77db73fb96; Mon, 18 Nov 2024 14:37:04 +0000
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
X-Inumbo-ID: 948e41cb-a5ba-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6Ijk0OGU0MWNiLWE1YmEtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTQwNjI1LjY1NzkyNSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2I1MTEwLnYxLTI5OGMzNDgyNjM2YTQ1NWNhNzZjOGY3N2RiNzNmYjk2QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731940624; x=1732201124;
	bh=GvsWmYKY14CXser9tx1rb3cHyozOIQwfv4RdVhYRfz8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IPu1ITjePQxbgbLLLnGvU4CRtZlGzt5o02iM5MQDMzF5Ue/06Zy3FFYhotCNoqQYs
	 LWt9DSG2IWVStl8ynA7Jyh45G15Skn5RtNfpx9pgOVL7rffEtpuEvhrqQkwR4PgS3j
	 8dEif+AMgiqFTdkBe0wjOTlbNJWapTduYRZFUlsteWeRHIXc9yMEYKHqW4ePxcFcOE
	 wK3iQlHMTPpA+8WtuzrTVH64ENk0VqyI803Ucw9CY02tMtOOEsKDgB/Qr3K3OIC3jh
	 WInI6kEAZkDnsxPiNp2ZW5BD4tbOULR/fnfRJplRoZEU1dpaHnOBP1ftVCkVp/kbC2
	 bM7OQX+QSjtUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731940624; x=1732201124; i=ngoc-tu.dinh@vates.tech;
	bh=GvsWmYKY14CXser9tx1rb3cHyozOIQwfv4RdVhYRfz8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kd65Au9o14glv82UOkM7t5tsfTEq7fkW10MgmYG2SiqdR5r/hPPXhggBcpxWy4IWk
	 wLOUmLd052TTUfaYdv5ozrXH8QHyDGjjO9UwqNIFyQC6A0Jond3Tu5UwibLq3Yk6n6
	 iH9fjMKG6fuPhYBo/r36M31+/U8eB1OigEfG1ARcE1bcv/JhscMKQdoDIH0IgJynPy
	 cTj/mu8CaiJWs15iPRsKiQhzYV9uAnf/lWgYAFT1WIIbu4/5zN9bULWYiMM4YduKMa
	 pMiKUZWpqoJJPdEr0/PrVATlPsQb2xRIWPUo/UAF/wCfeSypB5bq5dhAJ03kDuL9E3
	 j4/6YFpntIw7A==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=200/4]=20Virtualize=20architectural=20LBRs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731940623283
Message-Id: <f4f5b29b-c77f-4b55-81ee-0fa63e2f5459@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech> <7706bd63-8f26-4eb8-8dc0-67b302597e3b@suse.com> <3f75df1d-f397-487f-9b81-d7740712b924@vates.tech> <78d9df73-c9b7-479d-8e05-e4efb823ea20@citrix.com>
In-Reply-To: <78d9df73-c9b7-479d-8e05-e4efb823ea20@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.298c3482636a455ca76c8f77db73fb96?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 14:37:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18/11/2024 10:52, Andrew Cooper wrote:
> There's also a reason why we haven't got this working yet.=C2=A0 There ar=
e a
> couple of areas of prerequisite work which need addressing before XSS
> can be enabled properly.
> 
> If you're willing to tackle this, then I can explain what needs doing,
> and in roughly which order.

I would appreciate explanations of the pending XSS issues.


Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


