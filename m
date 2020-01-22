Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3374145F99
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 00:59:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuPsT-0008EJ-I2; Wed, 22 Jan 2020 23:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g9N6=3L=steadfast.net=kevin@srs-us1.protection.inumbo.net>)
 id 1iuPsR-0008EE-RF
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 23:57:39 +0000
X-Inumbo-ID: f3864fe0-3d72-11ea-9fd7-bc764e2007e4
Received: from staffmx.steadfast.net (unknown [67.202.100.6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3864fe0-3d72-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 23:57:31 +0000 (UTC)
Received: from staffmx.steadfast.net (localhost [IPv6:::1])
 by staffmx.steadfast.net (Postfix) with ESMTPS id 8990A14807BC;
 Wed, 22 Jan 2020 17:57:28 -0600 (CST)
Received: from localhost (localhost [IPv6:::1])
 by staffmx.steadfast.net (Postfix) with ESMTP id 6D26314807BD;
 Wed, 22 Jan 2020 17:57:28 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 staffmx.steadfast.net 6D26314807BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steadfast.net;
 s=EEBF4A38-4631-11E7-97AD-3B7F97C5FFE7; t=1579737448;
 bh=eZTLbPAGohCUTqVksHenve2zCiZdl6JZnMEk46W+OKc=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=Hico+IAhtgr/VqJL920EymseBE6Ez2Zi7q2wr+qTFOZNrt4w/Tqvnn5AE1xlEuRQH
 bHJd1a+IQc0sMAvjtZ9kwzIg7oKXQ33jsCWlaO8txXO2XuvCHzHLaP9TlHsRabhJ4X
 Nt1kJ61Iz2KMJlyYDipL+ach/sSMd3LqoFERyU1uWxIgIVyOGxUbDyq2vRSTNqrG+u
 s7KtZnKGjp1Jqe9eoMhk1TXEZMdTBwBq//0VWI56BCNhTNxmMwG33ij9cxc8NT6mll
 P1PqwloyO0G2o+jBh8Gi647EL2TpbC2uKr7oh00LNVR8/+q7jm+rpAwGrusB/Q/1pH
 sw3GGmXv3ReBA==
X-Virus-Scanned: amavisd-new at steadfast.net
Received: from staffmx.steadfast.net ([IPv6:::1])
 by localhost (staffmx.steadfast.net [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id KcPXPYjq1JSk; Wed, 22 Jan 2020 17:57:28 -0600 (CST)
Received: from ziyal.office.steadfast.net (unknown [IPv6:2607:f128:0:2::100e])
 by staffmx.steadfast.net (Postfix) with ESMTPSA id 1B0B614807BC;
 Wed, 22 Jan 2020 17:57:28 -0600 (CST)
To: Jim Fehlig <jfehlig@suse.com>, Juergen Gross <JGross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <ed20195d-3272-6ce8-d3b4-a17e459733c2@steadfast.net>
 <1e150c03-13fc-edd8-90a9-71ac669965f3@suse.com>
 <30aa7949-0294-bfff-cef3-5d8406f8ada8@suse.com>
From: Kevin Stange <kevin@steadfast.net>
Autocrypt: addr=kevin@steadfast.net; prefer-encrypt=mutual; keydata=
 mQGiBEHoVBYRBACgNUrSLbbGAzxmsG5nd5KNoJXVwD8/FgxiYweLHrCHGrGEruEuknqoRFGs
 0SBLBLQuZjeO+KUtgTV6T+xLIoJgrDPHmhU0qYZZj8WUM3Dg+tt15eD58BRt/OltMdWPUXwy
 lzGTZhCrHFFeo1H1YseweI6b7QEuroklHrDWWPt3IwCgn5mlOVyUhjwqanaCYgbzdrWNZGcD
 /iXOCfRfAJpUhP7GxA4JB8vpSkxZETQxhpa+mNtqbnq1oJyNgONj56x7jbGOAmnjfazG68cJ
 kRxQ7t4J1A1QkjogeHrKgAPE7p6MCQs/h0cGHaj52VxOcw3fTKZxxW7JiuOjKmdqn/jSnVlN
 OGEm4PM02pEhc/otWf80TxHHbiCxBACSZZz5p43Kq3kTbTbW+gnNcL6Je7mNvKW7qUthBvmv
 HzU5wERvaGgEii76hA8CNXuMmOp00H98iJh5mgfzI3+1gO9HJjFuA9sg04eAKTcRNruW7lYF
 X6pGffEdeogM+bxm7mcbegyBVvWdGP7K3WKC50Vmjkn7mxSJxnA4vIcdQ7Q3S2V2aW4gU3Rh
 bmdlIChTdGVhZGZhc3QgTmV0d29ya3MpIDxrZXZpbkBzdGVhZGZhc3QubmV0PohfBBMRAgAf
 AhsDAh4BAheABQJIwdxjBgsJCAcDAgQVAggDAxYCAQAKCRCR38Gh4qODSNfdAJ9bOiF7IrIm
 R0q8Wb4o0SJqw45m5gCfWukZU6ScRP9xU1CuQnQ8rCqtVvW5Ag0EQehUGxAIALNp0GIzBv1n
 nILS1pBoQntIl+Q7Ey/K7UUvbOOPfDoa67YZRCq7Qlf8MwNRUZFmZkm3aEHjZn77JqBA4FKa
 MRGoEjXDgaNL4aAAo14OrexgomogU6TQk1yPNmcY0ImFDdVn8Pm7G21hcwgiDnO7cy4yNcyf
 6pnL82j0cOWifeJlPU9Tu0jf2iXrd6sYLxRlFL0JrvzNhjcC200TK9RHObsNnsVSQGTjRrb+
 pyAIG4LT98cWNj6jsRAotMxN1Rlm9GfK/I3okBC3Wu4qiWgNwdadrrM4rh28de/p22QyaXjk
 XKfRDhwFw7DbBHBY+o58QQTyy24VsDGbOt57fyvCmz8AAwUH/AhoYm0tGUm3td2Gk+wx3FUK
 7TDL8Jt65TAYBMFwk70PCEgKBJdJ0MKdnCmW5qhzuPkT2iexIYhj5RUHayqPz9NWegSHCDjy
 Du1ozxns3rTAzAGIqGmPnuhndv7GyqJksmHFqTouOmqNVQzqGtC6eI1zpf+R+LWqHYzknS3x
 7cw67eMgXO8x15lKSnK4oCmGoG6/69lthouwFJAwztUW/Iy6wPHShhEDAYyIdZcG5c4cFG4M
 Blb1rt3neJiUQfjrciRw/lEWKSoxGDZzxS0qA849IW4rfJkKyOPPSaH0ZrRsTq3M4AdcA42v
 1Fm2/B9k1Je97ZP0PVW3hiVUv0q5VFqISQQYEQIACQUCQehUGwIbDAAKCRCR38Gh4qODSKp1
 AKCY44btwb7f/4c4Ne0G3OEGTpdXEACeJ3XO66Ly3snOfSDddcnYDvzTykE=
Organization: Steadfast
Message-ID: <8743cb66-5e6b-8b2e-1273-e4809276cc84@steadfast.net>
Date: Wed, 22 Jan 2020 17:57:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <30aa7949-0294-bfff-cef3-5d8406f8ada8@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] libvirt support for scheduler credit2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMi8yMCAxMjo1NiBQTSwgSmltIEZlaGxpZyB3cm90ZToKPiBPbiAxLzIxLzIwIDEwOjA1
IEFNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAyMS4wMS4yMCAxNzo1NiwgS2V2aW4gU3Rh
bmdlIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gSSBsb29rZWQgYXJvdW5kIGEgYml0IGFuZCB3YXNu
J3QgYWJsZSB0byBmaW5kIGEgZ29vZCBhbnN3ZXIgdG8gdGhpcywgc28KPj4+IEdlb3JnZSBzdWdn
ZXN0ZWQgSSBhc2sgaGVyZS4KPj4KPj4gQ2MtaW5nIEppbS4KPj4KPj4+Cj4+PiBTaW5jZSBYZW4g
NC4xMiwgY3JlZGl0MiBpcyB0aGUgZGVmYXVsdCBzY2hlZHVsZXIsIGJ1dCBhdCBsZWFzdCBhcyBv
Zgo+Pj4gbGlidmlydCA1LjEuMCB2aXJzaCBkb2Vzbid0IGFwcGVhciB0byB1bmRlcnN0YW5kIGNy
ZWRpdDIgYW5kIHByb2R1Y2VzCj4+PiB0aGlzIHNvcnQgb2Ygb3V0cHV0Ogo+IAo+IFlvdSB3b3Vs
ZCBzZWUgdGhlIHNhbWUgd2l0aCBsaWJ2aXJ0LmdpdCBtYXN0ZXIsIHNvcnJ5LiBBVE0gdGhlIGxp
YnZpcnQgbGlieGwgCj4gZHJpdmVyIGlzIHVuYXdhcmUgb2YgdGhlIGNyZWRpdDIgc2NoZWR1bGVy
LiBIbW0sIGFzIEkgcmVjYWxsIERhcmlvIHdhcyBnb2luZyB0byAKPiBwcm92aWRlIGEgcGF0Y2gg
Zm9yIGxpYnZpcnQgOi0pLiBCdXQgaGUgaXMgcXVpdGUgYnVzeSBzbyBpdCB3aWxsIGhhdmUgdG8g
YmUgCj4gYWRkZWQgdG8gbXkgdmVyeSBsb25nIHRvZG8gbGlzdC4KClNvcnJ5IHRvIGhlYXIgdGhh
dCdzIHRoZSBjYXNlLiAgRHVlIHRvIG15IG9yY2hlc3RyYXRpb24gc3lzdGVtIEknbGwgaGF2ZQp0
byBoYW5nIG9uIHRvIGNyZWRpdCBhIHdoaWxlIGxvbmdlci4gIFRoYW5rcyBmb3IgY2xhcmlmeWlu
ZyEKCi0tIApLZXZpbiBTdGFuZ2UKQ2hpZWYgVGVjaG5vbG9neSBPZmZpY2VyClN0ZWFkZmFzdCB8
IE1hbmFnZWQgSW5mcmFzdHJ1Y3R1cmUsIERhdGFjZW50ZXIgYW5kIENsb3VkIFNlcnZpY2VzCjgw
MCBTIFdlbGxzLCBTdWl0ZSAxOTAgfCBDaGljYWdvLCBJTCA2MDYwNwozMTIuNjAyLjI2ODkgWDIw
MyB8IEZheDogMzEyLjYwMi4yNjg4CmtldmluQHN0ZWFkZmFzdC5uZXQgfCB3d3cuc3RlYWRmYXN0
Lm5ldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
