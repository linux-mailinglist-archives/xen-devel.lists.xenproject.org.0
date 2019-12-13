Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CEF11E6D9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:40:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifn07-0003M0-4T; Fri, 13 Dec 2019 15:37:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO2F=2D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ifn05-0003Lh-Ic
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:37:05 +0000
X-Inumbo-ID: 6769ed24-1dbe-11ea-8f3f-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6769ed24-1dbe-11ea-8f3f-12813bfff9fa;
 Fri, 13 Dec 2019 15:37:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so7116637wrt.6
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2019 07:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RuBDdJA3WArZMNIG2S4lYxaVfWal21Se6JnZ83S6O1U=;
 b=SnUJjJQsBhCAhIVgHS+AFUAq74WKNcVCt+sORhSk3is56h+u5wlruYa5m26tUMJnjf
 YgoMDk1mSxtRRaLtbpK0iBJSCYvMi3vkeNvnR2cahSM69C1y+P6NJ6dKnsvwjnlHTlRI
 VWssaRS1ku9jDC8FxIv6zS6eDuYoabeQXOG+3lD3h3vkeTyc4JFbw0VrsjEvcTSFNDm+
 0yVR+tyAeTWxvT7iEKjW7UB1ADOv12clzH5xy6GARbHmfeGCtP+iM913/Kx3tmY+ZY0g
 EssBBbuLLlJNUGaOXLR2fumxvbTNs8Q/ZN9niobH8KPLX6RqqV3xNyX0TKeY8/WIfnJC
 RN8Q==
X-Gm-Message-State: APjAAAXPOZbjgVZOWQaxUBMfLLNVHAbcN7xbYlKzpKO0ebwqULxPNvF0
 bdpgYL15khuhIMboOi5/o2w=
X-Google-Smtp-Source: APXvYqwrHrtJOUMQQARmqLkTxvNK37BPGqawRIr9TeEekLWqDyxN8/33SFD2K5L3h4kugnuCfuK7pw==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr13725540wrw.193.1576251419958; 
 Fri, 13 Dec 2019 07:36:59 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id o194sm626787wme.45.2019.12.13.07.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 07:36:59 -0800 (PST)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
 <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
 <24051.30893.31444.319978@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7a0ef296-eb50-fbda-63e2-8d890fad5111@xen.org>
Date: Fri, 13 Dec 2019 15:36:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <24051.30893.31444.319978@mariner.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

K0FudGhvbnkKCk9uIDEzLzEyLzIwMTkgMTE6NDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IEp1bGll
biBHcmFsbCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi00LjEzLXRlc3RpbmcgdGVzdF0g
MTQ0NzM2OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPj4gQU1EIFNlYXR0bGUgYm9hcmRzIChsYXh0
b24qKSBhcmUga25vd24gdG8gZmFpbCBib290aW5nIHRpbWUgdG8gdGltZQo+PiBiZWNhdXNlIG9m
IFBDSSB0cmFpbmluZyBpc3N1ZS4gV2UgaGF2ZSB3b3JrYXJvdW5kIGZvciBpdCAoaW52b2x2aW5n
Cj4+IGxvbmdlciBwb3dlciBjeWNsZSkgYnV0IHRoaXMgaXMgbm90IDEwMCUgcmVsaWFibGUuCj4g
Cj4gVGhpcyB3YXNuJ3QgYSBwb3dlciBjeWNsZS4gIEl0IHdhcyBhIHNvZnR3YXJlLWluaXRpYXRl
ZCByZWJvb3QuICBJdAo+IGRvZXMgYXBwZWFyIHRvIGhhbmcgaW4gdGhlIGZpcm13YXJlIHNvbWV3
aGVyZS4gIERvIHdlIGV4cGVjdCB0aGUgcGNpCj4gdHJhaW5pbmcgaXNzdWUgdG8gb2NjdXIgaW4g
dGhpcyBjYXNlID8KClRoZSBQQ0kgdHJhaW5pbmcgaGFwcGVucyBhdCBldmVyeSByZXNldCAoaW5j
bHVkaW5nIHNvZnR3YXJlKS4gU28gSSBtYXkgCmhhdmUgY29uZnVzZWQgdGhlIHdvcmthcm91bmQg
Zm9yIGZpcm13YXJlIGNvcnJ1cHRpb24gd2l0aCB0aGUgUENJIAp0cmFpbmluZy4gV2UgZGVmaW5p
dGVseSBoYXZlIGEgd29ya2Zyb3VuZCBmb3IgdGhlIGZvcm1lci4KCkZvciB0aGUgbGF0dGVyLCBJ
IGNhbid0IHJlbWVtYmVyIGlmIHdlIGRpZCB1c2UgYSBuZXcgZmlybXdhcmUgb3IganVzdCAKaG9w
ZSBpdCBkb2VzIG5vdCBoYXBwZW4gb2Z0ZW4uCgpJIHRoaW5rIHdlIGhhZCBhIHRocmVhZCBvbiBp
bmZyYUAgYWJvdXQgdGhlIHdvcmthcm91bmQgc29tZSB0aW1lcyBsYXN0IAp5ZWFyLiBTYWRseSB0
aGlzIHdhcyBzZW50IG9uIG15IEFybSBlLW1haWwgYWRkcmVzcyBhbmQgSSBkaWRuJ3QgYXJjaGl2
ZSAKaXQgYmVmb3JlIGxlYXZpbmcgOiguIENhbiB5b3UgaGF2ZSBhIGxvb2sgaWYgeW91IGNhbiBm
aW5kIHRoZSB0aHJlYWQ/Cgo+IAo+Pj4+ICDCoCB0ZXN0LWFybWhmLWFybWhmLXhsLXZoZMKgwqDC
oMKgwqAgMTggbGVhay1jaGVjay9jaGVja8KgwqDCoMKgwqDCoMKgwqAgZmFpbCBSRUdSLgo+Pj4+
IHZzLiAxNDQ2NzMKPj4+Cj4+PiBUaGF0IG9uZSBpcyBzdHJhbmdlLiBBIHFlbXUgcHJvY2VzcyBz
ZWVtcyB0byBoYXZlIGhhdmUgZGllZCBwcm9kdWNpbmcKPj4+IGEgY29yZSBmaWxlLCBidXQgSSBj
b3VsZG4ndCBmaW5kIGFueSBsb2cgY29udGFpbmluZyBhbnkgb3RoZXIgaW5kaWNhdGlvbgo+Pj4g
b2YgYSBjcmFzaGVkIHByb2dyYW0uCj4+Cj4+IEkgaGF2ZW4ndCBmb3VuZCBhbnl0aGluZyBpbnRl
cmVzdGluZyBpbiB0aGUgbG9nLiBASWFuIGNvdWxkIHlvdSBzZXQgdXAKPj4gYSByZXBybyBmb3Ig
dGhpcz8KPiAKPiBUaGVyZSBpcyBzb21lIGhlaXNlbmJ1ZyB3aGVyZSBxZW11IGNyYXNoZXMgd2l0
aCB2ZXJ5IGxvdyBwcm9iYWJpbGl0eS4KPiAoSSBmb3JnZXQgd2hldGhlciBvbmx5IG9uIGFybSBv
ciBvbiB4ODYgdG9vKS4gIFRoaXMgaGFzIGJlZW4gYXJvdW5kCj4gZm9yIGEgbGl0dGxlIHdoaWxl
LiAgSSBkb3VidCB0aGlzIHBhcnRpY3VsYXIgZmFpbHVyZSB3aWxsIGJlCj4gcmVwcm9kdWNpYmxl
LgkKCkkgY2FuJ3QgcmVtZW1iZXIgc3VjaCBidWcgYmVlbiByZXBvcnRlZCBvbiBBcm0gYmVmb3Jl
LiBBbnl3YXksIEkgbWFuYWdlZCAKdG8gZ2V0IHRoZSBzdGFjayB0cmFjZSBmcm9tIGdkYjoKCkNv
cmUgd2FzIGdlbmVyYXRlZCBieSBgL3Vzci9sb2NhbC9saWIveGVuL2Jpbi9xZW11LXN5c3RlbS1p
Mzg2IAoteGVuLWRvbWlkIDEgLWNoYXJkZXYgc29ja2V0LGlkPWxpYnhsLWMnLgpQcm9ncmFtIHRl
cm1pbmF0ZWQgd2l0aCBzaWduYWwgU0lHU0VHViwgU2VnbWVudGF0aW9uIGZhdWx0LgojMCAgMHgw
MDYzNDJiZSBpbiB4ZW5fYmxvY2tfaGFuZGxlX3JlcXVlc3RzIChkYXRhcGxhbmU9MHgxMDhlNjAw
KSBhdCAKL2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3MzYuYnVpbGQtYXJtaGYveGVuL3Rvb2xzL3Fl
bXUteGVuLWRpci9ody9ibG9jay9kYXRhcGxhbmUveGVuLWJsb2NrLmM6NTMxCjUzMSAKL2hvbWUv
b3NzdGVzdC9idWlsZC4xNDQ3MzYuYnVpbGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVuLWRpci9o
dy9ibG9jay9kYXRhcGxhbmUveGVuLWJsb2NrLmM6IApObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
LgpbQ3VycmVudCB0aHJlYWQgaXMgMSAoTFdQIDE5ODcpXQooZ2RiKSBidAojMCAgMHgwMDYzNDJi
ZSBpbiB4ZW5fYmxvY2tfaGFuZGxlX3JlcXVlc3RzIChkYXRhcGxhbmU9MHgxMDhlNjAwKSBhdCAK
L2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3MzYuYnVpbGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVu
LWRpci9ody9ibG9jay9kYXRhcGxhbmUveGVuLWJsb2NrLmM6NTMxCiMxICAweDAwNjM0NDdjIGlu
IHhlbl9ibG9ja19kYXRhcGxhbmVfZXZlbnQgKG9wYXF1ZT0weDEwOGU2MDApIGF0IAovaG9tZS9v
c3N0ZXN0L2J1aWxkLjE0NDczNi5idWlsZC1hcm1oZi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3
L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxvY2suYzo2MjYKIzIgIDB4MDA4ZDAwNWMgaW4geGVuX2Rl
dmljZV9wb2xsIChvcGFxdWU9MHgxMDdhM2IwKSBhdCAKL2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3
MzYuYnVpbGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVuLWRpci9ody94ZW4veGVuLWJ1cy5jOjEw
NzcKIzMgIDB4MDBhNDE3NWMgaW4gcnVuX3BvbGxfaGFuZGxlcnNfb25jZSAoY3R4PTB4MTA3OTcw
OCwgCnRpbWVvdXQ9MHhiMWJhMTdmOCkgYXQgCi9ob21lL29zc3Rlc3QvYnVpbGQuMTQ0NzM2LmJ1
aWxkLWFybWhmL3hlbi90b29scy9xZW11LXhlbi1kaXIvdXRpbC9haW8tcG9zaXguYzo1MjAKIzQg
IDB4MDBhNDE4MjYgaW4gcnVuX3BvbGxfaGFuZGxlcnMgKGN0eD0weDEwNzk3MDgsIG1heF9ucz04
MDAwLCAKdGltZW91dD0weGIxYmExN2Y4KSBhdCAKL2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3MzYu
YnVpbGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVuLWRpci91dGlsL2Fpby1wb3NpeC5jOjU2Mgoj
NSAgMHgwMGE0MTk1NiBpbiB0cnlfcG9sbF9tb2RlIChjdHg9MHgxMDc5NzA4LCB0aW1lb3V0PTB4
YjFiYTE3ZjgpIGF0IAovaG9tZS9vc3N0ZXN0L2J1aWxkLjE0NDczNi5idWlsZC1hcm1oZi94ZW4v
dG9vbHMvcWVtdS14ZW4tZGlyL3V0aWwvYWlvLXBvc2l4LmM6NTk3CiM2ICAweDAwYTQxYTJjIGlu
IGFpb19wb2xsIChjdHg9MHgxMDc5NzA4LCBibG9ja2luZz10cnVlKSBhdCAKL2hvbWUvb3NzdGVz
dC9idWlsZC4xNDQ3MzYuYnVpbGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVuLWRpci91dGlsL2Fp
by1wb3NpeC5jOjYzOQojNyAgMHgwMDcxZGMxNiBpbiBpb3RocmVhZF9ydW4gKG9wYXF1ZT0weDEw
N2QzMjgpIGF0IAovaG9tZS9vc3N0ZXN0L2J1aWxkLjE0NDczNi5idWlsZC1hcm1oZi94ZW4vdG9v
bHMvcWVtdS14ZW4tZGlyL2lvdGhyZWFkLmM6NzUKIzggIDB4MDBhNDRjODAgaW4gcWVtdV90aHJl
YWRfc3RhcnQgKGFyZ3M9MHgxMDc5NTM4KSBhdCAKL2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3MzYu
YnVpbGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVuLWRpci91dGlsL3FlbXUtdGhyZWFkLXBvc2l4
LmM6NTAyCiM5ICAweGI2N2FlNWQ4IGluID8/ICgpCkJhY2t0cmFjZSBzdG9wcGVkOiBwcmV2aW91
cyBmcmFtZSBpZGVudGljYWwgdG8gdGhpcyBmcmFtZSAoY29ycnVwdCBzdGFjaz8pCgpUaGlzIGZl
ZWxzIGxpa2UgYSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIHRoZSBpbml0L2ZyZWUgY29kZSB3aXRo
IApoYW5kbGVyLiBBbnRob255LCBkb2VzIGl0IHJpbmcgYW55IGJlbGw/CgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
