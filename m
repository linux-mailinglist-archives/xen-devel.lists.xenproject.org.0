Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D1F218A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 23:21:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSTdj-0005jD-85; Wed, 06 Nov 2019 22:18:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RnWS=Y6=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iSTdh-0005j8-JQ
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 22:18:57 +0000
X-Inumbo-ID: 6b386e28-00e3-11ea-9631-bc764e2007e4
Received: from mout01.posteo.de (unknown [185.67.36.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b386e28-00e3-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 22:18:55 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id A71C9160061
 for <xen-devel@lists.xenproject.org>; Wed,  6 Nov 2019 23:18:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1573078733; bh=62ndjhmMzDeQH1Dd7kGaFbNzFoELAS5/fu6wdrVdQAk=;
 h=Subject:To:Cc:From:Date:From;
 b=gMLix5VZsq5tm/5VrP39m5MZm/vmWv5uxv2bGU/Fqlr/rru+wTlr2tr4NdNfcSz8v
 vJWsHxJd3bPpfQqjhztW2n2Bx446eqQnJsFNz8Ydz9AP12Evb3bq2LUDlpZNjMCBrt
 WabgzSz2yI4tYwa0hxI1FRJejSNOFEEYHh8IZdtPUjYbyzHQ5gg/5xLcVNWT0+YzhU
 LwXOIhXnvRl37vyTT0yMGdacYgBS7ugXAGsQaAT3nmmLDHC9yZxaXfN566K9tPkSc0
 uE3J/8Hy5KjM6QHqljNxwc+Lb4Wo20dplc+4gZBspGWsCEEjTmXEMcx6PcSM6S9ZE+
 QRAklpjQOwoSg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 477gt34GLVz6tm8;
 Wed,  6 Nov 2019 23:18:51 +0100 (CET)
To: George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <68abde10-8bdb-f193-92ff-afb31a357cce@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <d56c36fa-453f-8a9e-3cfe-3ba1c4503e4c@posteo.de>
Date: Wed, 6 Nov 2019 23:18:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <68abde10-8bdb-f193-92ff-afb31a357cce@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ryzen 3xxx plans for 4.13
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
Cc: Juergen Gross <jgross@suse.com>, Steven Haigh <netwiz@crc.id.au>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAxODo1MCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBNb2Rlcm4gV2luZG93
cyBndWVzdHMgKGF0IGxlYXN0IFdpbmRvd3MgMTAgYW5kIFdpbmRvd3MgU2VydmVyIDIwMTYpCj4g
Y3Jhc2ggd2hlbiBydW5uaW5nIHVuZGVyIFhlbiBvbiBBTUQgUnl6ZW4gM3h4eCBkZXNrdG9wLWNs
YXNzIGNwdXMgKGJ1dAo+IG5vdCB0aGUgY29ycmVzcG9uZGluZyBzZXJ2ZXIgY3B1cykuCgpJIG15
IHRlc3RzIHRoZSBzZWNvbmQgZ2VuZXJhdGlvbiBFUFlDIENQVXMgKGNvZGVuYW1lICJSb21lIikg
ZmFpbCAKZXhhY3RseSB0aGUgc2FtZSB3YXkgYXMgdGhlIFJ5emVuIDN4eHggZGVza3RvcCBDUFVz
LgoKUmVnYXJkcyBBbmRyZWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
