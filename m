Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5DF4C300
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:33:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdi9s-0001OK-2f; Wed, 19 Jun 2019 21:30:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdi9q-0001OA-2q
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:30:18 +0000
X-Inumbo-ID: 6c5219d0-92d9-11e9-a3fe-fb2ada44529d
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6c5219d0-92d9-11e9-a3fe-fb2ada44529d;
 Wed, 19 Jun 2019 21:30:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41F74344;
 Wed, 19 Jun 2019 14:30:13 -0700 (PDT)
Received: from [10.37.8.153] (unknown [10.37.8.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C93393F738;
 Wed, 19 Jun 2019 14:30:11 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-5-git-send-email-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <efda4435-f685-7830-4f58-1b62d062fab5@arm.com>
Date: Wed, 19 Jun 2019 22:30:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560975087-25632-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] xen/link: Misc cleanup
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzE5LzE5IDk6MTEgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gICAqIERyb3Ag
LmdudS53YXJuaW5nLiAgWGVuLCBub3QgYmVpbmcgYSBsaWJyYXJ5LCBoYXMgbm8gbmVlZCBmb3IK
PiAgICAgX19hdHRyaWJ1dGVfXygoX193YXJuaW5nX18oInN0ciIpKSkgYW5kIGlzbid0IGxpYWJs
ZSB0byBldmVyIGdhaW4gc3VjaAo+ICAgICBhbm5vdGF0aW9ucyBmb3IgbGluayB0aW1lIHdhcm5p
bmdzLgoKV2hhdCBpZiB0aGlzIGlzIGludHJvZHVjZWQ/IEhvdyBkbyB3ZSBjYXRjaCBpdD8KCj4g
ICAqIEFkanVzdCB0aGUgaW5kZW50YXRpb24gb2YgdGhlIHN0YXJ0IG9mIEFSTSdzIC5yb2RhdGEg
c2VjdGlvbi4KPiAgICogRGlzY2FyZCAuZGlzY2FyZCBvbiBBUk0uCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
