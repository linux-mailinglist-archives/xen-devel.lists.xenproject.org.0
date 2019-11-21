Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370EF105601
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:48:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXof4-0006Cd-Qa; Thu, 21 Nov 2019 15:46:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXof3-0006CR-GP
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 15:46:25 +0000
X-Inumbo-ID: 11f2510a-0c76-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11f2510a-0c76-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 15:46:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 46EFCAF79;
 Thu, 21 Nov 2019 15:46:23 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Rishi <2rushikeshj@gmail.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
 <005596b6-9228-801b-300a-57807a96d051@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <38cd1016-d390-b722-24ce-dbf71ad57635@suse.com>
Date: Thu, 21 Nov 2019 16:46:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <005596b6-9228-801b-300a-57807a96d051@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMTkgMTY6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjExLjIwMTkgMTU6
MjQsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IFNvOiBubywganVzdCBnaXZpbmcgZG9tMCBhY2Nl
c3MgdG8gdGhlIG1hbmFnZW1lbnQgaGFyZHdhcmUgaXNuJ3QgZ29pbmcKPj4gdG8gZmx5LiBZb3Ug
bmVlZCB0byBoYXZlIGEgcHJvcGVyIHZpcnR1YWxpemF0aW9uIGxheWVyIGZvciB0aGF0IHB1cnBv
c2UuCj4gCj4gT3IsIGxpa2UgSSBoYWQgZG9uZSBpbiBvdXIgWGVub0xpbnV4IGZvcndhcmQgcG9y
dCwgeW91IG5lZWQgdG8KPiBnbyB0aHJvdWdoIGhvb3BzIHRvIG1ha2UgdGhlIGNvcmV0ZW1wIGRy
aXZlciBhY3R1YWxseSB1bmRlcnN0YW5kCj4gdGhlIGVudmlyb25tZW50IGl0J3MgcnVubmluZyBp
bi4KClRoaXMgd2lsbCBzdGlsbCBub3QgZ3VhcmFudGVlIHlvdSdsbCBiZSBhYmxlIHRvIHJlYWNo
IGFsbCBwaHlzaWNhbApjcHVzLiBJSVJDIHlvdSBwaW5uZWQgdGhlIHZjcHUgdG8gdGhlIHJlc3Bl
Y3RpdmUgcGh5c2ljYWwgY3B1IGZvcgpwZXJmb3JtaW5nIGl0cyBkdXR5LCBidXQgd2l0aCBjcHVw
b29scyB0aGlzIG1pZ2h0IG5vdCBiZSBwb3NzaWJsZSBmb3IKYWxsIHBoeXNpY2FsIGNwdXMgaW4g
dGhlIHN5c3RlbS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
