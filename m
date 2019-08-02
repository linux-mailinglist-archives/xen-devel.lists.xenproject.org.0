Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EBF7E7F2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 04:19:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htN6Y-0006L3-58; Fri, 02 Aug 2019 02:15:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QYwv=V6=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1htN6W-0006Ky-A3
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:15:36 +0000
X-Inumbo-ID: 68c17059-b4cb-11e9-8980-bc764e045a96
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 68c17059-b4cb-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com;
 s=alpha; 
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=UdiH+SNUmf2Saq9U46cSrSOnjz6eo1cFr/QyAgwk5rA=; 
 b=dPIks61Kagg6fA2BLOif4SkrN12SBq/38e7/D2APxPGFsXJtbF+ubagqTlk+AWPNF6aeugMAIsje/ctPJlXaSU38Cf6Au3bs+elTk2pwJttvWkDkEcSydNENth2Eh5fz77IaNZudYR3VVOx+21KQTWLb25f4bl51yKHyn6I9azxNwF+A5vveDGW0O90a1M9vK237ZbbwC4N0FB3M10vsPGvQKcT+1ALoqB8m0EZFkUqkYlHXLwYt+eB1LsJk24+3cbz4DzcjSVzxDGz1ceMu5ZA5HFHgujsvKoM0Z/gIPL6XkSPPUqN9hzl4l3ZP583vuq5n2J6p4X8rrrAs3rWvfQ==;
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
 (envelope-from <andy@strugglers.net>)
 id 1htN6P-00033I-Ff; Fri, 02 Aug 2019 02:15:29 +0000
Date: Fri, 2 Aug 2019 02:15:29 +0000
From: Andy Smith <andy@strugglers.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190802021529.GR12975@bitfolk.com>
References: <20190721200623.GJ11726@bitfolk.com>
 <7d518504-b12b-a6b9-dc37-7fdb00f8d632@suse.com>
 <c33f310d-7956-ba59-7df7-1cdc66aa1979@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c33f310d-7956-ba59-7df7-1cdc66aa1979@citrix.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false
Subject: Re: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAwMTowNjowM1BNICswMTAwLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+IE9uIDIyLzA3LzIwMTkgMTA6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4g
T24gMjEuMDcuMjAxOSAyMjowNiwgQW5keSBTbWl0aCB3cm90ZToKPiA+PiAoWEVOKSBBZGRpbmcg
Y3B1IDEgdG8gcnVucXVldWUgMAo+ID4+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCj4g
Pj4gKFhFTikgQ1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KPiA+PiAoWEVOKSBDUFUgMSBzdGlsbCBu
b3QgZGVhZC4uLgo+ID4+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCgpb4oCmXQoKPiBE
b2VzIHJldmVydGluZyBiYWNrIHRvIGNyZWRpdDEgbWFrZSB0aGUgaXNzdWUgZ28gYXdheT8KClll
cywgSSBkb24ndCBzZWUgdGhpcyB3aXRoIHNjaGVkPWNyZWRpdCwgc210PTAgYW5kIFNNVCBlbmFi
bGVkIGluCnRoZSBCSU9TOgoKKFhFTikgbWljcm9jb2RlOiBDUFUyIHVwZGF0ZWQgZnJvbSByZXZp
c2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVlLCBkYXRlID0gMjAxOS0wNC0wMiAKKFhFTikgbWlj
cm9jb2RlOiBDUFU0IHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVl
LCBkYXRlID0gMjAxOS0wNC0wMiAKKFhFTikgbWljcm9jb2RlOiBDUFU2IHVwZGF0ZWQgZnJvbSBy
ZXZpc2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVlLCBkYXRlID0gMjAxOS0wNC0wMiAKKFhFTikg
bWljcm9jb2RlOiBDUFU4IHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAweDIwMDAwNTcgdG8gMHgyMDAw
MDVlLCBkYXRlID0gMjAxOS0wNC0wMiAKKFhFTikgbWljcm9jb2RlOiBDUFUxMCB1cGRhdGVkIGZy
b20gcmV2aXNpb24gMHgyMDAwMDU3IHRvIDB4MjAwMDA1ZSwgZGF0ZSA9IDIwMTktMDQtMDIgCihY
RU4pIG1pY3JvY29kZTogQ1BVMTIgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAw
eDIwMDAwNWUsIGRhdGUgPSAyMDE5LTA0LTAyIAooWEVOKSBtaWNyb2NvZGU6IENQVTE0IHVwZGF0
ZWQgZnJvbSByZXZpc2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVlLCBkYXRlID0gMjAxOS0wNC0w
MiAKKFhFTikgQnJvdWdodCB1cCA4IENQVXMKKFhFTikgUGFya2VkIDggQ1BVcwoKVGhhbmtzLApB
bmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
