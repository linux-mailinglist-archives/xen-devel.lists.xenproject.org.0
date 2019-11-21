Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3D1055C7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:39:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXoVo-00055v-2b; Thu, 21 Nov 2019 15:36:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXoVm-00055m-So
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 15:36:50 +0000
X-Inumbo-ID: bbd2587a-0c74-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbd2587a-0c74-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 15:36:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17074B232;
 Thu, 21 Nov 2019 15:36:49 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Rishi <2rushikeshj@gmail.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <005596b6-9228-801b-300a-57807a96d051@suse.com>
Date: Thu, 21 Nov 2019 16:36:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNToyNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBTbzogbm8sIGp1c3Qg
Z2l2aW5nIGRvbTAgYWNjZXNzIHRvIHRoZSBtYW5hZ2VtZW50IGhhcmR3YXJlIGlzbid0IGdvaW5n
Cj4gdG8gZmx5LiBZb3UgbmVlZCB0byBoYXZlIGEgcHJvcGVyIHZpcnR1YWxpemF0aW9uIGxheWVy
IGZvciB0aGF0IHB1cnBvc2UuCgpPciwgbGlrZSBJIGhhZCBkb25lIGluIG91ciBYZW5vTGludXgg
Zm9yd2FyZCBwb3J0LCB5b3UgbmVlZCB0bwpnbyB0aHJvdWdoIGhvb3BzIHRvIG1ha2UgdGhlIGNv
cmV0ZW1wIGRyaXZlciBhY3R1YWxseSB1bmRlcnN0YW5kCnRoZSBlbnZpcm9ubWVudCBpdCdzIHJ1
bm5pbmcgaW4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
