Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26145D84C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 11:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230843.399059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqC44-0004i8-NT; Thu, 25 Nov 2021 10:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230843.399059; Thu, 25 Nov 2021 10:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqC44-0004fj-KQ; Thu, 25 Nov 2021 10:33:16 +0000
Received: by outflank-mailman (input) for mailman id 230843;
 Thu, 25 Nov 2021 10:33:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia/m=QM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqC42-0004fd-On
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 10:33:14 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17aab87c-4ddb-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 11:33:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F280121B36;
 Thu, 25 Nov 2021 10:33:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 965D213466;
 Thu, 25 Nov 2021 10:33:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u+n5Imhmn2HIQwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Nov 2021 10:33:12 +0000
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
X-Inumbo-ID: 17aab87c-4ddb-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637836393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dD9s4GMPeNt5i9D+tD4ZADaZow0WF71niHJUNWXXLG8=;
	b=bedgRl+FctBZfXkzKn26M5m9lWeX2Vopy1arZ14HtG84zZTN87JXvnIHYANSfAXfRC5am9
	H3vGSWbRFn3B5uQLuc7d0Lv07hxAkshuDntP6a3HOitJZUEGjWzTSRei6xqwXr/ihXRbO0
	IPJXjfoOn4oJVqJ/h8Fxp66Bzcgdfn4=
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
 <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
 <e64c22c7-992b-9fdf-a276-263e9173a313@suse.com>
 <fffb492e-f570-069b-7355-c00f48215dad@suse.com>
 <8512f6a7-0b79-8fff-49fb-80c3d8a7a436@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
Message-ID: <db2a0bc9-386e-3198-f8f8-95121571abdc@suse.com>
Date: Thu, 25 Nov 2021 11:33:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8512f6a7-0b79-8fff-49fb-80c3d8a7a436@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vcIXMR4jILkSAULwEwZgf5xLZh9LxoQhX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vcIXMR4jILkSAULwEwZgf5xLZh9LxoQhX
Content-Type: multipart/mixed; boundary="SGXLqm56UozSTABVNKJTItWVuIFTBLUud";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <db2a0bc9-386e-3198-f8f8-95121571abdc@suse.com>
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
 <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
 <e64c22c7-992b-9fdf-a276-263e9173a313@suse.com>
 <fffb492e-f570-069b-7355-c00f48215dad@suse.com>
 <8512f6a7-0b79-8fff-49fb-80c3d8a7a436@suse.com>
In-Reply-To: <8512f6a7-0b79-8fff-49fb-80c3d8a7a436@suse.com>

--SGXLqm56UozSTABVNKJTItWVuIFTBLUud
Content-Type: multipart/mixed;
 boundary="------------3DF457D5D03AF616CE85E67E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3DF457D5D03AF616CE85E67E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.11.21 11:19, Jan Beulich wrote:
> On 25.11.2021 11:12, Juergen Gross wrote:
>> On 25.11.21 10:38, Jan Beulich wrote:
>>> On 25.11.2021 07:55, Juergen Gross wrote:
>>>> On 22.11.21 16:39, Jan Beulich wrote:
>>>>> On 14.09.2021 14:35, Juergen Gross wrote:
>>>>>> @@ -103,6 +104,43 @@ void domain_reset_states(void)
>>>>>>         rcu_read_unlock(&domlist_read_lock);
>>>>>>     }
>>>>>>    =20
>>>>>> +int domain_get_dom_state_changed(struct xen_control_changed_domai=
n *info)
>>>>>> +{
>>>>>> +    unsigned int dom;
>>>>>> +    struct domain *d;
>>>>>> +
>>>>>> +    while ( (dom =3D find_first_bit(dom_state_changed, DOMID_MASK=
 + 1)) <
>>>>>> +            DOMID_FIRST_RESERVED )
>>>>>
>>>>> As per my comment on the earlier patch - the use of DOMID_MASK + 1 =
vs
>>>>> is quite puzzling here.
>>>>
>>>> Okay, will change that.
>>>>
>>>>>
>>>>>> +    {
>>>>>> +        d =3D rcu_lock_domain_by_id(dom);
>>>>>> +
>>>>>> +        if ( test_and_clear_bit(dom, dom_state_changed) )
>>>>>> +        {
>>>>>> +            info->domid =3D dom;
>>>>>> +            if ( d )
>>>>>> +            {
>>>>>> +                info->state =3D XEN_CONTROL_CHANGEDDOM_STATE_EXIS=
T;
>>>>>> +                if ( d->is_shut_down )
>>>>>> +                    info->state |=3D XEN_CONTROL_CHANGEDDOM_STATE=
_SHUTDOWN;
>>>>>> +                if ( d->is_dying =3D=3D DOMDYING_dead )
>>>>>> +                    info->state |=3D XEN_CONTROL_CHANGEDDOM_STATE=
_DYING;
>>>>>> +                info->unique_id =3D d->unique_id;
>>>>>> +
>>>>>> +                rcu_unlock_domain(d);
>>>>>> +            }
>>>>>> +
>>>>>> +            return 0;
>>>>>
>>>>> With rapid creation of short lived domains, will the caller ever ge=
t to
>>>>> see information on higher numbered domains (if, say, it gets "suita=
bly"
>>>>> preempted within its own environment)? IOW shouldn't there be a way=
 for
>>>>> the caller to specify a domid to start from?
>>>>
>>>> I'd rather have a local variable for the last reported domid and sta=
rt
>>>> from that.
>>>
>>> Well, it probably doesn't matter much to have yet one more aspect mak=
ing
>>> this a single-consumer-only interface.
>>
>> For making it an interface consumable by multiple users you'd need to
>> have a per-consumer data set, which would include the bitmap of change=
d
>> domains and could include the domid last tested.
>>
>> As one consumer is Xenstore, and Xenstore can run either in a dedicate=
d
>> domain or in dom0, I believe a multiple user capable interface would
>> even need to support multiple users in the same domain, which would be=

>> even more complicated. So I continue to be rather hesitant to add this=

>> additional complexity with only some vague idea of "might come handy i=
n
>> the future".
>>
>>>
>>>>>> +/*
>>>>>> + * XEN_CONTROL_OP_get_state_changed_domain
>>>>>> + *
>>>>>> + * Get information about a domain having changed state and reset =
the state
>>>>>> + * change indicator for that domain. This function is usable only=
 by a domain
>>>>>> + * having registered the VIRQ_DOM_EXC event (normally Xenstore).
>>>>>> + *
>>>>>> + * arg: XEN_GUEST_HANDLE(struct xen_control_changed_domain)
>>>>>> + *
>>>>>> + * Possible return values:
>>>>>> + * 0: success
>>>>>> + * <0 : negative Xen errno value
>>>>>> + */
>>>>>> +#define XEN_CONTROL_OP_get_state_changed_domain     1
>>>>>> +struct xen_control_changed_domain {
>>>>>> +    domid_t domid;
>>>>>> +    uint16_t state;
>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_EXIST     0x0001  /* Domain =
is existing. */
>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN  0x0002  /* Shutdow=
n finished. */
>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_DYING     0x0004  /* Domain =
dying. */
>>>>>> +    uint32_t pad1;           /* Returned as 0. */
>>>>>> +    uint64_t unique_id;      /* Unique domain identifier. */
>>>>>> +    uint64_t pad2[6];        /* Returned as 0. */
>>>>>
>>>>> I think the padding fields have to be zero on input, not just on re=
turn.
>>>>
>>>> I don't see why this would be needed, as this structure is only ever=

>>>> copied to the caller, so "on input" just doesn't apply here.
>>>>
>>>>> Unless you mean to mandate them to be OUT only now and forever. I a=
lso
>>>>
>>>> The whole struct is OUT only.
>>>
>>> Right now, yes. I wouldn't exclude "pad1" to become a flags field,
>>> controlling some future behavioral aspect of the operation.
>>
>> Right now I don't see the need for that, see my reasoning above.
>=20
> If your reference is to the single consumer aspect, then I don't see
> why that would matter here. Future xenstore may want/need to make
> use of such a future flag, yet older xenstore still wouldn't know
> about it.

I'm not sure it is a good idea to mix IN and OUT fields in such a struct
which is meant to return information only.

I'd rather add a new sub-op in this case taking another parameter for
specifying additional options or a struct prepending the needed IN
fields to above struct.

>=20
>>>>> wonder how the trailing padding plays up with the version sub-op: D=
o we
>>>>> really need such double precaution?
>>>>
>>>> I can remove it.
>>>>
>>>>> Also - should we use uint64_aligned_t here?
>>>>
>>>> Yes.
>>>
>>> But you realize this isn't straightforward, for the type not being
>>> available in plain C89 (nor C99)? That's why it's presently used in
>>> tools-only interfaces only, and the respective header are excluded
>>> from the "is ANSI compatible" checking (memory.h and hvm/dm_op.h
>>> have special but imo crude "precautions").
>>
>> No, I didn't realize that. I just looked how it is used today and
>> agreed I should follow current usage.
>>
>> But even with using a stable interface I'm not sure we need to make it=

>> strictly ANSI compatible, as usage of this interface will still be
>> restricted to tools.
>=20
> True. Problem is that our present __XEN_TOOLS__ guards have effectively=

> dual meaning - "tools only" and "unstable". We merely need to be sure
> everyone understands that this is changing. Perhaps when you add such a=

> guard here, it may want accompanying by a respective comment.

I'd be fine with that.

Maybe we want a new guard "__XEN_INTERNAL__" for that (new) purpose?


Juergen

--------------3DF457D5D03AF616CE85E67E
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

--------------3DF457D5D03AF616CE85E67E--

--SGXLqm56UozSTABVNKJTItWVuIFTBLUud--

--vcIXMR4jILkSAULwEwZgf5xLZh9LxoQhX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGfZmgFAwAAAAAACgkQsN6d1ii/Ey+C
YAf/eHQwvREmvxJgqLRwHBMm7VCfBNyKHvLxC69EUtYQNgYxbQiTYWovzjwje7XMPwMaV3pFQbw9
QNim2I924D8LYCoefTiiGlbiQ82qBMpln025Tm4Dvuayzh/czwIG19wPsJDGdGwAy+NIA8LXN4iG
T+yA2sIxSEt41ZJjhAZ99TKMurpKiGiEycrZRbPaEN8d7IjrKNkb5y0if2RMP5Kkag7HAMAEn57V
2F5RUcE1plzFzQWrXZemQBFeoafpm6ss9O4o0QSA5FUcQM5kvwRrNVx2LGGUz7it9uijvZrmRTcO
ACNwmYLVBwQIq4LLP2t0HsLnNqHNYyQ8TdXIWuGnvA==
=S2U7
-----END PGP SIGNATURE-----

--vcIXMR4jILkSAULwEwZgf5xLZh9LxoQhX--

