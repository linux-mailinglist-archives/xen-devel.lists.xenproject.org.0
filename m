Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89025A88D2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 00:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396071.636060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTVwt-000809-7H; Wed, 31 Aug 2022 22:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396071.636060; Wed, 31 Aug 2022 22:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTVwt-0007xw-47; Wed, 31 Aug 2022 22:12:39 +0000
Received: by outflank-mailman (input) for mailman id 396071;
 Wed, 31 Aug 2022 22:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hYa=ZD=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oTVwq-0007xq-HZ
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 22:12:36 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03ea9116-297a-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 00:12:35 +0200 (CEST)
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
X-Inumbo-ID: 03ea9116-297a-11ed-934f-f50d60e1c1bd
Date: Wed, 31 Aug 2022 22:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1661983954; x=1662243154;
	bh=td9W+etK5b6KMLAwE5ndP/FeC9RNmsa1DM5XGo/PME4=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=K9SBhsT5z4XYSC1y3gtjyk2eAqPX0CA9eBGtoh3qGBbp0u676v7WDzDElusA1yXg7
	 64LSBl7iRoAr2tizA8uAHQGW+VXBjqneB9lR56+GNOQ6xF1Tvy4n+8U5rCA8gvKOUR
	 VlxR5NtYCTJr6QzdKP3+MbbGgy/32RLN2rUdEvbHHkArxOv6DTzZzj+d19rUgofZRj
	 wodFF10kkiFqXoJ7W/3JeKlYmA/p0Aj+IEGouQTwcPOjQj3Vf6sp0b9/uPIFyLDgm5
	 NY6Y3cbbpqRPc4Vifv7hkqziKijY3lIBuw2bkwSKTIoTntAaO3pdoGliD9Vq0NK4k+
	 8NtKFH7RLgisQ==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <qTp5d-Cn3519Lu7CMaJJBDaSFsBq27wHEYa8IsNWzJKlsnzBZ04KU9yh6IgBGGvGeWn50kdQeKSPYoiQeg3ohs0C_wewbSNGUwQbR3HhGhw=@protonmail.com>
In-Reply-To: <941ccb01-adf6-d2ef-9a8a-ea8fdfe69ceb@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com> <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com> <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com> <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com> <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com> <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com> <2dHPPtixTlkUXYEzNPFRI4ezKHSe1A2VaThMjBpd1aM3NFkZQuyRdfmNWCigm1oXfdKhOwDJGoPBBIMLYtYhQlENV2eFVZ0G9EMOMj5e6UE=@protonmail.com> <941ccb01-adf6-d2ef-9a8a-ea8fdfe69ceb@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_jaHWT83QAIf9Pk5HE2mZR4eX9Gu6CAiGEVcomoKCRM"

This is a multi-part message in MIME format.

--b1_jaHWT83QAIf9Pk5HE2mZR4eX9Gu6CAiGEVcomoKCRM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLAoKSSB0aGluayBJJ3ZlIG5hcnJvd2VkIHRoZSBpc3N1ZSBkb3duIHRvIGEgUENJIGRl
dmljZSwgaWYgSSBzdGFydCAyIGxhcmdlIFZNLCB0aGVuIHNpbXBseSBydW4gbHNwY2kgaW4gZG9t
MCwgaXQnbGwgdHJpZ2dlciBhIGNyYXNoLgoKVGhpcyBtYWtlcyBzZW5zZSBhcyBzeXMtbmV0IHdv
cmtzIGZpbmUgdW50aWwgSSBzdGFydCBhIGxhcmdlciBWTSwgdGhlbiBJIHNlZSBhICdjaGlwIHJl
c2V0JyBlcnJvciBpbiB0aGUgYXBwVk0ncyBkbWVzZywgSSBhc3N1bWUgdGhlIGVudGlyZSBQQ0kg
QnVzIGdvZXMgaW50byBhIGJhZCBzdGF0ZS4KCkNoZWVycw==

--b1_jaHWT83QAIf9Pk5HE2mZR4eX9Gu6CAiGEVcomoKCRM
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLDxicj48YnI+SSB0aGluayBJJ3ZlIG5hcnJvd2VkIHRoZSBpc3N1ZSBkb3duIHRvIGEg
UENJIGRldmljZSwgaWYgSSBzdGFydCAyIGxhcmdlIFZNLCB0aGVuIHNpbXBseSBydW4gbHNwY2kg
aW4gZG9tMCwgaXQnbGwgdHJpZ2dlciBhIGNyYXNoLjxicj48YnI+VGhpcyBtYWtlcyBzZW5zZSBh
cyBzeXMtbmV0IHdvcmtzIGZpbmUgdW50aWwgSSBzdGFydCBhIGxhcmdlciBWTSwgdGhlbiBJIHNl
ZSBhICdjaGlwIHJlc2V0JyBlcnJvciBpbiB0aGUgYXBwVk0ncyBkbWVzZywgSSBhc3N1bWUgdGhl
IGVudGlyZSBQQ0kgQnVzIGdvZXMgaW50byBhIGJhZCBzdGF0ZS48YnI+PGJyPkNoZWVycw==


--b1_jaHWT83QAIf9Pk5HE2mZR4eX9Gu6CAiGEVcomoKCRM--


