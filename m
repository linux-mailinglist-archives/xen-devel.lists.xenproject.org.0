Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85741071EA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 13:02:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY7cg-00078D-Ac; Fri, 22 Nov 2019 12:01:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nz3w=ZO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iY7cf-000783-6z
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 12:01:13 +0000
X-Inumbo-ID: c6e557f2-0d1f-11ea-a34c-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6e557f2-0d1f-11ea-a34c-12813bfff9fa;
 Fri, 22 Nov 2019 12:01:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t2so8350523wrr.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2019 04:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nLjqIAbVmjvyLFRKA/hUIHmMFmPTYc011x2fe8M8sig=;
 b=J7hLClEBi4D+nVUWUxgvWFQk9L5j8gYlNOecpzrMOum7RLjI1UCL52V/56iAFaAX7X
 9RtrV7bRPNHaYLrYou28dQPqGMOdGGU9RyY9UzDtI3XmFgenkB1BBTKWKGg1GWZSsSwx
 2znBIXDdDDA/9I3M7YMaMjxMCynYlZol4Dfor8dQnUhJbSmBno8TWnIHN/vjZfooSlbt
 p9vM8uGFhv4XWUb6LQh8I2WgJc4DB3doIDq0vH/S+xNDp8Eh7SUMSeP3m+5Xb4Pi3oDT
 +5I1Wn/+H65OaYZmxNDlx+D4UglJGh3UG0q5SxI0F4r0ESBo8ya8PZdYRMePeXW65GX+
 4baQ==
X-Gm-Message-State: APjAAAXS0W+6rY0v5nSPnYnGCIE78AH7SHjQxTbzzr2fpfrbFubbms3S
 ZjWWXncGNVKqWp67O77FooU=
X-Google-Smtp-Source: APXvYqxvJ9hqYNPSniVqkaVzfOBumW2h2vJYc5SoZ7+5sUeuZ/jnIaO/kwR1W+aoHYRclXAM/vLCGA==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr18145581wrm.264.1574424070275; 
 Fri, 22 Nov 2019 04:01:10 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id a6sm3264125wmb.1.2019.11.22.04.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 04:01:09 -0800 (PST)
Date: Fri, 22 Nov 2019 12:01:08 +0000
From: Wei Liu <wl@xen.org>
To: Oleksandr Grytsov <al1img@gmail.com>
Message-ID: <20191122120108.6uttmedmlgvwig4a@debian>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-4-al1img@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121181300.6497-4-al1img@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 3/3] libxl: make default path to
 add/remove all PV devices
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
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 ian.jackson@eu.citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 wl@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDg6MTM6MDBQTSArMDIwMCwgT2xla3NhbmRyIEdyeXRz
b3Ygd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVw
YW0uY29tPgo+IAo+IEFkZGluZy9yZW1vdmluZyBkZXZpY2UgaXMgaGFuZGxlZCBmb3Igc3BlY2lm
aWMgZGV2aWNlcyBvbmx5OiBWQkQsIFZJRiwKPiBRRElTSy4gVGhpcyBjb21taXQgYWRkcyBkZWZh
dWx0IGNhc2UgdG8gaGFuZGxlIGFkZGluZy9yZW1vdmluZyBmb3IgYWxsIFBWCj4gZGV2aWNlcyBi
eSBkZWZhdWx0LCBleGNlcHQgUURJU0sgZGV2aWNlLCB3aGljaCByZXF1aXJlcyBzcGVjaWFsIGhh
bmRsaW5nLgo+IElmIGFueSBvdGhlciBkZXZpY2UgaXMgcmVxdWlyZWQgYSBzcGVjaWFsIGhhbmRs
aW5nIGl0IHNob3VsZCBiZSBkb25lIGJ5Cj4gaW1wbGVtZW50aW5nIHNlcGFyYXRlIGNhc2UgKHNp
bWlsYXIgdG8gUURJU0sgZGV2aWNlKS4gVGhlIGRlZmF1bHQKPiBiZWhhdmlvdXIgZm9yIGFkZGlu
ZyBkZXZpY2UgaXMgdG8gd2FpdCB3aGVuIHRoZSBiYWNrZW5kIGdvZXMgdG8KPiBYZW5idXNTdGF0
ZUluaXRXYWl0IGFuZCB0aGUgZGVmYXVsdCBiZWhhdmlvdXIgb24gcmVtb3ZpbmcgZGV2aWNlIGlz
IHRvCj4gc3RhcnQgZ2VuZXJpYyBkZXZpY2UgcmVtb3ZlIHByb2NlZHVyZS4KPiAKPiBBbHNvIHRo
aXMgY29tbWl0IGZpeGVzIHJlbW92aW5nIGd1ZXN0IGZ1bmN0aW9uOiBiZWZvcmUgdGhlIGd1ZXN0
IHdhcwo+IHJlbW92ZWQgd2hlbiBhbGwgVklGIGFuZCBWQkQgZGV2aWNlcyBhcmUgcmVtb3ZlZC4g
VGhlIGZpeCByZW1vdmVzCj4gZ3Vlc3Qgd2hlbiBhbGwgY3JlYXRlZCBkZXZpY2VzIGFyZSByZW1v
dmVkLiBUaGlzIGlzIGRvbmUgYnkgY2hlY2tpbmcgdGhlCj4gZ3Vlc3QgZGV2aWNlIGxpc3QgaW5z
dGVhZCBvZiBjaGVja2luZyBudW1fdmlmcyBhbmQgbnVtX3ZiZHMuIG51bV92aWZzIGFuZAo+IG51
bV92YmRzIHZhcmlhYmxlcyBhcmUgcmVtb3ZlZCBhcyByZWR1bmRhbnQgaW4gdGhpcyBjYXNlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBHcnl0c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBl
cGFtLmNvbT4KCkkgYWdyZWUgd2l0aCB0aGlzIGFwcHJvYWNoIGluIGdlbmVyYWwsIGJ1dCBJIGhh
dmVuJ3QgbG9va2VkIGNsb3NlbHkgaW50bwp0aGUgaW1wbGVtZW50YXRpb24uIEZXSVc6CgpBY2tl
ZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
