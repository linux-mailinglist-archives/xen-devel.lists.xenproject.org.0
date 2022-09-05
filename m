Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA125ADA61
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 22:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399172.640250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVIxz-0004mV-OM; Mon, 05 Sep 2022 20:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399172.640250; Mon, 05 Sep 2022 20:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVIxz-0004j2-LA; Mon, 05 Sep 2022 20:45:11 +0000
Received: by outflank-mailman (input) for mailman id 399172;
 Mon, 05 Sep 2022 20:45:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6AL=ZI=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oVIxy-0004iw-18
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 20:45:10 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e2e59b-2d5b-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 22:45:08 +0200 (CEST)
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
X-Inumbo-ID: a0e2e59b-2d5b-11ed-a016-b9edf5238543
Date: Mon, 05 Sep 2022 20:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1662410707; x=1662669907;
	bh=dQoZ+1WqtrwsZUeYC0cUYMAtoO/JqTs5qGSoqcwbBYY=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=iAfzAoJZrSiTxNNjGNmTi3wHMT8Quw5iiHJMv8T8vN2y2BnXRHAi7yAxUgXZ6tOCx
	 W4MVkaXzRPHMSb7mwJ24nVnkQmDIO0zp5/x9cN90eKoqEMHXU2bvF4bIMMxaTq6oon
	 EvQRu2dOiwllArI1pdnz58tuvFmeY8buT7SAZKqw3tyMDrqH6PhHxNHWWdnZUT2z+P
	 YXGrN3cUc/f/mCeb6j6uuxuNLUGV401J/2aiAXAjpOXunKIaiI9sdDdijqtcm6YWEr
	 nK/G9olb0N7tJA7/jQ5MIX8tnMqHttVnZdf6mqF/eZYgAMQr7fblFeeRm35FCK4QhE
	 Wy2xXjDohVfFw==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <oVx9918j32Qq0eaz3AYm7EEppH78uNE99t-mpatUT-HMih7deIwh66NslpGMDnYSPBmMkhy9ZTtIy9SZHybLMLregOxawLOvInHnBO3CQXA=@protonmail.com>
In-Reply-To: <941ccb01-adf6-d2ef-9a8a-ea8fdfe69ceb@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com> <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com> <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com> <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com> <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com> <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com> <2dHPPtixTlkUXYEzNPFRI4ezKHSe1A2VaThMjBpd1aM3NFkZQuyRdfmNWCigm1oXfdKhOwDJGoPBBIMLYtYhQlENV2eFVZ0G9EMOMj5e6UE=@protonmail.com> <941ccb01-adf6-d2ef-9a8a-ea8fdfe69ceb@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_FDcUmKLDuvCfnQE1xiOCBvZ7ASZpXmWsh7j4rwEXXcA"

This is a multi-part message in MIME format.

--b1_FDcUmKLDuvCfnQE1xiOCBvZ7ASZpXmWsh7j4rwEXXcA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLAoKSSd2ZSBtYW5hZ2VkIHRvIGZpbmFuZ2xlIGEgdmVyeSB1bnN0YWJsZSBlbnZpcm9u
bWVudCB0b2dldGhlcgoKV2hhdCBJJ20gc2VlaW5nIGlzIHRoZSBmb2xsb3dpbmc6CgoxLiBBbGwg
YXBwVk1zIGluY2x1ZGluZyBkb20wIG11c3QgaGF2ZSAxIGNvcmUgYXNzaWduZWQKMi4gVGhpcyBt
ZWFucyBJJ20gYWJsZSB0byBsYXVuY2ggNCBhcHBWTXMsIGFzIHNvb24gYXMgSSBsYXVuY2ggYSA1
dGgsIGl0IHB1dHMgYWxsIFBDSWUgZGV2aWNlcyBpbnRvIGEgYmFkIHN0YXRlCjMuIElmIEkgc2h1
dCB0aGUgNXRoIFZNIGRvd24sIEknbSBhYmxlIHRvIHJlc3RhcnQgc3lzLXVzYiBmb3IgZXhhbXBs
ZSBhbmQgInJlY292ZXIiIHRoZSBVU0IgQ29udHJvbGxlci4KCkknbSBub3Qg8J+SryBidXQgSSB0
aGluayB0aGlzIG1lYW5zIGl0J3MgYSBzY2hlZHVsaW5nL2NvcmUgaXNzdWU/CgpJdCBhbG1vc3Qg
d29ya3Mg8J+kpuKAjeKZgu+4jwoKQ2hlZXJz

--b1_FDcUmKLDuvCfnQE1xiOCBvZ7ASZpXmWsh7j4rwEXXcA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLDxicj48YnI+SSd2ZSBtYW5hZ2VkIHRvIGZpbmFuZ2xlIGEgdmVyeSB1bnN0YWJsZSBl
bnZpcm9ubWVudCB0b2dldGhlcjxicj48YnI+V2hhdCBJJ20gc2VlaW5nIGlzIHRoZSBmb2xsb3dp
bmc6PGJyPjxicj4xLiBBbGwgYXBwVk1zIGluY2x1ZGluZyBkb20wIG11c3QgaGF2ZSAxIGNvcmUg
YXNzaWduZWQ8YnI+Mi4gVGhpcyBtZWFucyBJJ20gYWJsZSB0byBsYXVuY2ggNCBhcHBWTXMsIGFz
IHNvb24gYXMgSSBsYXVuY2ggYSA1dGgsIGl0IHB1dHMgYWxsIFBDSWUgZGV2aWNlcyBpbnRvIGEg
YmFkIHN0YXRlPGJyPjMuIElmIEkgc2h1dCB0aGUgNXRoIFZNIGRvd24sIEknbSBhYmxlIHRvIHJl
c3RhcnQgc3lzLXVzYiBmb3IgZXhhbXBsZSBhbmQgInJlY292ZXIiIHRoZSBVU0IgQ29udHJvbGxl
ci48YnI+PGJyPkknbSBub3Qg8J+SryBidXQgSSB0aGluayB0aGlzIG1lYW5zIGl0J3MgYSBzY2hl
ZHVsaW5nL2NvcmUgaXNzdWU/PGJyPjxicj5JdCBhbG1vc3Qgd29ya3Mg8J+kpuKAjeKZgu+4jzxi
cj48YnI+Q2hlZXJz


--b1_FDcUmKLDuvCfnQE1xiOCBvZ7ASZpXmWsh7j4rwEXXcA--


