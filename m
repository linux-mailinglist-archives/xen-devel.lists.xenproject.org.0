Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B6B734CA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 19:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqKmg-0005Qh-VF; Wed, 24 Jul 2019 17:10:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eNHf=VV=savoirfairelinux.com=fredy.pulido@srs-us1.protection.inumbo.net>)
 id 1hqKmf-0005Qc-BZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 17:10:33 +0000
X-Inumbo-ID: ef80142a-ae35-11e9-9cae-f3e9cc7be250
Received: from mail.savoirfairelinux.com (unknown [208.88.110.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef80142a-ae35-11e9-9cae-f3e9cc7be250;
 Wed, 24 Jul 2019 17:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 523969C0263;
 Wed, 24 Jul 2019 13:10:28 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DceUv31VHwT3; Wed, 24 Jul 2019 13:10:27 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id CF3A09C02A8;
 Wed, 24 Jul 2019 13:10:27 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dl29fUsMd4b3; Wed, 24 Jul 2019 13:10:27 -0400 (EDT)
Received: from thinkpad (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 9917B9C0263;
 Wed, 24 Jul 2019 13:10:27 -0400 (EDT)
Message-ID: <bb7953206ba43f382b98d94884c57e4f0f07e8e3.camel@savoirfairelinux.com>
From: "Fredy P." <fredy.pulido@savoirfairelinux.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
 <JBeulich@suse.com>
Date: Wed, 24 Jul 2019 13:10:27 -0400
In-Reply-To: <20190724153528.xgpzq6ta4vrxpitq@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <1f653322-5d4d-5393-5790-c63b07492050@suse.com>
 <20190724153528.xgpzq6ta4vrxpitq@Air-de-Roger>
Organization: Savoir-faire Linux
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTA3LTI0IGF0IDE3OjM1ICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+IE9LLCBJIGFzc3VtZWQgdGhlIHF1ZXN0aW9uIHdhcyBhYm91dCByZWFkaW5nIHRoZSBDUFUg
dGVtcGVyYXR1cmUgYW5kCj4gdGhlbiBjaGFuZ2luZyB0aGUgZnJlcXVlbmN5IG9mIHRoZSBDUFUs
IGJ1dCBub3QgcmVsYXRlZCB0byBULXN0YXRlcy4KClllcywgdGhlIHF1ZXN0aW9uIGlzIGFib3V0
IHJlYWRpbmcgdGhlIENQVSB0ZW1wZXJhdHVyZSwgSG93IHRvIGNoYW5nZQppdCBpcyBhbHJlYWR5
ICJzb2x2ZWQiICh3ZSB3aWxsIG1vZGlmeSB0aGVybWFsZCB0byB1c2UgeGVucG0pCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
