Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9ABE141
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:27:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9As-0006CS-I2; Wed, 25 Sep 2019 15:25:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY+w=XU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iD9Ar-0006CI-2j
 for Xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:25:49 +0000
X-Inumbo-ID: bfee3eb8-dfa8-11e9-8628-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by localhost (Halon) with ESMTPS
 id bfee3eb8-dfa8-11e9-8628-bc764e2007e4;
 Wed, 25 Sep 2019 15:25:48 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o18so7446138wrv.13
 for <Xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 08:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Taz9jrcwUYlPztlBcz/TTHtqflK6AVCq+aq86dDj5hM=;
 b=qxMzA5WUyBG2QPC1kvobHNjLKQ2ynG6UnvTWXcclWaTP4bRz5+gGvZzCsY9OeRH3iH
 6u79LJRy8irenj0jV5t9mtAvRDDUVNX64NObFHR9r7eYNaZS7Eoq+OUdVBSRK2GK0sPh
 vBvArP75gfrNBunypxe9xfKvvjKgtnMYZxiNiUvXY4oOncnrzmMhd7Ph+Pe/EwFIWITS
 2FMAS8qTKOB6oqo8C63XxTd2gh+UDf8EjPNO2kqKypvSbr2Ylh0wg71ZguQPD5aZ7rws
 oRO5KgviW7FQbb1rOEhL06xOXX4NkaAIQzGovI60LvDbgnMwU+NPmsEdFDqzMNUK463b
 k4lg==
X-Gm-Message-State: APjAAAXgENc4CWrx8I/OgzM0MxlqGAXywkfT2PcRsJhtIk9EIrwCCyp1
 V8fb+MaVyc0VKTYN75bSpF8=
X-Google-Smtp-Source: APXvYqzd4+z2FAvdXg459dCGtEflP46EQ6lN+naFJRyC8IQyds54WjxRno4DIdX7jwFFrA5IdECaJA==
X-Received: by 2002:a5d:55d0:: with SMTP id i16mr9758605wrw.108.1569425147605; 
 Wed, 25 Sep 2019 08:25:47 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id 17sm6592013wrl.15.2019.09.25.08.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 08:25:45 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:25:43 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190925152543.d53lje2i6ti32hr7@debian>
References: <20190925143410.26661-1-hongyax@u9d785c4ba99158.ant.amazon.com>
 <20190925151349.43fqwaf6roh5627s@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925151349.43fqwaf6roh5627s@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 00/84] Remove direct map from Xen
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
Cc: Xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, wl@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25lIHRoaW5nIEkgZm9yZ290IHRvIGFzazogY2FuIHlvdSBwdWJsaXNoIGEgZ2l0IGJyYW5jaCBm
b3IgdGhpcwpzZXJpZXM/CgpUaGFua3MsCldlaS4KCk9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDA0
OjEzOjQ5UE0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4gSGkgSG9uZ3lhbgo+IAo+IFRoYW5rcyBm
b3IgcGlja2luZyB1cCB0aGlzIHdvcmsuCj4gCj4gUGxlYXNlIENDIHJlbGV2YW50IG1haW50YWlu
ZXJzIGFuZCByZXZpZXdlcnMgaW4gdGhlIGZ1dHVyZS4gSSBoYXZlIGRvbmUKPiB0aGlzIGZvciB0
aGlzIGNvdmVyIGxldHRlci4KPiAKPiBUaGUgRnJvbTogZmllbGQgb2YgeW91ciBlbWFpbHMgaXMg
bm90IGNvcnJlY3QuIFRoaXMgbWFrZXMgcGVvcGxlIG5vdAo+IGFibGUgdG8gcmVwbHkgdG8geW91
IGRpcmVjdGx5LiBZb3UgbWF5IHdhbnQgdG8gY2hlY2sgeW91ciBlbWFpbAo+IHNldHRpbmdzLgo+
IAo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDAzOjMyOjQ2UE0gKzAxMDAsIGhvbmd5YXggd3Jv
dGU6Cj4gPiBQcmV2aW91c2x5LCBXZWkgTGl1IGhhcyBjcmVhdGVkIHRoZSBwYXRjaCBzZXJpZXMg
dG8gc3dpdGNoIHRvCj4gPiBhbGxvYy9tYXAvdW5tYXAvZnJlZSBBUElzIGZvciBYZW4gcGFnZSB0
YWJsZXMgc28gdGhhdCBYZW4gcGFnZSB0YWJsZXMKPiA+IGFyZSBtYXBwZWQgd2l0aCBtYXBfZG9t
YWluX3BhZ2UoKS4gVGhpcyBpcyB0aGUgZmlyc3Qgc3RlcCB0b3dhcmRzCj4gPiByZW1vdmluZyB0
aGUgZGlyZWN0IG1hcC4gSSBpbXBsZW1lbnRlZCBwYXRjaGVzIG9uIHRvcCBvZiBXZWkncyB0byBy
ZW1vdmUKPiA+IHRoZSBkaXJlY3QgbWFwIGNvbXBsZXRlbHkuCj4gPiAKPiA+IEluIGFkZGl0aW9u
IHRvIFdlaSdzLCBteSBwYXRjaGVzOgo+ID4gLSBpbXBsZW1lbnQgYSBwcm9wZXIgUE1BUCBpbmZy
YXN0cnVjdHVyZSBmb3IgYm9vdHN0cmFwcGluZwo+ID4gLSByZW1vdmUgZGlyZWN0IG1hcCBjb2Rl
IGluIG1hcF9kb21haW5fcGFnZSgpIGFuZCB1c2UgbWFwY2FjaGUsIHVzZSBQTUFQCj4gPiAgIHdo
ZW4gbWFwY2FjaGUgbm90IHJlYWR5Cj4gPiAtIG1hcC91bm1hcCB4ZW5oZWFwIGFsbG9jYXRpb25z
IHRvIHRoZSBkaXJlY3QgbWFwIHJlZ2lvbiBzbyB0aGF0IHZhPC0+cGEKPiA+ICAgbWFjcm9zIHN0
aWxsIHdvcmsKPiA+IC0gaW5zdGFsbCBkdW1teSBtYXBwaW5ncyAobm8gcGVybWlzc2lvbnMsIElO
VkFMSURfTUZOKSBpbnN0ZWFkIG9mIGFjdHVhbAo+ID4gICAxOjEgbWFwcGluZ3MgZHVyaW5nIGJv
b3QsIHNvIHRoZSBkaXJlY3QgbWFwIG5vIGxvbmdlciBleGlzdHMKPiA+IC0gZml4IG1hbnkgcGxh
Y2VzIHdoZXJlIGNvZGUgaW5jb3JyZWN0bHkgYXNzdW1lcyBhIGRpcmVjdCBtYXAKPiA+IAo+IAo+
IEkgdGhpbmsgdGhlIHNlcmllcyB3aWxsIG5lZWQgc29tZSByZW9yZGVyaW5nIGp1c3QgYnkgbG9v
a2luZyBhdCB0aGUKPiB0aGluZ3MgbGlzdGVkIGhlcmUgYW5kIHRoZSBjb21taXQgc3ViamVjdHMu
ICBJIHdpbGwgdHJ5IHRvIGhhdmUgYSBjbG9zZXIKPiBsb29rIGF0IHNvbWUgcG9pbnQuICBQbGVh
c2UgYWxzbyBhbGxvdyBzb21lIHRpbWUgZm9yIG90aGVyIHBlb3BsZSB0bwo+IGhhdmUgdGhlaXIg
c2F5LiBYZW4gaXMgYWJvdXQgdG8gZnJlZXplIChvciBmcm96ZW4gYWxyZWFkeT8pIHNvIHBlb3Bs
ZQo+IG1heSBub3QgZ2V0IGFyb3VuZCB0byB0aGlzIGxhcmdlIHNlcmllcyBhbnkgdGltZSBzb29u
Lgo+IAo+IEFuZCBpbiBjYXNlIHlvdSBkb24ndCBrbm93LCB0aGVyZSBpcyBhIHdpa2kgcGFnZSBb
MF0gZm9yIHN1Ym1pdHRpbmcgWGVuCj4gcGF0Y2hlcy4gSW4gaXQgdGhlcmUgaXMgYSBzZWN0aW9u
IGFib3V0IGFkZF9tYWludGFpbmVycy5wbC4gWW91IGNhbiB1c2UKPiB0aGF0IHNjcmlwdCB0byBh
ZGQgcmVsZXZhbnQgbWFpbnRhaW5lcnMuCj4gCj4gVGhhbmtzLAo+IFdlaS4KPiAKPiBbMF06IGh0
dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2plY3RfUGF0
Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
