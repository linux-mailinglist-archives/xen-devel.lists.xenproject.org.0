Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0E9D88E7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842781.1258457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFamb-0008Jt-E0; Mon, 25 Nov 2024 15:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842781.1258457; Mon, 25 Nov 2024 15:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFamb-0008IQ-BE; Mon, 25 Nov 2024 15:13:49 +0000
Received: by outflank-mailman (input) for mailman id 842781;
 Mon, 25 Nov 2024 15:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6fv=SU=bounce.vates.tech=bounce-md_30504962.67449426.v1-93126cd645704ad5bb1b1a23db6f04ca@srs-se1.protection.inumbo.net>)
 id 1tFamZ-0008IK-VO
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:13:48 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbafef5c-ab3f-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 16:13:43 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xxq3V2HmFzG0CBW5
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 15:13:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 93126cd645704ad5bb1b1a23db6f04ca; Mon, 25 Nov 2024 15:13:42 +0000
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
X-Inumbo-ID: dbafef5c-ab3f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRiYWZlZjVjLWFiM2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTQ3NjIzLjk2NzM2NSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDQ5NDI2LnYxLTkzMTI2Y2Q2NDU3MDRhZDViYjFiMWEyM2RiNmYwNGNhQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732547622; x=1732808122;
	bh=UdPbVs7tbxw8m3eHi70yWcYvKPvOycgYxhz4owZZVHE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=s9nHozNQnCeoYPkd3sW6406E6DVSYTjJab5/S5uDQBQJ0VAZXnam0qmHdz9Cf4bcs
	 P6Bivbz9hgP6XCESCkT2g8K5EGYwMAjNLAhtVjGs+hhDkvMEVszCpKG6+Hm2yX38Fk
	 RerzR1hUYIoy9i1GHD1lj4ZyL/yz57cV6HxNEUw0maFGeVge67sx94t7s3rlK/twrO
	 6OaUrejYcbr1Xlr7KxMmXsD5VnXI0v6/CPgxSzosBVSNkbDJun8M/V2RNhhh69DR34
	 qqIo8RPCmepo6V5jp2baQQ2NoGrXiRLC/2nvwpTNso8q3LMBogzBcDD/iNwTMmlOdR
	 MY5htkAHx2npg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732547622; x=1732808122; i=teddy.astie@vates.tech;
	bh=UdPbVs7tbxw8m3eHi70yWcYvKPvOycgYxhz4owZZVHE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tqS1+CIbJO1umTzcMDJ0/gTyEU7C1BznDDacGLJhmrXBTOLjutIgX4GBwf5ZrdtBo
	 MuarQrPqJUJst+3W9F0Rcs1pmQkAUT7zXvU4HBmsdyLuinuc/GE/Jau5juMfvBfYp2
	 EC7XS2/5iXq9WKqy1NKm/GfSAegX3+ozPSCVrziWK2iGcyrzY/yF2xkxmoTEZfrhKZ
	 ZO7scAla3Z3NKifolyA2i9NySyW6bkBcoveIE99OkWv21NX6sfm3bgh151DjU7mPuc
	 qzU+8KgWpGk2N/g0++3JGNS3bEbdH70j2OEh6r+R/sMQIJ6uKzbeT4KmRFmYfDgEvU
	 ZdVYNdD8nwoXg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=2004/25]=20tools/xenbindgen:=20Add=20a=20TOML=20spec=20reader?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732547621616
Message-Id: <aa5ed051-3696-42f1-9eec-d7cbd21d9882@vates.tech>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Yann Dirson" <yann.dirson@vates.tech>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com> <20241115115200.2824-5-alejandro.vallejo@cloud.com>
In-Reply-To: <20241115115200.2824-5-alejandro.vallejo@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.93126cd645704ad5bb1b1a23db6f04ca?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241125:md
Date: Mon, 25 Nov 2024 15:13:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

> +    let _specification = match spec::Spec::new(&cli.indir) {
> +        Ok(x) => x,
> +        Err(spec::Error::Toml(x)) => {
> +            error!("TOML parsing error:");
> +            error!("{x:#?}");
> +            std::process::exit(1);
> +        }
> +        Err(spec::Error::Io(x)) => {
> +            error!("IO error:");
> +            error!("{x:#?}");
> +            std::process::exit(1);
> +        }
> +    };

I think it can be replaced with .unwrap() (or making the main function 
returns a Result<T, E>) as long as our internal error implements Display.

> +/// Internal error type for every error spec parsing could encounter
> +#[derive(Debug)]
> +pub enum Error {
> +    /// Wrapper around IO errors
> +    Io(std::io::Error),
> +    /// Wrapper around deserialization errors
> +    Toml(toml::de::Error),
> +}
> +
> +/// Maps an [`std::io::Error`] onto a [`Error`] type for easier propagation
> +fn from_ioerr<T>(t: std::io::Result<T>) -> Result<T, Error> {
> +    t.map_err(Error::Io)
> +}
> +

May be worth a
impl From<std::io::Error> for super::Error
such as ? operator can automatically convert it to our internal error type

Cheers
Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

