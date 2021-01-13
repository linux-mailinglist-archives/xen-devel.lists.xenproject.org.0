Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0A62F500F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 17:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66616.118376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzj6S-0005hI-OJ; Wed, 13 Jan 2021 16:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66616.118376; Wed, 13 Jan 2021 16:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzj6S-0005gt-KJ; Wed, 13 Jan 2021 16:34:36 +0000
Received: by outflank-mailman (input) for mailman id 66616;
 Wed, 13 Jan 2021 16:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jk6d=GQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kzj6R-0005go-35
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 16:34:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0e8c0d1-e0ce-4ae9-8fa5-6e7247cdfe4f;
 Wed, 13 Jan 2021 16:34:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB97FAD26;
 Wed, 13 Jan 2021 16:34:32 +0000 (UTC)
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
X-Inumbo-ID: f0e8c0d1-e0ce-4ae9-8fa5-6e7247cdfe4f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610555673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y0mBtjTm9tI2zYATSEg9AfEdbEuNGirhN7Eu86dNmJc=;
	b=ObIkV7gRL8jQWVagT+Wqipy70cmzgoQV7tvHHE0P+29CP19JBz4pNqVZfqCDhL4Ad197Tf
	sIBtmxKsr/U4B3YzcrbndhGCrzM9uiMzLdNSQBDM7VBqAoDUBfH8DnutiSBxLWaJJwAEhw
	JIR/HckJOnp9WE8r/Qc1znU/ihLk9To=
To: Edwin Torok <edvin.torok@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org"
 <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgrall@amazon.com" <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20201215163603.21700-1-jgross@suse.com>
 <20201215163603.21700-7-jgross@suse.com>
 <d2d7ff33b2d255517a90cbf649761fb23385aefb.camel@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v10 06/25] tools/xenstore: add live update command to
 xenstore-control
Message-ID: <eefc9ac3-67a8-baad-afe0-1fdae432389a@suse.com>
Date: Wed, 13 Jan 2021 17:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <d2d7ff33b2d255517a90cbf649761fb23385aefb.camel@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="akYxfMSWvb1MtJ3swLTRixJaY97JYxFwi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--akYxfMSWvb1MtJ3swLTRixJaY97JYxFwi
Content-Type: multipart/mixed; boundary="uaxqBXLIXN7SgP8z54je4Ys5c0sod7IkU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Edwin Torok <edvin.torok@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org"
 <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgrall@amazon.com" <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Message-ID: <eefc9ac3-67a8-baad-afe0-1fdae432389a@suse.com>
Subject: Re: [PATCH v10 06/25] tools/xenstore: add live update command to
 xenstore-control
References: <20201215163603.21700-1-jgross@suse.com>
 <20201215163603.21700-7-jgross@suse.com>
 <d2d7ff33b2d255517a90cbf649761fb23385aefb.camel@citrix.com>
In-Reply-To: <d2d7ff33b2d255517a90cbf649761fb23385aefb.camel@citrix.com>

--uaxqBXLIXN7SgP8z54je4Ys5c0sod7IkU
Content-Type: multipart/mixed;
 boundary="------------3F527811B4CA84B34C9C5959"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3F527811B4CA84B34C9C5959
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.01.21 15:42, Edwin Torok wrote:
> On Tue, 2020-12-15 at 17:35 +0100, Juergen Gross wrote:
>=20
>> [...]
>> +static int live_update_start(struct xs_handle *xsh, bool force,
>> unsigned int to)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int len =3D 0;
>> +=C2=A0=C2=A0=C2=A0 char *buf =3D NULL, *ret;
>> +=C2=A0=C2=A0=C2=A0 time_t time_start;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (asprintf(&ret, "%u", to) < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>> +=C2=A0=C2=A0=C2=A0 len =3D add_to_buf(&buf, "-s", len);
>> +=C2=A0=C2=A0=C2=A0 len =3D add_to_buf(&buf, "-t", len);
>> +=C2=A0=C2=A0=C2=A0 len =3D add_to_buf(&buf, ret, len);
>> +=C2=A0=C2=A0=C2=A0 free(ret);
>> +=C2=A0=C2=A0=C2=A0 if (force)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 len =3D add_to_buf(&buf, "=
-F", len);
>> +=C2=A0=C2=A0=C2=A0 if (len < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (time_start =3D time(NULL); time(NULL) - time_=
start < to;) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D xs_control_command=
(xsh, "live-update", buf, len);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strcmp(ret, "BUSY"))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>> +=C2=A0=C2=A0=C2=A0 }
>=20
> We've discovered issues with this during testing: when a live-update is=

> not possible (e.g. guest with active transaction held open on purpose)
> xenstored gets flooded with live-update requests until the timeout is
> reached.
>=20
> This is problematic for multiple reasons:
> * flooding xenstored reduces its throughput, and makes it use 100% CPU.=

> Depending on the implementation and configuration it may also flood the=

> logs (which isn't fatal, the system still stays alive if you ENOSPC on
> /var/log, but it makes it difficult to debug issues if a live update
> gets you to ENOSPC as you may not see actual failures from after the
> live update).
> * flooding xenstored causes the evtchn to overflow and AFAICT neither
> xenstored or oxenstored is capable of coping with that (oxenstored
> infinite loops when that happens). IIUC this needs to be fixed in the
> kernel, so it doesn't return EFBIG in the first place. As a workaround
> I added a sleep(1) in this loop
> * the timeout is hit on both client and server sides, but depending on
> rounding almost always happens on the client side first which prevents
> us from displaying a more informative error message from the server. As=

> a workaround I increased the client side timeout by 2s to cope with
> rounding and give the server a chance to reply. Oxenstored can reply
> with a list of domains preventing the live-update for example.
>=20
> My workarounds looked like this:
> @@ -42,6 +43,9 @@ static int live_update_start(struct xs_handle *xsh,
> bool force, unsigned int to)
>           len =3D add_to_buf(&buf, "-F", len);
>       if (len < 0)
>           return 1;
> +    /* +1 for rounding issues
> +     * +1 to give oxenstored a chance to timeout and report back first=

> */
> +    to +=3D 2;
>  =20
>       for (time_start =3D time(NULL); time(NULL) - time_start < to;) {
>           ret =3D xs_control_command(xsh, "live-update", buf, len);
> @@ -49,6 +53,12 @@ static int live_update_start(struct xs_handle *xsh,
> bool force, unsigned int to)
>               goto err;
>           if (strcmp(ret, "BUSY"))
>               break;
> +        /* TODO: use task ID for commands, avoid busy loop polling
> here
> +         * oxenstored checks BUSY condition internally on every main
> loop iteration anyway.
> +         * Avoid flooding xenstored with live-update requests.
> +         * The flooding can also cause the evtchn to overflow in
> xenstored which makes
> +         * xenstored enter an infinite loop */
> +        sleep(1);
>       }
>=20
> This also required various heuristics in oxenstored to differentiate
> between a new live-update command and querying the status of an already=

> completed live-update command, otherwise I almost always ended up doing=

> 2 live-updates in a row (first one queued up, returned BUSY, completed
> after a while, and then another one from all the repeated live-update
> requests).
>=20
> I'd prefer it if there was a more asynchronous protocol available for
> live-update:
> * the live-update on its own queues up the live update request and
> returns a generation ID. xenstored retries on its own during each of
> its main loop iterations whether the conditions for live-update are now=

> met
> * when a generation ID is specified with the live-update command it
> acts as a query to return the status. A query for generation ID <
> current ID return success, and for generation ID =3D current ID it
> returns either BUSY, or a specific error if known (e.g. timeout reached=

> and list of domains preventing live update)
> * the generation ID gets incremented every time a live update succeeds
>  =20
> This would eliminiate the need for a client-side timeout, since each of=

> these commands would be non-blocking.
> It'd also avoid the busy-poll flood.
>=20
> Obviously any change here has to be backwards compatible with the
> already deployed xenstored and oxenstored which doesn't know about
> generation IDs, but you can tell them apart based on the reply: if you
> get back OK/BUSY/some error it is the old version, if you get back a
> generation ID it is the new version.
>=20
> I ran out of time to implement this before the embargo was up, should I=

> go ahead with prototyping a patch for this now, or do you see an
> alternative way to make the live-update command more robust?

I think this can be made much easier:

The live-update should be handled completely in the daemon, so
returning only with success or failure. Returning BUSY wouldn't
occur this way, but either "OK" (after the successful LU) or a
failure reason (e.g. list of domains blocking) would be
returned.

I'll have a try with this approach.


Juergen

--------------3F527811B4CA84B34C9C5959
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

--------------3F527811B4CA84B34C9C5959--

--uaxqBXLIXN7SgP8z54je4Ys5c0sod7IkU--

--akYxfMSWvb1MtJ3swLTRixJaY97JYxFwi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl//IRcFAwAAAAAACgkQsN6d1ii/Ey+m
fAf/aRqKMYJZ38kfeiD4dBRps0R1x6hcpz9OLWsn/iQ30bIIjxfC67XSDGkWdD7RMZ+u5tpy7+6U
cDu/SbEhnBN12IenzOyFwPjEdj0ic91WIn5zXGmSEj5WDWbk0BnoL53KFmbm4Q/cfVjc+X/KykBH
q9DwLYUOs16+SXSYAJQENaI3STI746SIXnZUbcptyXSdyOYWig+9MSv8lrQLsnyQEfPePraMVVgN
2e5+ZFASI4zgMlsRsN1hjLuhV9thjiTPdpLIr/fpc6k58J25WnDnfAigXl93tt6/U4gfl/eAZZ1q
SHVX11xbq1bXxN2U06OSKyP7Uo0KQezZN7otTHkS+Q==
=nz7T
-----END PGP SIGNATURE-----

--akYxfMSWvb1MtJ3swLTRixJaY97JYxFwi--

