Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655ABF1A0B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 16:32:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSNGT-0005Pi-OT; Wed, 06 Nov 2019 15:30:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=65NO=Y6=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iSNGS-0005Pb-CP
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 15:30:32 +0000
X-Inumbo-ID: 5e72ee68-00aa-11ea-9631-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e72ee68-00aa-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 15:30:31 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id g17so1580943ybd.13
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=0R6nSQd7xdqegU/yXvWSoFG6ImZpHQz+qGRxgYDIUeU=;
 b=tMcwqCXFdwm+3noLYqPQePheDAxH8HN66ALh6JlB2oSECteiaCMYDlehfyG+mD+xPR
 6TrbBEL7utmlL5ZEYmEwhuTvsbnaPx2u2HXz+n++3ikPMWci89Jqs6JVpgp4xSobf8+g
 4KvLmVGnYsVMyl4qBpLcFeGZLo3TVSZoU8qyh5wOBwyng84SsqDX30B3dZO93GLGcj5l
 8nc6809sZ/kCODam7QClutWdz0iIsOOkwqsmSIohw+/YmMvPVNOSq8nUo0255O+zb0iI
 zI4O9DZzRCIdtlRzbhF/0EpSVQJ3+50c0U2lZ0c4Uza1+YjL9+/eAXCgvr4ezJwtE2AO
 mr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=0R6nSQd7xdqegU/yXvWSoFG6ImZpHQz+qGRxgYDIUeU=;
 b=EBc1q5FNiwddF4tXKwd2sz4St6H/psVUKXqH/mrLq2sshoaU2pkKi4iQTTDl2Pg3A6
 wmSYrmZBImWOzJLVLet3qbjKzHJH7DfDageZz9080E7RXfHcWes9+Wb+lpcjYw91/B4R
 XdJv2UEA/VUVdRkxHdZY7Uq1zgpGm/m/w1JtVKMfwl04Fp+ntD3rBTTkF9Dwdjg9/LIQ
 T0tILtHHBQ79A+Q1yvspiWjzkntKebGx5A9yyorrwynmPsl4aUhJEWEhim8zItJN4Puk
 B4sDOxeEtIN7q/KnCrlYoYvaB0OJA8P8Uc5zp5rvX7/eJO/UlZE2dli9ldCSQZ6fPBIX
 zO+A==
X-Gm-Message-State: APjAAAW2p2ZxBwoY9hn6dMZyszEDpi9kEuFq7WfxuxBS28+c+PXV8B5u
 KSYUAeS1jb+y3yIF3TFk6P0=
X-Google-Smtp-Source: APXvYqx4yjQsrnMLfNZfdUy0C1XUt7h9tDh6Bm0g2eNN0pCVOAyS8aPF1dGEBjGCubQ3epEUF8RE5g==
X-Received: by 2002:a25:3897:: with SMTP id f145mr2592537yba.373.1573054230970; 
 Wed, 06 Nov 2019 07:30:30 -0800 (PST)
Received: from [100.64.75.253] ([205.185.206.113])
 by smtp.gmail.com with ESMTPSA id b196sm1350834ywh.8.2019.11.06.07.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 07:30:30 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <D219444F-C002-4428-B13F-104B30372B13@gmail.com>
Date: Wed, 6 Nov 2019 10:30:29 -0500
To: xen-devel <xen-devel@lists.xenproject.org>
X-Mailer: iPad Mail (17B84)
Subject: [Xen-devel] Virtualization videos from Platform Security Summit 2019
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
Cc: openxt@googlegroups.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

77u/WGVuLCBPcGVuWFQsIFF1YmVzT1MgYW5kIGVtYmVkZGVkIGRldmVsb3BlcnMgbWF5IGJlIGlu
dGVyZXN0ZWQgaW4gdGhlc2UgdmlkZW9zLiAgCgpUaGUgZmlyc3QgKElCTSBwcGMgVWx0cmF2aXNv
ciB3aXRoIGV4dGVuZGVkIFEmQSkgaXMgcmVsYXRlZCB0byBwYXN0IGRpc2N1c3Npb25zIG9mIG1p
bmltYWwgTDAgWGVuIGluIGZpcm13YXJlLCBzaW1pbGFyIHRvIEhQL0Jyb21pdW0gbmVzdGluZy1v
cHRpbWl6ZWQgaHlwZXJ2aXNvci4gIFRoZSBzZWNvbmQgaXMgcmVsYXRlZCB0byBrZXhlYyBhbmQg
VHJlbmNoQm9vdCwgd2hpY2ggKHZpZGVvIFRCRCkgd2FzIGRlbW9lZCBib290aW5nIFhlbiB3aXRo
IEFNRCBTS0lOSVQgRFJUTSBvbiBQQyBFbmdpbmVzICQxNTAgQVBVMiB3aXRoIFRQTSAyLjAuICBU
aGUgdGhpcmQgZGVzY3JpYmVzIGEgY3VzdG9tIEFNRCBKYWd1YXItZGVyaXZlZCBTb0Mgd2l0aCBh
IHByZWN1cnNvciB0byBBTUQncyBQU1AsIHJ1bm5pbmcgYSBtaW5pbWFsIHZlcnNpb24gb2YgSHlw
ZXItViBjYWxsZWQgTmFub3Zpc29yLiAgVGhlIGZvdXJ0aCBkZXNjcmliZXMgY2hhbmdlcyB0byBX
aW5kb3dzIGFuZCB4ODYgZmlybXdhcmUvaGFyZHdhcmUgZm9yIHZpcnR1YWxpemF0aW9uLWJhc2Vk
IHNlY3VyaXR5LgoKUmljaAoKClByb3RlY3RlZCBFeGVjdXRpb24gRmFjaWxpdHk6IFdlIHByZXNl
bnQgdGhlIFByb3RlY3RlZCBFeGVjdXRpb24gRmFjaWxpdHkg4oCVIGFuIGFyY2hpdGVjdHVyZSBt
b2RpZmljYXRpb24gZm9yIElCTSBMaW51eCBhbmQgT3BlblBvd2VyIExpbnV4IHNlcnZlcnMg4oCV
IGFsb25nIHdpdGggdGhlIGFzc29jaWF0ZWQgZmlybXdhcmUsIHRoZSBQcm90ZWN0ZWQgRXhlY3V0
aW9uIFVsdHJhdmlzb3Igd2hpY2ggcHJvdmlkZXMgYWRkaXRpb25hbCBzZWN1cml0eSB0byB2aXJ0
dWFsIG1hY2hpbmVzIOKAlSBjYWxsZWQgc2VjdXJlIHZpcnR1YWwgbWFjaGluZXMgKFNWTXMpLiBU
aGUgUHJvdGVjdGVkIEV4ZWN1dGlvbiBGYWNpbGl0eSBjb25jdXJyZW50bHkgc3VwcG9ydHMgYm90
aCBub3JtYWwgVk1zIGFuZCBTVk1zLgpodHRwczovL3d3dy5wbGF0Zm9ybXNlY3VyaXR5c3VtbWl0
LmNvbS8yMDE5L3NwZWFrZXIvaHVudC8KCgpMaW51eEJvb3QgcHJvZ3Jlc3M6IGJvb3QgYW55dGhp
bmcgZnJvbSBMaW51eDogTGludXhCb290IHJlcGxhY2VzIHRyYWRpdGlvbmFsbHkgY2xvc2VkIHNv
dXJjZSBmaXJtd2FyZSAoZS5nLiBVRUZJKSB3aXRoIGFuIG9wZW4sIGF1ZGl0YWJsZSwgYW5kIG1l
YXN1cmFibGUgTGludXgga2VybmVsIGFuZCBpbml0cmFtZnMuIFdl4oCZbGwgcHJlc2VudCBhbiBv
dmVydmlldyBvZiBMaW51eEJvb3QsIGl0cyBwYXJ0IGluIHRoZSBib290IGludGVncml0eSBzdG9y
eSwgYW5kIHRhbGsgYWJvdXQgbmV3bHkgZ2FpbmVkIGFiaWxpdGllcyB0byBib290IFZNd2FyZSwg
WGVuLCBhbmQgV2luZG93cyBmcm9tIExpbnV4LCBhbmQgZnV0dXJlIHBsYW5zLgpodHRwczovL3d3
dy5wbGF0Zm9ybXNlY3VyaXR5c3VtbWl0LmNvbS8yMDE5L3NwZWFrZXIva29jaC8KCgpHdWFyZGlu
ZyBBZ2FpbnN0IFBoeXNpY2FsIEF0dGFja3M6IFRoZSBYYm94IE9uZSBTdG9yeTogLi4uIGRlc2Ny
aWJlIHRoZSBYYm94IHNlY3VyaXR5IGRlc2lnbiBnb2FscyBhbmQgd2h5IGl0IG5lZWRzIHRvIGd1
YXJkIGFnYWluc3QgaGFyZHdhcmUgYXR0YWNrcywgZm9sbG93ZWQgYnkgZGVzY3JpcHRpb25zIG9m
IHRoZSBoYXJkd2FyZSBhbmQgc29mdHdhcmUgYXJjaGl0ZWN0dXJlIHRvIGtlZXAgdGhlIFhib3gg
c2VjdXJlLiBUaGlzIGluY2x1ZGVzIGRldGFpbHMgYWJvdXQgdGhlIGN1c3RvbSBTb0Mgd2UgYnVp
bHQgd2l0aCBBTUQgYW5kIGhvdyB3ZSBhZGRyZXNzZWQgdGhlIGZhY3QgdGhhdCBhbGwgZGF0YSBy
ZWFkIGZyb20gZmxhc2gsIHRoZSBoYXJkIGRyaXZlLCBhbmQgZXZlbiBEUkFNIGNhbm5vdCBiZSB0
cnVzdGVkLiBXZSB3aWxsIGFsc28gZGlzY3VzcyB0aGUgY29ycmVzcG9uZGluZyBzb2Z0d2FyZSBj
aGFuZ2VzIHdlIG1hZGUgdG8ga2VlcCB0aGUgc3lzdGVtIGFuZCB0aGUgZ2FtZXMgc2VjdXJlLgpo
dHRwczovL3d3dy5wbGF0Zm9ybXNlY3VyaXR5c3VtbWl0LmNvbS8yMDE5L3NwZWFrZXIvY2hlbgoK
CkFkdmFuY2luZyBXaW5kb3dzIFNlY3VyaXR5OiAuLi4gdGhlIE9TIHNlY3VyaXR5IGVuZ2luZWVy
aW5nIHRlYW0gYXQgTWljcm9zb2Z0IGhhcyBidWlsdCBhIHN0cmF0ZWd5IHRvIGFkZHJlc3MgbmV3
IGFuZCBjaGFsbGVuZ2luZyBhdHRhY2tzLiBUaGlzIHRhbGsgd2lsbCB3YWxrIGF0dGVuZGVlcyB0
aHJvdWdoIFdpbmRvd3MgY3VycmVudCBhbmQgZnV0dXJlIHNlY3VyaXR5IHN0cmF0ZWd5IGFuZCB0
aGUgZW5naW5lZXJpbmcgY2hhbGxlbmdlcyB3aXRoIHNjYWxpbmcgYWNyb3NzIG5ldyBkZXZpY2Vz
LCBmb3JtIGZhY3RvcnMsIGFuZCB0aHJlYXQgbW9kZWxzIC4uLgpodHRwczovL3d3dy5wbGF0Zm9y
bXNlY3VyaXR5c3VtbWl0LmNvbS8yMDE5L3NwZWFrZXIvd2VzdG9uLwoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
