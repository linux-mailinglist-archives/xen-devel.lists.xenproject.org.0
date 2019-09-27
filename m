Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46DC07BC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:39:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDrLx-0006Kd-Qa; Fri, 27 Sep 2019 14:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BxSY=XW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDrLv-0006KW-Uv
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:36:11 +0000
X-Inumbo-ID: 26320254-e134-11e9-967a-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by localhost (Halon) with ESMTPS
 id 26320254-e134-11e9-967a-12813bfff9fa;
 Fri, 27 Sep 2019 14:36:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i1so3093535wro.4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 07:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QX+SyW8er1QoJZCzKDFlFI2G/ynYl8zYUO/HSrCOEfQ=;
 b=MGHvn0W7NrfIwyDKYBA3aH2HeqetdfbZ/nYdJhtpmo/o5xw1tPB4M/RXU3npRbQ5i0
 398BSAfrfSQ5Jd0yU2CqJo5t0LVjLQUtBQFDv9eMcwMVfuiY0OaKKxAy8Zq+9byu0Ijo
 nDVN1g3cIwtVQLXnfzQg1sxqMju87brXCR0ldIHKGVwLQ7vboyHZGRrq4LIUyc96W8xD
 VKZTiWnmRo7dE8eoo+Zgu8COOm4aAps3hw7TpEN9Gt0rwcAgyM2kNDn7l/xivUMETMW+
 wGu3eMIcVBkb1LK25BeZBopAA3dq02/3kx5N/88F7wPaglQtYmRYvuNuqAbGzRb/PUV+
 xa7g==
X-Gm-Message-State: APjAAAVoNN2AAekJS56o5NOy+ZUdp9HUQByz/PP0Ywkd/qjTuLVMItvQ
 3NMd229DOnK8tWDAjq7K/ss=
X-Google-Smtp-Source: APXvYqw5vZ4RcVxcLhgZ3CFVmjOdXF9CjDzNblfrEfrT0hPQEmYleMyQlS5De13Cy6BlF/6fdRtw+A==
X-Received: by 2002:a05:6000:108c:: with SMTP id
 y12mr3127773wrw.238.1569594970377; 
 Fri, 27 Sep 2019 07:36:10 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id b194sm14989663wmg.46.2019.09.27.07.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 07:36:09 -0700 (PDT)
Date: Fri, 27 Sep 2019 15:36:08 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190927143608.gx72psr2yl5ixesd@debian>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <3c113ed5-2a8d-8ebe-80af-a56d4ff69f25@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c113ed5-2a8d-8ebe-80af-a56d4ff69f25@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v7 0/4] Fix PCI passthrough for HVM with
 stubdomain
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDQ6MjE6NTVQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPiAKPiA+IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSAoNCk6Cj4gPiAgIGxpYnhs
OiBkbyBub3QgYXR0YWNoIHhlbi1wY2liYWNrIHRvIEhWTSBkb21haW4sIGlmIHN0dWJkb21haW4g
aXMgaW4gdXNlCj4gPiAgIGxpYnhsOiBhdHRhY2ggUENJIGRldmljZSB0byBxZW11IG9ubHkgYWZ0
ZXIgc2V0dGluZyBwY2liYWNrL3BjaWZyb250Cj4gPiAgIGxpYnhsOiBkb24ndCB0cnkgdG8gbWFu
aXB1bGF0ZSBqc29uIGNvbmZpZyBmb3Igc3R1YmRvbWFpbgo+ID4gICB4ZW4veDg2OiBBbGxvdyBz
dHViZG9tIGFjY2VzcyB0byBpcnEgY3JlYXRlZCBmb3IgbXNpLgo+IAo+IEkgZGlkIGNvbW1pdCB0
aGUgbGFzdCBvbmUsIGJ1dCBJJ2QgcHJlZmVyIGlmIG9uZSBvZiB5b3UgY291bGQgdGFrZQo+IGNh
cmUgb2YgdGhlIHRocmVlIGxpYnhsIG9uZXMuCj4gCgpJIHRyaWVkIHRvIGFwcGx5IHRoZSBmaXJz
dCB0aHJlZS4gVGhleSBkb24ndCBhcHBseSBjbGVhbmx5LiBUaGF0J3MKcGVyaGFwcyBkdWUgdG8g
QW50aG9ueSdzIHNlcmllcyB3aGljaCBnb3QgY29tbWl0dGVkIHJlY2VudGx5LgoKTWFyZWssIGRv
IHlvdSBoYXZlIGEgYnJhbmNoPwoKV2VpLgoKPiBUaGFua3MsIEphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
