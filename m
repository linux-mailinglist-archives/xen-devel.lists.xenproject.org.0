Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A591A122FCD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:10:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihERy-00075B-NF; Tue, 17 Dec 2019 15:07:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gGJv=2H=list.ru=valor@srs-us1.protection.inumbo.net>)
 id 1ihERw-000756-6s
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:07:48 +0000
X-Inumbo-ID: f63d6c06-20de-11ea-a914-bc764e2007e4
Received: from smtp55.i.mail.ru (unknown [217.69.128.35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f63d6c06-20de-11ea-a914-bc764e2007e4;
 Tue, 17 Dec 2019 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=v+S74NDl9rqK7kuaTxfnmdpgwKqXUdzZzBKy1V9h0QI=; 
 b=TeTtSMnVJEpREDBrg+/oeKu5dMmsEpR0jQVMgYY0uHqzcItJjAebjOOTX0KCNTGCww2qIe6XB+1XV4xsS/joUaTVSl5Mln/bkuwxj59fIIlNWsZED8/qNxP0msemxJMNp64d7X3L5kaJYoNXQog9wL8sWfw1he3kPgqyGBMoQwY=;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1ihERk-0003lP-Lz; Tue, 17 Dec 2019 18:07:37 +0300
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <96a1376e-9464-f797-30fd-f6923efbf6c7@list.ru>
 <faaf6d0a-1ad4-63fd-f1c6-e6649f887e4d@citrix.com>
From: Sergey Kovalev <valor@list.ru>
Message-ID: <be57cae3-860b-68ba-d60e-929c151ae04a@list.ru>
Date: Tue, 17 Dec 2019 18:07:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <faaf6d0a-1ad4-63fd-f1c6-e6649f887e4d@citrix.com>
Content-Language: en-US
Authentication-Results: smtp55.i.mail.ru; auth=pass smtp.auth=valor@list.ru
 smtp.mailfrom=valor@list.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 0A44E481635329DB0E1AA8A03B392317D32E5E48865217369ED6AD9D9C178FB0FAAA86E2FFDEAF18F688BCB05C26794DFEA1EC70493DFBE8BA21DB544AAD631B7C1C090FEA28FA08D01305E52171C04A
X-7FA49CB5: 0D63561A33F958A5F5FF84C87796FA02D7A5DFF29FD813F0420F7130F2ECF6B38941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249D9CEF1C421DA94AF76E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8BA0BAE060704C561B3AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D725E5C173C3A84C3C74813BC7F81EC84129E95053A624152D2D576BCF940C736C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F2AF38021CC9F462D574AF45C6390F7469DAA53EE0834AAEE
X-Mailru-Sender: 9422C5FC7C00AE6974C3817D9F8DFD623B26823DCAD6551A5B3B206C5A62CBE26FA35EADE8FD784D625E4CECE70E6D50FB559BB5D741EB968B87F919F3BCAAF1715EC054F9A9AD9C0DA7A0AF5A3A8387
X-Mras: OK
Subject: Re: [Xen-devel] [XEN PATCH v1 1/1] x86/vm_event: add fast single
 step
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMjAxOSAxNzo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8xMi8yMDE5
IDE0OjQwLCBTZXJnZXkgS292YWxldiB3cm90ZToKPj4gT24gYnJlYWsgcG9pbnQgZXZlbnQgZWln
aHQgY29udGV4dCBzd2l0Y2hlcyBvY2N1cmVzLgo+Pgo+PiBXaXRoIGZhc3Qgc2luZ2xlIHN0ZXAg
aXQgaXMgcG9zc2libGUgdG8gc2hvcnRlbiBwYXRoIGZvciB0d28gY29udGV4dAo+PiBzd2l0Y2hl
cwo+PiBhbmQgZ2FpbiAzNSUgc3BlYWQtdXAuCj4+Cj4+IFdhcyB0ZXN0ZWQgb24gRGViaWFuIGJy
YW5jaCBvZiBYZW4gNC4xMi4gU2VlIGF0Ogo+PiBodHRwczovL2dpdGh1Yi5jb20vc2t2bC94ZW4v
dHJlZS9kZWJpYW4va25vcnJpZS80LjEyL2Zhc3Qtc2luZ2xlc3RlcAo+Pgo+PiBSZWJhc2VkIG9u
IG1hc3RlcjoKPj4gaHR0cHM6Ly9naXRodWIuY29tL3NrdmwveGVuL3RyZWUvZmFzdC1zaW5nbGVz
dGVwCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBLb3ZhbGV2IDx2YWxvckBsaXN0LnJ1Pgo+
IAo+IDM1JSBsb29rcyBsaWtlIGEgZ29vZCBudW1iZXIsIGJ1dCB3aGF0IGlzICJmYXN0IHNpbmds
ZSBzdGVwIj/CoCBBbGwgdGhpcwo+IGFwcGVhcnMgdG8gYmUgaXMgcGx1bWJpbmcgZm9yIHRvIGNh
dXNlIGFuIGFsdHAybSBzd2l0Y2ggb24gc2luZ2xlIHN0ZXAuCj4gCj4gfkFuZHJldwo+IAoKWW91
IGFyZSByaWdodC4gSSBzaG91bGQgcXVvdGVkICJmYXN0IHNpbmdsZSBzdGVwIi4KCk9yaWdpbmFs
IElOVCMzIHBhdGggaXMgbGlrZSB0aGlzIChpbiBQbGFuZ1VNTCk6CkBzdGFydHVtbApWTS0+WGVu
IDogRVhJVF9SRUFTT05fRVhDRVBUSU9OX05NSQpYZW4tPkxpYlZNSTogcmVxdWVzdChWTV9FVkVO
VF9SRUFTT05fU09GVFdBUkVfQlJFQUtQT0lOVCkKTGliVk1JLT5YZW46IHJlc3BvbnNlKHNpbmds
ZXN0ZXAgfCBhbHRwMm0pClhlbi0+Vk06ClZNLT5YZW46IEVYSVRfUkVBU09OX01PTklUT1JfVFJB
UF9GTEFHClhlbi0+TGliVk1JOiByZXF1ZXN0KFZNX0VWRU5UX1JFQVNPTl9TSU5HTEVTVEVQKQpM
aWJWTUktPlhlbjogcmVzcG9uc2UoYWx0cDJtKQpYZW4tPlZNOgpAZW5kdW1sCgpXaXRoIGZhc3Qg
c2luZ2xlIHN0ZXAgaXQgbG9va3MgbGlrZSB0aGlzOgpAc3RhcnR1bWwKVk0tPlhlbiA6IEVYSVRf
UkVBU09OX0VYQ0VQVElPTl9OTUkKWGVuLT5MaWJWTUk6IHJlcXVlc3QoVk1fRVZFTlRfUkVBU09O
X1NPRlRXQVJFX0JSRUFLUE9JTlQpCkxpYlZNSS0+WGVuOiByZXNwb25zZShmYXN0IHNpbmdsZXN0
ZXAgfCBhbHRwMm0pClhlbi0+Vk06ClZNLT5YZW46IEVYSVRfUkVBU09OX01PTklUT1JfVFJBUF9G
TEFHClhlbi0+WGVuOiBmYXN0IHNpbmdsZXN0ZXAKWGVuLT5WTToKQGVuZHVtbAoKU28gd2UganVz
dCBzdG9yZSBhbHRwMm0gaW5kZXggYW5kIHN3aXRjaCB0byBpdCBvbiBNVEYuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
