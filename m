Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4793D1A9928
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 11:44:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOeaS-0006mo-Gz; Wed, 15 Apr 2020 09:44:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3U8g=57=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jOeaQ-0006mj-Rs
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 09:44:02 +0000
X-Inumbo-ID: a27f8c52-7efd-11ea-b58d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a27f8c52-7efd-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586943842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mbv+gpnFAZR8mNqDCIoCs8V/jdKDMCJTMEMlB1YW6yI=;
 b=dxWLk92PqR7bc/FQCberxto4vxxYjqLzf7UYrP9q6vl2H76fg0Qe2gh0
 fSNSvEZ07o+rmowlNjX0k9MwVggywmnbBbu94XaQ3qqa6TiOLDfBfV1sO
 LrACv/bJIe5uw9h7gor7RGrrL3ndWIQ7AQVgzME1Ziz/lcuZ/w/Dkoq4l 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CmiavONeHizNUCydwtRzkd/g4WjHQC6isrTu2ZyfOSDY2t9rsbtzUWXZydRcMlT+LS4qvdtHT8
 vZUGx1TwaZogzFQudsrTPXIgs3mhyBoXjZ9EzlpuOKAxL56pCUqcGGH3ECXQ5NtvE/IXM5aTY4
 nLuurjtTOA6oSz1QLekM17EU8/SOajMpODkjIZgBTbjMTWEM22x+xcTuAa+0Aqq25lDpGMg7FO
 8yGb3eV0s+J45TA8Kl+wDx5hF6EY20XqKu46Dwu/Soi9PE/GTpAM3xqGSCn+B8IOB36oqLkS5F
 wdE=
X-SBRS: 2.7
X-MesageID: 15941227
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="15941227"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
Thread-Topic: [PATCH v2] Introduce a description of a new optional tag for
 Backports
Thread-Index: AQHWD1gOS2WGOdcsW0SaziyGliZeaKh4Iv2AgACXkACAAOHggIAAOB+A
Date: Wed, 15 Apr 2020 09:43:57 +0000
Message-ID: <04881FC6-A816-44AB-8F25-54E5A265707E@citrix.com>
References: <20200410164942.9747-1-sstabellini@kernel.org>
 <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
 <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
 <707a1448-be1d-0aa8-6b11-a33eb247304f@suse.com>
In-Reply-To: <707a1448-be1d-0aa8-6b11-a33eb247304f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E7CA1A66DA65A4A97EDBE444B7F8C19@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Apr 15, 2020, at 7:23 AM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> On 14.04.2020 18:54, Stefano Stabellini wrote:
>> On Tue, 14 Apr 2020, Jan Beulich wrote:
>>> On 10.04.2020 18:49, Stefano Stabellini wrote:
>>=20
[snip]
>>>> +    Backport: all
>>>> +
>>>> +It marks a commit for being a candidate for backports to all relevant
>>>> +trees.
>>>=20
>>> I'm unconvinced of the utility of this form - what "all" resolves to
>>> changes over time. There's almost always a first version where a
>>> particular issue was introduced. If we want this to be generally
>>> useful, imo we shouldn't limit the scope of the tag to the upstream
>>> maintained stable trees.
>>=20
>> The reason why I suggested also to have a "wildcard" version of this
>> tag, is that the person adding the tag (could be the contributor trying
>> to be helpful) might not know exactly to which stable trees the patch
>> should be backported to.
>>=20
>> Writing this sentence, I realize that I really meant "any" rather than
>> "all". Would you prefer if I used "any"? Or we could even suggest to lea=
ve
>> it black like this:
>>=20
>>  Backport:
>>=20
>> But it looks a bit weird.
>=20
> Indeed. Instead of "all" or "any", how about "yes", "unspecified", or
> "unknown"? Nevertheless, I still think people asking for a backport
> should be nudged towards determining the applicable range; them not
> doing so effectively pushes the burden to the general maintainers or
> the stable tree ones, both of which scales less well. Omitting the
> tag if they don't want to invest the time would to me then seem to
> be the cleanest alternative. Albeit I'm sure views here will vary.

FWIW asking people adding the tag to do the work of figuring out which vers=
ions to backport to makes sense to me.

 -George


