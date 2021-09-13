Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5585540861B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 10:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185518.334206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgyE-0007yh-1p; Mon, 13 Sep 2021 08:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185518.334206; Mon, 13 Sep 2021 08:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgyD-0007wM-VB; Mon, 13 Sep 2021 08:05:41 +0000
Received: by outflank-mailman (input) for mailman id 185518;
 Mon, 13 Sep 2021 08:05:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=huvW=OD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mPgyC-0007wG-Pv
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 08:05:40 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61e458aa-1469-11ec-b3a4-12813bfff9fa;
 Mon, 13 Sep 2021 08:05:39 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A8E421FA1;
 Mon, 13 Sep 2021 08:05:38 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 203B213659;
 Mon, 13 Sep 2021 08:05:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id nwFRBlIGP2HXCgAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 13 Sep 2021 08:05:38 +0000
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
X-Inumbo-ID: 61e458aa-1469-11ec-b3a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631520338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2dfjrvmvc3Y2ulpeZSZLUXAHX6/eqhBEVG8YAU18fkA=;
	b=Pz2KtEvL5sQy/5SD/nrYKaEA2lQNaqJmIUzGT2gcGRhawIEp6hnALaGfFNuRnU9f282Y46
	dA9qJTSZuYkyRFdS52wJPRbXHUO+hvvTz3BuMHQlNwE/9BAo81GgGBRBQ3rEb5tqZYrgIM
	QtbgB0FzV7YvY0Rni7Ggo0Jpm/JO9MA=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
 <a192a226-bdfe-6db2-c501-5e5e17c74de0@suse.com>
 <fbb173f8-f8a9-7eef-0e7d-f18dcbb422f3@suse.com>
 <cf072c09-1a71-5b95-76e6-d10c9c9d1cdf@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Introduction of stable interface between Xenstore and hypervisor
Message-ID: <284bc539-6234-70f0-be93-92f40655dced@suse.com>
Date: Mon, 13 Sep 2021 10:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <cf072c09-1a71-5b95-76e6-d10c9c9d1cdf@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ToNKcA92ly3P5i9R9jeMiy0cehp5snm5g"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ToNKcA92ly3P5i9R9jeMiy0cehp5snm5g
Content-Type: multipart/mixed; boundary="TJUbi4qzMZBHDy5k73W36h7zze81OrKt3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <284bc539-6234-70f0-be93-92f40655dced@suse.com>
Subject: Re: Introduction of stable interface between Xenstore and hypervisor
References: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
 <a192a226-bdfe-6db2-c501-5e5e17c74de0@suse.com>
 <fbb173f8-f8a9-7eef-0e7d-f18dcbb422f3@suse.com>
 <cf072c09-1a71-5b95-76e6-d10c9c9d1cdf@suse.com>
In-Reply-To: <cf072c09-1a71-5b95-76e6-d10c9c9d1cdf@suse.com>

--TJUbi4qzMZBHDy5k73W36h7zze81OrKt3
Content-Type: multipart/mixed;
 boundary="------------D5DF2817921FCAE9EE809A44"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D5DF2817921FCAE9EE809A44
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.09.21 09:39, Jan Beulich wrote:
> On 10.09.2021 15:46, Juergen Gross wrote:
>> On 10.09.21 15:22, Jan Beulich wrote:
>>> On 09.09.2021 08:27, Juergen Gross wrote:
>>>> Today Xenstore is using one unstable interface to retrieve the state=

>>>> of a domain (existing, dying).
>>>>
>>>> In order to decouple Xenstore further from the hypervisor, a stable
>>>> interface should be established. This new interface should cover the=

>>>> following functionality:
>>>>
>>>> - get the needed state of a domain (existing, dying)
>>>> - get a unique identifier per domain telling Xenstore that a domid
>>>>      has been reused (today Xenstore could in theory miss this)
>>>> - provide a way to avoid having to get the state of all domains when=

>>>>      a state change of a domain has been signaled (there is only an =
event
>>>>      "some domain has changed state" today: VIRQ_DOM_EXC)
>>>>
>>>> I'm suggesting the following hypervisor modifications:
>>>>
>>>> - Addition of a global 64 bit domain sequence counter. This counter
>>>>      will be incremented each time a new domain is created.
>>>> - Addition of a sequence count to struct domain. It will be set to
>>>>      the value of the new global domain sequence counter when the do=
main
>>>>      is being created.
>>>
>>> This looks like an "extended domain ID", which I think we want to
>>> avoid unless exposure is extremely limited. Since we can't easily
>>> predict what future usage this may have, I would suggest to seed the
>>> global with a 15-bit (or wider) random value. I'd like to further
>>> suggest considering to not have this be maintained by simply
>>> incrementing, to make very clear to consumers that the actual value
>>> has no other meaning. This could be done by multiplying by a random
>>> odd number larger than 1 (determined at build or boot time). All we
>>> want to guarantee is that numbers don't repeat (earlier than a 64-bit=

>>> value would wrap when linearly incremented).
>>
>> Fine with me.
>>
>>>
>>>> - Addition of a global bitmap with one bit for each possible domid
>>>>      (resulting in a 4 kB page). Each time the state of a domain is =
changed
>>>>      (domain creation, shutdown, deletion) the related bit is set.
>>>>      When the VIRQ_DOM_EXC event is being registered the bitmap is r=
eset to
>>>>      have the bits set for all existing domains.
>>>
>>> This page, as I understand from the subsequent item, is not intended
>>> to be exposed to the domain running xenstored (or any other one)?
>>
>> Correct.
>>
>>>
>>>> - Addition of a new stable hypercall ("get domain state") returning =
the
>>>>      following information:
>>>>      + domid of a domain having the bit set in above bitmap
>>>>      + state of that domain (existing, dying)
>>>>      + sequence count of that domain
>>>>      The related bit is reset in the bitmap as a side effect of the =
call.
>>>
>>> What I'd like us to consider up front is whether xenstored is going
>>> to remain only entity interested in this kind of information. The
>>> entire design looks to leverage that there's only a single consumer
>>> in the system.
>>
>> Right. I'm just writing some RFC patches, and I have coded this
>> interface to be usable only for the domain having VIRQ_DOM_EXC
>> registered.
>>
>> The alternative (IMO) would have been to expose the domain-state
>> bitmap to Xenstore (and/or other interested parties).
>=20
> Right, but then a simple bitmap wouldn't suffice, would it? What
> would be the criteria to clear a bit there? All interested parties
> would have to signal that they've observed the respective state
> change.

For this kind of interface to work with multiple consumers the state
information of each domain would need to be contained in this memory
area, so this would probably require at least one byte for each domain.
Each consumer would need to keep a shadow copy of the last read
information in order to be able to detect any state modifications.

But this data would again introduce today's problem: a fast shutdown
of a domain and creation of another domain with the same domid could
get lost. So the memory area would even need to include the unique
domain identifier, increasing the size of the data per domain to at
least 8 bytes.

> Further, while - like you - I'd prefer to avoid sharing the bitmap,
> the question remains whether such further interested parties are
> conceivable.

A good question. Today's design doesn't support multiple interested
parties at the hypervisor interface level. There can only be one
consumer of VIRQ_DOM_EXC.

>=20
>>> I understand the caller would iterate over this hypercall. Is there
>>> concern about this iteration never finishing, if e.g. a guest gets
>>> rebooted quickly enough?
>>
>> No. As a reboot will always include Xenstore activity, there is no
>> chance for that to happen.
>=20
> Is this really the case? I thought that was an implementation
> aspect of the tool stack(s). Take an XTF test: For it to be run
> (no drivers, no qemu) is it really necessary to fiddle with
> Xenstore? If from an abstract pov it isn't, then the hypervisor
> should not become dependent upon such. IMO, that is.

In case you want to run without Xenstore then don't start it. In case
Xenstore is running it will receive the VIRQ_DOM_EXC events and it
will react accordingly.

The unbounded loop can happen only if you are running Xenstore, but you
are creating new guests by not using the normal Xen tools (those will
interact with Xenstore for all guests, even those without any external
references). And even in this case all you would get is quite a busy
Xenstore.

> Apart from this - how would Xenstore activity prevent this loop
> from becoming unbounded? Is this because you expect other
> operations to be serialized with running this loop? If so, how
> do you prevent starvation from this loop taking long?

Xenstore is single threaded and it is processing any external events
from a main loop. So either it is in this hypercall loop, or it is
reacting to requests, e.g. from the tools needed for domain creation.
The activity in this loop isn't very time consuming (with the new
interface it is even much less time consuming than today), so the
starvation case would more look like a hickup.


Juergen

--------------D5DF2817921FCAE9EE809A44
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------D5DF2817921FCAE9EE809A44--

--TJUbi4qzMZBHDy5k73W36h7zze81OrKt3--

--ToNKcA92ly3P5i9R9jeMiy0cehp5snm5g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE/BlEFAwAAAAAACgkQsN6d1ii/Ey+h
vQf+IAr7Llpb0m9E2fyL4/LBGMW8kg8Z2b/zhwe5DHBul7LrFs2U+DcfYHM00QnotELWdkITvy13
aaPqkHygVBoCrRz7N7ny184KmxgeiBWbvUR4L97+IOHuArNKBT6ZLCpD70DutgtuO8BnXNiS0Xtr
LGbv++VGOey57KUv51ywzHo1McwlAHwIbUlr/umJuCrJeMWacJQMq4Jp3+7Ntfjv1sIofgEOKoRf
RdY9/EV30ZtDbRRR5NCCM4ni8zACSCC9J698KQw0VTI/Pg7FQBOk/n96zZjOxXQITBJFhPxJg68J
yPtAD1e4/kKmd55c/X1pmQs0Mdq4pT4x80coV+Pcag==
=d3ef
-----END PGP SIGNATURE-----

--ToNKcA92ly3P5i9R9jeMiy0cehp5snm5g--

