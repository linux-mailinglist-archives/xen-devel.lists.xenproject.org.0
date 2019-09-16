Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88DB3863
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:41:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9oPR-000293-NA; Mon, 16 Sep 2019 10:39:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9oPQ-00028t-8Z
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:39:04 +0000
X-Inumbo-ID: 31d31248-d86e-11e9-95de-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31d31248-d86e-11e9-95de-12813bfff9fa;
 Mon, 16 Sep 2019 10:39:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t3so9679750wmj.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 03:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vR5aLJ4Aw0jg49GU5GRByviT66FdpDgiyIibDEpw3R0=;
 b=bi9bh15FY4fFn/sXjbg+5VnSASHyATiGzgHc5wAB1ztFZIH8ciuZ9mC8U7MwVEj1Y4
 ziD9vyuY11HkaMK/ZqrfwYnxWHgyf8ZHGSDjSQR0GUaBIYWgzo/3eixrD9OJ51pA5jdI
 SUJK45QLdJTQU9C5KBXsTnpvXvIHN29/FYUZnQnDMjtOHRAUI8+bPSzkMH6jql/2O0Xf
 NjYNn9zcsov8bvCOVC/CjJ79Vv5cWW4uAUO1J0qCzHlXjgr87d0zoqkSbYwQddqxV/WA
 0/U5RNap3g5bMabO7pPNp/RKJe5eEqtf3DGdWAZ4D3kxMlVrgLsjMavU/eiedXn37XFB
 yQ2Q==
X-Gm-Message-State: APjAAAWNijJnOSWJ0Sg6QDguhLMdhCRXftNFmIKF8zezqLshpiMVWfDZ
 7kdywZdmYMN9alDw/VBM5Yk=
X-Google-Smtp-Source: APXvYqzQVd5PQL9sZPcxQSle+iL4AxF11RRw3mNvkfkOjr3QI+ZQsTX3XM/tZ/GeRbHk/KdVCLlKTw==
X-Received: by 2002:a1c:a8cb:: with SMTP id
 r194mr13301276wme.156.1568630340265; 
 Mon, 16 Sep 2019 03:39:00 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id n14sm81172471wra.75.2019.09.16.03.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 03:38:59 -0700 (PDT)
Date: Mon, 16 Sep 2019 10:38:58 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190916103858.kovwuktf7ce52vw7@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <CAKan5DCdRvofdAWaL3js9wmWBsiKWt9DAyguOpy0qv=33tdUwQ@mail.gmail.com>
 <6b9d7429-7dc5-476d-afda-bb3f196c804f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b9d7429-7dc5-476d-afda-bb3f196c804f@arm.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Looking for Semester long Project
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, paul@xen.org,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julian Tuminaro <jtuminar@andrew.cmu.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWFuCgpGb3IgdGhlIEtERCByZWxhdGVkIHByb2plY3QgSSBoYXZlIENDJ2VkIFBhdWwu
CgpJIGhhdmUgZ2F0aGVyZWQgc29tZSBpZGVhcyBmb3IgY2xlYW5pbmcgdXAgaHlwZXJ2aXNvciBj
b2RlIGJ1dCB0aGV5IGFyZQpvZiBsb3dlciBkaWZmaWN1bHR5IGNvbXBhcmVkIHRvIG90aGVyIHBy
b2plY3RzLiBUaGV5IGFyZSBkZWZpbml0aXZlbHkKbm90IGFzIGZ1biBhcyB0aGUgb3RoZXJzLiA7
LSkKCldlaS4KCk9uIE1vbiwgU2VwIDA5LCAyMDE5IGF0IDA4OjU4OjUxQU0gKzAxMDAsIEp1bGll
biBHcmFsbCB3cm90ZToKPiArQW5kcmV3LCBMYXJzLCBTdGVmYW5vIGFuZCBXZWkKPiAKPiBPbiA5
LzUvMTkgMTE6MjMgUE0sIEp1bGlhbiBUdW1pbmFybyB3cm90ZToKPiA+IEhpLAo+IAo+IEhlbGxv
LAo+IAo+IFRoYW5rIHlvdSBmb3IgeW91IGludGVyZXN0IG9uIFhlbi4gSSBoYXZlIENDZWQgZmV3
IG1vcmUgcGVyc29uIHRoYXQgc2hvdWxkCj4gYmUgYWJsZSB0byBhbnN3ZXIgeW91ciBxdWVzdGlv
bnMgYmVsb3cuCj4gCj4gPiAKPiA+IFdlIChhIGdyb3VwIG9mIDIgc3R1ZGVudHMpIGFyZSBpbnRl
cmVzdGVkIGluIGRvaW5nIGEgaHlwZXJ2aXNvciByZWxhdGVkCj4gPiBwcm9qZWN0IGZvciB0aGUg
bmV4dCAxMC0xMiB3ZWVrcyBhcyBwYXJ0IG9mIG9uZSBvZiBvdXIgY291cnNlcyB0aGlzCj4gPiBz
ZW1lc3Rlci4gV2UgaGF2ZSB0YWtlbiBhIGxvb2sgYXQgdGhpcyB5ZWFyJ3MgR1NvQyBwcm9qZWN0
IGxpc3QKPiA+IChodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9PdXRyZWFjaF9Qcm9n
cmFtX1Byb2plY3RzKS4gV2Ugd2VyZQo+ID4gaW50ZXJlc3RlZCBpbiBsZWFybmluZyBtb3JlIGFi
b3V0IHRoZSAiS0REIChXaW5kb3dzIERlYnVnZ2VyIFN0dWIpCj4gPiBlbmhhbmNlbWVudHMiIHBy
b2plY3QgYW5kIFhlbiBvbiBBUk0gYmFzZWQgcHJvamVjdHMuIFlldCwgb24gaXJjIHdlIHdlcmUK
PiA+IHRvbGQgdGhhdCB0aGlzIGxpc3QgaXMgb3V0ZGF0ZWQuIElmIHRoZXJlIGFyZSBhbnkgb3Ro
ZXIgcHJvamVjdAo+ID4gc3VnZ2VzdGlvbnMgb3IgbGlzdCwgd2Ugd291bGQgYmUgaW50ZXJlc3Rp
bmcgaW4gbGVhcm5pbmcgbW9yZSBhYm91dAo+ID4gdGhlbS4KPiBUaGUgbGlzdCBvZiBwcm9qZWN0
cyBmb3IgWGVuIG9uIEFybSBpcyBtb3N0bHkgdXBkYXRlLXRvLWRhdGUuIFRoZSBvbmx5Cj4gcHJv
amVjdCB3aGVyZSBzb21lIHByb2dyZXNzIGhhcyBiZWVuIG1hZGUgc28gZmFyIGlzICJYZW4gb24g
QVJNOiBkeW5hbWljCj4gdmlydHVhbCBtZW1vcnkgbGF5b3V0Ii4KPiAKPiBJIHdvdWxkIGJlIGhh
cHB5IHRvIGdvIGluIG1vcmUgZGV0YWlscyBmb3IgYW55IHRob3NlIHByb2plY3RzIGlmIHlvdSBh
cmUKPiBpbnRlcmVzdGVkLgo+IAo+ID4gCj4gPiBBbmRyZXcgQ29vcGVyIHN1Z2dlc3RlZCBvbiBp
cmMgdGhlIGZvbGxvd2luZyBwcm9qZWN0OiBDb250ZXh0IFN3aXRjaGluZwo+ID4gd2l0aCBDUjAu
VFMgaW4gSFZNIEd1ZXN0LiBXZSB3b3VsZCBsaWtlIHRvIHBvc3NpYmxlIGtub3cgbW9yZSBhYm91
dCB0aGlzCj4gPiBwcm9qZWN0IGluIHRlcm1zIG9mIGRpZmZpY3VsdHksIHBvdGVudGlhbCBlc3Rp
bWF0ZSBvbiB0aW1lIHJlcXVpcmVkLgo+ID4gQW5kcmV3IGFsc28gbWVudGlvbmVkIGEgc2xpZ2h0
ZXIgYmlnZ2VyIHhlbi9saW51eCBwcm9qZWN0IGFuZCB3ZSB3b3VsZAo+ID4gbGlrZSB0byBrbm93
IG1vcmUgZGV0YWlsIGFib3V0IHRoaXMgb25lIGFzIHdlbGwuCj4gCj4gQ2hlZXJzLAo+IAo+IC0t
IAo+IEp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
