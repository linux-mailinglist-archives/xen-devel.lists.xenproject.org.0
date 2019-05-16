Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362771FE98
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 06:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hR8GU-0007lM-8l; Thu, 16 May 2019 04:45:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJgO=TQ=huawei.com=wencongyang2@srs-us1.protection.inumbo.net>)
 id 1hR6QL-0007Hd-Bu
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 02:47:13 +0000
X-Inumbo-ID: e6c3fca9-7784-11e9-8980-bc764e045a96
Received: from huawei.com (unknown [45.249.212.190])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e6c3fca9-7784-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 02:47:11 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3BF4AFFDEB943D4B2317
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 10:47:09 +0800 (CST)
Received: from [127.0.0.1] (10.177.249.165) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 16 May 2019 10:46:58 +0800
From: "wencongyang (A)" <wencongyang2@huawei.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <6bca3b07-c2aa-124f-e77e-59d5eb7bbd5c@huawei.com>
Date: Thu, 16 May 2019 10:46:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
X-Originating-IP: [10.177.249.165]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 16 May 2019 04:45:08 +0000
Subject: [Xen-devel] Question about MDS mitigation
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
Cc: gaowanlong <gaowanlong@huawei.com>,
 "Liujinsong \(Paul\)" <liu.jinsong@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, "Chentao
 \(Boby\)" <boby.chen@huawei.com>, guijianfeng <guijianfeng@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsCgpGaWxsIGJ1ZmZlcnMsIGxvYWQgcG9ydHMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRocmVh
ZHMgb24gdGhlIHNhbWUgcGh5c2ljYWwgY29yZS4KV2UgbmVlZCB0byBydW4gbW9yZSB0aGFuIG9u
ZSB2bSBvbiB0aGUgc2FtZSBwaHlzaWNhbCBjb3JlLgpJcyB0aGVyZSBhbnkgY29tcGxldGUgbWl0
aWdhdGlvbiBmb3IgZW52aXJvbm1lbnRzIHV0aWxpemluZyBTTVQ/CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
