Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF4E02FB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 13:35:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMsP6-0003AN-KD; Tue, 22 Oct 2019 11:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wjmx=YP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iMsP5-0003AH-9u
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 11:32:43 +0000
X-Inumbo-ID: a913b976-f4bf-11e9-9467-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a913b976-f4bf-11e9-9467-12813bfff9fa;
 Tue, 22 Oct 2019 11:32:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36C5A1045;
 Tue, 22 Oct 2019 04:32:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 699CD3F718;
 Tue, 22 Oct 2019 04:32:41 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1571220487-6582-1-git-send-email-olekstysh@gmail.com>
 <ae58dcda-4ac0-f1c6-2984-ec0302dc5961@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dd45b1d8-d839-2c8c-0d51-22221a80c5b2@arm.com>
Date: Tue, 22 Oct 2019 12:32:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ae58dcda-4ac0-f1c6-2984-ec0302dc5961@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMjIvMTAvMjAxOSAxMToyNywgT2xla3NhbmRyIHdyb3RlOgo+IEdl
bnRsZSByZW1pbmRlci4uLgoKVGhpcyBpcyBpbiBteSBxdWV1ZSBvZiBwYXRjaGVzIHRvIHJldmll
dy4gQnV0IEkgaGF2ZSBiZWVuIGZvY3VzaW5nIG9uIG1vcmUgCnVyZ2VudCB0YXNrcyB0aGUgcGFz
dCB3ZWVrLgoKSSB3aWxsIHRyeSB0byByZXZpZXcgaXQgYnkgdGhlIGVuZCBvZiB0aGUgd2Vlay4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
