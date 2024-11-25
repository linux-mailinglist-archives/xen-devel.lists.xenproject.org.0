Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC00D9D88AE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842697.1258366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFacH-0002c3-Gq; Mon, 25 Nov 2024 15:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842697.1258366; Mon, 25 Nov 2024 15:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFacH-0002Zs-Dj; Mon, 25 Nov 2024 15:03:09 +0000
Received: by outflank-mailman (input) for mailman id 842697;
 Mon, 25 Nov 2024 15:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MivI=SU=bounce.vates.tech=bounce-md_30504962.674491a5.v1-376656317dec4576900ce02877570898@srs-se1.protection.inumbo.net>)
 id 1tFacF-0002Zm-33
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:03:07 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dcbe779-ab3e-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 16:03:03 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xxpq92gPCzG0CQpF
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 15:03:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 376656317dec4576900ce02877570898; Mon, 25 Nov 2024 15:03:01 +0000
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
X-Inumbo-ID: 5dcbe779-ab3e-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjVkY2JlNzc5LWFiM2UtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ2OTgzLjQ2NDAzNCwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDQ5MWE1LnYxLTM3NjY1NjMxN2RlYzQ1NzY5MDBjZTAyODc3NTcwODk4QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732546981; x=1732807481;
	bh=fMlKSa8F3exCFtR5iKzZxxZqR3FfSoPfF9ErHR6aFmc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=O6LlnDPvuRbnjBGC7Y+HLpgCgL2I+ZioLZtEOMVRLxgAM7Qjb5T8gZbwZAH23fRbx
	 AfDeRFu9SWQdJ5IC4buDkXu2cPB4KeJSv24Yjm1ZiiOrRM/p4GemB74EUV2Ct0jPqO
	 fJiK2ej3TkEL+kw0rgeTdGCdcl6mC9rrtKbo79Eg1JqhcSyZXQ8BiIFzSwL32l8oCl
	 K/3cpD3+31YX1RCmJ6ukbzRfZ2NbebCuvEWHDSMJkDPrkI9zpHfu30s6X3tYqFakBj
	 a5uHhZRBQi85hnjwqBINpExbBbDMzcgibWphb59uNPSFeLbpmbEKugq00Z0pwWzLpZ
	 r7X7N1ejg31dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732546981; x=1732807481; i=teddy.astie@vates.tech;
	bh=fMlKSa8F3exCFtR5iKzZxxZqR3FfSoPfF9ErHR6aFmc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Yz7vk0F+skvy0ziL77Z9bJhe7qlFDT6a1K9CElq6ycLjTqIcPZ74EZuANgr3ctMkH
	 RDq1sSqTp4ArEuZB/QCNUqmP1ytB/hMab1Wy4ud56woIwkrWwnz3qViBxCXMJBn71/
	 V8gpqfzl2Eq93H3RuQ64ES5t3r+BPAeAIExKMysAYIFCDpwq5J2FNMaM5JmzTjAF1a
	 G375u9YNCdswx8wSUgafib9JRPdpWvbeU+ZbfHKLyMOY3nKDchhm8L10t0qZJctw1K
	 WFb8pV1R5NWEAAb0d9dzuQf6vWqXYChqO4YzVYNB+/Jt2VPOL5tOpLGypRc/fUPNKA
	 AJznC+w7bnZrw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=2007/25]=20tools/xenbindgen:=20Add=20support=20for=20structs=20in=20TOML=20specs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732546980388
Message-Id: <d98f8aa1-b0ba-4fb5-8c5d-ab18cc40fb01@vates.tech>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Yann Dirson" <yann.dirson@vates.tech>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com> <20241115115200.2824-8-alejandro.vallejo@cloud.com>
In-Reply-To: <20241115115200.2824-8-alejandro.vallejo@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.376656317dec4576900ce02877570898?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241125:md
Date: Mon, 25 Nov 2024 15:03:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

> +/// An IDL type. A type may be a primitive integer, a pointer to an IDL type,
> +/// an array of IDL types or a struct composed of IDL types. Every integer must
> +/// be aligned to its size.
> +///
> +/// FIXME: This enumerated type is recovered as-is from the `typ` field in the
> +/// TOML files. Ideally, that representation should be more ergonomic and the
> +/// parser instructed to deal with it.
> +#[allow(clippy::missing_docs_in_private_items)]
> +#[derive(Debug, serde::Deserialize, PartialEq)]
> +#[serde(rename_all = "lowercase", tag = "tag", content = "args")]
> +pub enum Typ {
> +    Struct(String),
> +    U8,
> +    U16,
> +    U32,
> +    U64,
> +    I8,
> +    I16,
> +    I32,
> +    I64,
> +    Ptr(Box<Typ>),
> +    Array(Box<Typ>, usize),
> +}
> +

I think we can name it Type (it doesn't clash with a keyword actually)

> +
> +/// Deserialized form of a field within a hypercall struct (see [`StructDef`])
> +#[derive(Debug, serde::Deserialize)]
> +pub struct FieldDef {
> +    /// Name of the field
> +    pub name: String,
> +    /// Description of what the field is for. This string is added as a comment
> +    /// on top of the autogenerated field.
> +    pub description: String,
> +    /// Type of the field.
> +    pub typ: Typ,
> +}
> +

regarding this "typ" name, we can either use the "raw identifier" syntax 
with r#type to have it "technically" named 'type' or use
#[serde(rename = "type")]
to have it named "type" during deserialization even if the field is 
still "typ"

Cheers
Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

