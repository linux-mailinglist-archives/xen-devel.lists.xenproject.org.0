Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ACC201A3F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 20:24:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmLfn-0002s1-Rv; Fri, 19 Jun 2020 18:23:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhgK=AA=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jmLfm-0002rw-E6
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 18:23:30 +0000
X-Inumbo-ID: f944cedc-b259-11ea-bca7-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f944cedc-b259-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 18:23:29 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id y13so11168668eju.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 11:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=Vfy+JjQpvugirTgGbla1mvn1w9sg4RdrB9Z6ncIWjks=;
 b=K/OaIL9F9dK44pJOR0GOY60OwH918Kmoe5tConvHMONOumzKKMC82+auUzC+AV66zL
 cpDYK4YaTjZLd1E42Ai0sRJhsim+hbvCSgy4vdMKoRHi3hmNSzylZJ84YAxlygFNFQUX
 LmLLtZXmO7Kww3ago+FY+V1AtlW/fWh/JiXDWPZXEGjOohSneuTYRWlYlIdf8YvFx4LT
 eemIyXC8aw/jV1Cl7QCMPKJC4eX2IJpdtVMDFZHpoimz0g9MsKpongmPG2q9rz747HEZ
 hFRnEB96AhcI7oyLnmDuZdQYs/UgR3QBAakWx4ZrPLWqf1RU45MxitzJlFeKZhBZYaN9
 JDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=Vfy+JjQpvugirTgGbla1mvn1w9sg4RdrB9Z6ncIWjks=;
 b=ntzg7rZ9EzoXFT5RoDiPIDe1p1HuntbI2LXzP0A/jz9qWWdjrVq+BCUD0QHJzBpjlc
 0hfbFdlL3wvrjP++uBBB29jv/4jduldZZcEJGCS7PsLqhdX4rhGFHkVOrA1/Re/DsFg3
 1AwrEI4UIuXq5tiARWqyp00Um5rdejHKk8s4b7b+b3NElULQUu1xtaoD7vhzRPdMZ0nt
 KiRVG7DcbzXnzgMrM04cgmWGbKIDw1uE5QMMu3Tkz633hvbrdYd55ZMeaBYxOjrtbhes
 lrvnPYnREoCGJ9wsU2PxK8N0vV7IVZyJs2ew4BO10zFNBEVIrzOFuwyWqHDG1+xQPPAw
 MlRQ==
X-Gm-Message-State: AOAM531Rly8PFnEP+u/j5rug2ishlmMtz98bIQtmh7iJUclEWqqWoy/T
 4k41Bg4bsWKeuTY0Qo9h26A=
X-Google-Smtp-Source: ABdhPJxCr3A+V5osae3kNNt1xFYptDn2Tu245o96nsYCwCub+GEqaIVZKHVLVJHvZeT35qPq/BK2Nw==
X-Received: by 2002:a17:906:3e84:: with SMTP id
 a4mr4634106ejj.372.1592591008810; 
 Fri, 19 Jun 2020 11:23:28 -0700 (PDT)
Received: from [192.168.8.124] (public-gprs354184.centertel.pl. [37.47.14.201])
 by smtp.gmail.com with ESMTPSA id y62sm5160839edy.61.2020.06.19.11.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 11:23:28 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1592539868.git.gorbak25@gmail.com>
 <b56bc897f22acc537a15740d779cb096fb2d6733.1592539868.git.gorbak25@gmail.com>
 <a64cd64b-9717-a23a-561c-497aa4686ac0@suse.com>
From: Grzegorz Uriasz <gorbak25@gmail.com>
Autocrypt: addr=gorbak25@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFyZgUUBCACo21Uf58hRRgX0uQd3kRJUqXp8/kJsC58tKZG9ENy8rvmcq15AmblqOQnD
 k6Pmh2lhh31A+m4ONF+TT0vlFYv9sN0kA1llvHPH95LYhROXt7UwSZBQTnQlLZFVqeGa3R6M
 pJwaAMQP/lyYgINt1pvBdCWtcNP/wKuNI/efnZuBOPDKSeBH/V0ZmmZxlSsx05/ktgtR6ibP
 FZXPBgx5DY0DxPm/jb8CqkXO5291wyYCP2VDy85oqG8EgsfFOOPZNwBQCKS7cWLZDMEsVNnB
 WyU3zJZBvEVK/5BwIzm1+AL9lR6RRLaOpC19k2ZqbyhEG9EhsR+/DIF0znBd9Nhjokd5ABEB
 AAG0JEdyemVnb3J6IFVyaWFzeiA8Z29yYmFrMjVAZ21haWwuY29tPokBVwQTAQgAQQIbAwUJ
 A8JnAAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHDkRnQjCGTnaTo/LngD9fcXMA1pBQJd
 /5CUAhkBAAoJEHgD9fcXMA1pb9YIAICTmZOrEGho9MC7z851jw507EamIqaAXQAADKpbxSGH
 yVxALYZv6cqR84rsQuML0N8ai4rdCJ7PviMYyaWVX3P09kJoFxSzKhjxbwZMkRF8O+9tIhNO
 29h8v5cmv7Sp4NpssITFMZAms4LleJtdkivDeRxSCyJnHceZyGiD6pPTkopyuISGZIS+4axF
 zarn+JM+uiTm1QHdCbcvK3sor//QvHr9kKjLKTxMwiTZOGQzF8+oHpVxxwX8Bz3UbFwRX/Io
 rErT92f9WOsFWnvZHuLGcRLSlG0h9xljIuhP7mvGiudTgNoPt9YFtAG8KT/2HnUZ4XxJKi+B
 8Ilet++3m4m5AQ0EXJmBRQEIANBww0bVhYwP1g4AMux/Fjp7KUjYj7Q8ej+t71ShZkAzvPQT
 00ULdnYEa62uKM9YwXqOu0XJsnBveJKO1q3nfJuazAbsC0B3v0bYlUUQoTRxCUs3v22UOVxe
 kaTtN3KDdnSTq7QkkZBZFvV+vAwKGlqECzsYtZ86CiIEOgmUeVA82AzyMx306l1th90OdHYt
 LKkHxreEPWInN9jptOaKNwvB5cR6PxFfVRtVteN121tVJRK5geA0RVjHn35ig97ycDP5FcwP
 HuuuKfr+07ANXrtFM/QLGmIvEaMEgpPmzyGkXGhbsDpMikHOkXvQCRTesJ38r8DRUffinYXI
 vAw0IsMAEQEAAYkBPAQYAQgAJhYhBHDkRnQjCGTnaTo/LngD9fcXMA1pBQJcmYFFAhsMBQkD
 wmcAAAoJEHgD9fcXMA1p3y8H/2nftQbUcb2oKtpyePStdmdN45A1OWjorj6iBRvTOhoig6y7
 PbveJ9Zj35IP0Zy4W77Ke4ayK/PiBkh7bRrdQAwTAc7EiYw3j+foO32JA/4bANMgSuRBxO/d
 xoloRPoaRE6eGUkA3N65V5WlWkinKxzSGDgSOz7Tit5QY8fGJYWeLTzFj605Y9iUu0MSLpfs
 LQQby+I9gETWh5TUMz1uNytIB80UdMpzqcC36zCMk7wIy1g8YhbehJq1zU1+ZpDrggrN3ucH
 0NFFvHq5uwEkR8Llj29nDcyKuWMlnCMpM/iJcTde7N8UVdtN9yBGol4+yAZT0w5RP87pw3oD
 fuZMcoY=
Subject: Re: [PATCH v2 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
Message-ID: <ad15c39d-d2ad-9e13-2f52-432532b869c3@gmail.com>
Date: Fri, 19 Jun 2020 20:23:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <a64cd64b-9717-a23a-561c-497aa4686ac0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wnyo5xbJ5COLKig1aSkN1SX5mDPO82EtB"
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wnyo5xbJ5COLKig1aSkN1SX5mDPO82EtB
Content-Type: multipart/mixed; boundary="cNNM5kT93BLjfWRA9MTttUZY7XDXOXIy4";
 protected-headers="v1"
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 marmarek@invisiblethingslab.com, artur@puzio.waw.pl, jakub@bartmin.ski,
 j.nowak26@student.uw.edu.pl
Message-ID: <ad15c39d-d2ad-9e13-2f52-432532b869c3@gmail.com>
Subject: Re: [PATCH v2 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
References: <cover.1592539868.git.gorbak25@gmail.com>
 <b56bc897f22acc537a15740d779cb096fb2d6733.1592539868.git.gorbak25@gmail.com>
 <a64cd64b-9717-a23a-561c-497aa4686ac0@suse.com>
In-Reply-To: <a64cd64b-9717-a23a-561c-497aa4686ac0@suse.com>

--cNNM5kT93BLjfWRA9MTttUZY7XDXOXIy4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 19/06/2020 15:17, Jan Beulich wrote:
> On 19.06.2020 06:28, Grzegorz Uriasz wrote:
>> --- a/xen/arch/x86/acpi/boot.c
>> +++ b/xen/arch/x86/acpi/boot.c
>> @@ -478,7 +478,9 @@ static int __init acpi_parse_fadt(struct acpi_tabl=
e_header *table)
>>  	if (fadt->header.revision >=3D FADT2_REVISION_ID) {
>>  		/* FADT rev. 2 */
>>  		if (fadt->xpm_timer_block.space_id =3D=3D
>> -		    ACPI_ADR_SPACE_SYSTEM_IO) {
>> +		    ACPI_ADR_SPACE_SYSTEM_IO &&
>> +		    (fadt->xpm_timer_block.access_width =3D=3D 0 ||
>> +		    ACPI_ACCESS_BIT_WIDTH(fadt->xpm_timer_block.access_width) =3D=3D=
 32)) {
> Thinking about it again, since we're already tightening this
> check, I think we would better also verify bit_offset =3D=3D 0.
>
> There also looks to be an indenting blank missing here.
I will add the check and correct the indentation.
>
>> @@ -490,8 +492,10 @@ static int __init acpi_parse_fadt(struct acpi_tab=
le_header *table)
>>   	 */
>>  	if (!pmtmr_ioport) {
>>  		pmtmr_ioport =3D fadt->pm_timer_block;
>> -		pmtmr_width =3D fadt->pm_timer_length =3D=3D 4 ? 24 : 0;
>> +		pmtmr_width =3D fadt->pm_timer_length =3D=3D 4 ? 32 : 0;
>>  	}
>> +	if (pmtmr_width > 24 && !(fadt->flags & ACPI_FADT_32BIT_TIMER))
>> +		pmtmr_width =3D 24;
>>  	if (pmtmr_ioport)
>>  		printk(KERN_INFO PREFIX "PM-Timer IO Port: %#x (%u bits)\n",
>>  		       pmtmr_ioport, pmtmr_width);
> I thought we had agreed to log at the very least the case where
> the FADT flag is set but the width is less than 32 bits. (And I
> agree that perhaps there's not much more to log, unless we'd
> suspect e.g. strange access widths to be present somewhere.)
>
My bad - I've misunderstood the discussion.
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -457,16 +457,16 @@ static u64 read_pmtimer_count(void)
>>  static s64 __init init_pmtimer(struct platform_timesource *pts)
>>  {
>>      u64 start;
>> -    u32 count, target, mask =3D 0xffffff;
>> +    u32 count, target, mask;
>> =20
>> -    if ( !pmtmr_ioport || !pmtmr_width )
>> +    if ( !pmtmr_ioport )
>>          return 0;
>> =20
>> -    if ( pmtmr_width =3D=3D 32 )
>> -    {
>> -        pts->counter_bits =3D 32;
>> -        mask =3D 0xffffffff;
>> -    }
>> +    if ( pmtmr_width !=3D 24 && pmtmr_width !=3D 32 )
>> +        return 0;
>> +
>> +    pts->counter_bits =3D (int) pmtmr_width;
>> +    mask =3D (1ull << pmtmr_width) - 1;
>> =20
>>      count =3D inl(pmtmr_ioport) & mask;
>>      start =3D rdtsc_ordered();
>> @@ -486,7 +486,6 @@ static struct platform_timesource __initdata plt_p=
mtimer =3D
>>      .name =3D "ACPI PM Timer",
>>      .frequency =3D ACPI_PM_FREQUENCY,
>>      .read_counter =3D read_pmtimer_count,
>> -    .counter_bits =3D 24,
>>      .init =3D init_pmtimer
>>  };
> I'm struggling a little to see why this code churn is needed / wanted.
> The change I had suggested was quite a bit less intrusive. I'm not
> entirely opposed though, but at the very least please drop the odd
> (int) cast. If anything we want the struct field changed to unsigned
> int (but unlikely in this very patch).
>
> If you want to stick to this larger change, then also please fold the
> two if()s at the beginning of the function.

I wanted to avoid hard coding the masks -> Linux has a nice macro for
generating the masks but I haven't found a similar macro in xen.
Additionally this version sets the counter width in a single place
instead of two.

>
> Jan
Best Regards,
Grzegorz


--cNNM5kT93BLjfWRA9MTttUZY7XDXOXIy4--

--wnyo5xbJ5COLKig1aSkN1SX5mDPO82EtB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEcORGdCMIZOdpOj8ueAP19xcwDWkFAl7tAp0ACgkQeAP19xcw
DWmofAgAp4CNdDnecJipl8pUbJ9QD37Cpe52fwDXB0p0wHY7QS7xUf4AeCOfZeLF
WklS6U1ms2iH9wn5u9BKpx/nVPE+BNpwBnqwiL8IZOW+32jXkzwvDli/L9slFW37
j6cEBR5g43ieupJYN1W/30CGrRBrCs/ReUUXrfM5Fj/7gsn3SNJ1AvluduA7gRXO
0uUvqNquGowr7mwp0P+mkbGSXXQxZn4mWS/pVzmMG5J0xc3z007AfyORNWSH/xID
9bip8td/RzuYRI+wUMJFWLM3GtnjIyKVV590lE9zitGXUI9LXGepkjAeGBug+LWh
Qo628NV7GFXILO+DR8EFEGjTzOGGIg==
=U5n8
-----END PGP SIGNATURE-----

--wnyo5xbJ5COLKig1aSkN1SX5mDPO82EtB--

