Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A7A2DCD15
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 08:54:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55743.97128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpo6x-0004Xp-Gp; Thu, 17 Dec 2020 07:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55743.97128; Thu, 17 Dec 2020 07:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpo6x-0004XQ-DK; Thu, 17 Dec 2020 07:54:07 +0000
Received: by outflank-mailman (input) for mailman id 55743;
 Thu, 17 Dec 2020 07:54:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpo6v-0004XL-76
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 07:54:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0eff6a1-0b9d-4edb-bdc5-566d6cc29650;
 Thu, 17 Dec 2020 07:54:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66384AE63;
 Thu, 17 Dec 2020 07:54:02 +0000 (UTC)
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
X-Inumbo-ID: c0eff6a1-0b9d-4edb-bdc5-566d6cc29650
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608191642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b34nmTylTb7jvC6mCLKpAEF3ItDic7YMvlbI0uPZYSc=;
	b=Cbi5L21o5atctUyqtANYKPH86edhEdbqCrraigegG2Mt51Anf5nWpS/5j7ZeAPwEGSYqMW
	a3OyGOxh8djv6rwV7TScybm256XXGY2sJ3zNF3rANgWJN5DgN1NIPpMOO3xejs5nJiQIkU
	DnjTrZ2xs6QDqPdyZkce1UpA5SmfrRA=
Subject: Re: [PATCH v3 1/8] xen/cpupool: support moving domain between
 cpupools with different granularity
To: Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-2-jgross@suse.com>
 <a22954117d8dd36fc0e1b9470efb72c5b80ad393.camel@suse.com>
 <627b62f4-1011-36fa-9623-bbd30834010a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <da457cc2-754c-80a8-da10-e7fbafe7ae3c@suse.com>
Date: Thu, 17 Dec 2020 08:54:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <627b62f4-1011-36fa-9623-bbd30834010a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7JvlJ9OcfmKqDh71FL4P2LCbDBCJ8r52j"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7JvlJ9OcfmKqDh71FL4P2LCbDBCJ8r52j
Content-Type: multipart/mixed; boundary="fgai9odRjUs2Wr1MLGiFilrL3forXluFU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <da457cc2-754c-80a8-da10-e7fbafe7ae3c@suse.com>
Subject: Re: [PATCH v3 1/8] xen/cpupool: support moving domain between
 cpupools with different granularity
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-2-jgross@suse.com>
 <a22954117d8dd36fc0e1b9470efb72c5b80ad393.camel@suse.com>
 <627b62f4-1011-36fa-9623-bbd30834010a@suse.com>
In-Reply-To: <627b62f4-1011-36fa-9623-bbd30834010a@suse.com>

--fgai9odRjUs2Wr1MLGiFilrL3forXluFU
Content-Type: multipart/mixed;
 boundary="------------0F50E50340E5B58C4EA2DC31"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0F50E50340E5B58C4EA2DC31
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.12.20 08:49, Jan Beulich wrote:
> On 16.12.2020 18:52, Dario Faggioli wrote:
>> On Wed, 2020-12-09 at 17:09 +0100, Juergen Gross wrote:
>>> When moving a domain between cpupools with different scheduling
>>> granularity the sched_units of the domain need to be adjusted.
>>>
>>> Do that by allocating new sched_units and throwing away the old ones
>>> in sched_move_domain().
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>> This looks fine, and can have:
>>
>> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
>>
>> I would only have one request. It's not a huge deal, and probably not
>> worth a resend only for that, but if either you or the committer are u=
p
>> for complying with that in whatever way you find the most suitable,
>> that would be great.
>=20
> I'd certainly be okay making this adjustment while committing, as
> long as J=C3=BCrgen agrees. With ...
>=20
>> I.e., can we...
>>> ---
>>>  =C2=A0xen/common/sched/core.c | 121 ++++++++++++++++++++++++++++++--=
------
>>> --
>>>  =C2=A01 file changed, 90 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>> index a429fc7640..2a61c879b3 100644
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>>
>>> [...]
>>> -=C2=A0=C2=A0=C2=A0 old_ops =3D dom_scheduler(d);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 old_domdata =3D d->sched_priv;
>>>
>> Move *here* (i.e., above this new call to cpumask_first()) the comment=

>> that is currently inside the loop?
>>>  =20
>>> +=C2=A0=C2=A0=C2=A0 new_p =3D cpumask_first(d->cpupool->cpu_valid);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 for_each_sched_unit ( d, unit )
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock_t *lock;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Temporarily move =
all units to same processor to make
>>> locking
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * easier when movin=
g the new units to the new processors.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>
>> This one here, basically ^^^
>=20
> ... this comment moved out of here, I'd be tempted to suggest to
> make ...
>=20
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock =3D unit_schedule_lo=
ck_irq(unit);
>=20
> ... this the variable's initializer then at the same time.

Fine with me.


Juergen


--------------0F50E50340E5B58C4EA2DC31
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

--------------0F50E50340E5B58C4EA2DC31--

--fgai9odRjUs2Wr1MLGiFilrL3forXluFU--

--7JvlJ9OcfmKqDh71FL4P2LCbDBCJ8r52j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/bDpkFAwAAAAAACgkQsN6d1ii/Ey8v
CAf/VP+OcJYy0CLjQCa+N5YQ9nA7TWO0MOcpmAI070rzFy8rNJQX+2e3SS1JAAJdVDHjvm1Nx/h+
sYgAxKgvbjSv+JuWzzSCSdBxL54pT0o78vr8U+6Qr1lV9Mi9yj6JLgXzeB5qHJCxw6IilIhtWIDH
cWas8JWFqgNA6THQMP95OYw3onjmu7FaWAJVDc31ht7gB5rUOOZZuQ2mP6qeZDng3YApPlsfeoLp
P5OKHdx4j94QBoWVUD/oPz5n9Nx6iR5j+t+Bv/fkOdVjsjdaycjFhYxIJZD8uHz9jqlu6t2dgE8E
/GOkJjptWGCSh7klqHIWcNUHuPfqJYkblGRxN4qKAw==
=o+Ak
-----END PGP SIGNATURE-----

--7JvlJ9OcfmKqDh71FL4P2LCbDBCJ8r52j--

