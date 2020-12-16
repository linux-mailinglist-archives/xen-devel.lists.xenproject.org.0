Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE42DBC8D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 09:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55106.95885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpS46-0007ke-1O; Wed, 16 Dec 2020 08:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55106.95885; Wed, 16 Dec 2020 08:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpS45-0007kH-UT; Wed, 16 Dec 2020 08:21:41 +0000
Received: by outflank-mailman (input) for mailman id 55106;
 Wed, 16 Dec 2020 08:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DJND=FU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpS44-0007kC-2r
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 08:21:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8a519fc-18b3-4b28-b702-1042ac86e206;
 Wed, 16 Dec 2020 08:21:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB288AD6A;
 Wed, 16 Dec 2020 08:21:37 +0000 (UTC)
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
X-Inumbo-ID: f8a519fc-18b3-4b28-b702-1042ac86e206
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608106897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W1oenR6GpZ5zDvXXt7ITUbn+6gm5vPT2aasqCb5slls=;
	b=b07+yc3wArjNoG1RGjFAJzVPxrzvX6dR3Ucs1JYfW5Z/jlUkdRzRkeJcV9XHcAXtrRAiGO
	gqczg6z/dn1uFQqXhmxL6yZ0g5iN10QCwdUiA99onofVXQ4MIOCBzYfOLG2zHOz4y6DieK
	Dhz0zYWkDL+uSvjQVodAx1WI39NxzMg=
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201215111055.3810-1-jgross@suse.com>
 <2deac9ce-0c27-a472-7d51-b91a640d92ed@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2] xen/xenbus: make xs_talkv() interruptible
Message-ID: <8d26b752-b7ba-159f-5bed-bb015a06d819@suse.com>
Date: Wed, 16 Dec 2020 09:21:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2deac9ce-0c27-a472-7d51-b91a640d92ed@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VEsOmEl5Q0L2GQ2SPMrdoseYU2Ng77RxF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VEsOmEl5Q0L2GQ2SPMrdoseYU2Ng77RxF
Content-Type: multipart/mixed; boundary="Bqj9vE9hjQIUGpl7s3f4xXuzpSl9QgIui";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <8d26b752-b7ba-159f-5bed-bb015a06d819@suse.com>
Subject: Re: [PATCH v2] xen/xenbus: make xs_talkv() interruptible
References: <20201215111055.3810-1-jgross@suse.com>
 <2deac9ce-0c27-a472-7d51-b91a640d92ed@citrix.com>
In-Reply-To: <2deac9ce-0c27-a472-7d51-b91a640d92ed@citrix.com>

--Bqj9vE9hjQIUGpl7s3f4xXuzpSl9QgIui
Content-Type: multipart/mixed;
 boundary="------------10DC628869F4F77CEAD28FF5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------10DC628869F4F77CEAD28FF5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.12.20 21:59, Andrew Cooper wrote:
> On 15/12/2020 11:10, Juergen Gross wrote:
>> In case a process waits for any Xenstore action in the xenbus driver
>> it should be interruptible by signals.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - don't special case SIGKILL as libxenstore is handling -EINTR fine
>> ---
>>   drivers/xen/xenbus/xenbus_xs.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbu=
s_xs.c
>> index 3a06eb699f33..17c8f8a155fd 100644
>> --- a/drivers/xen/xenbus/xenbus_xs.c
>> +++ b/drivers/xen/xenbus/xenbus_xs.c
>> @@ -205,8 +205,15 @@ static bool test_reply(struct xb_req_data *req)
>>  =20
>>   static void *read_reply(struct xb_req_data *req)
>>   {
>> +	int ret;
>> +
>>   	do {
>> -		wait_event(req->wq, test_reply(req));
>> +		ret =3D wait_event_interruptible(req->wq, test_reply(req));
>> +
>> +		if (ret =3D=3D -ERESTARTSYS && signal_pending(current)) {
>> +			req->msg.type =3D XS_ERROR;
>> +			return ERR_PTR(-EINTR);
>> +		}
>=20
> So now I can talk fully about the situations which lead to this, I thin=
k
> there is a bit more complexity.
>=20
> It turns out there are a number of issues related to running a Xen
> system with no xenstored.
>=20
> 1) If a xenstore-write occurs during startup before init-xenstore-domai=
n
> runs, the former blocks on /dev/xen/xenbus waiting for xenstored to
> reply, while the latter blocks on /dev/xen/xenbus_backend when trying t=
o
> tell the dom0 kernel that xenstored is in dom1.=C2=A0 This effectively
> deadlocks the system.

This should be easy to solve: any request to /dev/xen/xenbus should
block upfront in case xenstored isn't up yet (could e.g. wait
interruptible until xenstored_ready is non-zero).

> 2) If xenstore-watch is running when xenstored dies, it spins at 100%
> cpu usage making no system calls at all.=C2=A0 This is caused by bad er=
ror
> handling from xs_watch(), and attempting to debug found:

Can you expand on "bad error handling from xs_watch()", please?

>=20
> 3) (this issue).=C2=A0 If anyone starts xenstore-watch with no xenstore=
d
> running at all, it blocks in D in the kernel.

Should be handled with solution for 1).

>=20
> The cause is the special handling for watch/unwatch commands which,
> instead of just queuing up the data for xenstore, explicitly waits for
> an OK for registering the watch.=C2=A0 This causes a write() system cal=
l to
> block waiting for a non-existent entity to reply.
>=20
> So while this patch does resolve the major usability issue I found (I
> can't even SIGINT and get my terminal back), I think there are issues.
>=20
> The reason why XS_WATCH/XS_UNWATCH are special cased is because they do=

> require special handling.=C2=A0 The main kernel thread for processing
> incoming data from xenstored does need to know how to associate each
> async XS_WATCH_EVENT to the caller who watched the path.
>=20
> Therefore, depending on when this cancellation hits, we might be in any=

> of the following states:
>=20
> 1) the watch is queued in the kernel, but not even sent to xenstored ye=
t
> 2) the watch is queued in the xenstored ring, but not acted upon
> 3) the watch is queued in the xenstored ring, and the xenstored has see=
n
> it but not replied yet
> 4) the watch has been processed, but the XS_WATCH reply hasn't been
> received yet
> 5) the watch has been processed, and the XS_WATCH reply received
>=20
> State 5 (and a little bit) is the normal success path when xenstored ha=
s
> acted upon the request, and the internal kernel infrastructure is set u=
p
> appropriately to handle XS_WATCH_EVENTs.
>=20
> States 1 and 2 can be very common if there is no xenstored (or at least=
,
> it hasn't started up yet).=C2=A0 In reality, there is either no xenstor=
ed, or
> it is up and running (and for a period of time during system startup,
> these cases occur in sequence).

Yes. this is the reason we can't just reject a user request if xenstored
hasn't been detected yet: it could be just starting.

>=20
> As soon as the XS_WATCH event has been written into the xenstored ring,=

> it is not safe to cancel.=C2=A0 You've committed to xenstored processin=
g the
> request (if it is up).

I'm not sure this is true. Cancelling it might result in a stale watch
in xenstored, but there shouldn't be a problem related to that. In case
that watch fires the event will normally be discarded by the kernel as
no matching watch is found in the kernel's data. In case a new watch
has been setup with the same struct xenbus_watch address (which is used
as the token), then this new watch might fire without the node of the
new watch having changed, but spurious watch events are defined to be
okay (OTOH the path in the event might look strange to the handler).

>=20
> If xenstored is actually up and running, its fine and necessary to
> block.=C2=A0 The request will be processed in due course (timing subjec=
t to
> the client and server load).=C2=A0 If xenstored isn't up, blocking isn'=
t ok.
>=20
> Therefore, I think we need to distinguish "not yet on the ring" from "o=
n
> the ring", as our distinction as to whether cancelling is safe, and
> ensure we don't queue anything on the ring before we're sure xenstored
> has started up.
>=20
> Does this make sense?

Basically, yes.


Juergen

--------------10DC628869F4F77CEAD28FF5
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

--------------10DC628869F4F77CEAD28FF5--

--Bqj9vE9hjQIUGpl7s3f4xXuzpSl9QgIui--

--VEsOmEl5Q0L2GQ2SPMrdoseYU2Ng77RxF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/Zw5EFAwAAAAAACgkQsN6d1ii/Ey9G
iAgAlIlcZMgB8Dan2KsF5BlNOq2VL4q6YOgTK9xF9n8ihKQAvAv47VXBa4Pev6H1k4/Yj+SVxwKO
hjP4WTIPGawAZAeXCzR8kDcZnr+aPPXb1ISMT6VHPID6D6nHCiqLLoH7aGNjeL9y2c7gClHMuezi
ZWpsP+t2PR3EbwNBnLV+fuAkJcgaq7K5tvFwpCwOq94Dj+jz6GZCYwZPe5COtpE03hRzSBG0KOPj
EakRCC0u8ACQVlvHQ9P/uIDOzbtySGPVRMQwly9ZaBDTdeob/ZnkJtLx+Ln2OTWuPrXksnz9MUDz
WNVUwnKREUX9Yyr4Q/yZCrz1uLR9J6eStJn6T3YD4g==
=abTa
-----END PGP SIGNATURE-----

--VEsOmEl5Q0L2GQ2SPMrdoseYU2Ng77RxF--

