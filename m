Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911B2DDEBB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 07:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56334.98614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq9a6-00060y-Pg; Fri, 18 Dec 2020 06:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56334.98614; Fri, 18 Dec 2020 06:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq9a6-00060c-MI; Fri, 18 Dec 2020 06:49:38 +0000
Received: by outflank-mailman (input) for mailman id 56334;
 Fri, 18 Dec 2020 06:49:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4wv=FW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kq9a4-00060W-QK
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 06:49:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a82cbd9a-537d-4214-9c75-c798eddebc3c;
 Fri, 18 Dec 2020 06:49:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E81BBACC6;
 Fri, 18 Dec 2020 06:49:33 +0000 (UTC)
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
X-Inumbo-ID: a82cbd9a-537d-4214-9c75-c798eddebc3c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608274174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dUC+1EKFjaMZe8uSV+4lut3gYsDNzcygRgob5ePRAWA=;
	b=MNDYpnEvAbDl9eqg6kWjYjX6luMnUmT30chgO8gPqLykTzFmgkP6eOnRSETNznvpHrQ6aM
	Q5Er97zZ7vUuTOfH+7whXUdQBa4oVOsVjhYBiatZLanTayAQ14dNu3B5+devCAC33JD4NO
	Idwmqy1IVrHOfE+wRAwe/5pmbsVCHRI=
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201215111055.3810-1-jgross@suse.com>
 <2deac9ce-0c27-a472-7d51-b91a640d92ed@citrix.com>
 <8d26b752-b7ba-159f-5bed-bb015a06d819@suse.com>
 <2414c191-ff55-e446-b555-c9d0ccca6b93@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2] xen/xenbus: make xs_talkv() interruptible
Message-ID: <18c05f8c-d40b-b7e2-fc0d-c1a5343bdcfa@suse.com>
Date: Fri, 18 Dec 2020 07:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2414c191-ff55-e446-b555-c9d0ccca6b93@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8zdfIkUg112me7zEGfFVqPLIj21e9Lxi2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8zdfIkUg112me7zEGfFVqPLIj21e9Lxi2
Content-Type: multipart/mixed; boundary="C7qWVXSnG7pqeooxwBqcxco7wWv5eiKmc";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <18c05f8c-d40b-b7e2-fc0d-c1a5343bdcfa@suse.com>
Subject: Re: [PATCH v2] xen/xenbus: make xs_talkv() interruptible
References: <20201215111055.3810-1-jgross@suse.com>
 <2deac9ce-0c27-a472-7d51-b91a640d92ed@citrix.com>
 <8d26b752-b7ba-159f-5bed-bb015a06d819@suse.com>
 <2414c191-ff55-e446-b555-c9d0ccca6b93@citrix.com>
In-Reply-To: <2414c191-ff55-e446-b555-c9d0ccca6b93@citrix.com>

--C7qWVXSnG7pqeooxwBqcxco7wWv5eiKmc
Content-Type: multipart/mixed;
 boundary="------------E87F1910A183AB8FE5F67A40"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E87F1910A183AB8FE5F67A40
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.12.20 19:25, Andrew Cooper wrote:
> On 16/12/2020 08:21, J=C3=BCrgen Gro=C3=9F wrote:
>> On 15.12.20 21:59, Andrew Cooper wrote:
>>> On 15/12/2020 11:10, Juergen Gross wrote:
>>>> In case a process waits for any Xenstore action in the xenbus driver=

>>>> it should be interruptible by signals.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ---
>>>> V2:
>>>> - don't special case SIGKILL as libxenstore is handling -EINTR fine
>>>> ---
>>>>  =C2=A0 drivers/xen/xenbus/xenbus_xs.c | 9 ++++++++-
>>>>  =C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/xen/xenbus/xenbus_xs.c
>>>> b/drivers/xen/xenbus/xenbus_xs.c
>>>> index 3a06eb699f33..17c8f8a155fd 100644
>>>> --- a/drivers/xen/xenbus/xenbus_xs.c
>>>> +++ b/drivers/xen/xenbus/xenbus_xs.c
>>>> @@ -205,8 +205,15 @@ static bool test_reply(struct xb_req_data *req)=

>>>>  =C2=A0 =C2=A0 static void *read_reply(struct xb_req_data *req)
>>>>  =C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wait_event(req->wq, test=
_reply(req));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D wait_event_inter=
ruptible(req->wq, test_reply(req));
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret =3D=3D -ERESTART=
SYS && signal_pending(current)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
req->msg.type =3D XS_ERROR;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return ERR_PTR(-EINTR);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> So now I can talk fully about the situations which lead to this, I th=
ink
>>> there is a bit more complexity.
>>>
>>> It turns out there are a number of issues related to running a Xen
>>> system with no xenstored.
>>>
>>> 1) If a xenstore-write occurs during startup before init-xenstore-dom=
ain
>>> runs, the former blocks on /dev/xen/xenbus waiting for xenstored to
>>> reply, while the latter blocks on /dev/xen/xenbus_backend when trying=
 to
>>> tell the dom0 kernel that xenstored is in dom1.=C2=A0 This effectivel=
y
>>> deadlocks the system.
>>
>> This should be easy to solve: any request to /dev/xen/xenbus should
>> block upfront in case xenstored isn't up yet (could e.g. wait
>> interruptible until xenstored_ready is non-zero).
>=20
> I'm not sure that that would fix the problem.=C2=A0 The problem is that=

> setting the ring details via /dev/xen/xenbus_backend blocks, which
> prevents us launching the xenstored stubdomain, which prevents the
> earlier xenbus write being completed.

But _why_ is it blocking? Digging through the code I think it blocks
is xs_suspend() due to the normal xenstore request being pending. If
that request doesn't reach the state to cause blocking in xs_suspend()
all is fine.

> So long as /dev/xen/xenbus_backend doesn't block, there's no problem
> with other /dev/xen/xenbus activity being pending briefly.
>=20
>=20
> Looking at the current logic, I'm not completely convinced.=C2=A0 Even
> finding a filled-in evtchn/gfn doesn't mean that xenstored is actually
> ready.

No, but the deadlock is not going to happen anymore (famous last
words).

>=20
> There are 3 possible cases.
>=20
> 1) PV guest, and details in start_info
> 2) HVM guest, and details in HVM_PARAMs
> 3) No details (expected for dom0).=C2=A0 Something in userspace must pr=
ovide
> details at a later point.
>=20
> So the setup phases go from nothing, to having ring details, to finding=

> the ring working.
>=20
> I think it would be prudent to try reading a key between having details=

> and declaring the xenstored_ready.=C2=A0 Any activity, even XS_ERROR,
> indicates that the other end of the ring is listening.

Yes. But I really think the xs_suspend() is the problematic case. And
this will be called _before_ xenstored_ready is being set.

>=20
>>
>>> 2) If xenstore-watch is running when xenstored dies, it spins at 100%=

>>> cpu usage making no system calls at all.=C2=A0 This is caused by bad =
error
>>> handling from xs_watch(), and attempting to debug found:
>>
>> Can you expand on "bad error handling from xs_watch()", please?
>=20
> do_watch() has
>=20
>  =C2=A0=C2=A0=C2=A0 for ( ... ) { // defaults to an infinite loop
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 vec =3D xs_read_watch();
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (vec =3D=3D NULL)
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 continue;
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...
>  =C2=A0=C2=A0=C2=A0 }
>=20
>=20
> My next plan was to experiment with break instead of continue, which
> I'll get to at some point.

I'd rather put a sleep() in. Otherwise you might break some use cases.

>=20
>>
>>>
>>> 3) (this issue).=C2=A0 If anyone starts xenstore-watch with no xensto=
red
>>> running at all, it blocks in D in the kernel.
>>
>> Should be handled with solution for 1).
>>
>>>
>>> The cause is the special handling for watch/unwatch commands which,
>>> instead of just queuing up the data for xenstore, explicitly waits fo=
r
>>> an OK for registering the watch.=C2=A0 This causes a write() system c=
all to
>>> block waiting for a non-existent entity to reply.
>>>
>>> So while this patch does resolve the major usability issue I found (I=

>>> can't even SIGINT and get my terminal back), I think there are issues=
=2E
>>>
>>> The reason why XS_WATCH/XS_UNWATCH are special cased is because they =
do
>>> require special handling.=C2=A0 The main kernel thread for processing=

>>> incoming data from xenstored does need to know how to associate each
>>> async XS_WATCH_EVENT to the caller who watched the path.
>>>
>>> Therefore, depending on when this cancellation hits, we might be in a=
ny
>>> of the following states:
>>>
>>> 1) the watch is queued in the kernel, but not even sent to xenstored =
yet
>>> 2) the watch is queued in the xenstored ring, but not acted upon
>>> 3) the watch is queued in the xenstored ring, and the xenstored has s=
een
>>> it but not replied yet
>>> 4) the watch has been processed, but the XS_WATCH reply hasn't been
>>> received yet
>>> 5) the watch has been processed, and the XS_WATCH reply received
>>>
>>> State 5 (and a little bit) is the normal success path when xenstored =
has
>>> acted upon the request, and the internal kernel infrastructure is set=
 up
>>> appropriately to handle XS_WATCH_EVENTs.
>>>
>>> States 1 and 2 can be very common if there is no xenstored (or at lea=
st,
>>> it hasn't started up yet).=C2=A0 In reality, there is either no xenst=
ored, or
>>> it is up and running (and for a period of time during system startup,=

>>> these cases occur in sequence).
>>
>> Yes. this is the reason we can't just reject a user request if xenstor=
ed
>> hasn't been detected yet: it could be just starting.
>=20
> Right, and I'm not suggesting that we'd want to reject accesses while
> xenstored is starting up.
>=20
>>
>>>
>>> As soon as the XS_WATCH event has been written into the xenstored rin=
g,
>>> it is not safe to cancel.=C2=A0 You've committed to xenstored process=
ing the
>>> request (if it is up).
>>
>> I'm not sure this is true. Cancelling it might result in a stale watch=

>> in xenstored, but there shouldn't be a problem related to that. In cas=
e
>> that watch fires the event will normally be discarded by the kernel as=

>> no matching watch is found in the kernel's data. In case a new watch
>> has been setup with the same struct xenbus_watch address (which is use=
d
>> as the token), then this new watch might fire without the node of the
>> new watch having changed, but spurious watch events are defined to be
>> okay (OTOH the path in the event might look strange to the handler).
>=20
> Watches are a quota'd resource in (at least some) xenstored
> configurations.=C2=A0 Losing track of the registration is a resource le=
ak,
> even if the kernel can filter and discard the unexpected watch events.

Hmm, true.

The correct way to handle it then would be to mark the request to not
just drop it in case a late answer is arriving, but to do an unwatch.

A similar handling would be required for a transaction start.

>=20
>>> If xenstored is actually up and running, its fine and necessary to
>>> block.=C2=A0 The request will be processed in due course (timing subj=
ect to
>>> the client and server load).=C2=A0 If xenstored isn't up, blocking is=
n't ok.
>>>
>>> Therefore, I think we need to distinguish "not yet on the ring" from =
"on
>>> the ring", as our distinction as to whether cancelling is safe, and
>>> ensure we don't queue anything on the ring before we're sure xenstore=
d
>>> has started up.
>>>
>>> Does this make sense?
>>
>> Basically, yes.
>=20
> Great.=C2=A0 If I get any time, I'll try to look into some fixes along =
the
> above lines.

I won't work on those for the coming 3 weeks, so go ahead. :-)


Juergen

--------------E87F1910A183AB8FE5F67A40
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

--------------E87F1910A183AB8FE5F67A40--

--C7qWVXSnG7pqeooxwBqcxco7wWv5eiKmc--

--8zdfIkUg112me7zEGfFVqPLIj21e9Lxi2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/cUP0FAwAAAAAACgkQsN6d1ii/Ey/G
Agf+PkkoPOzpgMYvrXxBEClYbR+/8Ka+zZGjlq53jANB5QW0shpdLOIe9sOmqFM1kZhkx67WWZxQ
Wy77ivZ30UmhM9gHOutUq2jXBQWmawxAcYpEDBU/hYKFe4+OxeM1Nf7qHfEss9025Uan9Gq0FDRf
ytKKWi5OYBWzJ4Buwfo9d4/8/6RJsRbiSdi7d14HixCbxyk/ESBc93Ed9UUfrL2cSNM6iWTcAgXi
5ddEElj+Yw3/py3w859WRnHUPCXrym1Ioq6n3QxOd90yrZxDYrs9PPtLk3KU4BHao2E4NLn03qsW
DcYWT9vvramSeHSuX0T0P4pTX5/cGhdy7uu5eeDFnA==
=5MZg
-----END PGP SIGNATURE-----

--8zdfIkUg112me7zEGfFVqPLIj21e9Lxi2--

