Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD444FB2A5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:33:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtgX-00083X-NK; Wed, 13 Nov 2019 14:31:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J2+i=ZF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUtgW-00083P-DY
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:31:52 +0000
X-Inumbo-ID: 54846404-0622-11ea-a231-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54846404-0622-11ea-a231-12813bfff9fa;
 Wed, 13 Nov 2019 14:31:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A266AD69;
 Wed, 13 Nov 2019 14:31:50 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191113134417.17299-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dfb9ada0-f5de-49bc-7a62-e9f3d07deb7d@suse.com>
Date: Wed, 13 Nov 2019 15:31:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191113134417.17299-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/passthrough: Render domains
 with %pd in the 'Q' debug handler
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
Cc: Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMTkgMTQ6NDQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gSU9NTVVzIGFyZSBvd25l
ZCBieSBET01fWEVOLCBhbmQgd2l0aCBYU0EtMzAyLCBET01fSU8gaXMgdXNlZCBmb3IKPiBxdWFy
YW50aW5lZCBkb21haW5zLiAgVXNlICVwZCBpbiB0aGUgcHJpbnRrIHRvIHJlbmRlciB0aGUgc3lz
dGVtCj4gZG9tYWlucyBtb3JlIGludGVsbGlnZW50bHkuCj4gCj4gQmVmb3JlOgo+ICAgIChYRU4p
IDAwMDA6MDA6MDEuMCAtIGRvbSAwICAgLSBub2RlIDAgICAtIE1TSXMgPCA+Cj4gICAgKFhFTikg
MDAwMDowMDowMC4wIC0gZG9tIDAgICAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KPiAgICAoWEVOKSAw
MDAwOjgwOjAwLjIgLSBkb20gMzI3NTQgLSBub2RlIDEgICAtIE1TSXMgPCA+Cj4gICAgKFhFTikg
MDAwMDphMDowMC4yIC0gZG9tIDMyNzU0IC0gbm9kZSAxICAgLSBNU0lzIDwgPgo+ICAgIChYRU4p
IDAwMDA6YzA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMSAgIC0gTVNJcyA8ID4KPiAgICAoWEVO
KSAwMDAwOmUwOjAwLjIgLSBkb20gMzI3NTQgLSBub2RlIDEgICAtIE1TSXMgPCA+Cj4gICAgKFhF
TikgMDAwMDowMDowMC4yIC0gZG9tIDMyNzU0IC0gbm9kZSAwICAgLSBNU0lzIDwgPgo+ICAgIChY
RU4pIDAwMDA6MjA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KPiAgICAo
WEVOKSAwMDAwOjQwOjAwLjIgLSBkb20gMzI3NTQgLSBub2RlIDAgICAtIE1TSXMgPCA+Cj4gICAg
KFhFTikgMDAwMDo2MDowMC4yIC0gZG9tIDMyNzU0IC0gbm9kZSAwICAgLSBNU0lzIDwgPgo+IAo+
IEFmdGVyOgo+ICAgIChYRU4pIDAwMDA6MDA6MDEuMCAtIGQwIC0gbm9kZSAwICAgLSBNU0lzIDwg
Pgo+ICAgIChYRU4pIDAwMDA6MDA6MDAuMCAtIGQwIC0gbm9kZSAwICAgLSBNU0lzIDwgPgo+ICAg
IChYRU4pIDAwMDA6ODA6MDAuMiAtIGRbWEVOXSAtIG5vZGUgMSAgIC0gTVNJcyA8ID4KPiAgICAo
WEVOKSAwMDAwOmEwOjAwLjIgLSBkW1hFTl0gLSBub2RlIDEgICAtIE1TSXMgPCA+Cj4gICAgKFhF
TikgMDAwMDpjMDowMC4yIC0gZFtYRU5dIC0gbm9kZSAxICAgLSBNU0lzIDwgPgo+ICAgIChYRU4p
IDAwMDA6ZTA6MDAuMiAtIGRbWEVOXSAtIG5vZGUgMSAgIC0gTVNJcyA8ID4KPiAgICAoWEVOKSAw
MDAwOjAwOjAwLjIgLSBkW1hFTl0gLSBub2RlIDAgICAtIE1TSXMgPCA+Cj4gICAgKFhFTikgMDAw
MDoyMDowMC4yIC0gZFtYRU5dIC0gbm9kZSAwICAgLSBNU0lzIDwgPgo+ICAgIChYRU4pIDAwMDA6
NDA6MDAuMiAtIGRbWEVOXSAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KPiAgICAoWEVOKSAwMDAwOjYw
OjAwLjIgLSBkW1hFTl0gLSBub2RlIDAgICAtIE1TSXMgPCA+Cj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
