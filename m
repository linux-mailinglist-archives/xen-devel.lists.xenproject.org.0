Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF32FC104
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 08:56:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iV9wr-0002mL-Bl; Thu, 14 Nov 2019 07:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDJJ=ZG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iV9wq-0002mG-G1
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 07:53:48 +0000
X-Inumbo-ID: e324df36-06b3-11ea-a246-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e324df36-06b3-11ea-a246-12813bfff9fa;
 Thu, 14 Nov 2019 07:53:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 872ACB00A;
 Thu, 14 Nov 2019 07:53:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191113183641.2871-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7e1703b2-50a7-42ce-1b76-c0aefb206658@suse.com>
Date: Thu, 14 Nov 2019 08:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191113183641.2871-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/sched: Render sibling/core
 masks with %pbl to improve 'r' debugkey
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMTkgMTk6MzYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gRm9yIHN5c3RlbSB3aXRo
IGxhcmdlIG51bWJlcnMgb2YgQ1BVcywgdGhlICdyJyBkZWJ1Z2tleSBpcyB1bndpZWxkeS4gIFNp
YmxpbmcKPiBhbmQgY29yZSBtYXNrcyBhcmUgYSBzaW5nbGUgYmxvY2sgb2YgYWRqYWNlbnQgYml0
cywgc28gYXJlIHZhc3RseSBzaG9ydGVyIHRvCj4gcmVuZGVyIHdpdGggJXBibC4KPiAKPiBCZWZv
cmU6Cj4gICAgKFhFTikgQ1BVWzAwXSBucl9ydW49MCwgc29ydD0xNTcsIHNpYmxpbmc9MDAwMDAw
MDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAs
MDAwMDAwMDMsIGNvcmU9MDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsZmZmZmZm
ZmYsZmZmZmZmZmYsZmZmZmZmZmYsZmZmZmZmZmYKPiAgICAoWEVOKSBDUFVbMDFdIG5yX3J1bj0w
LCBzb3J0PTEzNzUwLCBzaWJsaW5nPTAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAw
LDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAzLCBjb3JlPTAwMDAwMDAwLDAwMDAw
MDAwLDAwMDAwMDAwLDAwMDAwMDAwLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZm
Cj4gICAgKFhFTikgQ1BVWzAyXSBucl9ydW49MCwgc29ydD0xODgsIHNpYmxpbmc9MDAwMDAwMDAs
MDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAw
MDAwMGMsIGNvcmU9MDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsZmZmZmZmZmYs
ZmZmZmZmZmYsZmZmZmZmZmYsZmZmZmZmZmYKPiAgICAoWEVOKSBDUFVbMDNdIG5yX3J1bj0wLCBz
b3J0PTEzNzMwLCBzaWJsaW5nPTAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAw
MDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDBjLCBjb3JlPTAwMDAwMDAwLDAwMDAwMDAw
LDAwMDAwMDAwLDAwMDAwMDAwLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmCj4g
Cj4gQWZ0ZXI6Cj4gICAgKFhFTikgQ1BVWzAwXSBucl9ydW49MCwgc29ydD0xMTY5LCBzaWJsaW5n
PXswLTF9LCBjb3JlPXswLTEyN30KPiAgICAoWEVOKSBDUFVbMDFdIG5yX3J1bj0wLCBzb3J0PTI0
ODgsIHNpYmxpbmc9ezAtMX0sIGNvcmU9ezAtMTI3fQo+ICAgIChYRU4pIENQVVswMl0gbnJfcnVu
PTAsIHNvcnQ9MTIxMCwgc2libGluZz17Mi0zfSwgY29yZT17MC0xMjd9Cj4gICAgKFhFTikgQ1BV
WzAzXSBucl9ydW49MCwgc29ydD0yNDc2LCBzaWJsaW5nPXsyLTN9LCBjb3JlPXswLTEyN30KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmVsZWFzZS1h
Y2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
