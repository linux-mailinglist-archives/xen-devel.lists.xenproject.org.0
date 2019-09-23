Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D081ABB4ED
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCNzh-0006pK-NR; Mon, 23 Sep 2019 13:03:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCNzg-0006pF-43
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:03:08 +0000
X-Inumbo-ID: 7bedc190-de02-11e9-95fc-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bedc190-de02-11e9-95fc-12813bfff9fa;
 Mon, 23 Sep 2019 13:03:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A8727AF76;
 Mon, 23 Sep 2019 13:03:05 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <819398f808613a1109bc06440268b8746e7540d4.1568475323.git-series.marmarek@invisiblethingslab.com>
 <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
 <20190920160250.GA8065@mail-itl>
 <7a954000-904d-57aa-2524-5d0c51a8d422@suse.com>
 <20190923104746.GD8065@mail-itl>
 <81326ccd-c27d-d97c-2a20-b39c1f42f5f0@suse.com>
 <20190923122549.GA15942@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <262d6664-0b0d-77b5-ce17-abafbf3f313c@suse.com>
Date: Mon, 23 Sep 2019 15:02:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923122549.GA15942@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxNDoyNSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBXaGF0IGFib3V0IHRoaXM6IEhWTSBndWVzdCBjYW4gYWxyZWFkeSBkbyBhbGwgb2YgdGhpcyB3
aGVuIHFlbXUgaXMKPiBydW5uaW5nIGluIGRvbTAuIFNvLCBhbGxvd2luZyB0aG9zZSBhY3Rpb25z
IHdoZW4gcWVtdSBpcyBydW5uaW5nIGluCj4gc3R1YmRvbWFpbiBzaG91bGQgbm90IGludHJvZHVj
ZSBfYWRkaXRpb25hbF8gcmlza3MuCgpXZWxsLCBpbiBhIHdheSAtIHllcy4gQnV0IEkgZG9uJ3Qg
dGhpbmsgaXQncyByaWdodCB0byBoYXZlIHFlbXUgZG8KdGhlIGRpcmVjdCB3cml0ZXMgaXQgZG9l
cyAoYW5kIEkgd291bGRuJ3QgYmUgc3VycHJpc2VkIGlmIHRoZXJlCndlcmUgc3RpbGwgYWN0dWFs
IGlzc3VlcyB3aXRoIHRoaXMgbW9kZWwpLiBIZW5jZSBpdCdzIG5vdCBnb2luZyB0bwpiZSBhbiBp
bXByb3ZlbWVudCBpZiB0aGlzIHN1c3BpY2lvdXMgdW5kZXJseWluZyBkZXNpZ24gZ290CmV4dGVu
ZGVkIHRvIG90aGVyIGNvbXBvbmVudHMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
