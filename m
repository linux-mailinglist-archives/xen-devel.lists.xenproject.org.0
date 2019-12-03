Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D310FC78
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 12:26:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic6Hl-0000Z0-FN; Tue, 03 Dec 2019 11:24:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72zl=ZZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ic6Hj-0000YT-V0
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 11:24:03 +0000
X-Inumbo-ID: 63e98a26-15bf-11ea-81d9-12813bfff9fa
Received: from mail-lj1-f193.google.com (unknown [209.85.208.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63e98a26-15bf-11ea-81d9-12813bfff9fa;
 Tue, 03 Dec 2019 11:23:55 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u17so3372078lja.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 03:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qehNV+l3gjieJhRLqWG8ltvJvg1MCSKh3WgQPtuBFB0=;
 b=nWCVmvW0sLT5TRuXp4tXdfetT+r1RW5vW7hBeTzW04Z3Q7f+12JduZTkwQqm5TNCVV
 ypzPZ6Kwv+7DlgzHiO4CymKRxRHDNZIUQLAKl6ZmE14tPWwRlEY5tj/o3kNSukwMqfG7
 5zlr4en3cp+hB1pC9dcnovUnDpX8lldqfxxBIBqn4JOEn74u9WlgDn8qnAmkrjx1ZBoO
 aTlrDMAbYZrVl7BFScvU1hhlKW8Eyot53l4CCpNg0vnSgNChsywznh+SbSHIv5WGjgue
 y499DGBHZ7sxh4GO+1b+1k7UWDtgqsA5wEO8/nJEMSnLsEGpU7RKJBh2quPV0yGu/r6e
 vcyQ==
X-Gm-Message-State: APjAAAVeHLMPuXIr+6EooIQ/CUyOl34y2oMUomc99adXr3w3y1C9+iLQ
 pj/T0CzWyadfz2RmNS5xDR/AhPBxFx8=
X-Google-Smtp-Source: APXvYqxPBQBwfMZhBO+56wrYIBMrKcMuFFA/jLFayhq7Zz82sZUXAhMIgQwfZh1QH8JXq4O82LhwZQ==
X-Received: by 2002:a2e:b4ba:: with SMTP id q26mr2238036ljm.60.1575372234181; 
 Tue, 03 Dec 2019 03:23:54 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id d5sm1151579ljc.51.2019.12.03.03.23.53
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 03:23:53 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id h23so3326614ljc.8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 03:23:53 -0800 (PST)
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr1964233ljj.207.1575372232915; 
 Tue, 03 Dec 2019 03:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20191203103352.29728-1-roger.pau@citrix.com>
 <20191203103352.29728-3-roger.pau@citrix.com>
In-Reply-To: <20191203103352.29728-3-roger.pau@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Tue, 3 Dec 2019 11:23:36 +0000
X-Gmail-Original-Message-ID: <CAK9nU=ob1txc2r1iC=U8ex_Gyjc0hJ=hFZFEH5NhyvRYwH7ECA@mail.gmail.com>
Message-ID: <CAK9nU=ob1txc2r1iC=U8ex_Gyjc0hJ=hFZFEH5NhyvRYwH7ECA@mail.gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/2] automation: increase tests maximum time
 from 10s to 30s
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAzIERlYyAyMDE5IGF0IDEwOjM0LCBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPgo+IDEwcyBpcyB0b28gbG93IGZvciB0aGUgY2xhbmcgdGVzdHMs
IHRoaXMgaXMgdGhlIG91dHB1dCBmcm9tIGEgY2xhbmcKPiB0ZXN0Ogo+Cj4gKFhFTikgWyAgICA2
LjUxMjc0OF0gKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCj4gKFhFTikgWyAgICA2LjUxMzMyM10gU0VMRlRFU1QgRkFJTFVSRTogQ09SUkVDVCBCRUhB
VklPUiBDQU5OT1QgQkUgR1VBUkFOVEVFRAo+IChYRU4pIFsgICAgNi41MTM4OTFdICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IChYRU4pIFsgICAg
Ni41MTQ0NjldIDMuLi4gMi4uLiAxLi4uCj4gKFhFTikgWyAgICA5LjUyMDAxMV0gKioqIFNlcmlh
bCBpbnB1dCB0byBET00wICh0eXBlICdDVFJMLWEnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCBpbnB1
dCkKPiAoWEVOKSBbICAgIDkuNTQ0MzE5XSBGcmVlZCA0ODhrQiBpbml0IG1lbW9yeQo+IC0tLSBY
ZW4gVGVzdCBGcmFtZXdvcmsgLS0tCj4gRW52aXJvbm1lbnQ6IEhWTSAzMmJpdCAoUEFFIDMgbGV2
ZWxzKQo+IEhlbGxvIFdvcmxkCj4gVGVzdCByZXN1bHQ6IFNVQ0NFU1MKPiAoWEVOKSBbICAgIDku
NjEwOTc3XSBIYXJkd2FyZSBEb20wIGhhbHRlZDogaGFsdGluZyBtYWNoaW5lCj4KPiBBcyBjYW4g
YmUgc2VlbiBmcm9tIHRoZSBvdXRwdXQgYWJvdmUgYm9vdGluZyBYZW4gYW5kIHRoZSBYVEYgdGVz
dAo+IHRha2VzIH4xMHMsIHdpdGhvdXQgYWNjb3VudGluZyBmb3IgdGhlIHRpbWUgaXQgdGFrZXMg
Zm9yIFFFTVUgdG8KPiBpbml0aWFsaXplLgo+Cj4gSW5jcmVhc2UgdGhlIHRpbWVvdXQgdG8gMzBz
IHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
