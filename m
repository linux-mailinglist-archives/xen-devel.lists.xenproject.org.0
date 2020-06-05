Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC291EF1C0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 09:00:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh6Kl-0004af-Sx; Fri, 05 Jun 2020 07:00:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHCp=7S=amazon.de=prvs=418cebfef=wipawel@srs-us1.protection.inumbo.net>)
 id 1jh6Kk-0004aZ-Tf
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 07:00:07 +0000
X-Inumbo-ID: 2fa0195c-a6fa-11ea-8993-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fa0195c-a6fa-11ea-8993-bc764e2007e4;
 Fri, 05 Jun 2020 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1591340407; x=1622876407;
 h=from:to:cc:date:message-id:references:in-reply-to: subject;
 bh=pAI+O6HG26lMSTO4ql/EoYXSYiXCwcq7FuQs+M3pdk0=;
 b=uF8EJAYAxeAQ+4n05DgmFYXXQDRrJzZjIjdRvrGHWT3kdM61PJuQ9vzG
 Uk57u9fzIE4Z/9/H1kPbqwsxhgrCm+grd2ttvWVj4jSyo1bmQkYuGD7kW
 PTCNf1Al3uJEDP2GzDWRzDw92MAuP+JUzfe6MZce3t9YdN5U0vW9vpJqt o=;
IronPort-SDR: ipqgH8aG2Bmg7QxbccHkHuji0fFBDO+clA4xl7BWbYthmbkJvQZ0N24T1SUqadKbooF1yxTkzR
 y76GXyYxlYbQ==
X-Amazon-filename: signature.asc
X-IronPort-AV: E=Sophos;i="5.73,475,1583193600"; 
 d="asc'?scan'208";a="50004469"
Subject: Re: [PATCH XTF] vsnprintf: Expand \n to \r\n for console output
Thread-Topic: [PATCH XTF] vsnprintf: Expand \n to \r\n for console output
Content-Type: multipart/mixed; boundary="===============1242854288525243043=="
MIME-Version: 1.0
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 05 Jun 2020 07:00:02 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 86587A1812; Fri,  5 Jun 2020 07:00:00 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 5 Jun 2020 06:59:59 +0000
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 5 Jun 2020 06:59:59 +0000
Received: from EX13D05EUB003.ant.amazon.com ([10.43.166.253]) by
 EX13D05EUB003.ant.amazon.com ([10.43.166.253]) with mapi id 15.00.1497.006;
 Fri, 5 Jun 2020 06:59:59 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Index: AQHWOnqJjCAwY1e/p06UxvrJMnpmrqjJmOQA
Date: Fri, 5 Jun 2020 06:59:59 +0000
Message-ID: <CD71BEEB-2440-4170-977F-7186CE7B21AD@amazon.com>
References: <20200604141223.14153-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200604141223.14153-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.214]
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1242854288525243043==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="Apple-Mail=_81375728-4C83-4629-A8C4-EECBF7B638FD";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_81375728-4C83-4629-A8C4-EECBF7B638FD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On 4. Jun 2020, at 16:12, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> CAUTION: This email originated from outside of the organization. Do =
not click links or open attachments unless you can confirm the sender =
and know the content is safe.
>=20
>=20
>=20
> xenconsoled doesn't automatically convert \n into \r\n, which causes =
test
> output appear like this in a terminal:
>=20
>  [root@host ~]# xl create -c tests/selftest/test-pv64-selftest.cfg
>  Parsing config from tests/selftest/test-pv64-selftest.cfg
>  --- Xen Test Framework ---
>                            Environment: PV 64bit (Long mode 4 levels)
>                                                                      =
XTF Selftests
>=20
> There are a number of ways to do this, but by far the most efficient =
way is to
> have vsnprintf() expand \n's in the output buffer.
>=20
> This however is non-standard behaviour for vsnprintf().  Rename it to
> vsnprintf_internal() and take extra flags, and have vprintk() use the =
new
> LF_TO_CRLF control flag.
>=20
> Inside vsnprintf_internal(), rearrange the non-format and %c logic to =
share
> the expansion logic, as well as extending the logic to fmt_string().
>=20
> Extend the selftests to confirm correct behaviour in both modes, for =
all ways
> of being able to pass newline characters into a format operation.
>=20
> Reported-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Pawel: Does this fix the issues you were seeing?

Yes, it does fix the issue. Thanks.

> ---
> common/console.c        |  2 +-
> common/libc/vsnprintf.c | 23 +++++++++++++++--------
> include/xtf/libc.h      | 15 ++++++++++++++-
> tests/selftest/main.c   | 38 ++++++++++++++++++++++++++++++++++++++
> 4 files changed, 68 insertions(+), 10 deletions(-)
>=20
>=20

<snip>

Best Regards,
Pawel Wieczorkiewicz
wipawel@amazon.com



--Apple-Mail=_81375728-4C83-4629-A8C4-EECBF7B638FD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEMfesMdpdS8dLoCFipZXgubqFgvsFAl7Z7W4ACgkQpZXgubqF
gvt2Ug//bdEKML+MI8Wm9M3dsIST1KrHlGdTdVoTqyt/tTpdqiE22TIkxH2GpA2E
XxNH4zsTX3vUaD6Dx8bqNNaTscQXTLKw4BR+aDSEpyUzQ9BN3QVI9ny7oMYk8QPH
Tsx2hTqOgrQvn2sMXJdICM7mryjSJ5Ef0Mvio/kYkUE3h6FtWVZBaadnpD46X8xx
eopksyedcgbFN7bgCh2hUOMZRmry5up6XWpoNyhxFwqqMIH/DXXWD53UbHO4vr5e
d9B1xhkp37d96v7xYwgFgo0NII3AOpet6tryHGZEEDm3abtpPnNxgeDiNHb2NYsx
l1vhBnQUKbZaHvraX2pJ+/9glkP7JbCm+7uRMtSN3hofzPTf9QFWSC/MdOEXJlxA
gZ9dAgcnYzHmN3gnKVbuEz4U7MZI6hKEJzdEOqi3GkZkNA8j94UOnn3nG3Xwy2oh
4zbdKwEwmK5uJxfSg+rtVuz/8tYqqQbMkuz+X7PSe10TgRyg0pGiGhzqXBlA1jyF
/QGjNG2AK29z0YAW49OPzHgI+ek/yWPmP+rKOhBkMjFRvx+3JufeM0wwJpPUqemq
zqNviu21Mpq7tQnS8OvApjnvYToG+FeqQ3JgeeujhvGAaZz1IhaubfxCZdEZZT69
ILvUhfD9ejFGM0/jPZxC2UrRiVftSiMUoJYICGn5ikZR/GxbKKg=
=PHPe
-----END PGP SIGNATURE-----

--Apple-Mail=_81375728-4C83-4629-A8C4-EECBF7B638FD--

--===============1242854288525243043==
Content-Type: multipart/alternative; boundary="===============2324291855882853979=="
MIME-Version: 1.0
Content-Disposition: inline

--===============2324291855882853979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--===============2324291855882853979==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Center Germany GmbH
<br>Krausenstr. 38
<br>10117 Berlin
<br>Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>

--===============2324291855882853979==--

--===============1242854288525243043==--

