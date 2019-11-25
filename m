Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA670108C91
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 12:05:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZC7O-0007lq-7l; Mon, 25 Nov 2019 11:01:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RAVF=ZR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iZC7N-0007ll-5g
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 11:01:21 +0000
X-Inumbo-ID: e946e108-0f72-11ea-9455-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e946e108-0f72-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 11:01:20 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b11so5501078wmj.4
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 03:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZDpuLwrxUkHhiYT1lRWeZNUxG2V0T5TItnjJvtXd0oY=;
 b=K8IwTgOZsF5vqS4t8AXwMrn8TTSkoTA2zOilturaxiaLqCp3OVBkzOFKOl3LkddSXa
 yBFRw2OPG6uZOh+5b/oGbGkzajoxbR0V6MIz4BTxIBgjg95v3nTbO7tT7R6Zi1dp52U5
 ZFUgQmGJpR0ymBKd1G9cmMBOcFlvEbydPDBT410aBzYATdkL+2VhfhW7EjNHN7fDxZ7Q
 /Eau2/h3E9n9jsauNfI6V00Xf1R6RkKV1n5fJM5XLw9UH+quMuSdoGQrkouTti0KQqsa
 Wd0h3MJBlU04lM5NxiBF1atv1bb+H0fvJ5ywMDj/ABCFm3D5Lzeb3/Ev9Y5YG+QnQ7RY
 XU2w==
X-Gm-Message-State: APjAAAXyQ1uRn1/xqkB9yah1+6QphVja07TA0K0SmHlDXsrM/YB768Is
 3CV0mz+fYK5VmlG8b/fQfno=
X-Google-Smtp-Source: APXvYqzIRyMhreQF+E9+yor5DwPiD7e3ZnNjnpDzmh43V60b4dlMFsSP7qYXHjcIzhebGq8niaPvbg==
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr27441621wmk.43.1574679679964; 
 Mon, 25 Nov 2019 03:01:19 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id u14sm10121153wrm.51.2019.11.25.03.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 03:01:19 -0800 (PST)
Date: Mon, 25 Nov 2019 11:01:16 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191125110116.eexy6w3cnx2w7jgw@debian>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-2-al1img@gmail.com>
 <20191122151846.GG1425@perard.uk.xensource.com>
 <673d7677-57c6-8d08-8b7d-d8728b90035e@suse.com>
 <20191122164436.3yiivi5apbbwyt3a@debian>
 <24024.9229.13361.510891@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24024.9229.13361.510891@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 1/3] libxl: introduce new backend type
 VINPUT
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDY6MDg6MTNQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDEvM10gbGli
eGw6IGludHJvZHVjZSBuZXcgYmFja2VuZCB0eXBlIFZJTlBVVCIpOgo+ID4gT24gRnJpLCBOb3Yg
MjIsIDIwMTkgYXQgMDQ6NDM6MDNQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiA+ID4g
UmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4gCj4g
PiBJIHRha2UgaXQgdGhpcyBhcHBsaWVzIHRvIGJvdGggcGF0Y2ggMSBhbmQgMz8KPiAKPiBJbiB0
aGUgYWJzZW5jZSBvZiBhIHJlcGx5IHRvIHRoZSBjb250cmFyeSBieSAyMTowMCBVVEMgdG9kYXks
IEkgd2lsbAo+IGFzc3VtZSB0aGlzIHRvIGJlIHRoZSBjYXNlIGFuZCBwdXNoIHRoaXMgdG8gc3Rh
Z2luZy4gIEkgaG9wZSB0aGF0Cj4gbWVldHMgd2l0aCBldmVyeW9uZSdzIGFwcHJvdmFsLgoKR290
IGNvbmZpcm1hdGlvbiBmcm9tIEp1ZXJnZW4gb24gSVJDLCBzbyBJIGhhdmUganVzdCBwdXNoZWQg
cGF0Y2ggMSBhbmQKMy4KCldlaS4KCj4gCj4gSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
