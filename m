Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A59D8AEF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 18:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843008.1258668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcW7-0003gI-OF; Mon, 25 Nov 2024 17:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843008.1258668; Mon, 25 Nov 2024 17:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcW7-0003eI-L9; Mon, 25 Nov 2024 17:04:55 +0000
Received: by outflank-mailman (input) for mailman id 843008;
 Mon, 25 Nov 2024 17:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vfyn=SU=bounce.vates.tech=bounce-md_30504962.6744ae31.v1-05f36f47a52545869d6a78627153ea17@srs-se1.protection.inumbo.net>)
 id 1tFcW6-0003eC-64
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 17:04:54 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61670c00-ab4f-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 18:04:50 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4XxsWj15gjzG0CHK6
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 17:04:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 05f36f47a52545869d6a78627153ea17; Mon, 25 Nov 2024 17:04:49 +0000
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
X-Inumbo-ID: 61670c00-ab4f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjYxNjcwYzAwLWFiNGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTU0MjkwLjUyNDc1OCwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDRhZTMxLnYxLTA1ZjM2ZjQ3YTUyNTQ1ODY5ZDZhNzg2MjcxNTNlYTE3QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732554289; x=1732814789;
	bh=ztA/BXOeYTCThuZggH/Y8Uq70iOgJntRaZUW0x7CJQE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eXEK4/I74YkXuAKA0GsfwTKlpPhFCVgmDnOpkqoGIPmrsxrg3ON1XBOtFxaRzsCEL
	 OX8CYA2jfA+r/1zl8swcA9A8EaGlb7DFSg5AHgFGJhzQH4sn56lbYHPChIq3qjrzrE
	 Kgz+9IiYYRibTZmAN+shCcHO3UnFKyaEnY0ucGJUa5rfq6gkxgAyGnxKZlMx/IYAuE
	 qi3nOGMz6iHh4PooCmMgtGQ1p80ts+p/7eVmhp9zpfnZvh2nMgdGSwt+TXOUkoZiRm
	 ylT+DHHWJp++xRgpxdNhw8ts1Qs53O9DW0fSq7hVhEsWRB+MP0SGin04TR6FGnfnew
	 IcAUS9GZIfiOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732554289; x=1732814789; i=anthony.perard@vates.tech;
	bh=ztA/BXOeYTCThuZggH/Y8Uq70iOgJntRaZUW0x7CJQE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=k6mvl/dyahNd9lYt2z/xU5i5op8odQtijsAWirb/DnwX5nP1q6rbMUdgHLt5eKu9R
	 ajoopDrhu60mc8BxMG1X3uZnfGg0C9bYJkGq0oSjCcksK+rk6GeDb63SUJHK+f7uvu
	 SFbn2l/0oQAeNUUGk2cFPk20gJZLLAfY8xMtmhX/81r30avQwum4i6es3C74Ga5rBD
	 KJRymkw0cHR0fY6cn6w89uEFIg8Dq8wnNukAWBoOSzdMahhkA+/91CEnZxgcgmSnf5
	 9p/DGw3ZbYL9MckSIcAOcGRzFXM0q9wwQivYpxUiFiTVbOn6qjOl/QPu9GzORgg2nM
	 p1jJWmCG+uNUQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/2]=20libxl/ACPI:=20bound=20RSDP=20allocation?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732554288611
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z0SuMDXVzrf4OHpQ@l14>
References: <7455ff48-4bbc-465c-baff-d5c0ff684dfd@suse.com> <e995156e-c84a-426f-8d20-bebc8ccb3961@suse.com>
In-Reply-To: <e995156e-c84a-426f-8d20-bebc8ccb3961@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.05f36f47a52545869d6a78627153ea17?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241125:md
Date: Mon, 25 Nov 2024 17:04:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 04:15:49PM +0100, Jan Beulich wrote:
> First instroduce a manifest constant, to avoid open-coding 64 in several
> places. Then use this constant to bound the allocation.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Hopefully, `struct acpi_20_rsdp` isn't going to be bigger that 64, but
it would probably not work well anyway seen how `config.rsdp` is used
here.

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

> ---
> Similarly bounding the info "page" allocation would be nice, but would
> require knowing libacpi's struct acpi_info size here.

Or register the allocation size in `config`, so acpi_build_tables() can
check if there's enough space. Something like `config.info_size`.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

