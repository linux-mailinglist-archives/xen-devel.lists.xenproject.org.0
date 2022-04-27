Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D48511837
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315029.533352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhbP-0003tn-2G; Wed, 27 Apr 2022 13:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315029.533352; Wed, 27 Apr 2022 13:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhbO-0003rM-Va; Wed, 27 Apr 2022 13:21:06 +0000
Received: by outflank-mailman (input) for mailman id 315029;
 Wed, 27 Apr 2022 13:21:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDBb=VF=dingwall.me.uk=james-xen@srs-se1.protection.inumbo.net>)
 id 1njhbN-0003rG-Kb
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:21:05 +0000
Received: from smarthost01a.ixn.mail.zen.net.uk
 (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df779714-c62c-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 15:20:57 +0200 (CEST)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.ixn.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james-xen@dingwall.me.uk>)
 id 1njhbG-0002DE-FM; Wed, 27 Apr 2022 13:20:58 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 2823F38D83F;
 Wed, 27 Apr 2022 14:20:58 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id ChNz8o_Pf73n; Wed, 27 Apr 2022 14:20:57 +0100 (BST)
Received: from webmail.private.dingwall.me.uk (apache0.xen.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:123])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTPSA id C8E0E38D83A;
 Wed, 27 Apr 2022 14:20:57 +0100 (BST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: df779714-c62c-11ec-8fc2-03012f2f19d4
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_d67c980548a7c71900f7f58f949ecdb6"
Content-Transfer-Encoding: 7bit
Date: Wed, 27 Apr 2022 14:20:53 +0100
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, pdurrant@amazon.com
Subject: Re: [PATCH] fix invalid frontend path for set_mtu
In-Reply-To: <YmkKGVa1NeKBQV9M@perard.uk.xensource.com>
References: <20220301093513.GA3187840@dingwall.me.uk>
 <YlV4lXZHz52xPBzt@perard.uk.xensource.com>
 <20220419120418.GA232637@dingwall.me.uk>
 <YmkKGVa1NeKBQV9M@perard.uk.xensource.com>
Message-ID: <19d42d2f0981f0187508612011b847af@dingwall.me.uk>
X-Sender: james-xen@dingwall.me.uk
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

--=_d67c980548a7c71900f7f58f949ecdb6
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

On 2022-04-27 10:17, Anthony PERARD wrote:
> On Tue, Apr 19, 2022 at 01:04:18PM +0100, James Dingwall wrote:
>> Thank you for your feedback.  I've updated the patch as suggested.  
>> I've also
>> incorporated two other changes, one is a simple style change for 
>> consistency,
>> the other is to change a the test for a valid mtu from > 0 to >= 68.  
>> I can
>> resubmit the original patch if either of these are a problem.
> 
> The style change is fine, but I'd rather have the change to the
> mtu check in a different patch.
> 
> Otherwise, the patch looks better, thanks.

Here is a revised version of the patch that removes the mtu change.

Thanks,
James
--=_d67c980548a7c71900f7f58f949ecdb6
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=set-mtu-frontend-path.diff
Content-Disposition: attachment;
 filename=set-mtu-frontend-path.diff;
 size=1928

Y29tbWl0IGY2ZWM5MjcxNzUyMmU3NGI0Y2MzYWE0MTYwYjhhZDY4ODRlMGI1MGMKQXV0aG9yOiBK
YW1lcyBEaW5nd2FsbCA8amFtZXNAZGluZ3dhbGwubWUudWs+CkRhdGU6ICAgVHVlIEFwciAxOSAx
Mjo0NTozMSAyMDIyICswMTAwCgogICAgVGhlIHNldF9tdHUoKSBmdW5jdGlvbiBvZiB4ZW4tbmV0
d29yay1jb21tb24uc2ggY3VycmVudGx5IGhhcyB0aGlzIGNvZGU6CiAgICAKICAgICAgICAgICAg
aWYgWyAke3R5cGVfaWZ9ID0gdmlmIF0KICAgICAgICAgICAgdGhlbgogICAgICAgICAgICAgICAg
bG9jYWwgZGV2Xz0ke2RldiN2aWZ9CiAgICAgICAgICAgICAgICBsb2NhbCBkb21pZD0ke2Rldl8l
Lip9CiAgICAgICAgICAgICAgICBsb2NhbCBkZXZpZD0ke2Rldl8jKi59CiAgICAKICAgICAgICAg
ICAgICAgIGxvY2FsIEZST05URU5EX1BBVEg9Ii9sb2NhbC9kb21haW4vJGRvbWlkL2RldmljZS92
aWYvJGRldmlkIgogICAgCiAgICAgICAgICAgICAgICB4ZW5zdG9yZV93cml0ZSAiJEZST05URU5E
X1BBVEgvbXR1IiAke210dX0KICAgICAgICAgICAgZmkKICAgIAogICAgVGhpcyB3b3JrcyBmaW5l
IGlmIHRoZSBkZXZpY2UgaGFzIGl0cyBkZWZhdWx0IG5hbWUgYnV0IGlmIHRoZSB4ZW4gY29uZmln
CiAgICBkZWZpbmVzIHRoZSB2aWZuYW1lIHBhcmFtZXRlciB0aGUgRlJPTlRFTkRfUEFUSCBpcyBp
bmNvcnJlY3RseSBjb25zdHJ1Y3RlZC4KICAgIExlYXJuIHRoZSBmcm9udGVuZCBwYXRoIGJ5IHJl
YWRpbmcgdGhlIGFwcHJvcHJpYXRlIHZhbHVlIGZyb20gdGhlIGJhY2tlbmQuCiAgICAKICAgIEFs
c28gY2hhbmdlIHVzZSBvZiBgLi4uYCB0byAkKC4uLikgZm9yIGEgY29uc2lzdGVudCBzdHlsZSBp
biB0aGUgc2NyaXB0LgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBEaW5nd2FsbCA8amFt
ZXNAZGluZ3dhbGwubWUudWs+CgpkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC94ZW4t
bmV0d29yay1jb21tb24uc2ggYi90b29scy9ob3RwbHVnL0xpbnV4L3hlbi1uZXR3b3JrLWNvbW1v
bi5zaAppbmRleCA0MmZhNzA0ZThkLi43YTYzMzA4YTllIDEwMDY0NAotLS0gYS90b29scy9ob3Rw
bHVnL0xpbnV4L3hlbi1uZXR3b3JrLWNvbW1vbi5zaAorKysgYi90b29scy9ob3RwbHVnL0xpbnV4
L3hlbi1uZXR3b3JrLWNvbW1vbi5zaApAQCAtMTcxLDcgKzE3MSw3IEBAIHNldF9tdHUgKCkgewog
ICAgIGxvY2FsIG10dT0kKHhlbnN0b3JlX3JlYWRfZGVmYXVsdCAiJFhFTkJVU19QQVRIL210dSIg
IiIpCiAgICAgaWYgWyAteiAiJG10dSIgXQogICAgIHRoZW4KLSAgICAgICAgbXR1PSJgaXAgbGlu
ayBzaG93IGRldiAke2JyaWRnZX18IGF3ayAnL210dS8geyBwcmludCAkNSB9J2AiCisgICAgICAg
IG10dT0iJChpcCBsaW5rIHNob3cgZGV2ICR7YnJpZGdlfXwgYXdrICcvbXR1LyB7IHByaW50ICQ1
IH0nKSIKICAgICAgICAgaWYgWyAtbiAiJG10dSIgXQogICAgICAgICB0aGVuCiAgICAgICAgICAg
ICBsb2cgZGVidWcgIiRicmlkZ2UgTVRVIGlzICRtdHUiCkBAIC0xODQsMTEgKzE4NCw3IEBAIHNl
dF9tdHUgKCkgewogCiAgICAgICAgIGlmIFsgJHt0eXBlX2lmfSA9IHZpZiBdCiAgICAgICAgIHRo
ZW4KLSAgICAgICAgICAgIGxvY2FsIGRldl89JHtkZXYjdmlmfQotICAgICAgICAgICAgbG9jYWwg
ZG9taWQ9JHtkZXZfJS4qfQotICAgICAgICAgICAgbG9jYWwgZGV2aWQ9JHtkZXZfIyoufQotCi0g
ICAgICAgICAgICBsb2NhbCBGUk9OVEVORF9QQVRIPSIvbG9jYWwvZG9tYWluLyRkb21pZC9kZXZp
Y2UvdmlmLyRkZXZpZCIKKyAgICAgICAgICAgIGxvY2FsIEZST05URU5EX1BBVEg9IiQoeGVuc3Rv
cmVfcmVhZCAiJFhFTkJVU19QQVRIL2Zyb250ZW5kIikiCiAKICAgICAgICAgICAgIHhlbnN0b3Jl
X3dyaXRlICIkRlJPTlRFTkRfUEFUSC9tdHUiICR7bXR1fQogICAgICAgICBmaQo=
--=_d67c980548a7c71900f7f58f949ecdb6--

