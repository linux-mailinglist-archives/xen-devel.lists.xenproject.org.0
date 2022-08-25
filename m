Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD125A0EC2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 13:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393287.632144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAl8-0006vX-SA; Thu, 25 Aug 2022 11:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393287.632144; Thu, 25 Aug 2022 11:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAl8-0006sW-Ox; Thu, 25 Aug 2022 11:10:50 +0000
Received: by outflank-mailman (input) for mailman id 393287;
 Thu, 25 Aug 2022 11:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Q4t=Y5=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oRAl6-0006sQ-Tf
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 11:10:49 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91cef14b-2466-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 13:10:47 +0200 (CEST)
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
X-Inumbo-ID: 91cef14b-2466-11ed-9250-1f966e50362f
Date: Thu, 25 Aug 2022 11:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1661425846; x=1661685046;
	bh=p4OJpb4cYPRa7OxofFBxkn2ZTIMcoEBsoOMYbzpZfjo=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=sB9WuKaSsNadLaM65WWoxAbuJAA/9AbL7bH8o4c6UG2T3Brp2Iz06Io++VYeptEg8
	 bBFWhXjZZ7JzewzwE2Mf+UN/aOiAcKeNFMTBo0DdoPECoaU68DbsQ22Cz4qBrsMFVq
	 yTBjqZpnW2uBT/mKSglQUtV/ef8X5sFKJ/Zwb2PVwMcfUhXzleG7uptAN4vYRKwH5g
	 8F/qZaPT25S3IXLrjqcSvVI5R4d6lmnnmKJ2FPjkC4fPCE0IZbaqZ4OLe6AJqnIlBY
	 /L4SxLuaa3t57HTIOBU3dnHnHO/GKTg4S8b/d8+K7JWZ3PgUO3L5GVrxaFgN7K/zoB
	 3adNtBYf3rJ7A==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <2dHPPtixTlkUXYEzNPFRI4ezKHSe1A2VaThMjBpd1aM3NFkZQuyRdfmNWCigm1oXfdKhOwDJGoPBBIMLYtYhQlENV2eFVZ0G9EMOMj5e6UE=@protonmail.com>
In-Reply-To: <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com> <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com> <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com> <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com> <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com> <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com> <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com> <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_FbE9jUJUaD7yIEcdOhYBtclPJvelqbklNavjDGszI"

This is a multi-part message in MIME format.

--b1_FbE9jUJUaD7yIEcdOhYBtclPJvelqbklNavjDGszI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLAoKWWVzIHBsZWFzZSwgSSBoYXZlIFF1YmVzJ3MgQnVpbGQgU3lzdGVtIHNldHVwIHdp
dGggc291cmNlaHV0IHNvIEkgY2FuIGFkZCBwYXRjaGVzIGF0IHdpbGwsIGhvd2V2ZXIgcGxlYXNl
IGJlIGF3YXJlIFF1YmVzIGN1cnJlbnRseSB1c2VzIFhlbiA0LjE0LgoKSSdsbCB0YWtlIGEgbG9v
ayBhbmQgc2VlIGlmIEkgY2FuIGFjY2VzcyB0aGF0IGxvY2F0aW9uCgpXaXRoIHRoZSBhZGRlZCBs
b2dnaW5nIEkgc2hvdWxkIGJlIGFibGUgdG8gdHJpZ2dlciB0aGUgY3Jhc2ggYW5kIGdldCB0byB0
aGUgYm90dG9tIG9mIGl0CgpUaGFuayB5b3UgZm9yIHlvdXIgaGVscCBKYW4=

--b1_FbE9jUJUaD7yIEcdOhYBtclPJvelqbklNavjDGszI
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLDxicj48YnI+WWVzIHBsZWFzZSwgSSBoYXZlIFF1YmVzJ3MgQnVpbGQgU3lzdGVtIHNl
dHVwIHdpdGggc291cmNlaHV0IHNvIEkgY2FuIGFkZCBwYXRjaGVzIGF0IHdpbGwsIGhvd2V2ZXIg
cGxlYXNlIGJlIGF3YXJlIFF1YmVzIGN1cnJlbnRseSB1c2VzIFhlbiA0LjE0Ljxicj48YnI+SSds
bCB0YWtlIGEgbG9vayBhbmQgc2VlIGlmIEkgY2FuIGFjY2VzcyB0aGF0IGxvY2F0aW9uPGJyPjxi
cj5XaXRoIHRoZSBhZGRlZCBsb2dnaW5nIEkgc2hvdWxkIGJlIGFibGUgdG8gdHJpZ2dlciB0aGUg
Y3Jhc2ggYW5kIGdldCB0byB0aGUgYm90dG9tIG9mIGl0PGJyPjxicj5UaGFuayB5b3UgZm9yIHlv
dXIgaGVscCBKYW4gPGJyPg==


--b1_FbE9jUJUaD7yIEcdOhYBtclPJvelqbklNavjDGszI--


