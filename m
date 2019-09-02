Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB32A59EF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4niC-0007IO-Uv; Mon, 02 Sep 2019 14:53:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4niB-0007IG-Iy
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:53:43 +0000
X-Inumbo-ID: 7486c838-cd91-11e9-aea3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7486c838-cd91-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 14:53:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BC6A8AE89;
 Mon,  2 Sep 2019 14:53:41 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
 <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
 <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
 <0b37db94-2051-4ea0-e518-6222346a82c1@suse.com>
 <4dc00c06cae742fdaf13a2d62ed73877@AMSPEX02CL03.citrite.net>
 <f0aa7c7e-82a9-4b94-4c00-d9faa763d505@suse.com>
 <f8078a1de8d54ff5801a679182bfc03e@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9519b0cf-8e00-f1f8-af41-f036a9132208@suse.com>
Date: Mon, 2 Sep 2019 16:53:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f8078a1de8d54ff5801a679182bfc03e@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: WeiLiu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim\(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNjoyMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFllcywgdGhlIGhhcCBw
YXJ0IHN0YXlzIHB1dC4gVGhlICdvb3Nfb2ZmJyBwYXJ0IG1vdmVzIHRvIHg4NiBhbmQgYXJtIGNh
bgo+IGJlIGxlZnQgYWxvbmUgYmVjYXVzZSBpdCBhbHJlYWR5IHJlamVjdHMgZmxhZ3MgIT0gKGh2
bSB8IGhhcCkuCgpCdXQgaXQgbWF5IGJldHRlciByZWplY3QgdGhlIE9PUyBmbGFnIF9kZXNwaXRl
XyBoYXZpbmcgb25seSBIVk0gZ3Vlc3RzLAphcyBsb25nIGFzIHRoZXJlJ3Mgbm8gc2hhZG93IG1v
ZGUgdGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
