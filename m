Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F46B5B5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 07:01:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnc1i-0005Ui-O2; Wed, 17 Jul 2019 04:58:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zX8a=VO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hnc1h-0005Ua-4d
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 04:58:49 +0000
X-Inumbo-ID: 8f2bf4e4-a84f-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f2bf4e4-a84f-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 04:58:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7615EABCD;
 Wed, 17 Jul 2019 04:58:46 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <eb67c985-0d1f-641c-9622-e0faf3e72b8d@suse.com>
Date: Wed, 17 Jul 2019 06:58:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v8 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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
Cc: sstabellini@kernel.org, x86@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMTkgMDY6MjYsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IC4uIGFzICJub3B2IiBz
dXBwb3J0IG5lZWRzIGl0IHRvIGJlIGNoYW5nZWFibGUgYXQgYm9vdCB1cCBzdGFnZS4KPiAKPiBD
aGVja3BhdGNoIHJlcG9ydHMgd2FybmluZywgc28gbW92ZSB2YXJpYWJsZSBkZWNsYXJhdGlvbnMg
ZnJvbQo+IGh5cGVydmlzb3IuYyB0byBoeXBlcnZpc29yLmgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBa
aGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgouLi4gYW5kIGNvbXBsZXRlIHNlcmllcyBh
cHBsaWVkIHRvIHhlbi90aXAuZ2l0IGZvci1saW51cy01LjNhCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
