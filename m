Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01FC1EA50C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:35:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkar-0000Ow-JD; Mon, 01 Jun 2020 13:35:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/Ow=7O=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jfkaq-0000Or-2v
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:35:08 +0000
X-Inumbo-ID: b43e3112-a40c-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b43e3112-a40c-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 13:35:06 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gIGn/qoA+JziYhNehlhIcC/pZdLQnJiivf3KBrvDAaLcZieoK0wv6rqSWzyN88jzaS5yZqjlpY
 RfxdKxbsGuQZbQNG6Z0BKhJhZ1tTyuSaQ+HatwoQ95vSQMppfi8G/6DHUtLhRtplwmx7Ca+GPr
 NUBb+UXwWCdL4zDy1goSOG2hkCOiftEr+u0andDI+Xw0pIXIw2feKZo/UTJLhWWXIHIoAXhTSm
 YbpurdtIXXmDJ1AB7Gu7W4O1D7hmYrjQa2RPlDPo4YOjQ/YvOhJX8/zTDPIa7lpg5TTQbsG9yo
 r5s=
X-SBRS: 2.7
X-MesageID: 19176103
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,460,1583211600"; d="scan'208";a="19176103"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Topic: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Index: AQHWND0/xSJFUOR5YU28XikgbPuX46i7+DWAgALLwwCAAANFAIAABtKAgAA4IwCAAAT9gIAAAZ+AgAAlWICABGw3AIAAA6yAgAAG3AA=
Date: Mon, 1 Jun 2020 13:35:02 +0000
Message-ID: <4F8449D8-6023-4A40-9C87-875299DD0EEF@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
 <24273.8332.662607.125522@mariner.uk.xensource.com>
 <7eaa7541-f698-b29b-b4b3-1f40fc37c5d7@xen.org>
 <63838ce9-8dbf-aacf-521d-97540758a945@suse.com>
 <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
 <EEFCB4D0-9C2F-4527-8445-0FA78DE7285E@citrix.com>
 <b06a89b2-3fa1-86d7-ba82-d4aac1236cf2@xen.org>
In-Reply-To: <b06a89b2-3fa1-86d7-ba82-d4aac1236cf2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6CEBF200CDBC864B8DBA3D7D42DD55FF@citrix.com>
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Jun 1, 2020, at 2:10 PM, Julien Grall <julien@xen.org> wrote:
> 4. Extract the .config from the binary using a similar script to script/e=
xtract-ikconfig.

Ah, gotcha.  I did misunderstand your suggestion.

 -George=

