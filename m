Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B860C1040
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 10:50:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iE8N0-0004hq-2e; Sat, 28 Sep 2019 08:46:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=feaI=XX=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iE8Mx-0004hl-U9
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 08:46:23 +0000
X-Inumbo-ID: 723528bf-e1cc-11e9-9691-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by localhost (Halon) with ESMTPS
 id 723528bf-e1cc-11e9-9691-12813bfff9fa;
 Sat, 28 Sep 2019 08:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83ADD8980FF;
 Sat, 28 Sep 2019 08:46:21 +0000 (UTC)
Received: from [10.36.116.71] (ovpn-116-71.ams2.redhat.com [10.36.116.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84B8960BE1;
 Sat, 28 Sep 2019 08:46:19 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
References: <20190927154628.8480-1-david@redhat.com>
 <4d6a1f9b-15ff-6594-44e0-bc262e9347f7@oracle.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwX4EEwECACgFAljj9eoCGwMFCQlmAYAGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEE3eEPcA/4Na5IIP/3T/FIQMxIfNzZshIq687qgG
 8UbspuE/YSUDdv7r5szYTK6KPTlqN8NAcSfheywbuYD9A4ZeSBWD3/NAVUdrCaRP2IvFyELj
 xoMvfJccbq45BxzgEspg/bVahNbyuBpLBVjVWwRtFCUEXkyazksSv8pdTMAs9IucChvFmmq3
 jJ2vlaz9lYt/lxN246fIVceckPMiUveimngvXZw21VOAhfQ+/sofXF8JCFv2mFcBDoa7eYob
 s0FLpmqFaeNRHAlzMWgSsP80qx5nWWEvRLdKWi533N2vC/EyunN3HcBwVrXH4hxRBMco3jvM
 m8VKLKao9wKj82qSivUnkPIwsAGNPdFoPbgghCQiBjBe6A75Z2xHFrzo7t1jg7nQfIyNC7ez
 MZBJ59sqA9EDMEJPlLNIeJmqslXPjmMFnE7Mby/+335WJYDulsRybN+W5rLT5aMvhC6x6POK
 z55fMNKrMASCzBJum2Fwjf/VnuGRYkhKCqqZ8gJ3OvmR50tInDV2jZ1DQgc3i550T5JDpToh
 dPBxZocIhzg+MBSRDXcJmHOx/7nQm3iQ6iLuwmXsRC6f5FbFefk9EjuTKcLMvBsEx+2DEx0E
 UnmJ4hVg7u1PQ+2Oy+Lh/opK/BDiqlQ8Pz2jiXv5xkECvr/3Sv59hlOCZMOaiLTTjtOIU7Tq
 7ut6OL64oAq+zsFNBFXLn5EBEADn1959INH2cwYJv0tsxf5MUCghCj/CA/lc/LMthqQ773ga
 uB9mN+F1rE9cyyXb6jyOGn+GUjMbnq1o121Vm0+neKHUCBtHyseBfDXHA6m4B3mUTWo13nid
 0e4AM71r0DS8+KYh6zvweLX/LL5kQS9GQeT+QNroXcC1NzWbitts6TZ+IrPOwT1hfB4WNC+X
 2n4AzDqp3+ILiVST2DT4VBc11Gz6jijpC/KI5Al8ZDhRwG47LUiuQmt3yqrmN63V9wzaPhC+
 xbwIsNZlLUvuRnmBPkTJwwrFRZvwu5GPHNndBjVpAfaSTOfppyKBTccu2AXJXWAE1Xjh6GOC
 8mlFjZwLxWFqdPHR1n2aPVgoiTLk34LR/bXO+e0GpzFXT7enwyvFFFyAS0Nk1q/7EChPcbRb
 hJqEBpRNZemxmg55zC3GLvgLKd5A09MOM2BrMea+l0FUR+PuTenh2YmnmLRTro6eZ/qYwWkC
 u8FFIw4pT0OUDMyLgi+GI1aMpVogTZJ70FgV0pUAlpmrzk/bLbRkF3TwgucpyPtcpmQtTkWS
 gDS50QG9DR/1As3LLLcNkwJBZzBG6PWbvcOyrwMQUF1nl4SSPV0LLH63+BrrHasfJzxKXzqg
 rW28CTAE2x8qi7e/6M/+XXhrsMYG+uaViM7n2je3qKe7ofum3s4vq7oFCPsOgwARAQABwsFl
 BBgBAgAPBQJVy5+RAhsMBQkJZgGAAAoJEE3eEPcA/4NagOsP/jPoIBb/iXVbM+fmSHOjEshl
 KMwEl/m5iLj3iHnHPVLBUWrXPdS7iQijJA/VLxjnFknhaS60hkUNWexDMxVVP/6lbOrs4bDZ
 NEWDMktAeqJaFtxackPszlcpRVkAs6Msn9tu8hlvB517pyUgvuD7ZS9gGOMmYwFQDyytpepo
 YApVV00P0u3AaE0Cj/o71STqGJKZxcVhPaZ+LR+UCBZOyKfEyq+ZN311VpOJZ1IvTExf+S/5
 lqnciDtbO3I4Wq0ArLX1gs1q1XlXLaVaA3yVqeC8E7kOchDNinD3hJS4OX0e1gdsx/e6COvy
 qNg5aL5n0Kl4fcVqM0LdIhsubVs4eiNCa5XMSYpXmVi3HAuFyg9dN+x8thSwI836FoMASwOl
 C7tHsTjnSGufB+D7F7ZBT61BffNBBIm1KdMxcxqLUVXpBQHHlGkbwI+3Ye+nE6HmZH7IwLwV
 W+Ajl7oYF+jeKaH4DZFtgLYGLtZ1LDwKPjX7VAsa4Yx7S5+EBAaZGxK510MjIx6SGrZWBrrV
 TEvdV00F2MnQoeXKzD7O4WFbL55hhyGgfWTHwZ457iN9SgYi1JLPqWkZB0JRXIEtjd4JEQcx
 +8Umfre0Xt4713VxMygW0PnQt5aSQdMD58jHFxTk092mU+yIHj5LeYgvwSgZN4airXk5yRXl
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <f591f279-62c9-3d3d-39ad-090c2ad73c23@redhat.com>
Date: Sat, 28 Sep 2019 10:46:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4d6a1f9b-15ff-6594-44e0-bc262e9347f7@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Sat, 28 Sep 2019 08:46:21 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v1] xen/balloon: Set pages PageOffline() in
 balloon_add_region()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 stable@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMjA6MDgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiA5LzI3LzE5IDEx
OjQ2IEFNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gV2UgYXJlIG1pc3NpbmcgYSBfX1Nl
dFBhZ2VPZmZsaW5lKCksIHdoaWNoIGlzIHdoeSB3ZSBjYW4gZ2V0Cj4+ICFQYWdlT2ZmbGluZSgp
IHBhZ2VzIG9udG8gdGhlIGJhbGxvb24gbGlzdCwgd2hlcmUKPj4gYWxsb2NfeGVuYmFsbG9vbmVk
X3BhZ2VzKCkgd2lsbCBjb21wbGFpbjoKPj4KPj4gcGFnZTpmZmZmZWEwMDAzZTdmZmMwIHJlZmNv
dW50OjEgbWFwY291bnQ6MCBtYXBwaW5nOjAwMDAwMDAwMDAwMDAwMDAgaW5kZXg6MHgwCj4+IGZs
YWdzOiAweGZmZmZlMDAwMDEwMDAocmVzZXJ2ZWQpCj4+IHJhdzogMDAwZmZmZmUwMDAwMTAwMCBk
ZWFkMDAwMDAwMDAwMTAwIGRlYWQwMDAwMDAwMDAyMDAgMDAwMDAwMDAwMDAwMDAwMAo+PiByYXc6
IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMWZmZmZmZmZmIDAwMDAw
MDAwMDAwMDAwMDAKPj4gcGFnZSBkdW1wZWQgYmVjYXVzZTogVk1fQlVHX09OX1BBR0UoIVBhZ2VP
ZmZsaW5lKHBhZ2UpKQo+PiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4g
a2VybmVsIEJVRyBhdCBpbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaDo3NDQhCj4+IGludmFsaWQg
b3Bjb2RlOiAwMDAwIFsjMV0gU01QIE5PUFRJCj4+Cj4+IFJlcG9ydGVkLWJ5OiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4+IFRl
c3RlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0
aGluZ3NsYWIuY29tPgo+PiBGaXhlczogNzdjNGFkZjZhNmRmICgieGVuL2JhbGxvb246IG1hcmsg
aW5mbGF0ZWQgcGFnZXMgUEdfb2ZmbGluZSIpCj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
ICMgdjUuMSsKPj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+Cj4+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IENjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IERh
dmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMveGVu
L2JhbGxvb24uYyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9iYWxsb29uLmMgYi9kcml2ZXJzL3hlbi9iYWxsb29u
LmMKPj4gaW5kZXggMDViMWY3ZTk0OGVmLi4yOWY2MjU2MzYzZGIgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMveGVuL2JhbGxvb24uYwo+PiArKysgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKPj4gQEAg
LTY4Nyw2ICs2ODcsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYmFsbG9vbl9hZGRfcmVnaW9uKHVu
c2lnbmVkIGxvbmcgc3RhcnRfcGZuLAo+PiAgCQkvKiB0b3RhbHJhbV9wYWdlcyBhbmQgdG90YWxo
aWdoX3BhZ2VzIGRvIG5vdAo+PiAgCQkgICBpbmNsdWRlIHRoZSBib290LXRpbWUgYmFsbG9vbiBl
eHRlbnNpb24sIHNvCj4+ICAJCSAgIGRvbid0IHN1YnRyYWN0IGZyb20gaXQuICovCj4+ICsJCV9f
U2V0UGFnZU9mZmxpbmUocGFnZSk7Cj4+ICAJCV9fYmFsbG9vbl9hcHBlbmQocGFnZSk7Cj4gCj4g
Cj4gR2l2ZW4gdGhhdCB3aGVuIGEgcGFnZSBpcyBhcHBlbmRlZCB0byBiYWxsb29uIGxpc3QgbmVl
ZCB0byBiZSBtYXJrZWQKPiBvZmZsaW5lIGFuZCwgY29udmVyc2VseSwgd2hlbiBhIHBhZ2UgaXMg
cmV0cmlldmVkIHRoZSBiaXQgc2hvdWxkIGJlCj4gY2xlYXJlZCBJIHdvbmRlciB3aGV0aGVyIGl0
J3MgYmV0dGVyIHRvIG1vdmUgU2V0L0NsZWFyUGFnZU9mZmxpbmUgdG8KPiBiYWxsb29uX2FwcGVu
ZC9yZXRyaWV2ZSgpLgoKWWVzLCB3ZSBjYW4gZG8gdGhhdCBhcyBhbiBhZGRvbiBwYXRjaCAoYW5k
IGFsc28gZ2V0IHJpZCBvZiBlaXRoZXIKX19iYWxsb29uX2FwcGVuZCgpIG9yIGJhbGxvb25fYXBw
ZW5kKCkgaWYgSSByZW1lbWJlciBjb3JyZWN0bHkpLgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRo
aWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
