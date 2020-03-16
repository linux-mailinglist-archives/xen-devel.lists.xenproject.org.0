Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC21866EA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 09:50:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDlP0-0003Hp-9f; Mon, 16 Mar 2020 08:47:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hZOJ=5B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jDlOy-0003Hf-Q7
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 08:47:12 +0000
X-Inumbo-ID: ba0aada0-6762-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba0aada0-6762-11ea-a6c1-bc764e2007e4;
 Mon, 16 Mar 2020 08:47:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6D64AF82;
 Mon, 16 Mar 2020 08:47:10 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Pawe=c5=82_Marczewski?= <pawel@invisiblethingslab.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8cddf6ca-277f-6317-9bf6-1c2202c6a651@suse.com>
Date: Mon, 16 Mar 2020 09:47:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Commit 0d99c909d7e1 introduced bug
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDBkOTljOTA5ZDdlMSAoImxpYnhsOiB3YWl0IGZvciBjb25zb2xlIHBhdGggYmVmb3Jl
IGZpcmluZwpjb25zb2xlX2F2YWlsYWJsZSIpIGludHJvZHVjZWQgYSBidWc6IHdoZW4gdHJ5aW5n
IHRvIHN0YXJ0IGEgZ3Vlc3QKZnJvbSBhIGNvbmZpZyBmaWxlIHdoZW4gaXQgaXMgYWxyZWFkeSBy
dW5uaW5nLCBJIGdldDoKCnhsIGNyZWF0ZSAtYyBtaW5pb3MucHYKUGFyc2luZyBjb25maWcgZnJv
bSBtaW5pb3MucHYKbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzo4MTpsaWJ4bF9fZG9tYWlu
X3JlbmFtZTogRG9tYWluIDg6RG9tYWluIAp3aXRoIG5hbWUgIm1pbmlvcyIgYWxyZWFkeSBleGlz
dHMuCmxpYnhsOiBlcnJvcjogbGlieGxfY3JlYXRlLmM6MTE4MDppbml0aWF0ZV9kb21haW5fY3Jl
YXRlOiBEb21haW4gCjg6Y2Fubm90IG1ha2UgZG9tYWluOiAtNgpTZWdtZW50YXRpb24gZmF1bHQg
KGNvcmUgZHVtcGVkKQoKVGhlIHNlZ2ZhdWx0IGlzIGR1ZSB0bzoKCiMwICAweDAwMDA3ZmZmZjcw
MTI3ZDEgaW4gX19zdHJsZW5fYXZ4MiAoKSBmcm9tIC9saWI2NC9saWJjLnNvLjYKIzEgIDB4MDAw
MDdmZmZmNjYzODVmOCBpbiB4c191bndhdGNoIChoPTB4NjQ0MTQwLCBwYXRoPTB4MCwgCnRva2Vu
PTB4NjQ3Y2MwICIwLzAiKSBhdCB4cy5jOjk5MwojMiAgMHgwMDAwN2ZmZmY3OTA3YWFkIGluIGxp
YnhsX19ldl94c3dhdGNoX2RlcmVnaXN0ZXIgKGdjPTB4NjQ1M2QwLCAKdz0weDY0NzllMCkgYXQg
bGlieGxfZXZlbnQuYzo4NTMKIzMgIDB4MDAwMDdmZmZmNzhmN2IyMiBpbiBsaWJ4bF9feHN3YWl0
X3N0b3AgKGdjPTB4NjQ1M2QwLCAKeHN3YT0weDY0Nzk1OCkgYXQgbGlieGxfYW91dGlscy5jOjM0
CiM0ICAweDAwMDA3ZmZmZjc4Y2RlMDkgaW4gZG9tY3JlYXRlX2NvbXBsZXRlIChlZ2M9MHg3ZmZm
ZmZmZmQ5MjAsIApkY3M9MHg2NDU0OTAsIHJjPS0zKSBhdCBsaWJ4bF9jcmVhdGUuYzoxODYwCgoj
IyMjIyMjIF4gdGhpcyBjYWxsIHRvIGxpYnhsX194c3dhaXRfc3RvcCgpIHdhcyBhZGRlZCB3aXRo
IHNhaWQgY29tbWl0CgojNSAgMHgwMDAwN2ZmZmY3OGNiZmFlIGluIGluaXRpYXRlX2RvbWFpbl9j
cmVhdGUgKGVnYz0weDdmZmZmZmZmZDkyMCwgCmRjcz0weDY0NTQ5MCkgYXQgbGlieGxfY3JlYXRl
LmM6MTI0NAojNiAgMHgwMDAwN2ZmZmY3OGNlMzY4IGluIGRvX2RvbWFpbl9jcmVhdGUgKGN0eD0w
eDY0Mzg2MCwgCmRfY29uZmlnPTB4N2ZmZmZmZmZkYWQwLCBkb21pZD0weDdmZmZmZmZmZGZhYywg
cmVzdG9yZV9mZD0tMSwgCnNlbmRfYmFja19mZD0tMSwgcGFyYW1zPTB4MCwKICAgICBhb19ob3c9
MHgwLCBhb3BfY29uc29sZV9ob3c9MHg3ZmZmZmZmZmRhNjApIGF0IGxpYnhsX2NyZWF0ZS5jOjE5
NzcKIzcgIDB4MDAwMDdmZmZmNzhjZWZkZiBpbiBsaWJ4bF9kb21haW5fY3JlYXRlX25ldyAoY3R4
PTB4NjQzODYwLCAKZF9jb25maWc9MHg3ZmZmZmZmZmRhZDAsIGRvbWlkPTB4N2ZmZmZmZmZkZmFj
LCBhb19ob3c9MHgwLCAKYW9wX2NvbnNvbGVfaG93PTB4N2ZmZmZmZmZkYTYwKQogICAgIGF0IGxp
YnhsX2NyZWF0ZS5jOjIxOTIKIzggIDB4MDAwMDAwMDAwMDQyOGZjOCBpbiBjcmVhdGVfZG9tYWlu
IChkb21faW5mbz0weDdmZmZmZmZmZTBiMCkgYXQgCnhsX3ZtY29udHJvbC5jOjkzNgojOSAgMHgw
MDAwMDAwMDAwNDI5YzRkIGluIG1haW5fY3JlYXRlIChhcmdjPTMsIGFyZ3Y9MHg3ZmZmZmZmZmUy
OTApIGF0IAp4bF92bWNvbnRyb2wuYzoxMjQ2CiMxMCAweDAwMDAwMDAwMDA0MGFkMGIgaW4gbWFp
biAoYXJnYz0zLCBhcmd2PTB4N2ZmZmZmZmZlMjkwKSBhdCB4bC5jOjQyNQoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
