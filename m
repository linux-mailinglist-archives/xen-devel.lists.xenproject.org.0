Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD682292CB
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 10:19:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU5NR-0006HF-OE; Fri, 24 May 2019 08:16:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+yMq=TY=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hU5NQ-0006HA-9k
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 08:16:32 +0000
X-Inumbo-ID: 3995e2de-7dfc-11e9-a002-ff2b1f0bcb21
Received: from hermes2.dur.ac.uk (unknown [129.234.7.139])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3995e2de-7dfc-11e9-a002-ff2b1f0bcb21;
 Fri, 24 May 2019 08:16:26 +0000 (UTC)
Received: from smtphost1.dur.ac.uk (smtphost1.dur.ac.uk [129.234.7.143])
 by hermes2.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x4O8G3Yg001283;
 Fri, 24 May 2019 09:16:08 +0100
Received: from algedi.dur.ac.uk (algedi.dur.ac.uk [129.234.2.28])
 by smtphost1.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x4O8Fuf5027449
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 24 May 2019 09:15:56 +0100
Received: by algedi.dur.ac.uk (Postfix, from userid 2742)
 id 1FEBD282BA0; Fri, 24 May 2019 09:15:50 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
 by algedi.dur.ac.uk (Postfix) with ESMTP id D1E80281FFC;
 Fri, 24 May 2019 09:15:50 +0100 (BST)
Date: Fri, 24 May 2019 09:15:50 +0100 (BST)
From: M A Young <m.a.young@durham.ac.uk>
To: "Chen, Farrah" <farrah.chen@intel.com>
In-Reply-To: <1B925CC0CD9F3341B32D442251E7E1DC3E298BE7@SHSMSX104.ccr.corp.intel.com>
Message-ID: <alpine.LFD.2.21.1905240850290.15178@algedi.dur.ac.uk>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E298BE7@SHSMSX104.ccr.corp.intel.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-DurhamAcUk-MailScanner: Found to be clean, Found to be clean
X-DurhamAcUk-MailScanner-ID: x4O8G3Yg001283
Subject: Re: [Xen-devel] Compiling Xen error on RedHat8.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNCBNYXkgMjAxOSwgQ2hlbiwgRmFycmFoIHdyb3RlOgoKPiBIaSwKPiAKPiBJIG1l
dCBzb21lIHB5dGhvbiByZWxhdGVkIGlzc3VlcyB3aGVuIGJ1aWxkaW5nIFhlbiBvbiBSZWRIYXQ4
LjAuCj4gT24gUmVkSGF0OC4wLCB0aGUgZGVmYXVsdCBweXRob24gdmVyc2lvbiBpcyBweXRob24z
LCBhbmQgSSBmb3VuZCBYZW4gaGFzIHNvbWUgcHl0aG9uMiBjb2Rlcywgc28gSSB0cmllZCB0byBi
dWlsZCB4ZW4gdXNpbmcgcHl0aG9uMi4KPiBPbiBSZWRIYXQ4LjAsIG5vICJweXRob24iLCBqdXN0
ICJweXRob24yIiBhbmQgInB5dGhvbjMiOgo+IAo+IGxzIC91c3IvYmluL3B5dGhvbioKPiAvdXNy
L2Jpbi9weXRob24yICAgIC91c3IvYmluL3B5dGhvbjIuNy1jb25maWcgIC91c3IvYmluL3B5dGhv
bjMgICAgL3Vzci9iaW4vcHl0aG9uMy42LWNvbmZpZyAgL3Vzci9iaW4vcHl0aG9uMy42bS1jb25m
aWcgICAgICAgICAvdXNyL2Jpbi9weXRob24zLWNvbmZpZwo+IC91c3IvYmluL3B5dGhvbjIuNyAg
L3Vzci9iaW4vcHl0aG9uMi1jb25maWcgICAgL3Vzci9iaW4vcHl0aG9uMy42ICAvdXNyL2Jpbi9w
eXRob24zLjZtICAgICAgICAvdXNyL2Jpbi9weXRob24zLjZtLXg4Nl82NC1jb25maWcKPiAKPiBT
byBJIGNyZWF0ZWQgYSBzb2Z0IGxpbmsgInB5dGhvbiIgdG8gInB5dGhvbjIiOgo+IAo+IGxsIC91
c3IvYmluL3B5dGhvbgo+IGxyd3hyd3hyd3ggMSByb290IHJvb3QgMTYgTWF5IDI0IDEzOjA4IC91
c3IvYmluL3B5dGhvbiAtPiAvdXNyL2Jpbi9weXRob24yCj4gCj4gVGhlbiBJIHRyaWVkIHRvIGJ1
aWxkIHhlbjoKPiAKPiBjZCB4ZW4KPiAuL2NvbmZpZ3VyZSAtLWVuYWJsZS1vdm1mCj4gLi4uLi4u
Li4uCj4gY2hlY2tpbmcgZm9yIHVuaXN0ZC5oLi4uIHllcwo+IGNoZWNraW5nIGZvciBweXRob24t
Y29uZmlnLi4uIG5vCj4gY2hlY2tpbmcgUHl0aG9uLmggdXNhYmlsaXR5Li4uIHllcwo+IGNoZWNr
aW5nIFB5dGhvbi5oIHByZXNlbmNlLi4uIHllcwo+IGNoZWNraW5nIGZvciBQeXRob24uaC4uLiB5
ZXMKPiBjaGVja2luZyBmb3IgUHlBcmdfUGFyc2VUdXBsZS4uLiBubwo+IGNvbmZpZ3VyZTogZXJy
b3I6IFVuYWJsZSB0byBmaW5kIGEgc3VpdGFibGUgcHl0aG9uIGRldmVsb3BtZW50IGxpYnJhcnkK
PiBjb25maWd1cmU6IGVycm9yOiAuL2NvbmZpZ3VyZSBmYWlsZWQgZm9yIHRvb2xzCj4gCj4gSWYg
SSB1c2UgcHl0aG9uMyhjcmVhdGUgYSBzb2Z0IGxpbmsgInB5dGhvbiIgdG8gInB5dGhvbjMiICks
IGl0IHJlcG9ydGVkIHN5bnRheCBlcnJvci4KPiAKPiBjaGVja2luZyBmb3IgdW5pc3RkLmguLi4g
eWVzCj4gY2hlY2tpbmcgZm9yIHB5dGhvbi1jb25maWcuLi4gbm8KPiAgIEZpbGUgIjxzdHJpbmc+
IiwgbGluZSAxCj4gICAgIGltcG9ydCBkaXN0dXRpbHMuc3lzY29uZmlnOyAgICAgICAgIHByaW50
ICItSSIgKyBkaXN0dXRpbHMuc3lzY29uZmlnLmdldF9jb25maWdfdmFyKCJJTkNMVURFUFkiKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gU3lu
dGF4RXJyb3I6IGludmFsaWQgc3ludGF4Cj4gY2hlY2tpbmcgUHl0aG9uLmggdXNhYmlsaXR5Li4u
IG5vCj4gY2hlY2tpbmcgUHl0aG9uLmggcHJlc2VuY2UuLi4gbm8KPiBjaGVja2luZyBmb3IgUHl0
aG9uLmguLi4gbm8KPiBjb25maWd1cmU6IGVycm9yOiBVbmFibGUgdG8gZmluZCBQeXRob24gZGV2
ZWxvcG1lbnQgaGVhZGVycwo+IGNvbmZpZ3VyZTogZXJyb3I6IC4vY29uZmlndXJlIGZhaWxlZCBm
b3IgdG9vbHMKPiAKPiBUbyByZXNvbHZlICJVbmFibGUgdG8gZmluZCBhIHN1aXRhYmxlIHB5dGhv
biBkZXZlbG9wbWVudCBsaWJyYXJ5IiwgSSBpbnN0YWxsZWQgcHl0aG9uMi1kZXZlbCosIHB5dGhv
bjItbGliKiwgcHl0aG9uMy1kZXZlbCosIHB5dGhvbjMtbGliKiwgcHl0aG9uMi1zaXgsIHB5dGhv
bjMtc2l4LCBidXQgdGhpcyBlcnJvciBzdGlsbCBleGlzdHMuCj4gSW4gUmVkSGF0NywgdGhlc2Ug
cGFja2FnZXMgYXJlIGNhbGxlZCAicHl0aG9uLWRldmVsKiwgcHl0aG9uLWxpYioiLCBidXQgaW4g
UmVkSGF0OCwgdGhlc2UgcGFja2FnZXMgZG9uJ3QgZXhpc3RzLCBSZWRIYXQ4IGhhcyBvbmx5ICJw
eXRob24yLWRldmVsKiwgcHl0aG9uMi1saWIqLCBweXRob24zLWRldmVsKiwgcHl0aG9uMy1saWIq
IiwgbWF5YmUgWGVuIGNvZGVzIGNhbm5vdCBpZGVudGlmeSB0aGVtLgo+IAo+IERvIHlvdSBoYXZl
IGFueSBhZHZpY2Ugb24gYnVpbGRpbmcgWGVuIG9uIFJlZEhhdDg/IFRoYW5rcyBhIGxvdCEKCklm
IHlvdSB3YW50IHRvIGdvIGRvd24gdGhlIHB5dGhvbjMgcGF0aCB0aGVyZSBhcmUgYSBidW5kbGUg
b2YgcHl0aG9uMyAKcGFja2FnZXMgKGZyb20gdGhlIHhlbiBtYXN0ZXIgYnJhbmNoKSBpbiB0aGUg
RmVkb3JhIGJ1aWxkIG9mIHhlbi00LjEyLjAgYXQKaHR0cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5v
cmcvcnBtcy94ZW4vYmxvYi9tYXN0ZXIvZi94ZW4ucHl0aG9uMy5wYXRjaAp3aGljaCBtaWdodCBi
ZSB1c2VmdWwgdG8gYXBwbHkgb3IgcmVmZXIgdG8gZ2l2ZW4gdGhhdCBSSEVMIDggaXMgbG9vc2Vs
eSAKYmFzZWQgb24gRmVkb3JhLgoKQWxzbyBSSEVMIDggaGFzIHB5dGhvbjM2LWRldmVsIGFuZCBw
eXRob24yLWRldmVsIHdoaWNoIHlvdSBtaWdodCBuZWVkIGZvciAKYSBweXRob24zIG9yIHB5dGhv
bjIgYnVpbGQuCgoJTWljaGFlbCBZb3VuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
