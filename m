Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FF0E4F21
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 16:30:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0Xv-0001RG-42; Fri, 25 Oct 2019 14:26:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iO0Xt-0001RB-DY
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:26:29 +0000
X-Inumbo-ID: 6d8de9a0-f733-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d8de9a0-f733-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 14:26:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0B31ABC12;
 Fri, 25 Oct 2019 14:26:26 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
 <b7a419a3ae5f1bcb4d954e3609a5d1a982f48ebc.1571888583.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d9e5ed6-19c6-fa66-1324-b852370134ee@suse.com>
Date: Fri, 25 Oct 2019 16:26:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b7a419a3ae5f1bcb4d954e3609a5d1a982f48ebc.1571888583.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/3] efi: remove old
 SetVirtualAddressMap() arrangement
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMjAxOSAwNTo0NSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IFJlbW92ZSB1bnVzZWQgKCNpZmRlZi1lZCBvdXQpIGNvZGUuIFJldml2aW5nIGl0IGluIGl0cyBj
dXJyZW50IHNoYXBlCj4gd29uJ3QgZmx5IGJlY2F1c2U6Cj4gIC0gU2V0VmlydHVhbEFkZHJlc3NN
YXAoKSBuZWVkcyB0byBiZSBjYWxsZWQgd2l0aCAxOjEgbWFwcGluZywgd2hpY2gKPiAgICBpc24n
dCB0aGUgY2FzZSBhdCB0aGlzIHRpbWUKPiAgLSBpdCB1c2VzIGRpcmVjdG1hcCwgd2hpY2ggbWF5
IGdvIGF3YXkgc29vbgo+ICAtIGl0IHVzZXMgZGlyZWN0bWFwLCB3aGljaCBpcyBtYXBwZWQgd2l0
aCBOWCwgYnJlYWtpbmcgRWZpUnVudGltZVNlcnZpY2VzQ29kZQo+IAo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8
bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiBBY2tlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
