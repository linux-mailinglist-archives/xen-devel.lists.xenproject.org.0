Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D0B1F414A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 18:45:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jihNk-0003Fs-0u; Tue, 09 Jun 2020 16:45:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0Bv=7W=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jihNi-0003Fk-FX
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 16:45:46 +0000
X-Inumbo-ID: a9fd6ec4-aa70-11ea-8496-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9fd6ec4-aa70-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 16:45:45 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QKamtPoNHOhBhJ7Xo2Nx/xIPBY9nfLZqxVb32amsg7DUOtIdBBMlUJqfqge9tUs8P4OxVrhnmL
 EOCt3wKO6cLzuiTDe7CJkg6pVa5Ptn03Wo/T5fliWsNuRdotNZY1iQQ0o1OgKME2Vpx7S5BjT+
 JI2qfZpS8N7WbyK1ndMDToa9Q04TtpeMDV5XQIqY9FacbfblgiKDi9rK4A9TG+HSYFYoExvUk2
 VsD+0OOE3F1dB+bp7TEHcZ4pQ3zGsqXEpoJvMHe7b52IMPgFE/KIDS9V3XyCpTM2FGKbD0nzxm
 eY8=
X-SBRS: 2.7
X-MesageID: 19841376
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,492,1583211600"; d="scan'208";a="19841376"
From: George Dunlap <George.Dunlap@citrix.com>
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH-for-4.14 1/2] CHANGELOG: add 'domid_policy' and domid
 preservation on migrate
Thread-Topic: [PATCH-for-4.14 1/2] CHANGELOG: add 'domid_policy' and domid
 preservation on migrate
Thread-Index: AQHWPnsm5KVtEHlQbU2q3x4wLSCVdqjQXFYA
Date: Tue, 9 Jun 2020 16:45:41 +0000
Message-ID: <12AA7966-F395-4624-85DA-9D443B1269FC@citrix.com>
References: <20200609162922.14679-1-paul@xen.org>
 <20200609162922.14679-2-paul@xen.org>
In-Reply-To: <20200609162922.14679-2-paul@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <76998D5DEB5D544C91A3BEE14BA7A508@citrix.com>
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
Cc: Community Manager <community.manager@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Jun 9, 2020, at 5:29 PM, Paul Durrant <paul@xen.org> wrote:
>=20
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Both patches:

Acked-by: George Dunlap <george.dunlap@citrix.com>


