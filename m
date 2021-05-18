Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215A0387233
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128756.241698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litRm-0005Ep-7e; Tue, 18 May 2021 06:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128756.241698; Tue, 18 May 2021 06:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litRm-0005Ah-48; Tue, 18 May 2021 06:43:18 +0000
Received: by outflank-mailman (input) for mailman id 128756;
 Tue, 18 May 2021 06:43:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8gn=KN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1litRk-00057E-Ta
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:43:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 165d5409-afab-4c53-bb8a-598367cd407a;
 Tue, 18 May 2021 06:43:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0578AF0B;
 Tue, 18 May 2021 06:43:14 +0000 (UTC)
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
X-Inumbo-ID: 165d5409-afab-4c53-bb8a-598367cd407a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621320194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VzK2ZTcLLJDRr8iwYOgO5IkRKWhEI6GtSBSnkGnGsuw=;
	b=V3Uq6X1wYQTp72X7hH0jhJII2jlkExGEwnAFl5Gh/635CcyxLzwd5f4of+3gvfvq/UEE49
	5ZoE6ikVWVB6FpcVnl8s4pwzTHOGWS0+FFMfpG26NsRVMKvDCET/9NmkcVs5JmosCC9fSF
	1k/5DCAx75qFQx5e77b9RRAtO/cont4=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210514084133.18658-1-jgross@suse.com>
 <1e38cce0-6960-ac21-b349-dac8551e23ed@xen.org>
 <fe5f1e6a-1a89-ea12-feb5-318f25d4281f@suse.com>
 <39860a0c-5ac5-2537-532f-6ce288cc7219@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xenstore: claim resources when running as daemon
Message-ID: <e69f7d4c-a616-1265-e909-fd14feea7412@suse.com>
Date: Tue, 18 May 2021 08:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <39860a0c-5ac5-2537-532f-6ce288cc7219@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EvWBj5DGzB9c3mKJmXnOmy6KaTqJ3rTZ2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EvWBj5DGzB9c3mKJmXnOmy6KaTqJ3rTZ2
Content-Type: multipart/mixed; boundary="VJrYLzHbQdpGNORZDll3pY5qyJ71kjhfA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <e69f7d4c-a616-1265-e909-fd14feea7412@suse.com>
Subject: Re: [PATCH] tools/xenstore: claim resources when running as daemon
References: <20210514084133.18658-1-jgross@suse.com>
 <1e38cce0-6960-ac21-b349-dac8551e23ed@xen.org>
 <fe5f1e6a-1a89-ea12-feb5-318f25d4281f@suse.com>
 <39860a0c-5ac5-2537-532f-6ce288cc7219@xen.org>
In-Reply-To: <39860a0c-5ac5-2537-532f-6ce288cc7219@xen.org>

--VJrYLzHbQdpGNORZDll3pY5qyJ71kjhfA
Content-Type: multipart/mixed;
 boundary="------------EE5529C996EC7D209640BC13"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------EE5529C996EC7D209640BC13
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.05.21 17:55, Julien Grall wrote:
> Hi Juergen,
>=20
> On 17/05/2021 07:47, Juergen Gross wrote:
>> On 14.05.21 22:19, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> On 14/05/2021 09:41, Juergen Gross wrote:
>>>> Xenstored is absolutely mandatory for a Xen host and it can't be
>>>> restarted, so being killed by OOM-killer in case of memory shortage =
is
>>>> to be avoided.
>>>>
>>>> Set /proc/$pid/oom_score_adj (if available) to -500 in order to allo=
w
>>>> xenstored to use large amounts of memory without being killed.
>>>>
>>>> In order to support large numbers of domains the limit for open file=

>>>> descriptors might need to be raised. Each domain needs 2 file
>>>> descriptors (one for the event channel and one for the xl per-domain=

>>>> daemon to connect to xenstored).
>>>
>>> Hmmm... AFAICT there is only one file descriptor to handle all the=20
>>> event channels. Could you point out the code showing one event FD per=20

>>> domain?
>>
>> I have let me fooled by just counting the file descriptors used with o=
ne
>> or two domain active.
>>
>> So you are right that all event channels only use one fd, but each xl
>> daemon will use two (which should be fixed, IMO). And thinking more
>> about it it is even worse: each qemu process will at least require one=

>> additional fd.
>>
>>>
>>>>
>>>> Try to raise ulimit for open files to 65536. First the hard limit if=

>>>> needed, and then the soft limit.
>>>
>>> I am not sure this is right to impose this limit to everyone. For=20
>>> instance, one admin may know that there will be no more than 100=20
>>> domains on its system.
>>
>> Is setting a higher limit really a problem?
>=20
> I am quite unease to set a limit that nearly nobody will reach unless=20
> something went horribly wrong on the system.

Hmm, I really don't see the downside of having the possibility to let
xenstored open lots of files.

Anyway we can do it via prlimit if you like that better.

>=20
>>
>>> So the admin should be able to configure them. At this point, I think=20

>>> the two limit should be set my the initscript rather than xenstored=20
>>> itself.
>>
>> But the admin would need to know the Xen internals for selecting the
>> correct limits. In the end I'd be fine with moving this modification t=
o
>> the script starting Xenstore (which would be launch-xenstore), but the=

>> configuration item should be "max number of domains to support".
>=20
> I would be fine with "max numer of domains to support". What I care the=20

> most here is the limits are actually applied most of (if not all) the t=
ime.

I did another test and found:

- the xl daemon for a guest will use 2 socket connections
- qemu for a HVM guest will use 3 socket connections
- qemu for a PV guest is using one socket connection
- 14 other files are used by xenstored

So we should set the limit to 5 * n_dom + 100 (some headroom will be
nice IMO).

>=20
>>
>>>
>>> This would also avoid the problem where Xenstored is not allowed to=20
>>> modify its limit (see more below).
>>>
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ---
>>>> =C2=A0 tools/xenstore/xenstored_core.c=C2=A0=C2=A0 |=C2=A0 2 ++
>>>> =C2=A0 tools/xenstore/xenstored_core.h=C2=A0=C2=A0 |=C2=A0 3 ++
>>>> =C2=A0 tools/xenstore/xenstored_minios.c |=C2=A0 4 +++
>>>> =C2=A0 tools/xenstore/xenstored_posix.c=C2=A0 | 46=20
>>>> +++++++++++++++++++++++++++++++
>>>> =C2=A0 4 files changed, 55 insertions(+)
>>>>
>>>> diff --git a/tools/xenstore/xenstored_core.c=20
>>>> b/tools/xenstore/xenstored_core.c
>>>> index b66d119a98..964e693450 100644
>>>> --- a/tools/xenstore/xenstored_core.c
>>>> +++ b/tools/xenstore/xenstored_core.c
>>>> @@ -2243,6 +2243,8 @@ int main(int argc, char *argv[])
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xprintf =3D t=
race;
>>>> =C2=A0 #endif
>>>> +=C2=A0=C2=A0=C2=A0 claim_resources();
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signal(SIGHUP, trigger_reopen_log);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tracefile)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tracefile =3D=20
talloc_strdup(NULL, tracefile);
>>>> diff --git a/tools/xenstore/xenstored_core.h=20
>>>> b/tools/xenstore/xenstored_core.h
>>>> index 1467270476..ac26973648 100644
>>>> --- a/tools/xenstore/xenstored_core.h
>>>> +++ b/tools/xenstore/xenstored_core.h
>>>> @@ -255,6 +255,9 @@ void daemonize(void);
>>>> =C2=A0 /* Close stdin/stdout/stderr to complete daemonize */
>>>> =C2=A0 void finish_daemonize(void);
>>>> +/* Set OOM-killer score and raise ulimit. */
>>>> +void claim_resources(void);
>>>> +
>>>> =C2=A0 /* Open a pipe for signal handling */
>>>> =C2=A0 void init_pipe(int reopen_log_pipe[2]);
>>>> diff --git a/tools/xenstore/xenstored_minios.c=20
>>>> b/tools/xenstore/xenstored_minios.c
>>>> index c94493e52a..df8ff580b0 100644
>>>> --- a/tools/xenstore/xenstored_minios.c
>>>> +++ b/tools/xenstore/xenstored_minios.c
>>>> @@ -32,6 +32,10 @@ void finish_daemonize(void)
>>>> =C2=A0 {
>>>> =C2=A0 }
>>>> +void claim_resources(void)
>>>> +{
>>>> +}
>>>> +
>>>> =C2=A0 void init_pipe(int reopen_log_pipe[2])
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reopen_log_pipe[0] =3D -1;
>>>> diff --git a/tools/xenstore/xenstored_posix.c=20
>>>> b/tools/xenstore/xenstored_posix.c
>>>> index 48c37ffe3e..0074fbd8b2 100644
>>>> --- a/tools/xenstore/xenstored_posix.c
>>>> +++ b/tools/xenstore/xenstored_posix.c
>>>> @@ -22,6 +22,7 @@
>>>> =C2=A0 #include <fcntl.h>
>>>> =C2=A0 #include <stdlib.h>
>>>> =C2=A0 #include <sys/mman.h>
>>>> +#include <sys/resource.h>
>>>> =C2=A0 #include "utils.h"
>>>> =C2=A0 #include "xenstored_core.h"
>>>> @@ -87,6 +88,51 @@ void finish_daemonize(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 close(devnull);
>>>> =C2=A0 }
>>>> +static void avoid_oom_killer(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 char path[32];
>>>> +=C2=A0=C2=A0=C2=A0 char val[] =3D "-500";
>>>> +=C2=A0=C2=A0=C2=A0 int fd;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 snprintf(path, sizeof(path), "/proc/%d/oom_score=
_adj",=20
>>>> (int)getpid());
>>>
>>> This looks Linux specific. How about other OSes?
>>
>> I don't know whether other OSes have an OOM killer, and if they do, ho=
w
>> to configure it. It is a best effort attempt, after all.
>=20
> I have CCed Roger who should be able to help for FreeBSD.

It would be possible to set the OOM-score from the launch script, too.

>=20
>>
>>>
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 fd =3D open(path, O_WRONLY);
>>>> +=C2=A0=C2=A0=C2=A0 /* Do nothing if file doesn't exist. */
>>>
>>> Your commit message leads to think that we *must* configure the OOM. =

>>> If not, then we should not continue. But here, this suggest this is=20
>>> optional. In fact...
>>
>> I can modify the commit message by adding a "Try to".
>>
>>>
>>>> +=C2=A0=C2=A0=C2=A0 if (fd < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +=C2=A0=C2=A0=C2=A0 /* Ignore errors. */
>>>> +=C2=A0=C2=A0=C2=A0 write(fd, val, sizeof(val));
>>>
>>> ... xenstored may not be allowed to modify its own parameters. So=20
>>> this would continue silently without the admin necessarily knowning=20
>>> the limit wasn't applied.
>>
>> I can add a line in the Xenstore log in this regard.
>=20
> This feels wrong to me. If a limit cannot be applied then it should fai=
l=20
> early rather than possibly at the wrong moment a few days (months?) aft=
er.

I think issuing a warning would be better here. We are running with
no OOM adjustments since years now.


Juergen

--------------EE5529C996EC7D209640BC13
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

--------------EE5529C996EC7D209640BC13--

--VJrYLzHbQdpGNORZDll3pY5qyJ71kjhfA--

--EvWBj5DGzB9c3mKJmXnOmy6KaTqJ3rTZ2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCjYgIFAwAAAAAACgkQsN6d1ii/Ey/+
+Af/cnpYv+zhFaCbjGNy1THawZG8q2IFf580IjbSP7s5ZyfRsRtDgsvMAILd6FaTH68zqwzFHzt8
swaT5T3XFbXCKf9FWpCp9IvEjAet7MkJ8/k7zOskVRAtNBEFAb0KIwvUKlqNcOpPzxZu7R1lb3ub
pyfu427YMWcrtZ5wz0N7FOpq0jmrXVmsH8hSEhe02LZE7TdkYyZjmSJBEdK7bs3VUn2schhe3JOW
n8C1ieXmp0fhKS52iauCKFo/zoFVZ9Tg6TIH9yUdbVWsoEkEf1E/u3z335+BmnjXzS8q671gcyDW
P+ovh6Lomlps4dIDP9aeB6FL2H2JbK98ER89fUaoeQ==
=wgOr
-----END PGP SIGNATURE-----

--EvWBj5DGzB9c3mKJmXnOmy6KaTqJ3rTZ2--

