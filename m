Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F78F7322C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:50:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqIZ6-0001Il-RM; Wed, 24 Jul 2019 14:48:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mQw0=VV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqIZ5-0001Ig-7s
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:48:23 +0000
X-Inumbo-ID: 14fe20e8-ae22-11e9-b2ae-2b4567145008
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 14fe20e8-ae22-11e9-b2ae-2b4567145008;
 Wed, 24 Jul 2019 14:48:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B89928;
 Wed, 24 Jul 2019 07:48:21 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B44783F71A;
 Wed, 24 Jul 2019 07:48:20 -0700 (PDT)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <070c33cd72a6413194ff524af9ad6c4a@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5f458020-bf98-fae3-7a37-d9773e7b9788@arm.com>
Date: Wed, 24 Jul 2019 15:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <070c33cd72a6413194ff524af9ad6c4a@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/arm: Early printk configuration for
 Raspberry Pi 4
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNC8wNy8yMDE5IDE1OjM0LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gU2ln
bmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVy
d29ya3MuY29tPgoKTm8gbW9yZSBlYXJseXByaW50ayBhbGlhcy4gSW5zdGVhZCwgdGhpcyBuZWVk
cyB0byBnbyBpbiB0aGUgYm9hcmQgZG9jdW1lbnRhdGlvbi4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
