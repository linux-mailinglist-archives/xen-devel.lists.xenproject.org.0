Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688B595610
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 11:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388118.624690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNsk8-0005KH-KX; Tue, 16 Aug 2022 09:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388118.624690; Tue, 16 Aug 2022 09:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNsk8-0005IS-GT; Tue, 16 Aug 2022 09:20:12 +0000
Received: by outflank-mailman (input) for mailman id 388118;
 Tue, 16 Aug 2022 09:20:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=71JP=YU=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oNsk6-0005IM-T1
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 09:20:11 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f7248ab-1d44-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 11:20:09 +0200 (CEST)
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
X-Inumbo-ID: 9f7248ab-1d44-11ed-bd2e-47488cf2e6aa
Date: Tue, 16 Aug 2022 09:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1660641608; x=1660900808;
	bh=51GDu4WVFYf2PAdTw+JPdXwGLCo95ApT0KPWzFEKDkg=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=zcf1fByEqS1mXMNWZiUqEhA71gLsuQDsj59G9m+tfQ68U8vEXnI35dtIjiv9KmuL7
	 s0iY1+xmYaYFE+i0qBYpsd3thtA4Xz/+z03cZzy56IrxjwHbFq3O4covV/yx+0hyFN
	 b0rT95tZeXgs8wTjlgTS7GcZwlBocao0TCvPvai2oLiHoOqeBIWBJ1Sli/TDBca91x
	 NLpav77xDG4O0cEC20nj5ir8SQJ1TNmtwtltcC22U4pcY0ZSHfjRHm8PTGUteXDKAW
	 f83ctTt4YVzlxbmRBIRHdPGaEOPmqY/yQwQrfmfRpycFwi/twCnUeGBn/Ob/FSF+7Q
	 89tqpQmGDsvMw==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <IPozz4PvDN7DUKwCoo1sy0mRF_rX13XangOkbctWxQRJ2TddFQUMRIWpzUcD7QjOFVeGQTKXmmmKacy4WPwond1xQ6Stpu6M3Y_Xx_cJ4S8=@protonmail.com>
In-Reply-To: <94c4df02-37db-f722-3644-bf26a278107b@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com> <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com> <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com> <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com> <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com> <2d844e18-c1f0-ddf3-6e6c-28b3ba09b427@suse.com> <2Z9txJ9x0dRfAKKDGhv-bzsLzhaGr2eIXMpUtMOqXCaXVobm_mL_fjQ87VfcB3pSc4bOntsOG_aYCmL4CBgJFqwOI23OFyZ67KiKnK-MIP4=@protonmail.com> <94c4df02-37db-f722-3644-bf26a278107b@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_tT3OTVVxlmtvd0OJ02N3bDY4cwBcIHKjKiLMuCJiDA"

This is a multi-part message in MIME format.

--b1_tT3OTVVxlmtvd0OJ02N3bDY4cwBcIHKjKiLMuCJiDA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLAoKSW50ZXJlc3RpbmcgbW9ybmluZyBpbmRlZWQhCgpPcGVuaW5nIHNvdW5kIHNldHRp
bmdzIGluIGRvbTAgYW5kIHNldHRpbmcgdGhlIEhEIEF1ZGlvIENvbnRyb2xsZXIgdG8gIk9mZiIg
YWxsb3dlZCB0aGUgVk0gdG8gYm9vdCEg8J+OiQoKVmVyeSBzdHJhbmdlIGluZGVlZAoKQ2hlZXJz

--b1_tT3OTVVxlmtvd0OJ02N3bDY4cwBcIHKjKiLMuCJiDA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLDxicj48YnI+SW50ZXJlc3RpbmcgbW9ybmluZyBpbmRlZWQhPGJyPjxicj5PcGVuaW5n
IHNvdW5kIHNldHRpbmdzIGluIGRvbTAgYW5kIHNldHRpbmcgdGhlIEhEIEF1ZGlvIENvbnRyb2xs
ZXIgdG8gIk9mZiIgYWxsb3dlZCB0aGUgVk0gdG8gYm9vdCEg8J+OiTxicj48YnI+VmVyeSBzdHJh
bmdlIGluZGVlZDxicj48YnI+Q2hlZXJz


--b1_tT3OTVVxlmtvd0OJ02N3bDY4cwBcIHKjKiLMuCJiDA--


