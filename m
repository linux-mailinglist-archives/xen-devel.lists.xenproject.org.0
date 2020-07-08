Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF69218B12
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 17:20:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtBs6-0000wC-KM; Wed, 08 Jul 2020 15:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5eT=AT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jtBs5-0000w7-HO
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 15:20:29 +0000
X-Inumbo-ID: 8dd6996c-c12e-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dd6996c-c12e-11ea-bca7-bc764e2007e4;
 Wed, 08 Jul 2020 15:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594221629;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WOMsddn/zKhCKzuqg9/VGFYaJcm5n1MgYlbeStwmZGQ=;
 b=OKclBi3EuBwAu6UOOL39kvr01I0JyoP8OeE9Wcsw0a2W+BwZqKLw43uH
 gczfyUat0F6UdwCRvq119f4ZpLiww7vg/rWqiRzO6DFJ6ro28FjvvnuUH
 4vmugCI0T+AY3Gm1v/WkH0CtZkIk9PGylcErmSCx4rTWz1sjzht8kYdco A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dFflYsRtA7q9fKlOSOu0X5bDHLayLWBAvbc9MkLQ3JoQics1HN8weY/ugGSxziABis9d+W4tdo
 k2O83Th9LZv8UcOFVX5utVAfSEqElW+9Ciys3M8mJRKjmOJ62NZ2JFyti/ESpq7oLhnS3LG9w8
 D2Bk6RxeSJuy7Isfbt2o3Y2WnvZzCc0/67BR6LfN19dOeGK9jcCh/8SKOYzy4NSPL7t7KtEmiW
 1kY+4/tN6+OopX7XOwnOltdnxB8rRlYoIJ0rN1vKZpo9qrNQyC+0z1oUy/aa5pFqepnRyJ/GNE
 6So=
X-SBRS: 2.7
X-MesageID: 21880057
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,327,1589256000"; d="scan'208";a="21880057"
From: George Dunlap <George.Dunlap@citrix.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: Xen and RISC-V Design Session
Thread-Topic: Xen and RISC-V Design Session
Thread-Index: AQHWVSlaXbsHlooEqk+f8JPClsuwY6j9hqiAgAAC7gD///++gIAAFI0AgAAKF4D///38AIAABMwA
Date: Wed, 8 Jul 2020 15:20:24 +0000
Message-ID: <CD72753B-2DFF-45CF-9E4C-B4AEE6813FF0@citrix.com>
References: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
 <20200708131150.GD7191@Air-de-Roger>
 <CAKmqyKOhW=YJ-WW28v-Ddt5yDDfVfCJKwijfsXo0oWAcvfrg2w@mail.gmail.com>
 <6CE81465-9F87-486F-A3CC-08857C9C4332@citrix.com>
 <CAKmqyKP5j7tQLZ8ka=CoN93X87a1LQhnMTxSeYfFo0jviMzP-w@mail.gmail.com>
 <20200708143420.GA8562@piano>
 <alpine.DEB.2.21.2007080808420.4124@sstabellini-ThinkPad-T480s>
 <CAKmqyKPrQKyz8HY00pGnS-mM8Dr5P-m69sziCJ-K8yiFoza08Q@mail.gmail.com>
In-Reply-To: <CAKmqyKPrQKyz8HY00pGnS-mM8Dr5P-m69sziCJ-K8yiFoza08Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F18A0A7D3A6B94589A800FB88BCEB1B@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

OK, I made that restriction; the resulting schedule seems OK to me.  :-)

 -George

> On Jul 8, 2020, at 4:03 PM, Alistair Francis <alistair23@gmail.com> wrote=
:
>=20
> On Wed, Jul 8, 2020 at 8:10 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>=20
>> On Wed, 8 Jul 2020, Bobby Eshleman wrote:
>>> On Wed, Jul 08, 2020 at 06:20:47AM -0700, Alistair Francis wrote:
>>>>=20
>>>> Thanks! Just submitted the proposal.
>>>>=20
>>>> It would be really great to have Bobby attend (on CC) as he has been
>>>> working on it. I'm not sure what timezone he is in though.
>>>>=20
>>>=20
>>> Hey Alistair,
>>>=20
>>> I am on the west coast in the USA, so some of the later slots would wor=
k best
>>> for me too.
>>=20
>> I'd love to attend this session. Realistically we have two sessions
>> tomorrow we could use, the 7:15AM and the 8:30AM California time, we
>> could use one for FuSa and the other for RISC-V.
>=20
> Either of those work for me.
>=20
> Alistair


