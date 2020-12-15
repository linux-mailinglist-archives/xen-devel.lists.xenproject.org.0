Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A72DA9FE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 10:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52995.92482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp6YH-0003xx-Cs; Tue, 15 Dec 2020 09:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52995.92482; Tue, 15 Dec 2020 09:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp6YH-0003xY-9I; Tue, 15 Dec 2020 09:23:25 +0000
Received: by outflank-mailman (input) for mailman id 52995;
 Tue, 15 Dec 2020 09:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kp6YF-0003xN-EL
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 09:23:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0775729c-c8d0-4f28-8434-c4793c185158;
 Tue, 15 Dec 2020 09:23:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F769AC7F;
 Tue, 15 Dec 2020 09:23:21 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0775729c-c8d0-4f28-8434-c4793c185158
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608024201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgAHZ0iX5Zkd6J19lMj90flPiXHuCowYOehgKczB4TA=;
	b=Yoj3aZDkzkGiWcxOYyyr9ypYYQHdkGQRzEMLn23bbdrdUYx/zcUMe+14nsElulAydQ3w6E
	m7BVKetqkdi/E7tl+sv8tpS3rnqewJsPNrrizhxMX8flBorn9W4SV4j11wStMNL5dnbAxX
	bM9hrSyg/+oQ27Z5RAeq5JCwfUiEoHo=
Subject: Re: [PATCH v5 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201215063319.23290-1-jgross@suse.com>
 <20201215063319.23290-2-jgross@suse.com>
 <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d2e1bff5-9630-3a50-4149-cdf9b3a4e091@suse.com>
Date: Tue, 15 Dec 2020 10:23:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VMEoU8Xs3ayWh9XpXgQF1J6tVSumVh6D0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VMEoU8Xs3ayWh9XpXgQF1J6tVSumVh6D0
Content-Type: multipart/mixed; boundary="VjGm9D2P4KBNFStnLj1qCQRRG53IqUz1r";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <d2e1bff5-9630-3a50-4149-cdf9b3a4e091@suse.com>
Subject: Re: [PATCH v5 1/3] xen/arm: add support for
 run_in_exception_handler()
References: <20201215063319.23290-1-jgross@suse.com>
 <20201215063319.23290-2-jgross@suse.com>
 <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>
In-Reply-To: <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>

--VjGm9D2P4KBNFStnLj1qCQRRG53IqUz1r
Content-Type: multipart/mixed;
 boundary="------------730045B961B9A5E060E398DE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------730045B961B9A5E060E398DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.12.20 10:02, Jan Beulich wrote:
> On 15.12.2020 07:33, Juergen Gross wrote:
>> --- a/xen/include/asm-arm/bug.h
>> +++ b/xen/include/asm-arm/bug.h
>> @@ -15,65 +15,62 @@
>>  =20
>>   struct bug_frame {
>>       signed int loc_disp;    /* Relative address to the bug address *=
/
>> -    signed int file_disp;   /* Relative address to the filename */
>> +    signed int ptr_disp;    /* Relative address to the filename or fu=
nction */
>>       signed int msg_disp;    /* Relative address to the predicate (fo=
r ASSERT) */
>>       uint16_t line;          /* Line number */
>>       uint32_t pad0:16;       /* Padding for 8-bytes align */
>>   };
>>  =20
>>   #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
>>   #define bug_line(b) ((b)->line)
>>   #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>>  =20
>> -#define BUGFRAME_warn   0
>> -#define BUGFRAME_bug    1
>> -#define BUGFRAME_assert 2
>> +#define BUGFRAME_run_fn 0
>> +#define BUGFRAME_warn   1
>> +#define BUGFRAME_bug    2
>> +#define BUGFRAME_assert 3
>>  =20
>> -#define BUGFRAME_NR     3
>> +#define BUGFRAME_NR     4
>>  =20
>>   /* Many versions of GCC doesn't support the asm %c parameter which w=
ould
>>    * be preferable to this unpleasantness. We use mergeable string
>>    * sections to avoid multiple copies of the string appearing in the
>>    * Xen image.
>>    */
>> -#define BUG_FRAME(type, line, file, has_msg, msg) do {               =
       \
>> +#define BUG_FRAME(type, line, ptr, msg) do {                         =
       \
>>       BUILD_BUG_ON((line) >> 16);                                     =
        \
>>       BUILD_BUG_ON((type) >=3D BUGFRAME_NR);                          =
          \
>>       asm ("1:"BUG_INSTR"\n"                                          =
        \
>> -         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"         =
       \
>> -         "2:\t.asciz " __stringify(file) "\n"                        =
       \
>> -         "3:\n"                                                      =
       \
>> -         ".if " #has_msg "\n"                                        =
       \
>> -         "\t.asciz " #msg "\n"                                       =
       \
>> -         ".endif\n"                                                  =
       \
>> -         ".popsection\n"                                             =
       \
>> -         ".pushsection .bug_frames." __stringify(type) ", \"a\", %pro=
gbits\n"\
>> -         "4:\n"                                                      =
       \
>> +         ".pushsection .bug_frames." __stringify(type) ", \"a\", %%pr=
ogbits\n"\
>> +         "2:\n"                                                      =
       \
>>            ".p2align 2\n"                                             =
        \
>> -         ".long (1b - 4b)\n"                                         =
       \
>> -         ".long (2b - 4b)\n"                                         =
       \
>> -         ".long (3b - 4b)\n"                                         =
       \
>> +         ".long (1b - 2b)\n"                                         =
       \
>> +         ".long (%0 - 2b)\n"                                         =
       \
>> +         ".long (%1 - 2b)\n"                                         =
       \
>>            ".hword " __stringify(line) ", 0\n"                        =
        \
>> -         ".popsection");                                             =
       \
>> +         ".popsection" :: "i" (ptr), "i" (msg));                     =
       \
>>   } while (0)
>=20
> The comment ahead of the construct now looks to be at best stale, if
> not entirely pointless. The reference to %c looks quite strange here
> to me anyway - I can only guess it appeared here because on x86 one
> has to use %c to output constants as operands for .long and alike,
> and this was then tried to use on Arm as well without there really
> being a need.

Probably so.

I can remove the comment, but would like an Arm maintainer to confirm.


Juergen

--------------730045B961B9A5E060E398DE
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------730045B961B9A5E060E398DE--

--VjGm9D2P4KBNFStnLj1qCQRRG53IqUz1r--

--VMEoU8Xs3ayWh9XpXgQF1J6tVSumVh6D0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/YgIgFAwAAAAAACgkQsN6d1ii/Ey+D
qAgAj4vCgzlr8pfvdMMHrA4Op7OqFpui67VwxjLOaC1ucQQAaJYwVdiA+/5r1gIUimsA/dL6xIIc
lkox2BFnAbBMBU8jqgHU671Sh3gDUAxp9cw4vaDkeUN3KZHFegpX+6k/QyEmboP42pp2Pzigzwpj
TEDG6s1hGQEUBRc0FOITuC2f2dOznf4w9uLOEXBR1Lyjc/8IkolbnyP63of3sCmn6zwRAUTyr5iF
pTF74A5db3VlGt3o/QIBIiXZ8rmaCGgnuWyUOpPie8gnaRUJSK4mWbYXqxRjra/0mmWDsbSzq8zU
GOCI+W2nIAu4vemrI3pdPyCJ/cqtc0FX9PtSZPYZ+Q==
=qy3B
-----END PGP SIGNATURE-----

--VMEoU8Xs3ayWh9XpXgQF1J6tVSumVh6D0--

