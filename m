Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3511045D4D1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 07:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230654.398785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq8HJ-0004bq-IZ; Thu, 25 Nov 2021 06:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230654.398785; Thu, 25 Nov 2021 06:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq8HJ-0004Z2-F5; Thu, 25 Nov 2021 06:30:41 +0000
Received: by outflank-mailman (input) for mailman id 230654;
 Thu, 25 Nov 2021 06:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia/m=QM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mq8HI-0004Yw-Ht
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 06:30:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 343525f2-4db9-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 07:30:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D99931FD37;
 Thu, 25 Nov 2021 06:30:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93BAA13AE9;
 Thu, 25 Nov 2021 06:30:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PKP1IY0tn2F8ZQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Nov 2021 06:30:37 +0000
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
X-Inumbo-ID: 343525f2-4db9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637821837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIU1vebMBd8wd/GL848KJsCAwEfE8LZe5z9f74vbrLY=;
	b=orEUPoS3AvU5DkQuv8ea5UdpumFFCLaZK3VdfOZX3Ptw0cYZyZj44lJfD4WJp8hC7x3Qcy
	vLq0b90KaphsGVcibBBxieRSHWXaEO4If6PFFTeGZ4yL7rS/MarxUkMSc039sEbbWia0Sy
	Y32m4iEC6xWesOyrpoy5xy5fQGW3e0I=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-3-jgross@suse.com>
 <578438ad-dfb2-314c-6514-a2e72aeed091@suse.com>
 <e31fd752-a170-f169-5557-ec593b7a27e2@suse.com>
 <d7c09b1b-a34d-5352-a6f2-a444f1e27f98@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 2/4] xen: add bitmap to indicate per-domain state
 changes
Message-ID: <778d2ca8-1c21-d3bc-a40f-09ab128eab80@suse.com>
Date: Thu, 25 Nov 2021 07:30:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d7c09b1b-a34d-5352-a6f2-a444f1e27f98@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FDXy211mTUFadPTC40CSXViR5Fo94tF9C"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FDXy211mTUFadPTC40CSXViR5Fo94tF9C
Content-Type: multipart/mixed; boundary="FCH48G43GjyCFVD4jzjDhNgU6T3lyPJus";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <778d2ca8-1c21-d3bc-a40f-09ab128eab80@suse.com>
Subject: Re: [PATCH RFC 2/4] xen: add bitmap to indicate per-domain state
 changes
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-3-jgross@suse.com>
 <578438ad-dfb2-314c-6514-a2e72aeed091@suse.com>
 <e31fd752-a170-f169-5557-ec593b7a27e2@suse.com>
 <d7c09b1b-a34d-5352-a6f2-a444f1e27f98@suse.com>
In-Reply-To: <d7c09b1b-a34d-5352-a6f2-a444f1e27f98@suse.com>

--FCH48G43GjyCFVD4jzjDhNgU6T3lyPJus
Content-Type: multipart/mixed;
 boundary="------------1834F7465C7649C45BE9CC22"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1834F7465C7649C45BE9CC22
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.11.21 14:39, Jan Beulich wrote:
> On 22.11.2021 13:46, Juergen Gross wrote:
>> On 22.11.21 11:41, Jan Beulich wrote:
>>> On 14.09.2021 14:35, Juergen Gross wrote:
>>>> Add a bitmap with one bit per possible domid indicating the respecti=
ve
>>>> domain has changed its state (created, deleted, dying, crashed,
>>>> shutdown).
>>>>
>>>> Registering the VIRQ_DOM_EXC event will result in setting the bits f=
or
>>>> all existing domains and resetting all other bits.
>>>
>>> Generally I view VIRQ_DOM_EXC as overly restrictive already - what if=
 both
>>> a xenstore domain and a control domain want respective notification? =
Hence
>>
>> The general idea was that in this case the control domain should
>> register a related Xenstore watch.
>>
>>> similarly I'm not convinced a single, global instance will do here. W=
hich
>>> in turn raises the question whether the approach chosen may not take =
us
>>> far enough, and we wouldn't instead want a more precise notification =
model
>>> (i.e. not just "something has changed").
>>
>> Yes, that would be the job of Xenstore. It would provide the more
>> fine grained watches for that purpose.
>=20
> And the watch consumer still wouldn't have a way to distinguish two dom=
ain
> instances using the same ID, would it?

My further plans include new watches for domain creation/destroy
which will include the domid in the watch path reported with the
watch event. So anyone registering for domain creation watches
would no longer need another way to distinguish domains with the
same domid by other means.

The main question remaining here is whether we are okay to let
Xenstore be the instance providing that functionality to the rest
of the stack, or if we want that functionality in the hypervisor,
with all the related needed access control (Xenstore allows to
set the usability of the create/destroy watches for other domains
today).

>>>> @@ -1141,6 +1161,8 @@ static void complete_domain_destroy(struct rcu=
_head *head)
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xfree(d->vcpu);
>>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 set_bit(d->domain_id, dom_state_changed)=
;
>>>> +
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _domain_destroy(d);
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 send_global_virq(VIRQ_DOM_EXC=
);
>>>
>>> Wouldn't this better be in domain_destroy() immediately after the dom=
ain
>>> has been taken off the list, and hence is no longer "discoverable"?
>>
>> In this case the call of send_global_virq() should be moved, too,
>> I guess?
>=20
> Possibly, albeit I'd see this as a separate change to make. It doesn't
> seem outright wrong for the vIRQ to be sent late. But I agree with the
> idea of keeping sending and bit-setting together (ideally, even if this=

> was to stay here, the two would better sit truly side by side).

Okay, I'll prepend another patch moving the call of send_global_virq()
to domain_destroy().


Juergen

--------------1834F7465C7649C45BE9CC22
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

--------------1834F7465C7649C45BE9CC22--

--FCH48G43GjyCFVD4jzjDhNgU6T3lyPJus--

--FDXy211mTUFadPTC40CSXViR5Fo94tF9C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGfLYwFAwAAAAAACgkQsN6d1ii/Ey8c
5wf+IcbUQ0qBqTehrdywvNPHo7DCLtx8ZCDe6Kz2vfc8HepLlNFpoF0zHZJI2VI6Zm6zXqNBG5Xf
rh5kp2/xRxG5eMmcFZ9o36LiVVTI7YH08yFMXlIX/8BkTXhHj7urDHIyVhtrHQ4RO90e5yZpb4yV
CtCQrgcAZA5yKauqdQEnSO7AbxB7ShWhdPFUNvumTJdC2BBCSPO2M750atclEP61W8KvSqEpWSlv
dznwYCspj5ZrVSr6ICSzHtX56+akwVloVntoZTg7xGu9KiqDosk33WEaxqX0hO8CxlFlhW7x289w
RLsHvn/Nej0epMwvnZ1eg5QlPKGnrLfUXH1d6Z6ZCA==
=N+pU
-----END PGP SIGNATURE-----

--FDXy211mTUFadPTC40CSXViR5Fo94tF9C--

