Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20DD8C2BA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 23:04:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxdsy-00063F-7t; Tue, 13 Aug 2019 20:59:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e9Ym=WJ=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1hxdsw-00063A-CT
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 20:59:14 +0000
X-Inumbo-ID: 32376eee-be0d-11e9-bc3e-1faf2813c2b9
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32376eee-be0d-11e9-bc3e-1faf2813c2b9;
 Tue, 13 Aug 2019 20:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uxj0mYuGMCzEf4Ubv1R59dj4yGnMFgWoY5X8CJljA7k=; b=ioUXmWKONgWbfIsUBpSxECM2lb
 egquY47kWQ+PMWQGj/OsQ4Pv0tiB4e+AHa0RcR1hhERDaFuT/ToCk5DLSLLXNCO4y+iDofTu5Gh/y
 gmfp91q+0b6thlvZm+czhUeD0hSXNVDxz9zGe+JtghWRKcP3lrhOmhdmcbtwtRS3Z6iQ=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:49636
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1hxdsx-0003r6-Ux; Tue, 13 Aug 2019 22:59:16 +0200
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
 <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
 <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
 <070124d4-93b6-e0f5-ea69-bcac2b5da7e3@citrix.com>
 <d4fab4d9-f2d1-1c18-2582-1bd1283aa1cd@eikelenboom.it>
 <d0f9713d-0768-dca6-87b3-3d3d3d02207b@citrix.com>
 <90620f39-97bc-9528-0047-4b4584ca97b1@eikelenboom.it>
 <d8fc6365-525a-6495-e625-ecff2cf2e20e@citrix.com>
 <7a93257f-4199-8cae-57d4-a14555795275@eikelenboom.it>
 <ffa3eda9-73ac-6fc0-f886-8baa1c0e7968@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <38f67dc8-5c24-5dc5-7f90-47d4f0f6d4cc@eikelenboom.it>
Date: Tue, 13 Aug 2019 23:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ffa3eda9-73ac-6fc0-f886-8baa1c0e7968@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable staging build broken by pvshim patches.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDgvMjAxOSAxNTozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8wOC8yMDE5
IDEyOjUxLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+IE9uIDEzLzA4LzIwMTkgMTM6MjEs
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAwOS8wOC8yMDE5IDAwOjI4LCBTYW5kZXIgRWlr
ZWxlbmJvb20gd3JvdGU6Cj4+Pj4gT24gMDkvMDgvMjAxOSAwMDo0NCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4+Pj4gT24gMDgvMDgvMjAxOSAyMzozNCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3Rl
Ogo+Pj4+Pj4gT24gMDgvMDgvMjAxOSAyMzoxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+
PiBPbiAwOC8wOC8yMDE5IDIyOjE2LCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+Pj4+Pj4+
IE9uIDA4LzA4LzIwMTkgMjM6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAw
OC8wOC8yMDE5IDIxOjU5LCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+Pj4+Pj4+Pj4gSGkg
QW5kcmV3LAo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSXQgc2VlbXMgdGhlIHB2c2hpbSBwYXRjaGVz
IGluIHhlbi11bnN0YWJsZSBzdGFnaW5nIGJyZWFrIHRoZSBidWlsZCBvbiBteSBtYWNoaW5lLgo+
Pj4+Pj4+Pj4+IEkgY2xvbmVkIGEgZnJlc2ggdHJlZSB0byBiZSBzdXJlLCBoYXZlbid0IGNoZWNr
ZWQgd2hpY2ggb2YgdGhlIHR3byBjb21taXRzIGNhdXNlcyBpdDoKPj4+Pj4+Pj4+PiAwNjBmNGVl
ZTBmYjQwOGIzMTY1NDg3NzVhYjkyMWUxNmI3YWNkMGUwIG9yIDMyYjFkNjI4ODdkMDFmODVmMGMx
ZDJlMDEwM2Y2OWY3NGUxZjZmYTMKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IC0tCj4+Pj4+Pj4+Pj4g
U2FuZGVyCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gWyAtZCAv
L3Vzci9sb2NhbC9saWIveGVuL2Jvb3QgXSB8fCAvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rv
b2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLWQgLW0wNzU1IC1wIC8vdXNy
L2xvY2FsL2xpYi94ZW4vYm9vdAo+Pj4+Pj4+Pj4+IFsgLWQgLy91c3IvbG9jYWwvbGliL2RlYnVn
L3Vzci9sb2NhbC9saWIveGVuL2Jvb3QgXSB8fCAvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rv
b2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLWQgLW0wNzU1IC1wIC8vdXNy
L2xvY2FsL2xpYi9kZWJ1Zy91c3IvbG9jYWwvbGliL3hlbi9ib290Cj4+Pj4+Pj4+Pj4gWyAhIC1l
IGh2bWxvYWRlci9odm1sb2FkZXIgXSB8fCAvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xz
L2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1wIGh2bWxvYWRlci9o
dm1sb2FkZXIgLy91c3IvbG9jYWwvbGliL3hlbi9ib290Cj4+Pj4+Pj4+Pj4gL3Vzci9zcmMvbmV3
L3hlbi11bnN0YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1t
MDY0NCAtcCBzZWFiaW9zLWRpci9vdXQvYmlvcy5iaW4gLy91c3IvbG9jYWwvbGliL3hlbi9ib290
L3NlYWJpb3MuYmluCj4+Pj4+Pj4+Pj4gL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9m
aXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1tMDY0NCAtcCB4ZW4tZGlyL3hlbi1z
aGltIC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9vdC94ZW4tc2hpbQo+Pj4+Pj4+Pj4+IGluc3RhbGw6
IGNhbm5vdCBzdGF0ICd4ZW4tZGlyL3hlbi1zaGltJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQo+Pj4+Pj4+Pj4+IG1ha2VbNF06ICoqKiBbTWFrZWZpbGU6NTI6IGluc3RhbGxdIEVycm9yIDEK
Pj4+Pj4+Pj4+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbmV3L3hlbi11
bnN0YWJsZS90b29scy9maXJtd2FyZScKPj4+Pj4+Pj4+PiBtYWtlWzNdOiAqKiogWy91c3Ivc3Jj
L25ldy94ZW4tdW5zdGFibGUvdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MjM3OiBzdWJkaXItaW5z
dGFsbC1maXJtd2FyZV0gRXJyb3IgMgo+Pj4+Pj4+Pj4+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0
b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzJwo+Pj4+Pj4+Pj4+IG1ha2VbMl06
ICoqKiBbL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy8uLi90b29scy9SdWxlcy5tazoy
MzI6IHN1YmRpcnMtaW5zdGFsbF0gRXJyb3IgMgo+Pj4+Pj4+Pj4+IG1ha2VbMl06IExlYXZpbmcg
ZGlyZWN0b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzJwo+Pj4+Pj4+Pj4+IG1h
a2VbMV06ICoqKiBbTWFrZWZpbGU6NzM6IGluc3RhbGxdIEVycm9yIDIKPj4+Pj4+Pj4+PiBtYWtl
WzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scycK
Pj4+Pj4+Pj4+PiBtYWtlOiAqKiogW01ha2VmaWxlOjEzMTogaW5zdGFsbC10b29sc10gRXJyb3Ig
Mgo+Pj4+Pj4+Pj4gVGhhdCdzIHdlaXJkLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IERvIHlvdSBoYXZl
IHRoZSBmdWxsIGxvZz/CoCBUaGUgcmVhbCBmYWlsdXJlIHdhcyBzb21ld2hlcmUgZWFybGllciB3
aGVyZQo+Pj4+Pj4+Pj4geGVuLXNoaW0gZGlkbid0IGdldCBzdGFydGVkLgo+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+IH5BbmRyZXcKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEhtbSBpZiBmb3Jnb3QgYW5kIHRodXMg
Zm9yZ290IHRvIG1lbnRpb24gbXkgYnVpbGQgc2NyaXB0IGRpc2FibGVzIHNvbWUgc3R1ZmY6Cj4+
Pj4+Pj4+IC4vY29uZmlndXJlIC0tZGlzYWJsZS1xZW11LXRyYWRpdGlvbmFsIC0tZGlzYWJsZS1z
dHViZG9tIC0tZGlzYWJsZS1kb2NzIC0tZGlzYWJsZS1yb21iaW9zCj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IENvdWxkIGJlIHRoYXQgb25lIG9mIHRob3NlIGRvZXNuJ3Qgd29yayBhbnltb3JlLgo+Pj4+Pj4+
IFRoZSBvbmx5IGludGVyZXN0aW5nIG9uZSB3b3VsZCBiZSAtLWRpc2FibGUtcm9tYmlvcywgd2hp
Y2ggZG9lcyBtYWtlCj4+Pj4+Pj4gY2hhbmdlcyBpbiB0aGlzIGFyZWEgb2YgdGhlIGJ1aWxkLCBi
dXQgZXZlcnl0aGluZyBJIGNoYW5nZWQgd2FzIGluc2lkZQo+Pj4+Pj4+IHRoZSB4ZW4tZGlyLyBk
aXJlY3Rvcnkgc28gc2hvdWxkbid0IGludGVyYWN0Lj4KPj4+Pj4+PiB+QW5kcmV3Cj4+Pj4+Pj4K
Pj4+Pj4+IEl0IGluZGVlZCBzZWVtcyB0byBiZSBzb21lIGludGVyYWN0aW9uIHdpdGggLS1kaXNh
YmxlLXJvbWJpb3MsIHdpdGgganVzdAo+Pj4+Pj4gYSBwbGFpbiAuL2NvbmZpZ3VyZSBpdCBidWls
ZHMgZmluZS4KPj4+Pj4+IExvZ3Mgd2hlbiBidWlsZGluZyB3aXRoIC0tZGlzYWJsZS1yb21iaW9z
IGFyZSBhdHRhY2hlZC4KPj4+Pj4gUmlnaHQuwqAgU28gdGhlIGJ1aWxkIGl0c2VsZiB3b3Jrcywg
YnV0IHRoZSBzdWJzZXF1ZW50IGBtYWtlIGluc3RhbGxgIGZhaWxzLgo+Pj4+Pgo+Pj4+PiBBbmQg
dG8gY29uZmlybSwgYSBidWlsZCBvZiA4ZDU0YTZhZGYgKHRoZSBwYXJlbnQgb2YgbXkgZmlyc3Qg
c2hpbQo+Pj4+PiBjb21taXQpIHdvcmtzIGVudGlyZWx5IGZpbmU/Cj4+Pj4+Cj4+Pj4+IH5BbmRy
ZXcKPj4+Pj4KPj4+PiBKdXN0IHJlY2hlY2tlZCwgYW5kIHllcyB0aGF0IGJ1aWxkcyBhbmQgaW5z
dGFsbHMgZmluZSAod2l0aCAtLWRpc2FibGUtcm9tYmlvcykuCj4+PiBXaGljaCBiYXNlIGRpc3Ry
byBhcmUgeW91IHVzaW5nP8KgIEknbSB1bmFibGUgdG8gcmVwcm9kdWNlIGFueSBidWlsZAo+Pj4g
ZmFpbHVyZXMgbG9jYWxseS4KPj4+Cj4+PiB+QW5kcmV3Cj4+Pgo+PiBEZWJpYW4gMTAgLyBCdXN0
ZXIuCj4gCj4gRG8geW91IGhhdmUgeW91ciBmdWxsIGJ1aWxkIHNjcmlwdCBhdmFpbGFibGUsIGFu
ZCBpcyBpdCBidWlsdCBmdWxseSBmcm9tCj4gY2xlYW4/Cj4gCj4gSG93IGJlZWZ5IGlzIHlvdXIg
YnVpbGQgbWFjaGluZT/CoCBGcm9tIHRoZSBsb2dzIGl0IGlzIGNsZWFybHkgYSBwYXJhbGxlbAo+
IGJ1aWxkIGJ1dCBJIGRvbid0IHNlZSBhbiBleHBsaWNpdCAtaiBpbiB0aGUgbG9ncy4KPiAKPiBJ
IHN0aWxsIGNhbnQgcmVwcm9kdWNlIHRoaXMsIGV2ZW4gaW4gYSBidXN0ZXIgY29udGFpbmVyLgo+
IAo+IH5BbmRyZXcKPiAKClRoZSBtYWNoaW5lIGlzIG5vdCB0aGF0IGJlZWZ5LCBidXQgYSBzaXgg
Y29yZSBBTUQsIGJ1dCBubyBPT01zIG9yIGFueXRoaW5nLgoKVGhlIHNjcmlwdCBpcyBiYXNpY2Fs
bHkganVzdCBhbmQgc29tZSBjaGFuZ2luZyBvZiBkaXJzOgptYWtlIGNsZWFuICYmIC4vY29uZmln
dXJlIC0tZGlzYWJsZS1xZW11LXRyYWRpdGlvbmFsIC0tZGlzYWJsZS1zdHViZG9tIC0tZGlzYWJs
ZS1kb2NzIC0tZGlzYWJsZS1yb21iaW9zICYmIG1ha2UgLWo2ICYmIG1ha2UgLWo2IGluc3RhbGwK
CkkgdHJpZWQgc29tZSB2YXJpYW50cyBqdXN0IHBsYWluIGZyb20gdGhlIGNvbW1hbmQgbGluZSB3
aXRob3V0IGFueSBzY3JpcHRzOgpBZnRlciBhIGZyZXNoIGNsb25lIG9mIGN1cnJlbnQgeGVuLXVu
c3RhYmxlIHN0YWdpbmcgYnJhbmNoLgoKRmFpbHM6ICAgIG1ha2UgY2xlYW4gJiYgLi9jb25maWd1
cmUgLS1kaXNhYmxlLXJvbWJpb3MgJiYgbWFrZSAtajYgJiYgbWFrZSAtajYgaW5zdGFsbApGYWls
czogICAgbWFrZSBjbGVhbiAmJiAuL2NvbmZpZ3VyZSAtLWRpc2FibGUtcm9tYmlvcyAmJiBtYWtl
IC1qNCAmJiBtYWtlIC1qNCBpbnN0YWxsCkZhaWxzOiAgICBtYWtlIGNsZWFuICYmIC4vY29uZmln
dXJlIC0tZGlzYWJsZS1yb21iaW9zICYmIG1ha2UgLWoyICYmIG1ha2UgLWoyIGluc3RhbGwKU3Vj
Y2VlZHM6IG1ha2UgY2xlYW4gJiYgLi9jb25maWd1cmUgLS1kaXNhYmxlLXJvbWJpb3MgJiYgbWFr
ZSAmJiBtYWtlIGluc3RhbGwKClN1Y2NlZWRzOiBtYWtlIGNsZWFuICYmIC4vY29uZmlndXJlICYm
IG1ha2UgLWoyICYmIG1ha2UgLWoyIGluc3RhbGwKClNvIHRvIHJlY2FwOgogICAgU29tZSBob3cg
b24gbXkgc3lzdGVlbSAoRGViaWFuIGJ1c3Rlcikgd2l0aCBteSBidWlsZCB0b29scyBhIHBhcmFs
bGVsIGJ1aWxkIHdpdGggLS1kaXNhYmxlLXJvbWJpb3MgZmFpbHMuCiAgICBBIG5vbiBwYXJhbGxl
bCBidWlsZCB3aXRoIC0tZGlzYWJsZS1yb21iaW9zIHN1Y2NlZWRzLgogICAgQW5kIHJldmVydGlu
ZyB0aGUgInB2IHNoaW0iIHBhdGNoZXMgbWFrZXMgaXQgYnVpbGQgYWdhaW4gaW4gcGFyYWxsZWwg
d2l0aCAtLWRpc2FibGUtcm9tYmlvcy4KCkFuZCBsYXN0IGJ1dCBub3QgbGVhc3QgaXQgc2VlbXMg
dG8gd29yayBvbiB5b3VyIHN5c3RlbXMgd2l0aCB5b3VyIGJ1aWxkIHRvb2xzLiAKClNvIEkgd291
bGQgZW5kIHVwIHdpdGggZWl0aGVyOgogICAtIGEgZGlmZmVyZW5jZSBpbiBidWlsZCB0b29scyA/
CiAgIC0gYW5kL29yIHNvbWUgdW5leHBlY3RlZCBkZXBlbmRlbmN5IGluIHRoZSBjb2RlIHRoYXQg
Y2FuIGdvIHdyb25nIHRpbWluZyB3aXNlIGluIGEgcGFyYWxsZWwgYnVpbGQgPwoKLS0KU2FuZGVy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
